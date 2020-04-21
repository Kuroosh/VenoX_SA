_G["Clantag"] = "no"
setGlitchEnabled ( "fastsprint", true )

clanMembers = {}
ticketPermitted = {}
achievmentChecker = {}



addEventHandler ( "onPlayerConnect", getRootElement(), function ( nick, ip, uname, serial )
	if nick == "Player" then
		cancelEvent ( true, "Bitte wähle einen Nickname ( Unter \"Settings\" )" )
	elseif string.find ( nick, "mtasa" ) then
		cancelEvent ( true, "Fuck you!" )
	elseif string.find ( nick, "Donald Trump") then 
		cancelEvent( true, ":)" )
	elseif string.find ( nick, "'" ) then
		cancelEvent ( true, "Bitte kein ' benutzen!" )
	elseif string.find ( nick, "Dolan" ) then
		cancelEvent ( true, ":)" )
	elseif string.find ( nick, "Forces" ) then
		cancelEvent ( true, "Boeser Forces" )
	else
		if playerUID[nick] then 

			result = dbPoll ( dbQuery ( handler, "SELECT STime, Grund, AdminUID FROM ?? WHERE UID=? OR ??=?", "ban", playerUID[nick], "Serial", serial ), -1 )
		else
			result = dbPoll ( dbQuery ( handler, "SELECT STime, Grund, AdminUID FROM ?? WHERE ??=?", "ban", "Serial", serial ), -1 )
		end
		local deleteit = false
		if result and result[1] then
			for i=1, #result do
				if result[i]["STime"] ~= 0 and ( result[i]["STime"] - getTBanSecTime ( 0 ) ) <= 0 then
					deleteit = true
				else
					reasonwhybanned = result[i]["Grund"]
					adminbanned = playerUIDName[tonumber ( result[i]["AdminUID"] )]
					local restbantime = math.floor ( ( ( result[i]["STime"] - getTBanSecTime ( 0 ) ) / 60 ) * 100 ) / 100

					if restbantime >= 0 then
						--cancelEvent ( true, "Du bist noch "..restbantime.." Stunden von "..tostring(adminbanned).." gesperrt, Grund: "..tostring(reasonwhybanned) )
						outputDebugString( nick.." ist noch"..restbantime.. "stunden von " ..tostring(adminbanned).." gesperrt, Grund : "..tostring(reasonwhybanned), 3, 125, 0, 0 )
						cancelEvent ( true, "Du bist noch "..restbantime.." Stunden von "..adminbanned.." gesperrt, Grund: "..reasonwhybanned )
					else
						cancelEvent ( true, "Du wurdest permanent von "..adminbanned.." gesperrt, Grund: "..reasonwhybanned )
						outputDebugString( nick.." ist permanent von "..adminbanned.." gesperrt, Grund: "..reasonwhybanned, 3, 125, 0, 0 )
					end
					return
				end
			end
			if deleteit then
				if playerUID[nick] then
					dbExec ( handler, "DELETE FROM ?? WHERE UID=? OR Serial=?", "ban", playerUID[nick], serial )
				else
					dbExec ( handler, "DELETE FROM ?? WHERE Serial=?", "ban", serial )
				end
			end
		elseif getPlayerWarnCount ( nick ) >= 3 then
			cancelEvent ( true, "Du hast 3 Warns! Ablaufdatum des nächsten Warns: "..getLowestWarnExtensionTime ( nick ) )
		end
	end
end )


function regcheck_func ( player )

	setPedStat ( player, 22, 50 )
	setElementFrozen ( player, true )
	vnxSetElementData  ( player, "loggedin", 0 )
	
	local pname = getPlayerName ( player )
	toggleAllControls ( player, false )
	if player == client then
		if isSerialValid ( getPlayerSerial(player) ) or isRegistered ( pname ) then
			if ( hasInvalidChar ( player ) or string.find ( pname, "'" ) ) and not isRegistered ( pname ) then
				kickPlayer ( player, "Dein Name enthält ungültige Zeichen!" )
			else
				if pname ~= "player" then
					if isRegistered ( pname ) then
						local serial = getPlayerSerial ( player )
						local thename = ""
						local haterlaubnis = false
						local result = dbPoll ( dbQuery ( handler, "SELECT Name, Erlaubnis FROM players WHERE ?? LIKE ?", "Serial", serial ), -1 )
						if result and result[1] then
							thename = result[1]["Name"]
							if tonumber ( result[1]["Erlaubnis"] ) == 1 then
								thename = pname 
								haterlaubnis = true
							end
						else
							thename = pname
						end
						if string.lower(thename) ~= string.lower(getPlayerName ( player )) then
							if not haterlaubnis then
								kickPlayer ( player, "Du hast schon ein Account mit einem anderen Namen ("..thename..")" )
								return false
							end
						end
						triggerClientEvent ( player, "ShowLoginWindow", getRootElement(), thename, true )
					else
						local clantag = gettok ( pname, 1, string.byte(']') )
						if testmode == true then
							
								triggerClientEvent ( player, "ShowRegisterGui", getRootElement() )
						else
							local serial = getPlayerSerial ( player )
							if string.upper ( clantag ) == "[VnX" then
								kickPlayer (player, "Du bist kein Mitglied des Clans!")
							elseif string.upper ( clantag ) == "[NOVA" or string.upper ( clantag ) == "[vnx" or string.upper ( clantag ) == "[EXO" or string.upper ( clantag ) == "[XTM" or string.upper ( clantag ) == "[GRS" or string.upper ( clantag ) == "[CoA" or string.upper ( clantag ) == "[VITA" or string.upper ( clantag ) == "[UTM" or string.upper ( clantag ) == "[UL" then
								kickPlayer (player, "Dieses Clantag ist nicht erlaubt!")
							elseif #pname < 3 or #pname > 20 then
								kickPlayer ( player, "Bitte mindestens 3 und maximal 20 Zeichen als Nickname!" )
							elseif hasInvalidChar ( player ) or string.find ( pname, "'" ) then
								kickPlayer ( player, "Bitte nimm einen Nickname ohne ueberfluessige Zeichen!" )
							elseif string.lower (pname) == "niemand" or string.lower (pname) == "versteigerung" or string.lower (pname) == "none" then
								kickPlayer ( player, "Ungültiger Name!" )
							else
								
								triggerClientEvent ( player, "ShowRegisterGui", getRootElement() )
							end
						end
					end
				else
					kickPlayer ( player, "Bitte ändere deinen Nickname!" )
				end
			end
		else
			kickPlayer ( player, "Dein MTA verwendet einen ungültigen Serial. Bitte neu installieren!" )
		end
	end
end
addEvent ( "regcheck", true )
addEventHandler ("regcheck", getRootElement(), regcheck_func )


