------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2013 ------------
------------------------------

--[[function ShowPoliceComputerGui_func()

	guiSetVisible(gWindow["policepc"], true)
	guiGridListClear ( gGrid["plist"] )
	for id, playeritem in ipairs(getElementsByType("player")) do 
		if getElementData ( playeritem, "loggedin" ) == 1 then
			local row = guiGridListAddRow ( gGrid["plist"] )
			guiGridListSetItemText ( gGrid["plist"], row, gGrid["players"], getPlayerName ( playeritem ), false, false )
			if tostring(getElementData ( playeritem, "wanteds" )) == "false" then wanteds = "0" else wanteds = tostring(getElementData ( playeritem, "wanteds" )) end
			if tostring(getElementData ( playeritem, "stvo" )) == "false" then stvo = "0" else stvo = tostring(getElementData ( playeritem, "stvo" )) end
			guiGridListSetItemText ( gGrid["plist"], row, gGrid["playerwanteds"], wanteds, false, false )
			guiGridListSetItemText ( gGrid["plist"], row, gGrid["playerstvo"], stvo, false, false )			
		end
	end
	guiGridListClear ( gGrid["onDutyList"] )
	for id, playeritem in ipairs(getElementsByType("player")) do 
		if getElementData ( playeritem, "loggedin" ) == 1 then
			if isOnStateDuty(player) or isArmy (player) then
				local row = guiGridListAddRow ( gGrid["onDutyList"] )
				guiGridListSetItemText ( gGrid["onDutyList"], row, gGrid["onDutyCops"], getPlayerName ( playeritem ), false, false )
				fraktion = tostring(getElementData ( playeritem, "fraktion" ))
				rang = tostring(getElementData ( playeritem, "rang" ))
				guiGridListSetItemText ( gGrid["onDutyList"], row, gGrid["onDutyFraktion"], fraktion, false, false )
				guiGridListSetItemText ( gGrid["onDutyList"], row, gGrid["onDutyRang"], rang, false, false )
			end
		end
	end
	guiSetInputMode ( "no_binds_when_editing" )
	setElementData ( getLocalPlayer(), "ElementClicked", true )
	guiGridListClear ( gGrid["MitgliederList"] )
	for id, playeritem in ipairs(getElementsByType("player")) do 
		if getElementData ( playeritem, "loggedin" ) == 1 then
			if tonumber(getElementData ( getLocalPlayer(), "fraktion")) == tonumber(getElementData ( playeritem, "fraktion" )) then
				local row = guiGridListAddRow ( gGrid["MitgliederList"] )
				guiGridListSetItemText ( gGrid["MitgliederList"], row, gGrid["MitgliedCop"], getPlayerName ( playeritem ), false, false )
				rang = tostring(getElementData ( playeritem, "rang" ))
				gwd = tostring(getElementData ( playeritem, "armyperm9" ))
				guiGridListSetItemText ( gGrid["MitgliederList"], row, gGrid["MitgliedRang"], rang, false, false )
				guiGridListSetItemText ( gGrid["MitgliederList"], row, gGrid["MitgliedGWD"], gwd, false, false )
			end
		end
	end
end
addEvent ( "showPDComputer", true)
addEventHandler ( "showPDComputer", getRootElement(), ShowPoliceComputerGui_func)]]

--BEHALTEN--
function changePlayerValueFunc(typ, player, value, executor, reason)
	if typ == "wanteds" then
		if getPlayerWantedLevel(getPlayerFromName(player))+value > 6 then
			setPlayerWantedLevel(getPlayerFromName(player), 6)
			vnxSetElementData(getPlayerFromName(player), "wanteds", 6)
			triggerClientEvent(executor, "refreshClientWantedList", getRootElement())
			outputChatBox("Das Wantedlevel von "..player.." wurde von "..getPlayerName(executor).." auf "..getElementData(getPlayerFromName(player), "wanteds").." gesetzt. Grund: "..reason, 255, 255, 0)
			outputChatBox("Dein Wantedlevel wurde von "..getPlayerName(executor).." auf "..getElementData(getPlayerFromName(player), "wanteds").." gesetzt. Grund: "..reason".", getPlayerFromName(player), 255, 255, 0)
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
			outputChatBox("Das Wantedlevel von "..player.." wurde von "..getPlayerName(executor).." auf "..getElementData(getPlayerFromName(player), "wanteds").." gesetzt. Grund: "..reason, 255, 255, 0)
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
		outputChatBox("Das Wantedlevel von "..player.." wurde von "..getPlayerName(executor).." gesetzt auf "..getElementData(getPlayerFromName(player), "wanteds").." gesetzt. Grund: "..reason, 255, 255, 0)
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
			outputChatBox("Die StVO-Punkte von "..player.." wurden von "..getPlayerName(executor).." auf "..getElementData(getPlayerFromName(player), "stvo_punkte").." gesetzt. Grund: "..reason, 255, 255, 0)
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
			outputChatBox("Die StVO-Punkte von "..player.." wurden von "..getPlayerName(executor).." auf "..getElementData(getPlayerFromName(player), "stvo_punkte").." gesetzt. Grund: "..reason, 255, 255, 0)
			outputChatBox("Deine StVO-Punkte wurden von "..getPlayerName(executor).." auf "..getElementData(getPlayerFromName(player), "stvo_punkte").." gesetzt. Grund: "..reason, getPlayerFromName(player), 255, 255, 0)
			local msg = "Spieler "..getPlayerName(executor).." hast die StVO-Punkte von "..player.." auf "..getElementData(getPlayerFromName(player), "stvo_punkte").." gesetzt. Grund: "..reason
				sendMSGForFaction ( msg, 1, 0, 125, 0 )
				sendMSGForFaction ( msg, 6, 0, 125, 0 )
				sendMSGForFaction ( msg, 8, 0, 125, 0 )
				outputLog( "[StVO]: "..getPlayerName(executor).." hat die StVO-Punkte von "..player.." auf "..getElementData(getPlayerFromName(player), "stvo_punkte").." gesetzt. ("..reason..")", "pd")
			return
		end
		vnxSetElementData(getPlayerFromName(player), "stvo_punkte", getElementData(getPlayerFromName(player), "stvo_punkte") + value)
		outputChatBox("Die StVO-Punkte von "..player.." wurden von "..getPlayerName(executor).." auf "..getElementData(getPlayerFromName(player), "stvo_punkte").." gesetzt. Grund: "..reason, 255, 255, 0)
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

