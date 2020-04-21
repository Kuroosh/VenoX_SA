--addCommandHandler("wc", function() changeView("main") end)
guiSetInputMode("no_binds_when_editing")

addEvent ("showPDComputer", true )

function ShowPoliceComputerGui_func ()
	setElementClicked ( true )
	changeView("main")
end
addEventHandler("showPDComputer", getLocalPlayer (), ShowPoliceComputerGui_func )


local w, h = guiGetScreenSize()
-- setElementData(getLocalPlayer(), "rank", 100)
-- setElementData(getLocalPlayer(), "wanteds", getPlayerWantedLevel())
-- if not getElementData(getLocalPlayer(), "stvo") then
	-- setElementData(getLocalPlayer(), "stvo", 0)
-- end



wc = {
	main = {},
    av = {
        tab = {},
        tabpanel = {},
        main = {},
        button = {},
        gridlist = {},
        label = {},
        edit = {}
    },
	pa = {
        main = {},
        label = {},
        button = {},
        gridlist = {},
        edit = {},
        memo = {}
    },
	ua = {
        tab = {},
        label = {},
        buttonsSWAT = {},
        buttonsFBI = {},
        tabpanel = {},
        button = {},
        gridlist = {},
        buttonsLAPD = {},
        main = {},
        buttonsARMY = {}
    }
}


wc.main[1] = guiCreateStaticImage(w/2-(870/2),h/2-(590/2), 870, 590, "fraktionen/wantedpc/1.jpg", false)
guiSetVisible(wc.main[1], false)
wc.main.aktuelleVerbrechen = guiCreateLabel(110, 242, 411, 36, "", false, wc.main[1])
wc.main.polizeiakten = guiCreateLabel(110, 292, 411, 36, "", false, wc.main[1])
wc.main.polizeiunterstuezung = guiCreateLabel(110, 343, 411, 36, "", false, wc.main[1])
wc.main.close = guiCreateLabel(96, 540, 47, 23, "X", false, wc.main[1])
guiSetFont(wc.main.close, "default-bold-small")
guiLabelSetHorizontalAlign(wc.main.close, "center", false)
guiLabelSetVerticalAlign(wc.main.close, "center")



wc.av.main[1] = guiCreateStaticImage(w/2-(870/2), h/2-(590/2), 870, 590, "fraktionen/wantedpc/2.jpg", false)
guiSetVisible(wc.av.main[1], false)
wc.av.gridlist["main"] = guiCreateGridList(75, 128, 194, 314, false, wc.av.main[1])
guiSetProperty(wc.av.gridlist["main"], "ColumnsSizable", "False")
guiGridListAddColumn(wc.av.gridlist["main"], "Spieler", 0.6)
guiGridListAddColumn(wc.av.gridlist["main"], "W", 0.1)
guiGridListAddColumn(wc.av.gridlist["main"], "S", 0.1)
wc.av.edit.search = guiCreateEdit(123, 452, 116, 30, "", false, wc.av.main[1])
wc.av.label[1] = guiCreateLabel(77, 456, 46, 16, "Suchen:", false, wc.av.main[1])
guiSetFont(wc.av.label[1], "default-bold-small")
wc.av.button.refresh = guiCreateButton(239, 452, 30, 30, "®", false, wc.av.main[1])
guiSetProperty(wc.av.button.refresh, "NormalTextColour", "FFAAAAAA")
wc.av.button.addwanteds = guiCreateButton(372, 128, 169, 44, "Wanted(s) geben", false, wc.av.main[1])
guiSetFont(wc.av.button.addwanteds, "default-bold-small")
guiSetProperty(wc.av.button.addwanteds, "NormalTextColour", "FFAAAAAA")
wc.av.button.delwanteds = guiCreateButton(372, 182, 169, 44, "Wanted(s) löschen", false, wc.av.main[1])
guiSetFont(wc.av.button.delwanteds, "default-bold-small")
guiSetProperty(wc.av.button.delwanteds, "NormalTextColour", "FFAAAAAA")
wc.av.button.locate = guiCreateButton(279, 236, 262, 44, "Orten", false, wc.av.main[1])
guiSetFont(wc.av.button.locate, "default-bold-small")
guiSetProperty(wc.av.button.locate, "NormalTextColour", "FFAAAAAA")
wc.av.button.addstvo = guiCreateButton(372, 290, 169, 44, "StVO-Punkt(e) geben", false, wc.av.main[1])
guiSetFont(wc.av.button.addstvo, "default-bold-small")
guiSetProperty(wc.av.button.addstvo, "NormalTextColour", "FFAAAAAA")
wc.av.button.delstvo = guiCreateButton(372, 344, 169, 44, "StVO-Punkt(e) löschen", false, wc.av.main[1])
guiSetFont(wc.av.button.delstvo, "default-bold-small")
guiSetProperty(wc.av.button.delstvo, "NormalTextColour", "FFAAAAAA")
wc.av.button.executecode = guiCreateButton(551, 398, 258, 30, "Ausgewählten Code ausführen", false, wc.av.main[1])
guiSetFont(wc.av.button.executecode, "default-bold-small")
guiSetProperty(wc.av.button.executecode, "NormalTextColour", "FFAAAAAA")
guiSetVisible(wc.av.button.executecode, false)
wc.av.edit.reason = guiCreateEdit(372, 398, 169, 30, "", false, wc.av.main[1])
wc.av.edit.addwanteds = guiCreateEdit(279, 128, 83, 44, "", false, wc.av.main[1])
guiSetEnabled(wc.av.button.addwanteds, false)
wc.av.edit.delwanteds = guiCreateEdit(279, 182, 83, 44, "", false, wc.av.main[1])
guiSetEnabled(wc.av.button.delwanteds, false)
wc.av.edit.addstvo = guiCreateEdit(279, 290, 83, 44, "", false, wc.av.main[1])
guiSetEnabled(wc.av.button.addstvo, false)
wc.av.edit.delstvo = guiCreateEdit(279, 344, 83, 44, "", false, wc.av.main[1])
guiSetEnabled(wc.av.button.delstvo, false)
wc.av.label[1] = guiCreateLabel(322, 408, 40, 15, "Grund:", false, wc.av.main[1])
guiSetFont(wc.av.label[1], "default-bold-small")
wc.av.tabpanel[1] = guiCreateTabPanel(551, 128, 258, 260, false, wc.av.main[1])

wc.av.tab.wanteds = guiCreateTab("Wantedkatalog", wc.av.tabpanel[1])

wc.av.gridlist["wanteds"] = guiCreateGridList(10, 10, 238, 216, false, wc.av.tab.wanteds)
guiGridListAddColumn(wc.av.gridlist["wanteds"], "Grund", 0.75)
guiGridListAddColumn(wc.av.gridlist["wanteds"], "W", 0.1)
guiSetProperty(wc.av.gridlist["wanteds"], "ColumnsSizable", "false")
guiSetProperty(wc.av.gridlist["wanteds"], "ColumnsMovable", "false")

