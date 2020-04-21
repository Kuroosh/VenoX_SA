----------------------------------------------------
----------------------------------------------------
------ Copyright (c) 2013 by [vio]Lars-Marcel ------
----------------------------------------------------
----------------------------------------------------

function michelleSelect()
	showCursor(true)
	setElementClicked(true)
	michelles_Window = {}
	michelles_Button = {}
	michelles_Label = {}

	michelles_Window[1] = guiCreateWindow(392,202,222,204,"Michelle's",false)
	michelles_Label[1] = guiCreateLabel(10,27,248,42,"Willkommen bei Peach's Garagen\nService\nWas koennen wir fuer dich tun?",false,michelles_Window[1])
	guiSetFont(michelles_Label[1],"default-bold-small")
	michelles_Button[1] = guiCreateButton(38,119,137,30,"Speziallack",false,michelles_Window[1])
	guiSetFont(michelles_Button[1],"default-bold-small")
	michelles_Button[2] = guiCreateButton(38,155,137,30,"Nichts",false,michelles_Window[1])
	guiSetFont(michelles_Button[2],"default-bold-small")


	addEventHandler("onClientGUIClick", michelles_Button[1], function()
		guiSetVisible(michelles_Window[1], false)
		showSpezialLack()
	end)
	addEventHandler("onClientGUIClick", michelles_Button[2], function()
		guiSetVisible(michelles_Window[1], false)
		showCursor(false)
		triggerServerEvent("closeMichellesNeu", getLocalPlayer())
	end)
end
addEvent( "showMichelles1", true )
addEventHandler( "showMichelles1", getRootElement(), michelleSelect )

SpezialLack_Window = {}
SpezialLack_Button = {}
SpezialLack_Label = {}
SpezialLack_Scrollbar = {}

