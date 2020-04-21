function accept_func ( player, cmd, typ )

	if typ == "race" then
		acceptRace ( player )
	end
end
addCommandHandler ( "accept", accept_func )