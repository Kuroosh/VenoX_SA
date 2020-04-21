addEvent ( "connectedTramJob", true )
addEvent ( "newTramRider", true )

local timeForDerail = 0
local veh = nil


addEventHandler ( "connectedTramJob", root, function ( array )
	for _, vehicle in pairs ( array ) do
		setElementCollidableWith ( vehicle, localPlayer, false )
		setElementCollidableWith ( localPlayer, vehicle, false )
	end
end )


addEventHandler ( "newTramRider", root, function ( vehicle )
	setElementCollidableWith ( vehicle, localPlayer, false )
	setElementCollidableWith ( localPlayer, vehicle, false )
	if localPlayer == source then
		veh = vehicle
		addEventHandler ( "onClientRender", root, tramJobCheckSpeed )
		activeCarGhostModeZugJob_func ()
	end
end )


function tramJobCheckSpeed ( )
	if isElement ( veh ) and isPedInVehicle ( localPlayer ) then
		local speed = getTrainSpeed ( veh )
		if speed > 0.6 then
			setTrainSpeed ( veh, 0.6 )
		elseif speed < -0.6 then
			setTrainSpeed ( veh, -0.6 )
		end
	else
		removeEventHandler ( "onClientRender", root, tramJobCheckSpeed )
		deactiveCarGhostModeZugJob_func()
		veh = nil
	end
end


