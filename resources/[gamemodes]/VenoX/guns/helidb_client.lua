-------------------------
------- (c) 2010 --------
------- by Zipper -------
-- and Vio MTA:RL Crew --
-------------------------

function helidbCameraFix_func ()

	setCameraClip ( false, true )
end
addEvent ( "helidbCameraFix", true )
addEventHandler ( "helidbCameraFix", getLocalPlayer(), helidbCameraFix_func )

function helidbGunAuslese_func ( which )

	local player = getLocalPlayer()
	curslot = getPedWeaponSlot ( player )
	local pistol = getPedWeapon ( player, 2 )
	local shotgun = getPedWeapon ( player, 3 )
	local mp = getPedWeapon ( player, 4 )
	local assault = getPedWeapon ( player, 5 )
	local rifles = getPedWeapon ( player, 6 )
	local heavy = getPedWeapon ( player, 7 )
	local gas = getPedWeapon ( player, 8 )
	if which == "up" then
		if curslot < 2 or curslot >= 7 then
			if pistol == 23 or pistol == 24 then
				setPedWeaponSlot ( player, 2 )
			else
				curslot = 2
			end
		end
		if curslot == 2 then
			if shotgun == 25 or shotgun == 27 then
				setPedWeaponSlot ( player, 3 )
			else
				curslot = 3
			end
		end
		if curslot == 3 then
			if mp == 29 then
				setPedWeaponSlot ( player, 4 )
			else
				curslot = 4
			end
		end
		if curslot == 4 then
			if assault == 30 or assault == 31 then
				setPedWeaponSlot ( player, 5 )
			else
				curslot = 5
			end
		end
		if curslot == 5 then
			if rifles == 33 then
				setPedWeaponSlot ( player, 6 )
			else
				curslot = 6
			end
		end
		if curslot == 6 then
			if heavy ~= 0 then
				setPedWeaponSlot ( player, 7 )
			else
				curslot = 7
			end
		end
		if curslot == 7 then
			if gas ~= 0 then
				setPedWeaponSlot ( player, 8 )
			end
		end
	else
		if curslot > 8 or curslot < 2 then
			if gas ~= 0 then
				setPedWeaponSlot ( player, 8 )
			else
				curslot = 8
			end
		end
		if curslot == 8 then
			if heavy ~= 0 then
				setPedWeaponSlot ( player, 7 )
			else
				curslot = 7
			end
		end
		if curslot == 7 then
			if rifles == 33 then
				setPedWeaponSlot ( player, 6 )
			else
				curslot = 6
			end
		end
		if curslot == 6 then
			if assault == 30 or assault == 31 then
				setPedWeaponSlot ( player, 5 )
			else
				curslot = 5
			end
		end
		if curslot == 5 then
			if mp == 29 then
				setPedWeaponSlot ( player, 4 )
			else
				curslot = 4
			end
		end
		if curslot == 4 then
			if shotgun == 25 or shotgun == 27 then
				setPedWeaponSlot ( player, 3 )
			else
				curslot = 3
			end
		end
		if curslot == 3 then
			if pistol == 23 or pistol == 24 then
				setPedWeaponSlot ( player, 2 )
			else
				curslot = 2
			end
		end
		if curslot == 2 then
			if gas ~= 0 then
				setPedWeaponSlot ( player, 8 )
			end
		end
	end
end
addEvent ( "helidbGunAuslese", true )
addEventHandler ( "helidbGunAuslese", getLocalPlayer(), helidbGunAuslese_func )