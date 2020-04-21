----------------------------
----- Gangwar - Script -----
--------- by Bonus ---------
-- Urheberrecht bei Bonus --
---- Hochladen verboten ----
-- Weiterschicken verboten -
------ Klauen verboten -----
----------------------------

addEvent ( "rechneKILLAnServer", true )
addEvent ( "gangAttack", true )
addEvent ( "triggerActualVehiclePositionForGangwar", true )

--------------------------
-- Tabellen & Variablen --
--------------------------

--- EINSTELLBAR ---

-- Einkommen & Bonus --
local minanzahlfuerbonus = 3   							-- Wieviele Spieler mindestens online sein müssen für die Boni
local hoherbonus = 100    								-- Der höhere Bonus Mats/Drogen je Ganggebiet
local niedrigerbonus = 50    							-- Der niedrigere Bonus Mats/Drogen je Ganggebiet 
local geldbonusfuereroberung = 5000	    				-- Der Bonus (Geld), wenn man ein Gebiet erobert
local geldprodamageimgw = 9     						-- Geld pro Damage
local geldprokillimgw = 1000     						-- Geld pro Kill

-- Allgemeine Einstellungen zum Gangwar --
local maxanzahlanattacks = 8   							-- Maximale Anzahl an Attacks pro Tag
local minanzahlangwteilnehmern = 2   					-- Mindestanzahl an Spielern in beiden Frakis für Attack
local diegangwardimension = 18    						-- Die Dimension, in der der Gangwar stattfinden soll
local minutenzumgwsieg = 15    							-- Minuten zu Halten, um den Gangwar als Angreifer zu gewinnen
local vorbereitungszeit = 3    							-- Minuten zur Vorbereitung vor dem richtigen Gangwar
local reichweitezumtk = 15    							-- Mindestreichweite zum TK, um drin zu sein - ACHTUNG: Clientseitig auch ändern!
local minutennachgwwaffenbekommen = 2   				-- Nach wievielen Minuten nach dem Gangwar man die Waffen zurück bekommen soll. Wenn man nach dem GW sofort am Spawnpunkt spawnt am besten 0, andernfalls 2
local minRankzumattackgeben = 4  						-- MindestRank, um einer gegnerischen Fraktion ein Attack zu geben
local distanzzumtkfuerbeitreten = 200  					-- min. Distanz zum TK für /joinattack oder /defend
local minRankzumjoinerlaubnisgeben = 3 					-- Mindestrang, um einem gegnerischen Spieler Erlaubnis zum Joinen zu geben - Hohe Zahl eingeben, um es zu deaktivieren
local mindestrangzumattack = 3 							-- Mindestrang, um ein Gangwar starten zu können.
local minrangzumattackgeben = 3 						-- Mindestrang, um dem Gegner einen Attack zu geben.

-- Gangwar-Fahrzeuge --
local tkfahrzeug = 482  								-- Das Fahrzeug für den Totenkopf - 0 für keine
local helikopterid = 487  								-- Der Helikopter für den Gangwar - 0 für keine | ACHTUNG: Alle Helikopter im Gangwar werden gelöscht, falls helikopterid nicht 0 ist, also auch Fraktionsfahrhelikopter. Fraktionshelikopter also nur benutzen, falls Gangwarhelikopter nicht spawnen sollen ( also helikopterid = 0 )

-- Features --
local angreiferkannmehrsein = true    					-- Ob der Angreifer einer mehr als der Verteidiger sein darf
local verteidigerkannmehrsein = false    				-- Ob der Verteidiger einer mehr als der Verteidiger sein darf
local freezeautomatisch = true    						-- Ob die Fahrzeuge nach der Vorbereitung von selbst gebreakt werden sollen - ACHTUNG: Das Fahrzeug ist dann auch nicht abgeschlossen!
local spawnwegnachgw = true    							-- Ob der Spieler nach dem GW wieder am Spawnpunkt spawnen soll
local heilungvorgw = true     							-- Ob die Spieler vor GW Beginn geheilt werden sollen (Leben & Weste) 
local gebewaffenvorgw = false     						-- Ob man die Waffen von der Tabelle givenWeapons vor dem GW bekommen soll
local sofortigerabbruchbeinullverteidigern = true    	-- Ob der GW direkt für Angreifer gewonnen ist, wenn es keine lebenden Verteidiger im GW mehr gibt
local sofortigerabbruchbeinullangreifern = true     	-- Ob der GW direkt für Verteidiger gewonnen ist, wenn es keine lebenden Angreifer im GW mehr gibt



-- Nicht leerbare Variablen / Tabellen - Einstellbar nur für Scripter --

local blocked_cmds = {	["smoke"] = true, ["usedrugs"] = true, ["sellgun"] = true, ["eat"] = true,
	["internet"] = true, ["lay"] = true, ["ground"] = true, ["fish"] = true, ["premium"] = true,
	["quitjob"] = true, ["chairsit"] = true, ["drunk"] = true, ["crack"] = true, ["move"] = true,
	["goto"] = true, ["gethere"] = true, ["self"] = true, ["save"] = true, ["takekoks"] = true }
local gangColor = { [2] = { 160, 40, 40 },
                    [3] = { 255, 4, 4 },
                    [7] = { 255, 255, 0 },
                    [9] = { 100, 50, 50 },
					[12] = { 138, 43, 226 },
					[13] = { 0, 238, 0 },
					[14] = {0, 0, 0}}					
local gangCount = 0
local gangArea, gangPickup, gangAllow, allowTimer, erledigteStatistik, allowedToJoin = {}, {}, {}, {}, {}, {}
local gangAttacks = { [2] = maxanzahlanattacks, [3] = maxanzahlanattacks, [7] = maxanzahlanattacks, [9] = maxanzahlanattacks, [12] = maxanzahlanattacks, [13] = maxanzahlanattacks, [14] = maxanzahlanattacks }
local teamBlips = { [2] = {}, [3] = {}, [7] = {}, [9] = {}, [12] = {}, [13] = {}, [13] = {}, [14] = {} }
local allowedWeapons = { [22] = true, [23] = true, [24] = true, [29] = true, [30] = true,  
                         [31] = true, [33] = true, [44] = true, [45] = true }
local givenWeapons = { [24] = 90, [29] = 300, [31] = 450, [33] = 100 }
local gangareaWithHelicopter = {
	[20] = true }
local gangwarHelicopters = {
	{ ["model"] = helikopterid, ["x"] = -2630.29932, ["y"] = 1345.35999, ["z"] = 7.11159, ["rot"] = 270 },
	{ ["model"] = helikopterid, ["x"] = -2630.29932, ["y"] = 1348.35999, ["z"] = 7.11159, ["rot"] = 270 } }
factionGangAreas = { [2] = 0, [3] = 0, [7] = 0, [9] = 0, [12] = 0, [13] = 0, [14] = 0 }
										  
								  
-- zu leerende Tabellen / Variablen - Nicht einstellbar --

local gangData = { attacker = 0, defender = 0, attackeralive = 0, 
				   defenderalive = 0, attackerfrac, ownerfrac, clonepickup, clonearea, 
				   pickup }				   
local gangTimer = { victory, eroberung, start } 
local gangVehicles = {}
local gangAreaAttackbar = true
playerData = {}
local sortierteStatistikTabelle = {}
local spielerSitztImFahrzeug = {}
local vehiclePlayerMoving = {}
local spielerSitztImFahrzeugSitz = {}
local tkfahrzeugtabelle = {}
gangAreaUnderAttack, gangAreaUnderPreparation = false, false
local validID, validIDlast, zeitohnetk, gangwarstartzeit = 0, 0, 0, 0
local zuruckGebenTimer = nil



--------------------
-- Gangwargebiete --
--------------------

-- Gebiete erstellen --

addEventHandler ( "onResourceStart", resourceRoot, function ()
	local result = dbPoll ( dbQuery ( handler, "SELECT * from gangs WHERE Aktiviert = ?", "1" ), -1 )
	for i=1, #result do
		local row = result[i]
		gangCount = gangCount + 1
		local Besitzer = tonumber ( row["BesitzerFraktion"] )
		factionGangAreas[Besitzer] = factionGangAreas[Besitzer] + 1
		local Einnahmen = tonumber ( row["Einnahmen"] )
		local X1 = tonumber ( row["X1"] )
		local Y1 = tonumber ( row["Y1"] )
		local X2 = tonumber ( row["X2"] )
		local Y2 = tonumber ( row["Y2"] )
		local XS = math.abs(X1-X2)
		local YS = math.abs(Y1-Y2)	
		local X3 = tonumber ( row["X3"] )
		local Y3 = tonumber ( row["Y3"] )
		local Z3 = tonumber ( row["Z3"] )
		local Name = row["Name"]
		local r = gangColor[Besitzer][1]
		local g = gangColor[Besitzer][2]
		local b = gangColor[Besitzer][3]
		gangArea[gangCount] = createRadarArea ( X1, Y1, XS, YS, r, g, b, 130, root )		
		gangPickup[gangCount] = {
			["pickup"] = createPickup ( X3, Y3, Z3, 3, 1313, 1, 9999 ),
			["besitzer"] = Besitzer,
			["einnahmen"] = Einnahmen,
			["name"] = Name,
			["blocked"] = false,
			["original"] = row["ID"],
			["tkcolshape"] = createColSphere ( X3, Y3, Z3, reichweitezumtk ),
			["colshape"] = createColCuboid ( X1, Y1, -50, XS, YS, 7500 ) }	
		addEventHandler ( "onPickupHit", gangPickup[gangCount]["pickup"], gangPickupHit )
		addEventHandler ( "onColShapeHit", gangPickup[gangCount]["colshape"], gangAreaColShapeHit_func )
	end
	setTimer ( gangAreaEinnahmen, 60*60*1000, 0 )
end )


-- Einnahmen pro Ganggebiete ( jede Stunde ) --

