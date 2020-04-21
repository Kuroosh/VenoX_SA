addEvent ( "robberJobAccepted", true )
function givePlayerJob ( )
	vnxSetElementData ( source, "job", "robber")
	setElementModel ( source, 2 )
end
addEventHandler ( "robberJobAccepted", root, givePlayerJob )

addEvent ( "givePlayerPay", true )
function givePlayerRobPay ()
	money = math.random ( 100, 500 )
	vnxSetElementData ( source, "money", vnxGetElementData ( source, "money" ) + money )
	outputChatBox ( "Du bist in das Haus eingebrochen und hast verdient: $" ..money, source )
	fadeCamera ( source, false, 1, 0, 0, 0 )
	setTimer ( fadeCamera, 1000, 1, source, true, 1 )
end
addEventHandler ( "givePlayerPay", root, givePlayerRobPay )