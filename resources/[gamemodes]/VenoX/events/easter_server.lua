function createNewEasterEgg ()

	local rnd = math.random ( 1, 2 )
	
	if not isElement ( easterEggsInUse[rnd] ) then
		local x, y, z = easterEggs["x"][rnd], easterEggs["y"][rnd], easterEggs["z"][rnd]
		easterEggsInUse[rnd] = createObject ( 2999, x, y, z )
		local shape = createColSphere ( x, y, z, 2 )
		vnxSetElementData ( shape, "id", rnd )
		addEventHandler ( "onColShapeHit", shape, easterEggShapeHit )
	end
end

function easterEggShapeHit ( hit, dim )

	if getElementType ( hit ) == "player" and dim then
		local id = vnxGetElementData ( source, "id" )
		destroyElement ( easterEggsInUse[id] )
		easterEggsInUse[id] = false
		
		outputChatBox ( "Du hast einen Kuerbis gefunden! Du kannst ihn mit /halloween einloesen!", hit, 0, 200, 0 )
		triggerClientEvent ( hit, "achievsound", hit )
		vnxSetElementData ( hit, "easterEggs", vnxGetElementData ( hit, "easterEggs" ) + 1 )
		
		destroyElement ( source )
	end
end

easterEggsInUse = {}
easterEggs = {}
	easterEggs["x"] = {}
	easterEggs["y"] = {}
	easterEggs["z"] = {}

i = 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = 1452.2470703125, 2773.8037109375, 27.44654083252
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = 1098.533203125, 1609.5556640625, 12.546875
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = 1680.1494140625, 1447.0087890625, 14.914985656738
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = 2323.671875, 1283.1884765625, 97.617256164551
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = 2116.94921875, 1683.2900390625, 13.005955696106
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = 2092.8271484375, 2414.6416015625, 74.578598022461
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = 2729.10546875, 2685.81640625, 59.0234375
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = 2429.1806640625, 1812.7421875, 38.8203125
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = 2435.322265625, 1662.9140625, 15.645471572876
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = 2496.2763671875, 926.8359375, 16.912689208984
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = 1456.1669921875, 751.056640625, 32.739742279053
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = 619.8115234375, 886.654296875, -29.805267333984
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = -18.4912109375, 1180.462890625, 31.808807373047
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = -367.3916015625, 1581.171875, 76.118301391602
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = -733.568359375, 1546.439453125, 38.997997283936
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = -1531.625, 687.3037109375, 133.05139160156
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = -1510.7578125, 1372.123046875, 3.2004470825195
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = -1664.9306640625, 1380.4345703125, 7.8754863739014
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = -2366.6455078125, 1536.1435546875, 2.1171875
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = -2681.5517578125, 1598.189453125, 3.2226257324219
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = -2819.5126953125, 1080.1904296875, 27.7421875
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = -2773.7197265625, 783.8798828125, 65.715576171875
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = -2346.888671875, 536.8095703125, 77.403594970703
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = -2029.1767578125, 156.51953125, 33.938232421875
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = -2218.2744140625, -341.935546875, 44.796802520752
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = -2481.9921875, -285.6875, 40.546653747559
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = -2315.6298828125, 198.23046875, 35.3984375
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = -2341.3056640625, 1008.3974609375, 55.9150390625
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = -1131.2314453125, 854.5361328125, 3.0703125
i = i + 1
easterEggs["x"][i], easterEggs["y"][i], easterEggs["z"][i] = -1475.91015625, 150.751953125, 18.7734375

if isHalloween then
	for i = 1, 30 do
		createNewEasterEgg ()
	end
	
	setTimer ( createNewEasterEgg, 60000, 0 )
end