function showSpezialLack()
	--showCursor(true)
	
	local veh = getPedOccupiedVehicle(getLocalPlayer())
	if getElementData(veh, "spezcolor") == "" then
		kosten = "7.500"
	else
		kosten = "5.250"
	end
	
	SpezialLack_Window[1] = guiCreateWindow(7,201,328,337,"Michelle's Speziallack",false)
	SpezialLack_Label[1] = guiCreateLabel(11,26,308,45,"Willkommen bei Peach's Speziallack Tuning-Garage!\nHier kannst du dir dein Fahrzeug in knalligen Farben\numlackieren. Mische dir dazu eine Farbe zusammen.",false,SpezialLack_Window[1])
	guiSetFont(SpezialLack_Label[1],"default-bold-small")
	SpezialLack_Label[2] = guiCreateLabel(13,79,50,16,"Farbe 1:",false,SpezialLack_Window[1])
	guiSetFont(SpezialLack_Label[2],"default-bold-small")
	SpezialLack_Scrollbar[1] = guiCreateScrollBar(52,95,265,21,true,false,SpezialLack_Window[1])
	SpezialLack_Label[3] = guiCreateLabel(12,97,23,13,"Rot:",false,SpezialLack_Window[1])
	guiLabelSetColor(SpezialLack_Label[3],255,0,0)
	guiSetFont(SpezialLack_Label[3],"default-bold-small")
	SpezialLack_Scrollbar[2] = guiCreateScrollBar(52,120,265,21,true,false,SpezialLack_Window[1])
	SpezialLack_Label[4] = guiCreateLabel(12,121,38,14,"Gruen:",false,SpezialLack_Window[1])
	guiLabelSetColor(SpezialLack_Label[4],0,255,0)
	guiSetFont(SpezialLack_Label[4],"default-bold-small")
	SpezialLack_Scrollbar[3] = guiCreateScrollBar(52,146,265,21,true,false,SpezialLack_Window[1])
	SpezialLack_Label[5] = guiCreateLabel(12,147,38,14,"Blau:",false,SpezialLack_Window[1])
	guiLabelSetColor(SpezialLack_Label[5],0,0,255)
	guiSetFont(SpezialLack_Label[5],"default-bold-small")
	SpezialLack_Label[6] = guiCreateLabel(9,172,278,15,"Farbe 2: (Motorraeder u. Fahrzeuge mit Paintjob)",false,SpezialLack_Window[1])
	guiSetFont(SpezialLack_Label[6],"default-bold-small")
	SpezialLack_Scrollbar[4] = guiCreateScrollBar(52,193,264,21,true,false,SpezialLack_Window[1])
	SpezialLack_Label[7] = guiCreateLabel(12,195,23,13,"Rot:",false,SpezialLack_Window[1])
	guiLabelSetColor(SpezialLack_Label[7],255,0,0)
	guiSetFont(SpezialLack_Label[7],"default-bold-small")
	SpezialLack_Scrollbar[5] = guiCreateScrollBar(52,220,263,21,true,false,SpezialLack_Window[1])
	SpezialLack_Scrollbar[6] = guiCreateScrollBar(52,247,263,21,true,false,SpezialLack_Window[1])
	SpezialLack_Label[8] = guiCreateLabel(12,222,38,14,"Gruen:",false,SpezialLack_Window[1])
	guiLabelSetColor(SpezialLack_Label[8],0,255,0)
	guiSetFont(SpezialLack_Label[8],"default-bold-small")
	SpezialLack_Label[9] = guiCreateLabel(12,249,38,14,"Blau:",false,SpezialLack_Window[1])
	guiLabelSetColor(SpezialLack_Label[9],0,0,255)
	guiSetFont(SpezialLack_Label[9],"default-bold-small")
	SpezialLack_Label[10] = guiCreateLabel(32,272,300,14,"Umlackieren: 5.250$, Neue Lackierung: 7.500$",false,SpezialLack_Window[1])
	guiSetFont(SpezialLack_Label[10],"default-bold-small")
	SpezialLack_Button[1] = guiCreateButton(11,294,141,29,"Lackieren ("..kosten.." $)",false,SpezialLack_Window[1])
	guiSetFont(SpezialLack_Button[1],"default-bold-small")
	SpezialLack_Button[2] = guiCreateButton(171,294,141,29,"Abbrechen",false,SpezialLack_Window[1])
	guiSetFont(SpezialLack_Button[2],"default-bold-small")

	addEventHandler("onClientGUIScroll", SpezialLack_Window[1], function()
		local red1 = math.floor(guiScrollBarGetScrollPosition(SpezialLack_Scrollbar[1]))
		local green1 = math.floor(guiScrollBarGetScrollPosition(SpezialLack_Scrollbar[2]))
		local blue1 = math.floor(guiScrollBarGetScrollPosition(SpezialLack_Scrollbar[3]))
		local red2 = math.floor(guiScrollBarGetScrollPosition(SpezialLack_Scrollbar[4]))
		local green2 = math.floor(guiScrollBarGetScrollPosition(SpezialLack_Scrollbar[5]))
		local blue2 = math.floor(guiScrollBarGetScrollPosition(SpezialLack_Scrollbar[6]))
		triggerServerEvent("seeSpezialLackNeu", getLocalPlayer(), red1, green1, blue1, red2, green2, blue2)
	end)
	
	addEventHandler("onClientGUIClick", SpezialLack_Button[1], function()
		guiSetVisible(SpezialLack_Window[1], false)
		showCursor(false)
		setElementClicked(false)
		local red1 = math.floor(guiScrollBarGetScrollPosition(SpezialLack_Scrollbar[1]))
		local green1 = math.floor(guiScrollBarGetScrollPosition(SpezialLack_Scrollbar[2]))
		local blue1 = math.floor(guiScrollBarGetScrollPosition(SpezialLack_Scrollbar[3]))
		local red2 = math.floor(guiScrollBarGetScrollPosition(SpezialLack_Scrollbar[4]))
		local green2 = math.floor(guiScrollBarGetScrollPosition(SpezialLack_Scrollbar[5]))
		local blue2 = math.floor(guiScrollBarGetScrollPosition(SpezialLack_Scrollbar[6]))
		triggerServerEvent("buySpezialLackNeu", getLocalPlayer(), red1, green1, blue1, red2, green2, blue2)
	end)

	addEventHandler("onClientGUIClick", SpezialLack_Button[1], function()
		guiSetVisible(SpezialLack_Window[1], false)
		showCursor(false)
		setElementClicked(false)
		triggerServerEvent("closeSpezialLackNeu", getLocalPlayer())
	end)


	
	addEventHandler("onClientGUIClick", SpezialLack_Button[2], function()
		guiSetVisible(SpezialLack_Window[1], false)
		showCursor(false)
		setElementClicked(false)
		triggerServerEvent("closeSpezialLackNeu", getLocalPlayer())
	end)
end
--addEvent( "showSpezialLack", true )
--addEventHandler( "showSpezialLack", getRootElement(), showSpezialLack )
