jobicons["trucker"] = createPickup ( -1828.4, 99.5, 14.76, 3, 1239, 250 )
local blip = createBlip ( -1828.4, 99.5, 14.76, 58, 2, 255, 255, 0, 255, 0, 200 )

local truckTrailerPositions = {}
	local i = 0
	truckTrailerPositions["x"] = {}
	truckTrailerPositions["y"] = {}
	truckTrailerPositions["z"] = {}
		i = i + 1
		truckTrailerPositions["x"][i], truckTrailerPositions["y"][i], truckTrailerPositions["z"][i] = -1852.7467041016, 168.00143432617, 15.771370887756
		i = i + 1
		truckTrailerPositions["x"][i], truckTrailerPositions["y"][i], truckTrailerPositions["z"][i] = -1842.74609375, 168.0009765625, 15.771370887756
		i = i + 1
		truckTrailerPositions["x"][i], truckTrailerPositions["y"][i], truckTrailerPositions["z"][i] = -1832.74609375, 168.0009765625, 15.771370887756
		i = i + 1
		truckTrailerPositions["x"][i], truckTrailerPositions["y"][i], truckTrailerPositions["z"][i] = -1847.74609375, 168.0009765625, 15.771370887756
		i = i + 1
		truckTrailerPositions["x"][i], truckTrailerPositions["y"][i], truckTrailerPositions["z"][i] = -1837.74609375, 168.0009765625, 15.771370887756
		i = i + 1
		truckTrailerPositions["x"][i], truckTrailerPositions["y"][i], truckTrailerPositions["z"][i] = -1827.74609375, 168.0009765625, 15.771370887756
		trailerPositions = i
curTrailerPosition = 1

local pizzaMarkers = {}
 pizzaMarkers["c"] = {}
  pizzaMarkers["c"]["x"] = {}
  pizzaMarkers["c"]["y"] = {}
  pizzaMarkers["c"]["z"] = {}
 pizzaMarkers["m"] = {}
  pizzaMarkers["m"]["x"] = {}
  pizzaMarkers["m"]["y"] = {}
  pizzaMarkers["m"]["z"] = {}

local vanMarkers = {}
 vanMarkers["x"] = {}
 vanMarkers["y"] = {}
 vanMarkers["z"] = {}

local truckMarkers = {}
 truckMarkers["x"] = {}
 truckMarkers["y"] = {}
 truckMarkers["z"] = {}

i = 0
i = i + 1
pizzaMarkers["c"]["x"][i], pizzaMarkers["c"]["y"][i], pizzaMarkers["c"]["z"][i] = -1754.6951904297, 858.40106201172, 24.532037734985
i = i + 1
pizzaMarkers["c"]["x"][i], pizzaMarkers["c"]["y"][i], pizzaMarkers["c"]["z"][i] = -2703.2209472656, 574.03314208984, 14.35192489624
i = i + 1
pizzaMarkers["c"]["x"][i], pizzaMarkers["c"]["y"][i], pizzaMarkers["c"]["z"][i] = -2731.2082519531, -307.49130249023, 6.8367257118225
i = i + 1
pizzaMarkers["c"]["x"][i], pizzaMarkers["c"]["y"][i], pizzaMarkers["c"]["z"][i] = -2402.7194824219, 324.18630981445, 34.821102142334
i = i + 1
pizzaMarkers["c"]["x"][i], pizzaMarkers["c"]["y"][i], pizzaMarkers["c"]["z"][i] = -2755.3208007813, 377.41262817383, 3.9851632118225
i = i + 1
pizzaMarkers["c"]["x"][i], pizzaMarkers["c"]["y"][i], pizzaMarkers["c"]["z"][i] = -2847.9597167969, 825.8447265625, 40.756786346436

i = 0
i = i + 1
pizzaMarkers["m"]["x"][i], pizzaMarkers["m"]["y"][i], pizzaMarkers["m"]["z"][i] = -1754.6444091797, 855.63073730469, 23.734390258789
i = i + 1
pizzaMarkers["m"]["x"][i], pizzaMarkers["m"]["y"][i], pizzaMarkers["m"]["z"][i] = -2703.1413574219, 571.42523193359, 13.480454444885
i = i + 1
pizzaMarkers["m"]["x"][i], pizzaMarkers["m"]["y"][i], pizzaMarkers["m"]["z"][i] = -2729.056640625, -309.44122314453, 5.9890584945679
i = i + 1
pizzaMarkers["m"]["x"][i], pizzaMarkers["m"]["y"][i], pizzaMarkers["m"]["z"][i] = -2400.2312011719, 322.55783081055, 33.840644836426
i = i + 1
pizzaMarkers["m"]["x"][i], pizzaMarkers["m"]["y"][i], pizzaMarkers["m"]["z"][i] = -2752.5302734375, 377.58532714844, 3.0828084945679
i = i + 1
pizzaMarkers["m"]["x"][i], pizzaMarkers["m"]["y"][i], pizzaMarkers["m"]["z"][i] = -2845.5834960938, 823.83856201172, 39.756912231445

