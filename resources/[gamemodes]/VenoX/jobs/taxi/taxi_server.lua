taxijobicon = createPickup ( -2543.2326660156, 1228.1779785156, 37.116344451904, 3, 1239, 1000, 0 )
local blip = createBlip (  -2543.2326660156, 1228.1779785156, 37.116344451904, 58, 2, 255, 255, 0, 255, 0, 200 )

taxiDrivers = {}
taxiCustomer = {}
taxiCars = {}

taxiSpawns = {}
i = 1
 taxiSpawns[i] = {}
 taxiSpawns[i]["id"] = 420
 taxiSpawns[i]["x"] = -2512.25
 taxiSpawns[i]["y"] = 1209.85
 taxiSpawns[i]["z"] = 37.27
 taxiSpawns[i]["rz"] = 270
i = i + 1
 taxiSpawns[i] = {}
 taxiSpawns[i]["id"] = 420
 taxiSpawns[i]["x"] = -2512.08
 taxiSpawns[i]["y"] = 1205.32
 taxiSpawns[i]["z"] = 37.27
 taxiSpawns[i]["rz"] = 270
i = i + 1
 taxiSpawns[i] = {}
 taxiSpawns[i]["id"] = 420
 taxiSpawns[i]["x"] = -2501.70
 taxiSpawns[i]["y"] = 1222.24
 taxiSpawns[i]["z"] = 37.27
 taxiSpawns[i]["rz"] = 145
i = i + 1
 taxiSpawns[i] = {}
 taxiSpawns[i]["id"] = 420
 taxiSpawns[i]["x"] = -2494.71
 taxiSpawns[i]["y"] = 1217.18
 taxiSpawns[i]["z"] = 37.27
 taxiSpawns[i]["rz"] = 145
i = i + 1
 taxiSpawns[i] = {}
 taxiSpawns[i]["id"] = 420
 taxiSpawns[i]["x"] = -2517.05
 taxiSpawns[i]["y"] = 1229.10
 taxiSpawns[i]["z"] = 37.27
 taxiSpawns[i]["rz"] = 210
i = i + 1
 taxiSpawns[i] = {}
 taxiSpawns[i]["id"] = 420
 taxiSpawns[i]["x"] = -2530.05
 taxiSpawns[i]["y"] = 1229.29
 taxiSpawns[i]["z"] = 37.27
 taxiSpawns[i]["rz"] = 210
i = i + 1
 taxiSpawns[i] = {}
 taxiSpawns[i]["id"] = 420
 taxiSpawns[i]["x"] = -2539.05
 taxiSpawns[i]["y"] = 1229.47
 taxiSpawns[i]["z"] = 37.27
 taxiSpawns[i]["rz"] = 210

function changeTaxiLight ( player, key, state )
	if state == "down" then
		if getPedOccupiedVehicleSeat ( player ) == 0 then
			local veh = getPedOccupiedVehicle ( player )
			local state = isVehicleTaxiLightOn ( veh )
			setVehicleTaxiLightOn ( veh, not state )
			if not state then
				taxiDrivers[player] = true
				infobox ( player, "\nDu bist im Dienst!\nWenn jemand\nein Taxi ruft,\nbekommst du\neine Meldung!", 5000, 200, 200, 0 )
			else
				taxiDrivers[player] = nil
				infobox ( player, "\n\n\nDienst beendet!", 5000, 200, 200, 0 )
			end
		end
	end
end


local function leftTaxi_func ( veh )
	unbindKey ( source, "sub_mission", "down", changeTaxiLight )
	if isVehicleTaxiLightOn ( veh ) then
		endTaxiDuty ( source, veh )
	end
	removeEventHandler ( "onPlayerVehicleExit", player, leftTaxi_func )
end


function taxiEnter_func ( player, seat, jacked )
	if seat == 0 then
		if vnxGetElementData ( player, "job" ) == "taxifahrer" then
			setVehicleTaxiLightOn ( source, false )
			bindKey ( player, "sub_mission", "down", changeTaxiLight )
			infobox ( player, "\nDrücke die Spezial-\nMissionen-Taste,\num in den Dienst\nzu gehen!", 5000, 200, 200, 0 )
			addEventHandler ( "onPlayerVehicleExit", player, leftTaxi_func )
		else
			opticExitVehicle ( player )
			infobox ( player, "\n\n\nDu bist kein Taxi-\nfahrer!", 5000, 200, 0, 0 )
		end
	else
		if isVehicleTaxiLightOn ( source ) then
			local driver = getVehicleOccupant ( source, 0 )
			if driver then
				triggerClientEvent ( player, "startTaxameter", player )
			end
		end
	end
end



