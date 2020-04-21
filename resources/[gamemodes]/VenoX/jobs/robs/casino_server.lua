------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
-------- 2012 - 2013 ---------
------------------------------
------ Script by CreeD -------

local x1, y1, z1 = 1658.495, 2250.2121, 11.07
--createBlip (x1, y1, z1, 25, 2, 255, 0, 0, 255, 0, 200, getRootElement() )

local casinodim = 1
local gomarker = createMarker(x1, y1, z1, 'corona', 1.5, 255, 0, 0, 150)
local outmarker = createMarker(2147.03, 1603.07, 1006.200012207, 'corona', 2, 255, 0, 0, 150)
setElementInterior(outmarker, 1)
setElementDimension(outmarker, casinodim)
local bombmarker = createMarker(2145.1000976563, 1624.3000488281, 993.70001220703, 'cylinder', 5, 255, 0, 0, 0)
setElementInterior(bombmarker, 1)
setElementDimension(bombmarker, casinodim)
local tresor = createObject(2634, 2144.1999511719, 1626.9000244141, 994.29998779297, 0, 0, 180)
setElementInterior(tresor, 1)
setElementDimension(tresor, casinodim)
local tor1 = createObject(3089, 2149, 1604.5999755859, 1002.40012207, 0, 0, 180)
setElementInterior(tor1, 1)
setElementDimension(tor1, casinodim)
local tor2 = createObject(3089, 2149.8000488281, 1602.0999755859, 1002.3223266602, 0, 0, 90)
setElementInterior(tor2, 1)
setElementDimension(tor2, casinodim)
local tor3 = createObject(14638, 2147.0500976563, 1604.5999755859, 1004.9000244141, 0, 0, 270)
setElementInterior(tor3, 1)
setElementDimension(tor3, casinodim)
local tor4 = createObject(9823, 2147.6999511719, 1604.9000244141, 1007, 0, 0, 270)
setElementInterior(tor4, 1)
setElementDimension(tor4, casinodim)
setElementAlpha(tor4, 0)
local geld2 = createObject(1550, 2143.3000488281, 1641.5, 993, 0, 0, 30)
local geld3 = createObject(1550, 2143.6999511719, 1642.3000488281, 993, 0, 0, 196)
local geld4 = createObject(1550, 2143.8000488281, 1641.6999511719, 993, 0, 0, 250)
local geld5 = createObject(1550, 2143.1000976563, 1642.1999511719, 993, 0, 0, 320)
local geld6 = createObject(1550, 2142.6999511719, 1641.6999511719, 993, 0, 0, 245)
local geld7 = createObject(1550, 2142.6000976563, 1642.4000244141, 993, 0, 0, 320)
local geld8 = createObject(1550, 2143.5, 1641.9000244141, 993.29998779297)
local geld9 = createObject(1550, 2143, 1641.9000244141, 993.20001220703)
local geld10 = createObject(1550, 2143, 1642.5, 993.5)
local geld11 = createObject(1550, 2143.3000488281, 1642.6999511719, 993.29998779297)
local geld12 = createObject(1550, 2143.8000488281, 1642.6999511719, 993)
local geld13 = createObject(1550, 2143.8999023438, 1642.0999755859, 993)
local geld14 = createObject(1550, 2142.6999511719, 1642, 993)
local geld15 = createObject(1550, 2143, 1641.5999755859, 993)
setElementInterior(geld2, 1)
setElementInterior(geld3, 1)
setElementInterior(geld4, 1)
setElementInterior(geld5, 1)
setElementInterior(geld6, 1)
setElementInterior(geld7, 1)
setElementInterior(geld8, 1)
setElementInterior(geld9, 1)
setElementInterior(geld10, 1)
setElementInterior(geld11, 1)
setElementInterior(geld12, 1)
setElementInterior(geld13, 1)
setElementInterior(geld14, 1)
setElementInterior(geld15, 1)
setElementDimension(geld2, casinodim)
setElementDimension(geld3, casinodim)
setElementDimension(geld4, casinodim)
setElementDimension(geld5, casinodim)
setElementDimension(geld6, casinodim)
setElementDimension(geld7, casinodim)
setElementDimension(geld8, casinodim)
setElementDimension(geld9, casinodim)
setElementDimension(geld10, casinodim)
setElementDimension(geld11, casinodim)
setElementDimension(geld12, casinodim)
setElementDimension(geld13, casinodim)
setElementDimension(geld14, casinodim)
setElementDimension(geld15, casinodim)
local robstate = "frei"
local robfaction

