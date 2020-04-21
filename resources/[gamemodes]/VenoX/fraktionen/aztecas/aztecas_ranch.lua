aztecasBouncer = createInvulnerablePed ( 24, 697.08, 1968.51, 5.18, 180, 0, 0 )

setTimer ( setPedAnimation, 10000, 0, aztecasBouncer, "SMOKING", "M_smkstnd_loop", 10000, false, false, false, false )

setPedRotation ( aztecasBouncer, 180 )

ranchMarkerEnter = createMarker ( 693.63275146484, 1967.2496337891, 4.5390615463257, "cylinder", 1.5, 255, 0, 0, 150 )
ranchMarkerExit = createMarker ( 1204.7830810547, -13.656443595886 + 0.3, 999.89587402344, "cylinder", 1.5, 255, 0, 0, 150 )
setElementInterior ( ranchMarkerExit, 2 )

local function ranchMarker_func ( hit, dim )

	if dim then
		if getElementType ( hit ) == "player" then
			if not getPedOccupiedVehicle ( hit ) then
				if source == ranchMarkerEnter then
					fadeElementInterior ( hit, 2, 1204.8291015625, -12.408407211304, 1000.571105957, 0 )
				else
					fadeElementInterior ( hit, 0, 693.66094970703, 1965.4333496094, 5.1882882118225, 180 )
				end
			end
		end
	end
end
addEventHandler ( "onMarkerHit", ranchMarkerEnter, ranchMarker_func )
addEventHandler ( "onMarkerHit", ranchMarkerExit, ranchMarker_func )

--[[
    <marker id="enter" type="cylinder" color="#0000ff99" size="1" interior="0, 693.63275146484, 1967.2496337891, 4.5390615463257
    <object id="outSpawn180" doublesided="false" model="1337" interior="0, 693.66094970703, 1965.4333496094, 5.1882882118225
    <object id="innerSpawn0" doublesided="false" model="1337" interior="2, 1204.8291015625, -12.408407211304, 1000.571105957
    <marker id="exit" type="cylinder" color="#0000ff99" size="1" interior="2, 1204.7830810547, -13.656443595886, 999.89587402344
]]