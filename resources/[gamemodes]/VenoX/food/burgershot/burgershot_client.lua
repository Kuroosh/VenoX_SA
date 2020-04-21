createObject ( 2642, -2358.2592773438, -160.6789855957, 36.138740539551 )
createObject ( 8843, -2352.7250976563, -159.10821533203, 34.3203125 )
createObject ( 8843, -2333.2939453125, -172.28869628906, 34.3203125, 0, 0, 90 )

createBlip ( -2352.765625, -155.2479095459, 34.0703125, 10, 2, 255, 0, 0, 255, 0, 200 )
createBlip ( 2154.13, 2808.33, 9.81, 10, 2, 255, 0, 0, 255, 0, 200 )
createBlip ( 1856.83, 2081.05, 9.82, 10, 2, 255, 0, 0, 255, 0, 200 )

DriveInMarkerSF = createMarker ( -2352.765625, -155.2479095459, 34.0703125, "cylinder", 5, 125, 0, 0, 200 )
DriveInMarkerLV1 = createMarker ( 2154.13, 2808.33, 9.81, "cylinder", 5, 125, 0, 0, 200 )
DriveInMarkerLV2 = createMarker ( 1856.83, 2081.05, 9.82, "cylinder", 5, 125, 0, 0, 200 )

function showDriveIn_func ( hit, dim )

	local _, _, z1 = getElementPosition ( source )
	local _, _, z2 = getElementPosition ( hit )
	local diff = math.abs ( z1 - z2 )
	if hit == lp and dim and diff < 5 then
		setElementClicked ( true )
		showCursor ( true )
		if gWindow["burgershotDriveIn"] then
			guiSetVisible ( gWindow["burgershotDriveIn"], true )
		else
			gWindow["burgershotDriveIn"] = guiCreateWindow ( screenwidth/2-284/2, screenheight/2-122/2, 284, 122, "Burgershot", false )
			guiSetAlpha(gWindow["burgershotDriveIn"],1)
			
			gImage["burgershotBurger"] = guiCreateStaticImage(0.0317,0.5,0.1761,0.4098,"images/inventory/burger.png",true,gWindow["burgershotDriveIn"])
			guiSetAlpha(gImage["burgershotBurger"],1)
			gImage["burgershotSnack"] = guiCreateStaticImage(0.4859,0.5,0.1761,0.4098,"images/inventory/snack.bmp",true,gWindow["burgershotDriveIn"])
			guiSetAlpha(gImage["burgershotSnack"],1)
			
			gLabel["burgershotInfo"] = guiCreateLabel(0.0352,0.1885,0.7711,0.23,"Herzlich Wilkommen bei \"Burgershot\".\nIhre Bestellung bitte!",true,gWindow["burgershotDriveIn"])
			guiSetAlpha(gLabel["burgershotInfo"],1)
			guiLabelSetColor(gLabel["burgershotInfo"],200,200,000)
			guiLabelSetVerticalAlign(gLabel["burgershotInfo"],"top")
			guiLabelSetHorizontalAlign(gLabel["burgershotInfo"],"left",false)
			guiSetFont(gLabel["burgershotInfo"],"default-bold-small")
			gLabel["burgershotInfo1"] = guiCreateLabel(0.2676,0.4344,0.1408,0.123,"Burger",true,gWindow["burgershotDriveIn"])
			guiSetAlpha(gLabel["burgershotInfo1"],1)
			guiLabelSetColor(gLabel["burgershotInfo1"],255,255,255)
			guiLabelSetVerticalAlign(gLabel["burgershotInfo1"],"top")
			guiLabelSetHorizontalAlign(gLabel["burgershotInfo1"],"left",false)
			guiSetFont(gLabel["burgershotInfo1"],"default-bold-small")
			gLabel["burgershotInfo2"] = guiCreateLabel(0.2993,0.5656,0.0915,0.1311, burgerPrice.." $",true,gWindow["burgershotDriveIn"])
			guiSetAlpha(gLabel["burgershotInfo2"],1)
			guiLabelSetColor(gLabel["burgershotInfo2"],025,125,000)
			guiLabelSetVerticalAlign(gLabel["burgershotInfo2"],"top")
			guiLabelSetHorizontalAlign(gLabel["burgershotInfo2"],"left",false)
			guiSetFont(gLabel["burgershotInfo2"],"default-bold-small")
			gLabel["burgershotPrice1"] = guiCreateLabel(0.7711,0.6066,0.0906,0.1301, snackPrice.." $",true,gWindow["burgershotDriveIn"])
			guiSetAlpha(gLabel["burgershotPrice1"],1)
			guiLabelSetColor(gLabel["burgershotPrice1"],25,125,0)
			guiLabelSetVerticalAlign(gLabel["burgershotPrice1"],"top")
			guiLabelSetHorizontalAlign(gLabel["burgershotPrice1"],"left",false)
			guiSetFont(gLabel["burgershotPrice1"],"default-bold-small")
			gLabel["burgershotPrice2"] = guiCreateLabel(0.7359,0.4672,0.1717,0.122,"Snack",true,gWindow["burgershotDriveIn"])
			guiSetAlpha(gLabel["burgershotPrice2"],1)
			guiLabelSetColor(gLabel["burgershotPrice2"],255,255,255)
			guiLabelSetVerticalAlign(gLabel["burgershotPrice2"],"top")
			guiLabelSetHorizontalAlign(gLabel["burgershotPrice2"],"left",false)
			guiSetFont(gLabel["burgershotPrice2"],"default-bold-small")
			
			gButton["burgershotClose"] = guiCreateButton(0.9014,0.1885,0.0669,0.1639,"X",true,gWindow["burgershotDriveIn"])
			guiSetAlpha(gButton["burgershotClose"],1)
			gButton["BurgershotBuy1"] = guiCreateButton(0.2289,0.7213,0.2148,0.1967,"Kaufen",true,gWindow["burgershotDriveIn"])
			guiSetAlpha(gButton["BurgershotBuy1"],1)
			gButton["BurgershotBuy2"] = guiCreateButton(0.6972,0.7377,0.2148,0.1967,"Kaufen",true,gWindow["burgershotDriveIn"])
			guiSetAlpha(gButton["BurgershotBuy2"],1)
			
			addEventHandler( "onClientGUIClick", gButton["burgershotClose"],
				function ()
					guiSetVisible ( gWindow["burgershotDriveIn"], false )
					setElementClicked ( false )
					showCursor ( false )
				end
			)
			addEventHandler( "onClientGUIClick", gButton["BurgershotBuy1"],
				function ()
					triggerServerEvent ( "BurgershotBuy", lp, 1 )
				end
			)
			addEventHandler( "onClientGUIClick", gButton["BurgershotBuy2"],
				function ()
					triggerServerEvent ( "BurgershotBuy", lp, 2 )
				end
			)
		end
	end
end
addEventHandler ( "onClientMarkerHit", DriveInMarkerSF, showDriveIn_func )
addEventHandler ( "onClientMarkerHit", DriveInMarkerLV1, showDriveIn_func )
addEventHandler ( "onClientMarkerHit", DriveInMarkerLV2, showDriveIn_func )