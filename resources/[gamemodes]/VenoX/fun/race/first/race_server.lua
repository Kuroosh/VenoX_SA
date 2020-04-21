createBlip ( -2111, -444.266, 37.661, 33, 2, 255, 0, 0, 255, 0, 200 )

local hotringcount = 1

local HotringRacer = {
	"-1001.029296875|596.88629150391|1195.75512695313",
	"-986.48138427734|588.41064453125|1195.75512695313",
	"-1001.276550293|580.8125|1195.75512695313",
	"-986.40545654297|572.40386962891|1195.75512695313",
	"-1001.5704345703|564.15411376953|1195.75512695313",
	"-986.712890625|555.291015625|1195.75512695313",
	"-1001.6979980469|547.89617919922|1195.75512695313",
	"-986.75274658203|538.53460693359|1195.75512695313",
	"-1001.3354492188|531.17028808594|1195.75512695313",
	"-986.81774902344|521.90045166016|1195.75512695313",
	"-1000.8764038086|512.39947509766|1195.75512695313",
	"-986.73956298828|504.44668579102|1195.75512695313" }

local stadionRaceEntrance = createMarker ( -2111, -444.266, 38.5, "corona", 1.2, 0, 125, 0, 225 )

function stadionRaceEntrance_func ( player )

	triggerClientEvent ( player, "showRaceGui", getRootElement() )
	showCursor ( player, true )
	setElementClicked ( player, true )
end
addEventHandler ( "onMarkerHit", stadionRaceEntrance, stadionRaceEntrance_func )


function startFirstRace_func ( player )

	if player == client then
		if getPedOccupiedVehicle ( player ) == false then
			suc = false
			setElementDimension ( player, 1 )
			vnxSetElementData ( player, "isInRace", true )
			vnxSetElementData ( player,"nodmzone", 1 )
			
			local sx = tonumber( gettok ( HotringRacer[hotringcount], 1, string.byte('|') ) )
			local sy = tonumber( gettok ( HotringRacer[hotringcount], 2, string.byte('|') ) )
			hotringcount = hotringcount + 1
			if hotringcount >= 13 then
				hotringcount = 1
			end
			local sz = 1195.75512695313
			local veh = createVehicle ( 502, sx, sy, sz, 0, 0, 0, "Hotring" )
			vnxSetElementData ( veh, "slot", i )
			setElementHealth ( veh, 1000000 )
			triggerClientEvent ( player, "startRaceRoundTime", player, sx, sy, sz )
			setElementDimension ( veh, 1 )
			setElementDimension ( player, 1 )
			warpPedIntoVehicle ( player, veh )
			addEventHandler ( "onVehicleExit", veh, leaveHotringRacer )
			setElementFrozen ( veh, true )
			setTimer ( defreezeRace, 4000, 1, veh )
			outputChatBox ( "Verlasse das Fahrzeug, um das Rennen zu beenden!", player, 200, 200, 0 )
			suc = true
		end
	end
end
addEvent ( "startFirstRace", true )
addEventHandler ( "startFirstRace", getRootElement(), startFirstRace_func )

function defreezeRace ( veh )
	setElementFrozen ( veh, false )
end

function stopArenaSettings ( player )

	toggleControl ( player, "fire", true )
	toggleControl ( player, "enter_exit", true )
	vnxSetElementData( player, "nodmzone", 0 )
	vnxSetElementData ( player, "isInRace", false )
end

function funexit_func ( player, veh )

	if vnxGetElementData ( player, "isInRace" ) == true then
		if veh then
			destroyElement ( veh )
		end
		removePedFromVehicle ( player )
		setElementPosition ( player, -2130, -444.266, 36 )
		setElementDimension ( player, 0 )
		stopArenaSettings ( player )
		triggerClientEvent ( player, "killRaceClient", getRootElement() )
		vnxSetElementData ( player, "isInRace", false )
	end
end

function leaveHotringRacer ( player )
	funexit_func ( player, source )
end



