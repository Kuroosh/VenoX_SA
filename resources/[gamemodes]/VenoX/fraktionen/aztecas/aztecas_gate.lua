AztecasGate = createObject ( 971, -1288.8000488281, 2463.6999511719, 88.83, 0, 0, 10 )

local AztecasGateMoved = false

function mv_func ( player )

	if isAztecas(player) or isOnDuty(player) then
		if getDistanceBetweenPoints3D ( -1288.8000488281, 2463.6999511719, 88.83, getElementPosition ( player ) ) < 10 then
			if AztecasGateMoved == false then
				moveObject ( AztecasGate, 3000, -1279.8000488281, 2465, 88.800003051758, 0, 0, -3 )
				AztecasGateMoved = true
			else
				moveObject ( AztecasGate, 3000, -1288.8000488281, 2463.6999511719, 88.83, 0, 0, 3 )
				AztecasGateMoved = false
			end
		end
	end
end
addCommandHandler ( "mv", mv_func )
