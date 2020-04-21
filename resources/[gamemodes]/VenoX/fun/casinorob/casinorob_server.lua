-- Waren und ihre Anzahl - 75% --
local Benzinkanister = 1	  -- 5.25%
local Zigaretten = 50	  -- 21%
local Bier = 1	  -- 2.25%
local Materialien = 200	  -- 31.5%
local Burger = 1	  -- 3.75%
local Lagerfeuer = 1 	  -- 0.75%
local Fackel = 1 	  -- 0.75%
local Grill = 1	  	-- 0.75%
local Basketball = 1	  --   0.75%
local Strandball = 1	  --  0.75%
local Liege = 1	  	-- 0.75% 
local Hanfsamen = 50	  -- 6.75%

-- Waffen und Munition - 24% --
local Mp5 = 180    -- 4.8%
local M4 = 300	   -- 4.8%
local Deagle = 42	   -- 4.8%
local Gewehr = 50	   -- 3.84%
local Shotgun = 20	   -- 1.2%
local Colt = 73	   -- 1.2%
local Tec9 = 100    -- 1.2%
local Uzi = 150	   -- 1.2%
local Weste = 1	   -- 0.96%

-- Fahrzeuge - 1% --
local Fahrzeugschluessel = {          -- ~0.02%
	[1] = 602, [2] = 545, [3] = 496, [4] = 517, [5] = 589, [6] = 580, [7] = 419,
	[8] = 439, [9] = 549, [10] = 524, [11] = 474, [12] = 445, [13] = 467, [14] = 507,
	[15] = 492, [16] = 529, [17] = 581, [18] = 487, [19] = 513, [20] = 481, [21] = 522,
	[22] = 461, [23] = 468, [24] = 463, [25] = 536, [26] = 575, [27] = 534, [28] = 567,
	[29] = 402, [30] = 603, [31] = 475, [32] = 568, [33] = 571, [34] = 457, [35] = 539,
	[36] = 429, [37] = 411, [38] = 541, [39] = 415, [40] = 559, [41] = 560, [42] = 506,
	[43] = 562, [44] = 451, [45] = 558, [46] = 477, [47] = 579, [48] = 400, [49] = 489,	
}

-- Marker --
local casinorobMarker = {}
local casinorobStelle = 0
local abgabeMarker = nil
local markerGettingRobbed = nil
local numbermarkerrobbed = 0

-- Beute -- 
local casinorobLootObject = {}
local casinorobLootObjectOnPlayer =  {}
local anzahlafterobjects = 0
local objectstelle = 0

-- Casinoräuber --
local casinoRobber = nil
local casinoRobberFraction = nil

-- Casinobesitzer -- 
local robbedFraction = nil
local robbedFractionMoney = nil
local robbedFractionDrugs = nil
local robbedFractionMats = nil

-- Timer --
local casinoTimer = nil
local casinoTimerMarker = nil

-- Sonstiges --
local casinorobErfolg = false
fourdragonsrobbed = false
caligulasrobbed = false
thecasinorobbed = false
local thevehicle = nil
local copsarein = false
local ausladezeit = false
local casinorobDonecaligulas = {}
local casinorobDonefourdragons = {}
local casinorobDonecasinofloor = {}
local hatWaffeFrei = {}
local lootArray = {}
local amAusladen = false
local isDrinArray = {}

-- Eigene Events -- 
addEvent("setCasinoPreparationServer", true)
addEvent("casinorobMarkerRobbed", true)

--------------------------------------------------------------------------------------

-- Beginn des Casinorobs --
-- 1. Bei jedem Client Ped Animationen ändern und Marker wegschieben
-- 2. Casino, Casinobesitzer + Fraki und Casinorobber + Fraki herausfinden und allen Bescheid geben
-- 3. Alarm-Sound an
-- 4. Frakikasse der ausgeraubten Fraktion speichern
-- 5. Casinorob-Marker erstellen
-- 6. "onPlayerClick" behandeln wegen den Kisten

