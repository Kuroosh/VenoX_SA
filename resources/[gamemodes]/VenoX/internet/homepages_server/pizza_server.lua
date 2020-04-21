function deliverPizza_func ()

	if source == client and vnxGetElementData ( client, "money" ) >= 50 then
		local player = source
		if getElementInterior ( client ) == 0 and getElementDimension ( client ) == 0 then
			if not gotLastHit[client] or gotLastHit[client] + healafterdmgtime <= getTickCount() then
				local x, y, z = getElementPosition ( player )
				outputChatBox ( "Deine Bestellung wird geliefert!", player, 0, 125, 0 )
				playSoundFrontEnd ( player, 40 )
				vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 50 )
				triggerClientEvent ( player, "createNewStatementEntry", player, "Bestellung auf\nPizza.com", 50 * -1, "Mit extra\nKäse" )
				factionDepotData["money"][2] = factionDepotData["money"][2] + 50
				local pizzaboy = createVehicle ( 448, x + 2, y + 2, z )
				local pizzaboyDriver = createInvulnerablePed ( 155, x, y, z, 0, 0, 0 )
				warpPedIntoVehicle ( pizzaboyDriver, pizzaboy )
				setTimer ( createPizzaPickup, 3500, 1, x, y, z )
				setTimer ( destroyElement, 5000, 1, pizzaboyDriver )
				setTimer ( destroyElement, 5000, 1, pizzaboy )
				setVehicleEngineState ( pizzaboy, true )
			else
				outputChatBox ( "Es muss dafür "..( healafterdmgtime/1000 ) .." Sekunden nach dem letzten Schuss vergangen sein!", client, 200, 0, 0 )
			end
		else
			outputChatBox ( "Das kannst du nur draußen bestellen!", player, 125, 0, 0 )
		end
	end
end
addEvent ( "deliverPizza", true )
addEventHandler ( "deliverPizza", getRootElement(), deliverPizza_func )

function createPizzaPickup ( x, y, z )

	local pickup = createPickup ( x+2, y+2, z, 3, 1582 )
	addEventHandler ( "onPickupHit", pickup, 
		function ( player )
			setElementHealth ( player, 100 )
			playSoundFrontEnd ( player, 40 )
			setElementHunger ( player, 100 )
			if isElement ( source ) then
				destroyElement ( source )
			end
			outputLog ( getPlayerName(player).." hat sich mit Pizza geheilt", "Heilung" )
		end
	)
end