NRGateMoved = false
NRGate = createObject ( 980, -1978.5521240234, 500.00799560547, 30.805553436279, 0, 0, 180 )
createObject ( 7017, -1960.9868164063, 483.82489013672, 30.138368606567, 0, 0, 90 )

local NRGate2Moved = false

function NRGate_func ( player )

	if isReporter(player) or isOnDuty(player) then
		if getDistanceBetweenPoints3D ( -1978.5521240234, 500.00799560547, 30.805553436279, getElementPosition ( player ) ) < 17 then
			if NRGateMoved == false then
				moveObject ( NRGate, 3000, -1978.5517578125, 500.0078125, 24.555553436279, 0, 0, 0 )
				NRGateMoved = true
			else
				moveObject ( NRGate, 3000, -1978.5517578125, 500.0078125, 30.805553436279, 0, 0, 0 )
				NRGateMoved = false
			end
		end
	end
end
addCommandHandler ( "mv", NRGate_func )


NRLiftMoving = false
NRLiftMoved = false
NRLiftMovetime = 15000
NRLift = createObject ( 2633, -2020.484375, 454.92721557617, 32.685661315918, 0, 0, 0 )

function NRLift_func ( player )

	if isReporter(player) then
		if not NRLiftMoving then
			if NRLiftMoved == false then
				moveObject ( NRLift, NRLiftMovetime, -2023.6525878906, 454.19586181641, 137.10433959961, 0, 0, 0 )
				setTimer ( triggerNRLiftVarb, NRLiftMovetime, 1 )
				NRLiftMoved = true
			else
				moveObject ( NRLift, NRLiftMovetime, -2020.484375, 454.92721557617, 32.685661315918, 0, 0, 0 )
				setTimer ( triggerNRLiftVarb, NRLiftMovetime, 1 )
				NRLiftMoved = false
			end
			NRLiftMoving = true
		end
	else
		outputChatBox ( "Du bist kein Reporter!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "lift", NRLift_func )

function triggerNRLiftVarb ()

	NRLiftMoving = false
end