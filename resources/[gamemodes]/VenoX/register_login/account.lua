tablesToMoveOver = {
 ["achievments"] = true,
 ["bonustable"] = true,
 ["inventar"] = true,
 ["packages"] = true,
 ["players"] = true,
 ["userdata"] = true,
 ["gunlicense"] = true,
 ["skills"] = true
 }

pnameColumn = {
 }

fieldDatas = {}
fieldNames = {}


function isRegistered ( pname )
	if playerUID[pname] then
		return true
	else
		local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ?? LIKE ?", "Erlaubnis", "players", "Serial", getPlayerSerial ( getPlayerFromName ( pname ) ) ), -1 )
		if result and result[1] then
			local erlaubnis = tonumber ( result[1]["Erlaubnis"] )
			if erlaubnis == 0 then
				return true
			end
		end
	end
	return false
end
	


function newpw_func ( player, cmd, newPW, newPWCheck )
	local pname = getPlayerName ( player )
	if vnxGetElementData ( player, "loggedin" ) == 1 then
		if newPW and newPWCheck then
			if newPWCheck == newPW then
				dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "players", "Passwort", hash ( "sha512", hash ( "sha512", newPW ) ), "UID", playerUID[pname] )
				outputChatBox ( "Passwort geändert!", player, 0, 125, 0 )
				outputLog ( getPlayerName ( player ).." ( IP: "..getPlayerIP ( player )..", Serial: "..getPlayerSerial ( player ).." ) hat sein Passwort geändert.", "pwchange" )
			else
				outputChatBox ( "Die beiden Passwörter muessen identisch sein!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Fehler: Ungültige Eingabe, bitte verwende folgendes: /newpw [Neues Password] [Neues Password]", player, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "newpw", newpw_func )
addEvent ( "newPW", true )
addEventHandler ( "newPW", getRootElement(), 
	function ( pw1, pw2 )
		newpw_func ( client, "", pw1, pw2 )
	end
)