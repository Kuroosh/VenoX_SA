function increasePlayerFishingSkillLevel ( player, amount )

	local old = calcFishingSkillLevel ( player )
	vnxSetElementData ( player, "fishingSkill", vnxGetElementData ( player, "fishingSkill" ) + amount )
	
	local skill = vnxGetElementData ( player, "fishingSkill" )
	
	if old < calcFishingSkillLevel ( player ) then
		outputChatBox ( "Du bist um einen Angellevel aufgestiegen! Du kannst nun mehr Haken und Koeder mitnehmen,", player, 0, 125, 0 )
		outputChatBox ( "ausserdem kannst du mehr und groessere Fische fangen!", player, 0, 125, 0 )
	end
	
	triggerClientEvent ( player, "showSkillInfo", player, "Angelskills:", calcFishingBarFuelState ( skill ), getFishesLeftForNextLevel ( skill ), calcFishingSkillLevel ( player ) )
end

function increasePlayerGambleSkillLevel ( player, amount )

	local old = calcGambleSkillLevel ( player )
	vnxSetElementData ( player, "gambleSkill", vnxGetElementData ( player, "gambleSkill" ) + amount )
	
	local skill = vnxGetElementData ( player, "gambleSkill" )
	
	if old < calcGambleSkillLevel ( player ) then
		outputChatBox ( "Du bist um einen Spielskill aufgestiegen! Du kannst nun um mehr Geld spielen.", player, 0, 125, 0 )
	end
	
	triggerClientEvent ( player, "showSkillInfo", player, "Spielskills:", calcGambleBarFuelState ( skill ), getGambleMoneyLeftForNextLevel ( skill ), calcGambleSkillLevel ( player ) )
end