function register_func ( passwort, date, email, advertiser )
			local player = client
			local pname = getPlayerName ( player )
			local geschlecht = math.random ( 0, 1 )
			if vnxGetElementData ( player, "loggedin" ) == 0 and not isRegistered ( pname ) and player == client then
				setPlayerLoggedIn ( pname )
				
				dbExec ( handler, "DELETE FROM players WHERE Name LIKE '"..pname.."'" )
				dbExec ( handler, "DELETE FROM userdata WHERE Name LIKE '"..pname.."'" )
				
				toggleAllControls ( player, true )
				vnxSetElementData ( player, "loggedin", 1 )
				triggerClientEvent ( client, "DisableRegisterGui",client )
				local ip = getPlayerIP ( player )
				
				local regtime = getRealTime()
				local year = regtime.year + 1900
				local month = regtime.month + 1
				local day = regtime.monthday
				local hour = regtime.hour
				local minute = regtime.minute
				
				local registerdatum = tostring(day.."."..month.."."..year..", "..hour..":"..minute)
				local lastlogin = registerdatum
				
				passwort = hash ( "sha512", passwort )
				local lastLoginInt = getSecTime ( 0 )
				
				local id = tonumber ( dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE id=id", "id", "idcounter" ), -1 )[1]["id"] )
				dbExec ( handler, "UPDATE ?? SET ?? = ?", "idcounter", "id", id+1 )
				
				local result = dbExec ( handler, "INSERT INTO players ( UID, Name, Serial, IP, Last_login, Geburtsdatum_Tag, Geburtsdatum_Monat, Geburtsdatum_Jahr, Passwort, Geschlecht, RegisterDatum, LastLogin) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)", id, pname, getPlayerSerial(player), getPlayerIP ( player ), lastlogin, gettok ( date, 1, 42 ), gettok ( date, 2, 42 ), gettok ( date, 3, 42 ), passwort, geschlecht, registerdatum, lastLoginInt)
				if not result then
					outputDebugString ( "[register_func 1] Error executing the query" )
				else
					triggerClientEvent ( player, "infobox_start", player, "Du hast dich\nerfolgreich registriert!\n\nDeine Daten werden\nnun gespeichert!", 7500, 0, 255, 0 )
					playerUID[pname] = id
					playerUIDName[id] = pname
				end
				
				
				local result = dbExec ( handler, "INSERT INTO inventar (UID) VALUES (?)", id )
				if not result then
					outputDebugString ( "[register_func 3] Error executing the query" )
				end
				
				local result = dbExec ( handler, "INSERT INTO packages (UID, Paket1, Paket2, Paket3, Paket4, Paket5, Paket6, Paket7, Paket8, Paket9, Paket10, Paket11, Paket12, Paket13, Paket14, Paket15, Paket16, Paket17, Paket18, Paket19, Paket20, Paket21, Paket22, Paket23, Paket24, Paket25) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", id,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0' )
				if not result then
					outputDebugString ( "[register_func 4] Error executing the query" )
				end
				
				local result = dbExec ( handler, "INSERT INTO bonustable (UID, Lungenvolumen, Muskeln, Kondition, Boxen, KungFu, Streetfighting, CurStyle, PistolenSkill, DeagleSkill, ShotgunSkill, AssaultSkill) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)", id, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none' )
				if not result then
					outputDebugString ( "[register_func 5] Error executing the query" )
				end
				
				local result = dbExec ( handler, "INSERT INTO statistics ( UID ) VALUES (?)", id )
				if not result then
					outputDebugString ( "[register_func 6] Error executing the query" )
				end
				
				local result = dbExec ( handler, "INSERT INTO skills ( UID ) VALUES (?)", id )
				if not result then
					outputDebugString ( "[register_func 7] Error executing the query" )
				end

				local result = dbExec ( handler, "INSERT INTO levelsystem (UID) VALUES (?)", id )
				if not result then
					outputDebugString ( "[register_func 8] Error executing the query" )
				end
				
				vnxSetElementData ( player, "money", 750 )
				vnxSetElementData ( player, "points", 40 )
				vnxSetElementData ( player, "packages", "90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" )
				local Spawnpos_X = -1969.730
				vnxSetElementData ( player, "spawnpos_x", Spawnpos_X )
				local Spawnpos_Y = 137.930
				vnxSetElementData ( player, "spawnpos_y", Spawnpos_Y )
				local Spawnpos_Z = 28
				vnxSetElementData ( player, "spawnpos_z", Spawnpos_Z )
				local Spawnrot_X = 0
				vnxSetElementData ( player, "spawnrot_x", Spawnrot_X )
				local SpawnInterior = 0
				vnxSetElementData ( player, "spawnint", SpawnInterior )
				local SpawnDimension = 0
				vnxSetElementData ( player, "spawndim", SpawnDimension )
				vnxSetElementData ( player, "fraktion", 0 )
				vnxSetElementData ( player, "rang", 0 )
				vnxSetElementData ( player, "adminlvl", 0 )
				vnxSetElementData ( player, "playingtime", 0 )
				vnxSetElementData ( player, "curcars", 0 )
				vnxSetElementData ( player, "maxcars", 10 )
				for i=1, 20 do
					vnxSetElementData ( player, "carslot"..i, 0 )
				end
				vnxSetElementData ( player, "deaths", 0 )
				vnxSetElementData ( player, "kills", 0 )
				vnxSetElementData ( player, "gangwarwins", 0 )
				vnxSetElementData ( player, "gangwarlosses", 0 )
				vnxSetElementData ( player, "jailtime", 0 )
				vnxSetElementData ( player, "prison", 0 )
				vnxSetElementData ( player, "bail", 0 )
				vnxSetElementData ( player, "heaventime", 0 )
				vnxSetElementData ( player, "housekey", 0 )
				vnxSetElementData ( player, "bizkey", 0 )
				vnxSetElementData ( player, "bankmoney", 10000 )
				vnxSetElementData ( player, "drugs", 0 )

				local Skinid = getRandomRegisterSkin ( player, geschlecht )
				vnxSetElementData ( player, "skinid", Skinid )
				vnxSetElementData ( player, "carlicense", 0 )
				vnxSetElementData ( player, "bikelicense", 0 )
				vnxSetElementData ( player, "lkwlicense", 0 )
				vnxSetElementData ( player, "helilicense", 0 )
				vnxSetElementData ( player, "planelicensea", 0 )
				vnxSetElementData ( player, "planelicenseb", 0 )
				vnxSetElementData ( player, "motorbootlicense", 0 )
				vnxSetElementData ( player, "segellicense", 0)
				vnxSetElementData ( player, "fishinglicense", 0)
				vnxSetElementData ( player, "wanteds", 0 )
				vnxSetElementData ( player, "stvo_punkte", 0 )
				vnxSetElementData ( player, "gunlicense", 0 )
				vnxSetElementData ( player, "perso", 0 )
				vnxSetElementData ( player, "boni", 1000 )
				vnxSetElementData ( player, "pdayincome", 0 )
				vnxSetElementData ( player, "hitglocke", 1 )
				vnxSetElementData ( player, "hud", 3 )
				vnxSetElementData ( player, "crosshair", 0 )
				vnxSetElementData ( player, "promocode", 0 )
				vnxSetElementData ( player, "promocode2", 0 )
				vnxSetElementData ( player, "promocode3", 0 )
				vnxSetElementData ( player, "promocode4", 0 )
				vnxSetElementData ( player, "promocode5", 0 )
				vnxSetElementData ( player, "promocode6", 0 )

				setElementData ( player, "crosshair", 0 )
				setElementData(player, "promocode", 0)
				setElementData(player, "promocode2", 0)
				setElementData(player, "promocode3", 0)
				setElementData(player, "promocode4", 0)
				setElementData(player, "promocode5", 0)
				setElementData(player, "promocode6", 0)

				setElementData(player, "hud", 3)
				vnxSetElementData ( player, "medikits", 0 )
				vnxSetElementData ( player, "repairkits", 0 )
				vnxSetElementData ( player, "premium", false )
				vnxSetElementData ( player, "Paket", 0 )
				vnxSetElementData ( player, "PremiumData", 0 )
				local run = 1
				while true do
					if run >= 20 then
						break
					else
						run = run + 1
					end
					local tnr = math.random ( 1000, 9999999 )
					local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Telefonnr", "userdata", "Telefonnr", tnr ), -1 )
					if not result or not result[1] then
						if tonumber ( tnr ) ~= 911 and tonumber ( tnr ) ~= 333 and tonumber ( tnr ) ~= 400 and tonumber (tnr ) ~= 666666 then
							Telefonnr = tnr
							break
						end
					end
				end
				if Telefonnr == nil then
					Telefonnr = math.random ( 1000, 9999999 )
				end
				vnxSetElementData ( player, "telenr", Telefonnr )
				vnxSetElementData ( player, "warns", 0 )
				vnxSetElementData ( player, "gunboxa", "0|0" )
				vnxSetElementData ( player, "gunboxb", "0|0" )
				vnxSetElementData ( player, "gunboxc", "0|0" )
				vnxSetElementData ( player, "job", "none" )
				setElementData ( player, "job", "none" )
				vnxSetElementData ( player, "jobtime", 0 )
				vnxSetElementData ( player, "club", "none" )
				vnxSetElementData ( player, "favchannel", 0 )
				vnxSetElementData ( player, "bonuspoints", 0 )
				vnxSetElementData ( player, "truckerlvl", 0 )
				vnxSetElementData ( player, "airportlvl", 0 )
				vnxSetElementData ( player, "bauarbeiterLVL", 0 )
				vnxSetElementData ( player, "farmerLVL", 0 )
				vnxSetElementData ( player, "contract", 0 )
				vnxSetElementData ( player, "socialState", "VenoX" )
				vnxSetElementData ( player, "streetCleanPoints", 0 )
				vnxSetElementData ( player, "handyType", 1 )
				vnxSetElementData ( player, "handyCosts", 0 )
				
				_G[pname.."paydaytime"] = setTimer ( playingtime, 60000, 0, player )
				
				vnxSetElementData ( player, "loggedin", 1 )
				vnxSetElementData ( player, "muted", 0 )
				vnxSetElementData ( player, "curplayingtime", 0 )
				vnxSetElementData ( player, "housex", 0 )
				vnxSetElementData ( player, "housey", 0 )
				vnxSetElementData ( player, "housez", 0 )
				vnxSetElementData ( player, "house", "none" )
				vnxSetElementData ( player, "handystate", "on" )
				vnxSetElementData ( player, "object", 0 )
				vnxSetElementData ( player, "ammoTyp", 0 )
				vnxSetElementData ( player, "curAmmoTyp", 0 )
				vnxSetElementData ( player, "nodmzone", 0 )
				vnxSetElementData ( player, "coins", 0 )
				vnxSetElementData ( player, "MainXP", 0 )
				vnxSetElementData ( player, "MainLevel", 1 )
				vnxSetElementData ( player, "GWXP", 0 )
				vnxSetElementData ( player, "GWLevel", 0 )
				setElementData(player, "globalchatstatus", 0)
				setElementData(player, "needhelp_status", 0)

				--checkPremium (player)
				-- EXP
				--g_EXP:setPlayerEXP(player, 0, true)


				bindKey ( source, "r", "down", reload )											
				setPlayerWantedLevel ( player, 0 )
				vnxSetElementData ( player, "call", false )
				
                loadDBClothes ( player )
				packageLoad ( player )
				inventoryload ( player )
				elementDataSettings ( player )
				bonusLoad ( player )
				skillDataLoad ( player )
				createPlayerAFK ( player )
				loadPlayerStatisticsMySQL ( player )
				getDataLevelSystem ( player )
				if not allPrivateCars[pname] then
					allPrivateCars[pname] = {}
				end

				local result = dbExec ( handler, "INSERT INTO userdata ( UID,Name,Skinid,Telefonnr,geschenk,hud,promocode,crosshair,promocode2,promocode3,promocode4,promocode5,promocode6) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)", id, pname, Skinid, Telefonnr, 0, 0, 0)
				if not result then
					outputDebugString ( "[register_func 8] Error executing the query" )
				else
					outputDebugString ("Daten für Spieler "..pname.." wurden angelegt!")
				end
				--outputChatBox ( "Drücke F1, um das Hilfemenü zu öffnen!", player, 200, 200, 0 )
				
				vnxSetElementData ( player, "gameboy", 0 )
				vnxSetElementData ( player, "geschenk", 0 )
				vnxSetElementData ( player, "hud", 4 )
				vnxSetElementData ( player, "crosshair", 0 )
				vnxSetElementData ( player, "promocode", 0 )
				vnxSetElementData ( player, "promocode2", 0 )
				vnxSetElementData ( player, "promocode3", 0 )
				vnxSetElementData ( player, "promocode4", 0 )
				vnxSetElementData ( player, "promocode5", 0 )
				vnxSetElementData ( player, "promocode6", 0 )
				vnxSetElementData ( player, "selfopen", 0 )
				loadAddictionsForPlayer ( player )
				spawnchange_func ( player, "", "noobspawn", "" )
				triggerJoinedPlayerTheTrams ( player )
				syncInvulnerablePedsWithPlayer ( player )
				playerLoginGangMembers ( player )
				spawnPlayer ( player, Spawnpos_X, Spawnpos_Y, Spawnpos_Z, Spawnrot_X, Skinid, SpawnInterior, 0 )
				setCameraTarget ( player, player )
				setElementFrozen ( player, false )
				toggleAllControls ( player, true )
				--triggerClientEvent ( player, "starttutorial", player, Skinid )
				setPlayerHudComponentVisible ( player, "all", false )
				insertPlayerIntoLoggedIn ( pname, getPlayerIP(player), getPlayerSerial(player) )
				achievmentChecker[pname] = setTimer( checkAchievments, 60000, 0, player)
				redirectPlayer( player,"",0)
			end
end
addEvent ( "register", true )
addEventHandler ( "register", getRootElement(), register_func)


addEvent ( "tutorialended", true )
addEventHandler ( "tutorialended", root, function ( )
	setElementPosition ( client, -2000.2779541016, 196.17945861816, 27.577531051636 )
	setCameraTarget ( client, client )
	setElementFrozen ( client, false )
	toggleAllControls ( client, true )
end )


addEvent ( "setPlayerTutorialMoney", true )
addEventHandler ( "setPlayerTutorialMoney", root, function ( )
	vnxSetElementData ( client, "money", vnxGetElementData ( client, "money" ) + 10000 )
end )


local maleSkins = {1, 2, 7, 14, 15, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 32, 33, 34, 35, 36, 37, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 57, 58, 59, 60, 61, 62, 66, 67, 68, 71, 72, 73, 78, 79, 80, 81, 82, 83, 84, 94, 95, 96, 97, 98, 99, 100, 101, 108, 109, 110, 122, 128, 132, 133, 134, 135, 136, 137, 142, 143, 144, 146, 147, 153, 154, 155, 156, 158, 159, 160, 161, 162, 167, 168, 170, 171, 176, 177, 179, 180, 182, 183, 184, 185, 187, 189, 200, 202, 203, 204, 206, 209, 210, 212, 213, 217, 220, 221, 222, 223, 227, 228, 229, 230, 234, 235, 236, 239, 240, 241, 242, 249, 250, 252, 253, 255, 258, 259, 261, 262, 264, 269, 270, 271, 291, 302, 303, 306, 307, 310}
local femaleSkins = {9, 10, 11, 12, 13, 31, 38, 39, 40, 41, 53, 54, 55, 56, 63, 64, 69, 75, 76, 77, 85, 87, 88, 89, 90, 91, 92, 93, 129, 130, 131, 138, 139, 140, 141, 145, 148, 150, 151, 152, 157, 169, 172, 178, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 201, 205, 207, 211, 214, 215, 216, 218, 219, 225, 226, 231, 232, 233, 238, 243, 244, 245, 246, 251, 256, 257, 263 }


function getRandomRegisterSkin ( player, sex )
	local testped = createPed ( 0, 9999, 9999, 9999 )
	if geschlechtnewvnx == 1 then
		local rnd = math.random ( 1, #femaleSkins )
		if setElementModel ( testped, femaleSkins[rnd] ) then
			destroyElement ( testped )
			return femaleSkins[rnd]
		else
			destroyElement ( testped )
			return getRandomRegisterSkin ( player, sex )
		end
	else
		local rnd = math.random ( 1, #maleSkins )
		if setElementModel ( testped, maleSkins[rnd] ) then
			destroyElement ( testped )
			return maleSkins[rnd]
		else
			destroyElement ( testped )
			return getRandomRegisterSkin ( player, sex )
		end
	end
end


function login_func ( player, passwort )
	if player == client then
		if vnxGetElementData ( player, "loggedin" ) == 0 then
			local pname = getPlayerName ( player )
			local passwort = passwort
			
			local pwresult = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Passwort", "players", "UID", playerUID[pname] ), -1 )
			if pwresult and pwresult[1] then
				pwresult = pwresult[1]["Passwort"]
				local nhpasswort = hash ( "sha512", passwort )
				if pwresult == hash ( "sha512", nhpasswort ) then			
					setPlayerLoggedIn ( pname )
					toggleAllControls ( player, true )

					vnxSetElementData ( player, "loggedin", 1 )
					setElementData ( player, "loggedin", 1 )
					vnxSetElementData ( player, "nodmzone", 0 )
					
					local logtime = getRealTime()
					local year = logtime.year + 1900
					local month = logtime.month + 1
					local day = logtime.monthday
					local hour = logtime.hour
					local minute = logtime.minute
					
					local lastLoginInt = getSecTime ( 0 )
					local lastlogin = tostring(day.."."..month.."."..year..", "..hour..":"..minute)
					
					local result = dbPoll ( dbQuery ( handler, "SELECT * from userdata WHERE UID = ?", playerUID[pname] ), -1 )
					if result then
						if result[1] then
							local dsatz = result[1]
							local money = tonumber ( dsatz["Geld"] )
							vnxSetElementData ( player, "money", money )

							-- Set EXP Points
							--local points = tonumber(dsatz["RP"])
							--g_EXP:setPlayerEXP(player, points, true)

							local fraktion = tonumber ( dsatz["Fraktion"] )
							vnxSetElementData ( player, "fraktion", fraktion )
							if fraktion > 0 then
								fraktionMembers[fraktion][player] = fraktion
								bindKey ( player, "y", "down", "chatbox", "t" )
								if fraktion ~= 10 and fraktion ~= 11 then
									triggerClientEvent ( player, "syncPlayerList", player, fraktionMemberList[fraktion], fraktionMemberListInvite[fraktion] )
								else
									triggerClientEvent ( player, "syncPlayerList", player, fraktionMemberList[10], fraktionMemberListInvite[10] )
								end
							end

							local selfopennumb = dsatz["selfopen"]
							setElementData ( player, "selfopen", selfopennumb )	
							local hudnumb = tonumber ( dsatz["hud"] )
							vnxSetElementData( player, "hud", hudnumb)
							setElementData( player, "hud", hudnumb)

							local crosshairnumb = tonumber ( dsatz["crosshair"] )
							vnxSetElementData( player, "crosshair", crosshairnumb)
							setElementData( player, "crosshair", crosshairnumb)

							local promocodenumb = tonumber ( dsatz["promocode"] )
							setElementData( player, "promocode", promocodenumb)
							vnxSetElementData( player, "promocode", promocodenumb)

							local promocode2numb = tonumber ( dsatz["promocode2"] )
							setElementData( player, "promocode2", promocode2numb)
							vnxSetElementData( player, "promocode2", promocode2numb)

							local promocode3numb = tonumber ( dsatz["promocode3"] )
							setElementData( player, "promocode3", promocode3numb)
							vnxSetElementData( player, "promocode3", promocode3numb)

							local promocode4numb = tonumber ( dsatz["promocode4"] )
							setElementData( player, "promocode4", promocode4numb)
							vnxSetElementData( player, "promocode4", promocode4numb)

							local promocode5numb = tonumber ( dsatz["promocode5"] )
							setElementData( player, "promocode5", promocode5numb)
							vnxSetElementData( player, "promocode5", promocode5numb)

							local promocode6numb = tonumber ( dsatz["promocode6"] )
							setElementData( player, "promocode6", promocode6numb)
							vnxSetElementData( player, "promocode6", promocode6numb)
			
							local rang = tonumber ( dsatz["FraktionsRang"] )
							vnxSetElementData ( player, "rang", rang )
							setElementData ( player, "rang", rang )
							local geschenk = dsatz["geschenk"]
							vnxSetElementData ( player, "geschenk", geschenk )							
							local admnlvl = tonumber ( dsatz["Adminlevel"] )
							vnxSetElementData ( player, "adminlvl", admnlvl )
							if admnlvl >= 1 then
								adminsIngame[player] = admnlvl
								giveAchievement( player, 8 )
							end
							if admnlvl == 1 then
								donatorMute[player] = {}
							end
							
							vnxSetElementData ( player, "spawnpos_x", tonumber ( dsatz["Spawnpos_X"] ) )
							vnxSetElementData ( player, "spawnpos_y", tonumber ( dsatz["Spawnpos_Y"] ) )
							vnxSetElementData ( player, "spawnpos_z", tonumber ( dsatz["Spawnpos_Z"] ) )
							vnxSetElementData ( player, "spawnrot_x", tonumber ( dsatz["Spawnrot_X"] ) )
							vnxSetElementData ( player, "spawnint", tonumber ( dsatz["SpawnInterior"] ) )
							vnxSetElementData ( player, "spawndim", tonumber ( dsatz["SpawnDimension"] ) )
							vnxSetElementData ( player, "playingtime", tonumber ( dsatz["Spielzeit"] ) )
							vnxSetElementData ( player, "curcars", tonumber ( dsatz["CurrentCars"] ) )
							local maximumcars = tonumber ( dsatz["MaximumCars"] )
							vnxSetElementData ( player, "maxcars", maximumcars  )
							local curcars = 0
							local offerOnCar = false
							local vehresult = dbPoll ( dbQuery ( handler, "SELECT ??, ?? FROM ?? WHERE ??=?", "Special", "Slot", "vehicles", "UID", playerUID[pname] ), -1 )
							for i=1, maximumcars do
								vnxSetElementData ( player, "carslot"..i, 0 )
							end
							if vehresult and vehresult[1] then
								for i = 1, #vehresult do
									local id = tonumber ( vehresult[i]["Slot"] )
									local carvalue = tonumber ( vehresult[i]["Special"] )
									if carvalue == 2 then
										vnxSetElementData ( player, "yachtImBesitz", true )
									end
									if not carvalue then
										--if MySQL_DatasetExist("buyit", "Hoechstbietender LIKE '"..pname.."' AND Typ LIKE 'Veh'") then
										--	carvalue = 3
										--	offerOnCar = true
										--else
											carvalue = 0
										--end
									else
										if carvalue == 2 then
											carvalue = 2
										else
											carvalue = 1
										end
										curcars = curcars + 1
									end
									vnxSetElementData ( player, "carslot"..id, carvalue )
								end
							end
							vnxSetElementData ( player, "curcars", curcars )

							vnxSetElementData ( player, "deaths", tonumber ( dsatz["Tode"] ) )
							vnxSetElementData ( player, "kills", tonumber ( dsatz["Kills"] ) )
							vnxSetElementData ( player, "gangwarlosses", tonumber ( dsatz["GangwarVerloren"] ) )
							vnxSetElementData ( player, "gangwarwins", tonumber ( dsatz["GangwarGewonnen"] ) )
							vnxSetElementData ( player, "jailtime", tonumber ( dsatz["Knastzeit"] ) )
							vnxSetElementData ( player, "prison", tonumber ( dsatz["Prison"] ) )
							vnxSetElementData ( player, "bail", tonumber ( dsatz["Kaution"] )  )
							vnxSetElementData ( player, "heaventime", tonumber ( dsatz["Himmelszeit"] ) )
							vnxSetElementData ( player, "Paket", tonumber ( dsatz["PremiumPaket"] ) )
							vnxSetElementData ( player, "PremiumData", tonumber ( dsatz["PremiumData"] ) )
							
							local resulthouse = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "ID", "houses", "UID", playerUID[pname] ), -1 )
							local Hausschluessel = resulthouse[1] and resulthouse[1]["ID"] or false
							local key = tonumber ( dsatz["Hausschluessel"] )
							if Hausschluessel then
								vnxSetElementData ( player, "housekey", tonumber ( Hausschluessel ) )
							elseif key <= 0 then
								vnxSetElementData ( player, "housekey", key )
							else
								vnxSetElementData ( player, "housekey", 0 )
							end
							
							vnxSetElementData ( player, "hitglocke", tonumber ( dsatz["Hitglocke"] ) )
							vnxSetElementData ( player, "hud", tonumber ( dsatz["Hud"] ) )
							vnxSetElementData ( player, "crosshair", tonumber ( dsatz["crosshair"] ) )
							vnxSetElementData ( player, "promocode", tonumber ( dsatz["promocode"] ) )
							vnxSetElementData ( player, "promocode2", tonumber ( dsatz["promocode2"] ) )
							vnxSetElementData ( player, "promocode3", tonumber ( dsatz["promocode3"] ) )
							vnxSetElementData ( player, "promocode4", tonumber ( dsatz["promocode4"] ) )
							vnxSetElementData ( player, "promocode5", tonumber ( dsatz["promocode5"] ) )
							vnxSetElementData ( player, "promocode6", tonumber ( dsatz["promocode6"] ) )
							vnxSetElementData ( player, "bizkey", tonumber ( dsatz["Bizschluessel"] ) )
							vnxSetElementData ( player, "bankmoney", tonumber ( dsatz["Bankgeld"] ) )
							vnxSetElementData ( player, "drugs", tonumber ( dsatz["Drogen"] ) )
							vnxSetElementData ( player, "skinid", tonumber ( dsatz["Skinid"] ) )
							vnxSetElementData ( player, "carlicense", tonumber ( dsatz["Autofuehrerschein"] ) )
							vnxSetElementData ( player, "bikelicense", tonumber ( dsatz["Motorradtfuehrerschein"] ) )
							vnxSetElementData ( player, "lkwlicense", tonumber ( dsatz["LKWfuehrerschein"] ) )
							vnxSetElementData ( player, "helilicense", tonumber ( dsatz["Helikopterfuehrerschein"] ) )
							vnxSetElementData ( player, "planelicensea", tonumber ( dsatz["FlugscheinKlasseA"] ) )
							vnxSetElementData ( player, "planelicenseb", tonumber ( dsatz["FlugscheinKlasseB"] ) )
							vnxSetElementData ( player, "motorbootlicense", tonumber ( dsatz["Motorbootschein"] ) )
							vnxSetElementData ( player, "segellicense", tonumber ( dsatz["Segelschein"] ) )
							vnxSetElementData ( player, "fishinglicense", tonumber ( dsatz["Angelschein"] ) )
							vnxSetElementData ( player, "wanteds", tonumber ( dsatz["Wanteds"] ) )
							vnxSetElementData ( player, "stvo_punkte", tonumber ( dsatz["StvoPunkte"] ) )
							vnxSetElementData ( player, "gunlicense", tonumber ( dsatz["Waffenschein"] ) )
							vnxSetElementData ( player, "perso", tonumber ( dsatz["Perso"] ) )
							vnxSetElementData ( player, "boni", tonumber ( dsatz["Boni"] ) )
							vnxSetElementData ( player, "pdayincome", tonumber ( dsatz["PdayIncome"] ) )
							vnxSetElementData ( player, "telenr", tonumber ( dsatz["Telefonnr"] ) )
							vnxSetElementData ( player, "warns", getPlayerWarnCount ( pname ) )
							vnxSetElementData ( player, "gunboxa", dsatz["Gunbox1"] )
							vnxSetElementData ( player, "gunboxb", dsatz["Gunbox2"] )
							vnxSetElementData ( player, "gunboxc", dsatz["Gunbox3"] )
							vnxSetElementData ( player, "job", dsatz["Job"] )
							vnxSetElementData ( player, "jobtime", dsatz["Jobtime"] )
							vnxSetElementData ( player, "club", dsatz["Club"] )
							vnxSetElementData ( player, "favchannel", tonumber ( dsatz["FavRadio"] ) )
							vnxSetElementData ( player, "bonuspoints", tonumber ( dsatz["Bonuspunkte"] ) )
							achievmentChecker[pname] = setTimer( checkAchievments, 60000, 0, player)
							local skill = tonumber ( dsatz["Truckerskill"] )
							if not skill then
								skill = 0
							end
							local ArmyPermissions = dsatz["ArmyPermissions"]
							for i = 1, 10 do
								vnxSetElementData ( player, "armyperm"..i, tonumber ( gettok ( ArmyPermissions, i, string.byte( '|' ) ) ) )
							end
							vnxSetElementData ( player, "truckerlvl", skill )
							vnxSetElementData ( player, "coins", tonumber ( dsatz["Coins"] ) )
							vnxSetElementData ( player, "airportlvl", tonumber ( dsatz["AirportLevel"] ) )
							vnxSetElementData ( player, "farmerLVL", tonumber ( dsatz["farmerLVL"] ) )
							vnxSetElementData ( player, "bauarbeiterLVL", tonumber ( dsatz["bauarbeiterLVL"] ) )
							vnxSetElementData ( player, "contract", tonumber ( dsatz["Contract"] ) )
							vnxSetElementData ( player, "socialState", dsatz["SocialState"] )
							if tonumber ( dsatz["SocialState"] ) then
								if tonumber ( dsatz["SocialState"] ) == 0 then
									vnxSetElementData ( player, "socialState", "VenoX" )
								end
							end
							vnxSetElementData ( player, "streetCleanPoints", tonumber ( dsatz["StreetCleanPoints"] ) )
							
							local handyString = dsatz["Handy"] 
							local v1, v2
							v1 = tonumber ( gettok ( handyString, 1, string.byte ( '|' ) ) )
							v2 = tonumber ( gettok ( handyString, 2, string.byte ( '|' ) ) )
							vnxSetElementData ( player, "handyType", v1 )
							vnxSetElementData ( player, "handyCosts", v2 )
							
							
							
							loadAddictionsForPlayer ( player )
							
							--isPremium ( player )
							getDataLevelSystem ( player )
							vnxSetElementData ( player, "housex", 0 )
							vnxSetElementData ( player, "housey", 0 )
							vnxSetElementData ( player, "housez", 0 )
							vnxSetElementData ( player, "house", "none" )
							vnxSetElementData ( player, "curplayingtime", 0 )
							vnxSetElementData ( player, "handystate", "on" )
							vnxSetElementData ( player, "call", false )
							setElementData ( player, "drugs", tonumber ( dsatz["Drogen"] ))
							setElementData(player, "burger", tonumber(dsatz["burger"]))
							setElementData(player, "hud", tonumber(dsatz["hud"]))
							setElementData(player, "crosshair", tonumber(dsatz["crosshair"]))
							setElementData(player, "promocode", tonumber(dsatz["promocode"]))
							setElementData(player, "promocode2", tonumber(dsatz["promocode2"]))
							setElementData(player, "promocode3", tonumber(dsatz["promocode3"]))
							setElementData(player, "promocode4", tonumber(dsatz["promocode4"]))
							setElementData(player, "promocode5", tonumber(dsatz["promocode5"]))
							setElementData(player, "promocode6", tonumber(dsatz["promocode6"]))
							setElementData(player, "selfopen", tonumber(dsatz["selfopen"]))
							setElementData(player, "needhelp_status", false)
							--setElementData(player, "Benzinkanister", tonumber(dsatz["Benzinkanister"]))
							loadDBClothes ( player )
							packageLoad ( player )
	
							inventoryload ( player )
							elementDataSettings ( player )
							bonusLoad ( player )
							
							checkPremium ( player )

							skillDataLoad ( player )
							createPlayerAFK ( player )
							loadPlayerStatisticsMySQL ( player )
							setMaximumCarsForPlayer ( player )

							if not allPrivateCars[pname] then
								allPrivateCars[pname] = {}
							end
							
							_G[pname.."paydaytime"] = setTimer ( playingtime, 60000, 0, player )
				
							RemoteSpawnPlayer ( player )
							setElementFrozen ( player, true )
							setTimer ( setElementFrozen, 3000, 1, player, false )
							vnxSetElementData ( player, "muted", 0 )
							--triggerClientEvent ( player, "DisableLoginWindow", getRootElement())
							triggerClientEvent ( player, "destroyLoginWindow", getRootElement())
							
							triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast dich erfolgreich eingeloggt! \nDrücke F1, um das Hilfemenü zu\nöffnen!", 5000, 0, 255, 0 )
							outputDebugString ("Spieler "..pname.." wurde eingeloggt, IP: "..getPlayerIP(player))
							vnxSetElementData ( player, "loggedin", 1 )
							triggerJoinedPlayerTheTrams ( player )

							if vnxGetElementData ( player, "stvo_punkte" ) >= 15 then			-- SearchSTVO
								vnxSetElementData ( player, "carlicense", 0 )
								vnxSetElementData ( player, "stvo_punkte", 0 )
								--dbExec ( handler, "UPDATE ?? SET ??=?, ??=?, ??=? WHERE ??=?", "userdata", "Autofuehrerschein", 0, "UID", playerUID[pname] )
								dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "Autofuehrerschein", 0, "UID", playerUID[pname] )
								outputChatBox ( "Wegen deines schlechten Fahrverhaltens wurde dir dein Führerschein abgenommen!", player, 125, 0, 0 )
							end
							
							vnxSetElementData ( player, "object", tonumber ( dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Objekt", "inventar", "UID", playerUID[pname] ), -1 )[1]["Objekt"] ) )
							
							--checkmsgs ( player )
							
							blacklistLogin ( pname )
							--checkPremium ( player )
							vnxGetElementData ( player, "premium")
							triggerClientEvent ( player, "getXPForNextLevel", getRootElement(), player )
						
							if isElement ( houses["pickup"][getPlayerName(player)] ) then
								local x, y, z = getElementPosition (houses["pickup"][getPlayerName(player)])
								createBlip ( x, y, z, 31, 2, 255, 0, 0, 255, 0, 99999, player )
							end
							
							local serial = getPlayerSerial ( player )
							local rt = getRealTime ()
							local zeit = rt.timestamp
							dbExec ( handler, "UPDATE ?? SET ??=?, ??=?, ??=? WHERE ??=?", "players", "Last_login", lastlogin, "LastLogin", lastLoginInt, "Serial", serial, "UID", playerUID[pname] )
							infoShow( player, "info", "Willkommen zurück auf Venox :)")
							--35, 229, 255

							--outputChatBox ( "#383838≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡ #00BFFFVenoX-RL Updates #383838≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡", player, 56, 56, 56, true )
							--outputChatBox ( "╔ Unsere Updates findet ihr hier und im Forum unter changelogs", player, 255, 255, 255 )
							--outputChatBox ( "╠ Unseren Teamspeak 3 Server findest du unter: ts3.venox-reallife.com", player, 255, 255, 255 )
							--outputChatBox ( "╠ Unser Forum findest du unter: www.venox-reallife.com", player, 255, 255, 255 )
							--outputChatBox ( "╠ Neue Tab, Inventar und vieles mehr.", player, 255, 255, 255 )
							--outputChatBox ( "╠ Du möchtest eine neue HUD? Dann nutze „/settings''", player, 255, 255, 255 )
							--outputChatBox ( "╚ Das VenoX-RL Team wünscht euch viel Spaß auf dem Server.", player, 255, 255, 255 )
							--outputChatBox ( "≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡", player, 56, 56, 56 )
							giveAchievement( player, 2 )
							local resultlogout = dbPoll ( dbQuery ( handler, "SELECT ??, ?? FROM ?? WHERE ??=?", "Position", "Waffen", "logout", "UID", playerUID[pname] ), -1 )
							if resultlogout and resultlogout[1] then
								local position = resultlogout[1]["Position"]
								if position then
									weapons = resultlogout[1]["Waffen"]
									dbExec ( handler, "DELETE FROM ?? WHERE ??=?", "logout", "UID", playerUID[pname] )
									for i = 1, 12 do
										local wstring = gettok ( weapons, i, string.byte( '|' ) )
										if wstring then
											if wstring then
												if #wstring >= 3 then
													local weapon = tonumber ( gettok ( wstring, 1, string.byte( ',' ) ) )
													local ammo = tonumber ( gettok ( wstring, 2, string.byte( ',' ) ) )
													giveWeapon ( player, weapon, ammo, true )
												end
											end
										end
									end
									if position ~= "false" then
										local x = tonumber ( gettok ( position, 1, string.byte( '|' ) ) )
										local y = tonumber ( gettok ( position, 2, string.byte( '|' ) ) )
										local z = tonumber ( gettok ( position, 3, string.byte( '|' ) ) )
										local int = tonumber ( gettok ( position, 4, string.byte( '|' ) ) )
										local dim = tonumber ( gettok ( position, 5, string.byte( '|' ) ) )
										setTimer ( setElementInterior, 1000, 1, player, int )
										setTimer ( setElementDimension, 1000, 1, player, dim )
										setTimer ( setElementPosition, 1000, 1, player, x, y, z )
									end
								end
							end
							getMailsForClient_func ( pname )
							playerLoginGangMembers ( player )
							syncInvulnerablePedsWithPlayer ( player )
							insertPlayerIntoLoggedIn ( pname, getPlayerIP(player), getPlayerSerial(player) )
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "Der Spieler\nexistiert nicht!", 5000, 255, 0, 0 )	
						end
					else
						outputDebugString ( "Einloggen klappt nicht!" )
					end		
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Ungueltiges Passwort -\nüberpruefe\ndeine Eingabe\noder melde dich\nim Forum.", 5000, 255, 0, 0 )	
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Der Spieler\nexistiert nicht!", 5000, 255, 0, 0 )	
			end
			if player and isElement ( player ) then
				bindKey ( player, "r", "down", reload )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "Der Spieler\nist einloggt!", 5000, 255, 0, 0 )	
		end
	end
end
addEvent ( "einloggen", true )
addEventHandler ( "einloggen", getRootElement(), login_func )


function gameBeginGuiShow_func ( player )

	if player == client then
		vnxSetElementData ( player, "isInTut", false )
		triggerClientEvent ( player, "showBeginGui", getRootElement() )
		--showCursor ( player, true )
		setElementClicked ( player, true )
		toggleAllControls ( player, true )
		setElementPosition ( player, -1421.3, -287.2, 13.8 )
		setElementInterior ( player, 0 )
	end
end
addEvent ( "gameBeginGuiShow", true )
addEventHandler ( "gameBeginGuiShow", getRootElement(), gameBeginGuiShow_func)
	



function inventoryload ( player )

	local pname = getPlayerName ( player )
	vnxSetElementData ( player, "playerid", playerUID[pname] )
	
	local dsatz
	local result = dbPoll ( dbQuery ( handler, "SELECT * from inventar WHERE UID = ?", playerUID[pname] ), -1 )
	if not result or not result[1] then
		dbExec ( handler, "INSERT INTO inventar (UID) VALUES (?)", playerUID[pname] )
		result = dbPoll ( dbQuery ( handler, "SELECT * from inventar WHERE UID = ?", playerUID[pname] ), -1 )
	end
	dsatz = result[1]
	if dsatz["Wuerfel"] then
		vnxSetElementData ( player, "dice", tonumber ( dsatz["Wuerfel"] ) )
	else
		vnxSetElementData ( player, "dice", 0 )
	end
	vnxSetElementData ( player, "flowerseeds", tonumber ( dsatz["Blumensamen"] ) )
	vnxSetElementData ( player, "food1", tonumber ( dsatz["Essensslot1"] ) )
	vnxSetElementData ( player, "food2", tonumber ( dsatz["Essensslot2"] ) )
	vnxSetElementData ( player, "food3", tonumber ( dsatz["Essensslot3"] ) )
	vnxSetElementData ( player, "zigaretten", tonumber ( dsatz["Zigaretten"] ) )
	vnxSetElementData ( player, "mats", tonumber ( dsatz["Materials"] ) )
	vnxSetElementData ( player, "koks", tonumber ( dsatz["Koks"] ) )
	vnxSetElementData ( player, "benzinkannister", tonumber ( dsatz["Benzinkanister"] ) )
	vnxSetElementData ( player, "fruitNotebook", tonumber ( dsatz["FruitNotebook"] ) )
	vnxSetElementData ( player, "casinoChips", tonumber ( dsatz["Chips"] ) )
	vnxSetElementData ( player, "gameboy", tonumber ( dsatz["Gameboy"] ) )
	vnxSetElementData ( player, "medikits", tonumber ( dsatz["Medikit"] ) )
	vnxSetElementData ( player, "repairkits", tonumber ( dsatz["Repairkit"] ) )
	-- X-MAS --
	-- vnxSetElementData ( player, "presents", tonumber ( dsatz["Geschenke"] ) )
	-- X-MAS --
end


	
function datasave ( quitReason, reason )

	if clanMembers[source] then
		clanMembers[source] = nil
	end
	if ticketPermitted[source] then
		ticketPermitted[source] = nil
	end
	local pname = getPlayerName ( source )
	saveLevelSystem ( source )
	removePlayerFromLoggedIn ( pname )
	if vnxGetElementData ( source, "loggedin" ) == 1 then
		playerDisconnectGangMembers ( source )
		pname = getPlayerName ( source )
		local frak = vnxGetElementData(source,"fraktion")
		if fraktionMembers[frak] then
			fraktionMembers[frak][source] = nil
		end
		adminsIngame[source] = nil
		if vnxGetElementData ( source, "shootingRanchGun" ) then
		elseif quitReason and reason ~= "Ausgeloggt." then
			if vnxGetElementData ( source, "wanteds" ) >= 1 --[[and ( quitReason == "Quit" or quitReason == "Unknown" )]] and vnxGetElementData ( source, "jailtime" ) == 0 and vnxGetElementData ( source, "prison" ) == 0 then
				local x, y, z = getElementPosition ( source )
				local copShape = createColSphere ( x, y, z, 20 )
				local elementsInCopSphere = getElementsWithinColShape ( copShape, "player" )
				destroyElement ( copShape )
				for i=1, #elementsInCopSphere do
					local cPlayer = elementsInCopSphere[i]
					if ( isOnDuty ( cPlayer ) or isArmy ( cPlayer ) ) and cPlayer ~= source then
						local wanteds = vnxGetElementData ( source, "wanteds" )
						vnxSetElementData ( source, "wanteds", 0 )
						vnxSetElementData ( source, "jailtime", wanteds * math.ceil(jailtimeperwanted*1.4) + vnxGetElementData ( source, "jailtime" ) )
						wantedCost = 100*wanteds*(wanteds*.5)
						vnxSetElementData ( source, "money", vnxGetElementData ( source, "money" ) - wantedCost )
						if vnxGetElementData ( source, "money" ) < 0 then
							vnxSetElementData ( source, "money", 0 )
						end
						outputChatBox ( "Der Gesuchte "..getPlayerName ( source ).." ist offline gegangen - er wird beim nächsten Einloggen im Knast sein.", cPlayer, 0, 125, 0 )
						vnxSetElementData ( cPlayer, "AnzahlEingeknastet", vnxGetElementData ( cPlayer, "AnzahlEingeknastet" ) + 1 )
						vnxSetElementData ( source, "AnzahlImKnast", vnxGetElementData ( source, "AnzahlImKnast" ) + 1 )
						offlinemsg ( "Du bist für "..(wanteds * math.ceil(jailtimeperwanted*1.2)).." Minuten im Gefängnis (Offlineflucht?)", "Server", getPlayerName(source) )
						break
					end
				end
			end
			if shootingRanchGun[source] then
				takeWeapon ( source, shootingRanchGun[source] )
			end
			shootingRanchGun[source] = {}
			local curWeaponsForSave = "|"
			for i = 1, 12 do
				if i ~= 10 and i ~= 12 then
					local weapon = getPedWeapon ( source, i )
					local ammo = getPedTotalAmmo ( source, i )
					if weapon and ammo then
						if weapon > 0 and ammo > 0 then
							if #curWeaponsForSave <= 40 then
								curWeaponsForSave = curWeaponsForSave..weapon..","..ammo.."|"
							end
						end
					end
				end
			end
			if #curWeaponsForSave > 1 then
				dbExec ( handler, "DELETE FROM logout WHERE UID = ?", playerUID[pname] )
				dbExec ( handler, "INSERT INTO logout (Position, Waffen, UID) VALUES (?,?,?)", 'false', curWeaponsForSave, playerUID[pname]) 
			end
		end
		hangup ( source )
		datasave_remote ( source )
		--addCommandHandler(dsavecom,savepdata)
		if vnxGetElementData ( source, "isInArea51Mission" ) then
			removeArea51Bots ( pname )
		end
		local veh = getPedOccupiedVehicle ( source )
		if veh then
			if isElement ( veh ) then
				if getElementModel(veh) == 502 then
					destroyElement ( veh )
				end
			end
		end
		killTimer ( _G[pname.."paydaytime"] )
		killTimer(achievmentChecker[pname])
		clearInv ( source )
		clearUserdata ( source )
		clearBonus ( source )
		clearPackage ( source )
		clearDataSettings ( source )
		saveLevelSystem(source)
	end
end
addEventHandler ("onPlayerQuit", getRootElement(), datasave )

function elementDataSettings ( player )

	local pname = getPlayerName ( player )
	vnxSetElementData ( player, "objectToPlace", false )
	vnxSetElementData ( player, "growing", false )
	vnxSetElementData ( player, "isInRace", false )
	vnxSetElementData ( player, "callswithpolice", false )
	vnxSetElementData ( player, "callswithmedic", false )
	vnxSetElementData ( player, "callswithmechaniker", false )
	vnxSetElementData ( player, "isLive", false )
	vnxSetElementData ( player, "isInArea51Mission", false )
	vnxSetElementData ( player, "armingBomb", false )
	vnxSetElementData ( player, "tied", true )
	vnxSetElementData ( player, "hasBomb", false )
	vnxSetElementData ( player, "wanzen", false )
	------------------
	
	local Weapon_Settings = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Spezial", "inventar", "UID", playerUID[pname] ), -1 )
	local shads = {}
	
	if not Weapon_Settings or not Weapon_Settings[1] then
		for i = 1, 6 do
			shads[i] = 0
		end
	else
		for i = 1, 6 do
			shads[i] = tonumber ( gettok ( Weapon_Settings[1]["Spezial"], i, string.byte( '|' ) ) )
		end
	end
	
		
	----------------	
	local ArmyPermissions = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "ArmyPermissions", "userdata", "UID", playerUID[pname] ), -1 )
	if ArmyPermissions and ArmyPermissions[1] then
		ArmyPermissions = ArmyPermissions[1]["ArmyPermissions"]
		for i = 1, 10 do
			local int = tonumber ( gettok ( ArmyPermissions, i, string.byte( '|' ) ) )
			if int then
				vnxSetElementData ( player, "armyperm"..i, int )
			else
				vnxSetElementData ( player, "armyperm"..i, 0 )
			end
		end
	else
		for i = 1, 10 do
			vnxSetElementData ( player, "armyperm"..i, 0 )
		end
	end
