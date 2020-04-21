addEvent ( "giveCoinShopCar", true )
addEvent ( "giveCoinShopCigaretts", true )
addEvent ( "giveCoinShopNickchange", true )
addEvent ( "giveCoinShopMoney", true )

local lastCoinTake = {}


addCommandHandler ( "coin", function ( player )
	local x1, y1, z1 = getElementPosition ( player )
	local house = vnxGetElementData ( player, "house" )
	if not lastCoinTake[house] or lastCoinTake[house] + 2*60*60*1000 <= getTickCount() then
		local x2 = vnxGetElementData ( player, "housex" )
		local y2 = vnxGetElementData ( player, "housey" )
		local z2 = vnxGetElementData ( player, "housez" )
		if x2 and y2 and z2 and getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 5 then
			vnxSetElementData ( player, "coins", vnxGetElementData ( player, "coins" ) + 1 )
			infobox ( player, "Coin eingesammelt", 4000, 0, 200, 0 )
			lastCoinTake[house] = getTickCount()
		end
	else
		infobox ( player, "Coin wurde\nschon eingesammelt", 4000, 200, 0, 0 )
	end
end )


addEventHandler ( "giveCoinShopCar", root, function ( vehid, price )
	local coins = vnxGetElementData ( client, "coins" )
	if coins >= price then
		local spawnx = tonumber ( spawnx )
		local spawny = tonumber ( spawny )
		local spawnz = tonumber ( spawnz )
		local Tuning = Tuning
		local pname = getPlayerName ( client )
		local slot = 0
		local differenz = 0
		if vnxGetElementData ( client, "maxcars" ) > vnxGetElementData ( client, "curcars" ) then
			for i=1, vnxGetElementData ( client, "maxcars" ) do
				if vnxGetElementData ( client, "carslot"..i ) == 0 then
					slot = i
					break
				end
			end
			if slot > 0 then
				setElementDimension ( client, 0 )
				setElementInterior ( client, 0 )
				fadeCamera( client, true)
				setCameraTarget( client, client )
				local vehicle = createVehicle ( vehid, -1932.04, 268.793, 41.1455, 0, 0, 180, pname )
				allPrivateCars[pname][slot] = vehicle
				vnxSetElementData ( vehicle, "owner", pname )
				vnxSetElementData ( vehicle, "name", vehicle )
				vnxSetElementData ( vehicle, "carslotnr_owner", slot )
				vnxSetElementData ( vehicle, "locked", true )
				vnxSetElementData ( vehicle, "fuelstate", 100 )		
				setVehicleLocked ( vehicle, true )
				vnxSetElementData ( client, "carslot"..slot, 1 )
				vnxSetElementData ( client, "curcars", vnxGetElementData ( client, "curcars" )+1 )
				vnxSetElementData ( client, "FahrzeugeGekauft", vnxGetElementData ( client, "FahrzeugeGekauft" ) + 1 )
				if not Tuning then
					Tuning = "|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|"
				end
				setVehicleRotation ( vehicle, 0, 0, 180 )
				local Farbe1, Farbe2, Farbe3, Farbe4 = getVehicleColor ( vehicle )
				local Paintjob = getVehiclePaintjob ( vehicle )						
				vnxSetElementData ( vehicle, "stuning", "0|0|0|0|0|0|" )
				local color = "|"..Farbe1.."|"..Farbe2.."|"..Farbe3.."|"..Farbe4.."|"
				vnxSetElementData ( vehicle, "color", color )
				vnxSetElementData ( vehicle, "lcolor", "|255|255|255|" )
				vnxSetElementData ( vehicle, "sportmotor", 0 )
				vnxSetElementData ( vehicle, "bremse", 0 )
				local antrieb = getVehicleHandling(vehicle)["driveType"]
				vnxSetElementData ( vehicle, "antrieb", antrieb )
				setPrivVehCorrectLightColor ( vehicle )				
				specPimpVeh ( vehicle )
				SaveCarData ( client )
				outputChatBox ( "Glückwunsch, du hast das Fahrzeug gekauft! Tippe /vehhelp für mehr Infomationen oder rufe das Hilfemenü auf!", client, 0, 255, 0 )
				warpPedIntoVehicle ( client, vehicle )		
				if vnxGetElementData ( client, "playingtime" ) <= 300 then
					local text = "Du hast soeben ein Fahrzeug erworben!\nHier einige kurze Hinweise:\n\n1. Du kannst dein Fahrzeug mit /park an einem neuen\nOrt abstellen - dort wird es nach einem Server-\nrestart oder wenn du /towveh eintippst, erscheinen.\n\n2. Den Motor schaltest du mit \"X\" ein und aus.\n\n3. Mit /lock kannst du dein Fahrzeug abschliessen.\n\n4. Parke dein Fahrzeug nur an angemessenen Stellen,\nsonst wird es moeglicherweise geloescht.\nNicht angemessene Stellen sind z.b. auf der Strasse oder\nan wichtigen Stellen ( z.b. dem Eingang der Stadthalle ).\n\nFuer mehr: /vehinfos"
					prompt ( client, text, 30 )
				end			
				if not dbExec ( handler, "INSERT INTO ?? (??, ??, ??, ??, ??, ??, ??, ??, ??, ??, ??, ??, ??, ??, ??, ??) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", "vehicles", "UID", "Typ", "Tuning", "Spawnpos_X", "Spawnpos_Y", "Spawnpos_Z", "Spawnrot_X", "Spawnrot_Y", "Spawnrot_Z", "Farbe", "Paintjob", "Benzin", "Slot", "Sportmotor", "Bremse", "Antrieb", playerUID[pname], vehid, Tuning, -1932.04, 268.793, 41.1455, 0, 0, 180, color, Paintjob, '100', slot, '0', '0', antrieb )  then
					outputDebugString ( "[carbuy] Error executing the query" )
					destroyElement ( vehicle )
				end				
				activeCarGhostMode ( client, 10000 )
				triggerClientEvent ( client, "leaveCarhouse", client )
				setElementPosition ( vehicle, -1932.04, 268.793, 41.1455 )
				vnxSetElementData ( client, "coins", coins - price )
				triggerClientEvent ( client, "updateCoinsInCoinshop", client )
			end
		else
			infobox ( client, "Kein freier Slot!", 4000, 200, 0, 0 )
		end
	else
		infobox ( client, "Nicht genug Coins!", 4000, 200, 0, 0 )
	end
end )


