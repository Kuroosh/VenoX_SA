local ticketTax = 10
local allowExit = false
local rangeOfRadar = 20
local speedoColShapes = {}
local playerSpeedoCol = {}
local speedoVehicles = {}


local function onVehicleRespawnExplode_func ( )
	removeEventHandler ( "onVehicleStartExit", source, stopFromExit )
	removeEventHandler ( "onVehicleStartEnter", source, stopFromEnter )
	removeEventHandler ( "onVehicleRespawn", source, onVehicleRespawnExplode_func )
	removeEventHandler ( "onVehicleExplode", source, onVehicleRespawnExplode_func )
	for i, v in pairs ( speedoVehicles ) do
		if v == source then
			speedoVehicles[i] = nil
		end
	end
end

local function stopFromExit(thePlayer, seat)
	if allowExit == false and seat == 0 then
		cancelEvent()
		infobox ( thePlayer, "Du darfst das\nFahrzeug dabei\nnicht verlassen!", 5000, 155, 0, 0 )
	end
end

local function stopFromEnter (thePlayer, seat)
	if allowExit == false and seat == 0 then
		cancelEvent()
	end
end

local function ifPlayerDisconnects()
	local vehicle = speedoVehicles[source]
	setElementFrozen(vehicle, false)
	setVehicleLocked ( vehicle, false )
	removeEventHandler ( "onVehicleStartExit", vehicle, stopFromExit ) 
	removeEventHandler ( "onVehicleStartEnter", vehicle, stopFromEnter )
	removeEventHandler ( "onVehicleRespawn", vehicle, onVehicleRespawnExplode_func )
	removeEventHandler ( "onVehicleExplode", vehicle, onVehicleRespawnExplode_func )
	playerSpeedoCol[speedoColShapes[source]] = nil
	destroyElement (speedoColShapes[source])
	speedoColShapes[source] = nil
	speedoVehicles[source] = nil
end

local function ifPlayerDies()
	local vehicle = speedoVehicles[source]
	setElementFrozen(vehicle, false)
	setVehicleLocked ( vehicle, false )
	removeEventHandler ( "onVehicleStartExit", vehicle, stopFromExit )
	removeEventHandler ( "onVehicleStartEnter", vehicle, stopFromEnter )
	removeEventHandler ( "onVehicleRespawn", vehicle, onVehicleRespawnExplode_func )
	removeEventHandler ( "onVehicleExplode", vehicle, onVehicleRespawnExplode_func )
	playerSpeedoCol[speedoColShapes[source]] = nil
	destroyElement ( speedoColShapes[source] )
	speedoColShapes[source] = nil
	speedoVehicles[source] = nil
	removeEventHandler("onPlayerQuit", source, ifPlayerDisconnects)
	removeEventHandler("onPlayerWasted", source, ifPlayerDies)
	infobox ( source, "Radarfalle deaktiviert!", 5000, 125, 0, 0 )
end


local function deactivateSpeedCamera( player )
	if isPedInVehicle(player) then
		local theVehicle = getPedOccupiedVehicle ( player )
		setElementFrozen(theVehicle, false)
		setVehicleLocked ( vehicle, false )
		playerSpeedoCol[speedoColShapes[player]] = nil
		destroyElement ( speedoColShapes[player] )
		speedoColShapes[player] = nil
		speedoVehicles[player] = nil
		playSoundFrontEnd ( player, 101 )
		infobox ( player, "Radarfalle deaktiviert!", 5000, 125, 0, 0 )	
		removeEventHandler("onPlayerQuit", player, ifPlayerDisconnects)
		removeEventHandler("onPlayerWasted", player, ifPlayerDies)
		removeEventHandler ( "onVehicleStartExit", theVehicle, stopFromExit ) 
		removeEventHandler ( "onVehicleStartEnter", theVehicle, stopFromEnter )
		removeEventHandler ( "onVehicleRespawn", theVehicle, onVehicleRespawnExplode_func )
		removeEventHandler ( "onVehicleExplode", theVehicle, onVehicleRespawnExplode_func )
	end
end

