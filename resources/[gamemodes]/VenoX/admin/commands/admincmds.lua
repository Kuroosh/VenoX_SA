-- Table
adminsIngame = {}
local player_admin = {}
local frozen_players = {}
local veh_frozen_players = {}
local veh_frozen_vehs = {}
local muted_players = {}
local adminLevels = {
	["VIP"] = 1,
	["Ticketsupporter"] = 2,
	["Supporter"] = 3,
	["Moderator"] = 4,
	["Administrator"] = 5,
	["Stlv.Projektleitung"] = 6,
	["Projektleiter"] = 7
}
donatorMute = {}
local adminmarks = {}

-- Funktionen 

local pack_cmds = {}
pack_cmds["msg"] = true
pack_cmds["pm"] = true

function blockParticularCmds ( cmd )
	if pack_cmds[cmd] and vnxGetElementData ( source, "adminlvl" ) < 3 then
		cancelEvent()
		outputChatBox ( "Benutzung von /msg und /pm ist verboten", source, 255, 0, 0 )
	end
	
end

--

function blockParticularCmdsJoin ( )
	addEventHandler( "onPlayerCommand", source, blockParticularCmds )	
end
addEventHandler ( "onPlayerJoin", getRootElement(), blockParticularCmdsJoin )


function executeAdminServerCMD_func ( cmd, arguments )
	executeCommandHandler ( cmd, client, arguments )	
end


function doesAnyPlayerOccupieTheVeh ( car )
	local bool = false
	for i = 0, 5, 1 do	
		local test = getVehicleOccupant ( car, i )	
		if test ~= false then
			bool = true
		end	
	end
	if bool == false then
		return false
	else
		return true
	end
end


function getAdminLevel ( player )
	local plevel = vnxGetElementData ( player, "adminlvl" )
	if not plevel or plevel == nil then
		return 0
	end	
	return tonumber(plevel)
end


function isAdminLevel ( player, level )
	local plevel = vnxGetElementData ( player, "adminlvl" )
	if not plevel or plevel == nil then
		return false
	end
	if plevel >= level then
		return true
	else
		return false
	end
end


function adminMenueTrigger_func ( )
	if source == client then
		if vnxGetElementData ( source, "adminlvl" ) >= 2 then
			triggerClientEvent ( source, "PListFill", getRootElement() )
		else
			triggerClientEvent ( source, "infobox_start", getRootElement(), "\nDu bist kein\nAdmin!", 5000, 255, 0, 0 )
		end
	end
end




function nickchange_func ( player, cmd, alterName, neuerName )
	if alterName and neuerName then
		if isAdminLevel ( player, adminLevels["Stlv.Projektleitung"] ) then
			if not getPlayerFromName ( alterName ) then	
				if playerUID[alterName] then
					local UID = playerUID[alterName]
					local result2 = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ?? LIKE ?", "Name", "players", "Name", neuerName ), -1 )
					if not result2 or not result2[1] then					
						-- Data --
						dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "players", "Name", neuerName, "UID", UID )	
						dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "Name", neuerName, "UID", UID )			
						playerUID[neuerName] = playerUID[alterName]
						playerUID[alterName] = nil
						outputAdminLog ( getPlayerName ( player ).." hat "..alterName.." in "..neuerName.." umbenannt." )					
						outputChatBox ( "Du hast den Spieler "..alterName.." in "..neuerName.." umbenannt!", player, 0, 125, 0 )						
					else	
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDer neue Name\nist bereits\nvergeben!", 7500, 125, 0, 0 )					
					end		
				else	
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDer Spieler\nexistiert nicht!", 7500, 125, 0, 0 )
				end				
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDer Spieler ist\nnoch eingeloggt!", 7500, 125, 0, 0 )
			end	
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist\nkein Admin!", 7500, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nGebrauch:\n/nickchange aName nName", 7500, 125, 0, 0 )
	end
end


function move_func ( player, cmd, direction )
	if direction then
		if ( not client or client == player ) then
			if isAdminLevel ( player, adminLevels["Supporter"] ) then	
				local veh = getPedOccupiedVehicle ( player )
				local element = player		
				if isElement ( veh ) then			
					element = veh				
				end			
				local x, y, z = getElementPosition ( element )			
				if direction == "up" then
					y = y + 2
				elseif direction == "down" then
					y = y - 2
				elseif direction == "left" then
					x = x - 2
				elseif direction == "right" then
					x = x + 2
				elseif direction == "higher" then
					z = z + 2
				elseif direction == "lower" then
					z = z - 2
				end			
				setElementPosition ( element, x, y, z )				
			else		
				infobox ( player, "Du bist kein Admin", 5000, 125, 0, 0 )			
			end
		else
			outputChatBox ( player, "Richtungen: up, down, left, right, higher, lower", player, 255, 0, 0 )
			infobox ( player, "Bitte Richtung angeben!", 5000, 125, 0, 0 )
		end	
	end
end


function moveVehicleAway_func ( veh )
	if veh and getElementType (veh) == "vehicle" then 
		if isAdminLevel ( client, adminLevels["Supporter"] ) then
			setElementPosition ( veh, 999999, 999999, 999999 )
			setElementInterior ( veh, 999999 )
			setElementDimension ( veh, 999999 )	
		end	
	end
end


function pwchange_func ( player, cmd, target, newPW )
	if getElementType ( player ) == "console" or isAdminLevel ( player, adminLevels["Stlv.Projektleitung"] ) then
		if newPW and target then	
			dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "players", "Passwort", hash("sha512", hash( "sha512", newPW)), "UID", playerUID[target] )
			outputChatBox ( "Passwort geändert!", player, 0, 125, 0 )		
			outputAdminLog ( getPlayerName ( player ).." hat das Passwort von "..target.." geändert!" )			
		else	
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nGebrauch:\n/pwchange Name PW", 7500, 125, 0, 0 )		
		end		
	else	
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist\nnicht befugt!", 7500, 125, 0, 0 )		
	end	
end


function shut_func ( player )
	if isAdminLevel ( player, adminLevels["Stlv.Projektleitung"] ) then
		outputAdminLog ( getPlayerName ( player ).." hat die Notabschaltung benutzt." )
		shutdown ( "Abgeschaltet von: "..getPlayerName ( player ) )	
		setServerPassword ( "sdfsadgsdahsa" )
		local players = getElementsByType("player")
		for i=1, #players do 
			kickPlayer ( players[i], player, "Notabschaltung!" )
		end	
	end	
end


function rebind_func ( player )
	if isKeyBound ( player, "r", "down", reload ) then
		unbindKey ( player, "r", "down", reload )
	end
	bindKey ( player, "r", "down", reload )
	outputChatBox ( "Hotkeys wurden neu gelegt!", player, 0, 125, 0 )
end


function adminlist ( player )
	outputChatBox ( "Momentan online:", player, 0, 100, 255 )
	local pl = {}
	local stvlp = {}
	local adm = {}
	local mode = {}
	local sup = {}
	local ticke = {}

	for playeritem, rang in pairs (adminsIngame) do
		if rang == 7 then
			pl[playeritem] = true
		elseif rang == 6 then
			stvlp[playeritem] = true
		elseif rang == 5 then
			adm[playeritem] = true
		elseif rang == 4 then
			mode[playeritem] = true
		elseif rang == 3 then
			sup[playeritem] = true
		elseif rang == 2 then
			ticke[playeritem] = true
		end
	end
	for playeritem,_ in pairs ( pl ) do 
		outputChatBox ( getPlayerName(playeritem)..", Projektleiter", player, 180, 0, 0 )
    end
	for playeritem,_ in pairs ( stvlp ) do 
		outputChatBox ( getPlayerName(playeritem)..", Stlv.Projektleiter", player, 236, 0, 0 )
	end
	for playeritem,_ in pairs ( adm ) do 
		outputChatBox ( getPlayerName(playeritem)..", Administrator", player, 232, 174, 0 )
	end
	for playeritem,_ in pairs ( mode ) do 
		outputChatBox ( getPlayerName(playeritem)..", Moderator", player, 0, 42, 224 )
	end
	for playeritem,_ in pairs ( sup ) do 
		outputChatBox ( getPlayerName(playeritem)..", Supporter", player, 0, 102, 0 )
	end
	for playeritem,_ in pairs ( ticke ) do 
		outputChatBox ( getPlayerName(playeritem)..", Ticketsupporter", player, 200, 0, 200 )
	end
end


