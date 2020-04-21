------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------
---- Script by Noneatme ------

addEvent("zuendePlayerFeuerwerk", true)
local doingPlace = {}

local duration = {
	["Vulkan"] = 20000,
	["Batterie"] = 20000,
	["Rakete"] = 3000,
	["Heuler"] = 2000,
	["Boeller"] = 3000,
}

------------------------------

local function startFeuerwerk(typ, object, thePlayer)
	setElementData(object, "firework:fuse", false)
	triggerClientEvent(getRootElement(), "doNOFeuerwerkStart", getRootElement(), typ, object, duration[typ])
	setTimer(function()
		destroyElement(object)
	end, duration[typ]+60*60*1000, 1)
	setTimer(function()
		local x, y, z = getElementPosition(object)
		local rubbish = createObject(2674, x, y, z+1)
		setTimer(destroyElement,duration[typ]+60*60*1000, 1, rubbish)
	end, duration[typ], 1)
end

addEventHandler("zuendePlayerFeuerwerk", getRootElement(), function(feuerwerk)
	local thePlayer = source
	local typ = feuerwerk
	if(feuerwerk == "Vulkan") then
		doingPlace[thePlayer] = true
		setPedAnimation(thePlayer, "bomber", "BOM_Plant_Loop", -1, true, false, false)
		setTimer(function()
			doingPlace[thePlayer] = false
			setPedAnimation(thePlayer)
			outputChatBox(feuerwerk.." platziert! Das Feuerwerk startet in 5 Sekunden!", thePlayer, 0, 200, 0)
			local x, y, z = getElementPosition(thePlayer)
			local object = createObject(3786, x, y, z-2, 0, 90, 0)
			setElementData(object, "firework:fuse", true)
			setElementCollisionsEnabled(object, false)
			setTimer(startFeuerwerk, 5000, 1, typ, object, thePlayer)
		end, 2000, 1)
	elseif(feuerwerk == "Heuler") then
		doingPlace[thePlayer] = true
		setPedAnimation(thePlayer, "bomber", "BOM_Plant_Loop", -1, true, false, false)
		setTimer(function()
			doingPlace[thePlayer] = false
			setPedAnimation(thePlayer)
			outputChatBox(typ.." platziert! Das Feuerwerk startet in 3 Sekunden!", thePlayer, 0, 200, 0)
			local x, y, z = getElementPosition(thePlayer)
			local object = createObject(3786, x, y, z-2, 0, 90, 0)
			setElementData(object, "firework:fuse", true)
			setElementCollisionsEnabled(object, false)
			setTimer(startFeuerwerk, 3000, 1, typ, object, thePlayer) 
		end, 2000, 1)
	elseif(feuerwerk == "Rakete") then
		doingPlace[thePlayer] = true
		setPedAnimation(thePlayer, "bomber", "BOM_Plant_Loop", -1, true, false, false)
		setTimer(function()
			doingPlace[thePlayer] = false
			setPedAnimation(thePlayer)
			outputChatBox(typ.." platziert! Das Feuerwerk startet in 5 Sekunden!", thePlayer, 0, 200, 0)
			local x, y, z = getElementPosition(thePlayer)
			local object = createObject(3786, x, y, z-2, 0, 90, 0)
			setElementData(object, "firework:fuse", true)
			setElementCollisionsEnabled(object, false)
			setTimer(startFeuerwerk, 5000, 1, typ, object, thePlayer)
		end, 2000, 1)
	elseif(feuerwerk == "Batterie") then
		doingPlace[thePlayer] = true
		setPedAnimation(thePlayer, "bomber", "BOM_Plant_Loop", -1, true, false, false)
		setTimer(function()
			doingPlace[thePlayer] = false
			setPedAnimation(thePlayer)
			outputChatBox(typ.." platziert! Das Feuerwerk startet in 7 Sekunden!", thePlayer, 0, 200, 0)
			local x, y, z = getElementPosition(thePlayer)
			local object = createObject(3786, x, y, z-2, 0, 90, 0)
			setElementData(object, "firework:fuse", true)
			setElementCollisionsEnabled(object, false)
			setTimer(startFeuerwerk, 7000, 1, typ, object, thePlayer)
		end, 2000, 1)
	elseif(feuerwerk == "Boeller") then
		doingPlace[thePlayer] = true
		setPedAnimation(thePlayer, "bomber", "BOM_Plant_Loop", -1, true, false, false)
		setTimer(function()
			doingPlace[thePlayer] = false
			setPedAnimation(thePlayer)
			outputChatBox(typ.." platziert! Das Feuerwerk startet in 3 Sekunden!", thePlayer, 0, 200, 0)
			local x, y, z = getElementPosition(thePlayer)
			local object = createObject(3786, x, y, z-2, 0, 90, 0)
			setElementData(object, "firework:fuse", true)
			setElementCollisionsEnabled(object, false)
			setObjectScale(object, 0.8)
			setTimer(startFeuerwerk, 3000, 1, typ, object, thePlayer)
		end, 2000, 1)
	end
end)
