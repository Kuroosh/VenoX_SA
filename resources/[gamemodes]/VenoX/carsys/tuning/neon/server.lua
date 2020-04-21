local neonColors = {["red"] = 14399, ["blue"] = 14400, ["green"] = 14401, ["yellow"] = 14402, ["pink"] = 14403, ["white"] = 14404}
local adding = {}
local deleting = {}

local function destroyNeon()
	local theveh = source
	if not getElementData(theveh, "neonc") then return end
	local neonEl = getElementData(theveh, "neonc")
	if neonEl and neonEl ~= "" then
		local neonElNs = getElementData(neonEl, "neon")
		if neonElNs then
			if isElement(neonElNs[1]) then
				destroyElement(neonElNs[1])
			end
			if isElement(neonElNs[2]) then
				destroyElement(neonElNs[2])
			end
			if isElement(neonEl) then
				destroyElement(neonEl)
			end
		end
	end
end	


function attachNeon(color, vehicle, zDis)
	if not color then return end
	if not vehicle then return end
	adding[vehicle] = nil
	if deleting[vehicle] then
		deleting[vehicle] = nil
		return
	end
	if not neonColors[color] then return end
	if hasNeon(vehicle) then return false end
	local neonElement = createElement("neon")
	local x, y, z = getElementPosition(vehicle)
	local rx, ry, rz = getElementRotation(vehicle)	
	local vHandling = getVehicleHandling(vehicle)
	local rDis = vHandling["suspensionLowerLimit"]
	local neon1 = createObject(neonColors[color], x, y, z)
	setElementRotation(neon1, rx, ry, rz)
	local neon2 = createObject(neonColors[color], x, y, z)
	setElementRotation(neon2, rx, ry, rz)
	attachElements(neon1, vehicle, 0.8, 0, -(zDis+rDis))
	attachElements(neon2, vehicle, -0.8, 0, -(zDis+rDis))
	removeEventHandler("onElementDestroy", vehicle, destroyNeon)
	addEventHandler("onElementDestroy", vehicle, destroyNeon)
	setElementData(neonElement, "neon", {neon1, neon2})
	setElementData(neonElement, "vehicle", vehicle)
	setElementData(vehicle, "neonc", neonElement)
	setElementData(neonElement, "color", color)	
	return neonElement
end
addEvent("createNeon", true)
addEventHandler("createNeon", getRootElement(), attachNeon)

function setNeonColor(vehicle, color)
	if not color then return end
	if not vehicle then return end
	if not neonColors[color] then return end
	if not getElementData(vehicle, "neonc") then return end
	local neonElement = getElementData(vehicle, "neonc")
	local neons = getElementData(neonElement, "neon")	
	local neon1aO = {getElementAttachedOffsets(neons[1])}
	local neon2aO = {getElementAttachedOffsets(neons[2])}
	local x, y, z = getElementPosition(vehicle)
	local rx, ry, rz = getElementRotation(vehicle)	
	destroyElement(neons[1])
	destroyElement(neons[2])
	local neon1 = createObject(neonColors[color], x, y, z)
	setElementRotation(neon1, rx, ry, rz)
	local neon2 = createObject(neonColors[color], x, y, z)
	setElementRotation(neon2, rx, ry, rz)
	attachElements(neon1, vehicle, unpack(neon1aO))
	attachElements(neon2, vehicle, unpack(neon2aO))		
	setElementData(neonElement, "neon", {neon1, neon2})
	setElementData(neonElement, "vehicle", vehicle)
	setElementData(vehicle, "neonc", neonElement)
	setElementData(neonElement, "color", color)	
	return neonElement
end
function getNeonColor(vehicle)
	if not vehicle then return end
	if hasNeon(vehicle) then
		return getElementData(getElementData(vehicle, "neonc"), "color")
	else
		return false
	end
