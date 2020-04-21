local function gang_func ( player, _, cmd, ... )

	executeCommandHandler ( gang..cmd, player, ... )
end
addCommandHandler ( "gang", gang_func )

