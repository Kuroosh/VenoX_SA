--[[
Project: VitaOnline
File: vehicles-indicator.lua
Author(s):	ryden
			Sebihunter

Licensed under the BSD license conditions.
]]--

--[[ Configuration ]]--
local INDICATOR_SIZE = 0.3						-- Size for the corona markers
local INDICATOR_COLOR = { 255, 100, 10, 255 }	-- Color in R G B A format
local INDICATOR_FADE_MS = 160					-- Miliseconds to fade out the indicators
local INDICATOR_SWITCH_TIMES = { 300, 400 }		-- In miliseconds. First is time to switch them off, second to switch them on.
INDICATOR_TYPE = 'none' --In tacho-client.lua


--[[ Some globals to this context ]]--
local root = getRootElement()
local localPlayer = getLocalPlayer()
local vehiclesWithIndicator = {}

--[[
* vectorLength
Gets the length of a vector.
--]]
local function vectorLength ( vector )
	return math.sqrt ( vector[1]*vector[1] + vector[2]*vector[2] + vector[3]*vector[3] )
end

--[[
* normalizeVector
Normalizes a vector, when possible, and returns the normalized vector plus the length.
--]]
local function normalizeVector ( vector )
	local length = vectorLength ( vector )
	if length > 0 then
		local normalizedVector = {}
		normalizedVector[1] = vector[1] / length
		normalizedVector[2] = vector[2] / length
		normalizedVector[3] = vector[3] / length
		return normalizedVector, length
	else
		return nil, length
	end
end

--[[
* crossProduct
Calculates the cross product of two vectors.
--]]
local function crossProduct ( v, w )
	local result = {}
	result[1] = v[2]*w[3] - v[3]*w[2]
	result[2] = w[1]*v[3] - w[3]*v[1]
	result[3] = v[1]*w[2] - v[2]*w[1]
	return result
end

--[[
* getFakeVelocity
Gets a fake unitary velocity for a vehicle calculated using the current vehicle angle.
--]]
local function getFakeVelocity ( vehicle )
	-- Get the angle around the Z axis
	local _, _, angle = getElementRotation ( vehicle )
	local velocity = { 0, 0, 0 }
	velocity[1] = -math.sin ( angle )
	velocity[2] = math.cos ( angle )
	return velocity
end

--[[
* createIndicator
Creates a marker for an indicator.
--]]
local function createIndicator ()
	local x, y, z = getElementPosition(localPlayer)
	local indicator = exports.custom_coronas:createCorona(x,y,z+4,INDICATOR_SIZE, INDICATOR_COLOR[1], INDICATOR_COLOR[2],INDICATOR_COLOR[3], 0)
	return indicator
end

--[[
* createIndicatorState
Creates a table with information about the indicators state.
--]]
local function createIndicatorState ( vehicle, indicatorLeft, indicatorRight )
	local t = { vehicle		  = vehicle,		-- The vehicle that this state refers to
				left 		  = indicatorLeft,	-- The state of the left indicator
				right 		  = indicatorRight,	-- The state of the right indicator
				coronaLeft	  = nil,			-- The corona elements for the left indicator
				coronaRight	  = nil,			-- The corona elements for the right indicator
				nextChange	  = 0,				-- The time for the next change of the indicators
				timeElapsed   = 0,				-- Elapsed time since the last change
				currentState  = false,			-- If set to true, the coronas are activated.
				activationDir = nil,			-- Direction that the vehicle was following when the indicator got activated, for auto shut down.
			  }
	return t
end

