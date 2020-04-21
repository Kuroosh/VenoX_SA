-- Semi = Einzelschuss, Burst = Feuerstoß, Auto = Automatik

local firestate = "auto"
local kindOfAmmo = ""
local ammoKindEventHandled = false
local isEvent = false

fireModeWeapons = {
 [29]=350,
 [30]=350,
 [31]=350
 }

local x = math.floor ( 1338 / 1680 * screenwidth + 0.5 )
local x2 = math.floor ( 1325 / 1680 * screenwidth + 0.5 )
local y = math.floor ( 30 / 1050 * screenheight + 0.5 )
local y2 = math.floor ( 5 / 1050 * screenheight + 0.5 )

local size = 1 / 1650 * screenwidth

function weaponStateRender ()
	dxDrawText(firestate,x+1,y,999,999,tocolor(0,0,0,255),size,"pricedown","left","top",false,false,false)
	dxDrawText(firestate,x,y-1,999,999,tocolor(255,255,255,255),size,"pricedown","left","top",false,false,false)
end
function kindOfAmmoRender ()
	dxDrawText(kindOfAmmo,x+1,y2,999,999,tocolor(0,0,0,255),size,"pricedown","left","top",false,false,false)
	dxDrawText(kindOfAmmo,x,y2-1,999,999,tocolor(255,255,255,255),size,"pricedown","left","top",false,false,false)
end

local removeAmmoKindEventHandlerTimer


function showWeaponFireState ( bool )

	if fireModeWeapons[getPedWeapon ( lp )] or bool then
		bindFireModeChangeKey ()
		if not isEvent then
			addEventHandler ( "onClientRender", getRootElement(), weaponStateRender )
			isEvent = true
		end
	end
end
function hideWeaponFireState ()

	if isEvent then
		removeEventHandler ( "onClientRender", getRootElement(), weaponStateRender )
		isEvent = false
	end
end
function weaponFireModeDecision ( weapon )

	if fireModeWeapons[weapon] and source == lp then
		if firestate == "auto" then
			-- Vollautomatik = GTA-Standart
		elseif firestate == "semi" and not isTimer ( weaponModeTimer ) then
			setPedControlState ( "fire", false )
			toggleControl ( "fire", false )
			weaponModeTimer = setTimer ( toggleControl, 250, 1, "fire", true )
		elseif firestate == "burst" and not isTimer ( weaponModeTimer ) then
			burstFire ( weapon )
		else
			cancelEvent ()
		end
	end
end
addEventHandler ( "onClientPlayerWeaponFire", getRootElement(), weaponFireModeDecision )

function burstFire ( weapon )

	weapon = getPedWeapon ( lp )
	if getPedControlState ( "fire" ) and fireModeWeapons[weapon] then
		setTimer ( setPedControlState, fireModeWeapons[weapon], 1, "fire", false )
		setTimer ( toggleControl, fireModeWeapons[weapon], 1, "fire", false )
		weaponModeTimer = setTimer ( toggleControl, fireModeWeapons[weapon]*2, 1, "fire", true )
		setTimer ( burstFire, fireModeWeapons[weapon]*2, 1, weapon )
	end
end

function changeFireMode ()

	if fireModeWeapons[getPedWeapon ( lp )] and not getPedOccupiedVehicle ( lp ) then
		if firestate == "auto" then
			if ( getElementData ( lp, "fraktion" ) == 8 and vnxClientGetElementData ( "rang" ) >= 1 ) or getElementData ( lp, "fraktion" ) ~= 8 then
				firestate = "burst"
			elseif getElementData ( lp, "fraktion" ) == 8 and vnxClientGetElementData ( "rang" ) == 0 then
				firestate = "semi"
			end
		elseif firestate == "burst" then
			firestate = "semi"
		else
		-- firestate == "semi"
			if getElementData ( lp, "fraktion" ) == 8 and vnxClientGetElementData ( "rang" ) >= 1 then
				firestate = "burst"
			elseif getElementData ( lp, "fraktion" ) ~= 8 then
				firestate = "semi"
			end
			firestate = "auto"
		end
		showWeaponFireState ()
		setTimer ( hideWeaponFireState, 1500, 1 )
		playSoundFrontEnd ( 41 )
	end
end

function bindFireModeChangeKey ()

	if getElementData ( lp, "fraktion" ) == 8 then
		if vnxClientGetElementData ( "rang" ) > 1 then
			firestate = "auto"
		elseif vnxClientGetElementData ( "rang" ) == 1 then
			firestate = "burst"
		else
			firestate = "semi"
		end
	end
	unbindKey ( "x", "down", changeFireMode )
	bindKey ( "x", "down", changeFireMode )
end