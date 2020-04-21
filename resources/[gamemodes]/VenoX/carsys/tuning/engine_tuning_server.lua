function vtuning ( player, cmd, todo )

	local veh = getPedOccupiedVehicle ( player )
	local model = getElementModel ( veh )
	if todo == "basic" then
		setVehicleHandling ( veh, "mass", defaultVehicleHandlingData[model]["mass"] )
		setVehicleHandling ( veh, "maxVelocity", defaultVehicleHandlingData[model]["maxVelocity"] )
		setVehicleHandling ( veh, "brakeDeceleration", defaultVehicleHandlingData[model]["maxVelocity"] )
		setVehicleHandling ( veh, "turnMass", defaultVehicleHandlingData[model]["turnMass"] )
		setVehicleHandling ( veh, "engineAcceleration", defaultVehicleHandlingData[model]["engineAcceleration"] )
		outputChatBox ( "bas" )
	elseif todo == "velocity" then
		setVehicleHandling ( veh, "maxVelocity", defaultVehicleHandlingData[model]["maxVelocity"] * 3 )
		outputChatBox ( "vel" )
	elseif todo == "breaks" then
		setVehicleHandling ( veh, "brakeBias", defaultVehicleHandlingData[model]["brakeBias"] * 10 )
		outputChatBox ( "bre" )
	elseif todo == "turn" then
		setVehicleHandling ( veh, "turnMass", defaultVehicleHandlingData[model]["turnMass"] * 3 )
		outputChatBox ( "tur" )
	elseif todo == "mass" then
		setVehicleHandling ( veh, "mass", defaultVehicleHandlingData[model]["mass"] * 3 )
		outputChatBox ( "mas" )
	elseif todo == "acceleration" then
		setVehicleHandling ( veh, "engineAcceleration", defaultVehicleHandlingData[model]["engineAcceleration"] * 3 )
		outputChatBox ( "acc" )
	end
end
--addCommandHandler ( "vtuning", vtuning )


function giveSportmotorUpgrade ( veh )
	-- ASSERT
	if not isElement(veh) then
		return
	end

	-- V!O
	local sportmotor = vnxGetElementData ( veh, "sportmotor" )
	if sportmotor and sportmotor > 0 then
		local vehmodel = getElementModel ( veh ) 
		setVehicleHandling(veh, "engineAcceleration", (getModelHandling(vehmodel)['engineAcceleration']* (1 + 0.2*sportmotor)))
		setVehicleHandling(veh, "maxVelocity", (getModelHandling(vehmodel)['maxVelocity']*(1 + 0.2*sportmotor)))	
		setVehicleHandling(veh, "engineInertia", (getModelHandling(vehmodel)['engineInertia']*(1 + 0.2*sportmotor)))	
		setVehicleHandling(veh, "mass", (getModelHandling(vehmodel)['mass']*(1 + 0.2*sportmotor)))
		setVehicleHandling(veh, "turnMass", (getModelHandling(vehmodel)['turnMass']*(1 + 0.2*sportmotor)))
	end
	local bremse = vnxGetElementData ( veh, "bremse" )
	if bremse and bremse > 0 then
		local vehmodel = getElementModel ( veh ) 
		setVehicleHandling(veh, "brakeDeceleration", (getModelHandling(vehmodel)['brakeDeceleration']*(1 + 0.2*sportmotor)))
		setVehicleHandling(veh, "tractionMultiplier", (getModelHandling(vehmodel)['tractionMultiplier']*(1 + 0.2*sportmotor)))	
	end
	local antrieb = vnxGetElementData ( veh, "antrieb" )
	if antrieb then
		setVehicleHandling ( veh, "driveType", antrieb )
	end
end