function gangAreaEinnahmen ()
	local belohnungen = {}
	for index, _ in pairs ( gangAttacks ) do
		belohnungen[index] = { mats = 0, drogen = 0, geld = 0 }
	end
	for i = 1, gangCount do
		local besitzer = gangPickup[i]["besitzer"]
		if gangAttacks[besitzer] then
			local insmats = 0
			local insdrogen = 0
			local insgeld = 0
			if i <= math.floor ( 1 * ( gangCount / 4 ) ) then
				belohnungen[besitzer].mats = belohnungen[besitzer].mats + hoherbonus
			elseif i <= math.floor ( 2 * ( gangCount / 4 ) ) then
				belohnungen[besitzer].drogen = belohnungen[besitzer].drogen + hoherbonus
			elseif i <= math.floor ( 3 * ( gangCount / 4 ) ) then
				belohnungen[besitzer].mats = belohnungen[besitzer].drogen + niedrigerbonus
			else
				belohnungen[besitzer].drogen = belohnungen[besitzer].drogen + niedrigerbonus
			end
			belohnungen[besitzer].geld = belohnungen[besitzer].geld + gangPickup[i]["einnahmen"]
		end
	end
	for index, tables in pairs ( belohnungen ) do
		if getFactionMembersOnline ( index ) >= minanzahlfuerbonus then
			if tables.mats + tables.drogen + tables.geld > 0 then
				for playeritem, _ in pairs ( fraktionMembers[index] ) do
					outputChatBox ( "|___ Ganggebiete - Boni ___|", playeritem, 0, 200, 0 )
					outputChatBox ( " ", playeritem, 0, 0, 0 )
					outputChatBox ( "#C8C800Materialen: #35A327"..tables.mats, playeritem, 0, 0, 0, true )
					outputChatBox ( "#C8C800Drogen: #35A327"..tables.drogen.." Gramm", playeritem, 0, 0, 0, true )
					outputChatBox ( "#C8C800Geld: #35A327"..tables.geld.."$", playeritem, 0, 0, 0, true )
					outputChatBox ( "______________________", playeritem, 0, 200, 0 )
					triggerClientEvent ( playeritem, "kaching", playeritem )
				end
				factionDepotData["mats"][index] = factionDepotData["mats"][index] + tables.mats
				factionDepotData["drugs"][index] = factionDepotData["drugs"][index] + tables.drogen
				factionDepotData["money"][index] = factionDepotData["money"][index] + tables.geld
			end
		end
	end
end



-- ColShape und Pickup Hit --

function gangAreaColShapeHit_func ( hitElement )
	if getElementType ( hitElement ) == "player" and getElementDimension ( hitElement ) ~= diegangwardimension then
		infobox ( hitElement, "Du bist im\nGebiet der\n"..fraktionNames[getOwnerByColShape ( source )], 4000, 200, 200, 0 )
	end
end


function gangPickupHit ( hit )
	local id = getIDByPickup ( source )
	local bonus
	infobox ( player, "Dieses Ganggebiet\ngehört:\n"..fraktionNames[gangPickup[id]["besitzer"]], 4000, 200, 200, 0 )
	if i <= math.floor ( 1 * ( gangCount / 4 ) ) then
		bonus = hoherbonus .. " Materialien."
	elseif i <= math.floor ( 2 * ( gangCount / 4 ) ) then
		bonus = hoherbonus .. "g Drogen."
	elseif i <= math.floor ( 3 * ( gangCount / 4 ) ) then
		bonus = niedrigerbonus .. " Materialien."
	else
		bonus = niedrigerbonus .. "g Drogen."
	end
	outputChatBox ( "Einnahmen/Stunde: "..gangPickup[id]["einnahmen"].."$ und "..bonus, hit, 125, 125, 200 )
	local fraktion = vnxGetElementData ( hit, "fraktion" )
	if gangAttacks[fraktion] then
		if vnxGetElementData ( hit, "rang" ) >= 2 then
			outputChatBox ( "Tippe /attack, um einen Angriff zu starten!", hit, 150, 0, 0 )
		end
	end
end
	

	
-------------
-- Gangwar --
-------------

-- Attack-Start --
function funattack_func(player)
	-- Is any gangwar currently running or starting?
	if gangAreaAttackbar then
		if not gangAreaUnderAttack and not gangAreaUnderPreparation then
			gangAreaAttackbar = false

			-- Obtain players faction
			local attackerfrac = vnxGetElementData(player, "fraktion")
			if gangAttacks[attackerfrac] and vnxGetElementData(player, "rang") >= mindestrangzumattack then

				-- Is anyone near the 'Totenkopf'
				local success = false
				local x1, y1, z1 = getElementPosition(player)
				for i = 1, gangCount, 1 do 
					local x2, y2, z2 = getElementPosition(gangPickup[i]["pickup"])
					if getDistanceBetweenPoints3D(x1, y1, z1, x2, y2, z3) <= 3 then
						validID = i
						validIDlast = i
						success = true
						break
					end
				end

				-- Proceed the fun gangwar
				if success then
					local ownerfrac = gangPickup[validID]["besitzer"]
					if ownerfrac ~= attackerfrac then
						
					end
				end
			end
		end
	end
end


function gangattack_func ( player )
	if gangAreaAttackbar then
		if not gangAreaUnderPreparation and not gangAreaUnderAttack then
			gangAreaAttackbar = false
			local attackerfrac = vnxGetElementData ( player, "fraktion" )
			if gangAttacks[attackerfrac] and vnxGetElementData ( player, "rang" ) >= mindestrangzumattack then
				local x1, y1, z1 = getElementPosition ( player )
				sucess = false
				for i = 1, gangCount do
					local x2, y2, z2 = getElementPosition ( gangPickup[i]["pickup"] )
					if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 3 then
						validID = i
						validIDlast = i
						sucess = true
						break
					end
				end
				if sucess then
					local ownerfrac = gangPickup[validID]["besitzer"]
					if gangAttacks[attackerfrac] > 0 or gangAllow[attackerfrac..ownerfrac] then
						if not gangPickup[validID]["blocked"] then
							if ownerfrac ~= attackerfrac then
								if getFactionMembersOnline ( ownerfrac ) >= minanzahlangwteilnehmern and getFactionMembersOnline( attackerfrac ) >= minanzahlangwteilnehmern then 
									gangData.attackerfrac = attackerfrac
									gangData.ownerfrac = ownerfrac
									gangAllow[attackerfrac..ownerfrac] = nil
									if isTimer ( allowTimer[attackerfrac..ownerfrac] ) then
										killTimer ( allowTimer[attackerfrac..ownerfrac] )
									end
									gangAttacks[attackerfrac] = gangAttacks[attackerfrac] - 1
									startGangAreaAttack ( )	
									infobox ( player, "Die Vorbereitung\nfür das Gangwar\nist gesatrtet!", 4000, 0, 155, 0 )
									return true
								else
									infobox ( player, "Min. "..minanzahlangwteilnehmern.." Spieler\nonline in\nbeiden Fraktionen!", 4000, 155, 0, 0 )
								end
							else
								infobox ( player, "Du kannst nicht\ndein eigenes\nGebiet angreifen!", 4000, 155, 0, 0 )
							end
						else
							infobox ( player, "Das Gebiet\nwurde schon\nmal angegriffen!", 4000, 155, 0, 0 )
						end
					else
						infobox ( player, "Ihr habt kein\nAttack frei!", 4000, 155, 0, 0 )
					end
				else
					infobox ( player, "Du bist an\nkeinem Totenkopf", 4000, 155, 0, 0 )
				end				
			else
				infobox ( player, "Ab Rang "..mindestrangzumattack.."\neiner bösen Fraktion!", 4000, 155, 0, 0 )
			end
			gangAreaAttackbar = true
		else
			infobox ( player, "Es läuft\nschon ein\nGangwar!", 4000, 155, 0, 0 )
		end
	else
		infobox ( player, "Versuch es in\npaar Minuten\nerneut.", 4000, 155, 0, 0 )
		if not gangAreaUnderAttack and not gangAreaUnderPreparation and not isTimer ( zuruckGebenTimer ) then
			gangAreaAttackbar = true
		end
	end
end


function startGangAreaAttack ( )
	gangAreaUnderPreparation = true
	gangData.clonearea = cloneElement ( gangArea[validID] )
	gangData.clonepickup = cloneElement ( gangPickup[validID]["pickup"]  )
	setElementDimension ( gangData.clonearea, diegangwardimension )
	setElementDimension ( gangData.clonepickup, diegangwardimension )
	outputChatBox ( "Ein Gangwar wird vorbereitet!", getRootElement(), 255, 0, 0 )
	outputLog ( fraktionNames[gangData.attackerfrac].." vs "..fraktionNames[gangData.ownerfrac], "gangwar" )
	playerData = {}
	for key, thePlayer in pairs ( getElementsWithinColShape ( gangPickup[validID]["colshape"], "player" ) ) do
		if vnxGetElementData ( thePlayer, "fraktion" ) == gangData.attackerfrac then
			if ( angreiferkannmehrsein and gangData.attacker <= getFactionMembersOnline ( gangData.ownerfrac ) ) or ( not angreiferkannmehrsein and gangData.attacker < getFactionMembersOnline ( gangData.ownerfrac ) ) then
				gangData.attacker = gangData.attacker + 1
				gangwarPreparation ( thePlayer )
			else
				infobox ( thePlayer,"Ihr seid\nschon genug!",120,0,0)
			end
		end
	end
	gangData.attackeralive = gangData.attacker
	createVehicles ()
	for playeritem, tables in pairs ( playerData ) do
		local player = getPlayerFromName ( playeritem )
		if isElement ( player ) and tables["imGW"] then
			triggerClientEvent ( player, "updateAnzeigePrepare", player, 60*vorbereitungszeit, gangData.attacker, gangData.attackerfrac, gangData.ownerfrac, gangPickup[validID]["pickup"] )
		end
	end
	gangTimer.start = setTimer ( function ()
		gangwarstartzeit = getRealTime().timestamp
		for playeritem, tables in pairs ( playerData ) do
			local player = getPlayerFromName ( playeritem )
			if isElement ( player ) and tables["imGW"] then 
				triggerClientEvent ( player, "updateAnzeigeStart", player, 60*minutenzumgwsieg, gangData.attackeralive, gangData.attacker )
				setPedAnimation ( player )
				if heilungvorgw then
					setElementHealth( player, 100 )
					setPedArmor( player, 100 )
				end
				setElementHunger ( player, 100 )
				addEventHandler ( "onPlayerCommand", player, disableBlockedCMD )
			end			
			removeEventHandler ( "onPlayerClick", player, moveVehicleInGangwar )
		end
		gangAreaUnderAttack = true
		gangAreaUnderPreparation = false
		for index, vehicle in pairs ( gangVehicles ) do
			if freezeautomatisch then
				if isVehicleOccupied ( vehicle ) then
					for seat, thePlayer in pairs ( getVehicleOccupants ( vehicle ) ) do
						if thePlayer and getElementType ( thePlayer ) == "player" then
							removePedFromVehicle ( thePlayer ) 
						end
					end
				end
				if getVehicleType ( vehicle ) ~= "Helicopter" then
					setElementFrozen ( vehicle, true )
					setVehicleLocked ( vehicle, true )
				end
			end
			if getVehicleType ( vehicle ) == "Helicopter" then
				setElementFrozen ( vehicle, false )
			end
			fixVehicle ( vehicle )
		end
		setRadarAreaFlashing ( gangArea[validID], true )
		setRadarAreaColor ( gangArea[validID], 125, 0, 0, 200 )
		setRadarAreaFlashing ( gangData.clonearea, true )
		setRadarAreaColor ( gangData.clonearea, 125, 0, 0, 200 )
		gangTimer.eroberung = setTimer ( areaEroberungsCheck, 5000, 0 )
		gangTimer.victory = setTimer ( gangwarAttackerGewonnen, minutenzumgwsieg*60*1000+50, 1 )
		sendMSGForFaction ( "Die "..fraktionNames[gangData.attackerfrac].." greifen euer Gebiete "..gangPickup[validID]["name"].." an!", gangData.ownerfrac, 150, 0, 0 )
		sendMSGForFaction ( "Verteidigt es mit /defend oder ihr werdet es verlieren! /gwbefehle für alle Befehle.", gangData.ownerfrac, 150, 0, 0 )
		if gangareaWithHelicopter[gangPickup[validID]["original"]] then
			sendMSGForFaction ( "Die Helikopter sind am Jizzy's!", gangData.ownerfrac, 150, 0, 0 )
		end
		sendMSGForFaction ( "Ihr habt "..gangPickup[validID]["name"].." von "..fraktionNames[gangData.ownerfrac].." angegriffen! /gwbefehle für alle Befehle.", gangData.attackerfrac, 0, 150, 0 )
		sendMSGForFaction ( "Haltet sie "..minutenzumgwsieg.." Minuten lang vom Totenkopf fern, um das Gebiet zu erobern!", gangData.attackerfrac, 0, 150, 0 )
		local msg = "[INFO]: Die "..fraktionNames[gangData.attackerfrac].." haben einen Gangwar gegen die "..fraktionNames[gangData.ownerfrac].." gestartet!"
		for index, _ in pairs ( gangAttacks ) do
			if index ~= gangData.attackerfrac and index ~= gangData.ownerfrac then
				sendMSGForFaction ( msg, index, 100, 100, 0 )
			end
		end
	end, 1000 * vorbereitungszeit * 60+100, 1 )
