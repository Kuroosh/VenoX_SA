nonCollidableVehicles = {}
curGhostCar = false

function activeCarGhostMode ( player, time )

	local veh = getPedOccupiedVehicle ( player )
	if isElement ( veh ) then
		curGhostCar = veh
		
		local vehicles = getElementsByType ( "vehicle", getRootElement(), true )
		for key, index in pairs ( vehicles ) do
			nonCollidableVehicles[index] = true
			setElementCollidableWith ( veh, index, false )
		end
		local players = getElementsByType ( "player", getRootElement(), true )
		for key, index in pairs ( players ) do
			nonCollidableVehicles[index] = true
			setElementCollidableWith ( veh, index, false )
		end
		removeEventHandler ( "onClientElementStreamIn", getRootElement(), ghostCarModeVehicleStreamIn )
		addEventHandler ( "onClientElementStreamIn", getRootElement(), ghostCarModeVehicleStreamIn )
		setElementAlpha ( veh, 150 )
		setTimer (
			function ( veh )
				removeEventHandler ( "onClientElementStreamIn", getRootElement(), ghostCarModeVehicleStreamIn )
				curGhostCar = false
				if isElement ( veh ) then
					setElementAlpha ( veh, 255 )
					
					for key, index in pairs ( nonCollidableVehicles ) do
						if isElement ( key ) then
							setElementCollidableWith ( veh, key, true )
						end
					end
					nonCollidableVehicles = {}
				end
			end,
		time, 1, veh )
		setTimer ( checkVehicleForToBlink, 500, 1, time, 0, veh )
	end
end
addEvent ( "activeCarGhostMode", true )
addEventHandler ( "activeCarGhostMode", getRootElement(), activeCarGhostMode )

function ghostCarModeVehicleStreamIn ()

	if getElementType ( source ) == "player" or getElementType ( source ) == "vehicle" then
		setElementCollidableWith ( curGhostCar, source, false )
		nonCollidableVehicles[source] = true
	end
end

function checkVehicleForToBlink ( time, curTime, veh )

	if isElement ( veh ) then
		if time - curTime <= 3000 then
			if getElementAlpha ( veh ) == 150 then
				setElementAlpha ( veh, 255 )
			else
				setElementAlpha ( veh, 150 )
			end
		end
		if time - curTime > 500 then
			setTimer ( checkVehicleForToBlink, 500, 1, time, curTime + 500, veh )
		else
			setElementAlpha ( veh, 255 )
		end
	end
end