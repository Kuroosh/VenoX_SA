-------------------------
------- (c) 2010 --------
------- by Zipper -------
-- and Vio MTA:RL Crew --
-------------------------

validItems = { ["Zeitung"]=true, ["Kanister"]=true, ["Drogen"]=true, ["Kokain"]=true, ["Materialien"]=true, ["Wuerfel"]=true, ["Zigaretten"]=true, ["Erste Hilfe"]=true, ["Bier"]=true, ["Burger"]=true, ["Snack"]=true, ["Suessigkeiten"]=true, ["Hanfsamen"]=true, ["Ehre"]=true, ["Luftwaffe"]=true, ["Verdienst"]=true, ["Notebook"]=true, ["Handheld"]=true, ["Chips"]=true, ["Hufeisen"]=true, ["Geschenk"]=true, ["Schach"]=true, ["Angel"]=true, ["Haken"]=true, ["Koeder"]=true, ["Fernglas"]=true, ["Kuerbis"]=true, ["Phosphor"]=true, ["Dum-Dum"]=true, ["Panzerbrechend"]=true, ["Vulcano"]=true, ["Pfeffer"]=true, ["Halloween-Munition"]=true }

itemTexts = { ["Zeitung"]="Eine neue Ausgabe\ndes \"Liberty Tree\"-\nThe Truth is, what\nyou make of it!",
 ["Kanister"]="Ein Kanister erlaubt\nes dir, mit /fill ein beliebi-\nges Fahrzeug mit 15 \nLitern Benzin zu fuellen.",
 ["Kokain"]="Kokain regeneriert einen\nTeil deiner Gesundheit,\njedoch nicht ohne Neben-\neffekte. Aussderdem ist\nder Besitz von Kokain\nstrafbar! Befehle:\n/takekokain",
 ["Drogen"]="Drogen regenieren einen\nTeil deiner Gesundheit,\njedoch nicht ohne Neben-\neffekte. Aussderdem ist\nder Besitz von Drogen\nstrafbar! Befehle:\n/usedrugs, /selldrugs",
 ["Materialien"]="Materialien bilden den\nGrundstoff fuer Waffen,\nsie sind - ebenso wie\nDrogen - illegal.\n\nBefehl: /sellgun", 
 ["Wuerfel"]="Mit einem Wuerfel kannst\neine Beliebige Zahl\nzwischen 1 und 6\nerzeugen.\n\nBefehl:\n/dice", 
 ["Zigaretten"]="\nZigaretten kannst du mit\n/smoke rauchen.",
 ["Erste Hilfe"]="Auch als Medikit bekannt\nund stellt sofort 15\nHP wieder her.\nBefehle: /eat",
 ["Bier"]="\"Logger - Das Bier,\ndas den Wald gefaellt\nhat!\" - Befehle: /eat",
 ["Burger"]="Iss es, bevor es\ndich isst! Befehle: /eat",
 ["Snack"]="75 % Zucker, 35 % Fett -\nEnergie pur! Befehle: \n/eat",
 ["Suessigkeiten"]="Happy Halloween!\nMoegliche Nebenwirkung:\nKopfschmerz, Haemo-\nrieden oder kurz-\nzeitiges Erblinden.\nNicht fuer Kinder unter\n20 Jahren geeignet!",
 ["Hanfsamen"]="Drogen zum selber\nanbauen fuer den\nHobbygaertner, je nach\nWachstumszeit mehr\nErtrag!\nBefehle: /grow weed",
 ["Ehre"]="Verliehen als\nZeichen besonderer\nEhre.",
 ["Luftwaffe"]="Verliehen fuer\nbesondere Verdienste\nim Berreich\nLuftwaffe",
 ["Verdienst"]="Verliehen fuer\nbesondere Verdienste.",
 ["Notebook"]="Ein brandneues Notebook\nder Firma \"Fruit\"- mit\nW-Lan und Internet-\nzugang!",
 ["Handheld"]="Zeitlose Klassiker\nueberall geniessen!\nZum starten tippe\n/blocks [1-10].",
 ["Chips"]="Chips aus einem\nder Casinos.\nJe einen Dollar wert.",
 ["Hufeisen"]="Hufeisen sind in ganz\nLas Venturas versteckt.\nFinde alle 25 fuer eine\nspezielle Belohnung...",
 ["Geschenk"]="Dieses Paeckchen enthaelt\netwas zufaelliges -\nvon Geld bis zu\nAutos ist alles\ndabei!",
 ["Schach"]="Tippe /chess [Name],\num jemanden zu einer\nPartie Schach herauszu-\nfordern.",
 ["Angel"]="Mit einer Angel kannst\ndu Fische oder anderes\naus dem Meer fangen.\nJe nach Skill hast\ndu unterschiedliche\nChancen.\nAlternativ: /fish",
 ["Haken"]="Zum Angeln brauchst\ndu Haken.",
 ["Koeder"]="Ohne Keoder kannst\ndu keine Fische\nfangen.",
 ["Fernglas"]="/fglass zur schnelleren\nBenutzung.",
 ["Kuerbis"]="Kann mit /halloween\nzum Einloesen fuer\nBoni verwendet werden.",
 ["Phosphor"]="Phosphor Munnition\nsetzt gegner kurz-\nzeitig in Brand.",
 ["Dum-Dum"]="Dum-Dum Geschosse\nverursachen zusaetzlichen\nSchaden an un-\ngepanzerten Zielen.",
 ["Panzerbrechend"]="Panzerbrechende\nGeschosse verursachen\nBonusschaden an\ngepanzerten Zielen.",
 ["Vulcano"]="Explosivgeschosse.",
 ["Pfeffer"]="Beim Einschlag wird\neine geringe Menge\nPfefferspray frei-\ngesetzt.",
 ["Halloween-Munition"]="Deine Ziele\n werden buchstaeblich\nden Kopf verlieren."
 }

