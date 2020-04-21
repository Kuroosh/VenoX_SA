blackJackCards = {}

function blackjackStart_func ()

	setElementDimension ( client, 1 )
end
addEvent ( "blackjackStart", true )
addEventHandler ( "blackjackStart", getRootElement(), blackjackStart_func )

function startBlackJack_func ( amount )

	local player = client
	if player == source then
		if not vnxGetElementData ( player, "blackJackStarted" ) then
			vnxSetElementData ( player, "blackJackStarted", true )
			amount = math.abs ( math.floor ( tonumber ( amount ) ) )
			local chips = vnxGetElementData ( player, "casinoChips" )
			if amount <= chips then
				if amount <= calcPlayerMaxGambleBet ( player, 1 ) then
					if amount > 0 then
						vnxSetElementData ( player, "curBlackJackBet", amount )
						vnxSetElementData ( player, "casinoChips", chips - amount )
						blackJackCards[player] = {}
						blackJackCards[player]["used"] = {}
						blackJackCards[player]["player"] = {}
						blackJackCards[player]["dealer"] = {}
						for i = 1, 5 do
							blackJackCards[player]["player"][i] = false
							blackJackCards[player]["dealer"][i] = false
						end
						blackJackCards[player]["dealer"][1] = getBlackJackCard ( player )
						
						blackJackCards[player]["player"][1] = getBlackJackCard ( player )
						blackJackCards[player]["player"][2] = getBlackJackCard ( player )
						blackJackCards[player]["playerCardCount"] = 2
						blackJackCards[player]["dealerCardCount"] = 1
						
						local val = getBlackJackHandValueText ( blackJackCards[player]["player"][1], blackJackCards[player]["player"][2], nil )
						
						if val == "21" then
							setTimer ( endBlackJackCardDrawPlayer, 3000, 1, player )
							triggerClientEvent ( player, "startBlackJack", player, blackJackCards[player]["dealer"][1], blackJackCards[player]["player"][1], blackJackCards[player]["player"][2], val )
						else
							triggerClientEvent ( player, "startBlackJack", player, blackJackCards[player]["dealer"][1], blackJackCards[player]["player"][1], blackJackCards[player]["player"][2], val )
						end
					end
				else
					infobox ( "Dafuer ist dein\nSpielerskill nicht\nhoch genug!\nMaximaleinsatz:\n"..calcPlayerMaxGambleBet ( player, 1 ).." $", 5000, 125, 0, 0 )
				end
			end
		else
			outputChatBox ( "ERROR: Invalid value detected!", player, 200, 0, 0 )
		end
	end
end
addEvent ( "startBlackJack", true )
addEventHandler ( "startBlackJack", getRootElement(), startBlackJack_func )

function getBlackJackCard ( player )

	local card
	local i = 0
	while true and i < 100 do
		card = math.random ( 1, 52 )
		if not blackJackCards[player]["used"][card] then
			blackJackCards[player]["used"][card] = true
			break
		else
			i = i + 1
		end
	end
	return card
end

function getNextBlackJackCardPlayer_func ()

	local player = client
	if source == player then
		local i = blackJackCards[player]["playerCardCount"] + 1
		blackJackCards[player]["playerCardCount"] = i
		if i == 6 then
			endBlackJackCardDrawPlayer ( player )
		else
			blackJackCards[player]["player"][i] = getBlackJackCard ( player )
			local handValue = getBlackJackHandValue ( blackJackCards[player]["player"][1], blackJackCards[player]["player"][2], blackJackCards[player]["player"][3], blackJackCards[player]["player"][4], blackJackCards[player]["player"][5] )
			if tonumber ( handValue ) then
				if handValue == 21 then
					endBlackJackCardDrawPlayer ( player )
				elseif handValue > 21 then
					endBlackJackCurGame ( player, true )
				end
			end
			triggerClientEvent ( player, "blackJackRecieveNewCard", player, true, blackJackCards[player]["player"][i], handValue )
		end
	end
end
addEvent ( "getNextBlackJackCardPlayer", true )
addEventHandler ( "getNextBlackJackCardPlayer", getRootElement(), getNextBlackJackCardPlayer_func )

function endBlackJackCardDrawPlayer ( player )

	blackJackCards[player]["dealer"][2] = getBlackJackCard ( player )
	triggerClientEvent ( player, "blackJackRecieveNewCard", player, false, blackJackCards[player]["dealer"][2], "dealer" )
	blackJackCards[player]["dealerCardCount"] = 2
	setTimer ( blackJackDealerDrawCheck, 1500, 1, player )
end