local function warpin(hitElement, dim)
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isEvil( hitElement ) then
			setElementInterior(hitElement, 1, 2147.925, 1600.579, 1005.46)
			setElementDimension(hitElement, 1)
			vnxSetElementData ( hitElement, "isinRob", true )
			outputLog ( "[CASINO]: Verbrecher "..getPlayerName(hitElement).." hat das Casino betreten!", "bad")
		elseif isOnStateDuty ( hitElement ) then
			setElementInterior(hitElement, 1, 2147.925, 1600.579, 1005.46)
			setElementDimension(hitElement, 1)
			outputLog ( "[CASINO]: Beamter "..getPlayerName(hitElement).." hat das Casino betreten!", "bad")
		else
			outputChatBox ( "Du bist nicht befugt!", hitElement, 175, 0, 0 )
		end
	end
end
end
addEventHandler("onMarkerHit", gomarker, warpin)

local function warpout(hitElement, dim)
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		setElementInterior(hitElement, 0, 1658.565, 2252.468, 11.07)
		setElementDimension(hitElement, 0)
		vnxSetElementData ( hitElement, "isinRob", false )
		if isEvil(hitElement) then
			outputLog ( "[CASINO]: Verbrecher "..getPlayerName(player).." hat das Casino verlassen!", "bad")
		else
			outputLog ( "[CASINO]: Beamter "..getPlayerName(player).." hat das Casino verlassen!", "bad")
		end
	end
end
end
addEventHandler("onMarkerHit", outmarker, warpout)

local function robinfo(hitElement, dim)
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		outputChatBox("[INFO]: Gebe hier /robcasino ein, um das Casino auszurauben!", hitElement, 200, 200, 0)
		outputChatBox("[INFO]: /defuse um die Bombe zu entschärfen!", hitElement, 200, 120, 0)
	end
end
end
addEventHandler("onMarkerHit", bombmarker, robinfo)

local function rob(player)
local pdim = getElementDimension(player)
if pdim == casinodim then
	if isElementWithinMarker(player, bombmarker) then
		if isEvil( player ) then
			if robstate == "frei" then	
				local msg = "[ILLEGAL]: Das Casino wird überfallen!"
				local fraktion = vnxGetElementData (player, "fraktion")
				robfaction = fraktion
				sendMSGForFaction ( msg, 1, 200, 0, 0 )
				if robfaction ~= 2 then
					sendMSGForFaction ( msg, 2, 200, 200, 0 )
				end
				sendMSGForFaction ( msg, 3, 200, 0, 0 )
				sendMSGForFaction ( msg, 6, 200, 0, 0 )
				if robfaction ~= 7 then
					sendMSGForFaction ( msg, 7, 200, 200, 0 )
				end
				sendMSGForFaction ( msg, 8, 200, 0, 0 )
				if robfaction ~= 9 then
					sendMSGForFaction ( msg, 9, 200, 200, 0 )
				end
				if robfaction ~= 10 then
					sendMSGForFaction ( msg, 10, 200, 200, 0 )
				end
				sendMSGForFaction ( msg, robfaction, 0, 150, 0 )
				outputLog ( "[CASINO]: "..getPlayerName(player).." ("..robfaction..") ueberfaellt das Casino!", "bad")
				dynamit = createObject(1654, 2144.3000488281, 1625.5, 992.85)
				setElementInterior(dynamit, 1)
				setElementDimension(dynamit, 1)
				outputChatBox("[AUFGABE]: Das Dynamit geht in 7 Minuten hoch. Bleibe solange hier und bewache es!", player, 0, 100, 200)
				setTimer(sechsmins, 60000, 1)
				--laSetElementData ( player, "wanteds", laGetElementData ( player, "wanteds" ) + 3 )
				setPlayerWantedLevel ( player, vnxGetElementData ( player, "wanteds" ) )
				defusemarker = createMarker(2145.1000976563, 1624.3000488281, 993.70001220703, 'cylinder', 5)
				setElementAlpha(defusemarker, 0)
				setElementInterior(defusemarker, 1)
				setElementDimension(defusemarker, 1)
				robstate = "ausstehend"
				bombe = "fertig"
			else
				outputChatBox ( "Du musst noch warten!", player, 175, 0, 0 )
			end
		else
			outputChatBox ( "Du bist nicht befugt!", player, 200, 0, 0 )
		end
	end