--[[
* updateIndicatorState
Updates the indicator state (i.e. creates/destroys the coronas).
--]]
local function updateIndicatorState ( state )
	if not state then return end

	-- Get the vehicle bounding box
	local xmin, ymin, zmin, xmax, ymax, zmax = getElementBoundingBox ( state.vehicle )
	local x,y,z = getElementPosition(state.vehicle)

	-- Transform the bounding box positions to fit properly the vehicle
	xmin = xmin + 0.2
	xmax = xmax - 0.2
	ymin = ymin + 0.2
	ymax = ymax - 0.2
	zmin = zmin + 0.6
	
	-- Store the number of indicators activated
	local numberOfIndicators = 0

	-- Check the left indicator
	if state.left then
		if not state.coronaLeft then
			state.coronaLeft = { createIndicator (), createIndicator () }
			state.markerLeft = {}
			state.markerLeft[1] = createMarker ( x,y,z,"corona", INDICATOR_SIZE, 0,0,0,0 )
			state.markerLeft[2] = createMarker ( x,y,z,"corona", INDICATOR_SIZE, 0,0,0,0 )
			attachElements ( state.markerLeft[1], state.vehicle, xmin+0.3,  ymax-0.9, zmin )
			attachElements ( state.markerLeft[2], state.vehicle, xmin+0.3, -ymax+0.9, zmin+0.2 )
		end
		numberOfIndicators = numberOfIndicators + 1
	elseif state.coronaLeft then
		exports.custom_coronas:destroyCorona ( state.coronaLeft[1] )
		exports.custom_coronas:destroyCorona ( state.coronaLeft[2] )
		destroyElement(state.markerLeft[1])
		destroyElement(state.markerLeft[2])
		
		state.coronaLeft = nil
	end
	
	-- Check the right indicator
	if state.right then
		if not state.coronaRight then
			state.coronaRight = { createIndicator (), createIndicator () }
			state.markerRight = {}
			state.markerRight[1] = createMarker ( x,y,z,"corona", INDICATOR_SIZE, 0,0,0,0 )
			state.markerRight[2] = createMarker ( x,y,z,"corona", INDICATOR_SIZE, 0,0,0,0 )
			attachElements ( state.markerRight[1], state.vehicle,  -xmin-0.3,  ymax-0.9, zmin )
			attachElements ( state.markerRight[2], state.vehicle, -xmin-0.3, -ymax+0.9, zmin+0.2 )
		end
		numberOfIndicators = numberOfIndicators + 1
	elseif state.coronaRight then
		exports.custom_coronas:destroyCorona ( state.coronaRight[1] )
		exports.custom_coronas:destroyCorona ( state.coronaRight[2] )
		destroyElement(state.markerRight[1])
		destroyElement(state.markerRight[2])	
		
		state.coronaRight = nil
	end
	
	-- Check if this is the car that you are driving and that there is one and only one indicator
	-- to enable auto switching off
	if numberOfIndicators == 1 and getVehicleOccupant ( state.vehicle, 0 ) == localPlayer then
		-- Store the current velocity, normalized, to check when will we have to switch it off.
		state.activationDir = normalizeVector ( { getElementVelocity ( state.vehicle ) } )
		if not state.activationDir then
			-- The vehicle is stopped, get a fake velocity from the angle.
			state.activationDir = getFakeVelocity ( state.vehicle )
		end
	else
		state.activationDir = nil
	end
end

--[[
* destroyIndicatorState
Destroys an indicator state, deleting all its resources.
--]]
local function destroyIndicatorState ( state )
	if not state then return end
	
	-- Destroy the left coronas
	if state.coronaLeft then
		exports.custom_coronas:destroyCorona ( state.coronaLeft[1] )
		exports.custom_coronas:destroyCorona ( state.coronaLeft[2] )
		state.coronaLeft = nil
	end
	
	-- Destroy the right coronas
	if state.coronaRight then
		exports.custom_coronas:destroyCorona ( state.coronaRight[1] )
		exports.custom_coronas:destroyCorona ( state.coronaRight[2] )
		state.coronaRight = nil
	end
	
	-- If I am the driver, reset the element data.
	if getVehicleOccupant ( state.vehicle ) == localPlayer then
		setElementData( state.vehicle, "i:left", false )
		setElementData( state.vehicle, "i:right", false )
		setElementData(state.vehicle, "i:leftimg", false)
		setElementData(state.vehicle, "i:rightimg", false)
	end
end

--[[
* performIndicatorChecks
Checks how the indicators state should be: created, updated or destroyed.
--]]
local function performIndicatorChecks ( vehicle )
	-- Get the current indicator states
	local indicatorLeft = getElementData(vehicle, 'i:left')
	local indicatorRight = getElementData(vehicle, 'i:right')

	-- Check if we at least have one indicator running
	local anyIndicator = indicatorLeft or indicatorRight
	
	-- Grab the current indicators state in the flashing period.
	local currentState = vehiclesWithIndicator [ vehicle ]

	-- If there's any indicator running, push it to the list of vehicles to draw the indicator.
	-- Else, remove it from the list.
	if anyIndicator then
		-- Check if there is already a state for this vehicle
		if currentState then
			-- Update the state
			currentState.left = indicatorLeft
			currentState.right = indicatorRight
		else
			-- Create a new state
			currentState = createIndicatorState ( vehicle, indicatorLeft, indicatorRight )
			vehiclesWithIndicator [ vehicle ] = currentState
		end
		updateIndicatorState ( currentState )
	elseif currentState then
		-- Destroy the current state
		destroyIndicatorState ( currentState )
		vehiclesWithIndicator [ vehicle ] = nil
	end
end