function blackJackDealerDrawCheck ( player )

	local val = getBlackJackHandValue ( blackJackCards[player]["dealer"][1], blackJackCards[player]["dealer"][2], blackJackCards[player]["dealer"][3], blackJackCards[player]["dealer"][4], blackJackCards[player]["dealer"][5] )
	local cards = blackJackCards[player]["dealerCardCount"]
	if cards == 5 or val >= 17 then
		blackJackFinalShowdown ( player )
	else
		cards = cards + 1
		local val = getBlackJackHandValue ( blackJackCards[player]["dealer"][1], blackJackCards[player]["dealer"][2], blackJackCards[player]["dealer"][3], blackJackCards[player]["dealer"][4], blackJackCards[player]["dealer"][5] )
		blackJackCards[player]["dealerCardCount"] = cards
		blackJackCards[player]["dealer"][cards] = getBlackJackCard ( player )
		triggerClientEvent ( player, "blackJackRecieveNewCard", player, false, blackJackCards[player]["dealer"][cards], val )
		
		setTimer ( blackJackDealerDrawCheck, 1500, 1, player )
	end
end

function blackJackFinalShowdown ( player )

	local playerPoints = getBlackJackHandValue ( blackJackCards[player]["player"][1], blackJackCards[player]["player"][2], blackJackCards[player]["player"][3], blackJackCards[player]["player"][4], blackJackCards[player]["player"][5] )
	local dealerPoints = getBlackJackHandValue ( blackJackCards[player]["dealer"][1], blackJackCards[player]["dealer"][2], blackJackCards[player]["dealer"][3], blackJackCards[player]["dealer"][4], blackJackCards[player]["dealer"][5] )
	if playerPoints > dealerPoints or dealerPoints > 21 then
		if playerPoints == 21 and not blackJackCards[player]["player"][3] then
			endBlackJackCurGame ( player, false, true )
		else
			endBlackJackCurGame ( player, false )
		end
	else
		endBlackJackCurGame ( player, true )
	end
end

function endBlackJackCurGame ( player, lost, blackJack )

	if vnxGetElementData ( player, "blackJackStarted" ) then
		vnxSetElementData ( player, "blackJackStarted", false )
		local r, g, b, text = 0, 0, 0, ""
		local bet = vnxGetElementData ( player, "curBlackJackBet" )
		
		if not lost then
			g = 150
			if blackJack then
				text = "Du gewinnst "..(bet*2).." $"
				increasePlayerGambleSkillLevel ( player, bet*2 )
			else
				text = "Du gewinnst "..bet.." $"
				increasePlayerGambleSkillLevel ( player, bet )
			end
			if not blackJack then
				vnxSetElementData ( player, "casinoChips", vnxGetElementData ( player, "casinoChips" ) + bet * 2 )
			else
				vnxSetElementData ( player, "casinoChips", vnxGetElementData ( player, "casinoChips" ) + bet * 3 )
			end
		else
			text = "Du verlierst "..bet.." $"
			r = 150
		end
		setElementDimension ( player, 0 )
		triggerClientEvent ( player, "endBlackJack", player, text, r, g, b )
	end
end

function blackJackDouble_func ()

	local player = client
	local i = blackJackCards[player]["playerCardCount"] + 1
	blackJackCards[player]["playerCardCount"] = i
	if i == 6 then
		endBlackJackCardDrawPlayer ( player )
	else
		local bet = vnxGetElementData ( player, "curBlackJackBet" )
		local chips = vnxGetElementData ( player, "casinoChips" )
		if chips >= bet then
			vnxSetElementData ( player, "casinoChips", chips - bet )
			vnxSetElementData ( player, "curBlackJackBet", bet * 2 )
			local player = client
			local i = blackJackCards[player]["playerCardCount"] + 1
			blackJackCards[player]["playerCardCount"] = i
			blackJackCards[player]["player"][i] = getBlackJackCard ( player )
			local handValue = getBlackJackHandValue ( blackJackCards[player]["player"][1], blackJackCards[player]["player"][2], blackJackCards[player]["player"][3], blackJackCards[player]["player"][4], blackJackCards[player]["player"][5] )
			if tonumber ( handValue ) then
				if handValue <= 21 then
					endBlackJackCardDrawPlayer ( player )
				elseif handValue > 21 then
					endBlackJackCurGame ( player, true )
				end
			end
			triggerClientEvent ( player, "blackJackDoubleChipStack", player, bet * 2 )
			triggerClientEvent ( player, "blackJackRecieveNewCard", player, true, blackJackCards[player]["player"][i], handValue )
		else
			triggerClientEvent ( player, "blackJackUnableToDouble", player )
		end
	end
end
addEvent ( "blackJackDouble", true )
addEventHandler ( "blackJackDouble", getRootElement(), blackJackDouble_func )

function blackJackEndDraw_func ()

	local player = client
	if player then
		endBlackJackCardDrawPlayer ( player )
	end
end
addEvent ( "blackJackEndDraw", true )
addEventHandler ( "blackJackEndDraw", getRootElement(), blackJackEndDraw_func )