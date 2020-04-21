drugTimers = {}

function crackAnimation_func ( guy )

	local player
	if not client then
		player = guy
	else
		player = client
	end
	if not getPedOccupiedVehicle ( player ) then
		if not vnxGetElementData ( player, "imGW" ) then		
			local pname = getPlayerName ( player )
			setPedAnimation ( player, "crack", "crckdeth2", 7500, true, true, false )
			if drugTimers[pname] then
				if isTimer ( drugTimers[pname] ) then
					killTimer ( drugTimers[pname] )
				end
				drugTimers[pname] = nil
			end
			drugTimers[pname] = setTimer ( setPedAnimation, 7500, 1, player )
		end
	end
end
addEvent ( "crackAnimation", true )
addEventHandler ( "crackAnimation", getRootElement(), crackAnimation_func )

function drunkAnimation_func ()

	local player = client
	if not getPedOccupiedVehicle ( player ) then
		local pname = getPlayerName ( player )
		setPedAnimation ( player, "ped", "WALK_drunk", 3000, true, true, false )
		if drugTimers[pname] then
			if isTimer ( drugTimers[pname] ) then
				killTimer ( drugTimers[pname] )
			end
			drugTimers[pname] = nil
		end
		drugTimers[pname] = setTimer ( setPedAnimation, 3000, 1, player )
	end
end
addEvent ( "drunkAnimation", true )
addEventHandler ( "drunkAnimation", getRootElement(), drunkAnimation_func )