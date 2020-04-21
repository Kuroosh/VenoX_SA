local casheer = createInvulnerablePed ( 178, -104.79, -8.56, 1000.36, 180, 3, 0 )
local xxxShopMarker = createMarker ( -104.79, -10.79, 999.61, "cylinder", 1, 125, 0, 0, 150 )
setElementInterior ( xxxShopMarker, 3 )

function xxxShopMarker_hit ( player, dim )

	if player == lp and dim then
		showCursor ( true )
		setElementClicked ( true )
		gWindow["sexShop"] = guiCreateWindow(screenwidth/2-194/2,screenheight/2-(295-70)/2,194,295-70,"Sexshop",false)
		guiSetAlpha(gWindow["sexShop"],1)
		gGrid["sexShop"] = guiCreateGridList(12,24,170,205-70,false,gWindow["sexShop"])
		guiGridListSetSelectionMode(gGrid["sexShop"],0)
		gColumn["sexShopItem"] = guiGridListAddColumn(gGrid["sexShop"],"Item",0.6)
		gColumn["sexShopPrice"] = guiGridListAddColumn(gGrid["sexShop"],"Preis",0.2)
		guiSetAlpha(gGrid["sexShop"],1)
		gButton["sexShopBuy"] = guiCreateButton(12,242-70,69,42,"Kaufen",false,gWindow["sexShop"])
		guiSetAlpha(gButton["sexShopBuy"],1)
		gButton["sexShopClose"] = guiCreateButton(113,242-70,69,42,"Schliessen",false,gWindow["sexShop"])
		guiSetAlpha(gButton["sexShopClose"],1)
		
		local row
		for key, index in pairs ( sexShopItems ) do
			row = guiGridListAddRow ( gGrid["sexShop"] )
			guiGridListSetItemText ( gGrid["sexShop"], row, gColumn["sexShopItem"], index, false, false )
			guiGridListSetItemText ( gGrid["sexShop"], row, gColumn["sexShopPrice"], sexShopItemPrices[key].." $", false, false )
		end
		
		addEventHandler ( "onClientGUIClick", gButton["sexShopBuy"],
			function ()
				local row, column = guiGridListGetSelectedItem ( gGrid["sexShop"] )
				local item = guiGridListGetItemText ( gGrid["sexShop"], row, gColumn["sexShopItem"] )
				if item then
					for key, index in pairs ( sexShopItems ) do
						if sexShopItems[key] == item then
							item = key
							hideSexShopGUI ()
							triggerServerEvent ( "xxxShopBuy", lp, item )
							break
						end
					end
				end
			end,
		false )
		addEventHandler ( "onClientGUIClick", gButton["sexShopClose"], hideSexShopGUI, false )
	end
end
addEventHandler ( "onClientMarkerHit", xxxShopMarker, xxxShopMarker_hit )

function hideSexShopGUI ()

	destroyElement ( gWindow["sexShop"] )
	showCursor ( false )
	setElementClicked ( false )
end