end

function saveArmyPermissions ( player )

	local pname = getPlayerName ( player )
	local empty = ""
	for i = 1, 10 do
		empty = empty.."|"..vnxGetElementData ( player, "armyperm"..i )
	end
	empty = empty.."|"
	dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "ArmyPermissions", empty, "UID", playerUID[pname] )
end


function SaveCarData ( player )

	local pname = getPlayerName ( player )
	dbExec ( handler, "UPDATE ?? SET ??=?, ??=?, ??=? WHERE ??=?", "userdata", "Geld", vnxGetElementData ( player, "money" ), "CurrentCars", vnxGetElementData ( player, "curcars" ), "MaximumCars", vnxGetElementData ( player, "maxcars" ), "UID", playerUID[pname] )
end



function datasave_remote ( player )
	
	local source = player
	if tonumber ( vnxGetElementData ( source, "loggedin" )) == 1 then
		local pname = getPlayerName ( source )	
		local fields = "SET"
		local getthelastskinid = tonumber(vnxGetElementData ( source, "skinid" ) )
		triggerClientEvent ( player, "SkinIDForLogin", getRootElement(), getthelastskinid )
		fields = fields.." Geld = '"..math.abs ( math.floor ( vnxGetElementData ( source, "money" ) ) ).."'"
		fields = fields..", Fraktion = '"..math.abs ( math.floor ( vnxGetElementData ( source, "fraktion") ) ).."'"
		fields = fields..", FraktionsRang = '"..math.floor ( vnxGetElementData ( source, "rang" ) ).."'"
		fields = fields..", Spielzeit = '"..math.floor ( vnxGetElementData ( source, "playingtime" ) ).."'"
		fields = fields..", Adminlevel = '"..math.floor ( vnxGetElementData ( source, "adminlvl" ) ).."'"
		fields = fields..", Hitglocke = '"..math.floor ( vnxGetElementData ( source, "hitglocke" ) ).."'"
		
		fields = fields..", hud = '"..math.floor ( getElementData ( source, "hud" ) ).."'"
		fields = fields..", promocode = '"..math.floor ( getElementData ( source, "promocode" ) ).."'"
		fields = fields..", promocode2 = '"..math.floor ( getElementData ( source, "promocode2" ) ).."'"
		fields = fields..", promocode3 = '"..math.floor ( getElementData ( source, "promocode3" ) ).."'"
		fields = fields..", promocode4 = '"..math.floor ( getElementData ( source, "promocode4" ) ).."'"
		fields = fields..", promocode5 = '"..math.floor ( getElementData ( source, "promocode5" ) ).."'"
		fields = fields..", promocode6 = '"..math.floor ( getElementData ( source, "promocode6" ) ).."'"
		fields = fields..", crosshair = '"..math.floor ( getElementData ( source, "crosshair" ) ).."'"
		--fields = fields..", hud = '"..math.floor ( vnxGetElementData ( source, "hud" ) ).."'"

		fields = fields..", CurrentCars = '"..math.floor ( vnxGetElementData ( source, "curcars" ) ).."'"
		fields = fields..", MaximumCars = '"..math.floor ( vnxGetElementData ( source, "maxcars" ) ).."'"
		fields = fields..", Knastzeit = '"..math.floor ( vnxGetElementData ( source, "jailtime" ) ).."'"
		fields = fields..", Prison = '"..math.floor ( vnxGetElementData ( source, "prison" ) ).."'"
		fields = fields..", Kaution = '"..math.floor ( vnxGetElementData ( source, "bail" ) ).."'"
		fields = fields..", Himmelszeit = '"..math.floor ( vnxGetElementData ( source, "heaventime" ) ).."'"
		fields = fields..", Hausschluessel = '"..math.floor ( vnxGetElementData ( source, "housekey" ) ).."'"
		fields = fields..", Bankgeld = '"..math.floor ( vnxGetElementData ( source, "bankmoney" ) ).."'"
		fields = fields..", Drogen = '"..math.floor ( vnxGetElementData ( source, "drugs" ) ).."'"
		fields = fields..", Skinid = '"..math.floor ( vnxGetElementData ( source, "skinid" ) ).."'"
		fields = fields..", Wanteds = '"..math.floor ( vnxGetElementData ( source, "wanteds" ) ).."'"
		fields = fields..", StvoPunkte = '"..math.floor ( vnxGetElementData ( source, "stvo_punkte" ) ).."'"
		fields = fields..", Boni = '"..math.floor ( vnxGetElementData ( source, "boni" ) ).."'"
		fields = fields..", PdayIncome = '"..math.floor ( vnxGetElementData ( source, "pdayincome" ) ).."'"
		fields = fields..", Warns = '"..math.floor ( vnxGetElementData ( source, "warns" ) ).."'"
		fields = fields..", Gunbox1 = '"..vnxGetElementData ( source, "gunboxa" ).."'"
		fields = fields..", Gunbox2 = '"..vnxGetElementData ( source, "gunboxb" ).."'"
		fields = fields..", Gunbox3 = '"..vnxGetElementData ( source, "gunboxc" ).."'"
		fields = fields..", Job = '"..vnxGetElementData ( source, "job" ).."'"
		fields = fields..", Jobtime = '"..math.floor ( vnxGetElementData ( source, "jobtime" ) ).."'"
		fields = fields..", Club = '"..vnxGetElementData ( source, "club" ).."'"
		fields = fields..", FavRadio = '"..math.floor ( vnxGetElementData ( source, "favchannel" ) ).."'"
		fields = fields..", Bonuspunkte = '"..math.floor ( vnxGetElementData ( source, "bonuspoints" ) ).."'"
		local skill = tonumber ( vnxGetElementData ( source, "truckerlvl" ) ) or 0
		fields = fields.." ,Coins = '"..vnxGetElementData ( source, "coins" ).."'"
		fields = fields..", Truckerskill = '"..skill.."'"
		fields = fields..", farmerLVL = '"..vnxGetElementData ( source, "farmerLVL" ).."'"
		fields = fields..", bauarbeiterLVL = '"..vnxGetElementData ( source, "bauarbeiterLVL" ).."'"
		fields = fields..", AirportLevel = '"..math.floor ( vnxGetElementData ( source, "airportlvl" ) ).."'"
		fields = fields..", Contract = '"..math.floor ( vnxGetElementData ( source, "contract" ) ).."'"
		fields = fields..", SocialState = '".. vnxGetElementData ( source, "socialState") .."'"
		fields = fields..", StreetCleanPoints = '"..math.floor ( vnxGetElementData ( source, "streetCleanPoints" ) ).."'"
		fields = fields..", geschenk = '"..vnxGetElementData ( source, "geschenk" ).."'"
		fields = fields..", PremiumPaket = '"..vnxGetElementData ( source, "Paket" ).."'"
		fields = fields..", PremiumData = '"..vnxGetElementData ( source, "PremiumData" ).."'"

		--fields = fields..", RP = '"..g_EXP:getPlayerEXP(source).."'"
		
		local v1 = "|"..vnxGetElementData ( source, "handyType" ).."|"
		local v2 = vnxGetElementData ( source, "handyCosts" ).."|"
		local v3 = v1..v2
		fields = fields..", Handy = '"..v3.."'"
		dbExec ( handler, "UPDATE userdata "..fields.." WHERE UID=?", playerUID[pname] )
		
		-- EXP: Clean Up!
		--g_EXP.m_Players[source] = nil

		saveAddictionsForPlayer ( source )
		inventorysave(source)
		saveLevelSystem(source)
		saveLevelSystem(player)
		skillDataSave ( player )
		saveArmyPermissions ( player )
		saveStatisticsMySQL ( player )
		outputDebugString ("Daten für Spieler "..pname.." wurden gesichert!")
	end
