terrorgate = createObject( 971, -2095.080078125, -1873.869140625, 111.15069580078, 0, 0, 323.99780273438 )
local terror_gate_moving = false

function terrorgate_func(player, command)

	local x, y, z = getElementPosition( player )
	
	if isTerror (player) or isOnDuty(player) then
	
		if getDistanceBetweenPoints3D ( x, y, z, -2095.080078125, -1873.869140625, 111.15069580078 ) <= 10 then
		
			if not terror_gate_moving then
			
				moveObject ( terrorgate, 2500, -2095.080078125, -1873.869140625, 101.15069580078 )
				terror_gate_moving = true
			
			else
			
				moveObject ( terrorgate, 2500, -2095.080078125, -1873.869140625, 111.15069580078 )
				terror_gate_moving = false
			
			end
		
		end
		
	end
	
end

addCommandHandler("mv", terrorgate_func)