function check_func ( admin, cmd, target )
	if isAdminLevel ( admin, adminLevels["Administrator"] ) then
		if target then
			local player = findPlayerByName( target )
			if player then
				local playtime = vnxGetElementData ( player, "playingtime" )
				local playtimehours = math.floor(playtime/60)
				local playtimeminutes = playtime-playtimehours*60
				local playtime = playtimehours..":"..playtimeminutes
				outputChatBox ( "Name: "..getPlayerName(player).." ( ID: "..vnxGetElementData(player,"playerid").." ), Geld ( Bar/Bank ): "..vnxGetElementData ( player, "money" ).."/"..vnxGetElementData ( player, "bankmoney" )..", Spielzeit: "..playtime.." Minuten", admin, 200, 200, 0 )
				--local job = jobNames [ vnxGetElementData ( player, "job" ) ]
				outputChatBox ( --[["Job: "..job..",]]" Warns: "..getPlayerWarnCount ( getPlayerName ( player ) )..", Telefonnr: "..vnxGetElementData ( player, "telenr" ), admin, 200, 200, 0 )
				outputChatBox ( "Tode: "..vnxGetElementData ( player, "GangwarTode" )..", Kills: "..vnxGetElementData ( player, "GangwarKills" )..", Drogen: "..vnxGetElementData ( player, "drugs" )..", Materials: "..vnxGetElementData ( player, "mats" ), admin, 200, 200, 0 )
				local fraktion = tonumber ( vnxGetElementData ( player, "fraktion" ) )
				fraktion = fraktionNames[fraktion]
				outputChatBox ( "Gefundene Paeckchen: "..vnxGetElementData ( player, "foundpackages" ).."/25", admin, 200, 200, 0 )
				outputChatBox ( "Fraktion: "..fraktion..", AdminLVL: "..vnxGetElementData ( player, "adminlvl" )..", Bonuspunkte: "..vnxGetElementData ( player, "bonuspoints" ), admin, 200, 200, 0 )
				local pname = getPlayerName ( player )
				local licenses = ""
				if vnxGetElementData ( player, "carlicense" ) == 1 then licenses = licenses.."Fuehrerschein " end
				if vnxGetElementData ( player, "bikelicense" ) == 1 then licenses = licenses.."Motorradschein " end
				if vnxGetElementData ( player, "fishinglicense" ) == 1 then licenses = licenses.."Angelschein " end
				if vnxGetElementData ( player, "lkwlicense" ) == 1 then licenses = licenses.."LKW-Fuehrerschein " end
				if vnxGetElementData ( player, "gunlicense" ) == 1 then licenses = licenses.."Waffenschein " end
				if vnxGetElementData ( player, "motorbootlicense" ) == 1 then licenses = licenses.."Bootsfuehrerschein " end
				if vnxGetElementData ( player, "segellicense" ) == 1 then licenses = licenses.."Segelschein " end
				if vnxGetElementData ( player, "planelicenseb" ) == 1 then licenses = licenses.."Flugschein A " end
				if vnxGetElementData ( player, "planelicensea" ) == 1 then licenses = licenses.."Flugschein B " end
				if vnxGetElementData ( player, "helilicense" ) == 1 then licenses = licenses.."Flugschein C " end
				outputChatBox ( "Vorhandene Lizensen: ", admin, 200, 0, 200 )
				outputChatBox ( licenses, admin, 200, 50, 200 )
				executeCommandHandler ( "getchangestate", admin, getPlayerName(player) )
				outputChatBox ( "IP: "..getPlayerIP(player), admin, 200, 200, 0 )
				outputChatBox ( "Aktuelle Waffe: "..getPedWeapon(player), admin, 125, 125, 125 )
			else
				triggerClientEvent ( admin, "infobox_start", getRootElement(), "\n\nUngueltiger Name!", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( admin, "infobox_start", getRootElement(), "\nGebrauch:\n/check Name!", 7500, 125, 0, 0 )
		end
	else
		triggerClientEvent ( admin, "infobox_start", getRootElement(), "\n\nDu bist kein\n Admin!", 7500, 125, 0, 0 )	
	end	
end



function mark_func ( player, cmd, count )
	if isAdminLevel ( player, adminLevels["Supporter"] ) then
		if not count or tonumber(count) == nil then
			count = 1		
		end
		count = tonumber(count)			
		if count ~= 1 and count ~= 2 and count ~= 3 then			
			outputChatBox ( "Es sind nur Marker 1, 2 und 3 möglich!", player, 0, 0, 0 )
			return			
		end
		local x, y, z = getElementPosition ( player )
		local int = getElementInterior ( player )
		local dim = getElementDimension ( player )
		if not adminmarks[player] then
			adminmarks[player] = {}
		end
		adminmarks[player][count] = { ["x"] = x, ["y"] = y, ["z"] = z, ["dim"] = dim, ["int"] = int }	
		outputChatBox ( "Koordinaten für Marker "..count.." gesetzt!", player, 0, 0, 0 )			
	end
end


function gotomark_func ( player, cmd, count )
	if isAdminLevel ( player, adminLevels["Supporter"] ) then
		if not count or tonumber(count) == nil then	
			count = 1			
		end	
		count = tonumber(count)		
		if count ~= 1 and count ~= 2 and count ~= 3 then		
			outputChatBox ( "Es sind nur Marker 1, 2 und 3 möglich!", player, 0, 0, 0 )
			return				
		end	
		if not adminmarks[player] then
			adminmarks[player] = {}
		end		
		if not adminmarks[player][count] then
			outputChatBox ( "Marker existiert nicht!", player, 0, 0, 0 )
			return
		end	
		local x, y, z, dim, int = adminmarks[player][count]["x"], adminmarks[player][count]["y"], adminmarks[player][count]["z"], adminmarks[player][count]["dim"], adminmarks[player][count]["int"]	
		local seat = getPedOccupiedVehicleSeat ( player )	
		if seat then		
			if seat == 0 then	
				local veh = getPedOccupiedVehicle( player )
				setElementPosition ( veh, x, y, z )
				setElementDimension ( veh, dim )
				setElementInterior ( veh, int )
				setElementDimension ( player, int )
				setElementInterior ( player, dim )				
				outputChatBox ( "Zum "..count..". Marker teleportiert!", player, 0, 0, 0 )
				return			
			end			
		end
		removePedFromVehicle ( player )
		setElementPosition ( player, x, y, z )
		setElementDimension ( player, dim )
		setElementInterior ( player, int )
		outputChatBox ( "Zum "..count..". Marker teleportiert!", player, 0, 0, 0 )	
	end	
end


function respawn_func ( player, cmd, respawn )
	local bool = false
	local boole = false
	if respawn then
		if player == "none" or ( isElement ( player ) and isAdminLevel ( player, adminLevels["Supporter"] ) ) then
			if respawn == "fishing" then
				for i = 1, 9 do
					if not getVehicleOccupant ( fishReefer[i] ) then
						respawnVehicle ( fishReefer[i] )
						setElementDimension ( fishReefer[i], 0 )
						setElementInterior ( fishReefer[i], 0 )
					end
				end
			elseif respawn == "sfpd" then
				for veh, _ in pairs ( factionVehicles[1] ) do
					if not getVehicleOccupant ( veh ) then
						respawnVehicle ( veh )
					end
				end
			elseif respawn == "terror" then
				for veh, _ in pairs ( factionVehicles[4] ) do
					if not getVehicleOccupant ( veh ) then
						respawnVehicle ( veh )
					end
				end
			elseif respawn == "brotherhood" then
				for veh, _ in pairs ( factionVehicles[2] ) do
					if not getVehicleOccupant ( veh ) then
						respawnVehicle ( veh )
					end
				end
			elseif respawn == "triaden" then
				for veh, _ in pairs ( factionVehicles[3] ) do
					if not getVehicleOccupant ( veh ) then
						respawnVehicle ( veh )
					end
				end
			elseif respawn == "news" then
				for veh, _ in pairs ( factionVehicles[5] ) do
					if not getVehicleOccupant ( veh ) then
						respawnVehicle ( veh )
					end
				end
			elseif respawn == "fbi" then
				for veh, _ in pairs ( factionVehicles[6] ) do
					if not getVehicleOccupant ( veh ) then
						respawnVehicle ( veh )
					end
				end
			elseif respawn == "taxi" then
				for i = 1, #taxiCars do
					if not getVehicleOccupant ( taxiCars[i] ) then
						respawnVehicle ( taxiCars[i] )
					end
				end
			elseif respawn == "hotdog" then
				for i = 1, #hotdogVehicles do
					if not getVehicleOccupant ( hotdogVehicles[i] ) then
						respawnVehicle ( hotdogVehicles[i] )
					end
				end
			elseif respawn == "aztecas" then
				for veh, _ in pairs ( factionVehicles[7] ) do
					if not getVehicleOccupant ( veh ) then
						respawnVehicle ( veh )
					end
				end
			elseif respawn == "army" then
				for veh, _ in pairs ( factionVehicles[8] ) do
					if not getVehicleOccupant ( veh ) then
						respawnVehicle ( veh )
					end
				end
				if not getVehicleOccupant ( armyAC130 ) then
					destroyElement ( armyAC130 )
					ac130 ()
				end
			elseif respawn == "biker" then
				for veh, _ in pairs ( factionVehicles[9] ) do
					if not getVehicleOccupant ( veh ) then
						respawnVehicle ( veh )
					end
				end
			elseif respawn == "mechanic" then
				for veh, _ in pairs ( factionVehicles[11] ) do
					if not getVehicleOccupant ( veh ) then
						respawnVehicle ( veh )
					end
				end
			elseif respawn == "medic" then
				for veh, _ in pairs ( factionVehicles[10] ) do
					if not getVehicleOccupant ( veh ) then
						respawnVehicle ( veh )
					end
				end
			elseif respawn == "grove" then
				for veh, _ in pairs ( factionVehicles[12] ) do
					if not getVehicleOccupant ( veh ) then
						respawnVehicle ( veh )
					end
				end
			elseif respawn == "ballas" then
				for veh, _ in pairs ( factionVehicles[13] ) do
					if not getVehicleOccupant ( veh ) then
						respawnVehicle ( veh )
					end
				end	
			else
				if player ~= "none" then outputChatBox ( "/respawn [sfpd|medic|mechanic|brotherhood|triaden|news|Feuerwehr|fbi|aztecas|army|biker|grove|ballas|fishing|taxi|hotdog]", player, 125, 0, 0 ) end
				boole = true
			end
			if not boole then
				if player ~= "none" then outputChatBox ( "Fahrzeuge respawned!", player, 0, 125, 0 ) end
			end
		else
			triggerClientEvent ( player, "infobox_start", player, "\n\nDu bist nicht\nauthorisiert!", 5000, 125, 0, 0 )
		end
	else
		outputChatBox ( "/respawn [sfpd|medic|mechanic|brotherhood|triaden|news|terror|fbi|aztecas|army|biker|grove|ballas|fishing|taxi|hotdog]", player, 125, 0, 0 )
	end
end


function tunecar_func ( player, cmd, part )
	if isAdminLevel ( player, adminLevels["Administrator"] ) then
		if part and tonumber ( part ) then
			succes = addVehicleUpgrade ( getPedOccupiedVehicle(player), tonumber ( part ) )	
			outputAdminLog ( getPlayerName ( player ).." hat ein Auto upgegradet!" )
			if succes == false then	
				outputChatBox ( "Ungueltige Eingabe/Fahrzeug!", player, 125, 0, 0 )		
			end	
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nGebrauch:\n/tunecar [Part]", 7500, 125, 0, 0 )	
		end	
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist nicht\nauthorisiert!", 5000, 125, 0, 0 )	
	end
end


function freezeshit ( )
	setElementFrozen ( source, true )
	setElementFrozen ( veh_frozen_vehs[getPlayerName(source)], false )	
end


function cancelWeaponShit ()
	setPedWeaponSlot ( source, 0 )
end


function freeze_func ( player, cmd, target )
	local fix
	if isAdminLevel ( player, adminLevels["Supporter"] ) then
		if target then
			target = findPlayerByName( target )
			if target then
				if frozen_players[getPlayerName(target)] then
					setElementFrozen ( target, false )
					frozen_players[getPlayerName(target)] = false
					removeEventHandler ( "onPlayerWeaponSwitch", target, cancelWeaponShit )
					outputChatBox ( "Du hast "..getPlayerName(target).." entfreezed!", player, 0, 125, 0 )
					outputChatBox ( "Du wurdest von "..getPlayerName(player).." entfreezed!", target, 0, 125, 0 )		
					return			
				end				
				if veh_frozen_players[getPlayerName(target)] then				
					setElementFrozen ( target, false )
					veh_frozen_players[getPlayerName(target)] = false
					removeEventHandler ( "onPlayerWeaponSwitch", target, cancelWeaponShit )
					setElementFrozen ( veh_frozen_vehs[getPlayerName(target)], false )
					veh_frozen_vehs[getPlayerName(target)] = false	
					removeEventHandler ( "onPlayerVehicleExit", target, freezeshit )						
					outputChatBox ( "Du hast "..getPlayerName(target).." entfreezed!", player, 0, 125, 0 )
					outputChatBox ( "Du wurdest von "..getPlayerName(player).." entfreezed!", target, 0, 125, 0 )					
					return				
				end			
				local veh = getPedOccupiedVehicle ( target )						
				if veh then				
					setElementFrozen ( veh, true )					
					veh_frozen_players[getPlayerName(target)] = true
					veh_frozen_vehs[getPlayerName(target)] = veh
					addEventHandler ( "onPlayerWeaponSwitch", target, cancelWeaponShit )
					setPedWeaponSlot ( target, 0 )
					addEventHandler ( "onPlayerVehicleExit", target, freezeshit )						
					addEventHandler ( "onPlayerQuit", target, 
						function ()
							setElementFrozen ( veh_frozen_vehs[getPlayerName(source)], false )
							veh_frozen_players[getPlayerName(source)] = false
							veh_frozen_vehs[getPlayerName(source)] = false
						end )						
				else				
					setElementFrozen ( target, true )
					frozen_players[getPlayerName(target)] = true
					addEventHandler ( "onPlayerWeaponSwitch", target, cancelWeaponShit )
					setPedWeaponSlot ( target, 0 )
					addEventHandler ( "onPlayerQuit", target, 
						function ()
							frozen_players[getPlayerName(source)] = false
						end )										
				end							
				outputChatBox ( "Du hast "..getPlayerName(target).." gefreezed!", player, 0, 125, 0 )
				outputChatBox ( "Du wurdest von "..getPlayerName(player).." gefreezed!", target, 0, 125, 0 )
				outputAdminLog ( getPlayerName ( player ).." hat "..getPlayerName ( target ).." gefreezet!" )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nGebrauch:\n/freeze NAME!", 5000, 125, 0, 0 )
		end	
	else	
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist nicht\nauthorisiert!", 5000, 125, 0, 0 )		
	end	
end


function intdim ( player, cmd, target, int, dim )
	if isAdminLevel ( player, adminLevels ["Moderator"] ) then
		if target then
			local target = findPlayerByName( target )	
			if not isElement(target) then
				outputChatBox ( "Der Spieler ist offline!", player, 125, 0, 0 )
				return
			end
			if int and tonumber(int) ~= nil and dim and tonumber(dim) ~= nil then
				setElementInterior ( target, tonumber ( int ) )
				setElementDimension ( target, tonumber ( dim ) )
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nGebrauch:\n/intdim NAME INT DIM!", 5000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nGebrauch:\n/intdim NAME INT DIM!", 5000, 125, 0, 0 )
		end	
	else	
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist nicht\nauthorisiert!", 5000, 125, 0, 0 )		
	end		
end


function cleartext_func ( player )
	if getElementType ( player ) == "console" or isAdminLevel ( player, adminLevels["Supporter"] ) then
		for i = 1, 50 do
			outputChatBox ( " " )
		end	
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist nicht\nauthorisiert!", 5000, 125, 0, 0 )	
	end
end


function kickPlayerGMX ( player )
	kickPlayer ( player, "Serverrestart" )
end


function restartNow ()
	if not isThisTheBetaServer () then
		setServerPassword ( "" )
	end
	local resource = getThisResource()
	elementData = nil
	restartResource ( resource )	
end


function restartServer()
	local btime = getRealTime()
	local bmonth = btime.month
	local bday = btime.monthday
	local bhour = btime.hour
	local bminute = btime.minute
	local bsecond = btime.second	
	if isThisTheBetaServer () then
		setServerPassword ( betaServerPasswort )
	else
		setServerPassword ( "sadfsadfsa!" )
	end	
	local players = getElementsByType("player")
	local j=0
	for i=1, #players do 
		setTimer ( kickPlayerGMX, 50+100*i, 1, players[i] )
		j = i
	end
	setTimer ( restartNow, 100+200*j, 1 )
end


function gmx_func ( player, cmd, minutes )	
	if getElementType(player) == "console" or isAdminLevel ( player, adminLevels["Projektleiter"] ) then
		outputAdminLog ( getPlayerName ( player ).." hat den Server neu gestartet." )
		if not minutes or not tonumber(minutes) then minutes = 1 end	
		setTimer ( restartServer, minutes*60000, 1 )
		outputChatBox ( "Server wird in "..minutes.." Minuten neu gestartet.", getRootElement(), 125, 0, 0 )	
		local btime = getRealTime()
		local bmonth = btime.month
		local bday = btime.monthday
		local bhour = btime.hour
		local bminute = btime.minute
		local bsecond = btime.second
		outputServerLog ( bday.."."..bmonth..", "..bhour..":"..bminute..":"..bsecond.." - "..getPlayerName ( player ).." hat den Server neu gestartet!")	
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist nicht\nauthorisiert!", 5000, 125, 0, 0 )	
	end	
end




function ochat_func ( player, cmd, ... )
	local parametersTable = {...}
	local stringWithAllParameters = table.concat( parametersTable, " " )
	if isAdminLevel ( player, adminLevels["Ticketsupporter"] ) then
		if stringWithAllParameters == nil then
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nBitte einen\nText eingeben!", 5000, 125, 0, 0 )	
		else
			local rang = vnxGetElementData ( player, "adminlvl" )
			local rank = ""
			if rang == 2 then
				rank = "Ticketsupporter"
				outputChatBox ( "{{ #C800C8"..rank.." "..getPlayerName(player).." : #FFFFFF"..stringWithAllParameters.." }}", getRootElement(), 255, 255, 255, true )
			elseif rang == 3 then
				rank = "Supporter"
				outputChatBox ( "{{ #006600"..rank.." "..getPlayerName(player).." : #FFFFFF"..stringWithAllParameters.." }}", getRootElement(), 255, 255, 255, true )
			elseif rang == 4 then
				rank = "Moderator"
				outputChatBox ( "{{ #002DE0"..rank.." "..getPlayerName(player).." : #FFFFFF"..stringWithAllParameters.." }}", getRootElement(), 255, 255, 255, true )
			elseif rang == 5 then
				rank = "Administrator"
				outputChatBox ( "{{ #E8AE00"..rank.." "..getPlayerName(player).." : #FFFFFF"..stringWithAllParameters.." }}", getRootElement(), 255, 255, 255, true )
			elseif rang == 6 then
				rank = "Stlv.Projektleitung"
				outputChatBox ( "{{ #EC0000"..rank.." "..getPlayerName(player).." : #FFFFFF"..stringWithAllParameters.." }}", getRootElement(), 255, 255, 255, true )
			elseif rang == 7 then
				rank = "Projektleitung"
				outputChatBox ( "{{ #B40000"..rank.." "..getPlayerName(player).." : #FFFFFF"..stringWithAllParameters.." }}", getRootElement(), 255, 255, 255, true )
			end	
			outputLog ( "[O-CHAT]: "..getPlayerName(player)..": "..stringWithAllParameters.."", "adminchat" )
		end	
	else	
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist kein\n Admin!", 5000, 125, 0, 0 )		
	end	
end




--[[
function ochat_func ( player, cmd, ... )
	
	local parametersTable = {...}
	local stringWithAllParameters = table.concat( parametersTable, " " )
	if isAdmin(player) then
		if stringWithAllParameters == nil then
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nBitte einen Text eingeben!", 5000, 125, 0, 0 )
		else
			if tonumber(getElementData ( player, "adminlvl" )) == 2 then
				rank = "Moderator"
				outputChatBox ( "{{ #FAFA32"..rank.." "..getPlayerName(player)..": #FFFFFF"..stringWithAllParameters.." }}", getRootElement(), 255, 255, 255, true )
			elseif tonumber(getElementData ( player, "adminlvl" )) == 3 then
				rank = "S-Moderator"
				outputChatBox ( "{{ #0032FA"..rank.." "..getPlayerName(player)..": #FFFFFF"..stringWithAllParameters.." }}", getRootElement(), 255, 255, 255, true )
			elseif tonumber(getElementData ( player, "adminlvl" )) == 4 then
				rank = "Administrator"
				outputChatBox ( "{{ #960000"..rank.." "..getPlayerName(player)..": #FFFFFF"..stringWithAllParameters.." }}", getRootElement(), 255, 255, 255, true )
			elseif tonumber(getElementData ( player, "adminlvl" )) == 5 then
				rank = "Serverleiter"
				outputChatBox ( "{{ #C80000"..rank.." "..getPlayerName(player)..": #FFFFFF"..stringWithAllParameters.." }}", getRootElement(), 255, 255, 255, true )
			elseif tonumber(getElementData ( player, "adminlvl" )) == 6 then
				rank = "Inhaber"
				outputChatBox ( "{{ #FF0000"..rank.." "..getPlayerName(player)..": #FFFFFF"..stringWithAllParameters.." }}", getRootElement(), 255, 255, 255, true )
			end
			outputLog ( "[O-CHAT]: "..getPlayerName(player)..": "..stringWithAllParameters.."", "adminchat" )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist kein\n Admin!", 5000, 125, 0, 0 )
	end
end
addCommandHandler ("o", ochat_func )



]]

local g_rankss = {
	[2] = {"Ticketsupporter", "#C800C8"},
	[3] = {"Supporter", "#006600"},
	[4] = {"Moderator", "#002DE0"},
	[5] = {"Administrator", "#FF8800"},
	[6] = {"Stlv.Projektleiter", "#EC0000"},
	[7] = {"Projektleiter", "#B40000"}
}


function achat_func ( player, cmd, ... )		
	local parametersTable = {...}
	local stringWithAllParameters = table.concat( parametersTable, " " )
	if isAdminLevel ( player, adminLevels["Ticketsupporter"] ) then
		if stringWithAllParameters == nil then		
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nBitte einen\nText eingeben!", 5000, 125, 0, 0 )		
		else
			local rang = vnxGetElementData (player, "adminlvl")
			for i, v in ipairs(getElementsByType("player")) do
				local ok = vnxGetElementData(v, "adminlvl") or 0
				if ok >= 2 then
					outputChatBox ("{{ ACHAT "..g_rankss[rang][2]..g_rankss[rang][1].." "..getPlayerName(player).." : #FFFFFF"..stringWithAllParameters.." }}", v, 255, 255, 255, true)
				end
			end
		end		
	elseif vnxGetElementData ( player, "adminlvl" ) == 0 then
		if stringWithAllParameters == nil then		
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nBitte einen\nText eingeben!", 5000, 125, 0, 0 )		
		else	
			for playeritem, index in pairs(adminsIngame) do 	
				if index == 1 then
					if not donatorMute[playeritem][getPlayerName(player)] or donatorMute[playeritem][getPlayerName(player)] == nil then
						outputChatBox ( "[ "..getPlayerName(player)..": "..stringWithAllParameters.." ]", playeritem, 99, 184, 255 )
					end
				end				
			end		
		end	
	else	
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist\nkein Admin!", 5000, 125, 0, 0 )		
	end	
end

function forgotpw(player, admin)
	local rang = vnxGetElementData (player, "adminlvl")
			executeCommandHandler( "achat", player, "Weiss mein PW nicht mehr ihr opfer" )
			--outputChatBox ( "[ LOG-IN ] : "..player.." Weiss sein Passwort nicht mehr! Er wartet im Ts3 Support warte raum.", admin, 255, 0, 0 )
			outputDebugString( "ichfickmeinleben")
end
addEvent( "forgotpw_btn", true )
addEventHandler('forgotpw_btn', root, forgotpw)







function setrank_func ( player, cmd, target, rank )
	if target then
		if rank then
			local targetpl = findPlayerByName( target )
			local rank = math.floor ( math.abs ( tonumber ( rank ) ) )		
			if isAdminLevel ( player, adminLevels["Moderator"] ) then		
				if isElement ( targetpl ) then			
					if rank <= 5 then				
						vnxSetElementData ( targetpl, "rang", rank )
						local frac = vnxGetElementData(targetpl,"fraktion")
						fraktionMemberList[frac][getPlayerName(targetpl)] = rank
						outputChatBox ( "Admin "..getPlayerName ( player ).." hat deinen Rank auf "..rank.." gesetzt!", targetpl, 200, 200, 0 )
						outputChatBox ( "Rang gesetzt!", player, 0, 125, 0 )
						outputAdminLog ( getPlayerName ( player ).." hat "..getPlayerName ( targetpl ).."s Rang auf "..rank.." gesetzt!" )
						for playeritem, _ in pairs ( fraktionMembers[frac] ) do
							triggerClientEvent ( playeritem, "syncPlayerList", player, fraktionMemberList[frac], fraktionMemberListInvite[frac] )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\nGebrauch:\n/setrank [Name] [Rang]", 5000, 255, 0, 0 )		
					end	
				elseif playerUID[target] then
					local frac = tonumber ( dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Fraktion", "userdata", "UID", playerUID[target] ), -1 )[1]["Fraktion"] )
					if frac > 0 then
						dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "FraktionsRang", rank, "UID", playerUID[target] )
						fraktionMemberList[frac][target] = rank
						offlinemsg ( "Du wurdest von "..getPlayerName(player).." auf Rang "..rank.." gesetzt.", "Server", target )
						outputChatBox ( "Rang gesetzt (offline)!", player, 0, 125, 0 )
						outputAdminLog ( getPlayerName ( player ).." hat "..target.."s Rang offline auf "..rank.." gesetzt!" )
						for playeritem, _ in pairs ( fraktionMembers[frac] ) do
							triggerClientEvent ( playeritem, "syncPlayerList", player, fraktionMemberList[frac], fraktionMemberListInvite[frac] )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDer Spieler\nist Zivilist!", 5000, 255, 0, 0 )
					end				
				else	
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nSpieler\nexistiert nicht!", 5000, 255, 0, 0 )			
				end			
			else		
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nicht authorisiert,\ndiesen Befehl zu nutzen.", 5000, 255, 0, 0 )	
			end
		else		
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nGebrauch:\n/setrank NAME RANG", 5000, 255, 0, 0 )	
		end
	else		
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nGebrauch:\n/setrank NAME RANG", 5000, 255, 0, 0 )	
	end
end


function makeleader_func ( player, cmd, target, fraktion )
	if target then
		local targetpl = findPlayerByName( target )
		if fraktion then
			fraktion = math.floor ( math.abs ( tonumber ( fraktion ) ) )
			if isAdminLevel ( player, adminLevels["Administrator"] ) then	
				if not isElement ( targetpl ) then
					if playerUID[target] then
						local oldfrac = tonumber ( dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Fraktion", "userdata", "UID", playerUID[target] ), -1 )[1]["Fraktion"] )
						dbExec ( handler, "UPDATE ?? SET ??=?, ??=? WHERE ??=?", "userdata", "FraktionsRang", 5, "Fraktion", fraktion, "UID", playerUID[target] )
						fraktionMemberList[oldfrac][target] = nil
						fraktionMemberList[fraktion][target] = 5
						if oldfrac ~= fraktion then
							fraktionMemberListInvite[oldfrac][target] = nil
							fraktionMemberListInvite[fraktion][target] = timestampOptical ()
						end
						
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\nSpieler existiert\nnicht!", 5000, 0, 125, 125 )	
					end	
				else			
					if vnxGetElementData ( targetpl, "loggedin" ) == 1 then
						if fraktion >= 0 then	
							local oldfrac = vnxGetElementData ( targetpl, "fraktion" )
							local targetname = getPlayerName ( targetpl )
							if oldfrac >= 0 and oldfrac <= #fraktionNames+1 then
								fraktionMembers[oldfrac][targetpl] = nil
								fraktionMemberList[oldfrac][targetname] = nil
								fraktionMemberListInvite[oldfrac][targetname] = nil		
							end
							if fraktion == 0 then					
								vnxSetElementData ( targetpl, "rang", 0 )
								outputChatBox ( "Du wurdest soeben zum Bürger gemacht.", targetpl, 0, 200, 255 )
								outputAdminLog ( getPlayerName ( player ).." hat "..targetname.." zum Zivilisten gemacht." )
								dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "LastFactionChange", timestampOptical (), "UID", playerUID[targetname] )
								playSoundFrontEnd (targetpl, 42 )								
							elseif fraktion == 1 then							
								vnxSetElementData ( targetpl, "rang", 5 )
								playSoundFrontEnd (targetpl, 42 )
								outputChatBox ( "Du wurdest soeben zum Chief of Police ernannt! Für mehr Infos öffne das Hilfemenue!", targetpl, 0, 200, 255 )
								outputAdminLog ( getPlayerName ( player ).." hat "..targetname.." zum Chief of Police ernannt!" )
								triggerClientEvent(targetpl,"blendLoadingScreen",targetpl)
								dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "LastFactionChange", timestampOptical (), "UID", playerUID[targetname] )										
							elseif fraktion == 2 then						
								vnxSetElementData ( targetpl, "rang", 5 )
								playSoundFrontEnd (targetpl, 42 )
								outputChatBox ( "Du bist nun Don der Aryan Brotherhood von Venox City - Für mehr Infos öffne das Hilfemenue!", targetpl, 160, 40, 40 )
								triggerClientEvent(targetpl,"blendLoadingScreen",targetpl)
								outputAdminLog ( getPlayerName ( player ).." hat "..targetname.." zum Don der Venox City Aryan Brotherhood ernannt!" )
								dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "LastFactionChange", timestampOptical (), "UID", playerUID[targetname] )							
							elseif fraktion == 3 then							
								vnxSetElementData ( targetpl, "rang", 5 )
								playSoundFrontEnd (targetpl, 42 )
								outputChatBox ( "Du bist nun Leader der Triaden von Venox City - Für mehr Infos öffne das Hilfemenue!", targetpl, 0, 200, 255 )
								outputAdminLog ( getPlayerName ( player ).." hat "..targetname.." zum Leader der Venox City Triaden ernannt!" )
								triggerClientEvent(targetpl,"blendLoadingScreen",targetpl)
								dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "LastFactionChange", timestampOptical (), "UID", playerUID[targetname] )														
							elseif fraktion == 4 then
								vnxSetElementData ( targetpl, "rang", 5 )
								playSoundFrontEnd (targetpl, 42 )
								outputChatBox ( "[GESPERRT ] Für mehr Infos öffne das Hilfemenue!", targetpl, 180, 0, 0 )
								outputAdminLog ( getPlayerName ( player ).." hat "..targetname.." zum Revolutionsführer ernannt!" )
								dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "LastFactionChange", timestampOptical (), "UID", playerUID[targetname] )													
							elseif fraktion == 5 then							
								vnxSetElementData ( targetpl, "rang", 5 )
								playSoundFrontEnd (targetpl, 42 )
								outputChatBox ( "Du bist nun der Chefredakteur der Venox City News - Für mehr Infos öffne das Hilfemenue!", targetpl, 0, 200, 255 )
								outputAdminLog ( getPlayerName ( player ).." hat "..targetname.." zum Chefredakteur von Venox City ernannt!" )
								triggerClientEvent(targetpl,"blendLoadingScreen",targetpl)
								dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "LastFactionChange", timestampOptical (), "UID", playerUID[targetname] )												
							elseif fraktion == 6 then						
								vnxSetElementData ( targetpl, "rang", 5 )
								playSoundFrontEnd (targetpl, 42 )
								outputChatBox ( "Du bist nun der Direktor des Federal Bureau of Investigation - Für mehr Infos öffne das Hilfemenue!", targetpl, 0, 200, 255 )
								outputAdminLog ( getPlayerName ( player ).." hat "..targetname.." zum FBI-Direktor von Venox City ernannt!" )
								triggerClientEvent(targetpl,"blendLoadingScreen",targetpl)
								dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "LastFactionChange", timestampOptical (), "UID", playerUID[targetname] )
							elseif fraktion == 7 then						
								vnxSetElementData ( targetpl, "rang", 5 )
								playSoundFrontEnd (targetpl, 42 )
								outputChatBox ( "Du bist nun der Boss der Venox City Los Aztecas- Für mehr Infos öffne das Hilfemenue!", targetpl, 0, 200, 255 )
								outputAdminLog ( getPlayerName ( player ).." hat "..targetname.." zum Boss der Los Aztecas ernannt!" )
								triggerClientEvent(targetpl,"blendLoadingScreen",targetpl)
								dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "LastFactionChange", timestampOptical (), "UID", playerUID[targetname] )													
							elseif fraktion == 8 then						
								vnxSetElementData ( targetpl, "rang", 5 )
								playSoundFrontEnd (targetpl, 42 )
								outputChatBox ( "Du bist nun der Commander der Venox U.S Army - Für mehr Infos öffne das Hilfemenue!", targetpl, 0, 200, 255 )
								triggerClientEvent(targetpl,"blendLoadingScreen",targetpl)
								outputAdminLog ( getPlayerName ( player ).." hat "..targetname.." zum Commander der Venox Army ernannt!" )
								dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "LastFactionChange", timestampOptical (), "UID", playerUID[targetname] )										
							elseif fraktion == 9 then						
								vnxSetElementData ( targetpl, "rang", 5 )
								playSoundFrontEnd (targetpl, 42 )
								outputChatBox ( "Du bist nun der President der Angels of Death - Für mehr Infos öffne das Hilfemenue!", targetpl, 0, 200, 255 )
								outputAdminLog ( getPlayerName ( player ).." hat "..targetname.." zum President der Venox City AoD ernannt!" )
								triggerClientEvent(targetpl,"blendLoadingScreen",targetpl)
								dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "LastFactionChange", timestampOptical (), "UID", playerUID[targetname] )								
							elseif fraktion == 10 then						
								vnxSetElementData ( targetpl, "rang", 5 )
								playSoundFrontEnd (targetpl, 42 )
								outputChatBox ( "Du bist nun der Leader der Venox Medic's - Für mehr Infos öffne das Hilfemenue!", targetpl, 0, 200, 255 )
								outputAdminLog ( getPlayerName ( player ).." hat "..targetname.." zum Leader der Medics ernannt!" )
								triggerClientEvent(targetpl,"blendLoadingScreen",targetpl)
								dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "LastFactionChange", timestampOptical (), "UID", playerUID[targetname] )							
							elseif fraktion == 11 then						
								vnxSetElementData ( targetpl, "rang", 5 )
								playSoundFrontEnd (targetpl, 42 )
								outputChatBox ( "Du bist nun der Leader von den Venox City Mechaniker - Für mehr Infos öffne das Hilfemenue!", targetpl, 0, 200, 255 )
								outputAdminLog ( getPlayerName ( player ).." hat "..targetname.." zum Leader der Mechaniker ernannt!" )
								triggerClientEvent(targetpl,"blendLoadingScreen",targetpl)
								dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "LastFactionChange", timestampOptical (), "UID", playerUID[targetname] )								
							elseif fraktion == 12 then						
								vnxSetElementData ( targetpl, "rang", 5 )
								playSoundFrontEnd (targetpl, 42 )
								outputChatBox ( "Du bist nun der Banger der Venox City Ballas - Für mehr Infos öffne das Hilfemenue!", targetpl, 0, 200, 255 )
								outputAdminLog ( getPlayerName ( player ).." hat "..targetname.." zum Banger der Ballas ernannt!" )
								triggerClientEvent(targetpl,"blendLoadingScreen",targetpl)
								dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "LastFactionChange", timestampOptical (), "UID", playerUID[targetname] )								
							elseif fraktion == 13 then						
								vnxSetElementData ( targetpl, "rang", 5 )
								playSoundFrontEnd (targetpl, 42 )
								outputChatBox ( "Du bist nun Leader der Venox City Grove Street - Für mehr Infos öffne das Hilfemenue!", targetpl, 0, 200, 255 )
								triggerClientEvent(targetpl,"blendLoadingScreen",targetpl)
								outputAdminLog ( getPlayerName ( player ).." hat "..targetname.." zum Leader der Grove Street ernannt!" )
								dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "LastFactionChange", timestampOptical (), "UID", playerUID[targetname] )	
							elseif fraktion == 14 then						
								vnxSetElementData ( targetpl, "rang", 5 )
								playSoundFrontEnd (targetpl, 42 )
								outputChatBox ( "Du bist nun Leader der Streetracer - Für mehr Infos öffne das Hilfemenue!", targetpl, 0, 200, 255 )
								outputAdminLog ( getPlayerName ( player ).." hat "..targetname.." zum Leader der Streetracer ernannt!" )
								triggerClientEvent(targetpl,"blendLoadingScreen",targetpl)
								dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "LastFactionChange", timestampOptical (), "UID", playerUID[targetname] )									
							elseif fraktion == 15 then						
								vnxSetElementData ( targetpl, "rang", 5 )
								playSoundFrontEnd (targetpl, 42 )
								outputChatBox ( "Du bist nun Leader des San Andreas Fire Department's - Für mehr Infos öffne das Hilfemenue!", targetpl, 0, 200, 255 )
								outputAdminLog ( getPlayerName ( player ).." hat "..targetname.." zum Leader des S.A.F.D. ernannt!" )
								triggerClientEvent(targetpl,"blendLoadingScreen",targetpl)
								dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "LastFactionChange", timestampOptical (), "UID", playerUID[targetname] )									
							else
								playSoundFrontEnd (targetpl, 42 )
								infobox ( player, "Die Fraktion\nexistiert nicht!", 4000, 200, 0, 0 )
								return
							end	
							vnxSetElementData ( targetpl, "fraktion", fraktion )
							triggerClientEvent ( targetpl, "triggeredBlacklist", targetpl, blacklistPlayers[fraktion] )
							if fraktion ~= 0 then							
								fraktionMembers[fraktion][targetpl] = fraktion	
								fraktionMemberList[fraktion][getPlayerName(targetpl)] = 5
								if oldfrac ~= fraktion then
									fraktionMemberListInvite[fraktion][getPlayerName(targetpl)] = timestampOptical ()
									for playeritem, _ in pairs ( fraktionMembers[oldfrac] ) do
										triggerClientEvent ( playeritem, "syncPlayerList", player, fraktionMemberList[oldfrac], fraktionMemberListInvite[oldfrac] )
									end
								end
								for playeritem, _ in pairs ( fraktionMembers[fraktion] ) do
									triggerClientEvent ( playeritem, "syncPlayerList", player, fraktionMemberList[fraktion], fraktionMemberListInvite[fraktion] )
								end
							end							
							if oldfrac > 0 then
								unbindKey ( targetpl, "y", "down", "chatbox" )
							end
							bindKey ( targetpl, "y", "down", "chatbox", "t" )						
							for playeritem, key in pairs(adminsIngame) do 	
								if key >= 2 then
									outputChatBox ( getPlayerName(player).." hat "..getPlayerName(targetpl).." zum Leader von Fraktion "..fraktion.." gemacht!", playeritem, 255, 0, 0 )								
								end
							end	
						else						
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\nUngueltige\nFraktions-ID!", 5000, 0, 125, 125 )							
						end						
					else					
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\nSpieler ist\nnicht eingeloggt!", 5000, 0, 125, 125 )						
					end					
				end				
			else			
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nicht authorisiert,\ndiesen Befehl zu nutzen.", 5000, 255, 0, 0 )				
			end
		else			
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nGebrauch:\n/makeleader NAME FRAKTION.", 5000, 255, 0, 0 )					
		end
	else			
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nGebrauch:\n/makeleader NAME FRAKTION.", 5000, 255, 0, 0 )		
	end
