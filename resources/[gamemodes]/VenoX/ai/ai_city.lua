aiGuns = {}
 aiGuns[1] = 24
 aiGuns[2] = 25
 aiGuns[3] = 30
 aiGuns[4] = 33
 aiGuns[5] = 18
 aiGuns[6] = 39
 
aiGunNames = {}
 aiGunNames[24] = "Desert Eagle,\n3 Magazine"
 aiGunNames[25] = "Schrotflinte,\n10 Schuss"
 aiGunNames[30] = "AK-47,\n3 Magazine"
 aiGunNames[33] = "Gewehr,\n15 Schuss"
 aiGunNames[18] = "Molotov Cocktail"
 aiGunNames[39] = "Fernzuend-\nSprengladung"
 
aiGunPrices = {}
 aiGunPrices[1] = 80
 aiGunPrices[2] = 75
 aiGunPrices[3] = 120
 aiGunPrices[4] = 50
 aiGunPrices[5] = 100
 aiGunPrices[6] = 350

aiTypes = {}
 aiTypes["skins"] = {}
 aiTypes["desc"] = {}
  curCount = 1
  aiTypes["skins"][curCount], aiTypes["desc"][curCount] = 28, "dealer"
  curCount = curCount + 1
  aiTypes["skins"][curCount], aiTypes["desc"][curCount] = 29, "wdealer"
  curCount = curCount + 1
  aiTypes["skins"][curCount], aiTypes["desc"][curCount] = 158, "sdealer"
  curCount = curCount + 1
  aiTypes["skins"][curCount], aiTypes["desc"][curCount] = 137, "bum"
  curCount = curCount + 1
  aiTypes["skins"][curCount], aiTypes["desc"][curCount] = 179, "gunbuyer"
  totalAITypes = curCount

cityAI = {}
 cityAI["x"] = {}
 cityAI["y"] = {}
 cityAI["z"] = {}
 cityAI["r"] = {}
  curCount = 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = -1961.2078857422, 107.52017211914, 26.6875, 270
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = -2020.4782714844, 127.30358886719, 27.528022766113, 0
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = -2772.806640625, 409.33831787109, 3.5040059089661, 0
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = -2697.265625, 1240.5930175781, 54.782981872559, 0
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = -1521.5966796875, 677.75769042969, 6.1875, 135, 0
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = -1828.7847900391, -7.417350769043, 14.1171875, 0
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = -2485.98046875, -621.15838623047, 131.55926513672, 0
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = -2269.8254394531, -149.42747497559, 34.3203125, 0
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = -2679.9028320313, 1277.2310791016, 6.1875, 90
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = -1539.8505859375, 567.95629882813, 6.1764278411865, 125
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = -2097.5668945313, 72.748497009277, 34.3203125, 180
  curCount = curCount + 1
  cityAI["x"][curCount], cityAI["y"][curCount], cityAI["z"][curCount], cityAI["r"][curCount] = -1988.9609375, 1115.1696777344, 53.476852416992, 0
  totalAISpots = curCount

usedAIPositions = {}

function generateWeapon()

	local rnd = math.random ( 1, 6 )
	if rnd == 6 then
		rnd = math.random ( 1, 6 )
	end
	return rnd
end
  
