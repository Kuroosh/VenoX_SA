-------------------------
--- Blinkersystem V2.1 --
------- (c) 2010 --------
------- by Rewrite ------
-------------------------

blinkertable = {}

function stopblinkerwennkaputt ()
	if getElementType ( source ) == "vehicle" then
		for index, vehtable in pairs(blinkertable) do
			for index2, wert in pairs(vehtable) do
				if (index2== "Player") then
					BlinkerPlayer = wert
				elseif (index2== "Car") then
					BlinkerCar = wert
				elseif (index2== "BlinkerStatus") then
					BlinkerStatus = wert
				elseif (index2== "BremslichtStatus") then
					BremslichtStatus = wert				
				end
			end
			if (source == BlinkerCar) then
				table.remove(blinkertable, index)
			end
		end
	end
end
addEventHandler ("onVehicleExplode",getRootElement(), stopblinkerwennkaputt)
addEventHandler ("onElementDestroy",getRootElement(), stopblinkerwennkaputt)

function BlinkerDurchlauf()
	for index, vehtable in pairs(blinkertable) do
		for index2, wert in pairs(vehtable) do
			if (index2== "Player") then
				 BlinkerPlayer = wert
			elseif (index2== "Car") then
				 BlinkerCar = wert
			elseif (index2== "BlinkerStatus") then
				 BlinkerStatus = wert
			elseif (index2== "BremslichtStatus") then
				 BremslichtStatus = wert
			end
		end
	
		-- keiner
		if (BlinkerStatus == 0) then	
				if (BremslichtStatus == 0) then
					setVehicleLightState ( BlinkerCar, 2, 1 )
					setVehicleLightState ( BlinkerCar, 3, 1 )
					setPrivVehCorrectLightColor (BlinkerCar)
					if (vnxGetElementData( BlinkerCar, "light") == false) then
						setVehicleLightState ( BlinkerCar, 0, 1 )
						setVehicleLightState ( BlinkerCar, 1, 1 )				
					elseif ((vnxGetElementData( BlinkerCar, "light") == true)) then
						setVehicleLightState ( BlinkerCar, 0, 0 )
						setVehicleLightState ( BlinkerCar, 1, 0 )
					else
						vnxSetElementData( BlinkerCar, "light",false)
					end
				end
		-- Linker		
		elseif (BlinkerStatus == 1) then
			if (BremslichtStatus == 0) then
				if (getVehicleLightState ( BlinkerCar, 3) == 1) and (getVehicleLightState ( BlinkerCar, 2) == 1)  then
					setVehicleLightState ( BlinkerCar, 3, 0 )
					setVehicleLightState ( BlinkerCar, 2, 1 )
					setVehicleLightState ( BlinkerCar, 1, 1)
					setVehicleLightState ( BlinkerCar, 0, 0)
					if isElement(BlinkerPlayer) then
						if (getPedOccupiedVehicle ( BlinkerPlayer ) == BlinkerCar) then
							playSoundFrontEnd ( BlinkerPlayer, 37 )
						end
					end
				else
					setVehicleLightState ( BlinkerCar, 3, 1 )
					setVehicleLightState ( BlinkerCar, 2, 1 )
					setPrivVehCorrectLightColor (BlinkerCar)
					if (vnxGetElementData( BlinkerCar, "light") == false) then
						setVehicleLightState ( BlinkerCar, 0, 1 )
						setVehicleLightState ( BlinkerCar, 1, 1 )				
					elseif (vnxGetElementData( BlinkerCar, "light") == true) then
						setVehicleLightState ( BlinkerCar, 0, 0 )
						setVehicleLightState ( BlinkerCar, 1, 0 )
					elseif (Lichtstate == 2) then
						setVehicleLightState ( BlinkerCar, 0, 0 )
						setVehicleLightState ( BlinkerCar, 1, 0 )
					end
					if isElement(BlinkerPlayer) then
						if (getPedOccupiedVehicle ( BlinkerPlayer ) == BlinkerCar) then
							playSoundFrontEnd ( BlinkerPlayer, 38 )
						end
					end
				end
			end
		elseif (BlinkerStatus == 2) then
			if (BremslichtStatus == 0) then
				if (getVehicleLightState ( BlinkerCar, 3) == 1) and (getVehicleLightState ( BlinkerCar, 2) == 1)  then
					setVehicleLightState ( BlinkerCar, 3, 1 )
					setVehicleLightState ( BlinkerCar, 2, 0 )
					setVehicleLightState ( BlinkerCar, 1, 0)
					setVehicleLightState ( BlinkerCar, 0, 1)
					if isElement(BlinkerPlayer) then
						if (getPedOccupiedVehicle ( BlinkerPlayer ) == BlinkerCar) then
							playSoundFrontEnd ( BlinkerPlayer, 37 )
						end
					end
				else
					setVehicleLightState ( BlinkerCar, 3, 1 )
					setVehicleLightState ( BlinkerCar, 2, 1 )
					setPrivVehCorrectLightColor (BlinkerCar)
					if (vnxGetElementData(BlinkerCar, "light") == false) then
						setVehicleLightState ( BlinkerCar, 0, 1 )
						setVehicleLightState ( BlinkerCar, 1, 1 )				
					elseif (vnxGetElementData(BlinkerCar, "light") == true) then
						setVehicleLightState ( BlinkerCar, 0, 0 )
						setVehicleLightState ( BlinkerCar, 1, 0 )
					else 
						vnxSetElementData( BlinkerCar, "light", false)
					end
					if isElement (BlinkerPlayer) then
						if (getPedOccupiedVehicle ( BlinkerPlayer ) == BlinkerCar) then
							playSoundFrontEnd ( BlinkerPlayer, 38 )
						end
					end
				end
			end
		-- Warnlicht
		elseif (BlinkerStatus == 3) then
			if (BremslichtStatus == 0) then
				if (getVehicleLightState ( BlinkerCar, 3) == 0) and (getVehicleLightState ( BlinkerCar, 2) == 0)  then
					setVehicleLightState ( BlinkerCar, 3, 1 )
					setVehicleLightState ( BlinkerCar, 2, 1 )
					setPrivVehCorrectLightColor (BlinkerCar)
					if (vnxGetElementData(BlinkerCar, "light") == false) then
						setVehicleLightState ( BlinkerCar, 0, 1 )
						setVehicleLightState ( BlinkerCar, 1, 1 )				
					elseif (vnxGetElementData(BlinkerCar, "light") == true) then
						setVehicleLightState ( BlinkerCar, 0, 0 )
						setVehicleLightState ( BlinkerCar, 1, 0 )
					else
						vnxSetElementData(BlinkerCar, "light", false)
					end
					if (BlinkerPlayer) then
					if (getPedOccupiedVehicle( BlinkerPlayer ) == BlinkerCar) then
						playSoundFrontEnd ( BlinkerPlayer, 37 )
					end
					end
				else
					setVehicleLightState ( BlinkerCar, 3, 0 )
					setVehicleLightState ( BlinkerCar, 2, 0 )
					setVehicleLightState ( BlinkerCar, 1, 0)
					setVehicleLightState ( BlinkerCar, 0, 0)
					if (BlinkerPlayer) then
					if (getPedOccupiedVehicle ( BlinkerPlayer ) == BlinkerCar) then
						playSoundFrontEnd ( BlinkerPlayer, 38 )
					end
					end
				end
			end
		end	
	end
