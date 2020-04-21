---------------------------
---Uhrheberrecht by Iven---
---------------------------

local gPickup = createPickup(-1589.21911,700.1081,-5.40625,3,1239,50,0)
local gOnDrive = 0 
local gMarker = nil


local function gOnDriveRestart ()
    gOnDrive = 0
end


local function onGeldtruckExplode ( )
	outputChatBox("Der Geldtruck wurde zerstört!", getRootElement(),0,150,0)
	destroyElement(gBlip1)
	destroyElement(gMarker)
	setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1)
	killTimer ( geldtruckTimer )
	setTimer(gOnDriveRestart,60*1000*60,1)
end


local function gFinish (player)

	if player and isElement ( player) and getElementType(player) == "player" then
		local veh = getPedOccupiedVehicle ( player ) 
		local veh_seat = getPedOccupiedVehicleSeat ( player )
		if veh then 
			if veh_seat == 0 then
				if veh == gTruck then  
					outputChatBox("Das Fahrzeug wurde abgegeben, jeder Staatsfraktionist in der Nähe kriegt 15.000€",player, 0, 125, 0)
					outputChatBox("Der Geldtruck wurde abgegeben!",getRootElement(), 0, 125, 0)	
					destroyElement(gTruck)
					gTruck = nil
					destroyElement(gBlip1)
					destroyElement(gMarker)
					setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1)
					killTimer ( geldtruckTimer )
					local x, y, z = getElementPosition ( player )
					local col = createColSphere ( x, y, z, 50 )
					local players = getElementsWithinColShape ( col, "player" )
					for i=1, #players do
						if isOnDuty ( players[i] ) then
							vnxSetElementData ( players[i], "money", vnxGetElementData ( players[i], "money" ) + 15000 )
						end
					end
					setTimer(gOnDriveRestart,60*1000*60,1)
				end
			end 
		end		
	end
end


local function gStart (player)
	if isStateFaction (player) and isOnStateDuty (player) then
		local x,y,z = getElementPosition(player)
		local x1,y1,z1 = getElementPosition(gPickup)
		if getDistanceBetweenPoints3D(x1,y1,z1,x,y,z) < 25 then
			if gOnDrive == 0 then
				if not aktionlaeuft then
					local time = getRealTime()
					local hours = time.hour
					if hours >= 12 then
						gTruck = createVehicle(428,-1590.1624,707.9468,-5.2421,0,0,270,"GELDTRUCK")
						setVehicleColor(gTruck,0,0,0,0,0,0,0,0,0,0,0,0)
						gBlip1 = createBlip(1560.2,-1694.2,4.896,19, 2, 255, 0, 0, 255, 0, 99999.0, getRootElement())
						gMarker = createMarker(1560.2,-1694.2,4.896,"checkpoint", 3, 0, 255, 0, 150)
						addEventHandler("onMarkerHit",gMarker,gFinish)
						addEventHandler("onVehicleExplode",gTruck,onGeldtruckExplode)
						gOnDrive = 1 
						aktionlaeuft = true
						outputLog ( "Geldtruck - "..getPlayerName(player).." - "..fraktionNames[vnxGetElementData ( player, "fraktion")], "aktion" )
						outputChatBox("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",player,0,150,0)
						outputChatBox("Du hast einen Geldtruck gestartet!",player,0,150,0)
						outputChatBox("Fahre ihn nun in den Marker neben dem LSPD (Die rote Fahne)!",player,0,150,0)
						outputChatBox("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~",player,0,150,0)
						outputChatBox("[ACHTUNG] Ein Geldtruck wurde gestartet",getRootElement(),125,0,0)
						warpPedIntoVehicle(player,gTruck,0)
						geldtruckTimer = setTimer ( function() 
							destroyElement ( gTruck )
							destroyElement ( gBlip1 )
							destroyElement ( gMarker )
							setTimer(gOnDriveRestart,60*1000*60,1)
							setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1)
							outputChatBox("Der Geldtruck wurde wegen der Zeit zerstört!", getRootElement(),0,150,0)
						end, 20*60*1000, 1 )
					else
						triggerClientEvent (player, "infobox_start",getRootElement(), "Geht nur\nzwischen 12\nund 0 Uhr.",7500, 200, 200, 0)
					end
				else
					outputChatBox("Es fand vor kurzem schon eine Aktion statt!",player,150,0,0)
				end
			else
				outputChatBox("Ein Geldtruck kann nur jede Stunde gestartet werden!",player,150,0,0)
			end
		else
			outputChatBox("Du bist zuweit entfernt",player,150,0,0)	
		end			
	else
		triggerClientEvent (player, "infobox_start",getRootElement(), "Du bist \nin keiner\nStaatsfraktion oder\nnicht im Dienst!",7500, 200, 200, 0)
	end
end
addCommandHandler("geldtruck",gStart)


local function gPickupHit (player)
    triggerClientEvent ( player, "infobox_start", getRootElement(), "Tippe \n/geldtruck um\neinen Geldtruck zu\nbeladen!", 7500, 200, 200, 0 )
end
addEventHandler("onPickupHit",gPickup,gPickupHit)




