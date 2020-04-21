local fischmarker = {} 
local fischmarkerblip = {} 
local finalmarker
local finalmarkerblip
local fische = 0
local alreadytooked = {}

function startfishing_func ()
	fische = 0
	finalmarker = createMarker ( -1713.13, 1453.08, 0, "checkpoint", 7, 0, 200, 0, 255, getLocalPlayer() )
	finalmarkerblip = createBlip ( -1713.13, 1453.08, 0, 0, 1.5, 0, 255, 0, 255, 0, 99999.0, getLocalPlayer() )
	addEventHandler ( "onClientMarkerHit", finalmarker, fischMarkerHit )
	addEventHandler ( "onClientPlayerWasted", localPlayer, fischPlayerDeath )
	alreadytooked = {}
	local i=0
	while i<3 do
		local rnd = math.random ( 1, 16 )
		if not alreadytooked[rnd] then
			alreadytooked[rnd] = true
			i = i+1
			if rnd == 1 then 
				fischmarker[i] = createMarker ( -1587.2761230469, 1612.5944824219, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() )
				fischmarkerblip[i] = createBlip ( -1587.2761230469, 1612.5944824219, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() )
			end
			if rnd == 2 then 
				fischmarker[i] = createMarker ( -1286.3483886719, 1472.4879150391, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
				fischmarkerblip[i] = createBlip ( -1286.3483886719, 1472.4879150391, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() )
			end
			if rnd == 3 then 
				fischmarker[i] = createMarker ( -1217.1864013672, 984.06463623047, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
				fischmarkerblip[i] = createBlip ( -1217.1864013672, 984.06463623047, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() )
			end
			if rnd == 4 then 
				fischmarker[i] = createMarker ( -1422.9135742188, 1157.8354492188, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
				fischmarkerblip[i] = createBlip ( -1422.9135742188, 1157.8354492188, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() )
			end
			if rnd == 5 then 
				fischmarker[i] = createMarker ( -1278.3187255859, 801.39245605469, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
				fischmarkerblip[i] = createBlip ( -1278.3187255859, 801.39245605469, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() )
			end
			if rnd == 6 then 
				fischmarker[i] = createMarker ( -1001.3262939453, 797.20697021484, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() )
				fischmarkerblip[i] = createBlip ( -1001.3262939453, 797.20697021484, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() )
			end
			if rnd == 7 then 
				fischmarker[i] = createMarker ( -1115.03515625, 701.140625, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
				fischmarkerblip[i] = createBlip ( -1115.03515625, 701.140625, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() )
			end
			if rnd == 8 then 
				fischmarker[i] = createMarker ( -1148.3835449219, 470.44064331055, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
				fischmarkerblip[i] = createBlip ( -1148.3835449219, 470.44064331055, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() )
			end
			if rnd == 9 then 
				fischmarker[i] = createMarker ( -892.72381591797, 530.1328125, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
				fischmarkerblip[i] = createBlip ( -892.72381591797, 530.1328125, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() )
			end
			if rnd == 10 then 
				fischmarker[i] = createMarker ( -677.67651367188, 489.87966918945, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
				fischmarkerblip[i] = createBlip ( -677.67651367188, 489.87966918945, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() )
			end
			if rnd == 11 then 
				fischmarker[i] = createMarker ( -1073.26171875, 161.7254486084, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
				fischmarkerblip[i] = createBlip ( -1073.26171875, 161.7254486084, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() )
			end
			if rnd == 12 then 
				fischmarker[i] = createMarker ( -1809.0780029297, 1752.9664306641, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() )
				fischmarkerblip[i] = createBlip ( -1809.0780029297, 1752.9664306641, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() )
			end
			if rnd == 13 then 
				fischmarker[i] = createMarker ( -1904.6411132813, 2109.8564453125, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
				fischmarkerblip[i] = createBlip ( -1904.6411132813, 2109.8564453125, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() )
			end
			if rnd == 14 then 
				fischmarker[i] = createMarker ( -2449.1669921875, 1474.4860839844, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
				fischmarkerblip[i] = createBlip ( -2449.1669921875, 1474.4860839844, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() )
			end
			if rnd == 15 then 
				fischmarker[i] = createMarker ( -2469.5495605469, 1850.9063720703, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
				fischmarkerblip[i] = createBlip ( -2469.5495605469, 1850.9063720703, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() )
			end
			if rnd == 16 then 
				fischmarker[i] = createMarker ( -2040.4636230469, 1705.9348144531, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
				fischmarkerblip[i] = createBlip ( -2040.4636230469, 1705.9348144531, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() )
			end
			addEventHandler ( "onClientMarkerHit", fischmarker[i], fischMarkerHit )
		end
	end
	outputChatBox ( "Fahre die Checkpoints ab, um Fisch zu fangen - Wenn du genug hast, fahre zum gruenen Checkpoint um den Fisch abzuliefern!", 200, 200, 0 )
end
addEvent ( "startfishing", true )
addEventHandler ( "startfishing", root, startfishing_func )


function cancelfishing_func ()
	for i=1, 3 do
		if isElement ( fischmarker[i] ) then
			destroyElement ( fischmarker[i] )
			destroyElement ( fischmarkerblip[i] )
		end
	end
	alreadytooked = {}
	destroyElement ( finalmarker )
	destroyElement ( finalmarkerblip )
	outputChatBox ( "Du hast das Fischen beendet!", 125, 0, 0 )
	removeEventHandler ( "onClientPlayerWasted", localPlayer, fischPlayerDeath )
end
addEvent ( "cancelfishing", true )
addEventHandler ( "cancelfishing", root, cancelfishing_func )


function fischMarkerHit ( player )
	if player == localPlayer then
		local markerhit = 0
		for i=1, 3 do
			if source == fischmarker[i] then
				markerhit = i
				destroyElement ( fischmarker[i] )
				destroyElement ( fischmarkerblip[i] )
				break
			end
		end
		if markerhit > 0 then
			local rnd = math.random ( 0, 5 )
			if fische == nil then fische = 0 end
			if rnd == 0 then 
				if math.random ( 1, 3 ) == 1 then
					rnd = 0
				else
					rnd = 1
				end
			end
			fische = fische + rnd
			local fischmehrzahl = rnd == 1 and "Fisch" or "Fische"
			local fischmehrzahl2 = fische == 1 and "Fisch" or "Fische"
			triggerEvent ( "infobox_start", getLocalPlayer(),"Du hast soeben\n"..rnd.." "..fischmehrzahl.." gefangen!\nInsgesamt hast du\nschon "..fische.." "..fischmehrzahl2.."!", 10000, 125, 0, 0 )
			local i = 0
			while i == 0 do
				local rnd = math.random ( 1, 16 )
				if not alreadytooked[rnd] then
					alreadytooked[rnd] = true
					if rnd == 1 then 
						fischmarker[i] = createMarker ( -1587.2761230469, 1612.5944824219, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() )
						fischmarkerblip[i] = createBlip ( -1587.2761230469, 1612.5944824219, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() ) 
					elseif rnd == 2 then 
						fischmarker[i] = createMarker ( -1286.3483886719, 1472.4879150391, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() )
						fischmarkerblip[i] = createBlip ( -1286.3483886719, 1472.4879150391, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() ) 
					elseif rnd == 3 then
						fischmarker[i] = createMarker ( -1217.1864013672, 984.06463623047, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
						fischmarkerblip = createBlip ( -1217.1864013672, 984.06463623047, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() ) 
					elseif rnd == 4 then 
						fischmarker[i] = createMarker ( -1422.9135742188, 1157.8354492188, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
						fischmarkerblip[i] = createBlip ( -1422.9135742188, 1157.8354492188, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() ) 
					elseif rnd == 5 then 
						fischmarker[i] = createMarker ( -1278.3187255859, 801.39245605469, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
						fischmarkerblip[i] = createBlip ( -1278.3187255859, 801.39245605469, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() ) 
					elseif rnd == 6 then 
						fischmarker[i] = createMarker ( -1001.3262939453, 797.20697021484, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
						fischmarkerblip[i] = createBlip ( -1001.3262939453, 797.20697021484, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() ) 
					elseif rnd == 7 then 
						fischmarker[i] = createMarker ( -1115.03515625, 701.140625, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
						fischmarkerblip[i] = createBlip ( -1115.03515625, 701.140625, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() ) 
					elseif rnd == 8 then 
						fischmarker[i] = createMarker ( -1148.3835449219, 470.44064331055, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
						fischmarkerblip[i] = createBlip ( -1148.3835449219, 470.44064331055, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() ) 
					elseif rnd == 9 then 
						fischmarker[i] = createMarker ( -892.72381591797, 530.1328125, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
						fischmarkerblip[i] = createBlip ( -892.72381591797, 530.1328125, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() ) 
					elseif rnd == 10 then 
						fischmarker[i] = createMarker ( -677.67651367188, 489.87966918945, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
						fischmarkerblip[i] = createBlip ( -677.67651367188, 489.87966918945, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() ) 
					elseif rnd == 11 then 
						fischmarker[i] = createMarker ( -1073.26171875, 161.7254486084, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
						fischmarkerblip[i] = createBlip ( -1073.26171875, 161.7254486084, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() ) 
					elseif rnd == 12 then 
						fischmarker[i] = createMarker ( -1809.0780029297, 1752.9664306641, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
						fischmarkerblip[i] = createBlip ( -1809.0780029297, 1752.9664306641, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() ) 
					elseif rnd == 13 then 
						fischmarker[i] = createMarker ( -1904.6411132813, 2109.8564453125, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
						fischmarkerblip[i] = createBlip ( -1904.6411132813, 2109.8564453125, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() ) 
					elseif rnd == 14 then 
						fischmarker[i] = createMarker ( -2449.1669921875, 1474.4860839844, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
						fischmarkerblip[i] = createBlip ( -2449.1669921875, 1474.4860839844, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() ) 
					elseif rnd == 15 then 
						fischmarker[i] = createMarker ( -2469.5495605469, 1850.9063720703, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
						fischmarkerblip[i] = createBlip ( -2469.5495605469, 1850.9063720703, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() ) 
					elseif rnd == 16 then 
						fischmarker[i] = createMarker ( -2040.4636230469, 1705.9348144531, 0, "checkpoint", 7, 200,0,0, 255, getLocalPlayer() ) 
						fischmarkerblip[i] = createBlip ( -2040.4636230469, 1705.9348144531, 0, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() ) 
					end
					addEventHandler ( "onClientMarkerHit", fischmarker[i], fischMarkerHit )
					i = 1
				end
			end
			alreadytooked[markerhit] = false
		end
		if source == finalmarker and fische > 0 then
			triggerServerEvent ( "endfishing", getLocalPlayer(), fische )
		end
	end
end


function fischPlayerDeath ()
	for i=1, 3 do
		if isElement ( fischmarker[i] ) then
			destroyElement ( fischmarker[i] )
			destroyElement ( fischmarkerblip[i] )
		end
	end
	alreadytooked = {}
	destroyElement ( finalmarker )
	destroyElement ( finalmarkerblip )
	removeEventHandler ( "onClientPlayerWasted", localPlayer, fischPlayerDeath )
end
