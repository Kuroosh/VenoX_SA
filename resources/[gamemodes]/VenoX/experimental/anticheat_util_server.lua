-- anticheat_util_server.lua ( Diese Datei ) MUSS in JEDE Resource importiert werden!!!
-- D.h. sie muss in der Meta jeder Resource als serverseitiges Script deklariert & eingefügt sein

shield = getResourceFromName ( "shield" )

_giveWeapon = giveWeapon
_giveWeaponAmmo = giveWeaponAmmo
_setWeaponAmmo = setWeaponAmmo
_givePedJetPack = givePedJetPack
_setElementPosition = setElementPosition

function setElementPosition ( player, x, y, z, warp )

	local bool
	
	bool = call ( shield, "setElementPosition", player, x, y, z, warp )
	if not bool then
		bool = _setElementPosition ( player, x, y, z, warp )
	end
	return bool
end

function giveWeapon ( player, weapon, ammo, current )

	local bool
	
	bool = call ( shield, "giveWeapon", player, weapon, ammo, current )
	if not bool then
		bool = _giveWeapon ( player, weapon, ammo, current )
	end
	return bool
end

function giveWeaponAmmo ( player, weapon, ammo )

	local bool
	
	bool = call ( shield, "giveWeaponAmmo", player, weapon, ammo )
	if not bool then
		bool = _giveWeaponAmmo ( player, weapon, ammo )
	end
	return bool
end

function setWeaponAmmo ( player, weapon, totalAmmo, ammoInClip )

	local bool
	
	bool = call ( shield, "setWeaponAmmo", player, weapon, totalAmmo, ammoInClip )
	if not bool then
		bool = _setWeaponAmmo ( player, weapon, totalAmmo, ammoInClip )
	end
	return bool
end

function givePedJetPack ( player )

	local bool
	
	bool = call ( shield, "givePedJetPack", player )
	if not bool then
		bool = _givePedJetPack ( player )
	end
	return _givePedJetPack ( player )
end