function buyEasterBonus ( item )

	local player = client
	local eggs = vnxGetElementData ( player, "easterEggs" )
	if item == "suess" then
		if eggs >= 10 then
			vnxSetElementData ( player, "easterEggs", eggs - 10 )
			putFoodInSlot ( player, 5 )
		else
			outputChatBox ( "Du hast nicht genug Kuerbisse!", player, 200, 0, 0 )
		end
	elseif item == "state" then
		if eggs >= 100 then
			vnxSetElementData ( player, "easterEggs", eggs - 100 )
			vnxSetElementData ( player, "socialState", "Sensenmann" )
			outputChatBox ( "Happy Halloween wuenscht dir SERVERNAME!", player, 125, 0, 0 )
		else
			outputChatBox ( "Du hast nicht genug Kuerbisse!", player, 200, 0, 0 )
		end
	elseif item == "dollar" then
		if eggs >= 250 then
			vnxSetElementData ( player, "easterEggs", eggs - 250 )
			vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 10000 )
			outputChatBox ( "Happy Halloween wuenscht dir SERVERNAME!", player, 125, 0, 0 )
		else
			outputChatBox ( "Du hast nicht genug Kuerbisse!", player, 200, 0, 0 )
		end
	elseif item == "gutschein" then
		if eggs >= 1200 then
			vnxSetElementData ( player, "everyCarBuyableForFree", true )
			vnxSetElementData ( player, "easterEggs", eggs - 1200 )
			outputChatBox ( "ACHTUNG: Der Gutschein muss direkt ( nicht disconnecten ) eingeloest werden!", player, 125, 0, 0 )
			outputChatBox ( "Happy Halloween wuenscht dir SERVERNAME!", player, 125, 0, 0 )
		else
			outputChatBox ( "Du hast nicht genug Kuerbisse!", player, 200, 0, 0 )
		end
	elseif item == "turismo" then
		if vnxGetElementData ( player, "jailtime" ) > 0 then
			return
		end
		if eggs >= 2000 then
			if not getPedOccupiedVehicle ( player ) then
				if getFreeCarSlot ( player ) then
					vnxSetElementData ( player, "everyCarBuyableForFree", true )
					if carbuy ( player, 0, 451, -898.5, 2715.6, 46, 0, 0, 97.5 ) then
						vnxSetElementData ( player, "easterEggs", eggs - 2000 )
						outputChatBox ( "Happy Halloween wuenscht dir SERVERNAME!", player, 125, 0, 0 )
					end
					vnxSetElementData ( player, "everyCarBuyableForFree", false )
				end
			end
			outputChatBox ( "Happy Halloween wuenscht dir SERVERNAME!", player, 125, 0, 0 )
		else
			outputChatBox ( "Du hast nicht genug Kuerbisse!", player, 200, 0, 0 )
		end
	elseif item == "ht b" then
		if vnxGetElementData ( player, "jailtime" ) > 0 then
			return
		end
		if eggs >= 5000 then
			if not getPedOccupiedVehicle ( player ) then
				if getFreeCarSlot ( player ) then
					vnxSetElementData ( player, "everyCarBuyableForFree", true )
					if carbuy ( player, 0, 503, -898.5, 2715.6, 46, 0, 0, 97.5 ) then
						vnxSetElementData ( player, "easterEggs", eggs - 5000 )
						outputChatBox ( "Happy Halloween wuenscht dir SERVERNAME!", player, 125, 0, 0 )
					end
					vnxSetElementData ( player, "everyCarBuyableForFree", false )
				else
					infobox ( player, "Du hast keinen\nfreien Fahrzeug-\nslot mehr!", 5000, 125, 0, 0 )
				end
			else
				infobox ( player, "Bitte verlasse zuerst\ndein Fahrzeug!", 5000, 125, 0, 0 )
			end
			outputChatBox ( "Happy Halloween wuenscht dir SERVERNAME!", player, 125, 0, 0 )
		else
			outputChatBox ( "Du hast nicht genug Kuerbisse!", player, 200, 0, 0 )
		end
	elseif item == "haus" then
		if eggs >= 10000 then
			outputChatBox ( "Wende dich an einen Admin m. V. oder Inhaber!", player, 125, 0, 0 )
			outputChatBox ( "Happy Halloween wuenscht dir SERVERNAME!", player, 125, 0, 0 )
		else
			outputChatBox ( "Du hast nicht genug Kuerbisse!", player, 200, 0, 0 )
		end
	end
	
end

addEvent ( "buyEasterBonus", true )
addEventHandler ( "buyEasterBonus", getRootElement(), buyEasterBonus )

local halo_table = {}

function halloweenHouseFunction ( player )

	if isHalloween then
		local x, y, z = getElementPosition ( player )
		local colshape = createColSphere ( x, y, z, 1.5 )
		
		for theKey, thePickup in pairs (getElementsWithinColShape( colshape, "pickup" )) do
		
			if tonumber(houses["id"][thePickup]) then
			
				if thePickup == houses["pickup"][tonumber(houses["id"][thePickup])] then
				
					if halo_table[thePickup] == true then
						outputChatBox ( "An diesem Haus wurde 'Trick or Treat' schon gespielt!", player, 200, 0, 0 )
						outputChatBox ( "Du erhaeltst aber ein paar Suessigkeiten.", player, 200, 0, 0 )
						putFoodInSlot ( player, 5 )
						return
					end
				
					outputChatBox ( "Du hast einen Kuerbis bekommen!", player, 0, 125, 0 )
					local eggs = vnxGetElementData ( player, "easterEggs" )
					vnxSetElementData ( player, "easterEggs", eggs + 1 )
					halo_table[thePickup] = true
					setTimer (
						function ( pick )
							halo_table[pick] = false
						end, 3600000, 0, thePickup )
					break
				
				end
			
			end
		
		end
	end
end

--addCommandHandler ( "trickortreat", halloweenHouseFunction, false, false )