addEventHandler ( "giveCoinShopCigaretts", root, function ( )
	local coins = vnxGetElementData ( client, "coins" )
	if coins >= 10 then
		vnxSetElementData ( client, "zigaretten", vnxGetElementData ( client, "zigaretten" ) + 100 )
		vnxSetElementData ( client, "coins", coins - 10 )
		outputChatBox ( "100 Zigaretten gekauft", client, 0, 200, 0 )
		triggerClientEvent ( client, "updateCoinsInCoinshop", client )
	else
		infobox ( client, "Nicht genug Coins!", 4000, 200, 0, 0 )
	end
end )


addEventHandler ( "giveCoinShopNickchange", root, function ( )
	local coins = vnxGetElementData ( client, "coins" )
	if coins >= 300 then
		offlinemsg ( getPlayerName ( client ) .. " hat einen Nickchange gekauft!", getPlayerName ( client ), "[RR]Solid_Snake" )
		offlinemsg ( getPlayerName ( client ) .. " hat einen Nickchange gekauft!", getPlayerName ( client ), "[RR]LargePeach" )
		outputChatBox ( "Melde dich bei der Projektleitung für den Nickchange.", client, 0, 200, 0 )
		vnxSetElementData ( client, "coins", coins - 300 )
		triggerClientEvent ( client, "updateCoinsInCoinshop", client )
	else
		infobox ( client, "Nicht genug Coins!", 4000, 200, 0, 0 )
	end
end )


addEventHandler ( "giveCoinShopMoney", root, function ( )
	local coins = vnxGetElementData ( client, "coins" )
	if coins >= 200 then
		infobox ( client, "Du hast\n20.000$ gekauft", 4000, 0, 200, 0 )
		vnxSetElementData ( client, "money", vnxGetElementData ( client, "money" ) + 20000 )
		vnxSetElementData ( client, "coins", coins - 200 )
		triggerClientEvent ( client, "updateCoinsInCoinshop", client )
	else
		infobox ( client, "Nicht genug Coins!", 4000, 200, 0, 0 )
	end
end )