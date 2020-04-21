prestigeArray = {}
local lastprestigehit = {}
local totalPrestigeObjects = 0

function createPrestigeObjects ( i )
	local result = dbPoll ( dbQuery ( handler, "SELECT * FROM prestige" ), -1 )
	if result then
		if result[1] then
			for i=1, #result do
				local x, y, z = tonumber ( result[i]["X"] ), tonumber ( result[i]["Y"] ), tonumber ( result[i]["Z"] )
				local besitzer = result[i]["Besitzer"]
				local preis = tonumber ( result[i]["Preis"] )
				local id = tonumber ( result[i]["ID"] )
				local pickup = createPickup ( x, y, z, 3, 1239, 1000 )
				prestigeArray[pickup] = {
					["pickup"] = pickup,
					["besitzer"] = besitzer,
					["preis"] = preis,
					["id"] = id }
				addEventHandler ( "onPickupHit", pickup, prestigePickupHit )	
				totalPrestigeObjects = totalPrestigeObjects + 1
			end
			outputServerLog ( "Es wurden "..#result.." prestige Objekte gefunden." )
		end
	end
end
addEventHandler ( "onResourceStart", resourceRoot, createPrestigeObjects )


function prestigePickupHit ( player )
	local besitzer = prestigeArray[source]["besitzer"]
	local preis = prestigeArray[source]["preis"]
	lastprestigehit[player] = source
	if besitzer == "" then 
		triggerClientEvent ( player, "infobox_start", getRootElement(), "Dieses Objekt steht\nzum Verkauf, Kosten:\n"..preis.."\nTippe /buyprestige,\num es zu erwerben.", 7500, 200, 200, 0 )
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "Dieses Objekt gehoert:\n"..besitzer, 7500, 200, 200, 0 )
	end
end

function buyprestige_func ( player )
	local pickup = lastprestigehit[player] or false
	if pickup then
		local pname = getPlayerName ( player )
		if prestigeArray[pickup]["besitzer"] == "" then
			local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=? AND ??=?", "Typ", "buyit", "HoechstbietenderUID", playerUID[pname], "Typ", "Prestige" ), -1 )
			if not result or not result[1] then
				local isOwning = false
				for _, array in pairs ( prestigeArray ) do
					if array["besitzer"] == pname then
						isOwning = true
						break
					end
				end
				if not isOwning then
					local preis = prestigeArray[pickup]["preis"]
					local money = tonumber ( vnxGetElementData ( player, "money" ) )
					local id = prestigeArray[pickup]["id"]
					if money >= preis then
						vnxSetElementData ( player, "money", money - preis )
						outputChatBox ( "Herzlichen Glückwunsch, du hast dieses Objekt erworben!", player, 0, 125, 0 )
						dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "prestige", "UID", playerUID[pname], "ID", id )
						
						prestigeArray[pickup]["besitzer"] = pname
					else
						outputChatBox ( "Du hast nicht genug Geld - dieses Objekt kostet "..preis.." $!", player, 125, 0, 0 )
					end
				else
					outputChatBox ( "Du kannst nur ein Prestigeobjekt besitzen!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Du bietest bereits auf ein Prestige-Object!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Dieses Objekt steht nicht zum Verkauf!", player, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "buyprestige", buyprestige_func )


function sellprestige_func ( player )
	local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Preis", "prestige", "UID", playerUID[getPlayerName ( player )] ), -1 )
	if result and result[1] then
		local result2 = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=? AND Typ LIKE 'Prestige'", "AnbieterUID", "buyit", "AnbieterUID", playerUID[getPlayerName ( player )] ), -1 )
		if not result2 or not result2[1] then
			local price = tonumber ( result[1]["Preis"] )
			vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + price )
			outputChatBox ( "Du hast dein Prestige-Objekt verkauft und erhaelst "..price.." $!", player, 0, 125, 0 )
			dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "prestige", "UID", 0, "UID", playerUID[getPlayerName(player)] )
			for pickup, array in pairs ( prestigeArray ) do
				if array["besitzer"] == getPlayerName ( player ) then
					prestigeArray[pickup]["besitzer"] = ""
				end
			end
		else
			outputChatBox ( "Dein Prestige-Objekt wird momentan versteigert!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Dir gehoert kein Prestige-Objekt!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "sellprestige", sellprestige_func )