end


function setadmin_func ( player, cmd, target, rank )
	if target then
		if rank then
			local targetpl = findPlayerByName( target )
			local rank = math.floor ( math.abs ( tonumber ( rank ) ) )		
			if isAdminLevel ( player, adminLevels["Projektleiter"] ) then		
				if isElement ( targetpl ) then			
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDer Spieler\nist noch online!", 5000, 255, 0, 0 )			
				elseif playerUID[target] then
					local alterrank = tonumber ( dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Adminlevel", "userdata", "UID", playerUID[target] ), -1 )[1]["Adminlevel"] )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "Adminlevel", rank, "UID", playerUID[target] )	
					offlinemsg ( "Du wurdest von "..getPlayerName(player).." auf Adminlevel "..rank.." gesetzt.", "Server", target )
					outputChatBox ( "Adminlevel von "..target.." auf "..rank.." gesetzt!", player, 0, 125, 0 )
					outputAdminLog ( getPlayerName ( player ).." hat "..target.."s Adminlevel offline auf "..rank.." gesetzt!" )			
					--[[if alterrank < 3 and rank >= 3 then
						nickchange_func ( player, cmd, target, "[RR]"..target )
					elseif alterrank >= 3 and rank < 3 then
						local nameohneclantag = string.sub ( target, 6 )
						nickchange_func ( player, cmd, target, nameohneclantag )
					end]]
				else	
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nSpieler\nexistiert nicht!", 5000, 255, 0, 0 )			
				end			
			else		
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nicht authorisiert,\ndiesen Befehl zu nutzen.", 5000, 255, 0, 0 )	
			end
		else		
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nGebrauch:\n/setadmin NAME RANG", 5000, 255, 0, 0 )	
		end
	else		
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nGebrauch:\n/setadmin NAME RANG", 5000, 255, 0, 0 )	
	end
end

local oldspecpos = {}
function spec_func ( player, command, spec )
	if isAdminLevel ( player, adminLevels["Supporter"] ) then
		local spec = spec and findPlayerByName ( spec ) or nil
		if spec == nil then
			if oldspecpos[player] then
				setElementInterior ( player, oldspecpos[player][2] )
				setElementDimension ( player, oldspecpos[player][1] )
				oldspecpos[player] = nil
			end
			fadeCamera( player, true )
			setCameraTarget( player, player )
			setElementFrozen ( player, false )
		elseif spec then
			setElementFrozen ( player, true )
			local dim2, int2 = getElementDimension ( player ), getElementInterior ( player )
			oldspecpos[player] = { dim2, int2 }
			local dim, int = getElementDimension ( spec ), getElementInterior ( spec )
			setElementInterior ( player, int )
			setElementDimension ( player, dim )
			fadeCamera( player, true )
			setCameraTarget( player, spec )
			triggerClientEvent ( player, "infobox_start", getRootElement(), "Um den Spectate-Modus\nzu verlassen, tippe\nnur /spec", 5000, 0, 125, 125 )
			outputAdminLog ( getPlayerName ( player ).." hat "..getPlayerName( spec ).." gespectet!" )				
		else	
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nGebrauch:\n/spec [Player]", 5000, 0, 125, 125 )		
		end	
	else	
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nicht authorisiert,\ndiesen Befehl zu nutzen.", 5000, 255, 0, 0 )		
	end	
end


function rkick_func ( player, command, kplayer, ... )
	if getElementType(player) == "console" or isAdminLevel ( player, adminLevels["Supporter"] ) and ( not client or client == player ) then
		if kplayer then
			local reason = {...}
			reason = table.concat( reason, " " )
			local target = findPlayerByName(kplayer)
			if not isElement(target) then
				outputChatBox ( "Der Spieler ist offline!", player, 125, 0, 0 )
				return
			end
			if getAdminLevel ( player ) > getAdminLevel ( target ) then
				outputChatBox ("Spieler "..getPlayerName(target).." wurde von "..getPlayerName ( player ).." gekickt! (Grund: "..tostring ( reason )..")", getRootElement(), 255, 0, 0 )
				takeAllWeapons ( target )
				kickPlayer ( target, player, tostring(reason) )	
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Der Spieler hat\nkeinen niedrigeren \nAdminrang als du!", 5000, 255, 0, 0 )		
			end	
			outputAdminLog ( getPlayerName ( player ).." hat "..kplayer.." gekickt! Grund: "..reason )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nGebrauch:\n/rkick NAME", 5000, 255, 0, 0 )	
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nicht authorisiert,\ndiesen Befehl zu nutzen.", 5000, 255, 0, 0 )	
	end
end


function rban_func ( player, command, kplayer, ... )
	if getElementType(player) == "console" or isAdminLevel ( player, adminLevels["Moderator"] ) and ( not client or client == player ) then
		if kplayer then
			local reason = table.concat( {...}, " " )
			local target = getPlayerFromName ( kplayer )
			if not target then	
				if playerUID[kplayer] then
					local serial = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Serial", "players", "UID", playerUID[kplayer] ), -1 )[1]["Serial"]

					outputChatBox ("Spieler "..kplayer.." wurde von "..getPlayerName(player).." gebannt! (Grund: "..tostring(reason)..")",getRootElement(),255,0,0)
					outputAdminLog (getPlayerName(player) .." hat "..kplayer.." gebannt! (Grund: "..tostring(reason)..")")

					outputChatBox ( "Der Spieler wurde (offline) gebannt!", player, 125, 0, 0 )

					dbExec (handler, "INSERT INTO ?? (??, ??, ??, ??, ??, ??) VALUES (?,?,?,?,?,?)", "ban", "UID", "AdminUID", "Grund", "Datum", "IP", "Serial", playerUID[kplayer], playerUID[getPlayerName(player)], reason, timestamp(), '0.0.0.0', serial)			
				else		
					outputChatBox ( "Der Spieler existiert nicht!", player, 125, 0, 0 )			
				end		
			else		
				if getAdminLevel ( player ) < getAdminLevel ( target ) then
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Der Spieler hat\neinen hoeheren \nAdminrang als du!", 5000, 255, 0, 0 )
					return
				end		
				outputChatBox ("Spieler "..getPlayerName(target).." wurde von "..getPlayerName(player).." gebannt! (Grund: "..tostring(reason)..")",getRootElement(),255,0,0)
				outputAdminLog (getPlayerName(player) .." hat "..getPlayerName(target).." gebannt! (Grund: "..tostring(reason)..")")			
				local ip = getPlayerIP ( target )
				local serial = getPlayerSerial ( target )			
				dbExec (handler, "INSERT INTO ?? (??, ??, ??, ??, ??, ??) VALUES (?,?,?,?,?,?)", "ban", "UID", "AdminUID", "Grund", "Datum", "IP", "Serial", playerUID[kplayer], playerUID[getPlayerName(player)], reason, timestamp(), ip, serial)
				kickPlayer ( target, player, tostring(reason).." (gebannt!)" )			
			end		
		else	
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nGebrauch:\n/permaban NAME", 5000, 255, 0, 0 )		
		end
	else	
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nicht authorisiert,\ndiesen Befehl zu nutzen.", 5000, 255, 0, 0 )		
	end	
end


function getip ( player, cmd, name )
	if not client or player == client then
		if isAdminLevel ( player, adminLevels["Administrator"] ) then
			if name then
				local target = findPlayerByName ( name )	
				if isElement ( target ) then	
					local ip = getPlayerIP ( target )
					outputChatBox ( "IP von "..name..": "..ip, player, 200, 200, 0 )	
				else
					infobox ( player, "Spieler ist nicht online!", 5000, 125, 0, 0 )	
				end	
			else
				infobox ( player, "Gebrauch:\n/getip [Name]", 5000, 125, 0, 0 )	
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nicht authorisiert,\ndiesen Befehl zu nutzen.", 5000, 255, 0, 0 )
		end		
	end	
end


function tban_func ( player, command, kplayer, btime,... )
	if getElementType(player) == "console" or isAdminLevel(player, adminLevels["Moderator"]) and ( not client or client == player ) then
		if kplayer and btime and tonumber(btime) ~= nil then
			local reason = table.concat({...}, " ")
			if reason then
				local target = findPlayerByName(kplayer)			
				if not isElement(target) then					
					local success = timebanPlayer ( kplayer, tonumber(btime), getPlayerName( player ), reason )			
					if success == false then			
						triggerClientEvent ( player, "infobox_start", getRootElement(), "Gebrauch:\n/timeban [Player] [Grund]\n[Zeit],max. 3\nWoerter", 5000, 0, 125, 255 )				
					end				
					return				
				else
					if getAdminLevel ( player ) < getAdminLevel ( target ) then
						triggerClientEvent ( player, "infobox_start", getRootElement(), "Der Spieler hat\neinen hoeheren \nAdminrang als du!", 5000, 255, 0, 0 )
						return
					end
				end			
				local name = getPlayerName( target )
				local savename = name
				local success = timebanPlayer ( savename, tonumber(btime), getPlayerName( player ), reason )
				if success == false then
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Gebrauch:\n/timeban [Player] [Grund]\n[Zeit],max. 3\nWörter", 5000, 0, 125, 255 )		
				end
			else	
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nGebrauch:\n/timeban NAME ZEIT GRUND", 5000, 255, 0, 0 )		
			end
		else	
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nGebrauch:\n/timeban NAME ZEIT GRUND", 5000, 255, 0, 0 )		
		end						
	else	
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nicht authorisiert,\ndiesen Befehl zu nutzen.", 5000, 255, 0, 0 )	
	end
end


-- Deaktiviert, da unnötig --
--[[function slap_func ( player, command, splayer, bslap )
	if getElementType(player) == "console" then
		vnxSetElementData(player, "adminlvl", 3 )
	end	
	if isAdminLevel ( player, adminLevels["Administrator"] ) and ( not client or client == player ) then
		local target = findPlayerByName ( splayer )	
		if not isElement(target) then
			outputChatBox ( "Der Spieler ist offline!", player, 125, 0, 0 )
			return
		end	
		if not bslap then
			bslap = "nein"
		end	
		if bslap == "nein" or bslap == "Nein" then		
			local x,y,z = getElementPosition(target)
			setElementPosition ( target, x, y, z + 5, true )			
			for playeritem, index in pairs(adminsIngame) do 
				outputChatBox ( getPlayerName(player).." hat "..getPlayerName(target).." geslapt!", playeritem, 255, 255, 0 )
			end	
		elseif bslap == "ja" or bslap == "Ja" then		
			local x, y, z = getElementPosition( target )
			setElementPosition ( target, x, y, z + 5, false )
			setPedOnFire ( target, true )			
			for playeritem, key in pairs(adminsIngame) do
				outputChatBox ( getPlayerName(player).." hat "..getPlayerName(target).." geslapt und angezuendet!", playeritem, 255, 255, 0 )
			end		
		else		
			triggerClientEvent ( player, "infobox_start", getRootElement(), "Gebrauch:\n/slap [Player] \n[Anzuenden]\nJa/Nein", 5000, 0, 125, 125 )		
		end			
	else	
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nicht authorisiert,\ndiesen Befehl zu nutzen.", 5000, 255, 0, 0 )		
	end	
end]]
function setPremium (player, cmd, target, days, package)
	if isAdminLevel ( player, 7 ) then
		if getPlayerFromName ( target ) then
			local target = getPlayerFromName ( target )
			if tonumber(days) > 0 then
				if tonumber(package) > 0 then
					setPremiumData (target,days,package)
					outputChatBox("Du hast soeben für "..days.." Tage das Premium Paket Nummer "..package.." bekommen.",target,0, 150, 255)
					for playeritem, index in pairs(adminsIngame) do 			
						outputChatBox ( getPlayerName(player).." hat "..getPlayerName(target).." "..days.." Tage das Premium Paket "..package.." gegeben.", playeritem, 7, 158, 207 )
					end		
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Gebrauch:\n/setpremium [Name]\n[Tage] [Paket]", 5000, 255, 0, 0 )
				end	
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Gebrauch:\n/setpremium [Name]\n[Tage] [Paket]", 5000, 255, 0, 0 )
			end	
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "Spieler ist nicht online.", 5000, 255, 0, 0 )
		end	
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "Du bist nicht befugt.", 5000, 255, 0, 0 )
	end	
