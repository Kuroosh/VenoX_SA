function TuningDimFix ( vehicle, dim )
    local player = client
    vnxSetElementData ( vehicle, "tuningSx", x )
    vnxSetElementData ( vehicle, "tuningSy", y )
    vnxSetElementData ( vehicle, "tuningSz", z )
	vnxSetElementData ( vehicle, "tuningSr", r )
    --i = tonumber ( vnxGetElementData ( player, "playerid" ) )
    vnxSetElementData ( vehicle, "usingdim", dim )
    --setElementPosition ( hitElement, -2053.7531738281, 143.72497558594, 28.923471450806 )
    --setVehicleRotation ( hitElement, 0, 0, 290 )
    setElementDimension ( vehicle, dim )
    setElementDimension ( player, dim )
    --setElementInterior ( vehicle, dim )
    --setElementInterior ( player, dim )
    setElementVelocity ( vehicle, 0, 0, 0 )
end
addEvent( "setTuningDimension", true )
addEventHandler( "setTuningDimension", getRootElement(), TuningDimFix )

function applyLightValues_func ( red, green, blue )
	
	local player = client
	local veh = getPedOccupiedVehicle ( player )
	if isElement ( veh ) then
		setVehicleHeadLightColor ( veh, red, green, blue )
		
		local pname = vnxGetElementData ( veh, "owner" )
		local slot = vnxGetElementData ( veh, "carslotnr_owner" )
		local money = vnxGetElementData ( player, "money" )
		
		if pname == getPlayerName ( player ) then
			vnxSetElementData ( player, "money", money - 2000 )
			lcolor = "|"..red.."|"..green.."|"..blue.."|"
			vnxSetElementData ( veh, "lcolor", lcolor )
			
			dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=? AND ??=?", "vehicles", "Lights", lcolor, "UID", playerUID[pname], "Slot", slot )
		end
	end
end
addEvent ( "applyLightValues", true )
addEventHandler ( "applyLightValues", getRootElement(), applyLightValues_func )


function applyColorValue_func(red1, green1, blue1, red2, green2, blue2)
	local player = source	
	local veh = getPedOccupiedVehicle(player)
	local money = vnxGetElementData ( player, "money" )
	local price = 5430
		if price <= money then
		setVehicleColor(veh, red1, green1, blue1, red2, green2, blue2)
		local spezcolor = "|"..red1.."|"..green1.."|"..blue1.."|"..red2.."|"..green2.."|"..blue2.."|"
		vnxSetElementData(veh, "spezcolor", spezcolor)
		vnxSetElementData ( player, "money", money - price )
		dbExec ( handler, "UPDATE vehicles SET spezcolor = ? WHERE UID = ? AND Slot = ?", spezcolor, playerUID[getPlayerName(player)], vnxGetElementData ( veh, "carslotnr_owner" ) )
		end 
end 
addEvent( "applyColorValue_func", true )
addEventHandler( "applyColorValue_func", getRootElement(), applyColorValue_func )


function resetcolorcar_func(carslot, pname)
	local player = source	
	local veh = getPedOccupiedVehicle(player)
	local c1, c2, c3, c4 = getVehicleColor ( veh )
	--local color = "|"..Farbe1.."|"..Farbe2.."|"..Farbe3.."|"..Farbe4.."|"
	local dsatz = dbPoll ( dbQuery ( handler, "SELECT * from vehicles WHERE UID = ? AND Slot = ?", playerUID[pname], carslot ), -1 )
	local Spezcolor = dsatz["spezcolor"]
	vnxSetElementData ( vehicle, "spezcolor", Spezcolor )
	--vnxSetElementData(veh, "spezcolor", spezcolor)
end
addEvent( "resetcolorcar_func", true )
addEventHandler( "resetcolorcar_func", getRootElement(), resetcolorcar_func )



function applyPaintjobValue_func(s)
	local player = source
	
	local veh = getPedOccupiedVehicle(player)
	local paintjob = s
	
	local pname = getPlayerName ( player )
	local slot = vnxGetElementData ( veh, "carslotnr_owner" )
	local money = vnxGetElementData ( player, "money" )
	if slot then
		vnxSetElementData ( player, "money", money - 2000 )
		dbExec ( handler, "UPDATE vehicles SET Paintjob=? WHERE UID=? AND Slot=?", s, playerUID[pname], slot )
		--dbExec ( handler, "UPDATE ?? SET ??=?, ??=?, ??=? WHERE ??=? AND ??=?", "vehicles", "Tuning", tuning, "Farbe", color, "Paintjob", s, "UID", playerUID[pname], "Slot", slot )
		--dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "vehicles", "Tuning", "Paintjob", s, "UID", playerUID[name], "Slot", slot )
		--outputDebugString("Paintjob : "..s.." wurde gespeichert!")
	end
