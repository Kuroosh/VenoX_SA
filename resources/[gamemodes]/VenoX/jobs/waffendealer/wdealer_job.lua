function sellgun_func ( player, cmd, target, ggst, ammo )

	if target and getPlayerFromName ( target ) then
		local target = getPlayerFromName ( target )
		if tonumber(vnxGetElementData ( target, "gunlicense" )) == 1 then
			local tx, ty, tz = getElementPosition ( target )
			local x, y, z = getElementPosition ( player )
			if getDistanceBetweenPoints3D ( tx, ty, tz, x, y, z ) < 10 then
				local sellingFromGunTruckVan = false
				local veh = getPedOccupiedVehicle ( player )
				if veh then
					--print ( "1" )
					if vnxGetElementData ( veh, "mats" ) then
						local faction = getPlayerFaction ( player )
						if faction ~= 9 then
							outputChatBox ( "Du hast keinen Schluessel fuer den Materialien-Tresor!", player, 125, 0, 0 )
							return
						end
					
						sellingFromGunTruckVan = true
						--print ( "2" )
					end
				end
				--outputChatBox ( tostring ( vnxGetElementData ( getPedOccupiedVehicle ( player ), "mats" ) ) )
				if not sellingFromGunTruckVan then
					mats = tonumber ( vnxGetElementData ( player, "mats" ) )
				else
					mats = vnxGetElementData ( veh, "mats" )
				end
				vnxSetElementData ( player, "lastcrime", "mats" )
				if ggst == "9mmsd" then
					if mats >= 10 then
						outputChatBox ( "[Sell-Gun] : Momentan nicht Verfügbar.", player, 125, 0, 0 )
					else infobox ( player, "Du hast nicht\ngenug Materialien!", 5000, 125, 0, 0 ) end
				elseif ggst == "9mm" then
					if mats >= 7 then
						if sellingFromGunTruckVan then
							vnxSetElementData ( getPedOccupiedVehicle ( player ), "mats", mats - 7 )
						else
							vnxSetElementData ( player, "mats", mats - 7 )
						end
						playSoundFrontEnd ( player, 40 )
						playSoundFrontEnd ( target, 40 )
						
						local weapon = 22
						local ammo = 85
						giveWeapon ( target, weapon, ammo, true )
					else infobox ( player, "Du hast nicht\ngenug Materialien!", 5000, 125, 0, 0 ) end
				elseif ggst == "eagle" then
					if mats >= 20 then
						if sellingFromGunTruckVan then
							vnxSetElementData ( getPedOccupiedVehicle ( player ), "mats", mats - 20 )
						else
							vnxSetElementData ( player, "mats", mats - 20 )
						end
						playSoundFrontEnd ( player, 40 )
						playSoundFrontEnd ( target, 40 )
						
						local weapon = 24
						local ammo = 35
						giveWeapon ( target, weapon, ammo, true )
					else infobox ( player, "Du hast nicht\ngenug Materialien!", 5000, 125, 0, 0 ) end
				elseif ggst == "shotgun" then
					if mats >= 10 then
						if sellingFromGunTruckVan then
							vnxSetElementData ( getPedOccupiedVehicle ( player ), "mats", mats - 10 )
						else
							vnxSetElementData ( player, "mats", mats - 10 )
						end
						playSoundFrontEnd ( player, 40 )
						playSoundFrontEnd ( target, 40 )
						
						local weapon = 25
						local ammo = 15
						giveWeapon ( target, weapon, ammo, true )
					else infobox ( player, "Du hast nicht\ngenug Materialien!", 5000, 125, 0, 0 ) end
				elseif ggst == "mp5" then
					if mats >= 17 then
						if sellingFromGunTruckVan then
							vnxSetElementData ( getPedOccupiedVehicle ( player ), "mats", mats - 17 )
						else
							vnxSetElementData ( player, "mats", mats - 17 )
						end
						playSoundFrontEnd ( player, 40 )
						playSoundFrontEnd ( target, 40 )
						
						local weapon = 29
						local ammo = 150
						giveWeapon ( target, weapon, ammo, true )
					else infobox ( player, "Du hast nicht\ngenug Materialien!", 5000, 125, 0, 0 ) end
				elseif ggst == "messer" then
					if mats >= 3 then
						if sellingFromGunTruckVan then
							vnxSetElementData ( getPedOccupiedVehicle ( player ), "mats", mats - 3 )
						else
							vnxSetElementData ( player, "mats", mats - 3 )
						end
						playSoundFrontEnd ( player, 40 )
						playSoundFrontEnd ( target, 40 )
						
						local weapon = 4
						local ammo = 1
						giveWeapon ( target, weapon, ammo, true )
					else infobox ( player, "Du hast nicht\ngenug Materialien!", 5000, 125, 0, 0 ) end
				elseif ggst == "gewehr" then
					if mats >= 10 then
						if sellingFromGunTruckVan then
							vnxSetElementData ( getPedOccupiedVehicle ( player ), "mats", mats - 10 )
						else
							vnxSetElementData ( player, "mats", mats - 10 )
						end
						playSoundFrontEnd ( player, 40 )
						playSoundFrontEnd ( target, 40 )
						
						local weapon = 33
						local ammo = 15
						giveWeapon ( target, weapon, ammo, true )
					else infobox ( player, "Du hast nicht\ngenug Materialien!", 5000, 125, 0, 0 ) end
				elseif ggst == "ak47" then
					if mats >= 25 then
						if sellingFromGunTruckVan then
							vnxSetElementData ( getPedOccupiedVehicle ( player ), "mats", mats - 25 )
						else
							vnxSetElementData ( player, "mats", mats - 25 )
						end
						playSoundFrontEnd ( player, 40 )
						playSoundFrontEnd ( target, 40 )
						
						local weapon = 30
						local ammo = 150
						giveWeapon ( target, weapon, ammo, true )
					else infobox ( player, "Du hast nicht\ngenug Materialien!", 5000, 125, 0, 0 ) end
				elseif ggst == "mats" and not sellingFromGunTruckVan then
					if not ammo then ammo = 5 else ammo = tonumber ( ammo ) end
					if mats >= ammo then
						vnxSetElementData ( player, "mats", mats - ammo )
						playSoundFrontEnd ( player, 40 )
						playSoundFrontEnd ( target, 40 )
						
						vnxSetElementData ( target, "mats", tonumber ( vnxGetElementData ( target, "mats" ) ) + ammo )
						outputChatBox ( "Du hast soeben "..ammo.." Materialien erhalten!", target, 0, 125, 0 )
						outputChatBox ( "Du hast soeben "..ammo.." Materialien an "..getPlayerName(target).." gegeben!", player, 0, 125, 0 )
					else
						infobox ( player, "Du hast nicht\ngenug Materialien!", 5000, 125, 0, 0 )
					end
				else
					gunhelp_func ( player )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist zu\nweit weg!", 7000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nFehler! Der\nSpieler hat keinen\nWaffenschein!", 7000, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nFehler!\nGebrauch: /sellgun\n[Ziel] [Gegenstand]", 7000, 125, 0, 0 )
	end
