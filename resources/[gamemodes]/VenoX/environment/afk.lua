-- Kann man verändern --

local BarMarkerOut = createMarker ( -228.89999389648, 1401.1999511719, 26.799999237061, "cylinder", 1.2, 0, 0, 255, 255 ) -- Der Marker zum rausgehen
local BarInterior = 18 -- Interior der Bar
local BarDimension = 111 -- Dimension der Bar

local afkBarSpawns = {         -- Spawnpunkte in der Bar, damit die Leute sich nicht gegenseitig blockieren
	[1] = {x = -228.5, y = 1410.5999755859, z = 28.39999961853, rot = 0},
	[2] = {x = -228.69999694824, y = 1412.1999511719, z = 28.39999961853, rot = 180},
	[3] = {x = -228.69999694824, y = 1409.8000488281, z = 28.39999961853, rot = 180},
	[4] = {x = -228.69999694824, y = 1408.1999511719, z = 28.39999961853, rot = 0},
	[5] = {x = -228.69999694824, y = 1405.9000244141, z = 28.39999961853, rot = 0},
	[6] = {x = -228.69999694824, y = 1407.5, z = 27.799999237061, rot = 180},
	[7] = {x = -228.69999694824, y = 1403.5999755859, z = 27.799999237061, rot = 0},
	[8] = {x = -228.69999694824, y = 1405.0999755859, z = 27.799999237061, rot = 180},
	[9] = {x = -226, y = 1395, z = 28.39999961853, rot = 0},
	[10] = {x = -224.10000610352, y = 1395.9000244141, z = 28.39999961853, rot = 90},
	[11] = {x = -223.19999694824, y = 1405.5, z = 27.799999237061, rot = 90},
	[12] = {x = -224.80000305176, y = 1404.4000244141, z = 27.799999237061, rot = 90},
	[13] = {x = -220.10000610352, y = 1406.8000488281, z = 27.799999237061, rot = 0},
	[14] = {x = -218.80000305176, y = 1401.9000244141, z = 27.799999237061, rot = 180},
	[15] = {x = -218.10000610352, y = 1406.4000244141, z = 27.799999237061, rot = 0},
	[16] = {x = -223, y = 1409.5, z = 27.799999237061, rot = 180}
}

-- Nicht anfassen -- 

local AFKDaten = {}
local logoutTimer = {}
local logoutRuns = {}
local logoutX = {}
local logoutY = {}
local logoutZ = {}
setElementInterior ( BarMarkerOut, BarInterior )
setElementDimension ( BarMarkerOut, BarDimension )
addEvent ( "onPlayerResourceStartAFK", true )


-- Wichtige Funktionen --

function onAFKBarMarkerHit ( hitElement, matchingDim )
	if hitElement and matchingDim then 
		if getElementType ( hitElement ) == "player" then
			AFKDaten[hitElement]["isAFK"] = false
			vnxSetElementData ( hitElement, "isafk", false )
			if AFKDaten[hitElement]["olddim"] then
				setElementDimension ( hitElement, AFKDaten[hitElement]["olddim"] )
				setElementInterior ( hitElement, AFKDaten[hitElement]["oldint"] )
				setElementPosition ( hitElement, AFKDaten[hitElement]["oldX"], AFKDaten[hitElement]["oldY"], AFKDaten[hitElement]["oldZ"])
				setElementRotation ( hitElement, 0, 0, AFKDaten[hitElement]["oldrot"], "default", true )
			else
				setElementDimension ( hitElement, 0 )
				setElementInterior ( hitElement, 0 )
				setElementPosition ( hitElement, -1969.3399, 116.0128, 28)
				setElementRotation ( hitElement, 0, 0, 180, "default", true )
			end
			toggleControl ( hitElement, "fire", true )
			toggleControl ( hitElement, "next_weapon ", true )
			toggleControl ( hitElement, "previous_weapon", true )
			toggleControl ( hitElement, "action", true )
			toggleControl ( hitElement, "aim_weapon", true )
			toggleControl ( hitElement, "enter_exit", true )
		end
	end
end 
addEventHandler ( "onMarkerHit", BarMarkerOut, onAFKBarMarkerHit )