--[[
* setIndicatorsAlpha
Sets all the active indicators alpha.
--]]
local function setIndicatorsAlpha ( state, alpha )
	if state.coronaLeft then
		exports.custom_coronas:setCoronaColor ( state.coronaLeft[1],	INDICATOR_COLOR[1],
												INDICATOR_COLOR[2],
												INDICATOR_COLOR[3],
												alpha )
		exports.custom_coronas:setCoronaColor ( state.coronaLeft[2],	INDICATOR_COLOR[1],
												INDICATOR_COLOR[2],
												INDICATOR_COLOR[3],
												alpha )
	end
	if state.coronaRight then
		exports.custom_coronas:setCoronaColor ( state.coronaRight[1],	INDICATOR_COLOR[1],
												INDICATOR_COLOR[2],
												INDICATOR_COLOR[3],
												alpha )
		exports.custom_coronas:setCoronaColor ( state.coronaRight[2],	INDICATOR_COLOR[1],
												INDICATOR_COLOR[2],
												INDICATOR_COLOR[3],
												alpha )
	end
end

--[[
* processIndicators
Processes the indicators switching, and solves some MTA bugs.
--]]
local function processIndicators ( state )
	-- Check first if the vehicle is blown up.
	local x,y,z = getElementPosition(state.vehicle)
	if getElementHealth ( state.vehicle ) == 0 then
		-- Destroy the state.
		destroyIndicatorState ( state )
		vehiclesWithIndicator [ state.vehicle ] = nil
		return
	end
	
	local newx, newy, newz
	if state.coronaLeft then
		newx, newy, newz = getElementPosition(state.markerLeft[1])
		exports.custom_coronas:setCoronaPosition(state.coronaLeft[1],newx,newy,newz)
		newx, newy, newz = getElementPosition(state.markerLeft[2])
		exports.custom_coronas:setCoronaPosition(state.coronaLeft[2],newx,newy,newz)
	end
	if state.coronaRight then	
		newx, newy, newz = getElementPosition(state.markerRight[1])
		exports.custom_coronas:setCoronaPosition(state.coronaRight[1],newx,newy,newz)
		newx, newy, newz = getElementPosition(state.markerRight[2])
		exports.custom_coronas:setCoronaPosition(state.coronaRight[2],newx,newy,newz)	
	end

	--Is it warning indicators? If not check if engine is turned on
	local ison = false
	if INDICATOR_TYPE == 'both' then 
		ison = true
	else
		if INDICATOR_TYPE == 'left' or INDICATOR_TYPE == 'right' then
			ison = true 
		else
			ison = false
		end
	end	
	
	-- Check if we must automatically deactivate the indicators.
	if state.activationDir then
		-- Get the current velocity and normalize it
		local currentVelocity = normalizeVector ( { getElementVelocity ( state.vehicle ) } )
		
		-- If the vehicle is stopped, calculate a fake velocity from the angle.
		if not currentVelocity then
			currentVelocity = getFakeVelocity ( state.vehicle )
		end
		
		-- Calculate the cross product between the velocities to get the angle and direction of any turn.
		local cross = crossProduct ( state.activationDir, currentVelocity )
	end

	-- Check if we must switch the state
	if state.nextChange <= state.timeElapsed then
		-- Turn to switched on indicators, in both cases. When turning on,
		-- it goes straight to the full alpha mode. When turning off, it
		-- fades out from full alpha to full transparent.
		setIndicatorsAlpha ( state, INDICATOR_COLOR[4] )
		
		-- Switch the state
		state.currentState = not state.currentState
	
		-- Get the vehicle that we are in
		local playerVehicle = getPedOccupiedVehicle ( localPlayer )
		
		-- Restart the timers and play a sound if we are in that vehicle
		state.timeElapsed = 0
		if state.currentState then
			state.nextChange = INDICATOR_SWITCH_TIMES[1]
			if playerVehicle == state.vehicle then 		
				if ison == true then
					playSound("sounds/blinkerOn.mp3")
					if getElementData(state.vehicle, "i:left") == true then
						setElementData(state.vehicle, "i:leftimg", true)
					end
				
					if getElementData(state.vehicle, "i:right") == true then
						setElementData(state.vehicle, "i:rightimg", true)
					end
				end	
			end
		else
			state.nextChange = INDICATOR_SWITCH_TIMES[2]
			if playerVehicle == state.vehicle then
				if ison == true then
					playSound("sounds/blinkerOff.mp3")
					setElementData(state.vehicle, "i:leftimg", false)
					setElementData(state.vehicle, "i:rightimg", false)
				end
			end
		end
		

	-- Check if we are turning them off
	elseif state.currentState == false then
		-- If the time elapsed is bigger than the time to fade out, then
		-- just set the alpha to zero. Else, set it to the current alpha
		-- value.
		if state.timeElapsed >= INDICATOR_FADE_MS then
			setIndicatorsAlpha ( state, 0 )
		else
			setIndicatorsAlpha ( state, (1 - (state.timeElapsed / INDICATOR_FADE_MS)) * INDICATOR_COLOR[4] )
		end
	end
end

