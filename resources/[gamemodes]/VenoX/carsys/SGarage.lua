--[[
local markerAuto = createMarker(-2009.47265625, 140.5556640625, 27.5390625-0.8, "cylinder", 4, 255, 255, 0)
local markerPerson = createMarker(-2009.884765625, 147.2109375, 27.5390625-0.8, "cylinder", 1, 0, 125, 0)

addEventHandler("onMarkerHit", markerAuto, function(player)
    local mX, mY, mZ = getElementPosition(source)
	local posX, posY, posZ = getElementPosition(player)
	if getElementType(player) == "player" and getPedOccupiedVehicle(player) and getVehicleOccupant(getPedOccupiedVehicle(player)) == player and isVehicleOnGround(getPedOccupiedVehicle(player)) and posZ >= mZ-4 and posZ <= mZ+4 then
		playerVeh = getPedOccupiedVehicle(player)
		local fahrzeugName = getVehicleName(playerVeh)
		outputChatBox("Dein Fahrzeug "..fahrzeugName.." wurde vor der Garage gefunden. Gehe zum grünen Marker!", player, 0, 120, 0)
	end
end)

addEventHandler("onMarkerHit", markerPerson, function(player)
    if not getPedOccupiedVehicle(player) then
        outputChatBox("Mit /einparken kannst du dein Fahrzeug in die Tiefgarage einparken", player, 0, 125, 0)
    else
        triggerClientEvent(player, "infobox_start", player, "Bitte steige vorher aus deinem Fahrzeug aus!", 5000, 125, 0, 0)
    end
end)

function parkhausEinparken(player)
    if isElementWithinMarker(player, markerPerson) then
        if playerVeh and getElementDimension(playerVeh) == 0 then
            if vnxGetElementData(playerVeh, "owner") == getPlayerName(player) then
                local pedsinvehicle = false
                for i = 1, getVehicleMaxPassengers(playerVeh) +1 do
                    if getVehicleOccupant(playerVeh, i-1) then
                        pedsinvehicle = true
                        break
                    end
                end
                if pedsinvehicle == false then
                    local typ
                    if isElementWithinMarker(playerVeh, markerAuto) then
                        typ = 0
                    end
                    if typ and typ == 0 then
                        vnxSetElementData(playerVeh, "imParkhaus", true)
                        setElementPosition(playerVeh, -2004.251953125, 183.2939453125, 27.5390625)
                    end
                else
                    triggerClientEvent(player, "infobox_start", player, "In deinem Fahrzeug sitzen noch Personen!", 5000, 125, 0, 0)
                end
            end
        else
            triggerClientEvent(player, "infobox_start", player, "Es steht kein Fahrzeug an der Garage!", 5000, 120, 0, 0)
        end
    else
         triggerClientEvent(player, "infobox_start", player, "Du stehst nicht an der richtigen Stelle!", 5000, 120, 0, 0)
    end
end
addCommandHandler("einparken", parkhausEinparken)
]]