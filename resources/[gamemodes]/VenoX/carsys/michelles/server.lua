----------------------------------------------------
----------------------------------------------------
------ Copyright (c) 2013 by [THC]Lars-Marcel ------
----------------------------------------------------
----------------------------------------------------

--createBlip ( -1786.779, 1215.474, 24.5, 27)
--setGarageOpen(24, true)
local marker = createMarker( -1786.779, 1215.474, 23.5, "cylinder", 5, 0, 218, 255, 255 )
local pickup = createPickup( -1782.215, 1205.233, 25, 3, 1239, 1, 99 )
adminsIngame = {}
local player_admin = {}
local frozen_players = {}
local veh_frozen_players = {}
local veh_frozen_vehs = {}
local muted_players = {}
local adminLevels = {
	["VIP"] = 1,
	["Ticketsupporter"] = 2,
	["Supporter"] = 3,
	["Moderator"] = 4,
	["Administrator"] = 5,
	["Stlv.Projektleitung"] = 6,
	["Projektleiter"] = 7
}
donatorMute = {}
local adminmarks = {}

function showSpezialLack_func(player)
	if isAdminLevel ( player, adminLevels["VIP"] ) then
		local veh = getPedOccupiedVehicle(player)
		if veh then
			if vnxGetElementData ( veh, "owner" ) == getPlayerName ( player ) then
				setElementData ( player, "ElementClicked", true )
				setElementFrozen(veh, true)
				toggleControl ( player, "enter_exit", false )
				triggerClientEvent (player, "showMichelles", player)
				
				local dim = math.random(5000,9000)
				
				setElementDimension(veh, dim)
				setElementDimension(player, dim)
			else
				outputChatBox ( "Du kannst nur deine Privatfahrzeuge tunen!", player, 125, 0, 0 )
			end
		end
	else
		outputChatBox("Nur für Premium-User!", player, 255, 155, 0)
	end
end
addEventHandler("onMarkerHit", marker, showSpezialLack_func)


function seeSpezialLack_func(red1, green1, blue1, red2, green2, blue2)
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
addEvent( "seeSpezialLack", true )
addEventHandler( "seeSpezialLack", getRootElement(), seeSpezialLack_func )

function buySpezialLack_func(red1, green1, blue1, red2, green2, blue2)
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
			if vnxGetElementData(player, "money") >= 2500 then 
				vnxSetElementData(player, "money", vnxGetElementData(player, "money") - 2500)
				--MichellesKasse = MichellesKasse + 2500
			else
				outputChatBox ( "Du hast nicht genügend Geld dafür", player, 200, 0, 0 )
				setElementFrozen(veh, false)
				return
			end
		else
			if vnxGetElementData(player, "money") >= 1250 then 
				vnxSetElementData(player, "money", vnxGetElementData(player, "money") - 1250)
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
addEvent( "buySpezialLack", true )
addEventHandler( "buySpezialLack", getRootElement(), buySpezialLack_func )

function closeSpezialLack_func(red1, green1, blue1, red2, green2, blue2)
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
addEvent( "closeSpezialLack", true )
addEventHandler( "closeSpezialLack", getRootElement(), closeSpezialLack_func )

function deleteSpezialLack_func(player)
	local veh = getPedOccupiedVehicle(player)
	
	if veh then
		local x, y, z = getElementPosition ( player )
		if getDistanceBetweenPoints3D ( -1782.215, 1205.233, 25, x, y, z ) <= 5 then
			if vnxGetElementData ( veh, "owner" ) == getPlayerName ( player ) then
				local colors = vnxGetElementData ( veh, "color" )
				local c1 = tonumber ( gettok ( colors, 1, string.byte( '|' ) ))
				local c2 = tonumber ( gettok ( colors, 2, string.byte( '|' ) ))
				local c3 = tonumber ( gettok ( colors, 3, string.byte( '|' ) ))
				local c4 = tonumber ( gettok ( colors, 4, string.byte( '|' ) ))
				setVehicleColor ( veh, c1, c2, c3, c4 )
				setTimer ( setVehicleColor, 100, 1, veh, c1, c2, c3, c4 )
				
				vnxSetElementData(veh, "spezcolor", "")
				removeElementData(veh, "spezcolor")
				
				dbExec ( handler, "UPDATE vehicles SET spezcolor = ? WHERE UID = ? AND Slot = ?", "", playerUID[getPlayerName(player)], vnxGetElementData ( veh, "carslotnr_owner" ) )

				outputChatBox("Speziallack erfolgreich entfernt!", player, 0, 255, 0)
			else
				outputChatBox ( "Du kannst nur deine Privatfahrzeuge tunen!", player, 125, 0, 0 )
			end
		else
			outputChatBox("Du bist nicht an der Richtigen stelle.", player, 255, 0, 0)
		end
	end
end
addCommandHandler("dellack", deleteSpezialLack_func)

