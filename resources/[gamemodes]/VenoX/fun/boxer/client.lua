-----------------------------------------------
------Made and copyright by (c)Sorginator------
--angepasst für mehrere Spieler & Vio Extended-
------------------by Bonus---------------------
-----------------------------------------------

--Variablen
local box1
local box2
local entwaffnenTimer
local falsevar1 = 100
local falsevar2 = 300
local KampfstyledesBoxers = 4
local timerDreschen = nil

--Events

addEvent("dreschen", true)
addEvent("jih", true)
addEvent("guiBoxenPed", true)

--EventHandler

addEventHandler("jih", getRootElement(), function()	--Dieses Event gibt den Text zur jeweiligen Runde aus
	if vnxClientGetElementData("boxlvl") == 0 then
		outputChatBox("Willkommen in der ersten Runde!", 20, 150, 50)
		outputChatBox("Für die gesamte Zeit des Kampfes gilt: ", 20, 150, 50)
		outputChatBox("Du kannst den Ring innerhalb der ersten 15 Sekunden mit /aufgeben verlassen.", 20, 150, 50)
		outputChatBox("Solltest du ihn danach verlassen oder disconnecten, gilt der Kampf als verloren!", 20, 150, 50)
		outputChatBox("Erledige den Boxer, um die erste Runde für dich zu entscheiden!", 20, 150, 50)
		--falsevar2 = 300
	elseif vnxClientGetElementData("boxlvl") == 1 then
		outputChatBox("Willkommen in der zweiten Runde!", 20, 180, 50)
		outputChatBox("Die Regeln dürften dir bekannt sein!", 20, 180, 50)
		outputChatBox("Besiege den Boxer in dieser Runde, um zur letzten Runde antreten zu können!", 20, 180, 50)
		--falsevar2 = 225
	elseif vnxClientGetElementData("boxlvl") == 2 then
		outputChatBox("Willkommen in der dritten und letzten Runde!", 20, 200, 50)
		outputChatBox("Die Regeln dürften dir bekannt sein!", 20, 200, 50)
		outputChatBox("Besiege den Boxer nun endgültig, um den gesamten Kampf für dich entscheiden zu können!", 20, 200, 50)
		--falsevar2 = 150
	end
end )

addEventHandler("dreschen", getRootElement(), function(bot, abstand)	--Dieses Event lüsst den Boxer auf den Spieler einprügeln
	if (bot) and (abstand) then
		timerDreschen = setTimer ( dreschIhn, tonumber(abstand), 0, bot, source )
	end
end )

function dreschIhn ( bot, ziel )
	if bot and isElement(bot) and getElementType(bot)=="ped" and ziel then
		local x, y, z = getElementPosition(ziel)
		local x1, y1, z1 = getElementPosition(bot)
		local rot = math.atan2(y - y1, x - x1) * 180 / math.pi
		rot = rot-90
		setElementRotation(bot, 0, 0, rot)
		box1 = setTimer(function()
			if bot and isElement(bot) and getElementType(bot)=="ped" and not (bot == 1) then
				setPedControlState(bot, "fire", false)
			end
		end, falsevar1, 1 )
		box2 = setTimer(function()
			if bot and isElement(bot) and getElementType(bot)=="ped" and not (bot == 1) then
				setPedControlState(bot, "fire", true)
			end
		end, falsevar2, 1 )
	elseif isTimer ( timerDreschen ) then
		killTimer ( timerDreschen )
		timerDreschen = nil
	end
end

addEventHandler("guiBoxenPed", getRootElement(),
	function()
		local sWidth, sHeight = guiGetScreenSize()
		local Width,Height = 234,140
		local x = (sWidth/2) - (Width/2)
		local y = (sHeight/2) - (Height/2)
    	local fenster = guiCreateWindow(x, y, Width, Height, "Willkommen beim Boxring", false)
    	guiWindowSetSizable(fenster, false)
    	local Label = guiCreateLabel(73, 24, 98, 15, "Hier kannst du", false, fenster)
    	guiSetFont(Label, "default-bold-small")
    	local Label2 = guiCreateLabel(45, 39, 156, 16, "gegen einen Boxer kümpfen", false, fenster)
    	guiSetFont(Label2, "default-bold-small")
    	local knopf = guiCreateButton(14, 100, 69, 30, "Kampf starten", false, fenster)
    	local knopf2 = guiCreateButton(154, 102, 70, 28, "Abbrechen", false, fenster)	
		guiSetVisible(fenster, true)
		showCursor(true)
		setElementClicked ( true )
		addEventHandler("onClientGUIClick", knopf, function()
			triggerServerEvent("boxenstarten1", root, getLocalPlayer())
			guiSetVisible(fenster, false)
			showCursor(false)
			setElementClicked ( false )
		end )
		addEventHandler("onClientGUIClick", knopf2, function()
			guiSetVisible(fenster, false)
			showCursor(false)
			setElementClicked ( false )
		end )
	end
)