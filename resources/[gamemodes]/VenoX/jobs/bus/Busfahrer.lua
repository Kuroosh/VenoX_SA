-- BUSJOB --
BUScolsphere = createColSphere ( -2269.4801269531, 177.03803405762,35.3125, 1 )
busicon = createPickup ( -2269.4801269531, 177.03803405762,35.3125, 3, 1274, 1)
local busblip = createBlip ( -2269.4801269531, 177.03803405762,35.3125, 58, 2, 255, 255, 0, 255, 0, 200 )
local halteStelleArray = {}
local busDriver = {}
local onBus = {}

function porttobusjob(player)
	setElementPosition(player,-2269.4801269531, 177.03803405762,35.3125)
end
--addCommandHandler("portbus", porttobusjob)

function dontStealTheBus ( player, seat, jacked )
	if seat == 0 and jacked then
		cancelEvent()
	end
end


function BusStart ( player, seat, jacked )
	if seat == 0 then
		local playerjob = vnxGetElementData ( player, "job" )
		if (playerjob == "busfahrer") then
			local Busfahrer = "Finishbus" .. getPlayerName(player)
			halteStelleArray[player] = 1
			busDriver[source] = getPlayerName ( player )
				-- Standorte der Marker/Ziele werden festgelegt.. --
			local marker = createMarker ( -1996.92578125,490.61520385742,35.015625, "checkpoint", 5, 255, 0, 0, 255, player )
			setElementID ( marker, Busfahrer )
			setElementID ( createBlip ( -1996.92578125,490.61520385742,35.015625, 0, 2, 255, 0, 0, 255, 0, 99999.0, player ), "blip" .. getPlayerName(player) )
			triggerClientEvent ( player, "infobox_start", getRootElement(), "Fahre zur\nHaltestelle!", 7500, 0, 125, 0 )
			addEventHandler( "onMarkerHit", marker, finishbus )
			addEventHandler ( "onPlayerQuit", player, quitPlayer )
			onBus[player] = true
		else
			removePedFromVehicle(player)
			triggerClientEvent ( player, "infobox_start", getRootElement(), "Du bist kein\nBusfahrer!", 7500, 125,0, 0 )
		end
	elseif busDriver[source] then
		local oldgeldsitter = vnxGetElementData(player, "money")
		vnxSetElementData(player, "money", oldgeldsitter - 25)
		
		local driver = busDriver[source]
		local oldgelddriver = vnxGetElementData(getPlayerFromName(driver), "money")
		vnxSetElementData(getPlayerFromName(driver), "money", oldgelddriver + 25)
	end
end

