--[[function retrieveTicketList ( typ )
	local player = client
	local admlvl = vnxGetElementData ( player, "adminlvl" )
	-- Schnellhilfe
	if admlvl >= 2 and typ == 1 then
		if next ( fastHelpTickets ) then
			triggerClientEvent ( player, "recieveTicketList", player, 1, fastHelpTickets )
		else
			triggerClientEvent ( player, "thereAreNoTickets", player )
		end
	-- Anfragen & Fragen
	elseif ( typ == 2 and admlvl >= 2 ) or ( admlvl >= 2 and typ == 3 ) then
		local tickets = {}
		local result = dbPoll ( dbQuery ( handler, "SELECT name FROM tickets WHERE kathegory = '"..typ.."' ORDER BY date ASC LIMIT 10" ), -1 )
		if result[1] then
			for i = 1, #result do
				tickets[result[i]["name" = result[i]["name"]
			end
			triggerClientEvent ( player, "recieveTicketList", player, 2, tickets )
		else
			triggerClientEvent ( player, "thereAreNoTickets", player )
		end
	end
end
addEvent ( "retrieveTicketList", true )
addEventHandler ( "retrieveTicketList", getRootElement(), retrieveTicketList )



function orderSupportTicket ( kathegory, text )
	local player = client
	local pname = getPlayerName ( player )
	local kathegory = math.abs ( math.floor ( tonumber ( kathegory ) ) )
	-- Zeitbeschränkung ( 3 Mins )
	if not recentSupportRequests[pname] then
		-- Anzahl-Beschränkung ( Immer nur ein offenes Ticket erlaubt )
		if not fastHelpTicketSenders[pname] then
			local someoneRecievedTheMessage = false
			
			outputLog ( "------------------\nNeues Ticket von "..pname..":\n"..text, "support_questions" )
			
			if kathegory == 1 then		-- Fast help
				for admin, rank in pairs ( adminsIngame ) do
					if rank >= 2 then
						outputChatBox ( pname.." braucht schnelle Hilfe!", admin, 100, 100, 255 )
						someoneRecievedTheMessage = true
					end
				end
				if someoneRecievedTheMessage then
					fastHelpTicketSenders[pname] = pname
				end
			elseif kathegory == 2 then	-- Questions
				for admin, rank in pairs ( adminsIngame ) do
					if rank >= 2 then
						outputChatBox ( pname.." hat eine Frage gestellt!", admin, 100, 100, 255 )
						someoneRecievedTheMessage = true
					end
				end
			elseif kathegory == 3 then	-- Request
				for admin, rank in pairs ( adminsIngame ) do
					if rank >= 2 then
						outputChatBox ( "Neue Anfrage von "..pname.."!", admin, 100, 100, 255 )
						someoneRecievedTheMessage = true
					end
				end
			end
			
			if someoneRecievedTheMessage then
				outputChatBox ( "Deine Anfrage wurde entgegen genommen! Du wirst informiert, wenn sie bearbeitet wurde.", player, 200, 0, 0 )
			else
				if kathegory == 1 then
					outputChatBox ( "Im Moment niemand online, der deine Anfrage bearbeiten kann.", player, 200, 0, 0 )
					outputChatBox ( "Um zu sehen, wer online ist, tippe /admins", player, 200, 0, 0 )
					return true
				else
					outputChatBox ( "Deine Anfrage wurde entgegen genommen, jedoch ist im Moment niemand online,", player, 200, 0, 0 )
					outputChatBox ( "der sie bearbeiten kann. Du wirst jedoch informiert, wenn sie bearbeitet wurde.", player, 200, 0, 0 )
				end
			end
			if kathegory == 1 then
				local ticket = { ["name"] = pname, ["text"] = text }
				table.insert ( fastHelpTickets, ticket )
			else
				dbExec ( handler, "INSERT INTO tickets ( UID, kathegory, text ) VALUES (?,?,?)", playerUID[pname], kathegory, text )
			end
			recentSupportRequests[pname] = true
			setTimer (
				function ( name )
					recentSupportRequests[name] = false
				end,
			3 * 60 * 1000, 1, pname )
		else
			local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "UID", "ticket_answeres", "UID", playerUID[pname] ), -1 )
			if result and result[1] then
				outputChatBox ( "Du hast noch eine ausstehende Antwort! Tippe /readticket, um sie zu lesen!", player, 200, 0, 0 )
			else
				outputChatBox ( "Es existiert bereits eine Anfrage von dir!", player, 200, 0, 0 )
			end
		end
	else
		outputChatBox ( "Du hast vor kurzem bereits eine Anfrage gestellt!", player, 200, 0, 0 )
	end
end
addEvent ( "orderSupportTicket", true )
addEventHandler ( "orderSupportTicket", getRootElement (), orderSupportTicket )


function readticket_func ( player )
	local pname = getPlayerName ( player )
	local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "text",  "admin", "ticket_answeres", "UID", playerUID[pname] ), -1 )
	if result and result[1] then
		local text = result[1]["text"]
		if text then
			local admin = result[1]["admin"]
			triggerClientEvent ( player, "readTicketAnswere", player, text, admin )
			dbExec ( handler, "DELETE FROM ticket_answeres WHERE UID=?", playerUID[pname] )
		else
			outputChatBox ( "Du hast keine Antwort auf ein Ticket!", player, 200, 0, 0 )
		end
	else
		outputChatBox ( "Du hast keine Antwort auf ein Ticket!", player, 200, 0, 0 )
	end
