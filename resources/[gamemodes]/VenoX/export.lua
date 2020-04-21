----------------------------------------------------
------ Copyright (c) FirstOne Media 2014-2016 ------
----------------------------------------------------

function getLocationName(x,y,z)
	return getZoneName(x,y,z)..", "..getZoneName(x,y,z,true)
end

function getLogContent(log)
	local log = fileOpen("vnx_log_files/logs/"..log..".log", true) -- Bitte evtl. den Pfad anpassen!
	local content = fileRead(log, fileGetSize(log))
	local len = string.len(content)
	
	if (len > 65000) then
		content = string.sub(content, (len-65000), len)
	end
	
	fileClose(log)
	
	return content
end

function sendMsgToAdmins(msg)
	for _, admin in pairs(getElementsByType("player")) do
		if getElementData(admin, "loggedin") == 1 then 
			if (vnxGetElementData ( admin, "adminlvl" ) >= 2) then
				outputChatBox(msg, admin, 0, 220, 255)
			end
		end
	end
end
function sendMsgToPlayer(pname, msg)
	local player = findPlayerByName(pname)
	if (player) then
		outputChatBox(msg, player, 0, 255, 0)
	end
end

local lastScreen = ""
addEventHandler("onPlayerScreenShot", root, function(res, state, pixels, timestamp, tag)
	if (tag == "webScreen") then
		if (state == "disabled") then
			lastScreen = "err|Der Spieler hat Screen-Uploads deaktiviert."
		elseif (state == "minimized") then
			lastScreen = "err|Der Spieler hat das Spiel minimiert."
		else
			lastScreen = "img|"..to_base64(pixels)
		end
	end
end)
function makePlayerScreenshot(pName)
	outputDebugString("[CALLING]: makePlayerScreenshot")
	
	local player = findPlayerByName(pName)
	if (player) then
		if (not takePlayerScreenShot(player, 300, 225, "webScreen", 50)) then
			return "Fehler"
		end
	else
		return "Der Spieler ist Offline."
	end
	
	return "Einen moment..."
end
function getScreenResult()
	setTimer(function() lastScreen = "" end, 1000, 1)
	return lastScreen
end


function listAllPlayers()
	local players = ""
	for i, player in ipairs(getElementsByType("player")) do 
		if getElementData(player, "loggedin") and getElementData(player, "loggedin") == 1 then
			players = players..getPlayerName(player).."|"
		end
	end
	return string.sub(players, 0, -1)
end

function kickPlayerWeb(adminname, playername, reason)
	local target = findPlayerByName(playername)
	if isElement(target) then
		outputChatBox("Spieler "..getPlayerName(target).." wurde von "..adminname.." gekickt! (Grund: "..tostring(reason)..")", root, 255, 0, 0)
		kickPlayer(target, adminname, tostring(reason))
		return "true"
	end
	return "Der Spieler ist Offline."
end

function permaBanWeb(adminname, playername, reason)
	local target = findPlayerByName(playername)
	
	if not target then	
		if playerUID[playername] then
			local serial = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Serial", "players", "UID", playerUID[playername] ), -1 )[1]["Serial"]
			dbExec (handler, "INSERT INTO ?? (??, ??, ??, ??, ??, ??) VALUES (?,?,?,?,?,?)", "ban", "UID", "AdminUID", "Grund", "Datum", "IP", "Serial", playerUID[playername], playerUID[adminname], reason, timestamp(), '0.0.0.0', serial)
			return "true"			
		else		
			return "Dieser Spieler existiert nicht"		
		end		
	else		
		outputChatBox ("Spieler "..getPlayerName(target).." wurde von "..adminname.." gebannt! (Grund: "..tostring(reason)..")",getRootElement(),255,0,0)
		outputAdminLog (adminname .." hat "..getPlayerName(target).." gebannt! (Grund: "..tostring(reason)..")")
		local ip = getPlayerIP ( target )
		local serial = getPlayerSerial ( target )			
		dbExec (handler, "INSERT INTO ?? (??, ??, ??, ??, ??, ??) VALUES (?,?,?,?,?,?)", "ban", "UID", "AdminUID", "Grund", "Datum", "IP", "Serial", playerUID[playername], playerUID[adminname], reason, timestamp(), ip, serial)
		kickPlayer ( target, player, tostring(reason).." (gebannt!)" )
		return "true"
	end
end

function timeBanWeb(adminname,playername,btime,reason)
	local target = findPlayerByName(playername)
	if target then
		local success = timebanPlayer(playername, tonumber(btime), adminname, reason)
		if success then
			return "true"
		end
	end
	return "Der Spieler ist nicht Online."
end

function unbanWeb(adminname, nick)
	dbExec ( handler, "DELETE FROM ?? WHERE ??=?", "ban", "UID", playerUID[nick] )
	outputChatBox ( adminname.." hat ".. nick.." entbannt!", getRootElement(), 125, 0, 0 )
	outputAdminLog ( adminname.." hat ".. nick .." entbannt." )
	return "true"
end


--
-- Base64-encoding
-- Sourced from http://en.wikipedia.org/wiki/Base64
-- Download: https://github.com/toastdriven/lua-base64/blob/master/base64.lua
local __author__ = 'Daniel Lindsley'
local __version__ = 'scm-1'
local __license__ = 'BSD'
local index_table = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
function to_binary(integer)
    local remaining = tonumber(integer)
    local bin_bits = ''
    for i = 7, 0, -1 do
        local current_power = math.pow(2, i)

        if remaining >= current_power then
            bin_bits = bin_bits .. '1'
            remaining = remaining - current_power
        else
            bin_bits = bin_bits .. '0'
        end
    end
    return bin_bits
end
function from_binary(bin_bits)
    return tonumber(bin_bits, 2)
end
function to_base64(to_encode)
    local bit_pattern = ''
    local encoded = ''
    local trailing = ''
    for i = 1, string.len(to_encode) do
        bit_pattern = bit_pattern .. to_binary(string.byte(string.sub(to_encode, i, i)))
    end
    -- Check the number of bytes. If it's not evenly divisible by three,
    -- zero-pad the ending & append on the correct number of ``=``s.
    if math.mod(string.len(bit_pattern), 3) == 2 then
        trailing = '=='
        bit_pattern = bit_pattern .. '0000000000000000'
    elseif math.mod(string.len(bit_pattern), 3) == 1 then
        trailing = '='
        bit_pattern = bit_pattern .. '00000000'
    end
    for i = 1, string.len(bit_pattern), 6 do
        local byte = string.sub(bit_pattern, i, i+5)
        local offset = tonumber(from_binary(byte))
        encoded = encoded .. string.sub(index_table, offset+1, offset+1)
    end
    return string.sub(encoded, 1, -1 - string.len(trailing)) .. trailing
end
--