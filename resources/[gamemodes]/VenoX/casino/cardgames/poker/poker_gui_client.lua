local img, deko
local pokerCards = {}
local pokerTableSelectionData = {}

function createPokerCard ( card, x, y, w, h, parentElement )

	if card then
		if card > -1 and card <= 52 and formCardNumber ( card ) == card then
			if card == 0 then
				img = guiCreateStaticImage(x,y,w,h,"images/cards/images/back.png",false,parentElement)
				guiSetAlpha(img,1)
			elseif not ( getCardType ( card ) == 10 or getCardType ( card ) == 11 or getCardType ( card ) == 12 ) then
				img = guiCreateStaticImage(x,y,w,h,"images/cards/images/bg.png",false,parentElement)
				guiSetAlpha(img,1)
				
				local pfad = "images/cards/"..cardColors[getCardColor(card)].."/"..cardIDTypeName[getCardType(card)].."_"..cardColorsShort[getCardColor(card)]..".png"
				deko = guiCreateStaticImage(0.0373,0.0306,0.1716,0.1179,pfad,true,img)
				deko = guiCreateStaticImage(0.7985,0.8646,0.1866,0.1266,pfad,true,img)
				deko = guiCreateStaticImage(0.291,0.3231,0.4403,0.3231,"images/cards/symbols/"..getFittingSymbol(card)..".png",true,img)
				deko = guiCreateStaticImage(0.0448,0.8515,0.2015,0.1354,"images/cards/symbols/"..getFittingSymbol(card)..".png",true,img)
				deko = guiCreateStaticImage(0.7687,0.0218,0.2015,0.1354,"images/cards/symbols/"..getFittingSymbol(card)..".png",true,img)
			else
				img = guiCreateStaticImage(x,y,w,h,"images/cards/images/bg.png",false,parentElement)
				
				local pfad = "images/cards/"..cardColors[getCardColor(card)].."/"..cardIDTypeName[getCardType(card)].."_"..cardColorsShort[getCardColor(card)]..".png"
				deko = guiCreateStaticImage(0.0694,0.1398,0.8681,0.75,"images/cards/images/"..getFittingPicture(card)..".png",true,img)
				deko = guiCreateStaticImage(0.792,0.8475,0.168,0.1243,"images/cards/symbols/"..getFittingSymbol(card)..".png",true,deko)
				deko = guiCreateStaticImage(0.0347,0.0339,0.125,0.0975,pfad,true,img)
				deko = guiCreateStaticImage(0.8542,0.9025,0.125,0.0975,pfad,true,img)
				deko = guiCreateStaticImage(0.0903,0.1568,0.1458,0.0847,"images/cards/symbols/"..getFittingSymbol(card)..".png",true,img)
			end
			if img then
				pokerCards[img] = true
				return img
			end
		end
	end
	return false
end

function showHandCardWindow ( c1, c2 )

	if isElement ( gWindow["pokerOwnCards"] ) then
		destroyElement ( gWindow["pokerOwnCards"] )
	end
	gWindow["pokerOwnCards"] = guiCreateWindow(3,screenheight-165,200,165,"Eigene Karten",false)
	guiSetAlpha ( gWindow["pokerOwnCards"], 1 )
	
	createPokerCard ( c1, 5, 25, 92, 175, gWindow["pokerOwnCards"] )
	createPokerCard ( c2, 102, 25, 92, 175, gWindow["pokerOwnCards"] )
end