end
addEvent ( "sellgun", true )
addEventHandler ( "sellgun", getRootElement(), sellgun_func )
addCommandHandler ( "sellgun", sellgun_func )

function gunhelp_func ( player )
	
	outputChatBox ( "Mgl.: 9mm | 7 Mats, eagle | 20 Mats", player, 200, 200, 0 )
	outputChatBox ( "shotgun | 10 Mats, mp5 | 17 Mats, messer | 3 Mats", player, 200, 200, 0 )
	outputChatBox ( "gewehr | 10 Mats, ak47 | 25 Mats, mats | 5 Mats", player, 200, 200, 0 )
end
addCommandHandler ( "gunhelp", gunhelp_func )

function buymats_func ( player )
	
	if vnxGetElementData ( player, "job" ) == "wdealer" then
		if vnxGetElementData ( player, "money" ) >= 200 then
			if tonumber ( vnxGetElementData ( player, "jobtime" ) ) == 0 then
				local x, y, z = getElementPosition ( player )
				if getDistanceBetweenPoints3D ( -2627.5083007813, 209.36631774902, 4.1959328651428, x, y, z ) < 10 then
					vnxSetElementData ( player, "lastcrime", "mats" )
					vnxSetElementData ( player, "mats", tonumber ( vnxGetElementData ( player, "mats" ) ) + 20 )
					vnxSetElementData ( player, "jobtime", 5 )
					vnxSetElementData ( player, "money", vnxGetElementData(player,"money")-200 )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist zu\nweit weg!", 7000, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu musst noch\n"..vnxGetElementData(player,"jobtime").." Minuten warten!", 7000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast zu\nwenig Geld!", 7000, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein\nWaffendealer!", 7000, 125, 0, 0 )
	end
end
addCommandHandler ( "buymats", buymats_func )