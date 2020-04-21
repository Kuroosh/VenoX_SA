

function trigger_largePeach_server(player,text)
	outputChatBox( getPlayerName(player).." sagt : "..text , getRootElement(), 255, 135, 0)
end 
addEvent( "triggerLargePeachbitch", true)
addEventHandler( "triggerLargePeachbitch", getRootElement(), trigger_largePeach_server)