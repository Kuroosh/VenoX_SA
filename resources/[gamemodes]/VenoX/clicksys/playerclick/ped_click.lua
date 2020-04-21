npcTexts = {}
 npcTexts["dealer"] = "Psst...\nBrauchst du Stoff?"
 npcTexts["wdealer"] = "Hier rüber!\nIch hab da was für dich..."
 npcTexts["sdealer"] = "Ich hab hier n Pflänzchen -\nzumindest sinds welche, wenn\nman die richtig anbaut..."
 npcTexts["bum"] = "Hey du! Hassu was zu essen?\nIch verreck hier sons..."
 npcTexts["gunbuyer"] = "Hey Kumpel...\nHast du ne Knarre?"
 npcTexts["carseller1"] = "Hey, Interesse an nem neuen Wagen?"
 npcTexts["carseller2"] = "Der hier ist vom Laster gefallen...\nInteressiert?"
 npcTexts["carseller3"] = "Neuer Wagen gefällig?"

function showPedInteraction_func ( typ, item, price )

	if gWindow["pedInteraction"] then
		guiSetVisible ( gWindow["pedInteraction"], true )
	else
		gWindow["pedInteraction"] = guiCreateWindow(screenwidth/2-292/2, screenheight/2-245/2,292,245,"Gelegenheit",false)
		guiSetAlpha(gWindow["pedInteraction"],1)
		guiWindowSetMovable(gWindow["pedInteraction"],false)
		guiWindowSetSizable(gWindow["pedInteraction"],false)
		gLabel["pedInteraction"] = guiCreateLabel(10,27,272,150,"",false,gWindow["pedInteraction"])
		guiSetAlpha(gLabel["pedInteraction"],1)
		guiLabelSetColor(gLabel["pedInteraction"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["pedInteraction"],"top")
		guiLabelSetHorizontalAlign(gLabel["pedInteraction"],"left",false)
		guiSetFont(gLabel["pedInteraction"],"default-bold-small")
		
		gLabel["pedInteraction2"] = guiCreateLabel(8,137,39,18,"Bietet:",false,gWindow["pedInteraction"])
		guiLabelSetColor(gLabel["pedInteraction2"],0,200,0)
		guiLabelSetVerticalAlign(gLabel["pedInteraction2"],"top")
		guiLabelSetHorizontalAlign(gLabel["pedInteraction2"],"left",false)
		guiSetFont(gLabel["pedInteraction2"],"default-bold-small")
		gLabel["pedInteraction3"] = guiCreateLabel(141,137,49,18,"Fordert:",false,gWindow["pedInteraction"])
		guiLabelSetColor(gLabel["pedInteraction3"],200,00,0)
		guiLabelSetVerticalAlign(gLabel["pedInteraction3"],"top")
		guiLabelSetHorizontalAlign(gLabel["pedInteraction3"],"left",false)
		guiSetFont(gLabel["pedInteraction3"],"default-bold-small")
		gLabel["pedInteractionOffers"] = guiCreateLabel(23,156,89,35,"",false,gWindow["pedInteraction"])
		guiLabelSetColor(gLabel["pedInteractionOffers"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["pedInteractionOffers"],"top")
		guiLabelSetHorizontalAlign(gLabel["pedInteractionOffers"],"left",false)
		guiSetFont(gLabel["pedInteractionOffers"],"default-bold-small")
		gLabel["pedInteractionNeeds"] = guiCreateLabel(156,154,89,35,"",false,gWindow["pedInteraction"])
		guiLabelSetColor(gLabel["pedInteractionNeeds"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["pedInteractionNeeds"],"top")
		guiLabelSetHorizontalAlign(gLabel["pedInteractionNeeds"],"left",false)
		guiSetFont(gLabel["pedInteractionNeeds"],"default-bold-small")
		
		gButton["pedAgree"] = guiCreateButton(113,197,72,35,"Zustimmen",false,gWindow["pedInteraction"])
		guiSetAlpha(gButton["pedAgree"],1)
		guiSetFont(gButton["pedAgree"],"default-bold-small")
		gButton["pedClose"] = guiCreateButton(267,24,15,17,"x",false,gWindow["pedInteraction"])
		guiSetAlpha(gButton["pedClose"],1)
		
		addEventHandler ( "onClientGUIClick", gButton["pedClose"],
			function ()
				guiSetVisible ( gWindow["pedInteraction"], false )
				showCursor ( false )
				triggerServerEvent ( "cancel_gui_server", lp )
			end,
		false )
		addEventHandler ( "onClientGUIClick", gButton["pedAgree"],
			function ()
				guiSetVisible ( gWindow["pedInteraction"], false )
				showCursor ( false )
				triggerServerEvent ( "cancel_gui_server", lp )
				triggerServerEvent ( "agreeWithPed", lp )
			end,
		false )
	end
	if typ == "car" then
		typ = "carseller"..math.random(1,3)
	end
	local text = npcTexts[typ]
	guiSetText ( gLabel["pedInteraction"], text )
	guiSetText ( gLabel["pedInteractionOffers"], item )
	guiSetText ( gLabel["pedInteractionNeeds"], price )
end
addEvent ( "showPedInteraction", true )
addEventHandler ( "showPedInteraction", getRootElement(), showPedInteraction_func )