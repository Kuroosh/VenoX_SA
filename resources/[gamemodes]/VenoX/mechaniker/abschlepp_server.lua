local Vehicles = {
    createFactionVehicle(525, -2392.79, -153.79, 35.29, 0, 0, 269.49, 11, 255, 255, 255, 0),
    createFactionVehicle(525, -2392.79, -148.09, 35.29, 0, 0, 269.49, 11, 255, 255, 255, 0),
    createFactionVehicle(525, -2392.70, -142.40, 35.29, 0, 0, 269.49, 11, 255, 255, 255, 0),
}

for k, v in pairs(Vehicles) do
	setVehicleColor(v, 255, 255 ,0, 255, 255, 0)
end

local abgabeMarker = createMarker(-2388.3095703125, -121.9521484375, 35.288818359375 - 1, "cylinder", 4, 0, 0, 0, 200)

addEventHandler("onMarkerHit", abgabeMarker, function(vehicle)
    if getElementType(vehicle) == "vehicle" then
        local player = getVehicleOccupant(vehicle)
        if player and isMechaniker(player) then
            for i = 1, #Vehicles do
                if Vehicles[i] == vehicle then
                    local towedveh = getVehicleTowedByVehicle(vehicle)
					if towedveh then
						local owner = getElementData(towedveh, "owner") or false
						if (owner ~= false) then
							local slot = getElementData(towedveh, "carslotnr_owner")
							local pname = getPlayerFromName(owner)
							detachTrailerFromVehicle(vehicle)
							setElementDimension(towedveh, 4515)
							setElementPosition(towedveh, 1521, 15561, 651656)
							setElementFrozen(towedveh, true)
							setElementData(towedveh, "abgeschleppt", true)
							dbExec(handler, "UPDATE vehicles SET abgeschleppt=? WHERE UID=? AND slot=?", 1, playerUID[owner], slot)
						end
                    end
                end
            end
        end
    end
end)

function isElementWithinPickup(theElement, thePickup)
	if (isElement(theElement) and getElementType(thePickup) == "pickup") then
		local x, y, z = getElementPosition(theElement)
		local x2, y2, z2 = getElementPosition(thePickup)
		if (getDistanceBetweenPoints3D(x2, y2, z2, x, y, z) <= 1) then
			return true
		end
	end
	return false
end

local AbholPickup = createPickup(-1571.5908203125, 657.6171875, 7.1875, 3, 1318, 0)

addCommandHandler("freikaufen", function(player, _, carslot)
	if isElementWithinPickup(player, AbholPickup) then
		local carslot = tonumber(carslot)
		if carslot and carslot > 0 then
			local vehicle = allPrivateCars[getPlayerName(player)][carslot] or false
			if vehicle ~= false then
				if getElementData(vehicle, "abgeschleppt") == true then
					if vnxGetElementData(player, "money") >= 1500 then
						takePlayerSaveMoney(player, 1500)
						setElementDimension(vehicle, 0)
						setElementFrozen(vehicle, false)
						fixVehicle(vehicle)
						setElementPosition(vehicle, -1565.7236328125, 651.771484375, 7.0390625)
						setElementData(vehicle, "abgeschleppt", false)
						dbExec(handler, "UPDATE vehicles SET abgeschleppt=? WHERE UID=? AND slot=?", 0, playerUID[getPlayerName(player)], carslot)
						
						outputChatBox("Du hast dein Fahrzeug in "..carslot.." erfolgreich freikgekauft.", player, 0, 125, 0)
					else
						outputChatBox("Du hast nicht genug Geld!", player, 125, 0, 0)
					end
				else
					outputChatBox("Dieses Fahrzeug befindet sich nicht in unserer Garage.", player, 125, 0, 0)
				end
			end
		else
			outputChatBox("SYNTAX: /freikaufen <slot>", player, 90, 90, 90)
		end
	end
end)

addEventHandler("onPickupHit", AbholPickup, function(player)
	if getElementType(player) == "player" and getPedOccupiedVehicle(player) == false then
		outputChatBox("Hier kannst du deine Fahrzeuge freikaufen.", player, 0, 125, 0)
		outputChatBox("Befehl: /freikaufen <slot>", player, 0, 125, 0)
	end
end)

addEvent("AbschleppenClick", true)
	addEventHandler("AbschleppenClick", root, function(towedveh)
	local owner = getElementData(towedveh, "owner") or false
	local slot = getElementData(towedveh, "carslotnr_owner")
		setElementDimension(towedveh, 1)
		setElementFrozen(towedveh, true)
		setElementData(towedveh, "abgeschleppt", true)
		dbExec(handler, "UPDATE vehicles SET abgeschleppt=? WHERE UID=? AND slot=?", 1, playerUID[owner], slot)
	end)