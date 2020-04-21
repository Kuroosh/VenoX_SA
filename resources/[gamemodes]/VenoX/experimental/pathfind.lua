outputServerLog ( "Pathfind by Zipper gestartet, Testroute mit /test!" )

waypoint = {}
	waypoint["x"] = {}
	waypoint["y"] = {}
	waypoint["reachable"] = {}
	
		-- Waypoint X und Y-Koordinaten --
		waypoint["x"][1], waypoint["y"][1] = 2490.61, -1668.66
		waypoint["x"][2], waypoint["y"][2] = 2463.72, -1659.27
		waypoint["x"][3], waypoint["y"][3] = 2482.62, -1688.10
		waypoint["x"][4], waypoint["y"][4] = 2342.75, -1659.02
		waypoint["x"][5], waypoint["y"][5] = 2342.86, -1564.11
		waypoint["x"][6], waypoint["y"][6] = 2342.56, -1732.46
		waypoint["x"][7], waypoint["y"][7] = 2431.29, -1732.02
		waypoint["x"][8], waypoint["y"][8] = 2431.27, -1524.93
		waypoint["x"][9], waypoint["y"][9] = 2480.70, -1731.72
		-- Erreichbare Waypoints --
		waypoint["reachable"][1] = { 2, 3 }
		waypoint["reachable"][2] = { 1, 4 }
		waypoint["reachable"][3] = { 1, 9 }
		waypoint["reachable"][4] = { 2, 5, 6 }
		waypoint["reachable"][5] = { 4 }
		waypoint["reachable"][6] = { 4, 7 }
		waypoint["reachable"][7] = { 6, 8, 9 }
		waypoint["reachable"][8] = { 7 }
		waypoint["reachable"][9] = { 7, 3 }

function getBestWaypoint ( from, to )

	local curBest = nil
	local x, y = waypoint["x"][to], waypoint["y"][to]
	local curBestDist = nil
	local cx, cy
	local dist
	for i, index in pairs ( waypoint["reachable"][from] ) do
		if not used[index] then
			cx, cy = waypoint["x"][index], waypoint["y"][index]
			dist = getDistanceBetweenPoints2D ( x, y, cx, cy )
			if curBestDist then
				if curBestDist > dist then
					curBest = index
					curBestDist = dist
				end
			else
				curBest = index
				curBestDist = dist
			end
		end
	end
	if curBest then
		used[curBest] = true
	end
	return curBest
end

function getClosestWaypoint ( x, y )

	local bestDist = 9999
	local dist
	for key, index in pairs ( waypoint["x"] ) do
		wx, wy = index, waypoint["y"][key]
		local dist = getDistanceBetweenPoints2D ( x, y, wx, wy )
		if dist < bestDist then
			bestDist = dist
			best = key
		end
	end
	return best
end

function findPath ( sx, sy, zx, zy )

	local startWaypoint = getClosestWaypoint ( sx, sy )
	local endWaypoint = getClosestWaypoint ( zx, zy )
	path = {}
	used = {}
	pathCount = 2
	local curWaypoint = startWaypoint
	path[1] = curWaypoint
	while curWaypoint ~= endWaypoint do
		local next = getBestWaypoint ( curWaypoint, endWaypoint )
		if next then
			path[pathCount] = next
			pathCount = pathCount + 1
			curWaypoint = next
		else
			outputServerLog ( tostring ( path[pathCount] ) )
			path[pathCount] = nil
			pathCount = pathCount - 1
		end
	end
end

-- Test-CMD --
function test_func ()

	outputServerLog ( "Berechne Route..." )
	-- Startkoordinaten, in diesem Fall Wegpunkt 1 ( Grovestreet )
	local x1, y1 = 2490.61, -1668.66
	-- Zielkoordinaten, in diesem Fall Wegpunkt 5
	local x2, y2 = 2342.86, -1564.11
	
	findPath ( x1, y1, x2, y2 )
	-- Das Ergebnis wird benutzt und testweise ausgegeben
	for key, index in pairs ( path ) do
		outputServerLog ( "Wegpunkt Nr. "..key.." ist Waypoint "..index )
	end
end
addCommandHandler ( "test", test_func )
-- Test-CMD --