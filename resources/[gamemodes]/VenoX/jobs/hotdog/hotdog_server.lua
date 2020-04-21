createObject ( 2803, -1706.0394287109, -3.3259353637695, 3.2056336402893, 0, 0, 0 )
createObject ( 2147, -1702.8179931641, -2.3179664611816, 2.5546875, 0, 0, 225 )
createObject ( 2361, -1708.1881103516, -2.3582229614258, 2.5489177703857, 0, 0, 0 )
createObject ( 2452, -1704.5050048828, -4.1225433349609, 2.5546875, 0, 0, 225 )
createObject ( 2805, -1703.6081542969, -3.4309387207031, 3.27188539505, 0, 0, 0 )
createObject ( 2806, -1704.7397460938, -2.1383819580078, 2.7745137214661, 0, 0, 0 )
createObject ( 2806, -1705.4504394531, -1.8996651172638, 2.7745137214661, 0, 0, 322.28500366211 )
createObject ( 2806, -1704.9680175781, -2.1088492870331, 2.8081126213074, 10.25, 0, 322.28393554688 )

hotdogVehicles = {
	createVehicle ( 588, -1693.4169921875, 13.642078399658, 3.5546875, 0, 0, 0 ),
	createVehicle ( 588, -1696.8371582031, 11.822975158691, 3.5546875, 0, 0, 0 ),
	createVehicle ( 588, -1720.7375488281, 13.455543518066, 3.3380651473999, 0, 0, 0 ),
	createVehicle ( 588, -1717.3237304688, 16.04842376709, 3.5942802429199, 0, 0, 0 ),
	createVehicle ( 588, -1713.7370605469, 18.94469833374, 3.5942802429199, 0, 0, 0 ),
	createVehicle ( 588, -1710.6572265625, 21.605842590332, 3.5942802429199, 0, 0, 0 ) }

local blip = createBlip (  -1706.1116943359, 13.159648895264, 3.2039132118225, 58, 2, 255, 255, 0, 255, 0, 200 )
hotdogjobicon = createPickup ( -1706.1116943359, 13.159648895264, 3.2039132118225, 3, 1239, 1000, 0 )
hotdogBuyMarker = createMarker ( -1706.3059082031, 1.1159700155258, 2.3025176525116, "cylinder", 5, getColorFromString ( "#00FF7799" ) )


function hotdogBuyMarkerHit ( hit )
	if getElementType ( hit ) == "player" then
		local veh = getPedOccupiedVehicle ( hit )
		if veh then
			if getPedOccupiedVehicleSeat ( hit ) == 0 and hotdogVehicles[veh] then
				triggerClientEvent ( hit, "showHotdogLoadMenue", getRootElement() )
				setElementClicked ( hit, true )
			end
		end
	end
end
addEventHandler ( "onMarkerHit", hotdogBuyMarker, hotdogBuyMarkerHit )


function hotdogjobiconHit ( player )
	if vnxGetElementData ( player, "job" ) == "hotdog" then
		outputChatBox ( "Schnapp dir einen Hotdogwagen, belade ihn mit Fleisch und leg los!", player, 200, 125, 125 )
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nTippe /job, um\nals Hotdogver-\nkaeufer zu\narbeiten.", 7500, 200, 200, 0 )
	end
end
addEventHandler ( "onPickupHit", hotdogjobicon, hotdogjobiconHit )

	
hotdogsInVehicle = {}
	
addEventHandler ( "onResourceStart", resourceRoot, function ()
	for i=1, #hotdogVehicles do
		setVehicleRespawnPosition ( hotdogVehicles[i], getElementPosition ( hotdogVehicles[i] ) )
		toggleVehicleRespawn ( hotdogVehicles[i], true )
		setVehicleRespawnDelay ( hotdogVehicles[i], 1000*10 )
		setVehicleIdleRespawnDelay ( hotdogVehicles[i], 1000*60 )
		addEventHandler ( "onVehicleEnter", hotdogVehicles[i], hotdogVehicleEnter )
		hotdogsInVehicle[hotdogVehicles[i]] = 0
	end
end )


