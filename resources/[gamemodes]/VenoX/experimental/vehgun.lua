function start ()
	
	outputChatBox ( " Binded 1" )
	bindKey ( "g", "down", firegun )
	outputChatBox ( " Binded 2" )
end
--addCommandHandler ( "bindme", start )

function firegun (key,keystate)

	setTimer ( fire2, 300, 1 )
end

function fire2 ()

	local x,y,z = getElementPosition(getLocalPlayer())
	local rx, ry, rz = getVehicleRotation (getPedOccupiedVehicle(getLocalPlayer()))
	local rz = (360-rz)
	createProjectile(getLocalPlayer(),19,x,y,z+1.2,1000,nil,rx, ry, rz)
	outputChatBox ( " fire in the hole " )
end