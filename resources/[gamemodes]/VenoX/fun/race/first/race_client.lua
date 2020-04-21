local gLabel = {}
local raceMarker = nil


function defreeze ()
	local player = localPlayer
	veh = getPedOccupiedVehicle ( player )
	if frozentimer == 5 then
		outputChatBox ( "GO!", 0, 125, 0 )
		racetime = 0
		ms, s, m = 0, 0, 0
		racetimer = setTimer ( showNewRaceTime, 100, 1 )
		if gLabel["DeineZeit"] then
			guiSetVisible ( gLabel["DeineZeit"], true )
		else
			gLabel["DeineZeit"] = guiCreateLabel(1,0,400,62,"Deine Zeit:",false)
			guiLabelSetColor(gLabel["DeineZeit"],200,200,000)
			guiLabelSetVerticalAlign(gLabel["DeineZeit"],"top")
			guiLabelSetHorizontalAlign(gLabel["DeineZeit"],"left",false)
			guiSetFont(gLabel["DeineZeit"],"sa-header")
		end
		toggleAllControls ( true )
		if gLabel["TotalZeit"] then
			guiSetVisible ( gLabel["TotalTime"], true )
		else
			gLabel["TotalTime"] = guiCreateLabel(82,45,400,100,"0:00:0",false)
			guiLabelSetColor(gLabel["TotalTime"],255,255,255)
			guiLabelSetVerticalAlign(gLabel["TotalTime"],"top")
			guiLabelSetHorizontalAlign(gLabel["TotalTime"],"left",false)
			guiSetFont(gLabel["TotalTime"],"sa-gothic")
		end
		playSoundFrontEnd ( 45 )
	else
		outputChatBox ( "Rennen startet in "..(5-frozentimer), 0, 0, 200 )
		playSoundFrontEnd ( 43 )
	end
	frozentimer = frozentimer + 1
end


function startRaceRoundTime_func ( sx, sy, sz )
	fmarkerx, fmarkery, fmarkerz = sx, sy, sz
	frozentimer = 0
	toggleAllControls ( false )
	toggleControl ( "enter_exit", false )
	raceMarker = createMarker ( -780.19860839844, 1221.1427001953, 1012.18264770508, "checkpoint", 23, getColorFromString ( "#FF000000" ) )
	setElementDimension ( raceMarker, 1 )
	addEventHandler ( "onClientMarkerHit", raceMarker, raceMarkerHit )
	setTimer ( defreeze, 1000, 6, getLocalPlayer() )
end
addEvent ( "startRaceRoundTime", true )
addEventHandler ( "startRaceRoundTime", getRootElement(), startRaceRoundTime_func )


function showNewRaceTime ()
	ms = ms + 1
	s = tonumber ( s )
	if ms >= 10 then 
		ms = 0
		s = s + 1
	end
	if s >= 60 then
		s = 0
		m = m + 1
	end
	if s <= 9 then
		s = "0"..s
	end
	guiSetText ( gLabel["TotalTime"], m..":"..s..":"..ms )
	if guiGetVisible ( gLabel["TotalTime"] ) then
		racetimer = setTimer ( showNewRaceTime, 100, 1 )
	end
end


function killRaceClient_func ()
	if isElement ( raceMarker ) then
		destroyElement ( raceMarker )
	end
	if isElement ( raceMarkerFinish ) then
		destroyElement ( raceMarkerFinish )
	end
	guiSetVisible ( gLabel["DeineZeit"], false )
	guiSetVisible ( gLabel["TotalTime"], false )
end
addEvent ( "killRaceClient", true )
addEventHandler ( "killRaceClient", getRootElement(), killRaceClient_func )


function raceMarkerHit ( hitElement )
	if hitElement == localPlayer then
		if source == raceMarker then
			destroyElement ( raceMarker )
			raceMarkerFinish = createMarker ( fmarkerx, fmarkery, fmarkerz, "checkpoint", 23, 0, 200, 0, 255 )
			setElementDimension ( raceMarkerFinish, 1 )
			addEventHandler ( "onClientMarkerHit", raceMarkerFinish, raceMarkerHit )
		elseif raceMarkerFinish == source then
			destroyElement ( raceMarkerFinish )
			killRaceClient_func ()
			triggerServerEvent ( "raceFinished", hitElement, getLocalPlayer(), ms, s, m )
		end
	end
end