end 
addEvent( "saveTuning_Paintjob", true )
addEventHandler( "saveTuning_Paintjob", getRootElement(), applyPaintjobValue_func )


function buyTuningPart_func ( player, veh, part, price )
	local veh = getPedOccupiedVehicle(player)
	if player == client then
		price = math.floor ( math.abs ( price ) )
		local money = vnxGetElementData ( player, "money" )
		local c1, c2, c3, c4 = getVehicleColor ( veh )
		local color = "|"..c1.."|"..c2.."|"..c3.."|"..c4.."|"
		local paintjob = getVehiclePaintjob ( veh )
		--outputDebugString(money)
		--outputDebugString(price)
		if price <= money then
			price = math.floor ( math.abs ( price ) )
			local money = vnxGetElementData ( player, "money" )
			if price <= money then
				if veh and part then
					outputDebugString(part)
					local getoutput = addVehicleUpgrade(veh, part)
					if getoutput == true then
                        vnxSetElementData ( player, "money", money - price )
                        giveAchievement( player, 15 )
						local tuning = "|"
						for i=0, 16 do
							tuning = tuning..getVehicleUpgradeOnSlot(veh, i).."|"
							--outputDebugString(getVehicleUpgradeSlotName(part))
							--outputDebugString(getoutput)
						end
						local pname = getPlayerName ( player )
						local slot = vnxGetElementData ( veh, "carslotnr_owner" )
						if slot then
							dbExec ( handler, "UPDATE ?? SET ??=?, ??=?, ??=? WHERE ??=? AND ??=?", "vehicles", "Tuning", tuning, "Farbe", color, "Paintjob", paintjob, "UID", playerUID[pname], "Slot", slot )
						end
					else 
						--outputDebugString("NICHT KOMPATIBLE")
					end
					--addVehicleUpgrade ( veh, part )
					--outputDebugString(part)
				end
			end
			playSoundFrontEnd ( player, 40 )
			--TuningKasse = TuningKasse + price
		end
		playSoundFrontEnd ( player, 40 )
		--TuningKasse = TuningKasse + price
	end
end
addEvent ( "servsideAddTuning", true )
addEventHandler ( "servsideAddTuning", getRootElement(), buyTuningPart_func )


function CancelTuning_func ( player, veh, c1, c2, c3, c4, paintjob)
	--local veh = tonumber ( carslot )
	if player == client then
		setPrivVehCorrectColor ( veh )
		setPrivVehCorrectLightColor ( veh )
		setElementDimension ( player, 0 )
		setElementInterior ( player, 0 )
		setElementDimension ( veh, 0 )
		setElementInterior ( veh, 0 )
        triggerClientEvent( getRootElement(), "showSpeedometer", getRootElement())
		setTimer(function()
			if bikes[getElementModel ( veh )] or getElementModel ( veh ) == 462 or getElementModel ( veh ) == 448 then
				removePedFromVehicle ( player )
				warpPedIntoVehicle ( player, veh )
			end
        end, 500, 1)
        local result = dbPoll ( dbQuery ( handler, "SELECT * from vehicles WHERE UID = ? AND Slot = ?", playerUID[getPlayerName(player)], vnxGetElementData ( veh, "carslotnr_owner" ) ), -1 )
		for i=1, #result do
			local dsatz = result[i]
			local Besitzer = playerUIDName[tonumber(dsatz["UID"])]
			local Typ = tonumber ( dsatz["Typ"] )
			local Tuning = dsatz["Tuning"]
			pimpVeh ( veh, Tuning )	
            if dsatz["cpaintjob"] == nil then
            else
                --setElementData(vehicle, "cpaintjob", dsatz["cpaintjob"] )
                triggerClientEvent ("loadpaintjobrespawn", veh, dsatz["cpaintjob"], veh )
                --outputDebugString("Paintjob Triggered")
            end
		end
		setCameraTarget ( player, player )
		activeCarGhostMode ( player, 10000 )
	end
end
addEvent ( "CancelTuning", true )
addEventHandler ( "CancelTuning", getRootElement(), CancelTuning_func )





