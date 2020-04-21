local vehicleSeats = {}
local playerVehicles = {}
local playerOldVehicles = {}

function keybind ( vehicle, seat )								--- Tasten festlegen
	if not vehicleSeats[vehicle] then
		vehicleSeats[vehicle] = {}
	end
	if seat == 1 then
		vehicleSeats[vehicle]["seat1"] = false
	end
	if seat == 2 then
		vehicleSeats[vehicle]["seat2"] = false
	end
	if seat == 3 then
		vehicleSeats[vehicle]["seat3"] = false
	end
	if getElementType (source) == "player" then
		bindKey ( source, "rshift", "down", helidriveby )
	end
end
addEventHandler ( "onPlayerVehicleEnter", root, keybind )

function vehicle_enter ( player, seat, door )					--- Tasten festlegen

	if seat == 1 then
		if vehicleSeats[vehicle] and vehicleSeats[vehicle]["seat1"] then
			cancelEvent()
		end
	end
	if seat == 2 then
		if vehicleSeats[vehicle] and vehicleSeats[vehicle]["seat2"] then
			cancelEvent()
		end
	end
	if seat == 3 then
		if vehicleSeats[vehicle] and vehicleSeats[vehicle]["seat3"] then
			cancelEvent()
		end
	end
end
addEventHandler ( "onVehicleStartEnter", root, vehicle_enter )


function weaponsup ( source )
	if vehicleSeats[source] and vehicleSeats[source]["oldseat"] and isElementAttached ( source ) then
		triggerClientEvent ( source, "helidbGunAuslese", root, "up" )
	end
end


function weaponsdown ( source )
	if vehicleSeats[source] and vehicleSeats[source]["oldseat"] and isElementAttached ( source ) then
		triggerClientEvent ( source, "helidbGunAuslese", root, "down" )
	end
end


function helidriveby ( source )									--- dranhängen
	local playervehicle = getPedOccupiedVehicle ( source )
	playerVehicles[source] = playervehicle
	playerOldVehicles[source] = playervehicle
	if ( playerVehicles[source] ) then 
		if getElementModel ( playerVehicles[source] ) == 487 or getElementModel ( playerVehicles[source] ) == 497 then
			vehicleSeats[source] = { ["seat"] = getPedOccupiedVehicleSeat ( source ) }
			if ( vehicleSeats[source]["seat"] ) == 2 then 
				removePedFromVehicle ( source )
				attachElements ( source, playerVehicles[source] , -1.2, 0.3, 0 )
				setPedWeaponSlot( source, 5 )
				vehicleSeats[source]["oldseat"] = 2
				vehicleSeats[playervehicle]["seat2"] = true
			else
				if ( vehicleSeats[source]["seat"] ) == 3 then
					removePedFromVehicle ( source )
					attachElements ( source, playerVehicles[source] , 1.2, 0.3, 0 )
					setPedWeaponSlot( source, 5 )
					vehicleSeats[source]["oldseat"] = 2
					vehicleSeats[playervehicle]["seat3"] = true
				else
					if ( vehicleSeats[source]["seat"] ) == 1 then
						removePedFromVehicle ( source )
						attachElements ( source, playerVehicles[source] , 1.2, 1.7, 0 )
						setPedWeaponSlot( source, 5 )
						vehicleSeats[source]["oldseat"] = 1
						vehicleSeats[playervehicle]["seat1"] = true
						triggerClientEvent ( source, "helidbCameraFix", getRootElement() )
					end
				end
			end
			if ( vehicleSeats[source]["seat"] ) > 0 then
				bindKey ( source, "mouse_wheel_up", "down", weaponsup )
				bindKey ( source, "mouse_wheel_down", "down", weaponsdown )
				bindKey ( source , "g", "down", rein )
				bindKey ( source , "enter", "down", eject )
				unbindKey ( source , "rshift", "down", helidriveby )
			end
		elseif getElementModel ( playerVehicles[source] ) == 469 or getElementModel ( playerVehicles[source] ) == 447 then
			vehicleSeats[source]["seat"] = getPedOccupiedVehicleSeat ( source )
			if ( vehicleSeats[source]["seat"] ) == 2 then 
				removePedFromVehicle ( source )
				attachElements ( source, playerVehicles[source] , -1.2, 0.3, 0 )
				setPedWeaponSlot( source, 5 )
				vehicleSeats[source]["oldseat"] = 2
				vehicleSeats[playervehicle]["seat2"] = true
			else
				if ( vehicleSeats[source]["seat"] ) == 3 then
					removePedFromVehicle ( source )
					attachElements ( source, playerVehicles[source] , 1.2, 0.3, 0 )
					setPedWeaponSlot( source, 5 )
					vehicleSeats[source]["oldseat"] = 3
					vehicleSeats[playervehicle]["seat3"] = true
				else
					if ( vehicleSeats[source]["seat"] ) == 1 then
						removePedFromVehicle ( source )
						attachElements ( source, playerVehicles[source] , 1.2, 1.7, 0 )
						setPedWeaponSlot( source, 5 )
						vehicleSeats[source]["oldseat"] = 1
						vehicleSeats[playervehicle]["seat1"] = true
						triggerClientEvent ( source, "helidbCameraFix", getRootElement() )
					end
				end
			end
			if ( vehicleSeats[source]["seat"] ) > 0 then
				bindKey ( source, "mouse_wheel_up", "down", weaponsup )
				bindKey ( source, "mouse_wheel_down", "down", weaponsdown )
				bindKey ( source , "g", "down", rein )
				bindKey ( source , "enter", "down", eject )
				unbindKey ( source , "rshift", "down", helidriveby )
			end
		end
	end
