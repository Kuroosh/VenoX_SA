blackJackMarker = {}
local blackjackStelle = 0
local blackJackMarkerCoordinates = {}

blackJackCurCards = 0
blackJackCardSize = 100
blackJackCardHeight = 2 * blackJackCardSize
blackJackCardWidth = 1.2 * blackJackCardSize
blackJackCardGap = blackJackCardWidth / 10
blackJackCardImages = {}

function createBlackJackCard ( card, x, y, w, h, parentElement )

	if card then
		if card > -1 then
			blackJackCurCards = blackJackCurCards + 1
			local cardNR = blackJackCurCards
			if card == 0 then
				gImage["cardBG"..cardNR] = guiCreateStaticImage(x,y,w,h,"images/cards/images/back.png",false,parentElement)
				guiSetAlpha(gImage["cardBG"..cardNR],1)
			elseif not ( getCardType ( card ) == 10 or getCardType ( card ) == 11 or getCardType ( card ) == 12 ) then
				gImage["cardBG"..cardNR] = guiCreateStaticImage(x,y,w,h,"images/cards/images/bg.png",false,parentElement)
				guiSetAlpha(gImage["cardBG"..cardNR],1)
				local pfad = "images/cards/"..cardColors[getCardColor(card)].."/"..cardIDTypeName[getCardType(card)].."_"..cardColorsShort[getCardColor(card)]..".png"
				gImage["cardDeko1"..cardNR] = guiCreateStaticImage(0.0373,0.0306,0.1716,0.1179,pfad,true,gImage["cardBG"..cardNR])
				guiSetAlpha(gImage["cardDeko1"..cardNR],1)
				gImage["cardDeko2"..cardNR] = guiCreateStaticImage(0.7985,0.8646,0.1866,0.1266,pfad,true,gImage["cardBG"..cardNR])
				guiSetAlpha(gImage["cardDeko2"..cardNR],1)
				gImage["cardDeko3"..cardNR] = guiCreateStaticImage(0.291,0.3231,0.4403,0.3231,"images/cards/symbols/"..getFittingSymbol(card)..".png",true,gImage["cardBG"..cardNR])
				guiSetAlpha(gImage["cardDeko3"..cardNR],1)
				gImage["cardDeko4"..cardNR] = guiCreateStaticImage(0.0448,0.8515,0.2015,0.1354,"images/cards/symbols/"..getFittingSymbol(card)..".png",true,gImage["cardBG"..cardNR])
				guiSetAlpha(gImage["cardDeko4"..cardNR],1)
				gImage["cardDeko5"..cardNR] = guiCreateStaticImage(0.7687,0.0218,0.2015,0.1354,"images/cards/symbols/"..getFittingSymbol(card)..".png",true,gImage["cardBG"..cardNR])
				guiSetAlpha(gImage["cardDeko5"..cardNR],1)
			else
				gImage["cardBG"..cardNR] = guiCreateStaticImage(x,y,w,h,"images/cards/images/bg.png",false,parentElement)
				guiSetAlpha(gImage["cardBG"..cardNR],1)
				local pfad = "images/cards/"..cardColors[getCardColor(card)].."/"..cardIDTypeName[getCardType(card)].."_"..cardColorsShort[getCardColor(card)]..".png"
				gImage["cardDeko1"..cardNR] = guiCreateStaticImage(0.0694,0.1398,0.8681,0.75,"images/cards/images/"..getFittingPicture(card)..".png",true,gImage["cardBG"..cardNR])
				gImage["cardDeko2"..cardNR] = guiCreateStaticImage(0.792,0.8475,0.168,0.1243,"images/cards/symbols/"..getFittingSymbol(card)..".png",true,gImage["cardDeko1"..cardNR])
				gImage["cardDeko3"..cardNR] = guiCreateStaticImage(0.0347,0.0339,0.125,0.0975,pfad,true,gImage["cardBG"..cardNR])
				gImage["cardDeko4"..cardNR] = guiCreateStaticImage(0.8542,0.9025,0.125,0.0975,pfad,true,gImage["cardBG"..cardNR])
				gImage["cardDeko5"..cardNR] = guiCreateStaticImage(0.0903,0.1568,0.1458,0.0847,"images/cards/symbols/"..getFittingSymbol(card)..".png",true,gImage["cardBG"..cardNR])
			end
			if gImage["cardBG"..cardNR] then
				blackJackCardImages[gImage["cardBG"..cardNR]] = true
				return gImage["cardBG"..cardNR]
			end
		end
	end
	return false