end


function saveLevelSystem ( player )
	local pname = getPlayerName ( player )
	dbExec ( handler,"UPDATE ?? SET ??=?, ??=?, ??=?, ??=? WHERE ??=?", "levelsystem", "MainXP", tonumber(vnxGetElementData ( player, "MainXP" )), "MainLevel", tonumber(vnxGetElementData ( player, "MainLevel" )), "GWXP", tonumber(vnxGetElementData ( player, "GWXP" )), "GWLevel", tonumber(vnxGetElementData ( player, "GWLevel" )), "UID", playerUID[pname])
end


function inventorysave ( player )
	local pname = getPlayerName ( player )	
	dbExec ( handler, "UPDATE ?? SET ??=?, ??=?, ??=?, ??=?, ??=?, ??=?, ??=?, ??=?, ??=?, ??=?, ??=?, ??=? WHERE ??=?", "inventar", "Blumensamen", vnxGetElementData ( player, "flowerseeds" ), "Essensslot1", vnxGetElementData ( player, "food1" ), "Essensslot2", vnxGetElementData ( player, "food2" ), "Essensslot3", vnxGetElementData ( player, "food3" ), "Zigaretten", vnxGetElementData ( player, "zigaretten" ), "Materials", vnxGetElementData ( player, "mats" ), "Koks", vnxGetElementData ( player, "koks" ), "Benzinkanister", vnxGetElementData ( player, "benzinkannister" ), "Objekt", vnxGetElementData ( player, "object" ), "Chips", vnxGetElementData ( player, "casinoChips" ), "Medikit", vnxGetElementData ( player, "medikits" ), "Repairkit", vnxGetElementData ( player, "repairkits" ), "UID", playerUID[pname] )
