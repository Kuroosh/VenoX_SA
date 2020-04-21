ircMembers = {}

function joinIRC_func ()

	if client then
		if not ircMembers[client] then
			ircMembers[client] = getPlayerName ( client )
			sendMSGToAllIRCMembers ( "* "..ircMembers[client].." hat den Chat betreten." )
			
			for key, index in pairs ( ircMembers ) do
				triggerClientEvent ( key, "memberJoin", key, client )
			end
		end
	end
end
addEvent ( "joinIRC", true )
addEventHandler ( "joinIRC", getRootElement(), joinIRC_func )

function leaveIRC_func ()

	if ircMembers[client] then
		ircMembers[client] = nil
		sendMSGToAllIRCMembers ( "* "..getPlayerName ( client ).." hat den Chat verlassen." )
		
		for key, index in pairs ( ircMembers ) do
			triggerClientEvent ( key, "memberQuit", key, client )
		end
	end
end
addEvent ( "leaveIRC", true )
addEventHandler ( "leaveIRC", getRootElement(), leaveIRC_func )

function IRCChat_func ( msg )

	if #msg <= 150 then
		sendMSGToAllIRCMembers ( getPlayerName ( client )..": "..msg )
	end
end
addEvent ( "IRCChat", true )
addEventHandler ( "IRCChat", getRootElement(), IRCChat_func )





function sendMSGToAllIRCMembers ( msg )

	for key, index in pairs ( ircMembers ) do
		if isElement ( key ) then
			triggerClientEvent ( key, "sendMSGInICR", key, msg )
		else
			ircMembers[key] = nil
			sendMSGToAllIRCMembers ( "* "..index.." hat den Chat verlassen." )
		end
	end
end