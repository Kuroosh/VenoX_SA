-------------------------
------- (c) 2010 --------
------- by Zipper -------
-- and Vio MTA:RL Crew --
-------------------------

function showItemGiveList()

	if gWindow["itemsGive"] then
		guiSetVisible ( gWindow["itemsGive"], true )
	else
		gWindow["itemsGive"] = guiCreateWindow(screenwidth/2-174/2,145,174,300,"Item geben",false)
		guiSetAlpha(gWindow["itemsGive"],1)
		guiWindowSetMovable(gWindow["itemsGive"],false)
		guiWindowSetSizable(gWindow["itemsGive"],false)
		gGrid["itemsGive"] = guiCreateGridList(0.0517,0.1238,0.8908,0.4851,true,gWindow["itemsGive"])
		guiGridListSetSelectionMode(gGrid["itemsGive"],0)
		gColumn["itemGiveName"] = guiGridListAddColumn(gGrid["itemsGive"],"Item",0.55)
		gColumn["itemGiveCount"] = guiGridListAddColumn(gGrid["itemsGive"],"Anzahl",0.25)
		guiSetAlpha(gGrid["itemsGive"],1)
		gLabel["itemGiveInfo"] = guiCreateLabel(0.069,0.6238,0.431,0.1535,"        An\n",true,gWindow["itemsGive"])
		guiSetAlpha(gLabel["itemGiveInfo"],1)
		guiLabelSetColor(gLabel["itemGiveInfo"],200,200,000)
		guiLabelSetVerticalAlign(gLabel["itemGiveInfo"],"top")
		guiLabelSetHorizontalAlign(gLabel["itemGiveInfo"],"left",false)
		guiSetFont(gLabel["itemGiveInfo"],"default-bold-small")
		
		gEdit["itemGiveAmount"] = guiCreateEdit(0.069+0.431+0.1,0.65,0.431,0.10,"",true,gWindow["itemsGive"])
		guiSetAlpha(gEdit["itemGiveAmount"],1)
		
		gButton["itemGive"] = guiCreateButton(0.0575,0.7822,0.431,0.1683,"Geben",true,gWindow["itemsGive"])
		guiSetAlpha(gButton["itemGive"],1)
		gButton["itemGiveClose"] = guiCreateButton(0.5172,0.7822,0.431,0.1683,"Schliessen",true,gWindow["itemsGive"])
		guiSetAlpha(gButton["itemGiveClose"],1)
		
		addEventHandler("onClientGUIClick", gButton["itemGiveClose"],
			function ()
				hideItemGiveList()
			end,
		false )
		addEventHandler("onClientGUIClick", gButton["itemGive"],
			function ( btn, state )
				rowindex, columnindex = guiGridListGetSelectedItem ( gGrid["itemsGive"] )
				selectedText = guiGridListGetItemText ( gGrid["itemsGive"], rowindex, gColumn["itemGiveName"] )
				if selectedText == "Geld" then
					triggerServerEvent ( "geldgeben", lp, guiGetText ( gEdit["itemGiveAmount"] ) )
				elseif guiGetVisible ( gWindow["itemsGive"] ) then
					hideItemGiveList()
					if itemCommand[selectedText] then
						if itemCommand[selectedText] == "eat" then
							for i = 1, 3 do
								if foodName[vnxClientGetElementData ( "food"..i )] == selectedText then
									triggerServerEvent ( "giveitem", lp, vnxClientGetElementData ( "curclicked" ), itemCommand[selectedText], i )
									break
								end
							end
						else
							triggerServerEvent ( "giveitem", lp, vnxClientGetElementData ( "curclicked" ), itemCommand[selectedText], nil, tonumber ( guiGetText ( gEdit["itemGiveAmount"] ) ) )
						end
					elseif placeAbleObjects[selectedText] then
						triggerServerEvent ( "giveitem", lp, vnxClientGetElementData ( "curclicked" ), "object" )
					end
				end
			end,
		false )
	end
	local name = vnxClientGetElementData ( "curclicked" )
	if isElement ( getPlayerFromName ( name ) ) then
		guiSetText ( gLabel["itemGiveInfo"], "        An\n"..name )
		local grid = gGrid["itemsGive"]
		local columnName = gColumn["itemGiveName"]
		local columnCount = gColumn["itemGiveCount"]
		fillWithItems ( grid, columnName, columnCount )
		local row = guiGridListAddRow ( grid )
		guiGridListSetItemText ( grid, row, columnName, "Sonstiges", true, false )
		local row = guiGridListAddRow ( grid )
		guiGridListSetItemText ( grid, row, columnName, "Geld", false, false )
		guiGridListSetItemText ( grid, row, columnCount, mymoney.."$", false, false )
	else
		hideItemGiveList()
		outputChatBox ( "Der Spieler ist offline!", 125, 0, 0 )
	end
end

function hideItemGiveList()

	hideAllPlayerClickWindows ()
end