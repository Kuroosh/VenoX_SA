function backchange ( oldnick, newnick )

	outputChatBox ( "Du darfst deinen Namen nicht aendern - frage dazu einen Admin!", getPlayerFromName ( oldnick ), 125, 0, 0 )
	cancelEvent()
end
addEventHandler ( "onPlayerChangeNick", getRootElement(), backchange )