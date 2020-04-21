local curGhostCarZug = nil

function activeCarGhostModeZugJob_func ( )

	local veh = getPedOccupiedVehicle ( source )
	if isElement ( veh ) then
		curGhostCarZug = veh
		
		local vehicles = getElementsByType ( "vehicle", getRootElement(), true )
		for i=1, #vehicles do
			nonCollidableVehicles[vehicles[i]] = true
			setElementCollidableWith ( veh, vehicles[i], false )
		end
		local players = getElementsByType ( "player", getRootElement(), true )
		for i=1, #players do
			nonCollidableVehicles[players[i]] = true
			setElementCollidableWith ( veh, players[i], false )
		end
		
		addEventHandler ( "onClientElementStreamIn", getRootElement(), ghostCarModeVehicleStreamInZug )
	end
end
addEvent ( "activeCarGhostModeZugJob", true )
addEventHandler ( "activeCarGhostModeZugJob", getRootElement(), activeCarGhostModeZugJob_func )


function ghostCarModeVehicleStreamInZug ()

	if getElementType ( source ) == "player" or getElementType ( source ) == "vehicle" then
		setElementCollidableWith ( curGhostCarZug, source, false )
		nonCollidableVehicles[source] = true
	end
end


function deactiveCarGhostModeZugJob_func ()
	removeEventHandler ( "onClientElementStreamIn", getRootElement(), ghostCarModeVehicleStreamInZug )
	curGhostCarZug = false
	nonCollidableVehicles = {}
end
addEvent ( "deactiveCarGhostModeZugJob", true )
addEventHandler ( "deactiveCarGhostModeZugJob", getRootElement(), deactiveCarGhostModeZugJob_func )
