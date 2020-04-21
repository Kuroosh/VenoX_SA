usedAuktionIDs = {}
local validAuktionTypes = {
["Drug"]=true, 
["Mats"]=true, 
["Veh"]=true, 
["Houses"]=true, 
["Prestige"]=true, 
["Garages"]=true, 
["Special"]=true }


function makeOffer_func ( typ, startGebot, description, timeToRun, count )
	local startGebot = math.floor ( math.abs ( startGebot ) )
	local count = math.floor ( math.abs ( count ) )
	local player = client
	local pname = getPlayerName ( player )
	if typ and description and startGebot and tonumber ( timeToRun ) and ( tonumber ( count ) or count == nil ) then
		local validValues = true
		local auktionID = getFreeAuktionID ()
		local ID = auktionID
		if typ == "Veh" then
			local veh = _G["privVeh"..pname..count]
			if isElement ( veh ) then
				dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=? AND ??=?", "vehicles", "AuktionsID", ID, "UID", playerUID[pname], "Slot", count )
				destroyElement ( _G["privVeh"..pname..count] )
				outputChatBox ( "Du hast dein Fahrzeug in Slot Nr. "..count.." zur Auktion gestellt!", player, 0, 125, 0 )
				count = getElementModel ( _G["privVeh"..pname..count] )
			else
				validValues = false
				outputChatBox ( "Du hast kein Fahrzeug in diesem Slot / Du musst dein Fahrzeug zuerst respawnen!", player, 125, 0, 0 )
			end
			outputChatBox ( "Vorruebergehend deaktiviert.", player, 125, 0, 0 )
			return true
		elseif typ == "Mats" then
			local mats = vnxGetElementData ( player, "mats" )
			if mats >= count then
				vnxSetElementData ( player, "mats", mats - count )
				outputChatBox ( "Gebot eingestellt!", player, 0, 125, 0 )
			else
				validValues = false
				outputChatBox ( "Du hast nicht genug Materialien dafuer!", player, 125, 0, 0 )
			end
		elseif typ == "Drug" then
			local drugs = vnxGetElementData ( player, "drugs" )
			if drugs >= count then
				vnxSetElementData ( player, "drugs", drugs - count )
				outputChatBox ( "Gebot eingestellt!", player, 0, 125, 0 )
			else
				validValues = false
				outputChatBox ( "Du hast nicht genug Drogen dafuer!", player, 125, 0, 0 )
			end
		elseif typ == "Houses" then
			if vnxGetElementData ( player, "housekey" ) > 0 then
				outputChatBox ( "Du hast dein Haus erfolgreich zum Verkauf angeboten!", player, 0, 125, 0 )
			else
				validValues = false
				outputChatBox ( "Du besitzt kein Haus!", player, 125, 0, 0 )
			end
		elseif typ == "Prestige" then
			local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "UID", "prestige", "UID", playerUID[getPlayerName ( player )] ), -1 )
			if result and result[1] then
				outputChatBox ( "Du hast dein Prestige-Objekt erfolgreich zum Verkauf angeboten!", player, 0, 125, 0 )
			else
				validValues = false
				outputChatBox ( "Du besitzt kein Prestige-Objekt!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Nicht verfuegbar.", player, 125, 0, 0 )
			count = 0
		end
		if validValues then
			_G["cur"..typ.."Offers"] = _G["cur"..typ.."Offers"] + 1
			_G[typ.."Offers"][ID] = {
				["typ"] = typ,
				["Anbieter"] = pname,
				["Hoechstbietender"] = "-",
				["Hoechstgebot"] = startGebot,
				["Beschreibung"] = description,
				["Anzahl"] = count }
			
			outputServerLog ( "BuyIt-Log: Offer: ID: "..ID..", Von "..pname..", Anzahl: "..count..", Startgebot: "..startGebot )
			
			local time = getRealTime()
			local minute = time.minute
			local hour = time.hour
			local yearday = time.yearday
			local year = time.year + 1900
			
			timeToRunOptical = calcTimeToRunOptical ( minute + timeToRun, hour, yearday, year )
			timeToRun = formatDateToInteger ( minute + timeToRun, hour, yearday, year )
			local result = dbExec ( handler, "INSERT INTO ?? (ID, typ, Anbieter, Hoechstbietender, Hoechstgebot, LaeuftBis, Beschreibung, OptischesDatum, Anzahl) VALUES (?,?,?,?,?,?,?,?,?)", "buyit", "ID", "typ", "AnbieterUID", "HoechstbietenderUID", "Hoechstgebot", "LaeuftBis", "Beschreibung", "OptischesDatum", "Anzahl", auktionID, typ, playerUID[pname], 0, startGebot, timeToRun, description, timeToRunOptical, count )
			if not result then
				outputDebugString("[makeOffer_func] Error executing the query")
			end
			_G[typ.."Offers"][ID]["LaeuftBis"] = timeToRun
			_G[typ.."Offers"][ID]["OptischesDatum"] = timeToRunOptical
		end
	end