end
setTimer(BlinkerDurchlauf, 1000, 0)

function blinkerbinds(vehinplayer)
	
	local theVehPlayer = vehinplayer
	local seat = getPedOccupiedVehicleSeat ( vehinplayer )
	local blinkercar = getPedOccupiedVehicle ( vehinplayer )
	
	if (getVehicleType ( blinkercar ) == "Automobile") and (seat == 0) then
		autointable = 0
		for index, vehtable in pairs(blinkertable) do
			for index2, wert in pairs(vehtable) do
				if (index2== "Player") then
					BlinkerPlayerS = wert
				elseif (index2== "Car") then
					BlinkerCarS = wert	
				elseif (index2== "BlinkerStatus") then
					BlinkerStatusS = wert
				elseif (index2== "BremslichtStatus") then
					BremslichtStatusS = wert				
				end
			end
			if (blinkercar == BlinkerCarS) then
				vehtable.Player = vehinplayer
				setPrivVehCorrectLightColor (BlinkerCar)
				autointable = 1
			end
		end
		if (autointable == 0) then
			setPrivVehCorrectLightColor (BlinkerCar)
			table.insert (blinkertable,{["Player"]= vehinplayer,["Car"] = getPedOccupiedVehicle ( vehinplayer ),["BlinkerStatus"] = 0,["BremslichtStatus"] = 0}  )	
			--BlinkerStatus => 0 Aus, 1 links, 2 rechts, 3 Warnblinker
			--BremslichtStatus => 0 Aus, 1 An
			-- table definition end
		end
		
		setVehicleLightState ( blinkercar, 2, 1 )
		setVehicleLightState ( blinkercar, 3, 1 )		
		
		-- keybinds
		--bindKey ( vehinplayer, "l", "down", togglelicht)
		bindKey ( vehinplayer, ",", "up", linkerblinker)
		bindKey ( vehinplayer, ".", "up", rechterblinker)
		bindKey ( vehinplayer, "-", "up", warnblinker)
		bindKey ( vehinplayer, "s", "down", bremslichtan)
		bindKey ( vehinplayer, "space", "down", bremslichtan)
		bindKey ( vehinplayer, "s", "up", bremslichtaus)
		bindKey ( vehinplayer, "space", "up", bremslichtaus)
		if (getVehicleOverrideLights ( blinkercar ) ~= 2) then
			setVehicleOverrideLights ( blinkercar, 2 ) -- Damit die Blinker nicht nur beim Bremsen/Nachts an sind!
		end
		--command handler (zum selber binden (Blackouts Notebook...usw))
		addCommandHandler ( "warnblinker", warnblinker) -- Warnblinker
		addCommandHandler ( "rechterblinker", rechterblinker) -- Rechter Blinker
		addCommandHandler ( "linkerblinker", linkerblinker) -- Linker Blinker
	end
