noengine = { [509]=true, [481]=true, [510]=true }



function toggleVehicleLights ( player, key, state )
	if ( getPedOccupiedVehicleSeat ( player ) == 0 ) then
		local veh = getPedOccupiedVehicle ( player )
		if getElementModel ( veh ) ~= 438 then
			if ( getVehicleOverrideLights ( veh ) ~= 2 ) then
				setVehicleOverrideLights ( veh, 2 )
				vnxSetElementData ( veh, "light", true)
			else
				setVehicleOverrideLights ( veh, 1 )
				vnxSetElementData ( veh, "light", false)
			end
		end
	end
end

function toggleVehicleTrunkBind ( player, key, state )

	local veh = getPedOccupiedVehicle ( player )
	if getPedOccupiedVehicleSeat ( player ) == 0 and vnxGetElementData ( veh, "engine" ) then
		if vnxGetElementData ( veh, "owner" ) then
			if vnxGetElementData ( veh, "stuning1" ) then
				if vnxGetElementData ( veh, "engine" ) then
					toggleVehicleTrunk ( veh )
					unbindKey ( player, "sub_mission", "down", toggleVehicleTrunkBind, "Kofferraum auf/zu" )
					setTimer ( rebindTrunk, 750, 1, player )
				else
					outputChatBox ( "Der Motor muss laufen!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Dieses Fahrzeug hat keinen Kofferraum!", player, 125, 0, 0 )
			end
		end
	end
end

function rebindTrunk ( player )

	bindKey ( player, "sub_mission", "down", toggleVehicleTrunkBind, "Kofferraum auf/zu" )
end

function toggleVehicleEngine ( player, key, state )
	--triggerClientEvent(getRootElement(),"stopsound",player)
	local veh = getPedOccupiedVehicle ( player )
	if veh and getElementModel ( veh ) ~= 438 then
		if ( getPedOccupiedVehicleSeat ( player ) == 0 ) then
			
			-- Falls das Fahrzeug neu gespawnt ist und noch keinen Benzinwert hat
			if not vnxGetElementData ( veh, "fuelstate" ) then
				vnxSetElementData ( veh, "fuelstate", 100 )
				vnxSetElementData ( veh, "engine", false )
				setVehicleOverrideLights ( veh, 1 )
				vnxSetElementData ( veh, "light", false)
				setVehicleEngineState ( veh, false )
				
			end
			
			-- Falls der Motor läuft -> immer abschalten
			if getVehicleEngineState ( veh ) then
				setVehicleEngineState ( veh, false )
				vnxSetElementData ( veh, "engine", false )
				
				--[[local x, y, z = getElementPosition ( veh )
				local sphere = createColSphere ( x, y, z, 3 )
				local vehicles = getElementsWithinColShape ( sphere, "vehicle" )
				destroyElement ( sphere )
				for key, index in pairs ( vehicles ) do
					if getElementModel ( index ) == 443 then
						attachElementsInVeryCorrectWay ( veh, index )
						vnxSetElementData ( veh, "attachedToPacker", index )
						break
					end
				end]]
			-- Falls der Motor NICHT läuft, dem Spieler das Fahrzeug jedoch gehört
			elseif vnxGetElementData ( veh, "owner" ) == getPlayerName ( player ) or getElementData(veh, "schluessel") == getPlayerName(player) then
				-- Falls das Fahrzeug noch genug Benzin hat
				if tonumber ( vnxGetElementData ( veh, "fuelstate" ) ) >= 1 then
					setVehicleEngineState ( veh, true )
					vnxSetElementData ( veh, "engine", true )
					
					if not vnxGetElementData ( veh, "timerrunning" ) then
						setVehicleNewFuelState ( veh )
						vnxSetElementData ( veh, "timerrunning", true )
						--[[if vnxGetElementData ( veh, "attachedToPacker" ) then
							detachElements ( veh, vnxGetElementData ( veh, "attachedToPacker" ) )
						end]]
					end
				else
					outputChatBox ( "Das Fahrzeug hat nicht mehr genug Benzin - du kannst an einer Tankstelle einen Reservekannister erwerben!", player, 125, 0, 0 )
				end
			-- Kein Besitzer bzw. Fraktionswagen / gespawnte Fahrzeuge
			elseif not vnxGetElementData ( veh, "owner" ) then
				if vnxGetElementData ( veh, "fuelstate" ) >= 1 then
					--triggerClientEvent(getRootElement(),"stopSound",player)
					setVehicleEngineState ( veh, true )
					vnxSetElementData ( veh, "engine", true )
					
					if not vnxGetElementData ( veh, "timerrunning" ) then
						setVehicleNewFuelState ( veh )
						vnxSetElementData ( veh, "timerrunning", true )
					end
					--[[if vnxGetElementData ( veh, "attachedToPacker" ) then
						detachElements ( veh, vnxGetElementData ( veh, "attachedToPacker" ) )
					end]]
				end
			elseif vnxGetElementData ( veh, "ownerfraktion" ) then
				local car_acess
				if tonumber(vnxGetElementData( veh, "ownerfraktion" )) == tonumber(vnxGetElementData ( player, "fraktion" )) then
					car_acess = true
				elseif tonumber(vnxGetElementData( veh, "ownerfraktion" )) == 1 then
					if isCop ( player ) or ( isOnDuty ( player ) and vnxGetElementData ( player, "rang" ) >= 4 ) then
						car_acess = true				
					end
				elseif tonumber(vnxGetElementData( veh, "ownerfraktion" )) == 6 then
					if isFBI ( player ) or ( isOnDuty ( player ) and vnxGetElementData ( player, "rang" ) >= 4 ) then
						car_acess = true				
					end
				elseif tonumber(vnxGetElementData( veh, "ownerfraktion" )) == 8 then
					if isArmy ( player ) or ( isOnDuty ( player ) and vnxGetElementData ( player, "rang" ) >= 4 ) then
						car_acess = true				
					end
				end
			
				if vnxGetElementData ( veh, "fuelstate" ) >= 1 and car_acess == true then
					setVehicleEngineState ( veh, true )
					vnxSetElementData ( veh, "engine", true )
					
					if not vnxGetElementData ( veh, "timerrunning" ) then
						setVehicleNewFuelState ( veh )
						vnxSetElementData ( veh, "timerrunning", true )
					end
				end
			end
			--[[if not vnxGetElementData ( veh, "owner" ) then
				if getVehicleEngineState ( veh ) then
					setVehicleEngineState ( veh, false )
					vnxSetElementData ( veh, "engine", false )
				else
					setVehicleEngineState ( veh, true )
					vnxSetElementData ( veh, "engine", true )
				end
			elseif vnxGetElementData ( veh, "owner" ) and vnxGetElementData ( veh, "owner" ) ~= getPlayerName ( player ) then
				if getVehicleEngineState ( veh ) then
					setVehicleEngineState ( veh, false )
					vnxSetElementData ( veh, "engine", false)
				end
			else
				if getVehicleEngineState ( veh ) and ( ( noengine[getElementModel ( veh )] and vnxGetElementData ( veh, "owner" ) ) or not noengine[getElementModel ( veh )] ) then
					setVehicleEngineState ( veh, false )
					vnxSetElementData ( veh, "engine", false)
				elseif not getVehicleEngineState ( veh ) and tonumber ( vnxGetElementData ( veh, "fuelstate" ) ) > 0 then
					setVehicleEngineState ( veh, true )
					vnxSetElementData ( veh, "engine", true )
					if not vnxGetElementData ( veh, "timerrunning" ) then
						setVehicleNewFuelState ( veh )
						vnxSetElementData ( veh, "timerrunning", true )
					end
				end
			end]]
		end
	end