function motorupgrade_server(vehicle, tuning, preis)
	local money = vnxGetElementData (client, "money")
		if tuning == "Sportmotor 1" or tuning == "Sportmotor 2" or tuning == "Sportmotor 3" or tuning == "Sportmotor 4" or tuning == "Bremse 1" or tuning == "Bremse 2" or tuning == "Bremse 3" or tuning == "Bremse 4"then
			local stufe = tonumber ( gettok ( tuning, 2, 32 ) )
			local data = gettok ( tuning, 1, 32 )
			if ( vnxGetElementData ( vehicle, string.lower(data) ) or 0 ) > stufe then
				outputChatBox("Das Fahrzeug hat es bereits eingebaut!", client, 255, 0, 0)
				return
			elseif ( vnxGetElementData ( vehicle, string.lower(data) ) or 0 ) + 1 ~= stufe then
				outputChatBox("Das Fahrzeug braucht erst Stufe ".. ( stufe-1 ), client, 255, 0, 0)
				return
			else
				if vnxGetElementData (vehicle, "owner") then
					outputDebugString("stufe : "..stufe)
					vnxSetElementData (client, "money", money - preis)
					--veh_tuningtimer[vehicle] = setTimer(function(vehicle, data, stufe)
					vnxSetElementData ( vehicle, string.lower(data), stufe )
					giveSportmotorUpgrade ( vehicle )
					local Besitzer = vnxGetElementData (vehicle, "owner")
					local Slot = vnxGetElementData ( vehicle, "carslotnr_owner" )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=? AND ??=?", "vehicles", data, stufe, "UID", playerUID[Besitzer], "Slot", Slot )
					--end, 2000, 1, vehicle, data, stufe )
				else
					outputChatBox ( "Fahrzeuge ohne Besitzer können kein Sportmotor besitzen!", client, 255, 0, 0 )
					return
				end
			end
		elseif tuning == "Frontantrieb" then
			vnxSetElementData (client, "money", money - preis)
			vnxSetElementData ( vehicle, "antrieb", "fwd" )
			setVehicleHandling ( vehicle, "driveType", "fwd" )
			local Besitzer = vnxGetElementData (vehicle, "owner")
			local Slot = vnxGetElementData ( vehicle, "carslotnr_owner" )
			dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=? AND ??=?", "vehicles", "Antrieb", "fwd", "UID", playerUID[Besitzer], "Slot", Slot )
		elseif tuning == "Heckantrieb" then
			vnxSetElementData (client, "money", money - preis)
			vnxSetElementData ( vehicle, "antrieb", "rwd" )
			setVehicleHandling ( vehicle, "driveType", "rwd" )
			local Besitzer = vnxGetElementData (vehicle, "owner")
			local Slot = vnxGetElementData ( vehicle, "carslotnr_owner" )
			dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=? AND ??=?", "vehicles", "Antrieb", "rwd", "UID", playerUID[Besitzer], "Slot", Slot )
		elseif tuning == "Allradantrieb" then
			vnxSetElementData (client, "money", money - preis)
			vnxSetElementData ( vehicle, "antrieb", "awd" )
			setVehicleHandling ( vehicle, "driveType", "awd" )
			local Besitzer = vnxGetElementData (vehicle, "owner")
			local Slot = vnxGetElementData ( vehicle, "carslotnr_owner" )
			dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=? AND ??=?", "vehicles", "Antrieb", "awd", "UID", playerUID[Besitzer], "Slot", Slot )
		end
end
addEvent("motorupgrades_tuning", true)
addEventHandler("motorupgrades_tuning", getRootElement(), motorupgrade_server)


function buy_cpaintjobandtrigger( veh, cpfilepath, preis)
    local money = vnxGetElementData (client, "money")
    local Besitzer = vnxGetElementData (veh, "owner")
    local Slot = vnxGetElementData ( veh, "carslotnr_owner" )
    outputDebugString(cpfilepath)
        vnxSetElementData (client, "money", money - preis)
        giveAchievement( client, 16 )
        dbExec ( handler, "UPDATE vehicles SET cpaintjob = ? WHERE UID = ? AND Slot = ?", ""..cpfilepath, playerUID[Besitzer], vnxGetElementData ( veh, "carslotnr_owner" ) )
end 
addEvent("buy_cpaintjob", true)
addEventHandler("buy_cpaintjob", getRootElement(), buy_cpaintjobandtrigger)