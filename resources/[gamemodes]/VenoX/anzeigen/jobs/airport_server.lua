--airportjobicon = createPickup ( -1414.8072509766, -299.4963684082, 5.8523507118225, 3, 1239, 1, 99 )

function AirportJob_Accept( player )
	local player = client
	triggerClientEvent ( player, "infobox_start", getRootElement(), "Frank Novak :  Willkommen am Board Kumpel :) ", 7500, 0, 125, 0 )
	vnxSetElementData ( player, "job", "airport" )
end
addEvent ( "AcceptJob_Airport", true )
addEventHandler ( "AcceptJob_Airport", getRootElement(), AirportJob_Accept )

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

local airportblip = createBlip ( -1414.8072509766, -299.4963684082, 5.8523507118225, 58, 2, 255, 255, 0, 255, 0, 200 )

flughafenModels = { 
[592]=true,
[577]=true,
[511]=true,
[512]=true,
[593]=true,
[553]=true,
[519]=true,
[485]=true
 }


for veh in pairs ( flughafenModels ) do
	if vnxGetElementData ( player, "job" ) == "airport" and getElementModel ( getPedOccupiedVehicle ( player ) ) == 458 then
 	--if ( getElementModel ( veh ) == 485 ) then
 	vnxSetElementData ( veh, "sportmotor", ( veh == 10 and 3 or 2 ) )
	vnxSetElementData ( veh, "bremse", ( veh == 10 and 3 or 2 ) )
	end
end


function cancelAirportMission ( veh )
	if vnxGetElementData ( source, "isinairportmission" ) then
		if flughafenModels [ getElementModel ( veh ) ] then
			triggerClientEvent(source,"blendLoadingScreen",source)
			destroyElement ( veh )
			killTrailer_func ( source, 1 )
			killTrailer_func ( source, 2 )
			killTrailer_func ( source, 3 )
			setElementDimension ( source, 0 )
			toggleControl ( source, "sub_mission", true )
			vnxSetElementData ( source, "isinairportmission", false )
			infobox ( source, "Auftrag gescheitert -\nDu hast das Fahrzeug\nverlassen!", 5000, 125, 0, 0 )
			setElementPosition ( source, -1459.5625 , -273.337890625 , 14.1484375 )
			triggerClientEvent ( source, "stopAirportJob", source )
			removeEventHandler ( "onPlayerVehicleExit", source, cancelAirportMission )
			
			local pname = getPlayerName ( source )
			for i = 1, 3 do
				if isElement ( _G["BaggageTrailer"..i..pname] ) then
					destroyElement ( _G["BaggageTrailer"..i..pname] )
				end
			end
		end
	end
end




function airportjobDimFix_func ( )

	local player = client
	vnxSetElementData ( player, "isinairportmission", true )
	local pname = getPlayerName ( player )
	local dim = vnxGetElementData ( player, "jobDimension" )
	_G["Baggage"..pname] = createVehicle ( 485, -1264.0727539063, 34.647338867188, 13.841641426086, 0, 0, 135 )
	_G["BaggageTrailer1"..pname] = createVehicle ( 606, -1260.7633056641, 31.612400054932, 13.841641426086, 0, 0, 135 )
	_G["BaggageTrailer2"..pname] = createVehicle ( 606, -1258.3664550781, 29.416164398193, 13.841641426086, 0, 0, 135 )
	_G["BaggageTrailer3"..pname] = createVehicle ( 607, -1255.9699707031, 27.217338867188, 13.841641426086, 0, 0, 135 )
	setElementDimension ( _G["Baggage"..pname], dim )
	setElementDimension ( _G["BaggageTrailer1"..pname], dim )
	setElementDimension ( _G["BaggageTrailer2"..pname], dim )
	setElementDimension ( _G["BaggageTrailer3"..pname], dim )
	setElementDimension ( player, dim )
	warpPedIntoVehicle ( player, _G["Baggage"..pname] )
	removeEventHandler ( "onPlayerVehicleExit", player, cancelAirportMission )
	addEventHandler ( "onPlayerVehicleExit", player, cancelAirportMission )
	infobox ( player, "Bring das Gepaeck\nzu den Flugzeugen!", 5000, 200, 200, 10 )
