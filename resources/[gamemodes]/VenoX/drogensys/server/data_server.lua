function loadAddictionsForPlayer ( player )

	local pname = getPlayerName ( player )
	local result = dbPoll ( dbQuery ( handler, "SELECT ??, ?? FROM ?? WHERE ??=?", "Rausch", "Sucht", "userdata", "UID", playerUID[pname] ), -1 )
	if result and result[1] then
		local dataString1 = result[1]["Rausch"]
		local dataString2 = result[1]["Sucht"]
		
		local cigarettFlushPoints = tonumber ( gettok ( dataString1, 1, string.byte ( '|' ) ) )
		local alcoholFlushPoints = tonumber ( gettok ( dataString1, 2, string.byte ( '|' ) ) )
		local drugFlushPoints = tonumber ( gettok ( dataString1, 3, string.byte ( '|' ) ) )
		
		local cigarettAddictPoints = tonumber ( gettok ( dataString2, 1, string.byte ( '|' ) ) )
		local alcoholAddictPoints = tonumber ( gettok ( dataString2, 2, string.byte ( '|' ) ) )
		local drugAddictPoints = tonumber ( gettok ( dataString2, 3, string.byte ( '|' ) ) )
		
		vnxSetElementData ( player, "cigarettFlushPoints", cigarettFlushPoints )
		vnxSetElementData ( player, "alcoholFlushPoints", alcoholFlushPoints )
		vnxSetElementData ( player, "drugFlushPoints", drugFlushPoints )

		vnxSetElementData ( player, "cigarettAddictPoints", cigarettAddictPoints )
		vnxSetElementData ( player, "alcoholAddictPoints", alcoholAddictPoints )
		vnxSetElementData ( player, "drugAddictPoints", drugAddictPoints )
	end
end

function saveAddictionsForPlayer ( player )

	local pname = getPlayerName ( player )
	
	local dataString1 = vnxGetElementData ( player, "cigarettFlushPoints" ).."|"..vnxGetElementData ( player, "alcoholFlushPoints" ).."|"..vnxGetElementData ( player, "drugFlushPoints" ).."|"
	local dataString2 = vnxGetElementData ( player, "cigarettAddictPoints" ).."|"..vnxGetElementData ( player, "alcoholAddictPoints" ).."|"..vnxGetElementData ( player, "drugAddictPoints" ).."|"
	
	dbExec ( handler, "UPDATE ?? SET ??=?, ??=? WHERE ??=?", "userdata", "Rausch", dataString1, "Sucht", dataString2, "UID", playerUID[pname] )
end