local function ticketTheSpeedoman(theVehicle)
	if getElementType(theVehicle) == "vehicle" then
		local id = getElementModel(theVehicle)
		if id ~= 523 and id ~= 598 and id ~= 596 and id ~= 597 and id ~= 599 and id ~= 416 and id ~= 490 and id ~= 427 and id ~= 407 and id ~= 544 and id ~= 470 and id ~= 433 and id ~= 601 and id ~= 428 and id ~= 432 then  -- check if vehicles are not for government or emergency	
			local speedx, speedy, speedz = getElementVelocity ( theVehicle )
			local actualspeed = (speedx^2 + speedy^2 + speedz^2)^(0.5) 
			local kmh = math.ceil(actualspeed * 180)
			if 120 < kmh then
				local driver = getVehicleOccupant(theVehicle)
				if driver and getElementType (driver) == "player" and not isOnDuty ( driver ) then
					local moneydriver = vnxGetElementData ( driver, "money" )
					local bankmoneydriver = vnxGetElementData ( driver, "bankmoney" )
					local price = (ticketTax*(kmh-120))
					if moneydriver >= price then
						vnxSetElementData ( driver, "money", moneydriver - price )
						outputChatBox("Du bist "..(kmh-120).." km/h zu schnell gefahren und musst "..price.."$ bezahlen.", driver, 255, 0, 0 )	
						fadeCamera ( driver, false, 0.2, 255, 255, 255)
						setTimer ( fadeCamera, 500, 1, driver, true, 2 )
					elseif moneydriver + bankmoneydriver >= price then
						vnxSetElementData ( driver, "money", 0 )
						vnxSetElementData ( driver, "bankmoney", bankmoneydriver - ( price - moneydriver ) )
						outputChatBox("Du bist "..(kmh-120).." km/h zu schnell gefahren und musst "..price.."$ bezahlen.", driver, 255, 0, 0 )	
						fadeCamera ( driver, false, 0.2, 255, 255, 255)
						setTimer ( fadeCamera, 500, 1, driver, true, 2 )
					else
						vnxSetElementData ( driver, "money", 0)
						vnxSetElementData ( driver, "bankmoney", 0)
						outputChatBox("Du bist "..(kmh-120).." km/h zu schnell gefahren und bist nun pleite.", driver, 255, 0, 0 )
						fadeCamera ( driver, false, 0.1, 255, 255, 255)
						setTimer ( fadeCamera, 500, 1, driver, true, 2 )
						price = bankmoney + moneydriver
					end
					
					local ticketer = playerSpeedoCol[source]
					vnxSetElementData ( ticketer, "money", vnxGetElementData ( ticketer, "money") + price )
					outputChatBox("Du hast "..getPlayerName(driver).." mit "..kmh.." km/h erwischt und kriegst "..price.."$ dafür.", ticketer, 0, 255, 0 )
					playSoundFrontEnd ( ticketer, 101 )
				end
			end
		end
	end
end


local function activateSpeedCamera ( player )	
	if isCop ( player ) then
		if isOnDuty ( player ) then
			if not speedoColShapes[player] then
				local seat = getPedOccupiedVehicleSeat ( player )
				if seat == 0 then
					local theVehicle = getPedOccupiedVehicle ( player )
					if theVehicle then 
						setElementFrozen(theVehicle, true)
						setVehicleLocked ( vehicle, true )
						local x, y, z = getElementPosition(theVehicle)
						speedoColShapes[player] = createColSphere(x, y, z, rangeOfRadar)
						playerSpeedoCol[speedoColShapes[player]] = player
						addEventHandler("onColShapeHit", speedoColShapes[player], ticketTheSpeedoman)
						addEventHandler("onPlayerQuit", player, ifPlayerDisconnects)
						addEventHandler("onPlayerWasted", player, ifPlayerDies)
						addEventHandler ( "onVehicleStartExit", theVehicle, stopFromExit ) 
						addEventHandler ( "onVehicleStartEnter", theVehicle, stopFromEnter )
						addEventHandler ( "onVehicleRespawn", theVehicle, onVehicleRespawnExplode_func )
						addEventHandler ( "onVehicleExplode", theVehicle, onVehicleRespawnExplode_func )
						speedoVehicles[player] = theVehicle
						infobox ( player, "Radarfalle aktiviert!", 5000, 0, 125, 0 )	
						playSoundFrontEnd ( player, 101 )
					else
						infobox ( player, "Du sitzt in\nkeinem Fahrzeug!", 5000, 125, 0, 0 )
					end
				else
					infobox ( player, "Nur als\nFahrer möglich!", 4000, 200, 0, 0 )
				end
			else
				deactivateSpeedCamera ( player )
			end
		else
			infobox ( player, "Du musst dafür\nim Dienst sein!", 5000, 125, 0, 0 )
		end
	else
		infobox ( player, "Du bist kein\nStaatsfraktionist", 5000, 125, 155, 0 )
	end
end
addCommandHandler("radarfalle", activateSpeedCamera)










	