addEventHandler("setCasinoPreparationServer", getRootElement(), function()
	if casinoRobber == nil and not aktionlaeuft then
		local int = getElementInterior(client)
		if int == 1 then
			if casinorobDonecaligulas[tonumber(vnxGetElementData(client, "fraktion"))] == nil or casinorobDonecaligulas[tonumber(vnxGetElementData(client, "fraktion"))] == false then
			else
				outputChatBox("Unbekannt: Sie haben uns doch heute schon \195\188berfallen, wir haben nichts mehr!", client, 255, 255, 255)
				return false
			end	
		elseif int == 10 then
			if casinorobDonefourdragons[tonumber(vnxGetElementData(client, "fraktion"))] == nil or casinorobDonefourdragons[tonumber(vnxGetElementData(client, "fraktion"))] == false then
			else
				outputChatBox("Unbekannt: Sie haben uns doch heute schon \195\188berfallen, wir haben nichts mehr!", client, 255, 255, 255)
				return false
			end	
		elseif int == 12 then
			if casinorobDonecasinofloor[tonumber(vnxGetElementData(client, "fraktion"))] == nil or casinorobDonecasinofloor[tonumber(vnxGetElementData(client, "fraktion"))] == false then
			else
				outputChatBox("Unbekannt: Sie haben uns doch heute schon \195\188berfallen, wir haben nichts mehr!", client, 255, 255, 255)
				return false
			end	
		end
		casinoRobber = client
		aktionlaeuft = true
		addEventHandler ("onPlayerWasted", client, DieorOfflineInCasinorob)
		addEventHandler ("onPlayerQuit", client, DieorOfflineInCasinorob)
		outputLog ( "Casinorob - "..getPlayerName(client).." - "..fraktionNames[vnxGetElementData ( client, "fraktion")], "aktion" )
		casinoRobberFraction = vnxGetElementData(client, "fraktion")
		casinoTimerMarker = setTimer(casinoRobEnded, 1000*60*14, 1, 4)
		casinoTimer = setTimer(casinoRobEnded, 1000*60*20, 1, 3)
		local x, y, z = getElementPosition(client)
		local robberFraction = vnxGetElementData(client, "fraktion")
		local players = getElementsByType("player")
		for i=1, #players do
			local player = players[i]
			local x1, y1, z1 = getElementPosition(player)
			local int1 = getElementInterior(player)
			if robberFraction == vnxGetElementData(player, "fraktion") then
				addEventHandler("onPlayerClick", player, casinorobLootClick_func)
				bindKey ( player, "space", "down", stopCasinoRobAnimation, player)
			end
			if getDistanceBetweenPoints2D (x, y, x1, y1) <= 200 and int == int1 then
				if int1 == 10 then
					triggerClientEvent(player, "playSoundOfRob", player, "fourdragons")
				elseif int1 == 1 then
					triggerClientEvent(player, "playSoundOfRob", player, "caligulas" )
				elseif int1 == 12 then
					triggerClientEvent(player, "playSoundOfRob", player, "thecasino" )
				end	
				outputChatBox("Unbekannter: Bitte tun Sie mir nichts, ich sage Ihnen alles! Die Waren sind versteckt in den Automaten.", player, 255, 255, 255)
				outputChatBox("Unbekannter: Hier ... damit k\195\182nnen Sie sie einfach aufbrechen.", player, 255, 255, 255)
				if client ~= player then
					outputChatBox(getPlayerName(client) .." hat ein Werkzeug zum \195\150ffnen der Automaten bekommen!", player, 5000, 0, 200)
				else
					outputChatBox("Du hast ein Werkzeug zum \195\150ffnen der Automaten bekommen!", client, 5000, 0, 200)
				end
			end
		end
		sendMSGForFaction ( "Brecht soviele Automaten wie m\195\182glich auf, steckt die Kisten in den Van und bringt diesen zur Base!", casinoRobberFraction, 0, 0, 255 )
		if int == 1 then
			caligulasrobbed = true
			robbedFraction = 2
			outputChatBox("Im Caligulas Casino ert\195\182nt ein Alarm, haltet euch da fern!", getRootElement(), 150, 0, 0)
			casinorobDonecaligulas[tonumber(vnxGetElementData(client, "fraktion"))] = true
			if getFactionMembersOnline(robbedFraction) >= 1 then
				if getFactionMembersOnline(robbedFraction)+3 <= getFactionMembersOnline(casinoRobberFraction) then
					sendMSGForFaction ( "Euer Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Die Polizei wurde verst\195\164ndigt euch zu helfen!", robbedFraction, 255, 0, 0 )
					sendMSGForFaction ( "Das Caligulas Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Die Casinobesitzer brauchen eure Hilfe!", 1, 255, 0, 0 )
					sendMSGForFaction ( "Das Caligulas Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Die Casinobesitzer brauchen eure Hilfe!", 6, 255, 0, 0 )
					sendMSGForFaction ( "Das Caligulas Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Die Casinobesitzer brauchen eure Hilfe!", 8, 255, 0, 0 )
					copsarein = true
				elseif getFactionMembersOnline(robbedFraction) < 3 then
					sendMSGForFaction ( "Euer Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Die Polizei wurde verst\195\164ndigt euch zu helfen!", robbedFraction, 255, 0, 0 )
					sendMSGForFaction ( "Das Caligulas Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Die Casinobesitzer brauchen eure Hilfe!", 1, 255, 0, 0 )
					sendMSGForFaction ( "Das Caligulas Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Die Casinobesitzer brauchen eure Hilfe!", 6, 255, 0, 0 )
					sendMSGForFaction ( "Das Caligulas Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Die Casinobesitzer brauchen eure Hilfe!", 8, 255, 0, 0 )
					copsarein = true
				elseif getFactionMembersOnline(robbedFraction) >= 3 then
					sendMSGForFaction ( "Euer Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Haltet den Raub auf!", robbedFraction, 255, 0, 0 )
				end
			else
				sendMSGForFaction ( "Das Caligulas Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Haltet den Raub auf!", 1, 255, 0, 0 )
				sendMSGForFaction ( "Das Caligulas Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Haltet den Raub auf!", 6, 255, 0, 0 )
				sendMSGForFaction ( "Das Caligulas Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Haltet den Raub auf!", 8, 255, 0, 0 )
			end				
		elseif int == 10 then
			fourdragonsrobbed = true
			robbedFraction = 3
			casinorobDonefourdragons[tonumber(vnxGetElementData(client, "fraktion"))] = true
			outputChatBox("Im Four Dragons Casino ert\195\182nt ein Alarm, haltet euch da fern!", getRootElement(), 150, 0, 0)
			if getFactionMembersOnline(robbedFraction) >= 1 then
				if getFactionMembersOnline(robbedFraction)+3 <= getFactionMembersOnline(casinoRobberFraction) then
					sendMSGForFaction ( "Euer Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Die Polizei wurde verst\195\164ndigt euch zu helfen!", robbedFraction, 255, 0, 0 )
					sendMSGForFaction ( "Das Four Dragons Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Die Casinobesitzer brauchen eure Hilfe!", 1, 255, 0, 0 )
					sendMSGForFaction ( "Das Four Dragons Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Die Casinobesitzer brauchen eure Hilfe!", 6, 255, 0, 0 )
					sendMSGForFaction ( "Das Four Dragons Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Die Casinobesitzer brauchen eure Hilfe!", 8, 255, 0, 0 )
					copsarein = true
				elseif getFactionMembersOnline(robbedFraction) < 3 then
					sendMSGForFaction ( "Euer Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Die Polizei wurde verst\195\164ndigt euch zu helfen!", robbedFraction, 255, 0, 0 )
					sendMSGForFaction ( "Das Four Dragons Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Die Casinobesitzer brauchen eure Hilfe!", 1, 255, 0, 0 )
					sendMSGForFaction ( "Das Four Dragons Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Die Casinobesitzer brauchen eure Hilfe!", 6, 255, 0, 0 )
					sendMSGForFaction ( "Das Four Dragons Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Die Casinobesitzer brauchen eure Hilfe!", 8, 255, 0, 0 )
					copsarein = true
				elseif getFactionMembersOnline(robbedFraction) >= 3 then
					sendMSGForFaction ( "Euer Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Haltet den Raub auf!", robbedFraction, 255, 0, 0 )
				end
			else
				sendMSGForFaction ( "Das Four Dragons Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Haltet den Raub auf!", 1, 255, 0, 0 )
				sendMSGForFaction ( "Das Four Dragons Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Haltet den Raub auf!", 6, 255, 0, 0 )
				sendMSGForFaction ( "Das Four Dragons Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Haltet den Raub auf!", 8, 255, 0, 0 )
			end
		elseif int == 12 then
			thecasinorobbed = true
			robbedFraction = 9
			casinorobDonecasinofloor[tonumber(vnxGetElementData(client, "fraktion"))] = true
			outputChatBox("In Casino Floor ert\195\182nt ein Alarm, haltet euch da fern!", getRootElement(), 150, 0, 0)
			if getFactionMembersOnline(robbedFraction) >= 1 then
				if getFactionMembersOnline(robbedFraction)+3 <= getFactionMembersOnline(casinoRobberFraction) then
					sendMSGForFaction ( "Euer Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Die Polizei wurde verst\195\164ndigt euch zu helfen!", robbedFraction, 255, 0, 0 )
					sendMSGForFaction ( "Das Casino Floor wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Die Casinobesitzer brauchen eure Hilfe!", 1, 255, 0, 0 )
					sendMSGForFaction ( "Das Casino Floor wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Die Casinobesitzer brauchen eure Hilfe!", 6, 255, 0, 0 )
					sendMSGForFaction ( "Das Casino Floor wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Die Casinobesitzer brauchen eure Hilfe!", 8, 255, 0, 0 )
					copsarein = true
				elseif getFactionMembersOnline(robbedFraction) < 3 then
					sendMSGForFaction ( "Euer Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Die Polizei wurde verst\195\164ndigt euch zu helfen!", robbedFraction, 255, 0, 0 )
					sendMSGForFaction ( "Das Casino Floor wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Die Casinobesitzer brauchen eure Hilfe!", 1, 255, 0, 0 )
					sendMSGForFaction ( "Das Casino Floor wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Die Casinobesitzer brauchen eure Hilfe!", 6, 255, 0, 0 )
					sendMSGForFaction ( "Das Casino Floor wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Die Casinobesitzer brauchen eure Hilfe!", 8, 255, 0, 0 )
					copsarein = true
				elseif getFactionMembersOnline(robbedFraction) >= 3 then
					sendMSGForFaction ( "Euer Casino wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Haltet den Raub auf!", robbedFraction, 255, 0, 0 )
				end
			else
				sendMSGForFaction ( "Das Casino Floor wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Haltet den Raub auf!", 1, 255, 0, 0 )
				sendMSGForFaction ( "Das Casino Floor wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Haltet den Raub auf!", 6, 255, 0, 0 )
				sendMSGForFaction ( "Das Casino Floor wird \195\188berfallen von den/der "..fraktionNames[casinoRobberFraction].."! Haltet den Raub auf!", 8, 255, 0, 0 )
			end	
		end
		robbedFractionMoney = factionDepotData["money"][robbedFraction]
		robbedFractionDrugs = factionDepotData["drugs"][robbedFraction]
		robbedFractionMats = factionDepotData["mats"][robbedFraction]
		createCasinorobMarker(int)
	else
		infobox ( client, "Es läuft schon\neine Aktion!", 4000, 200, 0, 0 )
	end
end)



-- Casinorob-Marker --
-- 1. Marker zum ausrauben erstellen
-- 2. "onMarkerHit" für diese Marker erstellen
-- 3. Falls man einen Marker betritt, wird das Objekt in den selben Interior geportet