wc.av.tab.stvo = guiCreateTab("StVO-Katalog", wc.av.tabpanel[1])

wc.av.gridlist["stvo"] = guiCreateGridList(10, 10, 238, 216, false, wc.av.tab.stvo)
guiGridListAddColumn(wc.av.gridlist["stvo"], "Grund", 0.75)
guiGridListAddColumn(wc.av.gridlist["stvo"], "P", 0.1)
guiSetProperty(wc.av.gridlist["stvo"], "ColumnsSizable", "false")
guiSetProperty(wc.av.gridlist["stvo"], "ColumnsMovable", "false")

wc.av.label.back = guiCreateLabel(160, 540, 47, 23, "<-", false, wc.av.main[1])
guiSetFont(wc.av.label.back, "default-bold-small")
guiLabelSetHorizontalAlign(wc.av.label.back, "center", false)
guiLabelSetVerticalAlign(wc.av.label.back, "center")

wc.av.label.close = guiCreateLabel(96, 540, 47, 23, "X", false, wc.av.main[1])
guiSetFont(wc.av.label.close, "default-bold-small")
guiLabelSetHorizontalAlign(wc.av.label.close, "center", false)
guiLabelSetVerticalAlign(wc.av.label.close, "center")

wc.main.windoof= guiCreateLabel(160, 532, 289, 33, "", false, wc.main[1])  
addEventHandler ( "onClientGUIClick", wc.main.windoof, function (button, state) 
	if button == "left" and source == wc.main.windoof then
		windoof()
	end
end, false )

wc.av.label.windoof= guiCreateLabel(221, 532, 231, 33, "", false, wc.av.main[1])  
addEventHandler ( "onClientGUIClick", wc.av.label.windoof, function (button, state) 
	if button == "left" and source == wc.av.label.windoof then
		windoof()
	end
end, false )

function changeView(view)
	if view == "main" then
		guiSetVisible(wc.main[1], true)
		guiSetVisible(wc.av.main[1], false)
		guiSetVisible(wc.pa.main[1], false)
		guiSetVisible(wc.ua.main[1], false)
		showCursor(true)
	elseif view == "av" then
		guiSetVisible(wc.main[1], false)
		guiSetVisible(wc.av.main[1], true)
		guiSetVisible(wc.pa.main[1], false)
		guiSetVisible(wc.ua.main[1], false)
		showCursor(true)
		refreshAllListValues()
	elseif view == "pa" then
		guiSetVisible(wc.main[1], false)
		guiSetVisible(wc.av.main[1], false)
		guiSetVisible(wc.ua.main[1], false)
		guiSetVisible(wc.pa.main[1], true)
		showCursor(true)
		refreshFileList()
	elseif view == "ua" then
		guiSetVisible(wc.main[1], false)
		guiSetVisible(wc.av.main[1], false)
		guiSetVisible(wc.pa.main[1], false)
		guiSetVisible(wc.ua.main[1], true)
		showCursor(true)
		refreshFileList()
	elseif view == "close" then
		guiSetVisible(wc.main[1], false)
		guiSetVisible(wc.av.main[1], false)
		guiSetVisible(wc.pa.main[1], false)
		guiSetVisible(wc.ua.main[1], false)
		showCursor(false)
		toggleAllControls (true)
        setElementClicked ( false )
	end
end

--click on wc.main.close
addEventHandler ( "onClientGUIClick", wc.main.close, function (button, state) 
	if button == "left" and source == wc.main.close then
		changeView("close")
	end
end, false )

--click on wc.pa.label.back
addEventHandler ( "onClientGUIClick", wc.av.label.back, function (button, state) 
	if button == "left" and source == wc.av.label.back then
		changeView("main")
	end
end, false )

--click on wc.pa.label.close
addEventHandler ( "onClientGUIClick", wc.av.label.close, function (button, state) 
	if button == "left" and source == wc.av.label.close then
		changeView("close")
	end
end, false )

--click on wc.main.aktuelleVerbrechen
addEventHandler ( "onClientGUIClick", wc.main.aktuelleVerbrechen, function (button, state) 
	if button == "left" and source == wc.main.aktuelleVerbrechen then
		changeView("av")
	end
end, false )

--click on wc.main.polizeiakten
addEventHandler ( "onClientGUIClick", wc.main.polizeiakten, function (button, state) 
	if button == "left" and source == wc.main.polizeiakten then
		changeView("pa")
	end
end, false )


--click on wc.main.polizeiunterstuezung
addEventHandler ( "onClientGUIClick", wc.main.polizeiunterstuezung, function (button, state) 
	if button == "left" and source == wc.main.polizeiunterstuezung then
		changeView("ua")
	end
end, false )


function refreshAllListValues(filter)
	guiGridListClear(wc.av.gridlist["main"])
	
	if filter then
		for k, v in ipairs(getElementsByType("player")) do
			if string.find(string.lower(getPlayerName(v)), string.lower(filter), 1, true) then
				--outputDebugString("wurde gefunden")
				local row = guiGridListAddRow(wc.av.gridlist["main"])
				guiGridListSetItemText(wc.av.gridlist["main"], row, 1, getPlayerName(v), false, false)
				guiGridListSetItemText(wc.av.gridlist["main"], row, 2, getElementData(v, "wanteds"), false, false)
				guiGridListSetItemText(wc.av.gridlist["main"], row, 3, getElementData(v, "stvo_punkte"), false, false)
			end
		end
	else
		for k, v in ipairs(getElementsByType("player")) do
			local row = guiGridListAddRow(wc.av.gridlist["main"])
			guiGridListSetItemText(wc.av.gridlist["main"], row, 1, getPlayerName(v), false, false)
			guiGridListSetItemText(wc.av.gridlist["main"], row, 2, getElementData(v, "wanteds"), false, false)
			guiGridListSetItemText(wc.av.gridlist["main"], row, 3, getElementData(v, "stvo_punkte"), false, false)
		end
	end
end


function updateCatalogFunc( array )	
	guiGridListClear ( wc.av.gridlist["wanteds"] )
    guiGridListClear ( wc.av.gridlist["stvo"] )
	for typ, array2 in pairs ( array ) do
		local ntyp = typ == "wanted" and "wanteds" or typ
		if array2[1] then
			for i=1, #array2 do
				local row = guiGridListAddRow ( wc.av.gridlist[ntyp] )
				guiGridListSetItemText ( wc.av.gridlist[ntyp], row, 1, array2[i].name, false, false )
				guiGridListSetItemText ( wc.av.gridlist[ntyp], row, 2 , array2[i].amount, false, false )
			end
		end
	end
