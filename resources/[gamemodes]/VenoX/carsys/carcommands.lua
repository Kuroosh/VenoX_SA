vehBlipColor = {}
	vehBlipColor["r"] = {}
	vehBlipColor["g"] = {}
	vehBlipColor["b"] = {}
		color = 1
		vehBlipColor["r"][color] = 255
		vehBlipColor["g"][color] = 0
		vehBlipColor["b"][color] = 0
		color = color + 1
		vehBlipColor["r"][color] = 0
		vehBlipColor["g"][color] = 255
		vehBlipColor["b"][color] = 0
		color = color + 1
		vehBlipColor["r"][color] = 0
		vehBlipColor["g"][color] = 0
		vehBlipColor["b"][color] = 255
		color = color + 1
		vehBlipColor["r"][color] = 0
		vehBlipColor["g"][color] = 0
		vehBlipColor["b"][color] = 0
		color = color + 1
		vehBlipColor["r"][color] = 255
		vehBlipColor["g"][color] = 255
		vehBlipColor["b"][color] = 255
		color = color + 1
		vehBlipColor["r"][color] = 255
		vehBlipColor["g"][color] = 255
		vehBlipColor["b"][color] = 0
		color = color + 1
		vehBlipColor["r"][color] = 255
		vehBlipColor["g"][color] = 0
		vehBlipColor["b"][color] = 255
		color = color + 1
		vehBlipColor["r"][color] = 0
		vehBlipColor["g"][color] = 255
		vehBlipColor["b"][color] = 255
		color = color + 1
		vehBlipColor["r"][color] = 125
		vehBlipColor["g"][color] = 125
		vehBlipColor["b"][color] = 125
		color = color + 1
		vehBlipColor["r"][color] = 255
		vehBlipColor["g"][color] = 150
		vehBlipColor["b"][color] = 0
		color = color + 1
		color = nil

		
function respawnPrivVeh ( carslot, pname )
	local carslot = tonumber ( carslot )
	local vehicle = allPrivateCars[pname][carslot] or false
	if isElement ( vehicle ) then
		if vnxGetElementData ( vehicle, "special" ) == 2 then 
			detachElements ( objectYacht[pname][carslot], vehicle )
			destroyElement ( objectYacht[pname][carslot] )
			special = 2
		end
		destroyMagnet ( vehicle )
		dbExec ( handler, "UPDATE vehicles SET ??=? WHERE ??=? AND ??=?", "Benzin", vnxGetElementData(vehicle,"fuelstate"), "UID", playerUID[pname], "Slot", carslot )
		destroyElement ( vehicle )
	end
	local dsatz = dbPoll ( dbQuery ( handler, "SELECT * from vehicles WHERE UID = ? AND Slot = ?", playerUID[pname], carslot ), -1 )
	if dsatz and dsatz[1] then	
		dsatz = dsatz[1]
		local Besitzer = playerUIDName[tonumber(dsatz["UID"])]
		local Typ = tonumber ( dsatz["Typ"] )
		local Tuning = dsatz["Tuning"]
		local Spawnpos_X = tonumber ( dsatz["Spawnpos_X"] )
		local Spawnpos_Y = tonumber ( dsatz["Spawnpos_Y"] )
		local Spawnpos_Z = tonumber ( dsatz["Spawnpos_Z"] )
		local Spawnrot_X = tonumber ( dsatz["Spawnrot_X"] )
		local Spawnrot_Y = tonumber ( dsatz["Spawnrot_Y"] )
		local Spawnrot_Z = tonumber ( dsatz["Spawnrot_Z"] )
		local Farbe = dsatz["Farbe"]
		local LFarbe = dsatz["Lights"]
		local Paintjob = tonumber ( dsatz["Paintjob"] )
		local Benzin = tonumber ( dsatz["Benzin"] )
		local Distanz = tonumber ( dsatz["Distance"] )
		local STuning = dsatz["STuning"]
		local Spezcolor = dsatz["spezcolor"]
		local Sportmotor = tonumber (dsatz["Sportmotor"])
		local Bremse = tonumber (dsatz["Bremse"] )
		local Antrieb = dsatz["Antrieb"]
		local PlateText = dsatz["plate"]
		local Schluessel = dsatz["schluessel1"]
		vehicle = createVehicle ( Typ, Spawnpos_X, Spawnpos_Y, Spawnpos_Z, 0, 0, 0, Besitzer )
		allPrivateCars[pname][carslot] = vehicle
		vnxSetElementData ( vehicle, "owner", Besitzer )
		vnxSetElementData ( vehicle, "name", vehicle )
		vnxSetElementData ( vehicle, "carslotnr_owner", carslot )
		vnxSetElementData ( vehicle, "locked", true )
		vnxSetElementData ( vehicle, "color", Farbe )
		vnxSetElementData ( vehicle, "lcolor", LFarbe )
		vnxSetElementData ( vehicle, "spawnpos_x", Spawnpos_X )
		vnxSetElementData ( vehicle, "spawnpos_y", Spawnpos_Y )
		vnxSetElementData ( vehicle, "spawnpos_z", Spawnpos_Z )
		vnxSetElementData ( vehicle, "spawnrot_x", Spawnrot_X )
		vnxSetElementData ( vehicle, "spawnrot_y", Spawnrot_Y )
		vnxSetElementData ( vehicle, "spawnrot_z", Spawnrot_Z )
		vnxSetElementData ( vehicle, "distance", Distanz )
		vnxSetElementData ( vehicle, "stuning", STuning )
		vnxSetElementData ( vehicle, "spezcolor", Spezcolor )
		setVehiclePlateText( vehicle, PlateText )
		vnxSetElementData ( vehicle, "rcVehicle", tonumber ( dsatz["rc"] ) )
		vnxSetElementData ( vehicle, "sportmotor", Sportmotor )
		vnxSetElementData ( vehicle, "bremse", Bremse )
		vnxSetElementData ( vehicle, "antrieb", Antrieb )
		setVehicleLocked ( vehicle, true )
		setElementFrozen(vehicle, true)
		vnxSetElementData (vehicle, "fuelstate", Benzin)		
		if dsatz["neon"] then
			vnxSetElementData(vehicle, "neon", dsatz["neon"] )
		end
		if dsatz["schluessel1"] then 
			vnxSetElementData(vehicle, "schluessel", dsatz["schluessel1"] )
		end 
		vnxSetElementData(vehicle, "v1p", dsatz["v1p"] == 1 and true or false)
		
		setPrivVehCorrectColor ( vehicle )
		setPrivVehCorrectLightColor ( vehicle )
		setVehiclePaintjob ( vehicle, Paintjob )
		if special == 2 then
			objectYacht[pname][carslot] = createObject ( 1337, 0, 0, 0 )
			attachElements ( objectYacht[pname][carslot], vehicle, 0, 2, 1.55 )
			setElementDimension (objectYacht[pname][carslot], 1 )
		end
		giveSportmotorUpgrade ( vehicle )
		setVehicleRotation ( vehicle, Spawnrot_X, Spawnrot_Y, Spawnrot_Z )
		pimpVeh ( vehicle, Tuning )
		setVehicleAsMagnetHelicopter ( vehicle )
        if dsatz["cpaintjob"] == nil then
		else
			vnxSetElementData ( vehicle, "antrieb", dsatz["cpaintjob"] )
			triggerClientEvent ("loadpaintjobrespawn1", vehicle, dsatz["cpaintjob"], vehicle )
		end
		return true
	end
	return false
