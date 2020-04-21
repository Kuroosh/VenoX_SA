function airportjobiconHit ( player )
	if vnxGetElementData ( player, "job" ) == "airport" and not getPedOccupiedVehicle ( player ) then
		local dim = getFreeDimension ()
		vnxSetElementData ( player, "jobDimension", dim )
		showCursor ( player, true )
		setElementClicked ( player, true )
		triggerClientEvent ( player, "showAirportJobGui", getRootElement() )
	else
		triggerClientEvent ( player, "showacceptjobairport_gui", getRootElement())
		--triggerClientEvent ( player, "infobox_start", getRootElement(), "Tippe /job, um\nam Fluhafen zu\narbeiten -\n dazu brauchst du\neinen Fuehrerschein.", 5000, 200, 200, 0 )
	end
end


local airportjobicon = createCustomPickup(-1421.4033, -287.19, 14, 0, 0, "anzeigen/jobs/images/job_pickup.png", airportjobiconHit)



function AirportJob_Accept( player )
	local player = client
	triggerClientEvent ( player, "infobox_start", getRootElement(), "Frank Novak :  Willkommen am Board Kumpel :) ", 7500, 0, 125, 0 )
	vnxSetElementData ( player, "job", "airport" )
end
addEvent ( "AcceptJob_Airport", true )
addEventHandler ( "AcceptJob_Ai rport", getRootElement(), AirportJob_Accept )