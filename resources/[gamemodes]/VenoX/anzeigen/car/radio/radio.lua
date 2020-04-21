local radioStations = {
	{name="Energy Wien 104.2",url="http://85.10.203.75:8000/vie.m3u"},
	{name="Energy Dance",url="http://radio.nrj.net/dance/radioat"},
	{name="Germany Top 100 Station",url="http://www.top100station.de/switch/top100station_lq.asx"},
	{name="Blackbeats.FM", url="http://blackbeats.fm/listen.asx"},	
	{name="TechnoBase.FM", url="http://listen.technobase.fm/aacplus.pls"},
	{name="TranceBase.FM", url="http://listen.trancebase.fm/dsl.pls"},
	{name="HardBase.FM", url="http://listen.hardbase.fm/dsl.pls"},
	{name="Clubsoundz.FM",url="http://193.111.136.213:8000/listen.pls"},
	{name="Rautemusik Punk", url="http://12punks-high.rautemusik.fm/"}, 
	{name="Deutschrap Extreme", url="http://stream2.laut.fm/deutschrapxtreme"},
	{name="Radio Nora 80er", url="http://streams.radionora.de/nora-80er/mp3-128/surfmusik"},
    {name="I <3 RADIO",url="http://www.iloveradio.de/iloveradio.m3u"},
    {name="I <3 XMAS",url="http://www.iloveradio.de/ilovexmas.m3u"}
}

local SOUND_MIN_RANGE_OUT_OF_VEHICLE = 2
local SOUND_MAX_RANGE_OUT_OF_VEHICLE = 25
local SOUND_VOLUME_OUT_OF_VEHICLE    = 0.8
local SOUND_EFFECTS_OUT_OF_VEHICLE   = {"compressor","i3dl2reverb"}

local SOUND_MIN_RANGE_IN_VEHICLE     = 5
local SOUND_MAX_RANGE_IN_VEHICLE     = 25
local SOUND_VOLUME_IN_VEHICLE        = 1.5
local SOUND_EFFECTS_IN_VEHICLE       = {}
local vehSeat = 0

local curStationScrollID = 0

local datTimer = false

function handleRadioResourceStart()
	-- Make sure the SA radio is turned off
	setRadioChannel(0)
	
	-- Start the radios of all vehicles currently existing
	--for index, vehicle in ipairs(getElementsByType("vehicle")) do
	--	startVehicleRadio(vehicle)
	--end
end
addEventHandler("onClientResourceStart",getResourceRootElement(),handleRadioResourceStart)

function handleRadioResourceStop()
	-- Loop through all vehicles
	for index, vehicle in ipairs(getElementsByType("vehicle")) do
		-- Stop the vehicle radio
		stopVehicleRadio(vehicle)
	end
end
addEventHandler("onClientResourceStop",getResourceRootElement(),handleRadioResourceStop)

function handleRadioVehicleEnter(veh, seat)
	-- Make sure the SA radio is turned off
	vehSeat = seat
	setRadioChannel(0)

	if getVehicleType(veh) == "BMX" then return end
	-- Get the radio stream attached to the vehicle
	local sound = getElementData(veh,"radio:sound")
	
	--Start the Radio when entering
	startVehicleRadio(veh)
	
	if sound then
		-- Set volume stuff
		setSoundMinDistance(sound,SOUND_MIN_RANGE_IN_VEHICLE)
		setSoundMaxDistance(sound,SOUND_MAX_RANGE_IN_VEHICLE)
		setSoundVolume(sound,SOUND_VOLUME_IN_VEHICLE)
		
		-- Disable out-of-vehicle effects
		for index, effect in ipairs(SOUND_EFFECTS_OUT_OF_VEHICLE) do
			setSoundEffectEnabled(sound,effect,false)
		end
		
		-- Enable in-vehicle effects
		for index, effect in ipairs(SOUND_EFFECTS_IN_VEHICLE) do
			setSoundEffectEnabled(sound,effect,true)
		end
	end
	
	-- Get the channel the vehicle is currently tuned in on
	local channel = tonumber(getElementData(veh,"radio:channel")) or 0
	
	-- Check if it's an actual channel
	if radioStations[channel] then
		-- Display the channel name
		showRadioDisplay(tostring(radioStations[channel].name))
	else
		-- Otherwise, tell the local player the radio is off
		showRadioDisplay("Radio off")
	end
end
addEventHandler("onClientPlayerVehicleEnter",getLocalPlayer(),handleRadioVehicleEnter)

