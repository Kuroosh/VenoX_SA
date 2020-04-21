addEvent ( "startGWAnzeige", true )
addEvent ( "updateAnzeigePrepare", true )
addEvent ( "updateAnzeigeStart", true )
addEvent ( "updateAnzeigeNachJoinen", true )
addEvent ( "rechneDMGAn", true )
addEvent ( "attackereinerdazugekommen", true )
addEvent ( "defendereinerdazugekommen", true )
addEvent ( "attackereinergestorben", true )
addEvent ( "defendereinergestorben", true )
addEvent ( "attackereinerofflineohnezaehlen", true )
addEvent ( "defendereinerofflineohnezaehlen", true )
addEvent ( "stopGWAnzeige", true )
addEvent ( "stopGWAnzeigeSTOP", true )
addEvent ( "kaching", true )
addEvent ( "rechneKillAn", true )
addEvent ( "moveVehicleInGangwar", true )



-- Nicht zu leerende Tabellen / Variablen --

local gangPraefix = {
 [2]="Brotherhood",
 [3]="Triaden",
 [7]="Los Aztecas",
 [9]="Angels of Death",
 [12]="Rollin' Heights",
 [13]="Grove Street",
 [14]="Italian Mafia"
 }
 
 
 
-- Zu leerende Variablen --

gangwarDamage = 0 
gangwarKills = 0
gangwarlaeuft = false
local diezeit, startzeit, attackeralive, defenderalive, attacker, defender = 0, 0, 0, 0, 0, 0
local attackerR, attackerG, attackerB, defenderR, defenderG, defenderB = 0, 0, 0, 0, 0, 0
local attackerfracname = ""
local defenderfracname = ""
local thepickup, statistikTabelle = nil
local sortierteStatistikTabelle = nil
local theveh = nil
local lastvehmove = 0
local showing = false
local screenx, screeny = guiGetScreenSize()
local sxA, syA = screenx/1920, screeny/1080



--- EINSTELLBAR ---

local reichweiteZumTK = 15   -- Mindestreichweite zum TK, um drin zu sein - ACHTUNG: Serverseitig auch ändern!
local zeitinsekundenbisstatistikendet = 120   -- In wievielen Minuten die Statistik ausgeblendet werden soll



-- Funktionen --