end
addEvent ( "updateCatalog", true )
addEventHandler ( "updateCatalog", getRootElement(), updateCatalogFunc )


function clearSearch()
	guiSetText(wc.av.edit.search, "")
	refreshAllListValues()
end

function requestPlayerValueChange(typ, player, value, executor, reason)
	triggerServerEvent("changePlayerValue", getRootElement(), typ, player, value, executor, reason)
end

--click on wc.av.button.addwanteds button
addEventHandler ( "onClientGUIClick", wc.av.button.addwanteds, function (button, state) 
	if button == "left" and source == wc.av.button.addwanteds then
		if curPlayer[1]["row"] then
			requestPlayerValueChange("wanteds", guiGridListGetItemText(wc.av.gridlist["main"], curPlayer[1]["row"], 1), guiGetText(wc.av.edit.addwanteds), getLocalPlayer(), guiGetText(wc.av.edit.reason))
		end
	end
end, false )

--click on wc.av.button.delwanteds button
addEventHandler ( "onClientGUIClick", wc.av.button.delwanteds, function (button, state) 
	if button == "left" and source == wc.av.button.delwanteds then
		if curPlayer[1]["row"] then
			requestPlayerValueChange("wanteds", guiGridListGetItemText(wc.av.gridlist["main"], curPlayer[1]["row"], 1), -guiGetText(wc.av.edit.delwanteds), getLocalPlayer(), guiGetText(wc.av.edit.reason))
		end
	end
end, false )

--click on wc.av.button.addstvo button
addEventHandler ( "onClientGUIClick", wc.av.button.addstvo, function (button, state) 
	if button == "left" and source == wc.av.button.addstvo then
		if curPlayer[1]["row"] then
			requestPlayerValueChange("stvo", guiGridListGetItemText(wc.av.gridlist["main"], curPlayer[1]["row"], 1), guiGetText(wc.av.edit.addstvo), getLocalPlayer(), guiGetText(wc.av.edit.reason))
		end
	end
end, false )

--click on wc.av.button.delstvo button
addEventHandler ( "onClientGUIClick", wc.av.button.delstvo, function (button, state) 
	if button == "left" and source == wc.av.button.delstvo then
		if curPlayer[1]["row"] then
			requestPlayerValueChange("stvo", guiGridListGetItemText(wc.av.gridlist["main"], curPlayer[1]["row"], 1), -guiGetText(wc.av.edit.delstvo), getLocalPlayer(), guiGetText(wc.av.edit.reason))
		end
	end
end, false )


curPlayer = {}
--click on wc.av.gridlist["main"] gridlist
addEventHandler ( "onClientGUIClick", wc.av.gridlist["main"], function (button, state) 
	if button == "left" and source == wc.av.gridlist["main"] then
		curPlayer = guiGridListGetSelectedItems(wc.av.gridlist["main"])
	end
end, false )

--click on wc.av.gridlist["wanteds"] gridlist
addEventHandler ( "onClientGUIClick", wc.av.gridlist["wanteds"], function (button, state) 
	if button == "left" and source == wc.av.gridlist["wanteds"] then
		local curSelection = guiGridListGetSelectedItems(wc.av.gridlist["wanteds"])
		if curSelection[1]["row"] then
			guiSetText(wc.av.edit.addwanteds, guiGridListGetItemText(wc.av.gridlist["wanteds"], curSelection[1]["row"], 2))
			guiSetText(wc.av.edit.reason, guiGridListGetItemText(wc.av.gridlist["wanteds"], curSelection[1]["row"], 1))
		end
	end
end, false )

--click on wc.av.gridlist["stvo"] gridlist
addEventHandler ( "onClientGUIClick", wc.av.gridlist["stvo"], function (button, state) 
	if button == "left" and source == wc.av.gridlist["stvo"] then
		local curSelection = guiGridListGetSelectedItems(wc.av.gridlist["stvo"])
		if curSelection[1]["row"] then
			guiSetText(wc.av.edit.addstvo, guiGridListGetItemText(wc.av.gridlist["stvo"], curSelection[1]["row"], 2))
			guiSetText(wc.av.edit.reason, guiGridListGetItemText(wc.av.gridlist["stvo"], curSelection[1]["row"], 1))
		end
	end
end, false )


--click on wc.av.tabpanel[1] tabpanel
addEventHandler ( "onClientGUIClick", wc.av.tabpanel[1], function (button, state) 
	if button == "left" and source == wc.av.tabpanel[1] then
		if guiGetSelectedTab(wc.av.tabpanel[1]) == wc.av.tab.codes then
			guiSetVisible(wc.av.button.executecode, true)
		else
			guiSetVisible(wc.av.button.executecode, false)
		end
	end
end, false )



addEvent("refreshClientWantedList", true)
function refreshClientWantedListFunc()
	refreshAllListValues(guiGetText(wc.av.edit.search))
	curPlayer = guiGridListGetSelectedItems(wc.av.gridlist["main"])
end
addEventHandler("refreshClientWantedList", getLocalPlayer(), refreshClientWantedListFunc)


--click on refresh button
addEventHandler ( "onClientGUIClick", wc.av.button.refresh, function (button, state) 
	if button == "left" and source == wc.av.button.refresh then
		clearSearch()
	end
end, false )

--filter changed
addEventHandler("onClientGUIChanged", wc.av.edit.search, function() 
   refreshAllListValues(guiGetText(wc.av.edit.search))
end)

--wc.av.edit.addwanteds value changed
addEventHandler("onClientGUIChanged", wc.av.edit.addwanteds, function() 
   if tonumber(guiGetText(wc.av.edit.addwanteds)) then
	   if not(tonumber(guiGetText(wc.av.edit.addwanteds)) >= 1 and tonumber(guiGetText(wc.av.edit.addwanteds)) <= 6) then
			guiSetText(wc.av.edit.addwanteds, "")
			guiSetEnabled(wc.av.button.addwanteds, false)
		else
			guiSetEnabled(wc.av.button.addwanteds, true)
		end
	else
		guiSetText(wc.av.edit.addwanteds, "")
		guiSetEnabled(wc.av.button.addwanteds, false)
	end
end)
--wc.av.edit.addwanteds  clicked
addEventHandler ( "onClientGUIClick", wc.av.edit.addwanteds, function (button, state) 
	if button == "left" and source == wc.av.edit.addwanteds then
		guiSetText(wc.av.edit.addwanteds, "")
	end
end, false )