function raceFinished_func ( player, ms, s, m )
	if player == client then
		local ms, s, m = tonumber ( ms ), tonumber ( s ), tonumber ( m )
		if m < 2 or ( m == 2 and s < 10 ) then
			dbExec ( handler, "INSERT INTO ?? ( Name, Admin, Grund, Datum, IP, Serial ) VALUES (?,?,?,?,?,?)", "ban", "UID", "AdminUID", "Grund", "Datum", "IP", "Serial", playerUID[getPlayerName ( player )], 0, 'Speedhack', timestamp(), getPlayerIP ( player ), getPlayerSerial ( player ) )
			kickPlayer ( player, "Von: Anticheat, Grund: Speedhack (Gebannt!)" )
			return false
		end
		local pct = ms+s*10+m*1000
		local datatime = ms+s*10+m*1000
		local pname = getPlayerName ( player )
		outputChatBox ( "Deine Zeit: "..m..":"..s..":"..ms.."!", player, 200, 200, 0 )
		if datatime <= 3000 then
			pricemoney = 1000 + math.floor ( ( 3000 - datatime ) )
			outputChatBox ( "Deine Zeit war besser, als der Durchschnitt - Du erhälst "..pricemoney.." $ Preisgeld!", player, 0, 125, 0 )
			vnxSetElementData ( player, "money", tonumber(vnxGetElementData ( player, "money" )) + pricemoney )
		end
		local result = dbPoll ( dbQuery ( handler, "SELECT * FROM racing" ), -1 )
		if result and result[1] then
			for i=1, #result do
				local dsatz = result[i]
				local platz = tonumber ( dsatz["Platz"] )
				if platz == 1 then
					p1name = playerUIDName[tonumber(dsatz["UID"])]
					p1ms = tonumber ( dsatz["MilliSekunden"] )
					p1s = tonumber ( dsatz["Sekunden"] )
					p1m = tonumber ( dsatz["Minuten"] )
					p1t = p1ms+p1s*10+p1m*1000
				elseif platz == 2 then
					p2name = playerUIDName[tonumber(dsatz["UID"])]
					p2ms = tonumber ( dsatz["MilliSekunden"] )
					p2s = tonumber ( dsatz["Sekunden"] )
					p2m = tonumber ( dsatz["Minuten"] )
					p2t = p2ms+p2s*10+p2m*1000
				elseif platz == 3 then
					p3name = playerUIDName[tonumber(dsatz["UID"])]
					p3ms = tonumber ( dsatz["MilliSekunden"] )
					p3s = tonumber ( dsatz["Sekunden"] )
					p3m = tonumber ( dsatz["Minuten"] )
					p3t = p3ms+p3s*10+p3m*1000
				end
			end
		end
		if not p1name then
			dbExec ( handler, "INSERT INTO ?? (??, ??, ??, ??, ??) VALUES (?,?,?,?,?)", "racing", "UID", "MilliSekunden", "Sekunden", "Minuten", "Platz", playerUID[pname], ms, s, m, 1 )
		else
			if pct < p1t then
				if p2t then
					p3name = p2name
					p3ms = p2ms
					p3s = p2s
					p3m = p2m
				end
				p2ms = p1ms
				p2s = p1s
				p2m = p1m
				p2name = p1name
				p1ms = ms
				p1s = s
				p1m = m
				p1name = pname
			elseif not p2name then
				dbExec ( handler, "INSERT INTO ?? (??, ??, ??, ??, ??) VALUES (?,?,?,?,?)", "racing", "UID", "MilliSekunden", "Sekunden", "Minuten", "Platz", playerUID[pname], ms, s, m, 2 )
			else
				if pct < p2t then
					p3ms = p2ms
					p3s = p2s
					p3m = p2m
					p3name = p2name
					p2ms = ms
					p2s = s
					p2m = m
					p2name = pname
				elseif not p3name then
					dbExec ( handler, "INSERT INTO ?? (??, ??, ??, ??, ??) VALUES (?,?,?,?,?)", "racing", "UID", "MilliSekunden", "Sekunden", "Minuten", "Platz", playerUID[pname], ms, s, m, 3 )
				elseif pct < p3t then
					p3ms = ms
					p3s = s
					p3m = m
					p3name = pname
				end
			end
		end
		if p1name then
			dbExec ( handler, "UPDATE ?? SET ??=?, ??=?, ??=?, ??=? WHERE ??=?", "racing", "UID", playerUID[p1name], "MilliSekunden", p1ms, "Sekunden", p1s, "Minuten", p1m, "Platz", 1 )
		end
		if p2name then
			dbExec ( handler, "UPDATE ?? SET ??=?, ??=?, ??=?, ??=? WHERE ??=?", "racing", "UID", playerUID[p2name], "MilliSekunden", p2ms, "Sekunden", p2s, "Minuten", p2m, "Platz", 2 )
		end
		if p3name then
			dbExec ( handler, "UPDATE ?? SET ??=?, ??=?, ??=?, ??=? WHERE ??=?", "racing", "UID", playerUID[p3name], "MilliSekunden", p3ms, "Sekunden", p3s, "Minuten", p3m, "Platz", 3 )
		end
		outputChatBox ( "___Highscore___", player, 200, 200, 0 )
		local result = dbPoll ( dbQuery ( handler, "SELECT * FROM racing" ), -1 )
		if result and result[1] then
			for i=1, #result do
				local dsatz = result[i]
				local platz = tonumber ( dsatz["Platz"] )
				if platz == 1 then
					p1name = playerUIDName[tonumber(dsatz["UID"])]
					p1ms = tonumber ( dsatz["MilliSekunden"] )
					p1s = tonumber ( dsatz["Sekunden"] )
					p1m = tonumber ( dsatz["Minuten"] )
				elseif platz == 2 then
					p2name = playerUIDName[tonumber(dsatz["UID"])]
					p2ms = tonumber ( dsatz["MilliSekunden"] )
					p2s = tonumber ( dsatz["Sekunden"] )
					p2m = tonumber ( dsatz["Minuten"] )
				elseif platz == 3 then
					p3name = playerUIDName[tonumber(dsatz["UID"])]
					p3ms = tonumber ( dsatz["MilliSekunden"] )
					p3s = tonumber ( dsatz["Sekunden"] )
					p3m = tonumber ( dsatz["Minuten"] )
				end
			end
		end
		if p1name then
			outputChatBox ( "Platz 1: "..p1name.." mit "..p1m..":"..p1s..":"..p1ms, player, 200, 200, 0 )
		end
		if p2name then
			outputChatBox ( "Platz 2: "..p2name.." mit "..p2m..":"..p2s..":"..p2ms, player, 200, 200, 0 )
		end
		if p3name then
			outputChatBox ( "Platz 3: "..p3name.." mit "..p3m..":"..p3s..":"..p3ms, player, 200, 200, 0 )
		end
	end
end
addEvent ( "raceFinished", true )
addEventHandler ( "raceFinished", getRootElement(), raceFinished_func )