local createStrings = {}
	createStrings["gang"] = "creategang"


function create_func ( player, _, cmd, arg1, arg2 )

	local string = createStrings[cmd]
	if string then
		executeCommandHandler ( createStrings[cmd], player, arg1, arg2 )
	end
end
addCommandHandler ( "create", create_func )