end

function destroyBlackJackCards ()

	for key, index in pairs ( blackJackCardImages ) do
		destroyElement ( key )
		blackJackCardImages[key] = nil
	end
	blackJackCardImages = nil
	blackJackCardImages = {}
	blackJackCurCards = 0
end

-- 1: Dealer, 2: Chips, 3: Marker; Int 1: Caligulas, Int 2: Four Dragons
blackJackTables = {}
 blackJackTables["x1"] = {}
 blackJackTables["x2"] = {}
 blackJackTables["x3"] = {}
 blackJackTables["y1"] = {}
 blackJackTables["y2"] = {}
 blackJackTables["y3"] = {}
 blackJackTables["z1"] = {}
 blackJackTables["z2"] = {}
 blackJackTables["z3"] = {}
 blackJackTables["int"] = {}
  local i = 1
  blackJackTables["x1"][i], blackJackTables["y1"][i], blackJackTables["z1"][i] = 1960.7575683594, 1015.6516113281, 992.11798095703
  blackJackTables["x2"][i], blackJackTables["y2"][i], blackJackTables["z2"][i] = 1959.5671386719, 1015.6543579102, 992.46759033203
  blackJackTables["x3"][i], blackJackTables["y3"][i], blackJackTables["z3"][i] = 1958.5153808594, 1015.6326904297, 991.4609375
  blackJackTables["int"][i] = 10
  i = i + 1
  blackJackTables["x1"][i], blackJackTables["y1"][i], blackJackTables["z1"][i] = 1961.9340820313, 1020.2207641602, 992.11798095703
  blackJackTables["x2"][i], blackJackTables["y2"][i], blackJackTables["z2"][i] = 1963.126953125, 1020.1802978516, 992.46759033203
  blackJackTables["x3"][i], blackJackTables["y3"][i], blackJackTables["z3"][i] = 1964.2277832031, 1020.1860351563, 991.4609375
  blackJackTables["int"][i] = 10
  i = i + 1
  local i = i + 1
  blackJackTables["x1"][i], blackJackTables["y1"][i], blackJackTables["z1"][i] = 2230.3703613281, 1605.8072509766, 1005.8352661133, 0, 0, 0
  blackJackTables["x2"][i], blackJackTables["y2"][i], blackJackTables["z2"][i] = 2230.3610839844, 1607.0529785156, 1006.1560668945, 0, 0, 0
  blackJackTables["x3"][i], blackJackTables["y3"][i], blackJackTables["z3"][i] = 2230.3327636719, 1608.1446533203, 1005.1538085938, 0, 0, 0
  blackJackTables["int"][i] = 1
  local i = i + 1
  blackJackTables["x1"][i], blackJackTables["y1"][i], blackJackTables["z1"][i] = 2230.3703613281, 1603.2485351563, 1005.8352661133, 0, 0, 0
  blackJackTables["x2"][i], blackJackTables["y2"][i], blackJackTables["z2"][i] = 2230.4089355469, 1601.9509277344, 1006.1560668945, 0, 0, 0
  blackJackTables["x3"][i], blackJackTables["y3"][i], blackJackTables["z3"][i] = 2230.3876953125, 1600.7963867188, 1005.1538085938, 0, 0, 0
  blackJackTables["int"][i] = 1
  local i = i + 1
  blackJackTables["x1"][i], blackJackTables["y1"][i], blackJackTables["z1"][i] = 2242.6982421875, 1604.4758300781, 1005.828918457, 0, 0, 0
  blackJackTables["x2"][i], blackJackTables["y2"][i], blackJackTables["z2"][i] = 2243.9255371094, 1604.4549560547, 1006.1560668945, 0, 0, 0
  blackJackTables["x3"][i], blackJackTables["y3"][i], blackJackTables["z3"][i] = 2245.0065917969, 1604.4519042969, 1005.1538085938, 0, 0, 0
  blackJackTables["int"][i] = 1
  