--wc.av.edit.delwanteds value changed
addEventHandler("onClientGUIChanged", wc.av.edit.delwanteds, function() 
   if tonumber(guiGetText(wc.av.edit.delwanteds)) then
	   if not(tonumber(guiGetText(wc.av.edit.delwanteds)) >= 1 and tonumber(guiGetText(wc.av.edit.delwanteds)) <= 6) then
			guiSetText(wc.av.edit.delwanteds, "")
			guiSetEnabled(wc.av.button.delwanteds, false)
		else
			guiSetEnabled(wc.av.button.delwanteds, true)
		end
	else
		guiSetText(wc.av.edit.delwanteds, "")
		guiSetEnabled(wc.av.button.delwanteds, false)
	end
end)
--wc.av.edit.delwanteds  clicked
addEventHandler ( "onClientGUIClick", wc.av.edit.delwanteds, function (button, state) 
	if button == "left" and source == wc.av.edit.delwanteds then
		guiSetText(wc.av.edit.delwanteds, "")
	end
end, false )

--wc.av.edit.addstvo value changed
addEventHandler("onClientGUIChanged", wc.av.edit.addstvo, function() 
	if tonumber(guiGetText(wc.av.edit.addstvo)) then
	   if not(tonumber(guiGetText(wc.av.edit.addstvo)) >= 1 and tonumber(guiGetText(wc.av.edit.addstvo)) <= 15) then
			guiSetText(wc.av.edit.addstvo, "")
			guiSetEnabled(wc.av.button.addstvo, false)
		else
			guiSetEnabled(wc.av.button.addstvo, true)
		end
	else
		guiSetText(wc.av.edit.addstvo, "")
		guiSetEnabled(wc.av.button.addstvo, false)
	end
end)
--wc.av.edit.addstvo  clicked
addEventHandler ( "onClientGUIClick", wc.av.edit.addstvo, function (button, state) 
	if button == "left" and source == wc.av.edit.addstvo then
		guiSetText(wc.av.edit.addstvo, "")
	end
end, false )

--wc.av.edit.delstvo value changed
addEventHandler("onClientGUIChanged", wc.av.edit.delstvo, function() 
   if tonumber(guiGetText(wc.av.edit.delstvo)) then
	   if not(tonumber(guiGetText(wc.av.edit.delstvo)) >= 1 and tonumber(guiGetText(wc.av.edit.delstvo)) <= 15) then
			guiSetText(wc.av.edit.delstvo, "")
			guiSetEnabled(wc.av.button.delstvo, false)
		else
			guiSetEnabled(wc.av.button.delstvo, true)
		end
	else
		guiSetText(wc.av.edit.delstvo, "")
		guiSetEnabled(wc.av.button.delstvo, false)
	end
end)
--wc.av.edit.delstvo  clicked
addEventHandler ( "onClientGUIClick", wc.av.edit.delstvo, function (button, state) 
	if button == "left" and source == wc.av.edit.delstvo then
		guiSetText(wc.av.edit.delstvo, "")
	end
end, false )

--wc.av.button.locate  clicked
locateTimer = nil
locateBlip = nil
addEventHandler ( "onClientGUIClick", wc.av.button.locate, function (button, state) 
local target = getPlayerFromName(guiGridListGetItemText(wc.av.gridlist["main"], curPlayer[1]["row"], 1))
	if button == "left" and source == wc.av.button.locate then
		if getElementData ( target, "handystate" ) == "on" then
			if clientpermission.canLocate() then
				if curPlayer[1]["row"] then
					if isTimer(locateTimer) then
						killTimer(locateTimer)
						destroyElement(locateBlip)
					end
					locateBlip = createBlipAttachedTo(target)
					locateTimer = setTimer(destroyElement, 240000, 1, locateBlip)
				end
			end
		else 
		outputChatBox("Das Handy des Spielers ist ausgeschaltet!", 125, 0, 0 )
		end
		if tonumber ( getElementInterior ( target ) ) ~= 0 or tonumber ( getElementDimension ( target ) ) ~= 0 then
			outputChatBox ( "Der Buerger befindet sich in einem Gebaeude - Ortung nicht moeglich!", 125, 0, 0 )
			destroyElement(locateBlip)
		end
	end
end, false )


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


wc.pa.main[1] = guiCreateStaticImage(w/2-(870/2), h/2-(590/2), 870, 590, "fraktionen/wantedpc/2.jpg", false)
guiSetVisible(wc.pa.main[1], false)
wc.pa.gridlist["main"] = guiCreateGridList(75, 128, 132, 314, false, wc.pa.main[1])
guiGridListAddColumn(wc.pa.gridlist["main"], "Spieler", 0.8)
wc.pa.edit.search = guiCreateEdit(123, 452, 116, 30, "", false, wc.pa.main[1])
wc.pa.label[1] = guiCreateLabel(77, 456, 46, 16, "Suchen:", false, wc.pa.main[1])
guiSetFont(wc.pa.label[1], "default-bold-small")
wc.pa.button.refresh = guiCreateButton(239, 452, 30, 30, "®", false, wc.pa.main[1])
guiSetProperty(wc.pa.button.refresh, "NormalTextColour", "FFAAAAAA")
wc.pa.button.mode = guiCreateButton(633, 128, 169, 44, "Akte bearbeiten", false, wc.pa.main[1])
guiSetEnabled(wc.pa.button.mode, false)
guiSetFont(wc.pa.button.mode, "default-bold-small")
guiSetProperty(wc.pa.button.mode, "NormalTextColour", "FFAAAAAA")
wc.pa.button.clear = guiCreateButton(633, 182, 169, 44, "Akte leeren", false, wc.pa.main[1])
guiSetFont(wc.pa.button.clear, "default-bold-small")
guiSetProperty(wc.pa.button.clear, "NormalTextColour", "FFAAAAAA")
wc.pa.memo[1] = guiCreateMemo(216, 128, 407, 312, "", false, wc.pa.main[1])
guiMemoSetReadOnly(wc.pa.memo[1], true)
wc.pa.label[4] = guiCreateLabel(636, 231, 164, 27, "Die ausgewählte Akte wurde\nzuletzt bearbeitet von:", false, wc.pa.main[1])
guiSetFont(wc.pa.label[4], "default-bold-small")
guiLabelSetHorizontalAlign(wc.pa.label[4], "center", false)
wc.pa.label["from"] = guiCreateLabel(634, 265, 166, 15, "-", false, wc.pa.main[1])
guiSetFont(wc.pa.label["from"], "default-bold-small")
guiLabelSetHorizontalAlign(wc.pa.label["from"], "center", false)
wc.pa.label["date"] = guiCreateLabel(634, 315, 166, 15, "-", false, wc.pa.main[1])
guiSetFont(wc.pa.label["date"], "default-bold-small")
guiLabelSetHorizontalAlign(wc.pa.label["date"], "center", false)
wc.pa.label[9] = guiCreateLabel(634, 290, 167, 15, "Zuletzt bearbeitet am:", false, wc.pa.main[1])
guiSetFont(wc.pa.label[9], "default-bold-small")
guiLabelSetHorizontalAlign(wc.pa.label[9], "center", false)
wc.pa.label.back = guiCreateLabel(160, 540, 47, 23, "<-", false, wc.pa.main[1])
guiSetFont(wc.pa.label.back, "default-bold-small")
guiLabelSetHorizontalAlign(wc.pa.label.back, "center", false)
guiLabelSetVerticalAlign(wc.pa.label.back, "center")