end
addEvent ( "makeOffer", true )
addEventHandler ( "makeOffer", getRootElement(), makeOffer_func )



function globalBuyItCheck ()

	local time = getRealTime()
	local minute = time.minute
	local hour = time.hour
	local yearday = time.yearday
	local year = time.year + 1900
	
	curtime = formatDateToInteger ( minute, hour, yearday, year )
	
	for typ, indexOut in pairs ( validAuktionTypes ) do
		for key, index in pairs ( _G[typ.."Offers"] ) do
			local diff = _G[typ.."Offers"][key]["LaeuftBis"] - curtime
			if diff <= 0 then
				endAuktion ( key, typ )
			elseif diff <= 20 then
				setTimer ( endAuktion, diff*60000, 1, key, typ )
			end
		end
	end
	setTimer ( globalBuyItCheck, 1200000, 1 )
end

function endAuktion ( id, typ )

	anbieter = _G[typ.."Offers"][id]["Anbieter"]
	hoechstbietender = _G[typ.."Offers"][id]["Hoechstbietender"]
	hoechstgebot = _G[typ.."Offers"][id]["Hoechstgebot"]
	anzahl = _G[typ.."Offers"][id]["Anzahl"]
	
	outputServerLog ( "BuyIt-Log: Ende der Auktion: ID: "..id..", Von "..anbieter..", An: "..hoechstbietender..", Anzahl: "..anzahl..", Gebot: "..hoechstgebot )
	
	if not hoechstbietender == "" and not hoechstbietender == "-" then
		buyItMoneyChange ( anbieter, hoechstgebot )
		sendBuyItMessage ( anbieter, "Dein Angebot bei BuyIt.com wurde erfolgreich versteigert! Du erhaelst "..hoechstgebot.." $!" )
		sendBuyItMessage ( hoechstbietender, "Du hast bei BuyIt.com ein Objekt ersteigert!" )
		buyItGiveItem ( typ, hoechstbietender, anzahl, id, anbieter )
	else
		sendBuyItMessage ( anbieter, "Dein Angebot bei BuyIt.com wurde leider nicht ersteigert." )
		buyItGiveItem ( typ, anbieter, anzahl, id, anbieter )
	end
	
	_G["cur"..typ.."Offers"] = _G["cur"..typ.."Offers"] - 1
	
	--[[
	curDrugOffers = 0
	curMatsOffers = 0
	curVehOffers = 0
	curHousesOffers = 0
	curPrestigeOffers = 0
	curGaragesOffers = 0
	curSpecialOffers = 0	
	]]
	
	dbExec ( handler, "DELETE FROM ?? WHERE ??=?", "buyit", "ID", id )
	
	_G[typ.."Offers"][id] = nil
	usedAuktionIDs[id] = nil
end

