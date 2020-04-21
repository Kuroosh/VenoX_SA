liarsDiceData = {
 ["players"] = {},
 ["dices1"] = {},
 ["dices2"] = {},
 ["dices3"] = {},
 ["curBet"] = { ["curEye"] = 1, ["curEyeCount"] = 1 },
 ["totalDices"] = 13
 }

function openLiarsDiceServerList_func ( string, count )

	showCursor ( true )
	setElementClicked ( true )
	
	gWindow["liarsDice"] = guiCreateWindow(screenwidth/2-249/2,screenheight/2-(355+51)/2,249,355+51,"Wuerfelpoker",false)
	guiSetAlpha(gWindow["liarsDice"],1)
	gGrid["liarsDice"] = guiCreateGridList(10,27,225,213,false,gWindow["liarsDice"])
	guiGridListSetSelectionMode(gGrid["liarsDice"],2)
	gColumn["liarsDiceName"] = guiGridListAddColumn(gGrid["liarsDice"],"Host",0.4)
	gColumn["liarsDiceEinsatz"] = guiGridListAddColumn(gGrid["liarsDice"],"Einsatz",0.2)
	gColumn["liarsDiceSpieler"] = guiGridListAddColumn(gGrid["liarsDice"],"Spieler",0.2)
	guiSetAlpha(gGrid["liarsDice"],1)
	gNumberField["liarsDice"] = guiCreateNumberField ( 10, 258, 71, 32, 0, false, gWindow["liarsDice"], true, true )
	guiSetAlpha(gNumberField["liarsDice"],1)
	gLabel[1] = guiCreateLabel(85,265,15,21,"$",false,gWindow["liarsDice"])
	guiSetAlpha(gLabel[1],1)
	guiLabelSetColor(gLabel[1],0,150,0)
	guiLabelSetVerticalAlign(gLabel[1],"top")
	guiLabelSetHorizontalAlign(gLabel[1],"left",false)
	guiSetFont(gLabel[1],"default-bold-small")
	gLabel[2] = guiCreateLabel(10,243,65,16,"Einsatz:",false,gWindow["liarsDice"])
	guiSetAlpha(gLabel[2],1)
	guiLabelSetColor(gLabel[2],200,200,0)
	guiLabelSetVerticalAlign(gLabel[2],"top")
	guiLabelSetHorizontalAlign(gLabel[2],"left",false)
	guiSetFont(gLabel[2],"default-bold-small")
	
	gButton["liarsDiceCreateTable"] = guiCreateButton(132,252,71,39,"Tisch erstellen",false,gWindow["liarsDice"])
	guiSetAlpha(gButton["liarsDiceCreateTable"],1)
	guiSetFont(gButton["liarsDiceCreateTable"],"default-bold-small")
	gButton["liarsDiceBetreten"] = guiCreateButton(14,303,62,38,"Betreten",false,gWindow["liarsDice"])
	guiSetAlpha(gButton["liarsDiceBetreten"],1)
	guiSetFont(gButton["liarsDiceBetreten"],"default-bold-small")
	gButton["liarsDiceClose"] = guiCreateButton(132,303,71,36,"Schliessen",false,gWindow["liarsDice"])
	guiSetAlpha(gButton["liarsDiceClose"],1)
	guiSetFont(gButton["liarsDiceClose"],"default-bold-small")
	gButton["liarsDiceRules"] = guiCreateButton(14,303 + 51,62,38,"Regeln lesen",false,gWindow["liarsDice"])
	guiSetAlpha(gButton["liarsDiceRules"],1)
	guiSetFont(gButton["liarsDiceRules"],"default-bold-small")
	
	addEventHandler ( "onClientGUIClick", gButton["liarsDiceCreateTable"],
		function ()
			destroyElement ( gWindow["liarsDice"] )
			showCursor ( false )
			setElementClicked ( false )
			triggerServerEvent ( "openNewLiarsDiceTable", lp, guiGetText ( gNumberField["liarsDice"] ) )
		end
	)
	addEventHandler ( "onClientGUIClick", gButton["liarsDiceBetreten"],
		function ()
			destroyElement ( gWindow["liarsDice"] )
			showCursor ( false )
			setElementClicked ( false )
		end
	)
	addEventHandler ( "onClientGUIClick", gButton["liarsDiceClose"],
		function ()
			destroyElement ( gWindow["liarsDice"] )
			showCursor ( false )
			setElementClicked ( false )
		end
	)
	addEventHandler ( "onClientGUIClick", gButton["liarsDiceRules"],
		function ()
			destroyElement ( gWindow["liarsDice"] )
			liarsDiceRules_show ()
		end
	)
	
	local host, players, ante
	for i = 1, count do
		host = gettok ( string, string.byte ( '|' ), 1 + ( i - 1 ) * 3 )
		players = gettok ( string, string.byte ( '|' ), 2 + ( i - 1 ) * 3 )
		ante = gettok ( string, string.byte ( '|' ), 3 + ( i - 1 ) * 3 )
		local row = guiGridListAddRow ( gGrid["liarsDice"] )
		guiGridListSetItemText ( gGrid["liarsDice"], row, gColumn["liarsDiceName"], host, false, false )
		guiGridListSetItemText ( gGrid["liarsDice"], row, gColumn["liarsDiceEinsatz"], ante, false, false )
		guiGridListSetItemText ( gGrid["liarsDice"], row, gColumn["liarsDiceSpieler"], players, false, false )
	end
