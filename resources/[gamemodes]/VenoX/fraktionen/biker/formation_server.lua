local formationActive = false
local formationMembers = {}
local formationleader = nil
local oldhandling = {}
local formationMarker = nil
local formationVeh = nil
local playerVeh = {}
local vehPlayer = {}

function formation ( player )

	if not formationActive then
		if isBiker ( player ) then
			if vnxGetElementData ( player, "rang" ) >= 3 then
				local veh = getPedOccupiedVehicle ( player )
				if veh and getElementModel ( veh ) == 463 then
					formationActive = true
					formationleader = player
					
					local x, y, z = getElementPosition ( veh )
					local marker = createMarker ( x, y, z - ( 30.085750579834 - 29.032991409302 ), "cylinder", 15, 127, 127, 127, 20 )
					setElementVisibleTo ( marker, getRootElement(), false )
					
					attachElements ( marker, veh )
					
					formationMarker = marker
					playerVeh[player] = veh
					vehPlayer[veh] = player
					
					removeEventHandler ( "onPlayerVehicleExit", player, deleteFormationHandler )
					removeEventHandler ( "onPlayerQuit", player, deleteFormationHandler )
					removeEventHandler ( "onVehicleExplode", veh, deleteFormationHandler )
					addEventHandler ( "onPlayerVehicleExit", player, deleteFormationHandler )
					addEventHandler ( "onPlayerQuit", player, deleteFormationHandler )
					addEventHandler ( "onVehicleExplode", veh, deleteFormationHandler )
					
					formationMarker = marker
						
					formationVeh = veh
					addEventHandler ( "onMarkerHit", marker, formationMarkerHit )
					
					local handling = getVehicleHandling ( veh )
					oldhandling[veh] = { ["maxVelocity"] = handling["maxVelocity"], ["engineAcceleration"] = handling["engineAcceleration"], ["engineInertia"] = handling["engineInertia"], ["brakeDeceleration"] = handling["brakeDeceleration"], ["mass"] = handling["mass"], ["turnMass"] = handling["turnMass"] }
					setVehicleHandling ( veh, "maxVelocity", oldhandling[veh]["maxVelocity"]*3 )
					setVehicleHandling ( veh, "engineAcceleration", oldhandling[veh]["engineAcceleration"]*3 )
					setVehicleHandling ( veh, "engineInertia", oldhandling[veh]["engineInertia"]*3 )
					setVehicleHandling ( veh, "brakeDeceleration", oldhandling[veh]["brakeDeceleration"]*3 )
					setVehicleHandling ( veh, "mass", oldhandling[veh]["mass"]*3 )
					setVehicleHandling ( veh, "turnMass", oldhandling[veh]["turnMass"]*3 )
					setElementHealth ( veh, 5000 )
					
					triggerClientEvent ( player, "formationFound", player, veh )
					
					infobox ( player, "Formation erstellt!\nWenn deine Brüder nun\nmit dir fahren, wirst\ndu schneller!", 5000, 200, 0, 0 )
					
					for key, index in pairs ( fraktionMembers[9] ) do
						if key ~= player then
							setElementVisibleTo ( marker, key, true )
						end
					end
				else
					infobox ( player, "Nur auf einer Freeway\nmöglich!", 5000, 200, 0, 0 )
				end
			else
				infobox ( player, "Nur für Roadcaptain\noder höher!", 5000, 200, 0, 0 )
			end
		else
			infobox ( player, "Du bist kein Mitglied\nder Angels of Death!", 5000, 200, 0, 0 )
		end
	else
		infobox ( player, "Es kann immer nur\neine Formation geben!", 5000, 200, 0, 0 )
	end
end
addCommandHandler ( "formation", formation )

