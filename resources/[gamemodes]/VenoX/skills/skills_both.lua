-- Fishing Skill

function calcFishingSkillLevel ( player )

	local skill = vnxGetElementData and vnxGetElementData( player, "fishingSkill" ) or vnxClientGetElementData ( "fishingSkill" )
	if skill < 10 then
		return 1
	elseif skill < 25 then
		return 2
	elseif skill < 50 then
		return 3
	elseif skill < 125 then
		return 4
	elseif skill < 225 then
		return 5
	elseif skill < 325 then
		return 6
	elseif skill < 450 then
		return 7
	elseif skill < 600 then
		return 8
	elseif skill < 750 then
		return 9
	end
	return 10
end

function calcFishingBarFuelState ( amount )

	local skill = amount
	if skill < 10 then
		return skill / 10
	elseif skill < 25 then
		return ( skill - 10 ) / 15
	elseif skill < 50 then
		return ( skill - 25 ) / 25
	elseif skill < 125 then
		return ( skill - 50 ) / 75
	elseif skill < 225 then
		return ( skill - 125 ) / 100
	elseif skill < 325 then
		return ( skill - 225 ) / 100
	elseif skill < 450 then
		return ( skill - 325 ) / 125
	elseif skill < 600 then
		return ( skill - 450 ) / 150
	elseif skill < 750 then
		return ( skill - 600 ) / 150
	end
	return 1
end

function getFishesLeftForNextLevel ( amount )

	local skill = amount
	if skill < 10 then
		return 10 - amount
	elseif skill < 25 then
		return 25 - amount
	elseif skill < 50 then
		return 50 - amount
	elseif skill < 125 then
		return 125 - amount
	elseif skill < 200 then
		return 200 - amount
	elseif skill < 275 then
		return 275 - amount
	elseif skill < 350 then
		return 350 - amount
	elseif skill < 450 then
		return 450 - amount
	elseif skill < 500 then
		return 500 - amount
	end
	return 0
end

-- Gamble Skill

function calcGambleBarFuelState ( amount )

	local skill = amount
	if skill < 500 then
		return skill / 500
	elseif skill < 2000 then
		return ( skill - 500 ) / 2000
	elseif skill < 4000 then
		return ( skill - 2000 ) / 4000
	elseif skill < 6000 then
		return ( skill - 4000 ) / 6000
	elseif skill < 12500 then
		return ( skill - 6000 ) / 12500
	elseif skill < 20000 then
		return ( skill - 12500 ) / 20000
	elseif skill < 30000 then
		return ( skill - 20000 ) / 30000
	elseif skill < 45000 then
		return ( skill - 30000 ) / 45000
	elseif skill < 75000 then
		return ( skill - 45000 ) / 75000
	end
	return 1
end

function calcGambleSkillLevel ( player )

	local skill = vnxGetElementData and vnxGetElementData ( player, "gambleSkill" ) or vnxClientGetElementData ( "gambleSkill" )
	if skill <= 500 then
		return 1
	elseif skill <= 2000 then
		return 2
	elseif skill <= 4000 then
		return 3
	elseif skill <= 6000 then
		return 4
	elseif skill <= 12500 then
		return 5
	elseif skill <= 20000 then
		return 6
	elseif skill <= 30000 then
		return 7
	elseif skill <= 45000 then
		return 8
	elseif skill <= 75000 then
		return 9
	else
		return 10
	end
end

function getGambleMoneyLeftForNextLevel ( amount )

	local skill = amount
	if skill <= 500 then
		return 500 - skill
	elseif skill <= 2000 then
		return 2000 - skill
	elseif skill <= 4000 then
		return 4000 - skill
	elseif skill <= 6000 then
		return 6000 - skill
	elseif skill <= 12500 then
		return 12500 - skill
	elseif skill <= 20000 then
		return 20000 - skill
	elseif skill <= 30000 then
		return 30000 - skill
	elseif skill <= 45000 then
		return 45000 - skill
	elseif skill <= 75000 then
		return 75000 - skill
	end
	return 0
end

function calcPlayerMaxGambleBet ( player, game )

	local skill = calcGambleSkillLevel ( player )
	local max = 0
	if skill == 1 then
		max = 250
	elseif skill == 2 then
		max = 500
	elseif skill == 3 then
		max = 1000
	elseif skill == 4 then
		max = 2000
	elseif skill == 5 then
		max = 2500
	elseif skill == 6 then
		max = 3000
	elseif skill == 7 then
		max = 5000
	elseif skill == 8 then
		max = 7500
	elseif skill == 9 then
		max = 10000
	else
		max = 12500
	end
	-- Roulett
	if game == 0 then
		return max
	-- Blackjack
	else
		return max / 2
	end
end