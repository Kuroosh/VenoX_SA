itemShopItems = {
 ["Bier"]=beer_price,
 ["Blumen"]=flowers_price,
 ["Kamera"]=cam_price,
 ["Kamera Film"]=camammo_price,
 ["Nachtsichtgeraet"]=nvgoogles_price,
 ["Infrarotsichtgeraet"]=tgoogles_price,
 ["Wuerfel"]=wuerfel_price,
 ["Rubbellos"]=rubbellos_price,
 ["Zigaretten"]=zigarett_price
 }
 
itemShopIDs = {
 ["Bier"]="beer",
 ["Blumen"]="flowers",
 ["Kamera"]="cam",
 ["Kamera Film"]="camammo",
 ["Nachtsichtgeraet"]="nv",
 ["Infrarotsichtgeraet"]="t",
 ["Wuerfel"]="dice",
 ["Rubbellos"]="los",
 ["Zigaretten"]="cig",
 ["50 $ Guthaben"]="sim-50",
 ["100 $ Guthaben"]="sim-100",
 ["250 $ Guthaben"]="sim-250"
 }

function create24_7Shop_func ()

	showCursor ( true )
	if gWindow["24-7"] then
		guiSetVisible ( gWindow["24-7"], true )
	else
		gWindow["24-7"] = guiCreateWindow(screenwidth/2-316/2,screenheight/2-306/2,316,306,"24-7 Laden",false)
		guiWindowSetMovable ( gWindow["24-7"], false )
		guiWindowSetSizable  ( gWindow["24-7"], false )
		guiSetAlpha ( gWindow["24-7"], 1 )
		gImage[1] = guiCreateStaticImage(9,31,138,58,"images/gui/24-7.png",false,gWindow["24-7"])
		gLabel[1] = guiCreateLabel(151,23,139,69,"Herzlich willkommen im\n24-7 Laden!\n\nHier bekommst du alles,\nwas du brauchst.",false,gWindow["24-7"])
		guiLabelSetColor(gLabel[1],200,200,0)
		guiLabelSetVerticalAlign(gLabel[1],"top")
		guiLabelSetHorizontalAlign(gLabel[1],"left",false)
		guiSetFont(gLabel[1],"default-bold-small")
		
		gGrid["24-7Items"] = guiCreateGridList(11,108,216,185,false,gWindow["24-7"])
		guiGridListSetSelectionMode(gGrid["24-7Items"],0)
		gColumn["24-7Names"] = guiGridListAddColumn(gGrid["24-7Items"],"Artikel",0.6)
		gColumn["24-7Prices"] = guiGridListAddColumn(gGrid["24-7Items"],"Preis",0.2)
		
		local row
		for key, index in pairs ( itemShopItems ) do
			row = guiGridListAddRow ( gGrid["24-7Items"] )
			guiGridListSetItemText ( gGrid["24-7Items"], row, gColumn["24-7Names"], key, false, false )
			guiGridListSetItemText ( gGrid["24-7Items"], row, gColumn["24-7Prices"], tostring ( index ).." $", false, false )
		end
		row = guiGridListAddRow ( gGrid["24-7Items"] )
		
		row = guiGridListAddRow ( gGrid["24-7Items"] )
		guiGridListSetItemText ( gGrid["24-7Items"], row, gColumn["24-7Names"], "Handy", true, false )
		
		
		
		row = guiGridListAddRow ( gGrid["24-7Items"] )
		guiGridListSetItemText ( gGrid["24-7Items"], row, gColumn["24-7Names"], "50 $ Guthaben", false, false )
		guiGridListSetItemText ( gGrid["24-7Items"], row, gColumn["24-7Prices"], tostring ( prePaidPrices["low"] ).." $", false, false )
		
		row = guiGridListAddRow ( gGrid["24-7Items"] )
		guiGridListSetItemText ( gGrid["24-7Items"], row, gColumn["24-7Names"], "100 $ Guthaben", false, false )
		guiGridListSetItemText ( gGrid["24-7Items"], row, gColumn["24-7Prices"], tostring ( prePaidPrices["middle"] ).." $", false, false )
		
		row = guiGridListAddRow ( gGrid["24-7Items"] )
		guiGridListSetItemText ( gGrid["24-7Items"], row, gColumn["24-7Names"], "250 $ Guthaben", false, false )
		guiGridListSetItemText ( gGrid["24-7Items"], row, gColumn["24-7Prices"], tostring ( prePaidPrices["large"] ).." $", false, false )
		
		gLabel[2] = guiCreateLabel(231,153,30,15,"Geld:",false,gWindow["24-7"])
		guiLabelSetColor(gLabel[2],200,200,0)
		guiLabelSetVerticalAlign(gLabel[2],"top")
		guiLabelSetHorizontalAlign(gLabel[2],"left",false)
		guiSetFont(gLabel[2],"default-bold-small")
		gLabel["curMoney24-7"] = guiCreateLabel(237,167,71,15,"0 $",false,gWindow["24-7"])
		guiLabelSetColor(gLabel["curMoney24-7"],0,125,0)
		guiLabelSetVerticalAlign(gLabel["curMoney24-7"],"top")
		guiLabelSetHorizontalAlign(gLabel["curMoney24-7"],"left",false)
		guiSetFont(gLabel["curMoney24-7"],"default-bold-small")
		
		gRadio["vertrag"] = guiCreateRadioButton(233,192,72,20,"Vertrag",false,gWindow["24-7"])
		guiSetFont(gRadio["vertrag"],"default-bold-small")
		gRadio["prepayed"] = guiCreateRadioButton(233,212,72,20,"PrePayed",false,gWindow["24-7"])
		guiSetFont(gRadio["prepayed"],"default-bold-small")
		gRadio["flatrate"] = guiCreateRadioButton(233,232,72,20,"Flatrate",false,gWindow["24-7"])
		guiRadioButtonSetSelected(gRadio["flatrate"],true)
		
		guiSetToolTip ( gRadio["flatrate"], "Test" )
		
		guiSetFont(gRadio["flatrate"],"default-bold-small")
		
		gButton["close24-7Window"] = guiCreateButton(289,22,18,19,"x",false,gWindow["24-7"])
		guiSetFont(gButton["close24-7Window"],"default-bold-small")
		addEventHandler ( "onClientGUIClick", gButton["close24-7Window"],
			function ()
				showCursor ( false )
				guiSetVisible ( gWindow["24-7"], false )
				triggerServerEvent ( "Cancel24_7", lp, lp )
			end,
		false )
		gButton["buy24-7Item"] = guiCreateButton(235,107,70,41,"Kaufen",false,gWindow["24-7"])
		guiSetFont(gButton["buy24-7Item"],"default-bold-small")
		addEventHandler ( "onClientGUIClick", gButton["buy24-7Item"],
			function ( btn, state )
				if state == "up" then
					local rowindex, columnindex = guiGridListGetSelectedItem ( gGrid["24-7Items"] )
					local text = guiGridListGetItemText ( gGrid["24-7Items"], rowindex, gColumn["24-7Names"] )

					triggerServerEvent ( "itemBuy", lp, lp, itemShopIDs[text] )
				end
			end,
		false )
		gButton["changeMobile24-7"] = guiCreateButton(235,261,70,33,"Tarif\nWechseln",false,gWindow["24-7"])
		addEventHandler ( "onClientGUIClick", gButton["changeMobile24-7"],
			function ( btn, state )
				if state == "up" then
					local val
					if guiRadioButtonGetSelected(gRadio["flatrate"]) then
						val = 3
					elseif guiRadioButtonGetSelected(gRadio["prepayed"]) then
						val = 2
					elseif guiRadioButtonGetSelected(gRadio["vertrag"]) then
						val = 1
					end
					
					triggerServerEvent ( "changeTarif", lp, val )
				end
			end,
		false )
		guiSetFont(gButton["changeMobile24-7"],"default-bold-small")
	end
	refreshUtilityShopMoney ()
end
addEvent ( "create24_7Shop", true )
addEventHandler ( "create24_7Shop", getRootElement(), create24_7Shop_func )

function refreshUtilityShopMoney ()

	if gWindow["24-7"] then
		if guiGetVisible ( gWindow["24-7"] ) then
			local money = mymoney
			guiSetText ( gLabel["curMoney24-7"], money.." $" )
			setTimer ( refreshUtilityShopMoney, 1000, 1 )
		end
	end
end