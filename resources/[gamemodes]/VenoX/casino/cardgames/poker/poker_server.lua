pokerData = {}
	pokerData["players"] = {}

local curPokerID = 0

function startNewPokerTable_func ( name, buyIn, increasingBlinds, fun, password )

	pdebug ( "Create new poker table" )
	local player = client
	local name = tostring ( name )
	buyIn = formCardNumber ( buyIn )
	
	local rounds
	if increasingBlinds then
		rounds = 5
	else
		rounds = -1
	end
	local maxPlayers = 7
	
	if buyIn >= 20 then
		if maxPlayers <= pokerSettings.maxPlayersPerTable then
			if name ~= "" then
				local blind = formCardNumber ( buyIn / 100 * 5 )
				if blind < 2 then
					blind = 2
				end
				
				if fun then
					fun = false
				else
					fun = true
				end
				if password == "" then
					password = false
				end
				createNewPokerTable ( player, name, blind, buyIn, rounds, password, maxPlayers, fun )
			else
				outputChatBox ( "Ungueltiger Name!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Ungueltige Spielerzahl: Maximal "..pokerSettings.maxPlayersPerTable.."!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Ungueltiger Einsatz: Mindestens "..pokerSettings.minBuyIn..", maximal "..pokerSettings.maxBuyIn, player, 125, 0, 0 )
	end
end
addEvent ( "startNewPokerTable", true )
addEventHandler ( "startNewPokerTable", getRootElement(), startNewPokerTable_func )

function getAvailablePokerTables_func ()

	pdebug ( "Recieve data from players" )
	for key, index in pairs ( pokerData ) do
		if isElement ( client ) then
			local players = getPlayersOnPokerTable ( key )
			local fixa, fixb
			
			if pokerData[key]["password"] then
				fixa = " [x]"
			else
				fixa = " [_]"
			end
			if pokerData[key]["fun"] then
				fixb = "     [_]"
			else
				fixb = "     [x]"
			end
			-- !!!
			if pokerData[key]["maxPlayers"] then
				triggerClientEvent ( client, "recieveAvailablePokerTable", client, pokerData[key]["name"], pokerData[key]["buyIn"], players.."/"..pokerData[key]["maxPlayers"], fixa, fixb, key )
			end
		else
			break
		end
	end
end
addEvent ( "getAvailablePokerTables", true )
addEventHandler ( "getAvailablePokerTables", getRootElement(), getAvailablePokerTables_func )

function joinPokerTableByID_func ( id, password )

	pdebug ( "Join by ID" )
	local player = client
	id = tonumber ( id )
	if id then
		local pw = pokerData[id]["password"]
		if not pw or password == pw then
			setPlayerJoinPokerTable ( player, id )
		else
			outputPokerTextForPlayer ( "Falsches Passwort!", player, 200, 0, 0 )
		end
	end
end
addEvent ( "joinPokerTableByID", true )
addEventHandler ( "joinPokerTableByID", getRootElement(), joinPokerTableByID_func )

function getFreePokerTablePosition ( table, player )

	local i = 0
	for i = 1, pokerData[table]["maxPlayers"] do
		if not pokerData[table]["positions"][i] then
			pokerData[table]["positions"][i] = player
			return i
		end
	end
	return false
end

function createNewPokerTable ( player, name, blind, buyIn, rounds, password, maxPlayers, fun )

	blind = formCardNumber ( blind )
	buyIn = formCardNumber ( buyIn )
	rounds = formCardNumber ( rounds )
	maxPlayers = formCardNumber ( maxPlayers )
	if isElement ( player ) then
		-- CHANGEME --
		if vnxGetElementData ( player, "money" ) >= buyIn or fun then
			if maxPlayers <= 7 and maxPlayers >= 2 then
				curPokerID = curPokerID + 1
				pokerData[curPokerID] = {}
					pokerData[curPokerID]["id"] = curPokerID
					pokerData[curPokerID]["name"] = name
					pokerData[curPokerID]["basicBlind"] = blind
					pokerData[curPokerID]["blind"] = blind
					if password == "" then password = false end
					pokerData[curPokerID]["password"] = password
					pokerData[curPokerID]["maxPlayers"] = maxPlayers
					pokerData[curPokerID]["fun"] = fun
					pokerData[curPokerID]["curRound"] = 0
					pokerData[curPokerID]["curPot"] = 0
					pokerData[curPokerID]["increaseBlinds"] = rounds
					pokerData[curPokerID]["buyIn"] = buyIn
					pokerData[curPokerID]["smallBlindPosition"] = 0
					pokerData[curPokerID]["started"] = false
					
					pokerData[curPokerID]["positions"] = {}
					pokerData[curPokerID]["players"] = {}
					for i = 1, maxPlayers do
						pokerData[curPokerID]["positions"][i] = false
					end
				
				setPlayerJoinPokerTable ( player, curPokerID )
			end
		end
	end
