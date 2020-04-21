local tramjobicon = createPickup ( -2275.12, 534.007, 35.077, 3, 1239, 250 )
local blip = createBlip ( -2275.12, 534.007, 35.077, 58, 2, 255, 255, 0, 255, 0, 200 )
local tramArray = {}
local tramMarkerPositions = {
	{ ["x"] = -1971.5322265625, ["y"] = 1307.875, ["z"] = 6.4973087310791 },
	{ ["x"] = -2001.625, ["y"] = 885.7294921875, ["z"] = 44.74730682373 }, 
	{ ["x"] = -1629.3466796875, ["y"] = 728.75, ["z"] = 13.872308731079 },
	{ ["x"] = -2006.5, ["y"] = 156.439453125, ["z"] = 26.997308731079 }, 
	{ ["x"] = -2251.375, ["y"] = 223.0302734375, ["z"] = 34.62230682373 },   -- -0.4
	{ ["x"] = -2264.658203125, ["y"] = 523.046875, ["z"] = 34.605621337891 }  -- -0.3
}
local tramMarkerArray = {}
local tramBlipArray = {}
local tramMarkerNumberArray = {}


addEventHandler ( "onPickupHit", tramjobicon, function ( player )
	if vnxGetElementData ( player, "job" ) == "tramfuehrer" then
		infobox ( player, "Tippe /tramjobstart\nein, um den\nJob zu starten.", 4000, 0, 125, 0 )
	else
		infobox ( player, "Tippe /tramjob\nein, um den\nJob anzunehmen.", 4000, 0, 125, 0 )
	end
end )


addCommandHandler ( "tramjob", function ( player )
	local x, y, z = getElementPosition ( player )
	local xj, yj, zj = getElementPosition ( tramjobicon )
	if vnxGetElementData ( player, "job" ) == "none" then
		if getDistanceBetweenPoints3D ( x, y, z, xj, yj, zj ) < 5 then
			if vnxGetElementData ( player, "carlicense" ) == 1 then
				vnxSetElementData ( player, "job", "tramfuehrer" )
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Du bist nun\nTramführer!\nöffne das\nHilfemenue für\nmehr Informationen!", 7500, 0, 125, 0 )
			else
				infobox ( player, "Dir fehlt der\nFührerschein!", 4000, 155, 0, 0 )
			end
		else
			infobox ( player, "Du bist nicht\nam Tram-Marker!", 4000, 155, 0, 0 )
		end
	else
		infobox ( player, "Du bist noch\nin einem Job!", 4000, 155, 0, 0 )
	end
end )


local function tramJobberAway ( )
	if isElement ( tramArray[source] ) then
		destroyElement ( tramArray[source] ) 
		tramArray[source] = nil
	end
	if isElement ( tramMarkerArray[source] ) then
		destroyElement ( tramMarkerArray[source] )
	end
	tramMarkerArray[source] = nil
	destroyElement ( tramBlipArray[source] )
	tramBlipArray[source] = nil
	removeEventHandler ( "onPlayerWasted", source, tramJobberAway )
	removeEventHandler ( "onPlayerQuit", source, tramJobberAway )
end


local function tramLeft ( player )
	if isElement ( tramArray[player] ) then
		destroyElement ( tramArray[player] ) 
		tramArray[player] = nil
	end
	
	if isElement ( tramMarkerArray[player] ) then
		destroyElement ( tramMarkerArray[player] )
	end
	tramMarkerArray[player] = nil
	destroyElement ( tramBlipArray[player] )
	tramBlipArray[player] = nil
	removeEventHandler ( "onPlayerWasted", player, tramJobberAway )
	removeEventHandler ( "onPlayerQuit", player, tramJobberAway )
end


local function hitTramMarker ( hitElement, dim )
	if getElementType ( hitElement ) == "vehicle" and dim then
		local player = getVehicleOccupant ( hitElement )
		if source == tramMarkerArray[player] then
			if getElementModel ( hitElement ) == 449 then
				if math.abs ( getTrainSpeed ( hitElement ) ) <= 0.153846 then
					setTrainSpeed ( hitElement, 0 )
					destroyElement ( source )
					destroyElement ( tramBlipArray[player] )
					setTimer ( function ( veh, player )
						if isElement ( veh ) and isElement ( player ) then
							vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 100 )
							infobox ( player, "Du bekommst für\ndiese Station\n100$ Belohnung", 4000, 0, 220, 0 )
							createTramJobMarker ( player )
						end
					end, 3000, 1, hitElement, player )
				else
					infobox ( player, "Du musst\nlangsam reinfahren!", 4000, 155, 0, 0 )
				end	
			else
				tramLeft ( player )
			end
		end
	end
end


function createTramJobMarker ( player )
	local number = tramMarkerNumberArray[player] + 1
	if number > #tramMarkerPositions then
		outputChatBox ( "Du hast eine Runde gedreht und bekommst dafür 500$", player, 0, 220, 0 )
		vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 125 )
		setElementData ( tramArray[player], "fuelstate", 100 )
		number = 1
	end
	tramMarkerNumberArray[player] = number
	local marker = createMarker ( tramMarkerPositions[number]["x"], tramMarkerPositions[number]["y"], tramMarkerPositions[number]["z"], "checkpoint", 2, 255, 0, 0, 100, player )
	addEventHandler ( "onMarkerHit", marker, hitTramMarker )
	tramMarkerArray[player] = marker
	tramBlipArray[player] = createBlip ( tramMarkerPositions[number]["x"], tramMarkerPositions[number]["y"], tramMarkerPositions[number]["z"], 19, 2, 255, 0, 0, 255, 0, 99999, player )
end



function dontLetThemStealTheTramAMK ( _, _, _, door )
	if door == 0 then
		cancelEvent()
	end
end


local function startTramJob ( player )
	if isElement ( tramArray[player] ) then
		destroyElement ( tramArray[player] ) 
	end
	addEventHandler ( "onPlayerWasted", player, tramJobberAway )
	addEventHandler ( "onPlayerQuit", player, tramJobberAway )
	tramArray[player] = createVehicle ( 449, -2265.2770996094, 544.84991455078, 35.229751586914, 0, 0, 180 )
	addEventHandler ( "onVehicleExit", tramArray[player], tramLeft )
	addEventHandler ( "onVehicleExplode", tramArray[player], tramLeft )
	addEventHandler ( "onVehicleRespawn", tramArray[player], tramLeft )
	addEventHandler ( "onVehicleStartEnter", tramArray[player], dontLetThemStealTheTramAMK )
	setVehicleLocked ( tramArray[player], false )
	warpPedIntoVehicle ( player, tramArray[player] )
	tramMarkerNumberArray[player] = 0
	createTramJobMarker ( player )
	triggerClientEvent ( "newTramRider", player, tramArray[player] )
end


addCommandHandler ( "tramjobstart", function ( player )
	if vnxGetElementData ( player, "job" ) == "tramfuehrer" then
		local x, y, z = getElementPosition ( player )
		local xj, yj, zj = getElementPosition ( tramjobicon )
		if getDistanceBetweenPoints3D ( x, y, z, xj, yj, zj ) < 5 then
			if not isPedDead ( player ) then
				if not isPedInVehicle ( player ) then
					startTramJob ( player )
				end
			end
		else
			infobox ( player, "Du bist nicht\nam Tram-Marker!", 4000, 155, 0, 0 )
		end
	else
		infobox ( player, "Du bist kein\nTramfahrer!!", 4000, 155, 0, 0 )
	end
end )


function triggerJoinedPlayerTheTrams ( player )
	triggerClientEvent ( player, "connectedTramJob", player, tramArray )
end






				