itemNames = { ["Zeitung"]="Zeitung",
 ["Kanister"]="benzinkannister",
 ["Drogen"]="Drogen", 
 ["Kokain"]="Kokain", 
 ["Materialien"]="Materialien", 
 ["Wuerfel"]="Wuerfel",
 ["Zigaretten"]="Zigaretten",
 ["Erste Hilfe"]="Erste Hilfe",
 ["Bier"]="Bier",
 ["Burger"]="Burger",
 ["Snack"]="Snack",
 ["Suessigkeiten"]="Suessigkeiten",
 ["Hanfsamen"]="Hanfsamen",
 ["Ehre"]="Ehrenmedaille",
 ["Luftwaffe"]="Luftwaffen Orden",
 ["Verdienst"]="Verdienstkreuz",
 ["Notebook"]="Notebook",
 ["Handheld"]="Handheld",
 ["Chips"]="Chips",
 ["Hufeisen"]="Hufeisen",
 ["Geschenk"]="Geschenk",
 ["Schach"]="Schach",
 ["Angel"]="Angel",
 ["Haken"]="Haken",
 ["Koeder"]="Koeder",
 ["Fernglas"]="Fernglas",
 ["Kuerbis"]="Kuerbis",
 ["Phosphor"]="Phosphor",
 ["Dum-Dum"]="Dum-Dum",
 ["Panzerbrechend"]="Panzerbrechend",
 ["Vulcano"]="Vulcano",
 ["Pfeffer"]="Pfeffer",
 ["Halloween-Munition"]="Halloween-Munition"
 }
 