function formationMarkerHit ( player, dim )

	if getElementType ( player ) == "player" and dim and getElementInterior ( source ) == getElementInterior ( player ) and player ~= formationleader and not formationMembers[player] then
		local veh = getPedOccupiedVehicle ( player )
		local leaderVeh = formationVeh
		if veh and isBiker ( player ) and getElementModel ( veh ) == 463 and veh ~= leaderVeh then
			if getPedOccupiedVehicleSeat ( player ) == 0 then
				formationMembers[player] = true
				playerVeh[player] = veh
				vehPlayer[veh] = player
				local handling = getVehicleHandling ( veh )
				oldhandling[veh] = { ["maxVelocity"] = handling["maxVelocity"], ["engineAcceleration"] = handling["engineAcceleration"], ["engineInertia"] = handling["engineInertia"], ["brakeDeceleration"] = handling["brakeDeceleration"], ["mass"] = handling["mass"], ["turnMass"] = handling["turnMass"] }
				setVehicleHandling ( veh, "maxVelocity", oldhandling[veh]["maxVelocity"]*3 )
				setVehicleHandling ( veh, "engineAcceleration", oldhandling[veh]["engineAcceleration"]*3 )
				setVehicleHandling ( veh, "engineInertia", oldhandling[veh]["engineInertia"]*3 )
				setVehicleHandling ( veh, "brakeDeceleration", oldhandling[veh]["brakeDeceleration"]*3 )
				setVehicleHandling ( veh, "mass", oldhandling[veh]["mass"]*3 )
				setVehicleHandling ( veh, "turnMass", oldhandling[veh]["turnMass"]*3 )
				setElementHealth ( veh, 5000 )
				triggerClientEvent ( player, "joinFormation", player, veh, leaderVeh )
			end
		end
	end
end

function deleteFormation ( veh )
	if isElement ( formationMarker ) then
		destroyElement ( formationMarker )
	end
	for veh, array in pairs ( oldhandling ) do
		if isElement ( veh ) then
			setVehicleHandling ( veh, "maxVelocity", array["maxVelocity"] )
			setVehicleHandling ( veh, "engineAcceleration", array["engineAcceleration"] )
			setVehicleHandling ( veh, "engineInertia", array["engineInertia"] )
			setVehicleHandling ( veh, "brakeDeceleration", array["brakeDeceleration"] )
			setVehicleHandling ( veh, "mass", array["mass"] )
			setVehicleHandling ( veh, "turnMass", array["turnMass"] )
		end
	end
	oldhandling = {}
	formationleader = nil				

	for key, index in pairs ( formationMembers ) do
		if isElement ( key ) and getElementType ( key ) == "player" then
			infobox ( key, "Deine Formation wurde\naufgelöst!", 5000, 200, 0, 0 )
			stopFormationAodBiker ( key )
		end
	end
	formationMembers = {}
	formationActive = false
end

function deleteFormationHandler ( veh ) 
	local player
	local vehicle
	if isElement ( veh ) and getElementType ( veh ) == "vehicle" then
		vehicle = veh
		player = source
	elseif isElement ( veh ) and getElementType ( veh ) == "player" then
		vehicle = source
		player = vehPlayer[source]
	else
		player = source
		vehicle = playerVeh[player]
	end
	deleteFormation ( veh )
	playerVeh[player] = nil
	vehPlayer[vehicle] = nil
	removeEventHandler ( "onVehicleExplode", veh, deleteFormationHandler )
	removeEventHandler ( "onPlayerVehicleExit", player, deleteFormationHandler )
	removeEventHandler ( "onPlayerQuit", player, deleteFormationHandler )	
end


function stopFormationAodBiker ( player )
	formationMembers[player] = nil
	triggerClientEvent ( player, "leavaeFormation", player )
end
--[[
    <vehicle id="vehicle (Freeway) (9)" paintjob="3" model="463" plate="9OLI79B" interior="0" dimension="0" color="113,113,0,0" posX="-2182.9116210938" posY="-2381.3762207031" posZ="30.085750579834" rotX="0" rotY="0" rotZ="233.99230957031" />
    <marker id="formation" type="cylinder" color="" size="15" interior="0" dimension="0" posX="-2182.9116210938" posY="-2381.3762207031" posZ="29.032991409302" rotX="0" rotY="0" rotZ="0" />
]]