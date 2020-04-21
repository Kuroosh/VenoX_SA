function sendBuyItMessage ( pname, text )

	local player = getPlayerFromName ( pname )
	if player then
		outputChatBox ( text, player, 0, 125, 0 )
	else
		offlinemsg ( text, "BuyIt.com", pname )
	end
end

function buyItGetFreeCarslot ( pname )

	local player = getPlayerFromName ( pname )
	local count = 0
	for i = 1, 10 do
		if vnxGetElementData ( player, "carslot"..i ) == 0 then
			return i
		elseif count >= vnxGetElementData ( player, "maxcars" ) then
			return false
		else
			count = count + 1
		end
	end
end

function buyItMoneyChange ( pname, amount )

	local player = getPlayerFromName ( pname )
	if isElement ( player ) then
		local money = vnxGetElementData ( player, "bankmoney" )
		vnxSetElementData ( player, "bankmoney", money + amount )
	elseif playerUID[pname] then
		local money = tonumber ( dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Bankgeld", "players", "UID", playerUID[pname] ), -1 )[1]["Bankgeld"] )
		dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "Bankgeld", money + amount, "UID", playerUID[pname] )
	end
end

function getFreeAuktionID ()

	i = 1
	while true do
		if not usedAuktionIDs[i] then
			usedAuktionIDs[i] = true
			return i
		end
		i = i + 1
	end
end

function formatDateToInteger ( minute, hour, yearday, year )

	return minute + hour * 60 + yearday * 1440 + (year-2010) * 525600
end

function calcTimeToRunOptical ( minute, hour, yearday, year )

	local time = getRealTime()
	local ttime1 = formatDateToInteger ( time.minute, time.minute, time.yearday, time.year + 1900 )
	local ttime2 = formatDateToInteger ( minute, hour, yearday, year )
	
	local minute = ttime2 - ttime1
	
	local hour = 0
	
	while minute >= 60 do
		minute = minute - 60
		hour = hour + 1
	end
	
	return hour.." Stunden und "..minute.." Minuten"
end

