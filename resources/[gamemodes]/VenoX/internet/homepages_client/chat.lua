local maindomane = "chat.com"
 Domanes[maindomane]=maindomane
 
 Domanes["www.chat.com"]=maindomane
 Domanes["chat.de"]=maindomane
 Domanes["www.chat.de"]=maindomane
 Domanes["chat"]=maindomane
 Domanes["irc"]=maindomane
 
isInIRC = false

ircMembers = {}

addEvent ( maindomane, true )
addEventHandler ( maindomane, getRootElement(), 
	function ()
		local img = createBasicPage ( "black" )
		
		gMemo[1] = guiCreateMemo(7,6,286,236,"",false,img)
		guiMemoSetReadOnly(gMemo[1],true)
		gMemo[2] = guiCreateMemo(6,248,288,44,"",false,img)
		gButton[1] = guiCreateButton(309,249,80,41,"Senden",false,img)
		guiSetFont(gButton[1],"default-bold-small")
		gGrid[1] = guiCreateGridList(300,6,94,238,false,img)
		guiGridListSetSelectionMode(gGrid[1],2)
		gColumn[1] = guiGridListAddColumn(gGrid[1],"Teilnehmer",0.8)
		
		addEventHandler ( "onClientGUIClick", gButton[1], 
			function ()
				local msg = guiGetText ( gMemo[2] )
				if #msg >= 3 and #msg <= 150 then
					triggerServerEvent ( "IRCChat", lp, msg )
					guiSetText ( gMemo[2], "" )
				else
					outputChatBox ( "Deine Nachricht muss max. 150 und mind. 3 Zeichen haben.", 125, 0, 0 )
				end
			end,		
		false )
		
		isInIRC = true
		triggerServerEvent ( "joinIRC", lp )
	end
)

function memberJoin_func ( member )

	ircMembers[member] = getPlayerName ( member )
	refreshIRCList()
end
addEvent ( "memberJoin", true )
addEventHandler ( "memberJoin", getRootElement(), memberJoin_func )

function memberQuit_func ( member )

	ircMembers[member] = nil
	refreshIRCList()
end
addEvent ( "memberQuit", true )
addEventHandler ( "memberQuit", getRootElement(), memberQuit_func )

function refreshIRCList ()

	guiGridListClear ( gGrid[1] )
	for key, index in pairs ( ircMembers ) do
		local row = guiGridListAddRow ( gGrid[1] )
		guiGridListSetItemText ( gGrid[1], row, gColumn[1], index, true, true )
	end
end

function sendMSGInICR_func ( msg )

	guiSetText ( gMemo[1], guiGetText ( gMemo[1] )..msg )
end
addEvent ( "sendMSGInICR", true )
addEventHandler ( "sendMSGInICR", getRootElement(), sendMSGInICR_func )