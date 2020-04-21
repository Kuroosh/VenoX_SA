function skillDataLoad ( player )

	local pname = getPlayerName ( player )
	setFishingValues ( player )
	local result = dbPoll ( dbQuery ( handler, "SELECT ??, ?? FROM ?? WHERE ??=?", "fishing", "gamble", "skills", "UID", playerUID[pname] ), -1 )
	if result and result[1] then
		vnxSetElementData ( player, "fishingSkill", tonumber ( result[1]["fishing"] ) )
		vnxSetElementData ( player, "fishingSkillOld", vnxGetElementData ( player, "fishingSkill" ) )
		vnxSetElementData ( player, "gambleSkill", tonumber ( result[1]["gamble"] ) )
	end
end

function skillDataSave ( player )

	local pname = getPlayerName ( player )
	if vnxGetElementData ( player, "fishingSkill" ) > vnxGetElementData ( player, "fishingSkillOld" ) then
		dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "skills", "fishing", vnxGetElementData ( player, "fishingSkill" ), "UID", playerUID[pname] )
	end
	saveFishingValues ( player )
	dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "skills", "gamble", vnxGetElementData ( player, "gambleSkill" ), "UID", playerUID[pname] )
end