end


function towveh_func ( player, command, towcar )
	if towcar == nil then
		triggerClientEvent ( player, "infobox_start", player, "Gebrauch:\n/towveh\n[Fahrzeugnummer]", 5000, 125, 0, 0 )
	else
		if vnxGetElementData ( player, "carslot"..towcar ) and tonumber(vnxGetElementData ( player, "carslot"..towcar )) >= 1 then
			local pname = getPlayerName ( player )
			local veh = allPrivateCars[pname][tonumber(towcar)] or false
			if (getElementData(veh, "abgeschleppt") ~= true) then
				if vnxGetElementData ( player, "money" ) >= 200 then
					if respawnPrivVeh ( towcar, pname ) then
						vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 200 )
						triggerClientEvent ( player, "infobox_start", player, "\nDu hast dein\nFahrzeug respawnt!", 5000, 0, 255, 0 )
					else
						triggerClientEvent ( player, "infobox_start", player, "\nDas Fahrzeug ist\nnicht leer!", 5000, 125, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", player, "\nDu hast nicht\ngenug Geld!", 5000, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", player, "Dein Fahrzeug (Slot: "..towcar..") \nwurde abgeschleppt!\n Du kannst es am Police Department\n freikaufen.", 5000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", player, "\nDu hast kein\nFahrzeug mit\ndieser Nummer!", 5000, 125, 0, 0 )
		end
	end
end
addEvent ( "respawnPrivVehClick", true )
addEventHandler ( "respawnPrivVehClick", getRootElement(), towveh_func )
addCommandHandler ( "towveh", towveh_func )


function towvehall_func ( player )
	local curcars = vnxGetElementData ( player, "curcars" )
	local maxcars = vnxGetElementData ( player, "maxcars" )
	local pname = getPlayerName ( player )
	local veh = allPrivateCars[pname][tonumber(towcar)] or false
	if (getElementData(veh, "abgeschleppt") ~= true) then
		if vnxGetElementData ( player, "money" ) >= curcars*20 then
			for i = 1, maxcars do
				local carslotname = "carslot"..i
				if vnxGetElementData ( player, carslotname ) ~= 0 then
					respawnPrivVeh ( i, pname )
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - curcars*20 )
					triggerClientEvent ( player, "infobox_start", player, "\n\nDu hast alle deine\nFahrzeug respawnt!", 5000, 0, 255, 0 )
				end
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht\ngenug Geld!", 5000, 125, 0, 0 )
		end
	else
		triggerClientEvent (player, "infobox_start", player, "Dein Fahrzeug (Slot: "..towcar..") \nwurde abgeschleppt!\n Du kannst es am Police Department\n freikaufen.", 5000, 125, 0, 0 )
	end