function hotdogVehicleEnter ( player, seat )
	if vnxGetElementData ( player, "job" ) ~= "hotdog" and seat == 0 then
		opticExitVehicle ( player )
		triggerClientEvent ( player, "infobox_start", player, "\n\nDu bist\nkein Hotdog\n-Verkäufer!", 7500, 125, 0, 0 )
	else
		outputChatBox ( "Hotdogs im Wagen: "..hotdogsInVehicle[source], player, 0, 125, 0 )
	end
end


function sellhotdog_func ( player, cmd, amount, target )
	if player == client or not client then
		if amount and isElement ( target ) then
			if target then
				target = getPlayerFromName ( target )
			else
				target = getPlayerFromName ( vnxGetElementData ( player, "curclicked" ) )
			end
			if amount and isElement ( target ) then
				local amount = math.abs ( math.floor ( tonumber ( amount ) ) )
				outputChatBox ( getPlayerName ( player ).." hat dir einen Hotdog für "..amount.." $ angeboten! Tippe /accepthotdog, um anzunehmen!", target, 125, 125, 200 )
				vnxSetElementData ( target, "hotdogSeller", getPlayerName ( player ) )
				vnxSetElementData ( target, "hotdogPrice", amount )
				outputChatBox ( "Du hast "..getPlayerName ( target ).." einen Hotdog angeboten!", player, 200, 200, 0 )
			else
				outputChatBox ( "Bitte verwende: /sellhotdog [Preis] [Spieler]", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Bitte verwende: /sellhotdog [Preis] [Spieler]", player, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "sellhotdog", sellhotdog_func )
addEvent ( "sellhotdog", true )
addEventHandler ( "sellhotdog", getRootElement(), sellhotdog_func )


function accepthotdog_func ( player )
	local seller = getPlayerFromName ( vnxGetElementData ( player, "hotdogSeller" ) )
	local price = vnxGetElementData ( player, "hotdogPrice" )
	if seller and price then
		local x1, y1, z1 = getElementPosition ( player )
		local x2, y2, z2 = getElementPosition ( seller )
		if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 10 then
			local veh = getPedOccupiedVehicle ( seller )
			if hotdogsInVehicle[veh] then
				if hotdogsInVehicle[veh] >= 1 then
					if vnxGetElementData ( player, "money" ) >= price then
						hotdogsInVehicle[veh] = hotdogsInVehicle[veh] - 1
						takePlayerSaveMoney ( player, price )
						givePlayerSaveMoney ( seller, price )
						outputChatBox ( getPlayerName ( player ).." hat einen deiner Hotdogs gekauft - du erhälst "..price.." $ und hast noch "..hotdogsInVehicle[veh] .." weitere Hotdogs!", seller, 15, 125, 15 )
						outputChatBox ( "Hotdog gekauft!", player, 15, 125, 15 )
						setElementHealth ( player, 100 )
						setElementHunger ( player, getElementHunger ( player ) + 25 )
					else
						outputChatBox ( "Das kannst du dir nicht leisten!", player, 125, 0, 0 )
					end
				else
					outputChatBox ( "Der Verkaeufer hat keine Hotdogs mehr!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Der Verkäufer sitzt nicht im Hotdogwagen!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du bist zu weit weg!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Du kannst keinen Hotdog kaufen!", player, 125, 0, 0 )
	end
	vnxSetElementData ( player, "hotdogSeller", nil )
	vnxSetElementData ( player, "hotdogPrice", nil )
end
addCommandHandler ( "accepthotdog", accepthotdog_func )


function buyhotdogs_func ( player, amount )
	if player == client then
		local veh = getPedOccupiedVehicle ( player )
		local preis = amount
		if veh then
			if vnxGetElementData ( player, "money" ) >= preis then
				hotdogsInVehicle[veh] = hotdogsInVehicle[veh] + amount
				takePlayerSaveMoney ( player, preis )
				outputChatBox ( "Truck beladen - du hast nun "..hotdogsInVehicle[veh].." Hotdogs!", player, 10, 125, 10 )
			else
				outputChatBox ( "Du hast nicht genug Geld!", player, 125, 0, 0 )
			end
		end
	end
end
addEvent ( "buyhotdogs", true )
addEventHandler ( "buyhotdogs", getRootElement(), buyhotdogs_func )