end



-- Gangwar jede 5 Sekunden überprüfen --

function areaEroberungsCheck ( )
	local suc = false
	local x1, y1, z1 = getElementPosition ( gangPickup[validID]["pickup"] )
	for index, player in pairs ( getElementsWithinColShape ( gangPickup[validID]["tkcolshape"], "player" ) ) do
		if vnxGetElementData ( player, "fraktion" ) == gangData.attackerfrac then	
			local pname = getPlayerName ( player )
			if playerData[pname] and playerData[pname]["imGW"] then
				suc = true
				if zeitohnetk > 0 then
					zeitohnetk = 0
					sendMSGForFaction ( "TK ist wieder besetzt!", gangData.attackerfrac, 0, 150, 0 )
				end
				break
			end
		end
	end
	if not suc then
		zeitohnetk = zeitohnetk+1
		if zeitohnetk == 1 then
			sendMSGForFaction ( "Keiner ist am TK! Ihr habt noch 15 Sekunden!", gangData.attackerfrac, 150, 0, 0 )
		elseif zeitohnetk == 2 then
			sendMSGForFaction ( "Ihr habt noch 10 Sekunden!", gangData.attackerfrac, 150, 0, 0 )
		elseif zeitohnetk == 3 then
			sendMSGForFaction ( "Noch 5 Sekunden!", gangData.attackerfrac, 150, 0, 0 )
		elseif zeitohnetk == 4 then
			gangwarDefenderGewonnen ()
		end
	end
end



-- Wenn jemand das GW gewinnt --

function gangwarDefenderGewonnen ()
	local r = gangColor[gangData.ownerfrac][1]
	local g = gangColor[gangData.ownerfrac][2]
	local b = gangColor[gangData.ownerfrac][3]
	setRadarAreaColor ( gangArea[validID], r, g, b, 225 )
	sortierePlayerDataTabelle ()
	sendMSGForFaction ( "Gebiet erfolgreich gegen die "..fraktionNames[gangData.attackerfrac].." verteidigt!", gangData.ownerfrac, 0, 150, 0 )
	outputLog ( "Gebiet erfolgreich gegen die "..fraktionNames[gangData.attackerfrac].." verteidigt!", "gangwar" )
	outputChatBox ( "[INFO]: Die "..fraktionNames[gangData.ownerfrac].." haben ihr Gebiet "..gangPickup[validID]["name"].." erfolgreich gegen die "..fraktionNames[gangData.attackerfrac].." verteidigt!", root, 100, 150, 0 )
	gangPickup[validID]["blocked"] = true
	for playeritem, tables in pairs ( playerData ) do
		local player = getPlayerFromName ( playeritem )
		if isElement ( player ) and tables["imGW"] and spawnwegnachgw then
			spawnPlayerAfterGangwar ( player )
			gotLastHit[player] = 0
		elseif isElement ( player ) and tables["imGW"] then
			setElementDimension ( player, 0 )
			gotLastHit[player] = 0
		end
		if isElement ( player ) and vnxGetElementData ( player, "fraktion" ) == gangData.attackerfrac then
			vnxSetElementData ( player, "AnzahlGangwarsVerloren", ( vnxGetElementData ( player, "AnzahlGangwarsVerloren" ) or 0 ) + 1 )
		elseif isElement ( player ) then
			vnxSetElementData ( player, "AnzahlGangwarsGewonnen", ( vnxGetElementData ( player, "AnzahlGangwarsGewonnen" ) or 0 ) + 1 )
		end
	end
	zuruckGebenTimer = setTimer ( function()
		for playeritem, tables in pairs ( playerData ) do
			local player = getPlayerFromName ( playeritem )
			if isElement ( player ) then
				removeEventHandler ( "onPlayerQuit", player, gangwarOfflinefunc )
				removeEventHandler ( "onPlayerCommand", player, disableBlockedCMD )
				local kriegtwaffe = false
				for weapon, ammo in pairs ( tables["weapons"] ) do
					if allowedWeapons[weapon] then
						if not tables["died"] then
							giveWeapon ( player, weapon, ammo )
						end
					else
						giveWeapon ( player, weapon, ammo )
					end
					if ammo > 0 then
						kriegtwaffe = true
					end
				end
				if kriegtwaffe then
					outputChatBox("Du hast deine Waffen zurück bekommen!", player, 200, 200, 0)
				end
				outputChatBox ( "Damage - " .. math.floor ( tables["damage"] ) .. " | Kills - " .. tables["kills"], player, 0, 255, 0 )
				infobox ( player, "Bonus:\n".. ( math.floor ( tables["damage"] ) * geldprodamageimgw ) + ( tables["kills"] * geldprokillimgw ).. "$", 4000, 0, 120, 0 )
				givePlayerSaveMoney ( player, math.floor( tables["damage"] * geldprodamageimgw ) + ( tables["kills"] * geldprokillimgw ) )
				outputDebugString("Funktion wurde aufgerufen und gesaved")
				local dmggemacht = tonumber(vnxGetElementData ( player, "GangwarDamageGemacht" ))
				local gwkills = tonumber(vnxGetElementData ( player, "GangwarKills"))
				local gwtode = tonumber(vnxGetElementData ( player, "GangwarTode" ))
				dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "gwkills", gwkills, "UID", playerUID[getPlayerName(player)] )
				dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "gwtode", gwtode, "UID", playerUID[getPlayerName(player)] )
				dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "gwdamage", dmggemacht + math.floor(tables["damage"]) , "UID", playerUID[getPlayerName(player)] )
			end
		end
		gangAreaAttackbar = true
	end, minutennachgwwaffenbekommen*60*1000+50, 1 ) 
	emptyEverythingForNewGW ()	
end


