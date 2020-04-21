local reloadigPlayers = {}

function reload (player, key, state)
	
	local total_clip = 0
	local cur_gun = getPedWeapon ( player )
	if getPedWeapon ( player ) == 22 or getPedWeapon ( player ) == 23 then
		total_clip = 17
	elseif getPedWeapon ( player ) == 24 or getPedWeapon ( player ) == 27 then
		total_clip = 7
	elseif getPedWeapon ( player ) == 26 then
		total_clip = 2
	elseif getPedWeapon ( player ) == 28 or getPedWeapon ( player ) == 32 or getPedWeapon ( player ) == 31 or getPedWeapon ( player ) == 37 then
		total_clip = 50
	elseif getPedWeapon ( player ) == 29 or getPedWeapon ( player ) == 30 then
		total_clip = 30
	elseif getPedWeapon ( player ) == 41 or getPedWeapon ( player ) == 42 or getPedWeapon ( player ) == 38 then
		total_clip = 500
	end
	if total_clip > 0 then
		if getPedWeaponSlot ( player ) > 1 and getPedWeaponSlot ( player ) < 10 and getPedWeaponSlot ( player ) ~= 6 and getPedWeaponSlot ( player ) ~= 8 and getPedWeapon ( player ) ~= 25 and getPedWeapon ( player ) ~= 35 and getPedWeapon ( player ) ~= 36 and getPedWeapon ( player ) ~= 25 then
			if state == "down" then
				if isPedOnGround ( player ) or getPedOccupiedVehicle ( player ) then
					local ammo_outclip = getPedTotalAmmo ( player ) - getPedAmmoInClip ( player, getPedWeaponSlot ( player ) )
					if ammo_outclip >= total_clip then
						if not reloadigPlayers[player] then
							if not getControlState ( player, "aim_weapon" ) then
								local cur_clip = getPedAmmoInClip ( player )
								--takeWeapon ( player, getPedWeapon ( player ), cur_clip ) deaktiviert wegen muni nachlade bug
								giveWeapon ( player, getPedWeapon ( player ), 0, true )
								setControlState ( player, "fire", false )
								setControlState ( player, "aim_weapon", false )
								setTimer ( reloadPedWeapon, 250, 1, player )
								triggerClientEvent ( player, "reload_settimer_trigger", getRootElement(), total_clip, cur_clip )
								reloadigPlayers[player] = true
								setTimer (
									function ( player )
										reloadigPlayers[player] = nil
									end,
								3000, 1, player )
							end
						end
					end
				end
			end
		end
	end
end

--[[function reload_keybind()

	bindKey ( source, "r", "down", reload )
end
addEventHandler ("onPlayerJoin", getRootElement(), reload_keybind)]]