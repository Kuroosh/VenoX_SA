function addFriend_func ( player, friend )
	if player == client then
		if player == getPlayerFromName ( friend ) then
			outputChatBox ( "Du kannst dich nicht selber zur Friendlist hinzufügen!", player, 125, 0, 0 )
		elseif getPlayerFromName ( friend ) then
			triggerClientEvent ( player, "addFriend", getRootElement(), getPlayerName(getPlayerFromName ( friend )) )
		elseif playerUID[friend] then
			triggerClientEvent ( player, "addFriend", getRootElement(), friend )
		else
			outputChatBox ( "Der Spieler existiert nicht!", player, 125, 0, 0 )
		end
	end
end
addEvent ( "addFriend", true )
addEventHandler ( "addFriend", getRootElement(), addFriend_func )