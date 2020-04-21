------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------
---- Script by Noneatme ------

--outputChatBox("Penis", 0, 200, 0)
local Static = {
    gridlist = {},
    button = {},
    label = {},
    window = {},
}
local cFunc = {}
local Guivar = 0

local item_list = {
	["Vulkan"] = "wn:flimmervulkane",
	["Batterie"] = "wn:batterien",
	["Rakete"] = "wn:raketen",
	["Boeller"] = "wn:boeller",
	["Heuler"] = "wn:heuler",
}

local beschreibung = {
	["Vulkan"] = "Wie der Name schon sagt\nInfo: Zeigt manchmal keine Wirkung!",
	["Batterie"] = "Nicht unter Gebäuden zünden!",
	["Rakete"] = "Nur im Freien verwenden!",
	["Boeller"] = "Lass es krachen!",
	["Heuler"] = "Alte Omas können einen Herzinfarkt dadurch\nbekommen!",
}

cFunc["openGui"] = function()
	Guivar = 1
	showCursor(true)
	--setElementData ( getLocalPlayer(), "ElementClicked", true )
	--guiSetInputMode("no_binds")
	local X, Y, Width, Height = getMiddleGuiPosition(476, 254)
	Static.window[1] = guiCreateWindow(X, Y, Width, Height, "Feuerwerk", false)
	guiWindowSetSizable(Static.window[1], false)

	Static.gridlist[1] = guiCreateGridList(9, 24, 188, 221, false, Static.window[1])
	guiGridListAddColumn(Static.gridlist[1], "Feuerwerk", 0.4)
	guiGridListAddColumn(Static.gridlist[1], "Anzahl", 0.4)
	Static.label[1] = guiCreateLabel(202, 27, 143, 19, "Beschreibung:", false, Static.window[1])
	guiSetFont(Static.label[1], "default-bold-small")
	Static.label[2] = guiCreateLabel(201, 54, 268, 53, "Bitte wähle ein Item aus der Liste aus!", false, Static.window[1])
	guiSetFont(Static.label[2], "default-bold-small")
	Static.button[1] = guiCreateButton(356, 218, 111, 27, "Abbrechen", false, Static.window[1])
	guiSetProperty(Static.button[1], "NormalTextColour", "FFAAAAAA")
	Static.button[2] = guiCreateButton(242, 217, 111, 27, "Benutzen!", false, Static.window[1])
	guiSetProperty(Static.button[2], "NormalTextColour", "FFAAAAAA")
	-- FILL THE LIST --
	
	for index, key in pairs(item_list) do
		local anzahl = tonumber(getElementData(localPlayer, key))
		if(anzahl) and (anzahl > 0) then
			local row = guiGridListAddRow(Static.gridlist[1])
			guiGridListSetItemText(Static.gridlist[1], row, 1, index, false, false)
			guiGridListSetItemText(Static.gridlist[1], row, 2, anzahl, false, false)
		end
	end
	
	guiSetFont(Static.gridlist[1], "default-bold-small")
	-- EVENT HANDLERS --
	
	addEventHandler("onClientGUIClick", Static.gridlist[1], function()
		local text, anzahl = guiGridListGetItemText(source, guiGridListGetSelectedItem(source), 1), tonumber(guiGridListGetItemText(source, guiGridListGetSelectedItem(source), 2))
		if(text ~= "") then
			guiSetText(Static.label[2], beschreibung[text])
		else
			guiSetText(Static.label[2], "Bitte wähle ein Item aus der Liste aus!")
		end
	end, false)
	addEventHandler("onClientGUIClick", Static.button[1], function()
		destroyElement(Static.window[1])
		Guivar = 0
		showCursor(false)
		setElementData ( getLocalPlayer(), "ElementClicked", false )
		ShowSelfClickMenue_func(getLocalPlayer())
		SelfCancelBtn (getLocalPlayer())
	end, false)
	
	addEventHandler("onClientGUIClick", Static.button[2], function()
		local text, anzahl = guiGridListGetItemText(Static.gridlist[1], guiGridListGetSelectedItem(Static.gridlist[1]), 1), tonumber(guiGridListGetItemText(Static.gridlist[1], guiGridListGetSelectedItem(Static.gridlist[1]), 2))
		if(text ~= "") then
			triggerServerEvent("doLAFeuerwerkZuende", localPlayer, text)
			destroyElement(Static.window[1])
			Guivar = 0
			showCursor(false)
			setElementData ( getLocalPlayer(), "ElementClicked", false )
			ShowSelfClickMenue_func(getLocalPlayer())
			SelfCancelBtn (getLocalPlayer())
		end
	end, false)