end
addCommandHandler ( "readticket", readticket_func )



function recieveTicketDetails ( name )

	local player = client
	if vnxGetElementData ( player, "adminlvl" ) >= 2 or ticketPermitted[player] then
		local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "text", "tickets", "UID", playerUID[name] ), -1 )
		if not result or not result[1] then
			for key, index in pairs ( fastHelpTickets ) do
				if index["name"] == name then
					text = index["text"]
					break
				end
			end
		end
		triggerClientEvent ( player, "recieveTicketDetails", player, text )
	end
end
addEvent ( "recieveTicketDetails", true )
addEventHandler ( "recieveTicketDetails", getRootElement (), recieveTicketDetails )

function ticketDone ( name, action, answere )

	local player = client
	local answere = answere
	local supporter = getPlayerName ( player )
	if ticketPermitted[player] or vnxGetElementData ( player, "adminlvl" ) >= 2 then
		-- Nachricht senden
		if action == 0 then
			answere = "Dein Ticket wurde ohne Begründung geschlossen."
		else
			outputChatBox ( "Antwort gesendet!", player, 0, 200, 0 )
		end
		outputLog ( "Antwort von "..supporter.." auf das Ticket von "..name.." geantwortet:\n"..answere )
		dbExec ( handler, "INSERT INTO ticket_answeres ( UID, adminUID, text ) VALUES (?,?,?)", playerUID[name], playerUID[supporter], answere )
		local otherplayer = getPlayerFromName ( name ) 
		if otherplayer then
			outputChatBox ( "Deine Anfrage wurde bearbeitet. Tippe /readticket, um die Antwort zu lesen.", otherplayer, 200, 200, 0 )
		else
			offlinemsg ( "Dein Ticket wurde bearbeitet.", "Report-System", name )
		end
		-- Ticket löschen, falls es nur lokal ist
		if fastHelpTicketSenders[name] then
			for key, index in pairs ( fastHelpTickets ) do
				if index["name"] == name then
					fastHelpTickets[key] = nil
					fastHelpTicketSenders[name] = nil
					break
				end
			end
		end
		-- Ticket schließen
		dbExec ( handler, "DELETE FROM tickets WHERE UID=?", playerUID[name] )
		outputChatBox ( "Ticket geschlossen.", player, 200, 200, 0 )
	end
end
addEvent ( "ticketDone", true )
addEventHandler ( "ticketDone", getRootElement (), ticketDone )


addCommandHandler("hilfe", function(player)
	if isElement(player) then
		local us = {}
		local result = dbPoll ( dbQuery ( handler, "SELECT * FROM ticketsystem WHERE UID = ?", playerUID[getPlayerName(player)] ), -1 )

		if result then
			if result[1] then	
				for i=1, #result do
					us[i] = {id = result[i]["id"], reason = result[i]["reason"], datetime = result[i]["date"], text = result[i]["text"], category = result[i]["category"], state = result[i]["state"]}
				end
			end
		end
		triggerClientEvent(player, "doUserTickets", player, us)
	end
end)

