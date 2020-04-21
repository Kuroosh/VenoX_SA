--[[function invitePlayerToRace ( text, target, betTyp, betAmount, targetID )

	if #text > 1 then
		local player = client
		local x1, y1, z1 = getElementPosition ( player )
		local x2, y2, z2 = getElementPosition ( target )
		local dist = getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 )
		if dist <= 5 then
			betAmount = math.floor ( math.abs ( tonumber ( betAmount ) ) )
			if betAmount == 0 then
				betTyp = 0
			end
			outputChatBox ( getPlayerName ( client ).." hat dich zu einem Wettrennen herausgefordert, Ziel: "..text..".", target, 200, 200, 0 )
			if ( betTyp == 1 ) then
				outputChatBox ( "Preisgeld: "..betAmount.." $", target, 200, 200, 0 )
			elseif ( betTyp == 2 ) then
				outputChatBox ( "Wetteinsatz: Die Zulassungspapiere für dein Fahrzeug.", target, 200, 200, 0 )
			end
			outputChatBox ( "Tippe /accept race, um die Herausforderung anzunehmen.", target, 200, 200, 0 )
			outputChatBox ( "Du hast "..getPlayerName ( target ).." zu einem Rennen herausgefordert.", client, 0, 200, 0 )
			
			vnxSetElementData ( target, "challengerQ", client )
			vnxSetElementData ( target, "betTypQ", betTyp )
			vnxSetElementData ( target, "betAmountQ", betAmount )
			vnxSetElementData ( target, "targetIDQ", targetID )
			
			vnxSetElementData ( client, "challengerQ", target )
			vnxSetElementData ( client, "betTypQ", betTyp )
			vnxSetElementData ( client, "betAmountQ", betAmount )
			vnxSetElementData ( client, "targetIDQ", targetID )
		else
			infobox ( player, "Du hast bist\nzu weit entfernt!", 5000, 150, 0, 0 )
		end
	end
end
addEvent ( "invitePlayerToRace", true )
addEventHandler ( "invitePlayerToRace", getRootElement(), invitePlayerToRace )

function acceptRace ( player )

	local challenger = vnxGetElementData ( player, "challengerQ" )
	local bet = vnxGetElementData ( player, "betAmountQ" )
	local betTyp = vnxGetElementData ( player, "betTypQ" )
	local targetID = vnxGetElementData ( player, "targetIDQ" )
	if isElement ( challenger ) and isElement ( player ) then
		vnxSetElementData ( player, "betAmount", bet )
		vnxSetElementData ( challenger, "betAmount", bet )
		vnxSetElementData ( player, "betTyp", betTyp )
		vnxSetElementData ( challenger, "betTyp", betTyp )
		vnxSetElementData ( player, "challenger", challenger )
		vnxSetElementData ( challenger, "challenger", player )
		vnxSetElementData ( player, "targetID", targetID )
		vnxSetElementData ( challenger, "targetID", targetID )
	end
	if isElement ( challenger ) and vnxGetElementData ( challenger, "challenger" ) == player and vnxGetElementData ( player, "betAmount" ) == vnxGetElementData ( challenger, "betAmount" ) and vnxGetElementData ( player, "betTyp" ) == vnxGetElementData ( challenger, "betTyp" ) then
		local x1, y1, z1 = getElementPosition ( player )
		local x2, y2, z2 = getElementPosition ( challenger )
		
		local dist = getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 )
		if dist <= 5 then
			if getPedOccupiedVehicleSeat ( player ) == 0 then
				if getPedOccupiedVehicleSeat ( challenger ) == 0 then
					if vnxGetElementData ( player, "betTyp" ) == 0 or ( vnxGetElementData ( player, "betTyp" ) == 1 and vnxGetElementData ( player, "money" ) >= bet and vnxGetElementData ( challenger, "money" ) >= bet ) then
						vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - bet )
						vnxSetElementData ( challenger, "money", vnxGetElementData ( challenger, "money" ) - bet )
						
						local veh1 = getPedOccupiedVehicle ( challenger )
						local veh2 = getPedOccupiedVehicle ( player )
						
						setElementFrozen ( veh1, true )
						setElementFrozen ( veh2, true )
						setVehicleDamageProof ( veh1, true )
						setVehicleDamageProof ( veh2, true )
						toggleControl ( player, "enter_exit", false )
						toggleControl ( challenger, "enter_exit", false )
						
						addEventHandler ( "onPlayerWasted", player, racePlayerWasted )
						addEventHandler ( "onPlayerWasted", challenger, racePlayerWasted )
						addEventHandler ( "onPlayerQuit", player, racePlayerQuit )
						addEventHandler ( "onPlayerQuit", challenger, racePlayerQuit )
						addEventHandler ( "onPlayerVehicleExit", player, racePlayerVehExit )
						addEventHandler ( "onPlayerVehicleExit", challenger, racePlayerVehExit )
						
						vnxSetElementData ( player, "isInRace", true )
						vnxSetElementData ( challenger, "isInRace", true )
						
						triggerClientEvent ( player, "showRaceCountdown", player )
						triggerClientEvent ( challenger, "showRaceCountdown", challenger )
						setTimer (
							function ( veh1, veh2, player, challenger )
								setElementFrozen ( veh1, false )
								setElementFrozen ( veh2, false )
								
								setVehicleDamageProof ( veh1, false )
								setVehicleDamageProof ( veh2, false )
								
								if isElement ( player ) then
									toggleControl ( player, "enter_exit", true )
								end
								if isElement ( challenger ) then
									toggleControl ( challenger, "enter_exit", true )
								end
							end,
						3000 + 3000, 1, veh1, veh2, player, challenger )
						
						local i = vnxGetElementData ( player, "targetID" )
						
						local x, y, z = possibleRaceTargets["x"][i], possibleRaceTargets["y"][i], possibleRaceTargets["z"][i]
						local marker = createMarker ( x, y, z, "checkpoint", 10, 200, 0, 0, 125, nil )
						local blip = createBlip ( x, y, z, 53, 2, 0, 0, 0, 255, 0, 99999, nil )
						
						addEventHandler ( "onPlayerMarkerHit", player, raceTargetMarkerHit )
						addEventHandler ( "onPlayerMarkerHit", challenger, raceTargetMarkerHit )
						
						vnxSetElementData ( player, "raceMarker", marker )
						vnxSetElementData ( challenger, "raceMarker", marker )
						vnxSetElementData ( player, "raceBlip", blip )
						vnxSetElementData ( challenger, "raceBlip", blip )
						
						setElementVisibleTo ( marker, player, true )
						setElementVisibleTo ( blip, player, true )
						setElementVisibleTo ( marker, challenger, true )
						setElementVisibleTo ( blip, challenger, true )
						return true
					else
						infobox ( player, "Du oder dein\nPartner haben nicht\ngenug Geld dabei!", 5000, 150, 0, 0 )
					end
				else
					infobox ( player, "Das Ziel ist\nnicht in einem\nFahrzeug!", 5000, 150, 0, 0 )
				end
			else
				infobox ( player, "Du bist nicht\nin einem Fahrzeug!", 5000, 150, 0, 0 )
			end
		else
			infobox ( player, "Du hast bist\nzu weit entfernt!", 5000, 150, 0, 0 )
		end
	else
		infobox ( player, "Du hast keine\nHerausforderung!", 5000, 150, 0, 0 )
	end
	vnxSetElementData ( player, "challenger", false )
