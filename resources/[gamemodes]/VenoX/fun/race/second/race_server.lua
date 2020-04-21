local i
secondRaceTrackSpawns = {}
	i = 1
	secondRaceTrackSpawns[i] = {}
		secondRaceTrackSpawns[i]["x"], secondRaceTrackSpawns[i]["y"], secondRaceTrackSpawns[i]["z"] = 747.57775878906, -3374.4768066406, 6.6352233886719
	i = 2
	secondRaceTrackSpawns[i] = {}
		secondRaceTrackSpawns[i]["x"], secondRaceTrackSpawns[i]["y"], secondRaceTrackSpawns[i]["z"] = 751.51763916016, -3374.2238769531, 6.6352233886719
	i = 3
	secondRaceTrackSpawns[i] = {}
		secondRaceTrackSpawns[i]["x"], secondRaceTrackSpawns[i]["y"], secondRaceTrackSpawns[i]["z"] = 755.33740234375, -3373.9230957031, 6.6352233886719
	i = 4
	secondRaceTrackSpawns[i] = {}
		secondRaceTrackSpawns[i]["x"], secondRaceTrackSpawns[i]["y"], secondRaceTrackSpawns[i]["z"] = 759.08557128906, -3373.6801757813, 6.6352233886719
	i = 5
	secondRaceTrackSpawns[i] = {}
		secondRaceTrackSpawns[i]["x"], secondRaceTrackSpawns[i]["y"], secondRaceTrackSpawns[i]["z"] = 762.75305175781, -3373.2976074219, 6.6352233886719
	i = 6
	secondRaceTrackSpawns[i] = {}
		secondRaceTrackSpawns[i]["x"], secondRaceTrackSpawns[i]["y"], secondRaceTrackSpawns[i]["z"] = 765.89215087891, -3373.1044921875, 6.6352233886719
	i = 7
	secondRaceTrackSpawns[i] = {}
		secondRaceTrackSpawns[i]["x"], secondRaceTrackSpawns[i]["y"], secondRaceTrackSpawns[i]["z"] = 769.14233398438, -3372.8203125, 6.6352233886719
	i = 8
	secondRaceTrackSpawns[i] = {}
		secondRaceTrackSpawns[i]["x"], secondRaceTrackSpawns[i]["y"], secondRaceTrackSpawns[i]["z"] = 771.97698974609, -3372.6188964844, 6.6352233886719
	secondRaceTrackSpawns["rot"] = 4.37255859375

curSecRaceTotalPlayers = 0
curSecRacePlayersPos = 1
raceSecPlayer = {}
raceStarted = false

for i = 1, 8 do
	_G["racePos"..i.."InUse"] = false
end
	
function startSecondRace_func ( player )

	if player == client then
		if vnxGetElementData ( player, "carlicense" ) == 1 then
			if not raceStarted then
				if curSecRaceTotalPlayers <= 7 then
					curSecRaceTotalPlayers = curSecRaceTotalPlayers + 1
					outputChatBox ( "Danke an SATAN fuer die Map!", player, 200, 200, 0 )
					
					index = 0
					for i = 1, 8 do
						if not _G["racePos"..i.."InUse"] then
							_G["racePos"..i.."InUse"] = true
							index = i
							break
						end
					end
					
					raceSecPlayer[index] = player
					vnxSetElementData ( player, "secRaceID", index )
					
					local x, y, z = secondRaceTrackSpawns[index]["x"], secondRaceTrackSpawns[index]["y"], secondRaceTrackSpawns[index]["z"]
					_G["secRaceVeh"..index] = createVehicle ( 415, x, y, z )
					
					local veh = _G["secRaceVeh"..index]
					setElementFrozen ( veh, true )
					setElementInterior ( veh, 1 )
					setElementDimension ( veh, 1 )
					warpPedIntoVehicle ( player, veh )
					
					setElementInterior ( player, 1 )
					setElementDimension ( player, 1 )
					
					addEventHandler ( "onRacePlayerQuit", player, onRacePlayerQuit )
					addEventHandler ( "onPlayerVehicleExit", player, onRacePlayerQuit )
					addEventHandler ( "onPlayerWasted", player, onRacePlayerQuit )
					
					triggerClientEvent ( player, "showRaceData", getRootElement() )
					
					checkForSecRaceStart()
				else
					outputChatBox ( "Es werden maximal 8 Spieler unterstuetzt - bitte habe einen Moment Gedult!", player, 125, 0, 0 )
				end	
			else
				outputChatBox ( "Das Rennen ist bereits gestartet - bitte versuche es spaeter noch einmal!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du hast keinen Fuehrerschein!", player, 125, 0, 0 )
		end
	end
