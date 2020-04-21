---------------------------------------------------------------------------------------------
sound = playSound3D ( "http://www.iloveradio.de/ilove2dance.m3u", 2550.36, -1523.10, -12.3 ) 
function initSound ()
setSoundMinDistance ( sound, 1 )
setSoundMaxDistance ( sound, 24 )
end
addEventHandler( "onClientResourceStart", getRootElement(), initSound )