end
addEvent ( "openLiarsDiceServerList", true )
addEventHandler ( "openLiarsDiceServerList", getRootElement(), openLiarsDiceServerList_func )

function liarsDiceRules_show ()

	showCursor ( true )
	setElementClicked ( true )
	gMemo["liarsDiceRules"] = guiCreateMemo ( screenwidth/2-640/2, screenheight/2-480/2, 640, 480, liarsDiceRules, false, nil )
	guiMemoSetReadOnly ( gMemo["liarsDiceRules"], true )
	gButton["liarsDiceRules"] = guiCreateButton(640-80,440,75,35,"Schliessen",false,gMemo["liarsDiceRules"])
	guiSetFont(gButton["liarsDiceRules"],"default-bold-small")
	
	addEventHandler ( "onClientGUIClick", gButton["liarsDiceRules"],
		function ()
			destroyElement ( gMemo["liarsDiceRules"] )
			showCursor ( false )
			setElementClicked ( false )
		end,
	false )
end

liarsDiceRules = [[Liar's Dice oder auch Wuerfelpoker

Phase 1:
Die Spieler ( mind. 2, max. 3 ) setzen den Ante ( Grundeinsatz ) und erhalten 5 Wuerfel.

Phase 2:
Alle wuerfeln verdeckt, jeder darf seine Wuerfel anguggen.

Phase 3:
Der erste Spieler macht eine Angabe von der Anzahl einer Augensorte, z.B. drei 4er Wuerfel.
Der zweite Spieler kann nun:

Erhoehen, d.h. er sagt mindestens drei hoehe Augenzahlen an -
z.B. drei 5er Wuerfel - oder mehr von einer beliebigen Augenzahl ( z.B. vier 3er Wuerfel ) ansagen, und
der naechste Spieler ist dran.
ODER
Das Gebot als Praezise angeben, d.h. alle Wuerfel werden aufgedeckt und ALLE angegebenen Augen ( z.B. alle 5er ) gezaehlt.
Falls genau die Anzahl der Augen mit dem Gebot uebereinstimmt, verliert derjenige einen Wuerfel, der das Gebot gesetzt hat -
andernfalls der, der das Gebot als Praezise angegeben hat.
ODER
Das Gebot als Bluff einstufen.
Falls das Gebot KEIN Bluff war, d.h. es genau soviele oder mehr als die angegebene Augenzahl gibt, verliert der anzweifelnde Spieler einen Wuerfel - ansonsten der Spieler, der das Gebot - also den Bluff - gemacht hat.

Wer als letzter noch Wuerfel hat, gewinnt die Grundeinsaetze.]]

--[[
info1, 1205.2176513672, 17.98637008667, 1001.1163330078
info2, 1204.603515625, 16.981378555298, 1000.8663330078
info3, 1204.1087646484, 18.016033172607, 1001.1163330078
]]

function liarsDiceShowNewDices ( d1, d2, d3 )

	local x1, y1 = getScreenFromWorldPosition ( 1205.2176513672, 17.98637008667, 1001.1163330078, 100, true )
	local x2, y2 = getScreenFromWorldPosition ( 1204.603515625, 16.981378555298, 1001.1163330078, 100, true )
	local x3, y3 = getScreenFromWorldPosition ( 1204.1087646484, 18.016033172607, 1001.1163330078, 100, true )
	
	
	
	c = createObject ( 1337, 1205.2176513672, 17.98637008667, 1001.1163330078 )
	setElementInterior ( c, 2 )
	c = createObject ( 1337, 1204.603515625, 16.981378555298, 1001.1163330078 )
	setElementInterior ( c, 2 )
	c = createObject ( 1337, 1204.1087646484, 18.016033172607, 1001.1163330078 )
	setElementInterior ( c, 2 )
	
	
	
	drawDiceBar ( x1, y1, d1 )
	drawDiceBar ( x2, y2, d2 )
	drawDiceBar ( x3, y3, d3 )
