function setPlayerPokerAnimation ( player, table )

	local state = pokerData[table]["players"][player]["state"]
	-- AFK
	if state == 0 then
		setPedAnimation ( player, "ped", "SEAT_idle", -1, false, false, true )
	-- Out
	elseif state == 1 then
		setPedAnimation ( player, "ped", "SEAT_idle", -1, false, false, true )
	-- In
	else
		setPedAnimation ( player, "FOOD", "FF_Sit_Loop", -1, false, false, true )
	end
end

function getFreeCardFromStack ( table )

	while true do
		local i = math.random ( 1, 52 )
		if not pokerData[table]["cards"]["used"][i] then
			pokerData[table]["cards"]["used"][i] = true
			return i
		end
	end
end

function placePlayerAtPokerTable ( player, table )

	toggleAllControls ( player, false )
	local pos = getFreePokerTablePosition ( table, player )
	pokerData[table]["positions"][pos] = player
	local dim = pokerData[table]["id"]
	local int = pokerPlayerPositions["int"][pos]
	local x, y, z = pokerPlayerPositions["x"][pos], pokerPlayerPositions["y"][pos], pokerPlayerPositions["z"][pos]
	local rot = findRotation ( x, y, pokerChipPositions["x"][0], pokerChipPositions["y"][0] )
	setElementInterior ( player, int )
	setElementDimension ( player, dim )
	setElementPosition ( player, x, y, z )
	setPlayerPokerAnimation ( player, table )
	setPedRotation ( player, rot )
	
	return pos
end

function getPlayersOnPokerTable ( table )

	if pokerData[table]["players"] then
		local i = 0
		for _, _ in pairs ( pokerData[table]["players"] ) do
			i = i + 1
		end
		return i
	end
	return false
end

function getNextPokerPlayer ( cPos, table )

	for i = cPos, pokerData[table]["maxPlayers"] do
		if i ~= cPos then
			if pokerData[table]["positions"][i] then
				return i
			end
		end
	end
	for i = 1, cPos do
		if pokerData[table]["positions"][i] then
			return i
		end
	end
	return false
end

function getNextPokerPlayerInGame ( cPos, table )

	for i = cPos, pokerData[table]["maxPlayers"] do
		if i ~= cPos then
			if pokerData[table]["positions"][i] then
				if pokerData[table]["players"][getPlayerAtPos ( table, i )]["state"] == 2 then
					return i
				end
			end
		end
	end
	for i = 1, cPos do
		if pokerData[table]["positions"][i] then
			if pokerData[table]["players"][getPlayerAtPos ( table, i )]["state"] == 2 then
				return i
			end
		end
	end
	return false
end

function setPlayerAFK ( player, bool )

	
end

function getPokerPlayersInGame ( table )

	local i = 0
	local player
	for i = 1, pokerSettings.maxPlayersPerTable do
		player = getPlayerAtPos ( table, i )
		if player then
			if pokerData[table]["players"][player]["state"] and pokerData[table]["players"][player]["state"] == 2 then
				i = i + 1
			end
		end
	end
	return i
end

function getPlayerAtPos ( table, pos )

	return pokerData[table]["positions"][pos]
end

function readyForNextRound ( table )

	curCall = getHighestBetOnTable ( table )
	if not pokerData[table]["smallBlindHasDrawn"] then
		return false
	end
	for key, index in pairs ( pokerData[table]["players"] ) do
		if not ( isPlayerAllIn ( key ) or curCall == pokerData[table]["players"][key]["curBet"] or isPlayerOut ( key ) ) then
			return false
		end
	end
	return true
end

--[[
#########################
##########Blinds#########
#########################
]]
function moveOnBlinds ( table )

	pokerData[table]["smallBlindPosition"] = getNextPokerPlayer ( pokerData[table]["smallBlindPosition"], table )
end

