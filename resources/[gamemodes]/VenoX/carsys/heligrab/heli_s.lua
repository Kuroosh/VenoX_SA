--[[ Heligrab - Server ]]--

local hangingWeightLimit = true
local showChatMessages = get(getResourceName(getThisResource()) .. ".showChatMessages")
local chatColour = {255, 50, 0}

-- no longer needed in newer mta versions
-- kept for backwards compatibility
local inputPresets = {
	hangBinds = get(getResourceName(getThisResource()) .. ".hang_binds"),
	hangCommands = get(getResourceName(getThisResource()) .. ".hang_commands"),
	dropBinds = get(getResourceName(getThisResource()) .. ".drop_binds"),
	dropCommands = get(getResourceName(getThisResource()) .. ".drop_binds"),
}



addEvent("requestServerData", true)
addEventHandler("requestServerData", resourceRoot,
	function()
		triggerClientEvent(client, "receiveServerData", resourceRoot, hangingWeightLimit, inputPresets, showChatMessages, chatColour)
	end
)


function toggleHangingWeightLimit(state)
	if state == true or state == false then
		hangingWeightLimit = state
		triggerClientEvent(root, "toggleHangingWeightLimit", root, state)
	end
end



function setPlayerGrabState(player, state, vehicle, side, linePercent)
	debugOutput("setPlayerGrabState("..tostring(player)..", "..tostring(state)..", "..tostring(vehicle)..", "..tostring(side)..", "..tostring(linePercent)..")")
	
	if player and isElement(player) then
		if state == true or state == "true" then
			-- if we have been given a vehicle
			if vehicle and isElement(vehicle) and getElementType(vehicle) == "vehicle" and getVehicleType(vehicle) == "Helicopter" then
				side = side or 1
				linePercent = linePercent or 0.5
	
				triggerClientEvent(player, "makePlayerGrabVehicle", player, vehicle, side, linePercent)
				
				return true
			end
		elseif state == false or state == "false" then
			local hangVehicle = getElementData(player, "heligrab.vehicle")
			
			if hangVehicle then
				triggerEvent("playerDropFromHeli", player, hangVehicle, "requested by script", true)
				
				return true
			end		
		end
	end
	
	return false
end


function isPlayerGrabbingHeli(player)
	if player and isElement(player) then
		if getElementData(player, "heligrab.vehicle") then
			return true
		else
			return false
		end
	end
	return nil
end


function getPlayerGrabData(player)
	if player and isElement(player) then
		local hangVehicle = getElementData(player, "heligrab.vehicle")
		
		if hangVehicle then
			return hangVehicle, getElementData(player, "heligrab.side"), getElementData(player, "heligrab.linePercent"), getElementData(player, "heligrab.legsUp")
		end
	end	
	return nil
end


function getPlayersGrabbingHeli(vehicle, side, linePercent)
	if vehicle then
		linePercent = linePercent or false
		side = side or false
		local hangers = {}
		
		local players = getElementsByType("player")
		for i=1, #players do
			local player = players[i]
			local hangVehicle = getElementData(player, "heligrab.vehicle")
			if hangVehicle then
				if (vehicle == hangVehicle and ((not side) or (side == getElementData(player, "heligrab.side"))) and ((not linePercent) or (linePercent == getElementData(player, "heligrab.linePercent")))) then
					table.insert(hangers, player)
				end
			end
		end
		
		if #hangers > 0 then
			return hangers
		end
	end
	
	return nil
end




-- is this still needed?
-- setting the camera target clientside frequently doesnt work (possible problem with getVehicleOccupant clientside), so do it serverside instead
function playerGrabVehicle(vehicle)
	setCameraToVehicleDriver(client, vehicle)
end
addEvent("playerGrabVehicle", true)
addEventHandler("playerGrabVehicle", resourceRoot, playerGrabVehicle)



function playerDropFromHeli(vehicle, reason, forceDrop, inVehicle)
	if not client then
		client = source
	end
	
	if client and isElement(client) then
		setCameraTarget(client, client)
	
		local players = getElementsByType("player")
		for i=1, #players do
			if (forceDrop) or (players[i] ~= client) then
				triggerClientEvent(players[i], "stopPlayerGrab", client, vehicle, nil, reason, false)
			end
		end
		
		if inVehicle then
			triggerEvent("removeHangingPedFromVehicle", client)
		end
	end
end
addEvent("playerDropFromHeli", true)
addEventHandler("playerDropFromHeli", root, playerDropFromHeli)



function setCameraToVehicleDriver(player, vehicle)
	local driver = getVehicleOccupant(vehicle, 0)
	
	if driver and getElementType(driver) == "player" then
		setCameraTarget(player, driver)
	else
		debugOutput("setCameraToVehicleDriver() - vehicle driver did not exist or was not a player")
	end	
end


-- reset the camera back to the player when the pilot exits the helicopter they are hanging from
addEventHandler("onPlayerVehicleExit", root,
	function(vehicle, seat)
		if isElement(vehicle) and getVehicleType(vehicle) == "Helicopter" and seat == 0 then
			local players = getElementsByType("player")
			for i=1, #players do
				local hangVehicle = getElementData(players[i], "heligrab.vehicle")
				
				if hangVehicle and hangVehicle == vehicle then
					setCameraTarget(players[i], players[i])
				end
			end
		end
	end
)


-- set the camera on anyone hanging on the helicopter to the new pilot
addEventHandler("onPlayerVehicleEnter", root,
	function(vehicle, seat)
		if getVehicleType(vehicle) == "Helicopter" and seat == 0 then
			local players = getElementsByType("player")
			for i=1, #players do
				local hangVehicle = getElementData(players[i],"heligrab.vehicle")
				
				if hangVehicle and hangVehicle == vehicle then
					setCameraTarget(players[i], source)
				end
			end
		end
	end
)


addEvent("removeHangingPedFromVehicle", true)
addEventHandler("removeHangingPedFromVehicle", resourceRoot,
	function()
		removePedFromVehicle(client)
	end
)



addEventHandler("onResourceStop", resourceRoot,
	function()
		local players = getElementsByType("player")
		for i=1, #players do
			local player = players[i]
			local hangVehicle = getElementData(player, "heligrab.vehicle")
			
			if hangVehicle then
				triggerEvent("playerDropFromHeli", player, hangVehicle, "stopped resource")
				
				setElementData(player, "heligrab.vehicle", nil)
				setElementData(player, "heligrab.side", nil)
				setElementData(player, "heligrab.linePercent", nil)
				setElementData(player, "heligrab.legsUp", nil)
			end
		end	
	end
)


addEventHandler("onElementModelChange", root,
	function(old, new)
		if getElementType(source) == "vehicle" and old ~= new then
			local players = getPlayersGrabbingHeli(source)
			
			if players then
				for i=1, #players do
					setPlayerGrabState(players[i], false)
				end
			end
		end
	end
)


-- backwards compatibility
function ToggleHangingWeightLimit(state)
	return toggleHangingWeightLimit(state)
end

function SetPlayerGrabbedHeli(player, state, vehicle, side, linePercent)
	return setPlayerGrabState(player, state, vehicle, side, linePercent)
end

function IsPlayerHangingFromHeli(player)
	return isPlayerGrabbingHeli(player)
end

function GetPlayerHangingData(player)
	return getPlayerGrabData(player)
end

function GetPlayersHangingFromHeli(vehicle, side, linePercent)
	return getPlayersGrabbingHeli(vehicle, side, linePercent)
end
