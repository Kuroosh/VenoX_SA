function leaveclub_func ( player )

	if vnxGetElementData ( player, "club" ) ~= "none" then
		vnxSetElementData ( player, "club", "none" )
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast deine\nMitgliedschaft im\nVerein/Club gekündigt.", 7500, 0, 125, 0 )
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist in\nkeinem Club/Verein!", 7500, 125, 0, 0 )
	else
		outputChatBox ( "Du bist in keinem Club!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "leaveclub", leaveclub_func )