addEventHandler ( "onResourceStart", resourceRoot, function ( )
	for key, index in pairs ( blackJackTables["x1"] ) do
		local x1, y1, z1 = blackJackTables["x1"][key], blackJackTables["y1"][key], blackJackTables["z1"][key]
		local x2, y2, z2 = blackJackTables["x2"][key], blackJackTables["y2"][key], blackJackTables["z2"][key]
		local x3, y3, z3 = blackJackTables["x3"][key], blackJackTables["y3"][key], blackJackTables["z3"][key]
		local int = blackJackTables["int"][key]
		
		local rot = findRotation ( x1, y1, x3, y3 )
		local rnd = getRandomCroupierSkin ()
		local ped1 = createInvulnerablePed ( rnd, x1, y1, z1, rot, int, 0 )
		local ped2 = createInvulnerablePed ( rnd, x1, y1, z1, rot, int, 1 )
		if int == 1 then
			caligulasPed[caligulasstelle] = ped1
			caligulasstelle = caligulasstelle + 1
		elseif int == 10 then
			fourdragonsPed[fourdragonsstelle] = ped1
			fourdragonsstelle = fourdragonsstelle + 1
		end
		setElementInterior ( ped1, int )
		setElementInterior ( ped2, int )
		
		blackJackMarker[blackjackStelle] = createMarker ( x3, y3, z3, "cylinder", 1, 125, 0, 0, 150 )
		blackJackMarkerCoordinates[blackJackMarker[blackjackStelle]] = { ["cx"] = x2, ["cy"]= y2, ["cz"] = z2, ["id"] = key }
		
		setElementInterior ( blackJackMarker[blackjackStelle], int )
		
		function blackjackMarkerHit ( hit )
			if hit == lp then
				if vnxClientGetElementData ( "casinoChips" ) > 0 then
					if not blackJackStarted then
						local x1, y1, z1 = blackJackMarkerCoordinates[source]["cx"], blackJackMarkerCoordinates[source]["cy"], blackJackMarkerCoordinates[source]["cz"]
						local int = getElementInterior ( source )
						local id = blackJackMarkerCoordinates[source]["id"]
						
						startBlackJack ( id )
						
						setElementDimension ( lp, 1 )
						triggerServerEvent ( "roulettStart", lp )
						
						local x2, y2, z2 = getElementPosition ( source )
						_, _, z2 = getElementPosition ( lp )
						setTimer ( setElementPosition, 300, 1, lp, x2, y2, z2 )
						setTimer ( setPedRotation, 300, 1, lp, findRotation ( x2, y2, x1, y1 ) )
						setInvulnerable ( true )
					end
				else
					infobox ( "\n\n\nDu hast keine\nChips!", 10000, 200, 200, 0 )
				end
			end
		end
		addEventHandler ( "onClientMarkerHit", blackJackMarker[blackjackStelle], blackjackMarkerHit )
		blackjackStelle = blackjackStelle + 1
	end
end )

function startBlackJack ( id )

	setPlayerHudComponentVisible ( "radar", false )
	blackJackCurCards = 0
	blackJackX, blackJackY, blackJackZ = blackJackTables["x2"][id], blackJackTables["y2"][id], blackJackTables["z2"][id]
	hideAllChips ()
	blackJackStarted = true
	setBlackJackCamera ( id )
	showBlackJackBetChoice ()
	setWalkable ( false )
end

function setBlackJackCamera ( id )

	local x2, y2, z2 = blackJackTables["x2"][id], blackJackTables["y2"][id], blackJackTables["z2"][id]
	local x3, y3, z3 = blackJackTables["x3"][id], blackJackTables["y3"][id], blackJackTables["z3"][id]
	local cx, cy, cz = x2, y2, ( z2 + 4 )
	if x2 < x3 then
		cx = cx + 0.1
	else
		cx = cx - 0.1
	end
	local int = blackJackTables["int"][id]
	setCameraMatrix ( cx, cy, cz, x2, y2, z2 )
end

function showBlackJackBetChoice ()

	showCursor ( true )
	setElementClicked ( true )
	showBlackJackWindow ()
end

