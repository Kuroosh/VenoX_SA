-------------------------
------- (c) 2010 --------
------- by Zipper -------
-- and Vio MTA:RL Crew --
-------------------------
respawnCMDs = { ["faggio"]="faggio",
 ["sfpd"]="sfpd",
 ["mafia"]="mafia",
 ["triaden"]="triaden",
 ["news"]="news",
 ["feuerwehr"]="feuerwehr",
 ["fbi"]="fbi",
 ["MS13"]="MS13",
 ["army"]="army",
 ["biker"]="biker",
 ["fishing"]="fishing",
 ["taxi"]="taxi",
 ["hotdog"]="hotdog"
}

function showAdminMenue ()

	if gWindow["plistadmin"] then
		guiSetVisible ( gWindow["plistadmin"], true )
	else
		gWindow["plistadmin"] = guiCreateStaticImage(screenwidth/2-568/2,120,568,585,"images/hud/Background.png",false)
		guiSetAlpha(gWindow["plistadmin"],1)
		guiWindowSetMovable ( gWindow["plistadmin"], true )
		
		gGrid["plistadmin"] = guiCreateGridList(9,27,229,543,false,gWindow["plistadmin"])
		guiGridListSetSelectionMode(gGrid["plistadmin"],0)
		gColumn["adminName"] = guiGridListAddColumn(gGrid["plistadmin"],"Spieler",0.6)
		gColumn["adminPing"] = guiGridListAddColumn(gGrid["plistadmin"],"Ping",0.2)
		
		guiSetAlpha(gGrid["plistadmin"],1)
		gTabPanel["adminMenue"] = guiCreateTabPanel(241,29,318,541,false,gWindow["plistadmin"])
		guiSetAlpha(gTabPanel["adminMenue"],1)
		
		gTab[1] = guiCreateTab("Basis",gTabPanel["adminMenue"])
		guiSetAlpha(gTab[1],1)
		gImage[1] = guiCreateStaticImage(5,7,76,43,"images/colors/c_red.jpg",false,gTab[1])
		guiSetAlpha(gImage[1],1)
		gLabel[1] = guiCreateLabel(8,7,57,29,"Notfallab-\nschaltung",false,gImage[1])
		guiSetAlpha(gLabel[1],1)
		guiLabelSetColor(gLabel[1],255,255,255)
		guiLabelSetVerticalAlign(gLabel[1],"top")
		guiLabelSetHorizontalAlign(gLabel[1],"left",false)
		guiSetFont(gLabel[1],"default-bold-small")
		gCheck[1] = guiCreateCheckBox(87,18,198,18,"Wirklich dauerhaft abschalten?",false,false,gTab[1])
		guiSetAlpha(gCheck[1],1)
		guiSetFont(gCheck[1],"default-bold-small")
		addEventHandler ( "onClientGUIClick", gImage[1], 
			function ()
				if source == gImage[1] or source == gLabel[1] then
					if guiCheckBoxGetSelected ( gCheck[1] ) then
						triggerServerEvent ( "executeAdminServerCMD", lp, "shut" )
					else
						outputChatBox ( "Bitte aktiviere das Kontrollkaestchen!", 125, 0, 0 )
					end
				end
			end
		)

		gGrid["respawnList"] = guiCreateGridList(107,336,179,162,false,gTab[1])
		guiGridListSetSelectionMode(gGrid["respawnList"],0)
		gColumn["respawnList"] = guiGridListAddColumn(gGrid["respawnList"],"Spieler",0.8)
		
		for key, index in pairs ( respawnCMDs ) do
			local row = guiGridListAddRow ( gGrid["respawnList"] )
			guiGridListSetItemText ( gGrid["respawnList"], row, gColumn["respawnList"], key, false, false )
		end
		
		gButton["adminRespawn"] = guiCreateButton(4,394,79,38,"Respawnen",false,gTab[1])
		addEventHandler ( "onClientGUIClick", gButton["adminRespawn"], 
			function ( btn, state )
				if state == "up" then
				
					if guiGetText( gEdit[15] ) ~= "" then
					
						triggerServerEvent ( "executeAdminServerCMD", lp, "crespawn", tonumber(guiGetText( gEdit[15] )) )
					
					else
				
						row, column = guiGridListGetSelectedItem(gGrid["respawnList"])
						veh = guiGridListGetItemText ( gGrid["respawnList"], row, column )
						triggerServerEvent ( "executeAdminServerCMD", lp, "respawn", veh )
					
					end
					
				end
			end,
		false)
		
		gButton[1] = guiCreateButton(4,62,79,38,"Kick",false,gTab[1])
		guiSetAlpha(gButton[1],1)
		addEventHandler ( "onClientGUIClick", gButton[1], 
			function ()
				row, column = guiGridListGetSelectedItem(gGrid["plistadmin"])
				player = guiGridListGetItemText ( gGrid["plistadmin"], row, column )
				triggerServerEvent ( "executeAdminServerCMD", lp, "rkick", player.." "..guiGetText ( gMemo[1] ) )
			end,
		false )
		gButton[2] = guiCreateButton(5,106,79,38,"Ban",false,gTab[1])
		guiSetAlpha(gButton[2],1)
		addEventHandler ( "onClientGUIClick", gButton[2], 
			function ()
				row, column = guiGridListGetSelectedItem(gGrid["plistadmin"])
				player = guiGridListGetItemText ( gGrid["plistadmin"], row, column )
				triggerServerEvent ( "executeAdminServerCMD", lp, "rban", player.." "..guiGetText ( gMemo[1] ) )
			end,
		false )
		gButton[3] = guiCreateButton(5,149,79,38,"Warn",false,gTab[1])
		guiSetAlpha(gButton[3],1)
		addEventHandler ( "onClientGUIClick", gButton[3], 
			function ()
				row, column = guiGridListGetSelectedItem(gGrid["plistadmin"])
				
				if not row then
					player = guiGetText ( gEdit[2] )
				else
					player = guiGridListGetItemText ( gGrid["plistadmin"], row, column )
				end
				triggerServerEvent ( "warn", lp, player, guiGetText ( gEdit[1] ), guiGetText ( gMemo[1] ) )
			end,
		false )
		gButton[4] = guiCreateButton(6,193,79,38,"Timeban",false,gTab[1])
		guiSetAlpha(gButton[4],1)
		addEventHandler ( "onClientGUIClick", gButton[4], 
			function ()
				row, column = guiGridListGetSelectedItem(gGrid["plistadmin"])
				player = guiGridListGetItemText ( gGrid["plistadmin"], row, column )
				triggerServerEvent ( "executeAdminServerCMD", lp, "tban", player.." "..guiGetText ( gEdit[1] ).." "..guiGetText ( gMemo[1] ) )
			end,
		false )
		gMemo[1] = guiCreateMemo(92,78,212,110,"",false,gTab[1])
		guiSetAlpha(gMemo[1],1)
		gLabel[2] = guiCreateLabel(119,61,39,17,"Grund:",false,gTab[1])
		guiSetAlpha(gLabel[2],1)
		guiLabelSetColor(gLabel[2],255,255,255)
		guiLabelSetVerticalAlign(gLabel[2],"top")
		guiLabelSetHorizontalAlign(gLabel[2],"left",false)
		guiSetFont(gLabel[2],"default-bold-small")
		gEdit[1] = guiCreateEdit(174,192,86,41,"",false,gTab[1])
		guiSetAlpha(gEdit[1],1)
		gLabel[3] = guiCreateLabel(141,204,29,16,"Zeit:",false,gTab[1])
		guiSetAlpha(gLabel[3],1)
		guiLabelSetColor(gLabel[3],200,00,0)
		guiLabelSetVerticalAlign(gLabel[3],"top")
		guiLabelSetHorizontalAlign(gLabel[3],"left",false)
		guiSetFont(gLabel[3],"default-bold-small")
		gLabel[4] = guiCreateLabel(264,202-15,48,55,"Stunden\n(TBan)\nTage\n(Warn)",false,gTab[1])
		guiSetAlpha(gLabel[4],1)
		guiLabelSetColor(gLabel[4],255,255,255)
		guiLabelSetVerticalAlign(gLabel[4],"top")
		guiLabelSetHorizontalAlign(gLabel[4],"left",false)
		guiSetFont(gLabel[4],"default-bold-small")
		gButton[5] = guiCreateButton(6,236,79,38,"Entbannen",false,gTab[1])
		guiSetAlpha(gButton[5],1)
		addEventHandler ( "onClientGUIClick", gButton[5], 
			function ()
				triggerServerEvent ( "executeAdminServerCMD", lp, "unban", guiGetText ( gEdit[2] ) )
			end,
		false )
		gButton["playerToCheckWarns"] = guiCreateButton(6,236+15+34,79,38,"Warns\nPrüfen",false,gTab[1])
		guiSetAlpha(gButton["playerToCheckWarns"],1)
		addEventHandler ( "onClientGUIClick", gButton["playerToCheckWarns"], 
			function ()
				row, column = guiGridListGetSelectedItem(gGrid["plistadmin"])
				
				if not row then
					player = guiGetText ( gEdit[2] )
				else
					player = guiGridListGetItemText ( gGrid["plistadmin"], row, column )
				end
				triggerServerEvent ( "checkwarns", lp, player )
			end,
		false )
		gButton["playerToCheckIP"] = guiCreateButton(6,236+15*2+34*2,79,38,"IP\nPrüfen",false,gTab[1])
		guiSetAlpha(gButton["playerToCheckIP"],1)
		addEventHandler ( "onClientGUIClick", gButton["playerToCheckIP"], 
			function ()
				row, column = guiGridListGetSelectedItem(gGrid["plistadmin"])
				
				if not row then
					player = guiGetText ( gEdit[2] )
				else
					player = guiGridListGetItemText ( gGrid["plistadmin"], row, column )
				end
				triggerServerEvent ( "getip", lp, lp, "getip", player )
			end,
		false )
		gLabel[5] = guiCreateLabel(92,244,104,29,"Spielername:",false,gTab[1])
		guiSetAlpha(gLabel[5],1)
		guiLabelSetColor(gLabel[5],255,255,255)
		guiLabelSetVerticalAlign(gLabel[5],"top")
		guiLabelSetHorizontalAlign(gLabel[5],"left",false)
		guiSetFont(gLabel[5],"default-bold-small")
		gEdit[2] = guiCreateEdit(175,238,92,34,"",false,gTab[1])
		guiSetAlpha(gEdit[2],1)
		gTab[2] = guiCreateTab("Raeumlich",gTabPanel["adminMenue"])
		guiSetAlpha(gTab[2],1)
		gButton[6] = guiCreateButton(4,6,81,39,"Zum Spieler teleportieren",false,gTab[2])
		guiSetAlpha(gButton[6],1)
		addEventHandler ( "onClientGUIClick", gButton[6], 
			function ()
				row, column = guiGridListGetSelectedItem(gGrid["plistadmin"])
				player = guiGridListGetItemText ( gGrid["plistadmin"], row, column )
				triggerServerEvent ( "executeAdminServerCMD", lp, "goto", player )
			end,
		false )
		gButton[7] = guiCreateButton(4,52,81,39,"Spieler her teleportieren",false,gTab[2])
		guiSetAlpha(gButton[7],1)
		addEventHandler ( "onClientGUIClick", gButton[7], 
			function ()
				row, column = guiGridListGetSelectedItem(gGrid["plistadmin"])
				player = guiGridListGetItemText ( gGrid["plistadmin"], row, column )
				triggerServerEvent ( "executeAdminServerCMD", lp, "gethere", player )
			end,
		false )
		
		gButton["move_left"] = guiCreateButton(100,100,20,20,"*",false,gTab[2])
		guiSetAlpha(gButton["move_left"],1)
		addEventHandler ( "onClientGUIClick", gButton["move_left"], 
			function ()
				triggerServerEvent ( "move", lp, lp, "move", "left" )
			end,
		false )
		gButton["move_up"] = guiCreateButton(120,80,20,20,"*",false,gTab[2])
		guiSetAlpha(gButton["move_up"],1)
		addEventHandler ( "onClientGUIClick", gButton["move_up"], 
			function ()
				triggerServerEvent ( "move", lp, lp, "move", "up" )
			end,
		false )
		gButton["move_right"] = guiCreateButton(140,100,20,20,"*",false,gTab[2])
		guiSetAlpha(gButton["move_right"],1)
		addEventHandler ( "onClientGUIClick", gButton["move_right"], 
			function ()
				triggerServerEvent ( "move", lp, lp, "move", "right" )
			end,
		false )
		gButton["move_down"] = guiCreateButton(120,120,20,20,"*",false,gTab[2])
		guiSetAlpha(gButton["move_down"],1)
		addEventHandler ( "onClientGUIClick", gButton["move_down"], 
			function ()
				triggerServerEvent ( "move", lp, lp, "move", "down" )
			end,
		false )
		gButton["move_higher"] = guiCreateButton(100,80,20,20,"+",false,gTab[2])
		guiSetAlpha(gButton["move_higher"],1)
		addEventHandler ( "onClientGUIClick", gButton["move_higher"], 
			function ()
				triggerServerEvent ( "move", lp, lp, "move", "higher" )
			end,
		false )
		gButton["move_lower"] = guiCreateButton(140,80,20,20,"-",false,gTab[2])
		guiSetAlpha(gButton["move_higher"],1)
		addEventHandler ( "onClientGUIClick", gButton["move_lower"], 
			function ()
				triggerServerEvent ( "move", lp, lp, "move", "lower" )
			end,
		false )
		
		
		gButton[8] = guiCreateButton(5,97,81,39,"Markierung setzen",false,gTab[2])
		guiSetAlpha(gButton[8],1)
		addEventHandler ( "onClientGUIClick", gButton[8], 
			function ()
				triggerServerEvent ( "executeAdminServerCMD", lp, "mark" )
			end,
		false )
		gButton[9] = guiCreateButton(6,143,81,39,"Zur Markierung gehen",false,gTab[2])
		guiSetAlpha(gButton[9],1)
		addEventHandler ( "onClientGUIClick", gButton[9], 
			function ()
				triggerServerEvent ( "executeAdminServerCMD", lp, "gotomark" )
			end,
		false )
		gButton[10] = guiCreateButton(6,188,151,30,"Interior/Dimension setzen",false,gTab[2])
		guiSetAlpha(gButton[10],1)
		addEventHandler ( "onClientGUIClick", gButton[10], 
			function ()
				row, column = guiGridListGetSelectedItem(gGrid["plistadmin"])
				player = guiGridListGetItemText ( gGrid["plistadmin"], row, column )
				triggerServerEvent ( "executeAdminServerCMD", lp, "intdim", player.." "..guiGetText(gEdit[3]).." "..guiGetText(gEdit[4]) )
			end,
		false )
		gEdit[3] = guiCreateEdit(162,188,58,32,"",false,gTab[2])
		guiSetAlpha(gEdit[3],1)
		gEdit[4] = guiCreateEdit(226,188,58,32,"",false,gTab[2])
		guiSetAlpha(gEdit[4],1)
		gLabel[6] = guiCreateLabel(166,173,50,16,"Interior:",false,gTab[2])
		guiSetAlpha(gLabel[6],1)
		guiLabelSetColor(gLabel[6],255,255,255)
		guiLabelSetVerticalAlign(gLabel[6],"top")
		guiLabelSetHorizontalAlign(gLabel[6],"left",false)
		guiSetFont(gLabel[6],"default-bold-small")
		gLabel[7] = guiCreateLabel(224,173,64,15,"Dimension:",false,gTab[2])
		guiSetAlpha(gLabel[7],1)
		guiLabelSetColor(gLabel[7],255,255,255)
		guiLabelSetVerticalAlign(gLabel[7],"top")
		guiLabelSetHorizontalAlign(gLabel[7],"left",false)
		guiSetFont(gLabel[7],"default-bold-small")
		gTab[3] = guiCreateTab("Spieler",gTabPanel["adminMenue"])
		guiSetAlpha(gTab[3],1)
		gButton[11] = guiCreateButton(4,8,78,38,"Beobachten",false,gTab[3])
		guiSetAlpha(gButton[11],1)
		addEventHandler ( "onClientGUIClick", gButton[11], 
			function ()
				row, column = guiGridListGetSelectedItem(gGrid["plistadmin"])
				player = guiGridListGetItemText ( gGrid["plistadmin"], row, column )
				triggerServerEvent ( "executeAdminServerCMD", lp, "spec", player )
			end,
		false )
		gButton[12] = guiCreateButton(4,52,78,38,"Checken",false,gTab[3])
		guiSetAlpha(gButton[12],1)
		addEventHandler ( "onClientGUIClick", gButton[12], 
			function ()
				row, column = guiGridListGetSelectedItem(gGrid["plistadmin"])
				player = guiGridListGetItemText ( gGrid["plistadmin"], row, column )
				triggerServerEvent ( "executeAdminServerCMD", lp, "check", player )
			end,
		false )
		gButton[13] = guiCreateButton(5,96,78,38,"Freezen",false,gTab[3])
		guiSetAlpha(gButton[13],1)
		addEventHandler ( "onClientGUIClick", gButton[13], 
			function ()
				row, column = guiGridListGetSelectedItem(gGrid["plistadmin"])
				player = guiGridListGetItemText ( gGrid["plistadmin"], row, column )
				triggerServerEvent ( "executeAdminServerCMD", lp, "freeze", player )
			end,
		false )
		gButton[14] = guiCreateButton(6,141,78,38,"Slapen",false,gTab[3])
		guiSetAlpha(gButton[14],1)
		addEventHandler ( "onClientGUIClick", gButton[14], 
			function ()
				row, column = guiGridListGetSelectedItem(gGrid["plistadmin"])
				player = guiGridListGetItemText ( gGrid["plistadmin"], row, column )
				if guiCheckBoxGetSelected ( gCheck[2] ) then
					triggerServerEvent ( "executeAdminServerCMD", lp, "slap", player.." ja" )
				else
					triggerServerEvent ( "executeAdminServerCMD", lp, "slap", player )
				end
			end,
		false )
		gButton[15] = guiCreateButton(7,186,78,38,"Skydiven",false,gTab[3])
		guiSetAlpha(gButton[15],1)
		addEventHandler ( "onClientGUIClick", gButton[15], 
			function ()
				row, column = guiGridListGetSelectedItem(gGrid["plistadmin"])
				player = guiGridListGetItemText ( gGrid["plistadmin"], row, column )
				triggerServerEvent ( "executeAdminServerCMD", lp, "skydive", player )
			end,
		false )
		gButton[16] = guiCreateButton(8,229,78,38,"Zum Leader machen",false,gTab[3])
		guiSetAlpha(gButton[16],1)
		addEventHandler ( "onClientGUIClick", gButton[16], 
			function ()
				row, column = guiGridListGetSelectedItem(gGrid["plistadmin"])
				player = guiGridListGetItemText ( gGrid["plistadmin"], row, column )
				triggerServerEvent ( "executeAdminServerCMD", lp, "makeleader", player.." "..guiGetText(gEdit[5]) )
			end,
		false )
		gButton[17] = guiCreateButton(8,275,78,38,"Passwort aendern",false,gTab[3])
		guiSetAlpha(gButton[17],1)
		addEventHandler ( "onClientGUIClick", gButton[17], 
			function ()
				row, column = guiGridListGetSelectedItem(gGrid["plistadmin"])
				player = guiGridListGetItemText ( gGrid["plistadmin"], row, column )
				triggerServerEvent ( "executeAdminServerCMD", lp, "pwchange", guiGetText(gEdit[6]).." "..guiGetText(gEdit[7]) )
			end,
		false )
		
		gButton["offlineban"] = guiCreateButton(115,395,78,38,"Offlineban",false,gTab[3])
		addEventHandler ( "onClientGUIClick", gButton["offlineban"], 
			function ()
				triggerServerEvent ( "executeAdminServerCMD", lp, "ban", guiGetText(gEdit[6]).." "..guiGetText(gMemo["offlineReason"]) )
			end,
		false )
		
		gMemo["offlineReason"] = guiCreateMemo(199,369,106,45,"",false,gTab[3])
		gLabel["offlineReason"] = guiCreateLabel(228,349,45,16,"Grund:",false,gTab[3])
		guiLabelSetColor(gLabel["offlineReason"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["offlineReason"],"top")
		guiLabelSetHorizontalAlign(gLabel["offlineReason"],"left",false)
		guiSetFont(gLabel["offlineReason"],"default-bold-small")
		
		gCheck[2] = guiCreateCheckBox(86,151,92,21,"Anzuenden?",false,false,gTab[3])
		guiSetAlpha(gCheck[2],1)
		guiSetFont(gCheck[2],"default-bold-small")
		gEdit[5] = guiCreateEdit(149,234,31,31,"",false,gTab[3])
		guiSetAlpha(gEdit[5],1)
		gLabel[8] = guiCreateLabel(91,240,53,20,"Fraktion:",false,gTab[3])
		guiSetAlpha(gLabel[8],1)
		guiLabelSetColor(gLabel[8],255,255,255)
		guiLabelSetVerticalAlign(gLabel[8],"top")
		guiLabelSetHorizontalAlign(gLabel[8],"left",false)
		guiSetFont(gLabel[8],"default-bold-small")
		gEdit[6] = guiCreateEdit(95,298,68,33,"",false,gTab[3])
		guiSetAlpha(gEdit[6],1)
		gLabel[9] = guiCreateLabel(107,276,45,16,"Spieler:",false,gTab[3])
		guiSetAlpha(gLabel[9],1)
		guiLabelSetColor(gLabel[9],255,255,255)
		guiLabelSetVerticalAlign(gLabel[9],"top")
		guiLabelSetHorizontalAlign(gLabel[9],"left",false)
		guiSetFont(gLabel[9],"default-bold-small")
		gEdit[7] = guiCreateEdit(192,298,68,33,"",false,gTab[3])
		guiSetAlpha(gEdit[7],1)
		gLabel[10] = guiCreateLabel(180,276,96,17,"Neues Passwort:",false,gTab[3])
		guiSetAlpha(gLabel[10],1)
		guiLabelSetColor(gLabel[10],255,255,255)
		guiLabelSetVerticalAlign(gLabel[10],"top")
		guiLabelSetHorizontalAlign(gLabel[10],"left",false)
		guiSetFont(gLabel[10],"default-bold-small")
		gLabel[11] = guiCreateLabel(12,352,94,138,"Fraktions-IDs:\n\n1 = SFPD\n2 = Mafia\n3 = Triaden\n4 = Feuerwehr\n5 = LTR\n6 = FBI\n7 = Mara Salvatrucha\n8 = Army",false,gTab[3])
		guiSetAlpha(gLabel[11],1)
		guiLabelSetColor(gLabel[11],255,255,255)
		guiLabelSetVerticalAlign(gLabel[11],"top")
		guiLabelSetHorizontalAlign(gLabel[11],"left",false)
		guiSetFont(gLabel[11],"default-bold-small")
		gTab[4] = guiCreateTab("Rang 3/4",gTabPanel["adminMenue"])
		guiSetAlpha(gTab[4],1)
		gButton[18] = guiCreateButton(6,21,84,46,"Query ausfuehren",false,gTab[4])
		guiSetAlpha(gButton[18],1)
		guiSetFont(gButton[18],"default-bold-small")
		addEventHandler ( "onClientGUIClick", gButton[18], 
			function ()
				row, column = guiGridListGetSelectedItem(gGrid["plistadmin"])
				player = guiGridListGetItemText ( gGrid["plistadmin"], row, column )
				triggerServerEvent ( "executeAdminServerCMD", lp, "query", guiGetText(gMemo[2]) )
			end,
		false )
		gMemo[2] = guiCreateMemo(93,9,217,77,"",false,gTab[4])
		guiSetAlpha(gMemo[2],1)
		gButton[19] = guiCreateButton(5,104,87,48,"Restart",false,gTab[4])
		addEventHandler ( "onClientGUIClick", gButton[19], 
			function ()
				row, column = guiGridListGetSelectedItem(gGrid["plistadmin"])
				player = guiGridListGetItemText ( gGrid["plistadmin"], row, column )
				triggerServerEvent ( "executeAdminServerCMD", lp, "gmx", guiGetText(gEdit[8]) )
			end,
		false )
		guiSetAlpha(gButton[19],1)
		guiSetFont(gButton[19],"default-bold-small")
		gEdit[8] = guiCreateEdit(120,109,59,37,"",false,gTab[4])
		guiSetAlpha(gEdit[8],1)
		gLabel[12] = guiCreateLabel(100,120,12,17,"in",false,gTab[4])
		guiSetAlpha(gLabel[12],1)
		guiLabelSetColor(gLabel[12],255,255,255)
		guiLabelSetVerticalAlign(gLabel[12],"top")
		guiLabelSetHorizontalAlign(gLabel[12],"left",false)
		guiSetFont(gLabel[12],"default-bold-small")
		gLabel[13] = guiCreateLabel(185,120,53,19,"Minuten",false,gTab[4])
		guiSetAlpha(gLabel[13],1)
		guiLabelSetColor(gLabel[13],255,255,255)
		guiLabelSetVerticalAlign(gLabel[13],"top")
		guiLabelSetHorizontalAlign(gLabel[13],"left",false)
		guiSetFont(gLabel[13],"default-bold-small")
		gButton[20] = guiCreateButton(6,169,87,48,"Haus anlegen",false,gTab[4])
		guiSetAlpha(gButton[20],1)
		addEventHandler ( "onClientGUIClick", gButton[20], 
			function ()
				local preis = guiGetText(gEdit[9])
				local playtime = guiGetText(gEdit[11])
				local int = guiGetText(gEdit[10])
				triggerServerEvent ( "executeAdminServerCMD", lp, "newhouse", preis.." "..playtime.." "..int )
			end,
		false )
		guiSetFont(gButton[20],"default-bold-small")
		gEdit[9] = guiCreateEdit(99,185,72,32,"",false,gTab[4])
		guiSetAlpha(gEdit[9],1)
		gLabel[14] = guiCreateLabel(103,165,60,18,"Preis:",false,gTab[4])
		guiSetAlpha(gLabel[14],1)
		guiLabelSetColor(gLabel[14],255,255,255)
		guiLabelSetVerticalAlign(gLabel[14],"top")
		guiLabelSetHorizontalAlign(gLabel[14],"left",false)
		guiSetFont(gLabel[14],"default-bold-small")
		gEdit[10] = guiCreateEdit(176,185,33,32,"",false,gTab[4])
		guiSetAlpha(gEdit[10],1)
		gLabel[15] = guiCreateLabel(156,165,71,16,"Innenraum:",false,gTab[4])
		guiSetAlpha(gLabel[15],1)
		guiLabelSetColor(gLabel[15],255,255,255)
		guiLabelSetVerticalAlign(gLabel[15],"top")
		guiLabelSetHorizontalAlign(gLabel[15],"left",false)
		guiSetFont(gLabel[15],"default-bold-small")
		gEdit[11] = guiCreateEdit(215,185,77,32,"",false,gTab[4])
		guiSetAlpha(gEdit[11],1)
		gLabel[16] = guiCreateLabel(227,153,59,31,"Mindest-\nSpielzeit:",false,gTab[4])
		guiSetAlpha(gLabel[16],1)
		guiLabelSetColor(gLabel[16],255,255,255)
		guiLabelSetVerticalAlign(gLabel[16],"top")
		guiLabelSetHorizontalAlign(gLabel[16],"left",false)
		guiSetFont(gLabel[16],"default-bold-small")
		gButton[21] = guiCreateButton(8,232,87,48,"Tuningteil-\nID*",false,gTab[4])
		addEventHandler ( "onClientGUIClick", gButton[21], 
			function ()
				row, column = guiGridListGetSelectedItem(gGrid["plistadmin"])
				player = guiGridListGetItemText ( gGrid["plistadmin"], row, column )
				triggerServerEvent ( "executeAdminServerCMD", lp, "tunecar", guiGetText(gEdit[12]) )
			end,
		false )
		guiSetAlpha(gButton[21],1)
		guiSetFont(gButton[21],"default-bold-small")
		gEdit[12] = guiCreateEdit(106,242,75,28,"",false,gTab[4])
		guiSetAlpha(gEdit[12],1)
		gLabel[17] = guiCreateLabel(7,491,61,17,"*s.h. Wiki",false,gTab[4])
		guiSetAlpha(gLabel[17],1)
		guiLabelSetColor(gLabel[17],255,255,255)
		guiLabelSetVerticalAlign(gLabel[17],"top")
		guiLabelSetHorizontalAlign(gLabel[17],"left",false)
		guiSetFont(gLabel[17],"default-bold-small")
		gButton[22] = guiCreateButton(8,290,87,48,"Innenraum\nansehen",false,gTab[4])
		addEventHandler ( "onClientGUIClick", gButton[22],  
			function ()
				row, column = guiGridListGetSelectedItem(gGrid["plistadmin"])
				player = guiGridListGetItemText ( gGrid["plistadmin"], row, column )
				triggerServerEvent ( "executeAdminServerCMD", lp, "iraum", guiGetText(gEdit[13]) )
			end,
		false )
		guiSetAlpha(gButton[22],1)
		guiSetFont(gButton[22],"default-bold-small")
		gEdit[13] = guiCreateEdit(105,296,75,28,"",false,gTab[4])
		guiSetAlpha(gEdit[13],1)
		gTab[5] = guiCreateTab("Chat",gTabPanel["adminMenue"])
		guiSetAlpha(gTab[5],1)
		gMemo[3] = guiCreateMemo(91,29,220,231,"",false,gTab[5])
		guiSetAlpha(gMemo[3],1)
		gLabel[18] = guiCreateLabel(180,13,34,16,"Text:",false,gTab[5])
		guiSetAlpha(gLabel[18],1)
		guiLabelSetColor(gLabel[18],255,255,255)
		guiLabelSetVerticalAlign(gLabel[18],"top")
		guiLabelSetHorizontalAlign(gLabel[18],"left",false)
		guiSetFont(gLabel[18],"default-bold-small")
		gButton[23] = guiCreateButton(5,28,82,41,"O-Chat",false,gTab[5])
		guiSetAlpha(gButton[23],1)
		addEventHandler ( "onClientGUIClick", gButton[23], 
			function ()
				row, column = guiGridListGetSelectedItem(gGrid["plistadmin"])
				player = guiGridListGetItemText ( gGrid["plistadmin"], row, column )
				triggerServerEvent ( "executeAdminServerCMD", lp, "o", guiGetText(gMemo[3]) )
			end,
		false )
		gButton[24] = guiCreateButton(4,75,82,41,"A-Chat",false,gTab[5])
		guiSetAlpha(gButton[24],1)
		addEventHandler ( "onClientGUIClick", gButton[24], 
			function ()
				row, column = guiGridListGetSelectedItem(gGrid["plistadmin"])
				player = guiGridListGetItemText ( gGrid["plistadmin"], row, column )
				triggerServerEvent ( "executeAdminServerCMD", lp, "a", guiGetText(gMemo[3]) )
			end,
		false )
		gButton[25] = guiCreateButton(6,122,82,41,"Fluestern",false,gTab[5])
		guiSetAlpha(gButton[25],1)
		addEventHandler ( "onClientGUIClick", gButton[25], 
			function ()
				row, column = guiGridListGetSelectedItem(gGrid["plistadmin"])
				player = guiGridListGetItemText ( gGrid["plistadmin"], row, column )
				triggerServerEvent ( "executeAdminServerCMD", lp, "w", guiGetText(gEdit[14]).." "..guiGetText(gMemo[3]) )
			end,
		false )
		gLabel[19] = guiCreateLabel(7,166,43,20,"An ID:",false,gTab[5])
		guiSetAlpha(gLabel[19],1)
		guiLabelSetColor(gLabel[19],255,255,255)
		guiLabelSetVerticalAlign(gLabel[19],"top")
		guiLabelSetHorizontalAlign(gLabel[19],"left",false)
		guiSetFont(gLabel[19],"default-bold-small")
		gButton[26] = guiCreateButton(5,216,82,41,"PM",false,gTab[5])
		guiSetAlpha(gButton[26],1)
		addEventHandler ( "onClientGUIClick", gButton[26], 
			function ()
				row, column = guiGridListGetSelectedItem(gGrid["plistadmin"])
				player = guiGridListGetItemText ( gGrid["plistadmin"], row, column )
				triggerServerEvent ( "executeAdminServerCMD", lp, "pm", player.." "..guiGetText(gMemo[3]) )
			end,
		false )
		gEdit[14] = guiCreateEdit(14,185,66,27,"",false,gTab[5])
		guiSetAlpha(gEdit[14],1)
		--[[gButton[27] = guiCreateButton(5,266,82,41,"Mute",false,gTab[5])
		guiSetAlpha(gButton[27],1)
		addEventHandler ( "onClientGUIClick", gButton[27], 
			function ()
				row, column = guiGridListGetSelectedItem(gGrid["plistadmin"])
				player = guiGridListGetItemText ( gGrid["plistadmin"], row, column )
				triggerServerEvent ( "executeAdminServerCMD", lp, "mute", player )
			end,
		false )]]
		gButton[28] = guiCreateButton(8,316,82,41,"Chat leeren",false,gTab[5])
		addEventHandler ( "onClientGUIClick", gButton[28], 
			function ()
				triggerServerEvent ( "executeAdminServerCMD", lp, "cleartext" )
			end,
		false )
		guiSetAlpha(gButton[28],1)
	end
	guiGridListClear ( gGrid["plistadmin"] )
	local players = getElementsByType("player")
	for i=1, #players do
		local row = guiGridListAddRow ( gGrid["plistadmin"] )
		guiGridListSetItemText ( gGrid["plistadmin"], row, gColumn["adminName"], getPlayerName ( players[i] ), false, false )
		guiGridListSetItemText ( gGrid["plistadmin"], row, gColumn["adminPing"], "  "..tostring(getPlayerPing ( players[i] )), true, false )
	end
	
	-------------------------
	gLabel[20] = guiCreateLabel(4,438,43,20,"Radius:",false,gTab[1])
	gEdit[15] = guiCreateEdit(4,458,79,38,"",false,gTab[1])
	gButton[30] = guiCreateButton(8,414,87,48,"Skin\nannehmen",false,gTab[4]) 
	gButton[29] = guiCreateButton(8,352,87,48,"Wetter-\nändern*",false,gTab[4])
	gEdit[16] = guiCreateEdit(105,420,75,28,"",false,gTab[4])
		
	addEventHandler ( "onClientGUIClick", gButton[29], 
		function ()
			triggerServerEvent ( "executeAdminServerCMD", lp, "aweather" )
		end,
	false )
	
	addEventHandler ( "onClientGUIClick", gButton[30], 
		function ()
			triggerServerEvent ( "executeAdminServerCMD", lp, "askin", tonumber(guiGetText(gEdit[16])) )
		end,
	false )	
	-------------------------
	gButton[31] = guiCreateButton( 6, 230, 151, 30, "zum Wagen teleportieren", false, gTab[2] )

	gEdit[17] = guiCreateEdit( 162, 235, 58, 32, "", false, gTab[2] )
	guiSetAlpha( gEdit[17], 1 )

	gEdit[18] = guiCreateEdit( 226, 235, 58, 32, "", false, gTab[2] )
	guiSetAlpha( gEdit[18], 1 )

	gLabel[21] = guiCreateLabel( 166, 220, 50, 16, "Name:", false, gTab[2] )
	guiSetAlpha( gLabel[21], 1 )
	guiLabelSetColor( gLabel[21], 255, 255, 255 )
	guiLabelSetVerticalAlign( gLabel[21], "top" )
	guiLabelSetHorizontalAlign( gLabel[21], "left", false )
	guiSetFont( gLabel[21], "default-bold-small" )

	gLabel[22] = guiCreateLabel( 224, 220, 64, 15, "Slot:", false, gTab[2] )
	guiSetAlpha( gLabel[22], 1 )
	guiLabelSetColor( gLabel[22], 255, 255, 255 )
	guiLabelSetVerticalAlign( gLabel[22], "top" )
	guiLabelSetHorizontalAlign( gLabel[22], "left", false )
	guiSetFont( gLabel[22], "default-bold-small" )
	
	addEventHandler ( "onClientGUIClick", gButton[31], 
		function ()
		
			local gotocarname = guiGetText(gEdit[17])
			local gotocarslot = guiGetText(gEdit[18])
			
			if gotocarname ~= "" and gotocarslot ~= "" then
		
				triggerServerEvent ( "executeAdminServerCMD", lp, "gotocar", gotocarname.." "..gotocarslot )
			
			else
			
				outputChatBox ( "Beide Felder muessen ausgefuellt sein!", 255, 0, 0 )
			
			end
			
		end, false )
		
end