
boosterXP = {}

function checkPlayerLevelUP (player)
    local xp = tonumber(vnxGetElementData ( player, "MainXP" ))
    local level	= tonumber(vnxGetElementData ( player, "MainLevel" ))
    local nextLVLXP = levelSys[level]
    if xp >= tonumber(nextLVLXP) then
        vnxSetElementData ( player, "MainLevel", level + 1)
        level = tonumber(vnxGetElementData ( player, "MainLevel" ))
        outputChatBox("[Levelsystem] Du bist soeben auf Level #FFFFFF"..level.."#0096C8 aufgestiegen.",player,0,150,200,true)
        triggerClientEvent ( player, "drawLevelUP", getRootElement() )
        dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "levelsystem", "MainXP", xp, "UID", playerUID[name] )
        dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "levelsystem", "MainLevel", level, "UID", playerUID[name] )
        outputLog ( getPlayerName(player).." hat das Level "..level.." erreicht.", "level" )
        outputLog ( getPlayerName(player).." hat nun "..xp..".", "level" )
    else 
        dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "levelsystem", "MainXP", xp, "UID", playerUID[name] )
        outputLog ( getPlayerName(player).." hat nun "..xp..".", "level" )
    end
end
addEvent("checkPlayerLevelUP", true)
addEventHandler("checkPlayerLevelUP", getRootElement(), checkPlayerLevelUP)





local function testNewLevelSys (player)
    local level	= tonumber(vnxGetElementData ( player, "MainLevel" ))
    outputChatBox(levelSys[level])
end
--addCommandHandler("testNewLevelSys", testNewLevelSys)



function givePlayerXP(player,xp)
    boosterXP[getPlayerName(player)] = 1
        local result = dbPoll ( dbQuery ( handler, "SELECT  ??, ??, ?? FROM ?? WHERE ??=? ","date", "type", "id", "booster", "UID", playerUID[getPlayerName(player)] ), -1 )
        local rt = getRealTime ()
        local timesamp = rt.timestamp
        if result and result[1] then
            if tonumber( result[1]["type"] ) == 1 then
                boosterXP[getPlayerName(player)] = 2
          --      outputChatBox ( "Durch einen XP Booster wurde deine Erfahrung verdoppelt. ", player, 0, 125, 0 )
            end
        end
            local mxp = (xp * boosterXP[getPlayerName(player)]) * tonumber(DoubleXP)
            vnxSetElementData ( player, "MainXP", mxp + vnxGetElementData ( player, "MainXP" ) )
            triggerClientEvent ( player, "showLevel", getRootElement() )
            expfordbsave = tonumber(vnxGetElementData ( player, "MainXP" ))
            dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "levelsystem", "MainXP", expfordbsave, "UID", playerUID[name] )
            --outputDebugString("Nice, alles wurde gesaved")
            outputChatBox ( "Du hast "..mxp.." XP erhalten, du hast nun "..vnxGetElementData ( player, "MainXP" ).." XP. ", player, 0, 150, 200 )
            outputLog ( getPlayerName(player).." hat nun "..mxp.." XP Erhalten.", "level" )
      --  end
      --saveEXPForPlayer()
end
function dev_lvl_sys(player)
    givePlayerXP(player, 50)
    --outputChatBox ( "Du hast 50 XP erhalten, du hast nun "..vnxGetElementData ( player, "MainXP" ).." XP. ", player, 0, 150, 200 )
end 

addCommandHandler("giveexptest", dev_lvl_sys)