i = 0
i = i + 1
vanMarkers["x"][i], vanMarkers["y"][i], vanMarkers["z"][i] = -2727.9465332031, -310.59197998047, 5.8640580177307
i = i + 1
vanMarkers["x"][i], vanMarkers["y"][i], vanMarkers["z"][i] = -2497.8256835938, 318.27069091797, 28.128833770752
i = i + 1
vanMarkers["x"][i], vanMarkers["y"][i], vanMarkers["z"][i] = -1741.8256835938, 1426.4915771484, 5.8124995231628
i = i + 1
vanMarkers["x"][i], vanMarkers["y"][i], vanMarkers["z"][i] = -2414.4020996094, 753.92486572266, 33.871826171875
i = i + 1
vanMarkers["x"][i], vanMarkers["y"][i], vanMarkers["z"][i] = -2520.0170898438, -620.84649658203, 131.39762878418

i = 0
i = i + 1
truckMarkers["x"][i], truckMarkers["y"][i], truckMarkers["z"][i] = -19.127281188965, -275.6227722168, 4.3749976158142
i = i + 1
truckMarkers["x"][i], truckMarkers["y"][i], truckMarkers["z"][i] = -489.93841552734, -188.36370849609, 77.085456848145
i = i + 1
truckMarkers["x"][i], truckMarkers["y"][i], truckMarkers["z"][i] = -2273.8503417969, 2352.5837402344, 3.6452088356018
i = i + 1
truckMarkers["x"][i], truckMarkers["y"][i], truckMarkers["z"][i] = -831.51080322266, 1435.2237548828, 12.4348487854
i = i + 1
truckMarkers["x"][i], truckMarkers["y"][i], truckMarkers["z"][i] = -2120.4326171875, -2488.1789550781, 29.425018310547

function truckerJobIconHit_func ( player )

	if vnxGetElementData ( player, "job" ) == "transporteur" and not getPedOccupiedVehicle ( player ) then
		showCursor ( player, true )
		setElementClicked ( player, true )
		triggerClientEvent ( player, "showTransporteurRouteSelection", player )
	else
		infobox ( player, "Tippe /job, um\nals Transporteur zu\narbeiten.", 5000, 200, 200, 0 )
	end
end
addEventHandler ( "onPickupHit", jobicons["trucker"], truckerJobIconHit_func )