end

function rein ( source )										--- Wieder einsteigen

    if ( playerOldVehicles[source] ) then
		detachElements ( source, playerOldVehicles[source], vehicleSeats[source]["oldseat"] )
		warpPedIntoVehicle ( source, playerOldVehicles[source], vehicleSeats[source]["oldseat"] )
		if ( vehicleSeats[source]["oldseat"] == 1) then
			vehicleSeats[playerVehicles[source]]["seat1"] = false
		end
		if ( vehicleSeats[source]["oldseat"] == 2) then
			vehicleSeats[playerVehicles[source]]["seat2"] = false
		end
		if ( vehicleSeats[source]["oldseat"] == 3) then
			vehicleSeats[playerVehicles[source]]["seat3"] = false
		end
		vehicleSeats[source]["oldseat"] = false
		playerOldVehicles[source] = false
		unbindKey ( source, "mouse_wheel_up", "down", weaponsup )
		unbindKey ( source, "mouse_wheel_down", "down", weaponsdown )
		unbindKey ( source , "g", "down", rein )
		unbindKey ( source , "enter", "down", eject )
		bindKey ( source, "rshift", "down", helidriveby )
    end
end

function eject ( source )										--- Abspringen

	local veh = playerVehicles[source]
	if vehicleSeats[source]["oldseat"] == 1 then
		vehicleSeats[veh]["seat1"] = false
	end
	if vehicleSeats[source]["oldseat"] == 2 then
		vehicleSeats[veh]["seat2"] = false
	end
	if vehicleSeats[source]["oldseat"] == 3 then
		vehicleSeats[veh]["seat3"] = false
	end
	vehicleSeats[source]["oldseat"] = 0
	playerOldVehicles[source] = 0
	unbindKey ( source, "mouse_wheel_up", "down", weaponsup )
	unbindKey ( source, "mouse_wheel_down", "down", weaponsdown )
	unbindKey ( source , "g", "down", rein )
	unbindKey ( source , "enter", "down", eject )
	unbindKey ( source, "rshift", "down", helidriveby )
	detachElements ( source )
end

function helidestroyed ()

	if not isElement(source) then
		return
	end
	
	if not vehicleSeats[source] or not vehicleSeats[source]["seat1"] or not vehicleSeats[source]["seat2"] or not vehicleSeats[source]["seat3"] then
		return
	end

	vehicleSeats[source] = {}
end
addEventHandler ( "onVehicleExplode", root, helidestroyed )