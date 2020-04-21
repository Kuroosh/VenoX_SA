local isshown = false

function hideAllSecPlayerClickWindows ()
	if gWindow["itemsGive"] then
		guiSetVisible ( gWindow["itemsGive"], false )
	end
	if gWindow["waffendealer"] then
		guiSetVisible ( gWindow["waffendealer"], false )
	end
	if gWindow["drogenverkauf"] then 
		guiSetVisible ( gWindow["drogenverkauf"], false )
	end
	if gWindow["sellHotdog"] then
		guiSetVisible ( gWindow["sellHotdog"], false )
	end
	if gWindow["playerInteraktionShow"] then
		guiSetVisible ( gWindow["playerInteraktionShow"], false )
	end
	if gWindow["stateInteraction"] then
		guiSetVisible ( gWindow["stateInteraction"], false )
	end
end

function hideAllPlayerClickWindows ()

	hideAllSecPlayerClickWindows ()
	guiSetVisible ( gWindow["playerInteraktion"], false )
	triggerServerEvent ( "cancel_gui_server", lp )
	showCursor ( false )
end

function showJobMenues(button)
	if button == "left" then
		local job = vnxClientGetElementData ( "job" )
		if job == "wdealer" then
			hideAllSecPlayerClickWindows ()
			wDealerWindow()
		elseif job == "dealer" then
			hideAllSecPlayerClickWindows ()
			showDrugMenue()
		elseif job == "hotdog" then
			hideAllSecPlayerClickWindows ()
			giveHotDogGui()
		else
			outputChatBox ( "Du hast einen ungueltigen Beruf!", 125, 0, 0 )
		end
	end
end

function showZeigenMenue ()

	hideAllSecPlayerClickWindows ()
	if gWindow["playerInteraktionShow"] then
		guiSetVisible ( gWindow["playerInteraktionShow"], true )
	else
		gWindow["playerInteraktionShow"] = guiCreateWindow(screenwidth/2-176/2,145,176,78,"Zeigen",false)
		guiSetAlpha(gWindow["playerInteraktionShow"],1)
		
		gButton["playerInteractionShowLicenses"] = guiCreateButton(10,27,74,41,"Scheine",false,gWindow["playerInteraktionShow"])
		guiSetAlpha(gButton["playerInteractionShowLicenses"],1)
		gButton["playerInteractionShowGWD"] = guiCreateButton(90,27,74,41,"GWD-Note",false,gWindow["playerInteraktionShow"])
		guiSetAlpha(gButton["playerInteractionShowGWD"],1)
		
		addEventHandler ( "onClientGUIClick", gButton["playerInteractionShowLicenses"],
			function ( btn, state )
				if state == "up" then
					triggerServerEvent ( "showLicenses", lp, lp )
				end
			end,
		false )
		addEventHandler ( "onClientGUIClick", gButton["playerInteractionShowGWD"],
			function ( btn, state )
				if state == "up" then
					triggerServerEvent ( "showGWD", lp, lp )
				end
			end,
		false )
	end
end

function showFactionMenue ()
	if gWindow["stateInteraction"] then
		guiSetVisible ( gWindow["stateInteraction"], true )
	else
		gWindow["stateInteraction"] = guiCreateWindow(screenwidth/2-172/2,145,172,153,"Staatsfraktion",false)
		guiSetAlpha(gWindow["stateInteraction"],1)
		
		gButton["stateInteractionCuff"] = guiCreateButton(9,26,74,35,"Fesseln",false,gWindow["stateInteraction"])
		guiSetAlpha(gButton["stateInteractionCuff"],1)
		gButton["stateInteractionTakeWeapons"] = guiCreateButton(90,26,74,35,"Entwaffnen",false,gWindow["stateInteraction"])
		guiSetAlpha(gButton["stateInteractionTakeWeapons"],1)
		gButton["stateInteractionTakeIllegal"] = guiCreateButton(9,66,74,35,"Illegales Abnehmen",false,gWindow["stateInteraction"])
		guiSetAlpha(gButton["stateInteractionTakeIllegal"],1)
		gButton["stateInteractionFrisk"] = guiCreateButton(90,66,74,35,"Durchsuchen",false,gWindow["stateInteraction"])
		guiSetAlpha(gButton["stateInteractionFrisk"],1)
		gButton["stateInteractionDrugTest"] = guiCreateButton(9,106,74,35,"Drogen / Alkohol\nTest",false,gWindow["stateInteraction"])
		guiSetAlpha(gButton["stateInteractionDrugTest"],1)
		gButton["stateInteractionTakeGunlicense"] = guiCreateButton(90,106,74,35,"Waffenschein\nabnehmen",false,gWindow["stateInteraction"])
		guiSetAlpha(gButton["stateInteractionTakeGunlicense"],1)
		
		addEventHandler ( "onClientGUIClick", gButton["stateInteractionCuff"],
			function ( btn, state )
				if state == "up" then
					triggerServerEvent ( "cuffGUI", lp, lp, "cuff", vnxClientGetElementData("curclicked") )
				end
			end,
		false )
		addEventHandler ( "onClientGUIClick", gButton["stateInteractionTakeWeapons"],
			function ( btn, state )
				if state == "up" then
					triggerServerEvent ( "takeweapons", lp, lp, "takeweapons", vnxClientGetElementData("curclicked") )
				end
			end,
		false )
		addEventHandler ( "onClientGUIClick", gButton["stateInteractionFrisk"],
			function ( btn, state )
				if state == "up" then
					triggerServerEvent ( "friskGUI", lp, lp, "frisk", vnxClientGetElementData("curclicked") )
				end
			end,
		false )
		addEventHandler ( "onClientGUIClick", gButton["stateInteractionTakeIllegal"],
			function ( btn, state )
				if state == "up" then
					triggerServerEvent ( "takeillegalGUI", lp, lp, "takeillegal", vnxClientGetElementData("curclicked") )
				end
			end,
		false )
		addEventHandler ( "onClientGUIClick", gButton["stateInteractionDrugTest"],
			function ( btn, state )
				if state == "up" then
					triggerServerEvent ( "test", lp, lp, "test", vnxClientGetElementData("curclicked") )
				end
			end,
		false )
		addEventHandler ( "onClientGUIClick", gButton["stateInteractionTakeGunlicense"],
			function ( btn, state )
				if state == "up" then
					triggerServerEvent ( "takegunlicenseGUI", lp, vnxClientGetElementData("curclicked") )
				end
			end,
		false )
	end