end
end
addCommandHandler("robcasino", rob)

function sechsmins()
	if bombe == "fertig" then
	local msg = "[CASINO]: Das Dynamit geht in 6 Minuten hoch!"
	
	sendMSGForFaction ( msg, 1, 100, 100, 255 )
	sendMSGForFaction ( msg, 2, 100, 100, 255 )
	sendMSGForFaction ( msg, 3, 100, 100, 255 )
	sendMSGForFaction ( msg, 6, 100, 100, 255 )
	sendMSGForFaction ( msg, 7, 100, 100, 255 )
	sendMSGForFaction ( msg, 8, 100, 100, 255 )
	sendMSGForFaction ( msg, 9, 100, 100, 255 )
	sendMSGForFaction ( msg, 10, 100, 100, 255 )
	setTimer(fuenfmins, 60000, 1)
	end
end

function fuenfmins()
	if bombe == "fertig" then
	local msg = "[CASINO]: Das Dynamit geht in 5 Minuten hoch!"
	sendMSGForFaction ( msg, 1, 100, 100, 255 )
	sendMSGForFaction ( msg, 2, 100, 100, 255 )
	sendMSGForFaction ( msg, 3, 100, 100, 255 )
	sendMSGForFaction ( msg, 6, 100, 100, 255 )
	sendMSGForFaction ( msg, 7, 100, 100, 255 )
	sendMSGForFaction ( msg, 8, 100, 100, 255 )
	sendMSGForFaction ( msg, 9, 100, 100, 255 )
	sendMSGForFaction ( msg, 10, 100, 100, 255 )
	setTimer(viermins, 60000, 1)
	end
end

function viermins()
	if bombe == "fertig" then
	local msg = "[CASINO]: Das Dynamit geht in 4 Minuten hoch!"
	sendMSGForFaction ( msg, 1, 100, 100, 255 )
	sendMSGForFaction ( msg, 2, 100, 100, 255 )
	sendMSGForFaction ( msg, 3, 100, 100, 255 )
	sendMSGForFaction ( msg, 6, 100, 100, 255 )
	sendMSGForFaction ( msg, 7, 100, 100, 255 )
	sendMSGForFaction ( msg, 8, 100, 100, 255 )
	sendMSGForFaction ( msg, 9, 100, 100, 255 )
	sendMSGForFaction ( msg, 10, 100, 100, 255 )
	setTimer(dreimins, 60000, 1)
	end
end

function dreimins()
	if bombe == "fertig" then
	local msg = "[CASINO]: Das Dynamit geht in 3 Minuten hoch!"
	sendMSGForFaction ( msg, 1, 100, 100, 255 )
	sendMSGForFaction ( msg, 2, 100, 100, 255 )
	sendMSGForFaction ( msg, 3, 100, 100, 255 )
	sendMSGForFaction ( msg, 6, 100, 100, 255 )
	sendMSGForFaction ( msg, 7, 100, 100, 255 )
	sendMSGForFaction ( msg, 8, 100, 100, 255 )
	sendMSGForFaction ( msg, 9, 100, 100, 255 )
	sendMSGForFaction ( msg, 10, 100, 100, 255 )
	setTimer(zweimins, 60000, 1)
	end
end

function zweimins()
	if bombe == "fertig" then
	local msg = "[CASINO]: Das Dynamit geht in 2 Minuten hoch!"
	sendMSGForFaction ( msg, 1, 100, 100, 255 )
	sendMSGForFaction ( msg, 2, 100, 100, 255 )
	sendMSGForFaction ( msg, 3, 100, 100, 255 )
	sendMSGForFaction ( msg, 6, 100, 100, 255 )
	sendMSGForFaction ( msg, 7, 100, 100, 255 )
	sendMSGForFaction ( msg, 8, 100, 100, 255 )
	sendMSGForFaction ( msg, 9, 100, 100, 255 )
	sendMSGForFaction ( msg, 10, 100, 100, 255 )
	setTimer(einemin, 60000, 1)
	end
