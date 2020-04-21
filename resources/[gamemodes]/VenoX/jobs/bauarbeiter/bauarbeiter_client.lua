--[[local BauingJobTargetMarker, BauingAreaMarker
local playerToGroundLevel = 1.3085

function showNextBauarbeiterJobMarker ( x, y, z, typ )

	local size = 1
	if typ == 2 then
		size = 5
	elseif typ == 3 then
		size = 5
	end
	local marker = createMarker ( x, y, z, "checkpoint", size, 200, 0, 0, 125, nil )
	BauingJobTargetMarker = marker
	local blip = createBlip ( x, y, z, 0, 2, 255, 0, 0, 255, 0, 99999 )
	setElementParent ( blip, marker )
	if typ == 1 then
		addEventHandler ( "onClientMarkerHit", marker, BauarbeiterJobMarker1Hit )
	elseif typ == 2 then
		addEventHandler ( "onClientMarkerHit", marker, BauarbeiterJobMarker2Hit )
	elseif typ == 3 then
		addEventHandler ( "onClientMarkerHit", marker, BauarbeiterJobMarker3Hit )
	end
end
addEvent ( "showNextBauarbeiterJobMarker", true )
addEventHandler ( "showNextBauarbeiterJobMarker", getRootElement(), showNextBauarbeiterJobMarker )

function BauarbeiterJobMarker1Hit ( player )

	if player == lp and not getPedOccupiedVehicle ( player ) then
		setElementFrozen ( lp, true )
		local x, y, z = getElementPosition ( lp )
		local z = z - playerToGroundLevel * 2
		--setTimer (
			--function ( x, y, z )
				--local crop = createObject ( 3409, x, y, z )
				--moveObject ( crop, 5000, x, y, z + playerToGroundLevel )
				--setTimer ( destroyElement, 60000, 1, crop )
			--end,
		--1500, 1, x, y, z )
		
		triggerServerEvent ( "BauarbeiterJobMarkerHit", lp, 1 )
		destroyElement ( source )
	end
end

function BauarbeiterJobMarker2Hit ( player )

	if getPedOccupiedVehicle ( lp ) and player == lp then
		triggerServerEvent ( "BauarbeiterJobMarkerHit", lp, 2 )
		destroyElement ( source )
	end
end
function BauarbeiterJobMarker3Hit ( player )

	if getPedOccupiedVehicle ( lp ) and player == lp then
		triggerServerEvent ( "BauarbeiterJobMarkerHit", lp, 3 )
		destroyElement ( source )
	end
end

function startBauingJob ()

	BauingAreaMarker = createMarker ( 598, 870, -43, "checkpoint", 500, 300, 0, 0, 125, nil )
	addEventHandler ( "onClientPlayerWasted", lp, clientBauarbeiterWasted )
	addEventHandler ( "onClientMarkerLeave", BauingAreaMarker,
		function ( player )
			if player == lp then
				-- cancel_Bauing ( "", "Bauing" )
			end
		end
	)
end
addEvent ( "startBauingJob", true )
addEventHandler ( "startBauingJob", getRootElement(), startBauingJob )

function cancel_Bauing ( cmd, arg )

	if arg == "Bauing" or arg == "job" then
		if isElement ( BauingAreaMarker ) then
			destroyElement ( BauingAreaMarker )
		end
		if isElement ( BauingJobTargetMarker ) then
			destroyElement ( BauingJobTargetMarker )
		end
		triggerServerEvent ( "cancelBauingJob", lp )
		
		infobox ( "Du hast die Arbeit\nabgebrochen.", 5000, 125, 0, 0 )
		removeEventHandler ( "onClientPlayerWasted", lp, clientBauarbeiterWasted )
	end
end
addEvent ( "cancelBauing", true )
addEventHandler ( "cancelBauing", getRootElement(), cancel_Bauing )
addCommandHandler ( "cancel", cancel_Bauing )

function clientBauarbeiterWasted ()
	cancel_Bauing ( "", "Bauing" )
end
]]