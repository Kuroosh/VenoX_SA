local stuntCamX, stuntCamY, stuntCamZ
local retouchedGround = false

function checkForStuntCam ()

	if stuntCameraActive then
		local veh = getPedOccupiedVehicle ( lp )
		if veh then
			local model = getElementModel ( veh )
			local vehOnGround = isVehicleOnGround ( veh )
			if not vehOnGround and ( cars[model] or bikes[model] or lkws[model] ) then
				local x, y, z = getElementPosition ( veh )
				local vx, vy, vz = getElementVelocity ( veh )
				local gZ = getGroundPosition ( x, y, z )
				if not gZ then
					gZ = z + 2
				end
				local speed = math.sqrt ( vx ^ 2 + vy ^ 2 + vz ^ 2 ) / 0.00464
				if z > gZ + 2.5 and ( z - gZ ) < 30 and speed > 30 and retouchedGround then
					stuntCamX, stuntCamY, stuntCamZ = x, y, gZ + 0.5
					retouchedGround = false
					addEventHandler ( "onClientPreRender", getRootElement(), jumpCamRender )
					addEventHandler ( "onClientRender", getRootElement(), jumpCamRender )
					setGameSpeed ( .75 )
					return true
				end
			elseif vehOnGround then
				retouchedGround = true
			end
		end
		setTimer ( checkForStuntCam, 50, 1 )
	else
		setTimer ( checkForStuntCam, 1000, 1 )
	end
end
checkForStuntCam ()

function jumpCamRender ()

	local veh = getPedOccupiedVehicle ( lp )
	if veh then
		if not isVehicleOnGround ( veh ) then
			local x, y, z = getElementPosition ( veh )
			local vx, vy, vz = getElementVelocity ( veh )
			local speed = math.sqrt ( vx ^ 2 + vy ^ 2 + vz ^ 2 ) / 0.00464
			if z > stuntCamZ + 2 and speed > 30 and ( z - stuntCamZ ) < 50 then
				setCameraMatrix ( stuntCamX, stuntCamY, stuntCamZ, x, y, z )
				return true
			end
		else
			retouchedGround = true
		end
	end
	removeEventHandler ( "onClientPreRender", getRootElement(), jumpCamRender )
	removeEventHandler ( "onClientRender", getRootElement(), jumpCamRender )
	setGameSpeed ( 1 )
	setCameraTarget ( lp, lp )
	setTimer ( checkForStuntCam, 50, 1 )
end