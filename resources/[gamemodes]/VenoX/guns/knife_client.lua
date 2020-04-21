function disableKnifeAimKill ( prev, next, player )

	local prevW = getPedWeapon ( lp, prev )
	local nextW = getPedWeapon ( lp, next )
	if source == lp then
		if prevW == 43 then
			setHudLessModeEnabled ( false )
		elseif nextW == 43 then
			setHudLessModeEnabled ( true )
		end
		if nextW == 4 then
			toggleControl ( "aim_weapon", false )
		else
			toggleControl ( "aim_weapon", true )
		end
	end
end
addEventHandler ( "onClientPlayerWeaponSwitch", getRootElement(), disableKnifeAimKill )