function searchAFK ()
	local players = getElementsByType("player")
	for i=1, #players do
		local player = players[i]
		if vnxGetElementData ( player, "loggedin" ) == 1 then
			if AFKDaten[player] then  -- Falls nicht Ressource restartet wurde
				if not AFKDaten[player]["isAFK"] then 
					local idletime = getPlayerIdleTime ( player )
					if idletime >= 14 * 60 * 1000 then
						if vnxGetElementData ( player, "prison" ) == 0 and vnxGetElementData ( player, "jailtime" ) == 0 then
							if playerData[getPlayerName(player)] and playerData[getPlayerName(player)]["imGW"] then
								AFKDaten[player]["Zeit"] = 0
								return
							end  
							if AFKDaten[player]["Zeit"] == 0 then
								outputChatBox ( "Beweg dich oder du wirst AFK gesetzt!", player, 255, 0, 0 )
								AFKDaten[player]["Zeit"] = 1
							elseif AFKDaten[player]["Zeit"] == 1 then
								if isPedInVehicle(player) then
									removePedFromVehicle(player)
								end
								local rnd = math.random ( 1, #afkBarSpawns )
								local koord = afkBarSpawns[rnd]
								local oldx, oldy, oldz = getElementPosition ( player )
								local xr, yr, zr = getElementRotation ( player )
								local olddim = getElementDimension ( player )
								local oldint = getElementInterior ( player )
								AFKDaten[player]["oldX"] = oldx
								AFKDaten[player]["oldY"] = oldy
								AFKDaten[player]["oldZ"] = oldz
								AFKDaten[player]["oldrot"] = zr
								AFKDaten[player]["olddim"] = olddim
								AFKDaten[player]["oldint"] = oldint
								setElementInterior ( player, BarInterior )
								setElementDimension ( player, BarDimension )
								setElementPosition ( player, koord.x, koord.y, koord.z )
								setElementRotation ( player, 0, 0, koord.rot, "default", true )
								AFKDaten[player]["isAFK"] = true
								vnxSetElementData ( player, "isafk", true)
								AFKDaten[player]["Zeit"] = 0	
								setPedWeaponSlot ( player, 0 )
								toggleControl ( player, "fire", false )
								toggleControl ( player, "next_weapon ", false )
								toggleControl ( player, "previous_weapon", false )
								toggleControl ( player, "action", false )
								toggleControl ( player, "aim_weapon", false )
								toggleControl ( player, "enter_exit", false )
								outputChatBox ( "Du bist in der AFK Bar!", player, 255, 0, 0 )
							end
						else
							AFKDaten[player]["Zeit"] = 0
						end
					end
				end
			else
				createPlayerAFK ( player )  -- Tabelle für Spiele neu erstellen
			end
		end
	end
end
local AFKtimer = setTimer ( searchAFK, 1000*60, 0 )  -- jede Minute


 function createPlayerAFK ( player )  -- beim Joinen
	local x, y, z = getElementPosition ( player )
	AFKDaten[player] = {}
	AFKDaten[player]["Zeit"] = 0
	AFKDaten[player]["isAFK"] = false
	vnxSetElementData ( player, "isafk", false )
	
	-- Deaktivierbare Funktionen, die AFK unterbrechen --
		addEventHandler ( "onPlayerChat", player, function()  -- beim Chatten
			AFKDaten[player]["Zeit"] = 0
		end )

		addEventHandler ( "onPlayerWasted", player, function( ammo, killer )  -- beim Sterben
			AFKDaten[player]["Zeit"] = 0
			if isElement ( killer ) then
				if getElementType ( killer ) == "player" then
					AFKDaten[killer]["Zeit"] = 0
				end
			end
		end )

		addEventHandler ( "onPlayerDamage", player, function ( attacker )  -- bei Damage
			AFKDaten[player]["Zeit"] = 0
			if isElement ( attacker ) then
				if getElementType ( attacker ) == "player" then
					AFKDaten[attacker]["Zeit"] = 0
				end
			end
		end)

		addEventHandler ( "onPlayerCommand", player, function()  -- bei Commands
			AFKDaten[player]["Zeit"] = 0
		end)
end

addEventHandler ( "onPlayerQuit", getRootElement(), function()  -- beim Quitten
	AFKDaten[source] = nil
end)

function save_func (player)
	if not AFKDaten[player] then
		createPlayerAFK ( player )  -- Tabelle für Spiele neu erstellen
	end
	if not getPedOccupiedVehicle ( player ) and not AFKDaten[player]["isAFK"] and not isTimer (logoutTimer[player]) then
		outputChatBox ( "Du wirst in 30 Sekunden ausgeloggt, bitte bleibe an deiner jetzigen Position!", player, 0, 125, 0 )
		logoutTimer[player] = setTimer ( checkLogout, 500, 0, player )
		logoutRuns[player] = 0
		logoutX[player], logoutY[player], logoutZ[player] = getElementPosition ( player )
	end
end
--addCommandHandler ( "save", save_func )


function checkLogout (player)

	if player and isElement ( player ) then
		local x, y, z = getElementPosition ( player )
		logoutRuns[player] = logoutRuns[player] + 1
		if x <= logoutX[player]+2 and x >= logoutX[player]-2 and y <= logoutY[player]+2 and y >= logoutY[player]-2 and z <= logoutZ[player]+2 and z >= logoutZ[player]-2 and not isPedDead ( player ) then
			if logoutRuns[player] == 60 then
				triggerEvent ("logoutPlayer", player, player, x, y, z, getElementInterior ( player ), getElementDimension ( player ))
				killTimer ( logoutTimer[player] )
			elseif logoutRuns[player]/10 == math.floor ( logoutRuns[player]/10+.01 ) then
				outputChatBox ( "Du wirst in "..((60-logoutRuns[player])/2).." Sekunden ausgeloggt!", player, 150, 150, 0 )
			end
		else
			outputChatBox ( "Logout abgebrochen!", player, 125, 0, 0 )
			killTimer ( logoutTimer[player] )
		end
	else
		killTimer ( logoutTimer[player] )
	end
end









