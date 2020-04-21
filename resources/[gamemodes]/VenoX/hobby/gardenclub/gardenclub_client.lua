-------------------------
------- (c) 2010 --------
------- by Zipper -------
-- and Vio MTA:RL Crew --
-------------------------

function showGardenCenterMenue_func ()

	if gWindow["gardenclub"] then
		if isElement ( gWindow["gardenclub"] ) then
			destroyElement ( gWindow["gardenclub"] )
		end
	end
	showCursor ( true )
	setElementClicked ( true )
	
	gWindow["gardenclub"] = guiCreateWindow(screenwidth/2-464/2,screenheight/2-238/2,464,238,"Gartenclub \"The Uphill Gardner\"",false)
	gLabel[1] = guiCreateLabel(307,25,151,167,"Herzlich Willkommen beim\nGartenclub! Hier kannst du\nalles rund um den Garten\nkaufen - von Blumen-\nsamen ueber Werkzeuge\nbis zu Zierobjekten.\n\n\nDie Kosten fuer eine\nMitgliedschaft betragen\neinmal 200 $ sowie\n30 $ / Stunde",false,gWindow["gardenclub"])
	guiLabelSetColor(gLabel[1],200,200,0)
	guiLabelSetVerticalAlign(gLabel[1],"top")
	guiLabelSetHorizontalAlign(gLabel[1],"left",false)
	guiSetFont(gLabel[1],"default-bold-small")
	gLabel[2] = guiCreateLabel(98,198,96,17,"Gramm Drogen",false,gWindow["gardenclub"])
	guiLabelSetColor(gLabel[2],255,255,255)
	guiLabelSetVerticalAlign(gLabel[2],"top")
	guiLabelSetHorizontalAlign(gLabel[2],"left",false)
	guiSetFont(gLabel[2],"default-bold-small")
	
	gGrid["gardenclub"] = guiCreateGridList(9,26,195,158,false,gWindow["gardenclub"])
	guiGridListSetSelectionMode(gGrid["gardenclub"],0)
	
	gColumn["gardenclubObject"] = guiGridListAddColumn(gGrid["gardenclub"],"Objekt",0.55)
	gColumn["gardenclubPrice"] = guiGridListAddColumn(gGrid["gardenclub"],"Preis",0.25)
	
	gButton["gardenclubBuy"] = guiCreateButton(214,26+53,83,44,"Kaufen",false,gWindow["gardenclub"])
	gButton["gardenclubClose"] = guiCreateButton(214,26+53*2,81,44,"Fenster schliessen",false,gWindow["gardenclub"])
	gButton["gardenclubSell"] = guiCreateButton(214,26+53*3,81,44,"Verkaufen",false,gWindow["gardenclub"])
	
	if vnxClientGetElementData ( "club" ) == "gartenverein" then
		gButton["joinLeaveGardenclub"] = guiCreateButton(214,26,83,44,"Mitglied werden",false,gWindow["gardenclub"])
	else
		gButton["joinLeaveGardenclub"] = guiCreateButton(214,26,83,44,"Club verlassen",false,gWindow["gardenclub"])
	end
	
	addEventHandler ( "onClientGUIClick", gButton["joinLeaveGardenclub"],
		function ()
			if guiGetText ( gButton["joinLeaveGardenclub"] ) == "Mitglied werden" then
				guiSetText ( gButton["joinLeaveGardenclub"], "Club verlassen" )
				triggerServerEvent ( "joinGartenverein", lp )
			else
				guiSetText ( gButton["joinLeaveGardenclub"], "Mitglied werden" )
				triggerServerEvent ( "leaveGardenclub", lp )
			end
		end,
	false )
	
	addEventHandler ( "onClientGUIClick", gButton["gardenclubClose"],
		function ()
			showCursor ( false )
			setElementClicked ( false )
			destroyElement ( gWindow["gardenclub"] )
		end,
	false )
	
	addEventHandler ( "onClientGUIClick", gButton["gardenclubSell"],
		function ()
			triggerServerEvent ( "drugsSellHobby", lp, tonumber ( guiGetText ( gNumberField["drugCount"] ) ) )
			guiSetText ( gNumberField["drugCount"], 0 )
		end,
	false )
	
	addEventHandler ( "onClientGUIClick", gButton["gardenclubBuy"],
		function ()
			local row, column = guiGridListGetSelectedItem ( gGrid["gardenclub"] )
			local value = guiGridListGetItemText ( gGrid["gardenclub"], row, gColumn["gardenclubObject"] )
			
			if value == "Rasenmaeher" then
				triggerServerEvent ( "BuyMowerServer", lp )
				closeGardenClubWindow ()
			elseif value == "Schaufel" then
				triggerServerEvent ( "BuyShovelServer", lp )
			elseif value == "Hansamen" then
				triggerServerEvent ( "BuyFlowersServer", lp )
			else
				local id = 0
				
				for key, index in pairs ( placeAblesToBeSaved ) do
					if index == value then
						id = key
						break
					end
				end
				
				triggerServerEvent ( "buyGardenClubObject", lp, id )
			end
		end,
	false )
	
	local row = guiGridListAddRow ( gGrid["gardenclub"] )
	guiGridListSetItemText ( gGrid["gardenclub"], row, gColumn["gardenclubObject"], "Rasenmaeher", false, false )
	guiGridListSetItemText ( gGrid["gardenclub"], row, gColumn["gardenclubPrice"], "600 $", false, false )
	local row = guiGridListAddRow ( gGrid["gardenclub"] )
	guiGridListSetItemText ( gGrid["gardenclub"], row, gColumn["gardenclubObject"], "Schaufel", false, false )
	guiGridListSetItemText ( gGrid["gardenclub"], row, gColumn["gardenclubPrice"], "15 $", false, false )
	local row = guiGridListAddRow ( gGrid["gardenclub"] )
	guiGridListSetItemText ( gGrid["gardenclub"], row, gColumn["gardenclubObject"], "Hansamen", false, false )
	guiGridListSetItemText ( gGrid["gardenclub"], row, gColumn["gardenclubPrice"], "500 $", false, false )
	
	for key, index in pairs ( placeAblesToBeSaved ) do
		local row = guiGridListAddRow ( gGrid["gardenclub"] )
		guiGridListSetItemText ( gGrid["gardenclub"], row, gColumn["gardenclubObject"], index, false, false )
		guiGridListSetItemText ( gGrid["gardenclub"], row, gColumn["gardenclubPrice"], placeAblesPrices[key].." $", false, false )
	end
	
	gNumberField["drugCount"] = guiCreateNumberField ( 10, 191, 86, 35, 0, false, gWindow["gardenclub"], true, true )
end
addEvent ( "showGardenCenterMenue", true )
addEventHandler ( "showGardenCenterMenue", getRootElement(), showGardenCenterMenue_func )

function closeGardenClubWindow ()

	showCursor ( false )
	setElementClicked ( false )
	destroyElement ( gWindow["gardenclub"] )
end

gartenvereinPickup = createPickup ( -2579.8989257813, 310.11599731445, 4.87415599823, 3, 1239, 50, 0 )

function gartenvereinPickup_hit ( hit )

	if hit == lp then
		showGardenCenterMenue_func ()
	end
end
addEventHandler ( "onClientPickupHit", gartenvereinPickup, gartenvereinPickup_hit )