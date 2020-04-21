----------------------------------------------------
----------------------------------------------------
------ Copyright (c) 2013 by [THC]Lars-Marcel ------
----------------------------------------------------
----------------------------------------------------

function michelleSelect()
	showCursor(true)
	michelles_Window = {}
	michelles_Button = {}
	michelles_Label = {}

	michelles_Window[1] = guiCreateWindow(392,202,222,204,"Michelle's",false)
	michelles_Label[1] = guiCreateLabel(10,27,248,42,"Herzlich Willkommen bei Michelle's!\n\nWas koennen wir fuer dich tun?",false,michelles_Window[1])
	guiSetFont(michelles_Label[1],"default-bold-small")
	michelles_Button[1] = guiCreateButton(38,82,137,30,"Neon",false,michelles_Window[1])
	guiSetFont(michelles_Button[1],"default-bold-small")
	michelles_Button[2] = guiCreateButton(38,119,137,30,"Speziallack",false,michelles_Window[1])
	guiSetFont(michelles_Button[2],"default-bold-small")
	michelles_Button[3] = guiCreateButton(38,155,137,30,"Nicht's",false,michelles_Window[1])
	guiSetFont(michelles_Button[3],"default-bold-small")


	addEventHandler("onClientGUIClick", michelles_Button[1], function()
		local veh = getPedOccupiedVehicle(getLocalPlayer())
		if getVehicleType(veh) == "Automobile" then
			guiSetVisible(michelles_Window[1], false)
			showNeonTuning()
		else
			outputChatBox("Du kannst nur in Auto's und Van's Neonröhren einbauen!", 0, 255, 0)
		end
	end)
	addEventHandler("onClientGUIClick", michelles_Button[2], function()
		guiSetVisible(michelles_Window[1], false)
		showSpezialLack()
	end)
	addEventHandler("onClientGUIClick", michelles_Button[3], function()
		guiSetVisible(michelles_Window[1], false)
		showCursor(false)
		triggerServerEvent("closeMichelles", getLocalPlayer())
	end)
end
addEvent( "showMichelles", true )
addEventHandler( "showMichelles", getRootElement(), michelleSelect )

SpezialLack_Window = {}
SpezialLack_Button = {}
SpezialLack_Label = {}
SpezialLack_Scrollbar = {}

function showSpezialLack()
	--showCursor(true)
	
	local veh = getPedOccupiedVehicle(getLocalPlayer())
	if getElementData(veh, "spezcolor") == "" then
		kosten = "2.500"
	else
		kosten = "1.250"
	end
	
	SpezialLack_Window[1] = guiCreateWindow(7,201,328,337,"Michelle's Speziallack",false)
	SpezialLack_Label[1] = guiCreateLabel(11,26,308,45,"Willkommen bei Michelle's Speziallack Tuning-Garage!\nHier kannst du dir dein Fahrzeug in knalligen Farben\numlackieren. Mische dir dazu eine Farbe zusammen.",false,SpezialLack_Window[1])
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
	SpezialLack_Label[10] = guiCreateLabel(32,272,300,14,"Umlackieren: 1.250$, Neue Lackierung: 2.500$",false,SpezialLack_Window[1])
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
		triggerServerEvent("seeSpezialLack", getLocalPlayer(), red1, green1, blue1, red2, green2, blue2)
	end)
	
	addEventHandler("onClientGUIClick", SpezialLack_Button[1], function()
		guiSetVisible(SpezialLack_Window[1], false)
		showCursor(false)
		local red1 = math.floor(guiScrollBarGetScrollPosition(SpezialLack_Scrollbar[1]))
		local green1 = math.floor(guiScrollBarGetScrollPosition(SpezialLack_Scrollbar[2]))
		local blue1 = math.floor(guiScrollBarGetScrollPosition(SpezialLack_Scrollbar[3]))
		local red2 = math.floor(guiScrollBarGetScrollPosition(SpezialLack_Scrollbar[4]))
		local green2 = math.floor(guiScrollBarGetScrollPosition(SpezialLack_Scrollbar[5]))
		local blue2 = math.floor(guiScrollBarGetScrollPosition(SpezialLack_Scrollbar[6]))
		triggerServerEvent("buySpezialLack", getLocalPlayer(), red1, green1, blue1, red2, green2, blue2)
	end)
	
	addEventHandler("onClientGUIClick", SpezialLack_Button[2], function()
		guiSetVisible(SpezialLack_Window[1], false)
		showCursor(false)
		triggerServerEvent("closeSpezialLack", getLocalPlayer())
	end)
end
--addEvent( "showSpezialLack", true )
--addEventHandler( "showSpezialLack", getRootElement(), showSpezialLack )

Neon_Window = {}
Neon_Button = {}
Neon_Label = {}

