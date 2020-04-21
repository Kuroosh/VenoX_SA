-------------------------
------- (c) 2010 --------
------- by Zipper -------
-------------------------

secRaceCheckpoint = {}
	secRaceCheckpoint[1] = {}
		secRaceCheckpoint[1]["x"], secRaceCheckpoint[1]["y"], secRaceCheckpoint[1]["z"], secRaceCheckpoint[1]["size"] = 566.85723876953, -3765.3896484375, 6.5907855033875, 30
	secRaceCheckpoint[2] = {}
		secRaceCheckpoint[2]["x"], secRaceCheckpoint[2]["y"], secRaceCheckpoint[2]["z"], secRaceCheckpoint[2]["size"] = 824.33740234375, -4013.0458984375, 6.7620401382446, 30
	secRaceCheckpoint[3] = {}
		secRaceCheckpoint[3]["x"], secRaceCheckpoint[3]["y"], secRaceCheckpoint[3]["z"], secRaceCheckpoint[3]["size"] = 784.1025390625, -3671.21875, 6.7438087463379, 30
	secRaceCheckpoint[4] = {}
		secRaceCheckpoint[4]["x"], secRaceCheckpoint[4]["y"], secRaceCheckpoint[4]["z"], secRaceCheckpoint[4]["size"] = 747.33636474609, -3268.4558105469, 6.7857022285461, 20

function showRaceData_func ()

	curLaps = 0
	curCheckpoint = 0
	curCheckpointElement = nil
	showNextCheckpoint ( lp, false )
end
addEvent ( "showRaceData", true )
addEventHandler ( "showRaceData", getRootElement(), showRaceData_func )

function showNextCheckpoint ( hit, dim )

	if hit == lp then
		if dim then
			playSoundFrontEnd ( 43 )
			removeEventHandler ( "onClientMarkerHit", curCheckpointElement, showNextCheckpoint )
		else
			outputChatBox ( "Runde: "..(curLaps+1).."/3!", 0, 125, 0 )
		end
		if isElement ( curCheckpointElement ) then
			destroyElement ( curCheckpointElement )
		end
		curCheckpoint = curCheckpoint + 1
		if curCheckpoint == 5 then
			outputChatBox ( "Runde: "..(curLaps+1).."/3!", 0, 125, 0 )
			curLaps = curLaps + 1
			curCheckpoint = 1
		end
		if curLaps == 3 then
			triggerServerEvent ( "raceSecFinished", lp, lp )
		else
			local id = curCheckpoint
			local x, y, z, size, rot = secRaceCheckpoint[id]["x"], secRaceCheckpoint[id]["y"], secRaceCheckpoint[id]["z"], secRaceCheckpoint[id]["size"], secRaceCheckpoint["rot"]
			curCheckpointElement = createMarker ( x, y, z, "checkpoint", size, 150, 0, 0, 200 )
			addEventHandler ( "onClientMarkerHit", curCheckpointElement, showNextCheckpoint )
			setElementInterior ( curCheckpointElement, 1 )
			setElementDimension ( curCheckpointElement, 1 )
			local blip = createBlipAttachedTo ( curCheckpointElement, 0, 1.5, 0, 255, 0, 0, 0, 99999.0 )
			setElementInterior ( blip, 1 )
			setElementDimension ( blip, 1 )
			setElementParent ( blip, curCheckpointElement )
		end
	end
end

--[[
<marker id="Boxengasse" color="#05FF0099" dimension="0" interior="0" posX="737.38629150391, -3437.0122070313, 5.2979731559753, 10" type="cylinder" />
]]