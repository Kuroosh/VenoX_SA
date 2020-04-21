function timebanPlayer ( pname, time, admin, reason )

	local player = getPlayerFromName ( pname )
	
	if playerUID[pname] then
	
		local sec = getTBanSecTime ( time )
		local serial = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Serial", "players", "UID", playerUID[pname] ), -1 )[1]["Serial"]
		
		dbExec ( handler, "INSERT INTO ?? (??, ??, ??, ??, ??, ??, ??) VALUES (?,?,?,?,?,?,?)", "ban", "UID", "AdminUID", "Grund", "Datum", "IP", "Serial", "STime", playerUID[pname], playerUID[admin], reason, timestamp(), '0.0.0.0', serial, sec )
		outputChatBox ("Spieler "..pname.." wurde von "..admin.." fuer "..time.." Stunden gebannt! (Grund: "..tostring(reason)..")",getRootElement(),255,0,0)
		
		if isElement(player) then
	
			kickPlayer ( player, "Du wurdest fuer "..time.." Stunden von "..admin.." gebannt! ( "..reason..")" )
		
		end
		
		return true
		
	end	
	
	return false
	
end


function getTBanSecTime ( duration )

	return getSecTime ( duration )
end