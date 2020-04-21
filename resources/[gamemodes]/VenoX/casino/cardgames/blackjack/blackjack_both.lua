blackJackCardTypes = {}
blackJackCardValues = {}
blackJackImages = {}
local k
for i = 1, 4 do
	k = ( i - 1 ) * 13
	for j = 1, 13 do
		blackJackCardTypes[j + k] = j
	end
	blackJackImages[12+k] = true
	blackJackImages[11+k] = true
	blackJackImages[10+k] = true
end

function getBlackJackHandValueText ( card1, card2, card3, card4, card5 )

	local text = ""
	local value, aces, em = getBlackJackHandValue ( card1, card2, card3, card4, card5 )
	
	if aces == 0 then
		text = value
	else
		if value == 21 then
			text = "21"
		elseif value - 10 > 1 and not em then
			text = value.." oder ".. ( value - 10 )
		else
			text = value
		end
	end
	return tostring ( text )
end

function getBlackJackHandValue ( card1, card2, card3, card4, card5 )

	local totalHandValue = 0
	local totalAces = 0
	local em = false
	local val
	for i = 1, 5 do
	
		if i == 1 then
			card = card1
		elseif i == 2 then
			card = card2
		elseif i == 3 then
			card = card3
		elseif i == 4 then
			card = card4
		elseif i == 5 then
			card = card5
		end
		
		if card then
			val = getBlackJackCardValue ( card )
			if not val then
				totalAces = totalAces + 1
			else
				totalHandValue = totalHandValue + val
			end
		end
	end
	-- If there are any aces in the hand
	if totalAces > 0 then
		if totalAces == 1 then
			if totalHandValue + 11 > 21 then
				totalHandValue = totalHandValue + 1
				em = true
			else
				totalHandValue = totalHandValue + 11
			end
		elseif totalAces == 2 then
			if totalHandValue + 12 > 21 then
				totalHandValue = totalHandValue + 2
				em = true
			else
				totalHandValue = totalHandValue + 12
			end
		elseif totalAces == 3 then
			if totalHandValue + 13 > 21 then
				totalHandValue = totalHandValue + 3
				em = true
			else
				totalHandValue = totalHandValue + 13
			end
		elseif totalAces == 4 then
			if totalHandValue + 14 > 21 then
				totalHandValue = totalHandValue + 4
				em = true
			else
				totalHandValue = totalHandValue + 14
			end
		end
	end
	return totalHandValue, totalAces, em
	-- Returns the maximum points for the hand
end

function getBlackJackCardValue ( card )

	if card / 13 == math.floor ( card / 13 ) then
		return false
	else
		if blackJackImages[card] then
			return 10
		else
			return blackJackCardTypes[card] + 1
		end
	end
end