end

function drawDiceBar ( x, y, dices, parent )

	local sizeMultipli = 1.5
	local bg = guiCreateStaticImage ( x, y, ( 2 * 6 + 16 * 5 ) * sizeMultipli, ( 2 * 2 + 16 * 1 ) * sizeMultipli, "images/colors/c_green.jpg", false, parent )
	
	for i = 0, 4 do
		guiCreateStaticImage ( ( 2 + i * 16 + i * 2 ) * sizeMultipli, ( 2 ) * sizeMultipli, ( 16 ) * sizeMultipli, ( 16 ) * sizeMultipli, "images/cards/dices/"..dices[(i+1)]..".png", false, bg )
	end
end

function joinLiarsDiceTable ()

	showLiarsDiceMainMenue ()
	setCameraMatrix ( 1204.63, 17.63, 1003.36, 1204.63, 17.63, 1000.12 )
end
addEvent ( "joinLiarsDiceTable", true )
addEventHandler ( "joinLiarsDiceTable", getRootElement(), joinLiarsDiceTable )

function recieveLiarsDiceNames ( pname1, pname2, pname3 )

	guiSetText ( gLabel["liarsDiceName1"], pname1 )
	guiSetText ( gLabel["liarsDiceName2"], pname2 )
	guiSetText ( gLabel["liarsDiceName3"], pname3 )
end
addEvent ( "recieveLiarsDiceNames", true )
addEventHandler ( "recieveLiarsDiceNames", getRootElement(), recieveLiarsDiceNames )

