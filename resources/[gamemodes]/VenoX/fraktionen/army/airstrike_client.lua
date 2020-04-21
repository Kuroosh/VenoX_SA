function AirstrikeThrowDo_func ( airStrikeTrash, player )

	counter = 0
	setTimer ( AirstrikeThrowDoSingle, 250, 8, airStrikeTrash, player )
end
addEvent ( "AirstrikeThrowDo", true )
addEventHandler ( "AirstrikeThrowDo", getRootElement(), AirstrikeThrowDo_func )

function AirstrikeThrowDoSingle ( airStrikeTrash, player )

	local x, y, z = getElementPosition ( airStrikeTrash )
	counter = counter+ 1
	createProjectile ( player, 21, x, y-19, z-2, 1, nil )
	createProjectile ( player, 21, x+0.5, y-18, z-2, 1, nil )
end