end

function ShowInteraktionsguiGui_func ()

	if gWindow["playerInteraktion"] then
		guiSetVisible ( gWindow["playerInteraktion"], true )
	else
		gWindow["playerInteraktion"] = guiCreateWindow(screenwidth/2-211/2,0,211,132,"Interaktion",false)
		guiSetAlpha(gWindow["playerInteraktion"],1)
		
		gButton["playerInteraktionShow"] = guiCreateButton(9,48,60,34,"Zeigen",false,gWindow["playerInteraktion"])
		guiSetAlpha(gButton["playerInteraktionShow"],1)
		gButton["playerInteraktionGive"] = guiCreateButton(77,48,60,34,"Geben",false,gWindow["playerInteraktion"])
		guiSetAlpha(gButton["playerInteraktionGive"],1)
		gButton["playerInteraktionFriendlist"] = guiCreateButton(145,48,57,34,"Zur Friendlist",false,gWindow["playerInteraktion"])
		guiSetAlpha(gButton["playerInteraktionFriendlist"],1)
		gButton["playerInteraktionJob"] = guiCreateButton(9,87,60,34,"Job",false,gWindow["playerInteraktion"])
		guiSetAlpha(gButton["playerInteraktionJob"],1)
		gButton["playerInteraktionFaction"] = guiCreateButton(77,87,60,34,"Fraktion",false,gWindow["playerInteraktion"])
		guiSetAlpha(gButton["playerInteraktionFaction"],1)
		gButton["playerInteraktionClose"] = guiCreateButton(145,87,60,34,"Schliessen",false,gWindow["playerInteraktion"])
		guiSetAlpha(gButton["playerInteraktionClose"],1)
		
		gLabel["playerInteraktionInfo1"] = guiCreateLabel(10,22,111,22,"Name des Spielers:",false,gWindow["playerInteraktion"])
		guiSetAlpha(gLabel["playerInteraktionInfo1"],1)
		guiLabelSetColor(gLabel["playerInteraktionInfo1"],200,200,000)
		guiLabelSetVerticalAlign(gLabel["playerInteraktionInfo1"],"top")
		guiLabelSetHorizontalAlign(gLabel["playerInteraktionInfo1"],"left",false)
		guiSetFont(gLabel["playerInteraktionInfo1"],"default-bold-small")
		
		gLabel["playerInteraktionClickedPlayer"] = guiCreateLabel(121,23,82,20,"",false,gWindow["playerInteraktion"])
		guiSetAlpha(gLabel["playerInteraktionClickedPlayer"],1)
		guiLabelSetColor(gLabel["playerInteraktionClickedPlayer"],125,200,200)
		guiLabelSetVerticalAlign(gLabel["playerInteraktionClickedPlayer"],"top")
		guiLabelSetHorizontalAlign(gLabel["playerInteraktionClickedPlayer"],"left",false)
		guiSetFont(gLabel["playerInteraktionClickedPlayer"],"default-bold-small")
		
		addEventHandler ( "onClientGUIClick", gButton["playerInteraktionClose"], hideAllPlayerClickWindows, false )
		addEventHandler ( "onClientGUIClick", gButton["playerInteraktionShow"], showZeigenMenue, false )
		addEventHandler ( "onClientGUIClick", gButton["playerInteraktionJob"], showJobMenues, false )
		addEventHandler ( "onClientGUIClick", gButton["playerInteraktionFaction"],
			function ( btn, state )
				if getElementData ( lp, "fraktion" ) == 1 or getElementData ( lp, "fraktion" ) == 6 or getElementData ( lp, "fraktion" ) == 8 then
					showFactionMenue()
				else
					outputChatBox ( "Du bist in keiner gueltigen Fraktion!", 125, 0, 0 )
				end
			end,
		false )
		
		addEventHandler ( "onClientGUIClick", gButton["playerInteraktionFriendlist"],
			function ( btn, state )
				if state == "up" then
					triggerServerEvent ( "addFriend", getRootElement(), lp, vnxClientGetElementData("curclicked") )
				end
			end,
		false )
		addEventHandler ( "onClientGUIClick", gButton["playerInteraktionGive"],
			function ( btn, state )
				if state == "up" then
					hideAllSecPlayerClickWindows ()
					showItemGiveList()
				end
			end,
		false )
	end
	guiSetText ( gLabel["playerInteraktionClickedPlayer"], vnxClientGetElementData("curclicked") )
end
addEvent ( "ShowInteraktionsguiGui", true )
addEventHandler ( "ShowInteraktionsguiGui", getRootElement(), ShowInteraktionsguiGui_func )