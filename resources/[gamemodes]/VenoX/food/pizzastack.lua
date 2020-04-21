local foodDisplay = {}
local foodDisplayText = {}

pizzaEntranceSFCenter = createMarker ( -1808.3822021484, 945.3701171875, 23.848808288574, "cylinder", 1.2, getColorFromString ( "#FF000099" ) )
pizzaEntranceSFCenterExit = createMarker ( 372.29702758789, -133.29911804199, 1000.4741210938, "cylinder", 1.2, getColorFromString ( "#FF000099" ) )
setElementInterior ( pizzaEntranceSFCenterExit, 5 )
setElementDimension ( pizzaEntranceSFCenterExit, 1 )
pizzaEntrancePier69 = createMarker ( -1721.3131103516, 1359.7663574219, 6.1736726760864, "cylinder", 1.2, getColorFromString ( "#FF000099" ) )
pizzaEntrancePier69Exit = createMarker ( 372.29702758789, -133.29911804199, 1000.4741210938, "cylinder", 1.2, getColorFromString ( "#FF000099" ) )
setElementInterior ( pizzaEntrancePier69Exit, 5 )
setElementDimension ( pizzaEntrancePier69Exit, 2 )
pizzaEntranceSFCenterBlip = createBlip ( -1808.3822021484, 945.3701171875, 23.848808288574, 29, 2, 0, 0, 0, 255, 0, 200 )
pizzaEntrancePier69Blip = createBlip ( -1721.3131103516, 1359.7663574219, 6.1736726760864, 29, 2, 0, 0, 0, 255, 0, 200 )

pizzaBuySFCenter = createMarker ( 376.69479370117, -120.20676422119, 1000.4741210938, "checkpoint", 1, getColorFromString ( "#FF000099" ) )
setElementInterior ( pizzaBuySFCenter, 5 )
setElementDimension ( pizzaBuySFCenter, 1 )
pizzaBuyPier69 = createMarker ( 376.69479370117, -120.20676422119, 1000.4741210938, "checkpoint", 1, getColorFromString ( "#FF000099" ) )
setElementInterior ( pizzaBuyPier69, 5 )
setElementDimension ( pizzaBuyPier69, 2 )

pizzaBoySFCenter = createPed ( 155, 376.69479370117, -117.20676422119, 1001.141418457 )
setElementInterior ( pizzaBoySFCenter, 5 )
setElementDimension ( pizzaBoySFCenter, 1 )
setPedRotation ( pizzaBoySFCenter, 180 )
pizzaBoyPier69 = createPed ( 155, 376.69479370117, -117.20676422119, 1001.141418457 )
setElementInterior ( pizzaBoyPier69, 5 )
setElementDimension ( pizzaBoyPier69, 2 )
setPedRotation ( pizzaBoyPier69, 180 )

healthyPizza = createObject ( 2355, 375.45205688477, -118.02765655518, 1001.580078125, 335, 25, 252.5 )
setElementDimension ( healthyPizza, 1337 )
setElementInterior ( healthyPizza, 5 )

bigPizza = createObject ( 2220, 377.63815307617, -118.02765655518, 1001.58, 335, 25, 252.5 )
setElementDimension ( bigPizza, 1337 )
setElementInterior ( bigPizza, 5 )

mediumPizza = createObject ( 2219, 379.09591674805, -118.02765655518, 1001.58, 335, 25, 252.5 )
setElementDimension ( mediumPizza, 1337 )
setElementInterior ( mediumPizza, 5 )

smallPizza = createObject ( 2218, 373.5, -118.02765655518, 1001.58, 335, 25, 252.5 )
setElementDimension ( smallPizza, 1337 )
setElementInterior ( smallPizza, 5 )

function pizzaMarkerSFCenterHit ( player, dim )
	
	if getPedOccupiedVehicle ( player ) == false and dim then
		removePedFromVehicle ( player )
		fadeElementInterior ( player, 5, 372.29702758789, -131, 1001 )
		setElementDimension ( player, 1 )
		toggleControl ( player, "fire", false )
		toggleControl ( player, "enter_exit", false )
		vnxSetElementData( player, "nodmzone", 1 )
		triggerClientEvent(player,"blendLoadingScreen",player)
	end
end
addEventHandler ( "onMarkerHit", pizzaEntranceSFCenter, pizzaMarkerSFCenterHit )