function showPokerGameSelectionWindow ()

	toggleChatControls ( false )
	
	gWindow["pokerTableSelection"] = guiCreateWindow(screenwidth/2-389/2,screenheight/2-422/2,389,422,"Aktionen",false)
	guiSetAlpha(gWindow["pokerTableSelection"],1)
	gGrid["pokerTables"] = guiCreateGridList(13,25,366,241,false,gWindow["pokerTableSelection"])
	guiGridListSetSelectionMode(gGrid["pokerTables"],0)
	
	gColumn["pokerName"] = guiGridListAddColumn(gGrid["pokerTables"],"Name",0.3)
	gColumn["pokerBuyIn"] = guiGridListAddColumn(gGrid["pokerTables"],"Einsatz",0.15)
	gColumn["pokerPlayers"] = guiGridListAddColumn(gGrid["pokerTables"],"Spieler",0.15)
	gColumn["pokerPW"] = guiGridListAddColumn(gGrid["pokerTables"],"PW",0.1)
	gColumn["pokerReal"] = guiGridListAddColumn(gGrid["pokerTables"],"Echtes Geld",0.2)
	
	guiSetAlpha(gGrid["pokerTables"],1)
	gButton["pokerJoinTable"] = guiCreateButton(15,276,94,48,"Spiel\nbeitreten",false,gWindow["pokerTableSelection"])
	guiSetAlpha(gButton["pokerJoinTable"],1)
	guiSetFont(gButton["pokerJoinTable"],"default-bold-small")
	gButton["pokerCreateTable"] = guiCreateButton(15,333,94,48,"Spiel\nerstellen",false,gWindow["pokerTableSelection"])
	guiSetAlpha(gButton["pokerCreateTable"],1)
	guiSetFont(gButton["pokerCreateTable"],"default-bold-small")
	gEdit["pokerBuyIn"] = guiCreateNumberField(120,274,111,31,"0",false,gWindow["pokerTableSelection"],true,true)
	guiSetAlpha(gEdit["pokerBuyIn"],1)
	gLabel[1] = guiCreateLabel(235,280,50,22,"Einsatz",false,gWindow["pokerTableSelection"])
	guiSetAlpha(gLabel[1],1)
	guiLabelSetColor(gLabel[1],255,255,255)
	guiLabelSetVerticalAlign(gLabel[1],"top")
	guiLabelSetHorizontalAlign(gLabel[1],"left",false)
	guiSetFont(gLabel[1],"default-bold-small")
	gEdit["pokerPW"] = guiCreateEdit(120,313,109,32,"",false,gWindow["pokerTableSelection"])
	guiSetAlpha(gEdit["pokerPW"],1)
	gLabel[2] = guiCreateLabel(234,324,109,23,"Passwort",false,gWindow["pokerTableSelection"])
	guiSetAlpha(gLabel[2],1)
	guiLabelSetColor(gLabel[2],255,255,255)
	guiLabelSetVerticalAlign(gLabel[2],"top")
	guiLabelSetHorizontalAlign(gLabel[2],"left",false)
	guiSetFont(gLabel[2],"default-bold-small")
	gEdit["pokerName"] = guiCreateEdit(120,353,109,32,"",false,gWindow["pokerTableSelection"])
	guiSetAlpha(gEdit["pokerName"],1)
	gLabel[3] = guiCreateLabel(235,361,109,19,"Name des Tisches",false,gWindow["pokerTableSelection"])
	guiSetAlpha(gLabel[3],1)
	guiLabelSetColor(gLabel[3],255,255,255)
	guiLabelSetVerticalAlign(gLabel[3],"top")
	guiLabelSetHorizontalAlign(gLabel[3],"left",false)
	guiSetFont(gLabel[3],"default-bold-small")
	gCheck["pokerRisingBlinds"] = guiCreateCheckBox(15,390,120,20,"Steigende Blinds",false,false,gWindow["pokerTableSelection"])
	guiSetAlpha(gCheck["pokerRisingBlinds"],1)
	guiSetFont(gCheck["pokerRisingBlinds"],"default-bold-small")
	gCheck["pokerRealMoney"] = guiCreateCheckBox(15+125,390,120,20,"Echtes Geld",false,false,gWindow["pokerTableSelection"])
	guiSetAlpha(gCheck["pokerRealMoney"],1)
	guiSetFont(gCheck["pokerRealMoney"],"default-bold-small")
	--gCheck["pokerRealMoney"] = guiCreateCheckBox(15+125*2,390,120,20,"Passwort",false,false,gWindow["pokerTableSelection"])
	--guiSetAlpha(gCheck["pokerRealMoney"],1)
	--guiSetFont(gCheck["pokerRealMoney"],"default-bold-small")
	gButton["pokerSelectionClose"] = guiCreateButton(302,292,75,38,"Schliessen",false,gWindow["pokerTableSelection"])
	guiSetAlpha(gButton["pokerSelectionClose"],1)
	guiSetFont(gButton["pokerSelectionClose"],"default-bold-small")
	
	addEventHandler ( "onClientGUIClick", gButton["pokerSelectionClose"],
		function ()
			hidePokerTableSelection ()
		end,
	false )
	addEventHandler ( "onClientGUIClick", gButton["pokerCreateTable"],
		function ()
			outputChatBox ( tostring ( guiGetText ( gEdit["pokerBuyIn"] ) ) )
			triggerServerEvent ( "startNewPokerTable", lp, guiGetText ( gEdit["pokerName"] ), tonumber ( guiGetText ( gEdit["pokerBuyIn"] ) ), guiCheckBoxGetSelected ( gCheck["pokerRisingBlinds"] ), guiCheckBoxGetSelected ( gCheck["pokerRealMoney"] ), guiGetText ( gEdit["pokerPW"] ) )
			hidePokerTableSelection ()
		end,
	false )
	addEventHandler ( "onClientGUIClick", gButton["pokerJoinTable"],
		function ()
			local row, column = guiGridListGetSelectedItem ( gGrid["pokerTables"] )
			local data = pokerTableSelectionData[row]
			if data then
				data = tonumber ( data )
				if data then
					triggerServerEvent ( "joinPokerTableByID", lp, data, guiGetText ( gEdit["pokerPW"] ) )
					hidePokerTableSelection ()
					return true
				end
			end
			outputChatBox ( "Ungueltige Auswahl!", 125, 0, 0 )
		end,
	false )
	pokerGridData = {}
	triggerServerEvent ( "getAvailablePokerTables", lp )
