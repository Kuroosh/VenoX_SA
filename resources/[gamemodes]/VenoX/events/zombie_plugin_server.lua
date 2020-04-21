function addPlayerPumpkins ( player, amount )

	outputChatBox ( "Du hast einen Zombie erledigt! Als Belohnung erhälst du 3 Kürbisse.", player, 200, 0, 0 )
	vnxSetElementData ( player, "easterEgg", vnxGetElementData ( player, "easterEgg" ) + amount )
end