itemImage = { ["Zeitung"]="liberty_tree.png",
 ["Kanister"]="benzin.png",
 ["Kokain"]="Kokain.png", 
 ["Drogen"]="weed.png", 
 ["Materialien"]="mats.png", 
 ["Wuerfel"]="dice.png",
 ["Zigaretten"]="cigaretts.png",
 ["Erste Hilfe"]="aid.bmp",
 ["Bier"]="beer.bmp",
 ["Burger"]="burger.png",
 ["Snack"]="snack.png",
 ["Suessigkeiten"]="suess.png",
 ["Hanfsamen"]="drugs.png",
 ["Ehre"]="orden_1.png",
 ["Luftwaffe"]="orden_2.png",
 ["Verdienst"]="orden_3.png",
 ["Notebook"]="fruit.png",
 ["Handheld"]="gbc.png",
 ["Chips"]="chip.png",
 ["Hufeisen"]="horseshoe.png",
 ["Geschenk"]="present.bmp",
 ["Schach"]="chess.png",
 ["Angel"]="fishing/pole.png",
 ["Haken"]="fishing/hook.png",
 ["Koeder"]="fishing/worm.png",
 ["Fernglas"]="binoculars.png",
 ["Kuerbis"]="easteregg.bmp",
 ["Phosphor"]="special_ammo.bmp",
 ["Dum-Dum"]="special_ammo.bmp",
 ["Panzerbrechend"]="special_ammo.bmp",
 ["Vulcano"]="special_ammo.bmp",
 ["Pfeffer"]="special_ammo.bmp",
 ["Halloween-Munition"]="special_ammo.bmp"
 }
 
itemCommand = { ["Zeitung"]="readnewspaper",
 ["Kanister"]="fill",
 ["Drogen"]="usedrugs", 
 ["Materialien"]="mats", 
 ["Kokain"]="takekokain",
 ["Wuerfel"]="dice",
 ["Zigaretten"]="smoke",
 ["Erste Hilfe"]="eat",
 ["Bier"]="eat",
 ["Burger"]="eat",
 ["Snack"]="eat",
 ["Suessigkeiten"]="eat",
 ["Hanfsamen"]="grow",
 ["Notebook"]="internet",
 ["Handheld"]="blocks",
 ["Chips"]="chips",
 ["Geschenk"]="presents",
 ["Angel"]="fish",
 ["Fernglas"]="fglass",
 ["Kuerbis"]="halloween",
 ["Phosphor"]="useAmmo1",
 ["Dum-Dum"]="useAmmo2",
 ["Panzerbrechend"]="useAmmo3",
 ["Vulcano"]="useAmmo4",
 ["Pfeffer"]="useAmmo5",
 ["Halloween-Munition"]="useAmmo6"
 }

itemType = { ["Kanister"]="fuel",
 ["Drogen"]="drugs",
 ["Kokain"]="koks",
 ["Wuerfel"]="dice",
 ["Kokain"]="koks",
 ["Zigaretten"]="zigaretten",
 ["Materialien"]="mats",
 ["Hanfsamen"]="grow",
 ["Notebook"]="notebook",
 ["Geschenk"]="presents",
 ["Schach"]="chess",
 ["Bonusei"]="easterEgg"
 }
