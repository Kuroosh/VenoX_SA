drivingSchoolMarkers = {
 ["x"] = {
  [1]=-1522.3, --Fertig
  [2]=-1532.3, --Fertig
  [3]=-1585.0, --Fertig
  [4]=-1602.5, --Fertig
  [5]=-1678.6, --Fertig
  [6]=-1626.6,--Fertig
  [7]=-1704.6,--Fertig
  [8]=-1726.6,--Fertig
  [9]=-1778.6,--fertig
  [10]=-1959.6, --fertig
  [11]=-2008.6,--fertig
  [12]=-2006.6,--fertig
  [13]=-1994.6,--fertig
  [14]=-1730.6,--fertig
  [15]=-1574.6,--fertig
  [16]=-1512.6, --fertig
  [17]=-1494.6

 },
 ["y"] = {
  [1]=779.6,--Fertig
  [2]=838.3,--Fertig
  [3]=1037.9,--Fertig
  [4]=1217.7,--Fertig
  [5]=1276.9,--Fertig
  [6]=1202.7,--Fertig
  [7]=1189.9,--Fertig
  [8]=1108.9,--Fertig
  [9]=1105.9,--fertig
  [10]=1078.9,--fertig
  [11]=1037.9,--fertig
  [12]=831.9,--fertig
  [13]=726.9,--fertig
  [14]=728.9,--fertig
  [15]=728.9,--fertig
  [16]=780.9,--fertig
  [17]=766.9--fertig

 },
 ["z"] = {
  [1]=6.8,--Fertig
  [2]=6.8,--Fertig
  [3]=6.8,--Fertig
  [4]=6.6,--Fertig
  [5]=6.6,--Fertig
  [6]=6.6,--Fertig
  [7]=6.6,--Fertig
  [8]=6.6,--Fertig
  [9]=6.6,--Fertig
  [10]=55.6,--Fertig
  [11]=55.6,--Fertig
  [12]=44.6,--Fertig
  [13]=44.6,--Fertig
  [14]=24.6,--Fertig
  [15]=6.6,--Fertig
  [16]=6.6,--Fertig
  [17]=6.6--Fertig

 }
}

function startDrivingSchoolTheory_func ()

	local player = client
	setElementDimension ( player, 0 )
	setElementPosition ( player, 358.32, 162.689, 1008.37 )
	setPedRotation ( player, 100 )
	createPed(17,356.20,162.64001,1008.37,180,true)
	triggerClientEvent ( player, "startDrivingLicenseTheory", player )
	showCursor ( player, true )
	setElementClicked ( player, true )
end

function showNextDrivingSchoolMarker ( player )

	if vnxGetElementData ( player, "drivingSchoolPractise" ) then
		local old = vnxGetElementData ( player, "drivingSchoolMarker" )
		if old then
			if isElement ( old ) then
				destroyElement ( old )
				destroyElement ( vnxGetElementData ( player, "drivingSchoolBlip" ) )
			end
		end
		local new = vnxGetElementData ( player, "drivingSchoolCur" ) + 1
		vnxSetElementData ( player, "drivingSchoolCur", new )
		if new <= table.size ( drivingSchoolMarkers["x"] ) then
			local x, y, z = drivingSchoolMarkers["x"][new], drivingSchoolMarkers["y"][new], drivingSchoolMarkers["z"][new]
			local marker = createMarker ( x, y, z, "checkpoint", 10, 0,218,255, 255, player )
			local blip = createBlip ( x, y, z, 0, 2, 255, 255, 255, 255, 0, 99999.0, player )
			local dim = getElementDimension ( player )
			vnxSetElementData ( player, "drivingSchoolMarker", marker )
			vnxSetElementData ( player, "drivingSchoolBlip", blip )
			setElementDimension ( marker, dim )
			setElementDimension ( blip, dim )
			infobox ( player, "Checkpoint erreicht -\nnun zum nächsten!", 5000, 0, 218, 255 )
			addEventHandler ( "onMarkerHit", marker, showNextDrivingSchoolMarker )
		else
			triggerClientEvent ( player, "drivingSchoolFinished", player )
			spawnAfterDrivingSchool ( player )
			infobox ( player, "Herzlichen\nGlückwunsch,du hast\ndie Fahrprüfung\nbestanden!", 5000, 0, 0, 255 )
			vnxSetElementData ( player, "carlicense", 1 )
			playSoundFrontEnd ( player, 40 )
			vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - vnxGetElementData ( player, "drivingLicensePrice" ) )
			dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "Autofuehrerschein", 1, "UID", playerUID[getPlayerName ( player )] )
		end
	end