end
addCommandHandler ( "towvehall", towvehall_func )


function sellcarto_func ( player, cmd, target, price, pSlot )
	local target = target and getPlayerFromName ( target ) or false
	if target and pSlot and tonumber ( pSlot ) then
		local pSlot = tonumber ( pSlot )
		local tSlot = getFreeCarSlot ( target )
		local pname = getPlayerName ( player )
		local result = dbPoll ( dbQuery ( handler, "SELECT AuktionsID FROM vehicles WHERE ??=? AND ??=?", "UID", playerUID[pname], "Slot", pslot ), -1 )
		if not result or not result[1] or tonumber ( result[1]["AuktionsID"] ) == 0 then
			if tSlot and vnxGetElementData ( target, "carslot"..tSlot ) == 0 and vnxGetElementData ( player, "carslot"..pSlot ) > 0 then
				local veh = allPrivateCars[pname][pSlot] or false
				if tonumber ( price ) then
					price = math.abs ( math.floor ( tonumber ( price ) ) )
					if isElement ( veh ) then
						if vnxGetElementData ( target, "curcars" ) < vnxGetElementData ( target, "maxcars" ) then
							if vnxGetElementData(veh, "v1p") then
								outputChatBox("Du kannst dein VIP-"..getVehicleName(veh).." nicht verkaufen!", player, 125, 0, 0, false)
								return
							end
						
							local model = getElementModel ( veh )
							local stunings = sTuningsToString ( veh )
							outputChatBox ( getPlayerName ( player ).." bietet dir folgendes Fahrzeug für "..price.." $ an: "..getVehicleName ( veh ), target, 0, 125, 0 )
							outputChatBox ( "Tunings: "..stunings, target, 0, 125, 0 )
							outputChatBox ( "Tippe /buy car, um das Fahrzeug zu kaufen.", target, 0, 125, 0 )
							outputChatBox ( "Du hast "..getPlayerName ( target ).." dein Fahrzeug aus Slot Nr. "..pSlot.." angeboten.", player, 200, 200, 0 )
							
							vnxSetElementData ( target, "carToBuyFrom", player )
							vnxSetElementData ( target, "carToBuySlot", tonumber ( pSlot ) )
							vnxSetElementData ( target, "carToBuyPrice", price )
							vnxSetElementData ( target, "carToBuyModel", getElementModel ( veh ) )
							outputLog ( getPlayerName ( player ).." hat ein Auto an Spieler angeboten ( "..getVehicleName ( veh ) .. " - " .. getPlayerName ( target ).." )", "vehicle" )
						else
							outputChatBox ( "Der Spieler hat keinen freien Fahrzeugslot mehr!", player, 125, 0, 0 )
						end
					else
						outputChatBox ( "Ungültiges Fahrzeug oder nicht respawnt! Gebrauch: /sellcarto [Name] [Preis] [Eigener Slot]", player, 125, 0, 0 )
					end
				else
					outputChatBox ( "Ungültiger Preis! Gebrauch: /sellcarto [Name] [Preis] [Eigener Slot]", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Ungültiger Fahrzeugslot! Gebrauch: /sellcarto [Name] [Preis] [Eigener Slot]", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Dieses Fahrzeuge wird momentan versteigert!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Gebrauch: /sellcarto [Name] [Preis] [Eigener Slot]", player, 125, 0, 0 )
	end
end
addCommandHandler ( "sellcarto", sellcarto_func )


function respawnVeh_func ( towcar, pname, veh )
	if towcar then
		respawnPrivVeh ( towcar, pname )
	else
		if not getVehicleOccupant ( veh ) then
			respawnVehicle ( veh )
			setElementDimension ( veh, 0 )
			setElementInterior ( veh, 0 )
		end
	end
end
addEvent ( "respawnVeh", true )
addEventHandler ( "respawnVeh", getRootElement(), respawnVeh_func )


function deleteVeh_func ( towcar, pname, veh, reason )
	local admin = getPlayerName ( source )
	if vnxGetElementData ( source, "adminlvl" ) >= 3 then
		local towcar = tonumber ( towcar )
		local player = getPlayerFromName ( pname )
		if player then
			outputChatBox ( "Dein Fahrzeug in Slot Nr. "..towcar.." wurde von "..admin.." gelöscht ("..reason..")!", player, 125, 0, 0 )
			vnxSetElementData ( player, "carslot"..towcar, 0 )
			allPrivateCars[pname][towcar] = nil
		else
			offlinemsg ( "Dein Fahrzeug in Slot Nr. "..towcar.." wurde von "..admin.." gelöscht("..reason..")!", "Server", pname )
		end
		outputLog ( "Fahrzeug von "..pname.." ( "..towcar.." ) wurde von "..admin.." gelöscht. | Modell: "..getElementModel(veh).." |", "autodelete" )
		destroyElement ( veh )
		dbExec ( handler, "DELETE FROM ?? WHERE ??=? AND ??=?", "vehicles", "UID", playerUID[pname], "Slot", towcar )
	end
