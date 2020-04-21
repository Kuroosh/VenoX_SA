local drogentruckEntrance = createMarker ( 2342.9963, 2773.7939, 9.7203,  "cylinder",  2,  getColorFromString ( "#FE000199" ) )
local drogentruckBlip = createBlip ( 2342.9963, 2773.7939, 9.7203, 51, 1 ) 
-- TODO | KOORDINATEN ÄNDERN! --
local drogentruckDeliver = createMarker ( -1082.6046, -1649.0123, 76.36, "checkpoint", 7, 0, 125, 0 )
local drogentruckDeliverBlip = createBlip ( -1082.6046, -1649.0123, 76.36, 19, 2, 255, 0, 0, 255, 0, 99999.0, getRootElement() )
setElementVisibleTo ( drogentruckDeliver, getRootElement(), false )
setElementVisibleTo ( drogentruckDeliverBlip, getRootElement(), false )

drogentruck = false
local drogentruckRobber = nil
local drogentruckFraktion = nil
local drogentruckTimer = nil
local drogentruckTimerAction = nil


function showDrogentruckInfo ( player )
	if player and getElementType ( player ) == "player" then
		triggerClientEvent ( player, "infobox_start", getRootElement(), "Benutze\n/drogentruck\nzum Starten eines\nDrogentrucks", 7500, 125, 0, 0 )
	end
end
	
addEventHandler ( "onMarkerHit", drogentruckEntrance, showDrogentruckInfo )

function drogentruckEntrance_func ( player )
	if isElementWithinMarker ( player, drogentruckEntrance ) then
		if getPedOccupiedVehicle ( player ) == false then
			if isEvil ( player ) then
				if not drogentruck and not aktionlaeuft then
					if getRealTime().hour < 12 then
						--if getFactionMembersOnline ( 1 ) + getFactionMembersOnline ( 6 ) + getFactionMembersOnline ( 8 ) < 2 then
							--infobox ( player, "Nicht genug\nStaatsfraktionisten online!", 5000, 150, 0, 0 )
							--return
						--else 
							loadDrogenTruck ( player )
						--end
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nEs läuft schon\neine Aktion!", 7500, 125, 0, 0 )
					if isTimer ( drogentruckTimerAction ) then
						local timeleft = getTimerDetails ( drogentruckTimerAction )
						outputChatBox ( "Zeit bis zum nächsten Drogentruck: "..math.floor(timeleft/1000/60*100)/100 .." Minuten!", player, 155, 0, 0 )
					end
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nNur für\nböse Fraktionen!", 7500, 125, 0, 0 )
			end
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu musst dafür\nim Drogentruck\nMarker sein!", 7500, 125, 0, 0 )
	end
end
addCommandHandler ( "drogentruck", drogentruckEntrance_func)


function vehicleDestroyedDrogenTruck ()
	outputChatBox ("Der Drogentransporter wurde zerstört!", root, 155, 0,0)
	setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1)
	setTimer ( function() drogentruck = false end, 60*60*1000, 1 )
	setElementVisibleTo ( drogentruckDeliver, getRootElement(), false )
	setElementVisibleTo ( drogentruckDeliverBlip, getRootElement(), false )
	if isTimer ( drogentruckTimer ) then
		killTimer ( drogentruckTimer )
		drogentruckTimer = nil
	end
	drogentruckFraktion = nil
end

function loadDrogenTruck ( player )

	outputChatBox (	"Ein Drogentransport wurde gestartet!", getRootElement(), 125, 0, 0 )
	drogentruckRobber = player
	aktionlaeuft = true
	drogentruck = createVehicle ( 456, 2346.5441894, 2771.11230, 10.233, 0, 0, 270, "Drogentruck" )
	setVehiclePaintjob ( drogentruck, 2 )
	setVehicleColor ( drogentruck, 40, 1, 0, 0 )
	warpPedIntoVehicle ( player, drogentruck )
	outputChatBox ( "Bringe den Drogentransporter zum Ziel!", player, 0, 125, 0 )
	setElementHealth ( drogentruck, 2000 )
	outputLog ( "Drogentruck - "..getPlayerName(player).." - "..fraktionNames[vnxGetElementData ( player, "fraktion")], "aktion" )
	addEventHandler ( "onVehicleExplode", drogentruck, vehicleDestroyedDrogenTruck )
	drogentruckFraktion = vnxGetElementData ( player, "fraktion" )
	setElementVisibleTo ( drogentruckDeliver, getRootElement(), true )
	setElementVisibleTo ( drogentruckDeliverBlip, getRootElement(), true )
	
	drogentruckTimer = setTimer (
		function ( )
			destroyElement ( drogentruck )
			outputChatBox ("Der Drogentransporter wurde wegen der Zeit zerstört!", root, 155, 0,0)
			setTimer ( function() drogentruck = false end, 60*60*1000, 1 )
			setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1)
			setElementVisibleTo ( drogentruckDeliver, getRootElement(), false )
			setElementVisibleTo ( drogentruckDeliverBlip, getRootElement(), false )
		end,
	timeTillDrogentruckDisappears, 1 )
end


function drogentruckSuccessfull ( player )
	local frac = vnxGetElementData (player, "fraktion")
	local players = getElementsByType ( "player" )
	outputChatBox ("Der Drogentransporter wurde abgebeben!", getRootElement(), 0, 255, 0)
	destroyElement (drogentruck)
	setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1)
	setTimer ( function() drogentruck = false end, 60*60*1000, 1 )
	setElementVisibleTo ( drogentruckDeliver, getRootElement(), false )
	setElementVisibleTo ( drogentruckDeliverBlip, getRootElement(), false )
	if isTimer ( drogentruckTimer ) then
		killTimer ( drogentruckTimer )
		drogentruckTimer = nil
	end
	vnxSetElementData ( player, "flowerseeds", vnxGetElementData (player, "flowerseeds") + 50 )
	vnxSetElementData ( player, "drugs", vnxGetElementData (player, "drugs") + 1500 )
end

function drogentruckDeliver_func ( player, dim )
	if isElement ( player ) and getElementType ( player ) == "player" then
		if isEvil ( player ) then
			if getPedOccupiedVehicleSeat ( player ) == 0 then
				local veh = getPedOccupiedVehicle ( player )
				if veh == drogentruck then
					if getElementHealth (veh) >= 250 then
						drogentruckSuccessfull ( player ) 
					end
				end
			end
		end
	end
end
addEventHandler ( "onMarkerHit", drogentruckDeliver, drogentruckDeliver_func )