end

function hidePokerTableSelection ()

	destroyElement ( gWindow["pokerTableSelection"] )
	showCursor ( false )
	-- CHANGEME --
	setElementClicked ( false )
	-- CHANGEME --
end

function recieveAvailablePokerTable_func ( name, buyIn, players, pw, real, id )

	if isElement ( gWindow["pokerTableSelection"] ) then
		pokerGridData[id] = {}
			pokerGridData[id]["name"] = name
			pokerGridData[id]["buyIn"] = buyIn
			pokerGridData[id]["players"] = players
			pokerGridData[id]["pw"] = pw
		local row = guiGridListAddRow ( gGrid["pokerTables"] )
		pokerTableSelectionData[row] = id
		guiGridListSetItemText ( gGrid["pokerTables"], row, gColumn["pokerName"], tostring ( name ), false, false )
		guiGridListSetItemText ( gGrid["pokerTables"], row, gColumn["pokerBuyIn"], tostring ( buyIn ), false, true )
		guiGridListSetItemText ( gGrid["pokerTables"], row, gColumn["pokerPlayers"], tostring ( players ), false, true )
		guiGridListSetItemText ( gGrid["pokerTables"], row, gColumn["pokerPW"], tostring ( pw ), false, false )
		guiGridListSetItemText ( gGrid["pokerTables"], row, gColumn["pokerReal"], tostring ( real ), false, false )
	end
end
addEvent ( "recieveAvailablePokerTable", true )
addEventHandler ( "recieveAvailablePokerTable", getRootElement(), recieveAvailablePokerTable_func )

