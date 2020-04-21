specMailAdresses = { ["admin@ltr.net"]=true, ["admin@bund.net"]=true,
["admin@triaden.de"]=true,
["admin@ltr.de"]=true,
["admin@sfpd.de"]=true,
["admin@mafia.de"]=true,
["admin@fbi.de"]=true,
["admin@army.de"]=true }


function sendMail_func ( text, betreff, to )
	local to = to
	local exists = false
	if specMailAdresses [ string.lower ( to ) ] then
		exists = true
	else
		to = gettok ( to, 1, string.byte ( '@' ) )
		if to then
			local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "UID", "players", "UID", playerUID[to] ), -1 )
			if result and result[1] then
				exists = true
			else
				exists = false
			end
		else
			exists = false
		end
	end
	if exists then
		local mail = tostring ( getPlayerName(client).."@venox.com"..betreff.."|"..timestamp()..": "..text )
		outputChatBox ( "E-Mail gesendet!", client, 0, 125, 0 )
		local time = getRealTime()
		local y = time.year
		local yd = time.yearday
			
		local result = dbExec ( handler, "INSERT INTO ?? (??, ??, ??, ??) VALUES (?,?,?,?)", "email", "UID", "Text", "Yearday", "Year", playerUID[to], mail, yd, y )
		if not result then
			outputDebugString ( "[sendMail_func] Error executing the query" )
		end
		if isElement ( getPlayerFromName ( to ) ) and vnxGetElementData ( getPlayerFromName ( to ), "loggedin" ) == 1 then
			getMailsForClient_func ( to )
		end
	else
		outputChatBox ( "Ungueltige Eingabe, bitte verwende folgende Eingabe: [Name@venox.com]", client, 125, 0, 0 )
	end
end
addEvent ( "sendMail", true )
addEventHandler ( "sendMail", getRootElement(), sendMail_func )


function getMailsForClient_func ( pname )
	local result = dbPoll ( dbQuery ( handler, "SELECT Text FROM email WHERE EmpfaengerUID = '"..playerUID[pname].."'" ), -1 )
	local player = getPlayerFromName ( pname )
	if result then
		if result[1] then
			for i=1, #result do
				triggerClientEvent ( player, "reciveMail", player, result[i]["Text"] )
				outputDebugString ( "Empfaenger LIKE "..pname.." AND Text LIKE "..result[i]["Text"] )
			end
		end
	else
		outputDebugString ( "[getMailsForClient_func] Error executing the query" )
	end
	dbExec ( handler, "DELETE FROM ?? WHERE ??=?", "email", "EmpfaengerUID", playerUID[pname] )
end


function buyItSendMail ( to, text )
	local mail = tostring ( "info@BuyIt.com|Auktion|"..timestamp()..": Du wurdest von "..getPlayerName ( player ).." überboten!" )

	local time = getRealTime()
	local y = time.year + 1900
	local yd = time.yearday
	
	local result = dbExec ( handler, "INSERT INTO ?? (??, ??, ??, ??) VALUES (?,?,?,?)", "email", "UID", "Text", "Yearday", "Year", playerUID[to], mail, yd, y )
	if not result then
		outputDebugString ( "[buyItSendMail] Error executing the query" )
	end
end


function isMailingDateOld ( yd, y )
	local time = getRealTime()
	local year = time.year
	local yearday = time.yearday
	local tCurTime = time.year * 365 + time.yearday
	local tMailTime = y * 365 + y
	local tDiff = tCurTime - tMailTime
	if tDiff >= 10 then
		return true
	end
	return false
end