-- Bus ---- Bus ---- Bus --
-- Bus ---- Bus ---- Bus --
-- Bus ---- Bus ---- Bus --
-- Bus ---- Bus ---- Bus --
-- Bus ---- Bus ---- Bus --
-- Bus ---- Bus ---- Bus --
-- Bus ---- Bus ---- Bus --
-- Bus ---- Bus ---- Bus --
-- Bus ---- Bus ---- Bus --
-- Bus ---- Bus ---- Bus --
-- Bus ---- Bus ---- Bus --
-- Bus ---- Bus ---- Bus --
-- Bus ---- Bus ---- Bus --
bus1 = createVehicle ( 431, -2268.3391113281, 185.24940490723,35.1640625, 0,0,90, "BUS" )
toggleVehicleRespawn ( bus1, true )
setVehicleRespawnDelay ( bus1, FCarDestroyRespawn*1000*60 )
setVehicleIdleRespawnDelay ( bus1, FCarIdleRespawn*1000*60 )
addEventHandler ( "onVehicleStartEnter", bus1, dontStealTheBus )
addEventHandler ( "onVehicleEnter", bus1, BusStart )
bus2 = createVehicle ( 431, -2268.3391113281, 192.70036315918,35.1640625, 0,0,90, "BUS" )
toggleVehicleRespawn ( bus2, true )
setVehicleRespawnDelay ( bus2, FCarDestroyRespawn*1000*60 )
setVehicleIdleRespawnDelay ( bus2, FCarIdleRespawn*1000*60 )
addEventHandler ( "onVehicleStartEnter", bus2, dontStealTheBus )
addEventHandler ( "onVehicleEnter", bus2, BusStart )
bus3 = createVehicle ( 431, -2268.3391113281, 200.82695007324,35.1640625, 0,0,90, "BUS" )
toggleVehicleRespawn ( bus3, true )
setVehicleRespawnDelay ( bus3, FCarDestroyRespawn*1000*60 )
setVehicleIdleRespawnDelay ( bus3, FCarIdleRespawn*1000*60 )
addEventHandler ( "onVehicleStartEnter", bus3, dontStealTheBus ) 
addEventHandler ( "onVehicleEnter", bus3, BusStart )
bus4 = createVehicle ( 431, -2268.3391113281, 208.45877075195,35.1640625, 0,0,90, "BUS" )
toggleVehicleRespawn ( bus4, true )
setVehicleRespawnDelay ( bus4, FCarDestroyRespawn*1000*60 )
setVehicleIdleRespawnDelay ( bus4, FCarIdleRespawn*1000*60 )
addEventHandler ( "onVehicleStartEnter", bus4, dontStealTheBus )
addEventHandler ( "onVehicleEnter", bus4, BusStart )
bus5 = createVehicle ( 431, -2268.3391113281, 216.10036315918,35.1640625, 0,0,90, "BUS" )
toggleVehicleRespawn ( bus5, true )
setVehicleRespawnDelay ( bus5, FCarDestroyRespawn*1000*60 )
setVehicleIdleRespawnDelay ( bus5, FCarIdleRespawn*1000*60 )
addEventHandler ( "onVehicleStartEnter", bus5, dontStealTheBus )
addEventHandler ( "onVehicleEnter", bus5, BusStart )

Busse = { [bus1]=true,[bus2]=true,[bus3]=true,[bus4]=true,[bus5]=true }


-- Bus ---- Bus ---- Bus --
-- Bus ---- Bus ---- Bus --
-- Bus ---- Bus ---- Bus --
-- Bus ---- Bus ---- Bus --
-- Bus ---- Bus ---- Bus --
-- Bus ---- Bus ---- Bus --
-- Bus ---- Bus ---- Bus --
-- Bus ---- Bus ---- Bus --
-- Bus ---- Bus ---- Bus --
-- Bus ---- Bus ---- Bus --
-- Bus ---- Bus ---- Bus --
-- Bus ---- Bus ---- Bus --
-- Bus ---- Bus ---- Bus --

-- Einsteigen ---- Einsteigen ---- Einsteigen --
-- Einsteigen ---- Einsteigen ---- Einsteigen --
-- Einsteigen ---- Einsteigen ---- Einsteigen --
-- Einsteigen ---- Einsteigen ---- Einsteigen --
-- Einsteigen ---- Einsteigen ---- Einsteigen --
-- Einsteigen ---- Einsteigen ---- Einsteigen --
-- Einsteigen ---- Einsteigen ---- Einsteigen --
-- Einsteigen ---- Einsteigen ---- Einsteigen --
-- Einsteigen ---- Einsteigen ---- Einsteigen --
-- Einsteigen ---- Einsteigen ---- Einsteigen --
-- Einsteigen ---- Einsteigen ---- Einsteigen --
-- Einsteigen ---- Einsteigen ---- Einsteigen --
-- Einsteigen ---- Einsteigen ---- Einsteigen --
--[[function buseinsteigen ( player, seat, jacked )
	if seat == 0 then
		if ( Busse[source] ) then
			if not (vnxGetElementData(player, "job") == "busfahrer") then
				triggerClientEvent ( source, "infobox_start", getRootElement(), "Du bist kein\nBusfahrer!", 7500, 125,0, 0 )
				cancelEvent()
			end
		end
	end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), buseinsteigen )]]

