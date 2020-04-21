addEvent("descer", true)
addEvent("subir", true)

limitsuspension = "true"

function descer( player )
	local veh = getPedOccupiedVehicle ( source )
	if not veh then return end
	local suspensao = (getVehicleHandling(veh)['suspensionLowerLimit']) -- Get actual car handling for lower
	if limitsuspension == "true" then -- Verify if limit suspension are true or false on this mod settings
		if suspensao == math.abs(suspensao) then -- Compares and checks if it is a negative number
			infobox ( player, "\nMaximale Tiefe\nerreicht!", 3000, 255, 0, 0 )
		else
			setVehicleHandling ( veh, "suspensionLowerLimit", suspensao+0.1 ) -- With suspension limit 
		end
	else
		setVehicleHandling ( veh, "suspensionLowerLimit", suspensao+0.1 ) -- Without suspension  limit 
	end
end
addEventHandler("descer", root, descer)

function subir( player )
	local veh = getPedOccupiedVehicle ( source )
	if not veh then return end
	local altura_original = (getVehicleHandling(veh)['suspensionUpperLimit']*-1) -- Get the original handling and multiply to get negative and matches with the actual
	local suspensao = (getVehicleHandling(veh)['suspensionLowerLimit']) -- Get actual handling from the player car
	if limitsuspension == "true" then  -- Verify if limit suspension are true or false on this mod settings
		if (suspensao < altura_original-0.2) then --  Compares if the suspension are less then original handling height
			infobox ( player, "\nMaximale Höhe\nerreicht!", 3000, 255, 0, 0 )
		else
			setVehicleHandling ( veh, "suspensionLowerLimit", suspensao-0.1 ) -- With suspension limit
		end
	else
		setVehicleHandling ( veh, "suspensionLowerLimit", suspensao-0.1 ) -- Without suspension limit
	end
end
addEventHandler("subir", root, subir)
