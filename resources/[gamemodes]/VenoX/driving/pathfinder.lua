function getClosestWaypoint ( x1, y1 )

	maxdist = 9999
	curWaypoint = 0
	for i = 1, waypointcount do
		local x2, y2, z2 = getElementPosition ( _G["waypoint"..i] )
		local dist = getDistanceBetweenPoints2D ( x1, y1, x2, y2 )
		if dist < maxdist then
			maxdist = dist
			curWaypoint = i
		end
	end
	return curWaypoint
end



function calcRoute ( x1, y1, x2, y2 )

	local start = getClosestWaypoint ( x1, y1 )
	local ziel = getClosestWaypoint ( x2, y2 )
	local sX, sY, sZ = getElementPosition ( _G["waypoint"..start] )
	local zX, zY, zZ = getElementPosition ( _G["waypoint"..ziel] )
	local rot = findRotation ( sX, sY, zX, zY )
	local lastWaypoint = start
	local lastWPC = 0
	local iMax = math.floor ( getDistanceBetweenPoints2D ( sX, sY, zX, zY ) / 5 )
	for i = 1, iMax do
		lastWPC = lastWPC + 1
		local wx, wy = getElementPosition ( _G["waypoint"..lastWaypoint] )
		local px1, py1 = getPointFromDistanceRotation ( wx, wy, 5*lastWPC, rot )
		clwp = getClosestWaypoint ( px1, py1 )
		
		outputChatBox ( "Run: "..i..", X: "..px1..", Y: "..py1, 200, 200, 0 )
		outputChatBox ( "Closest Waypoint: "..clwp..", Letzte WP: "..lastWaypoint, 0, 0, 125 )
		
		if clwp == lastWaypoint then
		else
			if clwp == ziel then
				outputChatBox ( "Route komplett.", 125, 0, 0 )
				break
			end
			outputChatBox ( "Next Waypoint: "..clwp, 125, 0, 0 )
			lastWaypoint = clwp
			lastWPC = 0
			-- DEBUG --
			local x, y, z = getElementPosition ( _G["waypoint"..lastWaypoint] )
			createBlip ( x, y, z, 51, 0, 0, 0, 255 )
			-- DEBUG --
		end
	end
end




function wptest_func ()

	--[[local x, y, z = getElementPosition ( lp )
	local closest = getClosestWaypoint ( x, y )
	outputChatBox ( "Aktueller Wegpunkt in der Naehe: "..closest, 0, 125, 0 )
	local x, y, z = getElementPosition ( _G["waypoint"..closest] )
	local marker = createMarker ( x, y, z, "checkpoint", 5, 125, 0, 0, 255 )
	setTimer ( destroyElement, 5000, 1, marker )]]
	calcRoute ( 2462.9333496094, -1658.8071289063, 2229.0756835938,-1651.4907226563 )
end
addCommandHandler ( "wptest", wptest_func )