function taxiPayCheck_func ()
	local player = client
	local veh = getPedOccupiedVehicle ( player )
	local driver = getVehicleOccupant ( veh, 0 )
	if isElement ( player ) and isElement ( driver ) then
		if vnxGetElementData ( player, "money" ) >= taxiPricePerInterval then
			takePlayerSaveMoney ( player, taxiPricePerInterval )
			givePlayerSaveMoney ( driver, taxiPricePerInterval )
		else
			opticExitVehicle ( player )
			setTimer ( removePedFromVehicle, 2500, 1, player )
			infobox ( driver, "\n\n\nDein Kunde hat\nkein Geld mehr!", 5000, 200, 200, 0 )
			infobox ( player, "\n\n\nDu hast kein\nGeld mehr!", 5000, 200, 0, 0 )
		end
	end
end
addEvent ( "taxiPayCheck", true )
addEventHandler ( "taxiPayCheck", getRootElement(), taxiPayCheck_func )


function endTaxiDuty ( player, veh )
	setVehicleTaxiLightOn ( veh, false )
	taxiDrivers[player] = nil
	infobox ( player, "\n\n\nDienst beendet!", 5000, 200, 200, 0 )
	triggerClientEvent ( player, "cancelTaxi", player, "cmd", "taxi" )
end


for key, index in pairs ( taxiSpawns ) do
	local id, x, y, z, rz = taxiSpawns[key]["id"], taxiSpawns[key]["x"], taxiSpawns[key]["y"], taxiSpawns[key]["z"], taxiSpawns[key]["rz"]
	taxiCars[key] = createVehicle ( id, x, y, z, 0, 0, rz, "SF-CX 0"..key )
	setVehicleRespawnPosition ( taxiCars[key], x, y, z )
	toggleVehicleRespawn ( taxiCars[key], true )
	setVehicleRespawnDelay ( taxiCars[key], 1000*10 )
	setVehicleIdleRespawnDelay ( taxiCars[key], 1000*60 )
	addEventHandler ( "onVehicleEnter", taxiCars[key], taxiEnter_func )
end


function service_taxi ( player, cmd, arg )
	if arg == "taxi" then
		executeCommandHandler ( "call", player, "400" )
	end
end
addCommandHandler ( "service", service_taxi )


function orderTaxi ( player )
	if not taxiCustomer[player] then
		local driversOnline = 0
		for key, index in pairs ( taxiDrivers ) do
			if isElement ( key ) then
				driversOnline = driversOnline + 1
				outputChatBox ( getPlayerName ( player ).." braucht ein Taxi! Tippe /accept taxi, um anzunehmen!", key, 0, 125, 0 )
			else
				taxiDrivers[key] = nil
			end
		end
		if driversOnline > 0 then
			taxiCustomer[player] = true
			infobox ( player, "\n\n\nDeine Anfrage ist\nin Bearbeitung!", 5000, 200, 200, 0 )
		else
			infobox ( player, "\n\n\nEs ist momentan\nleider kein Taxi-\nfahrer online!", 5000, 200, 200, 0 )
		end
	else
		infobox ( player, "\n\n\nDu hast bereits\nein Taxi ange-\nfordert!", 5000, 200, 200, 0 )
	end
end


function accept_taxi ( player, cmd, arg )
	if arg == "taxi" then
		local veh = getPedOccupiedVehicle ( player )
		if veh and isVehicleTaxiLightOn ( veh ) and vnxGetElementData ( player, "job" ) == "taxifahrer" then
			for key, index in pairs ( taxiCustomer ) do
				if not isElement ( key ) then
					taxiCustomer[key] = nil
				else
					taxiCustomer[key] = nil
					triggerClientEvent ( player, "showTaxiCustomerBlip", player, key )
					infobox ( key, "\n\nTaxifahrer "..getPlayerName(player).."\nist auf dem Weg\nzu dir!", 7500, 200, 200, 0 )
					outputChatBox ( "Tippe /cancel taxi, um den Marker zu loeschen!", player, 125, 0, 0 )
					return
				end
			end
			infobox ( player, "\n\n\nIm Moment braucht\nniemand ein Taxi!", 5000, 200, 200, 0 )
		else
			infobox ( player, "\n\n\nDu bist nicht\nim Dienst!", 5000, 200, 200, 0 )
		end
	end
end
addCommandHandler ( "accept", accept_taxi )


function cancelTaxi_func ( player )
	if isElement ( player ) then
		infobox ( player, "\n\n\nDein Fahrer hat\nden Dienst quittiert!", 5000, 200, 200, 0 )
	end
end
addEvent ( "cancelTaxi", true )
addEventHandler ( "cancelTaxi", getRootElement(), cancelTaxi_func )


function jobicon_taxi ( player )
	triggerClientEvent ( player, "infobox_start", player, "\nTippe /job, um\nTaxifahrer zu werden -\n dazu brauchst du\neinen Fuehrer-\nschein!", 4000, 200, 200, 0 )
end
addEventHandler ( "onPickupHit", taxijobicon, jobicon_taxi )