end


addCommandHandler("feuerwerk", function()
	--if(getCameraTarget() == localPlayer) then
		if(Guivar == 1) then
			destroyElement(Static.window[1])
			Guivar = 0
			showCursor(false)
			setElementData ( getLocalPlayer(), "ElementClicked", false )
			ShowSelfClickMenue_func(getLocalPlayer())
			SelfCancelBtn (getLocalPlayer())
		else
			cFunc["openGui"]()
			setElementData ( getLocalPlayer(), "ElementClicked", true )
			guiSetInputMode("no_binds")
		end
	--end
end)

-- FEUERWERK FUNKTION --

addEvent("doNOFeuerwerkStart", true)

local flimmer_vulkan = {}
local batterie = {}

-- ON Client Render --

addEventHandler("onClientPreRender", getRootElement(), function()
	for index, object in pairs(getElementsByType("object", getRootElement(), true)) do
		-- FUSE --
		if(getElementData(object, "firework:fuse") == true) then
			local x, y, z = getElementPosition(object)
			z = z+0.8
			fxAddSparks(x, y, z, 0, 0, 1, 2, 1, 0, 0, 0, false, 1, 1)
		end
		-- FLIMMERVULKANE
		if(flimmer_vulkan[object] == true) then
			local x, y, z = getElementPosition(object)
			z = z+0.8
			fxAddSparks(x, y, z, 0, 0, 5, 2, 5, 0, 0, 0, false, 1, 5)
			if(getElementData(object, "flimmervulkan:last") == true) then
				fxAddSparks(x, y, z, 0, 0, 5, 2, 5, 0, 0, 0, false, 1, 5)
			end
		end
	end
	for index, car in pairs(getElementsByType("vehicle", getRootElement(), true)) do
		-- BATTEIIREN 
		if(getElementData(car, "batterie:schweif") == true) then
			local x, y, z = getElementPosition(car)
			fxAddTyreBurst(x, y, z, 0.5, 0.5, 0.5)
		end
		if(getElementData(car, "batterie:rocket_spark") == true) then
			local x, y, z = getElementPosition(car)
			fxAddSparks(x, y, z, 0, 0, 1, 2, 5, 0, 0, 0, false, 1, 5)
			fxAddPunchImpact(x, y, z, 2, 2, 2)
			
		end
	end
end)

local function playFireworkSound(x, y, z, filepath)
	local sound = playSound3D(filepath, x, y, z, false)
	setSoundMaxDistance(sound, 100)
	return sound;
end
-- doNOFeuerwerkStart Event

local rand_colors = {
	[1] = {255, 0, 0},
	[2] = {255, 255, 0},
	[3] = {0, 255, 0},
	[4] = {0, 255, 255},
	[5] = {0, 0, 255},
	[6] = {255, 0, 255}
}

