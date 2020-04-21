local admindutyskin = 260
local clantagwithsquarebracket = false
local admindutyarray = { vehicles = {}, skins = {} }

local laststatus = {}




function adminDuty ( player )
	if vnxGetElementData ( player, "adminlvl" ) >= 3 then
		if not admindutyarray.skins[player] then
			--laststatus[player] = vnxGetElementData ( player, "socialState" )
			--vnxSetElementData ( player, "socialState", "Admin-Duty" )
			outputChatBox(getPlayerName(player).." ist nun im Admin-Duty",getRootElement(),0,255,255)
			admindutyarray.skins[player] = getElementModel ( player )
			setElementModel ( player, admindutyskin )
			addEventHandler ( "onPlayerQuit", player, quitAdminDuty )
			addEventHandler ( "onPlayerWeaponSwitch", player, dontHoldWeaponInAdminDuty )
			triggerClientEvent ( player, "inAdminDuty", player ) 
			local x, y, z = getElementPosition ( player )
			local rx, ry, rz = getElementRotation ( player )
			local name = getPlayerName ( player )
			if clantagwithsquarebracket then
				name = gettok ( name, 2, string.byte ( "]" ) ) or name
			end
		else
			--if laststatus[player] then
				--vnxSetElementData ( player, "socialState", laststatus[player] )
				--laststatus[player] = nil
			--end
			triggerClientEvent ( player, "notInAdminDuty", player ) 
			outputChatBox(getPlayerName(player).." ist nun nicht mehr im Admin-Duty",getRootElement(),0,255,255)
			setElementModel ( player, admindutyarray.skins[player] )
			admindutyarray.skins[player] = nil
			
			removeEventHandler ( "onPlayerQuit", player, quitAdminDuty )
			removeEventHandler ( "onPlayerWeaponSwitch", player, dontHoldWeaponInAdminDuty )
		end
	else
		infobox ( player, "Du bist\nnicht befugt!", 4000, 155, 0, 0 )
	end
end
addCommandHandler ( "aduty", adminDuty )


function quitAdminDuty ( )
	if admindutyarray.skins[source] then
		admindutyarray.skins[source] = nil
	end
end


function stopEnterTheAdminCar ( player, _, _, door )
	if door == 0 and player ~= getPlayerByAdminVehicle ( source ) then
		cancelEvent()
	end
end


function getPlayerByAdminVehicle ( vehicle )
	for player, veh in pairs ( admindutyarray.vehicles ) do
		if veh == vehicle then
			return player
		end
	end
	return false
end


function adminCarDestroyed ( )
	for key, vehicle in pairs ( admindutyarray.vehicles ) do
		if vehicle == source then
			admindutyarray.vehicles[key] = nil
		end
	end
end


function dontHoldWeaponInAdminDuty ( )
	setPedWeaponSlot ( source, 0 )
end