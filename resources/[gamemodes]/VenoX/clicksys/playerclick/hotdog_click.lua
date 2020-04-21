function giveHotDogGui()

	if gWindow["sellHotdog"] then
		guiSetVisible ( gWindow["sellHotdog"], true )
	else
		gWindow["sellHotdog"] = guiCreateWindow(screenwidth/2-187/2,145,187,108,"Hotdogverkauf",false)
		guiSetAlpha(gWindow["sellHotdog"],1)
		gButton["sellHotdog"] = guiCreateButton(0.5722,0.2685,0.369,0.2963,"Anbieten",true,gWindow["sellHotdog"])
		guiSetAlpha(gButton["sellHotdog"],1)
		gLabel["hotdogPreis"] = guiCreateLabel(0.0481,0.3148,0.1765,0.1759,"Preis:",true,gWindow["sellHotdog"])
		guiSetAlpha(gLabel["hotdogPreis"],1)
		guiLabelSetColor(gLabel["hotdogPreis"],200,200,125)
		guiLabelSetVerticalAlign(gLabel["hotdogPreis"],"top")
		guiLabelSetHorizontalAlign(gLabel["hotdogPreis"],"left",false)
		guiSetFont(gLabel["hotdogPreis"],"default-bold-small")
		gEdit["hotdogPrice"] = guiCreateEdit(0.2567,0.2963,0.1872,0.213,"",true,gWindow["sellHotdog"])
		guiSetAlpha(gEdit["hotdogPrice"],1)
		gLabel["hotdogsLeft"] = guiCreateLabel(0.0428,0.6019,0.7005,0.3241,"Verbleibende Hotdogs\n im Wagen:",true,gWindow["sellHotdog"])
		guiSetAlpha(gLabel["hotdogsLeft"],1)
		guiLabelSetColor(gLabel["hotdogsLeft"],200,015,015)
		guiLabelSetVerticalAlign(gLabel["hotdogsLeft"],"top")
		guiLabelSetHorizontalAlign(gLabel["hotdogsLeft"],"left",false)
		guiSetFont(gLabel["hotdogsLeft"],"default-bold-small")
		gLabel["hotdogsCurrent"] = guiCreateLabel(0.4064,0.7315,0.4385,0.1759,"0 Hotdogs",true,gWindow["sellHotdog"])
		guiSetAlpha(gLabel["hotdogsCurrent"],1)
		guiLabelSetColor(gLabel["hotdogsCurrent"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["hotdogsCurrent"],"top")
		guiLabelSetHorizontalAlign(gLabel["hotdogsCurrent"],"left",false)
		guiSetFont(gLabel["hotdogsCurrent"],"default-bold-small")
		gLabel["hotdog$Symbol"] = guiCreateLabel(0.4652,0.3148,0.0535,0.1481,"$",true,gWindow["sellHotdog"])
		guiSetAlpha(gLabel["hotdog$Symbol"],1)
		guiLabelSetColor(gLabel["hotdog$Symbol"],015,200,000)
		guiLabelSetVerticalAlign(gLabel["hotdog$Symbol"],"top")
		guiLabelSetHorizontalAlign(gLabel["hotdog$Symbol"],"left",false)
		
		addEventHandler("onClientGUIClick", gButton["sellHotdog"],
			function()
				triggerServerEvent ( "sellhotdog", getLocalPlayer(), getLocalPlayer(), "", guiGetText ( gEdit["hotdogPrice"] ) )
			end
		)
	end
end

function HotdogLoadMenue()

	showCursor ( true )
	setElementClicked ( true )
	if gWindow["hotdogBuyin"] then
		guiSetVisible ( gWindow["hotdogBuyin"], true )
	else
		gWindow["hotdogBuyin"] = guiCreateWindow(screenwidth/2-135/2,screenheight/2-99/2,135,99,"Hotdogs einladen",false)
		guiSetAlpha(gWindow["hotdogBuyin"],1)
		gButton["hotdogLoad"] = guiCreateButton(0.4519,0.2424,0.4815,0.2727,"Einladen",true,gWindow["hotdogBuyin"])
		guiSetAlpha(gButton["hotdogLoad"],1)
		gEdit["hotdogAmount"] = guiCreateEdit(0.0667,0.2626,0.2667,0.202,"",true,gWindow["hotdogBuyin"])
		guiSetAlpha(gEdit["hotdogAmount"],1)
		gLabel["hotdogInfotext"] = guiCreateLabel(0.0667,0.5253,0.7185,0.1919,"Preis pro Hotdog:",true,gWindow["hotdogBuyin"])
		guiSetAlpha(gLabel["hotdogInfotext"],1)
		guiLabelSetColor(gLabel["hotdogInfotext"],200,200,000)
		guiLabelSetVerticalAlign(gLabel["hotdogInfotext"],"top")
		guiLabelSetHorizontalAlign(gLabel["hotdogInfotext"],"left",false)
		guiSetFont(gLabel["hotdogInfotext"],"default-bold-small")
		gLabel["hotdogPrice"] = guiCreateLabel(0.0593,0.7273,0.5556,0.1515,"1 $ / Stueck",true,gWindow["hotdogBuyin"])
		guiSetAlpha(gLabel["hotdogPrice"],1)
		guiLabelSetColor(gLabel["hotdogPrice"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["hotdogPrice"],"top")
		guiLabelSetHorizontalAlign(gLabel["hotdogPrice"],"left",false)
		guiSetFont(gLabel["hotdogPrice"],"default-bold-small")
		
		addEventHandler("onClientGUIClick", gButton["hotdogLoad"],
			function()
				triggerServerEvent ( "buyhotdogs", lp, lp, math.abs ( math.floor ( tonumber ( guiGetText ( gEdit["hotdogAmount"] ) ) ) ) )
				showCursor ( false )
				guiSetVisible ( gWindow["hotdogBuyin"], false )
				triggerServerEvent ( "cancel_gui_server", lp )
			end
		)
	end
end
addEvent ( "showHotdogLoadMenue", true )
addEventHandler ( "showHotdogLoadMenue", getRootElement(), HotdogLoadMenue )