--[[508, -1248.1365966797, 235.51264953613, 14.590888023376, 0, 0, 0
Journeyspawn, -1246.2573242188, 235.73886108398, 13.790113449097
]]

camper = { [508] = true }

parkingZoneX, parkingZoneY = -2260.76, 565.56
parkingZoneRange = 800

spawnTrailerAddRot = findRotation ( -1248.1365966797, 235.51264953613, -1246.2573242188, 235.73886108398 )
heightDiff = 14.59 - 13.79
spawnTrailerDist = getDistanceBetweenPoints2D ( -1248.1365966797, 235.51264953613, -1246.2573242188, 235.73886108398 )

function isTrailerInParkingZone ( veh )

	if camper[getElementModel ( veh )] then
		local x, y, z = getElementPosition ( veh )
		local dist = getDistanceBetweenPoints2D ( x, y, parkingZoneX, parkingZoneY )
		if dist > parkingZoneRange then
			return true
		end
	else
		return true
	end
	return false
end

function getTrailerSpawnKoords ( player )

	local pname = getPlayerName ( player )
	local veh
	for i = 1, 10 do
		veh = allPrivateCars[pname][i]
		if isElement ( veh ) then
			if camper [ getElementModel ( veh ) ] then
				local x, y, z = getElementPosition ( veh )
				local rx, ry, rz = getElementRotation ( veh )
				local rot = spawnTrailerAddRot + - 1 * rz
				local dist = spawnTrailerDist
				
				local z = z - heightDiff
				local x, y = getPointFromDistanceRotation ( x, y, dist, rot )
				
				return x, y, z, rz - 90
			end
		end
	end
	local x, y, z, r = -2458.288085, 774.354492, 35.171875, 0
	return x, y, z, r
end

function buyTrailer_func ( buy )

	carbuy ( client, 134500, 508, -904.54809570313, -468.8056640625, 26.54301071167, 0, 0, 0, nil, nil, nil, nil, nil, buy )
end
addEvent ( "buyTrailer", true )
addEventHandler ( "buyTrailer", getRootElement(), buyTrailer_func )