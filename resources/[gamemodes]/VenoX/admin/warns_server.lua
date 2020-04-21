function getPlayerWarnCount ( name )
	local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "UID", "warns", "UID", playerUID[name] ), -1 )
	local count = 0
	if result and result[1] then
		count = #result
	end
	return count
end

function getLowestWarnExtensionTime ( name )
	local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=? ORDER BY extends ASC LIMIT 1", "extends_o", "warns", "UID", playerUID[name] ), -1 )
	if result and result[1] then
		return result[1]["extends_o"]
	end
	return false
end

function outputPlayerWarns ( name, reader )
	local array = getPlayerWarns ( name ) 
	local count = type ( array ) == "number" and 0 or #array
	outputChatBox ( "Warns: "..count, reader, 200, 200, 0 )
	if count > 0 then
		for i = 1, count do
			outputChatBox ( "Warn "..i..":", reader, 255, 0, 0 )
			outputChatBox ( "Von: "..array[i]["admin"].." ( "..array[i]["date"].." ), Grund: "..array[i]["reason"], reader, 255, 0, 0 )
			outputChatBox ( "Ablaufdatum: "..array[i]["extends_o"], reader, 255, 0, 0 )
		end
	end
end
addCommandHandler ( "warns", function ( player )
	outputPlayerWarns ( getPlayerName ( player ), player )
end )
addCommandHandler ( "checkwarns", function ( player, cmd, name )
	outputPlayerWarns ( name, player )
end )
addEvent ( "checkwarns", true )
addEventHandler ( "checkwarns", root, function ( name )
	outputPlayerWarns ( name, client )
end )


function warn_func ( player, cmd, name, extends, ... )
	if getElementType ( player ) == "console" or vnxGetElementData ( player, "adminlvl" ) >= 3 and ( not client or client == player ) then
		local suspect = findPlayerByName ( name )
		local playerexists = false
		if not suspect then
			if playerUID[name] then
				suspect = name
			end
		end
		if suspect then
			local reason = {...}
			reason = table.concat( reason, " " )		
			if extends and tonumber(extends) ~= nil then
				local extends = math.abs ( math.floor ( tonumber ( extends ) ) )
				if extends and extends > 0 and extends <= 365 then
					local admin = getPlayerName ( player )
					local rt = getRealTime ()
					local month = rt.month+1
					local day = rt.monthday
					local year = rt.year+1900
					local date = year .."-"..month .. "-"..day.." "..rt.hour..":"..rt.minute..":"..rt.second
					day = day + extends
					while true do
						if day > 30 and month % 2 == 0 and month ~= 2 then
							month = month + 1
							day = day - 31
						elseif day > 31 and month % 2 == 1 and month ~= 2 then
							month = month + 1
							day = day - 32
						elseif month == 2 and day > 28 then
							month = month + 1
							day = day - 29
						elseif month > 12 then
							year = year + 1
							month = month - 12
						else
							break
						end
					end	
					local dateextendet = year .."-"..month .. "-"..day.." "..rt.hour..":"..rt.minute..":"..rt.second
					dbExec ( handler, "INSERT INTO warns ( UID, adminUID, reason, extends, extends_o, date ) VALUES (?,?,?,?,?,?)", playerUID[name], playerUID[admin], reason, rt.timestamp + 3600 * 24 * extends, dateextendet..", 4:00", date )
					if isElement ( suspect ) then
						vnxSetElementData ( suspect, "warns", vnxGetElementData ( suspect, "warns" ) + 1 )
						if getPlayerWarnCount ( name ) == 3 then
							kickPlayer ( suspect, "Von: "..admin..", Grund: "..reason.." (Gebannt, 3 Verwarnungen)" )
						else
							outputChatBox ( "Du wurdest von "..admin.." verwarnt! Grund: "..reason..", Ablaufzeit: "..extends.." Tage!", suspect, 255, 0, 0 )
							outputChatBox ( "Beim dritten Warn wirst du automatisch gebannt. Tippe /warns, um deine Verwarnungen einzusehen.", suspect, 255, 0, 0 )
						end
					else
						offlinemsg ( "Du wurdest von "..admin.." verwarnt; Grund: "..reason, "Server", name )
					end
					outputChatBox ( "Du hast "..name.." verwarnt!", player, 0, 200, 0 )
				else
					infobox ( player, "Gebrauch:\n/warn [Name]\n[1-365]\n[Grund]", 5000, 125, 0, 0 )
				end
			else
				infobox ( player, "Gebrauch:\n/warn [Name]\n[Dauer in Tagen]\n[Grund]", 5000, 125, 0, 0 )
			end
		else
			infobox ( player, "Der Spieler\nexistiert nicht!", 5000, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "Du bist nicht authorisiert,\ndiesen Befehl zu nutzen.", 5000, 255, 0, 0 )
	end
end
addCommandHandler ( "warn", warn_func )
addEvent ( "warn", true )
addEventHandler ( "warn", getRootElement(),
	function ( name, extends, reason )
		warn_func ( client, "warn", name, extends, reason )
	end
)


function deletewarn_func ( player, cmd, target )
    if vnxGetElementData ( player, "adminlvl" ) >= 5 then
		if target and playerUID[target] then
			local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "UID", "warns", "UID", playerUID[target] ), -1 )
			if result and result[1] then
				dbExec ( handler, "DELETE FROM ?? WHERE ??=?", "warns", "UID", playerUID[target] )
				outputChatBox ( "Die Warns von "..target.." wurde erfolgreich gelöscht", player, 0, 125, 0 )
				outputAdminLog ( getPlayerName ( player ).." hat die Warns von "..target.." gelöscht." )
				local targetpl = getPlayerFromName ( target )
				if isElement ( targetpl ) then
					vnxSetElementData ( targetpl, "warns", vnxGetElementData ( targetpl, "warns" ) + 1 )
				end
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "Gebrauch:\n/deletewarn NAME", 5000, 255, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "Du bist nicht authorisiert,\ndiesen Befehl zu nutzen.", 5000, 255, 0, 0 )
    end
end
addCommandHandler ( "deletewarn", deletewarn_func )