end
addEventHandler("onVehicleEnter",getRootElement(),blinkerbinds)

function blinkerunbinds(vehinplayer)
	local theVehPlayer = vehinplayer
	unbindKey ( theVehPlayer, "l", "down", togglelicht)
	unbindKey ( theVehPlayer, "l", "down", toogleLightsNonCar)
	unbindKey ( theVehPlayer, ",", "up", linkerblinker)
	unbindKey ( theVehPlayer, ".", "up", rechterblinker)
	unbindKey ( theVehPlayer, "-", "up", warnblinker)
   	unbindKey ( theVehPlayer, "s", "down", bremslichtan)
	unbindKey ( theVehPlayer, "space", "down", bremslichtan)
   	unbindKey ( theVehPlayer, "s", "up", bremslichtaus)
	unbindKey ( theVehPlayer, "space", "up", bremslichtaus)
		removeCommandHandler ( "linkerblinker", linkerblinker)
		removeCommandHandler ( "rechterblinker", rechterblinker)
		removeCommandHandler ( "warnblinker", warnblinker)
		
	for index, vehtable in pairs(blinkertable) do
			for index2, wert in pairs(vehtable) do
				if (index2== "Player") then
					BlinkerPlayerS = wert
				elseif (index2== "Car") then
					BlinkerCarS = wert	
				elseif (index2== "BlinkerStatus") then
					BlinkerStatusS = wert
				elseif (index2== "BremslichtStatus") then
					BremslichtStatusS = wert				
				end
			end
			if (BlinkerCarS == source) then
				vehtable.Player = nil
			end
		end
