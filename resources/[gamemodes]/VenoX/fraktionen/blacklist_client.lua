addEvent ( "triggeredBlacklist", true )
addEvent ( "playerInBlacklistDied", true )
addEvent ( "playerInBlacklistJoined", true )

blacklistArray = {}


addEventHandler ( "triggeredBlacklist", root, function ( array )
	blacklistArray = {}
	if array then
		for i, v in pairs ( array ) do
			blacklistArray[i] = v
		end 
	end
end )


addEventHandler ( "playerInBlacklistDied", root, function ( name )
	blacklistArray[name] = nil
end )


addEventHandler ( "playerInBlacklistJoined", root, function ( name )
	blacklistArray[name] = true
end )