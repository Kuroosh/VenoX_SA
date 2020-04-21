local isintuninggarage = false

function showPremiumWindow ()

	--if getElementData ( lp, "premium" ) then
		if gWindow["tuningPremium"] then
			guiSetVisible ( gWindow["tuningPremium"], true )
		else
			gWindow["tuningPremium"] = guiCreateWindow(410,0,177,211,"Lichtfarbe",false)
			guiSetAlpha(gWindow["tuningPremium"],1)
			guiWindowSetMovable(gWindow["tuningPremium"],false)
			guiWindowSetSizable(gWindow["tuningPremium"],false)
			gButton["submitLightColor"] = guiCreateButton(48,162,91,38,"Übernehmen",false,gWindow["tuningPremium"])
			guiSetAlpha(gButton["submitLightColor"],1)
			addEventHandler ( "onClientGUIClick", gButton["submitLightColor"], 
				function ( btn, state )
					local red = math.floor ( guiScrollBarGetScrollPosition ( redScroll ) * 2.55 )
					local green = math.floor ( guiScrollBarGetScrollPosition ( greenScroll ) * 2.55 )
					local blue = math.floor ( guiScrollBarGetScrollPosition ( blueScroll ) * 2.55 )
					triggerServerEvent ( "applyLightValues", lp, red, green, blue )
				end,
			false )
			gLabel["tuningLightColor"] = guiCreateLabel(59,24,60,16,"Lichtfarbe",false,gWindow["tuningPremium"])
			guiSetAlpha(gLabel["tuningLightColor"],1)
			guiLabelSetColor(gLabel["tuningLightColor"],255,255,255)
			guiLabelSetVerticalAlign(gLabel["tuningLightColor"],"top")
			guiLabelSetHorizontalAlign(gLabel["tuningLightColor"],"left",false)
			guiSetFont(gLabel["tuningLightColor"],"default-bold-small")
			
			redScroll = guiCreateScrollBar ( 16, 42, 147, 34, true, false, gWindow["tuningPremium"] )
			greenScroll = guiCreateScrollBar ( 16, 78, 147, 34, true, false, gWindow["tuningPremium"] )
			blueScroll = guiCreateScrollBar ( 16, 114, 147, 34, true, false, gWindow["tuningPremium"] )
			
			addEventHandler ( "onClientGUIScroll", gWindow["tuningPremium"], 
				function ()
					local red = math.floor ( guiScrollBarGetScrollPosition ( redScroll ) * 2.55 )
					local green = math.floor ( guiScrollBarGetScrollPosition ( greenScroll ) * 2.55 )
					local blue = math.floor ( guiScrollBarGetScrollPosition ( blueScroll ) * 2.55 )
					guiLabelSetColor ( gLabel["tuningLightColor"], red, green, blue )
				end
			)
		end
		local red, green, blue = getVehicleHeadLightColor ( getPedOccupiedVehicle ( lp ) )
		guiScrollBarSetScrollPosition ( redScroll, red )
		guiScrollBarSetScrollPosition ( greenScroll, green )
		guiScrollBarSetScrollPosition ( blueScroll, blue )
		addEventHandler ( "onClientGUIClick", getRootElement(), partChange )
	--end
end

function showPlateWindow ()

	--if getElementData ( lp, "premium" ) then
		if gWindow["tuningPlate"] then
			guiSetVisible ( gWindow["tuningPlate"], true )
		else
			gWindow["tuningPlate"] = guiCreateWindow(410,214,177,183,"Nummernschild",false)
			guiSetAlpha(gWindow["tuningPlate"],1)
			guiWindowSetMovable(gWindow["tuningPlate"],false)
			guiWindowSetSizable(gWindow["tuningPlate"],false)
			
			gLabel["tuningPlateColor"] = guiCreateLabel(10,24,160,100,"Hier kannst du den Text\nauf deinem Numernschild\nändern, er darf maximal\n8 Zeichen lang sein.",false,gWindow["tuningPlate"])
			guiSetAlpha(gLabel["tuningPlateColor"],1)
			guiLabelSetColor(gLabel["tuningPlateColor"],255,255,255)
			guiLabelSetVerticalAlign(gLabel["tuningPlateColor"],"top")
			guiLabelSetHorizontalAlign(gLabel["tuningPlateColor"],"left",false)
			guiSetFont(gLabel["tuningPlateColor"],"default-bold-small")
			
			gEdit["PlateText"] = guiCreateEdit ( 16, 85, 147, 34, "", false, gWindow["tuningPlate"] )
			guiEditSetMaxLength(gEdit["PlateText"], 8)
			
			gButton["submitPlate"] = guiCreateButton(48,133,91,38,"Übernehmen",false,gWindow["tuningPlate"])
			guiSetAlpha(gButton["submitPlate"],1)
			
			addEventHandler ( "onClientGUIClick", gButton["submitPlate"], 
				function ( btn, state )
					local text = guiGetText(gEdit["PlateText"])
					triggerServerEvent ( "applyPlate", lp, text )
				end,
			false )
		end
	--end