function deleteSpezialLack_info(player)
	outputChatBox("Um den Speziallack zu entfernen Tippe /dellack", player, 0, 97, 230)
	outputChatBox("Um die Neonroehren zu entfernen Tippe /delneon", player, 0, 97, 230)
end
addEventHandler("onPickupHit", pickup, deleteSpezialLack_info)


function seeNeon_func(color)
	local player = source
	if color then
		veh = getPedOccupiedVehicle(player)
		--triggerEvent ( "removeNeon", root, veh )
		removeNeon(veh)
		removeElementData(player, "neoncolor")
		setTimer ( function()
			addNeon(veh, color)
			setElementData(player, "neoncolor", color)
			showCursor(player, true)
		end, 750, 1 )
	else
		return false
	end
end
addEvent( "seeNeon", true )
addEventHandler( "seeNeon", getRootElement(), seeNeon_func )

function closeNeon_func()
	local player = source
	local veh = getPedOccupiedVehicle(player)
	toggleControl ( player, "enter_exit", true )
	setElementData ( player, "ElementClicked", false )
	setElementDimension(veh, 0)
	setElementDimension(player, 0)
	activeCarGhostMode ( player, 10000 )
	
	if veh then
		setElementFrozen(veh, false)
	else
		return false
	end
end
addEvent( "closeNeon", true )
addEventHandler( "closeNeon", getRootElement(), closeNeon_func )

function buyNeon_func(color)
	local player = source
	local veh = getPedOccupiedVehicle(player)
	--local color = getElementData(player, "neoncolor")
	if veh and color then
		if not vnxGetElementData(veh, "neon") then
			if vnxGetElementData(player, "money") >= 20000 then
				vnxSetElementData(player, "money", vnxGetElementData(player, "money") - 20000)
				--MichellesKasse = MichellesKasse + 2500
				
				vnxSetElementData(veh, "neon", color)
				addNeon(veh, color)
			else
				outputChatBox ( "Du hast kein Geld dafür", player, 200, 0, 0 )
				setElementFrozen(veh, false)
				return
			end
		elseif vnxGetElementData(player, "money") >= 20000 then
			vnxSetElementData(player, "money", vnxGetElementData(player, "money") - 20000)
			--MichellesKasse = MichellesKasse + 1250
			
			vnxSetElementData(veh, "neon", color)
			removeNeon(veh)
			setTimer ( function()
				addNeon(veh, color)
			end, 500, 1 )
		else
			outputChatBox ( "Du hast kein Geld dafür", player, 200, 0, 0 )
			setElementFrozen(veh, false)
			return
		end
		--toggleControl ( player, "enter_exit", true )
		--setElementData ( player, "ElementClicked", false )
		--setElementDimension(veh, 0)
		--setElementDimension(player, 0)
		--activeCarGhostMode ( player, 10000 )
		--setElementFrozen(veh, false)
		dbExec ( handler, "UPDATE vehicles SET neon = ? WHERE UID = ? AND Slot = ?", color, playerUID[getPlayerName(player)], vnxGetElementData ( veh, "carslotnr_owner" ) )
	end
end
addEvent( "buyNeon", true )
addEventHandler( "buyNeon", getRootElement(), buyNeon_func )

function deleteNeon_func(player)
	local veh = getPedOccupiedVehicle(player)
	if veh then
		local x, y, z = getElementPosition ( player )
		if getDistanceBetweenPoints3D ( -1782.215, 1205.233, 25, x, y, z ) <= 5 then
			if vnxGetElementData ( veh, "owner" ) == getPlayerName ( player ) then
				if vnxGetElementData(veh, "neon") then
					removeNeon(veh)
					vnxSetElementData(veh, "neon", false)
					removeElementData(veh, "neon")
					dbExec ( handler, "UPDATE vehicles SET neon = ? WHERE UID = ? AND Slot = ?", "", playerUID[getPlayerName(player)], vnxGetElementData ( veh, "carslotnr_owner" ) )
					outputChatBox("Neonroehren erfolgreich entfernt!", player, 0, 255, 0)
				else
					outputChatBox("Dein Fahrzeug hat keine Neonroehren.", player, 255, 155, 0)
				end
			else
				outputChatBox ( "Du kannst nur deine Privatfahrzeuge tunen!", player, 125, 0, 0 )
			end
		else
			outputChatBox("Du bist nicht im Icon.", player, 255, 0, 0)
		end
	end
end
addCommandHandler("delneon", deleteNeon_func)

function closeMichelles_func()
	local player = source
	
	setElementData ( player, "ElementClicked", false )
	toggleControl ( player, "enter_exit", true )
	local veh = getPedOccupiedVehicle(player)
	setElementFrozen(veh, false)
	setElementDimension(veh, 0)
	setElementDimension(player, 0)
	activeCarGhostMode ( player, 10000 )
end
addEvent( "closeMichelles", true )
addEventHandler( "closeMichelles", getRootElement(), closeMichelles_func )