function gangwarAttackerGewonnen () 
	local r = gangColor[gangData.attackerfrac][1]
	local g = gangColor[gangData.attackerfrac][2]
	local b = gangColor[gangData.attackerfrac][3]
	setRadarAreaColor ( gangArea[validID], r, g, b, 200 )
	sortierePlayerDataTabelle ()
	sendMSGForFaction ( "Ihr habt euer Gebiet an die "..fraktionNames[gangData.attackerfrac].." verloren!", gangData.ownerfrac, 150, 0, 0 )
	outputLog ( "Gebiet gegen die "..fraktionNames[gangData.attackerfrac].." verloren!", "gangwar" )
	outputChatBox ( "[INFO]: Die "..fraktionNames[gangData.attackerfrac].." haben das Gebiet "..gangPickup[validID]["name"].." der "..fraktionNames[gangData.ownerfrac].." erfolgreich erobert!", root, 150, 100, 0 )
	gangPickup[validID]["blocked"] = true
	factionGangAreas[gangData.ownerfrac] = factionGangAreas[gangData.ownerfrac] - 1
	factionGangAreas[gangData.attackerfrac] = factionGangAreas[gangData.attackerfrac] + 1
	gangPickup[validID]["besitzer"] = gangData.attackerfrac
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ?? = ?", "gangs", "BesitzerFraktion", gangData.attackerfrac, "ID", gangPickup[validID]["original"] )
	for playeritem, tables in pairs ( playerData ) do
		local player = getPlayerFromName ( playeritem )
		if isElement ( player ) and vnxGetElementData ( player, "fraktion" ) == gangData.attackerfrac then
			givePlayerSaveMoney ( player, geldbonusfuereroberung )
			triggerClientEvent ( player, "achievsound", player )
		end
		if tables["imGW"] and spawnwegnachgw then
			tables["imGW"] = false
			spawnPlayerAfterGangwar ( player )
			gotLastHit[player] = 0
		elseif tables["imGW"] then
			setElementDimension ( player, 0 )
			gotLastHit[player] = 0
		end
		if isElement ( player ) and vnxGetElementData ( player, "fraktion" ) == gangData.attackerfrac then
			vnxSetElementData ( player, "AnzahlGangwarsGewonnen", ( vnxGetElementData ( player, "AnzahlGangwarsGewonnen" ) or 0 ) + 1 )
		elseif isElement ( player ) then
			vnxSetElementData ( player, "AnzahlGangwarsVerloren", ( vnxGetElementData ( player, "AnzahlGangwarsVerloren" ) or 0  ) + 1 )
		end
	end
	zuruckGebenTimer = setTimer ( function()
		for playeritem, tables in pairs ( playerData ) do
			local player = getPlayerFromName ( playeritem )
			if isElement ( player ) then
				removeEventHandler ( "onPlayerQuit", player, gangwarOfflinefunc )
				removeEventHandler ( "onPlayerCommand", player, disableBlockedCMD )
				local kriegtwaffe = false
				for weapon, ammo in pairs ( tables["weapons"] ) do
					if allowedWeapons[weapon] then
						if not tables["died"] then
							giveWeapon ( player, weapon, ammo )
						end
					else
						giveWeapon ( player, weapon, ammo )
					end
					if ammo > 0 then
						kriegtwaffe = true
					end
				end
				if kriegtwaffe then
					outputChatBox("Du hast deine Waffen zurück bekommen!", player, 200, 200, 0)
				end
				outputChatBox ( "Damage - " .. math.floor ( tables["damage"] ) .. " | Kills - " .. tables["kills"], player, 0, 120, 0 )
				infobox ( player, "Bonus:\n".. ( math.floor ( tables["damage"] ) * geldprodamageimgw ) + ( tables["kills"] * geldprokillimgw ).. "$", 4000, 0, 120, 0 )
				givePlayerSaveMoney ( player, math.floor( tables["damage"] * geldprodamageimgw ) + ( tables["kills"] * geldprokillimgw ) )
				local dmggemacht = tonumber(vnxGetElementData ( player, "GangwarDamageGemacht" ))
				local gwkills = tonumber(vnxGetElementData ( player, "GangwarKills"))
				local gwtode = tonumber(vnxGetElementData ( player, "GangwarTode" ))
				dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "gwkills", gwkills, "UID", playerUID[getPlayerName(player)] )
				dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "gwtode", gwtode, "UID", playerUID[getPlayerName(player)] )
				dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "gwdamage", dmggemacht + math.floor(tables["damage"]) , "UID", playerUID[getPlayerName(player)] )
			end
		end
		gangAreaAttackbar = true
	end, 1000*minutennachgwwaffenbekommen*60+50, 1 ) 
	emptyEverythingForNewGW ()	
end



-- Gangwar-Fahrzeuge --

local function dontLetOthersUseIt ( player )
	if vnxGetElementData ( player, "fraktion" ) ~= gangData.ownerfrac then
		cancelEvent()
	end
end


function createVehicles ( )
	local counter = 0
	local x, y, z = getElementPosition ( gangPickup[validID]["pickup"] )
	if tkfahrzeug ~= 0 then
		counter = counter + 1
		gangVehicles[counter] = createVehicle ( tkfahrzeug, x-2, y-3, z+0.5 )
		tkfahrzeugtabelle[gangVehicles[counter]] = true
		counter = counter + 1
		gangVehicles[counter] = createVehicle ( tkfahrzeug, x-2, y+3, z+0.5 )
		tkfahrzeugtabelle[gangVehicles[counter]] = true
		counter = counter + 1
		gangVehicles[counter] = createVehicle ( tkfahrzeug, x+2, y-3, z+0.5 )
		tkfahrzeugtabelle[gangVehicles[counter]] = true
		counter = counter + 1
		gangVehicles[counter] = createVehicle ( tkfahrzeug, x+2, y+3, z+0.5 )
		tkfahrzeugtabelle[gangVehicles[counter]] = true
	end
	local ar, ag, ab = gangColor[gangData.attackerfrac][1], gangColor[gangData.attackerfrac][2], gangColor[gangData.attackerfrac][3]
	for _, vehicle in pairs ( gangVehicles ) do
		setElementDimension ( vehicle, diegangwardimension )
		setVehicleDamageProof ( vehicle, true )
		setVehicleColor ( vehicle, ar, ag, ab )
	end
	for _, vehicle in pairs ( getElementsWithinColShape ( gangPickup[validID]["colshape"], "vehicle" ) ) do
		if factionVehicles[gangData.attackerfrac][vehicle] then
			if isVehicleOnGround ( vehicle ) then
				for seat, occupant in pairs ( getVehicleOccupants ( vehicle ) ) do
					removePedFromVehicle ( occupant )
				end
				setElementDimension ( vehicle, diegangwardimension )
				fixVehicle ( vehicle )
				counter = counter + 1
				gangVehicles[counter] = vehicle
				setVehicleDamageProof ( vehicle, true )
			end
		end
	end
	if gangareaWithHelicopter[gangPickup[validID]["original"]] and helikopterid ~= 0 then
		for index, data in pairs ( gangwarHelicopters ) do
			counter = counter + 1
			gangVehicles[counter] = createVehicle ( data["model"], data["x"], data["y"], data["z"], 0, 0, data["rot"], fraktionNames[gangData.ownerfrac] )
			tkfahrzeugtabelle[gangVehicles[counter]] = true
			setVehicleColor ( gangVehicles[counter], gangColor[gangData.ownerfrac][1], gangColor[gangData.ownerfrac][2], gangColor[gangData.ownerfrac][3] )
			setElementFrozen ( gangVehicles[counter], true )
			addEventHandler ( "onVehicleStartEnter", gangVehicles[counter], dontLetOthersUseIt ) 
			setElementDimension ( gangVehicles[counter], diegangwardimension )
			setVehicleDamageProof ( gangVehicles[counter], true )
		end
	end
end


-- Lass Fahrzeug mit Maus verschieben --

function moveVehicleInGangwar ( button, state, element, x, y, z )
	if gangAreaUnderPreparation then
		if button == "left" then
			if state == "down" then
				if isElement ( element ) and getElementType ( element ) == "vehicle" then
					if not vehiclePlayerMoving[element] then
						if not isVehicleOccupied ( element ) then
							triggerClientEvent ( source, "moveVehicleInGangwar", source, element )	
							setElementCollisionsEnabled ( element, false )
							vehiclePlayerMoving[element] = source
						end
					end
				end
			end
		end
	end
end


addEventHandler ( "triggerActualVehiclePositionForGangwar", root, function ( vehicle, x, y, z, rz )
	setElementPosition ( vehicle, x, y, z )
	setElementRotation ( vehicle, 0, 0, rz )
	setElementCollisionsEnabled ( vehicle, true )
	vehiclePlayerMoving[vehicle] = nil
end )


function setBurritosBackInGangwar ( player )
	if gangAreaUnderPreparation and vnxGetElementData ( player, "fraktion" ) == gangData.attackerfrac then
		local x, y, z = getElementPosition ( gangPickup[validID]["pickup"] )
		setElementCollisionsEnabled ( gangVehicles[1], true )
		setElementCollisionsEnabled ( gangVehicles[2], true )
		setElementCollisionsEnabled ( gangVehicles[3], true )
		setElementCollisionsEnabled ( gangVehicles[4], true )
		setElementPosition ( gangVehicles[1], x-2, y-3, z+0.5 )
		setElementPosition ( gangVehicles[2], x-2, y+3, z+0.5 )
		setElementPosition ( gangVehicles[3], x+2, y-3, z+0.5 )
		setElementPosition ( gangVehicles[4], x+2, y+3, z+0.5 )
		sendMSGForFaction ( getPlayerName ( player ) .. " hat die Burritos respawnt", gangData.attackerfrac, 0, 200, 0 )
	end
end

	


-------------
-- SPIELER --
-------------

-- Spieler Vorbereitung für GW --

