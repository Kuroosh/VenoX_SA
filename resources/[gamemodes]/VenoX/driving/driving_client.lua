--[[function startDrive_func ( route )

	local veh = getPedOccupiedVehicle ( lp )
	curWaypoint = 1
	setElementCollidableWith ( veh, getRootElement(), false )
	setTimer ( proceedRoute, 50, 1, lp, route )
	addEventHandler ( "onClientElementStreamIn", getRootElement(), taxiStreamer )
	local vehicles = getElementsByType ( "vehicle" )
	local players = getElementsByType ( "player" )
	for key, vehicle in ipairs ( vehicles ) do
		setElementCollidableWith ( veh, vehicle, false )
	end
	for key, player in ipairs ( players ) do
		setElementCollidableWith ( veh, player, false )
	end
end
addEvent ( "startDrive", true )
addEventHandler ( "startDrive", getRootElement(), startDrive_func )

function taxiStreamer ()
	if getElementType ( source ) == "vehicle" or getElementType ( source ) == "player" then
		setElementCollidableWith ( getPedOccupiedVehicle ( lp ), source, false )
	end
end

function proceedRoute ( driver, route )

	setControlState ( "accelerate", false )
	setControlState ( "vehicle_left", false )
	setControlState ( "vehicle_right", false )
	setControlState ( "handbrake", false )
	setControlState ( "brake_reverse", false )
	local veh = getPedOccupiedVehicle ( driver )
	setElementCollidableWith ( veh, getRootElement(), false )
	local x1, y1, z1 = getElementPosition ( veh )
	local x2, y2 = _G["route"..route]["x"][curWaypoint], _G["route"..route]["y"][curWaypoint]
	local rX, rY, rZ = getElementRotation ( veh )
	local dist = getDistanceBetweenPoints2D ( x1, y1, x2, y2 )
	if dist then
		if dist <= 3 then
			curWaypoint = curWaypoint + 1
		end
	end
	if _G["route"..route]["x"][curWaypoint] then
		local nx, ny = _G["route"..route]["x"][curWaypoint], _G["route"..route]["y"][curWaypoint]
		local nx2, ny2 = _G["route"..route]["x"][curWaypoint+1], _G["route"..route]["y"][curWaypoint+1]
		dist = getDistanceBetweenPoints2D ( x1, y1, nx, ny )
		if nx2 then
			dist2 = getDistanceBetweenPoints2D ( x1, y1, nx2, ny2 )
			local rot2 = findRotation ( nx, ny, nx2, ny2 )
		end
		local rot = findRotation ( x1, y1, nx, ny )
		local rot = rot - rZ
		if rot >= 180 then
			rot = rot - 360
		elseif rot <= -180 then
			rot = rot + 360
		end
		local factor = dist / 50
		
		rot = rot + rot * factor
		local vx, vy, vz = getElementVelocity ( veh )
		speed = math.floor ( math.sqrt(vx^2 + vy^2 + vz^2)*214 )
		maxspeed = getMaxSpeedForTaxi ( speed, dist, dist2, rot, nx2, ny2, nx, ny )
		if speed < maxspeed then
			setControlState ( "accelerate", true )
		elseif speed >= maxspeed + 10 then
			setControlState ( "brake_reverse", true )
		end
		if speed < 15 then
			setControlState ( "accelerate", true )
		end
		
		local _, _, vr = getElementRotation ( veh )
		local tr = findRotation ( x1, y1, x2, y2 )
		local rd = tr - vr
		if ( rd > 3 ) then
			setControlState ( "vehicle_right", true )
		elseif ( rd < -3 ) then
			setControlState ( "vehicle_left", true )
		end
		
		
		setTimer ( proceedRoute, 50, 1, lp, route )
	else
		outputChatBox ( "Du bist am Ziel angekommen!", 0, 125, 0 )
		setControlState ( "handbrake", true )
		removeEventHandler ( "onClientElementStreamIn", getRootElement(), taxiStreamer )
		triggerServerEvent ( "stopTaxi", lp, lp )
	end
end

function getMaxSpeedForTaxi ( speed, dist, dist2, rot, nx2, ny2, nx, ny )

	if dist > 40 then
		return 200
	end
	if nx2 then
		local vx, vy, vz = getElementRotation ( getPedOccupiedVehicle ( lp ) )
		rot2 = vz - findRotation ( nx2, ny2, nx, ny )
		if rot2 < -130 and rot2 > -230 then
			rot2 = rot2 + 180
		end
		if rot2 > 130 and rot2 < 230 then
			rot2 = rot2 - 180
		end
	else
		rot2 = 999
	end
	local totrot = math.abs(rot) + math.abs(rot2)
	if totrot < 20 then
		return 120
	elseif totrot < 30 then
		return 80
	elseif totrot < 50 then
		return 50
	elseif dist < 15 then
		return 35
	end
	return 80
end]]