curMaxSpeed = false

function limit_func ( cmd, amount )
	if vnxClientGetElementData ( "imzugjob" ) or vnxClientGetElementData ( "imtramjob" ) then return false end
	local amount = tonumber ( amount )
	if amount then
		local amount = math.abs ( amount )
		curMaxSpeed = amount
		curMaxSpeed = curMaxSpeed*0.00464
		if not isTimer ( curMaxSpeedTimer ) then
			curMaxSpeedTimer = setTimer ( fixSpeed, 50, 0 )
		end
		outputChatBox ( "Maximale Geschwindigkeit auf "..amount.." km/h gesetzt - tippe /stoplimit, um es zu entfernen.", 125, 0, 0 )
	else
		outputChatBox ( "Bitte gib eine gueltige km/h Zahl an!", 125, 0, 0 )
	end
end
addCommandHandler ( "limit", limit_func )

function stoplimit_func ()

	if not curMaxSpeed then
		if not vnxClientGetElementData ( "imzugjob" ) and not vnxClientGetElementData ( "imtramjob" ) then
			outputChatBox ( "Du hast momentan den Tempomat nicht aktiviert - tippe /limit [km/h], um ihn zu aktivieren!", 125, 0, 0 )
		end
	else
		curMaxSpeed = false
		killTimer ( curMaxSpeedTimer )
		outputChatBox ( "Tempomat wurde entfernt!", 0, 125, 0 )
	end
end
addCommandHandler ( "stoplimit", stoplimit_func )

function fixSpeed ()

	local veh = getPedOccupiedVehicle(lp)
	if veh then
		if isVehicleOnGround ( veh ) and getPedOccupiedVehicleSeat ( lp ) == 0 then
			local vx, vy, vz = getElementVelocity(veh)
			local speed = math.sqrt(vx^2 + vy^2 + vz^2)
			if speed > curMaxSpeed then
				setElementVelocity ( veh, vx*0.97, vy*0.97, vz*0.97 )
			end
		end
	end
end

function blitzer ()

	local img = guiCreateStaticImage ( 0, 0, 1, 1, "images/colors/c_white.jpg", true, nil )
	guiSetAlpha ( img, 0 )
	setTimer ( blitzerIMGAlpha, 50, 10, img, true )
end
addEvent ( "blitzer", true )
addEventHandler ( "blitzer", getRootElement(), blitzer )

function blitzerIMGAlpha ( img, lower )

	if lower then
		guiSetAlpha ( img, guiGetAlpha ( img ) + 0.1 )
		if guiGetAlpha ( img ) >= 1 then
			setTimer ( blitzerIMGAlpha, 50, 10, img, false )
		end
	else
		guiSetAlpha ( img, guiGetAlpha ( img ) - 0.1 )
		if guiGetAlpha ( img ) == 0 then
			destroyElement ( img )
		end
	end
end

function showBlitzerGUI ( kmh, tomuch, strafe, points )

	gImage["ticket"] = guiCreateStaticImage(screenwidth/2-354/2,0,354,187,"images/colors/c_white.jpg",false)
	gImage[2] = guiCreateStaticImage(13,45,103,101,"images/gui/police.png",false,gImage["ticket"])
	gImage[3] = guiCreateStaticImage(0,0,354,17,"images/colors/c_red.jpg",false,gImage["ticket"])
	gLabel[1] = guiCreateLabel(0,20,354,18,"STRAFZETTEL",false,gImage["ticket"])
	guiLabelSetColor(gLabel[1],0,0,0)
	guiLabelSetVerticalAlign(gLabel[1],"top")
	guiLabelSetHorizontalAlign(gLabel[1],"center",false)
	guiSetFont(gLabel[1],"default-bold-small")
	gLabel[2] = guiCreateLabel(130,42,102,110,"Geschwindigkeit:\n\nÜberschreitung:\n\nStrafe:\n\nSTVO-Punkte:",false,gImage["ticket"])
	guiLabelSetColor(gLabel[2],0,0,0)
	guiLabelSetVerticalAlign(gLabel[2],"top")
	guiLabelSetHorizontalAlign(gLabel[2],"left",false)
	guiSetFont(gLabel[2],"default-bold-small")
	gImage[4] = guiCreateStaticImage(0,170,354,17,"images/colors/c_red.jpg",false,gImage["ticket"])
	gLabel[3] = guiCreateLabel(1,1,352,16,"Leertaste zum ausblenden",false,gImage[4])
	guiLabelSetColor(gLabel[3],255,255,255)
	guiLabelSetVerticalAlign(gLabel[3],"top")
	guiLabelSetHorizontalAlign(gLabel[3],"center",false)
	gLabel[4] = guiCreateLabel(131,42,203,110,kmh.." km/h\n\n"..tomuch.." km/h\n\n"..strafe.." $\n\n+"..points.." = "..getElementData ( lp, "stvo_punkte" ),false,gImage["ticket"])
	guiLabelSetColor(gLabel[4],0,0,0)
	guiLabelSetVerticalAlign(gLabel[4],"top")
	guiLabelSetHorizontalAlign(gLabel[4],"right",false)
	guiSetFont(gLabel[4],"default-bold-small")
	
	bindKey ( "space", "down", hideBlitzerGUI )
end
addEvent ( "showBlitzerGUI", true )
addEventHandler ( "showBlitzerGUI", getRootElement(), showBlitzerGUI )

function hideBlitzerGUI ()

	destroyElement ( gImage["ticket"] )
	unbindKey ( "space", "down", hideBlitzerGUI )
end