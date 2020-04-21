--[[rcVehiclePrices = {
 ["car"] = 10000,
 ["goblin"] = 17500,
 ["baron"] = 32500,
 ["tiger"] = 22500
 }

rcVehicleDBIDs = {
 ["car"]=1,
 ["goblin"]=2,
 ["baron"]=3,
 ["tiger"]=4
 }

function joinRCClub ()

	local player = client
	if vnxGetElementData ( player, "money" ) >= 250 then
		vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 250 )
		infobox ( player, "Du bist jetzt\nMitglied im RC-Club!", 5000, 0, 125, 0 )
		vnxSetElementData ( player, "club", "rc" )
	else
		infobox ( player, "Du hast nicht\ngenug Geld!", 5000, 125, 0, 0 )
	end
end
addEvent ( "joinRCClub", true )
addEventHandler ( "joinRCClub", getRootElement(), joinRCClub )

function buyRCVehicleVan ( veh )

	local player = client
	local price = rcVehiclePrices[veh]
	if price then
		if vnxGetElementData ( player, "club" ) == "rc" then
			if vnxGetElementData ( player, "money" ) >= price then
				local pname = getPlayerName ( client )
				carbuy ( player, price, 459, -2265.10, 129.12, 35.31, 0, 0, 90 )
				local vehicle = getPedOccupiedVehicle ( player )
				if vehicle then
					local slot = vnxGetElementData ( vehicle, "carslotnr_owner" )
					local id = rcVehicleDBIDs[veh]
					
					dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=? AND ??=?", "vehicles", "rc", id, "UID", playerUID[pname], "Slot", slot )
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - price + 7500 )
					
					vnxSetElementData ( vehicle, "rcVehicle", id )
					
					outputChatBox ( "Du hast einen RC-Van erworben. Um das RC-Fahrzeug zu kontrollieren, steige hinten ein.", player, 200, 200, 0 )
				end
			else
				infobox ( player, "Du hast nicht\ngenugGeld!", 5000, 125, 0, 0 )
			end
		else
			infobox ( player, "Du bist kein\nMitglied des RC-Clubs!", 5000, 125, 0, 0 )
		end
	end
end
addEvent ( "buyRCVehicleVan", true )
addEventHandler ( "buyRCVehicleVan", getRootElement(), buyRCVehicleVan )

function rcVanEnter ( player, seat )

	local veh = source
	local rcID = vnxGetElementData ( veh, "rcVehicle" )
	if rcID then
		if getElementModel ( veh ) == 459 then
			if seat == 2 or seat == 3 then
				outputChatBox ( "In diesem Fahrzeug ist ein RC-Fahrzeug - tippe /userc, um es zu benutzen.", player, 200, 200, 0 )
			else
				outputChatBox ( "Um das RC-Fahrzeug zu kontrollieren, steige hinten ein.", player, 200, 200, 0 )
			end
		end
	end
end
addEventHandler ( "onVehicleEnter", getRootElement(), rcVanEnter )