end

function SubmitLeaveTuningBtn (btn)

	if btn == "left" then
		isintuninggarage = false
		setElementCollisionsEnabled ( getPedOccupiedVehicle(lp), true )
		setElementFrozen ( getPedOccupiedVehicle(lp), false )
		destroyElement ( clientGarage )
		guiSetVisible ( gWindow["tuningMenue"], false )
		addEventHandler ( "onClientGUIClick", getRootElement(), partChange )
		if gWindow["tuningPremium"] then
			guiSetVisible ( gWindow["tuningPremium"], false )
		end
		if gWindow["tuningPlate"] then
			guiSetVisible ( gWindow["tuningPlate"], false )
		end
		showCursor ( false )
		setElementClicked ( false )
		local veh = getPedOccupiedVehicle ( lp )
		for i = 0, 16 do
			removeVehicleUpgrade ( veh, getVehicleUpgradeOnSlot ( veh, i ) )
		end
		for i = 0, 16 do
			_G["t"..i] = _G["upgradeSlot"..i.."MountedID"]
		end
		local c1, c2, c3, c4 = getVehicleColor ( veh )
		triggerServerEvent ( "CancelTuning", lp, lp, veh, c1, c2, c3, c4, curpainting, t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16 )
	end
end
addEvent ( "SubmitLeaveTuningBtnAbbrechen", true)
addEventHandler ( "SubmitLeaveTuningBtnAbbrechen", getRootElement(), SubmitLeaveTuningBtn)

function SubmitPaintLeft ()

	curpainting = tonumber ( guiGetText(gLabel["PaintingMiddle"]) )
	if curpainting == 0 then curpainting = 3 else
		curpainting = curpainting - 1
	end
	guiSetText ( gLabel["PaintingMiddle"], curpainting )
	local veh = getPedOccupiedVehicle ( lp )
	setVehiclePaintjob ( veh, curpainting )
end
function SubmitPaintRight ()

	curpainting = tonumber ( guiGetText(gLabel["PaintingMiddle"]) )
	if curpainting == 3 then curpainting = 0 else
		curpainting = curpainting + 1
	end
	guiSetText ( gLabel["PaintingMiddle"], curpainting )
	local veh = getPedOccupiedVehicle ( lp )
	setVehiclePaintjob ( veh, curpainting )
end
function SubmitColorLeft ()

	curcolor = tonumber ( guiGetText(gLabel["FarbeMiddle"]) )
	if curcolor == 0 then curcolor = 126 else
		curcolor = curcolor - 1
	end
	guiSetText ( gLabel["FarbeMiddle"], curcolor )
	local veh = getPedOccupiedVehicle ( lp )
	local c1, c2, c3, c4 = getVehicleColor ( veh )
	setVehicleColor ( veh, curcolor, c2, c3, c4 )
end
function SubmitColorRight ()

	curcolor = tonumber ( guiGetText(gLabel["FarbeMiddle"]) )
	if curcolor == 126 then curcolor = 0 else
		curcolor = curcolor + 1
	end
	guiSetText ( gLabel["FarbeMiddle"], curcolor )
	local veh = getPedOccupiedVehicle ( lp )
	local c1, c2, c3, c4 = getVehicleColor ( veh )
	setVehicleColor ( veh, curcolor, c2, c3, c4 )
end

function SubmitpaintLeft2 ()

	c2 = tonumber ( guiGetText(gLabel["PaintingMiddle2"]) )
	if c2 == 0 then c2 = 126 else
		c2 = c2 - 1
	end
	guiSetText ( gLabel["PaintingMiddle2"], c2 )
	local veh = getPedOccupiedVehicle ( lp )
	local c1, TAR, c3, c4 = getVehicleColor ( veh )
	setVehicleColor ( veh, c1, c2, c3, c4 )
