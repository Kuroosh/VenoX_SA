------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------
---- Script by Noneatme ------

-- VAIRABLEN --
local cSetting = {}
local cFunc = {}

cSetting["guiEnabled"] = false

local Static = {
    gridlist = {},
    button = {},
    staticimage = {},
    window = {},
}

cSetting["objektIds"] = {
	["Tisch"] = 1281, -- Parktable
	["Licht"] = 1215, -- Bollardlight
	["Kaktus"] = {650, 651, 653}, -- Zufallskaktus: local kaktusid = cSetting["objektIds"]["Kaktus"][math.random(1, 3)]
	["Tannenbaum"] = 882, -- Dynamischer Baum
	["Palme"] = 628, -- Dynamischer Palme
}

cSetting["elementData"] = {
	["Tisch"] = "wn:tische",
	["Licht"] = "wn:lichter",
	["Kaktus"] = "wn:kakteen",
	["Tannenbaum"] = "wn:tannenbaeume",
	["Palme"] = "wn:palmen",

}

cSetting["cobject"] = false
cSetting["buildMode"] = false
cSetting["lastx"] = 0
cSetting["lasty"] = 0

cSetting["rotation"] = false

cFunc["refreshCursor"] = function()
	showCursor(true)
	--[[
	outputChatBox(cx)
	local x2, y2, z2 = getElementPosition(cSetting["cobject"])
	local x, y, z = getWorldFromScreenPosition(cx, cy, getGroundPosition(cx, cy, z2))
	setElementPosition(cSetting["cobject"], x, y, z)
	]]
	if(cSetting["rotation"] == false) then
		sx, sy, x, y, z = getCursorPosition ()
		local px, py, pz = getCameraMatrix()
		bool, nx, ny, nz, hit = processLineOfSight ( px, py, pz, x, y, z, true, true, false )
		nz = nz + 3
		bool, nx, ny, nz, hit = processLineOfSight ( nx, ny, nz, x, y, z, true, true, false )
		nz = nz + 3
		bool, nx, ny, nz, hit = processLineOfSight ( nx, ny, nz, x, y, z, true, true, false )
		if not bool then
			nx, ny, nz = x, y, z
		end
		setElementPosition ( cSetting["cobject"], nx, ny, nz + getElementDistanceFromCentreOfMassToBaseOfModel(cSetting["cobject"] ))
	else
		local sx, sy, cx, cy, cz = getCursorPosition ()
		local x, y, z = getElementPosition ( cSetting["cobject"] )
		local rx, ry, rz = getElementRotation ( cSetting["cobject"] )
		rz = findRotation ( cx, cy, x, y )
		setElementRotation ( cSetting["cobject"], rx, ry, rz )
	end
end

cFunc["applyClientObject"] = function(id, x, y, z)
	local x, y, z = getElementPosition(localPlayer)
	
	if(isElement(cSetting["cobject"])) then
		return;
	end
	setElementAlpha(localPlayer, 0)
	cSetting["cobject"] = createObject(id, x, y, z)
	setCameraMatrix(x, y, z+20, x, y, z)
	setElementCollisionsEnabled(cSetting["cobject"], false)
	addEventHandler("onClientRender", getRootElement(), cFunc["refreshCursor"])
	showCursor(true)
	toggleAllControls(false)
	cSetting["rotation"] = false
	cSetting["buildMode"] = true
end

addEventHandler ( "onClientClick", getRootElement(), function (btn, state)
	if(btn == "left") and (state == "down") then
		if(isElement(cSetting["cobject"])) then
			if(cSetting["rotation"] == false) then
				cSetting["rotation"] = true
			else
				local id = getElementModel(cSetting["cobject"])
				local x, y, z = getElementPosition(cSetting["cobject"])
				local rx, ry, rz = getElementRotation(cSetting["cobject"])
				destroyElement(cSetting["cobject"])
				removeEventHandler("onClientRender", getRootElement(), cFunc["refreshCursor"])
				setCameraTarget(localPlayer)
				setElementAlpha(localPlayer, 255)
				showCursor(false)
				toggleAllControls(true)
				local groundMaterial = getGroundMaterial(x, y, z)
				cSetting["buildMode"] = false
				if(groundMaterial == 1) or (groundMaterial == 2) or (groundMaterial == 3) then
					outputChatBox("Du kannst dieses Objekt nicht auf Asphalt platzieren!", 255, 0, 0)
					return;
				end
				triggerServerEvent("doPlayerPlaceObject", localPlayer, id, x, y, z, rx, ry, rz)
			end
		end
	end
end)
	