wc.pa.label.close = guiCreateLabel(96, 540, 47, 23, "X", false, wc.pa.main[1])
guiSetFont(wc.pa.label.close, "default-bold-small")
guiLabelSetHorizontalAlign(wc.pa.label.close, "center", false)
guiLabelSetVerticalAlign(wc.pa.label.close, "center")

wc.pa.label.windoof= guiCreateLabel(221, 532, 231, 33, "", false, wc.pa.main[1])  
addEventHandler ( "onClientGUIClick", wc.pa.label.windoof, function (button, state) 
	if button == "left" and source == wc.pa.label.windoof then
		windoof()
	end
end, false )

--click on wc.pa.label.back
addEventHandler ( "onClientGUIClick", wc.pa.label.back, function (button, state) 
	if button == "left" and source == wc.pa.label.back then
		changeView("main")
	end
end, false )

--click on wc.pa.label.close
addEventHandler ( "onClientGUIClick", wc.pa.label.close, function (button, state) 
	if button == "left" and source == wc.pa.label.close then
		changeView("close")
	end
end, false )


-- function changeVisibility()
	-- guiSetVisible(wc.pa.main[1], not guiGetVisible(wc.pa.main[1]))
	-- showCursor(guiGetVisible(wc.pa.main[1]))
	-- refreshFileList()
-- end
-- addCommandHandler("pa", changeVisibility)

function refreshFileList(filter)
	guiGridListClear(wc.pa.gridlist["main"])
	
	if filter then
		for k, v in ipairs(getElementsByType("player")) do
			if string.find(string.lower(getPlayerName(v)), string.lower(filter), 1, true) then
				outputDebugString("wurde gefunden")
				local row = guiGridListAddRow(wc.pa.gridlist["main"])
				guiGridListSetItemText(wc.pa.gridlist["main"], row, 1, getPlayerName(v), false, false)
			end
		end
	else
		for k, v in ipairs(getElementsByType("player")) do
			local row = guiGridListAddRow(wc.pa.gridlist["main"])
			guiGridListSetItemText(wc.pa.gridlist["main"], row, 1, getPlayerName(v), false, false)
		end
	end
end

fileMode = "edit"
--click on refresh button
addEventHandler ( "onClientGUIClick", wc.pa.button.refresh, function (button, state) 
	if button == "left" and source == wc.pa.button.refresh then
		clearFileSearch()
	end
end, false )

--filter changed
addEventHandler("onClientGUIChanged", wc.pa.edit.search, function() 
	changeFileButtonMode("edit")
	refreshFileList(guiGetText(wc.pa.edit.search))
end)

function clearFileSearch()
	guiSetText(wc.pa.edit.search, "")
	refreshFileList()
end

--clicked on wc.pa.gridlist["main"]
addEventHandler ( "onClientGUIClick", wc.pa.gridlist["main"], function (button, state) 
	if button == "left" and source == wc.pa.gridlist["main"] then
		local curPlayerFile = guiGridListGetSelectedItems(wc.pa.gridlist["main"])
		changeFileButtonsEnabled(false)
		changeFileButtonMode("edit")
		if curPlayerFile[1]["row"] then
			triggerServerEvent("requestPlayerFileForClient", getLocalPlayer(), guiGridListGetItemText(wc.pa.gridlist["main"], curPlayerFile[1]["row"], 1))
			--outputDebugString("TESTTD")
			--changeFileButtonMode("new", guiGridListGetItemText(wc.pa.gridlist["main"], curPlayerFile[1]["row"], 1))
		end
	end
end, false )

curFileEdit = false
addEvent("updatePlayerFile", true)
function updatePlayerFileFunc(player, text, editor, date)
	if text then
		guiSetText(wc.pa.memo[1], text)
		guiSetText(wc.pa.label["from"], editor)
		guiSetText(wc.pa.label["date"], date)
		changeFileButtonMode("edit", player)
		changeFileButtonsEnabled(true)
		--outputDebugString(fileMode)
	else
		changeFileButtonMode("new", player)
	end
	curFileEdit = player
end
addEventHandler("updatePlayerFile", getLocalPlayer(), updatePlayerFileFunc)

function changeFileButtonMode(mode, player)
	if mode == "new" then
		guiSetText(wc.pa.memo[1], "(Es liegen keine polizeilichen Akten über den Spieler "..player.." vor. Du kannst allerdings eine neue Akte erstellen, indem du auf \"Akte erstellen\" klickst.)")
		fileMode = "new"
		guiSetText(wc.pa.button.mode, "Akte erstellen")
		guiMemoSetReadOnly(wc.pa.memo[1], true)
		guiSetText(wc.pa.label["from"], "-")
		guiSetText(wc.pa.label["date"], "-")
		changeFileButtonsEnabled(true)
	elseif mode == "edit" then
		fileMode = "edit"
		guiSetText(wc.pa.button.mode, "Akte bearbeiten")
			if not player then
				guiSetText(wc.pa.memo[1], "<-- Wähle einen Spieler aus der Liste aus.")
				guiMemoSetReadOnly(wc.pa.memo[1], true)
			else
				guiMemoSetReadOnly(wc.pa.memo[1], true)
			end
	elseif mode == "save" then
		fileMode = "save"
		guiSetText(wc.pa.button.mode, "Akte speichern")
		guiMemoSetReadOnly(wc.pa.memo[1], false)
	end
end
changeFileButtonMode("edit")

function changeFileButtonsEnabled(bool)
	guiSetEnabled(wc.pa.button.mode, bool)
	guiSetEnabled(wc.pa.button.clear, bool)
end

addEvent("fileRequestDone", true)
function fileRequestDoneFunc()
	triggerServerEvent("requestPlayerFileForClient", getLocalPlayer(), curFileEdit)
end
addEventHandler("fileRequestDone", getRootElement(),fileRequestDoneFunc)
--click on wc.pa.button.mode
addEventHandler ( "onClientGUIClick", wc.pa.button.mode, function (button, state) 
	if button == "left" and source == wc.pa.button.mode then
		if fileMode == "edit" then
			changeFileButtonMode("save")
		elseif fileMode == "save" then
			triggerServerEvent("requestFileSave", getLocalPlayer(), curFileEdit, guiGetText(wc.pa.memo[1]), getPlayerName(getLocalPlayer()))
			changeFileButtonMode("edit", curFileEdit)
		elseif fileMode == "new" then
			guiSetText(wc.pa.memo[1], "")
			changeFileButtonMode("save")
		end
	end
end, false )

