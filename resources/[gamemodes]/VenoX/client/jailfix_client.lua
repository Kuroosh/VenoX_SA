function jailKeyDisable ()

	if getElementData ( lp, "jailtime" ) > 0 or getElementData ( lp, "prison" ) > 0 then
		toggleControl ( "enter_exit", false )
		toggleControl ( "fire", false )
		toggleControl ( "jump", false )
		toggleControl ( "action", false )
		setTimer ( jailKeyDisable, 1000, 1 )
	end
end
addEvent ( "jailKeyDisable", true )
addEventHandler ( "jailKeyDisable", getRootElement(), jailKeyDisable )