--BEHALTEN--

--BEHALTEN--
function SubmitSTVOGebenBtn(button)
	if button == "left" then
		local fix
		if guiCheckBoxGetSelected ( gCheck["AbsicherungLoeschenCheckBox"] ) then
			fix = "delete"
		else
			fix = "give"
		end
		local etplayer, column = guiGridListGetSelectedItem(gGrid["plist"])
		triggerServerEvent ( "stvopunkteGUI", getLocalPlayer(), getLocalPlayer(), guiGridListGetItemText ( gGrid["plist"], etplayer, column ), guiGetText ( gEdit["level"] ), fix, guiGetText ( gEdit["reason"] ) )
	end
end
--BEHALTEN--

--BEHALTEN--
function SubmitOrtenBtn(button)
	if button == "left" then
		local etplayer, column = guiGridListGetSelectedItem(gGrid["plist"])
		local player = getLocalPlayer()
		local target = guiGridListGetItemText ( gGrid["plist"], etplayer, column )
		local target = getPlayerFromName ( target )
		if tonumber(getElementData ( player, "rang" )) >= 2 then
			if getElementData ( target, "handystate" ) == "off" then
				outputChatBox ( "Das Handy des Users ist ausgeschaltet!", 125, 0, 0 )
			else
				local x, y, z = getElementPosition ( target )
				if tonumber ( getElementInterior ( target ) ) ~= 0 or tonumber ( getElementDimension ( target ) ) ~= 0 then
					if isElement ( wantedBlip ) then
						deletetWantedBlip ()
						return
					end
					outputChatBox ( "Der User befindet sich in einem Gebäude - Ortung nicht möglich!", 125, 0, 0 )
				else
					if isElement ( wantedBlip ) then
						deletetWantedBlip ()
						return
					end
					if wantedBlip then
						destroyElement ( wantedBlip )
						wantedBlip = nil
						if deletetWantedBlipTimer then
							killTimer ( deletetWantedBlipTimer )
						end
						wantedBlip = createBlipAttachedTo ( target, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
						--deletetWantedBlipTimer = setTimer ( deletetWantedBlip, 30000, 1 )
						outputChatBox ( "[INFO]: Verwende /delblip oder drücke erneut auf 'Orten' um die Markierung zu entfernen!", 150, 150, 10 )
					else
						destroyElement ( wantedBlip )
						wantedBlip = createBlipAttachedTo ( target, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
						outputChatBox ( "[INFO]: Verwende /delblip oder drücke erneut auf 'Orten' um die Markierung zu entfernen!", 150, 150, 10 )
						--deletetWantedBlipTimer = setTimer ( deletetWantedBlip, 30000, 1 )
					end
				end
			end
		else
			outputChatBox ( "Du bist nicht befugt!", 125, 0, 0 )
		end
	end
end
--BEHALTEN--

function SubmitHauseOrtenBtn(button)
	if button == "left" then
		local etplayer, column = guiGridListGetSelectedItem(gGrid["plist"])
		local targetname = guiGridListGetItemText ( gGrid["plist"], etplayer, column )
		local target = getPlayerFromName ( targetname )
		local player = getLocalPlayer()
		if tonumber(getElementData ( player, "rang" )) >= 2 then
			for index, colshape in pairs(getElementsByType("pickup")) do
				if(laGetElementData(colshape, "owner") ) and (laGetElementData(colshape, "owner") == (targetname)) then
					local x1, y1, z1 = getElementPosition(colshape)
					if(isElement(houseWantedBlip)) then return end
						houseWantedBlip = createBlip(x1, y1, z1, 0, 2, 0, 255, 255, 255, 0, 99999.0)
						setTimer(destroyElement, 30000, 1, houseWantedBlip)
						outputChatBox("Das Haus von "..targetname.." wird auf dem Radar angezeigt!", 0, 255, 0)
				end
			end
		else
			outputChatBox ( "Du bist nicht befugt!", 150, 0, 0 )
		end
	end
end


--BEHALTEN--
function deletetWantedBlip ()

	destroyElement ( wantedBlip )
	wantedBlip = nil
	outputChatBox ( "[INFO]: Die Markierung wurde entfernt!", 150, 150, 10 )
end
addCommandHandler ( "delblip", deletetWantedBlip )
--BEHALTEN--

--BEHALTEN--
function SubmitLogoutBtn(button)

	if button == "left" then
		guiSetVisible(gWindow["policepc"],false)
		showCursor(false)
		triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
		toggleAllControls(true)
		setElementData ( getLocalPlayer(), "ElementClicked", false )
	end
end
--BEHALTEN--

function SubmitWVorgegebenGebenBtn(button)
	if button == "left" then
		local etplayer, column = guiGridListGetSelectedItem(gGrid["plist"])
		local verbrechen, spalten = guiGridListGetSelectedItem(gGrid["WantedList"])
		local grund = guiGridListGetItemText ( gGrid["WantedList"], verbrechen, 1 )
		local wanteds = guiGridListGetItemText ( gGrid["WantedList"], verbrechen, 2 )
		local fix = "give"
		triggerServerEvent ( "pdComputerSetWanted", getLocalPlayer(), getLocalPlayer(), guiGridListGetItemText ( gGrid["plist"], etplayer, column ), wanteds, fix, grund )
		setTimer ( ShowPoliceComputerGui_func, 500, 1 )
	end
end

function SubmitSTVOVorgegebenGebenBtn(button)
	if button == "left" then
		local etplayer, column = guiGridListGetSelectedItem(gGrid["plist"])
		local vergehen, spalten = guiGridListGetSelectedItem(gGrid["StVOList"])
		local grund = guiGridListGetItemText ( gGrid["StVOList"], vergehen, 1 )
		local stvo = guiGridListGetItemText ( gGrid["StVOList"], vergehen, 2 )
		local fix = "give"
		triggerServerEvent ( "stvopunkteGUI", getLocalPlayer(), getLocalPlayer(), guiGridListGetItemText ( gGrid["plist"], etplayer, column ), stvo, fix, grund )
		setTimer ( ShowPoliceComputerGui_func, 500, 1 )
	end
end

function VerstaerkungBtn(button)
	if guiRadioButtonGetSelected ( gRadio["FraktionschatRadioButton"] ) then
		local faction = "self"
		local etplayer, column = guiGridListGetSelectedItem(gGrid["VerstaerkungList"])
		triggerServerEvent ( "getVerstaerkung", getLocalPlayer(), getLocalPlayer(), guiGridListGetItemText ( gGrid["VerstaerkungList"], etplayer, column ), faction )
	else
		local faction = "all"
		local etplayer, column = guiGridListGetSelectedItem(gGrid["VerstaerkungList"])
		triggerServerEvent ( "getVerstaerkung", getLocalPlayer(), getLocalPlayer(), guiGridListGetItemText ( gGrid["VerstaerkungList"], etplayer, column ), faction )
	end
end

function NotdienstBtn(button)
triggerServerEvent ( "getNotdienst", getLocalPlayer(), getLocalPlayer(), guiGetText ( gEdit["VerletzteEdit"]) )
end

function SearchFunktionWanted()
		guiGridListClear ( gGrid["plist"] )
		local text = guiGetText ( gEdit["SuchfunktionEdit"] )
		if ( text == "" ) then
			for id, playeritem in ipairs ( getElementsByType ( "player" ) ) do
				local row = guiGridListAddRow ( gGrid["plist"] )
				guiGridListSetItemText ( gGrid["plist"], row, gGrid["players"], getPlayerName ( playeritem ), false, false )
				if tostring(getElementData ( playeritem, "wanteds" )) == "false" then wanteds = "0" else wanteds = tostring(getElementData ( playeritem, "wanteds" )) end
				if tostring(getElementData ( playeritem, "stvo" )) == "false" then stvo = "0" else stvo = tostring(getElementData ( playeritem, "stvo" )) end
				guiGridListSetItemText ( gGrid["plist"], row, gGrid["playerwanteds"], wanteds, false, false )
				guiGridListSetItemText ( gGrid["plist"], row, gGrid["playerstvo"], stvo, false, false )	
			end
		else
			for id, playeritem in ipairs ( getElementsByType ( "player" ) ) do
				if ( string.find ( string.upper ( getPlayerName ( playeritem ) ), string.upper ( text ), 1, true ) ) then
					local row = guiGridListAddRow ( gGrid["plist"] )
					guiGridListSetItemText ( gGrid["plist"], row, gGrid["players"], getPlayerName ( playeritem ), false, false )
					if tostring(getElementData ( playeritem, "wanteds" )) == "false" then wanteds = "0" else wanteds = tostring(getElementData ( playeritem, "wanteds" )) end
					if tostring(getElementData ( playeritem, "stvo" )) == "false" then stvo = "0" else stvo = tostring(getElementData ( playeritem, "stvo" )) end
					guiGridListSetItemText ( gGrid["plist"], row, gGrid["playerwanteds"], wanteds, false, false )
					guiGridListSetItemText ( gGrid["plist"], row, gGrid["playerstvo"], stvo, false, false )
					if tostring(getElementData ( playeritem, "dmstate" )) == "0" then
						dmstatus = "Neutral"
					elseif tostring(getElementData ( playeritem, "dmstate" )) == "1" then
						dmstatus = "Mittel"
					elseif tostring(getElementData ( playeritem, "dmstate" )) == "2" then
						dmstatus = "Stark"
					end
					guiGridListSetItemText ( gGrid["plist"], row, gGrid["playerdmstate"], dmstatus, false, false )
				end
			end
		end
end


function _createPDComputerMenue ()
	
	gWindow["policepc"] = guiCreateWindow(screenwidth/2-692/2,screenheight/2-650/2,692,650,"Polizeicomputer",false)

	guiSetAlpha(gWindow["policepc"],1)
	guiWindowSetMovable(gWindow["policepc"],false)
	guiWindowSetSizable(gWindow["policepc"],false)
	
	
	gTabPanel["PolizeicomputerTabmenu"] = guiCreateTabPanel(0, 15, 701, 551, false, gWindow["policepc"])
	
	gTab["WantedcomputerTab"] = guiCreateTab("Wantedcomputer", gTabPanel["PolizeicomputerTabmenu"])
	
	gEdit["SuchfunktionEdit"] = guiCreateEdit(20, 30, 261, 20, "", false, gTab["WantedcomputerTab"])
	guiEditSetMaxLength(gEdit["SuchfunktionEdit"], 32767)
	
	gLabel["SuchfunktionLabel"] = guiCreateLabel(20, 10, 111, 16, "Spieler suchen:", false, gTab["WantedcomputerTab"])
	guiLabelSetHorizontalAlign(gLabel["SuchfunktionLabel"], "left", false)
	guiLabelSetVerticalAlign(gLabel["SuchfunktionLabel"], "center")
	
	gButtons["orten"] = guiCreateButton(310, 90, 75, 23, "Orten", false, gTab["WantedcomputerTab"])
	guiSetAlpha(gButtons["orten"],1)
	gButtons["stvogeben"] = guiCreateButton(590, 60, 75, 23, "StVO-Punkte", false, gTab["WantedcomputerTab"])
	guiSetAlpha(gButtons["stvogeben"],1)
	gButtons["wgeben"] = guiCreateButton(500, 60, 75, 23, "Wanteds", false, gTab["WantedcomputerTab"])
	guiSetAlpha(gButtons["wgeben"],1)
	
	gButtons["hausorten"] = guiCreateButton(390, 90, 91, 23, "Haus anzeigen", false, gTab["WantedcomputerTab"])
	guiSetAlpha(gButtons["hausorten"],1)
	
	gLabel["levellabel"] = guiCreateLabel(310, 40, 41, 16, "Anzahl:", false, gTab["WantedcomputerTab"])
	guiSetAlpha(gLabel["levellabel"],1)
	guiLabelSetColor(gLabel["levellabel"], 255, 255, 0 )
	guiLabelSetVerticalAlign(gLabel["levellabel"],"center")
	guiLabelSetHorizontalAlign(gLabel["levellabel"],"left",false)
	
	gEdit["level"] = guiCreateEdit(310, 60, 31, 20, "", false, gTab["WantedcomputerTab"])
	guiSetAlpha(gEdit["level"],1)
	guiEditSetMaxLength(gEdit["level"], 1)
	
	gButtons["ausloggen"] = guiCreateButton(10, 575, 671, 51, "Polizeicomputer schliessen",false,gWindow["policepc"]) -- Done
	guiSetAlpha(gButtons["ausloggen"],1)


	gGrid["plist"] = guiCreateGridList(20, 60, 261, 441, false, gTab["WantedcomputerTab"])
	guiSetAlpha(gGrid["plist"],1)
	guiGridListSetSelectionMode(gGrid["plist"],1)
	gGrid["players"] = guiGridListAddColumn(gGrid["plist"],"Bürger",0.45)
	gGrid["playerwanteds"] = guiGridListAddColumn(gGrid["plist"],"Wanteds",0.25)
	gGrid["playerstvo"] = guiGridListAddColumn(gGrid["plist"],"StVO",0.25)
	gGrid["playerdmstate"] = guiGridListAddColumn(gGrid["plist"],"DM",0.3)
	
	
	gGrid["WantedList"] = guiCreateGridList(310, 120, 221, 181, false, gTab["WantedcomputerTab"])
	gColumn["Verbrechen"] = guiGridListAddColumn(gGrid["WantedList"], "Verbrechen", 0.6)
	gColumn["VerbrechenWanteds"] = guiGridListAddColumn(gGrid["WantedList"], "Wanteds", 0.2)
	
	--1--
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Koerperverletzung", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "1", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Versuchter Diebstahl", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "1", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "illegale /werbung", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "1", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Leichte Beleidigung", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "1", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Befehlsverweigerung bei VKK", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "1", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Flucht vor/aus Kontrolle", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "1", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Weedbesitz 5-50", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "1", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Kokainbesitz 5-50", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "1", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Matsbesitz 5-50", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "1", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Sachbeschaedigung", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "1", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Illegales Strassenrennen", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "1", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Urinieren", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "1", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Weedkonsum", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "1", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Kokainkonsum", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "1", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Waffennutzung", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "1", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Fahren ohne Fuehrerschein", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "1", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Drohung mit Waffe", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "1", false, false )
	--2--
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Beamtenbehinderung", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "2", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Beamtenbelaestigung", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "2", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Koerperverletzung (Schusswaffe)", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "2", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Schwere Beleidigung", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "2", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Erpressung", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "2", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Verweigerung zur Durchsuchung", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "2", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Weedan- und abbau", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "2", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Raubüeberfall", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "2", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Weedbesitz 51-150", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "2", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Kokainbesitz 51-150", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "2", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Matsbesitz 51-150", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "2", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Bestechungsversuch", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "2", false, false )
	--3--
	--3--
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Beamtenbeschuss", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "3", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Vortaeuschen falscher Tatsachen", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "3", false, false )	
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Waffenverkauf", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "3", false, false )	
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Drogenverkauf", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "3", false, false )	
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Waffentruck", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "3", false, false )	
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Drogenschiff", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "3", false, false )	
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Matstruck", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "3", false, false )	
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Kokaintruck", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "3", false, false )	
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Hanfsamentruck", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "3", false, false )	
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Rob The Shop", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "3", false, false )	
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Beihilfe zur Freiheitsberaubung", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "3", false, false )	
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Weedbesitz >150", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "3", false, false )	
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Kokainbesitz >150", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "3", false, false )	
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Matsbesitz >150", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "3", false, false )	
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Casinoraub", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "3", false, false )	
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Bankraub", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "3", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Totschlag", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "3", false, false )
	--4--
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Mord", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "4", false, false )	
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Betreten des Armygebiets", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "4", false, false )	
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Betreten des SFPD Parkplatzes", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "4", false, false )	
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Geiselnahme", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "4", false, false )
	--5--
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Doppelmord", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "5", false, false )	
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Gelände betreten des FBIs, durch das Tor", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "5", false, false )	
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Betreten der Polizeiwache", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "5", false, false )
	--6--
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Terroristen Anschlag", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "6", false, false )	
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Terrorismus", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "6", false, false )
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Einbruch in die Armybasis", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "6", false, false )	
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Einbruch in die Basis des FBIs", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "6", false, false )	
	local row = guiGridListAddRow ( gGrid["WantedList"] )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["Verbrechen"], "Einbruch in die Garage des SAPDs", false, false )
	guiGridListSetItemText ( gGrid["WantedList"], row, gColumn["VerbrechenWanteds"], "6", false, false )	

	
	gGrid["StVOList"] = guiCreateGridList(310, 320, 221, 181, false, gTab["WantedcomputerTab"])
	guiGridListSetSortingEnabled(gGrid["StVOList"], false)
	gColumn["Vergehen"] = guiGridListAddColumn(gGrid["StVOList"], "Vergehen", 0.6)
	gColumn["VergehenStVO"] = guiGridListAddColumn(gGrid["StVOList"], "StVO", 0.2)
	
	--1--
	local row = guiGridListAddRow ( gGrid["StVOList"] )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["Vergehen"], "Burnout", false, false )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["VergehenStVO"], "1", false, false )
	local row = guiGridListAddRow ( gGrid["StVOList"] )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["Vergehen"], "Halten auf der Strasse", false, false )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["VergehenStVO"], "1", false, false )
	local row = guiGridListAddRow ( gGrid["StVOList"] )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["Vergehen"], "Eingriff in den Strassenverkehr", false, false )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["VergehenStVO"], "1", false, false )
	local row = guiGridListAddRow ( gGrid["StVOList"] )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["Vergehen"], "Falschparken", false, false )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["VergehenStVO"], "1", false, false )
	--2--
	local row = guiGridListAddRow ( gGrid["StVOList"] )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["Vergehen"], "Sachbeschaedigung von Objekten", false, false )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["VergehenStVO"], "2", false, false )
	local row = guiGridListAddRow ( gGrid["StVOList"] )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["Vergehen"], "Missachtung der Vorfahrtsregeln", false, false )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["VergehenStVO"], "2", false, false )
	--3--
	local row = guiGridListAddRow ( gGrid["StVOList"] )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["Vergehen"], "Fluggeraet auf der Strasse", false, false )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["VergehenStVO"], "3", false, false )
	local row = guiGridListAddRow ( gGrid["StVOList"] )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["Vergehen"], "Missachtung der Fahrverbote", false, false )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["VergehenStVO"], "3", false, false )
	local row = guiGridListAddRow ( gGrid["StVOList"] )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["Vergehen"], "Nichtbeachten der Einbahnstrassen", false, false )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["VergehenStVO"], "3", false, false )
	--4--
	local row = guiGridListAddRow ( gGrid["StVOList"] )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["Vergehen"], "Unfall", false, false )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["VergehenStVO"], "4", false, false )
	local row = guiGridListAddRow ( gGrid["StVOList"] )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["Vergehen"], "Alkoholeinfluss", false, false )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["VergehenStVO"], "4", false, false )
	local row = guiGridListAddRow ( gGrid["StVOList"] )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["Vergehen"], "Fahren auf dem Gehweg", false, false )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["VergehenStVO"], "4", false, false )
	--5--
	local row = guiGridListAddRow ( gGrid["StVOList"] )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["Vergehen"], "Rasen", false, false )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["VergehenStVO"], "5", false, false )
	local row = guiGridListAddRow ( gGrid["StVOList"] )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["Vergehen"], "Drogeneinfluss", false, false )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["VergehenStVO"], "5", false, false )
	--6--
	local row = guiGridListAddRow ( gGrid["StVOList"] )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["Vergehen"], "Ueberfahren von Passanten", false, false )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["VergehenStVO"], "6", false, false )
	local row = guiGridListAddRow ( gGrid["StVOList"] )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["Vergehen"], "Nitro", false, false )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["VergehenStVO"], "6", false, false )
	local row = guiGridListAddRow ( gGrid["StVOList"] )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["Vergehen"], "Nebelwand", false, false )
	guiGridListSetItemText ( gGrid["StVOList"], row, gColumn["VergehenStVO"], "6", false, false )
	
	gButtons["WantedsgebenButton"] = guiCreateButton(540, 190, 121, 41, "Wanteds geben", false, gTab["WantedcomputerTab"])
	guiSetAlpha(gButtons["WantedsgebenButton"],1)
	
	gButtons["StVOgebenButton"] = guiCreateButton(540, 390, 121, 41, "StVO-Punkte geben", false, gTab["WantedcomputerTab"])
	guiSetAlpha(gButtons["StVOgebenButton"],1)
	
	gLabel["reason"] = guiCreateLabel(370, 40, 111, 16, "Grund:", false, gTab["WantedcomputerTab"])
	guiSetAlpha(gLabel["reason"],1)
	guiLabelSetColor(gLabel["reason"], 255, 255, 0 )
	guiLabelSetVerticalAlign(gLabel["reason"],"center")
	guiLabelSetHorizontalAlign(gLabel["reason"],"left",false)

	gEdit["reason"] = guiCreateEdit(370, 60, 113, 20, "", false, gTab["WantedcomputerTab"])
	guiSetAlpha(gEdit["reason"],1)
	
	gCheck["AbsicherungLoeschenCheckBox"] = guiCreateCheckBox(540, 90, 111, 21, "Anzahl löschen?", false, false, gTab["WantedcomputerTab"])
	
	--addEventHandler("onClientGUIClick", gButtons["wgeben"], SubmitWGebenBtn, false)
	addEventHandler("onClientGUIClick", gButtons["stvogeben"], SubmitSTVOGebenBtn, false)
	addEventHandler("onClientGUIClick", gButtons["orten"], SubmitOrtenBtn, false)
	addEventHandler("onClientGUIClick", gButtons["hausorten"], SubmitHauseOrtenBtn, false)
	addEventHandler("onClientGUIClick", gButtons["ausloggen"], SubmitLogoutBtn, false)
	
	addEventHandler("onClientGUIClick", gButtons["WantedsgebenButton"], SubmitWVorgegebenGebenBtn, false)
	addEventHandler("onClientGUIClick", gButtons["StVOgebenButton"], SubmitSTVOVorgegebenGebenBtn, false)
	addEventHandler ( "onClientGUIChanged", gEdit["SuchfunktionEdit"], SearchFunktionWanted )
	
	gTab["AllgemeinesTab"] = guiCreateTab("Allgemeines", gTabPanel["PolizeicomputerTabmenu"])
	
	gLabel["onDutyLabel"] = guiCreateLabel(20, 10, 111, 16, "onDuty-Liste:", false, gTab["AllgemeinesTab"])
	guiLabelSetHorizontalAlign(gLabel["onDutyLabel"], "left", false)
	guiLabelSetVerticalAlign(gLabel["onDutyLabel"], "center")
	
	gGrid["onDutyList"] = guiCreateGridList(20, 30, 261, 441, false, gTab["AllgemeinesTab"])
	guiSetAlpha(gGrid["onDutyList"],1)
	guiGridListSetSelectionMode(gGrid["onDutyList"],1)
	gGrid["onDutyCops"] = guiGridListAddColumn(gGrid["onDutyList"],"Beamter",0.5)
	gGrid["onDutyFraktion"] = guiGridListAddColumn(gGrid["onDutyList"],"Fraktion",0.25)
	gGrid["onDutyRang"] = guiGridListAddColumn(gGrid["onDutyList"],"Rang",0.25)

	gGrid["VerstaerkungList"] = guiCreateGridList(310, 30, 221, 181, false, gTab["AllgemeinesTab"])
	gColumn["VerstaerkungsGrund"] = guiGridListAddColumn(gGrid["VerstaerkungList"], "Grund", 0.85)
	
	--1--
	local row = guiGridListAddRow ( gGrid["VerstaerkungList"] )
	guiGridListSetItemText ( gGrid["VerstaerkungList"], row, gColumn["VerstaerkungsGrund"], "Flucht vor/aus Kontrolle", false, false )
	local row = guiGridListAddRow ( gGrid["VerstaerkungList"] )
	guiGridListSetItemText ( gGrid["VerstaerkungList"], row, gColumn["VerstaerkungsGrund"], "Koerperverletzung", false, false )

	local row = guiGridListAddRow ( gGrid["VerstaerkungList"] )
	guiGridListSetItemText ( gGrid["VerstaerkungList"], row, gColumn["VerstaerkungsGrund"], "Raubueberfall", false, false )
	local row = guiGridListAddRow ( gGrid["VerstaerkungList"] )
	guiGridListSetItemText ( gGrid["VerstaerkungList"], row, gColumn["VerstaerkungsGrund"], "Drohung mit Waffe", false, false )
	local row = guiGridListAddRow ( gGrid["VerstaerkungList"] )
	guiGridListSetItemText ( gGrid["VerstaerkungList"], row, gColumn["VerstaerkungsGrund"], "Beamtenbeschuss", false, false )
	local row = guiGridListAddRow ( gGrid["VerstaerkungList"] )
	guiGridListSetItemText ( gGrid["VerstaerkungList"], row, gColumn["VerstaerkungsGrund"], "Schiesserei", false, false )
	local row = guiGridListAddRow ( gGrid["VerstaerkungList"] )
	guiGridListSetItemText ( gGrid["VerstaerkungList"], row, gColumn["VerstaerkungsGrund"], "Waffentruck", false, false )
	local row = guiGridListAddRow ( gGrid["VerstaerkungList"] )
	guiGridListSetItemText ( gGrid["VerstaerkungList"], row, gColumn["VerstaerkungsGrund"], "Drogenschiff", false, false )
	local row = guiGridListAddRow ( gGrid["VerstaerkungList"] )
	guiGridListSetItemText ( gGrid["VerstaerkungList"], row, gColumn["VerstaerkungsGrund"], "Matstruck", false, false )
	local row = guiGridListAddRow ( gGrid["VerstaerkungList"] )
	guiGridListSetItemText ( gGrid["VerstaerkungList"], row, gColumn["VerstaerkungsGrund"], "Kokaintruck", false, false )
	local row = guiGridListAddRow ( gGrid["VerstaerkungList"] )
	guiGridListSetItemText ( gGrid["VerstaerkungList"], row, gColumn["VerstaerkungsGrund"], "Hanfsamentruck", false, false )
	local row = guiGridListAddRow ( gGrid["VerstaerkungList"] )
	guiGridListSetItemText ( gGrid["VerstaerkungList"], row, gColumn["VerstaerkungsGrund"], "Rob The Shop", false, false )
	local row = guiGridListAddRow ( gGrid["VerstaerkungList"] )
	guiGridListSetItemText ( gGrid["VerstaerkungList"], row, gColumn["VerstaerkungsGrund"], "Casinoraub", false, false )
	local row = guiGridListAddRow ( gGrid["VerstaerkungList"] )
	guiGridListSetItemText ( gGrid["VerstaerkungList"], row, gColumn["VerstaerkungsGrund"], "Bankraub", false, false )
	local row = guiGridListAddRow ( gGrid["VerstaerkungList"] )
	guiGridListSetItemText ( gGrid["VerstaerkungList"], row, gColumn["VerstaerkungsGrund"], "Mord", false, false )
	local row = guiGridListAddRow ( gGrid["VerstaerkungList"] )
	guiGridListSetItemText ( gGrid["VerstaerkungList"], row, gColumn["VerstaerkungsGrund"], "Geiselnahme", false, false )
	local row = guiGridListAddRow ( gGrid["VerstaerkungList"] )
	guiGridListSetItemText ( gGrid["VerstaerkungList"], row, gColumn["VerstaerkungsGrund"], "Doppelmord", false, false )
	local row = guiGridListAddRow ( gGrid["VerstaerkungList"] )
	guiGridListSetItemText ( gGrid["VerstaerkungList"], row, gColumn["VerstaerkungsGrund"], "Terroristen Anschlag", false, false )
	local row = guiGridListAddRow ( gGrid["VerstaerkungList"] )
	guiGridListSetItemText ( gGrid["VerstaerkungList"], row, gColumn["VerstaerkungsGrund"], "Terrorismus", false, false )
	local row = guiGridListAddRow ( gGrid["VerstaerkungList"] )
	guiGridListSetItemText ( gGrid["VerstaerkungList"], row, gColumn["VerstaerkungsGrund"], "Einbruch SAPD", false, false )
	local row = guiGridListAddRow ( gGrid["VerstaerkungList"] )
	guiGridListSetItemText ( gGrid["VerstaerkungList"], row, gColumn["VerstaerkungsGrund"], "Einbruch FBI", false, false )
	local row = guiGridListAddRow ( gGrid["VerstaerkungList"] )
	guiGridListSetItemText ( gGrid["VerstaerkungList"], row, gColumn["VerstaerkungsGrund"], "Einbruch Army", false, false )

	
	gRadio["FraktionschatRadioButton"] = guiCreateRadioButton(540, 40, 131, 17, "Eigene Fraktion", false, gTab["AllgemeinesTab"])
	gRadio["BeamtenchatRadioButton"] = guiCreateRadioButton(540, 60, 131, 17, "Alle Staatsfraktionen", false, gTab["AllgemeinesTab"])
	guiRadioButtonSetSelected(gRadio["FraktionschatRadioButton"],true)

	gLabel["VerletzteLabel"] = guiCreateLabel(310, 230, 221, 16, "Anzahl Verletze:", false, gTab["AllgemeinesTab"])
	guiLabelSetHorizontalAlign(gLabel["VerletzteLabel"], "left", false)
	guiLabelSetVerticalAlign(gLabel["VerletzteLabel"], "center")
	
	gEdit["VerletzteEdit"] = guiCreateEdit(310, 250, 71, 20, "", false, gTab["AllgemeinesTab"])
	guiEditSetMaxLength(gEdit["VerletzteEdit"], 3)

	
	gButtons["VerstaerkungButton"] = guiCreateButton(540, 100, 121, 41, "Verstärkung rufen", false, gTab["AllgemeinesTab"])
	
	gButtons["NotdienstButton"] = guiCreateButton(410, 250, 121, 23, "Notdienst rufen", false, gTab["AllgemeinesTab"])
	
	addEventHandler("onClientGUIClick", gButtons["VerstaerkungButton"], VerstaerkungBtn, false)

	addEventHandler("onClientGUIClick", gButtons["NotdienstButton"], NotdienstBtn, false)	