function createCasinorobMarker(interior)
	-- Caligulas --
	if interior == 1 then	
		casinorobMarker[casinorobStelle] = createMarker(2151.8999023438, 1595.1999511719, 1005.200012207, "cylinder", 1.5, 0, 0, 125, 150)
		casinorobStelle = casinorobStelle + 1
		casinorobMarker[casinorobStelle] = createMarker(2218.6999511719, 1616.5999755859, 1005.200012207, "cylinder", 1.5, 0, 0, 125, 150)
		casinorobStelle = casinorobStelle + 1
		casinorobMarker[casinorobStelle] = createMarker(2219.1000976563, 1603.8000488281, 1005.200012207, "cylinder", 1.5, 0, 0, 125, 150)
		casinorobStelle = casinorobStelle + 1
		casinorobMarker[casinorobStelle] = createMarker(2218.6000976563, 1590.5999755859, 1005.200012207, "cylinder", 1.5, 0, 0, 125, 150)
		casinorobStelle = casinorobStelle + 1
		casinorobMarker[casinorobStelle] = createMarker(2256.1999511719, 1596.8000488281, 1005.200012207, "cylinder", 1.5, 0, 0, 125, 150)
		casinorobStelle = casinorobStelle + 1
		casinorobMarker[casinorobStelle] = createMarker(2266.6999511719, 1589.6999511719, 1005.200012207, "cylinder", 1.5, 0, 0, 125, 150)
		casinorobStelle = casinorobStelle + 1
		casinorobMarker[casinorobStelle] = createMarker(2271.5, 1606.6999511719, 1005.200012207, "cylinder", 1.5, 0, 0, 125, 150)
		casinorobStelle = casinorobStelle + 1
		casinorobMarker[casinorobStelle] = createMarker(2255.1000488281, 1608.4000244141, 1005.200012207, "cylinder", 1.5, 0, 0, 125, 150)
		casinorobStelle = casinorobStelle + 1
	-- Four Dragons -- 
	elseif interior == 10 then
		casinorobMarker[casinorobStelle] = createMarker(1940.5999755859, 983.20001220703, 991.5, "cylinder", 1.5, 0, 0, 125, 150)
		casinorobStelle = casinorobStelle + 1
		casinorobMarker[casinorobStelle] = createMarker(1956.8000488281, 988.70001220703, 991.5, "cylinder", 1.5, 0, 0, 125, 150)
		casinorobStelle = casinorobStelle + 1
		casinorobMarker[casinorobStelle] = createMarker(1966.5, 998.09997558594, 991.5, "cylinder", 1.5, 0, 0, 125, 150)
		casinorobStelle = casinorobStelle + 1
		casinorobMarker[casinorobStelle] = createMarker(1943, 1007, 991.5, "cylinder", 1.5, 0, 0, 125, 150)
		casinorobStelle = casinorobStelle + 1
		casinorobMarker[casinorobStelle] = createMarker(1961, 1042.6999511719, 991.5, "cylinder", 1.5, 0, 0, 125, 150)
		casinorobStelle = casinorobStelle + 1
		casinorobMarker[casinorobStelle] = createMarker(1969.9000244141, 1021.700012207, 991.5, "cylinder", 1.5, 0, 0, 125, 150)
		casinorobStelle = casinorobStelle + 1
		casinorobMarker[casinorobStelle] = createMarker(1963.5, 1044.4000244141, 991.5, "cylinder", 1.5, 0, 0, 125, 150)
		casinorobStelle = casinorobStelle + 1
		casinorobMarker[casinorobStelle] = createMarker(1965.8000488281, 1029.6999511719, 991.5, "cylinder", 1.5, 0, 0, 125, 150)
		casinorobStelle = casinorobStelle + 1
	-- The Casino --
	elseif interior == 12 then
		casinorobMarker[casinorobStelle] = createMarker(1141.7600097656, -2.3900001049042, 999.90003662109, "cylinder", 1, 0, 0, 125, 150)
		casinorobStelle = casinorobStelle + 1
		casinorobMarker[casinorobStelle] = createMarker(1124.9000244141, 2.6999998092651, 999.90003662109, "cylinder", 0.8, 0, 0, 125, 150)
		casinorobStelle = casinorobStelle + 1
		casinorobMarker[casinorobStelle] = createMarker(1125.9000244141, 2.6999998092651, 999.90003662109, "cylinder", 0.8, 0, 0, 125, 150)
		casinorobStelle = casinorobStelle + 1
		casinorobMarker[casinorobStelle] = createMarker(1126.9000244141, 2.6999998092651, 999.90003662109, "cylinder", 0.8, 0, 0, 125, 150)
		casinorobStelle = casinorobStelle + 1
		casinorobMarker[casinorobStelle] = createMarker(1127.9000244141, 2.6999998092651, 999.90003662109, "cylinder", 0.8, 0, 0, 125, 150)
		casinorobStelle = casinorobStelle + 1
		casinorobMarker[casinorobStelle] = createMarker(1135, 0.69999998807907, 999.90003662109, "cylinder", 0.8, 0, 0, 125, 150)
		casinorobStelle = casinorobStelle + 1
		casinorobMarker[casinorobStelle] = createMarker(1132.8000488281, -1.6500000238419, 999.90003662109, "cylinder", 0.8, 0, 0, 125, 150)
		casinorobStelle = casinorobStelle + 1
		casinorobMarker[casinorobStelle] = createMarker(1135.0999755859, -3.9000000953674, 999.90003662109, "cylinder", 0.8, 0, 0, 125, 150)
		casinorobStelle = casinorobStelle + 1
	end
	for index, marker in pairs (casinorobMarker) do
		setElementInterior(casinorobMarker[index], interior)
		addEventHandler( "onMarkerHit", casinorobMarker[index], casinorobOnMarkerHit )
	end
	for key, index in pairs ( casinoTeleporters["x"] ) do
		addEventHandler("onMarkerHit", _G["casinoMarker"..key], portTheLootObjectInSameInterior)
	end
end



-- Robmarker-Hit --
-- 1. Wenn man Robmarker betritt, kriegt man eine Bomb-Animationen (mit Leertaste abbrechen)
-- 2. Wenn man es verlässt, wird es abgebrochen
-- 3. Hud kommt (Clientseitig)

function casinorobOnMarkerHit ( element, matchingDimension )
	if element then	
		if getElementType (element) == "player" then
			if element == casinoRobber then
				setPedAnimation(element, "bomber", "BOM_Plant_Loop",-1,true,false,true)
				markerGettingRobbed = source
				addEventHandler( "onMarkerLeave", source, casinorobOnMarkerLeave )
				triggerClientEvent(element, "casinorobOnMarkerHit", element, source)
			end
		end
	end
end



-- Marker ausgeraubt --
-- Wird getriggert, wenn der Balken im Hud voll war (Client).
-- 1. Animation stoppen
-- 2. Wenn es der Safe-Marker war, wird Safe geöffnet (Client).
-- 3. Der Marker verliert ihre Events und wird vernichtet
-- 4. Kiste wird neben dem Räuber im Marker erstellt

addEventHandler("casinorobMarkerRobbed", getRootElement(), function ()
	setPedAnimation(source)
	for index, marker in pairs (casinorobMarker) do
		if markerGettingRobbed == casinorobMarker[index] then
			if index == 0 then
				if getElementInterior(marker) == 1 then
					triggerClientEvent("oeffneCasinoTresor", source, "caligulas")
				elseif getElementInterior(marker) == 10 then
					triggerClientEvent("oeffneCasinoTresor", source, "four dragons")
				elseif getElementInterior(marker) == 12 then
					triggerClientEvent("oeffneCasinoTresor", source, "the casino")
				end
			end
			removeEventHandler( "onMarkerHit", casinorobMarker[index], casinorobOnMarkerHit )
			removeEventHandler( "onMarkerLeave", casinorobMarker[index], casinorobOnMarkerLeave )
			destroyElement(casinorobMarker[index])
			casinorobMarker[index] = nil
			markerGettingRobbed = nil
			local x, y, z = getElementPosition(casinoRobber)
			local int = getElementInterior(casinoRobber)
			casinorobLootObject[index] = createObject (1230, x+0.5, y-0.5, z-0.65)
			setObjectScale (casinorobLootObject[index], getObjectScale(casinorobLootObject[index])/16*9)
			setElementInterior(casinorobLootObject[index], int)
			numbermarkerrobbed = numbermarkerrobbed + 1
			if numbermarkerrobbed == 8 then
				sendMSGForFaction ( "Ihr habt alle Kisten eingesammelt. Sammelt sie im Van und bringt diesen zur Base!", casinoRobberFraction, 0, 0, 150 )
				sendMSGForFaction ( "Die R\195\164uber haben alle Automaten aufgebrochen!", robbedFraction, 150, 0, 0 )
				if copsarein then
					sendMSGForFaction ( "Die R\195\164uber haben alle Automaten aufgebrochen!", 1, 255, 0, 0 )
					sendMSGForFaction ( "Die R\195\164uber haben alle Automaten aufgebrochen!", 6, 255, 0, 0 )
					sendMSGForFaction ( "Die R\195\164uber haben alle Automaten aufgebrochen!", 8, 255, 0, 0 )
				end
			end
		end
	end
end)