function dxdrawGangwarAnzeige ()
	local daminute = math.floor ( ( diezeit - ( getRealTime().timestamp - startzeit ) ) / 60 )
	local dasekunde = math.floor ( ( diezeit - ( getRealTime().timestamp - startzeit ) ) % 60 )
	local distance = 0
	if thepickup and isElement ( thepickup ) then
		local xp, yp, zp = getElementPosition ( thepickup )
		local xpl, ypl, zpl = getElementPosition ( getLocalPlayer() )
		distance = math.floor (getDistanceBetweenPoints3D ( xp, yp, zp, xpl, ypl, zpl ) * 10)/10
	end
	if dasekunde < 10 then
		dasekunde = "0"..dasekunde
	end
	
	dxDrawRectangle(screenx-400*sxA, screeny-670*syA, 180*sxA, 60*syA, tocolor(attackerR, attackerG, attackerB, 130), true)  -- ATTACKER 
	dxDrawRectangle(screenx-210*sxA, screeny-670*syA, 180*sxA, 60*syA, tocolor(defenderR, defenderG, defenderB, 200), true) -- DEFENDER
	
	dxDrawRectangle(screenx-400*sxA, screeny-725*syA, 120*sxA, 50*syA, tocolor(0, 0, 0, 200), true) -- KILLS
	dxDrawRectangle(screenx-275*sxA, screeny-725*syA, 120*sxA, 50*syA, tocolor(0, 0, 0, 200), true) -- DAMAGE
	dxDrawRectangle(screenx-150*sxA, screeny-725*syA, 120*sxA, 50*syA, tocolor(0, 0, 0, 200), true) -- TIME
	
	dxDrawImage(screenx-385*sxA, screeny-713*syA, 25*sxA, 25*syA, "images/kill.png", 0, 0, 0, tocolor(255, 255, 255, 255), true) -- KILLS
	dxDrawImage(screenx-260*sxA, screeny-713*syA, 25*sxA, 25*syA, "images/damage.png", 0, 0, 0, tocolor(255, 255, 255, 255), true) -- DAMAGE
	dxDrawImage(screenx-135*sxA, screeny-713*syA, 25*sxA, 25*syA, "images/time.png", 0, 0, 0, tocolor(255, 255, 255, 255), true) -- TIME
	 
	dxDrawText(gangwarKills, screenx-335*sxA, screeny-712*syA, screenx-380*sxA, screeny-700*syA,tocolor(255, 255, 255, 255), 1.6*syA, "default-bold", "left", "top", false, false, true, false, false) -- Kill
	dxDrawText(math.floor(gangwarDamage), screenx-210*sxA, screeny-712*syA, screenx-380*sxA, screeny-700*syA,tocolor(255, 255, 255, 255), 1.6*syA, "default-bold", "left", "top", false, false, true, false, false) -- DAMAGE
	dxDrawText(daminute..":"..dasekunde, screenx-120*sxA, screeny-712*syA, screenx-30*sxA, screeny-700*syA,tocolor(255, 255, 255, 255), 1.6*syA, "default-bold", "center", "top", false, false, true, false, false) -- Time
	 
	dxDrawText(attackerfracname, screenx-400*sxA, screeny-667*syA, screenx-220*sxA, screeny-580*syA,tocolor(255, 255, 255, 255), 1.2*syA, "default-bold", "center", "top", false, false, true, false, false) -- Attacker
	dxDrawText(attackeralive.." / "..attacker, screenx-400*sxA, screeny-647*syA, screenx-220*sxA, screeny-580*syA,tocolor(255, 255, 255, 255), 2*syA, "default-bold", "center", "top", false, false, true, false, false) -- Attacker
	dxDrawText(defenderfracname, screenx-210*sxA, screeny-667*syA, screenx-30*sxA, screeny-580*syA,tocolor(255, 255, 255, 255), 1.2*syA, "default-bold", "center", "top", false, false, true, false, false) -- DEFENDER
	dxDrawText(defenderalive.." / "..defender, screenx-210*sxA, screeny-647*syA, screenx-30*sxA, screeny-580*syA,tocolor(255, 255, 255, 255), 2*syA, "default-bold", "center", "top", false, false, true, false, false) -- Attacker
	-- Distanz zum TK --
	if distance > reichweiteZumTK then
		distance = "Entfernung zum Totenkopf "..distance.."m"
		dxDrawText(distance,  screenx-120*sxA, screeny-608*syA, screenx-35, screeny-700*syA, tocolor(255, 0, 0, 255), 1*syA, "default-bold", "right", "top", false, false)  -- DISTANCE ROT
	else
		distance = "Entfernung zum Totenkopf "..distance.."m"
		dxDrawText(distance,  screenx-120*sxA, screeny-608*syA, screenx-35, screeny-700*syA, tocolor(255, 255, 255, 255), 1*syA, "default-bold", "right", "top", false, false)  -- DISTANCE Weiß
	end
	showing = true
end


function startAnzeige ( )
	gangwarlaeuft = true
	gangwarDamage = 0
	gangwarKills = 0
	addEventHandler ( "onClientRender", getRootElement(), dxdrawGangwarAnzeige )	
	addEventHandler ( "onClientKey", getRootElement(), deactivateInventar )
	removeEventHandler ( "onClientRender", getRootElement(), startStatistik )
	addEventHandler ( "onClientPlayerWasted", localPlayer, calculateGangwarKills )
	startzeit = getRealTime().timestamp
end
addEventHandler ( "startGWAnzeige", getRootElement(), startAnzeige )


function updateAnzeigePrepare_func ( zeitzumende, attackergesamt, attackerfrac, ownerfrac, pickup )
	gangwarlaeuft = true
	diezeit = zeitzumende
	attacker = attackergesamt
	attackeralive = attackergesamt
	attackerfracname = gangPraefix[attackerfrac]
	defenderfracname = gangPraefix[ownerfrac]
	thepickup = pickup
	attackerR = factionColors[attackerfrac][1]
	attackerG = factionColors[attackerfrac][2]
	attackerB = factionColors[attackerfrac][3]
	defenderR = factionColors[ownerfrac][1]
	defenderG = factionColors[ownerfrac][2]
	defenderB = factionColors[ownerfrac][3]
	startzeit = getRealTime().timestamp
end
addEventHandler ( "updateAnzeigePrepare", getRootElement(), updateAnzeigePrepare_func )


function updateAnzeigeStart_func ( zeitzumende, attackerlebend, attackergesamt )
	gangwarlaeuft = true
	diezeit = zeitzumende
	attackeralive = attackerlebend
	attacker = attackergesamt
	startzeit = getRealTime().timestamp
end
addEventHandler ( "updateAnzeigeStart", getRootElement(), updateAnzeigeStart_func )


