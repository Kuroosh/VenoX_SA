------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------
---- Script by Noneatme ------

addEvent("doLAGetWeihnachtsDate", true)
addEvent("doLATuerchenOeffne", true)
addEvent("doLAFeuerwerkZuende", true)
addEvent("applySpecialEventFinish", true)

-- NOTIZEN --
--[[
	Tag 1: 1 Paeckchen
	Tag 2: Aufgabe: Zettel finden/ Pro Zettel 1 Paeckchen
	Tag 3: Tisch-Objekt zum Platzieren
	Tag 4: 2 Paeckchen
	Tag 5: 2 Paeckchen
	Tag 6: Platzierbarer Tannenbaum
	Tag 7: Sozialer Status: Glocke
	Tag 8: 2 Paeckchen
	Tag 9: Aufgabe: Skydive auf ein Gebaeude in SF
	Tag 10: Sozialer Status: Weinachtspalme
	Tag 11: 2 Paeckchen
	Tag 12: Platzierbare Palme
	Tag 13: 2 Paeckchen
	Tag 14: 2 Paeckchen
	Tag 15: Platzierbarer Kaktus
	Tag 16: Aufgabe: Den schoensten Screenshot im Server machen und im Forum posten
	Tag 17: 3 Paeckchen
	Tag 18: Sozialer Status: Schneemann
	Tag 19: Kostenlosen RC-Bandit (Bleibt da, bis man aussteigt)
	Tag 20: Platzierbare Palme, Kaktus und Tannenbaum
	Tag 21: Platzierbares Licht
	Tag 22: 5 Paeckchen
	Tag 23: Aufgabe:
	Tag 24: Mr.Whoope fuer 150.000$
	Tag 31: Mr. Whoopee nichtmehr kaufbar, 5 Flimmervulkaene, 5 Raketen und eine Batterie kaufbar
]]

--[[
local daily_wins = {
	[1] = {"paeckchen, 1"},
	[2] = {"event, zettel"},
	[3] = {"objekt, tisch"},
	[4] = {"paeckchen, 2"},
	[5] = {"paeckchen, 2"},
	[6] = {"objekt, Tannenbaum"},
	[7] = {"status, glocke"},
	[8] = {"paeckchen, 2"},
	[9] = {"event, skydive"},
	[10] = {"status, Weinachtspalme"},
	[11] = {"paeckchen, 2"},
	[12] = {"objekt, palme"},
	[13] = {"paeckchen, 2"},
	[14] = {"paeckchen, 2"},
	[15] = {"objekt, kaktus"},
	[16] = {"event, screenshot"},
	[17] = {"paeckchen, 3"},
	[18] = {"status, Schneemann"},
	[19] = {"fahrzeug, RC Bandit"},
	[20] = {"objekt, palme", "objekt, kaktus", "objekt, tannenbaum"}
	[21] = {"objekt, licht"},
	[22] = {"paeckchen, 5"},
	[23] = {"event", "nichts"},
	[24] = {"fahrzeuga, Mr.Whoopee"},
	[31] = {}
}--]]

-- MYSQL VERBINDUNG --

local m_dbname = "ni1082425_2_DB"
local m_host = "127.0.0.1"
local m_user = "ni1082425_2_DB"
local m_pw = "7c373565"

local whandler = dbConnect( "mysql", "dbname="..m_dbname..";host="..m_host, m_user, m_pw, "autoreconnect=1" )
local dbptime = 5000

local player_tuerchen = {}
local player_data = {}

local item_list = {
	["Vulkan"] = "wn:flimmervulkane",
	["Batterie"] = "wn:batterien",
	["Rakete"] = "wn:raketen",
	["Boeller"] = "wn:boeller",
	["Heuler"] = "wn:heuler",
}

local apply_data = {}