function pizzaMarkerPier69Hit ( player, dim )

	if getPedOccupiedVehicle ( player ) == false and dim then
		removePedFromVehicle ( player )
		fadeElementInterior ( player, 5, 372.29702758789, -131, 1001 )
		setElementDimension ( player, 2 )
		toggleControl ( player, "fire", false )
		toggleControl ( player, "enter_exit", false )
		vnxSetElementData( player, "nodmzone", 1 )
		triggerClientEvent(player,"blendLoadingScreen",player)
	end
end
addEventHandler ( "onMarkerHit", pizzaEntrancePier69, pizzaMarkerPier69Hit )

function pizzaMarkerSFCenterExitHit ( player, dim )

	if dim == true then
		setElementInterior ( player, 0, -1806, 945.3701171875, 24.5 )
		setElementDimension ( player, 0 )
		toggleControl ( player, "fire", true )
		toggleControl ( player, "enter_exit", true )
		vnxSetElementData( player, "nodmzone", 0 )
		setPlayerNametagShowing ( player, true )
		triggerClientEvent(player,"blendLoadingScreen",player)
	end
end
addEventHandler ( "onMarkerHit", pizzaEntranceSFCenterExit, pizzaMarkerSFCenterExitHit )

function pizzaMarkerPier69ExitHit ( player, dim )

	if dim == true then
		setElementInterior ( player, 0, -1722.7, 1359.7663574219, 6.7 )
		setElementDimension ( player, 0 )
		toggleControl ( player, "fire", true )
		toggleControl ( player, "enter_exit", true )
		vnxSetElementData( player, "nodmzone", 0 )
		setPlayerNametagShowing ( player, true )
		triggerClientEvent(player,"blendLoadingScreen",player)
	end
end
addEventHandler ( "onMarkerHit", pizzaEntrancePier69Exit, pizzaMarkerPier69ExitHit )

function pizzaBuySFCenterHit ( player, dim )

	if dim == true then
		vnxSetElementData ( player, "intdim", getElementDimension ( player ) )
		vnxSetElementData ( player, "curpizza", 1 )
		setElementDimension ( player, 1337 )
		local px, py, pz = getElementPosition ( healthyPizza )
		setCameraMatrix ( player, px-.04, py-0.4, pz+0.5, px, py, pz )
		bindKey ( player, "arrow_l", "down", pizzaLeft, player )
		bindKey ( player, "arrow_r", "down", pizzaRight, player )
		bindKey ( player, "space", "down", pizzaLeave, player )
		bindKey ( player, "enter", "down", pizzaBuy, player )
		foodtext ( player, "Salat", "5" )
		setElementFrozen ( player, true )
		setPlayerHudComponentVisible( player, "health", true )
		setPlayerHudComponentVisible( player, "money", true )
	end
end
addEventHandler ( "onMarkerHit", pizzaBuySFCenter, pizzaBuySFCenterHit )

function pizzaBuyPier69Hit ( player, dim )

	if dim == true then
		vnxSetElementData ( player, "intdim", getElementDimension ( player ) )
		vnxSetElementData ( player, "curpizza", 1 )
		setElementDimension ( player, 1337 )
		local px, py, pz = getElementPosition ( healthyPizza )
		setCameraMatrix ( player, px-.04, py-0.4, pz+0.5, px, py, pz )
		bindKey ( player, "arrow_l", "down", pizzaLeft, player )
		bindKey ( player, "arrow_r", "down", pizzaRight, player )
		bindKey ( player, "space", "down", pizzaLeave, player )
		bindKey ( player, "enter", "down", pizzaBuy, player )
		foodtext ( player, "Salat", "5" )
		setElementFrozen ( player, true )
		setPlayerHudComponentVisible( player, "health", true )
		setPlayerHudComponentVisible( player, "money", true )
	end
end
addEventHandler ( "onMarkerHit", pizzaBuyPier69, pizzaBuyPier69Hit )