-- Einsteigen ---- Einsteigen ---- Einsteigen --
-- Einsteigen ---- Einsteigen ---- Einsteigen --
-- Einsteigen ---- Einsteigen ---- Einsteigen --
-- Einsteigen ---- Einsteigen ---- Einsteigen --
-- Einsteigen ---- Einsteigen ---- Einsteigen --
-- Einsteigen ---- Einsteigen ---- Einsteigen --
-- Einsteigen ---- Einsteigen ---- Einsteigen --
-- Einsteigen ---- Einsteigen ---- Einsteigen --
-- Einsteigen ---- Einsteigen ---- Einsteigen --
-- Einsteigen ---- Einsteigen ---- Einsteigen --
-- Einsteigen ---- Einsteigen ---- Einsteigen --
-- Einsteigen ---- Einsteigen ---- Einsteigen --
-- Einsteigen ---- Einsteigen ---- Einsteigen --

-- JOb Start ---- JOb Start ---- JOb Start --
-- JOb Start ---- JOb Start ---- JOb Start --
-- JOb Start ---- JOb Start ---- JOb Start --
-- JOb Start ---- JOb Start ---- JOb Start --
-- JOb Start ---- JOb Start ---- JOb Start --
-- JOb Start ---- JOb Start ---- JOb Start --
-- JOb Start ---- JOb Start ---- JOb Start --
-- JOb Start ---- JOb Start ---- JOb Start --
-- JOb Start ---- JOb Start ---- JOb Start --
-- JOb Start ---- JOb Start ---- JOb Start --
-- JOb Start ---- JOb Start ---- JOb Start --
-- JOb Start ---- JOb Start ---- JOb Start --
-- JOb Start ---- JOb Start ---- JOb Start --


-- JOb Start ---- JOb Start ---- JOb Start --
-- JOb Start ---- JOb Start ---- JOb Start --
-- JOb Start ---- JOb Start ---- JOb Start --
-- JOb Start ---- JOb Start ---- JOb Start --
-- JOb Start ---- JOb Start ---- JOb Start --
-- JOb Start ---- JOb Start ---- JOb Start --
-- JOb Start ---- JOb Start ---- JOb Start --
-- JOb Start ---- JOb Start ---- JOb Start --
-- JOb Start ---- JOb Start ---- JOb Start --
-- JOb Start ---- JOb Start ---- JOb Start --
-- JOb Start ---- JOb Start ---- JOb Start --
-- JOb Start ---- JOb Start ---- JOb Start --
-- JOb Start ---- JOb Start ---- JOb Start --

