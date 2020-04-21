blacklistPlayers = {}
 blacklistPlayers[2] = {}
 blacklistPlayers[3] = {}
 blacklistPlayers[7] = {}
 blacklistPlayers[9] = {}
 blacklistPlayers[12] = {}
 blacklistPlayers[13] = {}
 
blacklistReason = {}
 blacklistReason[2] = {}
 blacklistReason[3] = {}
 blacklistReason[7] = {}
 blacklistReason[9] = {}
 blacklistReason[12] = {}
 blacklistReason[13] = {}

local playersAddetToBlacklist = {}
for i = 1, 13 do
	playersAddetToBlacklist[i] = {}
end

validBlackListFactions = {
 [2]=true,
 [3]=true,
 [7]=true,
 [9]=true,
 [12]=true,
 [13]=true
 }

factionBlackListGuns = {
 [2]=26,
 [3]=8,
 [7]=18,
 [9]=28,
 [12]=32,
 [13]=32
}


function blacklistLogin ( pname )
	local player = getPlayerFromName(pname)
	local frac = vnxGetElementData ( player, "fraktion" )
	local result = dbPoll ( dbQuery ( handler, "SELECT * FROM blacklist WHERE UID = ?", playerUID[pname] ), -1 )
	if result and result[1] then
		if frac == 0 then
			for i=1, #result do
				local fraktion = tonumber ( result[i]["Fraktion"] )
				blacklistPlayers[fraktion][pname] = true
				blacklistReason[fraktion][pname] = result[i]["Grund"]
				for playeritem, _ in pairs ( fraktionMembers[fraktion] ) do
					triggerClientEvent ( playeritem, "playerInBlacklistJoined", playeritem, pname )
				end
			end
		else
			dbExec ( handler, "DELETE FROM ?? WHERE ??=?", "blacklist", "UID", playerUID[pname] )
		end		
	end
	if validBlackListFactions[frac] then
		triggerClientEvent ( player, "triggeredBlacklist", player, blacklistPlayers[frac] )
	end
end


function blackListKillCheck ( player, killer, weapon )
	local killerFaction = vnxGetElementData ( killer, "fraktion" )
	local name = getPlayerName ( player )
	if validBlackListFactions[killerFaction] then
		if blacklistPlayers[killerFaction][name] then
			local prizeMoney = 200
			local prizeText = "Du erhälst 200 $"
			if factionBlackListGuns[killerFaction] == weapon then
				prizeText = prizeText.." + 100 $ wegen der verwendeten Waffe."
				prizeMoney = prizeMoney + 100
			else
				prizeText = prizeText.."."
			end
			blacklistPlayers[killerFaction][name] = nil
			blacklistReason[killerFaction][name] = nil
			dbExec ( handler, "DELETE FROM ?? WHERE ??=? AND ??=?", "blacklist", "UID", playerUID[name], "Fraktion", killerFaction )
			for playeritem, _ in pairs ( fraktionMembers[killerFaction] ) do
				triggerClientEvent ( playeritem, "playerInBlacklistDied", playeritem, name )
			end
			givePlayerSaveMoney ( killer, prizeMoney )
			outputChatBox ( "Du wurdest von einem Fraktionsmitglied erledigt, weil du auf der Blacklist warst.", player, 200, 0, 0 )
			outputChatBox ( "Du hast jemanden von der Blacklist erledigt!", killer, 0, 200, 0 )
			outputChatBox ( prizeText, killer, 0, 200, 0 )
		end
	end
end


function blacklist_func ( player, cmd, add, target, ... )
	if not add then
		infobox ( player, "Gebrauch:\n/blacklist\n[add/delete/show] [Name]!", 5000, 125, 0, 0 )
	else
		if validBlackListFactions[vnxGetElementData ( player, "fraktion" )] then
			if add == "add" then
				local parametersTable = {...}
				local text = table.concat( parametersTable, " " )
				
				if text == nil then
					outputChatBox ( "Gebrauch: /blacklist add Name Grund", player, 255, 0, 0 )
				else
					addBlacklist_func ( player, target, text )			
				end				
			elseif add == "delete" then
				blacklistdelete_func ( player, target )
			elseif add == "show" then
				showblacklist_func ( player )
			else
				infobox ( player, "Gebrauch:\n/blacklist [add/delete\n/show] [Name]!", 5000, 125, 0, 0 )
			end
		else
			infobox ( player, "\nDu bist in\neiner ungültigen\nFraktion!", 5000, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "blacklist", blacklist_func )


