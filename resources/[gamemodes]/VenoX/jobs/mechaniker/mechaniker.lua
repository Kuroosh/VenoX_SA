mechanikerjobicon = createPickup ( -2032.45, 161.38, 28.74, 3, 1239, 1000, 0 )

mechanikerjobiconblip = createBlip ( -2032.45, 161.38, 28.74, 58, 2, 255, 0, 0, 255, 0, 200 )
setElementVisibleTo ( mechanikerjobiconblip, getRootElement(), false )

function jobicon_mechaniker ( player )
	
	triggerClientEvent ( player, "infobox_start", getRootElement(), "\nTippe /job, um\nMechaniker zu\nwerden.", 7500, 200, 200, 0 )
end
addEventHandler ( "onPickupHit", mechanikerjobicon, jobicon_mechaniker )

function repair_func ( player, cmd, target, price )

	if vnxGetElementData ( player, "job" ) == "mechaniker" then
		if tonumber ( price ) and getPlayerFromName ( target ) then
			local jobtime = tonumber ( vnxGetElementData ( player, "jobtime" ) )
			if jobtime == 0 then
				local price = math.abs ( math.floor ( tonumber ( price ) ) )
				local target = getPlayerFromName ( target )
				outputChatBox ( "Mechaniker "..getPlayerName ( player ).." hat dir angeboten, dein Auto fuer "..price.." $ zu reparieren. Tippe /acceptrepair zum annehmen.", target, 0, 100, 200 )
				outputChatBox ( "Du hast "..getPlayerName(target).." angeboten, sein Auto fuer "..price.." $ zu reparieren.", player, 0, 100, 200 )
				vnxSetElementData ( target, "mechaniker", getPlayerName ( player ) )
				vnxSetElementData ( target, "mechanikerpreis", price )
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu musst noch\n"..jobtime.." Minuten warten,\nbis du wieder\nreparieren kannst!", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nUngueltige Angaben!\nTippe /repair [Name]\n[Preis], um ein\nFahrzeug zu re-\nparieren.", 7500, 200, 200, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein\nMechaniker!", 7500, 125, 0, 0 )
	end
end

addCommandHandler ( "repair", repair_func )

function acceptrepair_func ( player )
	
	local tname = vnxGetElementData ( player, "mechaniker" )
	local target = getPlayerFromName ( tname )
	if isElement ( target ) and isElement ( player ) then
		local price = vnxGetElementData ( player, "mechanikerpreis" )
		local x1, y1, z1 = getElementPosition ( target )
		local x2, y2, z2 = getElementPosition ( player )
		local money = vnxGetElementData ( player, "money" )
		local jobtime = tonumber ( vnxGetElementData ( target, "jobtime" ) )
		if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) < 5 then
			if getPedOccupiedVehicle ( player ) then
				local vx, vy, vz = getElementVelocity ( getPedOccupiedVehicle ( player ) )
				local speed = math.sqrt ( vx ^ 2 + vy ^ 2 + vz ^ 2 )
				if speed < 5 * 0.00464 then
					if money >= price then
						if jobtime == 0 then
							vnxSetElementData ( player, "money", money - price )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							playSoundFrontEnd ( player, 46 )
							vnxSetElementData ( target, "money", vnxGetElementData ( target, "money" ) + price )
							triggerClientEvent ( target, "HudEinblendenMoney", getRootElement() )
							playSoundFrontEnd ( target, 40 )
							local veh = getPedOccupiedVehicle ( player )
							local carhealth = getElementHealth ( veh )
							fixVehicle ( veh )
							setElementHealth ( veh, carhealth + 200 )
							if vnxGetElementData ( veh, "stuning2" ) then
								if vnxGetElementData ( veh, "stuning2" ) >= 1 then
									vehMaxHealth = 1700
								else
									vehMaxHealth = 1000
								end
							else
								vehMaxHealth = 1000
							end
							if getElementHealth ( veh ) > vehMaxHealth then
								setElementHealth ( veh, vehMaxHealth )
							end
							vnxSetElementData ( target, "jobtime", jobtime + 3 )
							vnxSetElementData ( player, "mechaniker", "" )
							vnxSetElementData ( player, "mechanikerpreis", "" )
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDer Mechaniker kann\nnoch nicht wieder\nreparieren!", 7500, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast zu\nwenig Geld!", 7500, 125, 0, 0 )
					end
				else
					infobox ( player, "Das Fahrzeug darf\nnicht fahren!", 5000, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist in\nkeinem Fahrzeug!", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist zu\nweit weg!", 7500, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "acceptrepair", acceptrepair_func )

function tunen_func ( player, cmd, target, price )

	if vnxGetElementData ( player, "job" ) == "mechaniker" then
		if tonumber ( price ) and getPlayerFromName ( target ) then
			local price = math.abs ( math.floor ( tonumber ( price ) ) )
			local target = getPlayerFromName ( target )
			outputChatBox ( "Mechaniker "..getPlayerName ( player ).." hat dir angeboten, dein Auto fuer "..price.." $ zu tunen. Tippe /accepttune zum annehmen.", target, 0, 100, 200 )
			outputChatBox ( "Du hast "..getPlayerName(target).." angeboten, sein Auto fuer "..price.." $ zu tunen.", player, 0, 100, 200 )
			vnxSetElementData ( target, "mechanikert", getPlayerName ( player ) )
			vnxSetElementData ( target, "mechanikertpreis", price )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nUngueltige Angaben!\nTippe /tunen [Name]\n[Preis], um ein\nFahrzeug zu tun-\nen", 7500, 200, 200, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein\nMechaniker!", 7500, 125, 0, 0 )
	end
end
addCommandHandler ( "tunen", tunen_func )

function accepttune_func ( player )
	
	local tname = vnxGetElementData ( player, "mechanikert" )
	local target = getPlayerFromName ( tname )
	local price = tonumber ( vnxGetElementData ( player, "mechanikertpreis" ) )
	local x1, y1, z1 = getElementPosition ( target )
	local x2, y2, z2 = getElementPosition ( player )
	local money = vnxGetElementData ( player, "money" )
	local jobtime = tonumber ( vnxGetElementData ( target, "jobtime" ) )
	local veh = getPedOccupiedVehicle ( player )
	if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) < 5 then
		if getPedOccupiedVehicle ( player ) then
			if money >= price then
				if jobtime == 0 then
					vnxSetElementData ( player, "money", money - price )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					playSoundFrontEnd ( player, 46 )
					vnxSetElementData ( target, "money", vnxGetElementData ( target, "money" ) + price )
					triggerClientEvent ( target, "HudEinblendenMoney", getRootElement() )
					playSoundFrontEnd ( target, 40 )
					vnxSetElementData ( player, "jobtime", jobtime + 5 )
					addVehicleUpgrade ( veh, 1010 )
					vnxSetElementData ( player, "mechanikert", "" )
					vnxSetElementData ( player, "mechanikertpreis", "" )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDer Mechaniker kann\nnoch nicht wieder\nreparieren!", 7500, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast zu\nwenig Geld!", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist in\nkeinem Auto!", 7500, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist zu\nweit weg!", 7500, 125, 0, 0 )
	end
end
addCommandHandler ( "accepttune", accepttune_func )