function recieveBetFieldData ( from, eye, count, total, own )

	if isElement ( gImage["ownDice"] ) then
		destroyElement ( gImage["ownDice"] )
		destroyElement ( gLabel["liarsDiceEyeCount"] )
	end
	if isElement ( gImage["liarsDiceEyeDown"] ) then
		destroyElement ( gImage["liarsDiceEyeDown"] )
		destroyElement ( gImage["liarsDiceEyeUp"] )
		destroyElement ( gImage["liarsDiceEyeCountDown"] )
		destroyElement ( gImage["liarsDiceEyeCountUp"] )
	end
	gImage["ownDice"] = guiCreateStaticImage(306-50,49,24,24,"images/cards/dices/"..eye..".png",false,gWindow["liarsDiceGame"])
	guiSetAlpha(gImage["ownDice"],1)
	
	gLabel["liarsDiceEyeCount"] = guiCreateLabel(276-50,52,25,15,count.."x",false,gWindow["liarsDiceGame"])
	guiSetAlpha(gLabel["liarsDiceEyeCount"],1)
	guiLabelSetColor(gLabel["liarsDiceEyeCount"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["liarsDiceEyeCount"],"top")
	guiLabelSetHorizontalAlign(gLabel["liarsDiceEyeCount"],"right",false)
	guiSetFont(gLabel["liarsDiceEyeCount"],"default-bold-small")
	
	if own then
		gImage["liarsDiceEyeDown"] = guiCreateStaticImage(310-50,76,16,13.5,"images/cards/dices/arrow_down.png",false,gWindow["liarsDiceGame"])
		guiSetAlpha(gImage["liarsDiceEyeDown"],1)
		gImage["liarsDiceEyeUp"] = guiCreateStaticImage(310-50,33,16,13.5,"images/cards/dices/arrow_up.png",false,gWindow["liarsDiceGame"])
		guiSetAlpha(gImage["liarsDiceEyeUp"],1)
		gImage["liarsDiceEyeCountDown"] = guiCreateStaticImage(280-50,76,16,13.5,"images/cards/dices/arrow_down.png",false,gWindow["liarsDiceGame"])
		guiSetAlpha(gImage["liarsDiceEyeCountDown"],1)
		gImage["liarsDiceEyeCountUp"] = guiCreateStaticImage(280-50,33,16,13.5,"images/cards/dices/arrow_up.png",false,gWindow["liarsDiceGame"])
		guiSetAlpha(gImage["liarsDiceEyeCountUp"],1)
	end
end
addEvent ( "recieveBetFieldData", true )
addEventHandler ( "recieveBetFieldData", getRootElement(), recieveBetFieldData )

function showLiarsDiceMainMenue ()

	gWindow["liarsDiceGame"] = guiCreateWindow(screenwidth/2-298/2,screenheight/2-247/2,298,247,"Wuerfelpoker",false)
	guiSetAlpha(gWindow["liarsDiceGame"],1)
	
	gLabel["liarsDiceName1"] = guiCreateLabel(12,24,108,19,"Spieler 1:",false,gWindow["liarsDiceGame"])
	guiSetAlpha(gLabel["liarsDiceName1"],1)
	guiLabelSetColor(gLabel["liarsDiceName1"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["liarsDiceName1"],"top")
	guiLabelSetHorizontalAlign(gLabel["liarsDiceName1"],"left",false)
	guiSetFont(gLabel["liarsDiceName1"],"default-bold-small")
	
	gLabel["liarsDiceName2"] = guiCreateLabel(12,24+58*1,101,14,"Spieler 2:",false,gWindow["liarsDiceGame"])
	guiSetAlpha(gLabel["liarsDiceName2"],1)
	guiLabelSetColor(gLabel["liarsDiceName2"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["liarsDiceName2"],"top")
	guiLabelSetHorizontalAlign(gLabel["liarsDiceName2"],"left",false)
	guiSetFont(gLabel["liarsDiceName2"],"default-bold-small")
	gImage["player1Dices"] = guiCreateStaticImage(30,49+58*1,138,30,"images/colors/c_green.jpg",false,gWindow["liarsDiceGame"])
	guiSetAlpha(gImage["player1Dices"],1)
	
	gLabel["liarsDiceName3"] = guiCreateLabel(12,24+58*2,101,14,"Spieler 3:",false,gWindow["liarsDiceGame"])
	guiSetAlpha(gLabel["liarsDiceName3"],1)
	guiLabelSetColor(gLabel["liarsDiceName3"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["liarsDiceName3"],"top")
	guiLabelSetHorizontalAlign(gLabel["liarsDiceName3"],"left",false)
	guiSetFont(gLabel["liarsDiceName3"],"default-bold-small")
	gImage["player1Dices"] = guiCreateStaticImage(30,49+58*2,138,30,"images/colors/c_green.jpg",false,gWindow["liarsDiceGame"])
	guiSetAlpha(gImage["player1Dices"],1)
	
	gButton["liarsDiceBet"] = guiCreateButton(267-50,96,66,35,"Bieten",false,gWindow["liarsDiceGame"])
	guiSetAlpha(gButton["liarsDiceBet"],1)
	gButton["liarsDiceBuff"] = guiCreateButton(267-50,138,66,35,"Bluff vermuten",false,gWindow["liarsDiceGame"])
	guiSetAlpha(gButton["liarsDiceBuff"],1)
	gButton["correctBet"] = guiCreateButton(267-50,180,66,35,"Gebot ist praezise",false,gWindow["liarsDiceGame"])
	guiSetAlpha(gButton["correctBet"],1)
	
	gCheck["liarsDiceLastRound"] = guiCreateCheckBox(10,218,192,16,"Nach dieser Runde aussteigen",false,false,gWindow["liarsDiceGame"])
	guiSetAlpha(gCheck["liarsDiceLastRound"],1)
	guiSetFont(gCheck["liarsDiceLastRound"],"default-bold-small")
end

liarsDiceBars = {}

function drawDiceBars ( dices1, dices2, dices3 )

	for i = 1, 3 do
		if ( dices1 and i == 1 ) or ( dices2 and i == 2 ) or ( dices3 and i == 3 ) then
			if isElement ( liarsDiceBars[i] ) then
				destroyElement ( liarsDiceBars[i] )
			end
		end
	end
	if dices1 then
		liarsDiceBars[1] = drawDiceBar ( 30, 49 + 58 * 0, dices1, gWindow["liarsDiceGame"] )
	end
	if dices2 then
		liarsDiceBars[2] = drawDiceBar ( 30, 49 + 58 * 1, dices2, gWindow["liarsDiceGame"] )
	end
	if dices3 then
		liarsDiceBars[3] = drawDiceBar ( 30, 49 + 58 * 2, dices3, gWindow["liarsDiceGame"] )
	end
end