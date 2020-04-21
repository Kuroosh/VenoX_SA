-------------------------
------- (c) 2010 --------
------- by Zipper -------
-- and Vio MTA:RL Crew --
-------------------------

addEvent ( "inAdminDuty", true )
addEvent ( "notInAdminDuty", true )
addEvent ( "startBloodScreen", true )
addEvent ( "changeHitglocke", true )


weaponDamages = { [0] = true, [4] = true, [8] = true, [22] = true, [23] = true, [24] = true, [25] = true, [28] = true, [29] = true, [32] = true, [30] = true, [31] = true, [33] = true, [34] = true, [51] = true }

FireingEnabled = false
local blood = guiCreateStaticImage(0,0,1,1,"images/bloodscreen.png",true)
guiSetAlpha ( blood, 0 )
guiSetEnabled ( blood, false )
local bloodTimer = nil
local bloodalpha = 0
local reddotr, reddotg, reddotb = 255, 0, 0
local isadminduty = false
local hitglocke = false


function cancelAllDamage ( attacker, weapon, bodypart, loss )
	if attacker == lp then
		local ping = getPlayerPing ( lp )
		if ping >= 800 then
			triggerServerEvent ( "kickplayerforhighping", lp, ping )
		end
		if attacker and weapon and bodypart and not isadminduty and getElementModel ( source ) ~= 260 and not isPedDead ( source ) then
			if weaponDamages[weapon] then
				if hitglocke then
					local hitsound = playSound ( "sounds/hitsound.wav" )
					setSoundVolume ( hitsound, 0.5 )
				end
				triggerServerEvent ( "damageCalcServer", lp, source, weapon, bodypart, loss )
			end
		end	
	elseif lp == source then
		if attacker and weapon and bodypart and loss then
			if weaponDamages[weapon] then
				cancelEvent ()
			end
		end
		if gangwarlaeuft then
			cancelEvent()
		end
	end
end
addEventHandler ( "onClientPlayerDamage", root, cancelAllDamage )


function chokecheck ( weapon, player )
	if source == lp then
		if getElementModel ( source ) == 285 or getElementModel ( source ) == 260 then
			cancelEvent() 
		end
	end
end
addEventHandler ( "onClientPlayerChoke", root, chokecheck )


function reddot_func (cmd, r1, g1, b1)
	if not reddotOn then
		if r1 and g1 and b1 then
			reddotr = tonumber(r1)
			reddotg = tonumber(g1)
			reddotb = tonumber(b1)
		elseif (r1 and not g1) or (g1 and not b1) then
			outputChatBox("Gebrauch: /reddot oder /reddot R G B - z.B. /reddot 200 0 0", 125, 0, 0)
			return false
		end
		reddotOn = true
		addEventHandler ( "onClientRender", root, reddot_render)
		outputChatBox ( "Rotpunkt-Visir aktiv!", 0, 125, 0 )
	else
		reddotOn = false
		removeEventHandler ( "onClientRender", root, reddot_render )
		outputChatBox ( "Rotpunkt-Visir deaktiviert!", 125, 0, 0 )
	end
end
addCommandHandler ( "reddot", reddot_func )


function reddot_render ()
	local weaponslot = getPedWeaponSlot ( localPlayer ) 
	if weaponslot and weaponslot <= 7 and weaponslot >= 2 then
		if getPedControlState ( localPlayer , "aim_weapon" ) then
			local x1, y1, z1 = getPedWeaponMuzzlePosition ( localPlayer )
			x1 = x1 + 0.01
			y1 = y1 + 0.01
			z1 = z1 + 0.01
			local x2, y2, z2 = getPedTargetEnd ( localPlayer )
			local x3,y3,z3 = getPedTargetCollision ( localPlayer )
			if x3 then
				dxDrawLine3D ( x1, y1, z1, x3, y3, z3, tocolor ( reddotr, reddotg, reddotb, 200 ), 4, false )
			else
				dxDrawLine3D ( x1, y1, z1, x2, y2, z2, tocolor ( reddotr, reddotg, reddotb, 200 ), 4, false )
			end
		end
	end
end

	
function startBlood ( )
	guiSetEnabled ( blood, true )
	guiSetAlpha ( blood, 1 )
	bloodalpha = 1
	if isTimer ( bloodTimer ) then
		killTimer ( bloodTimer )
	end
	bloodTimer = setTimer ( stopBlood, 100, 10 )
end
addEventHandler ( "startBloodScreen", root, startBlood )


function stopBlood ( )
	if bloodalpha > 0.1 then
		bloodalpha = bloodalpha - 0.1
		guiSetAlpha ( blood, bloodalpha )
	else
		bloodalpha = 0
		guiSetAlpha ( blood, 0 )
		guiSetEnabled ( blood, false )
	end
end


function startAdminDuty ( )
	isadminduty = true
end
addEventHandler ( "inAdminDuty", root, startAdminDuty )


function stopAdminDuty ( )
	isadminduty = false
end
addEventHandler ( "notInAdminDuty", root, stopAdminDuty )


addEventHandler ( "changeHitglocke", root, function ( bool )
	hitglocke = bool
end )


local firetoggle = false
local frozen = false
addEventHandler ( "onClientPlayerNetworkStatus", root, function ( status )
	if status == 0 then
		if (not isElementFrozen(localPlayer)) then
			setElementFrozen(localPlayer, true)
			frozen = true
		end
		if isControlEnabled ( "fire" ) then
			toggleControl ( "fire", false )
			firetoggle = true
		end
	elseif (status == 1) then
		if (frozen) then
			setElementFrozen(localPlayer, false)
			frozen = false
		end
		if firetoggle then
			toggleControl ( "fire", true )
			firetoggle = false
		end
	end
end )