function blacklistdelete_func ( player, name )
	if name then
		local fraktion = vnxGetElementData ( player, "fraktion" )
		if blacklistPlayers[fraktion][name] then
			blacklistPlayers[fraktion][name] = nil
			blacklistReason[fraktion][name] = nil
			dbExec ( handler, "DELETE FROM ?? WHERE ??=? AND ??=?", "blacklist", "UID", playerUID[name], "Fraktion", fraktion )
			sendMSGForFaction ( getPlayerName(player).." hat "..name.." aus der Blacklist gelöscht.", fraktion, 0, 125, 0 )
			local target = getPlayerFromName ( name )
			if isElement ( target ) then
				outputChatBox ( "Du wurdest aus die Blacklist der "..fraktionNames[fraktion].." entfernt.", target, 0, 200, 0 )
			end
			for playeritem, _ in pairs ( fraktionMembers[fraktion] ) do
				triggerClientEvent ( playeritem, "playerInBlacklistDied", playeritem, name )
			end
		else
			infobox ( player, "Der Spieler ist\nnicht auf\nder Blacklist!", 4000, 200, 0, 0 )
		end
	else
		infobox ( player, "Gebrauch:\nblacklist delete\n[Name]", 4000, 200, 0, 0 )
	end
end


function showblacklist_func ( player )
	local fraktion = vnxGetElementData ( player, "fraktion" )
	if blacklistPlayers[fraktion] then
		outputChatBox ( "Spieler auf der Blacklist:", player, 200, 200, 0 )
		outputChatBox ( "__________________________", player, 200, 200, 0 )
		for key, index in pairs ( blacklistPlayers[fraktion] ) do
			if getPlayerFromName ( key ) then
				outputChatBox ( key ..": "..blacklistReason[fraktion][key], player, 200, 200, 0 )
				outputChatBox ( "__________________________", player, 200, 200, 0 )
			else
				blacklistPlayers[fraktion][key] = nil
				blacklistReason[fraktion][key] = nil
			end
		end
	else
		outputChatBox ( "Du bist in einer ungültigen Fraktion!", player, 125, 0, 0 )
	end
end


function addBlacklist_func ( player, member, text )
	if member and text then
		local pname = getPlayerName ( player )
		local target = getPlayerFromName ( member )
		if target then
			local fraktion = vnxGetElementData ( player, "fraktion" )
			if vnxGetElementData ( player, "rang" ) >= 2 then
				if blacklistPlayers[fraktion][member] then
					infobox ( player, "\n\nDer Spieler ist\nbereits auf\nder Blacklist!", 5000, 125, 0, 0 )
				else
					if vnxGetElementData ( target, "fraktion" ) == 0 then
						if not playersAddetToBlacklist[fraktion][member] then
							playersAddetToBlacklist[fraktion][member] = true
							dbExec ( handler, "INSERT INTO ?? ( ??, ??, ??, ??, ?? ) VALUES (?,?,?,?,?)", "blacklist", "UID", "EintraegerUID", "Fraktion", "Grund", "Eintragungsdatum", playerUID[member], playerUID[pname], fraktion, text, getSecTime ( 0 ) )
							infobox ( player, "\nDu hast den\nSpieler auf die\nBlacklist gesetzt!", 5000, 125, 0, 0 )
							outputChatBox ( "Du wurdest auf die Blacklist der "..fraktionNames[fraktion].." gesetzt. Grund: "..text, target, 255, 0, 0 )
							blacklistPlayers[fraktion][member] = true
							blacklistReason[fraktion][member] = text
							for playeritem, _ in pairs ( fraktionMembers[fraktion] ) do
								triggerClientEvent ( playeritem, "playerInBlacklistJoined", playeritem, member )
							end
						else
							infobox ( player, "\n\nDer Spieler war heute bereits auf der Blacklist deiner Fraktion!", 5000, 125, 0, 0 )
						end
					else
						infobox ( player, "\n\nDer Spieler ist\nkein Zivilist!", 5000, 125, 0, 0 )
					end
				end
			else
				infobox ( player, "\n\nDu bist nicht\nbefugt!", 5000, 125, 0, 0 )
			end
		else
			infobox ( player, "\n\nDer Spieler ist\nnicht online!", 5000, 125, 0, 0 )
		end
	else
		infobox ( player, "Gebrauch:\n/blacklist add\n[Name] [Grund!", 5000, 125, 0, 0 )
	end
end


function getBlacklistGrund ( pname, fraktion )
	local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=? AND ??=?", "Grund", "blacklist", "UID", playerUID[pname], "Fraktion", fraktion ), -1 )
	if result and result[1] then
		return result[1]["Grund"]
	end
	return false
end