end

function drivingSchoolTheoryComplete_func ( correct )

	local player = client
	if correct >= 6 then
		-- Practise
		showCursor ( player, false )
		setElementClicked ( player, false )
		
		setElementInterior ( player, 0 )
		local dim = getElementDimension ( player )
		local veh = createVehicle ( 526, -1504.4, 767.9, 7.4 )
		local ped = createPed ( 17, 0, 0, 0 )
		warpPedIntoVehicle ( player, veh, 0 )
		warpPedIntoVehicle ( ped, veh, 1 )
		setVehicleDamageProof ( veh, true )
		setElementDimension ( veh, dim )
		setElementDimension ( ped, dim )
		
		vnxSetElementData ( player, "drivingSchoolVeh", veh )
		vnxSetElementData ( player, "drivingSchoolPed", ped )
		vnxSetElementData ( player, "drivingSchoolCur", 0 )
		vnxSetElementData ( player, "drivingSchoolPractise", true )
		
		toggleControl ( player, "enter_exit", false )
		
		outputChatBox ( "Um die praktische Prüfung abzuschließen, musst die die vorgegebene Strecke abfahren.", player, 200, 200, 0 )
		outputChatBox ( "Beachte dabei jedoch, dass du nicht schneller als 120 km/h fahren darfst - sonst ist die Prüfung gelaufen!", player, 200, 200, 0 )
		outputChatBox ( "Drücke X und L, um Licht oder Motor ein- oder aus zu schalten!", player, 200, 200, 0 )
		
		triggerClientEvent ( player, "checkDrivingSchoolSpeed", player )
		
		showNextDrivingSchoolMarker ( player )
		
		addEventHandler ( "onVehicleExit", veh,
			function ( player )
				infobox ( player, "Du hast das Fahrzeug verlassen!", 5000, 125, 0, 0 )
				spawnAfterDrivingSchool ( player )
			end
		)
		removeEventHandler ( "onPlayerQuit", player, drivingSchoolQuit )
		addEventHandler ( "onPlayerQuit", player, drivingSchoolQuit )
	else
		infobox ( player, "Du bist durchgefallen!\nDu hast nur "..correct.." / 7\n Fragen richtig be-\nantwortet.", 5000, 125, 0, 0 )
		showCursor ( player, false )
		spawnAfterDrivingSchool ( player )
	end
end
addEvent ( "drivingSchoolTheoryComplete", true )
addEventHandler ( "drivingSchoolTheoryComplete", getRootElement(), drivingSchoolTheoryComplete_func )

function drivingSchoolQuit ()

	local player = source
	if vnxGetElementData ( player, "drivingSchoolPractise" ) then
		spawnAfterDrivingSchool ( player )
	end
end

function drivingSchoolToFast_func ()

	if vnxGetElementData ( client, "drivingSchoolPractise" ) then
		spawnAfterDrivingSchool ( client )
		infobox ( client, "Du bist zu\nschnell gefahren!", 5000, 125, 0, 0 )
	end
end
addEvent ( "drivingSchoolToFast", true )
addEventHandler ( "drivingSchoolToFast", getRootElement(), drivingSchoolToFast_func )

function spawnAfterDrivingSchool ( player )

	if vnxGetElementData ( player, "drivingSchoolPractise" ) then
		vnxSetElementData ( player, "drivingSchoolPractise", false )
		local veh = vnxGetElementData ( player, "drivingSchoolVeh" )
		if veh then
			if isElement ( veh ) then
				removePedFromVehicle ( player )
				destroyElement ( veh )
			end
		end
		local ped = vnxGetElementData ( player, "drivingSchoolPed" )
		if ped then
			if isElement ( ped ) then
				destroyElement ( ped )
			end
		end
		local old = vnxGetElementData ( player, "drivingSchoolMarker" )
		if old then
			if isElement ( old ) then
				destroyElement ( old )
				destroyElement ( vnxGetElementData ( player, "drivingSchoolBlip" ) )
			end
		end
		
		if isElement ( player ) then
			setElementInterior ( player, 3 )
			toggleControl ( player, "enter_exit", true )
			setElementPosition ( player, 364.42 + 5, 173.81, 1008.039 )
			setElementDimension ( player, 0 )
			setPedRotation ( player, 180 )
			setCameraTarget ( player )
			setElementDimension ( player, 0 )
			triggerClientEvent ( player, "drivingSchoolFinished", player )
		end
	end
end