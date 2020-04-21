addCommandHandler ( "brianhuso", function ( )
	local commands = getCommandHandlers( )
	for i, v in pairs ( commands ) do
		outputDebugString ( i..". ".. ( type ( v ) == "table" and v[1] or v ) )
	end
end )


function mainTimer ()

	local curtime = getRealTime()
	local hour = curtime.hour
	local minute = curtime.minute
	local weekday = curtime.weekday
	
	--if hour == 19 and math.floor ( minute / 10 ) == minute / 10 then
	--	outputChatBox ( "Heute um 20:00 findet die Lottoziehung statt! Falls du noch kein Los hast, hole dir eins.", root, 200, 200, 0 )
	--	outputChatBox ( "kannst du noch eins bei der SAN-News-Redaktion erstehen - Aktueller Jackpot: "..lottoJackpot, root, 200, 200, 0 )
	--elseif hour == 20 and minute == 0 then
	--	drawLottoWinners ()
	--end
	
	if hour == 4 and minute == 00 then
		if weekday == 6 then
			dbExec ( handler, "UPDATE racing SET UID = '0', MilliSekunden = '0', Sekunden = '0', Minuten = '3'" )
		end
		dbExec ( handler, "DELETE FROM warns WHERE extends <= ?", curtime.timestamp )
		for index, playeritem in pairs ( getElementsByType ( "player" ) ) do
			if vnxGetElementData ( playeritem, "loggedin" ) == 1 then
				local pname = getPlayerName ( playeritem )
				local int = getElementInterior ( playeritem )
				local dim = getElementDimension ( playeritem )
				local x, y, z = getElementPosition ( playeritem )
				local curWeaponsForSave = "|"
				for i = 1, 11 do
					if i ~= 10 then
						local weapon = getPedWeapon ( playeritem, i )
						local ammo = getPedTotalAmmo ( playeritem, i )
						if weapon and ammo then
							if weapon > 0 and ammo > 0 then
								if #curWeaponsForSave <= 40 then
									curWeaponsForSave = curWeaponsForSave..weapon..","..ammo.."|"
								end
							end
						end
					end
				end
				local pos = "|"..(math.floor(x*100)/100).."|"..(math.floor(y*100)/100).."|"..(math.floor(z*100)/100).."|"..int.."|"..dim.."|"
				if #curWeaponsForSave < 5 then
					curWeaponsForSave = ""
				end
				dbExec ( handler,"INSERT INTO logout (Position, Waffen, UID) VALUES (?,?,?)", pos, curWeaponsForSave, playerUID[pname] )
				datasave_remote ( playeritem )
				clearInv ( playeritem )
				clearUserdata ( playeritem )
				clearBonus ( playeritem )
				--clearAchiev ( playeritem )
				clearPackage ( playeritem )
				clearDataSettings ( playeritem )
			end
		end
		restartResource ( getThisResource() )
	elseif hour == 3 and minute == 55 then
		outputChatBox ( "ACHTUNG: Script startet neu in 5 Minuten!", getRootElement(), 200, 20, 20 )
		if weekday == 6 then
			dbExec ( handler, "TRUNCATE TABLE weed" )
		end
	elseif hour == 0 and minute == 0 then
		playingTimeResetAtMidnight ()
	end
end


serverRestartedAMinuteAgo = true
setTimer (
	function ()
		serverRestartedAMinuteAgo = false
	end,
5000, 1 )

setTimer ( 
	function ()
		client = nil
	end,
1000, 0 )

function joinHandler ()

	setElementDimension ( source, 0 )
    fadeCamera( source, true)
    setCameraTarget( source, source )
	toggleControl(source, "radar",false)
	if isWithinNightTime () then
		setCameraMatrix ( source, -1170.7099609375, 460.859375, 50.8359375, -1333.318359375 , 475.0810546875 , 4.1875 )
	else
		setCameraMatrix ( source, -2681.7158203125, 1934.0498046875, 216.9231262207, -2681.8959960938, 1834.5554199219, 204.25393676758, 0, 70 )
	end
end
addEventHandler ( "onPlayerJoin", getRootElement(), joinHandler )

function getServerSlotCount ()

	triggerClientEvent ( client, "recieveServerSlotCount", client, getMaxPlayers () )
end
addEvent ( "getServerSlotCount", true )
addEventHandler ( "getServerSlotCount", getRootElement(), getServerSlotCount )

invalidChars = {}
for i = 33, 39 do
invalidChars[i] = true
end
for i = 40, 43 do
invalidChars[i] = true
end
invalidChars[47] = true
for i = 58, 64 do
invalidChars[i] = true
end
invalidChars[92] = true
invalidChars[94] = true
invalidChars[96] = true
for i = 123, 126 do
invalidChars[i] = true
end

function hasInvalidChar ( player )

	name = getPlayerName ( player )
	for i, index in pairs ( invalidChars ) do
		if not gettok ( name, 1, i ) or gettok ( name, 1, i ) ~= name then
			return true
		end
	end
	return false
end

function hasInvalidCharString ( strin )
	for i, index in pairs ( invalidChars ) do
		if not gettok ( strin, 1, i ) or gettok ( strin, 1, i ) ~= strin then
			return true
		end
	end
	return false
end

function serverstart ()

	setGameType ( "VenoX Reallife" )
	setMapName ( "VenoX Reallife" )
	lastadtime = 0
	for i = 1, 14 do
		_G["arenaSlot"..i.."Occupied"] = false
	end
	setTimer ( mainTimer, 50*1000, 0 )
	deleteAllFromLoggedIn ()
end
addEventHandler ( "onResourceStart", resourceRoot, serverstart )

setFPSLimit ( 65 )