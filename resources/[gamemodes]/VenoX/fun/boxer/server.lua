-----------------------------------------------
------Made and copyright by (c)Sorginator------
--angepasst für mehrere Spieler & Vio Extended-
------------------by Bonus---------------------
-----------------------------------------------

--Variablen
local boxer = {}
local timer1
local dieSpieler = {}
local KampfstyledesBoxers = {}
local istBereitsVoll = false
local variable = {}
local Lebensspeicher = {}
local aufgegeben = {}
local dimension = 1
local dimensionplayer = {}

--Timer
local timer = { }

--Events
addEvent("drehdichBoxer", true)
addEvent("boxenstarten1", true)

--Die Boxer werden erstellt und in den Interior geportet
function botErstellen( player )
	boxer[player] = createPed(81, 758.53125, -1.9306640625, 1001.5942382812, 315) --Boxer 1
	setElementInterior(boxer[player], 5 )
	dimensionplayer[player] = dimension
	dimension = dimension + 1
	setElementDimension(boxer[player], dimensionplayer[player])
end

--Die Marker werden erstellt und in den Interior geportet wenn nötig
local boxArenaBlip = createBlip ( -2455.36328125, -135.8212890625, 25.196598815918, 54, 1 )
local boxMarkerRein = createMarker( -2455.36328125, -135.8212890625, 25.196598815918, "cylinder", 1, 255, 0, 0 )
local boxMarkerRaus = createMarker( 772.2177734375, -4.703125, 999.7786987305, "cylinder", 1, 255, 0, 0 )
local boxMarkerInnenStart = createMarker( 757.1298828125, 5.650390625, 999.7786987305, "cylinder", 1, 255, 0, 0 )
setElementInterior( boxMarkerInnenStart, 5)
setElementInterior( boxMarkerRaus, 5)

--Die Markerevents
addEventHandler("onMarkerHit", boxMarkerRein, function(player, dim)
	if dim then
		setElementInterior(player, 5, 772.2109375, -2.697265625, 1000.729675293 )
		setElementRotation(player, 0, 0, 0 )
		setCameraTarget(player)
	end
end )
addEventHandler("onMarkerHit", boxMarkerRaus, function(player)
	setElementInterior(player, 0, -2458.6494140625, -135.8388671875, 25.947332382202 )
	setElementRotation(player, 0, 0, 90 )
	setCameraTarget(player)
end )

addEventHandler("onMarkerHit", boxMarkerInnenStart, function(player)
	triggerClientEvent(player, "guiBoxenPed", player )
end)

addEventHandler("boxenstarten1", getRootElement(), function(player)
	takeAllWeapons ( player )
	botErstellen( player )
	if not vnxGetElementData(player, "boxlvl") then
		vnxSetElementData(player, "boxlvl", 0)
	end
	if vnxGetElementData(player, "boxlvl") == 2 then
		setPedArmor(boxer[player], 50)
	end
	dieSpieler[player] = true
	Lebensspeicher[player] = getElementHealth(player)
	setElementPosition(player, 763.0126953125, 2.3515625, 1001.5942382812 )
	setElementRotation(player, 0, 0, 130 )
	setElementDimension(player, dimensionplayer[player])
	timer[player] = {}
	timer[player][1] = setTimer( function(player) triggerClientEvent(player,"jih", player ) end, 500, 1, player )
	boxerLebtNochFrage(player)
	spielerLebtNoch(player)
	KampfstyledesBoxers[player] = getPedFightingStyle(player)
	setPedFightingStyle( player, 4 )
	timer[player][2] = setTimer(function(player) dreschBotDresch(boxer[player], player) end, 500, 1, player)
	addEventHandler("onPlayerQuit", player, function() timerkillen2(source) end )
	aufgegeben[player] = true
	timer[player][8] = setTimer(function(player) aufgegeben[player] = false end, 15000, 1, player)
end )

--Die Funktionen
function dreschBotDresch(bot, ziel)		--triggert das Clientseitige Event das den Bot auf einen eindreschen lässt
	if not variable[player] or variable[player] == nil then
		variable[player] = 305
	end
	triggerClientEvent(ziel, "dreschen", ziel, bot, variable[player])
	--timer[ziel][3] = setTimer(dreschBotDresch, variable, 1, bot, ziel )
end

addEventHandler("drehdichBoxer", getRootElement(), function(player, bot)
	if (player) and (bot) then
		local x, y, z = getElementPosition(player)
		local x1, y1, z1 = getElementPosition(bot)
		local rot = math.atan2(y - y1, x - x1) * 180 / math.pi
		rot = rot-90
		setElementRotation(bot, 0, 0, rot)
	end
end )

