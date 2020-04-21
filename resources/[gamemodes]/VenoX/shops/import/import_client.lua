createBlip ( -1570.33, 83.42, 2.45, 6, 0.75, 255, 0, 0, 255, 0, 200 )

local importMarker = createMarker ( -1570.33, 83.42, 2.45, "cylinder", 1.5, 255, 0, 0, 150 )
function showImportWindow ( hit, dim )

	if hit == lp and dim and not getPedOccupiedVehicle ( hit ) then
		gWindow["bellicImport"] = guiCreateWindow(526,500,264,180,"Bellic & Bellic Import Co.",false)
		guiSetAlpha(gWindow["bellicImport"],1)
		
		gButton["importBuyUzi"] = guiCreateButton(11,77,67,41,"Uzi",false,gWindow["bellicImport"])
		guiSetAlpha(gButton["importBuyUzi"],1)
		gButton["importBuyTec9"] = guiCreateButton(11,29,67,41,"Tec9",false,gWindow["bellicImport"])
		guiSetAlpha(gButton["importBuyTec9"],1)
		gButton["importBuyMag"] = guiCreateButton(12,124,67,41,"Magazin",false,gWindow["bellicImport"])
		guiSetAlpha(gButton["importBuyMag"],1)
		gButton["importClose"] = guiCreateButton(186,124,67,41,"Schliessen",false,gWindow["bellicImport"])
		guiSetAlpha(gButton["importClose"],1)
		
		gLabel[1] = guiCreateLabel(34,24,33,16,"750 $",false,gButton["importBuyTec9"])
		guiSetAlpha(gLabel[1],1)
		guiLabelSetColor(gLabel[1],0,200,0)
		guiLabelSetVerticalAlign(gLabel[1],"top")
		guiLabelSetHorizontalAlign(gLabel[1],"left",false)
		guiSetFont(gLabel[1],"default-bold-small")
		gLabel[2] = guiCreateLabel(34,25,33,14,"750 $",false,gButton["importBuyUzi"])
		guiSetAlpha(gLabel[2],1)
		guiLabelSetColor(gLabel[2],0,200,0)
		guiLabelSetVerticalAlign(gLabel[2],"top")
		guiLabelSetHorizontalAlign(gLabel[2],"left",false)
		guiSetFont(gLabel[2],"default-bold-small")
		gLabel[3] = guiCreateLabel(33,26,30,15,"150 $",false,gButton["importBuyMag"])
		guiSetAlpha(gLabel[3],1)
		guiLabelSetColor(gLabel[3],0,200,0)
		guiLabelSetVerticalAlign(gLabel[3],"top")
		guiLabelSetHorizontalAlign(gLabel[3],"left",false)
		guiSetFont(gLabel[3],"default-bold-small")
		gLabel[4] = guiCreateLabel(79,60,176,66,"Einhaendige Schnellfeuerwaffe.\nEs koennen auch zwei zur\ngleichen Zeit verwendet\nwerden.",false,gWindow["bellicImport"])
		guiSetAlpha(gLabel[4],1)
		guiLabelSetColor(gLabel[4],200,200,0)
		guiLabelSetVerticalAlign(gLabel[4],"top")
		guiLabelSetHorizontalAlign(gLabel[4],"left",false)
		guiSetFont(gLabel[4],"default-bold-small")
		
		showCursor ( true )
		setElementClicked ( true )
		
		addEventHandler ( "onClientGUIClick", gButton["importClose"],
			function ()
				showCursor ( false )
				setElementClicked ( false )
				destroyElement ( gWindow["bellicImport"] )
			end,
		false )
		
		addEventHandler ( "onClientGUIClick", gButton["importBuyUzi"],
			function ()
				triggerServerEvent ( "importRecieve", lp, "uzi" )
			end,
		false )
		addEventHandler ( "onClientGUIClick", gButton["importBuyTec9"],
			function ()
				triggerServerEvent ( "importRecieve", lp, "tec9" )
			end,
		false )
		addEventHandler ( "onClientGUIClick", gButton["importBuyMag"],
			function ()
				triggerServerEvent ( "importRecieve", lp, "ammo" )
			end,
		false )
	end
end
addEventHandler ( "onClientMarkerHit", importMarker, showImportWindow )