end







function goto_func(player,command,tplayer)
	if isAdminLevel ( player, adminLevels["Supporter"] ) and ( not client or client == player ) then
		if tplayer then
			local target = findPlayerByName ( tplayer )	
			if not isElement(target) then
				outputChatBox ( "Der Spieler ist offline!", player, 125, 0, 0 )
				return
			end			
			local x, y, z = getElementPosition( target )	
			if getPedOccupiedVehicleSeat ( player ) == 0 then			
				setElementInterior ( player, getElementInterior(target) )
				setElementInterior ( getPedOccupiedVehicle(player), getElementInterior(target) )
				setElementPosition ( getPedOccupiedVehicle ( player ), x+3, y+3, z )
				setElementDimension ( getPedOccupiedVehicle ( player ), getElementDimension ( target ) )
				setElementDimension ( player, getElementDimension ( target ) )
				setElementVelocity(getPedOccupiedVehicle(player),0,0,0)
				setElementFrozen ( getPedOccupiedVehicle(player), true )
				setTimer ( setElementFrozen, 500, 1, getPedOccupiedVehicle(player), false )				
			else			
				removePedFromVehicle ( player )
				setElementPosition ( player, x, y + 1, z )
				setElementInterior ( player, getElementInterior(target) )
				setElementDimension ( player, getElementDimension ( target ) )				
			end			
			outputAdminLog ( getPlayerName ( player ).." hat sich zu "..getPlayerName ( target).." teleportiert!" )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nGebrauch:\n/goto NAME", 5000, 255, 0, 0 )
		end	
	else	
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nicht authorisiert,\ndiesen Befehl zu nutzen.", 5000, 255, 0, 0 )		
	end	