-- onPlayerClick --
-- Wenn man auf eine Kiste (aufnehmen oder öffnen) oder auf das Auto klickt (reintun oder ausladen).
-- Kiste aufnehmen:
-- -- 1. Überprüfen, ob es die Kiste vom Casino ist
-- -- 2. Überprüfen, ob schon eine Kiste dran ist
-- -- 3. Wenn nicht -> dranhängen, Spieler gehen lassen und keine Waffe in Hand
-- Kiste öffnen:
-- -- 1. Überprüfen, welche Kiste es ist
-- -- 2. Beute übergeben
-- -- 3. Kiste zerstören
-- -- 4. Casinobesitzer bestrafen für jede geöffnete Kiste:
-- -- -- 1. 4.000$
-- -- -- 2. Falls nicht vorhanden, 571 Gramm Drogen
-- -- -- 3. Falls nicht vorhanden, 500 Materialien
-- -- -- 4. Bei jedem "nicht vorhanden" überprüfen, ob die Fraktion das Geld am Anfang hatte,
-- -- --    So erfährt man, ob eine Fraktion schummelt 
-- Fahrzeug reintun: 
-- -- 1. Überprüfen, ob es schon im Abgabemarker war/ist
-- -- 2. Überprüfen, ob das Fahrzeug eines der erlaubten Fahrzeuge ist (mit großem Kofferraum)
-- -- 3. Kiste herausfinden
-- -- 4. Überprüfen, ob es die erste Kiste ist
-- -- -- Ja:
-- -- -- -- 1. Das Fahrzeug ist "thevehicle"
-- -- -- -- 2. onVehicleRespawn & onVehicleExplode dranhängen für Schutz vor Ausnutzung -> Das Fahrzeug verliert die Beute
-- -- -- -- 3. Beute reintun 
-- -- -- Nein:
-- -- -- -- 1. Beute reintun
-- -- 5. Kiste zerstören und Spieler normal machen
-- -- 6. Bei erster Kiste Abgabemarker erstellen
-- -- 7. Beim Betreten dieses Marker mit dem Auto den Marker zerstören, Auto freezen, Meldung geben und "ausladen" auf true setzen beim Auto
-- Fahrzeug ausladen:
-- -- 1. Überprüfen, ob es eine Beute hat
-- -- 2. Entfreezen und "ausladen" auf false
-- -- 3. Kiste für jede Beute ("loots") im Auto neben der klickenden Person erstellen (für Beute)