local function closePlayerTuerchen(thePlayer, tuerchen)
	if(player_tuerchen[thePlayer]) and (player_tuerchen[thePlayer][tuerchen] ~= 1) then
		local query = dbQuery(whandler, "UPDATE weinachtsevent SET T"..tuerchen.." = '1' WHERE NAME = '"..getPlayerName(thePlayer).."';")
		local result, numrows = dbPoll(query, dbptime)
		player_tuerchen[thePlayer][tuerchen] = 1
	end
end

local function loadPlayerTuerchen(thePlayer)
	if not(player_tuerchen[thePlayer]) then
		player_tuerchen[thePlayer] = {}
		local query = dbQuery(whandler, "SELECT * FROM weinachtsevent WHERE NAME = '"..getPlayerName(thePlayer).."';")
		local result, numrows = dbPoll(query, dbptime)
		for i = 1, 24, 1 do
			player_tuerchen[thePlayer][i] = result[1]['T'..i]
		end
		player_tuerchen[thePlayer][31] = result[1]['T31']
		player_data[thePlayer] = {}
		player_data[thePlayer]["wn:paeckchen"] = result[1]['PAECKCHEN']
		player_data[thePlayer]["wn:tische"] = result[1]['TISCHE']
		player_data[thePlayer]["wn:kakteen"] = result[1]['KAKTEEN']
		player_data[thePlayer]["wn:lichter"] = result[1]['LICHTER']
		player_data[thePlayer]["wn:tannenbaeume"] = result[1]['TANNENBAEUME']
		player_data[thePlayer]["wn:palmen"] = result[1]['PALMEN']
		player_data[thePlayer]["wn:flimmervulkane"] = result[1]['FLIMMERVULKANE']
		player_data[thePlayer]["wn:batterien"] = result[1]['BATTERIEN']
		player_data[thePlayer]["wn:raketen"] = result[1]['RAKETEN']
		player_data[thePlayer]["wn:heuler"] = result[1]['HEULER']
		player_data[thePlayer]["wn:boeller"] = result[1]['BOELLER']
		for index, key in pairs(player_data[thePlayer]) do
			setElementData(thePlayer, index, key)
		end
	end
end

local function doCheckPlayerAdventskalender(thePlayer)
	local query = dbQuery(whandler, "SELECT * FROM weinachtsevent WHERE NAME = '"..getPlayerName(thePlayer).."';")
	local result, numrows = dbPoll(query, dbptime)
	if(result and numrows > 0) then
		loadPlayerTuerchen(thePlayer)
	else -- Insert --
		if(whandler) then -- Wiederausfuerhungscheck --
			query = dbQuery(whandler, "INSERT INTO weinachtsevent (NAME) values ('"..getPlayerName(thePlayer).."');")
			result, numrows = dbPoll(query, dbptime)
			doCheckPlayerAdventskalender(source)
		end
	end
end
-- JOIN HANDLER --

addEventHandler("onPlayerJoin", getRootElement(), function()
	if not(player_data[source]) then
		doCheckPlayerAdventskalender(source)
	end
end)

function givePlayerWeinachtsData(thePlayer, item, mysqlitem, data, tuerchen)
	if(tuerchen) then
		if(player_tuerchen[source][tuerchen] ~= 0) then
			return
		end
	end
	player_data[thePlayer][item] = player_data[thePlayer][item]+tonumber(data)
	setElementData(thePlayer, item, player_data[thePlayer][item])
	local query = dbQuery(whandler, "UPDATE weinachtsevent SET "..mysqlitem.." = '"..player_data[thePlayer][item].."' WHERE NAME = '"..getPlayerName(thePlayer).."';")
	local result, numrows = dbPoll(query, dbptime)
end


function getPlayerPaeckchen(thePlayer)
	return player_data[thePlayer]["wn:paeckchen"];
end

function getPlayerWeihnachtsData(thePlayer, data)
	return player_data[thePlayer][data];
end


function setPlayerPaeckchen(thePlayer, data)
	player_data[thePlayer]["wn:paeckchen"] = data
	setElementData(thePlayer, "wn:paeckchen", data)
	local query = dbQuery(whandler, "UPDATE weinachtsevent SET PAECKCHEN = '"..data.."' WHERE NAME = '"..getPlayerName(thePlayer).."';")
	local result, numrows = dbPoll(query, dbptime)