end

function einemin()
	if bombe == "fertig" then
	local msg = "[CASINO]: Das Dynamit geht in 1 Minute hoch!"
	sendMSGForFaction ( msg, 1, 100, 100, 255 )
	sendMSGForFaction ( msg, 2, 100, 100, 255 )
	sendMSGForFaction ( msg, 3, 100, 100, 255 )
	sendMSGForFaction ( msg, 6, 100, 100, 255 )
	sendMSGForFaction ( msg, 7, 100, 100, 255 )
	sendMSGForFaction ( msg, 8, 100, 100, 255 )
	sendMSGForFaction ( msg, 9, 100, 100, 255 )
	sendMSGForFaction ( msg, 10, 100, 100, 255 )
	setTimer(countdown, 50000, 1)
	end
end

function countdown()
	if bombe == "fertig" then
	local msg = "[CASINO]: Das Dynamit geht in 10 Sekunden hoch!"
	sendMSGForFaction ( msg, 1, 100, 100, 255 )
	sendMSGForFaction ( msg, 2, 100, 100, 255 )
	sendMSGForFaction ( msg, 3, 100, 100, 255 )
	sendMSGForFaction ( msg, 6, 100, 100, 255 )
	sendMSGForFaction ( msg, 7, 100, 100, 255 )
	sendMSGForFaction ( msg, 8, 100, 100, 255 )
	sendMSGForFaction ( msg, 9, 100, 100, 255 )
	sendMSGForFaction ( msg, 10, 100, 100, 255 )
	setTimer(victoryrob, 10000, 1)
	end
end

