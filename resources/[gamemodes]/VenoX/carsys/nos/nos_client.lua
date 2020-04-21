screenwidth, screenheight = guiGetScreenSize()
drawNos = false
usedNos = 0
local nosInUsage = false
local nosKey
local nosTimer
local lp = localPlayer

function useNosCheck ( key, state )

	refreshNosValues ()
	if state == "down" and not nosInUsage and not nosKey then
		nosKey = key
		local veh = getPedOccupiedVehicle ( lp )
		if veh then
			if getPedOccupiedVehicleSeat ( lp ) == 0 then
				vehicleWithNosEnter_func ( veh, 0 )
				local nos = getVehicleUpgradeOnSlot ( veh, 8 )
				if nos then
					nosInUsage = true
					usedNos = 0
					nosTimer = setTimer ( nosUsage, 200, 0 )
					nosUsage ()
				end
			end
		end
	elseif nosInUsage and state ~= "down" and key == nosKey then
		syncNosWithServer ()
		nosKey = nil
		triggerServerEvent ( "endNosUsage", lp )
		nosInUsage = false
		killTimer ( nosTimer )
	end
end
bindKey ( "vehicle_fire", "both", useNosCheck )
bindKey ( "vehicle_secondary_fire", "both", useNosCheck )

function vehicleWithNosExit_func ( veh, seat )

	syncNosWithServer ( veh )
	nosKey = nil
	triggerServerEvent ( "endNosUsage", lp )
	nosInUsage = false
	if isTimer ( nosTimer ) then
		killTimer ( nosTimer )
	end
end
addEventHandler ( "onClientPlayerVehicleExit", lp, vehicleWithNosExit_func )

function vehicleWithNosEnter_func ( veh, seat )

	if seat == 0 then
		if not getElementData ( veh, "nitro" ) or getElementData ( veh, "nitro" ) == 0 then
			local nos = getVehicleUpgradeOnSlot ( veh, 8 )
			local nosInVehicle = 0
			if nos then
				if nos == 1010 then
					nosInVehicle = 100
				elseif nos == 1008 then
					nosInVehicle = 67
				elseif nos == 1009 then
					nosInVehicle = 33
				end
			end
			setElementData ( veh, "nitro", nosInVehicle )
			refreshNosValues ()
		end
		refreshNosValues ()
	end
end
addEventHandler ( "onClientPlayerVehicleEnter", lp, vehicleWithNosEnter_func )

function nosUsage ()

	refreshNosValues ()
	usedNos = usedNos + 1
	local veh = getPedOccupiedVehicle ( lp )
	if veh then
		if usedNos >= getElementData ( veh, "nitro" ) or ( getElementData ( veh, "nitro" ) - usedNos ) < 0 then
			setElementData ( veh, "nitro", 0 )
			triggerServerEvent ( "endNosUsage", lp )
			nosKey = nil
			triggerServerEvent ( "removeNosFromVehicle", lp )
			nosInUsage = false
			killTimer ( nosTimer )
		end
	end
end

function syncNosWithServer ( veh )

	if not veh then
		veh = getPedOccupiedVehicle ( lp )
	end
	if veh and isElement(veh) and getElementData ( veh, "nitro" ) then
		setElementData ( veh, "nitro", getElementData ( veh, "nitro" ) - usedNos )
	end
end