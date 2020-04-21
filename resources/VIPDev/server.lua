

local isSpeaker = false

local function print ( player, message, r, g, b )
	outputChatBox ( message, player, r, g, b )
end

speakerBox = { }

addEvent ( "onPlayerPlaceSpeakerBox", true )
addEventHandler ( "onPlayerPlaceSpeakerBox", root, function ( url, isCar ) 
	if ( url ) then
		if ( isElement ( speakerBox [ client ] ) ) then
			local x, y, z = getElementPosition ( speakerBox [ client ] ) 
			print ( client, "Ghettoblaster zerstört", 255, 0, 0 )
			destroyElement ( speakerBox [ client ] )
			removeEventHandler ( "onPlayerQuit", client, destroySpeakersOnPlayerQuit )
		end
		local x, y, z = getElementPosition ( client )
		local rx = getElementRotation ( client )
		speakerBox [ client ] = createObject ( 2226, x-0.5, y+0.5, z - 1, 0, 0, rx )
		print ( client, "Ghettoblaster platziert", 0, 255, 0 )
		addEventHandler ( "onPlayerQuit", client, destroySpeakersOnPlayerQuit )
		triggerClientEvent ( root, "onPlayerStartSpeakerBoxSound", client, url, isCar )
		if ( isCar ) then
			local car = getPedOccupiedVehicle ( client )
			attachElements ( speakerBox [ client ], car, 0, -0.7, 0.3, 0, 0, 0 )
			setElementCollisionsEnabled ( speakerBox [ client ], false )
		else
			triggerClientEvent ( root, "attachSpeakerBoxOnPlayer", client, speakerBox [ client ] )
		end
	end
end )

addEvent ( "onPlayerDestroySpeakerBox", true )
addEventHandler ( "onPlayerDestroySpeakerBox", root, function ( )
	if ( isElement ( speakerBox [ client ] ) ) then
		destroyElement ( speakerBox [ client ] )
		triggerClientEvent ( client, "onPlayerDestroySpeakerBox", client )
		removeEventHandler ( "onPlayerQuit", client, destroySpeakersOnPlayerQuit )
		print ( client, "Ghettoblaster wurde entfernt.", 255, 0, 0 )
	else
		--print ( client, "Du hast kein Ghettoblaster platziert.", 255, 255, 0 )
	end
end )

addEvent ( "onPlayerChangeSpeakerBoxVolume", true ) 
addEventHandler ( "onPlayerChangeSpeakerBoxVolume", root, function ( to )
	triggerClientEvent ( root, "onPlayerChangeSpeakerBoxVolumeC", client, to )
end )

function destroySpeakersOnPlayerQuit ( )
	if ( isElement ( speakerBox [ source ] ) ) then
		destroyElement ( speakerBox [ source ] )
		triggerClientEvent (root, "onPlayerDestroySpeakerBox", source )
	end
end