function startTransporteurRoute_func ( vehicle, time, danger )

	local player = client
	if not vnxGetElementData ( player, "transportStarted" ) then
		vnxSetElementData ( player, "truckerTrailer", false )
		local value = calcTruckerJobTourValue ( vehicle, time, danger )
		vnxSetElementData ( player, "transportStarted", true )
		local id, z, truck = 448, 14.79, false
		if vehicle == "pizza" then
			id, z = 448, 14.79
			if danger then
				infobox ( player, "Dafuer brauchst du\neinen Van oder\nTruck!", 5000, 125, 0, 0 )
				return nil
			end
		elseif vehicle == "van" then
			id, z = 440, 15.33
			if vnxGetElementData ( player, "carlicense" ) == 0 then
				infobox ( player, "Du brauchst einen\nFuehrerschein!", 5000, 125, 0, 0 )
				return nil
			end
		else
			if vnxGetElementData ( player, "lkwlicense" ) == 0 then
				infobox ( player, "Du brauchst einen\nLKW-Fuehrerschein!", 5000, 125, 0, 0 )
				return nil
			elseif vehicle == "roadtrain" then
				id, z, truck = 515, 16.28, true
			elseif vehicle == "linerunner" then
				id, z, truck = 403, 15.817, true
			elseif vehicle == "tanker" then
				id, z, truck = 514, 15.817, true
			end
		end
		local veh = vehicle
		vehicle = createVehicle ( id, -1824.0684814453, 115.23973083496, z )
		vnxSetElementData ( player, "truckerVehicle", vehicle )
		local trailer, marker
		if truck then
			trailer = math.random ( 1, 3 )
			if trailer == 1 then
				trailer = 450
			elseif trailer == 2 then
				trailer = 591
			else
				trailer = 435
			end
			
			curTrailerPosition = curTrailerPosition + 1
			if curTrailerPosition > trailerPositions then
				curTrailerPosition = 1
			end
			local tX, tY, tZ = truckTrailerPositions["x"][curTrailerPosition], truckTrailerPositions["y"][curTrailerPosition], truckTrailerPositions["z"][curTrailerPosition]

			trailer = createVehicle ( trailer, tX, tY, tZ, 0, 0, 180 )
			vnxSetElementData ( player, "truckerTrailer", trailer )
			createMovingArrow ( player, tX, tY, 22, 1.35, 2, 2500, true )
			addEventHandler ( "onTrailerAttach", trailer, truckerJobTrailerAttached )
			
			local index = math.random ( 1, table.size ( truckMarkers["z"] ) )
			local mX, mY, mZ = truckMarkers["x"][index], truckMarkers["y"][index], truckMarkers["z"][index]
			
			marker = createMarker ( mX, mY, mZ, "cylinder", 5, 125, 0, 0, 150, player )
		else
			outputChatBox ( "Stelle die Ware zu!", player, 200, 200, 0 )
			if id == 448 then
				-- Pizza
				local index = math.random ( 1, table.size ( pizzaMarkers["c"]["z"] ) )
				local cX, cY, cZ = pizzaMarkers["c"]["x"][index], pizzaMarkers["c"]["y"][index], pizzaMarkers["c"]["z"][index]
				local mX, mY, mZ = pizzaMarkers["m"]["x"][index], pizzaMarkers["m"]["y"][index], pizzaMarkers["m"]["z"][index]
				marker = createMarker ( mX, mY, mZ, "cylinder", 3, 125, 0, 0, 150, player )
				
				local blip = createBlip ( cX, cY, cZ, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
				vnxSetElementData ( player, "truckerBlip", blip )
			else
				-- Van
				local index = math.random ( 1, table.size ( vanMarkers["z"] ) )
				local mX, mY, mZ = vanMarkers["x"][index], vanMarkers["y"][index], vanMarkers["z"][index]
				marker = createMarker ( mX, mY, mZ, "cylinder", 5, 125, 0, 0, 150, player )
				
				local blip = createBlip ( mX, mY, mZ, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
				vnxSetElementData ( player, "truckerBlip", blip )
			end
		end
		setVehicleLocked ( vehicle, true )
		vnxSetElementData ( vehicle, "TruckerJobShitPlayer", getPlayerName(player) )
		setTimer ( warpPedIntoVehicle, 1000, 1, player, vehicle )
		setTimer ( activeCarGhostMode, 1000, 1, player, 5000 )
		setTimer ( addTruckerJobErrorEvents, 1000, 1, player, vehicle )
		fadeElementInterior ( player, 0, -1824.0684814453, 115.23973083496, z, 90, 0 )
		
		addEventHandler ( "onMarkerHit", marker, truckerJobTargetMarkerHit )
		vnxSetElementData ( marker, "value", value )
		vnxSetElementData ( player, "truckerMarker", marker )
		
		if time then
			local x1, y1, z1 = getElementPosition ( player )
			local x2, y2, z2 = getElementPosition ( marker )
			local timeForJob = calcTruckerJobtime ( getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ), veh )
			setTimer (
				function ( player, timeForJob )
					if isElement ( player ) then
						triggerClientEvent ( player, "startTruckerJobTimer", player, timeForJob )
					end
				end,
			1100, 1, player, timeForJob )
		end
		if danger then
			setTimer (
				function ( player )
					if isElement ( player ) then
						triggerClientEvent ( player, "showTruckerJobDamageBar", player )
					end
				end,
			1100, 1, player )
		end
	end
end
addEvent ( "startTransporteurRoute", true )
addEventHandler ( "startTransporteurRoute", getRootElement(), startTransporteurRoute_func )

function calcTruckerJobtime ( dist, veh )

	local time = dist / 10
	if veh == "pizza" then
		time = time * 0.75
	elseif veh == "van" then
		time = time * 0.75
	else
		time = time * 0.95
	end
	return math.floor ( math.abs ( time ) )
end

function truckerJobTargetMarkerHit ( hit, dim )

	if dim and hit then
		if isElement ( hit ) then
			if getElementType ( hit ) == "player" then
				local player = hit
				
				local marker = vnxGetElementData ( player, "truckerMarker" )
				if source == marker then
					local amount = vnxGetElementData ( marker, "value" )
					
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + amount )
					vnxSetElementData ( player, "truckerlvl", vnxGetElementData ( player, "truckerlvl" ) + 1 )
					
					cancelTruckerJobForPlayer ( player )
					triggerClientEvent ( player, "achievsound", player )
					triggerClientEvent ( player, "showMissionState", player, "Mission erfuellt!\n+ "..amount.." $", 3500, 0, 200, 0 )
				end
			end
		end
	end
end