function userc ( player )

	local veh = getPedOccupiedVehicle ( player )
	if veh then
		if getPedOccupiedVehicleSeat ( player ) > 1 then
			local rcID = vnxGetElementData ( veh, "rcVehicle" )
			if rcID then
				if vnxGetElementData ( veh, "rcVehicleInUse" ) then
					infobox ( player, "Das RC-Fahrzeug ist\nbereits in Ver-\nwendung.", 5000, 125, 0, 0 )
				else
					if getElementModel ( veh ) == 459 then
						setPedWeaponSlot ( player, 0 )
						local vehID
						if rcID == 1 then
							vehID = 441
						elseif rcID == 2 then
							vehID = 501
						elseif rcID == 3 then
							vehID = 464
						elseif rcID == 4 then
							vehID = 564
						else
							return false
						end
						local x, y, z = getElementPosition ( veh )
						local rcv = createVehicle ( vehID, x + 3, y + 3, z )
						setVehicleDamageProof ( rcv, true )
						setVehicleLocked ( rcv, true )
						
						vnxSetElementData ( player, "RCVanSeat", getPedOccupiedVehicleSeat ( player ) )
						vnxSetElementData ( player, "RCVan", veh )
						local dummy = createPed ( getElementModel ( player ), 0, 0, 0 )
						vnxSetElementData ( dummy, "player", player )
						setTimer ( warpPedIntoVehicle, 500, 1, dummy, veh, getPedOccupiedVehicleSeat ( player ) )
						
						removePedFromVehicle ( player )
						setTimer ( warpPedIntoVehicle, 500, 1, player, rcv )
						setElementAlpha ( player, 0 )
						
						addEventHandler ( "onPlayerVehicleExit", player, rcVehicleExited )
						addEventHandler ( "onPlayerQuit", player, rcVehicleQuit )
						addEventHandler ( "onPlayerWasted", player, rcVehicleWasted )
						addEventHandler ( "onPedWasted", dummy, rcVehicleDummyWasted )
						
						triggerClientEvent ( player, "showDistanceToRCVan", player, veh )
					end
				end
			end
		end
	end
end
addCommandHandler ( "userc", userc )

function rcVehicleExited ( veh )

	local player = source
	if veh and isElement(veh) then
		removePedFromVehicle ( player )
		destroyElement ( veh )
	end
	setElementAlpha ( player, 255 )
	removePlayerRCVehEvents ( player )
	
	local van = vnxGetElementData ( player, "RCVan" )
	local seat = vnxGetElementData ( player, "RCVanSeat" )
	local ped = getVehicleOccupant ( van, seat )
	if ped and isElement ( ped ) then
		destroyElement ( ped )
	end
	warpPedIntoVehicle ( player, van, seat )
end
function rcVehicleWasted ()

	local player = source
	setElementAlpha ( player, 255 )
	local veh = getPedOccupiedVehicle ( player )
	if isElement ( veh ) then
		destroyElement ( veh )
	end
	removePlayerRCVehEvents ( player )
	
	local van = vnxGetElementData ( player, "RCVan" )
	local seat = vnxGetElementData ( player, "RCVanSeat" )
	local ped = getVehicleOccupant ( van, seat )
	destroyElement ( ped )
end
function rcVehicleDummyWasted ()

	local ped = source
	local player = vnxGetElementData ( dummy, "player" )
	destroyElement ( ped )
	
	setElementAlpha ( player, 255 )
	local veh = getPedOccupiedVehicle ( player )
	local player = source
	destroyElement ( veh )
	removePlayerRCVehEvents ( player )
	
	local van = vnxGetElementData ( player, "RCVan" )
	local seat = vnxGetElementData ( player, "RCVanSeat" )
end
function rcVehicleQuit ()

	local player = source
	local veh = getPedOccupiedVehicle ( player )
	destroyElement ( veh )
	removePlayerRCVehEvents ( player )
	
	local van = vnxGetElementData ( player, "RCVan" )
	local seat = vnxGetElementData ( player, "RCVanSeat" )
	local ped = getVehicleOccupant ( van, seat )
end

function removePlayerRCVehEvents ( player )

	removeEventHandler ( "onPlayerVehicleExit", player, rcVehicleExited )
	removeEventHandler ( "onPlayerQuit", player, rcVehicleQuit )
	removeEventHandler ( "onPlayerWasted", player, rcVehicleWasted )
	if isElement ( player ) then
		triggerClientEvent ( player, "hideDistanceToRCVan", player )
	end
end

function destroyMyRCVehicle ()

	local player = client
	local rcv = getElementModel ( getPedOccupiedVehicle ( player ) )
	if ( 441 == rcv or 501 == rcv or 464 == rcv or 564 ) then
		blowVehicle ( getPedOccupiedVehicle ( player ) )
	end
end
addEvent ( "destroyMyRCVehicle", true )
addEventHandler ( "destroyMyRCVehicle", getRootElement(), destroyMyRCVehicle )]]