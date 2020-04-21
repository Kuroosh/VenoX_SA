

function checkDailyLogin ( player )
	local pname = getPlayerName ( player )
    local result = dbPoll ( dbQuery ( handler, "SELECT  ??, ??, ?? FROM ?? WHERE ??=? ","loginData", "nextLoginBonus", "expiredLoginBonus", "dailylogins", "UID", playerUID[pname] ), -1 )
    local rt = getRealTime ()
    local timesamp = rt.timestamp
    if result and result[1] then
        local nextBonus = tonumber( result[1]["nextLoginBonus"] )
		local logins = tonumber( result[1]["loginData"] )
		local expiredBonus = tonumber( result[1]["expiredLoginBonus"] )
        if nextBonus > timesamp then
		if not expiredBonus  > timesamp then
            outputChatBox ( "bonus", player, 255, 0, 0 )
			local logins = logins+1
			getBoni (player, logins)
			if logins >= 7 then
				dbExec ( handler, "UPDATE ?? SET ??=?, ??=?, ??=?  WHERE ??=?", "dailylogins", "nextLoginBonus", timesamp+86400, "expiredLoginBonus" , timesamp+(86400*2), "loginData", 1 , "UID", playerUID[pname] )
			else
				dbExec ( handler, "UPDATE ?? SET ??=?, ??=?, ??=? WHERE ??=?", "dailylogins", "nextLoginBonus", timesamp+86400, "expiredLoginBonus" , timesamp+(86400*2), "loginData", logins , "UID", playerUID[pname] )
			end
		else
			 outputChatBox ( "no bonus abge-", player, 255, 0, 0 ) 	
        end
		else
		 outputChatBox ( "no bonus", player, 255, 0, 0 ) 	
	
	end
end
end

function getBoni (player, login)
	if login == 1 then
		local reward = math.random(1,100)
		if reward >= 25 then
			vnxSetElementData ( player, "bankmoney", vnxGetElementData ( player, "bankmoney") + math.floor(500/2) )
		else
			vnxSetElementData ( player, "bankmoney", vnxGetElementData ( player, "bankmoney") +  math.floor(1000/2) )
		end
	elseif login == 2 then
		local reward = math.random(1,100)
		if reward >= 25 then
			vnxSetElementData ( player, "bankmoney", vnxGetElementData ( player, "bankmoney") +  math.floor(1000/2) )
		else
			vnxSetElementData ( player, "bankmoney", vnxGetElementData ( player, "bankmoney") +  math.floor(1500/2) )
		end
	elseif login == 3 then
		local reward = math.random(1,100)
		if reward >= 25 then
			vnxSetElementData ( player, "bankmoney", vnxGetElementData ( player, "bankmoney") +  math.floor(1500/2) )
		elseif reward <= 10 and reward > 5 then
			vnxSetElementData ( player, "bankmoney", vnxGetElementData ( player, "bankmoney") +  math.floor(2000/2) )
		elseif reward < 5 then
			vnxSetElementData ( player, "bankmoney", vnxGetElementData ( player, "bankmoney") +  math.floor(3000/2) )
		end
	elseif login == 4 then
		local reward = math.random(1,100)
		if reward >= 25 then
			vnxSetElementData ( player, "bankmoney", vnxGetElementData ( player, "bankmoney") +  math.floor(2000/2) )
		elseif reward <= 10 and reward > 5 then
			vnxSetElementData ( player, "bankmoney", vnxGetElementData ( player, "bankmoney") +  math.floor(2500/2) )
		elseif reward < 5 then
			vnxSetElementData ( player, "bankmoney", vnxGetElementData ( player, "bankmoney") +  math.floor(4000/2) )
		end
	elseif login == 5 then
		local reward = math.random(1,100)
		if reward >= 25 then
			vnxSetElementData ( player, "bankmoney", vnxGetElementData ( player, "bankmoney") +  math.floor(2500/2) )
		elseif reward <= 10 and reward > 5 then
			vnxSetElementData ( player, "bankmoney", vnxGetElementData ( player, "bankmoney") +  math.floor(3000/2) )
		elseif reward < 5 then
			vnxSetElementData ( player, "bankmoney", vnxGetElementData ( player, "bankmoney") +  math.floor(5000/2) )
		end
	elseif login == 6 then
		local reward = math.random(1,100)
		if reward <= 10 then
			vnxSetElementData ( player, "PremiumCars", vnxGetElementData ( player, "PremiumCars") + 1 )
		else
			vnxSetElementData ( player, "bankmoney", vnxGetElementData ( player, "bankmoney") +  math.floor(6000/2) )
		end
	end
end
		