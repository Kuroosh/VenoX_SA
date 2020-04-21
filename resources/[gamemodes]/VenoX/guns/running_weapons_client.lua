--[[weaponsWithDisabledRunning = {
 [28]=true,
 [32]=true
}

function changeWeapon ( prev, cur )

	if weaponsWithDisabledRunning[getPedWeapon ( lp )] then
		rwControlState = isControlEnabled ( "fire" )
		toggleControl ( "fire", false )
	elseif weaponsWithDisabledRunning[getPedWeapon ( lp, prev )] then
		toggleControl ( "fire", rwControlState )
	end
end
addEventHandler ( "onClientPlayerWeaponSwitch", lp, changeWeapon )

bindKey ( "aim_weapon", "down",
	function ()
		if getPedWeapon ( lp ) >= 1 then
			triggerEvent ( "onClientPlayerAimWeapon", lp )
		end
	end
)
addEvent ( "onClientPlayerAimWeapon", true )

function playerStartAimWeapon ()

	if weaponsWithDisabledRunning[getPedWeapon ( lp )] then
		toggleControl ( "forwards", false )
		toggleControl ( "backwards", false )
		toggleControl ( "left", false )
		toggleControl ( "right", false )
		toggleControl ( "fire", rwControlState )
		reAdjustAim ()
	end
end
addEventHandler ( "onClientPlayerAimWeapon", getRootElement(), playerStartAimWeapon )

function reAdjustAim ()

	if getControlState ( "aim_weapon" ) then
		local x1, y1, z1 = getElementPosition ( lp )
		local x2, y2, z2 = getPedTargetEnd ( lp )
		local rot = findRotation ( x1, y1, x2, y2 )
		setPedRotation ( lp, rot )
		setTimer ( reAdjustAim, 50, 1 )
	else
		toggleControl ( "forwards", true )
		toggleControl ( "backwards", true )
		toggleControl ( "left", true )
		toggleControl ( "right", true )
		toggleControl ( "fire", false )
	end
end]]