function showPokerActionMenue_func ( ownBet, minBet, raisePossible )

	showCursor ( true )
	setElementClicked ( true )
	gWindow["pokerDraw"] = guiCreateWindow(206,screenheight-226,187,226,"Dein Zug",false)
	guiSetAlpha(gWindow["pokerDraw"],1)
	gImage["pokerDraw1"] = guiCreateStaticImage(10,24,50,50,"images/inventory/chip.png",false,gWindow["pokerDraw"])
	guiSetAlpha(gImage["pokerDraw1"],1)
	gLabel["pokerDraw1"] = guiCreateLabel(67,25,115,16,"Dein Einsatz bisher:",false,gWindow["pokerDraw"])
	guiSetAlpha(gLabel["pokerDraw1"],1)
	guiLabelSetColor(gLabel["pokerDraw1"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["pokerDraw1"],"top")
	guiLabelSetHorizontalAlign(gLabel["pokerDraw1"],"left",false)
	guiSetFont(gLabel["pokerDraw1"],"default-bold-small")
	gLabel["pokerDraw2"] = guiCreateLabel(66,52,116,17,"Aktueller Call:",false,gWindow["pokerDraw"])
	guiSetAlpha(gLabel["pokerDraw2"],1)
	guiLabelSetColor(gLabel["pokerDraw2"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["pokerDraw2"],"top")
	guiLabelSetHorizontalAlign(gLabel["pokerDraw2"],"left",false)
	guiSetFont(gLabel["pokerDraw2"],"default-bold-small")
	gLabel["pokerDrawOwnBet"] = guiCreateLabel(87,40,89,15,ownBet.." $",false,gWindow["pokerDraw"])
	guiSetAlpha(gLabel["pokerDrawOwnBet"],1)
	guiLabelSetColor(gLabel["pokerDrawOwnBet"],0,200,0)
	guiLabelSetVerticalAlign(gLabel["pokerDrawOwnBet"],"top")
	guiLabelSetHorizontalAlign(gLabel["pokerDrawOwnBet"],"right",false)
	guiSetFont(gLabel["pokerDrawOwnBet"],"default-bold-small")
	gLabel["pokerDrawMinBet"] = guiCreateLabel(88,66,89,15,minBet.." $",false,gWindow["pokerDraw"])
	guiSetAlpha(gLabel["pokerDrawMinBet"],1)
	guiLabelSetColor(gLabel["pokerDrawMinBet"],200,0,0)
	guiLabelSetVerticalAlign(gLabel["pokerDrawMinBet"],"top")
	guiLabelSetHorizontalAlign(gLabel["pokerDrawMinBet"],"right",false)
	guiSetFont(gLabel["pokerDrawMinBet"],"default-bold-small")
	
	gRadio["pokerDrawCall"] = guiCreateRadioButton(9,84+14*0,101,18,"Check / Call",false,gWindow["pokerDraw"])
	guiRadioButtonSetSelected ( gRadio["pokerDrawCall"], true )
	guiSetFont(gRadio["pokerDrawCall"],"default-bold-small")
	gRadio["pokerDrawRaise"] = guiCreateRadioButton(9,84+14*1,101,18,"Raise",false,gWindow["pokerDraw"])
	if not raisePossible then
		guiSetAlpha(gRadio["pokerDrawRaise"],0.6)
	else
		guiSetAlpha(gRadio["pokerDrawRaise"],1)
	end
	guiSetFont(gRadio["pokerDrawRaise"],"default-bold-small")
	gRadio["pokerDrawFold"] = guiCreateRadioButton(9,84+14*2,101,18,"Fold",false,gWindow["pokerDraw"])
	guiSetAlpha(gRadio["pokerDrawFold"],1)
	guiSetFont(gRadio["pokerDrawFold"],"default-bold-small")
	gRadio["pokerDrawLeave"] = guiCreateRadioButton(9,84+14*3,101,18,"Leave Table",false,gWindow["pokerDraw"])
	guiSetAlpha(gRadio["pokerDrawLeave"],1)
	guiSetFont(gRadio["pokerDrawLeave"],"default-bold-small")
	gRadio["pokerDrawAllIn"] = guiCreateRadioButton(9,84+14*4,101,18,"All-in",false,gWindow["pokerDraw"])
	guiSetAlpha(gRadio["pokerDrawAllIn"],1)
	guiSetFont(gRadio["pokerDrawAllIn"],"default-bold-small")
	
	gNumberField["pokerDrawRaiseAmount"] = guiCreateNumberField(112,107,59,26,"0",false,gWindow["pokerDraw"])
	gLabel["pokerDraw3"] = guiCreateLabel(125,90,47,16,"Einsatz auf",false,gWindow["pokerDraw"])
	guiLabelSetColor(gLabel["pokerDraw3"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["pokerDraw3"],"top")
	guiLabelSetHorizontalAlign(gLabel["pokerDraw3"],"left",false)
	guiSetFont(gLabel["pokerDraw3"],"default-bold-small")
	gLabel["pokerDraw4"] = guiCreateLabel(112,135,100,19,"$ erhoehen",false,gWindow["pokerDraw"])
	guiLabelSetColor(gLabel["pokerDraw4"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["pokerDraw4"],"top")
	guiLabelSetHorizontalAlign(gLabel["pokerDraw4"],"left",false)
	guiSetFont(gLabel["pokerDraw4"],"default-bold-small")
	
	gButton["pokerDrawProceed"] = guiCreateButton(54,168,87,41,"OK",false,gWindow["pokerDraw"])
	guiSetAlpha(gButton["pokerDrawProceed"],1)
	
	addEventHandler ( "onClientGUIClick", gButton["pokerDrawProceed"],
		function ()
			local selected = false
			if guiRadioButtonGetSelected ( gRadio["pokerDrawCall"] ) then
				selected = "call"
			elseif guiRadioButtonGetSelected ( gRadio["pokerDrawRaise"] ) then
				selected = "raise"
			elseif guiRadioButtonGetSelected ( gRadio["pokerDrawFold"] ) then
				selected = "fold"
			elseif guiRadioButtonGetSelected ( gRadio["pokerDrawLeave"] ) then
				selected = "leave"
			elseif guiRadioButtonGetSelected ( gRadio["pokerDrawAllIn"] ) then
				selected = "allin"
			end
			if selected then
				triggerServerEvent ( "finishDraw", lp, selected, guiGetText ( gNumberField["pokerDrawRaiseAmount"] ) )
			end
		end,
	false )
end

function hidePokerActionWindow_func ()

	destroyElement ( gWindow["pokerDraw"] )
	showCursor ( false )
	setElementClicked ( false )
end
addEvent ( "hidePokerActionWindow", true )
addEventHandler ( "hidePokerActionWindow", getRootElement(), hidePokerActionWindow_func )

function hideAllCards ()

	for key, index in pairs ( pokerCards ) do
		destroyElement ( key )
	end
	pokerCards = {}
end