end

function setPlayerJoinPokerTable ( player, table )

	pdebug ( "Poker Player join" )
	local fun = pokerData[table]["fun"]
	if not fun then
		takePlayerPokerMoney ( player, pokerData[table]["buyIn"] )
	end
	
	pokerData[table]["players"][player] = {}
		pokerData[table]["players"][player]["money"] = pokerData[table]["buyIn"]
		pokerData[table]["players"][player]["curBet"] = 0
		pokerData[table]["players"][player]["state"] = 1
	
	pokerData["players"][player] = table
	
	addLeaveEvents ( player, table )
	local pos = placePlayerAtPokerTable ( player, table )
	setPlayerPokerAnimation ( player, table )
	
	pokerData[table]["players"][player]["position"] = pos
	
	refreshChipsOnTableForAllPlayers ( table )
	
	triggerClientEvent ( player, "joinPokerTable", player, table )
	
	setTimer ( checkPokerRoundForToStart, 3000, 1, table )
end

function checkPokerRoundForToStart ( table )

	pdebug ( "PRK start Check" )
	if not pokerData[table]["started"] then
	-- DEBUG BOOKMARK CHANGEME
		if getPlayersOnPokerTable ( table ) > 1 then
			pdebug ( "Start PKR..." )
			pokerData[table]["curRound"] = pokerData[table]["curRound"] + 1
			pokerData[table]["started"] = true
			pokerData[table]["curPlayerAtDraw"] = 0
			
			pokerData[table]["curPosRoundStart"] = 0
			pokerData[table]["curPosAtDraw"] = 0
			
			local player
			for i = 1, pokerSettings.maxPlayersPerTable do
				player = getPlayerAtPos ( table, i )
				if player then
					if pokerData[table]["players"][player]["state"] > 0 then
						pokerData[table]["players"][player]["state"] = 2
					end
				end
			end
			
			pokerData[table]["phase"] = 0
			pokerData[table]["cards"] = {}
			pokerData[table]["cards"]["used"] = {}
			handleBlinds ( table )
			outputPokerText ( "Neue Runde startet...", table, 200, 200, 0 )
			pokerData[table]["highestBet"] = getHighestBetOnTable ( table )
			refreshChipsOnTableForAllPlayers ( table )
			giveOutHandCards ( table )
			proceedWithGame ( table )
		end
	end
end

function giveOutHandCards ( table )

	local card1, card2
	for key, index in pairs ( pokerData[table]["players"] ) do
		if key then
			outputChatBox ( "GNARFY: "..tostring ( key ) )
			outputChatBox ( "GNARFY: "..tostring ( getPlayerName ( key ) ) )
			card1 = getFreeCardFromStack ( table )
			card2 = getFreeCardFromStack ( table )
			pokerData[table]["players"][key]["handCard1"] = card1
			pokerData[table]["players"][key]["handCard2"] = card2
			triggerClientEvent ( key, "setHandCards", key, card1, card2 )
		end
	end
end

function proceedWithGame ( table )

	pdebug ( "Proceed" )
	if pokerData[table]["phase"] == 5 or getPokerPlayersInGame ( table ) <= 1 then
		getPokerWinner ( table )
	else
		if pokerData[table]["phase"] == 0 then
			pdebug ( "New Betround No. "..pokerData[table]["phase"] )
			pokerData[table]["curPosAtDraw"] = getNextPokerPlayerInGame ( pokerData[table]["curPosAtDraw"], table )
			pokerData[table]["smallBlindHasDrawn"] = false
			startNewBetRound ( table )
		elseif pokerData[table]["phase"] == 1 then
			-- Show Flop
		elseif pokerData[table]["phase"] == 2 then
			-- Show Turn
		elseif pokerData[table]["phase"] == 3 then
			-- Show River
		elseif pokerData[table]["phase"] == 4 then
			-- Last Betround
		end
	end