function pizzaLeave ( player )

	textDestroyDisplay ( foodDisplay[getPlayerName(player)] )
	setElementPosition ( player, 372.29702758789, -122, 1001 )
	setElementDimension ( player, vnxGetElementData ( player, "intdim" ) )
	setCameraTarget ( player, player )
	unbindKey ( player, "arrow_l", "down", pizzaLeft )
	unbindKey ( player, "arrow_r", "down", pizzaRight )
	unbindKey ( player, "space", "down", pizzaLeave )
	unbindKey ( player, "enter", "down", pizzaBuy )
	setElementFrozen ( player, false )
	setPlayerHudComponentVisible( player, "health", false )
	setPlayerHudComponentVisible( player, "money", false )
end

function pizzaLeft ( player )

	local pizza = tonumber ( vnxGetElementData ( player, "curpizza" ) )
	if pizza == 1 then
		pizza = 4
	elseif pizza == 2 then
		pizza = 1
	elseif pizza == 3 then
		pizza = 2
	elseif pizza == 4 then
		pizza = 3
	end
	pizzaLookCheck ( player, pizza )
end

function pizzaRight ( player )

	local pizza = vnxGetElementData ( player, "curpizza" )
	if pizza == 1 then
		pizza = 2
	elseif pizza == 2 then
		pizza = 3
	elseif pizza == 3 then
		pizza = 4
	elseif pizza == 4 then
		pizza = 1
	end
	pizzaLookCheck ( player, pizza )
end

function pizzaLookCheck ( player, pizza )
	
	vnxSetElementData ( player, "curpizza", pizza )
	if pizza == 1 then
		local px, py, pz = getElementPosition ( healthyPizza )
		setCameraMatrix ( player, px-.04, py-0.4, pz+0.5, px, py, pz )
		local preis = salatprice
		foodtext ( player, "Salat", preis )
	elseif pizza == 2 then
		local px, py, pz = getElementPosition ( smallPizza )
		setCameraMatrix ( player, px-.04, py-0.4, pz+0.5, px, py, pz )
		local preis = smallpizzaprice
		foodtext ( player, "Kleine Pizza", smallpizzaprice )
	elseif pizza == 3 then
		local px, py, pz = getElementPosition ( mediumPizza )
		setCameraMatrix ( player, px-.04, py-0.4, pz+0.5, px, py, pz )
		local preis = normalpizzaprice
		foodtext ( player, "Pizza und Salat", preis )
	elseif pizza == 4 then
		local px, py, pz = getElementPosition ( bigPizza )
		setCameraMatrix ( player, px-.04, py-0.4, pz+0.5, px, py, pz )
		local preis = bigpizzaprice
		foodtext ( player, "Grosse Pizza", preis )
	end
end

function pizzaBuy ( player )

	local pizza = vnxGetElementData ( player, "curpizza" )
	if pizza == 1 then 
		pizzaprice = salatprice
		healthadd = salatheal
	elseif pizza == 2 then
		pizzaprice = smallpizzaprice
		healthadd = smallpizzaheal
	elseif pizza == 3 then
		pizzaprice = normalpizzaprice
		healthadd = normalpizzaheal
	elseif pizza == 4 then
		pizzaprice = bigpizzaprice
		healthadd = bigpizzaheal
	end
	local pmoney = vnxGetElementData ( player, "money" )
	if pmoney >= pizzaprice then
		factionDepotData["money"][2] = factionDepotData["money"][2] + math.floor(pizzaprice/3)
		if ( getElementHealth ( player ) + healthadd ) <= 100 then
			setElementHealth ( player, getElementHealth ( player ) + healthadd )
		else
			setElementHealth ( player, 100 )
		end
		vnxSetElementData ( player, "money", pmoney - pizzaprice )
		playSoundFrontEnd ( player, 40 )
		setElementHunger ( player, 100 )
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu nicht genug\nGeld - dieses\nGericht kostet\n"..pizzaprice.." $!", 7500, 125, 0, 0 )
	end
end

function foodtext ( player, name, kosten )

	if foodDisplay[getPlayerName(player)] then
		textDestroyDisplay ( foodDisplay[getPlayerName(player)] )
	end
	foodDisplay[getPlayerName(player)] = textCreateDisplay ()
	textDisplayAddObserver ( foodDisplay[getPlayerName(player)], player )
	foodDisplayText[getPlayerName(player)] = textCreateTextItem ( name..",\nKosten: "..kosten.." $", 0.2, 0.7, "medium", 75, 200, 50, 255, 2, "left", "top", 255 )
	textDisplayAddText ( foodDisplay[getPlayerName(player)], foodDisplayText[getPlayerName(player)] )
end