function showTaxiMenue ()

	if gWindow["sataxi"] then
		guiSetVisible ( gWindow["sataxi"], true )
	else
		gWindow["sataxi"] = guiCreateWindow(516,244,198,315,"SA Taxi.",false)
		guiSetAlpha(gWindow["sataxi"],1)
		gImage["taxi"] = guiCreateStaticImage(10,27,75,45,"images/taxi.jpg",false,gWindow["sataxi"])
		guiSetAlpha(gImage["taxi"],1)
		gLabel["taxiInfo1"] = guiCreateLabel(95,26,185,39,"Bitte waehle ein\ngueltiges Ziel!",false,gWindow["sataxi"])
		guiSetAlpha(gLabel["taxiInfo1"],1)
		guiLabelSetColor(gLabel["taxiInfo1"],200,200,000)
		guiLabelSetVerticalAlign(gLabel["taxiInfo1"],"top")
		guiLabelSetHorizontalAlign(gLabel["taxiInfo1"],"left",false)
		guiSetFont(gLabel["taxiInfo1"],"default-bold-small")

		gGrid["taxiZielList"] = guiCreateGridList(9,79,180,184,false,gWindow["sataxi"])
		guiGridListSetSelectionMode(gGrid["taxiZielList"],0)
		gColumn["taxiZiel"] = guiGridListAddColumn(gGrid["taxiZielList"],"Ziel",0.6)
		gColumn["taxiKosten"] = guiGridListAddColumn(gGrid["taxiZielList"],"Kosten",0.2)
		guiSetAlpha(gGrid["taxiZielList"],1)

		fillTaxiListWithRoutes ( gGrid["taxiZielList"], gColumn["taxiZiel"], gColumn["taxiKosten"] )

		gButton["taxiDrive"] = guiCreateButton(9,268,76,38,"Ausfuehren",false,gWindow["sataxi"])
		guiSetAlpha(gButton["taxiDrive"],1)
		addEventHandler ( "onClientGUIClick", gButton["taxiDrive"],
			function ( btn, state )
				local text = guiGridListGetItemText ( gGrid["taxiZielList"], guiGridListGetSelectedItem ( gGrid["taxiZielList"] ), gColumn["taxiZiel"] )
				local price = guiGridListGetItemText ( gGrid["taxiZielList"], guiGridListGetSelectedItem ( gGrid["taxiZielList"] ), gColumn["taxiKosten"] )
				if taxiTargets[text] then
					price = tonumber ( gettok ( price, 1, string.byte('$') ) )
					triggerServerEvent ( "taxi", lp, lp, taxiTargets[text], price )
					setElementClicked ( false )
					showCursor ( false )
					guiSetVisible ( gWindow["sataxi"], false )
				end
			end,
		false )
		gButton["taxiCancel"] = guiCreateButton(114,268,76,38,"Abbrechen",false,gWindow["sataxi"])
		guiSetAlpha(gButton["taxiCancel"],1)
		addEventHandler ( "onClientGUIClick", gButton["taxiCancel"], 
			function ( btn, state )
				if state == "up" then
					setElementClicked ( false )
					showCursor ( false )
					guiSetVisible ( gWindow["sataxi"], false )
				end
			end,
		false )
	end
end

showCabMarker = createMarker ( -1985.2713623047, 168.96708679199, 26.662504196167, "cylinder", 1, 200, 0, 0, 200 )
function showCabMarker_func ( hit, dim )

	if dim and hit and not getPedOccupiedVehicle ( hit ) and hit == lp then
		setElementClicked ( true )
		showCursor ( true )
		showTaxiMenue ()
	end
end
addEventHandler ( "onClientMarkerHit", showCabMarker, showCabMarker_func )