function createNewAI ()

	local i = 1
	while true do
		local rnd = math.random ( 1, totalAISpots )
		i = i + 1
		if i >= 5 then
			break
		elseif not usedAIPositions[rnd] then
			usedAIPositions[rnd] = true
			local x, y, z, r = cityAI["x"][rnd], cityAI["y"][rnd], cityAI["z"][rnd], cityAI["r"][rnd]
			z = z + 0.65
			r = r - 90
			local typ = math.random ( 1, totalAITypes )
			local skin =  aiTypes["skins"][typ]
			typ = aiTypes["desc"][typ]
			
			local ped = createPed ( skin, x, y, z, r )
			setPedRotation ( ped, r )
			vnxSetElementData ( ped, "typ", typ )
			vnxSetElementData ( ped, "clickPed", true )
			vnxSetElementData ( ped, "pos", rnd )
			
			if typ == "wdealer" then
				local gun = generateWeapon()
				local price = math.floor ( aiGunPrices[gun] * math.random ( 7, 15 ) / 10 )
				vnxSetElementData ( ped, "item", aiGuns[gun] )
				vnxSetElementData ( ped, "price", price )
			elseif typ == "sdealer" then
				local rnd = math.random ( 10, 100 )
				local price = math.floor ( rnd * math.random ( 5, 15 ) / 10 * 40 )
				vnxSetElementData ( ped, "item", rnd )
				vnxSetElementData ( ped, "price", price )
			elseif typ == "dealer" then
				local rnd = math.random ( 10, 100 )
				local price = math.floor ( rnd * math.random ( 7, 15 ) )
				vnxSetElementData ( ped, "item", rnd )
				vnxSetElementData ( ped, "price", price )
			elseif typ == "gunbuyer" then
				local rnd = math.random ( 1, 3 )
				if rnd == 1 then
					local price = math.random ( 100, 500 )
					vnxSetElementData ( ped, "item", 22 )
					vnxSetElementData ( ped, "price", price )
				elseif rnd == 2 then
					local price = math.random ( 75, 300 )
					vnxSetElementData ( ped, "item", 4 )
					vnxSetElementData ( ped, "price", price )
				else
					local price = math.random ( 250, 750 )
					vnxSetElementData ( ped, "item", 30 )
					vnxSetElementData ( ped, "price", price )
				end
			end
			
			addEventHandler ( "onPedWasted", ped,
				function ( ammo, killer )
					setTimer ( destroyElement, 10000, 1, ped )
					usedAIPositions[rnd] = false
					if killer then
						if vnxGetElementData ( killer, "wanteds" ) then
							vnxSetElementData ( killer, "wanteds", vnxGetElementData ( killer, "wanteds" ) + 2 )
						else 
							vnxSetElementData ( killer, "wanteds", 2 )
						end
						if vnxGetElementData ( killer, "wanteds" ) > 6 then
							vnxSetElementData ( killer, "wanteds", 6 )
						end
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
			break
		end
	end
end
createNewAI ()
createNewAI ()
createNewAI ()
createNewAI ()
createNewAI ()
setTimer ( createNewAI, 180000, 0 )

function agreeWithPed_func ()

	local player = source
	local ped = vnxGetElementData ( player, "curclicked" )
	if isElement ( ped ) then
		if not isPedDead ( ped ) then
			local typ = vnxGetElementData ( ped, "typ" )
			if typ == "car" then
				local car = curAiCarSpots[vnxGetElementData ( ped, "id" )]["car"]
				buyCarFromAI ( player, car, ped )
			else
				local item = vnxGetElementData ( ped, "item" )
				local price = vnxGetElementData ( ped, "price" )
				if typ == "bum" then
					local sucess = false
					for i = 1, 3 do
						if vnxGetElementData ( player, "food"..i ) == 3 then
							sucess = true
							vnxSetElementData ( player, "food"..i, 0 )
							break
						end
					end
					if not sucess then
						outputChatBox ( "Du hast keinen Burger dabei!", player, 125, 0, 0 )
					else
						outputChatBox ( "Aus Dank hat dir der Obdachlose 100 $ Geschenkt - woher auch immer er die hatte...", player, 0, 125, 0 )
						vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 100 )
						vanishPed ( ped )
					end
				elseif typ == "wdealer" then
					local money = vnxGetElementData ( player, "money" )
					if money >= price then
						if vnxGetElementData ( player, "gunlicense" ) == 0 then
							outputChatBox ( "Du hast keinen Waffenschein!", player, 125, 0, 0 )
						else
							local ammo
							if item == 24 then
								ammo = 21
							elseif item == 25 then
								ammo = 10
							elseif item == 30 then
								ammo = 90
							elseif item == 33 then
								ammo = 15
							else
								ammo = 1
							end
							giveWeapon ( player, item, ammo )
							vnxSetElementData ( player, "money", money - price )
							outputChatBox ( "Waffendealer: Die hast du nicht von mir...", player, 200, 200, 200 )
							vanishPed ( ped )
						end
					else
						outputChatBox ( "Du hast nicht genug Geld!", player, 125, 0, 0 )
					end
				elseif typ == "sdealer" then
					local money = vnxGetElementData ( player, "money" )
					if money >= price then
						vnxSetElementData ( player, "money", money - price )

						vnxSetElementData ( player, "flowerseeds", vnxGetElementData ( player, "flowerseeds" ) + item )
						outputChatBox ( "Bauer: Denk dran: Je laenger die waechst, desto mehr kannst du ernten...", player, 200, 200, 200 )
						vanishPed ( ped )
					else
						outputChatBox ( "Du hast nicht genug Geld!", player, 125, 0, 0 )
					end
				elseif typ == "dealer" then
					local money = vnxGetElementData ( player, "money" )
					if money >= price then
						vnxSetElementData ( player, "money", money - price )
						vnxSetElementData ( player, "drugs", vnxGetElementData ( player, "drugs" ) + item )
						outputChatBox ( "Dealer: Dann mal viel Spass...", player, 200, 200, 200 )
						vanishPed ( ped )
					else
						outputChatBox ( "Du hast nicht genug Geld!", player, 125, 0, 0 )
					end
				elseif typ == "gunbuyer" then
					local money = vnxGetElementData ( player, "money" )
					if item == 22 and getPedWeapon ( player, 2 ) == 22 then
						vnxSetElementData ( player, "money", money + price )
						outputChatBox ( "Kaeufer: Danke, jetzt kann ich mich endlich um meinen Nachbarn kuemmern...", player, 200, 200, 200 )
						takeWeapon ( player, 22 )
						vanishPed ( ped )
					elseif item == 4 and getPedWeapon ( player, 1 ) == 4 then
						vnxSetElementData ( player, "money", money + price )
						outputChatBox ( "Kaeufer: Danke, meine Frau wird sich freuen...", player, 200, 200, 200 )
						takeWeapon ( player, 4 )
						vanishPed ( ped )
					elseif item == 30 and getPedWeapon ( player, 5 ) == 30 then
						vnxSetElementData ( player, "money", money + price )
						outputChatBox ( "Kaeufer: Damit werde ich noch eine Menge Spass haben...", player, 200, 200, 200 )
						takeWeapon ( player, 30 )
						vanishPed ( ped )
					else
						outputChatBox ( "Du hast die entsprechende Waffe nicht!", player, 125, 0, 0 )
					end
				end
			end
		else
			outputChatBox ( "Du kannst nicht mit toten Geschaefte machen!", player, 125, 0, 0 )
		end
	end
end
addEvent ( "agreeWithPed", true )
addEventHandler ( "agreeWithPed", getRootElement(), agreeWithPed_func )

function vanishPed ( ped )

	if isElement ( ped ) then
		vnxSetElementData ( ped, "typ", nil )
		for i = 1, 25 do
			setTimer ( setElementAlpha, 100 * i, 1, ped, 255 / 25 * ( 25 - i ) )
		end
		setTimer ( destroyElement, 2500, 1, ped )
		usedAIPositions[vnxGetElementData ( ped, "pos" )] = nil
	end
end