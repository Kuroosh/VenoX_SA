local ueberfallListe = { [0] = {}, [1] = {}, [2] = {}, [3] = {}, [6] = {}, [7] = {}, [8] = {}, [9] = {}, [12] = {}, [13] = {}, [14] = {} }
local playerGettingRobbed = {}
local playerGettingRobbedTimer = {}
local playerSchusserlaubnis = {}
local playerHatGeschossen = {}


local function ueberfallSchusserlaubnis ( playera, target )
	local player = findPlayerByName ( playera )
	local x, y, z = getElementPosition ( target )
	local x1, y1, z1 = nil
	local frac = vnxGetElementData ( player, "fraktion" )
	playerSchusserlaubnis[target] = getPlayerName ( player )
	if isTimer ( playerGettingRobbedTimer[player] ) then
		killTimer ( playerGettingRobbedTimer[player] )
		playerGettingRobbedTimer[player] = setTimer ( function( player ) 
			playerGettingRobbed[player] = nil
			playerHatGeschossen[player] = nil
			playerSchusserlaubnis[player] = nil
			playerGettingRobbedTimer[player] = nil
		end, 60000, 1, player )
	end
	triggerClientEvent ( player, "infobox_start", getRootElement(), "\nIhr dürft\nschießen!", 5000, 125, 0, 0 )
	triggerClientEvent ( target, "infobox_start", getRootElement(), "\nSie dürfen\nnun schießen!", 5000, 125, 0, 0 )
end


local function ueberfallTod ( ammo, killer )		
	if playerGettingRobbed[source] then
		if playerSchusserlaubnis[source] == nil and playerHatGeschossen[source] == nil then
			local themoney = 0
			outputChatBox ( "Zu früh angegriffen! Dir werden 1000$ abgezogen!", killer, 255, 0, 0 )
			if vnxGetElementData ( killer, "money" ) >= 1000 then 
				themoney = 1000
				vnxSetElementData ( killer, "money", vnxGetElementData ( killer, "money")+750 )
			elseif vnxGetElementData ( killer, "bankmoney" ) >= 1000 then 
				themoney = 1000
				vnxSetElementData ( killer, "bankmoney", vnxGetElementData ( killer, "bankmoney")+750 )
			elseif vnxGetElementData ( killer, "money" ) + vnxGetElementData ( killer, "bankmoney" ) >= 750 then
				local restgeld = 1000 - vnxGetElementData ( killer, "money" )
				themoney = 1000
				vnxSetElementData ( killer, "money", 0 )
				vnxSetElementData ( killer, "bankmoney", restgeld )
			else 
				themoney = vnxGetElementData ( killer, "bankmoney" ) + vnxGetElementData ( killer, "money" )
				vnxSetElementData ( killer, "money", 0 )
				vnxSetElementData ( killer, "bankmoney", 0)
			end
			vnxSetElementData ( source, "money", vnxGetElementData (source, "money")+themoney)
		end
		playerSchusserlaubnis[source] = nil
		playerGettingRobbed[source] = nil
		playerHatGeschossen[source] = nil
		if isTimer ( playerGettingRobbedTimer[source] ) then
			killTimer ( playerGettingRobbedTimer[source] )
			playerGettingRobbedTimer[source] = nil
		end
	end
end
			
			
local function ueberfallOfflineflucht ()
	if playerSchusserlaubnis[source] then
		outputChatBox ("Der Spieler ist nach der Schusserlaubnis Offline gegangen.", playerGettingRobbed[source], 0, 255, 0 )
		playerSchusserlaubnis[source] = nil
		playerHatGeschossen[source] = nil
	elseif playerGettingRobbed[source] then 
		outputChatBox ("Der Spieler hat Offlineflucht begangen.", playerGettingRobbed[source], 0, 255, 0 )
		playerSchusserlaubnis[source] = nil
		playerHatGeschossen[source] = nil
		if isTimer ( playerGettingRobbedTimer[source] ) then
			killTimer ( playerGettingRobbedTimer[source] )
			playerGettingRobbedTimer[source] = nil
		end
	else
		playerSchusserlaubnis[source] = nil
		playerHatGeschossen[source] = nil
		if isTimer ( playerGettingRobbedTimer[source] ) then
			killTimer ( playerGettingRobbedTimer[source] )
			playerGettingRobbedTimer[source] = nil
		end
		return
	end
	local player = playerGettingRobbed[source]
	local frac = vnxGetElementData ( player, "fraktion")
	local targetname = getPlayerName(source)
	ueberfallListe[frac][targetname] = nil
	playerGettingRobbed[source] = nil
	local handpasst = false
	local bankpasst = false
	local beidespasst = false
	local result = dbPoll ( dbQuery ( handler, "SELECT ??, ?? FROM ?? WHERE ??=?", "Geld", "Bankgeld", "userdata", "UID", playerUID[targetname] ), -1 )
	local handgeld = result[1]["Geld"]
	local bankgeld = result[1]["Bankgeld"]
	local damoney = 0
	if handgeld >= 1000 then
		damoney = 1000
		dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "Geld", handgeld-damoney, "UID", playerUID[targetname] )
	elseif bankgeld >= 1000 then
		damoney = 1000
		dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "Bankgeld", bankgeld-damoney, "UID", playerUID[targetname] )
	elseif handgeld + bankgeld >= 1000 then
		local bankabzuggeld = 1000 - handgeld
		damoney = 1000
		dbExec ( handler, "UPDATE ?? SET ??=?, ??=? WHERE ??=?", "userdata", "Geld", 0, "Bankgeld", bankgeld - bankabzuggeld, "UID", playerUID[targetname] )
	else
		damoney = handgeld + bankgeld
		dbExec ( handler, "UPDATE ?? SET ??=?, ??=? WHERE ??=?", "userdata", "Geld", 0, "Bankgeld", 0, "UID", playerUID[targetname] )
	end
	outputChatBox ("Dafür kriegst du "..damoney.."$", player, 255, 0, 0)
	vnxSetElementData ( player, "money", vnxGetElementData ( player, "money") + damoney )