end


Motorstartet="Nein"
function motorsound(source)
local veh = getPedOccupiedVehicle ( source )
    if getVehicleEngineState ( veh ) == false then
        triggerClientEvent(getRootElement(),"startsound",source)  
        timer =setTimer(function()
            --setVehicleTurnVelocity(vehicle, -0.01, -0.01, 0)
            --setVehicleTurnVelocity ( veh, 0.1, 0.1, 0 )
            toggleVehicleEngine(source)
            triggerClientEvent(getRootElement(),"stopsound_carvnx",source)
        end, 1000, 1)
    local taste_start="x"
        Motorstartet="Ja"
        if ( Motorstartet=="Ja" ) then
            setVehicleTurnVelocity ( veh, -0.01, -0.01, 0 )
            setTimer(function()
             setVehicleTurnVelocity ( veh, 0.01, 0.01, 0 )
            end, 200, 1)
            setTimer(function()
             setVehicleTurnVelocity ( veh, -0.01, -0.01, 0 )
            end, 400, 1)
            setTimer(function()
             setVehicleTurnVelocity ( veh, 0.01, 0.01, 0 )
            end, 600, 1)
            setTimer(function()
             setVehicleTurnVelocity ( veh, -0.01, -0.01, 0 )
            end, 800, 1)
            setTimer(function()
             setVehicleTurnVelocity ( veh, 0.01, 0.01, 0 )
            end, 1000, 1)
            setTimer(function()
              motorstartet="Nein"
            end, 1000, 1)
        end
    else
        Motorstartet="Nein"
        toggleVehicleEngine(source)
    end
end
 
function killtimer (source)
    if isTimer (timer) then
        triggerClientEvent(getRootElement(),"stopsound_carvnx",source)
        killTimer(timer)
    end
end




function enginecheck (  veh, seat )
	if seat == 0 then
		if ( not noengine[getElementModel ( veh )] or ( noengine[getElementModel ( veh )] and vnxGetElementData ( veh, "owner" ) ) ) and getElementModel ( veh ) ~= 438 then
			if not vnxGetElementData ( veh, "engine" ) then
				vnxSetElementData ( veh, "engine", false )
				setVehicleEngineState ( veh, false )
			end
			if not vnxGetElementData ( veh, "light" ) then
				vnxSetElementData ( veh, "light", false )
				setVehicleOverrideLights ( veh, 1 )
			end
			if getElementType ( source ) == "player" then
				if not isKeyBound ( source, "l", "down", toggleVehicleLights ) then
					bindKey ( source, "l", "down", toggleVehicleLights, "Licht an/aus" )
					--bindKey ( source, "x", "down", toggleVehicleEngine, "Motor an/aus" )
					bindKey ( source, "x", "down", motorsound, "Motor an/aus" )
					bindKey ( source, "x", "up", killtimer)
					bindKey ( source, "sub_mission", "down", toggleVehicleTrunkBind, "Kofferraum auf/zu" )
				end
			end
		end  
	end
end
addEventHandler ( "onPlayerVehicleEnter", getRootElement(), enginecheck )

function vehexit ()
	unbindKey ( source, "l", "down", toggleVehicleLights, "Licht an/aus" )
	--unbindKey ( source, "x", "down", toggleVehicleEngine, "Motor an/aus" )
	unbindKey ( source, "sub_mission", "down", toggleVehicleTrunkBind, "Kofferraum auf/zu" )
	unbindKey ( source, "x", "down", motorsound, "Motor an/aus" )
	unbindKey ( source, "x", "up", killtimer)
end
addEventHandler ("onPlayerVehicleExit", getRootElement(), vehexit )