end

function casinoMoneySave ( player )

	if vnxGetElementData ( player, "loggedin" ) == 1 then
		local name = getPlayerName ( player )
		local chips = math.abs ( math.floor ( vnxGetElementData ( player, "casinoChips" ) ) )
		local money = math.floor ( vnxGetElementData ( player, "money" ) )
		local bankMoney = math.floor ( vnxGetElementData ( player, "bankmoney" ) )
		dbExec ( handler,"UPDATE userdata SET ??=?, ??=? WHERE UID=?", "Geld", money, "Bankgeld", bankMoney, playerUID[name] )
		dbExec ( handler, "UPDATE inventar SET Chips=? WHERE UID=?", chips, playerUID[name] )
	end
end

function getDataLevelSystem ( player )
	local pname = getPlayerName ( player )
	local result = dbPoll ( dbQuery ( handler, "SELECT * from levelsystem WHERE UID = ?", playerUID[pname] ), -1 )
	if result then
		if result[1] then
			dsatz = result[1]
		else
			outputDebugString ( "Spieler in Level-Datenbank nicht gefunden!" )
			return false
		end
			vnxSetElementData ( player, "MainXP",  tonumber(dsatz["MainXP"]))
			vnxSetElementData ( player, "MainLevel", tonumber(dsatz["MainLevel"]))
			vnxSetElementData ( player, "GWXP", tonumber(dsatz["GWXP"]))
			vnxSetElementData ( player, "GWLevel", tonumber(dsatz["GWLevel"]))
		
		--	outputChatBox("XP: ".. tonumber(dsatz["MainXP"]).."- Level: ".. tonumber(dsatz["MainLevel"]))
	end