end
	
	
local function startUeberfallZwei ( player, target )
	local x, y, z = getElementPosition ( player )
	local x1, y1, z1 = nil
	local frac = vnxGetElementData ( player, "fraktion" )
	triggerClientEvent ( target, "infobox_start", getRootElement(), "\nDu wirst\nüberfallen!", 5000, 125, 0, 0 )
	local players = getElementsByType ("player")
	for i=1, #players do
		local playeritem = players[i]
		if playeritem ~= player and playeritem ~= target then
			x1, y1, z1 = getElementPosition ( playeritem )
			if getDistanceBetweenPoints3D ( x, y, z, x1, y1, z1 ) <= 30 then
				outputChatBox ( getPlayerName(target).." wird ausgeraubt!", playeritem, 255, 0, 0 )
			end
		elseif playeritem == player then
			outputChatBox ( "Du überfällst "..getPlayerName(target)..".", playeritem, 200, 0, 0 )
		elseif playeritem == target then
			outputChatBox ( "Du wirst von der "..fraktionNames[frac].." überfallen (max. 750$)!", playeritem, 255, 0, 0 )
			outputChatBox ( "Benutze innerhalb 15 Sekunden /payrob oder sie dürfen dich töten!", playeritem, 255, 0, 0 )
		end
	end
	playerGettingRobbed[target] = player
	ueberfallListe[frac][getPlayerName(target)] = true
	addEventHandler ( "onPlayerQuit", target, ueberfallOfflineflucht )
	addEventHandler ( "onPlayerWasted", target, ueberfallTod )
	playerGettingRobbedTimer[target] = setTimer ( ueberfallSchusserlaubnis, 15*1000, 1, getPlayerName(player), target )
end
	

local function startUeberfallEins ( player, cmd, target )
	if isOnDuty ( player ) then
		triggerClientEvent ( player, "infobox_start", getRootElement(), "Nicht möglich als Beamter im Dienst!", 5000, 125, 0, 0 )
	else 
		if not vnxGetElementData ( player, "jailtime" ) or vnxGetElementData ( player, "jailtime" ) == 0 then
			if target then
				if findPlayerByName ( target )  then
					local targetpl = findPlayerByName ( target )
					local frac = vnxGetElementData ( player, "fraktion" )
					--if vnxGetElementData ( targetpl, "fraktion" ) == 0 then
						if vnxGetElementData ( targetpl, "playingtime") >= 30 then
							if not ueberfallListe[frac][getPlayerName(targetpl)] or ueberfallListe[frac][getPlayerName(targetpl)] == nil then
								if not playerGettingRobbed[targetpl] then
									local x, y, z = getElementPosition ( player )
									local x1, y1, z1 = getElementPosition ( targetpl )
									if getDistanceBetweenPoints3D ( x, y, z, x1, y1, z1 ) <= 15 then
										startUeberfallZwei ( player, targetpl )
									else
										triggerClientEvent ( player, "infobox_start", getRootElement(), "Du bist\nnicht nah genug\nam Spieler!", 5000, 125, 0, 0 )
									end
								else
									triggerClientEvent ( player, "infobox_start", getRootElement(), "Der Spieler\nwird gerade\nüberfallen!", 5000, 125, 0, 0 )
								end
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "Der Spieler\nwurde heute\nschon ausgeraubt!", 5000, 125, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "Das Ziel\nist noch ein\nAnfänger!", 5000, 125, 0, 0 )
						end
					--else
					--	triggerClientEvent ( player, "infobox_start", getRootElement(), "Nur Zivilisten\ndürfen überfallen\werden!", 5000, 125, 0, 0 )
					--end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Der Spieler\nist offline\noder ungültig!", 5000, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\Gebrauch:\n/rob NAME", 5000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "Du darfst\ndiesen Befehl im\nKnast nicht\nnutzen!!", 5000, 125, 0, 0 )
		end
	--else
		--triggerClientEvent ( player, "infobox_start", getRootElement(), "Nur für\nböse Fraktionisten!", 5000, 125, 0, 0 )
	end
end
addCommandHandler ("rob", startUeberfallEins)


local function payTheRob ( player )
	if playerGettingRobbed[player] then
		local raeuber = playerGettingRobbed[player]
		outputChatBox ( "Du hast bezahlt.", player, 0, 255, 0 )
		outputChatBox ( "Das Geld wurde bezahlt.", raeuber, 0, 255, 0 )
		local themoney = 750
		if vnxGetElementData(player, "money") < 750 then
			themoney = vnxGetElementData(player, "money")
		end
		vnxSetElementData ( player, "money", vnxGetElementData (player, "money") - themoney )
		vnxSetElementData ( raeuber, "money", vnxGetElementData (raeuber, "money") + themoney )
		playerSchusserlaubnis[player] = nil
		playerHatGeschossen[player] = nil
		if isTimer ( playerGettingRobbedTimer[player] ) then
			killTimer ( playerGettingRobbedTimer[player] )
			playerGettingRobbedTimer[player] = nil
		end
		playerGettingRobbed[player] = nil
	end
end
addCommandHandler ("payrob", payTheRob)