function handleRadioVehicleExit(veh)
	-- Get the radio stream attached to the vehicle
	vehSeat = 0
	local sound = getElementData(veh,"radio:sound")
	
	if sound then
		-- Set volume stuff
		setSoundMinDistance(sound,SOUND_MIN_RANGE_OUT_OF_VEHICLE)
		setSoundMaxDistance(sound,SOUND_MAX_RANGE_OUT_OF_VEHICLE)
		setSoundVolume(sound,SOUND_VOLUME_OUT_OF_VEHICLE)
		
		-- Disable in-vehicle effects
		for index, effect in ipairs(SOUND_EFFECTS_IN_VEHICLE) do
			setSoundEffectEnabled(sound,effect,false)
		end
		
		-- Enable out-of-vehicle effects
		for index, effect in ipairs(SOUND_EFFECTS_OUT_OF_VEHICLE) do
			setSoundEffectEnabled(sound,effect,true)
		end
	end
	
	-- In all circumstances, hide the radio display
	hideRadioDisplay()
	
	--Stop the radio when leaving
	stopVehicleRadio(veh)
end
addEventHandler("onClientPlayerVehicleExit",getLocalPlayer(),handleRadioVehicleExit)

function handleRadioChannelSwitch(newChannel)
	-- Don't handle the radio switching if it's switched to 0 (would cause infinite loop otherwise) and if it isn't a channel we can use
	if newChannel == 0 then
		return
	elseif vehSeat ~= 0 then
		cancelEvent()
		return
	--elseif newChannel ~= 1 and newChannel ~= 12 or  then
		--cancelEvent()
		--return
	end
	
	-- Cancel the radio switching. What are you saying? We don't know no SA radio, all we have is live!
	cancelEvent()
	
	-- Get the vehicle of which we're changing the channel
	local vehicle = getPedOccupiedVehicle(getLocalPlayer())
	
	-- Don't handle the radio switching if we're not in a vehicle
	if not vehicle then
		return
	end
	if getVehicleType(vehicle) == "BMX" then return end
	
	-- Get the vehicle channel (if there isn't one set, assume it's off)
	local channel = tonumber(getElementData(vehicle,"radio:channel")) or 0
	
	-- Calculate by how much the vehicle's channel has to be incremented
	local increment = (newChannel == 1 and 1) or -1
	
	-- Calculate the new channel
	channel = channel + increment
	
	-- Is it higher than our channel count? Then turn the radio off. Otherwise, if it's below 0, set it to our last radio station on the list
	if channel > #radioStations then
		channel = 0
	elseif channel < 0 then
		channel = #radioStations
	end
	
	-- Set the vehicle's radio station to the one we just calculated. It'll be applied and synced by element data
	setElementData(vehicle,"radio:channel",channel)
end
addEventHandler("onClientPlayerRadioSwitch",getRootElement(),handleRadioChannelSwitch)

function handleVehicleRadioChannelSwitch(key)
	-- Make sure we're dealing with a vehicle. Also, check if it's the radio channel that has changed
	if getElementType(source) == "vehicle" and key == "radio:channel" then
		-- Let our radio start function handle the sound starting
		startVehicleRadio(source)
		
		-- If the vehicle is the local vehicle
		if source == getPedOccupiedVehicle(getLocalPlayer()) then
			-- Get the channel
			local channel = tonumber(getElementData(source,"radio:channel")) or 0
			
			-- Check if it's an actual channel
			if radioStations[channel] then
				-- Display the channel's name
				showRadioDisplay(tostring(radioStations[channel].name))
			else
				-- Display the fact the radio is now off
				showRadioDisplay("Radio off")
			end
		end
	end
end
addEventHandler("onClientElementDataChange",getRootElement(),handleVehicleRadioChannelSwitch)

function startVehicleRadio(vehicle)
	-- Check whether we've actually got a vehicle, and it's streamed in
	if isElement(vehicle) and getElementType(vehicle) == "vehicle" and isElementStreamedIn(vehicle) then
		-- Stop the current radio sound. We don't want multiple sounds playing at the same time
		stopVehicleRadio(vehicle)
		
		-- Get the current vehicle channel
		local channelID = tonumber(getElementData(vehicle,"radio:channel")) or 0
		
		-- Now, the ID is useless, so convert channel ID into the channel data
		local channel = radioStations[channelID]
		
		-- Make sure it actually exists
		if channel then
			-- Get the URL from the radio stations table
			local url = channel.url
			
			-- Check if the URL actually exists
			if type(url) == "string" and #url > 0 then
				-- Create the sound
				local x1, y1, z1 = getElementPosition ( vehicle )

				if datTimer and isTimer(datTimer) then killTimer(datTimer) end
				datTimer = setTimer(function()
					local sound = playSound3D(url,x1,y1,z1)
					-- Make sure the sound has actually been created (would be kind of fucked if it failed)
					if sound then
						-- Set vehicle element data, so we can easily see if a sound is running from the vehicle
						setElementData(vehicle,"radio:sound",sound,false)
						
						-- Make the vehicle the sound's parent. If the vehicle goes down, we want the sound to go down as well!
						setElementParent(sound,vehicle)
						
						-- Attach the sound to the vehicle, so it goes whereever the vehicle goes
						attachElements(sound,vehicle)
						
						-- Handle the streaming of the sound. We do want it to go correctly, don't we?
						addEventHandler("onClientSoundStream",sound,handleVehicleRadioStream)
						
						-- Handle destruction of sounds. We don't want warnings and errors, now do we?
						addEventHandler("onClientElementDestroy",sound,handleRadioSoundDestroyed)
					end
				end, 200, 1)
			end
		end
	end
	
	return false