--click on wc.pa.button.clear
addEventHandler ( "onClientGUIClick", wc.pa.button.clear, function (button, state) 
	if button == "left" and source == wc.pa.button.clear then
		if fileMode == "edit" or fileMode == "save" then
			triggerServerEvent("requestFileSave", getLocalPlayer(), curFileEdit, "", getPlayerName(getLocalPlayer()))
		end
	end
end, false )


clientpermission = {}
function clientpermission.canLocate()
	if tonumber(vnxClientGetElementData("rang")) >= 1 then
		return true
	else
		outputChatBox("Du benötigst Rang 1 um orten zu können!", 255, 0, 0)
		return false
	end
end


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------




wc.ua.main[1] = guiCreateStaticImage(w/2-(870/2),h/2-(590/2), 870, 590, "fraktionen/wantedpc/2.jpg", false)
guiSetVisible(wc.ua.main[1], false)

wc.ua.tabpanel[1] = guiCreateTabPanel(66, 124, 742, 312, false, wc.ua.main[1])

wc.ua.tab["LAPD"] = guiCreateTab("SFPD", wc.ua.tabpanel[1])

wc.ua.buttonsLAPD[1] = guiCreateButton(10, 10, 350, 60, "Unterstützung\nanfordern", false, wc.ua.tab["LAPD"])
guiSetFont(wc.ua.buttonsLAPD[1], "default-bold-small")
guiSetProperty(wc.ua.buttonsLAPD[1], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsLAPD[2] = guiCreateButton(10, 80, 350, 60, "Straßensperre\nanfordern", false, wc.ua.tab["LAPD"])
guiSetFont(wc.ua.buttonsLAPD[2], "default-bold-small")
guiSetProperty(wc.ua.buttonsLAPD[2], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsLAPD[3] = guiCreateButton(10, 150, 350, 60, "Helikopter\nanfordern", false, wc.ua.tab["LAPD"])
guiSetFont(wc.ua.buttonsLAPD[3], "default-bold-small")
guiSetProperty(wc.ua.buttonsLAPD[3], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsLAPD[4] = guiCreateButton(10, 218, 350, 60, "Detectivestreife\nanfordern", false, wc.ua.tab["LAPD"])
guiSetFont(wc.ua.buttonsLAPD[4], "default-bold-small")
guiSetProperty(wc.ua.buttonsLAPD[4], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsLAPD[5] = guiCreateButton(382, 10, 350, 60, "Gefangentransporter\nanfordern", false, wc.ua.tab["LAPD"])
guiSetFont(wc.ua.buttonsLAPD[5], "default-bold-small")
guiSetProperty(wc.ua.buttonsLAPD[5], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsLAPD[6] = guiCreateButton(382, 80, 350, 60, "FBI\nanfordern", false, wc.ua.tab["LAPD"])
guiSetFont(wc.ua.buttonsLAPD[6], "default-bold-small")
guiSetProperty(wc.ua.buttonsLAPD[6], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsLAPD[7] = guiCreateButton(382, 150, 350, 60, "US Army\nanfordern", false, wc.ua.tab["LAPD"])
guiSetFont(wc.ua.buttonsLAPD[7], "default-bold-small")
guiSetProperty(wc.ua.buttonsLAPD[7], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsLAPD[8] = guiCreateButton(382, 218, 350, 60, "SWAT\nanfordern", false, wc.ua.tab["LAPD"])
guiSetFont(wc.ua.buttonsLAPD[8], "default-bold-small")
guiSetProperty(wc.ua.buttonsLAPD[8], "NormalTextColour", "FFAAAAAA")

wc.ua.tab["FBI"] = guiCreateTab("FBI", wc.ua.tabpanel[1])

wc.ua.buttonsFBI[8] = guiCreateButton(382, 218, 350, 60, "SWAT\nanfordern", false, wc.ua.tab["FBI"])
guiSetFont(wc.ua.buttonsFBI[8], "default-bold-small")
guiSetProperty(wc.ua.buttonsFBI[8], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsFBI[7] = guiCreateButton(382, 150, 350, 60, "US Army\nanfordern", false, wc.ua.tab["FBI"])
guiSetFont(wc.ua.buttonsFBI[7], "default-bold-small")
guiSetProperty(wc.ua.buttonsFBI[7], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsFBI[6] = guiCreateButton(382, 80, 350, 60, "SFPD\nanfordern", false, wc.ua.tab["FBI"])
guiSetFont(wc.ua.buttonsFBI[6], "default-bold-small")
guiSetProperty(wc.ua.buttonsFBI[6], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsFBI[5] = guiCreateButton(382, 10, 350, 60, "Sniperunterstüzung\nanfordern", false, wc.ua.tab["FBI"])
guiSetFont(wc.ua.buttonsFBI[5], "default-bold-small")
guiSetProperty(wc.ua.buttonsFBI[5], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsFBI[1] = guiCreateButton(10, 10, 350, 60, "Unterstüzung\nanfordern", false, wc.ua.tab["FBI"])
guiSetFont(wc.ua.buttonsFBI[1], "default-bold-small")
guiSetProperty(wc.ua.buttonsFBI[1], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsFBI[2] = guiCreateButton(10, 80, 350, 60, "Wanzenfahrzeug\nanfordern", false, wc.ua.tab["FBI"])
guiSetFont(wc.ua.buttonsFBI[2], "default-bold-small")
guiSetProperty(wc.ua.buttonsFBI[2], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsFBI[3] = guiCreateButton(10, 150, 350, 60, "Helikopter\nanfordern", false, wc.ua.tab["FBI"])
guiSetFont(wc.ua.buttonsFBI[3], "default-bold-small")
guiSetProperty(wc.ua.buttonsFBI[3], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsFBI[4] = guiCreateButton(10, 218, 350, 60, "Razzia\nanfordern", false, wc.ua.tab["FBI"])
guiSetFont(wc.ua.buttonsFBI[4], "default-bold-small")
guiSetProperty(wc.ua.buttonsFBI[4], "NormalTextColour", "FFAAAAAA")

wc.ua.tab["ARMY"] = guiCreateTab("US Army", wc.ua.tabpanel[1])

wc.ua.buttonsARMY[1] = guiCreateButton(10, 10, 350, 60, "Unterstüzung\nanfordern", false, wc.ua.tab["ARMY"])
guiSetFont(wc.ua.buttonsARMY[1], "default-bold-small")
guiSetProperty(wc.ua.buttonsARMY[1], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsARMY[2] = guiCreateButton(10, 80, 350, 60, "Luftunterstüzung\nanfordern", false, wc.ua.tab["ARMY"])
guiSetFont(wc.ua.buttonsARMY[2], "default-bold-small")
guiSetProperty(wc.ua.buttonsARMY[2], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsARMY[3] = guiCreateButton(10, 150, 350, 60, "Helikopter\nanfordern", false, wc.ua.tab["ARMY"])
guiSetFont(wc.ua.buttonsARMY[3], "default-bold-small")
guiSetProperty(wc.ua.buttonsARMY[3], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsARMY[4] = guiCreateButton(10, 218, 350, 60, "Eskorte\nanfordern", false, wc.ua.tab["ARMY"])
guiSetFont(wc.ua.buttonsARMY[4], "default-bold-small")
guiSetProperty(wc.ua.buttonsARMY[4], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsARMY[5] = guiCreateButton(382, 10, 350, 60, "Panzerunterstüzung\nanfordern", false, wc.ua.tab["ARMY"])
guiSetFont(wc.ua.buttonsARMY[5], "default-bold-small")
guiSetProperty(wc.ua.buttonsARMY[5], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsARMY[6] = guiCreateButton(382, 80, 350, 60, "Polizei\nanfordern", false, wc.ua.tab["ARMY"])
guiSetFont(wc.ua.buttonsARMY[6], "default-bold-small")
guiSetProperty(wc.ua.buttonsARMY[6], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsARMY[7] = guiCreateButton(382, 150, 350, 60, "SEK\nanfordern", false, wc.ua.tab["ARMY"])
guiSetFont(wc.ua.buttonsARMY[7], "default-bold-small")
guiSetProperty(wc.ua.buttonsARMY[7], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsARMY[8] = guiCreateButton(382, 218, 350, 60, "Bundeswehr\nanfordern", false, wc.ua.tab["ARMY"])
guiSetFont(wc.ua.buttonsARMY[8], "default-bold-small")
guiSetProperty(wc.ua.buttonsARMY[8], "NormalTextColour", "FFAAAAAA")

wc.ua.tab["SWAT"] = guiCreateTab("SWAT", wc.ua.tabpanel[1])

wc.ua.buttonsSWAT[1] = guiCreateButton(10, 10, 350, 60, "Unterstüzung\nanfordern", false, wc.ua.tab["SWAT"])
guiSetFont(wc.ua.buttonsSWAT[1], "default-bold-small")
guiSetProperty(wc.ua.buttonsSWAT[1], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsSWAT[2] = guiCreateButton(10, 80, 350, 60, "Spezialeinsatz\nanfordern", false, wc.ua.tab["SWAT"])
guiSetFont(wc.ua.buttonsSWAT[2], "default-bold-small")
guiSetProperty(wc.ua.buttonsSWAT[2], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsSWAT[3] = guiCreateButton(10, 150, 350, 60, "Helikopter\nanfordern", false, wc.ua.tab["SWAT"])
guiSetFont(wc.ua.buttonsSWAT[3], "default-bold-small")
guiSetProperty(wc.ua.buttonsSWAT[3], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsSWAT[4] = guiCreateButton(10, 218, 350, 60, "Katastrophenschutz\nanfordern", false, wc.ua.tab["SWAT"])
guiSetFont(wc.ua.buttonsSWAT[4], "default-bold-small")
guiSetProperty(wc.ua.buttonsSWAT[4], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsSWAT[5] = guiCreateButton(382, 10, 350, 60, "Sniperunterstüzung\nanfordern", false, wc.ua.tab["SWAT"])
guiSetFont(wc.ua.buttonsSWAT[5], "default-bold-small")
guiSetProperty(wc.ua.buttonsSWAT[5], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsSWAT[6] = guiCreateButton(382, 80, 350, 60, "Polizei\nanfordern", false, wc.ua.tab["SWAT"])
guiSetFont(wc.ua.buttonsSWAT[6], "default-bold-small")
guiSetProperty(wc.ua.buttonsSWAT[6], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsSWAT[7] = guiCreateButton(382, 150, 350, 60, "SEK\nanfordern", false, wc.ua.tab["SWAT"])
guiSetFont(wc.ua.buttonsSWAT[7], "default-bold-small")
guiSetProperty(wc.ua.buttonsSWAT[7], "NormalTextColour", "FFAAAAAA")
wc.ua.buttonsSWAT[8] = guiCreateButton(382, 218, 350, 60, "Bundeswehr\nanfordern", false, wc.ua.tab["SWAT"])
guiSetFont(wc.ua.buttonsSWAT[8], "default-bold-small")
guiSetProperty(wc.ua.buttonsSWAT[8], "NormalTextColour", "FFAAAAAA")

wc.ua.tab["CODES"] = guiCreateTab("Codes", wc.ua.tabpanel[1])

wc.ua.gridlist[1] = guiCreateGridList(10, 10, 655, 268, false, wc.ua.tab["CODES"])
guiGridListAddColumn(wc.ua.gridlist[1], "Code", 0.1)
guiGridListAddColumn(wc.ua.gridlist[1], "Bedeutung", 0.8)

guiSetProperty(wc.ua.gridlist[1], "ColumnsSizable", "False")
wc.ua.button["submitCode"] = guiCreateButton(675, 10, 57, 268, "ausge-\nwähl-\nten\n\nCode\n\nausfüh-\nren", false, wc.ua.tab["CODES"])
guiSetFont(wc.ua.button["submitCode"], "default-bold-small")
guiSetProperty(wc.ua.button["submitCode"], "NormalTextColour", "FFFFFFFF")



wc.ua.label.back = guiCreateLabel(160, 540, 47, 23, "<-", false, wc.ua.main[1])
guiSetFont(wc.ua.label.back, "default-bold-small")
guiLabelSetHorizontalAlign(wc.ua.label.back, "center", false)
guiLabelSetVerticalAlign(wc.ua.label.back, "center")

wc.ua.label.close = guiCreateLabel(96, 540, 47, 23, "X", false, wc.ua.main[1])
guiSetFont(wc.ua.label.close, "default-bold-small")
guiLabelSetHorizontalAlign(wc.ua.label.close, "center", false)
guiLabelSetVerticalAlign(wc.ua.label.close, "center")


wc.ua.label.windoof= guiCreateLabel(221, 532, 231, 33, "", false, wc.ua.main[1])  
addEventHandler ( "onClientGUIClick", wc.ua.label.windoof, function (button, state) 
	if button == "left" and source == wc.ua.label.windoof then
		windoof()
	end
end, false )


--click on wc.pa.label.back
addEventHandler ( "onClientGUIClick", wc.ua.label.back, function (button, state) 
	if button == "left" and source == wc.ua.label.back then
		changeView("main")
	end
end, false )
--click on wc.ua.label.close
addEventHandler ( "onClientGUIClick", wc.ua.label.close, function (button, state) 
	if button == "left" and source == wc.ua.label.close then
		changeView("close")
	end
end, false )
triggerServerEvent("updateCodesForClient", getLocalPlayer())

buttonTexts = {}
buttonTexts.LAPD = {}
buttonTexts.FBI = {}
buttonTexts.ARMY = {}
buttonTexts.SWAT = {}

for k, v in pairs(wc.ua.buttonsLAPD) do
	buttonTexts.LAPD[k] = guiGetText(wc.ua.buttonsLAPD[k])
	addEventHandler ( "onClientGUIClick", wc.ua.buttonsLAPD[k], function (button, state) 
		if button == "left" and source == wc.ua.buttonsLAPD[k]  then
			triggerServerEvent("triggerMessageToServer", getLocalPlayer(), "(Polizei) "..buttonTexts.LAPD[k])
			local i = 180
			guiSetEnabled(wc.ua.buttonsLAPD[k], false)
			setTimer(guiSetEnabled, i*1000+1000, 1, wc.ua.buttonsLAPD[k], true)
			setTimer(function() i = i - 1 guiSetText(wc.ua.buttonsLAPD[k], buttonTexts.LAPD[k]) end, 1000*i+1000, 1)
			setTimer(function() i = i - 1 guiSetText(wc.ua.buttonsLAPD[k], i) end, 1000, i)
		end
	end, false )
end

for k, v in pairs(wc.ua.buttonsFBI) do
	buttonTexts.FBI[k] = guiGetText(wc.ua.buttonsFBI[k])
	addEventHandler ( "onClientGUIClick", wc.ua.buttonsFBI[k], function (button, state) 
		if button == "left" and source == wc.ua.buttonsFBI[k]  then
			triggerServerEvent("triggerMessageToServer", getLocalPlayer(), "(SEK) "..buttonTexts.FBI[k])
			local i = 180
			guiSetEnabled(wc.ua.buttonsFBI[k], false)
			setTimer(guiSetEnabled, i*1000+1000, 1, wc.ua.buttonsFBI[k], true)
			setTimer(function() i = i - 1 guiSetText(wc.ua.buttonsFBI[k], buttonTexts.FBI[k]) end, 1000*i+1000, 1)
			setTimer(function() i = i - 1 guiSetText(wc.ua.buttonsFBI[k], i) end, 1000, i)
		end
	end, false )
end

for k, v in pairs(wc.ua.buttonsARMY) do
	buttonTexts.ARMY[k] = guiGetText(wc.ua.buttonsARMY[k])
	addEventHandler ( "onClientGUIClick", wc.ua.buttonsARMY[k], function (button, state) 
		if button == "left" and source == wc.ua.buttonsARMY[k]  then
			triggerServerEvent("triggerMessageToServer", getLocalPlayer(), "(Bundeswehr) "..buttonTexts.ARMY[k])
			local i = 180
			guiSetEnabled(wc.ua.buttonsARMY[k], false)
			setTimer(guiSetEnabled, i*1000+1000, 1, wc.ua.buttonsARMY[k], true)
			setTimer(function() i = i - 1 guiSetText(wc.ua.buttonsARMY[k], buttonTexts.ARMY[k]) end, 1000*i+1000, 1)
			setTimer(function() i = i - 1 guiSetText(wc.ua.buttonsARMY[k], i) end, 1000, i)
		end
	end, false )
end

for k, v in pairs(wc.ua.buttonsSWAT) do
	buttonTexts.SWAT[k] = guiGetText(wc.ua.buttonsSWAT[k])
	addEventHandler ( "onClientGUIClick", wc.ua.buttonsSWAT[k], function (button, state) 
		if button == "left" and source == wc.ua.buttonsSWAT[k]  then
			triggerServerEvent("triggerMessageToServer", getLocalPlayer(), "(Bundeswehr) "..buttonTexts.SWAT[k])
			local i = 180
			guiSetEnabled(wc.ua.buttonsSWAT[k], false)
			setTimer(guiSetEnabled, i*1000+1000, 1, wc.ua.buttonsSWAT[k], true)
			setTimer(function() i = i - 1 guiSetText(wc.ua.buttonsSWAT[k], buttonTexts.SWAT[k]) end, 1000*i+1000, 1)
			setTimer(function() i = i - 1 guiSetText(wc.ua.buttonsSWAT[k], i) end, 1000, i)
		end
	end, false )
end


curCode = {}
addEventHandler ( "onClientGUIClick", wc.ua.gridlist[1], function (button, state) 
	if button == "left" and source == wc.ua.gridlist[1] then
		curCode = guiGridListGetSelectedItems(wc.ua.gridlist[1])
	end
end, false )


function requestCodeAtServer(codeNr)
	triggerServerEvent("triggerCodeToServer", getLocalPlayer(), codeNr)
end

addEventHandler ( "onClientGUIClick", wc.ua.button["submitCode"], function (button, state) 
	if button == "left" and source == wc.ua.button["submitCode"] then
		if curCode[1]["row"] then
			requestCodeAtServer(guiGridListGetItemText(wc.ua.gridlist[1], curCode[1]["row"], 1))
		end
	end
end, false )

function updateCodesFunc(codeNr, meaning)	
	local row = guiGridListAddRow ( wc.ua.gridlist[1] )
	guiGridListSetItemText ( wc.ua.gridlist[1], row, 1 , codeNr, false, false )
	guiGridListSetItemText ( wc.ua.gridlist[1], row, 2 , meaning, false, false )
end
addEvent ( "updateCodes", true )
addEventHandler ( "updateCodes", getRootElement(), updateCodesFunc )

function windoof()
	setTimer(playSound, 11000, 1, "fraktionen/wantedpc/boot.mp3")
	setTimer(destroyElement, 15000, 1, guiCreateStaticImage(w/2-(870/2),h/2-(590/2), 870, 590, "fraktionen/wantedpc/windoofboot.jpg", false))
	setTimer(destroyElement, 7000, 1, guiCreateStaticImage(w/2-(870/2),h/2-(590/2), 870, 590, "fraktionen/wantedpc/biosboot.jpg", false))
	setTimer(destroyElement, 5000, 1, guiCreateStaticImage(w/2-(870/2),h/2-(590/2), 870, 590, "fraktionen/wantedpc/bluescreen.jpg", false))
	setTimer(changeView, 10000, 1, "main")
	playSound("fraktionen/wantedpc/error.mp3")
end

--fileDelete("fraktionen/wantedpc/client.lua")
triggerServerEvent ( "syncDatShit", localPlayer )