function setWalkable ( bool )

	toggleControl ( "jump", bool )
	
	toggleControl ( "left", bool )
	toggleControl ( "right", bool )
	toggleControl ( "forwards", bool )
	toggleControl ( "backwards", bool )
	toggleControl ( "fire", bool )
	toggleControl ( "action", bool )
	toggleControl ( "aim_weapon", bool )
end

function showBlackJackWindow ()

	local curTotalEditChips = 0
	lastRoulettFieldMoney = 0
	showCursor ( true )
	setElementClicked ( true )
	if isElement ( gWindow["blackJack"] ) then
		guiSetVisible ( gWindow["blackJack"], true )
	else
		gWindow["blackJack"] = guiCreateWindow(screenwidth/2-161/2,0,161,194,"Einsatz",false)
		guiWindowSetMovable ( gWindow["blackJack"], false )
		guiWindowSetSizable ( gWindow["blackJack"], false )
		guiSetAlpha(gWindow["blackJack"],1)
		
		gScroll["blackJack"] = guiCreateScrollBar ( 11, 26, 137, 30, true, false, gWindow["blackJack"] )
		guiScrollBarSetScrollPosition ( gScroll["blackJack"], 0 )
				
		gButton["placeBlackJackBet"] = guiCreateButton(76,135,66,40,"Setzen",false,gWindow["blackJack"])
		guiSetAlpha(gButton["placeBlackJackBet"],1)
		
		gEdit["blackJack"] = guiCreateEdit(12,85,86,35,"0",false,gWindow["blackJack"])
		guiSetAlpha(gEdit["blackJack"],1)
		
		gLabel[1] = guiCreateLabel(106,92,50,14,"$ / Chips",false,gWindow["blackJack"])
		guiSetAlpha(gLabel[1],1)
		guiLabelSetColor(gLabel[1],0,200,0)
		guiLabelSetVerticalAlign(gLabel[1],"top")
		guiLabelSetHorizontalAlign(gLabel[1],"left",false)
		guiSetFont(gLabel[1],"default-bold-small")
		gImage[1] = guiCreateStaticImage(16,135,37,40,"images/inventory/chip.png",false,gWindow["blackJack"])
		guiSetAlpha(gImage[1],1)
		
		addEventHandler ( "onClientGUIScroll", gScroll["blackJack"], blackJackScrollBarChanged )
		addEventHandler ( "onClientGUIChanged", gEdit["blackJack"], blackJackEditChanged )
		addEventHandler ( "onClientGUIClick", gButton["placeBlackJackBet"], blackJackPlaceBet )
	end
end

function blackJackPlaceBet ()

	local amount = math.abs ( math.floor ( tonumber ( guiGetText ( gEdit["blackJack"] ) ) ) )
	if amount > 0 then
		if amount <= calcPlayerMaxGambleBet ( lp, 1 ) then
			local x, y, z = blackJackX, blackJackY, blackJackZ
			drawChipsStacks ( x, y, z, amount )
			triggerServerEvent ( "startBlackJack", lp, amount )
			
			guiSetVisible ( gWindow["blackJack"], false )
			showCursor ( false )
			setElementClicked ( false )
		else
			infobox ( "Dafuer ist dein\nSpielerskill nicht\nhoch genug!\nMaximaleinsatz:\n"..calcPlayerMaxGambleBet ( lp, 1 ).." $", 5000, 125, 0, 0 )
		end
	end
end

function blackJackScrollBarChanged ()

	local money = math.floor ( vnxClientGetElementData ( "casinoChips" ) / 100 * guiScrollBarGetScrollPosition ( gScroll["blackJack"] ) + 0.5 )
	
	scrollBarChanged = true
	guiSetText ( gEdit["blackJack"], money )
end

function blackJackEditChanged ()

	if scrollBarChanged then
		scrollBarChanged = false
	else
		if curTotalEditChips ~= guiGetText ( gEdit["blackJack"] ) then
			local money = tonumber ( guiGetText ( gEdit["blackJack"] ) )
			if money then
				if money <= vnxClientGetElementData ( "casinoChips" ) then
					money = math.floor ( money + 0.5 )
					guiSetText ( gEdit["blackJack"], money )
					curTotalEditChips = money
					money = money / vnxClientGetElementData ( "casinoChips" ) * 100
					guiScrollBarSetScrollPosition ( gScroll["blackJack"], money )
				else
					guiSetText ( gEdit["blackJack"], vnxClientGetElementData ( "casinoChips" ) )
				end
			else
				guiSetText ( gEdit["blackJack"], curTotalEditChips )
			end
		end
	end