end
addEventHandler("onVehicleExit",getRootElement(),blinkerunbinds)


function bremslichtan( vehinplayer )
	for index, vehtable in pairs(blinkertable) do
		for index2, wert in pairs(vehtable) do
			if (index2== "Player") then
				BlinkerPlayerBA = wert
			elseif (index2== "Car") then
				BlinkerCarBA = wert
			elseif (index2== "BlinkerStatus") then
				BlinkerStatusBA = wert
			elseif (index2== "BremslichtStatus") then
				BremslichtStatusBA = wert				
			end
		end
		if (getPedOccupiedVehicle ( vehinplayer ) == BlinkerCarBA)  and (BlinkerStatusBA == 0) then 
			setVehicleLightState ( BlinkerCarBA, 3, 0 )
			setVehicleLightState ( BlinkerCarBA, 2, 0 )
			vehtable.BremslichtStatus = 1
		end
	end
end

function bremslichtaus( vehinplayer )
	for index, vehtable in pairs(blinkertable) do
		for index2, wert in pairs(vehtable) do
			if (index2== "Player") then
				BlinkerPlayerBO = wert
			elseif (index2== "Car") then
				BlinkerCarBO = wert
			elseif (index2== "BlinkerStatus") then
				BlinkerStatusBO = wert
			elseif (index2== "BremslichtStatus") then
				BremslichtStatusBO = wert				
			end
		end
		if (getPedOccupiedVehicle ( vehinplayer ) == BlinkerCarBO) then 
			setVehicleLightState ( BlinkerCarBO, 3, 1 )
			setVehicleLightState ( BlinkerCarBO, 2, 1 )
			vehtable.BremslichtStatus = 0
		end
	end
end

function linkerblinker(vehinplayer)
	for index, vehtable in pairs(blinkertable) do
		for index2, wert in pairs(vehtable) do
			if (index2== "Player") then
				 BlinkerPlayerLB = wert
			elseif (index2== "Car") then
				 BlinkerCarLB = wert
			elseif (index2== "BlinkerStatus") then
				BlinkerStatusLB = wert
			elseif (index2== "BremslichtStatus") then
				BremslichtStatusLB = wert				
			end
		end
		
		if (getPedOccupiedVehicle ( vehinplayer ) == BlinkerCarLB) then 
			if (BlinkerStatusLB ~= 0) then
				vehtable.BlinkerStatus = 0
				setVehicleLightState ( BlinkerCarLB, 3, 1 )
				setVehicleLightState ( BlinkerCarLB, 2, 1 )
				setPrivVehCorrectLightColor (BlinkerCarLB)
			else
				vehtable.BlinkerStatus = 1
			end
		end
	end
end

function rechterblinker(vehinplayer)
	for index, vehtable in pairs(blinkertable) do
		for index2, wert in pairs(vehtable) do
			if (index2== "Player") then
				 BlinkerPlayerRB = wert
			elseif (index2== "Car") then
				 BlinkerCarRB = wert
			elseif (index2== "BlinkerStatus") then
				BlinkerStatusRB = wert
			elseif (index2== "BremslichtStatus") then
				BremslichtStatusRB = wert				
			end
		end
		
		if (getPedOccupiedVehicle ( vehinplayer ) == BlinkerCarRB) then 
			if (BlinkerStatusRB ~= 0) and (getVehicleLightState (BlinkerCarLB, 2) == 1) then
				vehtable.BlinkerStatus = 0
				setVehicleLightState ( BlinkerCarLB, 3, 1 )
				setVehicleLightState ( BlinkerCarLB, 2, 1 )
				setPrivVehCorrectLightColor (BlinkerCarRB)
			else
				vehtable.BlinkerStatus = 2
			end
		end
	end