end
-- WEINACHTSEVENT DATE --

addEventHandler("doLAGetWeihnachtsDate", getRootElement(), function()
	local time = getRealTime()
	local month = time.month+1
	local day = time.monthday
	--month = 12
	--day = 21
	if(month == 1) or (month == 12) then
		triggerClientEvent(source, "doLAGetWeihnachtsDateBack", source, month, day)
	end
	doCheckPlayerAdventskalender(source)
end)

for index, player in pairs(getElementsByType("player")) do
	doCheckPlayerAdventskalender(player)
end

addEventHandler("doLATuerchenOeffne", getRootElement(), function(tuerchen)
	tuerchen = tonumber(tuerchen)
	givePlayerAdventsGewinn(source, tuerchen)
end)


addEventHandler("doLAFeuerwerkZuende", getRootElement(), function(feuerwerk)
	if(player_data[source][item_list[feuerwerk]] > 0) then
		local data = ""
		local mysqldata = ""
		if(feuerwerk == "Vulkan") then
			data = "wn:flimmervulkane"
			mysqldata = "FLIMMERVULKANE"
		elseif(feuerwerk == "Boeller") then
			data = "wn:boeller"
			mysqldata = "BOELLER"
		elseif(feuerwerk == "Rakete") then
			data = "wn:raketen"
			mysqldata = "RAKETEN"
		elseif(feuerwerk == "Batterie") then
			data = "wn:batterien"
			mysqldata = "BATTERIEN"
		elseif(feuerwerk == "Heuler") then
			data = "wn:heuler"
			mysqldata = "HEULER"
		end
		player_data[source][data] = player_data[source][data]-1
		setElementData(source, data, player_data[source][data])
		local query = dbQuery(whandler, "UPDATE weinachtsevent SET "..mysqldata.." = '"..player_data[source][data].."' WHERE NAME = '"..getPlayerName(source).."';")
		local result, numrows = dbPoll(query, dbptime)
		triggerEvent("zuendePlayerFeuerwerk", source, feuerwerk)
	end
end)

--[[
	Tag 1: 1 Paeckchen
	Tag 2: Aufgabe: Raetsel
	Tag 3: Tisch-Objekt zum Platzieren
	Tag 4: 2 Paeckchen
	Tag 5: 2 Paeckchen
	Tag 6: Platzierbarer Tannenbaum
	Tag 7: Sozialer Status: Glocke
	Tag 8: 2 Paeckchen
	Tag 9: Aufgabe: Skydive auf ein Gebaeude in SF
	Tag 10: Sozialer Status: Weinachtspalme
	Tag 11: 2 Paeckchen
	Tag 12: Platzierbare Palme
	Tag 13: 2 Paeckchen
	Tag 14: 2 Paeckchen
	Tag 15: Platzierbarer Kaktus
	Tag 16: Aufgabe: Den schoensten Screenshot im Server machen und im Forum posten
	Tag 17: 3 Paeckchen
	Tag 18: Sozialer Status: Schneemann
	Tag 19: Kostenlosen RC-Bandit (Bleibt da, bis man aussteigt)
	Tag 20: Platzierbare Palme, Kaktus und Tannenbaum
	Tag 21: Platzierbares Licht
	Tag 22: 5 Paeckchen
	Tag 23: Event
	Tag 24: Mr.Whoope fuer 150.000$
	Tag 31: Mr. Whoopee nichtmehr kaufbar, 5 Flimmervulkaene, 5 Raketen und eine Batterie kaufbar
]]

