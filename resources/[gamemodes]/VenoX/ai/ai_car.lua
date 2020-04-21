--Mothership: 483 - Lackierung!
carTypesForAI = {}
carPedsForAI = {}

aiCarPrices = {}

curAiCarSpots = {}

carSellerSkin = {
 [1]=14,
 [2]=12,
 [3]=98,
 [4]=180,
 [5]=206
 }

carSellerSkins = 0
for key, index in pairs ( carSellerSkin ) do
	carSellerSkins = carSellerSkins + 1
end

function loadBotCarTypes ()
	local result = dbPoll ( dbQuery ( handler, "SELECT * FROM cars_ai" ), -1 )
	if result and result[1] then
		for i=1, #result do
			local ID = tonumber ( result[i]["ID"] )
			carTypesForAI[ID] = {}
			local model = tonumber ( result[i]["Model"] )
			local price = tonumber ( result[i]["Preis"] )
			local name = result[i]["Name"]
			carTypesForAI[ID]["model"] = model
			carTypesForAI[ID]["price"] = price
			carTypesForAI[ID]["name"] = name
			aiCarPrices[model] = price
			table.insert ( carprices, model, price )
			aiCarTypes = i - 1
		end
	end
	local result = dbPoll ( dbQuery ( handler, "SELECT * from cars_peds_ai" ), -1 )
	if result and result[1] then
		for j=1, #result do
			local i = result[j]["ID"]
			carPedsForAI[i] = {}
			carPedsForAI[i]["vx"] = tonumber ( result[j]["VehX"] )
			carPedsForAI[i]["vy"] = tonumber ( result[j]["VehY"] )
			carPedsForAI[i]["vz"] = tonumber ( result[j]["VehZ"] )
			carPedsForAI[i]["vrx"] = tonumber ( result[j]["VehRX"] )
			carPedsForAI[i]["vry"] = tonumber ( result[j]["VehRY"] ) 
			carPedsForAI[i]["vrz"] = tonumber ( result[j]["VehRZ"] ) 
			carPedsForAI[i]["pedx"] = tonumber ( result[j]["PedX"] ) 
			carPedsForAI[i]["pedy"] = tonumber ( result[j]["PedY"] ) 
			carPedsForAI[i]["pedz"] = tonumber ( result[j]["PedZ"] ) 
			carPedsForAI[i]["pedr"] = tonumber ( result[j]["PedR"] )
			carspots = j - 1
		end
	end
	for i = 1, carspots do
		curAiCarSpots[i] = {}
		curAiCarSpots[i]["bool"] = false
	end
end
loadBotCarTypes ()


function createNewCarAI ()
	local carspot = math.random ( 1, carspots )
	if not curAiCarSpots[carspot]["bool"] then
		local rnd = math.random ( 1, aiCarTypes )
		local model = carTypesForAI[rnd]["model"]
		local price = carTypesForAI[rnd]["price"]
		local name = carTypesForAI[rnd]["name"]
		
		local vx = carPedsForAI[carspot]["vx"]
		local vy = carPedsForAI[carspot]["vy"]
		local vz = carPedsForAI[carspot]["vz"]
		local vrx = carPedsForAI[carspot]["vrx"]
		local vry = carPedsForAI[carspot]["vry"]
		local vrz = carPedsForAI[carspot]["vrz"]
		
		local pedx = carPedsForAI[carspot]["pedx"]
		local pedy = carPedsForAI[carspot]["pedy"]
		local pedz = carPedsForAI[carspot]["pedz"]
		local pedr = carPedsForAI[carspot]["pedr"]
		
		local rnd = math.random ( 1, carSellerSkins )
		local skin = carSellerSkin[rnd]
		
		curAiCarSpots[carspot]["bool"] = true
		curAiCarSpots[carspot]["car"] = createVehicle ( model, vx, vy, vz, vrx, vry, vrz )
		curAiCarSpots[carspot]["bot"] = createPed ( skin, pedx, pedy, pedz, pedr )
		curAiCarSpots[carspot]["bool"] = true
		
		local veh = curAiCarSpots[carspot]["car"]
		
		setVehicleLocked ( veh, true )
		setVehicleDamageProof ( veh, true )
		setElementFrozen ( veh, true )
		
		outputServerLog ( "Fahrzeugbot erstellt!" )
		
		vnxSetElementData ( curAiCarSpots[carspot]["bot"], "id", carspot )
		vnxSetElementData ( curAiCarSpots[carspot]["bot"], "typ", "car" )
		vnxSetElementData ( curAiCarSpots[carspot]["bot"], "veh", veh )
		vnxSetElementData ( curAiCarSpots[carspot]["bot"], "clickPed", true )
		
		vnxSetElementData ( veh, "name", name )
		vnxSetElementData ( veh, "price", price )
		
		addEventHandler ( "onPedWasted", curAiCarSpots[carspot]["bot"],
			function ( ammo, killer )
				vanishElement ( source )
				vanishElement ( curAiCarSpots[carspot]["car"] )
				
				local data = vnxGetElementData ( source, "id" )
				curAiCarSpots[data]["bool"] = false
				
				if killer then
					vnxSetElementData ( killer, "wanteds", vnxGetElementData ( killer, "wanteds" ) + 2 )
					if vnxGetElementData ( killer, "wanteds" ) > 6 then
						vnxSetElementData ( killer, "wanteds", 6 )
						setPlayerWantedLevel ( killer, 6 )
					else
						setPlayerWantedLevel ( killer, vnxGetElementData ( killer, "wanteds" ) )
					end
					outputChatBox ( "Du hast ein Verbrechen begangen: Mord", killer, 0, 0, 200 )
				end
			end
		)
		setTimer ( createNewCarAI, math.random ( 50, 24*60*60*1000 ), 1 )
	end
end
setTimer ( createNewCarAI, math.random ( 50, 24*60*60*1000 ), 1 )

function buyCarFromAI ( player, car, ped )
	
	local price = tonumber ( vnxGetElementData ( car, "price" ) )
	if price <= vnxGetElementData ( player, "money" ) then
		local x, y, z = getElementPosition ( car )
		local rx, ry, rz = getElementRotation ( car )
		local model = getElementModel ( car )
		
		local f1, f2, f3, f4 = getVehicleColor ( car )
		local p = getVehiclePaintjob ( car )
		
		local bool = carbuy ( player, price, model, x, y, z, rx, ry, rz, f1, f2, f3, f4, p )
		if bool then
			destroyElement ( car )
			vanishElement ( ped )
			
			local data = vnxGetElementData ( ped, "id" )
			curAiCarSpots[data]["bool"] = false
		end
	else
		outputChatBox ( "Du hast nicht genug Geld dafuer!", player, 125, 0, 0 )
	end
end