local function feuerwerkHandler(typ, object, duration)
	if(typ == "Vulkan") then
		local x, y, z = getElementPosition(object)
		z = z+0.8
		local s = playFireworkSound(x, y, z, "sounds/fireworks/boden_whistle.mp3")
		setSoundVolume(s, 0.8)
		flimmer_vulkan[object] = true
		setTimer(function()
			flimmer_vulkan[object] = false
		end, duration, 1)
		setTimer(function()
			setElementData(object, "flimmervulkan:last", true)
			for i = 1, 20, 1 do
				local time = 500*i
				local r = math.random(0, 1)
				if(r == 0) then
					time = time+math.random(100, 200)
				else
					time = time-math.random(100, 200)
				end
				setTimer(function()
					local x, y, z = getElementPosition(object)
					z = z+0.8
					local ob = createObject(1337, x, y, z)
					setElementCollisionsEnabled(ob, false)
					setObjectScale(ob, 0)
					setElementAlpha(ob, 0)
					local m = createMarker(x, y, z, "corona", 1.0, math.random(100, 255), math.random(100, 255), 0)
					attachElements(m, ob)
					moveObject(ob, 1500, x, y, z+5, 0, 0, 0, "OutQuad")
					setTimer(function()
						destroyElement(m)
						destroyElement(ob)
					end, 1500, 1)
					local s = playFireworkSound(x, y, z, "sounds/fireworks/boden_whistle.mp3")
					setSoundVolume(s, 0.8)
				end, time, 1)
			end
		end, duration/2-duration/5, 1)
	elseif(typ == "Batterie") then
		setTimer(function()
			local x, y, z = getElementPosition(object)
			z = z+0.5
			local s = playFireworkSound(x, y, z, "sounds/fireworks/battery_shot.mp3")
			setSoundVolume(s, 0.8)
			local veh = createVehicle(441, x, y, z)
			setElementAlpha(veh, 0)
			setElementData(veh, "batterie:schweif", true)
			local m = createMarker(x, y, z, "corona", 1.0, 255, 255, 255)
			attachElements(m, veh)
			attachElements(s, veh)
			setElementVelocity(veh, 0, 0, 0.8)
			setTimer(function()
				local x, y, z = getElementPosition(veh)
				destroyElement(veh)
				destroyElement(m)
				
				local s = playFireworkSound(x, y, z, "sounds/fireworks/rocket_explode.mp3")
				setSoundVolume(s, 1)
				setSoundMaxDistance(s, 200)
				for i= 1, 8 do
					local veh = createVehicle(441, x, y, z)
					setElementAlpha(veh, 0)
					setElementData(veh, "batterie:schweif", true)
					local r, g, b = 255, 255, 255
					local rand = math.random(6)
					if(rand == 1) then
						r, g, b = 255, 0, 0
					elseif(rand == 2) then
						r, g, b = 0, 255, 0
					elseif(rand == 3) then
						r, g, b = 0, 0, 255
					elseif(rand == 4) then
						r, g, b = 255, 255, 0
					elseif(rand == 5) then
						r, g, b = 0, 255, 255
					else
						r, g, b = 255, 0, 255
					end
					local m = createMarker(x, y, z, "corona", 3.0, r, g, b, 255)
					local ob2 = createObject(2780, x, y, z)
					setElementCollisionsEnabled(ob2, false)
					setElementAlpha(ob2, 0)
					setObjectScale(ob2, 0)
					setTimer(destroyElement, 3000, 1, ob2)
					attachElements(ob2, veh)
					attachElements(m, veh)
					setElementData(veh, "batterie:schweif", true)
					setElementData(veh, "batterie:rocket_spark", true)
					local newX, newY = getPointFromDistanceRotation(x, y, 2, 360 * (i/8))
					newX = newX
					newY = newY
					setElementVelocity(veh, (newX-x)/7, (newY-y)/7, 0.5)
					createExplosion(x, y, z, 5)
					createExplosion(x, y, z, 4)
					createExplosion(x, y, z, 4)
					setTimer(function()
						destroyElement(veh)
						destroyElement(m)
					end, 3000, 1)
				end
			end, 1500+math.random(50, 200), 1)
		end, duration/10, 10)
	elseif(typ == "Heuler") then
		local x, y, z = getElementPosition(object)
		z = z+0.5
		local s1 = playFireworkSound(x, y, z, "sounds/fireworks/boden_whistle_loud.mp3")
		local s2 = playFireworkSound(x, y, z, "sounds/fireworks/rocket_start.mp3")
		local veh = createVehicle(441, x, y, z)
		attachElements(s1, veh)
		attachElements(s2, veh)
		setElementAlpha(veh, 0)
		setElementData(veh, "batterie:schweif", true)
		setElementData(veh, "batterie:rocket_spark", true)
		local m = createMarker(x, y, z, "corona", 1.0, 255, 200, 200)
		attachElements(m, veh)
		setElementVelocity(veh, 0, 0, 0.9)
		setTimer(function()
			local x, y, z = getElementPosition(veh)
			destroyElement(veh)
			destroyElement(m)
			local s = playFireworkSound(x, y, z, "sounds/fireworks/battery_explode.mp3")
		end, 2000, 1)
	elseif(typ == "Boeller") then
		local x, y, z = getElementPosition(object)
		z = z+0.5
		local m = createObject(2780, x, y, z)
		setObjectScale(m, 0)
		local s = playFireworkSound(x, y, z, "sounds/fireworks/boeller_explosion"..math.random(1, 2)..".mp3")
		setSoundMaxDistance(s, 100)
		setTimer(destroyElement, 200, 1, m)
		fxAddTyreBurst(x, y, z, 0.5, 0.5, 0.5)
		fxAddTyreBurst(x, y, z, 0.5, 0.5, 0.5)
		fxAddSparks(x, y, z, 0, 0, 5, 2, 5, 0, 0, 0, false, 1, 5)
		fxAddSparks(x, y, z, 0, 0, 5, 2, 5, 0, 0, 0, false, 1, 5)
	elseif(typ == "Rakete") then
		local x, y, z = getElementPosition(object)
		z = z+0.5
		local s = playFireworkSound(x, y, z, "sounds/fireworks/rocket_start.mp3")
		setSoundVolume(s, 0.8)
		local veh = createVehicle(441, x, y, z)
		setElementAlpha(veh, 0)
		attachElements(s, veh)
		setElementData(veh, "batterie:schweif", true)
		setElementData(veh, "batterie:rocket_spark", true)
		local random = math.random(1, #rand_colors)
		local m = createMarker(x, y, z, "corona", 1.0, rand_colors[random][1], rand_colors[random][2], rand_colors[random][3])
		attachElements(m, veh)
		setElementVelocity(veh, 0, 0, 0.9)
		setTimer(function()
			local x, y, z = getElementPosition(veh)
			destroyElement(veh)
			destroyElement(m)
				
			local s = playFireworkSound(x, y, z, "sounds/fireworks/rocket_explode.mp3")
			setSoundVolume(s, 1)
			setSoundMaxDistance(s, 200)
			for i= 1, 8 do
				local veh = createVehicle(441, x, y, z)
				setElementAlpha(veh, 0)
				setElementData(veh, "batterie:schweif", true)
				local r, g, b = 255, 255, 255
				local rand = math.random(6)
				if(rand == 1) then
					r, g, b = 255, 0, 0
				elseif(rand == 2) then
					r, g, b = 0, 255, 0
				elseif(rand == 3) then
					r, g, b = 0, 0, 255
				elseif(rand == 4) then
					r, g, b = 255, 255, 0
				elseif(rand == 5) then
					r, g, b = 0, 255, 255
				else
					r, g, b = 255, 0, 255
				end
				local m = createMarker(x, y, z, "corona", 5.0, r, g, b, 255)
				local ob2 = createObject(2780, x, y, z)
				setElementCollisionsEnabled(ob2, false)
				setElementAlpha(ob2, 0)
				setObjectScale(ob2, 0)
				setTimer(destroyElement, 3000, 1, ob2)
				attachElements(ob2, veh)
				attachElements(m, veh)
				setElementData(veh, "batterie:schweif", true)
				setElementData(veh, "batterie:rocket_spark", true)
				local newX, newY = getPointFromDistanceRotation(x, y, 2, 360 * (i/8))
				newX = newX
				newY = newY
				setElementVelocity(veh, (newX-x)/8, (newY-y)/8, 0.5)
				createExplosion(x, y, z, 5)
				createExplosion(x, y, z, 4)
				createExplosion(x, y, z, 5)
				setTimer(function()
					destroyElement(veh)
					destroyElement(m)
				end, 3000, 1)
			end
		end, 2000, 1)
	end
end

addEventHandler("doNOFeuerwerkStart", getLocalPlayer(), function(typ, object, duration)
	feuerwerkHandler(typ, object, duration)
end)

function getPointFromDistanceRotation(x, y, dist, angle)
 
    local a = math.rad(90 - angle);
 
    local dx = math.cos(a) * dist;
    local dy = math.sin(a) * dist;
 
    return x+dx, y+dy;
 
end

function findRotation(x1,y1,x2,y2)
 
  local t = -math.deg(math.atan2(x2-x1,y2-y1))
  if t < 0 then t = t + 360 end;
  return t;
 
end