function gangwarPreparation ( player )
	if gangAreaUnderPreparation then
		if isPedInVehicle ( player ) then
			removePedFromVehicle ( player )		
		end
		addEventHandler ( "onPlayerClick", player, moveVehicleInGangwar )
	elseif isPedInVehicle ( player ) then
		local seat = getPedOccupiedVehicleSeat ( player )
		if seat == 0 then
			local vehicle = getPedOccupiedVehicle ( player )
			if factionVehicles[vnxGetElementData ( player, "fraktion")][vehicle] then
				isfracvehicle = true
				spielerSitztImFahrzeug[player] = vehicle
				spielerSitztImFahrzeugSitz[player] = 0
				for seat, occupant in pairs ( getVehicleOccupants ( vehicle ) ) do
					if seat ~= 0 then
						if vnxGetElementData ( occupant, "fraktion" ) == vnxGetElementData ( player, "fraktion" ) then
							if vnxGetElementData ( occupant, "fraktion" ) == gangData.ownerfrac then
								local alloweddefender = gangData.attacker
								if verteidigerkannmehrsein then
									alloweddefender = alloweddefender + 1
								end
								if ( gangData.defender < alloweddefender ) or allowedToJoin[player] then
									spielerSitztImFahrzeug[occupant] = vehicle
									spielerSitztImFahrzeugSitz[occupant] = seat
									gangwarDefend ( occupant )
								else
									removePedFromVehicle ( occupant )
									infobox ( player, "Ihr seid\nschon genug!", 3000, 155, 0, 0 )
								end
							elseif vnxGetElementData ( occupant, "fraktion" ) == gangData.attackerfrac then
								local allowedattacker = gangData.defender
								if angreiferkannmehrsein then
									allowedattacker = allowedattacker + 1
								end
								if ( gangData.attacker < allowedattacker ) or allowedToJoin[player] then
									spielerSitztImFahrzeug[occupant] = vehicle
									spielerSitztImFahrzeugSitz[occupant] = seat
									gangwarAttack ( occupant )
								else
									removePedFromVehicle ( occupant )
									infobox ( player, "Ihr seid\nschon genug!", 3000, 155, 0, 0 )
								end
							end
						else
							removePedFromVehicle ( occupant )
						end
					end
				end
				setElementDimension ( vehicle, diegangwardimension )
				gangVehicles[#gangVehicles+1] = vehicle
			else
				removePedFromVehicle ( player )	
			end
		end
	end
	local pname = getPlayerName ( player )
	if not playerData[pname] then
		playerData[pname] = {}
		playerData[pname]["name"] = pname
		vnxSetElementData ( player, "AnzahlGangwars", ( vnxGetElementData ( player, "AnzahlGangwars" ) or 0 ) + 1 )
	end
	playerData[pname]["imGW"] = true
	playerData[pname]["hatDMGbekommen"] = false
	playerData[pname]["damage"] = 0
	playerData[pname]["kills"] = 0
	playerData[pname]["attacker"] = ( vnxGetElementData ( player, "fraktion" ) == gangData.attackerfrac )
	playerData[pname]["weapons"] = {}
	playerData[pname]["died"] = false
	gotLastHit[player] = 0
	outputLog ( pname.." macht beim GW mit - "..tostring(playerData[pname]["attacker"]), "gangwar" )
	local frac = vnxGetElementData(player,"fraktion")
	if isElement ( teamBlips[frac][player] ) then
		destroyElement ( teamBlips[frac][player] )
	end
	teamBlips[frac][player] = createBlipAttachedTo ( player, 0, 1, 255, 0, 0, 255, 0, 99999, player )
	for playeritem, blip in pairs ( teamBlips[frac] ) do
		if isElement ( playeritem ) then
			setElementVisibleTo ( teamBlips[frac][player], playeritem, true )
			setElementVisibleTo ( blip, player, true )
		end
	end
	for i = 0, 12 do
		playerData[pname]["weapons"][getPedWeapon ( player,i )] = getPedTotalAmmo ( player, i )
	end
	takeAllWeapons ( player )
	triggerClientEvent ( player, "startGWAnzeige", player )
	local x, y, z = getElementPosition(player)
	local rx, ry, rz = getElementRotation(player)
	local theskin = getElementModel (player)
	local theteam = getPlayerTeam (player)
	spawnPlayer ( player, x, y, z, rz, theskin, 0, diegangwardimension, theteam )
	addEventHandler ( "onPlayerQuit", player, gangwarOfflinefunc )
	if not gebewaffenvorgw then
		for weapon, ammo in pairs ( playerData[pname]["weapons"] ) do
			if allowedWeapons[weapon] then
				giveWeapon ( player, weapon, ammo )	
			end
		end
	else
		for weapon, ammo in pairs ( givenWeapons ) do
			giveWeapon ( player, weapon, ammo )
		end
	end
	if spielerSitztImFahrzeug[player] then
		warpPedIntoVehicle ( player, spielerSitztImFahrzeug[player], spielerSitztImFahrzeugSitz[player] ) 
	end
	if heilungvorgw then
		setElementHealth( player, 100 )
		setPedArmor( player, 100 )
	end
	setElementHunger ( player, 100 )
end



-- Spieler Tod & Offline --

function gangwarDeathfunc ( attacker )
	local pname = getPlayerName ( client )
	if playerData[pname] and playerData[pname]["imGW"] then
		playerData[pname]["imGW"] = false
		playerData[pname]["died"] = true
		removeEventHandler ( "onPlayerQuit", client, gangwarOfflinefunc )
		removeEventHandler ( "onPlayerCommand", client, disableBlockedCMD )
		local frac = vnxGetElementData(client,"fraktion")
		if isElement ( teamBlips[frac][client] ) then
			destroyElement ( teamBlips[frac][client] )
			local x, y, z = getElementPosition ( client )
			teamBlips[frac][client] = createBlip ( x, y, z, 22, 1 )
			setElementDimension ( teamBlips[frac][client], diegangwardimension )
			setElementVisibleTo ( teamBlips[frac][client], root, false )
			for playeritem, blip in pairs ( teamBlips[frac] ) do
				if isElement ( playeritem ) then
					setElementVisibleTo ( teamBlips[frac][client], playeritem, true )
				end
			end
		end
		local isattacker = vnxGetElementData ( client, "fraktion" ) == gangData.attackerfrac
		if gangAreaUnderPreparation then
			if isattacker then
				gangData.attacker = gangData.attacker - 1
				gangData.attackeralive = gangData.attackeralive - 1
				for playeritem, tables in pairs ( playerData ) do
					local thePlayer = getPlayerFromName ( playeritem )
					if isElement ( thePlayer ) then
						triggerClientEvent ( thePlayer, "attackereinerofflineohnezaehlen", thePlayer )
					end
				end
				if sofortigerabbruchbeinullangreifern and gangData.attackeralive <= 0 then
					setTimer ( gangwarDefenderGewonnen, 1000, 1 )
				end
			else 
				gangData.defender = gangData.defender - 1
				gangData.defenderalive = gangData.defenderalive - 1
				for playeritem, tables in pairs ( playerData ) do
					local thePlayer = getPlayerFromName ( playeritem )
					if isElement ( thePlayer ) then
						triggerClientEvent ( thePlayer, "defendereinerofflineohnezaehlen", thePlayer )
					end
				end
				if sofortigerabbruchbeinullverteidigern and gangData.defenderalive <= 0 then
					setTimer ( gangwarAttackerGewonnen, 1000, 1 )
				end
			end
		elseif gangAreaUnderAttack then
			if isattacker then
				local gotnodmg = false
				gangData.attackeralive = gangData.attackeralive - 1
				if not playerData[pname]["hatDMGbekommen"] then
					gangData.attacker = gangData.attacker - 1
					gotnodmg = true
				end
				if gotnodmg then
					for thePlayer, tables in pairs ( playerData ) do
						local player = getPlayerFromName ( thePlayer )
						if player then
							triggerClientEvent ( player, "attackereinerofflineohnezaehlen", player )
						end
					end
				else
					for thePlayer, tables in pairs ( playerData ) do
						local player = getPlayerFromName ( thePlayer )
						if player then
							triggerClientEvent ( player, "attackereinergestorben", player )
						end
					end
				end
				if sofortigerabbruchbeinullangreifern and gangData.attackeralive <= 0 then
					setTimer ( gangwarDefenderGewonnen, 1000, 1 )
				end
			else 
				gangData.defenderalive = gangData.defenderalive - 1
				local gotnodmg = false
				if not playerData[pname]["hatDMGbekommen"] then
					gangData.defender = gangData.defender - 1
					gotnodmg = true
				end
				if gotnodmg then
					for thePlayer, tables in pairs ( playerData ) do
						local player = getPlayerFromName ( thePlayer )
						if player then
							triggerClientEvent ( player, "defendereinerofflineohnezaehlen", source )
						end
					end
				else
					for thePlayer, tables in pairs ( playerData ) do
						local player = getPlayerFromName ( thePlayer )
						if player then
							triggerClientEvent ( player, "defendereinergestorben", source )
						end
					end
				end
				if sofortigerabbruchbeinullverteidigern and gangData.defenderalive <= 0 then
					setTimer ( gangwarAttackerGewonnen, 1000, 1 )
				end
			end
			local attackername = getPlayerName ( attacker )
			if isElement ( attacker ) and getElementType ( attacker ) == "player" and attackername and playerData[attackername] and playerData[attackername]["imGW"] and vnxGetElementData ( attacker, "fraktion" ) ~= vnxGetElementData ( client, "fraktion" ) then
				playerData[attackername]["kills"] = playerData[attackername]["kills"] + 1
				vnxSetElementData ( attacker, "GangwarKills", ( vnxGetElementData ( attacker, "GangwarKills" ) or 0 ) + 1 )
				triggerClientEvent ( attacker, "rechneKillAn", attacker, playerData[attackername]["kills"] )
				if vnxGetElementData ( client, "lasthp" ) then
					triggerClientEvent ( attacker, "rechneDMGAn", attacker, vnxGetElementData ( client, "lasthp" ) )
					playerData[attackername]["damage"] = playerData[attackername]["damage"] + vnxGetElementData ( client, "lasthp" )
					vnxSetElementData ( attacker, "GangwarDamageGemacht", ( vnxGetElementData ( attacker, "GangwarDamageGemacht" ) or 0 ) + vnxGetElementData ( client, "lasthp" ) )
					vnxSetElementData ( client, "GangwarDamageBekommen", ( vnxGetElementData ( client, "GangwarDamageBekommen" ) or 0 ) + vnxGetElementData ( client, "lasthp" ) )
				end
				playerData[pname]["hatDMGbekommen"] = attacker	
			elseif playerData[pname]["hatDMGbekommen"] and playerData[playerData[pname]["hatDMGbekommen"]] then
				local attacker = playerData[pname]["hatDMGbekommen"]
				if isElement ( attacker ) then
					playerData[attackername]["kills"] = playerData[attackername]["kills"] + 1
					vnxSetElementData ( attacker, "GangwarKills", ( vnxGetElementData ( attacker, "GangwarKills" ) or 0 ) + 1 )
					triggerClientEvent ( attacker, "rechneKillAn", attacker, playerData[attackername]["kills"] )
				end
				playerData[pname]["hatDMGbekommen"] = true
				if vnxGetElementData ( client, "lasthp" ) then
					if isElement ( attacker ) then
						triggerClientEvent ( attacker, "rechneDMGAn", attacker, vnxGetElementData ( client, "lasthp" ) )
						playerData[attackername]["damage"] = playerData[attackername]["damage"] + vnxGetElementData ( client, "lasthp" )
						vnxSetElementData ( attacker, "GangwarDamageGemacht", ( vnxGetElementData ( attacker, "GangwarDamageGemacht" ) or 0 ) + vnxGetElementData ( client, "lasthp" ) )
					end
					vnxSetElementData ( client, "GangwarDamageBekommen", ( vnxGetElementData ( client, "GangwarDamageBekommen" ) or 0 ) + vnxGetElementData ( client, "lasthp" ) )
				end
			end
		end
		
		setElementDimension ( client, 0 )
		vnxSetElementData ( client, "GangwarTode", ( vnxGetElementData ( client, "GangwarTode" ) or 0 ) + 1 )
	end		
end
addEventHandler ( "rechneKILLAnServer", root, gangwarDeathfunc )


function gangwarOfflinefunc ( )
	local pname = getPlayerName ( source )
	if playerData[pname] then
		playerData[pname]["imGW"] = false
		if gebewaffenvorgw then
			takeAllWeapons ( source )
		end
		if isElement ( teamBlips[vnxGetElementData(source,"fraktion")][source] ) then
			destroyElement ( teamBlips[vnxGetElementData(source,"fraktion")][source] )
		end
		local isattacker = vnxGetElementData ( source, "fraktion" ) == gangData.attackerfrac
		if gangAreaUnderPreparation then
			if isattacker then
				gangData.attacker = gangData.attacker - 1
				gangData.attackeralive = gangData.attackeralive - 1
				for thePlayer, tables in pairs ( playerData ) do
					local player = getPlayerFromName ( thePlayer )
					if player then
						triggerClientEvent ( player, "attackereinerofflineohnezaehlen", player )
					end
				end
				if sofortigerabbruchbeinullangreifern and gangData.attackeralive <= 0 then
					setTimer ( gangwarDefenderGewonnen, 1000, 1 )
				end
			else 
				gangData.defender = gangData.defender - 1
				gangData.defenderalive = gangData.defenderalive - 1
				for thePlayer, tables in pairs ( playerData ) do
					local player = getPlayerFromName ( thePlayer )
					if player then
						triggerClientEvent ( player, "defendereinerofflineohnezaehlen", player )
					end
				end
				if sofortigerabbruchbeinullverteidigern and gangData.defenderalive <= 0 then
					setTimer ( gangwarAttackerGewonnen, 1000, 1 )
				end
			end
		elseif gangAreaUnderAttack then
			if isattacker then
				local gotnodmg = false
				gangData.attackeralive = gangData.attackeralive - 1
				if not playerData[pname]["hatDMGbekommen"] then
					gangData.attacker = gangData.attacker - 1
					gotnodmg = true
				end
				if gotnodmg then
					for thePlayer, tables in pairs ( playerData ) do
						local player = getPlayerFromName ( thePlayer )
						if player then
							triggerClientEvent ( player, "attackereinerofflineohnezaehlen", player )
						end
					end
				else
					for thePlayer, tables in pairs ( playerData ) do
						local player = getPlayerFromName ( thePlayer )
						if player then
							triggerClientEvent ( player, "attackereinergestorben", player )
						end
					end
				end
				if sofortigerabbruchbeinullangreifern and gangData.attackeralive <= 0 then
					setTimer ( gangwarDefenderGewonnen, 1000, 1 )
				end
			else 
				gangData.defenderalive = gangData.defenderalive - 1
				local gotnodmg = false
				if not playerData[pname]["hatDMGbekommen"] then
					gangData.defender = gangData.defender - 1
					gotnodmg = true
				end
				if gotnodmg then
					for thePlayer, tables in pairs ( playerData ) do
						local player = getPlayerFromName ( thePlayer )
						if player then
							triggerClientEvent ( player, "defendereinerofflineohnezaehlen", source )
						end
					end
				else
					for thePlayer, tables in pairs ( playerData ) do
						local player = getPlayerFromName ( thePlayer )
						if player then
							triggerClientEvent ( player, "defendereinergestorben", source )
						end
					end
				end
				if sofortigerabbruchbeinullverteidigern and gangData.defenderalive <= 0 then
					setTimer ( gangwarAttackerGewonnen, 1000, 1 )
				end
			end
		end
	end
end



-- Beim Gangwar mitmachen --

function gangwarDefend ( player )
	if gangAreaUnderAttack then
		if vnxGetElementData ( player, "fraktion" ) == gangData.ownerfrac then
			local x, y, z = getElementPosition ( gangPickup[validID]["pickup"] ) 
			local xp, yp, zp = getElementPosition ( player ) 
			if getDistanceBetweenPoints3D ( xp, yp, zp, x, y, z ) >= distanzzumtkfuerbeitreten then
				local alloweddefender = gangData.attacker
				if verteidigerkannmehrsein then
					alloweddefender = alloweddefender + 1
				end
				if ( gangData.defender < alloweddefender ) or allowedToJoin[player] then
					local pname = getPlayerName ( player )
					if not playerData[pname] or ( not playerData[pname]["hatDMGbekommen"] and not playerData[pname]["imGW"] ) or allowedToJoin[player] then
						allowedToJoin[player] = nil
						gangData.defender = gangData.defender + 1
						gangData.defenderalive = gangData.defenderalive + 1
						sendMSGForFaction ( getPlayerName ( player ) .. " macht bei der Verteidigung mit ("..gangData.defender.." von "..alloweddefender..")!", gangData.attackerfrac, 255, 20, 20 )
						sendMSGForFaction ( getPlayerName ( player ) .. " macht bei der Verteidigung mit ("..gangData.defender.." von "..alloweddefender..")!", gangData.ownerfrac, 20, 255, 20 )
						for thePlayer, tables in pairs ( playerData ) do
							local playeritem = getPlayerFromName ( thePlayer )
							if playeritem then
								triggerClientEvent ( playeritem, "defendereinerdazugekommen", playeritem )
							end
						end 
						gangwarPreparation ( player )
						triggerClientEvent ( player, "updateAnzeigeNachJoinen", player, 60*minutenzumgwsieg - (getRealTime().timestamp-gangwarstartzeit), gangData.attacker, gangData.attackeralive, gangData.defender, gangData.defenderalive, gangData.attackerfrac, gangData.ownerfrac, gangPickup[validID]["pickup"] )
					else
						infobox ( player, "Du warst bereits\nim Gangwar!", 4500, 255, 0, 0 )
					end
				else
					infobox ( player, "Ihr seid\nschon genug!", 4500, 255, 0, 0 )
				end	
			else
				infobox ( player, "Du bist zu\nnahe am TK!", 4500, 255, 0, 0 )
			end
		else
			infobox ( player, "Du gehörst nicht\nzu der vert.\nFraktion!", 4500, 255, 0, 0 )
		end
	else
		infobox ( player, "Es läuft\nkein Gangwar", 4500, 255, 0, 0 )
	end
end


function gangwarAttack ( player )
	if gangAreaUnderAttack then
		if vnxGetElementData ( player, "fraktion" ) == gangData.attackerfrac then
			local x, y, z = getElementPosition ( gangPickup[validID]["pickup"] ) 
			local xp, yp, zp = getElementPosition ( player ) 
			if getDistanceBetweenPoints3D ( xp, yp, zp, x, y, z ) >= distanzzumtkfuerbeitreten then
				local allowedattacker = gangData.defender
				if angreiferkannmehrsein then
					allowedattacker = allowedattacker + 1
				end
				if ( gangData.attacker < allowedattacker ) or allowedToJoin[player] then
					local pname = getPlayerName ( player )
					if not playerData[pname] or ( not playerData[pname]["hatDMGbekommen"] and not playerData[pname]["imGW"] ) or allowedToJoin[player] then
						allowedToJoin[player] = nil
						gangData.attacker = gangData.attacker + 1
						gangData.attackeralive = gangData.attackeralive + 1
						sendMSGForFaction ( getPlayerName ( player ) .. " macht beim Angriff mit ("..gangData.attacker.." von "..allowedattacker..")!", gangData.attackerfrac, 20, 255, 20 )
						sendMSGForFaction ( getPlayerName ( player ) .. " macht beim Angriff mit ("..gangData.attacker.." von "..allowedattacker..")!", gangData.ownerfrac, 255, 20, 20 )
						for thePlayer, tables in pairs ( playerData ) do
							local playeritem = getPlayerFromName ( thePlayer )
							if playeritem then
								triggerClientEvent ( playeritem, "attackereinerdazugekommen", playeritem )
							end
						end
						gangwarPreparation ( player )
						triggerClientEvent ( player, "updateAnzeigeNachJoinen", player, 60*minutenzumgwsieg - (getRealTime().timestamp-gangwarstartzeit), gangData.attacker, gangData.attackeralive, gangData.defender, gangData.defenderalive, gangData.attackerfrac, gangData.ownerfrac, gangPickup[validID]["pickup"] )
					else
						infobox ( player, "Du warst bereits\nim Gangwar!", 4500, 255, 0, 0 )
					end
				else
					infobox ( player, "Ihr seid\nschon genug!", 4500, 255, 0, 0 )		
				end
			else
				infobox ( player, "Du bist zu\nnahe am TK!", 4500, 255, 0, 0 )
			end
		else
			infobox ( player, "Du gehörst nicht\nzu der attk.\nFraktion!", 4500, 255, 0, 0 )
		end
	else
		infobox ( player, "Es läuft\nkein Gangwar", 4500, 255, 0, 0 )
	end
end




-- Unerlaubte Befehle sperren --

function disableBlockedCMD ( cmd )
	if getElementDimension ( source ) == diegangwardimension then
   	 	if blocked_cmds[cmd] then
    	    cancelEvent()
    	end
	else
		removeEventHandler ( "onPlayerCommand", source, disableBlockedCMD )
    end
end



---------------------
-- Hilfsfunktionen --
---------------------

-- Besitzer eines Gangwar-Gebietes durch Colshape herausfinden --

function getOwnerByColShape ( colshape )
	for index, tables in pairs ( gangPickup ) do
		if colshape == tables["colshape"] then
			return tables["besitzer"]
		end
	end
	return false
end



-- ID eines Pickups bekommen --

function getIDByPickup ( pickup )
	for index, tables in pairs ( gangPickup ) do 
		if tables["pickup"] == pickup then
			return index
		end
	end
	return false
end



-- Alles für den nächsten Gangwar leeren --

function emptyEverythingForNewGW ()
	setRadarAreaFlashing ( gangArea[validID], false )
	gangAreaUnderAttack, gangAreaUnderPreparation = false, false
	if gangData.clonepickup and isElement ( gangData.clonepickup ) then
		destroyElement ( gangData.clonepickup )
		destroyElement ( gangData.clonearea )
	end
	for i, array in pairs ( teamBlips ) do
		for _, blip in pairs ( array ) do
			if isElement ( blip ) then
				destroyElement ( blip )
			end
		end
	end
	teamBlips = { [2] = {}, [3] = {}, [7] = {}, [9] = {}, [12] = {}, [13] = {}, [14] = {} }
	gangData = { attacker = 0, defender = 0, attackeralive = 0, defenderalive = 0, 
				 attackerfrac, ownerfrac, clonepickup, clonearea, pickup }	
	for timervar, timer in pairs ( gangTimer ) do 
		if isTimer ( timer ) then
			killTimer ( timer )
		end
	end
	gangTimer = { victory, eroberung, start } 	
	for index, vehicle in pairs ( gangVehicles ) do
		setElementDimension ( vehicle, 0 )
		setVehicleLocked ( vehicle, false )
		setElementFrozen ( vehicle, false )
		setVehicleDamageProof ( vehicle, false )
	end
	for vehicle, _ in pairs ( tkfahrzeugtabelle ) do
		destroyElement ( vehicle )
	end
	erledigteStatistik, allowedToJoin, gangVehicles, tkfahrzeugtabelle, vehiclePlayerMoving = {}, {}, {}, {}, {}
	spielerSitztImFahrzeug, spielerSitztImFahrzeugSitz = {}, {}
	validID, zeitohnetk, gangwarstartzeit = 0, 0, 0
end	



-- Die Statistik sortieren --

function sortierePlayerDataTabelle ()
	local hilfsvariable = 1
	local hilfstabelle
	local erledigteStatistik = {}
	local theplayer = nil
	for _, _ in pairs ( playerData ) do
		for player, tables in pairs ( playerData ) do
			if not erledigteStatistik[player] then
				hilfstabelle = { ["player"] = tables["name"], ["damage"] = tables["damage"], ["kills"] = tables["kills"], ["attacker"] = tables["attacker"] }
				theplayer = player
				for player2, tables2 in pairs ( playerData ) do
					if not erledigteStatistik[player2] then
						if ( hilfstabelle["damage"] + hilfstabelle["kills"]*100 ) < ( tables2["damage"] + tables2["kills"]*100 ) then
							hilfstabelle = { ["player"] = tables2["name"], ["damage"] = tables2["damage"], ["kills"] = tables2["kills"], ["attacker"] = tables2["attacker"]  }
							theplayer = player2
						end
					end
				end
				erledigteStatistik[theplayer] = true
				sortierteStatistikTabelle[hilfsvariable] = { ["Player"] = hilfstabelle["player"], ["Damage"] = math.floor(hilfstabelle["damage"]), ["Kills"] = hilfstabelle["kills"], ["Attacker"] = hilfstabelle["attacker"] }
				hilfsvariable = hilfsvariable + 1
			end
		end
	end
	for player, tables in pairs ( playerData ) do
		local playeritem = getPlayerFromName ( player )
		if playeritem then
			triggerClientEvent ( playeritem, "stopGWAnzeige", playeritem, sortierteStatistikTabelle )
		end
	end
	sortierteStatistikTabelle = {}
end



-- Prüfen, ob jemand im Fahrzeug sitzt --

function isVehicleOccupied(vehicle)
    assert(isElement(vehicle) and getElementType(vehicle) == "vehicle", "Bad argument @ isVehicleOccupied [expected vehicle, got " .. tostring(vehicle) .. "]")
    local _, occupant = next(getVehicleOccupants(vehicle))
    return occupant and true, occupant
end



-- Fraktion durch Namen herausfinden --

local function getFactionByName ( name )
	if name and name ~= "" then
		local name = string.lower ( name )
		for i=1, #fraktionNames do
			local fname = string.lower ( fraktionNames[i] )
			if string.find ( fname, name ) then
				return i, fname 
			end
		end
	end
	return false
end


function spawnPlayerAfterGangwar ( player )
	if isElement ( player ) then
		local team = getPlayerTeam ( player )
		local skinid = getElementModel ( player )
		spawnPlayer ( player, vnxGetElementData ( player, "spawnpos_x" ), vnxGetElementData ( player, "spawnpos_y" ), vnxGetElementData ( player, "spawnpos_z" ), (vnxGetElementData ( player, "spawnrot_x" ) or 0), skinid, vnxGetElementData ( player, "spawnint" ), vnxGetElementData ( player, "spawndim" ), team ) 
	end
end



-------------
-- Befehle --
-------------

-- Ganggebiete anzeigen lassen --

function GangAreasOverview_func ( player )
	outputChatBox ( "Ganggebiete:", player, 200, 200, 0 )
	for i=1, gangCount do
		local name = gangPickup[i]["name"]
		local besitzer = gangPickup[i]["besitzer"]
		local r, g, b = 0, 150, 0
		if gangPickup[i]["blocked"] then
			r, g, b = 150, 0, 0
		end
		outputChatBox ( i..". "..name..": "..fraktionNames[besitzer]..", ", player, r, g, b )
	end					
end


-- Angriffsschutz eines Ganggebietes aktivieren / deaktivieren --

function setAreaBlocked_func ( player, cmd, area )
	if isAdminLevel ( player, 3 ) then
		if area and tonumber(area) and gangCount - tonumber(area) >= 0 then
			local area = tonumber ( area )
			local GanggebietName = gangPickup[area]["name"]
			if gangPickup[area]["blocked"] then
				gangPickup[area]["blocked"] = false
				outputChatBox ( "Du hast den Angriffsschutz von "..GanggebietName.." deaktiviert!", player, 200, 200, 0 )
				local msg = ""..getPlayerName ( player ).." hat den Angriffschutz von "..GanggebietName.." deaktiviert."
				for index, _ in pairs ( gangAttacks ) do
					sendMSGForFaction ( msg, index, 100, 100, 0 )
				end
			else
				gangPickup[area]["blocked"] = true
				outputChatBox ( "Du hast den Angriffsschutz von "..GanggebietName.." aktiviert!", player, 200, 200, 0 )
				local msg = ""..getPlayerName ( player ).." hat den Angriffschutz von "..GanggebietName.." aktiviert."
				for index, _ in pairs ( gangAttacks ) do
					sendMSGForFaction ( msg, index, 100, 100, 0 )
				end
			end
		else
			infobox ( player, "Gebrauch:\n/areareset [1-"..gangCount.."]!", 4000, 255, 0, 0 )
		end
	else
		infobox ( player, "Du bist\nnicht befugt!", 4000, 255, 0, 0 )
	end
end



-- Laufenden Gangwar stoppen --

function stopGangwar ( thePlayer )
	if isAdminLevel ( thePlayer, 3 ) then
		if gangAreaUnderAttack or gangAreaUnderPreparation then
			sendMSGForFaction ( "Der Gangwar wurde von "..getPlayerName(thePlayer).." abgebrochen!", gangData.attackerfrac, 150, 0, 0 )
			sendMSGForFaction ( "Der Gangwar wurde von "..getPlayerName(thePlayer).." abgebrochen!", gangData.ownerfrac, 0, 150, 0 )
			
			local r = gangColor[gangData.ownerfrac][1]
			local g = gangColor[gangData.ownerfrac][2]
			local b = gangColor[gangData.ownerfrac][3]
			setRadarAreaColor ( gangArea[validID], r, g, b, 200 )
			sortierePlayerDataTabelle ()
			gangPickup[validID]["blocked"] = false
			for playeritem, tables in pairs ( playerData ) do
				local player = getPlayerFromName ( playeritem )
				if isElement ( player ) and tables["imGW"] and spawnwegnachgw then
					spawnPlayerAfterGangwar ( player )
				elseif isElement ( player ) and tables["imGW"] then
					setElementDimension ( player, 0 )
				end
				
				if isElement ( player ) then
					removeEventHandler ( "onPlayerQuit", player, gangwarOfflinefunc )
					removeEventHandler ( "onPlayerCommand", player, disableBlockedCMD )
					triggerClientEvent ( player, "stopGWAnzeigeSTOP", player )
					local kriegtwaffe = false
					takeAllWeapons ( player )
					for weapon, ammo in pairs ( tables["weapons"] ) do
						giveWeapon ( player, weapon, ammo )
						if ammo > 0 then
							kriegtwaffe = true
						end
					end
					if kriegtwaffe then
						outputChatBox("Du hast deine Waffen zurück bekommen!", player, 200, 200, 0)
					end
					outputChatBox ( "Damage - " .. math.floor ( tables["damage"] ) .. " | Kills - " .. tables["kills"], player, 0, 255, 0 )
					infobox ( player, "Bonus:\n".. ( math.floor ( tables["damage"] ) * geldprodamageimgw ) + ( tables["kills"] * geldprokillimgw ).. "$", 4000, 0, 120, 0 )
					givePlayerSaveMoney ( player, math.floor( tables["damage"] * geldprodamageimgw ) + ( tables["kills"] * geldprokillimgw ) )
				end
			end
			playerData = {}
			gangAttacks[gangData.attackerfrac] = gangAttacks[gangData.attackerfrac] + 1
			outputAdminLog ( getPlayerName ( thePlayer ).." hat eine Gangwarvorbereitung der "..fraktionNames[gangData.attackerfrac].." gestoppt." )	
			emptyEverythingForNewGW ()
		else
			infobox ( thePlayer, "Es läuft\nkein Gangwar!", 4000, 255, 0, 0 )
		end
		emptyEverythingForNewGW ()
	else
		infobox ( thePlayer, "Du bist\nnicht befugt!", 4000, 255, 0, 0 )
	end
end



-- Ganggebiet umsetten ( neuer Besitzer ) --

function setGangArea ( player, cmd, areanumber, newfrac )
	if isAdminLevel ( player, 4 ) then
		local areanumber = tonumber ( areanumber )
		if areanumber >= 1 and areanumber <= gangCount then
			if newfrac ~= nil then
				local fraczahl = nil
				local fracname = ""
				if tonumber ( newfrac ) ~= nil and gangAttacks[tonumber ( newfrac )] then
					fraczahl = tonumber ( newfrac )
					fracname = fraktionNames[fraczahl]
				else
					fraczahl, fracname = getFactionByName ( newfrac )
					if not fraczahl then
						infobox ( player, "Die Fraktion existiert\nnicht oder ist\nkeine böse Fraktion", 4000, 255, 0, 0 )
						return false
					end
				end
				factionGangAreas[gangPickup[areanumber]["besitzer"]] = factionGangAreas[gangPickup[areanumber]["besitzer"]] - 1
				gangPickup[areanumber]["besitzer"] = fraczahl
				factionGangAreas[fraczahl] = factionGangAreas[fraczahl] + 1

				dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ?? = ?", "gangs", "BesitzerFraktion", fraczahl, "ID", gangPickup[areanumber]["original"] )
				setRadarAreaColor ( gangArea[areanumber], gangColor[fraczahl][1], gangColor[fraczahl][2], gangColor[fraczahl][3], 130 )
				local GanggebietName = gangPickup[areanumber]["name"]
				local msg = "Die "..fracname.." haben "..GanggebietName.." gesetzt bekommen!"
				for index, _ in pairs ( gangAttacks ) do
					sendMSGForFaction ( msg, index, 100, 100, 0 )
				end
				outputAdminLog ( getPlayerName ( player ).." hat "..GanggebietName.." an "..fracname.." gesettet." )	
			else
				infobox ( player, "\nZielfraktion fehlt!", 4000, 255, 0, 0 )
			end
		else
			infobox ( player, "Das Gebiet\nexistiert nicht!", 4000, 255, 0, 0 )
		end
	else
		infobox ( player, "\nNicht befugt!", 4000, 255, 0, 0 )
	end
end



-- einer Fraktion ein Attack geben ( sie können dann nur die Fraktion angreifen, von der sie auch die Erlaubnis haben ) -- 

function allowAttack ( player, cmd, targetfrac )
	local eigenefrac = vnxGetElementData ( player, "fraktion" )
	if gangAttacks[eigenefrac] and vnxGetElementData ( player, "rang" ) >= minrangzumattackgeben then
		if targetfrac then
			local fraczahl = nil
			local fracname = ""
			if tonumber ( targetfrac ) ~= nil and gangAttacks[tonumber ( targetfrac )] then
				fraczahl = tonumber ( targetfrac )
				fracname = fraktionNames[fraczahl]
			else
				fraczahl, fracname = getFactionByName ( targetfrac )
				if not fraczahl then
					infobox ( player, "Die Fraktion existiert\nnicht oder ist\nkeine böse Fraktion", 4000, 255, 0, 0 )
					return false
				end
			end
			if not gangAllow[fraczahl..eigenefrac] then
				gangAllow[fraczahl..eigenefrac] = true
				if isTimer ( allowTimer[fraczahl..eigenefrac] ) then
					killTimer ( allowTimer[fraczahl..eigenefrac] )
				end
				allowTimer[fraczahl..eigenefrac] = setTimer ( function ( fraczahl, eigenefrac ) 
					gangAllow[fraczahl..eigenefrac] = nil 
					sendMSGForFaction ( "Eure Erlaubnis zum Attacken der "..fraktionNames[eigenefrac].." ist abgelaufen.", fraczahl, 255, 0, 0 )
					sendMSGForFaction ( "Die Erlaubnis der "..fraktionNames[fraczahl].. " euch Attacken zu können ist abgelaufen.", eigenefrac, 255, 0, 0 )
				end, 1000 * 60 * 10, 1, fraczahl, eigenefrac )
				sendMSGForFaction ( "Euch wurde die Erlaubnis zum Attacken der "..fraktionNames[eigenefrac].." gegeben.", fraczahl, 100, 100, 0 )
				sendMSGForFaction ( getPlayerName(player).." hat der "..fracname.." die Erlaubnis zum Attacken gegeben.", eigenefrac, 100, 100, 0 )
			else
				killTimer ( allowTimer[fraczahl..eigenefrac] )
				gangAllow[fraczahl..eigenefrac] = nil
				sendMSGForFaction ( "Eure Erlaubnis zum Attacken der "..fraktionNames[eigenefrac].." wurde zurückgezogen!", fraczahl, 100, 100, 0 )
				sendMSGForFaction ( getPlayerName(player).." hat die Erlaubnis an die "..fraktionNames[fraczahl].." zurückgezogen!", eigenefrac, 100, 100, 0 )
			end
		else
			infobox ( player, "\nZielfraktion fehlt!", 4000, 255, 0, 0 )
		end
	else
		infobox ( player, "Ab Rang "..minrangzumattackgeben.."\neiner bösen Fraktion", 4000, 255, 0, 0 )
	end
end



-- einer bösen Fraktion Gangattacks geben --

function setGangwarAttacks ( player, cmd, frac, anzahl )
	if isAdminLevel ( player, 4 ) then
		if frac then
			local frac = tonumber(frac)
			if gangAttacks[frac] then
				if anzahl then
					local anzahl = tonumber(anzahl)
					if anzahl <= maxanzahlanattacks and anzahl >= 0 then
						gangAttacks[frac] = anzahl
						outputChatBox ( "Du hast die Attackanzahl der "..fraktionNames[frac].." auf "..anzahl.." gesetzt.", player, 100, 155, 0 )
						sendMSGForFaction ( getPlayerName(player).." hat eure Attackanzahl auf "..anzahl.." gesetzt.", frac, 100, 155, 0 )
						outputAdminLog ( getPlayerName ( player ).." hat die Attackanzahl der "..fraktionNames[frac].." auf "..anzahl.." gesetzt." )	
					else
						infobox ( player, "Anzahl der Attacks\nmuss zwischen\n0 und "..maxanzahlanattacks.." liegen!", 4000, 255, 0, 0 )
					end
				else
					infobox ( player, "Gebrauch:\n/setgwattacks [frac-ID]\n[AnzahlAttacks]", 4000, 255, 0, 0)
				end
			else
				infobox ( player, "\nFraktionsID ungültig!", 4000, 255, 0, 0)
			end
		else
			infobox ( player, "Gebrauch:\n/setgwattacks [frac-ID]\n[AnzahlAttacks]", 4000, 255, 0, 0)
		end
	else
		infobox ( player, "Du bist\nnicht befugt!", 4000, 255, 0, 0)
	end			
end



-- Fahrzeug breaken --

function gangwarBreakFahrzeug ( player )
	local pname = getPlayerName ( player )
	if playerData[pname] and playerData[pname]["imGW"] then
		if gangAreaUnderPreparation then
			if isPedInVehicle ( player ) then
				local veh = getPedOccupiedVehicle ( player )
				setElementFrozen ( veh, not isElementFrozen ( veh ) )
				local status = "entbreakt"
				if isElementFrozen ( veh ) then
					status = "gebraket"
				end
				infobox ( player, "Fahrzeug "..status.."!", 4500, 255, 0, 0 )
			else
				infobox ( player, "Du bist\nin keinem Fahrzeug!", 4500, 255, 0, 0 )
			end
		else
			infobox ( player, "Es läuft\nkein Gangwar!", 4500, 255, 0, 0 )
		end
	else
		infobox ( player, "Du bist\nnicht im\nGangwar!", 4500, 255, 0, 0 )
	end
end



-- Gegner erlauben dem GW joinen zu können, obwohl nicht mehr möglich --

function gangwarAllowToJoinPluzBattlexChampStinkt ( player, cmd, targetpl )
	if gangAreaUnderAttack then
		if vnxGetElementData ( player, "fraktion" ) == gangData.attackerfrac or vnxGetElementData ( player, "fraktion" ) == gangData.ownerfrac then
			if vnxGetElementData ( player, "rang" ) >= minrangzumjoinerlaubnisgeben then
				if targetpl and findPlayerByName ( targetpl ) then
					local targetpl = findPlayerByName ( targetpl )
					if vnxGetElementData ( targetpl, "fraktion" ) == gangData.attackerfrac or vnxGetElementData ( targetpl, "fraktion" ) == gangData.ownerfrac then
						if vnxGetElementData ( targetpl, "fraktion" ) ~= vnxGetElementData ( player, "fraktion" ) then
							allowedToJoin[targetpl] = true
							infobox ( player, "Erlaubnis gegeben", 4500, 255, 255, 255 )
							sendMSGForFaction ( getPlayerName(player).." hat "..getPlayerName(targetpl).." die Erlaubnis zum Joinen gegeben!", gangData.attackerfrac, 255, 255, 255 )
							sendMSGForFaction ( getPlayerName(player).." hat "..getPlayerName(targetpl).." die Erlaubnis zum Joinen gegeben!", gangData.ownerfrac, 255, 255, 255 )
						else
							infobox ( player, "Der Spieler muss\nin der gegnerischen\nFraktion sein!", 4500, 255, 0, 0 )
						end
					else
						infobox ( player, "Die Fraktion des\nSpieler ist nicht\nin der Fraktion\ntätig!", 4500, 255, 0, 0 )
					end
				else
					infobox ( player, "Ungültiger Spieler!", 4500, 255, 0, 0 )
				end
			else
				infobox ( player, "Du bist\nnicht befugt!", 4500, 255, 0, 0 )
			end	
		else
			infobox ( player, "Du bist\nnicht befugt!", 4500, 255, 0, 0 )
		end	
	else
		infobox ( player, "Es läuft\nkein Gangwar!", 4500, 255, 0, 0 )
	end	
end
			
				

-- Alle Gangwarbefehle als Überblick --

function alleGangwarBefehle (player)
	outputChatBox ("/attack - Attacken", player, 255, 255, 255)
	outputChatBox ("/joinattack - Attack teilnehmen", player, 255, 255, 255)
	outputChatBox ("/defend - Verteidigung teilnehmen", player, 255, 255, 255)
	outputChatBox ("/ganggebiete - Ganggebiete anzeigen", player, 255, 255, 255)
	outputChatBox ("/allowattack - Attack erlauben", player, 255, 255, 255)
	outputChatBox ("/allowjoin - Gegner erlauben zum Gangwar zu Joinen", player, 255, 255, 255)
	outputChatBox ("/burritoback - Stellt die Burritos zurück", player, 255, 255, 255 )
	outputChatBox ("/gwbreak - Ein Fahrzeug breaken", player, 255, 255, 255)
	local adminlvl = vnxGetElementData ( player, "adminlvl" )
	if adminlvl >= 3 then
		outputChatBox ("/areareset - Area-Schutz aktivieren/deaktivieren", player, 255, 255, 255)
		outputChatBox ("/stopgangwar - Gangwar stoppen", player, 255, 255, 255)
	end
	if adminlvl >= 3 then
		outputChatBox ("/setganggebiet - Ganggebiet setten", player, 255, 255, 255)
		outputChatBox ("/setgwattacks - Attack einer Fraktion setten", player, 255, 255, 255)
	end
end



-- CommandHandler --

addCommandHandler ( "attack", gangattack_func )
addCommandHandler ( "defend", gangwarDefend )
addCommandHandler ( "joinattack", gangwarAttack )
addCommandHandler ( "ganggebiete", GangAreasOverview_func )
addCommandHandler ( "areareset", setAreaBlocked_func )
addCommandHandler ( "stopgangwar", stopGangwar )
addCommandHandler ( "setganggebiet", setGangArea )
addCommandHandler ( "allowattack", allowAttack )
addCommandHandler ( "setgwattacks", setGangwarAttacks )
addCommandHandler ( "gwbefehle", alleGangwarBefehle )
addCommandHandler ( "gwbreak", gangwarBreakFahrzeug )
addCommandHandler ( "allowjoin", gangwarAllowToJoinPluzBattlexChampStinkt )
addCommandHandler ( "burritoback", setBurritosBackInGangwar )
