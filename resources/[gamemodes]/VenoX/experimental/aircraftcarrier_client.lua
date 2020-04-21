function traeger_position ()

	createBlipAttachedTo ( traegerhuelle, 5, 2, 0, 0, 0, 255, 0 )
	createBlipAttachedTo ( traegerhuelle, 57, 2, 0, 0, 0, 255, 1 )
end
addEventHandler("onPlayerJoin", getRootElement(), traeger_position )