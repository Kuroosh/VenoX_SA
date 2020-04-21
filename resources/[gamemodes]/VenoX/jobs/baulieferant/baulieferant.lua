--[[baulieferantblip = createBlip ( -1706.1116943359, 13.159648895264, 3.2039132118225, 50, 1, 255, 0, 0, 255, 0, 99999 )
setElementVisibleTo ( baulieferantblip, getRootElement(), false )
-- baulieferantJOB --
baulieferantcolsphere = createColSphere ( -2455.3596191406, 2253.8559570313,4.98, 1 )
createPickup ( -2455.3596191406, 2253.8559570313,4.98, 3, 1239, 1)
-- baulieferant ---- baulieferant ---- baulieferant --
-- baulieferant ---- baulieferant ---- baulieferant --
-- baulieferant ---- baulieferant ---- baulieferant --
-- baulieferant ---- baulieferant ---- baulieferant --
-- baulieferant ---- baulieferant ---- baulieferant --
-- baulieferant ---- baulieferant ---- baulieferant --
-- baulieferant ---- baulieferant ---- baulieferant --
-- baulieferant ---- baulieferant ---- baulieferant --
-- baulieferant ---- baulieferant ---- baulieferant --
-- baulieferant ---- baulieferant ---- baulieferant --
-- baulieferant ---- baulieferant ---- baulieferant --
-- baulieferant ---- baulieferant ---- baulieferant --
-- baulieferant ---- baulieferant ---- baulieferant --
baulieferant1 = createVehicle ( 456, -2443.8000488281, 2226.6000976563, 5.0999999046326, 0, 0, 0, "VenoX" )
toggleVehicleRespawn ( baulieferant1, true )
setVehicleRespawnDelay ( baulieferant1, FCarDestroyRespawn*1000*60 )
setVehicleIdleRespawnDelay ( baulieferant1, FCarIdleRespawn*1000*60 )
baulieferant2 = createVehicle ( 456, -2449.8000488281, 2226.8000488281, 5.0999999046326, 0, 0, 0, "VenoX" )
toggleVehicleRespawn ( baulieferant2, true )
setVehicleRespawnDelay ( baulieferant2, FCarDestroyRespawn*1000*60 )
setVehicleIdleRespawnDelay ( baulieferant2, FCarIdleRespawn*1000*60 )
baulieferant3 = createVehicle ( 456, -2455.8000488281, 2226.5, 5.0999999046326, 0, 0, 0, "VenoX" )
toggleVehicleRespawn ( baulieferant3, true )
setVehicleRespawnDelay ( baulieferant3, FCarDestroyRespawn*1000*60 )
setVehicleIdleRespawnDelay ( baulieferant3, FCarIdleRespawn*1000*60 )
baulieferant4 = createVehicle ( 456, -2461.8000488281, 2226.6999511719, 5.0999999046326, 0, 0, 0, "VenoX" )
toggleVehicleRespawn ( baulieferant4, true )
setVehicleRespawnDelay ( baulieferant4, FCarDestroyRespawn*1000*60 )
setVehicleIdleRespawnDelay ( baulieferant4, FCarIdleRespawn*1000*60 )
baulieferant5 = createVehicle ( 456, -2467.6000976563, 2226.3999023438, 5.0999999046326, 0, 0, 0, "VenoX" )
toggleVehicleRespawn ( baulieferant5, true )
setVehicleRespawnDelay ( baulieferant5, FCarDestroyRespawn*1000*60 )
setVehicleIdleRespawnDelay ( baulieferant5, FCarIdleRespawn*1000*60 )
baulieferant6 = createVehicle ( 456, -2473.6000976563, 2226.6000976563, 5.0999999046326, 0, 0, 0, "VenoX" )
toggleVehicleRespawn ( baulieferant6, true )
setVehicleRespawnDelay ( baulieferant6, FCarDestroyRespawn*1000*60 )
setVehicleIdleRespawnDelay ( baulieferant6, FCarIdleRespawn*1000*60 )
baulieferant7 = createVehicle ( 456, -2479.8000488281, 2226.8000488281, 5.0999999046326, 0, 0, 0, "VenoX" )
toggleVehicleRespawn ( baulieferant7, true )
setVehicleRespawnDelay ( baulieferant7, FCarDestroyRespawn*1000*60 )
setVehicleIdleRespawnDelay ( baulieferant7, FCarIdleRespawn*1000*60 )


Baulieferant = { [baulieferant1]=true,[baulieferant2]=true,[baulieferant3]=true,[baulieferant4]=true,[baulieferant5]=true,[baulieferant6]=true,[baulieferant7]=true }

function baulieferanteinsteigen ( player, seat, jacked )
if seat == 0 then
local playerjob = vnxGetElementData ( player, "job" )
		if ( Baulieferant[source] ) then
		if playerjob == "baulieferant" then return end
			cancelEvent()
    end
	end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), baulieferanteinsteigen ) 

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
function BaulieferantStart ( theVehicle,seat )
if seat == 0 then
local playerjob = vnxGetElementData ( source, "job" )
		if ( Baulieferant[theVehicle] ) and not playerjob == "baulieferant" then
			cancelEvent()
		triggerClientEvent ( source, "infobox_start", getRootElement(), "Du bist kein\nBaulieferant!", 7500, 125,0, 0 )
		return end
		if ( Baulieferant[theVehicle] ) and playerjob == "baulieferant" then
			local Baulieferantfahrer = "Finishbaulieferant" .. getPlayerName(source)
			setElementData ( source, "BaulieferantID", getPlayerName(source) )
			setElementData ( source, "Baustelle", 1 )

				-- Standorte der Marker/Ziele werden festgelegt.. --
				setElementID ( createMarker ( -2342.1000976563, -76.199996948242, 35.299999237061, "checkpoint", 5, 255, 0, 0, 255, source ), Baulieferantfahrer )
				setElementID ( createBlip ( -2342.1000976563, -76.199996948242, 35.299999237061, 0, 2, 255, 0, 0, 255, 0, 99999.0, source ), "blip" .. getPlayerName(source) )
				
		triggerClientEvent ( source, "infobox_start", getRootElement(), "Fahre zur\nBaustelle!", 7500, 0, 125, 0 )
		setElementData ( source, "onBaulieferant", 1)
	end
	end