function updateAnzeigeNachJoinen_func ( zeitzumende, attackergesamt, attackerlebend, defendergesamt, defenderlebend, attackerfrac, ownerfrac, pickup )
	gangwarlaeuft = true
	diezeit = zeitzumende
	attacker = attackergesamt
	attackeralive = attackerlebend
	defender = defendergesamt
	defenderalive = defenderlebend
	attackerfracname = gangPraefix[attackerfrac]
	defenderfracname = gangPraefix[ownerfrac]
	thepickup = pickup
	attackerR = factionColors[attackerfrac][1]
	attackerG = factionColors[attackerfrac][2]
	attackerB = factionColors[attackerfrac][3]
	defenderR = factionColors[ownerfrac][1]
	defenderG = factionColors[ownerfrac][2]
	defenderB = factionColors[ownerfrac][3]
	startzeit = getRealTime().timestamp
end
addEventHandler ( "updateAnzeigeNachJoinen", getRootElement(), updateAnzeigeNachJoinen_func )


function attackerEinerHinzugekommen ( )
	attacker = attacker + 1
	attackeralive = attackeralive + 1
end
addEventHandler ( "attackereinerdazugekommen", getRootElement(), attackerEinerHinzugekommen )


function defenderEinerHinzugekommen ( )
	defender = defender + 1
	defenderalive = defenderalive + 1
end
addEventHandler ( "defendereinerdazugekommen", getRootElement(), defenderEinerHinzugekommen )


function attackerEinerTot ( )
	attackeralive = attackeralive - 1
end
addEventHandler ( "attackereinergestorben", getRootElement(), attackerEinerTot )


function defenderEinerTot ( )
	defenderalive = defenderalive - 1
end
addEventHandler ( "defendereinergestorben", getRootElement(), defenderEinerTot )


function attackerEinerOffVorStart ( )
	attackeralive = attackeralive - 1
	attacker = attacker - 1
end
addEventHandler ( "attackereinerofflineohnezaehlen", getRootElement(), attackerEinerOffVorStart )


function defenderEinerOffVorStart ( )
	defenderalive = defenderalive - 1
	defender = defender - 1
end
addEventHandler ( "defendereinerofflineohnezaehlen", getRootElement(), defenderEinerOffVorStart )


function stopAnzeige ( dmgkilltable )
	gangwarlaeuft = false
	removeEventHandler ( "onClientRender", getRootElement(), dxdrawGangwarAnzeige )	
	removeEventHandler ( "onClientKey", getRootElement(), deactivateInventar )
	removeEventHandler ("onClientPlayerWasted", localPlayer, calculateGangwarKills)
	diezeit, startzeit, attackeralive, defenderalive, attacker, defender = 0, 0, 0, 0, 0, 0
	attackerfracname = ""
	defenderfracname = ""
	thepickup = nil
	showing = false
	sortierteStatistikTabelle = dmgkilltable
	removeEventHandler ( "onClientRender", getRootElement(), startStatistik )
	addEventHandler ( "onClientRender", getRootElement(), startStatistik )
end
addEventHandler ( "stopGWAnzeige", getRootElement(), stopAnzeige )


function stopAnzeigeSTOP ( )
	gangwarlaeuft = false
	removeEventHandler ( "onClientRender", getRootElement(), dxdrawGangwarAnzeige )	
	removeEventHandler ( "onClientKey", getRootElement(), deactivateInventar )
	diezeit, startzeit, attackeralive, defenderalive, attacker, defender = 0, 0, 0, 0, 0, 0
	attackerfracname = ""
	defenderfracname = ""
	thepickup = nil
	showing = false
end
addEventHandler ( "stopGWAnzeigeSTOP", getRootElement(), stopAnzeigeSTOP )


function calculateGangwarDamage ( dmg )
	gangwarDamage = gangwarDamage + dmg
	if not showing then
		addEventHandler ( "onClientRender", getRootElement(), dxdrawGangwarAnzeige )
	end
end
addEventHandler ("rechneDMGAn", getRootElement(), calculateGangwarDamage)


function calculateGangwarKills ( killer )
	triggerServerEvent ( "rechneKILLAnServer", source, killer )
end


addEventHandler ( "rechneKillAn", root, function ( kills )
	gangwarKills = kills
end )


function deactivateInventar ( button, press ) 
	if ( press ) and button == "i" then
		cancelEvent()
	end
end


