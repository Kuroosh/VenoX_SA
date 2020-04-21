g_loc_pla = getLocalPlayer ()
g_loc_root = getRootElement ()

addEvent ( "destroyTrepassor", true )
addEventHandler ( "destroyTrepassor", g_loc_root,
	function ()
		
		posX = 15.7054
		posY =  1719.3632
		posZ =  50.123
		
		posX2 = 237.7176
		posY2 =  1696.5727
		posZ2 =  50.1087
		
		posX3 = 354.6243
		posY3 = 2028.3897
		posZ3 = 50.1217
		
		posX4 = 188.241
		posY4 = 2081.3469
		posZ4 = 50.1422
		
		local isInResArea = getElementData ( g_loc_pla, "inRestrictedArea" )
		
		rotZ = getPedRotation ( g_loc_pla )
		
		if isInResArea == "true" then
			timer1 = setTimer ( createProjectile, 40000, 0, g_loc_pla, 20, posX, posY, posZ, 1.0, g_loc_pla, 0, 0, rotZ, 0.1, 0.1, 0.1 )
			timer2 = setTimer ( createProjectile, 40000, 0, g_loc_pla, 20, posX2, posY2, posZ2, 1.0, g_loc_pla, 0, 0, rotZ, 0.1, 0.1, 0.1 )
			timer3 = setTimer ( createProjectile, 40000, 0, g_loc_pla, 20, posX3, posY3, posZ3, 1.0, g_loc_pla, 0, 0, rotZ, 0.1, 0.1, 0.1 )
			timer4 = setTimer ( createProjectile, 40000, 0, g_loc_pla, 20, posX4, posY4, posZ4, 1.0, g_loc_pla, 0, 0, rotZ, 0.1, 0.1, 0.1 )
		end
		
	end
)

addEvent ( "destroyTimers", true )
addEventHandler ( "destroyTimers", g_loc_root,
	function ()
		
		local isInResArea = getElementData ( g_loc_pla, "inRestrictedArea" )
		if isInResArea == "false" then
			killTimer ( timer1 )
			killTimer ( timer2 )
			killTimer ( timer3 )
			killTimer ( timer4 )
		end
		
	end
)
