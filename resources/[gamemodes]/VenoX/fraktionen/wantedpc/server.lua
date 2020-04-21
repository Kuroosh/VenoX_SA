addEvent("changePlayerValue", true)

local catalogdata = { ["wanted"] = {}, ["stvo"] = {} }

function changePlayerValueFunc(typ, player, value, executor, reason)
	if typ == "wanteds" then
		if getPlayerWantedLevel(getPlayerFromName(player))+value > 6 then
			setPlayerWantedLevel(getPlayerFromName(player), 6)
			vnxSetElementData(getPlayerFromName(player), "wanteds", 6)
			triggerClientEvent(executor, "refreshClientWantedList", getRootElement())
			outputChatBox("Dein Wantedlevel wurde von "..getPlayerName(executor).." auf "..getElementData(getPlayerFromName(player), "wanteds").." gesetzt. Grund: "..reason, getPlayerFromName(player), 255, 255, 0)
			local msg = "Spieler "..getPlayerName(executor).." hat das Wantedlevel von "..player.." auf "..getElementData(getPlayerFromName(player), "wanteds").." gesetzt. Grund: "..reason
				sendMSGForFaction ( msg, 1, 0, 125, 0 )
				sendMSGForFaction ( msg, 6, 0, 125, 0 )
				sendMSGForFaction ( msg, 8, 0, 125, 0 )
				outputLog( "[Wanteds]: "..getPlayerName(executor).." hat das Wantedlevel von "..player.." auf "..getElementData(getPlayerFromName(player), "wanteds").."gesetzt ( "..reason.." )!", "pd")
			return
		end
		if getPlayerWantedLevel(getPlayerFromName(player))+value < 1 then
			setPlayerWantedLevel(getPlayerFromName(player), 0)
			vnxSetElementData(getPlayerFromName(player), "wanteds", 0)
			triggerClientEvent(executor, "refreshClientWantedList", getRootElement())
			outputChatBox("Dein Wantedlevel wurde von "..getPlayerName(executor).." auf "..getElementData(getPlayerFromName(player), "wanteds").." gesetzt. Grund: "..reason, getPlayerFromName(player), 255, 255, 0)
			local msg = "Spieler "..getPlayerName(executor).." hat das Wantedlevel von "..player.." auf "..getElementData(getPlayerFromName(player), "wanteds").." gesetzt. Grund: "..reason
				sendMSGForFaction ( msg, 1, 0, 125, 0 )
				sendMSGForFaction ( msg, 6, 0, 125, 0 )
				sendMSGForFaction ( msg, 8, 0, 125, 0 )
				outputLog( "[Wanteds]: "..getPlayerName(executor).." hat das Wantedlevel von "..player.." auf "..getElementData(getPlayerFromName(player), "wanteds").." gesetzt ( "..reason.." )!", "pd")
			return
		end
		setPlayerWantedLevel(getPlayerFromName(player), getPlayerWantedLevel(getPlayerFromName(player)) + value)
		vnxSetElementData(getPlayerFromName(player), "wanteds", getPlayerWantedLevel(getPlayerFromName(player)))
		outputChatBox("Dein Wantedlevel wurde von "..getPlayerName(executor).." auf "..getElementData(getPlayerFromName(player), "wanteds").." gesetzt. Grund: "..reason, getPlayerFromName(player), 255, 255, 0)
			local msg = "Spieler "..getPlayerName(executor).." hat das Wantedlevel von "..player.." auf "..getElementData(getPlayerFromName(player), "wanteds").." gesetzt. Grund: "..reason
				sendMSGForFaction ( msg, 1, 0, 125, 0 )
				sendMSGForFaction ( msg, 6, 0, 125, 0 )
				sendMSGForFaction ( msg, 8, 0, 125, 0 )
				outputLog( "[Wanteds]: "..getPlayerName(executor).." hat das Wantedlevel von "..player.." auf "..getElementData(getPlayerFromName(player), "wanteds").." gesetzt ( "..reason.." )!", "pd")
	elseif typ == "stvo" then
		if vnxGetElementData(getPlayerFromName(player), "stvo_punkte")+value > 15 then
			vnxSetElementData(getPlayerFromName(player), "stvo_punkte", 15)
			triggerClientEvent(executor, "refreshClientWantedList", getRootElement())
			outputChatBox("Deine StVO-Punkte wurden von "..getPlayerName(executor).." auf "..getElementData(getPlayerFromName(player), "stvo_punkte").." gesetzt. Grund: "..reason, getPlayerFromName(player), 255, 255, 0)
			local msg = "Spieler "..getPlayerName(executor).." hast die StVO-Punkte von "..player.." auf "..getElementData(getPlayerFromName(player), "stvo_punkte").." gesetzt. Grund: "..reason
				sendMSGForFaction ( msg, 1, 0, 125, 0 )
				sendMSGForFaction ( msg, 6, 0, 125, 0 )
				sendMSGForFaction ( msg, 8, 0, 125, 0 )
				outputLog( "[StVO]: "..getPlayerName(executor).." hat die StVO-Punkte von "..player.." auf "..getElementData(getPlayerFromName(player), "stvo_punkte").." gesetzt. ("..reason..")", "pd")
			return
		end
		if vnxGetElementData(getPlayerFromName(player), "stvo_punkte")+value < 1 then
			vnxSetElementData(getPlayerFromName(player), "stvo_punkte", 0)
			triggerClientEvent(executor, "refreshClientWantedList", getRootElement())
			outputChatBox("Deine StVO-Punkte wurden von "..getPlayerName(executor).." auf "..getElementData(getPlayerFromName(player), "stvo_punkte").." gesetzt. Grund: "..reason, getPlayerFromName(player), 255, 255, 0)
			local msg = "Spieler "..getPlayerName(executor).." hast die StVO-Punkte von "..player.." auf "..getElementData(getPlayerFromName(player), "stvo_punkte").." gesetzt. Grund: "..reason
				sendMSGForFaction ( msg, 1, 0, 125, 0 )
				sendMSGForFaction ( msg, 6, 0, 125, 0 )
				sendMSGForFaction ( msg, 8, 0, 125, 0 )
				outputLog( "[StVO]: "..getPlayerName(executor).." hat die StVO-Punkte von "..player.." auf "..getElementData(getPlayerFromName(player), "stvo_punkte").." gesetzt. ("..reason..")", "pd")
			return
		end
		vnxSetElementData(getPlayerFromName(player), "stvo_punkte", getElementData(getPlayerFromName(player), "stvo_punkte") + value)
		outputChatBox("Deine StVO-Punkte wurden von "..getPlayerName(executor).." auf "..getElementData(getPlayerFromName(player), "stvo_punkte").." gesetzt. Grund: "..reason, getPlayerFromName(player), 255, 255, 0)
			local msg = "Spieler "..getPlayerName(executor).." hat die StVO-Punkte von "..player.." auf "..getElementData(getPlayerFromName(player), "stvo_punkte").." gesetzt. Grund: "..reason
				sendMSGForFaction ( msg, 1, 0, 125, 0 )
				sendMSGForFaction ( msg, 6, 0, 125, 0 )
				sendMSGForFaction ( msg, 8, 0, 125, 0 )
				outputLog( "[StVO]: "..getPlayerName(executor).." hat die StVO-Punkte von "..player.." auf "..getElementData(getPlayerFromName(player), "stvo_punkte").." gesetzt. ("..reason..")", "pd")
		
	end
	triggerClientEvent(executor, "refreshClientWantedList", getRootElement())
	--outputDebugString(getPlayerName(executor))