end
addEventHandler ( "onPlayerVehicleEnter", getRootElement(), BaulieferantStart ) 

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

function finishbaulieferant ( hitter, matchingDimension )
if hitter then
if getElementModel(hitter) == 456 then
local thePlayer = getVehicleOccupant ( hitter , 0 )
if ( source == getElementByID ( "Finishbaulieferant" .. getPlayerName(thePlayer)) ) then
	if getElementData ( thePlayer, "onBaulieferant" ) == 1 then
		destroyElement ( source )
		destroyElement ( getElementByID ( "blip" .. getPlayerName(thePlayer) ) )
			local Baulieferantfahrer = "Finishbaulieferant" .. getPlayerName(thePlayer)
			setElementData ( thePlayer, "BaulieferantID", getPlayerName(thePlayer) )
			
			setElementFrozen ( hitter, true )
			setTimer(function()setElementFrozen(hitter,false)end, 10000, 1,hitter)
			
			
			if getElementData ( thePlayer, "Baustelle" ) == 1 then setElementData ( thePlayer, "Baustelle", 3 ) end
			
			if getElementData ( thePlayer, "Baustelle" ) == 1 then
			
				-- setElementData ( thePlayer, "Baustelle", 2 )
				-- setElementID ( createMarker ( -2117.3000488281, 300.5, 34.799999237061, "checkpoint", 5, 255, 0, 0, 255, thePlayer ), Baulieferantfahrer )
				-- setElementID ( createBlip ( -2117.3000488281, 300.5, 34.799999237061, 0, 2, 255, 0, 0, 255, 0, 99999.0, thePlayer ), "blip" .. getPlayerName(thePlayer) )
				
				-- local fahrgast = getVehicleOccupant ( hitter , 0 )
				-- if fahrgast then
				-- outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
			-- triggerClientEvent ( fahrgast, "infobox_start", getRootElement(), "\n\nWarte im Lieferwagen!", 7500, 0, 125, 0 )
				-- end
				-- local fahrgast = getVehicleOccupant ( hitter , 1 )
				-- if fahrgast then
				-- outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				-- end
				-- local fahrgast = getVehicleOccupant ( hitter , 2 )
				-- if fahrgast then
				-- outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				-- end
				-- local fahrgast = getVehicleOccupant ( hitter , 3 )
				-- if fahrgast then
				-- outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				-- end
				-- local fahrgast = getVehicleOccupant ( hitter , 4 )
				-- if fahrgast then
				-- outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				-- end
				-- local fahrgast = getVehicleOccupant ( hitter , 5 )
				-- if fahrgast then
				-- outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				-- end
				-- local fahrgast = getVehicleOccupant ( hitter , 6 )
				-- if fahrgast then
				-- outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				-- end
				-- local fahrgast = getVehicleOccupant ( hitter , 7 )
				-- if fahrgast then
				-- outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				-- end
				
			elseif getElementData ( thePlayer, "Baustelle" ) == 2 then
				setElementData ( thePlayer, "Baustelle", 3 )
				setElementID ( createMarker ( -2342.1000976563, -76.199996948242, 35.299999237061, "checkpoint", 5, 255, 0, 0, 255, thePlayer ), Baulieferantfahrer )
				setElementID ( createBlip ( -2342.1000976563, -76.199996948242, 35.299999237061, 0, 2, 255, 0, 0, 255, 0, 99999.0, thePlayer ), "blip" .. getPlayerName(thePlayer) )
				
								
				local fahrgast = getVehicleOccupant ( hitter , 0 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 1 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 2 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 3 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 4 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 5 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 6 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 7 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				
			elseif getElementData ( thePlayer, "Baustelle" ) == 3 then
				setElementData ( thePlayer, "Baustelle", 4 )
				setElementID ( createMarker ( 1260.5999755859, -1275.5, 13.5, "checkpoint", 5, 255, 0, 0, 255, thePlayer ), Baulieferantfahrer )
				setElementID ( createBlip ( 1260.5999755859, -1275.5, 13.5, 0, 2, 255, 0, 0, 255, 0, 99999.0, thePlayer ), "blip" .. getPlayerName(thePlayer) )
				
								
				local fahrgast = getVehicleOccupant ( hitter , 0 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 1 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 2 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 )  
				end
				local fahrgast = getVehicleOccupant ( hitter , 3 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 4 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 5 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 6 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 7 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				
			elseif getElementData ( thePlayer, "Baustelle" ) == 4 then
				setElementData ( thePlayer, "Baustelle", 5 )
				setElementID ( createMarker (  2706.6000976563, 825.29998779297, 10.300000190735, "checkpoint", 5, 255, 0, 0, 255, thePlayer ), Baulieferantfahrer )
				setElementID ( createBlip ( 2706.6000976563, 825.29998779297, 10.300000190735, 0, 2, 255, 0, 0, 255, 0, 99999.0, thePlayer ), "blip" .. getPlayerName(thePlayer) )
				
								
				local fahrgast = getVehicleOccupant ( hitter , 0 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 1 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 2 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 3 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 4 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 5 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 6 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 7 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				
				
			elseif getElementData ( thePlayer, "Baustelle" ) == 5 then
				setElementData ( thePlayer, "Baustelle", 6 )
				setElementID ( createMarker (  2486.3999023438, 1870.5999755859, 10.39999961853, "checkpoint", 5, 255, 0, 0, 255, thePlayer ), Baulieferantfahrer )
				setElementID ( createBlip ( 2486.3999023438, 1870.5999755859, 10.39999961853, 0, 2, 255, 0, 0, 255, 0, 99999.0, thePlayer ), "blip" .. getPlayerName(thePlayer) )
				
								
				local fahrgast = getVehicleOccupant ( hitter , 0 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 1 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 2 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 3 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 4 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 5 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 6 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 7 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				
				
			elseif getElementData ( thePlayer, "Baustelle" ) == 6 then
				setElementData ( thePlayer, "Baustelle", 2 )
				setElementID ( createMarker (  -2381.3999023438, 2350.6000976563, 4.8000001907349, "checkpoint", 5, 255, 0, 0, 255, thePlayer ), Baulieferantfahrer )
				setElementID ( createBlip ( -2381.3999023438, 2350.6000976563, 4.8000001907349, 0, 2, 255, 0, 0, 255, 0, 99999.0, thePlayer ), "blip" .. getPlayerName(thePlayer) )
				
								
				local fahrgast = getVehicleOccupant ( hitter , 0 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 1 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 2 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 3 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 4 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 5 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 6 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				local fahrgast = getVehicleOccupant ( hitter , 7 )
				if fahrgast then
				outputChatBox ( "Fahre zur nächsten Baustelle!", fahrgast,0,120,0 ) 
				end
				
				
				
			end
			local money = vnxGetElementData (thePlayer, "money" )
			vnxSetElementData ( thePlayer, "money", vnxGetElementData ( thePlayer, "money" ) + 650 )
		givePlayerMoney ( thePlayer, 650 )
	end
end
end
end
end
addEventHandler( "onMarkerHit", getRootElement(), finishbaulieferant )

function baulieferantjobhelp ( hitPlayer, matchingDimension )
if isPedInVehicle(hitPlayer) then return end
local playerjob = vnxGetElementData ( hitPlayer, "job" )
	if ( playerjob == "baulieferant" ) then
		triggerClientEvent ( hitPlayer, "infobox_start", getRootElement(), "Steige in einen\nLieferwagen ein!", 7500, 200, 200, 0 )
	elseif ( playerjob == "none" ) then
		triggerClientEvent ( hitPlayer, "infobox_start", getRootElement(), "Tippe /job um\nals Baulieferant\nzu arbeiten!", 7500, 200, 200, 0 )
	else
		outputChatBox ( "Du hast bereits einen anderen Job!", hitPlayer,120,0,0 )
		outputChatBox ( "Tippe /quitjob ein!", hitPlayer,120,0,0 )
	end
end

addEventHandler ( "onColShapeHit", baulieferantcolsphere, baulieferantjobhelp )

function Baulieferantaussteigen ( thePlayer,seat )
if seat == 0 then
if getElementModel(source) == 456 then
	if ( getElementData ( thePlayer, "onBaulieferant" ) ~= false ) then
		if ( getElementData ( thePlayer, "onBaulieferant" ) == 1 ) then
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
		destroyElement ( getElementByID ( "Finishbaulieferant" .. getPlayerName(thePlayer)) )
		setElementData ( thePlayer, "onBaulieferant", 0 )
  setTimer( fadeCamera, 1500, 1, thePlayer, true, 1 )
   setTimer(function()
   removePedFromVehicle ( thePlayer )
   -- setElementFrozen ( source, true )
			setTimer(function()
			-- setElementFrozen(source,false)
			end, 1000, 1,source)
		 fadeCamera( thePlayer, false, 1 )
   end, 1400, 1)
		setCameraTarget(thePlayer,thePlayer)
			triggerClientEvent ( thePlayer, "infobox_start", getRootElement(), "Du hast den\nJob beendet!!!", 7500, 125,0, 0 )
		end
	end
end
end
end
addEventHandler ( "onVehicleStartExit", getRootElement(), Baulieferantaussteigen )


addEventHandler ( "onPlayerQuit", getRootElement(), function ( )
	if getElementData ( source, "onBaulieferant" ) and getElementData ( source, "onBaulieferant" ) ~= 0 then
		if isPedInVehicle(source) then
			local veh = getPedOccupiedVehicle(source)
			respawnVehicle ( veh )
			if isElement ( getElementByID ( "blip" .. getPlayerName(source ) ) ) then
				destroyElement ( getElementByID ( "blip" .. getPlayerName(source ) ) )
			end
			if isElement ( getElementByID ( "Finishbaulieferant" .. getPlayerName(source)) ) then
				destroyElement ( getElementByID ( "Finishbaulieferant" .. getPlayerName(source)) )
			end
			setElementData ( source, "onBaulieferant", 0 )
			setElementFrozen ( veh, true )
			setTimer(function()
			   setElementFrozen ( veh, false )
			end, 1000, 1 )
		end
	end
end )

]]