function startStatistik()
	local ver, ang = 0, 0
	local hoehe = 0
	for index, tables in pairs ( sortierteStatistikTabelle ) do
		if tables["Attacker"] then
			hoehe = hoehe + 1
		end
	end
	for index, tables in pairs ( sortierteStatistikTabelle ) do
    	if tables["Attacker"] then
    		-- Rechteck --
    		dxDrawRectangle(screenx-400*sxA, screeny-775*syA+46*syA*(index-ang), 180*sxA, 45*syA, tocolor(attackerR, attackerG, attackerB, 200), true)  -- ATTACKER 
   			-- Stats --
    		dxDrawText("Kill: "..tables["Kills"].." | Dmg: "..tables["Damage"], screenx-400*sxA, screeny-754*syA+46*syA*(index-ang), screenx-220, screeny-740*syA+46*syA*(index-ang),tocolor(255, 255, 255, 255), 1.2*syA, "default-bold", "center", "top", false, false, true, false, false) -- Name
			-- Name --
			dxDrawText(tables["Player"], screenx-400*sxA, screeny-770*syA+46*syA*(index-ang), screenx-220, screeny-740*syA+46*syA*(index-ang),tocolor(255, 255, 255, 255), 1.2*syA, "default-bold", "center", "top", false, false, true, false, false) -- Stats
			ver = ver + 1
		else
    		-- Rechteck --
    		dxDrawRectangle(screenx-210*sxA, screeny-775*syA+46*syA*(index-ver), 180*sxA, 45*syA, tocolor(defenderR, defenderG, defenderB, 200), true) -- DEFENDER
    		-- Stats --
			dxDrawText("Kill: "..tables["Kills"].." | Dmg: "..tables["Damage"], screenx-210*sxA, screeny-754*syA+46*syA*(index-ver), screenx-30, screeny-740*syA+46*syA*(index-ver),tocolor(255, 255, 255, 255), 1.2*syA, "default-bold", "center", "top", false, false, true, false, false) -- Name
			-- Name --
			dxDrawText(tables["Player"], screenx-210*sxA, screeny-770*syA+46*syA*(index-ver), screenx-30, screeny-740*syA+46*syA*(index-ver),tocolor(255, 255, 255, 255), 1.2*syA, "default-bold", "center", "top", false, false, true, false, false) -- Stats
			ang = ang + 1
		end
	end
	setTimer ( function () removeEventHandler ( "onClientRender", getRootElement(), startStatistik ) end, 1000 * zeitinsekundenbisstatistikendet, 1 )
end



function kachingsound_func ( )
	playSound ( "sounds/kaching.mp3" )
end
addEventHandler ( "kaching", getRootElement(), kachingsound_func )


addEventHandler ( "moveVehicleInGangwar", root, function ( veh )
	theveh = veh
	lastvehmove = getTickCount()
	addEventHandler ( "onClientRender", root, showVehicleFlying )
	showCursor ( true )
	bindKey ( "mouse1", "up", triggerTheVehiclePosition ) 
	bindKey ( "mouse_wheel_up", "both", setVehicleRotationUpDown, 3 )
	bindKey ( "mouse_wheel_down", "both", setVehicleRotationUpDown, -3 )
end )


function showVehicleFlying ( )
	local _, _, worldx, worldy, worldz = getCursorPosition()
    local px, py, pz = getCameraMatrix()
	local playerx, playery, playerz = getElementPosition ( localPlayer )
	setCameraMatrix ( playerx, playery, playerz+50, playerx, playery, playerz )
    local hit, x, y, z, elementHit = processLineOfSight ( px, py, pz, worldx, worldy, worldz )
	local _, _, rz = getElementRotation ( theveh )
	if x and y and z then
		z = getGroundPosition ( x, y, z )
		setElementPosition ( theveh, x, y, z+0.6 )
	end
	setElementRotation ( theveh, 0, 0, rz )
end


function triggerTheVehiclePosition ( )
	if lastvehmove+500 <= getTickCount() then
		unbindKey ( "mouse1", "both", triggerTheVehiclePosition ) 
		unbindKey ( "mouse_wheel_up", "both", setVehicleRotationUpDown )
		unbindKey ( "mouse_wheel_down", "both", setVehicleRotationUpDown )
		removeEventHandler ( "onClientRender", root, showVehicleFlying )
		local screenx, screeny, worldx, worldy, worldz = getCursorPosition()
		local px, py, pz = getCameraMatrix()
		local hit, x, y, z, elementHit = processLineOfSight ( px, py, pz, worldx, worldy, worldz )
		z = getGroundPosition ( x, y, z )
		local _, _, rz = getElementRotation ( theveh )
		triggerServerEvent ( "triggerActualVehiclePositionForGangwar", getLocalPlayer(), theveh, x, y, z+0.9, rz )
		setCameraTarget ( localPlayer )
		theveh = nil
	end
end


function setVehicleRotationUpDown ( button, _, value )
	local _, _, rz = getElementRotation ( theveh )
	setElementRotation ( theveh, 0, 0, rz+value )
end




	
		

 