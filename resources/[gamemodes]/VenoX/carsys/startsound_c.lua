
function startsound()
	sound_carmotor = playSound3D( "carsys/sound.mp3", getElementPosition(getLocalPlayer()))
	setSoundVolume(sound,0.9)
	setSoundMaxDistance(sound, 30)
end


function stopsound_carvnx()
	stopSound(sound_carmotor)
end

addEvent("startsound",true)
addEvent("stopsound_carvnx",true)
addEventHandler("startsound",getLocalPlayer(),startsound)
addEventHandler("stopsound_carvnx",getLocalPlayer(),stopsound_carvnx)
