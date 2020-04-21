local takeStrings = {}
	takeStrings["gunlicense"] = "takegunlicense"
	takeStrings["illegal"] = "takeillegal"
	takeStrings["weapons"] = "takeweapons"
	takeStrings["drugs"] = "takedrugs"

function take_func ( player, _, cmd, arg1, arg2 )

	local string = takeStrings[cmd]
	if string then
		executeCommandHandler ( takeStrings[cmd], player, arg1, arg2 )
	end
end
addCommandHandler ( "take", take_func )


local lastweapons = {}
local lastammos = {}
local lastablegen = {}

addCommandHandler ( "ablegen", function ( player ) 
	local id = getPedWeapon ( player )
	local slot = getPedWeaponSlot ( player )
	if id > 0 then
		lastweapons[player] = id
		lastammos[player] = getPedTotalAmmo ( player )
		takeWeapon ( player, id )
		lastablegen[player] = getTickCount()
		outputChatBox ( "Waffe abgelegt! /ablegenruckgangig, um es rückgängig zu machen (innerhalb von einer Minute).", player, 0, 200, 0 )
	end
end )


addCommandHandler ( "ablegenruckgangig", function ( player )
	if lastweapons[player] then
		if lastablegen[player] + 2000 <= getTickCount() then
			giveWeapon ( player, lastweapons[player], lastammos[player] )
			outputChatBox ( "Waffe Aufgehoben!", player, 0, 200, 0 )
			lastweapons[player] = nil
			lastammos[player] = nil
			lastablegen[player] = nil
		else
			infobox ( player, "Zu spät", 200, 0, 0 )
		end
	end
end )