--[[
* onClientElementDataChange
Detects when the indicator state of a vehicle changes.
--]]
addEventHandler('onClientElementDataChange', root, function ( dataName, oldValue )
	-- Check that the source is a vehicle and that the data name is what we are looking for.
	if getElementType(source) == 'vehicle' and ( dataName == 'i:left' or dataName == 'i:right' ) then
		-- If the vehicle is not streamed in, don't do anything.
		if isElementStreamedIn(source) then
			-- Perform the indicator checks for the new indicator states.
			performIndicatorChecks ( source )
		end
	end
end)

--[[
* onClientElementStreamIn
Detects when a vehicle streams in, to check if we must draw the indicators.
--]]
addEventHandler('onClientElementStreamIn', root, function ()
	if getElementType(source) == 'vehicle' then
		-- Perform the indicator checks for the just streamed in vehicle.
		performIndicatorChecks ( source )
	end
end)

--[[
* onClientElementStreamOut
Detects when a vehicle streams out, to destroy its state.
--]]
addEventHandler('onClientElementStreamOut', root, function ()
	if getElementType(source) == 'vehicle' then
		-- Grab the current indicators state
		local currentState = vehiclesWithIndicator [ source ]
		
		-- If it has a state, remove it.
		if currentState then
			destroyIndicatorState ( currentState )
			vehiclesWithIndicator [ source ] = nil
		end
	end
end)

--[[
* indicator_left and indicator_right commands
Changes the state of the indicators for the current vehicle.
--]]
local function switchIndicatorState ( indicator )

	-- First check that we are in a vehicle.
	INDICATOR_TYPE = indicator
	local v = getPedOccupiedVehicle(localPlayer)
	if v then
		-- check for the correct vehicle type
		if getVehicleType(v) == "Automobile" or getVehicleType(v) == "Bike" or getVehicleType(v) == "Quad" and getElementData(v, "battery") ~=	0 then
			-- Check that we are the vehicle driver
			if getVehicleOccupant(v, 0) == localPlayer then
				-- Switch the indicator state
				if indicator == 'left' then
						local currentValue = getElementData(v, "i:left") or false
						setElementData( v, "i:left", not currentValue )
						setElementData( v, "i:right", false )
				elseif indicator == 'right' then
						local currentValue = getElementData(v, "i:right") or false
						setElementData( v, "i:left", false )
						setElementData( v, "i:right", not currentValue )
				elseif indicator == 'both' then
					local currentValue = getElementData(v, "i:left") or false
					setElementData( v, "i:left", not currentValue )
					setElementData( v, "i:right", not currentValue )
				end
			end
		end
	end
end
addCommandHandler('indicator_left', function () switchIndicatorState('left') end, false)
addCommandHandler('indicator_right', function () switchIndicatorState('right') end, false)
addCommandHandler('indicator_both', function () switchIndicatorState('both') end, false)
bindKey ( "num_4", "down", function () switchIndicatorState('left') end )
bindKey ( "num_5", "down", function () switchIndicatorState('both') end )
bindKey ( "num_6", "down", function () switchIndicatorState('right') end )
--[[
* onClientPreRender
Calls processIndicators for every vehicle with the indicators activated.
--]]
addEventHandler('onClientPreRender', root, function ( timeSlice )
	-- Process every vehicle with indicators
	for vehicle, state in pairs(vehiclesWithIndicator) do
		state.timeElapsed = state.timeElapsed + timeSlice
		processIndicators ( state, state.lastChange )
	end
end)

--[[
* onClientResourceStart
Starts everything up.
--]]
addEventHandler('onClientResourceStart', getResourceRootElement(getThisResource()), function ()
	-- Check all streamed in vehicles that have any indicator activated and create a state for them.
	local vehicles = getElementsByType ( 'vehicle' )
	for k, vehicle in ipairs(vehicles) do
		if isElementStreamedIn ( vehicle ) then
			local indicatorLeft = getElementData ( vehicle, 'i:left' )
			local indicatorRight = getElementData ( vehicle, 'i:right' )
			if indicatorLeft or indicatorRight then
				performIndicatorChecks ( vehicle )
			end
		end
	end
end, false)

--[[
* onClientVehicleRespawn
Restore the state for vehicles respawning.
--]]
addEventHandler('onClientVehicleRespawn', root, function ()
	if isElementStreamedIn ( source ) then
		performIndicatorChecks ( source )
	end
end)

--[[
* onClientElementDestroy
Destroys the state for a vehicle when it's deleted.
--]]
addEventHandler('onClientElementDestroy', root, function ()
	if getElementType ( source ) == 'vehicle' then
		local currentState = vehiclesWithIndicator [ source ]
		if currentState then
			-- Destroy the state
			destroyIndicatorState ( currentState )
			vehiclesWithIndicator [ source ] = nil
		end
	end
end)