end

function bindBlackJackKeys ()

	bindKey ( "mouse1", "down", getNewBlackJackCard )
	bindKey ( "rshift", "down", blackJackDouble )
	bindKey ( "lshift", "down", blackJackDouble )
	bindKey ( "enter", "down", blackJackEndDraw )
end
function unbindBlackJackKeys ()

	unbindKey ( "mouse1", "down", getNewBlackJackCard )
	unbindKey ( "rshift", "down", blackJackDouble )
	unbindKey ( "lshift", "down", blackJackDouble )
	unbindKey ( "enter", "down", blackJackEndDraw )
end

function getNewBlackJackCard ()

	unbindBlackJackKeys ()
	triggerServerEvent ( "getNextBlackJackCardPlayer", lp )
end

function blackJackDouble ()

	unbindBlackJackKeys ()
	blackJackDoubled = true
	triggerServerEvent ( "blackJackDouble", lp )
end

function blackJackUnableToDouble_func ()

	bindBlackJackKeys ()
	blackJackDoubled = false
	infobox ( "\n\nDu hast nicht\ngenug Chips zum\nverdoppeln!", 10000, 200, 200, 0 )
end
addEvent ( "blackJackUnableToDouble", true )
addEventHandler ( "blackJackUnableToDouble", getRootElement(), blackJackUnableToDouble_func )

function blackJackEndDraw ()

	unbindBlackJackKeys ()
	triggerServerEvent ( "blackJackEndDraw", lp )
end

function startBlackJack_func ( card1, card2, card3, val )

	curBlackJackHandValue = val
	blackJackDoubled = false
	
	blackJackHandCards = {}
	blackJackHandCards["player"] = {}		
	blackJackHandCards["dealer"] = {}
	
	curBlackJackHandValue = "0"
	addEventHandler ( "onClientRender", getRootElement(), blackJackRender )
	
	setTimer (
		function ()
			blackJackHandCards["dealer"][1] = 0
			blackJackHandCards["dealer"]["cards"] = 1
	
			reDrawBlackJackCards ()
		end,
	500, 1 )
	setTimer (
		function ()
			blackJackHandCards["dealer"][2] = card1
			blackJackHandCards["dealer"]["cards"] = 2
			
			reDrawBlackJackCards ()
		end,
	1000, 1 )
	setTimer (
		function ()
			curBlackJackHandValue = getBlackJackHandValueText ( card2 )
			
			blackJackHandCards["player"][1] = card2
			blackJackHandCards["player"]["cards"] = 1
	
			reDrawBlackJackCards ()
		end,
	1500, 1 )
	setTimer (
		function ()
			blackJackHandCards["player"][2] = card3
			blackJackHandCards["player"]["cards"] = 2
			
			reDrawBlackJackCards ()
			
			if curBlackJackHandValue == "21" then
				curBlackJackHandValue = "Black Jack"
			else
				bindBlackJackKeys()
				infobox ( "\nDruecke:\nMaus ( Neue Karte ),\nShift ( Verdoppeln )\noder Enter\n( Genug Karten )", 10000, 200, 200, 0 )
				curBlackJackHandValue = getBlackJackHandValueText ( card2, card3 )
			end
		end,
	2000, 1 )
end
addEvent ( "startBlackJack", true )
addEventHandler ( "startBlackJack", getRootElement(), startBlackJack_func )

function blackJackRecieveNewCard_func ( player, card, val )

	local tok
	if val == "dealer" then
		blackJackHandCards["dealer"]["cards"] = 2
		blackJackHandCards["dealer"][1] = card
		reDrawBlackJackCards ()
	else
		if player then
			curBlackJackHandValue = val
			tok = "player"
			if not blackJackDoubled and val <= 21 then
				bindBlackJackKeys ()
			end
		else
			tok = "dealer"
		end
		local i = blackJackHandCards[tok]["cards"] + 1
		blackJackHandCards[tok]["cards"] = i
		blackJackHandCards[tok][i] = card
		reDrawBlackJackCards ()
	end
