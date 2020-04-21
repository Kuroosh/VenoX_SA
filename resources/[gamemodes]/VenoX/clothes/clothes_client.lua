gButton = {}

function fillSkinlist ()

	guiGridListClear ( SkinauswahlGrid )
	for i = 1, 288 do
		if skinname[i] ~= false and skinname[i] ~= nil then
			if skinsex[i] == sex then
				if price == "cheap" then 
					if tonumber(skinpreis[i]) < 300 then
						local row = guiGridListAddRow ( SkinauswahlGrid )
						guiGridListSetItemText ( SkinauswahlGrid, row, skinnameColumn, tostring ( skinname[i] ), false, false )
						guiGridListSetItemText ( SkinauswahlGrid, row, skinpreisColumn, tostring ( skinpreis[i].." $" ), true, false )
					end
				elseif tonumber(skinpreis[i]) >= 300 then
					local row = guiGridListAddRow ( SkinauswahlGrid )
					guiGridListSetItemText ( SkinauswahlGrid, row, skinnameColumn, tostring ( skinname[i] ), false, false )
					guiGridListSetItemText ( SkinauswahlGrid, row, skinpreisColumn, tostring ( skinpreis[i].." $" ), true, false )
				end
			end
		end
	end
end

function skinshow ()

	if SkinauswahlWindow and guiGetVisible ( SkinauswahlWindow ) == true then
		local rowindex, columnindex = guiGridListGetSelectedItem ( SkinauswahlGrid )
		local selectedText = guiGridListGetItemText ( SkinauswahlGrid, rowindex, skinnameColumn )
		local selectedPrice = guiGridListGetItemText ( SkinauswahlGrid, rowindex, skinpreisColumn )
		if selectedText == false or selectedPrice == false then
		else
			for i = 1, 288 do
				if skinname[i] == selectedText then
					if tostring ( skinpreis[i].." $" ) == selectedPrice then
						setElementModel ( lp, i )
						curskinPrice = skinpreis[i]
						curskinID = i
					end
				end
			end
		end
	end
end
addEventHandler ( "onClientGUIClick", getRootElement(), skinshow )

function sucessfullBuyed_func ()

	guiSetVisible ( SkinauswahlWindow, false )
	showCursor(false)
	triggerServerEvent ( "cancel_gui_server", lp )
	setElementModel ( lp, vnxClientGetElementData ( "skinid" ) )
	setElementPosition ( lp, 161.66276550293, -93.030876159668, 1001.453918457 )
	setCameraTarget ( lp )
end
addEvent ( "sucessfullBuyed", true )
addEventHandler ( "sucessfullBuyed", getRootElement(), sucessfullBuyed_func )


function _createSkinauswahlGui_func ()

	setPedRotation ( lp, 90 )
	if SkinauswahlWindow then
		guiSetVisible ( SkinauswahlWindow, true )
	else
		sex = "male"
		price = "cheap"
		
		local screenwidth, screenheight = guiGetScreenSize ()
		
		SkinauswahlWindow = guiCreateWindow(0,screenheight-440,384,440,"Skinauswahl",false)
		guiSetAlpha(SkinauswahlWindow,1)
		
		SkinauswahlGrid = guiCreateGridList(0.0339,0.0727,0.625,0.8909,true,SkinauswahlWindow)
		guiGridListSetSelectionMode(SkinauswahlGrid,2)
		skinnameColumn = guiGridListAddColumn(SkinauswahlGrid,"Skin",0.6)
		skinpreisColumn = guiGridListAddColumn(SkinauswahlGrid,"Preis",0.2)
		guiSetAlpha(SkinauswahlGrid,1)
		
		gButton["clothesKaufen"] = guiCreateButton(0.7,0.7091,0.2656,0.0977,"Kaufen",true,SkinauswahlWindow)
		guiSetAlpha(gButton["clothesKaufen"],1)
		gButton["clothesCancel"] = guiCreateButton(0.7,0.8591,0.2656,0.0977,"Abbrechen",true,SkinauswahlWindow)
		guiSetAlpha(gButton["clothesCancel"],1)
		gButton["clothesFrauenskins"] = guiCreateButton(0.7,0.2023,0.2682,0.0977,"Frauenskins",true,SkinauswahlWindow)
		guiSetAlpha(gButton["clothesFrauenskins"],1)
		gButton["clothesMaennerskins"] = guiCreateButton(0.7,0.075,0.2578,0.0977,"Maennerskins",true,SkinauswahlWindow)
		guiSetAlpha(gButton["clothesMaennerskins"],1)
		gButton["clothesTeuer"] = guiCreateButton(0.7,0.4545,0.2682,0.0977,"Teuer",true,SkinauswahlWindow)
		guiSetAlpha(gButton["clothesTeuer"],1)
		gButton["clothesGuenstig"] = guiCreateButton(0.7,0.3295,0.2682,0.0977,"Guenstig",true,SkinauswahlWindow)
		guiSetAlpha(gButton["clothesGuenstig"],1)
		
		addEventHandler("onClientGUIClick", gButton["clothesCancel"], 
			function ()
				guiSetVisible ( SkinauswahlWindow, false )
				showCursor(false)
				triggerServerEvent ( "cancel_gui_server", lp )
				triggerServerEvent ( "clothesCancel", lp )
				setElementModel ( lp, vnxClientGetElementData ( "skinid" ) )
				setElementPosition ( lp, 161.66276550293, -93.030876159668, 1001.453918457 )
				setCameraTarget ( lp )
			end
		)
		
		addEventHandler("onClientGUIClick", gButton["clothesKaufen"],
			function ()
				triggerServerEvent ( "clothesBuyServer", lp, lp, curskinID, curskinPrice )
			end
		)
		
		addEventHandler("onClientGUIClick", gButton["clothesFrauenskins"],
			function ()
				sex = "female"
				fillSkinlist ()
			end
		)
		addEventHandler("onClientGUIClick", gButton["clothesMaennerskins"],
			function ()
				sex = "male"
				fillSkinlist ()
			end
		)
		addEventHandler("onClientGUIClick", gButton["clothesTeuer"],
			function ()
				price = "expensive"
				fillSkinlist ()
			end
		)
		addEventHandler("onClientGUIClick", gButton["clothesGuenstig"],
			function ()
				price = "cheap"
				fillSkinlist ()
			end
		)
		
		fillSkinlist ()
	end
end
addEvent ( "_createSkinauswahlGui", true )
addEventHandler ( "_createSkinauswahlGui", lp, _createSkinauswahlGui_func )