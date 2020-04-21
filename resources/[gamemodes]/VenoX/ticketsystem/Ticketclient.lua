--[[local ticketID = 0

Ticketwindow = guiCreateWindow(0.33, 0.32, 0.33, 0.43, "Ticketsystem VenoX Reallife Reallife", true)
guiWindowSetMovable(Ticketwindow, false)
guiWindowSetSizable(Ticketwindow, false)

TicketreasonEdit = guiCreateEdit(0.03, 0.14, 0.38, 0.11, "Betreffzeile", true, Ticketwindow)
Ticketlabel1 = guiCreateLabel(0.04, 0.09, 0.32, 0.04, "Ticket erstellen", true, Ticketwindow)
guiSetFont(Ticketlabel1, "default-bold-small")
guiLabelSetColor(Ticketlabel1, 255, 0, 0)
guiLabelSetHorizontalAlign(Ticketlabel1, "center", false)
TickettextEdit = guiCreateMemo(0.03, 0.26, 0.38, 0.49, "...", true, Ticketwindow)
Ticketlabel2 = guiCreateLabel(0.03, 0.77, 0.11, 0.03, "Kategorie", true, Ticketwindow)
guiSetFont(Ticketlabel2, "default-bold-small")
Ticketcombobox = guiCreateComboBox(0.03, 0.81, 0.26, 0.15, "Fragen", true, Ticketwindow)
TicketASKUserCombo     = guiComboBoxAddItem(Ticketcombobox, "Fragen")
TicketSupportUserCombo = guiComboBoxAddItem(Ticketcombobox, "Support - Hilfe")
TicketsendButton = guiCreateButton(0.32, 0.81, 0.09, 0.06, "->", true, Ticketwindow)
TicketopenButton = guiCreateButton(0.48, 0.78, 0.51, 0.07, "Ticket öffnen", true, Ticketwindow)
TicketcloseandDeleteButton = guiCreateButton(0.48, 0.86, 0.51, 0.07, "Ticket Schließen + Löschen", true, Ticketwindow)
TicketcloseButton = guiCreateButton(0.90, 0.06, 0.07, 0.07, "X", true, Ticketwindow)
guiSetFont(TicketcloseButton, "default-bold-small")
guiSetProperty(TicketcloseButton, "NormalTextColour", "FFFF0707")
Ticketgridlist = guiCreateGridList(0.47, 0.14, 0.51, 0.62, true, Ticketwindow)
TicketUserColumnID = guiGridListAddColumn(Ticketgridlist, "ID", 0.2)
TicketUserColumnRE = guiGridListAddColumn(Ticketgridlist, "Betreff", 0.3)
TicketUserColumnKA = guiGridListAddColumn(Ticketgridlist, "Kategorie", 0.3)
TicketUserColumnDE = guiGridListAddColumn(Ticketgridlist, "Datum", 0.3)
TicketUserColumnST = guiGridListAddColumn(Ticketgridlist, "Status", 0.2)
guiSetFont(Ticketgridlist, "default-small");

guiSetVisible(Ticketwindow, false);




-- TICKETSYSTEM GUI OPEN --

TicketopenWindow = guiCreateWindow(0.34, 0.35, 0.28, 0.41, "Ticketsystem", true)
guiWindowSetMovable(TicketopenWindow, false)
guiWindowSetSizable(TicketopenWindow, false)

TicketopenEditReason = guiCreateEdit(0.02, 0.08, 0.96, 0.09, "...", true, TicketopenWindow)
guiEditSetReadOnly(TicketopenEditReason, true)
TicketsystemOpenmemo = guiCreateMemo(0.02, 0.17, 0.96, 0.37, "...", true, TicketopenWindow)
guiMemoSetReadOnly(TicketsystemOpenmemo, true)
TicketsystemOpenASKMemo = guiCreateMemo(0.02, 0.57, 0.96, 0.27, "Der Text zum Antworten", true, TicketopenWindow)
TicketopenAntwortenButton = guiCreateButton(0.03, 0.86, 0.42, 0.11, "Antworten", true, TicketopenWindow)
TicketopenCloseButton = guiCreateButton(0.55, 0.86, 0.42, 0.11, "Fenster Schließen", true, TicketopenWindow)

guiSetVisible(TicketopenWindow, false)


function UserloadTicketsystem(usertickets)
	
	
	if not guiGetVisible(Ticketwindow) then
		showCursor(true)
		guiSetInputMode("no_binds")
		setElementClicked ( true )
		guiGridListClear(Ticketgridlist);
		guiSetVisible(Ticketwindow, true);
		
		
		if(usertickets and #usertickets > 0)then
			for _, data in pairs(usertickets) do 
		
				local addrow = guiGridListAddRow(Ticketgridlist);
				guiGridListSetItemText(Ticketgridlist, addrow, TicketUserColumnID, tostring ( data.id ), false, false)
				guiGridListSetItemText(Ticketgridlist, addrow, TicketUserColumnRE, tostring ( data.reason ), false, false)
				guiGridListSetItemText(Ticketgridlist, addrow, TicketUserColumnKA, tostring ( data.category ), false, false)
				guiGridListSetItemText(Ticketgridlist, addrow, TicketUserColumnDE, tostring ( data.datetime ), false, false)
				guiGridListSetItemText(Ticketgridlist, addrow, TicketUserColumnST, tostring ( data.state ), false, false)
				
				guiGridListSetItemData(Ticketgridlist, addrow, TicketUserColumnID, data.text)
				
				if(data.state == "Close")then
					guiGridListSetItemColor ( Ticketgridlist, addrow, TicketUserColumnST, 255, 0, 0)
				else
					guiGridListSetItemColor ( Ticketgridlist, addrow, TicketUserColumnST, 0, 255, 0)
				end
			end
		end
	else
		showCursor(false)
		setElementClicked(false)
		guiSetVisible(Ticketwindow, false);
		guiSetInputMode("allow_binds")
	end
end
addEvent("doUserTickets", true)
addEventHandler("doUserTickets", localPlayer, UserloadTicketsystem);


addEventHandler("onClientGUIClick", TicketsendButton, function()
	local reason, text = tostring(guiGetText(TicketreasonEdit)), getPlayerName(localPlayer)..': '..tostring(guiGetText(TickettextEdit));
	local combo		   = guiComboBoxGetSelected(Ticketcombobox)
	local comboText    = guiComboBoxGetItemText(Ticketcombobox, combo)
	

	if(#reason > 0 and #text > 0)then
		if(tostring(comboText) == "Fragen")then
			showCursor(false)
			setElementClicked(false)
			guiSetVisible(Ticketwindow, false);
			guiSetInputMode("allow_binds")
			triggerServerEvent("doSendTicket", localPlayer, reason, text, "Fragen");
		elseif(tostring(comboText) == "Support - Hilfe")then
			showCursor(false)
			setElementClicked(false)
			guiSetVisible(Ticketwindow, false);
			guiSetInputMode("allow_binds")
			triggerServerEvent("doSendTicket", localPlayer, reason, text, "Support");
		else
			outputChatBox("Wähle bitte eine Kategorie an!", 125, 0, 0);
		end
	else
		outputChatBox("Betreff oder Text ist zu kurz!", 125, 0, 0);
	end
end, false)

addEventHandler("onClientGUIClick", TicketcloseandDeleteButton, function()
	local id = guiGridListGetItemText(Ticketgridlist, guiGridListGetSelectedItem(Ticketgridlist), 1);
	
	if(id and id ~= -1)then
		if(#id > 0)then
			showCursor(false)
			setElementClicked(false)
			guiSetVisible(Ticketwindow, false);
			guiSetInputMode("allow_binds")
			triggerServerEvent("doDeleteTicket", localPlayer, id);
		end
	end
end, false)

addEventHandler("onClientGUIClick", TicketcloseButton, function()
	showCursor(false)
	setElementClicked(false)
	guiSetVisible(Ticketwindow, false);
	guiSetInputMode("allow_binds")
	triggerServerEvent("cancel_gui_server", localPlayer)
end, false)

addEventHandler("onClientGUIClick", TicketopenButton, function()
	local id = guiGridListGetItemText(Ticketgridlist, guiGridListGetSelectedItem(Ticketgridlist), 1);
	
	if(id and id ~= -1)then
		if(#id > 0)then
		
			local re = guiGridListGetItemText(Ticketgridlist, guiGridListGetSelectedItem(Ticketgridlist), 2);
			local tx = guiGridListGetItemData(Ticketgridlist, guiGridListGetSelectedItem(Ticketgridlist), 1);
			
			guiSetVisible(Ticketwindow,    false)
			guiSetVisible(TicketopenWindow, true)
			
			guiSetText(TicketopenEditReason, tostring(re));
			guiSetText(TicketsystemOpenmemo, tostring(tx));
			
			ticketID = id
		end
	end
end, false)

addEventHandler("onClientGUIClick", TicketopenAntwortenButton, function()
	local reid    = ticketID
	local before  = guiGetText(TicketsystemOpenmemo);
	local retext  = guiGetText(TicketsystemOpenASKMemo);
	local endtext = before..'\n'..getPlayerName(localPlayer)..': '..retext
	
	triggerServerEvent("doReplyTicket", localPlayer, endtext, reid);
	
	showCursor(false)
	setElementClicked(false)
	guiSetVisible(TicketopenWindow, false)
	
end, false)


addEventHandler("onClientGUIClick", TicketopenCloseButton, function()
	showCursor(false)
	setElementClicked(false)
	guiSetVisible(TicketopenWindow, false)
end, false)




-- ADMIN FUNKTIONEN

-- TICKETSYSTEM GUI FOR ADMINS --

TicketAdminwindow = guiCreateWindow(0.33, 0.32, 0.33, 0.43, "Ticketsystem VenoX Reallife Reallife", true)
guiWindowSetMovable(TicketAdminwindow, false)
guiWindowSetSizable(TicketAdminwindow, false)

TicketreasonAdminEdit = guiCreateEdit(0.03, 0.14, 0.38, 0.11, "RE: ...", true, TicketAdminwindow)
guiEditSetReadOnly(TicketreasonAdminEdit, true);
TicketlabelAdmin1 = guiCreateLabel(0.04, 0.09, 0.32, 0.04, "Tickets", true, TicketAdminwindow)
guiSetFont(TicketlabelAdmin1, "default-bold-small")
guiLabelSetColor(TicketlabelAdmin1, 255, 0, 0)
guiLabelSetHorizontalAlign(TicketlabelAdmin1, "center", false)
TickettextAdminMemo = guiCreateMemo(0.03, 0.26, 0.38, 0.22, "Ticket...", true, TicketAdminwindow)
guiMemoSetReadOnly(TickettextAdminMemo, true);
TickettextAdminMemo2 = guiCreateMemo(0.03, 0.50, 0.38, 0.22, "Antwort...", true, TicketAdminwindow)
TicketlabelAdmin2 = guiCreateLabel(0.03, 0.77, 0.11, 0.03, "Kategorie", true, TicketAdminwindow)
guiSetFont(TicketlabelAdmin2, "default-bold-small")
TicketAdmincombobox = guiCreateComboBox(0.03, 0.81, 0.26, 0.15, "Antworten", true, TicketAdminwindow)
guiComboBoxAddItem(TicketAdmincombobox, "Antworten")
guiComboBoxAddItem(TicketAdmincombobox, "Antworten + Schließen")
guiComboBoxAddItem(TicketAdmincombobox, "Schließen")
TicketsendAdminButton = guiCreateButton(0.32, 0.81, 0.09, 0.06, "->", true, TicketAdminwindow)
TicketopenAdminbutton = guiCreateButton(0.48, 0.78, 0.51, 0.07, "Ticket öffnen", true, TicketAdminwindow)
TicketcloseandDeleteAdminButton = guiCreateButton(0.48, 0.86, 0.51, 0.07, "Ticket Schließen + Löschen", true, TicketAdminwindow)
TicketcloseAdminButton = guiCreateButton(0.90, 0.06, 0.07, 0.07, "X", true, TicketAdminwindow)
guiSetFont(TicketcloseAdminButton, "default-bold-small")
guiSetProperty(TicketcloseAdminButton, "NormalTextColour", "FFFF0707")
TicketAdmingridlist = guiCreateGridList(0.47, 0.14, 0.51, 0.62, true, TicketAdminwindow)
TicketAdminIDColumn = guiGridListAddColumn(TicketAdmingridlist, "ID", 0.2)
TicketAdminReasonColumn = guiGridListAddColumn(TicketAdmingridlist, "Betreff", 0.3)
TicketAdminCatColumn = guiGridListAddColumn(TicketAdmingridlist, "Kategorie", 0.3)
TicketAdminTimeColumn = guiGridListAddColumn(TicketAdmingridlist, "Datum", 0.3)
TicketAdminStnColumn = guiGridListAddColumn(TicketAdmingridlist, "Status", 0.2)
guiSetVisible(TicketAdminwindow, false)

guiSetFont(TicketAdmingridlist, "default-small");


addEventHandler("onClientGUIClick", TicketcloseAdminButton, function()
	showCursor(false)
	setElementClicked(false)
	guiSetVisible(TicketAdminwindow, false)
	guiSetInputMode("allow_binds")
	triggerServerEvent("cancel_gui_server", localPlayer)
end, false)

addEventHandler("onClientGUIClick", TicketcloseandDeleteAdminButton, function()
	local id = guiGridListGetItemText(TicketAdmingridlist, guiGridListGetSelectedItem(TicketAdmingridlist), 1);
	
	if(id and id ~= -1)then
		if(#id > 0)then
			showCursor(false)
			setElementClicked(false)
			guiSetInputMode("allow_binds")
			guiSetVisible(TicketAdminwindow, false);
			triggerServerEvent("doDeleteTicket", localPlayer, id);
		end
	end
end, false)

addEventHandler("onClientGUIClick", TicketsendAdminButton, function()
	local id = guiGridListGetItemText(TicketAdmingridlist, guiGridListGetSelectedItem(TicketAdmingridlist), 1);
	if(id and id ~= -1)then
		if(#id > 0)then
			local combo = guiComboBoxGetSelected(TicketAdmincombobox);
			local combotext = guiComboBoxGetItemText(TicketAdmincombobox, combo)
			
			if(combotext == "Antworten")then
				showCursor(false)
				setElementClicked(false)
				guiSetInputMode("allow_binds")
				guiSetVisible(TicketAdminwindow, false);
				local before  = guiGetText(TickettextAdminMemo);
				local regain  = guiGetText(TickettextAdminMemo2);
				if not(#regain > 0)then
					outputChatBox("Antwort ist zu kurz!", 255, 0, 0);
					return
				end
				local retext  = before..'\n'..getPlayerName(localPlayer)..": "..regain
				triggerServerEvent("doReplyTicket", localPlayer, retext, id);
			elseif(combotext == "Antworten + Schließen")then
				showCursor(false)
				setElementClicked(false)
				guiSetVisible(TicketAdminwindow, false);
				guiSetInputMode("allow_binds")
				local before  = guiGetText(TickettextAdminMemo);
				local regain  = guiGetText(TickettextAdminMemo2);
				if not(#regain > 0)then
					outputChatBox("Antwort ist zu kurz!", 255, 0, 0);
					return
				end
				local retext  = before..'\n'..getPlayerName(localPlayer)..": "..regain
				triggerServerEvent("doReplyTicketClose", localPlayer, retext, id);
			elseif(combotext == "Schließen")then
				showCursor(false)
				setElementClicked(false)
				guiSetVisible(TicketAdminwindow, false);
				guiSetInputMode("allow_binds")
				triggerServerEvent("doTicketClose", localPlayer, id);
			end
		end
	end
end, false)

addEventHandler("onClientGUIClick", TicketopenAdminbutton, function()
	local id = guiGridListGetItemText(TicketAdmingridlist, guiGridListGetSelectedItem(TicketAdmingridlist), 1);
	if(id and id ~= -1)then
		if(#id > 0)then
			local re = guiGridListGetItemText(TicketAdmingridlist, guiGridListGetSelectedItem(TicketAdmingridlist), 2);
			local text = guiGridListGetItemData(TicketAdmingridlist, guiGridListGetSelectedItem(TicketAdmingridlist), 1);
			
			if(re and text)then
				guiSetText(TicketreasonAdminEdit, "RE: "..tostring(re));
				guiSetText(TickettextAdminMemo, tostring(text));
			end
		end
	end
end, false)

addEvent("doAdminTickets", true)
addEventHandler("doAdminTickets", localPlayer, function(atickets)
	if not guiGetVisible(TicketAdminwindow) then
		showCursor(true)
		setElementClicked(true)
		destroyElement ( TicketAdmingridlist )
		TicketAdmingridlist = guiCreateGridList(0.47, 0.14, 0.51, 0.62, true, TicketAdminwindow)
		TicketAdminIDColumn = guiGridListAddColumn(TicketAdmingridlist, "ID", 0.2)
		TicketAdminReasonColumn = guiGridListAddColumn(TicketAdmingridlist, "Betreff", 0.3)
		TicketAdminCatColumn = guiGridListAddColumn(TicketAdmingridlist, "Kategorie", 0.3)
		TicketAdminTimeColumn = guiGridListAddColumn(TicketAdmingridlist, "Datum", 0.3)
		TicketAdminStnColumn = guiGridListAddColumn(TicketAdmingridlist, "Status", 0.2)
		guiSetVisible(TicketAdminwindow, true);
		guiSetInputMode("no_binds")
		
		if atickets and atickets[1] then
			for i=1, #atickets do 
				local data = atickets[i]
				local addrow = guiGridListAddRow(TicketAdmingridlist)
				guiGridListSetItemText(TicketAdmingridlist, addrow, TicketAdminIDColumn, tostring ( data.id ), false, true)
				guiGridListSetItemData(TicketAdmingridlist, addrow, TicketAdminIDColumn, data.text)
				guiGridListSetItemText(TicketAdmingridlist, addrow, TicketAdminReasonColumn, tostring ( data.reason ), true, false)
				guiGridListSetItemText(TicketAdmingridlist, addrow, TicketAdminCatColumn, tostring ( data.category ), false, false)
				guiGridListSetItemText(TicketAdmingridlist, addrow, TicketAdminTimeColumn, tostring ( data.datetime ), false, false)
				guiGridListSetItemText(TicketAdmingridlist, addrow, TicketAdminStnColumn, tostring ( data.state ), false, false)
				
				if(data.state == "Close")then
					guiGridListSetItemColor ( TicketAdmingridlist, addrow, TicketAdminStnColumn, 255, 0, 0)
				else
					guiGridListSetItemColor ( TicketAdmingridlist, addrow, TicketAdminStnColumn, 0, 255, 0)
				end
			end
		end
	else
		showCursor(false)
		setElementClicked(false)
		guiSetVisible(TicketAdminwindow, false);
		guiSetInputMode("allow_binds")
	end
end)

addCommandHandler ( "testdelete", function ()
	guiGridListClear(TicketAdmingridlist)

end )

addCommandHandler ( "testdelete2", function()
	destroyElement ( TicketAdmingridlist )
	TicketAdmingridlist = guiCreateGridList(0.47, 0.14, 0.51, 0.62, true, TicketAdminwindow)
	TicketAdminIDColumn = guiGridListAddColumn(TicketAdmingridlist, "ID", 0.2)
	TicketAdminReasonColumn = guiGridListAddColumn(TicketAdmingridlist, "Betreff", 0.3)
	TicketAdminCatColumn = guiGridListAddColumn(TicketAdmingridlist, "Kategorie", 0.3)
	TicketAdminTimeColumn = guiGridListAddColumn(TicketAdmingridlist, "Datum", 0.3)
	TicketAdminStnColumn = guiGridListAddColumn(TicketAdmingridlist, "Status", 0.2)
end )
]]