end


function gethere_func(player,command,tplayer)
	if isAdminLevel ( player, adminLevels["Supporter"] ) and ( not client or client == player ) then
		if tplayer then
			local target = findPlayerByName ( tplayer )
			local x, y, z = getElementPosition ( player )
			if not isElement(target) then
				outputChatBox ( "Der Spieler ist offline!", player, 125, 0, 0 )
				return
			end		
			if getPedOccupiedVehicleSeat ( target ) == 0 then			
				setElementInterior ( target, getElementInterior(player) )
				setElementInterior ( getPedOccupiedVehicle(target), getElementInterior(player ) )
				setElementPosition ( getPedOccupiedVehicle(target), x+3, y+3, z )
				setElementDimension ( target, getElementDimension ( player ) )
				setElementDimension ( getPedOccupiedVehicle(target), getElementDimension ( player ) )
				setElementVelocity(getPedOccupiedVehicle(target),0,0,0)
				setElementFrozen ( getPedOccupiedVehicle(target), true )
				setTimer ( setElementFrozen, 500, 1, getPedOccupiedVehicle(target), false )					
			else				
				removePedFromVehicle ( target )
				setElementPosition ( target, x, y + 1, z )
				setElementInterior ( target, getElementInterior(player) )
				setElementDimension ( target, getElementDimension ( player ) )			
			end		
			outputAdminLog ( getPlayerName ( player ).." hat "..getPlayerName ( target ).." zu sich teleportiert." )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nGebrauch:\n/gethere NAME", 7500, 255, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nicht authorisiert,\ndiesen Befehl zu nutzen.", 7500, 255, 0, 0 )	
	end	