end
function SubmitpaintRight2 ()

	c2 = tonumber ( guiGetText(gLabel["PaintingMiddle2"]) )
	if c2 == 126 then c2 = 0 else
		c2 = c2 + 1
	end
	guiSetText ( gLabel["PaintingMiddle2"], c2 )
	local veh = getPedOccupiedVehicle ( lp )
	local c1, TAR, c3, c4 = getVehicleColor ( veh )
	setVehicleColor ( veh, c1, c2, c3, c4 )
end
function SubmitpaintLeft3 ()

	c3 = tonumber ( guiGetText(gLabel["PaintingMiddle3"]) )
	if c3 == 0 then c3 = 126 else
		c3 = c3 - 1
	end
	guiSetText ( gLabel["PaintingMiddle3"], c3 )
	local veh = getPedOccupiedVehicle ( lp )
	local c1, c2, TAR, c4 = getVehicleColor ( veh )
	setVehicleColor ( veh, c1, c2, c3, c4 )
end
function SubmitpaintRight3 ()

	c3 = tonumber ( guiGetText(gLabel["PaintingMiddle3"]) )
	if c3 == 126 then c3 = 0 else
		c3 = c3 + 1
	end
	guiSetText ( gLabel["PaintingMiddle3"], c3 )
	local veh = getPedOccupiedVehicle ( lp )
	local c1, c2, TAR, c4 = getVehicleColor ( veh )
	setVehicleColor ( veh, c1, c2, c3, c4 )
end
function SubmitpaintLeft4 ()

	c4 = tonumber ( guiGetText(gLabel["PaintingMiddle4"]) )
	if c4 == 0 then c4 = 126 else
		c4 = c4 - 1
	end
	guiSetText ( gLabel["PaintingMiddle4"], c4 )
	local veh = getPedOccupiedVehicle ( lp )
	local c1, c2, c3, TAR = getVehicleColor ( veh )
	setVehicleColor ( veh, c1, c2, c3, c4 )
end
function SubmitpaintRight4 ()

	c4 = tonumber ( guiGetText(gLabel["PaintingMiddle4"]) )
	if c4 == 126 then c4 = 0 else
		c4 = c4 + 1
	end
	guiSetText ( gLabel["PaintingMiddle4"], c4 )
	local veh = getPedOccupiedVehicle ( lp )
	local c1, c2, c3, TAR = getVehicleColor ( veh )
	setVehicleColor ( veh, c1, c2, c3, c4 )
end

