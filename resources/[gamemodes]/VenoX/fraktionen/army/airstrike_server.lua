function airstrike_func ( player )

	if isArmyAirstrikePermitted ( player ) then
		vnxSetElementData ( player, "airstrike", true )
		outputChatBox ( "Luftschlag bereit - klicke an die entsprechende Stelle!", player, 0, 125, 0 )
	else
		outputChatBox ( "Du hast keine Berechtigung dafuer!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "airstrike", airstrike_func )

function isArmyAirstrikePermitted ( player )

	if isArmy ( player ) then
		if vnxGetElementData ( player, "armyperm4" ) >= 1 and vnxGetElementData ( player, "armyperm8" ) >= 1 then
			return true
		end
	end
	return false
end

curAirstrike = false

function createAirstrike ( player, x, y, z )

	if not curAirstrike then
		outputChatBox ( "Luftschlag gesetzt!", player, 0, 125, 0 )
		curAirstrike = true
		airStrikeTrash = createObject ( 1337, x, y-200, z+50 )
		airStrikePlane = createVehicle ( 592, x, y-200, z+50 )
		setVehicleEngineState ( airStrikePlane, true )
		setVehicleColor ( airStrikePlane, 0, 0, 0, 0 )
		attachElements ( airStrikePlane, airStrikeTrash )
		setVehicleDamageProof ( airStrikePlane, true )
		
		moveObject ( airStrikeTrash, 20000, x, y+200, z+50 )
		setTimer ( AirstrikeThrow, 9000, 1, player )
		setTimer ( killAirstrikeRests, 20000, 1 )
	end
end

function killAirstrikeRests ()

	destroyElement ( airStrikeTrash )
	destroyElement ( airStrikePlane )
	curAirstrike = false
end

function AirstrikeThrow ( player, x, y, z )

	triggerClientEvent ( getRootElement(), "AirstrikeThrowDo", getRootElement(), airStrikeTrash, player )
end