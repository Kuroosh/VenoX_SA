PnsSFWangCars = createColCircle (-1904.47949, 289.4714660, 5 )
PnsSFJuniperHill = createColCircle (-2425.8376464844, 1020.0791015625, 5 )
PnsLVCity = createColSphere ( 1976.6048583984, 2162.4150390625, 9.5703125, 3 )
PnsFortCarson = createColSphere ( -99.773811340332, 1118.3737792969, 18.294296264648, 3 )
PnsIdleWood = createColSphere ( 2061.20703125, -1831.5673828125, 13.546875, 3 )
PnsDillimore = createColSphere ( 720.2373046875, -455.859375, 16.3359375, 3 )
PnsTemple = createColSphere ( 1024.9111328125, -1023.7529296875, 32.1015625, 3 )
PnsBeach = createColSphere ( 487.347, -1741.646, 11.131, 3 )

setGarageOpen ( 36, true )
setGarageOpen ( 41, true )
setGarageOpen ( 8, true )
setGarageOpen ( 47, true )
setGarageOpen ( 11, true )
setGarageOpen ( 12, true )
setGarageOpen ( 19, true )
setGarageOpen ( 27, true )

PnsSFWangCarsBlip = createBlip ( -1904.47949, 289.4714660, 5, 63, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
PnsLVCityBlip = createBlip ( 1976.6048583984, 2162.4150390625, 9.5703125, 63, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
PnsFortCarsonBlip = createBlip ( -99.773811340332, 1118.3737792969, 18.294296264648, 63, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
PnsIdleWoodBlip = createBlip ( 2061.20703125, -1831.5673828125, 13.546875, 63, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
PnsDillimoreBlip = createBlip ( 720.2373046875, -455.859375, 16.3359375, 63, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
PnsTempleBlip = createBlip ( 1024.9111328125, -1023.7529296875, 32.1015625, 63, 2, 255, 0, 0, 255, 0, 300, getRootElement() )
PnsBeachBlip = createBlip ( 487.347, -1741.646, 11.131, 63, 2, 255, 0, 0, 255, 0, 300, getRootElement() )
PnsSFJuniperHillBlip = createBlip ( -2425.8376464844, 1020.0791015625, 50, 63, 2, 255, 0, 0, 255, 0, 200, getRootElement() )

vnxSetElementData ( PnsSFWangCars, "gateID", 19 )
vnxSetElementData ( PnsLVCity, "gateID", 36 )
vnxSetElementData ( PnsFortCarson, "gateID", 41 )
vnxSetElementData ( PnsIdleWood, "gateID", 8 )
vnxSetElementData ( PnsDillimore, "gateID", 47 )
vnxSetElementData ( PnsTemple, "gateID", 11 )
vnxSetElementData ( PnsBeach, "gateID", 12 )
vnxSetElementData ( PnsSFJuniperHill, "gateID", 27 )


function paynSprayRepair ( hitElement )
	if hitElement and isElement ( hitElement ) and getElementType ( hitElement ) == "vehicle" then
		if getVehicleOccupant ( hitElement, 0 ) then
			local player = getVehicleOccupant ( hitElement, 0 )
			if vnxGetElementData ( player, "money" ) >= paynsprayprice then
				vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - paynsprayprice )
				local x, y, z = getElementPosition ( player )
				if (source == PnsSFWangCars and z > 37 and z < 46) or source ~= PnsSFWangCars then
					if getVehicleType ( hitElement ) ~= "Plane" and getVehicleType ( hitElement ) ~= "Helicopter" and getVehicleType ( hitElement ) ~= "Boat" and getVehicleType ( hitElement ) ~= "Train" and getVehicleType ( hitElement ) ~= "Trailer" then
						setElementFrozen ( player, true )
						setElementFrozen ( hitElement, true )
						if source == PnsSFWangCars then
							bizArray["PaynSprayWangcars"]["kasse"] = bizArray["PaynSprayWangcars"]["kasse"] + math.floor(paynsprayprice/5)
						elseif source == PnsSFJuniperHill then
							bizArray["PaynSprayJuniper"]["kasse"] = bizArray["PaynSprayJuniper"]["kasse"] + math.floor(paynsprayprice/5)
						elseif source == PnsLVCity or source == PnsFortCarson then
							bizArray["PaynSprayLV"]["kasse"] = bizArray["PaynSprayLV"]["kasse"] + math.floor(paynsprayprice/5)
						elseif source == PnsIdleWood or source == PnsDillimore or source == PnsTemple or source == PnsBeach then
							bizArray["PaynSprayLS"]["kasse"] = bizArray["PaynSprayLS"]["kasse"] + math.floor(paynsprayprice/5)
						end
						if isGarageOpen ( vnxGetElementData ( source, "gateID" ) ) == true then
							setGarageOpen ( vnxGetElementData ( source, "gateID" ), false )
						end
						setTimer ( repairthiscarinpaynspray, 3000, 1, hitElement, player, vnxGetElementData ( source, "gateID" ) )
					end									
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Dein Auto umzulackieren\nkostet "..paynsprayprice.." $!", 5000, 125, 0, 0 )
			end
		end
	end
end
addEventHandler ( "onColShapeHit", PnsSFWangCars, paynSprayRepair )
addEventHandler ( "onColShapeHit", PnsSFJuniperHill, paynSprayRepair )
addEventHandler ( "onColShapeHit", PnsLVCity, paynSprayRepair )
addEventHandler ( "onColShapeHit", PnsFortCarson, paynSprayRepair )
addEventHandler ( "onColShapeHit", PnsIdleWood, paynSprayRepair )
addEventHandler ( "onColShapeHit", PnsDillimore, paynSprayRepair )
addEventHandler ( "onColShapeHit", PnsTemple, paynSprayRepair )
addEventHandler ( "onColShapeHit", PnsBeach, paynSprayRepair )


function repairthiscarinpaynspray ( veh, player, gateID )
	if not isGarageOpen ( gateID ) then
		setGarageOpen ( gateID, true )
	end
	playSoundFrontEnd ( player, 46 )
	setElementFrozen ( player, false )
	fixVehicle ( veh )
	if vnxGetElementData ( veh, "stuning2" ) then
		setElementHealth ( veh, 1700 )
	end
	setElementFrozen ( veh, false )
end