function finishbus ( hitter, matchingDimension )
	if getElementType ( hitter ) == "vehicle" then
		if getElementModel(hitter) == 431 then
			local thePlayer = getVehicleOccupant ( hitter , 0 )
			if ( source == getElementByID ( "Finishbus" .. getPlayerName(thePlayer)) ) then
				if onBus[thePlayer] then
					destroyElement ( source )
					destroyElement ( getElementByID ( "blip" .. getPlayerName(thePlayer) ) )
					local Busfahrer = "Finishbus" .. getPlayerName(thePlayer)
						
					setElementFrozen ( hitter, true )
					setTimer(function()
						setElementFrozen(hitter,false)
					end, 10000, 1, hitter)
						
					if halteStelleArray[thePlayer] == 1 then
						halteStelleArray[thePlayer] = 2
						local marker = createMarker ( -1630.8857421875,723.85577392578,14.4609375, "checkpoint", 5, 255, 0, 0, 255, thePlayer )
						setElementID ( marker, Busfahrer )
						setElementID ( createBlip ( -1630.8857421875,723.85577392578,14.4609375, 0, 2, 255, 0, 0, 255, 0, 99999.0, thePlayer ), "blip" .. getPlayerName(thePlayer) )
						addEventHandler( "onMarkerHit", marker, finishbus )
						
						local fahrgast = getVehicleOccupant ( hitter , 0 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Police Department!", fahrgast,0,120,0 ) 
							triggerClientEvent ( fahrgast, "infobox_start", getRootElement(), "\n\nWarte im Bus!", 7500, 0, 125, 0 )
						end
						local fahrgast = getVehicleOccupant ( hitter , 1 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Police Department!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 2 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Police Department!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 3 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Police Department!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 4 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Police Department!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 5 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Police Department!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 6 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Police Department!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 7 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Police Department!", fahrgast,0,120,0 ) 
						end
							
					elseif halteStelleArray[thePlayer] == 2 then
						halteStelleArray[thePlayer] = 3
						local marker = createMarker ( -1874.80822,857.25457,35, "checkpoint", 5, 255, 0, 0, 255, thePlayer )
						setElementID ( marker, Busfahrer )
						setElementID ( createBlip ( -1874.80822,857.25457,35, 0, 2, 255, 0, 0, 255, 0, 99999.0, thePlayer ), "blip" .. getPlayerName(thePlayer) )
						addEventHandler( "onMarkerHit", marker, finishbus )
						
						local fahrgast = getVehicleOccupant ( hitter , 0 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Kleidungsgeschäft!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 1 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Kleidungsgeschäft!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 2 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Kleidungsgeschäft!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 3 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Kleidungsgeschäft!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 4 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Kleidungsgeschäft!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 5 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Kleidungsgeschäft!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 6 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Kleidungsgeschäft!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 7 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Kleidungsgeschäft!", fahrgast,0,120,0 ) 
						end
							
					elseif halteStelleArray[thePlayer] == 3 then
						halteStelleArray[thePlayer] = 4
						local marker = createMarker ( -2469.2465820313,813.10400390625,34.999237060547, "checkpoint", 5, 255, 0, 0, 255, thePlayer )
						setElementID ( marker, Busfahrer )
						setElementID ( createBlip ( -2469.2465820313,813.10400390625,34.999237060547, 0, 2, 255, 0, 0, 255, 0, 99999.0, thePlayer ), "blip" .. getPlayerName(thePlayer) )
						addEventHandler( "onMarkerHit", marker, finishbus )
						
						local fahrgast = getVehicleOccupant ( hitter , 0 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Supermarkt!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 1 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Supermarkt!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 2 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Supermarkt!", fahrgast,0,120,0 )  
						end
						local fahrgast = getVehicleOccupant ( hitter , 3 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Supermarkt!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 4 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Supermarkt!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 5 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Supermarkt!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 6 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Supermarkt!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 7 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Supermarkt!", fahrgast,0,120,0 ) 
						end
						
					elseif halteStelleArray[thePlayer] == 4 then
						halteStelleArray[thePlayer] = 5
						local marker = createMarker (  -2754.0988769531,352.21957397461,4.1, "checkpoint", 5, 255, 0, 0, 255, thePlayer )
						setElementID ( marker, Busfahrer )
						setElementID ( createBlip ( -2754.0988769531,352.21957397461,4.1, 0, 2, 255, 0, 0, 255, 0, 99999.0, thePlayer ), "blip" .. getPlayerName(thePlayer) )		
						addEventHandler( "onMarkerHit", marker, finishbus )	
							
						local fahrgast = getVehicleOccupant ( hitter , 0 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Rathaus San Fierro!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 1 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Rathaus San Fierro!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 2 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Rathaus San Fierro!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 3 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Rathaus San Fierro!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 4 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Rathaus San Fierro!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 5 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Rathaus San Fierro!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 6 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Rathaus San Fierro!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 7 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Rathaus San Fierro!", fahrgast,0,120,0 ) 
						end
							
					elseif halteStelleArray[thePlayer] == 5 then
						halteStelleArray[thePlayer] = 6
						local marker = createMarker (  -2640.3151855469,213.04664611816,4.1, "checkpoint", 5, 255, 0, 0, 255, thePlayer )
						setElementID ( marker, Busfahrer )
						setElementID ( createBlip ( -2640.3151855469,213.04664611816,4.1, 0, 2, 255, 0, 0, 255, 0, 99999.0, thePlayer ), "blip" .. getPlayerName(thePlayer) )
						addEventHandler( "onMarkerHit", marker, finishbus )			
							
						local fahrgast = getVehicleOccupant ( hitter , 0 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Ammunation!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 1 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Ammunation!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 2 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Ammunation!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 3 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Ammunation!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 4 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Ammunation!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 5 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Ammunation!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 6 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Ammunation!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 7 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Ammunation!", fahrgast,0,120,0 ) 
						end
							
					elseif halteStelleArray[thePlayer] == 6 then
						halteStelleArray[thePlayer] = 7
						local marker = createMarker (  -1460.6102294922,-274.72506713867,13.9, "checkpoint", 5, 255, 0, 0, 255, thePlayer )
						setElementID ( marker, Busfahrer )
						setElementID ( createBlip ( -1460.6102294922,-274.72506713867,13.9, 0, 2, 255, 0, 0, 255, 0, 99999.0, thePlayer ), "blip" .. getPlayerName(thePlayer) )
						addEventHandler( "onMarkerHit", marker, finishbus )
						
						local fahrgast = getVehicleOccupant ( hitter , 0 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: San Fierro Airport!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 1 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: San Fierro Airport!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 2 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: San Fierro Airport!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 3 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: San Fierro Airport!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 4 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: San Fierro Airport!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 5 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: San Fierro Airport!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 6 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: San Fierro Airport!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 7 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: San Fierro Airport!", fahrgast,0,120,0 ) 
						end
														
					elseif halteStelleArray[thePlayer] == 7 then
						halteStelleArray[thePlayer] = 8
						local marker = createMarker (  -2002.3277587891,149.01168823242,27.5, "checkpoint", 5, 255, 0, 0, 255, thePlayer )
						setElementID ( marker, Busfahrer )
						setElementID ( createBlip ( -2002.3277587891,149.01168823242,27.5, 0, 2, 255, 0, 0, 255, 0, 99999.0, thePlayer ), "blip" .. getPlayerName(thePlayer) )
						addEventHandler( "onMarkerHit", marker, finishbus )
						
						local fahrgast = getVehicleOccupant ( hitter , 0 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Bahnhof San Fierro!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 1 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Bahnhof San Fierro!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 2 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Bahnhof San Fierro!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 3 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Bahnhof San Fierro!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 4 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Bahnhof San Fierro!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 5 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Bahnhof San Fierro!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 6 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Bahnhof San Fierro!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 7 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: Bahnhof San Fierro!", fahrgast,0,120,0 ) 
						end
								
					elseif halteStelleArray[thePlayer] == 8 then
						halteStelleArray[thePlayer] = 1
						local marker = createMarker ( -1996.92578125,490.61520385742,35.015625, "checkpoint", 5, 255, 0, 0, 255, thePlayer )
						setElementID ( marker, Busfahrer )
						setElementID ( createBlip ( -1996.92578125,490.61520385742,35.015625, 0, 2, 255, 0, 0, 255, 0, 99999.0, thePlayer ), "blip" .. getPlayerName(thePlayer) )
						addEventHandler( "onMarkerHit", marker, finishbus )
						
						local fahrgast = getVehicleOccupant ( hitter , 0 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: SAN News!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 1 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: SAN News!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 2 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: SAN News!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 3 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: SAN News!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 4 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: SAN News!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 5 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: SAN News!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 6 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: SAN News!", fahrgast,0,120,0 ) 
						end
						local fahrgast = getVehicleOccupant ( hitter , 7 )
						if fahrgast then
							outputChatBox ( "Nächster Halt: SAN News!", fahrgast,0,120,0 ) 
						end
					end
					local pmoney = vnxGetElementData (thePlayer, "money" )
					vnxSetElementData ( thePlayer, "money", pmoney + 70 )
					givePlayerXP( player, 25 )
				end
			end
		end
	end
end


function BUSjobhelp ( hitPlayer, matchingDimension )
	if hitPlayer and getElementType ( hitPlayer) == "player" then
		if isPedInVehicle(hitPlayer) then return end
		local playerjob = vnxGetElementData ( hitPlayer, "job" )
		if ( playerjob == "busfahrer" ) then
			triggerClientEvent ( hitPlayer, "infobox_start", getRootElement(), "Steige in einen\nBus ein.", 7500, 200, 200, 0 )
		elseif ( playerjob == "none" ) then
			triggerClientEvent ( hitPlayer, "infobox_start", getRootElement(), "Tippe /job um\nals Busfahrer\nzu arbeiten.", 7500, 200, 200, 0 )
		else
			triggerClientEvent ( hitPlayer, "infobox_start", getRootElement(), "Du hast bereits\neinen Job. Tippe\n/quitjob, um ihn\nzu kündigen.", 7500, 200, 200, 0 )
			--outputChatBox ( "Du hast bereits einen anderen Job!", hitPlayer,120,0,0 )
			--outputChatBox ( "Tippe zunaechst /quitjob ein!", hitPlayer,120,0,0 )
		end
	end
end

addEventHandler ( "onColShapeHit", BUScolsphere, BUSjobhelp )

function Busaussteigen ( thePlayer,seat )
	if seat == 0 and source and getElementType ( source ) == "vehicle" then
		if getElementModel(source) == 431 then
			if ( onBus[thePlayer] ) then
				fadeCamera( thePlayer, false, 1 )
				local fahrgast = getVehicleOccupant ( source , 0 )
				if fahrgast then
					removePedFromVehicle ( fahrgast )
				end
				local fahrgast = getVehicleOccupant ( source , 1 )
				if fahrgast then
					removePedFromVehicle ( fahrgast )
				end
				local fahrgast = getVehicleOccupant ( source , 2 )
				if fahrgast then
					removePedFromVehicle ( fahrgast )
				end
				local fahrgast = getVehicleOccupant ( source , 3 )
				if fahrgast then
					removePedFromVehicle ( fahrgast )
				end
				local fahrgast = getVehicleOccupant ( source , 4 )
				if fahrgast then
					removePedFromVehicle ( fahrgast )
				end
				local fahrgast = getVehicleOccupant ( source , 5 )
				if fahrgast then
					removePedFromVehicle ( fahrgast )
				end
				local fahrgast = getVehicleOccupant ( source , 6 )
				if fahrgast then
					removePedFromVehicle ( fahrgast )
				end
				local fahrgast = getVehicleOccupant ( source , 7 )
				if fahrgast then
					removePedFromVehicle ( fahrgast )
				end
				
				respawnVehicle ( source )
				destroyElement ( getElementByID ( "blip" .. getPlayerName(thePlayer ) ) )
				destroyElement ( getElementByID ( "Finishbus" .. getPlayerName(thePlayer)) )
				removeEventHandler ( "onPlayerQuit", thePlayer, quitPlayer )
				onBus[thePlayer] = nil
				setTimer( fadeCamera, 1500, 1, thePlayer, true, 1 )
				setTimer(function(thePlayer)
					removePedFromVehicle ( thePlayer )
					setElementPosition(thePlayer, -2269.4801269531, 177.03803405762, 35.3125)
					setElementFrozen ( thePlayer, true )
					setTimer(function(thePlayer)
						setElementFrozen(thePlayer,false)
					end, 1000, 1,thePlayer)
						fadeCamera( thePlayer, false, 1 )
				end, 1400, 1, thePlayer)
				setCameraTarget(thePlayer,thePlayer)
				triggerClientEvent ( thePlayer, "infobox_start", getRootElement(), "Du hast den\nJob beendet!", 7500, 125,0, 0 )
				halteStelleArray[thePlayer] = nil
			end
		end
	end
end
addEventHandler ( "onVehicleStartExit", bus1, Busaussteigen )
addEventHandler ( "onVehicleStartExit", bus2, Busaussteigen )
addEventHandler ( "onVehicleStartExit", bus3, Busaussteigen )
addEventHandler ( "onVehicleStartExit", bus4, Busaussteigen )
addEventHandler ( "onVehicleStartExit", bus5, Busaussteigen )


function quitPlayer ( quitType )
	if isPedInVehicle(source) then
		local veh = getPedOccupiedVehicle(source)
		if veh and getElementModel(veh) == "431" and getPedOccupiedVehicleSeat(source) == 0 then
			respawnVehicle ( veh )
			if isElement(getElementByID ( "blip" .. getPlayerName(source ) )) then
				destroyElement ( getElementByID ( "blip" .. getPlayerName(source ) ) )
			end
			if isElement(getElementByID ( "Finishbus" .. getPlayerName(source))) then
				destroyElement ( getElementByID ( "Finishbus" .. getPlayerName(source)) )
			end
			onBus[source] = nil
			halteStelleArray[source] = nil
			setElementFrozen ( veh, true )
			setTimer(function()
				setElementFrozen ( veh, false )
			end, 1000, 1,veh)
		end
	end
end