end

function warnblinker(vehinplayer)
	for index, vehtable in pairs(blinkertable) do
		for index2, wert in pairs(vehtable) do
			if (index2== "Player") then
				 BlinkerPlayerWB = wert
			elseif (index2== "Car") then
				 BlinkerCarWB = wert
			elseif (index2== "BlinkerStatus") then
				BlinkerStatusWB = wert
			elseif (index2== "BremslichtStatus") then
				BremslichtStatusWB = wert				
			end
		end
		
		
		if (getPedOccupiedVehicle ( vehinplayer ) == BlinkerCarWB) then 
			if (BlinkerStatusWB ~= 0) then
				vehtable.BlinkerStatus = 0
				setVehicleLightState ( BlinkerCarWB, 3, 1 )
				setVehicleLightState ( BlinkerCarWB, 2, 1 )
				setPrivVehCorrectLightColor (BlinkerCarWB)
			else
				vehtable.BlinkerStatus = 3
			end
		end
	end
end

function toogleLightsNonCar(vehinplayer)
	nonlightcar = getPedOccupiedVehicle (vehinplayer)
	nonlightcarstate = getVehicleOverrideLights(nonlightcar)
	if (nonlightcarstate == 0) or (nonlightcarstate == 1) then
		setVehicleOverrideLights (nonlightcar,2)
	elseif (nonlightcarstate == 2) then
		setVehicleOverrideLights (nonlightcar,1)
	end
end

function vehrespawnblinker()
	for index, vehtable in pairs(blinkertable) do
		for index2, wert in pairs(vehtable) do
			if (index2== "Player") then
				 BlinkerPlayer = wert
			elseif (index2== "Car") then
				 BlinkerCar = wert
			elseif (index2== "BlinkerStatus") then
				 BlinkerStatus = wert
			elseif (index2== "BremslichtStatus") then
				 BremslichtStatus = wert				
			end
		end
		if (source == BlinkerCar) then
			setPrivVehCorrectLightColor(BlinkerCar)
			table.remove(blinkertable, index)
		end
	end
end
addEventHandler ( "onVehicleRespawn", getRootElement(), vehrespawnblinker )



-- TESTS

--[[function TEST()
	for index, vehtable in pairs(blinkertable) do
		for index2, wert in pairs(vehtable) do
			if (index2== "Player") then
				 BlinkerPlayer = wert
			elseif (index2== "Car") then
				 BlinkerCar = wert
			elseif (index2== "BlinkerStatus") then
				 BlinkerStatus = wert
			elseif (index2== "BremslichtStatus") then
				 BremslichtStatus = wert				
			end
		end
		respawnVehicle(BlinkerCar)
	end
end
addCommandHandler("testvehrespawn", TEST)
]]


--[[ LICHT SYSTEM


function toggleVehicleLights ( player, key, state )
	if not(getVehicleType ( getPedOccupiedVehicle ( player ) ) == "Automobile") then
		if ( getPedOccupiedVehicleSeat ( player ) == 0 ) then
			local veh = getPedOccupiedVehicle ( player )
			
			if ( getVehicleOverrideLights ( veh ) ~= 2 ) then	
				setVehicleOverrideLights ( veh, 2 )
				setPrivVehCorrectLightColor(veh)
				vnxSetElementData ( veh, "light", true)
			else	
				setVehicleOverrideLights ( veh, 1 )
				setPrivVehCorrectLightColor(veh)
				vnxSetElementData ( veh, "light", false)
			end
		end
	else
		if ( getPedOccupiedVehicleSeat ( player ) == 0 ) then
			local veh = getPedOccupiedVehicle ( player )
			if ( vnxGetElementData ( veh, "light") ~= true ) then	
				vnxSetElementData ( veh, "light", true)
			else	
				vnxSetElementData ( veh, "light", false)
			end
		end
	end
end]]