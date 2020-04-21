--[[objekte = {}
	--Vorne
objekte[1] = createObject(996, -1749.3, 943.7, 24.7)
objekte[2] = createObject(996, -1767.9, 943.7, 24.7)
objekte[3] = createObject(994, -1758.5, 943.7, 24)
objekte[4] = createObject(997,  -1781.1, 943.7, 24)
objekte[5] = createObject(997,  -1730.3, 943.7, 24)
	-- Rechts
objekte[6] = createObject(996, -1726.8, 944.4, 24.7, 0, 0, 90)
objekte[7] = createObject(996, -1726.8, 954.4, 24.7, 0, 0, 90)
	-- Links
objekte[8] = createObject(996, -1781.6, 944.4, 24.7, 0, 0, 90)
objekte[9] = createObject(996, -1781.6, 954.4, 24.7, 0, 0, 90)


vehicles = {}
	-- MULES
vehicles[1] = createVehicle(414, -1738, 959, 25, 0, 0, 180, "Well Stacked Pizza")
vehicles[2] = createVehicle(414, -1742, 959, 25, 0, 0, 180, "Well Stacked Pizza")
vehicles[3] = createVehicle(414, -1746, 959, 25, 0, 0, 180, "Well Stacked Pizza")
	-- RUMPO
vehicles[4] = createVehicle(440, -1750, 959, 25, 0, 0, 180, "Well Stacked Pizza")
vehicles[5] = createVehicle(440, -1754, 959, 25, 0, 0, 180, "Well Stacked Pizza")
vehicles[6] = createVehicle(440, -1758, 959, 25, 0, 0, 180, "Well Stacked Pizza")
	-- PIZZABOY
vehicles[7] = createVehicle(448, -1761, 959, 24.5, 0, 0, 180, "Well Stacked Pizza")
vehicles[8] = createVehicle(448, -1763, 959, 24.5, 0, 0, 180, "Well Stacked Pizza")
vehicles[9] = createVehicle(448, -1765, 959, 24.5, 0, 0, 180, "Well Stacked Pizza")
vehicles[10] = createVehicle(448, -1767, 959, 24.5, 0, 0, 180, "Well Stacked Pizza")
vehicles[11] = createVehicle(448, -1769, 959, 24.5, 0, 0, 180, "Well Stacked Pizza")
vehicles[12] = createVehicle(448, -1771, 959, 24.5, 0, 0, 180, "Well Stacked Pizza")

for i=1, #vehicles do		
	vehicle = vehicles[i]
	setVehicleColor(vehicle, 255, 0, 0)
end

local pizzaveh = { [448]=true,[440]=true,[414]=true }
function entercar( player, seat, jacked )
	if seat == 0 and  ( pizzaveh[getElementModel(source)] ) and  vnxGetElementData(player,"job") ~= "pizza" then
		if not jacked then
			cancelEvent ()
			triggerClientEvent ( player, "infobox_start", getRootElement(), "Du bist kein Pizzalieferant!", 5000, 125, 0, 0 )
		end
	else
		start(player)
		setElementFrozen ( source, false )
	end
end 
addEventHandler ( "onVehicleStartEnter", getRootElement(),entercar) 
pickup = createPickup( -1752.900390625 , 945.2314453125 , 24.8828125,3,1239,0,0)

function pickuphit(player)
	outputChatBox("Benutze /pizzajob um als Pizza Lieferant zu Arbeiten!",player,255,255,0)
end
addEventHandler("onPickupHit",pickup,pickuphit)

function job(player)
local x,y,z = getElementPosition(player)
	if getDistanceBetweenPoints3D(x,y,z,-1752.900390625 , 945.2314453125 , 24.8828125) <= 10 then
		if vnxGetElementData ( player, "job" ) == "pizza" then
			triggerClientEvent ( player, "infobox_start", getRootElement(), "Du bist bereits Pizzalieferant!", 5000, 125, 0, 0 )
		else
			vnxSetElementData (player, "job", "pizza")
			triggerClientEvent ( player, "infobox_start", getRootElement(), "Du bist nun Pizzalieferant!", 5000, 125, 0, 0 )
		end
	else
		outputChatBox("Du bist zu weit weg!",player,255,0,0)
	end
end
addCommandHandler("pizzajob" , job)


function abliefern1 (hitelement)
	if seat == 0 and  ( pizzaveh[getElementModel(source)] ) and  vnxGetElementData(hitelement,"job") == "pizza" then
		if zahl == 1 then
			destroyElement(marker1)
			destroyElement(blip1)
		elseif zahl == 2 then
			destroyElement(marker2)
			destroyElement(blip2)
		elseif zahl == 3 then
			destroyElement(marker3)
			destroyElement(blip3)
		end
	outputChatBox("Du hast die Pizza Abgeliefert!",hitelement,255,255,0)
	givePlayerSaveMoney ( hitelement, 5000 )
	setElementPosition(hitelement,-1752.900390625 , 945.2314453125 , 24.8828125)
	setElementDimension(hitelement,0)
	end
end

function abliefern2 (hitelement)
	if seat == 0 and  ( pizzaveh[getElementModel(source)] ) and  vnxGetElementData(hitelement,"job") == "pizza" then
	destroyElement(marker2)
	destroyElement(blip2)
	outputChatBox("Du hast die Pizza Abgeliefert!",hitelement,255,255,0)
	givePlayerSaveMoney ( hitelement, 5000 )
	setElementPosition(hitelement,-1752.900390625 , 945.2314453125 , 24.8828125)
	setElementDimension(hitelement,0)
	end
end

function abliefern3 (hitelement)
	if seat == 0 and  ( pizzaveh[getElementModel(source)] ) and  vnxGetElementData(hitelement,"job") == "pizza" then
	destroyElement(marker3)
	destroyElement(blip3)
	outputChatBox("Du hast die Pizza Abgeliefert!",hitelement,255,255,0)
	givePlayerSaveMoney ( hitelement, 5000 )
	setElementPosition(hitelement,-1752.900390625 , 945.2314453125 , 24.8828125)
	setElementDimension(hitelement,0)
	end
end


function start()
zahl = math.random(1,3)
outputChatBox("Du hast den Job gestartet!",player,255,255,0)
outputChatBox("Fahre zum Waypoint und bringe die Pizza in denn Marker!",player,255,255,0)
	if zahl == 1 then
		marker1 = createMarker(-1710.5,399,6.1999998092651, "cylinder", 2, 255,255,0,255)
		blip1 = createBlip(-1710.5,399,6.1999998092651, 41, 0, 0, 0, 255, player )
	elseif zahl == 2 then
		marker2 = createMarker(-2033.3000488281,148.5,28.299999237061, "cylinder", 2, 255,255,0,255)
		blip2 = createBlip(-2033.3000488281,148.5,28.299999237061, 41, 0, 0, 0, 255, player )
	elseif zahl == 3 then
		marker3 = createMarker(-2220.8000488281,100.40000152588,34.400001525879, "cylinder", 2, 255,255,0,255)
		blip3 = createBlip(-2220.8000488281,100.40000152588,34.400001525879, 41, 0, 0, 0, 255, player )
	end

	if zahl == 1 then
		addEventHandler( "onMarkerHit", marker1, abliefern1 )
	elseif zahl == 2 then
		addEventHandler( "onMarkerHit", marker2, abliefern2 )
	elseif zahl == 3 then
		addEventHandler( "onMarkerHit", marker3, abliefern3 )
	end
end--]]