function showNeonTuning()
	showCursor(true)
	
	local veh = getPedOccupiedVehicle(getLocalPlayer())
	if getElementData(veh, "neon") == "" then
		kosten = "2.500"
	else
		kosten = "1.250"
	end
	
	Neon_Window[1] = guiCreateWindow(7,201,274,226,"Michelle's Neon",false)
	
	Neon_Label[1] = guiCreateLabel(14,26,255,48,"Willkommen bei Michelle's Tuning-Garage!\nHier kannst du dir knallig Leuchtende\nNeon Roehren unter dein Auto bauen lassen!",false,Neon_Window[1])
	guiSetFont(Neon_Label[1],"default-bold-small")
	
	Neon_Label[2] = guiCreateLabel(11,80,64,15,"Farben:",false,Neon_Window[1])
	guiSetFont(Neon_Label[2],"default-bold-small")
	
	Neon_Button[1] = guiCreateButton(9,100,77,28,"Rot",false,Neon_Window[1])
	guiSetFont(Neon_Button[1],"default-bold-small")
	
	Neon_Button[2] = guiCreateButton(98,100,77,28,"Blau",false,Neon_Window[1])
	guiSetFont(Neon_Button[2],"default-bold-small")
	
	Neon_Button[3] = guiCreateButton(185,100,77,28,"Gruen",false,Neon_Window[1])
	guiSetFont(Neon_Button[3],"default-bold-small")
	
	Neon_Button[4] = guiCreateButton(9,135,77,28,"Gelb",false,Neon_Window[1])
	guiSetFont(Neon_Button[4],"default-bold-small")
	
	Neon_Button[5] = guiCreateButton(98,134,77,28,"Pink",false,Neon_Window[1])
	guiSetFont(Neon_Button[5],"default-bold-small")
	
	Neon_Button[6] = guiCreateButton(185,133,77,28,"Weiss",false,Neon_Window[1])
	guiSetFont(Neon_Button[6],"default-bold-small")
	
	Neon_Label[3] = guiCreateLabel(14,168,250,18,"Montieren: 10.000$, Farbe aendern: 7.500$",false,Neon_Window[1])
	guiSetFont(Neon_Label[3],"default-bold-small")
	
	--[[Neon_Button[7] = guiCreateButton(10,188,119,26,"Kaufen ("..kosten.."$)",false,Neon_Window[1])
	guiSetFont(Neon_Button[7],"default-bold-small")]]
	
	Neon_Button[8] = guiCreateButton(10,188,200,26,"Abbrechen",false,Neon_Window[1])
	guiSetFont(Neon_Button[8],"default-bold-small")
	
	
	addEventHandler("onClientGUIClick", Neon_Button[1], function()
		showCursor(false)
		--triggerServerEvent("seeNeon", getLocalPlayer(), "red")
		triggerServerEvent("buyNeon", getLocalPlayer(), "red")
		guiSetVisible(Neon_Window[1], false)
	end)
	addEventHandler("onClientGUIClick", Neon_Button[2], function()
		showCursor(false)
		--triggerServerEvent("seeNeon", getLocalPlayer(), "blue")
		triggerServerEvent("buyNeon", getLocalPlayer(), "blue")
		guiSetVisible(Neon_Window[1], false)
	end)
	addEventHandler("onClientGUIClick", Neon_Button[3], function()
		showCursor(false)
		--triggerServerEvent("seeNeon", getLocalPlayer(), "green")
		triggerServerEvent("buyNeon", getLocalPlayer(), "green")
		guiSetVisible(Neon_Window[1], false)
	end)
	addEventHandler("onClientGUIClick", Neon_Button[4], function()
		showCursor(false)
		--triggerServerEvent("seeNeon", getLocalPlayer(), "yellow")
		triggerServerEvent("buyNeon", getLocalPlayer(), "yellow")
		guiSetVisible(Neon_Window[1], false)
	end)
	addEventHandler("onClientGUIClick", Neon_Button[5], function()
		showCursor(false)
		--triggerServerEvent("seeNeon", getLocalPlayer(), "pink")
		triggerServerEvent("buyNeon", getLocalPlayer(), "pink")
		guiSetVisible(Neon_Window[1], false)
	end)
	addEventHandler("onClientGUIClick", Neon_Button[6], function()
		showCursor(false)
		--triggerServerEvent("seeNeon", getLocalPlayer(), "white")
		triggerServerEvent("buyNeon", getLocalPlayer(), "white")
		guiSetVisible(Neon_Window[1], false)
	end)
	--[[addEventHandler("onClientGUIClick", Neon_Button[7], function()
		triggerServerEvent("buyNeon", getLocalPlayer())
		guiSetVisible(Neon_Window[1], false)
		showCursor(false)
	end)]]
	addEventHandler("onClientGUIClick", Neon_Button[8], function()
		guiSetVisible(Neon_Window[1], false)
		showCursor(false)
		triggerServerEvent("closeNeon", getLocalPlayer())
	end)
end
addEvent( "showNeonTuning", true )
addEventHandler( "showNeonTuning", getRootElement(), showNeonTuning )