function victoryrob()
	if bombe == "fertig" then
	destroyElement(dynamit)
	triggerClientEvent("onBombe", getRootElement())
	local msg = "[CASINO]: Der Tresorraum wurde aufgesprengt!"
	local fraktion = vnxGetElementData (player, "fraktion")
	robfaction = fraktion
	sendMSGForFaction ( msg, 1, 200, 0, 0 )
	if robfaction ~= 2 then
		sendMSGForFaction ( msg, 2, 200, 200, 0 )
	end
	sendMSGForFaction ( msg, 3, 200, 0, 0 )
	sendMSGForFaction ( msg, 6, 200, 0, 0 )
	if robfaction ~= 7 then
		sendMSGForFaction ( msg, 7, 200, 200, 0 )
	end
		sendMSGForFaction ( msg, 8, 200, 0, 0 )
	if robfaction ~= 9 then
		sendMSGForFaction ( msg, 9, 200, 200, 0 )
	end
	if robfaction ~= 10 then
		sendMSGForFaction ( msg, 10, 200, 200, 0 )
	end
	sendMSGForFaction ( msg, robfaction, 0, 150, 0 )
	outputLog ( "[CASINO]: Der Tresorraum wurde aufgesprengt!", "bad")
	moveObject(tresor, 1, 2146.1000976563, 1628.8000488281, 993.5, 59.195983886719, 0, 42)
	stealmarker = createMarker(2141.8000488281, 1641.9000244141, 992.59997558594, 'cylinder', 1, 255, 0, 0)
	setElementInterior(stealmarker, 1)
	setElementDimension(stealmarker, 1)
		function beendet(hitElement, dim)
		if getElementType(hitElement) == "player" and (dim) then
			if robstate == "ausstehend" then
				if isEvil( hitElement ) then
					local anzahlState = 0
					for index, player in pairs(getElementsByType("player")) do
						if(isOnStateDuty(player)) then
							anzahlState = anzahlState + 1
						end
					end
					local pricey = 10000
					local pricemultiplier = anzahlState * 5000
					local pricebrutto = pricey + pricemultiplier
					if pricebrutto > 100000 then
						pricebrutto = 100000
					end
					vnxSetElementData ( hitElement, "money", vnxGetElementData ( hitElement, "money" ) + pricebrutto )
					outputChatBox("Du hast das Casino erfolgreich ausgeraubt! Verschwinde jetzt von hier!", hitElement, 0, 200, 0)
					local praefix = "Staatsbeamte im Dienst sind"
					if anzahlState == 1 then
						praefix = "Staatsbeamter im Dienst ist"
					end
					outputChatBox("Da "..anzahlState.." "..praefix..", hast du "..pricebrutto.." erbeutet.", hitElement, 0, 200, 0)
					anzahlState = 0
					local fraktion = vnxGetElementData(hitElement, "fraktion")
					outputLog ( "[CASINO]: "..getPlayerName(hitElement).." ("..fraktion..") hat im Casino "..pricebrutto.."$ erbeutet ("..anzahlState.." Beamte)", "bad")
					local msg = "[ILLEGAL]: Das Casino wurde erfolgreich überfallen!"
					sendMSGForFaction ( msg, 1, 200, 0, 0 )
					if robfaction ~= 2 then
						sendMSGForFaction ( msg, 2, 200, 200, 0 )
					end
					sendMSGForFaction ( msg, 3, 200, 0, 0 )
					sendMSGForFaction ( msg, 6, 200, 0, 0 )
					if robfaction ~= 7 then
						sendMSGForFaction ( msg, 7, 200, 200, 0 )
					end
					sendMSGForFaction ( msg, 8, 200, 0, 0 )
					if robfaction ~= 9 then
						sendMSGForFaction ( msg, 9, 200, 200, 0 )
					end
					if robfaction ~= 10 then
						sendMSGForFaction ( msg, 10, 200, 200, 0 )
					end
					sendMSGForFaction ( msg, robfaction, 0, 150, 0 )
				else
					outputChatBox("Du hast das Casino erfolgreich beschützt!", hitElement, 0, 200, 0)
					local fraktion = vnxGetElementData(hitElement, "fraktion")
					outputLog ( "[CASINO]: "..getPlayerName(hitElement).." ("..fraktion..") hat das Casino erfolgreich beschuetzt!", "bad")
					local anzahlState = 0
					for index, player in pairs(getElementsByType("player")) do
						if(isOnStateDuty(player)) then
							anzahlState = anzahlState + 1
						end
					end
					local pricey = 10000
					local pricemultiplier = anzahlState * 5000
					local pricebrutto = pricey + pricemultiplier
					if pricebrutto > 100000 then
						pricebrutto = 100000
					end
					vnxSetElementData ( hitElement, "boni", vnxGetElementData ( hitElement, "boni" ) + (pricebrutto/200) )
					outputChatBox("Du hast das Casino beschützt! Du kriegst "..(pricebrutto/200).."$ Bonus beim nächsten Payday!", hitElement, 0, 150, 0)
					local msg = "[ILLEGAL]: Das Casino wurde beschützt!"
					sendMSGForFaction ( msg, 1, 0, 150, 0 )
					if robfaction ~= 2 then
						sendMSGForFaction ( msg, 2, 200, 200, 0 )
					end
					sendMSGForFaction ( msg, 3, 0, 150, 0 )
					sendMSGForFaction ( msg, 6, 0, 1500, 0 )
					if robfaction ~= 7 then
						sendMSGForFaction ( msg, 7, 200, 200, 0 )
					end
					sendMSGForFaction ( msg, 8, 0, 150, 0 )
					if robfaction ~= 9 then
						sendMSGForFaction ( msg, 9, 200, 200, 0 )
					end
					if robfaction ~= 10 then
						sendMSGForFaction ( msg, 10, 200, 200, 0 )
					end
					sendMSGForFaction ( msg, robfaction, 200, 0, 0 )
				end
			destroyElement(geld2)
			destroyElement(geld3)
			destroyElement(geld4)
			destroyElement(geld5)
			destroyElement(geld6)
			destroyElement(geld7)
			destroyElement(geld8)
			destroyElement(geld9)
			destroyElement(geld10)
			destroyElement(geld11)
			destroyElement(geld12)
			destroyElement(geld13)
			destroyElement(geld14)
			destroyElement(geld15)
			destroyElement(stealmarker)
			robstate = "beendet"
			setTimer(restart, 7200000, 1)
			robfaction = nil
			end
		end
		end
		addEventHandler("onMarkerHit", stealmarker, beendet)
		function restart()
			geld2 = createObject(1550, 2143.3000488281, 1641.5, 993, 0, 0, 30)
			geld3 = createObject(1550, 2143.6999511719, 1642.3000488281, 993, 0, 0, 196)
			geld4 = createObject(1550, 2143.8000488281, 1641.6999511719, 993, 0, 0, 250)
			geld5 = createObject(1550, 2143.1000976563, 1642.1999511719, 993, 0, 0, 320)
			geld6 = createObject(1550, 2142.6999511719, 1641.6999511719, 993, 0, 0, 245)
			geld7 = createObject(1550, 2142.6000976563, 1642.4000244141, 993, 0, 0, 320)
			geld8 = createObject(1550, 2143.5, 1641.9000244141, 993.29998779297)
			geld9 = createObject(1550, 2143, 1641.9000244141, 993.20001220703)
			geld10 = createObject(1550, 2143, 1642.5, 993.5)
			geld11 = createObject(1550, 2143.3000488281, 1642.6999511719, 993.29998779297)
			geld12 = createObject(1550, 2143.8000488281, 1642.6999511719, 993)
			geld13 = createObject(1550, 2143.8999023438, 1642.0999755859, 993)
			geld14 = createObject(1550, 2142.6999511719, 1642, 993)
			geld15 = createObject(1550, 2143, 1641.5999755859, 993)
			setElementInterior(geld2, 1)
			setElementInterior(geld3, 1)
			setElementInterior(geld4, 1)
			setElementInterior(geld5, 1)
			setElementInterior(geld6, 1)
			setElementInterior(geld7, 1)
			setElementInterior(geld8, 1)
			setElementInterior(geld9, 1)
			setElementInterior(geld10, 1)
			setElementInterior(geld11, 1)
			setElementInterior(geld12, 1)
			setElementInterior(geld13, 1)
			setElementInterior(geld14, 1)
			setElementInterior(geld15, 1)
			setElementDimension(geld2, 1)
			setElementDimension(geld3, 1)
			setElementDimension(geld4, 1)
			setElementDimension(geld5, 1)
			setElementDimension(geld6, 1)
			setElementDimension(geld7, 1)
			setElementDimension(geld8, 1)
			setElementDimension(geld9, 1)
			setElementDimension(geld10, 1)
			setElementDimension(geld11, 1)
			setElementDimension(geld12, 1)
			setElementDimension(geld13, 1)
			setElementDimension(geld14, 1)
			setElementDimension(geld15, 1)
			destroyElement ( tresor )
			tresor = createObject(2634, 2144.1999511719, 1626.9000244141, 994.29998779297, 0, 0, 180)
			setElementInterior(tresor, 1)
			setElementDimension(tresor, 1)
			robstate = "frei"
			local msg = "[INFO]: Das Casino hat sich von dem Überfall erholt."
			sendMSGForFaction ( msg, 1, 50, 50, 100 )
			sendMSGForFaction ( msg, 2, 50, 50, 100 )
			sendMSGForFaction ( msg, 3, 50, 50, 100 )
			sendMSGForFaction ( msg, 6, 50, 50, 100 )
			sendMSGForFaction ( msg, 7, 50, 50, 100 )
			sendMSGForFaction ( msg, 8, 50, 50, 100 )
			sendMSGForFaction ( msg, 9, 50, 50, 100 )
			sendMSGForFaction ( msg, 10, 50, 50, 100 )
			
			end
		end