addCommandHandler("tickets", function(player)
	if vnxGetElementData ( player, "adminlvl") >= 2 then
		local usr = {}
		
		local result = dbPoll ( dbQuery ( handler, "SELECT * FROM ticketsystem"), -1 )
		
		if result then
			if result[1] then	
				for i=1, #result do
					usr[i] = {id = result[i]["id"], reason = result[i]["reason"], datetime = result[i]["date"], text = result[i]["text"], category = result[i]["category"], state = result[i]["state"]}
				end
			end
		end
		triggerClientEvent(player, "doAdminTickets", player, usr)
	end
end)


addEvent("doSendTicket", true)
addEventHandler("doSendTicket", root, function(reason, text, category)
	local time 		   = getRealTime()
	local tmonth, tday 
	
	if time.monthday < 10 then
		tday = '0'..time.monthday
	else
		tday = time.monthday
	end
	if time.month < 10 then
		tmonth = '0'..time.month
	else
		tmonth = time.month
	end
	
	local ticket_time = tday..'.'..tmonth..'.'..time.year+1900
	local result2 = dbExec ( handler, "INSERT INTO `ticketsystem`(`UID`, `reason`, `text`, `date`, `category`, `state`) VALUES (?,?,?,?,?,?)", playerUID[getPlayerName(client)], reason, text, ticket_time, category,'Open' )
			
	if result2 then
		for key, index in pairs(adminsIngame) do
			if index >= 2 then
				outputChatBox("Neues Ticket!", key, 255, 255, 0);
			end
		end
		outputChatBox('Ticket wurde erstellt. Bitte überprüfe regelmäßig dein Ticket per /report auf Antworten.', client, 255, 255, 0);
	end
end)

addEvent("doDeleteTicket", true)
addEventHandler("doDeleteTicket", root, function(id)
	local ticket_query = dbExec ( handler, "DELETE FROM `ticketsystem` WHERE id=?", id )
	if(ticket_query)then
		outputChatBox("Ticket wurde gelöscht!", client, 255, 0, 0)
	end
end)

addEvent("doReplyTicket", true)
addEventHandler("doReplyTicket", root, function(retext, reid)

	local query = dbExec ( handler, "UPDATE ticketsystem SET ?? = ?, ?? = ? WHERE id = ?", "text", retext, "state", "Open", tonumber(reid) )
	
	if(query)then
		
		local query2 = dbPoll ( dbQuery ( handler, "SELECT UID FROM ticketsystem WHERE id = '"..tonumber(reid).."'"), -1 )
			
		if query2 and query2[1] then
			local row = query2[1]
			local targetname = playerUIDName[tonumber(row["UID"])]
			
			if targetname == getPlayerName(client) then
				outputChatBox("Du hast auf dein Ticket geantwortet!", client, 0, 125, 0)
				for key, index in pairs(adminsIngame) do
					if index >= 2 then
						outputChatBox ( targetname .. " hat auf sein Ticket "..reid.." geantwortet!", key, 0,200,255 )
					end
				end		
			else
				outputChatBox("Du hast auf das Ticket geantwortet!", client, 0, 125, 0)
				if getPlayerFromName(targetname) then
					outputChatBox("Dein Ticket wurde beantwortet!", getPlayerFromName(targetname), 0, 200, 255)
				else
					offlinemsg ( "Während deiner Abwesendheit wurde dein Ticket beantwortet!", "Report-System", targetname )
				end
			end
		end
	end
end)


addEvent("doReplyTicketClose", true)
addEventHandler("doReplyTicketClose", root, function(retext, reid)

	local query = dbExec ( handler, "UPDATE ticketsystem SET ??=?, ??=? WHERE id = ?", "text", retext, "state", "Close", tonumber ( reid ) )
	
	if(query)then
		outputChatBox("Du hast auf das Ticket geantwortet und es geschlossen!", client, 0, 125, 0);
	end
end)

addEvent("doTicketClose", true)
addEventHandler("doTicketClose", root, function(reid)

	local query = dbExec ( handler, "UPDATE `ticketsystem` SET ?? = ? WHERE id = ?", "state", "Close", tonumber(reid))
	
	if(query)then
		outputChatBox("Du hast das Ticket geschlossen!", client, 125, 0, 0);
	end
end)
]]