end
addEvent ( "deleteVeh", true )
addEventHandler ( "deleteVeh", getRootElement(), deleteVeh_func )


function park_func ( player, command )
	if getPedOccupiedVehicleSeat ( player ) == 0 then
		local veh = getPedOccupiedVehicle ( player )
		if isElement ( veh ) and vnxGetElementData ( veh, "owner" ) == getPlayerName ( player ) or vnxGetElementData ( player, "adminlvl" ) >= 3 or isMechaniker ( player ) then
			if isTrailerInParkingZone ( veh ) then
				local x, y, z = getElementPosition ( veh )
				local rx, ry, rz = getVehicleRotation ( veh )
				local c1, c2, c3, c4 = getVehicleColor ( veh )
				vnxSetElementData ( veh, "spawnposx", x )
				vnxSetElementData ( veh, "spawnposy", y )
				vnxSetElementData ( veh, "spawnposz", z )
				vnxSetElementData ( veh, "spawnrotx", rx )
				vnxSetElementData ( veh, "spawnroty", ry )
				vnxSetElementData ( veh, "spawnrotz", rz )
				vnxSetElementData ( veh, "color1", c1 )
				vnxSetElementData ( veh, "color2", c2 )
				vnxSetElementData ( veh, "color3", c3 )
				vnxSetElementData ( veh, "color4", c4 )
				outputChatBox ( "Du hast dein Fahrzeug geparkt!", player, 0, 255, 0 )
			
				local Spawnpos_X, Spawnpos_Y, Spawnpos_Z = getElementPosition ( veh )
				local Spawnrot_X, Spawnrot_Y, Spawnrot_Z = getVehicleRotation ( veh )
				local Farbe1, Farbe2, Farbe3, Farbe4 =  getVehicleColor ( veh )
				local color = "|"..Farbe1.."|"..Farbe2.."|"..Farbe3.."|"..Farbe4.."|"
				local Paintjob = getVehiclePaintjob ( veh ) or 3
				local Benzin = vnxGetElementData ( veh, "fuelstate" )
				local pname = vnxGetElementData ( veh, "owner" )
				local Distance = vnxGetElementData ( veh, "distance" )
				local slot = vnxGetElementData ( veh, "carslotnr_owner" )
				dsavecom = pname
				
				dbExec ( handler, "UPDATE vehicles SET Spawnpos_X=?, Spawnpos_Y=?, Spawnpos_Z=?, Spawnrot_X=?, Spawnrot_Y=?, Spawnrot_Z=?, Farbe=?, Paintjob=?, Benzin=?, Distance=? WHERE UID=? AND Slot=?", Spawnpos_X, Spawnpos_Y, Spawnpos_Z, Spawnrot_X, Spawnrot_Y, Spawnrot_Z, color, Paintjob, Benzin, Distance, playerUID[pname], slot ) 
			else
				outputChatBox ( "Dieses Fahrzeug kannst du nicht in der Stadt parken!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Dieses Fahrzeug gehört dir nicht!", player, 255, 0, 0 )
		end
	else
		outputChatBox ( "Du musst in einem Fahrzeug sitzen!", player, 255, 0, 0 )
	end
end
addEvent ( "park_button", true )
addEventHandler ( "park_button", getRootElement(), park_func )


function lock_func ( player, command, locknr )
	if locknr == nil then
		outputChatBox ( "Gebrauch: /lock [Fahrzeugnummer]", player, 255, 0, 0 )
	else
		if vnxGetElementData ( player, "carslot"..locknr ) and tonumber(vnxGetElementData ( player, "carslot"..locknr )) >= 1 then
			local pname = getPlayerName ( player )
			local veh = allPrivateCars[pname][tonumber(locknr)] or false
			if isElement ( veh ) then
				if vnxGetElementData ( veh, "locked" ) then
					vnxSetElementData ( veh, "locked", false )
					setVehicleLocked ( veh, false )
					outputChatBox ( "Fahrzeug Aufgeschlossen!", player, 0, 150, 200 )
				elseif not vnxGetElementData ( veh, "locked" ) then
					vnxSetElementData ( veh, "locked", true )
					setVehicleLocked ( veh, true )
					outputChatBox ( "Fahrzeug Abgeschlossen!", player, 0, 150, 200 )
				end
			else
				outputChatBox ( "Bitte respawne dein Fahrzeug zuerst!", player, 255, 0, 0 )
			end
		
		else
			outputChatBox ( "Du hast kein Fahrzeug mit diesem Namen!", player, 255, 0, 0 )
		end
	end