function casinorobLootClick_func ( button, state, clickedElement )
	if vnxGetElementData(source, "fraktion") ~= casinoRobberFraction then return false end	
	if clickedElement and button == "left" and state == "down" then
		local x, y, z = getElementPosition (source)
		local cx, cy = getElementPosition (clickedElement)
		if getDistanceBetweenPoints2D (x, y, cx, cy) > 5 then 
			return false 
		end
		-- KISTE --
		if getElementType(clickedElement) == "object" then
			local hataufgenommen = false
			-- Kiste vom Casino? --
			if not ausladezeit then
				for index, object in pairs(casinorobLootObject) do
					if clickedElement == object then
						-- Schon eine Kiste angehängt? --
						local hatkisteinhand = false
						for object, player in pairs (casinorobLootObjectOnPlayer) do
							if getPlayerName(source) == player then
								hatkisteinhand = true
							end
						end
						-- Wenn keine Kiste dranhängt -> dranhängen --
						if not hatkisteinhand then
							casinorobLootObjectOnPlayer[object] = getPlayerName(source)
							hataufgenommen = true
							startObjectInHand (source, object)
							-- Kann nur gehen, keine Waffe in Hand, nicht schlagen, nicht einsteigen --
							setPedWeaponSlot(source, 0)
							toggleControl(source, "sprint", false)
							toggleControl(source, "walk", false)
							toggleControl(source, "next_weapon", false)
							toggleControl(source, "previous_weapon", false)
							toggleControl(source, "jump", false)
							toggleControl(source, "crouch", false)
							toggleControl(source, "enter_exit", false)
							toggleControl(source, "enter_passenger", false)
							toggleControl(source, "fire", false)
							showCursor(source, false)
							setElementClicked ( source, false )
							if source ~= casinoRobber then
								addEventHandler ("onPlayerWasted", source, DieorOfflineInCasinorob)
								addEventHandler ("onPlayerQuit", source, DieorOfflineInCasinorob)
							end	
							return true
						end
					end
				end
			
			-- KISTE ÖFFNEN --
			else
				-- Prüfen, welche Kiste es ist --
				for index, object in pairs(casinorobLootObject) do
					if clickedElement == object then
						showCursor(source, false)
						setElementClicked ( source, false )
						-- Die Beute aushändigen --
						objectstelle = objectstelle + 1
						getCasinorobLoot ( source, objectstelle )
						-- Kiste zerstören -- 
						destroyElement(object)
						casinorobLootObject[index] = nil
						-- Casinobesitzer bestrafen --
						if factionDepotData["money"][robbedFraction] >= 4000 then
							factionDepotData["money"][robbedFraction] = factionDepotData["money"][robbedFraction] - 4000
							sendMSGForFaction ( "Die "..objectstelle..". Box wurde ge\195\182ffnet - daher werden euch 4.000$ abgezogen!", robbedFraction, 150, 0, 0 )
							sendMSGForFaction ( "Die "..objectstelle..". Box wurde ge\195\182ffnet - daher werden den Gegnern 4.000$ abgezogen!", casinoRobberFraction, 150, 0, 0 )
						elseif factionDepotData["drugs"][robbedFraction] >= 571 then
							sendMSGForFaction ( "Die "..objectstelle..". Box wurde ge\195\182ffnet - daher werden euch 571g Drogen abgezogen!", robbedFraction, 150, 0, 0 )
							sendMSGForFaction ( "Die "..objectstelle..". Box wurde ge\195\182ffnet - daher werden den Gegnern 571g Drogen abgezogen!", casinoRobberFraction, 150, 0, 0 )
							factionDepotData["drugs"][robbedFraction] = factionDepotData["drugs"][robbedFraction] - 571
						elseif factionDepotData["mats"][robbedFraction] >= 500 then
							sendMSGForFaction ( "Die "..objectstelle..". Box wurde ge\195\182ffnet - daher werden euch 500 Mats abgezogen!", robbedFraction, 150, 0, 0 )
							sendMSGForFaction ( "Die "..objectstelle..". Box wurde ge\195\182ffnet - daher werden den Gegnern 500 Mats abgezogen!", casinoRobberFraction, 150, 0, 0 )
							factionDepotData["mats"][robbedFraction] = factionDepotData["mats"][robbedFraction] - 500
						end
					end
					if anzahlafterobjects == objectstelle then
						casinoRobEnded(1)
					end
				end
			end
			
		-- FAHRZEUG REINTUN --	
		elseif getElementType(clickedElement) == "vehicle" then
			-- Wenn es noch nicht im Abgabemarker war/ist --
			if not amAusladen or amAusladen ~= clickedElement then
				-- Nur für bestimme Fahrzeuge --
				local modelid = getElementModel(clickedElement)
				-- 482 == Burrito || 418 == Moonbeam || 413 == Pony || 579 == Huntley
				if modelid == 482 or modelid == 418 or modelid == 413 or modelid == 579 then
					showCursor(player, false)
					setElementClicked ( player, false )
					-- Kiste durch den Spieler, an den es dranhängt, herausfinden --
					for object, player in pairs(casinorobLootObjectOnPlayer) do
						if getPlayerName(source) == player then
							isDrinArray[object] = true
							-- Wenn es die erste Kiste ist --
							if thevehicle == nil and ( not lootArray[clickedElement] or lootArray[clickedElement] == 0 ) then
								lootArray[clickedElement] = 1
								thevehicle = clickedElement
								addEventHandler ("onVehicleRespawn", clickedElement, setCasinorobVehicleNormalAgain_respawn)
								addEventHandler ("onVehicleExplode", clickedElement, setCasinorobVehicleNormalAgain_destroy)
							-- Wenn das Fahrzeug schon vorher beladen wurde --
							elseif lootArray[clickedElement] then
								lootArray[clickedElement] = lootArray[clickedElement] + 1
							end
							-- Kiste zerstören und Spieler wieder normal machen --
							if clickedElement == thevehicle then
								if getVehicleDoorOpenRatio(clickedElement, 4) < 0.5 or getVehicleDoorOpenRatio(clickedElement, 5) < 0.5 then
									setVehicleDoorOpenRatio(clickedElement, 4, 1, 500)
									setVehicleDoorOpenRatio(clickedElement, 5, 1, 500)
								end
								local vrx, vry, vrz = getElementRotation(clickedElement)
								local vx, vy, vz = getElementPosition(clickedElement)
								local rx, ry, rz = getElementRotation(source)
								if vrz >= 0 and vrz < 23 then
									setElementPosition(source, vx+0.5, vy-3.5, z)
								elseif vrz >= 23 and vrz < 45 then
									setElementPosition(source, vx+1.5, vy-2.5, z)
								elseif vrz >= 45 and vrz < 68 then
									setElementPosition(source, vx+2.5, vy-1.5, z)
								elseif vrz >= 68 and vrz < 90 then
									setElementPosition(source, vx+3.5, vy-0.5, z)
								elseif vrz >= 90 and vrz < 113 then
									setElementPosition(source, vx+3.5, vy+0.5, z)
								elseif vrz >= 113 and vrz < 135 then
									setElementPosition(source, vx+2.5, vy+1.5, z)
								elseif vrz >= 135 and vrz < 158 then
									setElementPosition(source, vx+1.5, vy+2.5, z)
								elseif vrz >= 158 and vrz < 180 then
									setElementPosition(source, vx+0.5, vy+3.5, z)
								elseif vrz >= 180 and vrz < 203 then
									setElementPosition(source, vx-0.5, vy+3.5, z)
								elseif vrz >= 203 and vrz < 225 then
									setElementPosition(source, vx-1.5, vy+2.5, z)
								elseif vrz >= 225 and vrz < 248 then
									setElementPosition(source, vx-2.5, vy+1.5, z)
								elseif vrz >= 248 and vrz < 270 then
									setElementPosition(source, vx-3.5, vy+0.5, z)
								elseif vrz >= 270 and vrz < 293 then
									setElementPosition(source, vx-3.5, vy-0.5, z)
								elseif vrz >= 293 and vrz < 315 then
									setElementPosition(source, vx-2.5, vy-1.5, z)
								elseif vrz >= 315 and vrz < 338 then
									setElementPosition(source, vx-1.5, vy-2.5, z)
								elseif vrz >= 338 and vrz < 360 then
									setElementPosition(source, vx-0.5, vy-3.5, z)
								end
								setElementRotation(source, rx, ry, vrz, "default", true)
								if lootArray[clickedElement] and lootArray[clickedElement] > 0 then
									attachElements ( object, clickedElement, -0.18, -0.15, -0.23 )
									setElementFrozen( clickedElement, true )
									addEventHandler ("onVehicleStartEnter", clickedElement, freezeDatShit)
								elseif lootArray[clickedElement] == 2 then
									attachElements ( object, clickedElement, 0.23, -0.15, -0.23 )
								elseif lootArray[clickedElement] == 3 then
									attachElements ( object, clickedElement, -0.18, -0.65, -0.23 )
								elseif lootArray[clickedElement] == 4 then
									attachElements ( object, clickedElement, 0.23, -0.65, -0.23 )
								elseif lootArray[clickedElement] == 5 then
									attachElements ( object, clickedElement, -0.18, -0.15, 0.13 )
								elseif lootArray[clickedElement] == 6 then
									attachElements ( object, clickedElement, 0.23, -0.15, 0.13 )
								elseif lootArray[clickedElement] == 7 then
									attachElements ( object, clickedElement, -0.18, -0.65, 0.13 )
								elseif lootArray[clickedElement] == 8 then
									attachElements ( object, clickedElement, 0.23, -0.65, 0.13 )
								end
								casinorobLootObjectOnPlayer[object] = nil
								toggleControl(source, "sprint", true)
								toggleControl(source, "walk", true)
								toggleControl(source, "next_weapon", true)
								toggleControl(source, "previous_weapon", true)
								toggleControl(source, "jump", true)
								toggleControl(source, "crouch", true)
								toggleControl(source, "enter_exit", true)
								toggleControl(source, "enter_passenger", true)
								toggleControl(source, "fire", true)
								if source ~= casinoRobber then
									removeEventHandler ("onPlayerWasted", source, DieorOfflineInCasinorob)
									removeEventHandler ("onPlayerQuit", source, DieorOfflineInCasinorob)
								end
								if caligulasrobbed or fourdragonsrobbed then
									setPedAnimation (source, "CARRY", "putdwn05", -1, false, false, false)
								elseif thecasinorobbed then
									setPedAnimation (source, "BOX", "boxhipup", -1, false, false, false)
									toggleControl(source, "forwards", true)
									toggleControl(source, "left", true)
									toggleControl(source, "right", true)
								end
								unbindKey ( source, "w", "down", startObjectInHandMoveForward )
								unbindKey ( source, "d", "down", startObjectInHandLookRight )
								unbindKey ( source, "a", "down", startObjectInHandLookLeft )
								unbindKey ( source, "w", "up", stopObjectInHandMove)
								unbindKey ( source, "a", "up", stopObjectInHandMove)
								unbindKey ( source, "d", "up", stopObjectInHandMove)
								-- Wenn es die erste Kiste war -> Abgabemarker erstellen --
								if casinorobErfolg == false then
									casinorobErfolg = true
									-- "Yakuza" --
									if tonumber(vnxGetElementData ( casinoRobber, "fraktion" )) == 3 then
										abgabeMarker = createMarker(2815, 955.90002441406, 10.800000190735, "checkpoint", 6, 222, 0, 0, 255)
									-- "La Cosa Nostra" --
									elseif tonumber(vnxGetElementData ( casinoRobber, "fraktion" )) == 7 then
										abgabeMarker = createMarker(1041.5999755859, 2112.1999511719, 10.800000190735, "checkpoint", 6, 23, 23, 23)
									-- "Angels of Death" --
									elseif tonumber(vnxGetElementData ( casinoRobber, "fraktion" )) == 9 then
										abgabeMarker = createMarker(2491.1999511719, 1536.5, 9.6000003814697, "checkpoint", 6, 70, 25, 25, 255)
									end
									-- Wenn man den Marker betritt --
									addEventHandler("onMarkerHit", abgabeMarker, function ( hitElement )
										if hitElement and getElementType(hitElement) == "vehicle" then
											if thevehicle == hitElement then
												amAusladen = hitElement
												setElementFrozen(hitElement, true)
												destroyElement(abgabeMarker)
												removeEventHandler ("onPlayerWasted", casinoRobber, DieorOfflineInCasinorob)
												removeEventHandler ("onPlayerQuit", casinoRobber, DieorOfflineInCasinorob)
												infobox ( getVehicleController(hitElement), "\nSteige aus dem Auto\naus und klick darauf,\num es auszuladen!", 5000, 0, 2000, 0 )
											end
										end
									end)
								end
							end
						end
					end
				end
			
			-- FAHRZEUG AUSLADEN --
			else
				-- Hat es Beute drin? --
				if lootArray[clickedElement] and lootArray[clickedElement] > 0 then
					amAusladen = false
					setElementFrozen(clickedElement, false)
					-- Kiste für jede Beute im Auto neben der klickenden Person erstellen --
					local x,y,z = getElementPosition (source)
					anzahlafterobjects = lootArray[clickedElement]
					local i = 1
					ausladezeit = true
					if robbedFractionMoney+3999 < factionDepotData["money"][robbedFraction] and robbedFractionMoney >= 4000 then
						outputChatBox("Die gegnerische Fraktion hat das Geld ("..robbedFractionMoney.."$) vorher rausgenommen!", source, 155, 0, 0)
					end
					if robbedFractionDrugs+575 < factionDepotData["drugs"][robbedFraction] and robbedFractionDrugs >= 571 then
						outputChatBox("Die gegnerische Fraktion hat die Drogen ("..robbedFractionDrugs.."g) vorher rausgenommen!", source, 155, 0, 0)
					end
					if robbedFractionMats+3000 < factionDepotData["mats"][robbedFraction] and robbedFractionMats >= 500 then
						outputChatBox("Die gegnerische Fraktion hat die Mats ("..robbedFractionMats.."$) vorher rausgenommen!", source, 155, 0, 0)
					end
					for index, object in pairs (casinorobLootObject) do
						if isDrinArray[object] then
							detachElements (object)
							setElementCollisionsEnabled (object, true)
							if i == 1 then
								setElementPosition(object, x+1, y, z-0.7)
							elseif i == 2 then
								setElementPosition(object, x+1, y+1, z-0.7)
							elseif i == 3 then
								setElementPosition(object, x, y+1, z-0.7)
							elseif i == 4 then
								setElementPosition(object, x-1, y+1, z-0.7)
							elseif i == 5 then
								setElementPosition(object, x-1, y, z-0.7)
							elseif i == 6 then
								setElementPosition(object, x-1, y-1, z-0.7)
							elseif i == 7 then
								setElementPosition(object, x, y-1, z-0.7)
							elseif i == 8 then
								setElementPosition(object, x+1, y-1, z-0.7)
							end
							i = i + 1
							isDrinArray[object] = false
						end
					end
				end
			end
		end
	end