end
addEvent ( "blackJackRecieveNewCard", true )
addEventHandler ( "blackJackRecieveNewCard", getRootElement(), blackJackRecieveNewCard_func )

function reDrawBlackJackCards ()

	destroyBlackJackCards ()
	local playercards = 0
	for i, index in pairs ( blackJackHandCards["player"] ) do
		playercards = playercards + 1
	end
	local dealercards = 0
	for i, index in pairs ( blackJackHandCards["dealer"] ) do
		dealercards = dealercards + 1
	end
	
	local y = screenheight-blackJackCardHeight
	local total = ( blackJackCardWidth + blackJackCardGap ) * playercards
	local maxX = screenwidth / 2 + total / 2
	local minX = screenwidth / 2 - total / 2
	for i = playercards, 1, -1 do
		local card = blackJackHandCards["player"][i]
		
		x = maxX - blackJackCardWidth * ( i ) - blackJackCardGap * ( i )
		x = minX + blackJackCardWidth * ( i ) + blackJackCardGap * ( i )
		createBlackJackCard ( card, x, y, blackJackCardWidth, blackJackCardHeight, nil )
	end
	
	y = 0
	total = ( blackJackCardWidth + blackJackCardGap ) * dealercards
	maxX = screenwidth / 2 + total / 2
	minX = screenwidth / 2 - total / 2
	for i = dealercards, 1, -1 do
		local card = blackJackHandCards["dealer"][i]
		
		x = maxX - blackJackCardWidth * ( i ) - blackJackCardGap * ( i )
		x = minX + blackJackCardWidth * ( i ) + blackJackCardGap * ( i )
		createBlackJackCard ( card, x, 0, blackJackCardWidth, blackJackCardHeight, nil )
	end
end

function blackJackRender ()

	dxDrawText("Aktueller Wert der Hand: \n"..curBlackJackHandValue,0-1,screenheight-100-1,screenwidth/2-1,screenheight-1,tocolor(0,0,0,255),2.0,"sans","left","center",false,false,true)
	dxDrawText("Aktueller Wert der Hand: \n"..curBlackJackHandValue,0,screenheight-100,screenwidth/2,screenheight,tocolor(255,255,255,255),2.0,"sans","left","center",false,false,true)
end

function endBlackJack_func ( text, r, g, b )

	unbindBlackJackKeys ()
	setPlayerHudComponentVisible ( "radar", true )
	setElementClicked ( false )
	setInvulnerable ( false )
	blackJackBetInfoText = text
	blackJackInfoR = r
	blackJackInfoG = g
	blackJackInfoB = b
	addEventHandler ( "onClientRender", getRootElement(), blackJackBetInfo_render )
	setTimer ( 
		function ()
			destroyBlackJackCards ()
			blackJackStarted = false
			removeEventHandler ( "onClientRender", getRootElement(), blackJackBetInfo_render )
			removeEventHandler ( "onClientRender", getRootElement(), blackJackRender )
			setWalkable ( true )
			guiSetVisible ( gWindow["blackJack"], false )
			setCameraTarget ( lp )
			hideAllChips ()
		end,
	2500, 1 )
end
addEvent ( "endBlackJack", true )
addEventHandler ( "endBlackJack", getRootElement(), endBlackJack_func )

function blackJackDoubleChipStack_func ( nAmount )

	hideAllChips ()
	
	local x, y, z = blackJackX, blackJackY, blackJackZ
	drawChipsStacks ( x, y, z, nAmount )
end
addEvent ( "blackJackDoubleChipStack", true )
addEventHandler ( "blackJackDoubleChipStack", getRootElement(), blackJackDoubleChipStack_func )

function blackJackBetInfo_render ()

	dxDrawText(blackJackBetInfoText,2,2,screenwidth+2,screenheight+2,tocolor(0,0,0,255),3,"pricedown","center","center",false,false,true)
	dxDrawText(blackJackBetInfoText,0,0,screenwidth,screenheight,tocolor(blackJackInfoR,blackJackInfoG,blackJackInfoB,255),3,"pricedown","center","center",false,false,true)
end