end

function raceTargetMarkerHit ( marker )

	if vnxGetElementData ( source, "isInRace" ) and marker == vnxGetElementData ( source, "raceMarker" ) then
		local challenger = source
		local player = vnxGetElementData ( challenger, "challenger" )
		removeRaceEvent ( player, challenger )
		
		outputChatBox ( "Du hast das Rennen verloren!", player, 125, 0, 0 )
		outputChatBox ( "Du hast das Rennen gewonnen!", challenger, 0, 200, 0 )
		
		local betAmount = vnxGetElementData ( challenger, "betAmount" ) * 2
		triggerClientEvent ( challenger, "raceWon", challenger, betAmount )
		if betAmount > 0 then
			vnxSetElementData ( challenger, "money", vnxGetElementData ( challenger, "money" ) + betAmount )
			outputChatBox ( "Du erhälst "..betAmount.." $ Preisgeld!", challenger, 0, 125, 0 )
		end
		
		vnxSetElementData ( player, "isInRace", false )
		vnxSetElementData ( challenger, "isInRace", false )
	end
end

function racePlayerQuit ()

	if vnxGetElementData ( source, "isInRace" ) then
		local player = source
		local challenger = vnxGetElementData ( player, "challenger" )
		removeRaceEvent ( player, challenger )
		
		outputChatBox ( "Du hast das Rennen gewonnen!", challenger, 0, 200, 0 )
		
		local betAmount = vnxGetElementData ( challenger, "betAmount" ) * 2
		triggerClientEvent ( challenger, "raceWon", challenger, betAmount )
		if betAmount > 0 then
			vnxSetElementData ( challenger, "money", vnxGetElementData ( challenger, "money" ) + betAmount )
			outputChatBox ( "Du erhälst "..betAmount.." $ Preisgeld!", challenger, 0, 125, 0 )
		end
		
		vnxSetElementData ( player, "isInRace", false )
		vnxSetElementData ( challenger, "isInRace", false )
	end