end



-- Casinorob Ende --
-- Wenn der Casinorob endet, bekommen die Beteiligten eine Meldung und alles wird wieder normal.

function casinoRobEnded(success)
	if success == 1 then 
		sendMSGForFaction ( "Ihr habt euer Casino nicht beschützen können, die Gegner haben "..anzahlafterobjects.." Kisten geklaut.", robbedFraction, 155, 0, 0 )
		if copsarein then
			sendMSGForFaction ( "Ihr habt das Casino nicht beschützen können.", 1, 155, 0, 0 )
			sendMSGForFaction ( "Ihr habt das Casino nicht beschützen können.", 6, 155, 0, 0 )
			sendMSGForFaction ( "Ihr habt das Casino nicht beschützen können.", 8, 155, 0, 0 )
			copsarein = false
		end
	elseif success == 2 then
		sendMSGForFaction ( "Ihr habt euer Casino erfolgreich besch\195\188tzen k\195\182nnen.", robbedFraction, 0, 0, 155 )
		if copsarein then
			sendMSGForFaction ( "Ihr habt das Casino erfolgreich besch\195\188tzt.", 1, 0, 0, 155 )
			sendMSGForFaction ( "Ihr habt das Casino erfolgreich besch\195\188tzt.", 6, 0, 0, 155 )
			sendMSGForFaction ( "Ihr habt das Casino erfolgreich besch\195\188tzt.", 8, 0, 0, 155 )
			copsarein = false
		end
	elseif success == 3 then
		sendMSGForFaction ( "[Zeit abgelaufen] Die R\195\164uber haben den Casinoraub aufgegeben.", robbedFraction, 0, 0, 155 )
		sendMSGForFaction ( "Ihr habt zuviel Zeit verschwendet, der Casinoraub ist fehlgeschlagen!", casinoRobberFraction, 0, 0, 155 )
		if copsarein then
			sendMSGForFaction ( "[Zeit abgelaufen] Die R\195\164uber haben den Casinoraub aufgegeben.", 1, 0, 0, 155 )
			sendMSGForFaction ( "[Zeit abgelaufen] Die R\195\164uber haben den Casinoraub aufgegeben.", 6, 0, 0, 155 )
			sendMSGForFaction ( "[Zeit abgelaufen] Die R\195\164uber haben den Casinoraub aufgegeben.", 8, 0, 0, 155 )
			copsarein = false
		end
	end
	for index, marker in pairs(casinorobMarker) do
		removeEventHandler( "onMarkerHit", casinorobMarker[index], casinorobOnMarkerHit )
		destroyElement(marker)
		casinorobMarker[index] = nil
	end
	casinorobStelle = 0
	markerGettingRobbed = nil
	setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1 )
	if isTimer(casinoTimerMarker) then
		killTimer(casinoTimerMarker)
	end
	casinoTimerMarker = nil
	if success ~= 4 then
		destroyElement(abgabeMarker)
		abgabeMarker = nil
		numbermarkerrobbed = 0
		for index, object in pairs(casinorobLootObject) do
			destroyElement(object)
			casinorobLootObject[index] = nil
		end
		for object, player in pairs(casinorobLootObjectOnPlayer) do
			destroyElement(object)
			casinorobLootObject[object] = nil
		end
		for key, index in pairs ( casinoTeleporters["x"] ) do
			removeEventHandler("onMarkerHit", _G["casinoMarker"..key], portTheLootObjectInSameInterior)
		end
		local players = getElementsByType("player")
		for i=1, #players do
			if vnxGetElementData(players[i], "fraktion") == casinoRobberFraction then
				removeEventHandler("onPlayerClick", players[i], casinorobLootClick_func)
				unbindKey ( players[i], "space", "down", stopCasinoRobAnimation)
			end
		end
		removeEventHandler ("onVehicleRespawn", thevehicle, setCasinorobVehicleNormalAgain_respawn)
		removeEventHandler ("onVehicleExplode", thevehicle, setCasinorobVehicleNormalAgain_destroy)
		anzahlafterobjects = 0
		objectstelle = 0
		triggerClientEvent("casinorobistzuende", getRootElement())
		casinoRobber = nil
		casinoRobberFraction = nil
		robbedFraction = nil
		robbedFractionMoney = nil
		robbedFractionDrugs = nil
		robbedFractionMats = nil
		if isTimer(casinoTimer) then
			killTimer(casinoTimer)
		end
		copsarein = false
		ausladezeit = false
		casinoTimer = nil
		casinorobErfolg = false
		fourdragonsrobbed = false
		caligulasrobbed = false
		thecasinorobbed = false
		removeEventHandler ("onVehicleStartEnter", thevehicle, freezeDatShit)
		thevehicle = nil
		isDrinArray = {}
	else
		sendMSGForFaction("Wir haben keine Zeit mehr f\195\188r die Automaten, schnell den Van zur Basis!", casinoRobberFraction, 0, 0, 150)
	end
end


---------------------------  Hilfsfunktionen ---------------------------


-- Robmarker-Leave --
-- Hud und Animation brechen ab

function casinorobOnMarkerLeave (element)
	setPedAnimation(element)
	triggerClientEvent(element, "casinorobOnMarkerLeave", element)
end



-- Casino-Beute --
-- Die Beute wird mit einer Meldung gegeben 
-- Wahrscheinlichkeiten und Anzahl sind oben aufgelistet