end
function addNeon(vehicle, color)
	if not vehicle then return end
	local controller = getVehicleController(vehicle)
	local occupants = getVehicleOccupants(vehicle)
	adding[vehicle] = true
	if not controller then
		if #occupants >= 1 then
			for seat, occupant in pairs(occupants) do
				if getElementType(occupant) == "player" then
				--outputChatBox("Triggered Neon Event to random Vehicle Occupant")
				return triggerClientEvent(occupant, "createNeonS", getRootElement(), color, vehicle)	
				end
			end
		else
			local x, y, z = getElementPosition(vehicle)
			local aCol = createColSphere(x, y, z, 300)
			local players = getElementsWithinColShape(aCol)
			destroyElement(aCol)
			if #players >= 1 then	
				--outputChatBox("Triggered Neon Event to random Player near the Vehicle")
				return triggerClientEvent(players[math.random(1, #players)], "createNeonS", getRootElement(), color, vehicle)
			end
		end
	else
		--outputChatBox("Triggered Neon Event to vehicle's controller")
		return triggerClientEvent(controller, "createNeonS", getRootElement(), color, vehicle)
	end
end
function hasNeon(vehicle)
	if not vehicle then return end
	if getElementData(vehicle, "neonc") then
		return true
	else
		return false
	end
end
function removeNeon(vehicle)
	if not vehicle then return end
	if hasNeon(vehicle) == false then return end
	local neonElement = getElementData(vehicle, "neonc")
	local neonTubes = getElementData(neonElement, "neon")
	destroyElement(neonTubes[1])
	destroyElement(neonTubes[2])
	removeElementData(vehicle, "neonc")
	destroyElement(neonElement)
	return true
end
addEvent( "removeNeon", true )
addEventHandler( "removeNeon", getRootElement(), removeNeon )

--[[addCommandHandler("neon", function(source, cmd, color)
	if not color then return end
	if not isPedInVehicle(source) then return end
	addNeon(getPedOccupiedVehicle(source), color)	
end)
addCommandHandler("neoncolor", function(source, cmd, color)
	if not color then return end
	if not isPedInVehicle(source) then return end
	setNeonColor(getPedOccupiedVehicle(source), color)
end)
addCommandHandler("neonremove", function(source, cmd)
	if not isPedInVehicle(source) then return end
	removeNeon(getPedOccupiedVehicle(source))
end)]]

function checkNeon(veh)
	if veh then
		--getVehicleOverrideLights ( theVehicle )
		if isSpecialTuningIn(veh, 7) then
			triggerClientEvent("createNeonS", getRootElement(), "red", veh)
			return true
		elseif isSpecialTuningIn(veh, 8) then
			triggerClientEvent("createNeonS", getRootElement(), "blue", veh)
			return true
		elseif isSpecialTuningIn(veh, 9) then
			triggerClientEvent("createNeonS", getRootElement(), "green", veh)
			return true
		elseif isSpecialTuningIn(veh, 10) then
			triggerClientEvent("createNeonS", getRootElement(), "yellow", veh)
			return true
		elseif isSpecialTuningIn(veh, 11) then
			triggerClientEvent("createNeonS", getRootElement(), "pink", veh)
			return true
		elseif isSpecialTuningIn(veh, 12) then
			triggerClientEvent("createNeonS", getRootElement(), "white", veh)
			return true
		else
			return false
		end
	else
		return false
	end
end

function checkNeonEnter(theVehicle, seat, jacked)
	if theVehicle and source and seat == 0 then
		if vnxGetElementData(theVehicle, "neon") then
			bindKey(source, "k", "down", activateNeon)
		end
	end
end
addEventHandler ( "onPlayerVehicleEnter", getRootElement(), checkNeonEnter )

function unbindNeonKey(theVehicle, seat, jacked)
	if source and seat == 0 then
		if isKeyBound(source, "k", "down", activateNeon) then
			unbindKey(source, "k", "down", activateNeon)
		end
	end
end
addEventHandler ( "onPlayerVehicleExit", getRootElement(), unbindNeonKey )

function activateNeon ( player )
    local theVehicle = getPedOccupiedVehicle ( player )
	local color = vnxGetElementData(theVehicle, "neon")
    if ( theVehicle ) then
		if color then
			if not hasNeon(theVehicle) and not adding[theVehicle] then
				if not deleting[theVehicle] then
					addNeon(theVehicle, color)
					outputChatBox ( "Neon aktiviert", player, 0, 200, 0 )
				else
					deleting[theVehicle] = nil
					outputChatBox ( "Neon Aktivierung wieder fortgesetzt", player, 0, 200, 0 )
				end
			elseif not adding[theVehicle] then
				removeNeon(theVehicle)
				outputChatBox ( "Neon deaktiviert", player, 200, 0, 0 )
			else 
				deleting[theVehicle] = true
				outputChatBox ( "Neon Aktivierung gestoppt", player, 200, 0, 0 )
			end
		end
    end
end