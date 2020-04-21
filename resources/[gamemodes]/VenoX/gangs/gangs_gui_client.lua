function showGangWindow_func ( msg, gangVehicleCost, money, mats, drugs, memberCount, memberString, gangname, rank1, rank2, rank3 )

	money = formNumberToMoneyString ( money )
	gWindow["gangMenue"] = guiCreateWindow(screenwidth/2-384/2,screenheight/2-587/2,384,587,"Gangmenue",false)
	guiSetAlpha(gWindow["gangMenue"],1)
	
	showCursor ( true )
	setElementClicked ( true )
	toggleAllControls ( false )
	
	gTabPanel["gangMenue"] = guiCreateTabPanel(10,24,365,499,false,gWindow["gangMenue"])
	guiWindowSetMovable ( gWindow["gangMenue"], false )
	guiWindowSetSizable ( gWindow["gangMenue"], false )
	guiSetAlpha(gTabPanel["gangMenue"],1)
	gTab["home"] = guiCreateTab("Home",gTabPanel["gangMenue"])
	guiSetAlpha(gTab["home"],1)
	gMemo[1] = guiCreateMemo(7,22,350,118,msg,false,gTab["home"])
	guiSetAlpha(gMemo[1],1)
	guiMemoSetReadOnly(gMemo[1],true)
	gLabel[1] = guiCreateLabel(159,4,60,15,"Pinnwand",false,gTab["home"])
	guiSetAlpha(gLabel[1],1)
	guiLabelSetColor(gLabel[1],0,200,0)
	guiLabelSetVerticalAlign(gLabel[1],"top")
	guiLabelSetHorizontalAlign(gLabel[1],"left",false)
	guiSetFont(gLabel[1],"default-bold-small")
	gButton["gangEquip"] = guiCreateButton(7,152,82,41,"Ausruesten",false,gTab["home"])
	guiSetAlpha(gButton["gangEquip"],1)
	gLabel[2] = guiCreateLabel(103,153,45,17,"Kosten:",false,gTab["home"])
	guiSetAlpha(gLabel[2],1)
	guiLabelSetColor(gLabel[2],200,0,0)
	guiLabelSetVerticalAlign(gLabel[2],"top")
	guiLabelSetHorizontalAlign(gLabel[2],"left",false)
	guiSetFont(gLabel[2],"default-bold-small")
	gLabel[3] = guiCreateLabel(114,169,33,17,costsToArm.." $",false,gTab["home"])
	guiSetAlpha(gLabel[3],1)
	guiLabelSetColor(gLabel[3],0,200,0)
	guiLabelSetVerticalAlign(gLabel[3],"top")
	guiLabelSetHorizontalAlign(gLabel[3],"left",false)
	guiSetFont(gLabel[3],"default-bold-small")
	gButton["gangBuyCar"] = guiCreateButton(165,151,82,41,"Fahrzeug\nkaufen",false,gTab["home"])
	guiSetAlpha(gButton["gangBuyCar"],1)
	gLabel[4] = guiCreateLabel(262,151,45,17,"Kosten:",false,gTab["home"])
	guiSetAlpha(gLabel[4],1)
	guiLabelSetColor(gLabel[4],200,0,0)
	guiLabelSetVerticalAlign(gLabel[4],"top")
	guiLabelSetHorizontalAlign(gLabel[4],"left",false)
	guiSetFont(gLabel[4],"default-bold-small")
	gLabel[5] = guiCreateLabel(274,169,61,17,"---",false,gTab["home"])
	guiSetAlpha(gLabel[5],1)
	guiLabelSetColor(gLabel[5],0,200,0)
	guiLabelSetVerticalAlign(gLabel[5],"top")
	guiLabelSetHorizontalAlign(gLabel[5],"left",false)
	guiSetFont(gLabel[5],"default-bold-small")
	gButton["gangGunBox"] = guiCreateButton(7,209,82,41,"Waffenbox\noeffnen",false,gTab["home"])
	guiSetAlpha(gButton["gangGunBox"],1)
	gButton["gangSkin"] = guiCreateButton(165,209,82,41,"Gangskin\nannehmen",false,gTab["home"])
	gButton["gangEating"] = guiCreateButton(250,209,82,41,"Heilen",false,gTab["home"])
	guiSetAlpha(gButton["gangSkin"],1)
	gNumberField["gangAmount"] = guiCreateNumberField(9,291,54,35,"0",false,gTab["home"])
	guiSetAlpha(gNumberField["gangAmount"],1)
	gRadio["gangMoney"] = guiCreateRadioButton(72,272,66,23,"Geld",false,gTab["home"])
	guiSetAlpha(gRadio["gangMoney"],1)
	gRadio["gangMats"] = guiCreateRadioButton(72,293,66,23,"Materials",false,gTab["home"])
	guiSetAlpha(gRadio["gangMats"],1)
	gRadio["gangDrugs"] = guiCreateRadioButton(72,314,66,23,"Drogen",false,gTab["home"])
	guiSetAlpha(gRadio["gangDrugs"],1)
	guiRadioButtonSetSelected(gRadio["gangDrugs"],true)
	gButton["gangTake"] = guiCreateButton(150,272,72,32,"Nehmen",false,gTab["home"])
	guiSetAlpha(gButton["gangTake"],1)
	gButton["gangStore"] = guiCreateButton(150,308,72,32,"Lagern",false,gTab["home"])
	guiSetAlpha(gButton["gangStore"],1)
	gLabel[6] = guiCreateLabel(226,277,133,59,"Aktuell:\n"..money.."\n"..mats.." Materialien\n"..drugs.." Gramm Drogen",false,gTab["home"])
	guiSetAlpha(gLabel[6],1)
	guiLabelSetColor(gLabel[6],255,255,255)
	guiLabelSetVerticalAlign(gLabel[6],"top")
	guiLabelSetHorizontalAlign(gLabel[6],"left",false)
	guiSetFont(gLabel[6],"default-bold-small")
	gTab["members"] = guiCreateTab("Mitglieder",gTabPanel["gangMenue"])
	guiSetAlpha(gTab["members"],1)
	
	gGrid["members"] = guiCreateGridList(5,9,190,118,false,gTab["members"])
	guiGridListSetSelectionMode(gGrid["members"],0)
	gColumn["members"] = guiGridListAddColumn(gGrid["members"],"Mitglied",0.6)
	gColumn["rang"] = guiGridListAddColumn(gGrid["members"],"Rang",0.2)
	guiSetAlpha(gGrid["members"],1)
	
	for i = 1, memberCount do
		string = gettok ( memberString, i, string.byte ( ';' ) ).."|"
		local a = gettok ( string, 1, string.byte ( '|' ) )
		local b = gettok ( string, 2, string.byte ( '|' ) )
		local row = guiGridListAddRow ( gGrid["members"] )
		guiGridListSetItemText ( gGrid["members"], row, gColumn["members"], a, false, false )
		guiGridListSetItemText ( gGrid["members"], row, gColumn["rang"], b, false, false )
		if getPlayerFromName ( a ) then
			guiGridListSetItemColor ( gGrid["members"], row, gColumn["members"], 0, 150, 0 )
			guiGridListSetItemColor ( gGrid["members"], row, gColumn["rang"], 0, 150, 0 )
		else
			guiGridListSetItemColor ( gGrid["members"], row, gColumn["members"], 150, 0, 0 )
			guiGridListSetItemColor ( gGrid["members"], row, gColumn["rang"], 150, 0, 0 )
		end
	end
	
	gEdit["gRankToSet"] = guiCreateNumberField ( 201, 11, 28, 35, 1, false, gTab["members"], true, true )
	guiSetAlpha(gEdit["gRankToSet"],1)
	gButton["gSetRank"] = guiCreateButton(258,10,61,37,"Als Rang setzen",false,gTab["members"])
	guiSetAlpha(gButton["gSetRank"],1)
	gGrid["playersOnline"] = guiCreateGridList(5,132,191,110,false,gTab["members"])
	guiGridListSetSelectionMode(gGrid["playersOnline"],0)
	gColumn["pname"] = guiGridListAddColumn(gGrid["playersOnline"],"Spieler",0.8)
	guiSetAlpha(gGrid["playersOnline"],1)
	
	local players = getElementsByType ( "player" )
	for i=1, #players do
		local row = guiGridListAddRow ( gGrid["playersOnline"] )
		guiGridListSetItemText ( gGrid["playersOnline"], row, gColumn["pname"], getPlayerName ( players[i] ), false, false )
	end
	
	gButton["gUninvite"] = guiCreateButton(258,58,61,37,"Uninviten",false,gTab["members"])
	guiSetAlpha(gButton["gUninvite"],1)
	gButton["gInvite"] = guiCreateButton(258,161,61,37,"Inviten",false,gTab["members"])
	guiSetAlpha(gButton["gInvite"],1)
	gEdit["gangYChatMSG"] = guiCreateEdit(6,287,354,43,"",false,gTab["members"])
	guiSetAlpha(gEdit["gangYChatMSG"],1)
	gButton["sendGangMSG"] = guiCreateButton(89,335,206,47,"An Fraktionsmitglieder senden\n( Kurztaste \"Y\" )",false,gTab["members"])
	guiSetAlpha(gButton["sendGangMSG"],1)
	guiSetFont(gButton["sendGangMSG"],"default-bold-small")
	
	gTab[3] = guiCreateTab("Rechte",gTabPanel["gangMenue"])
	guiSetAlpha(gTab[3],1)
	gLabel[7] = guiCreateLabel(3,7,360,19,"Hier kannst du die einzelnen Rechte fuer die Gang zuweisen.",false,gTab[3])
	guiSetAlpha(gLabel[7],1)
	guiLabelSetColor(gLabel[7],255,255,255)
	guiLabelSetVerticalAlign(gLabel[7],"top")
	guiLabelSetHorizontalAlign(gLabel[7],"left",false)
	guiSetFont(gLabel[7],"default-bold-small")
	gCheck["gangDeleteSure"] = guiCreateCheckBox(14,102,71,21,"Sicher?",false,false,gTab[3])
	guiSetAlpha(gCheck["gangDeleteSure"],1)
	guiSetFont(gCheck["gangDeleteSure"],"default-bold-small")
	gButton["deleteGang"] = guiCreateButton(6,56,83,42,"Gang aufloesen",false,gTab[3])
	guiSetAlpha(gButton["deleteGang"],1)
	gLabel[8] = guiCreateLabel(95,58,108,64,"ACHTUNG:\nKann NICHT\nRueckgaengig\ngemacht werden!",false,gTab[3])
	guiSetAlpha(gLabel[8],1)
	guiLabelSetColor(gLabel[8],200,0,0)
	guiLabelSetVerticalAlign(gLabel[8],"top")
	guiLabelSetHorizontalAlign(gLabel[8],"left",false)
	guiSetFont(gLabel[8],"default-bold-small")
	--[[gButton[11] = guiCreateButton(167,234,66,33,"Recht\naendern",false,gTab[3])
	guiSetAlpha(gButton[11],1)
	guiSetFont(gButton[11],"default-bold-small")
	gGrid[3] = guiCreateGridList(11,138,148,181,false,gTab[3])
	guiGridListSetSelectionMode(gGrid[3],2)
	guiGridListAddColumn(gGrid[3],"Recht",0.2)
	guiGridListAddColumn(gGrid[3],"Rang",0.2)
	guiSetAlpha(gGrid[3],1)
	gEdit[4] = guiCreateEdit(179,196,33,35,"3",false,gTab[3])
	guiSetAlpha(gEdit[4],1)
	gLabel[9] = guiCreateLabel(181,179,29,19,"Rang",false,gTab[3])
	guiSetAlpha(gLabel[9],1)
	guiLabelSetColor(gLabel[9],255,255,255)
	guiLabelSetVerticalAlign(gLabel[9],"top")
	guiLabelSetHorizontalAlign(gLabel[9],"left",false)
	guiSetFont(gLabel[9],"default-bold-small")]]
	gTab[4] = guiCreateTab("Einstellungen",gTabPanel["gangMenue"])
	guiSetAlpha(gTab[4],1)
	gEdit["newGangName"] = guiCreateEdit(6,22,114,33,gangname,false,gTab[4])
	guiSetAlpha(gEdit["newGangName"],1)
	gLabel[10] = guiCreateLabel(25,5,77,14,"Gangname",false,gTab[4])
	guiSetAlpha(gLabel[10],1)
	guiLabelSetColor(gLabel[10],255,255,255)
	guiLabelSetVerticalAlign(gLabel[10],"top")
	guiLabelSetHorizontalAlign(gLabel[10],"left",false)
	guiSetFont(gLabel[10],"default-bold-small")
	gLabel[11] = guiCreateLabel(132,10,226,49,"Der Name deiner Gang -\nACHTUNG: Unpassende Namen koennen\nzur Loeschung der Gang fuehren!",false,gTab[4])
	guiSetAlpha(gLabel[11],1)
	guiLabelSetColor(gLabel[11],255,255,255)
	guiLabelSetVerticalAlign(gLabel[11],"top")
	guiLabelSetHorizontalAlign(gLabel[11],"left",false)
	guiSetFont(gLabel[11],"default-bold-small")
	gNumberfield["gangCarSlot"] = guiCreateNumberField ( 6,125,37,33,0,false,gTab[4])
	guiSetAlpha(gNumberfield["gangCarSlot"],1)
	gLabel[12] = guiCreateLabel(6,108,82,15,"Fahrzeugsslot",false,gTab[4])
	guiSetAlpha(gLabel[12],1)
	guiLabelSetColor(gLabel[12],255,255,255)
	guiLabelSetVerticalAlign(gLabel[12],"top")
	guiLabelSetHorizontalAlign(gLabel[12],"left",false)
	guiSetFont(gLabel[12],"default-bold-small")
	gLabel[13] = guiCreateLabel(54,127,307,28,"Das hier eingetragene Fahrzeug kann von allen Gang-\nmitgliedern gekauft werden.",false,gTab[4])
	guiSetAlpha(gLabel[13],1)
	guiLabelSetColor(gLabel[13],255,255,255)
	guiLabelSetVerticalAlign(gLabel[13],"top")
	guiLabelSetHorizontalAlign(gLabel[13],"left",false)
	guiSetFont(gLabel[13],"default-bold-small")
	gButton["setSkin"] = guiCreateButton(6,425,118,39,"Eigenen Skin als Gang-Skin festlegen",false,gTab[4])
	guiSetAlpha(gButton["setSkin"],1)
	gButton[13] = guiCreateButton(124,159,123,35,"Fraktionsfahrzeug aendern",false,gTab[4])
	guiSetAlpha(gButton[13],1)
	gButton["changeName"] = guiCreateButton(114,58,123,35,"Gangname aendern",false,gTab[4])
	guiSetAlpha(gButton["changeName"],1)
	gMemo["gangPinnboard"] = guiCreateMemo(7,224,350/2,118,"",false,gTab[4])
	guiSetAlpha(gMemo["gangPinnboard"],1)
	gLabel[14] = guiCreateLabel(149/2,209,59,16,"Pinnwand",false,gTab[4])
	guiSetAlpha(gLabel[14],1)
	guiLabelSetColor(gLabel[14],255,255,255)
	guiLabelSetVerticalAlign(gLabel[14],"top")
	guiLabelSetHorizontalAlign(gLabel[14],"left",false)
	guiSetFont(gLabel[14],"default-bold-small")
	gButton["changePinboard"] = guiCreateButton(7,350,115,38,"Pinnwandtext aendern",false,gTab[4])
	guiSetAlpha(gButton["changePinboard"],1)
	gGrid["gangWeapons"] = guiCreateGridList(125,350,125,112,false,gTab[4])
	guiGridListSetSelectionMode(gGrid["gangWeapons"],2)
	gColumn["gun"] = guiGridListAddColumn(gGrid["gangWeapons"],"Waffe",0.8)
	
	gangWeaponRowIDs = {}
	for key, index in pairs ( validWeaponsForGang ) do
		local row = guiGridListAddRow ( gGrid["gangWeapons"] )
		gangWeaponRowIDs[row] = key
		guiGridListSetItemText ( gGrid["gangWeapons"], row, gColumn["gun"], weaponNames[key], false, false )
	end
	guiSetAlpha(gGrid["gangWeapons"],1)
	
	gButton["changeGangWeapon"] = guiCreateButton(7,391,115,33,"Waffe aendern",false,gTab[4])
	guiSetAlpha(gButton["changeGangWeapon"],1)
	
	gMemo["rank1"] = guiCreateMemo(227,350-125,85,34,rank1,false,gTab[4])
	guiSetAlpha(gMemo["rank1"],1)
	gMemo["rank2"] = guiCreateMemo(227,389-125,85,34,rank2,false,gTab[4])
	guiSetAlpha(gMemo["rank2"],1)
	gMemo["rank3"] = guiCreateMemo(227,428-125,85,34,rank3,false,gTab[4])
	guiSetAlpha(gMemo["rank3"],1)
	
	gLabel[15] = guiCreateLabel(313,357-125,43,21,"Rang 1",false,gTab[4])
	guiSetAlpha(gLabel[15],1)
	guiLabelSetColor(gLabel[15],255,255,255)
	guiLabelSetVerticalAlign(gLabel[15],"top")
	guiLabelSetHorizontalAlign(gLabel[15],"left",false)
	gLabel[16] = guiCreateLabel(314,436-125,43,21,"Rang 3",false,gTab[4])
	guiSetAlpha(gLabel[16],1)
	guiLabelSetColor(gLabel[16],255,255,255)
	guiLabelSetVerticalAlign(gLabel[16],"top")
	guiLabelSetHorizontalAlign(gLabel[16],"left",false)
	gLabel[17] = guiCreateLabel(313,394-125,43,21,"Rang 2",false,gTab[4])
	guiSetAlpha(gLabel[17],1)
	guiLabelSetColor(gLabel[17],255,255,255)
	guiLabelSetVerticalAlign(gLabel[17],"top")
	guiLabelSetHorizontalAlign(gLabel[17],"left",false)
	gButton["changeRanks"] = guiCreateButton(250,391,90,33,"Rangnamen aendern",false,gTab[4])
	guiSetAlpha(gButton["changeRanks"],1)
	gButton["closeGangWindow"] = guiCreateButton(125,533,115,37,"Menue schliessen",false,gWindow["gangMenue"])
	guiSetAlpha(gButton["closeGangWindow"],1)
	addEventHandler ( "onClientGUIClick", gButton["closeGangWindow"],
		function ()
			destroyElement ( gWindow["gangMenue"] )
			setElementClicked ( false )
			showCursor ( false )
			guiSetInputEnabled ( true )
		end,
	false )
	
	addEventHandler ( "onClientGUIClick", gButton["gSetRank"],
		function ()
			local rank = tonumber ( guiGetText ( gEdit["gRankToSet"] ) )
			if rank <= 3 and rank >= 1 then
				local row, _ = guiGridListGetSelectedItem ( gGrid["members"] )
				local player = guiGridListGetItemText ( gGrid["members"], row, gColumn["members"] )
				triggerServerEvent ( "gangLeaderChangeRecieve", lp, "giveRank", player, rank )
				reopenGangGUI ()
			else
				outputChatBox ( "Ungueltiger Rang!", 125, 0, 0 )
			end
		end,
	false )
	
	addEventHandler ( "onClientGUIClick", gButton["gangEating"],
		function ()
			triggerServerEvent ( "gangEatServer", lp, lp )
		end,
	false )
	
	addEventHandler ( "onClientGUIClick", gButton["deleteGang"],
		function ()
			if guiCheckBoxGetSelected ( gCheck["gangDeleteSure"] ) then
				triggerServerEvent ( "gangLeaderChangeRecieve", lp, "deleteGang" )
				destroyElement ( gWindow["gangMenue"] )
				setElementClicked ( false )
				showCursor ( false )
				guiSetInputEnabled ( true )
			end
		end,
	false )
	
	addEventHandler ( "onClientGUIClick", gButton["changeName"],
		function ()
			triggerServerEvent ( "gangLeaderChangeRecieve", lp, "renameGang", guiGetText ( gEdit["newGangName"] ) )
			reopenGangGUI ()
		end,
	false )
	
	addEventHandler ( "onClientGUIClick", gButton["gSetRank"],
		function ()
			local row, _ = guiGridListGetSelectedItem ( gGrid["members"] )
			local player = guiGridListGetItemText ( gGrid["members"], row, gColumn["members"] )
			triggerServerEvent ( "gangLeaderChangeRecieve", lp, "giveRank", player, guiGetText ( gEdit["gRankToSet"] ) )
			reopenGangGUI ()
		end,
	false )
	
	addEventHandler ( "onClientGUIClick", gButton["gUninvite"],
		function ()
			local row, _ = guiGridListGetSelectedItem ( gGrid["members"] )
			local player = guiGridListGetItemText ( gGrid["members"], row, gColumn["members"] )
			triggerServerEvent ( "gangLeaderChangeRecieve", lp, "uninvite", player, guiGetText ( gEdit["gRankToSet"] ) )
			reopenGangGUI ()
		end,
	false )
	addEventHandler ( "onClientGUIClick", gButton["gInvite"],
		function ()
			local row, _ = guiGridListGetSelectedItem ( gGrid["playersOnline"] )
			local player = guiGridListGetItemText ( gGrid["playersOnline"], row, gColumn["pname"] )
			triggerServerEvent ( "gangLeaderChangeRecieve", lp, "invite", player, guiGetText ( gEdit["gRankToSet"] ) )
			reopenGangGUI ()
		end,
	false )
	
	addEventHandler ( "onClientGUIClick", gButton["changePinboard"],
		function ()
			triggerServerEvent ( "gangLeaderChangeRecieve", lp, "pinboard", guiGetText ( gMemo["gangPinnboard"] ) )
			reopenGangGUI ()
		end,
	false )
	
	addEventHandler ( "onClientGUIClick", gButton["gangSkin"],
		function ()
			triggerServerEvent ( "gangLeaderChangeRecieve", lp, "useSkin" )
		end,
	false )
	
	addEventHandler ( "onClientGUIClick", gButton["setSkin"],
		function ()
			triggerServerEvent ( "gangLeaderChangeRecieve", lp, "setSkin" )
		end,
	false )
	
	addEventHandler ( "onClientGUIClick", gButton["gangEquip"],
		function ()
			triggerServerEvent ( "gangLeaderChangeRecieve", lp, "equip" )
		end,
	false )
	
	addEventHandler ( "onClientGUIClick", gButton["gangGunBox"],
		function ()
			_createGunboxMenue ()
			guiSetInputEnabled ( true )
			destroyElement ( gWindow["gangMenue"] )
		end,
	false )
	
	addEventHandler ( "onClientGUIClick", gButton["gangBuyCar"],
		function ()
			destroyElement ( gWindow["gangMenue"] )
			setElementClicked ( false )
			showCursor ( false )
			guiSetInputEnabled ( true )
		end,
	false )
	
	addEventHandler ( "onClientGUIClick", gButton["gangTake"],
		function ()
			gangTakeStore ( "take" )
		end,
	false )
	addEventHandler ( "onClientGUIClick", gButton["gangStore"],
		function ()
			gangTakeStore ( "store" )
		end,
	false )
	
	addEventHandler ( "onClientGUIClick", gButton["changeRanks"],
		function ()
			triggerServerEvent ( "gangLeaderChangeRecieve", lp, "renameRanks", guiGetText ( gMemo["rank1"] ), guiGetText ( gMemo["rank2"] ), guiGetText ( gMemo["rank3"] ) )
		end,
	false )
	
	addEventHandler ( "onClientGUIClick", gButton["sendGangMSG"],
		function ()
			triggerServerEvent ( "gangLeaderChangeRecieve", lp, "sendMSGToGang", guiGetText ( gEdit["gangYChatMSG"] ) )
			guiSetText ( gEdit["gangYChatMSG"], "" )
		end,
	false )
	
	addEventHandler ( "onClientGUIClick", gButton["changeGangWeapon"],
		function ()
			local row, _ = guiGridListGetSelectedItem ( gGrid["gangWeapons"] )
			triggerServerEvent ( "gangLeaderChangeRecieve", lp, "changeGangWeapon", gangWeaponRowIDs[row] )
		end,
	false )
	
	guiSetInputEnabled ( false )
end
addEvent ( "showGangWindow", true )
addEventHandler ( "showGangWindow", getRootElement(), showGangWindow_func )

function gangTakeStore ( cmd )

	local fix = ""
	if guiRadioButtonGetSelected ( gRadio["gangMoney"] ) then
		fix = "money"
	elseif guiRadioButtonGetSelected ( gRadio["gangMats"] ) then
		fix = "mats"
	elseif guiRadioButtonGetSelected ( gRadio["gangDrugs"] ) then
		fix = "drugs"
	else
		return nil
	end
	triggerServerEvent ( "gangLeaderChangeRecieve", lp, cmd, fix, tonumber ( guiGetText ( gNumberField["gangAmount"] ) ) )
	reopenGangGUI ()
end

function reopenGangGUI ()

	destroyElement ( gWindow["gangMenue"] )
	setElementClicked ( false )
	showCursor ( false )
	guiSetInputEnabled ( true )
	triggerServerEvent ( "showGangGUIAgain", lp )
end