end

function entschaerfen(player)
local pdim = getElementDimension(player)
if pdim == casinodim then
	if bombe == "fertig" and
	isElementWithinMarker(player, defusemarker) then
		if isOnStateDuty(player) then
			if not isPedDead ( player ) and vnxGetElementData ( player, "loggedin" ) == 1 then
				defusestate = "machend"
				setTimer(sohier, 10000, 1, player)
				local msg = "[CASINO]: Die Bombe wird entschärft!"
				sendMSGForFaction ( msg, 1, 0, 150, 0 )
				if robfaction ~= 2 then
					sendMSGForFaction ( msg, 2, 200, 200, 0 )
				end
				sendMSGForFaction ( msg, 3, 0, 150, 0 )
				sendMSGForFaction ( msg, 6, 0, 150, 0 )
				if robfaction ~= 7 then
					sendMSGForFaction ( msg, 7, 200, 200, 0 )
				end
				sendMSGForFaction ( msg, 8, 0, 150, 0 )
				if robfaction ~= 9 then
					sendMSGForFaction ( msg, 9, 200, 200, 0 )
				end
				if robfaction ~= 10 then
					sendMSGForFaction ( msg, 10, 200, 200, 0 )
				end
				sendMSGForFaction ( msg, robfaction, 200, 0, 0 )
				abbrechstate = "ready"
					function abbrechen(matchingDimension)
					if abbrechstate == "ready" then
						defusestate = "abgebrochen"
						local msg = "[CASINO]: Die Entschärfung wurde abgebrochen!"
						sendMSGForFaction ( msg, 1, 200, 0, 0 )
						if robfaction ~= 2 then
							sendMSGForFaction ( msg, 2, 200, 200, 0 )
						end
						sendMSGForFaction ( msg, 3, 200, 0, 0 )
						sendMSGForFaction ( msg, 6, 200, 0, 0 )
						if robfaction ~= 7 then
							sendMSGForFaction ( msg, 7, 200, 200, 0 )
						end
						sendMSGForFaction ( msg, 8, 200, 0, 0 )
						if robfaction ~= 9 then
							sendMSGForFaction ( msg, 9, 200, 200, 0 )
						end
						if robfaction ~= 10 then
							sendMSGForFaction ( msg, 10, 200, 200, 0 )
						end
						sendMSGForFaction ( msg, robfaction, 0, 150, 0 )
						abbrechstate = "gone"
					end
					end
			else
				outputChatBox("Du bist tot!", player, 200, 0, 0)
			end
		end
	addEventHandler("onMarkerLeave", defusemarker, abbrechen)
	end
