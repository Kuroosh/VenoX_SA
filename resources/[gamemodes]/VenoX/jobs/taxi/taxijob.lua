taxijobicon = createPickup ( -2543.2326660156, 1228.1779785156, 37.116344451904, 3, 1239, 1000, 0 )

taxiblip = createBlip ( -2543.2326660156, 1228.1779785156, 37.116344451904, 52, 1, 255, 0, 0, 255, 0, 200 )
setElementVisibleTo ( taxiblip, getRootElement(), false )

local taxiVehicles = {
	createVehicle ( 420, -2512.2512207031, 1209.8507080078, 37.271873474121, 0, 0, 270, "Taxi 1" )
	createVehicle ( 420, -2512.0871582031, 1205.3233642578, 37.271873474121, 0, 0, 270, "Taxi 2" )
	createVehicle ( 420, -2501.7060546875, 1222.2401123047, 37.278327941895, 0, 0, 145, "Taxi 3" )
	createVehicle ( 420, -2494.7189941406, 1217.1856689453, 37.278327941895, 0, 0, 145, "Taxi 4" )
	createVehicle ( 420, -2517.0568847656, 1229.1000976563, 37.278327941895, 0, 0, 210, "Taxi 5" )
	createVehicle ( 420, -2530.0539550781, 1229.2932128906, 37.278327941895, 0, 0, 210, "Taxi 6" )
	createVehicle ( 420, -2539.0537109375, 1229.4775390625, 37.278327941895, 0, 0, 210, "Taxi 7" )
}

function VehicleTaxiEnter ( player, seat )
	if vnxGetElementData ( player, "job" ) == "taxifahrer" and seat == 0 then
		bindKey ( player, "sub_mission", "down", taxilight )
	elseif seat == 0 then
		opticExitVehicle ( player )
		triggerClientEvent ( player, "infobox_start", player, "\n\nDu bist\nkein Taxifahrer!", 5000, 125, 0, 0 )
	elseif seat ~= 0 then
		if isVehicleTaxiLightOn ( source ) then
			local driver = getVehicleOccupant ( source, 0 )
			local passenger = player
			if driver ~= false and driver ~= nil then
				triggerClientEvent ( driver, "infobox_start", driver, "\nEin Kunde ist\nin dein Taxi\ngestiegen!", 5000, 125, 0, 0 )
				triggerClientEvent ( passenger, "infobox_start", passenger, "Du zahlst dem\nTaxifahrer "..taxipreis.." $\npro 5 Sekunden", 5000, 125, 0, 0 )
				setTimer ( paycheckTaxi, 5000, 1, passenger, driver )
			end
		end
	end
end


for i=1, #taxiVehicles do
	setVehicleRespawnPosition ( taxiVehicles[i], getElementPosition ( taxiVehicles[i] ) )
	toggleVehicleRespawn ( taxiVehicles[i], true )
	setVehicleRespawnDelay ( taxiVehicles[i], 1000*10 )
	setVehicleIdleRespawnDelay ( taxiVehicles[i], 1000*60 )
	addEventHandler ( "onVehicleEnter", taxiVehicles[i], VehicleTaxiEnter )
end
	

function jobicon_taxi ( player )
	triggerClientEvent ( player, "infobox_start", player, "Tippe /job, um\nTaxifahrer zu werden -\n dazu brauchst du\neinen Führer-\nschein!", 1000, 200, 200, 0 )
end
addEventHandler ( "onPickupHit", taxijobicon, jobicon_taxi )


function taxilight (player,key,state)
	if state == "down" then
		if getPedOccupiedVehicleSeat ( player ) == 0 then
			local veh = getPedOccupiedVehicle ( player )
			for i = 1, 7 do
				if taxiVehicles[i] == veh then
					if not isVehicleTaxiLightOn ( veh ) then
						setVehicleTaxiLightOn ( veh, true )
					else
						setVehicleTaxiLightOn ( veh, false )
					end
					return
				end
			end
			if getElementModel ( veh ) == 420 or getElementModel ( veh ) == 438 then
				if isVehicleTaxiLightOn ( veh ) == false then
					setVehicleTaxiLightOn ( veh, true )
				else
					setVehicleTaxiLightOn ( veh, false )
				end
			end
		end
	end
end


function paycheckTaxi ( passenger, driver )

	if getPedOccupiedVehicleSeat ( driver ) == 0 and getPedOccupiedVehicleSeat ( passenger ) then
		if vnxGetElementData ( passenger, "money" ) >= taxipreis then
			vnxSetElementData ( passenger, "money", vnxGetElementData ( passenger, "money" ) - taxipreis )
			vnxSetElementData ( driver, vnxGetElementData ( driver, "money" ) + taxipreis )
			setTimer ( paycheckTaxi, 5000, 1, passenger, driver )
		else
			triggerClientEvent ( passenger, "infobox_start", passenger, "\nDu hast nicht\n mehr genug\nGeld!", 5000, 125, 0, 0 )
			triggerClientEvent ( driver, "infobox_start", driver, "\nDer Passant hat\n nicht mehr\ngenug Geld!", 5000, 125, 0, 0 )
		end
	end
end