function givePlayerAdventsGewinn(thePlayer, tuerchen)
	-- Ich mache es per elseif-abfrage. Ein Table waer zu Kompliziert und ich bin zu Faul dazu, also nicht wundern ^^
	if(tuerchen == 1) then
		triggerClientEvent(thePlayer, "doLAClientShowWeinachtsTuerchen", thePlayer, "Paeckchen", "Du hast dein Türchen geöffnet, und hast 1 Päckchen erhalten!")
		givePlayerWeinachtsData(thePlayer, "wn:paeckchen", "PAECKCHEN", 1, tuerchen)
		closePlayerTuerchen(thePlayer, tuerchen)
	elseif(tuerchen == 2) then
		-- EVENT --
		triggerClientEvent(thePlayer, "doLAClientShowWeinachtsTuerchen", thePlayer, "Flugzeugabsturz", "In Los Santos ist im Norden ein Flugzeug abgestürzt.\nFinde es und finde heraus, was passiert ist!")
		apply_data[thePlayer] = "Event1"
		executePlayerWeihnachtsspecial(thePlayer)
	elseif(tuerchen == 3) then
		triggerClientEvent(thePlayer, "doLAClientShowWeinachtsTuerchen", thePlayer, "Tischobjekt", "Du hast dein Türchen geöffnet, und hast 1 Tischobjekt erhalten!")
		givePlayerWeinachtsData(thePlayer, "wn:tische", "TISCHE", 1, tuerchen)
		closePlayerTuerchen(thePlayer, tuerchen)
	elseif(tuerchen == 4) then
		triggerClientEvent(thePlayer, "doLAClientShowWeinachtsTuerchen", thePlayer, "Paeckchen", "Du hast dein Türchen geöffnet, und hast 2 Päckchen erhalten!")
		givePlayerWeinachtsData(thePlayer, "wn:paeckchen", "PAECKCHEN", 2, tuerchen)
		closePlayerTuerchen(thePlayer, tuerchen)
	elseif(tuerchen == 5) then
		triggerClientEvent(thePlayer, "doLAClientShowWeinachtsTuerchen", thePlayer, "Paeckchen", "Du hast dein Türchen geöffnet, und hast 2 Päckchen erhalten!")
		givePlayerWeinachtsData(thePlayer, "wn:paeckchen", "PAECKCHEN", 2, tuerchen)
		closePlayerTuerchen(thePlayer, tuerchen)
	elseif(tuerchen == 6) then
		triggerClientEvent(thePlayer, "doLAClientShowWeinachtsTuerchen", thePlayer, "Tannenbaum", "Du hast dein Türchen geöffnet, und hast einen Tannenbaum erhalten!")
		givePlayerWeinachtsData(thePlayer, "wn:tannenbaeume", "TANNENBAEUME", 1, tuerchen)
		closePlayerTuerchen(thePlayer, tuerchen)
	elseif(tuerchen == 7) then
		-- SPECIAL --
		triggerClientEvent(thePlayer, "doLAClientShowWeinachtsTuerchen", thePlayer, "Status", "Du hast dein Türchen geöffnet, und hast einen \nSozialen Status: Glocke erhalten!\nDu kannst ihn mit /applyweihnacht anwenden.")
		apply_data[thePlayer] = {}
		apply_data[thePlayer]["status"] = "Glocke"
	elseif(tuerchen == 8) then
		triggerClientEvent(thePlayer, "doLAClientShowWeinachtsTuerchen", thePlayer, "Paeckchen", "Du hast dein Türchen geöffnet, und hast 2 Päckchen erhalten!")
		givePlayerWeinachtsData(thePlayer, "wn:paeckchen", "PAECKCHEN", 2, tuerchen)
		closePlayerTuerchen(thePlayer, tuerchen)
	elseif(tuerchen == 9) then
		-- SPECIAL --
		triggerClientEvent(thePlayer, "doLAClientShowWeinachtsTuerchen", thePlayer, "Skydiven", "Skydive mit einem Fallschirm auf ein Gebäude in San Fierro.\nTippe /applyweihnacht ein, um loszulegen!")
		apply_data[thePlayer] = "Event2"
	elseif(tuerchen == 10) then
		triggerClientEvent(thePlayer, "doLAClientShowWeinachtsTuerchen", thePlayer, "Status", "Du hast dein Türchen geöffnet, und hast einen \nSozialen Status: Weihnachtspalme erhalten!\nDu kannst ihn mit /applyweihnacht anwenden.")
		apply_data[thePlayer] = {}
		apply_data[thePlayer]["status"] = "Weihnachtspalme"
	elseif(tuerchen == 11) then
		triggerClientEvent(thePlayer, "doLAClientShowWeinachtsTuerchen", thePlayer, "Paeckchen", "Du hast dein Türchen geöffnet, und hast 2 Päckchen erhalten!")
		givePlayerWeinachtsData(thePlayer, "wn:paeckchen", "PAECKCHEN", 2, tuerchen)
		closePlayerTuerchen(thePlayer, tuerchen)
	elseif(tuerchen == 12) then
		triggerClientEvent(thePlayer, "doLAClientShowWeinachtsTuerchen", thePlayer, "Palme", "Du hast dein Türchen geöffnet, und hast eine Palme erhalten!")
		givePlayerWeinachtsData(thePlayer, "wn:palmen", "PALMEN", 1, tuerchen)
		closePlayerTuerchen(thePlayer, tuerchen)
	elseif(tuerchen == 13) then
		triggerClientEvent(thePlayer, "doLAClientShowWeinachtsTuerchen", thePlayer, "Paeckchen", "Du hast dein Türchen geöffnet, und hast 2 Päckchen erhalten!")
		givePlayerWeinachtsData(thePlayer, "wn:paeckchen", "PAECKCHEN", 2, tuerchen)
		closePlayerTuerchen(thePlayer, tuerchen)
	elseif(tuerchen == 14) then
		triggerClientEvent(thePlayer, "doLAClientShowWeinachtsTuerchen", thePlayer, "Paeckchen", "Du hast dein Türchen geöffnet, und hast 2 Päckchen erhalten!")
		givePlayerWeinachtsData(thePlayer, "wn:paeckchen", "PAECKCHEN", 2, tuerchen)
		closePlayerTuerchen(thePlayer, tuerchen)
	elseif(tuerchen == 15) then
		triggerClientEvent(thePlayer, "doLAClientShowWeinachtsTuerchen", thePlayer, "Kaktus", "Du hast dein Türchen geöffnet, und hast einen Kaktus erhalten!")
		givePlayerWeinachtsData(thePlayer, "wn:kakteen", "KAKTEEN", 1, tuerchen)
		closePlayerTuerchen(thePlayer, tuerchen)
	elseif(tuerchen == 16) then
		-- SPECIAL --
		triggerClientEvent(thePlayer, "doLAClientShowWeinachtsTuerchen", thePlayer, "Foto machen", "Finde auf dem Server die schönste Stelle, und Fotografiere sie.\nPoste dann das gemachte Foto ins Forum. Das beste Bild gewinnt!\nDie Regeln stehen im Forum. Du hast ausserdem eine Palme erhalten.")
		givePlayerWeinachtsData(thePlayer, "wn:palmen", "PALMEN", 1, tuerchen)
		closePlayerTuerchen(thePlayer, tuerchen)
	elseif(tuerchen == 17) then
		triggerClientEvent(thePlayer, "doLAClientShowWeinachtsTuerchen", thePlayer, "Paeckchen", "Du hast dein Türchen geöffnet, und hast 3 Päckchen erhalten!")
		givePlayerWeinachtsData(thePlayer, "wn:paeckchen", "PAECKCHEN", 3, tuerchen)
		closePlayerTuerchen(thePlayer, tuerchen)
	elseif(tuerchen == 18) then
		-- SPECIAL --
		triggerClientEvent(thePlayer, "doLAClientShowWeinachtsTuerchen", thePlayer, "Status", "Du hast dein Türchen geöffnet, und hast einen \nSozialen Status: Schneemann erhalten!\nDu kannst ihn mit /applyweihnacht anwenden.")
		apply_data[thePlayer] = {}
		apply_data[thePlayer]["status"] = "Schneemann"
	elseif(tuerchen == 19) then
		triggerClientEvent(thePlayer, "doLAClientShowWeinachtsTuerchen", thePlayer, "Feuerwerk", "Du hast dein Türchen geöffnet, und hast \nBöller erhalten! Lass es mit /feuerwerk krachen!")
		givePlayerWeinachtsData(thePlayer, "wn:boeller", "BOELLER", 3, tuerchen)
		closePlayerTuerchen(thePlayer, tuerchen)
		-- SPECIAL --
	elseif(tuerchen == 20) then
		triggerClientEvent(thePlayer, "doLAClientShowWeinachtsTuerchen", thePlayer, "Objekte!", "Du hast dein Türchen geöffnet, und hast einen Kaktus,\neine Palme und einen Tannenbaum erhalten!")
		givePlayerWeinachtsData(thePlayer, "wn:kakteen", "KAKTEEN", 1, tuerchen)
		givePlayerWeinachtsData(thePlayer, "wn:palmen", "PALMEN", 1, tuerchen)
		givePlayerWeinachtsData(thePlayer, "wn:tannenbaeume", "TANNENBAEUME", 1, tuerchen)
		closePlayerTuerchen(thePlayer, tuerchen)
	elseif(tuerchen == 21) then
		triggerClientEvent(thePlayer, "doLAClientShowWeinachtsTuerchen", thePlayer, "Licht", "Du hast dein Türchen geöffnet, und hast ein platzierbares\nLicht erhalten!")
		givePlayerWeinachtsData(thePlayer, "wn:lichter", "LICHTER", 1, tuerchen)
		closePlayerTuerchen(thePlayer, tuerchen)
	elseif(tuerchen == 22) then
		triggerClientEvent(thePlayer, "doLAClientShowWeinachtsTuerchen", thePlayer, "Paeckchen", "Du hast dein Türchen geöffnet, und hast 5 Päckchen erhalten!")
		givePlayerWeinachtsData(thePlayer, "wn:paeckchen", "PAECKCHEN", 5, tuerchen)
		closePlayerTuerchen(thePlayer, tuerchen)
	elseif(tuerchen == 23) then
		triggerClientEvent(thePlayer, "doLAClientShowWeinachtsTuerchen", thePlayer, "Event", "In diesem Türchen versteckt sich ein Event der Serverleitung.\nEs findet im Dezember/Januar statt.\nWeitere Infos stehen im Forum.")
		givePlayerWeinachtsData(thePlayer, "wn:paeckchen", "PAECKCHEN", 5, tuerchen)
		closePlayerTuerchen(thePlayer, tuerchen)
	elseif(tuerchen == 24) then
		triggerClientEvent(thePlayer, "doLAClientShowWeinachtsTuerchen", thePlayer, "Paeckchen", "Du hast das Türchen geöffnet, \nund hast 50 Päckchen erhalten!\nAusserdem hast du etwas Feuerwerk erhalten.(/feuerwerk)")
		givePlayerWeinachtsData(thePlayer, "wn:paeckchen", "PAECKCHEN", 50, tuerchen)
		givePlayerWeinachtsData(thePlayer, "wn:boeller", "BOELLER", 5, tuerchen)
		closePlayerTuerchen(thePlayer, tuerchen)
	elseif(tuerchen == 31) then
		triggerClientEvent(thePlayer, "doLAClientShowWeinachtsTuerchen", thePlayer, "Feuerwerk", "Du hast das Türchen geöffnet. Es beinhaltet Feuerwerk!\nDu kannst es mit /feuerwerk verwenden.")
		givePlayerWeinachtsData(thePlayer, "wn:boeller", "BOELLER", 3, tuerchen)
		givePlayerWeinachtsData(thePlayer, "wn:raketen", "RAKETEN", 5, tuerchen)
		givePlayerWeinachtsData(thePlayer, "wn:batterien", "BATTERIEN", 1, tuerchen)
		givePlayerWeinachtsData(thePlayer, "wn:heuler", "HEULER", 5, tuerchen)
		givePlayerWeinachtsData(thePlayer, "wn:flimmervulkane", "FLIMMERVULKANE", 1, tuerchen)
		closePlayerTuerchen(thePlayer, tuerchen)
	end