end
addEvent ( "lockPrivVehClick", true )
addEventHandler ( "lockPrivVehClick", getRootElement(), lock_func )
addCommandHandler ( "lock", lock_func )


function lock_schluessel_func ( command, veh )
	--outputDebugString(command, veh )
		if vnxGetElementData ( veh, "locked" ) then
			vnxSetElementData ( veh, "locked", false )
			setVehicleLocked ( veh, false )
			outputChatBox ( "Fahrzeug Aufgeschlossen!", command, 0, 150, 200 )
		elseif not vnxGetElementData ( veh, "locked" ) then
			vnxSetElementData ( veh, "locked", true )
			setVehicleLocked ( veh, true )
			outputChatBox ( "Fahrzeug Abgeschlossen!", command, 0, 150, 200 )
		end
end
addEvent ( "lockSchluesselVehClick", true )
addEventHandler ( "lockSchluesselVehClick", getRootElement(), lock_schluessel_func )





function vehinfos_func ( player )
	local curcars = vnxGetElementData ( player, "curcars" )
	local maxcars = vnxGetElementData ( player, "maxcars" )
	if curcars and maxcars then
		outputChatBox ( "Momentan im Besitz: "..curcars.." von "..maxcars.." Fahrzeugen.", player, 0, 150, 200  )
		local pname = getPlayerName ( player )
		color = 0
		for i = 1, maxcars do
			carslotname = "carslot"..i
			if vnxGetElementData ( player, carslotname ) ~= 0 then
				local veh = allPrivateCars[pname][i] or false
				if isElement ( veh ) then
					local x, y, z = getElementPosition( veh )
					if vnxGetElementData ( veh, "gps" ) then
						color = color + 1
						local blip = createBlip ( x, y, z, 0, 2, vehBlipColor["r"][color], vehBlipColor["g"][color], vehBlipColor["b"][color], 255, 0, 99999.0, player )
						setTimer ( destroyElement, 10000, 1, blip )
						outputChatBox ( "Slot NR "..i..": "..getVehicleName ( veh )..", steht momentan in "..getZoneName( x,y,z )..", "..getZoneName( x,y,z, true ), player, vehBlipColor["r"][color], vehBlipColor["g"][color], vehBlipColor["b"][color] )
					else
						outputChatBox ( "Slot NR "..i..": "..getVehicleName ( veh )..", steht momentan in "..getZoneName( x,y,z )..", "..getZoneName( x,y,z, true ), player, 0, 0, 200 )
					end
				else
					local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=? AND ??=?", "AuktionsID", "vehicles", "UID", playerUID[pname], "Slot", i ), -1 )
					if result and result[1] and result[1]["AuktionsID"] == "1" then
						outputChatBox ( "Dein Fahrzeug in Slot NR "..i.." muss zuerst mit /towveh "..i.." respawned werden!", player, 125, 0, 0 )
					elseif result and result[1] then
						outputChatBox ("Respawn dein Fahrzeug Slot "..i.." erst!", player, 0, 125, 0)
					end
				end
			end
		end
	end
end
addCommandHandler ( "vehinfos", vehinfos_func )


function vehhelp_func ( player )
	outputChatBox ( "--- Fahrzeughilfe ---", player, 0, 200, 255 )
	outputChatBox ( "/towveh [Nummer] zum Respawnen am Parkort", player, 255, 0, 255 )
	outputChatBox ( "/towvehall zum Respawnen aller Fahrzeuge", player, 255, 0, 255 )
	outputChatBox ( "/lock [Nummer] zum Oeffnen/Schliessen", player, 255, 0, 255 )
	outputChatBox ( "/vehinfos zum Anzeigen aller Aktueller Fahrzeuge", player, 255, 0, 255 )
	outputChatBox ( "/sellcar [Nummer] zum verkaufen des Autos ( 75% der Kosten werden erstattet )", player, 255, 0, 255 )
	outputChatBox ( "/sellcarto [Name] [Preis] [Slot zum verkaufen des Autos an einen Spieler", player, 255, 0, 255 )
	outputChatBox ( "/buy car zum Annehmen eines Angebotes", player, 255, 0, 255 )
	outputChatBox ( "/givekey [Name] [Slot] zur weitergabe eines Schlüssels (Kostet : 10.000 $ ) ", player, 255, 0, 255 )
	outputChatBox ( "/break um die Handbremse zu betätigen", player, 255, 0, 255 )
end
addCommandHandler ( "vehhelp", vehhelp_func )


