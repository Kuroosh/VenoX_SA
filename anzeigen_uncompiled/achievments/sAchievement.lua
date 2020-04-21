
function hasAchievement ( player, id )
	if dbExist ( "achievements", "achievmentID LIKE '"..id.."' AND UID LIKE '"..playerUID[getPlayerName(player)].."'") then
		return true
	else
		return false
	end
end

function giveAchievement( player, id )
	local money = vnxGetElementData ( player, "money" )
	if tonumber(achievementID[id]) then
		if not hasAchievement ( player, id ) then
			dbExec ( handler, "INSERT INTO ?? (??,??,??) VALUE (?,?,?)", "achievements", "UID", "achievmentID", "data", playerUID[getPlayerName(player)], id, getData ( getTimestamp ( ) ) )
			givePlayerXP( player, achievementGainXP[id] )
			vnxSetElementData ( player, "money", money + achievementGainMoney[id] )
			--vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + achievementGainMoney[id] )
			triggerClientEvent ( player, "showAchievment", getRootElement(), id, achievementName[id], achievementDescription[id], achievementGainXP[id], achievementGainMoney[id], achievementPic[id]  )
		end
	end
end

addEvent ( "giveAchievement", true )
addEventHandler ( "giveAchievement", getRootElement(),  giveAchievement )


function checkAchievments (player)
local faction = tonumber((getElementData(player, "fraktion")))
local rank = tonumber((getElementData(player, "rang")))
local geld_info = vnxGetElementData ( player, "money" )
local bankmoney_info = vnxGetElementData ( player, "bankmoney" )
local ptime = tonumber(getElementData(player,"playingtime"))

	if faction > 0  then
		giveAchievement( player, 6 )
	end

	if faction > 0 and rank >= 4 then
		giveAchievement( player, 7 )
	end
	local ptime = tonumber(getElementData(player,"playingtime"))
	if ptime >= 180 then 
		giveAchievement( player, 14 )
	end

	if geld_info + bankmoney_info >= 5000000 then
		giveAchievement( player, 11 )
		--outputDebugString(player)
	else 
		--outputDebugString(""..geld_info.." "..bankmoney_info)
	end
	if geld_info + bankmoney_info >= 10000000 then
		giveAchievement( player, 12 )
	end

	if getRealTime().hour == 23 then
		vnxSetElementData(player,"geschenk",0)
	end 

end