end

function executePlayerWeihnachtsspecial(thePlayer)
	if not(apply_data[thePlayer]) then
		outputChatBox("Du kannst kein Ereignis annehmen!", thePlayer, 255, 0, 0)
		return;
	end
	if(getElementInterior(thePlayer) ~= 0) or (isPedInVehicle(thePlayer) == true) then
		outputChatBox("Du bist in einem Innenraum/Fahrzeug!", thePlayer, 255, 0, 0)
		return;
	end
	local data = apply_data[thePlayer]
	if(data == "Event1") then
		if(player_tuerchen[thePlayer][2] == 1) then
			outputChatBox("Diese Aktion hast du bereits ausgeführt!", thePlayer, 255, 0, 0)
			return;
		end
		triggerClientEvent(thePlayer, "applySpecialEvent", thePlayer, "1")
	elseif(data == "Event2") then
		if(player_tuerchen[thePlayer][9] == 1) then
			outputChatBox("Diese Aktion hast du bereits ausgeführt!", thePlayer, 255, 0, 0)
			return;
		end
		setElementPosition(thePlayer, -1818.3669433594, 581.42138671875, 234.890625)
		giveWeapon(thePlayer, 46, 1, true)
		outputChatBox("Skydive mit dem Fallschirm zu dem Punkt auf deinem Radar!", thePlayer, 255, 255, 0)
		outputChatBox("Du hast 20 Sekunden Zeit!", thePlayer, 255, 255, 0)
		triggerClientEvent(thePlayer, "applySpecialEvent", thePlayer, "2")
	elseif(type(data) == "table") then
		local status = data["status"]
		-- SICHERHEITSHINWEIS @ Leyynen Status setzen
		setElementData ( thePlayer, "socialState", status, true )
		outputChatBox("Dein neuer soialer Status lautet nun: "..status.."!", thePlayer, 0, 255, 0)
	end
