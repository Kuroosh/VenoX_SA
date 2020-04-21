function misfire ()

	local x, y, z = getElementPosition ( client )
	createExplosion ( x, y, z, 2, client )
	takeWeapon ( client, getPedWeapon ( client ), 1 )
end
addEvent ( "misfire", true )
addEventHandler ( "misfire", getRootElement(), misfire )