end


function skydive_func(player,command,tplayer)
	if getElementType(player) == "console" or isAdminLevel ( player, adminLevels["Administrator"] ) and ( not client or client == player ) then
		if tplayer then
			local target = findPlayerByName ( tplayer )
			if not isElement(target) then
				outputChatBox ( "Der Spieler ist offline!", player, 125, 0, 0 )
				return
			end		
			giveWeapon ( target, 46, 1, true )
			local x, y, z = getElementPosition(target)			
			if getPedOccupiedVehicleSeat ( target ) == 0 then			
				setElementPosition ( getPedOccupiedVehicle(target), x, y, z+2000 )				
			else					
				removePedFromVehicle ( target )
				setElementPosition ( target, x, y, z+2000 )				
			end			
			for playeritem, key in pairs(adminsIngame) do 
				if key >= 2 then
					outputChatBox ( getPlayerName(player).." hat "..getPlayerName(target).." geskydived!", playeritem, 255, 255, 0 )				
				end
			end			
			outputAdminLog ( getPlayerName ( player ).." hat "..getPlayerName ( target ).." geskydived!" )
		else	
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nGebrauch:\n/skydive NAME", 5000, 255, 0, 0 )		
		end			
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nicht authorisiert,\ndiesen Befehl zu nutzen.", 5000, 255, 0, 0 )		
	end	
end

local blocked_cms = {}
blocked_cms["say"] = true
blocked_cms["global"] = true
blocked_cms["teamsay"] = true
blocked_cms["ad"] = true
blocked_cms["me"] = true
blocked_cms["t"] = true
blocked_cms["g"] = true
blocked_cms["s"] = true
blocked_cms["l"] = true
blocked_cms["m"] = true


function vioMutePlayer ( cmd )
	if blocked_cms[cmd] then
		outputChatBox ( "Du bist gemuted, benutze /self --> Support für Fragen!", source, 125, 0, 0 )
		cancelEvent()
	end
end


function mute_func(player,command,tplayer)
	if getElementType(player) == "console" or isAdminLevel ( player, adminLevels["Moderator"] ) and ( not client or client == player ) then
		if tplayer then
			local target = findPlayerByName ( tplayer )
			if not isElement(target) then
				outputChatBox ( "Der Spieler ist offline!", player, 125, 0, 0 )
				return
			end			
			if muted_players[target] then	
				removeEventHandler ( "onPlayerCommand", target, vioMutePlayer )			
				muted_players[target] = false		
				for playeritem, key in pairs(adminsIngame) do 		
					if key >= 2 then
						outputChatBox ( getPlayerName(player).." hat "..getPlayerName(target).." entmuted!", playeritem, 0, 200, 0 )				
					end
				end			
			else		
				addEventHandler( "onPlayerCommand", target, vioMutePlayer )		
				muted_players[target] = true			
				for playeritem, key in pairs(adminsIngame) do 		
					if key >= 2 then
						outputChatBox ( getPlayerName(player).." hat "..getPlayerName(target).." gemuted!", playeritem, 200, 0, 0 )				
					end
				end					
			end	
		else	
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nGebrauch:\n/mute NAME", 5000, 255, 0, 0 )		
		end
	else	
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nicht authorisiert,\ndiesen Befehl zu nutzen.", 5000, 255, 0, 0 )		
	end	
end


function unban_user_func ( player, cmd, nick )
	outputDebugString("test")
	if playerUID[nick] then
		outputDebugString(playerUID[nick])
		local adminname = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "AdminUID", "ban", "UID", playerUID[nick] ), -1 )	
		if adminname and adminname[1] then	
			if getElementType(player) == "console" or isAdminLevel ( player, adminLevels["Administrator"] ) then	
				dbExec ( handler, "DELETE FROM ?? WHERE ??=?", "ban", "UID", playerUID[nick] )
				outputChatBox ( getPlayerName(player).." hat "..nick.." entbannt!", getRootElement(), 125, 0, 0 )
				outputAdminLog ( getPlayerName(player).." hat "..nick.." entbannt." )			
			elseif playerUIDName[adminname[1]["AdminUID"]] == getPlayerName ( player ) then
				dbExec ( handler, "DELETE FROM ?? WHERE ??=?", "ban", "UID", playerUID[nick] )
				outputChatBox ( getPlayerName(player).." hat ".. nick.." entbannt!", getRootElement(), 125, 0, 0 )
				outputAdminLog ( getPlayerName(player).." hat ".. nick .." entbannt." )
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nicht authorisiert,\ndiesen Befehl zu nutzen.", 5000, 255, 0, 0 )
			end
		else		
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDer Spieler\nist nicht\ngebannt!", 5000, 255, 0, 0 )			
		end	
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "Ungültiger Spieler", 5000, 255, 0, 0 )	
	end				
end
addCommandHandler ( "unbanuser", unban_user_func )


function crespawn_func ( player, cmd, radius )
	if isAdminLevel ( player, adminLevels["Supporter"] ) then
		if radius then	
			radius = tonumber(radius)
			if radius <= 50 and radius > 0 then
				local x, y, z = getElementPosition ( player )
				local sphere_1 = createColSphere ( x, y, z, radius )
				local spehere_table = getElementsWithinColShape ( sphere_1, "vehicle" )
				for theKey,theVehicle in pairs(spehere_table) do
					if doesAnyPlayerOccupieTheVeh ( theVehicle ) then
					else
						if not vnxGetElementData ( theVehicle, "carslotnr_owner" ) then		
							respawnVehicle ( theVehicle )		
						else
							local towcar = vnxGetElementData ( theVehicle, "carslotnr_owner" )
							local pname = vnxGetElementData ( theVehicle, "owner" )
							respawnPrivVeh ( towcar, pname )
						end
					end		
				end		
				destroyElement(sphere_1)
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nGebrauch:\n/crespawn [0-50]", 5000, 255, 0, 0 )
			end	
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nGebrauch:\n/crespawn RADIUS", 5000, 255, 0, 0 )
		end		
	end	
end

function give_fahrzeugslots_vip(player, cmd, targetname, upgrade)
	if isAdminLevel ( player, adminLevels["Stlv.Projektleitung"] ) then
		if targetname == "" then 
			triggerClientEvent ( player, "infobox_start", getRootElement(), "Bitte gib einen Spielernamen ein!", 5000, 0, 255, 0 )
			return
		end 
			if upgrade == "slots1" then 
				vnxSetElementData ( getPlayerFromName(targetname), "carslotupgrade", "buyed" )
				vnxSetElementData ( getPlayerFromName(targetname), "maxcars", 1 )
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast die Fahrzeug slots von "..targetname.." Erhöht auf 1!", 5000, 0, 255, 0 )
				triggerClientEvent ( getPlayerFromName(targetname), "infobox_start", getRootElement(), getPlayerName(player).." hat deine Fahrzeug slots auf 1 erhöht !", 5000, 0, 255, 0 )
				playSoundFrontEnd ( getPlayerFromName(targetname), 40 )
			elseif upgrade == "slots7" then 
				vnxSetElementData ( getPlayerFromName(targetname), "carslotupgrade", "buyed" )
				vnxSetElementData ( getPlayerFromName(targetname), "maxcars", 7 )
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast die Fahrzeug slots von "..targetname.." Erhöht auf 7!", 5000, 0, 255, 0 )
				triggerClientEvent ( getPlayerFromName(targetname), "infobox_start", getRootElement(), getPlayerName(player).." hat deine Fahrzeug slots auf 7 erhöht !", 5000, 0, 255, 0 )
				playSoundFrontEnd ( getPlayerFromName(targetname), 40 )
			elseif upgrade ==  "slots9" then 
				vnxSetElementData ( getPlayerFromName(targetname), "carslotupgrade2", 1 )
				vnxSetElementData ( getPlayerFromName(targetname), "maxcars", 9 )
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast die Fahrzeug slots von "..targetname.." Erhöht auf 9!", 5000, 0, 255, 0 )
				triggerClientEvent ( getPlayerFromName(targetname), "infobox_start", getRootElement(), getPlayerName(player).." hat deine Fahrzeug slots auf 9 erhöht !", 5000, 0, 255, 0 )
				playSoundFrontEnd ( getPlayerFromName(targetname), 40 )
			elseif upgrade == "slots11" then 
				vnxSetElementData ( getPlayerFromName(targetname), "carslotupgrade3", 1 )
				vnxSetElementData ( getPlayerFromName(targetname), "maxcars", 11 )
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast die Fahrzeug slots von "..targetname.." Erhöht auf 11!", 5000, 0, 255, 0 )
				triggerClientEvent ( getPlayerFromName(targetname), "infobox_start", getRootElement(), getPlayerName(player).." hat deine Fahrzeug slots auf 11 erhöht !", 5000, 0, 255, 0 )
				playSoundFrontEnd ( getPlayerFromName(targetname), 40 )
			elseif upgrade == "slots13" then 
				vnxSetElementData ( getPlayerFromName(targetname), "carslotupgrade3", 1 )
				vnxSetElementData ( getPlayerFromName(targetname), "maxcars", 13 )
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast die Fahrzeug slots von "..targetname.." Erhöht auf 13!", 5000, 0, 255, 0 )
				triggerClientEvent ( getPlayerFromName(targetname), "infobox_start", getRootElement(), getPlayerName(player).." hat deine Fahrzeug slots auf 13 erhöht !", 5000, 0, 255, 0 )
				playSoundFrontEnd ( getPlayerFromName(targetname), 40 )
			elseif upgrade == "slots20" then 
				vnxSetElementData ( getPlayerFromName(targetname), "carslotupgrade3", 1 )
				vnxSetElementData ( getPlayerFromName(targetname), "maxcars", 20 )
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast die Fahrzeug slots von "..targetname.." Erhöht auf 20!", 5000, 0, 255, 0 )
				triggerClientEvent ( getPlayerFromName(targetname), "infobox_start", getRootElement(), getPlayerName(player).." hat deine Fahrzeug slots auf 20 erhöht !", 5000, 0, 255, 0 )
				playSoundFrontEnd ( getPlayerFromName(targetname), 40 )
			else 
				triggerClientEvent ( player, "infobox_start", getRootElement(), "[Gebrauch] : \n/givevipslots [Name] [slots][1/7/9/11/13/20]", 5000, 0, 255, 0 )
			end
		else 
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Du bist nicht Befugt!", 5000, 0, 255, 0 )
		end