function truckerJobTrailerAttached ( truck )

	local player = getVehicleOccupant ( truck )
	local marker = vnxGetElementData ( player, "truckerMarker" )
	local x1, y1, z1 = getElementPosition ( marker )
	
	local blip = createBlip ( x1, y1, z1, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
	vnxSetElementData ( player, "truckerBlip", blip )
	
	local trailer = source
	
	removeEventHandler ( "onTrailerAttach", trailer, truckerJobTrailerAttached )
	hideallArrows ( player )
end

function truckerJobVehicleDown ( )

	local veh = vnxGetElementData( source, "TruckerJobShitPlayer" )
	local play = getPlayerFromName ( veh )
	
	cancelTruckerJobForPlayer ( play )

end

function addTruckerJobErrorEvents ( player, veh )

	addEventHandler ( "onPlayerVehicleExit", player, truckerJobVehicleExit )
	addEventHandler ( "onPlayerWasted", player, truckerJobPlayerWasted )
	addEventHandler ( "onPlayerQuit", player, truckerJobPlayerQuit )
	addEventHandler ( "onVehicleExplode", veh, truckerJobVehicleDown )
	local trailer = vnxGetElementData ( player, "truckerTrailer" )
	if isElement ( trailer ) then
		addEventHandler ( "onTrailerDetach", trailer, truckerJobTrailerDetatch )
	end
end

function truckerJobTrailerDetatch ( truck )

	local trailer = source
	local player = getVehicleOccupant ( truck )
	if isElement ( player ) then
		if vnxGetElementData ( player, "transportStarted" ) then
			cancelTruckerJobForPlayer ( player )
			triggerClientEvent ( player, "showMissionState", player, "Mission fehlgeschlagen!\nDu hast den Anhaenger verloren!", 3500, 200, 0, 0 )
		end
	end
end

function truckerJobVehicleExit ( veh )

	local player = source
	cancelTruckerJobForPlayer ( player )
	triggerClientEvent ( player, "showMissionState", player, "Mission fehlgeschlagen!", 3500, 200, 0, 0 )
end
function truckerJobPlayerQuit ()

	local player = source
	cancelTruckerJobForPlayer ( player )
end
function truckerJobPlayerWasted ()

	local player = source
	setTimer (
		function ( player )
			removePedFromVehicle ( player )
			cancelTruckerJobForPlayer ( player )
			triggerClientEvent ( player, "showMissionState", player, "Mission fehlgeschlagen!", 3500, 200, 0, 0 )
		end,
	1000, 1, player )
end
function truckerJobTimeExpired_func ()

	local player = client
	triggerClientEvent ( player, "showMissionState", player, "Mission fehlgeschlagen!\nDie Zeit ist abgelaufen!", 3500, 200, 0, 0 )
	cancelTruckerJobForPlayer ( player )
end
addEvent ( "truckerJobTimeExpired", true )
addEventHandler ( "truckerJobTimeExpired", getRootElement(), truckerJobTimeExpired_func )

function removeTruckerJobErrorEvents ( player )

	removeEventHandler ( "onPlayerVehicleExit", player, truckerJobVehicleExit )
	removeEventHandler ( "onPlayerWasted", player, truckerJobPlayerWasted )
	removeEventHandler ( "onPlayerQuit", player, truckerJobPlayerQuit )
	local trailer = vnxGetElementData ( player, "truckerTrailer" )
	if isElement ( trailer ) then
		removeEventHandler ( "onTrailerDetach", trailer, truckerJobTrailerDetatch )
	end
end

function cancelTruckerJobForPlayer ( player )

	local veh = vnxGetElementData ( player, "truckerVehicle" )
	local trailer = vnxGetElementData ( player, "truckerTrailer" )
	local marker = vnxGetElementData ( player, "truckerMarker" )
	local blip = vnxGetElementData ( player, "truckerBlip" )
	
	hideallArrows ( player )
	
	vnxSetElementData ( player, "transportStarted", false )
	
	if isElement ( veh ) then
		destroyElement ( veh )
	end
	if isElement ( blip ) then
		destroyElement ( blip )
	end
	if isElement ( trailer ) then
		removeEventHandler ( "onTrailerAttach", trailer, truckerJobTrailerAttached )
		destroyElement ( trailer )
	end
	if isElement ( marker ) then
		destroyElement ( marker )
	end
	removeTruckerJobErrorEvents ( player )
	
	if isElement ( player ) then
		if not isPedDead ( player ) then
			setTimer ( fadeElementInterior, 3000, 1, player, 0, -1828.4, 99.5, 14.76, 90, 0 )
		end
	end
end

function explodeMyTruck_func ()

	local player = client
	if vnxGetElementData ( player, "transportStarted" ) then
		local veh = getPedOccupiedVehicle ( player )
		if veh then
			if isElement ( veh ) then
				local trailer = getVehicleTowedByVehicle ( veh )
				if isElement ( trailer ) then
					blowVehicle ( trailer )
				end
				blowVehicle ( veh )
			end
		end
	end
end
addEvent ( "explodeMyTruck", true )
addEventHandler ( "explodeMyTruck", getRootElement(), explodeMyTruck_func )