end
addEvent ( "airportjobDimFix", true )
addEventHandler ( "airportjobDimFix", getRootElement(), airportjobDimFix_func )


function killTrailer_func ( trailer )
	local pname = getPlayerName ( source )
	if isElement ( trailer ) then
		destroyElement ( trailer )
	end
end
addEvent ( "killTrailer", true )
addEventHandler ( "killTrailer", root, killTrailer_func )


function baggageMissionComplete_func ( )
	local player = client
	local veh = getPedOccupiedVehicle ( player )
	local trailer = getVehicleTowedByVehicle ( veh )
	vnxSetElementData ( player, "isinairportmission", false )
	local pname = getPlayerName ( player )
	removePedFromVehicle ( player )
	setElementDimension ( player, 0 )
	triggerClientEvent(player,"blendLoadingScreen",player)
	infobox ( player, "Auftrag abgeschlossen!\nDu erhälst 200 $ + 5 Punkte", 5000, 0, 125, 0 )
	increaseAirportLevel ( player, 5 )
	local pmoney = vnxGetElementData ( player, "money" )
	vnxSetElementData ( player, "money", pmoney + 200 )	
	setElementPosition ( player, -1459.5625 , -273.337890625 , 14.1484375 )
	destroyElement ( veh )
	destroyElement ( trailer )
end
addEvent ( "baggageMissionComplete", true )
addEventHandler ( "baggageMissionComplete", getRootElement(), baggageMissionComplete_func )


function airportJobInsektenvernichter_func ( )
	local player = client
	vnxSetElementData ( player, "isinairportmission", true )
	local pname = getPlayerName ( player )
	local dim = vnxGetElementData ( player, "jobDimension" )
	vnxSetElementData ( player, "jobDimension", dim )
	triggerClientEvent(player,"blendLoadingScreen",player)
	_G["Cropduster"..pname] = createVehicle ( 512, -1432.7407226563, -953.34649658203, 201.60592651367, 0, 0, 270 )
	setTimer ( warpPedIntoVehicle, 300, 1, player, _G["Cropduster"..pname] )
	setControlState ( player, "sub_mission", true )
	setTimer ( setControlState, 200, 1, player, "sub_mission", false )
	toggleControl ( player, "sub_mission", false )
	setElementDimension ( _G["Cropduster"..pname], dim )
	setElementDimension ( player, dim )
	removeEventHandler ( "onPlayerVehicleExit", player, cancelAirportMission )
	addEventHandler ( "onPlayerVehicleExit", player, cancelAirportMission )
	vnxSetElementData ( player, "airportMissionVeh", _G["Cropduster"..pname] )
	addEventHandler ( "onPlayerQuit", player, airportMissionCrash )
end
addEvent ( "airportJobInsektenvernichter", true )
addEventHandler ( "airportJobInsektenvernichter", getRootElement(), airportJobInsektenvernichter_func )


function airportMissionCrash ()
	local veh = vnxGetElementData ( source, "airportMissionVeh" )
	if veh then
		if isElement ( veh ) then
			destroyElement ( veh )
		end
	end
end


function cropdusterMissionComplete_func ( )
	local player = client
	removeEventHandler ( "onPlayerQuit", player, airportMissionCrash )
	if vnxGetElementData ( player, "isinairportmission" ) then	
		toggleControl ( player, "sub_mission", true )
		triggerClientEvent(player,"blendLoadingScreen",player)
		vnxSetElementData ( player, "isinairportmission", false )
		local pname = getPlayerName ( player )
		local veh = getPedOccupiedVehicle ( player )
		removePedFromVehicle ( player )
		if getElementModel ( veh ) == 512 then
			destroyElement ( veh )
		end
		setElementDimension ( player, 0 )
		infobox ( player, "Auftrag abgeschlossen!\nDu erhälst 320 $! + 10 Punkte", 5000, 0, 125, 0 )
		increaseAirportLevel ( player, 10 )
		local pmoney = vnxGetElementData ( player, "money" )
		vnxSetElementData ( player, "money", pmoney + 320 )
		setElementPosition ( player, -1459.5625 , -273.337890625 , 14.1484375 )		
	end