end
addEvent ( "startSecondRace", true )
addEventHandler ( "startSecondRace", getRootElement(), startSecondRace_func )

function onRacePlayerQuit ()
	playerSecRaceExit ( source )
end

function checkForSecRaceStart ()

	if not raceStarted then
		if curSecRaceTotalPlayers > 1 then
			if not isTimer ( startSecRaceTimer ) then
				sendMessageToAllSecRacePlayers ( "Rennen startet in 30 Sekunden!", 0, 0, 125 )
				startSecRaceTimer = setTimer ( startSecRace, 30000, 1 )
			end
		end
	end
end

function raceSecFinished_func ( player )

	if player == client then
		for i = 1, 8 do
			if not _G["secRacePlace"..i] then
				_G["secRacePlace"..i] = player
				place = i
				break
			end
		end
		sendMessageToAllSecRacePlayers ( getPlayerName(player).." hat das Rennen als "..place.."ter beendet!", 200, 200, 0 )
		playerSecRaceExit ( player )
		startSecRaceTimer = nil
	end
end
addEvent ( "raceSecFinished", true )
addEventHandler ( "raceSecFinished", getRootElement(), raceSecFinished_func )

function playerSecRaceExit ( player )

	removeEventHandler ( "onRacePlayerQuit", player, onRacePlayerQuit )
	removeEventHandler ( "onPlayerVehicleExit", player, onRacePlayerQuit )
	removeEventHandler ( "onPlayerWasted", player, onRacePlayerQuit )
	curSecRaceTotalPlayers = curSecRaceTotalPlayers - 1
	local id = vnxGetElementData ( player, "secRaceID" )
	_G["racePos"..id.."InUse"] = false
	raceSecPlayer[id] = nil
	if isElement ( player ) then
		removePedFromVehicle ( player )
		setElementInterior ( player, 0 )
		setElementDimension ( player, 0 )
		setElementPosition ( player, -2130, -444.266, 36 )
		outputChatBox ( "Rennen beendet!", player, 125, 0, 0 )
	end
	if curSecRaceTotalPlayers < 2 then
		if isTimer ( startSecRaceTimer ) then
			killTimer ( startSecRaceTimer )
		end
		if isTimer ( endRaceTimeoutTimer ) then
			killTimer ( endRaceTimeoutTimer )
		end
		endRaceTimeout()
	end
	if curSecRaceTotalPlayers < 1 then
		raceStarted = false
	end
	if isElement ( _G["secRaceVeh"..id] ) then
		destroyElement ( _G["secRaceVeh"..id] )
	end
end

function startSecRace ()
	
	if curSecRaceTotalPlayers > 1 then
		sendMessageToAllSecRacePlayers ( "Rennen startet in 5 Sekunden!", 0, 0, 125 )
		setTimer ( sendMessageToAllSecRacePlayers, 1000, 1, "Rennen startet in 4 Sekunden!", 0, 0, 125 )
		setTimer ( sendMessageToAllSecRacePlayers, 2000, 1, "Rennen startet in 3 Sekunden!", 0, 0, 125 )
		setTimer ( sendMessageToAllSecRacePlayers, 3000, 1, "Rennen startet in 2 Sekunden!", 0, 0, 125 )
		setTimer ( sendMessageToAllSecRacePlayers, 4000, 1, "Rennen startet in 1 Sekunden!", 0, 0, 125 )
		setTimer ( sendMessageToAllSecRacePlayers, 5000, 1, "GO!", 0, 200, 0 )
		setTimer ( defreezeSecRaceCars, 5000, 1 )
		endRaceTimeoutTimer = setTimer ( endRaceTimeout, 240000, 1 )
	end
end

function endRaceTimeout()

	for i = 1, 8 do
		if raceSecPlayer[i] then
			if isElement ( raceSecPlayer[i] ) then
				playerSecRaceExit ( raceSecPlayer[i] )
			end
		end
	end
	raceStarted = false
end

function defreezeSecRaceCars ()

	for id, player in ipairs ( raceSecPlayer ) do
		setElementFrozen ( _G["secRaceVeh"..id], false )
	end
	for i = 1, 8 do
		_G["secRacePlace"..i] = nil
	end
	raceStarted = true
end

function sendMessageToAllSecRacePlayers ( text, r, g, b )

	local sec = false
	for index, player in ipairs ( raceSecPlayer ) do
		sec = true
		outputChatBox ( text, player, r, g, b )
	end
	if not sec then
		raceStarted = false
	end
end