end 
addCommandHandler("givevipslots", give_fahrzeugslots_vip)




function gotocar_func ( player, cmd, targetname, slot )	
	if isAdminLevel ( player, adminLevels["Supporter"] ) then
		if targetname and slot then
			slot = tonumber(slot)
			local target = findPlayerByName ( targetname )
			local newtargetname = getPlayerName ( target )			
			if isElement(target) then		
				local carslot = vnxGetElementData ( target, "carslot"..slot )		
				if carslot then			
					if carslot >= 1 then				
						local veh = allPrivateCars[newtargetname] and allPrivateCars[newtargetname][slot] or false			
						if isElement ( veh ) then
							local x, y, z = getElementPosition(veh)
							local inter = getElementInterior(veh)
							local dimension = getElementDimension(veh)							
							setElementPosition ( player, x, y, z+1.5 )
							setElementInterior ( player, inter )
							setElementDimension ( player, dimension )						
						else					
							respawnPrivVeh ( slot, newtargetname )							
							veh = allPrivateCars[newtargetname] and allPrivateCars[newtargetname][slot] or false	
							local x, y, z = getElementPosition(veh)
							local inter = getElementInterior(veh)
							local dimension = getElementDimension(veh)							
							setElementPosition ( player, x, y, z+1.5 )
							setElementInterior ( player, inter )
							setElementDimension ( player, dimension )						
						end		
						outputAdminLog ( getPlayerName(player).." hat sich zum Slot "..slot.." von ".. targetname .." geportet." )
					else					
						outputChatBox ( "Der Spieler hat keinen Wagen mit dieser Nummer!", player, 125, 0, 0 )					
					end				
				else				
					outputChatBox ( "Der Spieler hat keinen Wagen mit dieser Nummer!", player, 125, 0, 0 )				
				end			
			else			
				outputChatBox ( "Spieler muss online sein!", player, 125, 0, 0 )				
			end		
		else		
			outputChatBox ( "/gotocar [Spieler] [Slot]!", player, 125, 0, 0 )			
		end	
	else	
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nicht authorisiert,\ndiesen Befehl zu nutzen.", 5000, 255, 0, 0 )		
	end	
end


function getcar_func ( player, cmd, targetname, slot )	
	if isAdminLevel ( player, adminLevels["Supporter"] ) then	
		if targetname and slot then
			slot = tonumber(slot)
			local target = findPlayerByName ( targetname )
			local newtargetname = getPlayerName ( target )			
			if isElement(target) then			
				local carslot = vnxGetElementData ( target, "carslot"..slot )			
				if carslot then				
					if carslot >= 1 then					
						local veh = allPrivateCars[newtargetname] and allPrivateCars[newtargetname][slot] or false							
						if isElement ( veh ) then					
							local x, y, z = getElementPosition(player)
							local inter = getElementInterior(player)
							local dimension = getElementDimension(player)							
							setElementPosition ( veh, x, y, z+1.5 )
							setElementInterior ( veh, inter )
							setElementDimension ( veh, dimension )							
						else						
							respawnPrivVeh ( slot, newtargetname )							
							veh = allPrivateCars[newtargetname] and allPrivateCars[newtargetname][slot] or false
							local x, y, z = getElementPosition(player)
							local inter = getElementInterior(player)
							local dimension = getElementDimension(player)							
							setElementPosition ( veh, x, y, z+1.5 )
							setElementInterior ( veh, inter )
							setElementDimension ( veh, dimension )
						end
						outputAdminLog ( getPlayerName(player).." hat den Slot "..slot.." von ".. targetname .." zu sich geportet." )					
					else					
						outputChatBox ( "Der Spieler hat keinen Wagen mit dieser Nummer!", player, 125, 0, 0 )					
					end				
				else
					outputChatBox ( "Der Spieler hat keinen Wagen mit dieser Nummer!", player, 125, 0, 0 )				
				end			
			else			
				outputChatBox ( "Spieler muss online sein!", player, 125, 0, 0 )				
			end		
		else
			outputChatBox ( "/getcar [Spieler] [Slot]!", player, 125, 0, 0 )			
		end	
	else	
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nicht authorisiert,\ndiesen Befehl zu nutzen.", 5000, 255, 0, 0 )		
	end	
end


function astart_func ( player, cmd )
	
	if isAdminLevel ( player, adminLevels["Administrator"] ) then
		local veh = getPedOccupiedVehicle ( player )	
		if not isElement ( veh ) then
			outputChatBox ( "Du musst in einem Wagen sitzen!", player, 125, 0, 0 )
			return
		end	
		if getElementModel ( veh ) ~= 438 then		
			if ( getPedOccupiedVehicleSeat ( player ) == 0 ) then				
				vnxSetElementData ( veh, "fuelstate", 100 )
				vnxSetElementData ( veh, "engine", false )
				setVehicleOverrideLights ( veh, 1 )
				vnxSetElementData ( veh, "light", false)
				setVehicleEngineState ( veh, false )				
				if getVehicleEngineState ( veh ) then
					setVehicleEngineState ( veh, false )
					vnxSetElementData ( veh, "engine", false )
					return		
				end				
				setVehicleEngineState ( veh, true )
				vnxSetElementData ( veh, "engine", true )
				if not vnxGetElementData ( veh, "timerrunning" ) then
					setVehicleNewFuelState ( veh )
					vnxSetElementData ( veh, "timerrunning", true )
				end												
			end		
		end	
	else	
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nicht authorisiert,\ndiesen Befehl zu nutzen.", 5000, 255, 0, 0 )		
	end	
end


function aenter_func ( player, cmd )
	if isAdminLevel ( player, adminLevels["Administrator"] ) then
		vnxSetElementData ( player, "adminEnterVehicle", true )
		outputChatBox ( "Klicke auf einen Wagen!", player, 125, 0, 0 )
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nicht authorisiert,\ndiesen Befehl zu nutzen.", 5000, 255, 0, 0 )
	end
end


function makeVehFFT ( player )
	if isAdminLevel ( player, adminLevels["Projektleiter"] ) then
		if isPedInVehicle ( player ) then
			local veh = getPedOccupiedVehicle ( player )
			local pname = vnxGetElementData ( veh, "owner" )
			for l = 1, 6 do
				for i = 1, 6 do
					if i == l then
						vnxSetElementData ( veh, "stuning"..i, l )
					end
				end
			end
			local totTuning = "1|1|1|1|1|1"
			vnxSetElementData ( veh, "stuning", totTuning )
			dbExec ( handler, "UPDATE vehicles SET STuning=? WHERE ??=? AND ??=?", totTuning, "UID", playerUID[pname], "Slot", vnxGetElementData ( veh, "carslotnr_owner" ) )	
			specPimpVeh ( veh )
			specialTuningVehEnter ( player, 0 )
			outputChatBox ( "Du hast das Auto FFT gemacht.", player, 255, 0, 0)
			outputAdminLog ( getPlayerName ( player ).." hat das Auto von "..vnxGetElementData ( veh, "owner" ).." FFT gemacht!" )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu musst im\nFahrzeug sitzen.", 5000, 255, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nicht authorisiert,\ndiesen Befehl zu nutzen.", 5000, 255, 0, 0 )
	end
end

function muteDonator ( player, cmd, target )
	if target then
		if isAdminLevel ( player, adminLevels["VIP"]) then
			if findPlayerByName (target) then
				local targetpl = findPlayerByName (target)
				if not donatorMute[player][getPlayerName(targetpl)] or donatorMute[player][getPlayerName(targetpl)] == nil then					
					donatorMute[player][getPlayerName(targetpl)] = true
					outputChatBox ("Du hast "..target.." nun für den /a - Chat gemutet.", player, 0, 155, 0 )
				else
					donatorMute[player][getPlayerName(targetpl)] = nil
					outputChatBox ("Du hast "..target.." wieder entmuted.", player, 0, 155, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDer Spieler\existiert nicht!", 5000, 255, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nicht authorisiert,\ndiesen Befehl zu nutzen.", 5000, 255, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nGebrauch:\n/muted NAME", 5000, 255, 0, 0 )
	end
end


function oeffnePremium ( player )
	if isAdminLevel ( player, adminLevels["VIP"]) and not getElementClicked ( player ) then
		triggerClientEvent ( player, "ppstart", player )
	end
end


function fixAdminVeh ( player )
	if vnxGetElementData ( player, "money" ) >= 100 then
		if isPedInVehicle ( player ) then
			local veh = getPedOccupiedVehicle ( player )
			if getVehicleOccupant ( veh, 0 ) == player then
				fixVehicle ( veh )
				executeCommandHandler ( "meCMD", player, " hat sein Fahrzeug repariert!")
				vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 100 )
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nNur als\nFahrer erlaubt!", 5000, 255, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "Du sitzt\nin keinem\nFahrzeug!", 5000, 255, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nNicht genug\nGeld!", 5000, 255, 0, 0 )
	end
end


function fillAdminLife ( player )
	if vnxGetElementData ( player, "money" ) >= 300 then
		setElementHealth ( player, 100 )
		setPedArmor ( player, 100 )
		setElementHunger ( player, 100 )
		vnxSetElementData ( player, "money", vnxGetElementData ( player, "money") - 300)
		executeCommandHandler ( "meCMD", player, " hat sein Leben & seine Weste aufgefüllt!")
		outputLog ( getPlayerName(player).." hat sich mit VIP geheilt", "Heilung" )
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nNicht genug\nGeld!", 5000, 255, 0, 0 )
	end
end


function fillAdminVeh ( player )
	if isPedInVehicle ( player ) then
		local veh = getPedOccupiedVehicle ( player )
		if getVehicleOccupant ( veh, 0 ) == player then
			local liters = 100 - vnxGetElementData ( veh, "fuelstate" )
			if vnxGetElementData ( player, "money" ) >= (liters * 10) then
				if liters > 1 then
					setElementFrozen ( veh, true )
					setTimer ( setElementFrozen, 2000, 1, veh, false ) 
					vnxSetElementData ( veh, "fuelstate", 100 )
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 300 )
					local the_tankstelle = getNearestTanke ( player )
					if the_tankstelle ~= false then
						if the_tankstelle == "Nord" then
							bizArray["TankstelleNord"]["kasse"] = bizArray["TankstelleNord"]["kasse"] + liters * 10						
						elseif the_tankstelle == "Sued" then						
							bizArray["TankstelleSued"]["kasse"] = bizArray["TankstelleSued"]["kasse"] + liters * 10						
						elseif the_tankstelle == "Pine" then						
							bizArray["TankstellePine"]["kasse"] = bizArray["TankstellePine"]["kasse"] + liters * 10						
						end					
					end		
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Dein Fahzeug\nist schon\nbetankt!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nNicht genug\nGeld!", 5000, 255, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nNur als\nFahrer erlaubt!", 5000, 255, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "Du sitzt\nin keinem\nFahrzeug!", 5000, 255, 0, 0 )
	end
end