end
addEventHandler("changePlayerValue", getRootElement(), changePlayerValueFunc)



addEvent ( "syncDatShit", true )
addEventHandler ( "syncDatShit", getRootElement(), function ( )
	triggerLatentClientEvent ( client, "updateCatalog", 40000, false, client, catalogdata )
end )


addEventHandler ( "onResourceStart", resourceRoot, function ( )
	local result = dbPoll ( dbQuery ( handler, "SELECT * FROM WantedSTVOKatalog ORDER BY Anzahl" ), -1 )
	if result and result[1] then
		for i=1, #result do
			catalogdata[result[i]["TYP"]][#catalogdata[result[i]["TYP"]]+1] = { name = result[i]["Name"], amount = result[i]["Anzahl"] }
		end
	end
end )


addCommandHandler ( "refreshwtdpc", function ( player )
	catalogdata = { ["wanted"] = {}, ["stvo"] = {} }
	if vnxGetElementData ( player, "adminlvl" ) >= 3 then
		local result = dbPoll ( dbQuery ( handler, "SELECT * FROM WantedSTVOKatalog ORDER BY Anzahl" ), -1 )
		if result and result[1] then
			for i=1, #result do
				catalogdata[result[i]["TYP"]][#catalogdata[result[i]["TYP"]]+1]  = { name = result[i]["Name"], amount = result[i]["Anzahl"] }
			end
		end
		triggerLatentClientEvent ( "updateCatalog", 40000, false, player, catalogdata )
	end
end )



function updateCodesForClientFunc()
	--[[local qh = dbQuery( handler, "SELECT * FROM wc_codes ORDER BY nr ASC")
	local result, num_affected_rows, errmsg = dbPoll ( qh, -1 )
	if num_affected_rows > -1 then
		for result, row in pairs ( result ) do
			triggerClientEvent(source, "updateCodes", source, row["nr"], row["meaning"])
		end
	end]]
end
addEvent ( "updateCodesForClient", true )
addEventHandler ( "updateCodesForClient", getRootElement(), updateCodesForClientFunc )


function requestFileSaveFunc(player, text, editor)
	--[[if #text > 1 then
		local qh = dbQuery( handler, "SELECT * FROM wc_files WHERE player = ?", player)
		local result, num_affected_rows, errmsg = dbPoll ( qh, -1 )
		if num_affected_rows > 0 then
			for result, row in pairs ( result ) do
				if permission.canEditFile(getPlayerFromName(player)) then
					dbExec (handler, "UPDATE  wc_files SET text =  ?, editor = ? WHERE  player = ?;", text, editor, player)
				end
			end
		else
			if permission.canCreateFile(getPlayerFromName(player)) then
				dbExec( handler, "INSERT INTO wc_files (player, text, editor) VALUES (?,?,?);", player, text, editor)
			end
		end
	else
		if permission.canClearFile(getPlayerFromName(player)) then
			dbExec(handler, "DELETE FROM wc_files WHERE  player = ?;", player)
		end
	end
	triggerClientEvent(source, "fileRequestDone", getPlayerFromName(editor))]]
end
addEvent ("requestFileSave", true)
addEventHandler ("requestFileSave", getRootElement(), requestFileSaveFunc)


addEvent("requestPlayerFileForClient", true)
function requestPlayerFileForClientFunc(player)	
	--[[local qh = dbQuery( handler, "SELECT * FROM wc_files WHERE player = ?", player)
	local result, num_affected_rows, errmsg = dbPoll ( qh, -1 )
	
	if num_affected_rows > 0 then
		for result, row in pairs ( result ) do
			if permission.canViewFile(getPlayerFromName(player)) then
				triggerClientEvent(source, "updatePlayerFile", source, row["player"], row["text"], row["editor"], row["date"])
			end
		end
	else
		if permission.canViewFile(getPlayerFromName(player)) then
			triggerClientEvent(source, "updatePlayerFile", source, player, false)
		end
	end]]
end
addEventHandler("requestPlayerFileForClient", getRootElement(), requestPlayerFileForClientFunc)


addEvent("triggerMessageToServer", true)
function triggerMessageToServerFunc(msg)
	local rnd1, rnd2, rnd3 = math.random(0, 255), math.random(0, 255), math.random(0, 255)
	--outputChatBox("[POLIZEIFUNK] "..getPlayerName(source).." fordert folgendes an: "..msg, getRootElement(), rnd1, rnd2, rnd3)
	sendMSGForFaction ( "[POLIZEIFUNK] "..getPlayerName(source).." fordert folgendes an: "..msg, 1, rnd1, rnd2, rnd3)
	sendMSGForFaction ( "[POLIZEIFUNK] "..getPlayerName(source).." fordert folgendes an: "..msg, 6, rnd1, rnd2, rnd3)
	sendMSGForFaction ( "[POLIZEIFUNK] "..getPlayerName(source).." fordert folgendes an: "..msg, 8, rnd1, rnd2, rnd3)
	blip = createBlipAttachedTo(source, 0, 2, rnd1, rnd2, rnd3)
		setElementVisibleTo (blip, getRootElement(), false)
	if isArmy(source) or isOnStateDuty(source) then
		setElementVisibleTo (blip, source, true)
	end
	setTimer(destroyElement, 180000, 1, blip)
end
addEventHandler("triggerMessageToServer", getRootElement(), triggerMessageToServerFunc)

addEvent("triggerCodeToServer", true)
function triggerCodeToServerFunc(codeNr)
	--[[local qh = dbQuery( handler, "SELECT * FROM wc_codes WHERE  nr = ?", codeNr)
	local result, num_affected_rows, errmsg = dbPoll ( qh, -1 )
	
	if num_affected_rows == 1 then
		for result, row in pairs ( result ) do
			--outputChatBox("[POLIZEIFUNK] "..getPlayerName(source).." führt Code "..row["nr"].." aus: "..row["meaning"])
			sendMSGForFaction ( "[POLIZEIFUNK] "..getPlayerName(source).." führt Code "..row["nr"].." aus: "..row["meaning"], 1, 0, 125, 0 )
			sendMSGForFaction ( "[POLIZEIFUNK] "..getPlayerName(source).." führt Code "..row["nr"].." aus: "..row["meaning"], 6, 0, 125, 0 )
			sendMSGForFaction ( "[POLIZEIFUNK] "..getPlayerName(source).." führt Code "..row["nr"].." aus: "..row["meaning"], 8, 0, 125, 0 )
		end
	end]]
end
addEventHandler("triggerCodeToServer", getRootElement(), triggerCodeToServerFunc)


function triggerCodeFromCmd(player, cmd, codeNr)
	--[[if permission.canExecuteCode(player) then
		local qh = dbQuery( handler, "SELECT * FROM wc_codes WHERE nr = ?", codeNr)
		local result, num_affected_rows, errmsg = dbPoll ( qh, -1 )
		
		if num_affected_rows == 1 then
			for result, row in pairs ( result ) do
				--outputChatBox("[POLIZEIFUNK] "..getPlayerName(player).." führt Code "..row["nr"].." aus: "..row["meaning"])
				sendMSGForFaction ( "[POLIZEIFUNK] "..getPlayerName(player).." führt Code "..row["nr"].." aus: "..row["meaning"], 1, 0, 125, 0 )
				sendMSGForFaction ( "[POLIZEIFUNK] "..getPlayerName(player).." führt Code "..row["nr"].." aus: "..row["meaning"], 6, 0, 125, 0 )
				sendMSGForFaction ( "[POLIZEIFUNK] "..getPlayerName(player).." führt Code "..row["nr"].." aus: "..row["meaning"], 8, 0, 125, 0 )
			end
		end
	end]]
end
--addCommandHandler("code", triggerCodeFromCmd)




permission = {}
function permission.canExecuteCode(player)
	if isOnStateDuty(player) or isArmy (player) then
		return true
	else
		outputChatBox("Du bist kein Beamter im Dienst!", player, 255, 0, 0 )
		return false
	end
end

function permission.canEditFile(player)
	if isOnStateDuty(player) or isArmy (player) then
	if tonumber(vnxGetElementData(player, "rang")) >= 3 then
		return true
	else
		outputChatBox("Du hast nicht die erforderlichen Rechte!", player, 255, 0, 0 )
		return false
	end
end
end

function permission.canCreateFile(player)
	if isOnStateDuty(player) or isArmy (player) then
	if tonumber(vnxGetElementData(player, "rang")) >= 3 then
		return true
	else
		outputChatBox("Du hast nicht die erforderlichen Rechte!", player, 255, 0, 0 )
		return false
	end
end
end

function permission.canViewFile(player)
    if isOnStateDuty(player) or isArmy (player) then
	if tonumber(vnxGetElementData(player, "rang")) >= 1 then
		return true
	else
		outputChatBox("Du hast nicht die erforderlichen Rechte!", player, 255, 0, 0 )
		return false
	end
end
end

function permission.canClearFile(player)
    if isOnStateDuty(player) or isArmy (player) then
	if tonumber(vnxGetElementData(player, "rang")) >= 4 then
		return true
	else
		outputChatBox("Du hast nicht die erforderlichen Rechte!", player, 255, 0, 0 )
		return false
	end
end
end