end

function stopVehicleRadio(vehicle)
	-- Check if we've actually got a vehicle
	if isElement(vehicle) and getElementType(vehicle) == "vehicle" then
		-- Get the vehicle's radio sound
		local sound = getElementData(vehicle,"radio:sound")
		
		if datTimer and isTimer(datTimer) then killTimer(datTimer) end
		
		-- If there is a "sound"
		if sound then
			-- Unset the element data (it'll be destroyed if it exists anyway)
			setElementData(vehicle,"radio:sound",false,false)
			
			-- If it's actually a sound (might also be an (empty) userdata value)
			if isElement(sound) and getElementType(sound) == "sound" and getElementParent(sound) == vehicle then
				-- Destroy it
				destroyElement(sound)
				
				-- Sound successfully -->STOPPED<-- so return true
				return true
			end
		end
	end
	
	return false
end

function handleVehicleRadioStream(success)
	-- Get the vehicle to which the sound is supposed to be attached (the sound's parent)
	local vehicle = getElementParent(source)
	
	-- Check whether the streaming was successful
	if not success then
		-- If it failed...
		-- Stop the vehicle radio
		stopVehicleRadio(vehicle)
		
		-- Retry the stream creation
		startVehicleRadio(vehicle)
	else
		-- Otherwise, if it succeeded...
		-- Create some local variables
		local minDist
		local maxDist
		local volume
		local effects
		
		-- Check if the attached vehicle is our current one
		if vehicle == getPedOccupiedVehicle(getLocalPlayer()) then
			-- Set the local variables to the in-vehicle data
			minDist = SOUND_MIN_RANGE_IN_VEHICLE
			maxDist = SOUND_MAX_RANGE_IN_VEHICLE
			volume  = SOUND_VOLUME_IN_VEHICLE
			effects = SOUND_EFFECTS_IN_VEHICLE
		else
			-- Set the local variables to the out-of-vehicle data
			minDist = SOUND_MIN_RANGE_OUT_OF_VEHICLE
			maxDist = SOUND_MAX_RANGE_OUT_OF_VEHICLE
			volume  = SOUND_VOLUME_OUT_OF_VEHICLE
			effects = SOUND_EFFECTS_OUT_OF_VEHICLE
		end
		
		-- Apply the data
		setSoundMinDistance(source,minDist)
		setSoundMaxDistance(source,maxDist)
		setSoundVolume(source,volume)
		
		for index,effect in ipairs(effects) do
			setSoundEffectEnabled(sound,effect,true)
		end
	end
end

function handleRadioSoundDestroyed()
	-- Get the vehicle it is supposed to be attached to (the parent)
	local vehicle = getElementParent(source)
	
	-- Check whether the vehicle remembers the sound as it's own
	if isElement(vehicle) and getElementData(vehicle,"radio:sound") == source then
		-- Something's going on here, according to the if statement, the sound shouldn't be destroyed! We'll just play it again and call it a day
		startVehicleRadio(vehicle)
	end
end

--[[function handleRadioVehicleStreamIn()
	-- If the streamed element is a vehicle
	if getElementType(source) == "vehicle" then
		-- Start the vehicle radio, as we might be able to hear it from there on
		startVehicleRadio(source)
	end
end
addEventHandler("onClientElementStreamIn",getRootElement(),handleRadioVehicleStreamIn)

function handleRadioVehicleStreamOut()
	-- If the streamed out element is a vehicle
	if getElementType(source) == "vehicle" then
		-- Stop the vehicle's radio, as we won't be able to hear it from outside of the stream radius anyway
		stopVehicleRadio(source)
	end
end
addEventHandler("onClientElementStreamOut",getRootElement(),handleRadioVehicleStreamOut)]]--