--[[function taxi_func ( player, route, kosten )

	kosten = math.abs ( kosten )
	local money = vnxGetElementData ( player, "money" )
	if player == client then
		setElementClicked ( player, false )
		if money >= kosten then
			takePlayerSaveMoney ( player, kosten )
			local pname = getPlayerName ( player )
			if isElement ( _G["taxi"..pname] ) then
				destroyElement ( _G["taxi"..pname] )
				destroyElement ( _G["taxiBot"..pname] )
			end
			_G["taxi"..pname] = createVehicle ( 438, -1983.6790771484+math.random(-0.1,0.1), 168.71098327637, 28, 0, 0, 0 )
			setVehicleLocked ( _G["taxi"..pname], true )
			setVehicleDamageProof ( _G["taxi"..pname], true )
			vnxSetElementData ( _G["taxi"..getPlayerName(player)], "engine", true )
			_G["taxiBot"..pname] = createPed ( getElementModel ( player ), -2692.13623, 1913.058, 65.187 )
			setElementData ( player, "oldCL", getElementData ( player, "carlicense" ) )
			setElementData ( player, "carlicense", 1 )
			setElementData ( player, "oldskin", getElementModel ( player ) )
			setElementModel ( player, 222 )
			warpPedIntoVehicle ( player, _G["taxi"..getPlayerName(player)], 0 )
			vnxSetElementData ( _G["taxi"..getPlayerName(player)], "engine", true )
			warpPedIntoVehicle ( _G["taxiBot"..pname], _G["taxi"..pname], 3 )
			setTimer ( warpPedIntoVehicle, 500, 3, player, _G["taxi"..pname], 0 )
			setTimer ( triggerClientEvent, 2000, 1, player, "startDrive", getRootElement(), route )
			toggleTaxiControle ( player, false )
			addEventHandler ( "onPlayerQuit", player, stopTaxi_func )
			addEventHandler ( "onPlayerWasted", player, stopTaxi_func )
			setTimer ( addEventHandler, 5000, 1, "onPlayerVehicleExit", player, stopTaxi_func )
			outputChatBox ( "Tippe /ctaxi, um die Fahrt abzubrechen.", player, 125, 0, 0 )
			setTimer ( setVehicleEngineState, 500, 1, _G["taxi"..pname], true )
		else
			outputChatBox ( "Du hast nicht genug Geld, die ausgewaehle Route kostet "..kosten.." $!", player, 125, 0, 0 )
		end
	end
end
addEvent ( "taxi", true )
addEventHandler ( "taxi", getRootElement(), taxi_func )

function ctaxi_func ( player )

	if getElementModel ( getPedOccupiedVehicle ( player ) ) == 438 then
		stopTaxi_func ( player )
		removePedFromVehicle ( player )
	end
end
addCommandHandler ( "ctaxi", ctaxi_func )

function stopTaxi_func ( player )

	if source then
		player = source
	end
	if player then
		local nick = getPlayerName ( player )
		local veh = _G["taxi"..nick]
		local driver = _G["taxiBot"..nick]
		setElementData ( player, "carlicense", getElementData ( player, "oldCL" ) )
		
		removeEventHandler ( "onPlayerQuit", player, stopTaxi_func )
		removeEventHandler ( "onPlayerWasted", player, stopTaxi_func )
		removeEventHandler ( "onPlayerVehicleExit", player, stopTaxi_func )
		
		removePedFromVehicle ( player )
		removePedFromVehicle ( driver )
		warpPedIntoVehicle ( player, veh, 3 )
		warpPedIntoVehicle ( driver, veh, 0 )
		
		setTimer ( destroyElement, 3000, 1, driver )
		setTimer ( destroyElement, 3000, 1, veh )
		
		setElementModel ( player, getElementData ( player, "oldskin" ) )
		setElementModel ( driver, 222 )

		if isElement ( player ) then
			setTimer ( setControlState, 1000, 1, player, "enter_exit", true )
			setTimer ( setControlState, 1200, 1, player, "enter_exit", false )
			toggleTaxiControle ( player, true )
		end
	end
end
addEvent ( "stopTaxi", true )
addEventHandler ( "stopTaxi", getRootElement(), stopTaxi_func )

function toggleTaxiControle ( player, bool )

	toggleControl ( player, "vehicle_right", bool )
	toggleControl ( player, "vehicle_left", bool )
	toggleControl ( player, "accelerate", bool )
	toggleControl ( player, "brake_reverse", bool )
	toggleControl ( player, "handbrake", bool )
	toggleControl ( player, "enter_passenger", bool )
	toggleControl ( player, "enter_exit", bool )
end]]