LVPDGate1 = createObject ( 971, 2335.2087402344, 2444.2141113281, 8.2993488311768, 0, 0, 60 )
LVPDGate1Moved = false

LVPDGate2 = createObject ( 980, 2294.0656738281, 2498.68359375, 4.4518175125122, 0, 0, 90 )
LVPDGate2Moved = false

LVPDGateFactions = {
 [1]=true,
 [6]=true,
 [8]=true
}

local function mv_func ( player )

	if isOnDuty(player) then
		local x1, y1, z1 = 2335.2087402344, 2444.2141113281, 8.2993488311768
		local x2, y2, z2 = getElementPosition ( player )
		local x3, y3, z3 = getElementPosition ( player )
		if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 10 then
			LVPDGate1Moved = not LVPDGate1Moved
			if not LVPDGate1Moved then
				moveObject ( LVPDGate1, 5000, 2339.2236328125, 2451.1831054688, 8.2993488311768 )
			else
				moveObject ( LVPDGate1, 5000, 2335.2087402344, 2444.2141113281, 8.2993488311768 )
			end
		elseif getDistanceBetweenPoints3D ( x3, y3, z3, x2, y2, z2 ) <= 10 then
			LVPDGate2Moved = not LVPDGate2Moved
			if not LVPDGate2Moved then
				moveObject ( LVPDGate2, 5000, 2294.0656738281, 2508.6640625, 4.4518175125122 )
			else
				moveObject ( LVPDGate2, 5000, 2294.0656738281, 2498.68359375, 4.4518175125122 )
			end
		end
	end
end
addCommandHandler ( "mv", mv_func )