end

function racePlayerWasted ()

	if vnxGetElementData ( source, "isInRace" ) then
		local player = source
		local challenger = vnxGetElementData ( player, "challenger" )
		removeRaceEvent ( player, challenger )
		
		outputChatBox ( "Du hast das Rennen verloren!", player, 125, 0, 0 )
		outputChatBox ( "Du hast das Rennen gewonnen!", challenger, 0, 200, 0 )
		
		local betAmount = vnxGetElementData ( challenger, "betAmount" ) * 2
		triggerClientEvent ( challenger, "raceWon", challenger, betAmount )
		if betAmount > 0 then
			vnxSetElementData ( challenger, "money", vnxGetElementData ( challenger, "money" ) + betAmount )
			outputChatBox ( "Du erhälst "..betAmount.." $ Preisgeld!", challenger, 0, 125, 0 )
		end
		
		vnxSetElementData ( player, "isInRace", false )
		vnxSetElementData ( challenger, "isInRace", false )
	end
end

function racePlayerVehExit ()

	if vnxGetElementData ( source, "isInRace" ) then
		local player = source
		local challenger = vnxGetElementData ( player, "challenger" )
		removeRaceEvent ( player, challenger )
		
		outputChatBox ( "Du hast das Rennen verloren!", player, 125, 0, 0 )
		outputChatBox ( "Du hast das Rennen gewonnen!", challenger, 0, 200, 0 )
		
		local betAmount = vnxGetElementData ( challenger, "betAmount" ) * 2
		triggerClientEvent ( challenger, "raceWon", challenger, betAmount )
		if betAmount > 0 then
			vnxSetElementData ( challenger, "money", vnxGetElementData ( challenger, "money" ) + betAmount )
			outputChatBox ( "Du erhälst "..betAmount.." $ Preisgeld!", challenger, 0, 125, 0 )
		end
		
		vnxSetElementData ( player, "isInRace", false )
		vnxSetElementData ( challenger, "isInRace", false )
	end
end

function removeRaceEvent ( player, challenger )

	removeEventHandler ( "onPlayerWasted", player, racePlayerWasted )
	removeEventHandler ( "onPlayerWasted", challenger, racePlayerWasted )
	removeEventHandler ( "onPlayerQuit", player, racePlayerQuit )
	removeEventHandler ( "onPlayerQuit", challenger, racePlayerQuit )
	removeEventHandler ( "onPlayerVehicleExit", player, racePlayerVehExit )
	removeEventHandler ( "onPlayerVehicleExit", challenger, racePlayerVehExit )
	removeEventHandler ( "onPlayerMarkerHit", player, raceTargetMarkerHit )
	removeEventHandler ( "onPlayerMarkerHit", challenger, raceTargetMarkerHit )
	
	destroyElement ( vnxGetElementData ( player, "raceMarker" ) )
	destroyElement ( vnxGetElementData ( player, "raceBlip" ) )
end
]]