function buyItGiveItem ( typ, pname, anzahl, id, offerer )

	outputDebugString ( tostring (typ).."|"..tostring(pname).."|"..tostring(anzahl).."|"..tostring(id) )
	local ingame = getPlayerFromName ( pname )
	if typ == "Drug" then
		if isElement ( ingame ) and vnxGetElementData ( ingame, "loggedin" ) and vnxGetElementData ( ingame, "loggedin" ) == 1 then
			vnxSetElementData ( ingame, "drugs", vnxGetElementData ( ingame, "drugs" ) + anzahl )
		else
			local drugs = tonumber ( dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Drogen", "userdata", "UID", playerUID[pname] ), -1 )[1]["Drogen"] )
			dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "Drogen", drugs + anzahl, "UID", playerUID[pname] )
		end
	elseif typ == "Mats" then
		if isElement ( ingame ) and vnxGetElementData ( ingame, "loggedin" ) and vnxGetElementData ( ingame, "loggedin" ) == 1 then
			vnxSetElementData ( ingame, "mats", vnxGetElementData ( ingame, "mats" ) + anzahl )
		else
			local mats = tonumber ( dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Materials", "inventar", "UID", playerUID[pname] ), -1 )[1]["Materials"] )
			dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "inventar", "Materials", mats + anzahl, "UID", playerUID[pname] )
		end
	elseif typ == "Veh" then
		dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "vehicles", "UID", playerUID[pname], "AuktionsID", id )
	elseif typ == "Prestige" then
		dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "prestige", "UID", playerUID[pname], "UID", playerUID[offerer] )
	elseif typ == "Houses" then
		dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "houses", "UID", playerUID[pname], "UID", playerUID[offerer] )
		local key = tonumber ( dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "ID", "houses", "UID", playerUID[pname] ), -1 )[1]["ID"] )
		if isElement ( getPlayerFromName ( pname ) ) then
			vnxSetElementData ( getPlayerFromName ( pname ), "housekey", key )
		end
		if isElement ( getPlayerFromName ( offerer ) ) then
			vnxSetElementData ( getPlayerFromName ( offerer ), "housekey", 0 )
		end
	elseif typ == "Special" then
		sendBuyItMessage ( pname, "Du hast etwas besonderes ersteigert - ein Administrator wird sich in kuerze bei dir melden!" )
		sendBuyItMessage ( "[Vio]Zipper", pname.." hat eine Sonderauktion gewonnen." )
	end
end

function getDataForObjectList_func ( typ )

	local player = client
	local i = 0
	local dataString = ""
	
	local time = getRealTime()
	local year = time.year + 1900
	
	for key, index in pairs ( _G[typ.."Offers"] ) do
		i = i + 1
		local date = calcTimeToRunOptical ( _G[typ.."Offers"][key]["LaeuftBis"], 0, 0, year )
		dataString = dataString..key.."|".._G[typ.."Offers"][key]["Anbieter"].."|".._G[typ.."Offers"][key]["Hoechstgebot"].."|"..date.."|".._G[typ.."Offers"][key]["Anzahl"].."|".._G[typ.."Offers"][key]["Hoechstbietender"].."|~"
	end
	triggerClientEvent ( player, "recieveDataForObjectList", getRootElement(), i, dataString )
end
addEvent ( "getDataForObjectList", true )
addEventHandler ( "getDataForObjectList", getRootElement(), getDataForObjectList_func )

function getDescriptionForObject_func ( typ, id )

	triggerClientEvent ( client, "recieveDescriptionForObject", getRootElement(), _G[typ.."Offers"][id]["Beschreibung"], id )
end
addEvent ( "getDescriptionForObject", true )
addEventHandler ( "getDescriptionForObject", getRootElement(), getDescriptionForObject_func )



