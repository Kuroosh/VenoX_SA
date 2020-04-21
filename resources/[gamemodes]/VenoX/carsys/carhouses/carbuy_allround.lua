function carbuy ( player, carprice, vehid, spawnx, spawny, spawnz, rx, ry, rz, c1, c2, c3, c4, p, ec, Tuning, STuning )
	local carprice = carprice
	local vehid = tonumber ( vehid )
	local spawnx = tonumber ( spawnx )
	local spawny = tonumber ( spawny )
	local spawnz = tonumber ( spawnz )
	local Tuning = Tuning
	local STuning = STuning
	local pname = getPlayerName ( player )
	local hasCamper = false
	
	if not carprices[vehid] then
		if aiCarPrices[vehid] then
			table.insert ( carprices, vehid, aiCarPrices[vehid] )
		end
	end

	if camper[vehid] then
		local dsatz = dbPoll ( dbQuery ( handler, "SELECT Typ from vehicles WHERE ??=?", "UID", playerUID[pname] ), -1 )
		if dsatz and dsatz[1] then
			for i=1, #dsatz do
				if camper[tonumber(dsatz[i]["Typ"])] then
					outputChatBox ( "Du kannst nur einen Wohnwagen haben!", player, 125, 0, 0 )
					return
				end
			end
		end
	end
	
	local slot = 0
	local differenz = 0
	if carprices[vehid] or vnxGetElementData ( player, "everyCarBuyableForFree" ) then
		if vnxGetElementData ( player, "maxcars" ) > vnxGetElementData ( player, "curcars" ) then
			for i=1, vnxGetElementData ( player, "maxcars" ) do
				if vnxGetElementData ( player, "carslot"..i ) == 0 then
					slot = i
					break
				end
			end
			if slot > 0 then
				if not vnxGetElementData ( player, "everyCarBuyableForFree" ) then
					if carprices[tonumber(vehid)] then
						carprice = carprices[tonumber(vehid)]
					end
					if ec then
						differenz = vnxGetElementData ( player, "bankmoney" ) - carprice
					else
						differenz = vnxGetElementData ( player, "money" ) - carprice
					end
				end
				if vnxGetElementData ( player, "everyCarBuyableForFree" ) or differenz >= 0 then
					if hasPlayerLicense ( player, tonumber(vehid) ) then
						setElementDimension ( player, 0 )
						setElementInterior ( player, 0 )
						fadeCamera( player, true)
						setCameraTarget( player, player )
						local vehicle = createVehicle ( vehid, spawnx, spawny, spawnz, 0, 0, 0, pname )
						allPrivateCars[pname][slot] = vehicle
						vnxSetElementData ( vehicle, "owner", pname )
						vnxSetElementData ( vehicle, "name", vehicle )
						vnxSetElementData ( vehicle, "carslotnr_owner", slot )
						vnxSetElementData ( vehicle, "locked", true )
						vnxSetElementData ( vehicle, "fuelstate", 100 )		
						setVehicleLocked ( vehicle, true )
						vnxSetElementData ( player, "carslot"..slot, 1 )
						vnxSetElementData ( player, "curcars", vnxGetElementData ( player, "curcars" )+1 )
						vnxSetElementData ( player, "FahrzeugeGekauft", vnxGetElementData ( player, "FahrzeugeGekauft" ) + 1 )
						if not Tuning then
							Tuning = "|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|"
						end
						setVehicleRotation ( vehicle, rx, ry, rz )
						
						local Farbe1, Farbe2, Farbe3, Farbe4
						local Paintjob
							
						if not c1 or not c2 or not c3 or not c4 then
							Farbe1, Farbe2, Farbe3, Farbe4 = getVehicleColor ( vehicle )
						else
							Farbe1, Farbe2, Farbe3, Farbe4 = c1, c2, c3, c4
							setVehicleColor ( vehicle, c1, c2, c3, c4 )
						end
						if not p then
							Paintjob = getVehiclePaintjob ( vehicle )
						else
							Paintjob = p
							setVehiclePaintjob ( vehicle, p )
						end
						if not STuning then
							STuning = "1|0|0|1|0|0|"
						end
						vnxSetElementData ( vehicle, "stuning", "1|0|0|1|0|0|" )
						local color = "|"..Farbe1.."|"..Farbe2.."|"..Farbe3.."|"..Farbe4.."|"
						vnxSetElementData ( vehicle, "color", color )
						vnxSetElementData ( vehicle, "lcolor", "|255|255|255|" )
						vnxSetElementData ( vehicle , "sportmotor", 0 )
						vnxSetElementData ( vehicle , "bremse", 0 )
						local antrieb = getVehicleHandling(vehicle)["driveType"]
						vnxSetElementData ( vehicle, "antrieb", antrieb )
						vnxSetElementData(vehicle, "v1p", false)
						setPrivVehCorrectLightColor ( vehicle )
							
						specPimpVeh ( vehicle )
						SaveCarData ( player )
						outputChatBox ( "Glückwunsch, du hast das Fahrzeug gekauft! Tippe /vehhelp für mehr Infomationen oder rufe das Hilfemenü auf!", player, 0, 255, 0 )
						giveAchievement( player, 5 )
							
						if not vnxGetElementData ( player, "everyCarBuyableForFree" ) then
							if ec then
								vnxSetElementData ( player, "bankmoney", vnxGetElementData ( player, "bankmoney" ) - carprice )
								triggerClientEvent ( player, "createNewStatementEntry", player, "Fahrzeugkauf\n", carprice * -1, getVehicleNameFromModel ( vehid ).."\n" )
							else
								vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - carprice )
							end
						end
						warpPedIntoVehicle ( player, vehicle )
							
						--if vnxGetElementData ( player, "playingtime" ) <= 300 then
						--	local text = "Du hast soeben ein Fahrzeug erworben!\nHier einige kurze Hinweise:\n\n1. Du kannst dein Fahrzeug mit /park an einem neuen\nOrt abstellen - dort wird es nach einem Server-\nrestart oder wenn du /towveh eintippst, erscheinen.\n\n2. Den Motor schaltest du mit \"X\" ein und aus.\n\n3. Mit /lock kannst du dein Fahrzeug abschliessen.\n\n4. Parke dein Fahrzeug nur an angemessenen Stellen,\nsonst wird es moeglicherweise geloescht.\nNicht angemessene Stellen sind z.b. auf der Strasse oder\nan wichtigen Stellen ( z.b. dem Eingang der Stadthalle ).\n\nFuer mehr: /vehinfos"
						--	prompt ( player, text, 30 )
						--end
						
						if not dbExec ( handler, "INSERT INTO vehicles (UID, Typ, Tuning, Spawnpos_X, Spawnpos_Y, Spawnpos_Z, Spawnrot_X, Spawnrot_Y, Spawnrot_Z, Farbe, Paintjob, Benzin, Slot, STuning, Sportmotor, Bremse, Antrieb, v1p) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", playerUID[pname], vehid, Tuning, spawnx, spawny, spawnz, rx, ry, rz, color, Paintjob, '100', slot, STuning, '0', '0', antrieb)  then
							outputDebugString ( "[carbuy] Error executing the query" )
							destroyElement ( vehicle )
						end
							
						activeCarGhostMode ( player, 10000 )
						triggerClientEvent ( player, "leaveCarhouse", player )
						
						setElementPosition ( vehicle, spawnx, spawny, spawnz )
						outputLog ( getPlayerName ( player ).." hat ein Auto gekauft ( "..getVehicleNameFromModel ( vehid ).." )", "vehicle" )

						return true
					else
						outputChatBox ( "Du hast nicht die erforderlichen Scheine / Boni!", player, 125, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht\ngenug Geld! Das\nFahrzeug kostet\n"..carprice.." $!", 5000, 125, 0, 0 )
				end	
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast keinen\nfreien Fahrzeugslot!\nTippe /sellcar, um\neines deiner Fahr-\nzeuge zu ver-\nkaufen.", 5000, 125, 0, 0 )
			end
		else 
			triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast bereits zuviele\nFahrzeuge, zerstoere oder\nverkaufe eines deiner\nalten!", 5000, 255, 0, 0 )
		end
	else
		outputChatBox ( "Du hast nicht die erforderlichen Scheine / Boni!", player, 125, 0, 0 )
	end
	setCameraTarget( player, player )
	triggerClientEvent ( player, "leaveCarhouse", player )
	return false
end


function getFreeCarSlot ( player )

	if vnxGetElementData ( player, "maxcars" ) > vnxGetElementData ( player, "curcars" ) then
		local cars = 0
		for i = 1, vnxGetElementData ( player, "maxcars" ) do
			if vnxGetElementData ( player, "carslot"..i ) == 0 then
				return i
			end
		end
	else
		return false
	end
end