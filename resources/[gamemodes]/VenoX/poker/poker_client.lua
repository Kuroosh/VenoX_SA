function joinPokerTable_func ( dim )

	setPokerCamera ()
	createPokerDecoration ( dim )
end
addEvent ( "joinPokerTable", true )
addEventHandler ( "joinPokerTable", getRootElement(), joinPokerTable_func )

function createPokerDecoration ( dim )

	for key, index in pairs ( pokerDekoration ) do
		local int = pokerDekoration["int"][key]
		local model = pokerDekoration["id"][key]
		local x, y, z, r = pokerDekoration["x"][key], pokerDekoration["y"][key], pokerDekoration["z"][key], pokerDekoration["r"][key]
	end
end

function setPokerCamera ()

	local x, y, z = pokerChipPositions["x"][0], pokerChipPositions["y"][0], pokerChipZPosition
	local tx, ty = pokerChipPositions["x"][0], pokerChipPositions["y"][0]
	setCameraMatrix ( x, y, pokerCamAddHight + z, tx, ty, z )
end