function sellcar_func ( player, cmd, slot )
	if slot then
		local slot = tonumber(slot)
		if vnxGetElementData ( player, "carslot"..slot ) > 0 then
			local pname = getPlayerName(player)
			local veh = allPrivateCars[pname][slot] or false
			if isElement ( veh ) then
				local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=? AND ??=?", "AuktionsID", "vehicles", "UID", playerUID[pname], "Slot", slot ), -1 )
				if result and result[1] and tonumber ( result[1]["AuktionsID"] ) == 0 then
					if vnxGetElementData(veh, "v1p") then
						outputChatBox("Du kannst dein VIP-"..getVehicleName(veh).." nicht verkaufen!", player, 125, 0, 0, false)
						return
					end
				
					destroyMagnet ( veh )
					local model = getElementModel ( veh )
					local price = carprices[model]
					if not price then
						price = 0
					end
					vnxSetElementData ( player, "carslot"..slot, 0 )
					allPrivateCars[pname][slot] = nil
					local spawnx = vnxGetElementData ( player, "spawnpos_x" )
					if spawnx == "marquis" or spawnx == "tropic" then
						vnxSetElementData ( player, "spawnpos_x", -2458.288085 )
						vnxSetElementData ( player, "spawnpos_y", 774.354492 )
						vnxSetElementData ( player, "spawnpos_z", 35.171875 )
						vnxSetElementData ( player, "spawnrot_x", 52 )
						vnxSetElementData ( player, "spawnint", 0 )
						vnxSetElementData ( player, "spawndim", 0 )
					end
					dbExec ( handler, "DELETE FROM ?? WHERE ??=? AND ??=?", "vehicles", "UID", playerUID[pname], "Slot", slot )
					vnxSetElementData(player,"curcars",tonumber(vnxGetElementData ( player, "curcars" ))-1)
					vnxSetElementData ( player, "FahrzeugeVerkauft", vnxGetElementData ( player, "FahrzeugeVerkauft" ) + 1 )
					SaveCarData ( player )
					infobox ( player, "Fahrzeug verkauft\nfür "..price/100*75 .."$", 4000, 0, 200, 0 )
					outputLog ( getPlayerName ( player ).." hat ein Auto an Server verkauft ( "..getVehicleName ( veh ).." )", "vehicle" )
					destroyElement ( veh )
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" )+price/100*75 )
				else
					outputChatBox ( "Dieses Fahrzeug kannst du nicht verkaufen, da es zum Verkauf steht.", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Bitte respawne dein Fahrzeug vorher!", player, 125, 0, 0 )
			end
		else
			infobox ( player, "\nUngültiger Slot!", 4000, 125, 0, 0 )
		end
	else
		infobox ( player, "Gebrauch:\n/sellcar [Slot]!", 4000, 200, 0, 0 )
	end
end
addCommandHandler ( "sellcar", sellcar_func )


function accept_sellcarto ( accepter, _, cmd )
	if cmd == "car" then
		local target = accepter
		local pSlot = vnxGetElementData ( accepter, "carToBuySlot" )
		player = vnxGetElementData ( accepter, "carToBuyFrom" )
		price = vnxGetElementData ( accepter, "carToBuyPrice" )
		model = vnxGetElementData ( accepter, "carToBuyModel" )
		if isElement ( player ) then
			local money = vnxGetElementData ( target, "bankmoney" )
			local tSlot = tonumber ( getFreeCarSlot ( target ) )
			if price <= money then
				if tonumber ( pSlot ) and tSlot then
					pSlot = tonumber ( pSlot )
					local pname = getPlayerName ( player )
					local result = dbPoll ( dbQuery ( handler, "SELECT ??, ?? FROM ?? WHERE ??=? AND ??=?", "AuktionsID", "ID", "vehicles", "UID", playerUID[pname], "Slot", pSlot ), -1 )
					if result and result[1] and tonumber ( result[1]["AuktionsID"] ) == 0 then
						if vnxGetElementData ( player, "carslot"..pSlot ) > 0 then
							local veh = allPrivateCars[pname][pSlot] or false
							if isElement ( veh ) then
								if model == getElementModel ( veh ) then
									if vnxGetElementData ( target, "curcars" ) < vnxGetElementData ( target, "maxcars" ) then
										
										local id = result[1]["ID"]
										
										outputChatBox ( "Du hast dein Fahrzeug in Slot Nr. "..pSlot.." an "..getPlayerName ( target ).." gegeben!", player, 0, 125, 0 )
										outputChatBox ( "Du hast ein Fahrzeug in Slot Nr. "..tSlot.." von "..getPlayerName ( player ).." erhalten!", target, 0, 125, 0 )
										
										dbExec ( handler, "UPDATE ?? SET ??=?, ??=?, ??=? WHERE ??=?", "vehicles", "UID", playerUID[getPlayerName(target)], "Slot", tSlot, "Lights", "|255|255|255|", "ID", id )

										vnxSetElementData ( target, "carslot"..tSlot, vnxGetElementData ( player, "carslot"..pSlot ) )
										vnxSetElementData ( player, "carslot"..pSlot, 0 )
										vnxSetElementData ( target, "curcars", vnxGetElementData ( target, "curcars" ) + 1 )
										vnxSetElementData ( player, "curcars", vnxGetElementData ( player, "curcars" ) - 1 )
										vnxSetElementData ( veh, "lcolor", "|255|255|255|" )
										
										setPrivVehCorrectLightColor ( veh )
										
										vnxSetElementData ( veh, "owner", getPlayerName ( target ) )
										vnxSetElementData ( veh, "name", "privVeh"..getPlayerName(target)..tSlot )
										vnxSetElementData ( veh, "carslotnr_owner", tSlot )
										
										allPrivateCars[getPlayerName(target)][tSlot] = veh
										allPrivateCars[pname][pSlot] = nil
										
										SaveCarData ( player )
										SaveCarData ( target )
										vnxSetElementData ( player, "FahrzeugeVerkauft", vnxGetElementData ( player, "FahrzeugeVerkauft" ) + 1 )
										vnxSetElementData ( target, "FahrzeugeGekauft", vnxGetElementData ( target, "FahrzeugeGekauft" ) + 1 )
											
										vnxSetElementData ( target, "bankmoney", money - price )
										vnxSetElementData ( player, "bankmoney", vnxGetElementData ( player, "bankmoney" ) + price )
											
										casinoMoneySave ( target )
										casinoMoneySave ( player )
										outputLog ( getPlayerName ( accepter ).." hat ein Auto von "..getPlayerName ( player ) .. " gekauft ( "..price.." - "..getVehicleName ( veh ).." )", "vehicle" )
									else
										infobox ( accepter, "Du hast keinen\nfreien Fahrzeugslot mehr!", 5000, 125, 0, 0 )
									end
								else
									infobox ( accepter, "Ein Fehler\nist aufgetreten.\nBitte lass dir\ndas Angebot erneut\nschicken!", 5000, 125, 0, 0 )
								end
							else
								infobox ( accepter, "Ein Fehler\nist aufgetreten.\nBitte lass dir\ndas Angebot erneut\nschicken!", 5000, 125, 0, 0 )
							end
						else
							infobox ( accepter, "Der Verkaufer hat\ndas Fahrzeug nicht\nmehr!", 5000, 125, 0, 0 )
						end
					end
				else
					infobox ( accepter, "Ein Fehler\nist aufgetreten.\nBitte lass dir\ndas Angebot erneut\nschicken!", 5000, 125, 0, 0 )
				end
			else
				infobox ( accepter, "Du hast nicht\ngenug Geld auf\nder Bank!", 5000, 125, 0, 0 )
			end
		else
			infobox ( accepter, "Der Anbieter des\nFahrzeugs ist offline!", 5000, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "buy", accept_sellcarto )


function handbremsen ( player )

	local vehicle = getPedOccupiedVehicle ( player )
	
	if vehicle then
	
		local sitz = getPedOccupiedVehicleSeat ( player )
		
		if sitz == 0 then
		
			local vx, vy, vz = getElementVelocity ( getPedOccupiedVehicle ( player ) )
			local speed = math.sqrt ( vx ^ 2 + vy ^ 2 + vz ^ 2 )
			
			if speed < 5 * 0.00464 then
			else
				return
			end
		
			if vnxGetElementData ( vehicle, "owner" ) == getPlayerName ( player )  then
			
				if isElementFrozen ( vehicle ) then
			
					setElementFrozen ( vehicle, false )
					outputChatBox ( "Handbremse gelöst!", player, 0, 125, 0 )
				
				else
				
					setElementFrozen ( vehicle, true )
					outputChatBox ( "Handbremse angezogen!", player, 0, 125, 0 )
				
				end
			
			end
		
		end
	
	end
	
end

addCommandHandler ( "break", handbremsen )


function createVIPcar(p, cmd, donatorName, vehicleId)
	-- Check if player admin and if the player name is valid
	local donator = getPlayerFromName(donatorName)
	if vnxGetElementData(p, "adminlvl") <= 3 and donator then
		return
	end
	
	-- Get free car slot
	local donatorSlot = 0
	for i=1, 500, 1 do
		if vnxGetElementData(donator, "carslot"..i) == 0 then
			donatorSlot = i
			break
		end
	end
	
	if not allPrivateCars[donatorName] then
		return
	end
	
	-- Obtain donator's position
	local x, y, z = getElementPosition(donator)
	local vehicleId = tonumber(vehicleId) or 411
	
	local color = "|255|255|255|255|"
	local tuning = "|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|"
	
	-- Create actual vehicle	
	local vehicle = createVehicle(vehicleId, x, y+5, z, 0, 0, 0, donatorName)
	if vehicle then
		vnxSetElementData(vehicle, "owner", donatorName)
		vnxSetElementData(vehicle, "name", vehicle)
		vnxSetElementData(vehicle, "carslotnr_owner", donatorSlot)
		vnxSetElementData(vehicle, "locked", true)
		vnxSetElementData(vehicle, "fuelstate", 100)		
		vnxSetElementData(vehicle, "stuning", "0|0|0|0|0|0|")
		vnxSetElementData(vehicle, "color", color)
		vnxSetElementData(vehicle, "lcolor", "|255|255|255|")
		vnxSetElementData(vehicle , "sportmotor", 0)
		vnxSetElementData(vehicle , "bremse", 0)
		vnxSetElementData(vehicle, "antrieb", getVehicleHandling(vehicle)["driveType"])
		vnxSetElementData(vehicle, "v1p", true)
		setPrivVehCorrectLightColor(vehicle)
		setVehicleLocked(vehicle, true)
		specPimpVeh(vehicle)

		allPrivateCars[donatorName][donatorSlot] = vehicle

		-- Change donator's stats
		vnxSetElementData(donator, "carslot"..donatorSlot, 1)
		vnxSetElementData(donator, "curcars", vnxGetElementData(donator, "curcars") + 1)
		vnxSetElementData(donator, "FahrzeugeGekauft", vnxGetElementData(donator, "FahrzeugeGekauft") + 1)
		SaveCarData(donator)
		outputChatBox("Glückwunsch, du hast ein VIP-"..getVehicleNameFromModel(vehicleId).." bekommen!", donator, 0, 255, 0)

		-- Save in our database
		if not dbExec(handler, "INSERT INTO vehicles (UID, Typ, Tuning, Spawnpos_X, Spawnpos_Y, Spawnpos_Z, Spawnrot_X, Spawnrot_Y, Spawnrot_Z, Farbe, Paintjob, Benzin, Slot, Sportmotor, Bremse, Antrieb, v1p) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?, ?)", 
			playerUID[donatorName], 
			vehicleId, 
			tuning, 
			x, 
			y+5, 
			z, 
			0, 
			0, 
			0, 
			color, 
			getVehiclePaintjob(vehicle), 
			"100", 
			donatorSlot, 
			"0", 
			"0", 
			getVehicleHandling(vehicle)["driveType"],
			"1"
		) then
			outputDebugString ("[createVIPcar] Error executing the query!")
			destroyElement(vehicle)
		end
	end
end
addCommandHandler("givepremcar", createVIPcar)

function givekeytoplayer(player, command, otherpname, slot)
	local lp = getPlayerName(player)
	local price = 10000
	local money = vnxGetElementData ( getPlayerFromName(lp), "bankmoney" )
	if price <= money then
		if otherpname == nil then 
				outputChatBox ( "Gebrauch : /givekey [Name] [Slot] um den schlüssel weiterzugeben. (Kosten : 10.000 $ )", player, 0, 125, 0 )
		elseif slot == nil then 
				outputChatBox ( "Gebrauch : /givekey [Name] [Slot] um den schlüssel weiterzugeben. (Kosten : 10.000 $ )", player, 0, 125, 0 )
		else 
			dbExec ( handler, "UPDATE vehicles SET schluessel1=? WHERE UID=? AND Slot=?", otherpname, playerUID[lp], slot ) 
			outputDebugString(otherpname.." hat den schlüssel für den slot "..slot.." erhalten.")
			outputChatBox ( "Du hast ein Fahrzeug Schlüssel an "..otherpname.." weiter gegeben!", player, 0, 125, 0 )
			outputChatBox ( "Slot : "..slot, player, 0, 125, 0 )
			vnxSetElementData ( player, "bankmoney", money - price )
			outputChatBox ( "-----------------------------------", player, 0, 125, 0 )
			outputChatBox ( "[Info] : Du kannst deinen Schlüssel immer nur an eine Person weitergeben.", player, 0, 125, 0 )
			-----------------------------------------------------------------------
			outputChatBox ( "Du hast einen Fahrzeug Schlüssel von "..lp.." bekommen.", getPlayerFromName(otherpname), 0, 125, 0 )
		end
	else 
		outputChatBox ( "Du brauchst mindestens 10.000$ um ein Schlüssel zu Kaufen und weiterzugeben ", player, 0, 125, 0 )
	end
end 
addCommandHandler("givekey", givekeytoplayer)

function removekeytoplayer(player, command, slot)
	local lp = getPlayerName(player)
	if slot == nil then 
		outputChatBox ( "Gebrauch : /delkey [slot] um den schlüssel-besitzer zu entfernen.", player, 0, 125, 0 ) 
	else
		dbExec ( handler, "UPDATE vehicles SET schluessel1=? WHERE UID=? AND Slot=?", "", playerUID[lp], slot ) 
		outputDebugString(lp.." hat den schlüssel für den slot "..slot.." gelöscht..")
		outputChatBox ( "Du hast das Schloss deines Fahrzeug Slots "..slot.. " gewechselt.", player, 0, 125, 0 )
	end
end 
addCommandHandler("delkey", removekeytoplayer)