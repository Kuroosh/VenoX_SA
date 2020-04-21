--[[lsrped = createPed ( 0, -1984.3, 217.4, 27.7 )
setElementData ( lsrped, "lsrped", true )
setPedRotation ( lsrped, 180 )


addEventHandler( "onPedWasted", getRootElement(),
	function ( killer )
		if source == lsrped then
			destroyElement ( lsrped )
			lsrped = createPed ( 0, -1984.3, 217.4, 27.7 )
			setElementData ( lsrped, "lreped", true )
			setPedRotation ( lsrped, 180 )
		end
	end
)]]