function endNosUsage_func ()

	local veh = getPedOccupiedVehicle ( client )
	if veh then
		local nos = getVehicleUpgradeOnSlot ( veh, 8 )
		removeVehicleUpgrade ( veh, nos )
		if getElementData ( veh, "nitro" ) > 0 then
			addVehicleUpgrade ( veh, nos )
		end
	end
end
addEvent ( "endNosUsage", true )
addEventHandler ( "endNosUsage", getRootElement(), endNosUsage_func )

function removeNosFromVehicle_func ()

	local veh = getPedOccupiedVehicle ( client )
	if veh then
		local nos = getVehicleUpgradeOnSlot ( veh, 8 )
		removeVehicleUpgrade ( veh, nos )
	end
end
addEvent ( "removeNosFromVehicle", true )
addEventHandler ( "removeNosFromVehicle", getRootElement(), removeNosFromVehicle_func )

function nitroDataChange ( name, old )

	if client then
		if name == "nitro" then
			if getPedOccupiedVehicleSeat ( client ) == 0 then
				if old then
					if getElementData ( source, name ) > old and old > 0 then
						setElementData ( source, name, old )
					end
				end
			end
		end
	end
end
addEventHandler ( "onElementDataChange", getRootElement(), nitroDataChange )