--[[	
if getElementData ( getLocalPlayer(), "rang" ) >=5 then
	gTab["AusbildungTab"] = guiCreateTab("Ausbildung", gTabPanel["PolizeicomputerTabmenu"])

	gLabel["MitgliederlisteLabel"] = guiCreateLabel(20, 10, 111, 16, "Mitgliederliste:", false, gTab["AusbildungTab"])
	guiLabelSetHorizontalAlign(gLabel["MitgliederlisteLabel"], "left", false)
	guiLabelSetVerticalAlign(gLabel["MitgliederlisteLabel"], "center")
	
	gGrid["MitgliederList"] = guiCreateGridList(20, 30, 261, 441, false, gTab["AusbildungTab"])
	guiSetAlpha(gGrid["MitgliederList"],1)
	guiGridListSetSelectionMode(gGrid["MitgliederList"],1)
	gGrid["MitgliedCop"] = guiGridListAddColumn(gGrid["MitgliederList"],"Beamter",0.5)
	gGrid["MitgliedRang"] = guiGridListAddColumn(gGrid["MitgliederList"],"Rang",0.25)	
	gGrid["MitgliedGWD"] = guiGridListAddColumn(gGrid["MitgliederList"],"GWD",0.25)	
	
	
	gui["GWDNoteButton"] = guiCreateButton(340, 40, 101, 23, "GWD-Note geben", false, gui["AusbildungTab"])
	if on_GWDNoteButton_clicked then
		addEventHandler("onClientGUIClick", gui["GWDNoteButton"], on_GWDNoteButton_clicked, false)
	end
	
	gui["AcademyNoteButton"] = guiCreateButton(450, 40, 121, 23, "Academy-Note geben", false, gui["AusbildungTab"])
	if on_AcademyNoteButton_clicked then
		addEventHandler("onClientGUIClick", gui["AcademyNoteButton"], on_AcademyNoteButton_clicked, false)
	end
	
	gui["AbsicherungCheckBox"] = guiCreateCheckBox(580, 40, 70, 17, "Sicher?", false, false, gui["AusbildungTab"])
	
	
else
	guiSetVisible( gTab["AusbildungTab"], false)
end]]
	guiSetVisible ( gWindow["policepc"], false )
end


addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), 
	function ()
		_createPDComputerMenue()
	end
)