function boxerLebtNochFrage( player ) --Diese Funktion prüft nach ob der Boxer noch lebt/der spieler gewonnen hat
	if isPedDead(boxer[player]) then
		setTimer(function(player) destroyElement(boxer[player]) boxer[player] = nil end, 500, 1, player)
		timerkillen ( player )
		setPedFightingStyle(player, KampfstyledesBoxers[player])
		setElementPosition( player, 760.6298828125, 5.6533203125, 1000.7082519531 )
		setElementDimension(player, 0)
		setElementFrozen(player, true)
		timer[player][4] = setTimer(setElementFrozen, 2000, 1, player, false)
		setElementHealth(player, Lebensspeicher[player])
		if vnxGetElementData(player, "boxlvl") == 2 then
			vnxSetElementData(player, "boxlvl", 0)
			variable[player] = 305
			outputChatBox("Du hast den Boxkampf gewonnen, und erhültst ein Preisgeld von 800$", player, 0, 200, 10)
			vnxSetElementData(player, "money", vnxGetElementData(player, "money") + 800)
			KampfstyledesBoxers[player] = nil
		elseif vnxGetElementData(player, "boxlvl") == 1 then
			vnxSetElementData(player, "boxlvl", 2)
			variable[player] = 155
			outputChatBox("Gratuliere, du hast auch die zweite Runde gemeistert!",player, 20, 180, 50)
			outputChatBox("Schlage den Boxer noch ein letztes mal, um den endgültigen Sieg zu erringen!",player, 20, 180, 50)
		elseif vnxGetElementData(player, "boxlvl") == 0 then
			vnxSetElementData(player, "boxlvl", 1)
			variable[player] = 230
			outputChatBox("Gratuliere, du hast die erste Runde gemeistert!",player, 20, 150, 50)
			outputChatBox("Gewinnst du auch die anderen beiden Runden, so wartet eine Belohnung auf dich!",player, 20, 150, 50)
		end
		dieSpieler[player] = nil
	else
		timer[player][5] = setTimer(function(player) boxerLebtNochFrage(player) end, 500, 1, player )
	end
end

function spielerLebtNoch(player)
	if getElementHealth(player) < 10 then
		setTimer(function(player) destroyElement(boxer[player]) boxer[player]=nil end, 500, 1, player )
		timerkillen(player)
		setElementPosition( player, 760.6298828125, 5.6533203125, 1000.7082519531 )
		setElementDimension(player, 0)
		setElementFrozen(player, true)
		timer[player][6] = setTimer(setElementFrozen, 2000, 1, player, false)
		setElementHealth(player, Lebensspeicher[player])
		Lebensspeicher[player] = nil
		outputChatBox("Du hast diese Runde leider verloren!", player, 130, 10, 10 )
		outputChatBox("Aber du kannst es jederzeit wieder versuchen.", player, 130, 10, 10 )
		vnxSetElementData(player, "boxlvl", 0)
		dieSpieler[player] = nil
		KampfstyledesBoxers[player] = nil
	else
		timer[player][7] = setTimer(spielerLebtNoch, 300, 1, player )
	end
end

function timerkillen( player )
	for i = 1, 8, 1 do
		if isTimer(timer[player][i]) then
			killTimer(timer[player][i])
		end
	end
	removeEventHandler("onPlayerQuit", player, function() timerkillen2(source) end )
end

function timerkillen2( player )
	for i = 1, 8, 1 do
		if isTimer(timer[player][i]) then
			killTimer(timer[player][i])
		end
	end
	removeEventHandler("onPlayerQuit", player, function() timerkillen2(source) end )
end


addCommandHandler("aufgeben", function(player)
	if dieSpieler[player] ~= nil then
		if aufgegeben[player] == true then
			outputChatBox("Du hast innerhalb der Anfangszeit aufgegeben,", player, 130, 10, 10 )
			outputChatBox("daher wird dieser Kampf nicht als verloren gewertet.", player, 130, 10, 10 )
		else
			outputChatBox("Du hast aufgegeben, und daher den Kampf verloren!", player, 130, 10, 10 )
			vnxSetElementData(player, "boxlvl", 0)
		end
		setTimer(function(player) destroyElement(boxer[player]) boxer[player]=nil end, 500, 1, player )
		timerkillen(player)
		setElementPosition( player, 760.6298828125, 5.6533203125, 1000.7082519531 )
		setElementFrozen(player, true)
		setElementDimension(player, 0)
		timer[player][6] = setTimer(setElementFrozen, 2000, 1, player, false)
		setElementHealth(player, Lebensspeicher[player])
		Lebensspeicher[player] = nil
		dieSpieler[player] = nil
		KampfstyledesBoxers[player] = nil
	end
end )