end


addCommandHandler("applyweihnacht", executePlayerWeihnachtsspecial)

local function finishEventHandler(typ)
	if(typ == "1") then
		givePlayerWeinachtsData(source, "wn:paeckchen", "PAECKCHEN", 10, 2)
		closePlayerTuerchen(source, 2)
		outputChatBox("Du hast das Flugzeug gefunden, und somit 10 Päckchen erhalten!", source, 0, 255, 0)
	elseif(typ == "2") then
		setElementPosition(source, -1988.7596435547, 891.4931640625, 45.203125)
		givePlayerWeinachtsData(source, "wn:paeckchen", "PAECKCHEN", 50, 9)
		closePlayerTuerchen(source, 9)
		outputChatBox("Glückwunsch, du hast 50 Päckchen erhalten!", source, 0, 255, 0)
	end
end

addEventHandler("applySpecialEventFinish", getRootElement(), finishEventHandler)

--[[
addCommandHandler("givefeuerwerk", function(thePlayer, cmd, target)
	if(getPlayerSerial(thePlayer) == "34DB2BD91810CED4A7962B67AF49D8A3") then
		if(target) and (getPlayerFromName(target)) then
			thePlayer = getPlayerFromName(target)
		end
		givePlayerWeinachtsData(thePlayer, "wn:boeller", "BOELLER", 10, nil)
		givePlayerWeinachtsData(thePlayer, "wn:raketen", "RAKETEN", 10, nil)
		givePlayerWeinachtsData(thePlayer, "wn:batterien", "BATTERIEN", 10, nil)
		givePlayerWeinachtsData(thePlayer, "wn:heuler", "HEULER", 10, nil)
		givePlayerWeinachtsData(thePlayer, "wn:flimmervulkane", "FLIMMERVULKANE", 10, nil)
	end
end)
]]