end
end
addCommandHandler("defuse", entschaerfen)

function sohier(player)
	if not isPedDead ( player ) and getElementData ( player, "loggedin" ) == 1 then
		if defusestate == "machend" then
			bombe = "done"
			local msg = "[CASINO]: Die Bombe wurde entschärft!"
			sendMSGForFaction ( msg, 1, 0, 150, 0 )
			if robfaction ~= 2 then
				sendMSGForFaction ( msg, 2, 200, 200, 0 )
			end
			sendMSGForFaction ( msg, 3, 0, 150, 0 )
			sendMSGForFaction ( msg, 6, 0, 150, 0 )
			if robfaction ~= 7 then
				sendMSGForFaction ( msg, 7, 200, 200, 0 )
			end
			sendMSGForFaction ( msg, 8, 0, 150, 0 )
			if robfaction ~= 9 then
				sendMSGForFaction ( msg, 9, 200, 200, 0 )
			end
			if robfaction ~= 10 then
				sendMSGForFaction ( msg, 10, 200, 200, 0 )
			end
			sendMSGForFaction ( msg, robfaction, 200, 0, 0 )
			outputLog ( "[CASINO]: "..getPlayerName(player).." hat die Bombe erfolgreich entschaerft!", "bad")
			local anzahlState = 0
				for index, player in pairs(getElementsByType("player")) do
					if(isOnStateDuty(player)) then
						anzahlState = anzahlState + 1
					end
				end
				local pricey = 10000
				local pricemultiplier = anzahlState * 5000
				local pricebrutto = pricey + pricemultiplier
				if pricebrutto > 100000 then
					pricebrutto = 100000
				end
			vnxSetElementData ( player, "boni", vnxGetElementData ( player, "boni" ) + (pricebrutto/100) )
			outputChatBox("Du hast das Casino beschützt! Du kriegst "..(pricebrutto/100).."$ Bonus beim nächsten Payday!", player, 0, 150, 0)
			destroyElement(dynamit)
			destroyElement(defusemarker)
			defusestate = "done"
			setTimer(restart2, 3600000, 1)
			robfaction = nil
		end
	else
		outputChatBox("Du bist gestorben.", player, 200, 0, 0)
		local msg = "[CASINO]: Die Entschärfung wurde abgebrochen!"
		sendMSGForFaction ( msg, 1, 200, 0, 0 )
		if robfaction ~= 2 then
			sendMSGForFaction ( msg, 2, 200, 200, 0 )
		end
		sendMSGForFaction ( msg, 3, 200, 0, 0 )
		sendMSGForFaction ( msg, 6, 200, 0, 0 )
		if robfaction ~= 7 then
			sendMSGForFaction ( msg, 7, 200, 200, 0 )
		end
		sendMSGForFaction ( msg, 8, 200, 0, 0 )
		if robfaction ~= 9 then
			sendMSGForFaction ( msg, 9, 200, 200, 0 )
		end
		if robfaction ~= 10 then
			sendMSGForFaction ( msg, 10, 200, 200, 0 )
		end
		sendMSGForFaction ( msg, robfaction, 0, 150, 0 )
	end