end

-- Info: Angabe von Last_Login in Tagen seit Jahresanfang, Angabe von Geschlecht in 1 u. 0 - 1 = Weiblich, 0 = männlich
-- Anreise in 1 u. 0, 0 = Schiff, 1 = Flugzeug
-- Scheine: 0 = nicht vorhanden, 1 = vorhanden

function logoutPlayer_func ( player, x, y, z, int, dim )

	local client = player
	if vnxGetElementData ( client, "shootingRanchGun" ) then

	else
		local pname = getPlayerName ( client )
		local int = tonumber ( int )
		local dim = tonumber ( dim )
		local curWeaponsForSave = "|"
		for i = 1, 11 do
			if i ~= 10 then
				local weapon = getPedWeapon ( client, i )
				local ammo = getPedTotalAmmo ( client, i )
				if weapon and ammo then
					if weapon > 0 and ammo > 0 then
						if #curWeaponsForSave <= 40 then
							curWeaponsForSave = curWeaponsForSave..weapon..","..ammo.."|"
						end
					end
				end
			end
		end
		pos = "|"..(math.floor(x*100)/100).."|"..(math.floor(y*100)/100).."|"..(math.floor(z*100)/100).."|"..int.."|"..dim.."|"
		if #curWeaponsForSave < 5 then
			curWeaponsForSave = ""
		end
		local result = dbExec ( handler,"INSERT INTO logout (Position, Waffen, UID) VALUES (?,?,?)", pos, curWeaponsForSave, playerUID[pname] )
		kickPlayer ( client, "Ausgeloggt." )
		saveLevelSystem(client)
	end
end
addEvent ( "logoutPlayer", true )
addEventHandler ( "logoutPlayer", getRootElement(), logoutPlayer_func )


function contact_admins_helpwindow( player )
	for _, admin in pairs(getElementsByType("player")) do
		if getElementData(admin, "loggedin") == 1 then 
			if (vnxGetElementData ( admin, "adminlvl" ) >= 2) then
				outputChatBox("Der Spieler ".. getPlayerName(player) .." Braucht Hilfe beim Einloggen. ", admin, 0, 220, 255)
				outputChatBox("Bitte im Ts3 in den Support Räumen auf : ".. getPlayerName(player) .." achten !", admin, 0, 220, 255)
			end
		end
	end
end
addEvent ( "contact_admins_help", true )
addEventHandler ( "contact_admins_help", getRootElement(), contact_admins_helpwindow )