--[[
for key, index in pairs ( fishNames ) do
	validItems[index] = true
	itemTexts[index] = "Das hast du beim\nAngeln gefangen!\nVerkaufe es mit\n/sellfish"
	itemNames[index] = index
	itemImage[index] = "fishing/cought.png"
end

local gWindow = {}

function showInventory_func ()

	if not isCursorShowing () and not getElementClicked() and not tutorial and not isPedDead ( lp ) then
		setElementClicked ( true )
		showCursor ( true )
		if gWindow["inventory"] then
			guiSetVisible ( gWindow["inventory"], true )
		else
			--gWindow["inventory"] = guiCreateWindow(screenwidth/2-375/2,screenheight/2-288/2,375,288,"Inventar",false)
			gWindow["inventory"] = guiCreateStaticImage(screenwidth/2-380/2,screenheight/2-320/2,400,340,"images/gui/inventar.png",false)
			
			guiSetAlpha(gWindow["inventory"],1)
			
			gGrid["itemList"] = guiCreateGridList(0.02,0.18,0.5,0.77,true,gWindow["inventory"])
			guiGridListSetSortingEnabled ( gGrid["itemList"], false )
			guiGridListSetSelectionMode(gGrid["itemList"],0)
			gColumn["itemName"] = guiGridListAddColumn(gGrid["itemList"],"Item",0.55)
			gColumn["itemCount"] = guiGridListAddColumn(gGrid["itemList"],"Anzahl",0.25)
			guiSetAlpha(gGrid["itemList"],1)
			
			addEventHandler ( "onClientGUIClick", gGrid["itemList"], newSelection )
			
			gImage["itemImage"] = guiCreateStaticImage(0.75,0.2,0.15,0.15,"images/black.bmp",true,gWindow["inventory"])
			
			gLabel["itemName"] = guiCreateLabel(0.55, 0.225, 0.2, 0.2, "benzinkannister",true,gWindow["inventory"])
			guiSetAlpha(gLabel["itemName"],1)
			guiLabelSetColor(gLabel["itemName"],255,255,255)
			guiLabelSetVerticalAlign(gLabel["itemName"],"top")
			guiLabelSetHorizontalAlign(gLabel["itemName"],"left",false)
			guiSetFont(gLabel["itemName"],"default-bold-small")
			gLabel["itemInfo"] = guiCreateLabel(0.6, 0.4, 0.35, 0.6, "Ein Kanister erlaubt\nes dir, mit /fill ein beliebi-\nges Fahrzeug mit 15 \nLitern Benzin zu fuellen.",true,gWindow["inventory"])
			guiSetAlpha(gLabel["itemInfo"],1)
			guiLabelSetColor(gLabel["itemInfo"],200,200,050)
			guiLabelSetVerticalAlign(gLabel["itemInfo"],"top")
			guiLabelSetHorizontalAlign(gLabel["itemInfo"],"left",false)
			guiSetFont(gLabel["itemInfo"],"default-bold-small")
			
			gButton["itemUse"] = guiCreateButton(0.5049*325+60,0.8306*288,0.2164*325,0.1319*288,"Benutzen",false,gWindow["inventory"])
			guiSetAlpha(gButton["itemUse"],1)
			gButton["itemThrow"] = guiCreateButton(0.7344*325+60,0.8306*288,0.2164*325,0.1319*288,"Wegwerfen",false,gWindow["inventory"])
			guiSetAlpha(gButton["itemThrow"],1)
			gButton["itemClose"] = guiCreateButton(0.623*325+60,0.985*288,0.2164*325,0.1319*288,"Schliessen",false,gWindow["inventory"])
			guiSetAlpha(gButton["itemClose"],1)
			addEventHandler("onClientGUIClick", gButton["itemClose"],
				function ()
					hideInventory()
				end,
			false )
			addEventHandler("onClientGUIClick", gButton["itemThrow"],
				function ()
					throwCurrentItem()
				end,
			false )
			addEventHandler("onClientGUIClick", gButton["itemUse"],
				function ( btn, state )
					if state == "up" then
						useCurrentItem()
					end
				end,
			false )
		end
		fillInventoryList()
	end
end
bindKey ( "i", "down", showInventory_func )

function hideInventory()

	setElementClicked ( false )
	guiSetVisible ( gWindow["inventory"], false )
	showCursor ( false )
end

placeAbleObjects = {
 ["Objekt"]=true,
 ["Fackel"]=true,
 ["Basketball"]=true,
 ["Strandball"]=true,
 ["Lagerfeuer"]=true,
 ["Grill"]=true,
 ["Liege"]=true,
 ["Handtuch"]=true,
 ["Rampe"]=true,
 ["Tigerfell"]=true,
 ["Dixiklo"]=true,
 ["Stereoanlage"]=true
 }
 
local placeAbleObjectIMGs = {
 ["Fackel"]="placeable/torch.png",
 ["Basketball"]="placeable/ball_a.png",
 ["Strandball"]="placeable/ball_b.png",
 ["Lagerfeuer"]="placeable/campfire.png",
 ["Grill"]="placeable/grill.png",
 ["Liege"]="placeable/liege.png",
 ["Handtuch"]="placeable/towel.png",
 ["Stereoanlage"]="placeable/hi_fi.png"
 }
 
local placeAbleObjectNames = {
 [3461]="Fackel",
 [1946]="Basketball",
 [1598]="Strandball",
 [841]="Lagerfeuer",
 [842]="Lagerfeuer",
 [1481]="Grill",
 [1255]="Liege",
 [1640]="Handtuch",
 [1641]="Handtuch",
 [1642]="Handtuch",
 [1643]="Handtuch",
 [13593]="Rampe",
 [1828]="Tigerfell",
 [2984]="Dixiklo",
 [2103]="Stereoanlage"
 }
 
local placeAbleObjectDesc = {
 [1640]="Farbe: Gruen\n\n",
 [1641]="Farbe: Lila\n\n",
 [1642]="Farbe: Rot\n\n",
 [1643]="Farbe: Gelb\n\n"
 }

function useCurrentItem ()

	local rowindex, columnindex = guiGridListGetSelectedItem ( gGrid["itemList"] )
	local selectedText = guiGridListGetItemText ( gGrid["itemList"], rowindex, gColumn["itemName"] )
	if placeAbleObjects[selectedText] then
		if getElementDimension ( lp ) == 0 and getElementInterior ( lp ) == 0 then
			hideInventory ()
			if selectedText == "Stereoanlage" then
				setTimer ( placeRadio, 500, 1 )
			else
				setTimer ( startObjectDrop, 500, 1 )
			end
		end
	elseif itemCommand[selectedText] then
		if itemCommand[selectedText] == "eat" then
			for i = 1, 3 do
				if foodName[vnxClientGetElementData ( "food"..i )] == selectedText then
					triggerServerEvent ( "executeCommand", getRootElement(), lp, "eat", i )
					break
				end
			end
		elseif itemCommand[selectedText] == "fish" then
			hideInventory ()
			setTimer ( executeCommandHandler, 200, 1, "fish" )
		elseif itemCommand[selectedText] == "fglass" then
			hideInventory ()
			setTimer ( executeCommandHandler, 200, 1, "fglass" )
		elseif itemCommand[selectedText] == "halloween" then
			hideInventory ()
			setTimer ( executeCommandHandler, 200, 1, "halloween" )
		else
			triggerServerEvent ( "executeCommand", getRootElement(), lp, itemCommand[selectedText] )
		end
	end
end
function throwCurrentItem ()

	local rowindex, columnindex = guiGridListGetSelectedItem ( gGrid["itemList"] )
	local selectedText = guiGridListGetItemText ( gGrid["itemList"], rowindex, gColumn["itemName"] )
	if itemCommand[selectedText] then
		if itemCommand[selectedText] == "eat" then
			for i = 1, 3 do
				if foodName[vnxClientGetElementData ( "food"..i )] == selectedText then
					triggerServerEvent ( "throw", getRootElement(), lp, "", "food", i )
					break
				end
			end
		else
			triggerServerEvent ( "throw", getRootElement(), lp, "", itemType[selectedText] )
		end
	elseif placeAbleObjects[selectedText] then
		triggerServerEvent ( "throw", getRootElement(), lp, "", "object" )
	end
end

function newSelection ()

	local rowindex, columnindex = guiGridListGetSelectedItem ( gGrid["itemList"] )
	local selectedText = guiGridListGetItemText ( gGrid["itemList"], rowindex, gColumn["itemName"] )
	if selectedText then
		if validItems[selectedText] then
			guiSetText ( gLabel["itemInfo"], itemTexts[selectedText] )
			guiSetText ( gLabel["itemName"], itemNames[selectedText] )
			if gImage["itemImage"] then
				destroyElement ( gImage["itemImage"] )
			end
			gImage["itemImage"] = guiCreateStaticImage(0.75,0.2,0.15,0.15,"images/inventory/"..itemImage[selectedText],true,gWindow["inventory"])
			guiSetAlpha ( gImage["itemImage"], 1 )
		elseif placeAbleObjects[selectedText] then
			local addtext = ""
			if placeAbleObjectDesc[vnxClientGetElementData ( "object" )] then
				addtext = addtext..placeAbleObjectDesc[vnxClientGetElementData("object" )]
			end
			if gImage["itemImage"] then
				destroyElement ( gImage["itemImage"] )
			end
			if selectedText == "Stereoanlage" then
				guiSetText ( gLabel["itemInfo"], addtext.."Dieses Objekt kannst\ndu benutzen, um es\nzu platzieren." )
			else
				guiSetText ( gLabel["itemInfo"], addtext.."Dieses Objekt kannst\ndu benutzen, um es\nzu platzieren und\nMusik spielen zu\nlassen." )
			end
			
			local img = placeAbleObjectIMGs[selectedText]
			if not img then
				img = "present.bmp"
			end
			
			local path = "images/inventory/"..img
			gImage["itemImage"] = guiCreateStaticImage(0.75,0.2,0.15,0.15,path,true,gWindow["inventory"])
			
			guiSetText ( gLabel["itemName"], selectedText )
			
			guiSetAlpha ( gImage["itemImage"], 1 )
		end
	end
end

function fillInventoryList ()

	if gImage["itemImage"] then
		guiSetAlpha( gImage["itemImage"], 0 )
	end
	guiSetText ( gLabel["itemName"], "" )
	guiSetText ( gLabel["itemInfo"], "\n\nBitte waehle ein Item aus\nder Liste aus!" )
	
	fillWithItems ( gGrid["itemList"], gColumn["itemName"], gColumn["itemCount"] )
end
addEvent ( "refreshItems", true )
addEventHandler ( "refreshItems", getRootElement(), fillInventoryList )
]]
function fillWithItems ( grid, columnName, columnCount )

	local value
	guiGridListClear ( grid )
	-- Medikits --
	if vnxClientGetElementData ( "medikits" ) >= 1 then
		local row = guiGridListAddRow ( grid )
		guiGridListSetItemText ( grid, row, columnName, "Medikits", false, false )
		if vnxClientGetElementData ( "medikits" ) == 1 then value = "" else value = vnxClientGetElementData ( "medikits" ) end
		guiGridListSetItemText ( grid, row, columnCount, value, false, false )
	end
	-- Repairkits --
	if vnxClientGetElementData ( "repairkits" ) >= 1 then
		local row = guiGridListAddRow ( grid )
		guiGridListSetItemText ( grid, row, columnName, "Repairkits", false, false )
		if vnxClientGetElementData ( "repairkits" ) == 1 then value = "" else value = vnxClientGetElementData ( "repairkits" ) end
		guiGridListSetItemText ( grid, row, columnCount, value, false, false )
	end
	-- placeAbleObjects --
	if vnxClientGetElementData ( "object" ) > 0 then
		local row = guiGridListAddRow ( grid )
		local objectName = placeAbleObjectNames[vnxClientGetElementData ( "object" )]
		if not objectName then
			objectName = "Objekt"
		end
		guiGridListSetItemText ( grid, row, columnName, objectName, false, false )
		guiGridListSetItemText ( grid, row, columnCount, "", false, false )
	end
	-- Handheld --
	if vnxClientGetElementData ( "gameboy" ) >= 1 then
		local row = guiGridListAddRow ( grid )
		guiGridListSetItemText ( grid, row, columnName, "Handheld", false, false )
		if vnxClientGetElementData ( "gameboy" ) == 1 then value = "" else value = vnxClientGetElementData ( "gameboy" ) end
		guiGridListSetItemText ( grid, row, columnCount, value, false, false )
	end
	-- Fernglas
	if vnxClientGetElementData ( "fglass" ) then
		local row = guiGridListAddRow ( grid )
		guiGridListSetItemText ( grid, row, columnName, "Fernglas", false, false )
		value = ""
		guiGridListSetItemText ( grid, row, columnCount, value, false, false )
	end
	-- Schach --
	if vnxClientGetElementData ( "chess" ) then
		local row = guiGridListAddRow ( grid )
		guiGridListSetItemText ( grid, row, columnName, "Schach", false, false )
		guiGridListSetItemText ( grid, row, columnCount, "", false, false )
	end
	-- Geschenk --
	if vnxClientGetElementData ( "presents" ) then
		if vnxClientGetElementData ( "presents" ) > 0 then
			local row = guiGridListAddRow ( grid )
			guiGridListSetItemText ( grid, row, columnName, "Geschenk", false, false )
			guiGridListSetItemText ( grid, row, columnCount, vnxClientGetElementData ( "presents" ), false, false )
		end
	end
	-- Notebook --
	if vnxClientGetElementData ( "fruitNotebook" ) >= 1 then
		local row = guiGridListAddRow ( grid )
		guiGridListSetItemText ( grid, row, columnName, "Notebook", false, false )
		if vnxClientGetElementData ( "fruitNotebook" ) == 1 then value = "" else value = vnxClientGetElementData ( "fruitNotebook" ) end
		guiGridListSetItemText ( grid, row, columnCount, value, false, false )
	end
	-- Zeitung --
	if vnxClientGetElementData ( "newspaper" ) then
		local row = guiGridListAddRow ( grid )
		guiGridListSetItemText ( grid, row, columnName, "Zeitung", false, false )
		guiGridListSetItemText ( grid, row, columnCount, "", false, false )
	end
	-- Benzin Kanister --
	local Kanister = tonumber ( vnxClientGetElementData ( "benzinkannister" ) )
	if Kanister >= 1 then
		local row = guiGridListAddRow ( grid )
		guiGridListSetItemText ( grid, row, columnName, "Kanister", false, false )
		guiGridListSetItemText ( grid, row, columnCount, tostring ( Kanister ), false, false )
	end
	-- Drogen --
	local drogen = vnxClientGetElementData ( "drugs" )
	if drogen >= 1 then
		local row = guiGridListAddRow ( grid )
		guiGridListSetItemText ( grid, row, columnName, "Drogen", false, false )
		guiGridListSetItemText ( grid, row, columnCount, tostring ( drogen ).." g", false, false )
	end
	-- Koks --
	local kokain = tonumber ( vnxClientGetElementData ( "koks" ) )
	if kokain >= 1 then
		local row = guiGridListAddRow ( grid )
		guiGridListSetItemText ( grid, row, columnName, "Kokain", false, false )
		guiGridListSetItemText ( grid, row, columnCount, tostring ( kokain ).." g", false, false )
	end
	-- Hanfsamen --
	local weed = tonumber ( vnxClientGetElementData ( "flowerseeds" ) )
	if weed >= 1 then
		local row = guiGridListAddRow ( grid )
		guiGridListSetItemText ( grid, row, columnName, "Hanfsamen", false, false )
		guiGridListSetItemText ( grid, row, columnCount, tostring ( weed ), false, false )
	end
	-- Mats --
	local mats = vnxClientGetElementData("mats")
	if mats >= 1 then
		local row = guiGridListAddRow ( grid )
		guiGridListSetItemText ( grid, row, columnName, "Materialien", false, false )
		guiGridListSetItemText ( grid, row, columnCount, tostring ( mats ), false, false )
	end
	-- Würfel --
	local dice = tonumber ( vnxClientGetElementData ( "dice" ) )
	if dice >= 1 then
		local row = guiGridListAddRow ( grid )
		guiGridListSetItemText ( grid, row, columnName, "Wuerfel", false, false )
		guiGridListSetItemText ( grid, row, columnCount, "", false, false )
	end
	-- Zigarretten --
	local zigaretten = tonumber ( vnxClientGetElementData ( "zigaretten" ) )
	if zigaretten >= 1 then
		local row = guiGridListAddRow ( grid )
		guiGridListSetItemText ( grid, row, columnName, "Zigaretten", false, false )
		guiGridListSetItemText ( grid, row, columnCount, tostring ( zigaretten ), false, false )
	end
	-- Chips --
	local chips = tonumber ( vnxClientGetElementData ( "casinoChips" ) )
	if chips >= 1 then
		local row = guiGridListAddRow ( grid )
		guiGridListSetItemText ( grid, row, columnName, "Chips", false, false )
		guiGridListSetItemText ( grid, row, columnCount, tostring ( chips ), false, false )
	end
	-- Hufeisen --
	--local horseshoes = tonumber ( vnxClientGetElementData ( "totalHorseShoes" ) )
	--if horseshoes >= 1 then
	--	local row = guiGridListAddRow ( grid )
	--	guiGridListSetItemText ( grid, row, columnName, "Hufeisen", false, false )
	--		guiGridListSetItemText ( grid, row, columnCount, tostring ( horseshoes ), false, false )
	--end
	-- Orden 1-3 --
	local orden_1 = vnxClientGetElementData ( "armyperm7" )
	local orden_2 = vnxClientGetElementData ( "armyperm8" )
	local orden_3 = vnxClientGetElementData ( "armyperm9" )
	if orden_1 >= 1 or orden_2 >= 1 or orden_3 >= 1 then
		local row = guiGridListAddRow ( grid )
		guiGridListSetItemText ( grid, row, columnName, "Orden", true, false )
		if orden_1 >= 1 then
			local row = guiGridListAddRow ( grid )
			guiGridListSetItemText ( grid, row, columnName, "Ehre", false, false )
			guiGridListSetItemText ( grid, row, columnCount, "", false, false )
		end
		if orden_2 >= 1 then
			local row = guiGridListAddRow ( grid )
			guiGridListSetItemText ( grid, row, columnName, "Luftwaffe", false, false )
			guiGridListSetItemText ( grid, row, columnCount, "", false, false )
		end
		if orden_3 >= 1 then
			local row = guiGridListAddRow ( grid )
			guiGridListSetItemText ( grid, row, columnName, "Verdienst", false, false )
			guiGridListSetItemText ( grid, row, columnCount, "", false, false )
		end
	end
	-- Überschrift --
	for i = 1, 3 do
		if vnxClientGetElementData ( "food"..i ) >= 1 then
			local row = guiGridListAddRow ( grid )
			guiGridListSetItemText ( grid, row, columnName, "Heilung", true, false )
			break
		end
	end
	-- Foodslot 1 --
	local food = tonumber ( vnxClientGetElementData ( "food1" ) )
	if food >= 1 then
		local row = guiGridListAddRow ( grid )
		guiGridListSetItemText ( grid, row, columnName, foodName[food], false, false )
		guiGridListSetItemText ( grid, row, columnCount, "", false, false )
	end
	-- Foodslot 2 --
	local food = tonumber ( vnxClientGetElementData ( "food2" ) )
	if food >= 1 then
		local row = guiGridListAddRow ( grid )
		guiGridListSetItemText ( grid, row, columnName, foodName[food], false, false )
		guiGridListSetItemText ( grid, row, columnCount, "", false, false )
	end
	-- Foodslot 3 --
	local food = tonumber ( vnxClientGetElementData ( "food3" ) )
	if food >= 1 then
		local row = guiGridListAddRow ( grid )
		guiGridListSetItemText ( grid, row, columnName, foodName[food], false, false )
		guiGridListSetItemText ( grid, row, columnCount, "", false, false )
	end
	-- Angelausrüstung --
	if vnxClientGetElementData ( "fishingPole" ) then
		local row = guiGridListAddRow ( grid )
		guiGridListSetItemText ( grid, row, columnName, "Angeltasche", true, false )
		
		local row = guiGridListAddRow ( grid )
		guiGridListSetItemText ( grid, row, columnName, "Angel", false, false )
		guiGridListSetItemText ( grid, row, columnCount, "", false, false )
		
		if vnxClientGetElementData ( "fishingHooks" ) > 0 then
			local row = guiGridListAddRow ( grid )
			guiGridListSetItemText ( grid, row, columnName, "Haken", false, false )
			guiGridListSetItemText ( grid, row, columnCount, vnxClientGetElementData ( "fishingHooks" ), false, false )
		end
		if vnxClientGetElementData ( "fishingWorms" ) > 0 then
			local row = guiGridListAddRow ( grid )
			guiGridListSetItemText ( grid, row, columnName, "Koeder", false, false )
			guiGridListSetItemText ( grid, row, columnCount, vnxClientGetElementData ( "fishingWorms" ), false, false )
		end
		local typ, name, weight
		for i = 65, 67 do
			typ = string.char ( i )
			name = vnxClientGetElementData ( "fishingFish"..typ.."Typ" )
			if tonumber ( name ) then
				if tonumber ( name )>= 1 then
					weight = vnxClientGetElementData ( "fishingFish"..typ.."Weight" )
					local row = guiGridListAddRow ( grid )
					guiGridListSetItemText ( grid, row, columnName, fishNames[name], false, false )
					guiGridListSetItemText ( grid, row, columnCount, tostring ( math.floor ( weight / 10 ) / 100 ), false, false )
				end
			end
		end
	end
	-- Spezialmunnition -- special_ammo.bmp
end