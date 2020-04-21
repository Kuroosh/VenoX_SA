------------------------
---- By VenoX RL Crew &--
---- Solid_Snake -------
------------------------


local phonesound = nil




function achievsound_func ()

	local sound = playSound ("sounds/reached.mp3", false)
	setSoundVolume ( sound, 0.15 )
end
addEvent ( "achievsound", true )
addEventHandler ( "achievsound", getRootElement(), achievsound_func )

function mousesound_func ()
	local sound = playSound ("sounds/mouseclick.wav", false)
	setSoundVolume ( sound, 1 )
end

function phonesound_func ()
	if isElement ( phonesound ) then
		stopSound ( phonesound )
	end
	phonesound = playSound ("sounds/ringtone.mp3", true)
	setSoundVolume ( phonesound, .5 )
end
addEvent ( "phonesound", true )
addEventHandler ( "phonesound", getRootElement(), phonesound_func )


function phonebesetzt_func ()
	if isElement ( phonesound ) then
		stopSound ( phonesound )
	end
	phonesound = playSound ("sounds/besetzt.mp3", false)
	setSoundVolume ( phonesound, .3 )
end
addEvent ( "phonebesetzt", true )
addEventHandler ( "phonebesetzt", getRootElement(), phonebesetzt_func )


function phonekeinanschluss_func ()
	if isElement ( phonesound ) then
		stopSound ( phonesound )
	end
	phonesound = playSound ("sounds/keinanschluss.mp3", false)
	setSoundVolume ( phonesound, .3 )
end
addEvent ( "phonekeinanschluss", true )
addEventHandler ( "phonekeinanschluss", getRootElement(), phonekeinanschluss_func )


function phonesms_func ()

	local sound = playSound ("sounds/sms.mp3", false)
	setSoundVolume ( sound, .3 )
end
addEvent ( "phonesms", true )
addEventHandler ( "phonesms", getRootElement(), phonesms_func )


function phonewartezeichen_func ()
	if isElement ( phonesound ) then
		stopSound ( phonesound )
	end
	phonesound = playSound ("sounds/wartezeichen.mp3", true)
	setSoundVolume ( phonesound, .5 )
end
addEvent ( "phonewartezeichen", true )
addEventHandler ( "phonewartezeichen", getRootElement(), phonewartezeichen_func )


function stopphonesound_func ()
	if isElement ( phonesound ) then
		stopSound ( phonesound )
	end
end
addEvent ( "stopphonesound", true )
addEventHandler ( "stopphonesound", getRootElement(), stopphonesound_func )


function sprunksound_func ()

	local sound = playSound ("sounds/sprunk.ogg", false)
	setSoundVolume ( sound, .3 )
end
addEvent ( "sprunksound", true )
addEventHandler ( "sprunksound", getRootElement(), sprunksound_func )

function highnoonsound_func ( rnd )

	local sound = playSound ("sounds/highnoon.ogg", false)
	setSoundVolume ( sound, 1 )
	setTimer ( bellsound_func, rnd*1000, 1, sound )
end
addEvent ( "highnoonsound", true )
addEventHandler ( "highnoonsound", getRootElement(), highnoonsound_func )

function bellsound_func ( sound )

	stopSound ( sound )
	local sound = playSound ("sounds/bell.ogg", false)
	setSoundVolume ( sound, 1 )
end
addEvent ( "bellsound", true )
addEventHandler ( "bellsound", getRootElement(), bellsound_func )

function katjuschasound_func ( rockets, timeBetween, x, y, z )

	local sound = playSound3D ("sounds/katjuscha.wav", x, y, z, false)
	setSoundVolume ( sound, 1 )
	setTimer ( katjuschaPlaySound, timeBetween, rockets, x, y, z )
end
addEvent ( "katjuschasound", true )
addEventHandler ( "katjuschasound", getRootElement(), katjuschasound_func )

function locksound_func ()

	local sound = playSound ("sounds/carlock.mp3", false)
	setSoundVolume ( sound, .3 )
end
addEvent ( "locksound", true )
addEventHandler ( "locksound", getRootElement(), locksound_func )

function katjuschaPlaySound ( x, y, z)

	local sound = playSound3D ("sounds/katjuscha.wav", x, y, z, false)
	setSoundVolume ( sound, 1 )
end

txd = engineLoadTXD ( "images/raindanc.txd" )
engineImportTXD ( txd, 563 )