function getHighestBetOnTable ( table )

	local c1, c2
	c1 = 0
	for key, index in pairs ( pokerData[table]["players"] ) do
		c2 = pokerData[table]["players"][key]["curBet"]
		if c2 > c1 then
			c1 = c2
		end
	end
	return c1
end

function checkForBlindIncrease ( table )

	if pokerData[table]["increaseBlinds"] >= 1 then
		local val = pokerData[table]["curRound"] / pokerData[table]["increaseBlinds"]
		if val == math.floor ( val ) then
			local SBV = pokerData[table]["basicBlind"] * ( val + 1 )
			pokerData[table]["blind"] = SBV
			outputPokerText ( "Blinds werden erhoeht auf "..SBV.." und "..(SBV*2).."!", table, 200, 200, 0 )
		end
	end
end

function takeBlindMoneyFromPlayers ( table )

	local smallBlind = pokerData[table]["blind"]
	local bigBlind = smallBlind * 2
	
	local pos = pokerData[table]["smallBlindPosition"]
	
	local smallBlindPlayer = getPlayerAtPos ( table, pos )
	local bigBlindPlayer = getPlayerAtPos ( table, getNextPokerPlayer ( pos, table ) )
	local smallBlindPlayerMoney = pokerData[table]["players"][smallBlindPlayer]["money"]
	local bigBlindPlayerMoney = pokerData[table]["players"][bigBlindPlayer]["money"]
	
	local pot = 0
	
	if smallBlindPlayerMoney <= smallBlind then
		pokerData[table]["players"][smallBlindPlayer]["curBet"] = smallBlindPlayerMoney
		pot = pot + smallBlindPlayerMoney
		smallBlindPlayerMoney = 0
	else
		pokerData[table]["players"][smallBlindPlayer]["curBet"] = smallBlind
		pot = pot + smallBlind
		smallBlindPlayerMoney = smallBlindPlayerMoney - smallBlind
	end
	if bigBlindPlayerMoney <= bigBlind then
		pokerData[table]["players"][bigBlindPlayer]["curBet"] = bigBlindPlayerMoney
		pot = pot + bigBlindPlayerMoney
		bigBlindPlayerMoney = 0
	else
		pokerData[table]["players"][bigBlindPlayer]["curBet"] = bigBlind
		pot = pot + bigBlind
		bigBlindPlayerMoney = bigBlindPlayerMoney - bigBlind
	end
	
	pokerData[table]["players"][smallBlindPlayer]["money"] = smallBlindPlayerMoney
	pokerData[table]["players"][bigBlindPlayer]["money"] = bigBlindPlayerMoney
end

function isPlayerAllIn ( player )

	return ( pokerData[pokerData["players"][player]]["players"]["money"] == 0 )
end

-- CHANGEME!!! --
function takePlayerPokerMoney ( player, amount )
	vnxSetElementData ( player, "casinoChips", vnxGetElementData ( player, "casinoChips" ) + amount )
end
function givePlayerPokerMoney ( player, amount )
	vnxSetElementData ( player, "casinoChips", vnxGetElementData ( player, "casinoChips" ) + amount )
end
-- CHANGEME!!! --

function outputPokerText ( msg, table, r, g, b )

	for key, index in pairs ( pokerData[table]["players"] ) do
		if not r or not g or not b then
			r, g, b = 200, 200, 0
		end
		outputChatBox ( msg, key, r, g, b )
	end
end
function outputPokerTextForPlayer ( msg, player, r, g, b )

	if not r or not g or not b then
		r, g, b = 200, 200, 0
	end
	outputChatBox ( msg, player, r, g, b )
end

function getPlayerPokerTable ( player )

	return pokerData["players"][player]
end

function getPlayerPokerBet ( player )

	local table = getPlayerPokerTable ( player )
	return pokerData[table]["players"][player]["money"]
end

function setPlayerPokerBet ( player, amount )

	local table = getPlayerPokerTable ( player )
	pokerData[table]["players"][player]["curBet"] = amount
end