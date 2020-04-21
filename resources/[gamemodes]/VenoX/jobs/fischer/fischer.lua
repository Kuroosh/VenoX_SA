function fischpreissteigung ()

	if fishprice == nil then fishprice = 8 end
	if fishprice <= 12 then
		fishprice = fishprice + 0.5
	end
	setTimer ( fischpreissteigung, 300000, 1 )
end

setTimer ( fischpreissteigung, 3600000, 1 )

fischerjobicon = createPickup ( -1724.9904785156, 1461.3231201172, 7, 3, 1239, 1000, 0 )
local fischerblip = createBlip ( -1724.9904785156, 1461.3231201172, 7, 58, 2, 255, 255, 0, 255, 0, 200 )

fishReefer = {
	createVehicle ( 453, -1705.2114257813,1443.5505371094,0,0,0,0, "ROW YOUR BOAT" ),
	createVehicle ( 453, -1704.8940429688,1455.3642578125,0,0,0,0, "ROW YOUR BOAT" ),
	createVehicle ( 453, -1705.0718994141,1467.1142,0,0,0,0, "ROW YOUR BOAT" ),
	createVehicle ( 453, -1720.39,1443.024,0,0,0,0, "ROW YOUR BOAT" ),
	createVehicle ( 453, -1720.6491699219,1456.108,0,0,0,0, "ROW YOUR BOAT" ),
	createVehicle ( 453, -1705.2717285156, 1497.1535644531, 0, 0, 0, 0, "ROW YOUR BOAT" ),
	createVehicle ( 453, -1705.1030273438, 1484.3663330078, 0, 0, 0, 0, "ROW YOUR BOAT" ),
	createVehicle ( 453, -1717.7352294922, 1429.986328125, 0, 0, 0, 270, "ROW YOUR BOAT" ),
	createVehicle ( 453, -1705.8044433594, 1430.0561523438, 0, 0, 0, 270, "ROW YOUR BOAT" )
}


addEventHandler ( "onResourceStart", resourceRoot, function()
	for i=1, #fishReefer do
		setVehicleRespawnPosition ( fishReefer[i], getElementPosition ( fishReefer[i] ) )
		toggleVehicleRespawn ( fishReefer[i], true )
		setVehicleRespawnDelay ( fishReefer[i], 1000 )
		setVehicleIdleRespawnDelay ( fishReefer[i], 1000 )
		addEventHandler ( "onVehicleEnter", fishReefer[i], VehicleFischerEnter )
		addEventHandler ( "onVehicleExit", fishReefer[i], VehicleFischerExit )
	end
end )


function jobicon_fischer ( player )
	triggerClientEvent ( player, "infobox_start", getRootElement(), "Tippe /job, um\nFischer zu werden -\n dazu brauchst du\neinen Angel- und\neinen Bootsschein.", 5000, 200, 200, 0 )
end
addEventHandler ( "onPickupHit", fischerjobicon, jobicon_fischer )


function VehicleFischerEnter ( player, seat )
	if vnxGetElementData ( player, "job" ) ~= "fischer" then
		opticExitVehicle ( player )
		triggerClientEvent ( player, "infobox_start", player, "\n\nDu bist\nkein Fischer!", 5000, 125, 0, 0 )
	elseif vnxGetElementData ( player, "job" ) == "fischer" then
		triggerClientEvent ( player, "startfishing", player )
		local t = getRealTime()
		local minutes = t.minute 
		local hour = t.hour
		vnxSetElementData ( player, "fishingStartedM", minutes )
		vnxSetElementData ( player, "fishingStartedH", hour )
	end
end

function VehicleFischerExit ( player, seat )
	if vnxGetElementData ( player, "job" ) == "fischer" then
		triggerClientEvent ( player, "cancelfishing", player )
	end
end


function endfishing_func ( fische )

	if source == client then
		if fishprice == nil then fishprice = 8 end
		if fische == nil then fische = 0 end
		
		-- ANTICHEAT --
		local t = getRealTime()
		local minutes = t.minute 
		local hour = t.hour
		local dist = getDistanceBetweenMinutes ( vnxGetElementData ( source, "fishingStartedM" ), vnxGetElementData ( source, "fishingStartedH" ), minutes, hour )
		if dist * 7 > fische then
		-- ANTICHEAT --
			if fische >= 1 then
				local einnahmen = fishprice*fische
				local einnahmen = math.floor(einnahmen)*10
				triggerClientEvent ( source, "infobox_start", source, "Du hast "..fische.."\nFische gefangen und\nerhälst "..einnahmen.." $\ndafür!", 15000, 125, 0, 0 )
				
				fishprice = fishprice - fische*0.05
				if fishprice < 3 then
					fishprice = 3
				end
				respawnVehicle ( getPedOccupiedVehicle ( source ) )
				setElementVelocity ( getPedOccupiedVehicle ( source ), 0, 0, 0 )
				opticExitVehicle ( source )
				setElementPosition ( source, -1725, 1464, 6.5 )
				
				vnxSetElementData ( source, "money", vnxGetElementData ( source, "money" ) + einnahmen )																																				-- Achiev: Angler
				end																																						-- Achiev: Angler
			end
		end
	end
end
addEvent ( "endfishing", true )
addEventHandler ( "endfishing", getRootElement(), endfishing_func )