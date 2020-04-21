----------------------------------------------------
----------------------------------------------------
------ Copyright (c) 2013 by [vio]Lars-Marcel ------
----------------------------------------------------
----------------------------------------------------

createBlip ( -2052.1, 178.474, 27.9, 27)
setGarageOpen(22, true)
local marker = createMarker( -2052.1, 178.474, 27.9, "cylinder", 4, 0, 218, 230, 255 )
local pickup = createPickup( -2036.1, 174.263, 28.7, 3, 1239, 1, 99 )

function showSpezialLackNeu_func(player)
	if getElementType (player) == "player" then
		if isPedInVehicle (player) then
			local veh = getPedOccupiedVehicle(player)
			if veh then
				if vnxGetElementData ( veh, "owner" ) == getPlayerName ( player ) then
					setElementData ( player, "ElementClicked", true )
					setElementFrozen(veh, true)
					toggleControl ( player, "enter_exit", false )
					triggerClientEvent (player, "showMichelles1", player)
		
				else
					outputChatBox ( "Du kannst nur deine Privatfahrzeuge tunen!", player, 125, 0, 0 )
				end
			end
		end
	end
end
addEventHandler("onMarkerHit", marker, showSpezialLackNeu_func)


function seeSpezialLackNeu_func(red1, green1, blue1, red2, green2, blue2)
	local player = source
	
	local red1 = red1 * 2.55
	local green1 = green1 * 2.55
	local blue1 = blue1 * 2.55
	local red2 = red2 * 2.55
	local green2 = green2 * 2.55
	local blue2 = blue2 * 2.55
	
	local veh = getPedOccupiedVehicle(player)
	
	if veh then
		setVehicleColor(veh, red1, green1, blue1, red2, green2, blue2)
	else
		return false
	end
end
addEvent( "seeSpezialLackNeu", true )
addEventHandler( "seeSpezialLackNeu", getRootElement(), seeSpezialLack_func )

function buySpezialLackNeu_func(red1, green1, blue1, red2, green2, blue2)
	local player = source
	
	local red1 = red1 * 2.55
	local green1 = green1 * 2.55
	local blue1 = blue1 * 2.55
	local red2 = red2 * 2.55
	local green2 = green2 * 2.55
	local blue2 = blue2 * 2.55
	
	local veh = getPedOccupiedVehicle(player)
	
	
	if veh then
		if vnxGetElementData(veh, "spezcolor") == "" then
			if vnxGetElementData(player, "money") >= 7500 then 
				vnxSetElementData(player, "money", vnxGetElementData(player, "money") - 7500)
				--MichellesKasse = MichellesKasse + 2500
			else
				outputChatBox ( "Du hast nicht genügend Geld dafür", player, 200, 0, 0 )
				setElementFrozen(veh, false)
				return
			end
		else
			if vnxGetElementData(player, "money") >= 5250 then 
				vnxSetElementData(player, "money", vnxGetElementData(player, "money") - 5250)
				--MichellesKasse = MichellesKasse + 1250
			else
				outputChatBox ( "Du hast nicht genügend Geld dafür", player, 200, 0, 0 )
				setElementFrozen(veh, false)
				return
			end
		end
		setElementFrozen(veh, false)
		toggleControl ( player, "enter_exit", true )
		setElementData ( player, "ElementClicked", false )
		setElementDimension(veh, 0)
		setElementDimension(player, 0)
		activeCarGhostMode ( player, 10000 )
		
		setVehicleColor(veh, red1, green1, blue1, red2, green2, blue2)
		local spezcolor = "|"..red1.."|"..green1.."|"..blue1.."|"..red2.."|"..green2.."|"..blue2.."|"
		vnxSetElementData(veh, "spezcolor", spezcolor)
		
		dbExec ( handler, "UPDATE vehicles SET spezcolor = ? WHERE UID = ? AND Slot = ?", spezcolor, playerUID[getPlayerName(player)], vnxGetElementData ( veh, "carslotnr_owner" ) )
	else
		return false
	end
end
addEvent( "buySpezialLackNeu", true )
addEventHandler( "buySpezialLackNeu", getRootElement(), buySpezialLackNeu_func )

function closeSpezialLackNeu_func(red1, green1, blue1, red2, green2, blue2)
	local player = source
	
	local veh = getPedOccupiedVehicle(player)
	
	toggleControl ( player, "enter_exit", true )
	setElementData ( player, "ElementClicked", false )
	setElementDimension(veh, 0)
	setElementDimension(player, 0)
	activeCarGhostMode ( player, 10000 )
	
	if veh then
		setElementFrozen(veh, false)
		
		setPrivVehCorrectColor(veh)
		
	else
		return false
	end
end
addEvent( "closeSpezialLackNeu", true )
addEventHandler( "closeSpezialLackNeu", getRootElement(), closeSpezialLack_func )


function deleteSpezialLackNeu_func(player)
	local veh = getPedOccupiedVehicle(player)
	
	if veh then
		local x, y, z = getElementPosition ( player )
		if getDistanceBetweenPoints3D ( -2035.92578125, 174.09765625, 25, x, y, z ) <= 5 then
			if vnxGetElementData ( veh, "owner" ) == getPlayerName ( player ) then
				local colors = vnxGetElementData ( veh, "color" )
				local c1 = tonumber ( gettok ( colors, 1, string.byte( '|' ) ))
				local c2 = tonumber ( gettok ( colors, 2, string.byte( '|' ) ))
				local c3 = tonumber ( gettok ( colors, 3, string.byte( '|' ) ))
				local c4 = tonumber ( gettok ( colors, 4, string.byte( '|' ) ))
				setVehicleColor ( veh, c1, c2, c3, c4 )
				setTimer ( setVehicleColor, 100, 1, veh, c1, c2, c3, c4 )
				
				removeElementData(veh, "spezcolor")
				
				dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=? AND ??=?", "vehicles", "spezcolor", "", "UID", playerUID[getPlayerName(player)], "Slot", vnxGetElementData(veh, "carslotnr_owner") )
				
				outputChatBox("Speziallack erfolgreich entfernt!", player, 0, 255, 0)
			else
				outputChatBox ( "Du kannst nur deine Privatfahrzeuge tunen!", player, 125, 0, 0 )
			end
		else
			outputChatBox("Du bist nicht im Icon.", player, 255, 0, 0)
		end
	end
end
addCommandHandler("dellack", deleteSpezialLackNeu_func)

function deleteSpezialLack_info(player)
	outputChatBox("Um den Speziallack zu entfernen Tippe /dellack", player, 255, 155, 0)
end
addEventHandler("onPickupHit", pickup, deleteSpezialLack_info)



function closeMichellesNeu_func()
	local player = source
	
	setElementClicked ( player, false )
	toggleControl ( player, "enter_exit", true )
	local veh = getPedOccupiedVehicle(player)
	setElementFrozen(veh, false)
	setElementDimension(veh, 0)
	setElementDimension(player, 0)
	activeCarGhostMode ( player, 10000 )
end
addEvent( "closeMichellesNeu", true )
addEventHandler( "closeMichellesNeu", getRootElement(), closeMichellesNeu_func )