function SubmitBuyTuningBtn (btn)

	if btn == "left" then
		local veh = getPedOccupiedVehicle ( lp )
		local rowindex, columnindex = guiGridListGetSelectedItem ( gGrid["tuningSelect"] )
		local selectedText = guiGridListGetItemText ( gGrid["tuningSelect"], rowindex, gColumn["tuningPart"] )
		local mounted = guiGridListGetItemText ( gGrid["tuningSelect"], rowindex, gColumn["tuningIn"] )
		local part = tonumber ( selectedText )
		local tdata = _G["tdata"..rowindex]
		if tdata then
			local data1 = tonumber(gettok ( tdata, 1, string.byte('|') ) ) 			-- Upgrade
			local data2 = tonumber(gettok ( tdata, 2, string.byte('|') ) )			-- Preis
			local data3 = gettok ( tdata, 3, string.byte('|') )						-- Fix ( "    [_]" v. "    [x]" 
			local data4 = tonumber(gettok ( tdata, 4, string.byte('|') ) )	
			if data2 <= mymoney then
				if mounted == "    [_]" then
					triggerServerEvent ( "buyTuningPart", lp, lp, veh, part, data2 )
					guiGridListClear ( gGrid["tuningSelect"] )
					listfix (getElementModel(veh))
					guiSetText ( gLabel["moneyAmount"], (mymoney-data2).." $" )
					guiGridListSetItemText ( gGrid["tuningSelect"], rowindex, gColumn["tuningIn"], "    [x]", true, false )
					_G["upgradeSlot"..data4.."MountedID"] = data1
					guiGridListSetSelectedItem ( gGrid["tuningSelect"], 0, 0 )
				else
					infobox_start ( "\n\nDieses Teil hast\ndu bereits!", 7500, 125, 0, 0 )
				end
			else
				infobox_start ( "\n\n\nDu hast zu\nwenig Geld!", 7500, 125, 0, 0 )
			end
		else
			local price = guiGridListGetItemText ( gGrid["tuningSelect"], rowindex, gColumn["tuningPrice"] )
			local price = tonumber ( gettok ( price, 1, string.byte('$') ) )
			if price then
				local text = guiGridListGetItemText ( gGrid["tuningSelect"], rowindex, gColumn["tuningPart"] )
				for i = 1, specialUpgrades do
					if specialUpgrade[i] == text then
						local upgrade = specialUpgrade[i]
						if mymoney >= price then
							local fix = guiGridListGetItemText ( gGrid["tuningSelect"], rowindex, gColumn["tuningIn"] )
							if fix == "    [_]" then
								guiSetText ( gLabel["moneyAmount"], mymoney-price.." $" )
								triggerServerEvent ( "addSpecialTuning", lp, i )
								guiGridListSetItemText ( gGrid["tuningSelect"], rowindex, gColumn["tuningIn"], "    [x]", false, false )
							else
								infobox_start ( "\n\n\nDu hast dieses\nTeil bereits!", 7500, 125, 0, 0 )
							end
						end
						break
					end
				end
			else
				infobox_start ( "\n\n\nDu hast zu\nwenig Geld!", 7500, 125, 0, 0 )
			end
		end
	end
end
addEvent ( "SubmitBuyTuningBtnAbbrechen", true)
addEventHandler ( "SubmitBuyTuningBtnAbbrechen", getRootElement(), SubmitBuyTuningBtn)

function createTuningMenue ()

	isintuninggarage = true
	showCursor ( true )
	setElementClicked ( true )
	showPremiumWindow ()
	showPlateWindow ()
	local curcolor, c2, c3, c4 = getVehicleColor ( veh )
	local curpainting = getVehiclePaintjob ( veh )
	local i = getElementData ( veh, "usingdim" )
	clientGarage = createObject ( 14798, -2052.3671875, 143.50421142578, 29.126596450806, 0, 0, 0 )
	setElementDimension ( clientGarage, i )
	--setElementInterior ( clientGarage, i )
	setElementCollisionsEnabled ( getPedOccupiedVehicle(lp), false )
	setElementFrozen ( getPedOccupiedVehicle(lp), true )
	if gWindow["tuningMenue"] then
		guiSetVisible ( gWindow["tuningMenue"], true )
	else
		local screenwidth, screenheight = guiGetScreenSize ()
		gWindow["tuningMenue"] = guiCreateWindow(0,0,406,397,"Tuningmenü",false)
		guiSetAlpha(gWindow["tuningMenue"],1)
		guiWindowSetMovable(gWindow["tuningMenue"],false)
		guiWindowSetSizable(gWindow["tuningMenue"],false)
		gGrid["tuningSelect"] = guiCreateGridList(0.0493,0.0932,0.7389,0.864,true,gWindow["tuningMenue"])
		guiGridListSetSelectionMode(gGrid["tuningSelect"],0)
		gColumn["tuningPart"] = guiGridListAddColumn(gGrid["tuningSelect"],"Tuningteil",0.43)
		gColumn["tuningPrice"] = guiGridListAddColumn(gGrid["tuningSelect"],"Preis",0.2)
		gColumn["tuningIn"] = guiGridListAddColumn(gGrid["tuningSelect"],"Eingebaut",0.17)
		gColumn["tuningID"] = guiGridListAddColumn(gGrid["tuningSelect"],"",0)
		guiSetAlpha(gGrid["tuningSelect"],1)
		gLabel["Geld"] = guiCreateLabel(0.8177,0.0982,0.1281,0.0479,"Geld:",true,gWindow["tuningMenue"])
		guiSetAlpha(gLabel["Geld"],1)
		guiLabelSetColor(gLabel["Geld"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["Geld"],"top")
		guiLabelSetHorizontalAlign(gLabel["Geld"],"left",false)
		
		gLabel["moneyAmount"] = guiCreateLabel(0.8177,0.1461,0.17,0.0504,mymoney.." $",true,gWindow["tuningMenue"])
		guiSetAlpha(gLabel["moneyAmount"],1)
		guiLabelSetColor(gLabel["moneyAmount"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["moneyAmount"],"top")
		guiLabelSetHorizontalAlign(gLabel["moneyAmount"],"left",false)
		
		gButton["buyUpgrade"] = guiCreateButton(0.8177,0.2141,0.1527,0.0806,"Kaufen",true,gWindow["tuningMenue"])
		guiSetAlpha(gButton["buyUpgrade"],1)
		gButton["delUpgrade"] = guiCreateButton(0.8177,0.3123,0.1527,0.0806,"Loeschen",true,gWindow["tuningMenue"])
		guiSetAlpha(gButton["delUpgrade"],1)
		addEventHandler ( "onClientGUIClick", gButton["delUpgrade"], 
			function ()
				local rowindex, columnindex = guiGridListGetSelectedItem ( gGrid["tuningSelect"] )
				local selectedText = guiGridListGetItemText ( gGrid["tuningSelect"], rowindex, gColumn["tuningPart"] )
				local mounted = guiGridListGetItemText ( gGrid["tuningSelect"], rowindex, gColumn["tuningIn"] )
				local part = tonumber ( selectedText )
				local tdata = _G["tdata"..rowindex]
				local data1 = tonumber(gettok ( tdata, 1, string.byte('|') ) ) 			-- Upgrade
				local data2 = tonumber(gettok ( tdata, 2, string.byte('|') ) )			-- Preis
				local data3 = gettok ( tdata, 3, string.byte('|') )						-- Fix ( "    [_]" v. "    [x]" 
				local data4 = tonumber(gettok ( tdata, 4, string.byte('|') ) )			-- Slot
				if mounted == "    [x]" and tdata then
					triggerServerEvent ( "buyTuningPart", lp, lp, veh, part, data2 )
					guiGridListClear ( gGrid["tuningSelect"] )
					listfix (getElementModel(veh))
					guiGridListSetItemText ( gGrid["tuningSelect"], rowindex, gColumn["tuningIn"], "    [ ]", true, false )
					_G["upgradeSlot"..data4.."MountedID"] = false
					removeVehicleUpgrade ( veh, data1 )
					guiGridListSetSelectedItem ( gGrid["tuningSelect"], 0, 0 )
					triggerServerEvent ( "removeTuningPart", lp, lp, veh, part, data2 )
				end
			end,
		false )
		gButton["closeUpgradeStore"] = guiCreateButton(0.8177,0.4081,0.1527,0.0806,"Schliessen",true,gWindow["tuningMenue"])
		guiSetAlpha(gButton["closeUpgradeStore"],1)
		addEventHandler("onClientGUIClick", gButton["closeUpgradeStore"], SubmitLeaveTuningBtn, false)
		addEventHandler("onClientGUIClick", gButton["buyUpgrade"], SubmitBuyTuningBtn, false)
	end
	local veh = getPedOccupiedVehicle ( lp )
	guiGridListClear ( gGrid["tuningSelect"] )
	guiSetText ( gLabel["moneyAmount"], mymoney.." $" )
	local vehID = getElementModel ( getPedOccupiedVehicle ( lp ) )
	for i = 0, 16 do
		_G["upgradeSlot"..i.."MountedID"] = false
	end
	listfix (vehID)
end


function listfix(vehID)

	local row = guiGridListAddRow ( gGrid["tuningSelect"] )
	guiGridListSetItemText( gGrid["tuningSelect"], row, gColumn["tuningPart"], "Spezial", true, false )
	guiGridListSetItemText( gGrid["tuningSelect"], row, gColumn["tuningPrice"], "", true, false )
	guiGridListSetItemText( gGrid["tuningSelect"], row, gColumn["tuningIn"], "", true, false )
	guiGridListSetItemText( gGrid["tuningSelect"], row, gColumn["tuningID"], "", true, false )
	for i = 1, specialUpgrades do
		local row = guiGridListAddRow ( gGrid["tuningSelect"] )
		local fix = getElementData ( getPedOccupiedVehicle ( lp ), "stuning"..i )
		if fix then fix = "    [x]" else fix = "    [_]" end
		guiGridListSetItemText( gGrid["tuningSelect"], row, gColumn["tuningPart"], specialUpgrade[i], false, false )
		guiGridListSetItemText( gGrid["tuningSelect"], row, gColumn["tuningPrice"], specialUpgradePrice[i].." $", false, false )
		guiGridListSetItemText( gGrid["tuningSelect"], row, gColumn["tuningIn"], fix, false, false )
		guiGridListSetItemText( gGrid["tuningSelect"], row, gColumn["tuningID"], "", false, false )
	end
	local row = guiGridListAddRow ( gGrid["tuningSelect"] )
	guiGridListSetItemText( gGrid["tuningSelect"], row, gColumn["tuningPart"], "", false, false )
	guiGridListSetItemText( gGrid["tuningSelect"], row, gColumn["tuningPrice"], "", false, false )
	guiGridListSetItemText( gGrid["tuningSelect"], row, gColumn["tuningIn"], "", false, false )
	guiGridListSetItemText( gGrid["tuningSelect"], row, gColumn["tuningID"], "", false, false )
	
	for upgradeSlot=0,16 do
		upin = 0
		local compatList = compatibleUpgrades[vehID][upgradeSlot]
		if compatList then
			for i, upgradeID in ipairs(compatList) do				
				upin = 1
			end
		end
		if upin == 1 then
			local row = guiGridListAddRow ( gGrid["tuningSelect"] )
			guiGridListSetItemText( gGrid["tuningSelect"], row, gColumn["tuningPart"], slotNames[upgradeSlot], true, false )
			guiGridListSetItemText( gGrid["tuningSelect"], row, gColumn["tuningPrice"], "", true, false )
			guiGridListSetItemText( gGrid["tuningSelect"], row, gColumn["tuningIn"], "", true, false )
			guiGridListSetItemText( gGrid["tuningSelect"], row, gColumn["tuningID"], "", true, false )
			for i, upgradeID in ipairs(compatList) do				
				local row = guiGridListAddRow ( gGrid["tuningSelect"] )
				guiGridListSetItemText( gGrid["tuningSelect"], row, gColumn["tuningPart"], "  "..UpgradeNames[upgradeID], false, false )
				local data1 = tostring ( upgradeID )
				if upgradeSlot == 8 then
					if upgradeID == 1008 then price = 5*nitroprice end
					if upgradeID == 1009 then price = 2*nitroprice end
					if upgradeID == 1010 then price = 10*nitroprice end
				else
					price = tuningpartprice
				end
				local data2 = tostring ( price )
				guiGridListSetItemText( gGrid["tuningSelect"], row, gColumn["tuningPrice"], price.." $", false, false )
				if getVehicleUpgradeOnSlot ( getPedOccupiedVehicle ( lp ), upgradeSlot ) == upgradeID then 
					fix = "    [x]"
					_G["upgradeSlot"..upgradeSlot.."MountedID"] = upgradeID
				else
					fix = "    [_]" 
				end
				local data3 = fix
				local data4 = upgradeSlot
				local tdata = data1.."|"..data2.."|"..data3.."|"..data4.."|"
				_G["tdata"..row] = tdata
				guiGridListSetItemText( gGrid["tuningSelect"], row, gColumn["tuningIn"], fix, false, false )
				guiGridListSetItemText( gGrid["tuningSelect"], row, gColumn["tuningID"], upgradeID, false, false )
			end
			local row = guiGridListAddRow ( gGrid["tuningSelect"] )
			guiGridListSetItemText( gGrid["tuningSelect"], row, gColumn["tuningPart"], "", true, false )
			guiGridListSetItemText( gGrid["tuningSelect"], row, gColumn["tuningPrice"], "", true, false )
			guiGridListSetItemText( gGrid["tuningSelect"], row, gColumn["tuningIn"], "", true, false )
			guiGridListSetItemText( gGrid["tuningSelect"], row, gColumn["tuningID"], "", true, false )
		end
	end
end

function partChange ()

	if isElement(gWindow["tuningMenue"]) and isintuninggarage then
		local rowindex, columnindex = guiGridListGetSelectedItem ( gGrid["tuningSelect"] )
		local selectedText = guiGridListGetItemText ( gGrid["tuningSelect"], rowindex, gColumn["tuningPart"] )
		if selectedText then
			local veh = getPedOccupiedVehicle ( lp )
			for i = 0, 16 do
				removeVehicleUpgrade ( veh, getVehicleUpgradeOnSlot ( veh, i ) )
			end
			for i = 0, 16 do
				if ( _G["upgradeSlot"..i.."MountedID"] == false ) then
				else
					addVehicleUpgrade ( veh, _G["upgradeSlot"..i.."MountedID"] )
				end
			end
			local tdata = _G["tdata"..rowindex]
			if tdata then
				local data1 = tonumber(gettok ( tdata, 1, string.byte('|') ) ) 			-- Upgrade
				if data1 then
					local data2 = tonumber(gettok ( tdata, 2, string.byte('|') ) )			-- Preis
					local data3 = gettok ( tdata, 3, string.byte('|') )						-- Fix ( "    [_]" v. "    [x]" 
					local data4 = tonumber(gettok ( tdata, 4, string.byte('|') ))			-- Slot
					local veh = getPedOccupiedVehicle ( lp )
					if getVehicleUpgradeOnSlot ( veh, data4 ) ~= data1 then
						addVehicleUpgrade ( veh, data1 )
					end
				end
			end
		end
	end
end
