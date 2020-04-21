---------------------------------------------------------------------------------------------
sound = playSound3D ( "http://www.iloveradio.de/ilove2dance.m3u", -1986.9011, 217.553, 27.687 ) 
function initSound ()
setSoundMinDistance ( sound, 1 )
setSoundMaxDistance ( sound, 12 )
end
addEventHandler( "onClientResourceStart", getRootElement(), initSound )
---------------------------------------------------------------------------------------------
sound1 = playSound3D ( "http://www.iloveradio.de/ilove2dance.m3u", -1995.505, 217.553, 27.687 )
function initSound1 ()
setSoundMinDistance ( sound1, 1 )
setSoundMaxDistance ( sound1, 12 )
end
addEventHandler ( "onClientResourceStart", getRootElement (), initSound1 )
----------------------------------------------------------------------------------------------