end

function startNewBetRound ( table )

	checkForNextInBetRound ( table )
end

function checkForNextInBetRound ( table )

	if readyForNextRound ( table ) then
		proceedWithGame ( table )
	else
		local pos = pokerData[table]["curPosAtDraw"]
		showActionWindowForPlayer ( table, pos )
	end
end

function showActionWindowForPlayer ( table, pos )

	pdebug ( "Pos: "..tostring ( pos ) )
	local player = getPlayerAtPos ( table, pos )
	local ownBet = pokerData[table]["players"][player]["curBet"]
	local min = pokerData[table]["players"][player]["curBet"]
	local ownMoney = pokerData[table]["players"][player]["money"]
	triggerClientEvent ( player, "showPlayerActionWindow", player, ownBet, min, ownMoney )
end

function finishDraw_func ( action, amount )

	if action and client then
		local player = client
		-- BOOKMARK
		local table = getPlayerPokerTable ( player )
		if getNextPokerPlayer ( pokerData[table]["curPosAtDraw"] - 1, table ) == player and pokerData[table]["players"][player]["state"] == 2 then
			if action == "call" then
				
			elseif action == "raise" then
				amount = math.abs ( math.floor ( tonumber ( amount ) ) ) - getPlayerPokerBet ( player )
				min = math.floor ( getHighestBetOnTable ( table ) + 1 ) - getPlayerPokerBet ( player )
				if amount >= min then
					if getPlayerPokerMoney ( player ) >= amount then
						takePlayerPokerMoney ( player, amount )
					else
						outputPokerTextForPlayer ( "Du hast nicht mehr genug Chips übrig!", player, 125, 0, 0 )
					end
				else
					outputPokerTextForPlayer ( "Du musst mindestens "..min.." setzen ( 1.5-Fache des akt. Calls )", player, 125, 0, 0 )
				end
			elseif action == "fold" then
				pokerData[table]["players"][player]["state"] = 1
			elseif action == "allin" then
				setPlayerPokerBet ( player, getPlayerPokerBet ( player ) + getPlayerPokerMoney ( player ) )
			-- Leave
			else
				setPlayerLeavePokerTable ( player )
			end
			triggerClientEvent ( player, "hidePokerActionWindow" )
			proceedWithGame ( table )
		end
	end
end
addEvent ( "finishDraw", true )
addEventHandler ( "finishDraw", getRootElement(), finishDraw_func )

function getPokerWinner ( table )

	outputChatBox ( "Poker Finished." )
end

function handleBlinds ( table )

	pdebug ( "Blind Handle" )
	checkForBlindIncrease ( table )
	moveOnBlinds ( table )
	takeBlindMoneyFromPlayers ( table )
end

function addLeaveEvents ( player, table )

	--[[
	TODO: Death / Disconnect
	]]
end

function refreshChipsOnTableForAllPlayers ( table )

	pdebug ( "Chip refresh (all)" )
	for key, index in pairs ( pokerData[table]["players"] ) do
		refreshChipsOnTable ( key, table )
	end
end

function refreshChipsOnTable ( player, table )

	pdebug ( "Chip refresh for "..tostring(getPlayerName(player)) )
	local money = {}
	for key, index in pairs ( pokerData[table]["players"] ) do
		local pos, amount, blind, inState
		
		pos = pokerData[table]["players"][key]["position"]
		amount = pokerData[table]["players"][key]["money"]
		blind = pokerData[table]["smallBlindPosition"]
		if blind == pos then
			blind = "sb"
		elseif getNextPokerPlayer ( blind, table ) == pos then
			blind = "bb"
		else
			blind = "none"
		end
		inState = pokerData[table]["players"][key]["state"]
		if inState == 1 then
			if isPlayerAllIn ( key ) then
				inState = "ALL-IN"
			else
				inState = "In"
			end
		elseif inState == 0 then
			inState = "AFK"
		else
			inState = "Out"
		end
		triggerClientEvent ( player, "recievePokerChipData", player, pos, amount, blind, inState )
	end
end

-- DEBUG --
function pdebug ( msg )

	msg = tostring ( msg )
	outputChatBox ( msg )
	outputDebugString ( msg )
end
-- DEBUG --