function prison_func ( player, cmd, target, time, ... )
	if isAdminLevel ( player, adminLevels["Supporter"]) then
		if target then
			if time then
				if tonumber(time) ~= nil then
					local time = tonumber(time)
					if time >= 0 then
						local parametersTable = {...}
						local stringWithAllParameters = table.concat( parametersTable, " " )
						if stringWithAllParameters ~= nil and string.len( stringWithAllParameters ) > 1 then
							if findPlayerByName ( target ) then
								local target = findPlayerByName ( target )
								if isPedInVehicle ( target ) then
									removePedFromVehicle ( target )
								end
								if time > 0 then
									local knastzeit = tonumber( vnxGetElementData ( target, "jailtime" ) )
									vnxSetElementData ( target, "prison", time+knastzeit )
									vnxSetElementData ( target, "jailtime", 0 )
									outputChatBox ( getPlayerName(target).." wurde von "..getPlayerName(player).." für "..time.." Minuten ins Prison gesteckt.\nGrund: "..stringWithAllParameters, getRootElement(), 255, 0, 0 )
									outputAdminLog (getPlayerName(target).." wurde von "..getPlayerName(player).." für "..time.." Minuten ins Prison gesteckt.\nGrund: "..stringWithAllParameters)	
									putPlayerInJail ( target )
									if isOnDuty ( player ) then
										executeCommandHandler ( "offduty", target )
									end
								elseif vnxGetElementData ( target, "prison" ) > 0 then
									vnxSetElementData ( target, "prison", 0 )
									outputChatBox ( getPlayerName(target).." wurde von "..getPlayerName(player).." aus dem Prison geholt.\nGrund: "..stringWithAllParameters, getRootElement(), 255, 0, 0 )
									outputAdminLog (getPlayerName(target).." wurde von "..getPlayerName(player).." aus dem Prison geholt.\nGrund: "..stringWithAllParameters)	
									freePlayerFromJail ( target )
								else
									triggerClientEvent ( player, "infobox_start", getRootElement(), "Der Spieler\nist nicht im\nPrison!", 5000, 255, 0, 0 )
								end
							elseif playerUID[target] then
								if time > 0 then
									outputChatBox ( target.." wurde von "..getPlayerName(player).." für "..time.." Minuten ins Prison gesteckt.\nGrund: "..stringWithAllParameters,  getRootElement(), 255, 0, 0)
									outputAdminLog (target.." wurde von "..getPlayerName(player).." für "..time.." Minuten ins Prison gesteckt.\nGrund: "..stringWithAllParameters)	
									local knastzeit = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Knastzeit", "userdata", "UID", playerUID[target] ), -1 )[1]["Knastzeit"]
									dbExec ( handler, "UPDATE ?? SET ??=?, ??=? WHERE ??=?", "userdata", "Prison", knastzeit + time, "Knastzeit", 0, "UID", playerUID[target] )	
									if knastzeit == 0 then
										offlinemsg ( "Du wurdest von "..getPlayerName(player).." für "..time.." Minuten ins Prison gesteckt.\nGrund: "..stringWithAllParameters, "Server", target )
									else
										offlinemsg ( "Du wurdest von "..getPlayerName(player).." für "..time.." Minuten mehr ins Prison gesteckt.\nGrund: "..stringWithAllParameters, "Server", target )
									end
								else
									local prisontimeleftoffline = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Prison", "userdata", "UID", playerUID[target] ), -1 )[1]["Prison"]
									if prisontimeleftoffline > 0 then
										outputChatBox ( target.." wurde von "..getPlayerName(player).." aus dem Prison geholt\nGrund: "..stringWithAllParameters, getRootElement(), 255, 0, 0)
										dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "Prison", 0, "UID", playerUID[target] )	
										outputAdminLog (target.." wurde von "..getPlayerName(player).." aus dem Prison geholt\nGrund: "..stringWithAllParameters)	
										offlinemsg ( "Du wurdest von "..getPlayerName(player).." aus dem Prison geholt\nGrund: "..stringWithAllParameters, "Server", target )
									else
										triggerClientEvent ( player, "infobox_start", getRootElement(), "Der Spieler\nist nicht im\nPrison!", 5000, 255, 0, 0 )
									end
								end
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "Der Spieler\nexistiert nicht!", 5000, 255, 0, 0 )
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "benutze mehr zeichen ! ", 5000, 255, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "Negative Zeit\nist nicht\nerlaubt!", 5000, 255, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Gebrauch:\n/prison NAME\nZEIT GRUND", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Gebrauch:\n/prison NAME\nZEIT GRUND", 5000, 255, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "Gebrauch:\n/prison NAME\nZEIT GRUND", 5000, 255, 0, 0 )
		end	
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "Du sitzt\nin keinem\nFahrzeug!", 5000, 255, 0, 0 )
	end
end

	
function setteTestGeld ( player, cmd, geld )
	if isAdminLevel ( player, adminLevels["Projektleiter"] ) and geld and tonumber (geld) ~= nil then
		vnxSetElementData ( player, "money", tonumber(geld) )
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nicht authorisiert,\ndiesen Befehl zu nutzen.", 5000, 255, 0, 0 )
	end
end
addCommandHandler ("settestgeld", setteTestGeld)

function kickAll ( player, cmd, ... )
	if isAdminLevel ( player, adminLevels["Projektleiter"] ) then
		local parametersTable = {...}
		local stringWithAllParameters = table.concat( parametersTable, " " )
		local players = getElementsByType("player")
		for i=1, #players do 
			if players[i] ~= player then
				kickPlayer ( players[i],player, stringWithAllParameters )
			end
		end	
	end
end


function changeStatus ( player, cmd, status )
	if isAdminLevel ( player, adminLevels["VIP"] ) then
		if status then
			local status = tostring(status)
			if string.len ( status ) >= 3 and string.len ( status ) <= 16 then
				if not socialNeeds[status] then
					if string.find ( status, "'" ) then
						infobox ( player, "Bitte kein ' verwenden!", 4000, 200, 0, 0 )
						return false
					end
					vnxSetElementData ( player, "socialState", status )
				else
					infobox ( player, "Den Status\nmusst du\ndir verdienen", 4000, 200, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Der Status muss\nlänger als 2\nund kürzer als\n17 Zeichen sein!", 5000, 255, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "Gebrauch:\n/status STATUS", 5000, 255, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nNur ab Donator!", 5000, 255, 0, 0 )
	end
end
--

-- Events

addEvent ( "executeAdminServerCMD", true )
addEvent ( "move", true )
addEvent ( "moveVehicleAway", true )
addEvent ( "adminMenueTrigger", true )
addEvent ( "rkick", true )
addEvent ( "rban", true )
addEvent ( "getip", true )
addEvent ( "tban", true )
addEvent ( "slap", true )
addEvent ( "goto", true )
addEvent ( "gethere", true )
addEvent ( "skydive", true )
addEvent ( "mute", true )
addEvent ( "fixveh1", true )
addEvent ( "lebenessen", true )
addEvent ( "fillComplete1", true )

-- Event Handler

addEventHandler ( "executeAdminServerCMD", getRootElement(), executeAdminServerCMD_func )
addEventHandler ( "moveVehicleAway", getRootElement(), moveVehicleAway_func )
addEventHandler ( "move", getRootElement(), move_func )
addEventHandler ( "adminMenueTrigger", getRootElement(), adminMenueTrigger_func )
addEventHandler ( "mute", getRootElement(), mute_func )
addEventHandler ( "skydive", getRootElement(), skydive_func )
addEventHandler ( "gethere", getRootElement(), gethere_func )
addEventHandler ( "goto", getRootElement(), goto_func )
addEventHandler ( "tban", getRootElement(), tban_func )
addEventHandler ( "getip", getRootElement(), getip )
addEventHandler ( "rban", getRootElement(), rban_func )
addEventHandler ( "rkick", getRootElement(), rkick_func )
addEventHandler ( "fixveh1", getRootElement(), fixAdminVeh )
addEventHandler ( "lebenessen", getRootElement(), fillAdminLife )
addEventHandler ( "fillComplete1", getRootElement(), fillAdminVeh )
-- Command Handler

addCommandHandler ( "nickchange", nickchange_func )
addCommandHandler ( "move", move_func )
addCommandHandler ( "pwchange", pwchange_func )
addCommandHandler ( "shut", shut_func )
addCommandHandler ( "rebind", rebind_func )
addCommandHandler ( "admins", adminlist )
addCommandHandler ( "rcheck", check_func )
addCommandHandler ( "mark", mark_func )
addCommandHandler ( "gotomark", gotomark_func )
addCommandHandler ( "respawn", respawn_func )
addCommandHandler ( "tunecar", tunecar_func )
addCommandHandler ( "freezen", freeze_func )
addCommandHandler ( "intdim", intdim )
addCommandHandler ( "cleartext", cleartext_func )
addCommandHandler ( "chatclear", cleartext_func )
addCommandHandler ( "cc", cleartext_func )
addCommandHandler ( "clearchat", cleartext_func )
addCommandHandler ( "textclear", cleartext_func )
addCommandHandler ( "gmx", gmx_func )
addCommandHandler ( "ochat", ochat_func )
addCommandHandler ( "achat", achat_func )
addCommandHandler ( "setrank", setrank_func )
addCommandHandler ( "makeleader", makeleader_func )
addCommandHandler ( "setadmin", setadmin_func )
addCommandHandler ( "spec", spec_func )
addCommandHandler ( "rkick", rkick_func )
addCommandHandler ( "permaban", rban_func )
addCommandHandler ( "getip", getip )
addCommandHandler ( "timeban", tban_func )
addCommandHandler ( "goto", goto_func )
addCommandHandler ( "gethere", gethere_func )
addCommandHandler ( "skydive", skydive_func )
addCommandHandler ( "rmute", mute_func )
addCommandHandler ( "crespawn", crespawn_func )
addCommandHandler ( "gotocar", gotocar_func )
addCommandHandler ( "getcar", getcar_func )
addCommandHandler ( "astart", astart_func )
addCommandHandler ( "aenter", aenter_func )
addCommandHandler ( "makefft", makeVehFFT )
addCommandHandler ( "muted", muteDonator )
addCommandHandler ( "setpremium", setPremium )
addCommandHandler ( "prison", prison_func )
addCommandHandler ( "kickall", kickAll )
--addCommandHandler ( "status", changeStatus )



addCommandHandler ( "delacc", function ( player, cmd, target )
	if isAdminLevel ( player, adminLevels["Projektleiter"] ) then
		if playerUID[target] then
			local id = playerUID[target]
			playerUID[target] = nil
			playerUIDName[id] = nil
			dbExec ( handler, "DELETE FROM ?? WHERE ?? = ?", "achievments", "UID", id )
			dbExec ( handler, "DELETE FROM ?? WHERE ?? = ?", "bonustable", "UID", id )
			dbExec ( handler, "DELETE FROM ?? WHERE ?? = ?", "inventar", "UID", id )
			dbExec ( handler, "DELETE FROM ?? WHERE ?? = ?", "packages", "UID", id )
			dbExec ( handler, "DELETE FROM ?? WHERE ?? = ?", "players", "UID", id )
			dbExec ( handler, "DELETE FROM ?? WHERE ?? = ?", "skills", "UID", id )
			dbExec ( handler, "DELETE FROM ?? WHERE ?? = ?", "userdata", "UID", id )
			dbExec ( handler, "DELETE FROM ?? WHERE ?? = ?", "statistics", "UID", id )
			infobox ( player, "Erledigt", 4000, 0, 200, 0 )
		else
			infobox ( player, "Account\nexistiert nicht!", 4000, 200, 0, 0 )
		end
	end
end )


addCommandHandler ( "rs", function ( player )
	if isAdminLevel ( player, adminLevels["Administrator"] ) then
		for index, playeritem in pairs ( getElementsByType ( "player" ) ) do
			if vnxGetElementData ( playeritem, "loggedin" ) == 1 then
				local pname = getPlayerName ( playeritem )
				local int = getElementInterior ( playeritem )
				local dim = getElementDimension ( playeritem )
				local x, y, z = getElementPosition ( playeritem )
				local curWeaponsForSave = "|"
				for i = 1, 11 do
					if i ~= 10 then
						local weapon = getPedWeapon ( playeritem, i )
						local ammo = getPedTotalAmmo ( playeritem, i )
						if weapon and ammo then
							if weapon > 0 and ammo > 0 then
								if #curWeaponsForSave <= 40 then
									curWeaponsForSave = curWeaponsForSave..weapon..","..ammo.."|"
								end
							end
						end
					end
				end
				local pos = "|"..(math.floor(x*100)/100).."|"..(math.floor(y*100)/100).."|"..(math.floor(z*100)/100).."|"..int.."|"..dim.."|"
				if #curWeaponsForSave < 5 then
					curWeaponsForSave = ""
				end
				dbExec ( handler, "INSERT INTO ?? (??, ??, ??) VALUES (?,?,?)", "logout", "Position", "Waffen", "UID", pos, curWeaponsForSave, playerUID[pname] )
				datasave_remote ( playeritem )
				clearInv ( playeritem )
				clearUserdata ( playeritem )
				clearBonus ( playeritem )
				clearAchiev ( playeritem )
				clearPackage ( playeritem )
				clearDataSettings ( playeritem )
			end
		end
		restartResource ( getThisResource() )
	end
end )



local laststatus = {}

addEvent ( "testsocial", true )
addEventHandler ( "testsocial", root, function ( bool )
	if bool then
		laststatus[client] = vnxGetElementData ( client, "socialState" )
		vnxSetElementData ( client, "socialState", "Schreibt ..." )
	else
		if laststatus[client] then
			vnxSetElementData ( client, "socialState", laststatus[client] )
		end
	end
end )