end
addEvent ( "cropdusterMissionComplete", true )
addEventHandler ( "cropdusterMissionComplete", getRootElement(), cropdusterMissionComplete_func )


function increaseAirportLevel ( player, lvl )

	local airportlvl = tonumber ( vnxGetElementData ( player, "airportlvl" ) )
	if airportlvl < 1000 then
		if airportlvl + lvl >= 1000 then
			vnxSetElementData ( player, "airportlvl", 1000 )
			infobox ( player, "Dein Flughafenlevel ist\nnun auf Maximum. ( 1000 P ) ", 5000, 125, 0, 0 )
			vnxSetElementData ( player, "bonuspoints", tonumber(vnxGetElementData ( player, "bonuspoints" )) + 400 )
		else
			vnxSetElementData ( player, "airportlvl", airportlvl + lvl )
			infobox ( player, "Dein Flughafenlevel wurde\nerhöht und liegt\njetzt bei "..airportlvl+lvl.."/1000", 5000, 0, 150, 0 )
		end
	end
end

function airportJobFlight_func ( veh, x, y, z, rot )
	local player = client		
	vnxSetElementData ( player, "isinairportmission", true )
	local pname = getPlayerName ( player )
	local dim = vnxGetElementData ( player, "jobDimension" )
	vnxSetElementData ( player, "jobDimension", dim )
	_G["Plane"..pname] = createVehicle ( veh, x, y, z, 0, 0, rot )
	setElementDimension ( _G["Plane"..pname], dim )
	setElementDimension ( player, dim )
	setTimer ( warpPedIntoVehicle, 300, 1, player, _G["Plane"..pname] )
	setTimer (
		function ( player )
			if isElement ( player ) then
				removeEventHandler ( "onPlayerVehicleExit", player, cancelAirportMission )
				addEventHandler ( "onPlayerVehicleExit", player, cancelAirportMission )
			end
		end,
	500, 1, player )
	triggerClientEvent(player,"blendLoadingScreen",player)
	vnxSetElementData ( player, "airportMissionVeh", _G["Plane"..pname] )
	removeEventHandler ( "onPlayerQuit", player, airportMissionCrash )
	addEventHandler ( "onPlayerQuit", player, airportMissionCrash )
end
addEvent ( "airportJobFlight", true )
addEventHandler ( "airportJobFlight", getRootElement(), airportJobFlight_func )


function airportJobFreightFinished_func ( vehid )
	local player = client
	removeEventHandler ( "onPlayerQuit", player, airportMissionCrash )
	
	if vnxGetElementData ( player, "isinairportmission" ) then
		vnxSetElementData ( player, "isinairportmission", false )
		local veh = getPedOccupiedVehicle ( player )
		removePedFromVehicle ( player )
		setElementDimension ( player, 0 )
		if vehid == 593 or vehid == 511 then
			destroyElement ( veh )
			outputChatBox ( "Danke! Die Passagiere sind sicher gelandet! Du erhälst 20 Punkte", player, 0, 150, 200 )
			earned = 600
			increaseAirportLevel ( player, 10 )
		elseif vehid == 553 or vehid == 519 then
			destroyElement ( veh )
			outputChatBox ( "Danke! Die Passagiere sind sicher gelandet! Du erhälst 40 Punkte", player, 0, 150, 200 )
			earned = 750
			increaseAirportLevel ( player, 20 )
		elseif vehid == 592 or vehid == 577 then
			destroyElement ( veh )
			outputChatBox ( "Danke! Die Passagiere sind sicher gelandet! Du erhälst 80 Punkte", player, 0, 150, 200 )
			earned = 900
			increaseAirportLevel ( player, 40 )
		end
		infobox ( player, "Auftrag abgeschlossen!\nDu erhälst "..earned.." €!", 5000, 0, 125, 0 )
		triggerClientEvent(player,"blendLoadingScreen",player)
		local pmoney = vnxGetElementData ( player, "money" )
		vnxSetElementData ( player, "money", pmoney + earned )
		setElementPosition ( player, -1459.5625 , -273.337890625 , 14.1484375)
	end
end
addEvent ( "airportJobFreightFinished", true )
addEventHandler ( "airportJobFreightFinished", getRootElement(), airportJobFreightFinished_func )