barMarkers = {}
 barMarkers["x"] = {}
 barMarkers["y"] = {}
 barMarkers["z"] = {}
 barMarkers["int"] = {}
 barMarkers["dim"] = {}
 barMarkers["size"] = {}
  barMarkers["marker"] = {}
  barMarkers["x"][1], barMarkers["y"][1], barMarkers["z"][1], barMarkers["int"][1], barMarkers["dim"][1], barMarkers["size"][1] = -2652.2902832031, 1410.4134521484, 905.24816894531, 3, 0, 1
  barMarkers["x"][2], barMarkers["y"][2], barMarkers["z"][2], barMarkers["int"][2], barMarkers["dim"][2], barMarkers["size"][2] = 499.94775390625, -20.654975891113, 999.67, 17, 0, 2

  -- Four Dragons Casino --
  barMarkers["x"][3], barMarkers["y"][3], barMarkers["z"][3], barMarkers["int"][3], barMarkers["dim"][3], barMarkers["size"][3] = 1945.8907470703, 1017.8198242188, 991.4501953125, 10, 0, 1
  barMarkers["x"][4], barMarkers["y"][4], barMarkers["z"][4], barMarkers["int"][4], barMarkers["dim"][4], barMarkers["size"][4] = 1955.6105957031, 1017.8285522461, 991.4345703125, 10, 0, 1

  -- Caligulas Casino --
  barMarkers["x"][5], barMarkers["y"][5], barMarkers["z"][5], barMarkers["int"][5], barMarkers["dim"][5], barMarkers["size"][5] = 2199.7626953125, 1603.626953125, 1004.015625, 1, 0, 1
  barMarkers["x"][6], barMarkers["y"][6], barMarkers["z"][6], barMarkers["int"][6], barMarkers["dim"][6], barMarkers["size"][6] = 2188.5283203125, 1605.5618896484, 1004.028320312, 1, 0, 1

  -- Aztecas Strip --
  barMarkers["x"][7], barMarkers["y"][7], barMarkers["z"][7], barMarkers["int"][7], barMarkers["dim"][7], barMarkers["size"][7] = 1215.8959960938, -13.18529510498, 999.87084960938, 2, 0, 1

  -- Biker-Bar --
  barMarkers["x"][8], barMarkers["y"][8], barMarkers["z"][8], barMarkers["int"][8], barMarkers["dim"][8], barMarkers["size"][8] = 498.78479003906, -75.672836303711, 997.70678710938, 11, 0, 1
  barMarkers["x"][9], barMarkers["y"][9], barMarkers["z"][9], barMarkers["int"][9], barMarkers["dim"][9], barMarkers["size"][9] = 1138.87109375, -8.30859375, 999.6796875, 12, 0, 1
	
for key, index in pairs ( barMarkers["x"] ) do
	local x, y, z = barMarkers["x"][key], barMarkers["y"][key], barMarkers["z"][key]
	local int = barMarkers["int"][key]
	local dim = barMarkers["dim"][key]
	local size = barMarkers["size"][key]
	barMarkers["marker"][key] = createMarker ( x, y, z, "cylinder", size, 125, 0, 0, 150 )
	setElementInterior ( barMarkers["marker"][key], int )
	setElementDimension ( barMarkers["marker"][key], dim )
	addEventHandler ( "onClientMarkerHit", barMarkers["marker"][key],
		function ( player, dim )
			if player == lp and dim then
				if getElementInterior ( player ) == getElementInterior ( source ) then
					showCursor ( true )
					setElementClicked ( true )
					showBarInterface ()
				end
			end
		end
	)
end

function showBarInterface ()

	if gWindow["bar"] then
		guiSetVisible ( gWindow["bar"], true )
	else
		gWindow["bar"] = guiCreateWindow(screenwidth/2-247/2,screenheight/2-221/2,247,221,"Bar",false)
		guiWindowSetMovable ( gWindow["bar"], false )
		guiWindowSetSizable ( gWindow["bar"], false )
		guiSetAlpha ( gWindow["bar"], 1 )
		
		gGrid["barDrinks"] = guiCreateGridList(9,28,134,179,false,gWindow["bar"])
		guiGridListSetSelectionMode(gGrid["barDrinks"],0)
		gColumn["barGetraenk"] = guiGridListAddColumn(gGrid["barDrinks"],"Getraenk",0.6)
		gColumn["barPreis"] = guiGridListAddColumn(gGrid["barDrinks"],"Preis",0.2)
		
		gImage[1] = guiCreateStaticImage(103,112,30,63,"images/gui/bottle.png",false,gGrid["barDrinks"])
		guiSetAlpha(gImage[1],0.7)
		
		gLabel[1] = guiCreateLabel(149,27,93,19,"Was darfs sein?",false,gWindow["bar"])
		guiLabelSetColor(gLabel[1],0,200,0)
		guiLabelSetVerticalAlign(gLabel[1],"top")
		guiLabelSetHorizontalAlign(gLabel[1],"left",false)
		guiSetFont(gLabel[1],"default-bold-small")
		
		gButton["barDrink"] = guiCreateButton(160,50,72,43,"Trinken",false,gWindow["bar"])
		gButton["barSnack"] = guiCreateButton(160,104,72,43,"Snack\nkaufen",false,gWindow["bar"])
		gButton["barClose"] = guiCreateButton(160,159,72,43,"Schliessen",false,gWindow["bar"])
		
		addEventHandler ( "onClientGUIClick", gButton["barDrink"],
			function ()
				local row, column = guiGridListGetSelectedItem ( gGrid["barDrinks"] )
				local drink = guiGridListGetItemText ( gGrid["barDrinks"], row, gColumn["barGetraenk"] )
				if alcoholSorts[drink] then
					showCursor ( false )
					setElementClicked ( false )
					guiSetVisible ( gWindow["bar"], false )
					triggerServerEvent ( "drinkSomethingFromBar", lp, drink )
				end
			end
		)
		addEventHandler ( "onClientGUIClick", gButton["barClose"],
			function ()
				showCursor ( false )
				setElementClicked ( false )
				guiSetVisible ( gWindow["bar"], false )
			end
		)
		addEventHandler ( "onClientGUIClick", gButton["barSnack"],
			function ()
				triggerServerEvent ( "buySnack", getLocalPlayer(), lp )
			end
		)
		for key, index in pairs ( alcoholPrices ) do
			local row = guiGridListAddRow ( gGrid["barDrinks"] )
			guiGridListSetItemText ( gGrid["barDrinks"], row, gColumn["barGetraenk"], key, false, false )
			guiGridListSetItemText ( gGrid["barDrinks"], row, gColumn["barPreis"], index.." $", false, false )
		end
	end
end