function betForObject_func ( typ, id, gebot )

	local player = client
	local gebot = math.abs ( math.floor ( gebot ) )
	local id = tonumber ( id ) 
	if _G[typ.."Offers"][id]["LaeuftBis"] then
		local curGebot = tonumber ( _G[typ.."Offers"][id]["Hoechstgebot"] )
		local hoechstbietender = _G[typ.."Offers"][id]["HoechstbietenderUID"]
		local pname = getPlayerName ( player )
		if curGebot < gebot then
			local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=? AND ?? LIKE ?", "HoechstbietenderUID", "buyit", "HoechstbietenderUID", playerUID[pname], "Typ", typ ), -1 )
			if not result or not result[1] then
				if vnxGetElementData ( player, "bankmoney" ) >= gebot then
					local betOK = true
					if typ == "Veh" then
						local carslot = buyItGetFreeCarslot ( pname )
						if carslot then
							vnxSetElementData ( player, "carslot"..carslot, 3 )
						else
							betOK = false
							reason = "Du hast keinen freien Fahrzeugslot!"
						end
					elseif typ == "House" then
						if vnxGetElementData ( player, "housekey" ) > 0 then
							betOK = false
							reason = "Du hast bereits ein Haus!"
						end
					elseif typ == "Prestige" then
						local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "UID", "prestige", "UID", playerUID[pname] ), -1 )
						if result and result[1] then
							betOK = false
							reason = "Du hast bereits ein Prestige-Objekt!"
						end
					end
					if betOK then
						-- Ehemaliger Hoechstbietender --
						outputServerLog ( "BuyIt-Log: Bet: Von "..pname..", Typ: "..typ..", Gebot: "..gebot..", ID: "..id )
						local target = getPlayerFromName ( hoechstbietender )
						if target then
							if typ == "Veh" then
								for i = 1, 10 do
									if vnxGetElementData ( target, "carslot"..i ) == 3 then
										vnxSetElementData ( target, "carslot"..i, 0 )
										break
									end
								end
							end
							outputChatBox ( "Du wurdest soeben von "..pname.." ueberboten!", target, 125, 0, 0 )
							vnxSetElementData ( target, "bankmoney", vnxGetElementData ( target, "bankmoney" ) + curGebot )
						elseif hoechstbietender ~= "-" then
							local money = tonumber ( dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Bankgeld", "userdata", "UID", playerUID[hoechstbietender] ), -1 )[1]["Bankgeld"] )
							dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "Bankgeld", money + curGebot, "UID", playerUID[hoechstbietender] )
							buyItSendMail ( hoechstbietender.."@FORUMADRESSE", "Du wurdest bei einer Auktion von "..pname.." ueberboten!" )
						end
						-- Aktueller Hoechstbietender --
						vnxSetElementData ( player, "bankmoney", vnxGetElementData ( player, "bankmoney" ) - gebot )
						outputChatBox ( "Du hast dein Gebot erfolgreich abgegeben und bist nun Hoechstbietender!", player, 0, 125, 0 )
						outputChatBox ( "Wir werden dich ueber den weiteren Verlauf der Auktion informieren!", player, 0, 125, 0 )
						-- Auktionsdatei (InGame) --
						_G[typ.."Offers"][id]["Hoechstbietender"] = pname
						_G[typ.."Offers"][id]["Hoechstgebot"] = gebot
						-- Auktionsdatei (MySQL) --
						dbExec ( handler, "UPDATE ?? SET ??=?, ??=? WHERE ??=?", "buyit", "Hoechstbietender", playerUID[pname], "Hoechstgebot", gebot, "ID", ID )
					else
						outputChatBox ( reason, player, 125, 0, 0 )
					end
				end
			else
				outputChatBox ( "Du kannst nur auf einen Artikel der selben Kathegorie zur gleichen Zeit bieten.", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Dein aktuelles Gebot ist zu niedrig! Bitte aktualisiere deine Seite!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Die Auktion ist beendet. Bitte aktualisiere deine Seite!", player, 125, 0, 0 )
	end
end
addEvent ( "betForObject", true )
addEventHandler ( "betForObject", getRootElement(), betForObject_func )

function getMarketValues_func ()

	if source == client then
		triggerClientEvent ( source, "refreshMarketValues", source, curDrugOffers, curMatsOffers, curVehOffers, curHousesOffers, curPrestigeOffers, curGaragesOffers, curSpecialOffers )
	end
end
addEvent ( "getMarketValues", true )
addEventHandler ( "getMarketValues", getRootElement(), getMarketValues_func )