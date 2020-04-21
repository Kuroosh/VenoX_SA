function showDrugMenue ()

	if gWindow["drogenverkauf"] then
		guiSetVisible ( gWindow["drogenverkauf"], true )
	else
		--gWindow["drogenverkauf"] = guiCreateWindow(screenwidth/2-255/2, 145,255,119,"Drogenverkauf",false)
		gWindow["drogenverkauf"] = guiCreateStaticImage(screenwidth/2-255/2, 145,255,119,"images/hud/background.png",false)
		guiSetAlpha(gWindow["drogenverkauf"],1)
		gLabel["drogen"] = guiCreateLabel(14,30,109,18,"Drogen (in gramm)",false,gWindow["drogenverkauf"])
		guiSetAlpha(gLabel["drogen"],1)
		guiLabelSetColor(gLabel["drogen"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["drogen"],"top")
		guiLabelSetHorizontalAlign(gLabel["drogen"],"left",false)
		guiSetFont(gLabel["drogen"],"default-bold-small")
		gEdit["drogenanzahl"] = guiCreateEdit(41,58,59,20,"",false,gWindow["drogenverkauf"])
		guiSetAlpha(gEdit["drogenanzahl"],1)
		gButton["verkaufen"] = guiCreateButton(86,92,72,18,"Geben",false,gWindow["drogenverkauf"])
		guiSetAlpha(gButton["verkaufen"],1)
		gButton["abbrechen"] = guiCreateButton(225,25,20,20,"X",false,gWindow["drogenverkauf"])
		guiSetAlpha(gButton["abbrechen"],1)
	end
	addEventHandler("onClientGUIClick", gButton["verkaufen"], givedrugs, false)
	addEventHandler("onClientGUIClick", gButton["abbrechen"], closeDrugWindow, false)
end

function givedrugs ()

	local target = vnxClientGetElementData ( "curclicked" )
	triggerServerEvent ( "givedrugs", root, localPlayer, "cmd", target, tonumber ( guiGetText ( gEdit["drogenanzahl"] ) ) )
end

function closeDrugWindow()

	guiSetVisible(gWindow["drogenverkauf"],false)
end