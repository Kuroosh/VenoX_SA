jobicons["trash"] = createPickup ( -1897.1510009766, -1671.5749511719, 22.664850234985, 3, 1239, 1, 99 )
local blip = createBlip (  -1897.1510009766, -1671.5749511719, 22.664850234985, 58, 2, 255, 255, 0, 255, 0, 200 )

function trashJobIconHit ( player )
	
	if vnxGetElementData ( player, "job" ) == "streetclean" and not getPedOccupiedVehicle ( player ) then
		showCursor ( player, true )
		setElementClicked ( player, true )
		triggerClientEvent ( player, "showStreetCleanGUI", getRootElement() )
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nTippe /job, um\nals Strassenreiniger\nzu arbeiten.", 5000, 200, 200, 0 )
	end
end
addEventHandler ( "onPickupHit", jobicons["trash"], trashJobIconHit )

-- Hit-Events

function foundRubbish_func ()

	local player = client
	if not vnxGetElementData ( player, "rubbishJob" ) then
		vnxSetElementData ( player, "rubbishJob", true )
		vnxSetElementData ( player, "streetCleanPoints", vnxGetElementData ( player, "streetCleanPoints" ) + 1 )
		setTimer ( vnxSetElementData, 1000, 1, player, "rubbishJob", false )
		vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 80 )
	end
end
addEvent ( "foundRubbish", true )
addEventHandler ( "foundRubbish", getRootElement(), foundRubbish_func )

function foundSweeperRubbish_func ()

	local player = client
	if not vnxGetElementData ( player, "rubbishJob" ) then
		vnxSetElementData ( player, "rubbishJob", true )
		vnxSetElementData ( player, "streetCleanPoints", vnxGetElementData ( player, "streetCleanPoints" ) + 3 )
		setTimer ( vnxSetElementData, 3000, 1, player, "rubbishJob", false )
		vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 150 )
	end
end
addEvent ( "foundSweeperRubbish", true )
addEventHandler ( "foundSweeperRubbish", getRootElement(), foundSweeperRubbish_func )

function foundTrashmasterRubbish_func ()

	local player = client
	if not vnxGetElementData ( player, "rubbishJob" ) then
		vnxSetElementData ( player, "rubbishJob", true )
		vnxSetElementData ( player, "streetCleanPoints", vnxGetElementData ( player, "streetCleanPoints" ) + 5 )
		setTimer ( vnxSetElementData, 3000, 1, player, "rubbishJob", false )
		vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 200 )
	end
end
addEvent ( "foundTrashmasterRubbish", true )
addEventHandler ( "foundTrashmasterRubbish", getRootElement(), foundTrashmasterRubbish_func )

function trashCheckOccus ( veh )
	if not isElement(veh) then return end
	
	if not getVehicleOccupant ( veh ) then
	
		destroyElement(veh)
		
	else
		local occupant = getVehicleOccupant ( veh )
		
		local eledata = vnxGetElementData ( veh, "TrashDriverVehicle" )
		
		if not eledata or eledata == nil then
		
			destroyElement(veh)
			
		else
		
			if getPlayerName( occupant ) == eledata then
			
				setTimer ( trashCheckOccus, 60000, 1, veh )
			
			else
			
				destroyElement(veh)
				
			end
		
		end
	
	end

end

function createStreetCleanVeh_func ( veh )

	local player = client
	if veh == 574 or veh == 408 then
		veh = createVehicle ( veh, -1857.1, -1623.0, 22.7, 0, 0, 180, "TRASH" )
		setVehicleLocked ( veh, true )
		setTimer ( trashCheckOccus, 60000, 1, veh )
		vnxSetElementData ( veh, "TrashDriverVehicle", getPlayerName(player) )
		setElementHealth ( veh, 650 )
		addEventHandler ( "onPlayerQuit", player, trashVehDestroy_func )
		addEventHandler ( "onPlayerWasted", player, trashVehDestroy_func )
		addEventHandler ( "onPlayerVehicleExit", player, trashVehDestroy_func )
		vnxSetElementData ( player, "isWorking", true )
		warpPedIntoVehicle ( player, veh )
	end
end
addEvent ( "createStreetCleanVeh", true )
addEventHandler ( "createStreetCleanVeh", getRootElement(), createStreetCleanVeh_func )

function trashVehDestroy_func ( veh )
	
	local player
	if eventName == "onPlayerVehicleExit" then
		player = source
	elseif client then
		player = client
		veh = getPedOccupiedVehicle ( player )
	elseif eventName == "onPlayerWasted" then
		player = source
		veh = getPedOccupiedVehicle ( veh )
	else
		player = source
		veh = getPedOccupiedVehicle ( player )
	end
	if isElement ( veh ) then
		local model = getElementModel ( veh )
		if model == 574 or model == 408 then
			destroyElement ( veh )
			removeEventHandler ( "onPlayerQuit", player, trashVehDestroy_func )
			removeEventHandler ( "onPlayerWasted", player, trashVehDestroy_func )
			removeEventHandler ( "onPlayerVehicleExit", player, trashVehDestroy_func )
			vnxSetElementData ( player, "isWorking", false )
			if isElement ( player ) then
				triggerClientEvent ( player, "endTrashJob", player )
			end
		end
	end
end
addEvent ( "trashVehDestroy", true )
addEventHandler ( "trashVehDestroy", getRootElement(), trashVehDestroy_func )