end

function restart2()
			geld2 = createObject(1550, 2143.3000488281, 1641.5, 993, 0, 0, 30)
			geld3 = createObject(1550, 2143.6999511719, 1642.3000488281, 993, 0, 0, 196)
			geld4 = createObject(1550, 2143.8000488281, 1641.6999511719, 993, 0, 0, 250)
			geld5 = createObject(1550, 2143.1000976563, 1642.1999511719, 993, 0, 0, 320)
			geld6 = createObject(1550, 2142.6999511719, 1641.6999511719, 993, 0, 0, 245)
			geld7 = createObject(1550, 2142.6000976563, 1642.4000244141, 993, 0, 0, 320)
			geld8 = createObject(1550, 2143.5, 1641.9000244141, 993.29998779297)
			geld9 = createObject(1550, 2143, 1641.9000244141, 993.20001220703)
			geld10 = createObject(1550, 2143, 1642.5, 993.5)
			geld11 = createObject(1550, 2143.3000488281, 1642.6999511719, 993.29998779297)
			geld12 = createObject(1550, 2143.8000488281, 1642.6999511719, 993)
			geld13 = createObject(1550, 2143.8999023438, 1642.0999755859, 993)
			geld14 = createObject(1550, 2142.6999511719, 1642, 993)
			geld15 = createObject(1550, 2143, 1641.5999755859, 993)
			setElementInterior(geld2, 1)
			setElementInterior(geld3, 1)
			setElementInterior(geld4, 1)
			setElementInterior(geld5, 1)
			setElementInterior(geld6, 1)
			setElementInterior(geld7, 1)
			setElementInterior(geld8, 1)
			setElementInterior(geld9, 1)
			setElementInterior(geld10, 1)
			setElementInterior(geld11, 1)
			setElementInterior(geld12, 1)
			setElementInterior(geld13, 1)
			setElementInterior(geld14, 1)
			setElementInterior(geld15, 1)
			setElementDimension(geld2, 1)
			setElementDimension(geld3, 1)
			setElementDimension(geld4, 1)
			setElementDimension(geld5, 1)
			setElementDimension(geld6, 1)
			setElementDimension(geld7, 1)
			setElementDimension(geld8, 1)
			setElementDimension(geld9, 1)
			setElementDimension(geld10, 1)
			setElementDimension(geld11, 1)
			setElementDimension(geld12, 1)
			setElementDimension(geld13, 1)
			setElementDimension(geld14, 1)
			setElementDimension(geld15, 1)
			robstate = "frei"
			local msg = "[INFO]: Das Casino hat sich von dem Überfall erholt."
			sendMSGForFaction ( msg, 1, 50, 50, 100 )
			sendMSGForFaction ( msg, 2, 50, 50, 100 )
			sendMSGForFaction ( msg, 3, 50, 50, 100 )
			sendMSGForFaction ( msg, 6, 50, 50, 100 )
			sendMSGForFaction ( msg, 7, 50, 50, 100 )
			sendMSGForFaction ( msg, 8, 50, 50, 100 )
			sendMSGForFaction ( msg, 9, 50, 50, 100 )
			sendMSGForFaction ( msg, 10, 50, 50, 100 )
end