function getCasinorobLoot ( player, index )
	local randomnumber = math.random (1000)
	
	-- FAHRZEUG --
	if randomnumber >= 990 then
		local fahrzeugrandomnummer = math.random (#Fahrzeugschluessel)
		carbuy(player, 0, Fahrzeugschluessel[fahrzeugrandomnummer], -1995.3588867188, 171.2080078125, 27.6875, 0, 0, 0, 255, 255, 255, nil, true)
	
	-- WAFFE --
	elseif randomnumber >= 750 and randomnumber < 990 then
		local waffenrandomnummer = math.random(100)
		if waffenrandomnummer >= 80 then 
			outputChatBox("Box "..tostring(index).." von "..tostring(anzahlafterobjects).." - "..Mp5.." Schuss MP5", player)
			outputChatBox("Nutze es mit /gibwaffe! Achtung: Waffe im gleichen Slot verschwindet!", player)
			hatWaffeFrei[getPlayerName(player)] = { 29, Mp5 }
		elseif waffenrandomnummer >= 60 then 
			outputChatBox("Box "..tostring(index).." von "..tostring(anzahlafterobjects).." - "..M4.." Schuss M4", player)
			outputChatBox("Nutze es mit /gibwaffe! Achtung: Waffe im gleichen Slot verschwindet!", player)
			hatWaffeFrei[getPlayerName(player)] = { 31, M4 }
		elseif waffenrandomnummer >= 40 then 
			outputChatBox("Box "..tostring(index).." von "..tostring(anzahlafterobjects).." - "..Deagle.." Schuss Deagle", player)
			outputChatBox("Nutze es mit /gibwaffe! Achtung: Waffe im gleichen Slot verschwindet!", player)
			hatWaffeFrei[getPlayerName(player)] = { 24, Deagle }
		elseif waffenrandomnummer >= 24 then 
			outputChatBox("Box "..tostring(index).." von "..tostring(anzahlafterobjects).." - "..Gewehr.." Schuss Gewehr", player)
			outputChatBox("Nutze es mit /gibwaffe! Achtung: Waffe im gleichen Slot verschwindet!", player)
			hatWaffeFrei[getPlayerName(player)] = { 33, Gewehr }
		elseif waffenrandomnummer >= 19 then 
			outputChatBox("Box "..tostring(index).." von "..tostring(anzahlafterobjects).." - "..Shotgun.." Schuss Shotgun", player)
			outputChatBox("Nutze es mit /gibwaffe! Achtung: Waffe im gleichen Slot verschwindet!", player)
			hatWaffeFrei[getPlayerName(player)] = { 25, Shotgun }
		elseif waffenrandomnummer >= 14 then 
			outputChatBox("Box "..tostring(index).." von "..tostring(anzahlafterobjects).." - "..Colt.." Schuss Colt", player)
			outputChatBox("Nutze es mit /gibwaffe! Achtung: Waffe im gleichen Slot verschwindet!", player)
			hatWaffeFrei[getPlayerName(player)] = { 22, Colt }
		elseif waffenrandomnummer >= 9 then 
			outputChatBox("Box "..tostring(index).." von "..tostring(anzahlafterobjects).." - "..Tec9.." Schuss Tec-9", player)
			outputChatBox("Nutze es mit /gibwaffe! Achtung: Waffe im gleichen Slot verschwindet!", player)
			hatWaffeFrei[getPlayerName(player)] = { 32, Tec9 }
		elseif waffenrandomnummer >= 4 then 
			outputChatBox("Box "..tostring(index).." von "..tostring(anzahlafterobjects).." - "..Uzi.." Schuss Uzi", player)
			outputChatBox("Nutze es mit /gibwaffe! Achtung: Waffe im gleichen Slot verschwindet!", player)
			hatWaffeFrei[getPlayerName(player)] = { 28, Uzi }
		elseif waffenrandomnummer >= 1 then 
			outputChatBox("Box "..tostring(index).." von "..tostring(anzahlafterobjects).." - Weste", player)
			setPedArmor (player, 100)
		end		

	-- ITEMS --	
	elseif randomnumber >= 1 and randomnumber < 750 then
		local itemnumber = math.random(100)
		if itemnumber >= 93 then
			outputChatBox("Box "..tostring(index).." von "..tostring(anzahlafterobjects).." - Benzinkanister", player)
			vnxSetElementData ( player, "benzinkannister", tonumber ( vnxGetElementData ( player, "benzinkannister" ) ) + Benzinkanister )
		elseif itemnumber >= 65 then
			outputChatBox("Box "..tostring(index).." von "..tostring(anzahlafterobjects).." - "..Zigaretten.." Zigaretten", player)
			vnxSetElementData ( player, "zigaretten", vnxGetElementData ( player, "zigaretten" ) + Zigaretten )
		elseif itemnumber >= 62 then
			outputChatBox("Box "..tostring(index).." von "..tostring(anzahlafterobjects).." - "..Bier.." Bier", player)
			putFoodInSlot ( player, 2 )
		elseif itemnumber >= 20 then
			outputChatBox("Box "..tostring(index).." von "..tostring(anzahlafterobjects).." - "..Materialien.." Materialien", player)
			vnxSetElementData ( player, "mats", vnxGetElementData ( player, "mats" ) + Materialien )
		elseif itemnumber >= 15 then
			outputChatBox("Box "..tostring(index).." von "..tostring(anzahlafterobjects).." - "..Burger.." Burger", player)
			putFoodInSlot ( player, 3 )
		elseif itemnumber == 14 then
			outputChatBox("Box "..tostring(index).." von "..tostring(anzahlafterobjects).." - "..Lagerfeuer.." Lagerfeuer", player)
			vnxSetElementData ( player, "object", 841 )
		elseif itemnumber == 13 then
			outputChatBox("Box "..tostring(index).." von "..tostring(anzahlafterobjects).." - "..Fackel.." Fackel", player)
			vnxSetElementData ( player, "object", 3461 )
		elseif itemnumber == 12 then
			outputChatBox("Box "..tostring(index).." von "..tostring(anzahlafterobjects).." - "..Grill.." Grill", player)
			vnxSetElementData ( player, "object", 1481 )
		elseif itemnumber == 11 then
			outputChatBox("Box "..tostring(index).." von "..tostring(anzahlafterobjects).." - "..Basketball.." Basketball", player)
			vnxSetElementData ( player, "object", 1946 )
		elseif itemnumber == 10 then
			outputChatBox("Box "..tostring(index).." von "..tostring(anzahlafterobjects).." - "..Strandball.." Strandball", player)
			vnxSetElementData ( player, "object", 1598 )
		elseif itemnumber == 9 then
			outputChatBox("Box "..tostring(index).." von "..tostring(anzahlafterobjects).." - "..Liege.." Liege", player)
			vnxSetElementData ( player, "object", 1255 )
		elseif itemnumber >= 1 then
			outputChatBox("Box "..tostring(index).." von "..tostring(anzahlafterobjects).." - "..Hanfsamen.." Hanfsamen", player)
			local seeds = tonumber ( vnxGetElementData ( player, "flowerseeds" ) )
			vnxSetElementData ( player, "flowerseeds", seeds + Hanfsamen )
		end
	end
end	


		
-- Kiste in gleiche Interior --
-- Wenn man aus dem Casino rausgeht oder in diesen reingeht, wird die Kiste unsichtbar.
-- Das kommt dadurch, weil sie im alten Interior bleibt.
-- Da getElementInterior nur den alten Interior anzeigt, müssen wir selbst herausfinden, in welchen Interior der Spieler jetzt ist

function portTheLootObjectInSameInterior ( hitElement )
	for object, player in pairs (casinorobLootObjectOnPlayer) do
		if player == getPlayerName(hitElement) then
			if getElementInterior(source) == 1 or getElementInterior(source) == 10 or getElementInterior(source) == 12 then
				setElementInterior(object, 0)
			elseif caligulasrobbed then
				setElementInterior(object, 1)
			elseif fourdragonsrobbed then
				setElementInterior(object, 10)
			elseif thecasinorobbed then
				setElementInterior(object, 12)
			end
		end
	end
end



-- Waffe geben --
-- Mit dieser Funktion kann der Spieler sich Waffen geben lassen, wenn er eine Waffe gezogen hat.

function giveThePlayerWeapon ( player )
	if hatWaffeFrei[getPlayerName(player)] then
		local modelid = hatWaffeFrei[getPlayerName(player)][1]
		local ammo = hatWaffeFrei[getPlayerName(player)][2]
		giveWeapon(player, modelid, ammo, true )
		hatWaffeFrei[getPlayerName(player)] = nil
	end
end
addCommandHandler ("gibwaffe", giveThePlayerWeapon)



-- Bei Fahrzeug-Respawn --
-- Wenn das Casino-Fahrzeug respawnt wird, soll es seine Werte und Beute verlieren. 
-- Außerdem kriegen die Räuber eine Meldung 

function setCasinorobVehicleNormalAgain_respawn ()
	if source == thevehicle then
		lootArray[source] = nil
		sendMSGForFaction ( "Der Van wurde respawnet, die Beute ist verschwunden!", casinoRobberFraction, 150, 0, 0 )
		thevehicle = nil
		removeEventHandler ("onVehicleRespawn", source, setCasinorobVehicleNormalAgain_respawn)
		removeEventHandler ("onVehicleExplode", source, setCasinorobVehicleNormalAgain_destroy)
		casinoRobEnded(2)
	end
end


-- Bei Fahrzeug-Explode --
-- Wenn das Casino-Fahrzeug explodiert, soll es seine Werte und Beute verlieren. 
-- Außerdem kriegen die Räuber eine Meldung 

function setCasinorobVehicleNormalAgain_destroy ()
	if source == thevehicle then
		lootArray[source] = nil
		sendMSGForFaction ( "Der Van wurde zerst\195\182rt, die Beute ist verschwunden!", casinoRobberFraction, 150, 0, 0 )
		thevehicle = nil
		removeEventHandler ("onVehicleRespawn", source, setCasinorobVehicleNormalAgain_respawn)
		removeEventHandler ("onVehicleExplode", source, setCasinorobVehicleNormalAgain_destroy)
		casinoRobEnded(2)
	end
end


function startObjectInHand (player, object)
	local xr, yr, xz = getElementRotation (player)
	local x, y, z = getElementPosition (player)
	setElementCollisionsEnabled (object, false)
	if xz >= 0 and xz < 23 then
		setElementPosition(object, x+0.2, y+0.5, z-0.5)
	elseif xz >= 23 and xz < 45 then
		setElementPosition(object, x-0.3, y+0.5, z-0.5)
	elseif xz >= 45 and xz < 68 then
		setElementPosition(object, x-0.3, y+0.5, z-0.5)
	elseif xz >= 68 and xz < 90 then
		setElementPosition(object, x-0.3, y, z-0.5)
	elseif xz >= 90 and xz < 113 then
		setElementPosition(object, x-0.3, y, z-0.5)
	elseif xz >= 113 and xz < 135 then
		setElementPosition(object, x-0.3, y-0.5, z-0.5)
	elseif xz >= 135 and xz < 158 then
		setElementPosition(object, x-0.3, y-0.5, z-0.5)
	elseif xz >= 158 and xz < 180 then
		setElementPosition(object, x+0.2, y-0.5, z-0.5)
	elseif xz >= 180 and xz < 203 then
		setElementPosition(object, x+0.2, y-0.5, z-0.5)
	elseif xz >= 203 and xz < 225 then
		setElementPosition(object, x+0.7, y-0.5, z-0.5)
	elseif xz >= 225 and xz < 248 then
		setElementPosition(object, x+0.7, y-0.5, z-0.5)
	elseif xz >= 248 and xz < 270 then
		setElementPosition(object, x+0.7, y, z-0.5)
	elseif xz >= 270 and xz < 293 then
		setElementPosition(object, x+0.7, y, z-0.5)
	elseif xz >= 293 and xz < 315 then
		setElementPosition(object, x+0.7, y+0.5, z-0.5)
	elseif xz >= 315 and xz < 338 then
		setElementPosition(object, x+0.7, y+0.5, z-0.5)
	elseif xz >= 338 and xz < 360 then
		setElementPosition(object, x+0.2, y+0.5, z-0.5)
	end
	local timerzeit = 700
	if caligulasrobbed or fourdragonsrobbed then
		setPedAnimation (player, "CARRY", "liftup05", -1, false, false, false)
	elseif thecasinorobbed then
		setPedAnimation (player, "BOX", "boxhipin", -1, false, false, false)
		timerzeit = 4000
	end
	setTimer(function(player, object)
		if caligulasrobbed or fourdragonsrobbed then
			attachElements ( object, player, -0.02, 0.4, 0.55 )
			setPedAnimation(player, "CARRY", "crry_prtial", 50)
		elseif thecasinorobbed then
			attachElements ( object, player, 0.35, -0.2 )
			toggleControl(player, "forwards", false)
			toggleControl(player, "left", false)
			toggleControl(player, "right", false)
			bindKey ( player, "w", "down", startObjectInHandMoveForward )
			bindKey ( player, "d", "down", startObjectInHandLookRight )
			bindKey ( player, "a", "down", startObjectInHandLookLeft )
		end
	end, timerzeit, 1, player, object) -- 4000	
end

function startObjectInHandMoveForward (player)
	setPedAnimation(player, "BOX", "bxhipwlk", 50)
	unbindKey ( player, "w", "down", startObjectInHandMoveForward)
	bindKey ( player, "w", "up", stopObjectInHandMove)
end

function startObjectInHandLookRight (player, button, state)
	local xr, yr, zr = getElementRotation (player)
	setElementRotation (player, xr, yr, zr-20, "default", true)
end

function startObjectInHandLookLeft (player, button, state)
	local xr, yr, zr = getElementRotation (player)
	setElementRotation (player, xr, yr, zr+20, "default", true)
end

function stopObjectInHandMove (player)
	setPedAnimation (player, "BOX", "bxhwlki", 1000, false, false, false)
	bindKey ( player, "w", "down", startObjectInHandMoveForward)
	unbindKey ( player, "w", "up", stopObjectInHandMove)
	unbindKey ( player, "a", "up", stopObjectInHandMove)
	unbindKey ( player, "d", "up", stopObjectInHandMove)
end

function freezeDatShit (player)
	if vnxGetElementData(player, "fraktion") == casinoRobberFraction then
		setElementFrozen(source, false)
	else
		cancelEvent()
	end
end

function stopCasinoRobAnimation (player)
	setPedAnimation (player)
end

-- boxhipin -- zum aufnehmen
-- boxhipup -- zum ablegen
-- bxhipwlk -- zum gehen
-- bxhwlki -- zum stehen (?)


function DieorOfflineInCasinorob (ammo, killer)
	local daobject = nil
	for object, player in pairs (casinorobLootObjectOnPlayer) do
		if getPlayerName(source) == player then
			casinorobLootObjectOnPlayer[object] = nil
			daobject = object
		end
	end
	for index, object in pairs (casinorobLootObject) do	
		if object == daobject then
			destroyElement (object)
			casinorobLootObject[index] = nil
		end
	end
	if isElement(killer) then
		toggleControl(source, "sprint", true)
		toggleControl(source, "walk", true)
		toggleControl(source, "next_weapon", true)
		toggleControl(source, "previous_weapon", true)
		toggleControl(source, "jump", true)
		toggleControl(source, "crouch", true)
		toggleControl(source, "enter_exit", true)
		toggleControl(source, "enter_passenger", true)
		toggleControl(source, "fire", true)
		if thecasinorobbed then
			toggleControl(source, "forwards", true)
			toggleControl(source, "left", true)
			toggleControl(source, "right", true)
		end
		unbindKey ( player, "w", "down", startObjectInHandMoveForward )
		unbindKey ( player, "d", "down", startObjectInHandLookRight )
		unbindKey ( player, "a", "down", startObjectInHandLookLeft )
		unbindKey ( player, "w", "down", startObjectInHandMoveForward)
		unbindKey ( player, "w", "up", stopObjectInHandMove)
		unbindKey ( player, "w", "up", stopObjectInHandMove)
		unbindKey ( player, "a", "up", stopObjectInHandMove)
		unbindKey ( player, "d", "up", stopObjectInHandMove)
	end
	if source == casinoRobber then
		if numbermarkerrobbed < 8 then
			sendMSGForFaction ( "Euer Mann zum Aufbrechen der Automaten ist nicht mehr unter euch!", casinoRobberFraction, 0, 0, 150 )
			sendMSGForFaction ( "Ihr konntet den Mann töten, der für das Aufbrechen der Automaten zuständig war!", robbedFraction, 150, 0, 0 )
			if copsarein then
				sendMSGForFaction ( "Ihr konntet den Mann töten, der für das Aufbrechen der Automaten zuständig war!", 1, 255, 0, 0 )
				sendMSGForFaction ( "Ihr konntet den Mann töten, der für das Aufbrechen der Automaten zuständig war!", 6, 255, 0, 0 )
				sendMSGForFaction ( "Ihr konntet den Mann töten, der für das Aufbrechen der Automaten zuständig war!", 8, 255, 0, 0 )
			end
			casinoRobEnded (4)
		end
	end
end