cFunc["buildGui"] = function()
	if(cSetting["guiEnabled"] == false) and (cSetting["buildMode"] == false) then
		cSetting["guiEnabled"] = true
		showCursor(true)
		setElementData ( getLocalPlayer(), "ElementClicked", true )
	
		local X, Y, Width, Height = getMiddleGuiPosition(375, 215)
	--[[ 
		GUIS Beim Starten der Resource zu Erstellen ist das Beschissenste was man machen kann,
		weil dann der CPU am Anfang jedes Gui Erstellen muss, und das ziehmlich auf die Performance geht.
		= Daulerlaggen am Anfang, wie bei Vio
	]]
		Static.window[1] = guiCreateWindow(X, Y, Width, Height, "Platzierbare Objekte", false)
		guiWindowSetSizable(Static.window[1], false)

		Static.gridlist[1] = guiCreateGridList(9, 23, 171, 183, false, Static.window[1])
		guiGridListAddColumn(Static.gridlist[1], "Name", 0.6)
		guiGridListAddColumn(Static.gridlist[1], "Anzahl", 0.2)
		Static.staticimage[1] = guiCreateStaticImage(186, 25, 180, 129, "images/weihnachten/Tisch.jpg", false, Static.window[1])
		Static.button[1] = guiCreateButton(187, 162, 81, 35, "Platzieren", false, Static.window[1])
		guiSetFont(Static.button[1], "default-bold-small")
		guiSetProperty(Static.button[1], "NormalTextColour", "FFAAAAAA")
		Static.button[2] = guiCreateButton(277, 162, 81, 35, "Abbrechen", false, Static.window[1])
		guiSetFont(Static.button[2], "default-bold-small")
		guiSetProperty(Static.button[2], "NormalTextColour", "FFAAAAAA")
		
		-- GRIDLIST --
		for name, data in pairs(cSetting["elementData"]) do
			local anzahl = tonumber(getElementData(localPlayer, data))
			if(anzahl > 0) then
				local row = guiGridListAddRow(Static.gridlist[1])
				guiGridListSetItemText(Static.gridlist[1], row, 1, name, false, false)
				guiGridListSetItemText(Static.gridlist[1], row, 2, anzahl, false, false)
			end
		end
		guiSetFont(Static.gridlist[1], "default-bold-small")
		-- EVENT HANDLERS --
		
		-- GRIDLIST --
		addEventHandler("onClientGUIClick", Static.gridlist[1], function()
			local text = guiGridListGetItemText(source, guiGridListGetSelectedItem(source), 1)
			if(fileExists("images/weihnachten/"..text..".jpg")) then
				guiStaticImageLoadImage(Static.staticimage[1], "images/weihnachten/"..text..".jpg") 
			end
		end, false)
		-- PLATZIEREN --
		addEventHandler("onClientGUIClick", Static.button[1], function()
			local text = guiGridListGetItemText(Static.gridlist[1], guiGridListGetSelectedItem(Static.gridlist[1]), 1)
			if(text ~= "") then
				local id = cSetting["objektIds"][text]
				if(type(id) == "table") then
					id = cSetting["objektIds"]["Kaktus"][math.random(1, 3)]
				end
				if(isPedInVehicle(localPlayer)) or (getElementInterior(localPlayer) ~= 0) or (isElement(cSetting["cobject"])) then
					return
				end;
				cFunc["applyClientObject"](id, x, y, z)
			--	outputChatBox(id)
			--	triggerServerEvent("doPlayerPlaceObject", localPlayer, text, id)
				destroyElement(Static.window[1])
			--	 Nie guiSetVisible() verwenden, dann hat man irgendwann 10000 Unsichtbare Fenster
				cSetting["guiEnabled"] = false
				showCursor(false)
				setElementData ( getLocalPlayer(), "ElementClicked", false )
			end
		end, false)
		-- CANCEL --
		addEventHandler("onClientGUIClick", Static.button[2], function()
			destroyElement(Static.window[1])
		--	Nie guiSetVisible() verwenden, dann hat man irgendwann 10000 Unsichtbare Fenster
			cSetting["guiEnabled"] = false
			showCursor(false)
			setElementData ( getLocalPlayer(), "ElementClicked", false )
		end, false)
	end
end


addCommandHandler("objekte", function()
	if(cSetting["guiEnabled"] == false) then
		cFunc["buildGui"]()
	else
		destroyElement(Static.window[1])
		cSetting["guiEnabled"] = false
		showCursor(false)
	end
end)


function getGroundMaterial(x, y, z)
	local hit, hitX, hitY, hitZ, hitElement, normalX, normalY, normalZ, material = 
		processLineOfSight(x, y, z, x, y, z-10, true, false, false, true, false, false, false, false, nil)
	return material
end

function findRotation(x1,y1,x2,y2)
 
  local t = -math.deg(math.atan2(x2-x1,y2-y1))
  if t < 0 then t = t + 360 end;
  return t;
 
end
