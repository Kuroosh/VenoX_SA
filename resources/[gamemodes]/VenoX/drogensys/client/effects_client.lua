drugSettings = {}
drugColors = {}
drugSettings.interval = 400
drugSettings.aimDisturbe = 10
drugSettings.maxColor = 0.7

timeToGo = 0
strenght = 0

drugRunSwitch = false

function startDrugEffect_func ( level, drug ) -- In 1000tel Sekunden bzw. MS; 0-1 in Heftigkeit -> 1 = Extrem, 0 = Nicht spürbar

	if drug == "drunk" then
		drunken = true
	elseif drug == "stone" then
		stoned = true
	--[[elseif drug == "koks" then
		koks = true
		setGameSpeed ( 1.50 )]]--
	end

	
	if drugColors["white"] then
		guiSetVisible ( drugColors["white"], true )
		guiSetVisible ( drugColors["green"], true )

		if drugColors["blue"] then
			guiSetVisible ( drugColors["blue"], true )
			guiSetVisible ( drugColors["red"], true )
		end
	else
		if stoned then
			drugColors["white"] = guiCreateStaticImage ( 0, 0, screenwidth, screenheight, "images/white.bmp", false )
			guiSetAlpha ( drugColors["white"], 0 )
			guiMoveToBack ( drugColors["white"] )
			
			drugColors["green"] = guiCreateStaticImage ( 0, 0, screenwidth, screenheight, "images/colors/c_green.jpg", false )
			guiSetAlpha ( drugColors["green"], 0.5 )
			guiMoveToBack ( drugColors["green"] )
			
		elseif drunken then
			drugColors["white"] = guiCreateStaticImage ( 0, 0, screenwidth, screenheight, "images/white.bmp", false )
			guiSetAlpha ( drugColors["white"], 0.5 )
			guiMoveToBack ( drugColors["white"] )
			
			drugColors["red"] = guiCreateStaticImage ( 0, 0, screenwidth, screenheight, "images/colors/c_red.jpg", false )
			guiSetAlpha ( drugColors["red"], 0 )
			guiMoveToBack ( drugColors["red"] )
			
			drugColors["green"] = guiCreateStaticImage ( 0, 0, screenwidth, screenheight, "images/colors/c_green.jpg", false )
			guiSetAlpha ( drugColors["green"], 0 )
			guiMoveToBack ( drugColors["green"] )
			
			drugColors["blue"] = guiCreateStaticImage ( 0, 0, screenwidth, screenheight, "images/colors/c_blue.jpg", false )
			guiSetAlpha ( drugColors["blue"], 0 )
			guiMoveToBack ( drugColors["blue"] )
					
		end
	end
	level = level * 5
	strenght = level
	time = level*60000

	if isTimer ( drugEffectTimer ) then
		killTimer ( drugEffectTimer )
		timeToGo = time + timeToGo
	else
		timeToGo = time
	end
	
	drugEffectTimer = setTimer ( drugEffectRepeat, drugSettings.interval, 0 )
end
addEvent ( "startDrugEffect", true )
addEventHandler ( "startDrugEffect", getRootElement(), startDrugEffect_func )


function drugEffectRepeat ( )
	
	if getElementHealth ( lp ) <= 0 then
		deactivateDrugEffect_func ()
		return
	end
	if strenght > 0.1 then
		if math.random ( 1, 10000 ) / 1000 <= strenght then
			if drunken then
				triggerServerEvent ( "drunkAnimation", lp )
			end
		end
	end
	if math.random ( 1, 50000 ) / 100 <= strenght then
		if stoned then
			triggerServerEvent ( "crackAnimation", lp )
		end
	end
	local count = math.floor ( drugSettings.interval / 50 )
	setTimer ( drugFalshEffect, 50, count )
	setTimer ( drugAiming, 50, count )
	if drugRunSwitch then
		drunkDiveMode ()
	end
	drugRunSwitch = not drugRunSwitch
	timeToGo = timeToGo - drugSettings.interval
	if timeToGo <= 0 then
		deactivateDrugEffect_func ()
	elseif timeToGo <= 5000 then
		strenght = strenght * 0.8
	end
end

function drugFalshEffect ( drug )

	local rnd
	if stoned then
		rnd = math.random ( 1, 10 ) / 10 * strenght * drugSettings.maxColor
		guiSetAlpha ( drugColors["white"], rnd )
		rnd = math.random ( 1, 20 ) / 10 * strenght * drugSettings.maxColor
		guiSetAlpha ( drugColors["green"], rnd )
		
		guiMoveToBack ( drugColors["white"] )
		guiMoveToBack ( drugColors["green"] )
	elseif drunken then
		guiSetAlpha ( drugColors["white"], 0 )
		rnd = math.random ( 1, 10 ) / 10 * strenght * drugSettings.maxColor
		guiSetAlpha ( drugColors["red"], rnd )
		rnd = math.random ( 1, 10 ) / 10 * strenght * drugSettings.maxColor
		guiSetAlpha ( drugColors["green"], rnd )
		rnd = math.random ( 1, 10 ) / 10 * strenght * drugSettings.maxColor
		guiSetAlpha ( drugColors["blue"], rnd )
		
		guiMoveToBack ( drugColors["white"] )
		guiMoveToBack ( drugColors["red"] )
		guiMoveToBack ( drugColors["green"] )
		guiMoveToBack ( drugColors["blue"] )
	end
end

function deactivateDrugEffect_func ()

	guiSetAlpha ( drugColors["white"], 0 )
	
	killTimer ( drugEffectTimer )
	
	timeToGo = 0
	
	toggleControl ( "vehicle_left", true )
	toggleControl ( "vehicle_right", true )
	
	setPedControlState ( "vehicle_left", false )
	setPedControlState ( "vehicle_right", false )
	
	drunken = false
	stoned = false
	
	setGameSpeed ( 1 )
end
addEvent ( "deactivateDrugEffect", true )
addEventHandler ( "deactivateDrugEffect", getRootElement(), deactivateDrugEffect_func )

function drugAiming ()

	if setPedControlState ( "aim_weapon" ) then
		--[[local x, y, z = getPedTargetEnd ( lp )
		local drugAimS = drugSettings.aimDisturbe * strenght
		x = x + math.random ( -drugAimS, drugAimS )
		y = y + math.random ( -drugAimS, drugAimS )
		z = z + math.random ( -drugAimS, drugAimS )
		--triggerServerEvent ( "drugAimTarget", lp, x, y, z )
		--setPedCameraRotation ( lp, float cameraRotation )
		setPedRotation ( lp, getPedRotation ( lp ) + 2 )]]
	end
end

function drunkDiveMode ()

	if not isControlEnabled ( "vehicle_right" ) then
		toggleControl ( "vehicle_right", true )
		toggleControl ( "vehicle_left", true )
		if lastDrugControl == "left" then
			setPedControlState ( "vehicle_left", false )
		else
			setPedControlState ( "vehicle_right", false )
		end
	end
	
	local rnd = math.random ( 1, 100 ) / 10
	if rnd <= strenght then
		if math.random ( 1, 2 ) == 1 then
			setTimer ( drunkModeNothing, math.random ( 50, 250 ), 1 )
		else
			if math.random ( 1, 2 ) == 1 then
				setTimer ( drunkModeRight, math.random ( 50, 250 ), 1 )
			else
				setTimer ( drunkModeLeft, math.random ( 50, 250 ), 1 )			
			end
		end
	end
end

function drunkModeLeft ()

	toggleControl ( "vehicle_left", false )
	toggleControl ( "vehicle_right", false )
	lastDrugControl = "left"
	setPedControlState ( "vehicle_left", true )
end

function drunkModeRight ()

	toggleControl ( "vehicle_right", false )
	toggleControl ( "vehicle_left", false )
	lastDrugControl = "right"
	setPedControlState ( "vehicle_right", true )
end


function drunkModeNothing ()

	toggleControl ( "vehicle_right", false )
	toggleControl ( "vehicle_left", false )
	lastDrugControl = "none"
	setPedControlState ( "vehicle_right", false )
end






function startKokainEffect_func(level, drug)

	local strength = tonumber( level )
	if (isDrugActive) then
		killTimer(stopTimer)
		stopTimer = setTimer(function() stopDrug() end, strength*60*1000, 1)
	else
		startDrug(60*1000)
	end
end
addEvent ( "startKokainEffect", true )
addEventHandler ( "startKokainEffect", getRootElement(), startKokainEffect_func )


function startDrug(time)
	fadeCamera(false)
	setTimer(function(time)
		if (time == nil) then
			time = 10*1000
		else
			if (tonumber(time) < 5000) then
			time = 10*1000
			end
		end
		
		timerWeather = setTimer(function() timeCheck() end, 1000, 1)
		timerFades = setTimer(function() fades() end, 4000, 1)
		isDrugActive = true
		setTimer(function() fall() end, 1000, 1)
		addEventHandler("onClientRender", getRootElement(), drugSteer)
		addEventHandler("onClientPreRender", getRootElement(), drugCam)
		
		stopTimer = setTimer(function() stopDrug() end, time, 1)
	end, 1500, 1, time)
end

function stopDrug()
	fadeCamera(false)
	killTimer(timerFades)
	killTimer(timerWeather)
	isDrugActive = false
	fadeCamera(false)
	removeEventHandler("onClientRender", getRootElement(), drugSteer)
	removeEventHandler("onClientPreRender", getRootElement(), drugCam)
	fadeCamera(false)
	restoreWeather()
	setTimer(function()
		setCameraTarget(getLocalPlayer())
		fadeCamera(true)
	end, 2500, 1)
end

function timeCheck()
	local hh, mm = getTime()
	if (hh<7) then
		local ww, bb = getWeather()
		if (ww ~= -52123) then
			setWeather(-52123)
		end		
	else
		local ww, bb = getWeather()
		if (ww ~= 190) then
			setWeather(190)
		end
	end
end

function fall()
	if (isDrugActive) then
		setPedAnimation(getLocalPlayer(), "ped", "getup_front",1000, false, false)
		setTimer(function() fall() end, math.random(10000, 30000), 1)
		setTimer(function() setPedControlState ('jump',true) end, 1500, 1)
		setTimer(function() setPedControlState ('jump',false) end, 2000, 1)
	end
end

function fades()
	local rnd = math.random(2,4)
	fadeCamera(false, rnd, math.random(1,255), math.random(1,255), math.random(1,255))
	local xx, yy, zz = getElementPosition(getLocalPlayer())
	setTimer(function() fadeCamera(true, 1) end, rnd*1000/2, 1)
end

function drugSteer()
	left=false
	right=false
	up=false
	down=false
	
	local keys = getBoundKeys ('vehicle_left')
	if keys then
		tmpLeft = false
		for keyName, state in pairs(keys) do
			if (getKeyState(keyName)) then
				tmpLeft=true
			end
		end
		if tmpLeft then
			left=true
			right=false
		end
	end

	local keys = getBoundKeys ('vehicle_right')
	if keys then
		tmpRight = false
		for keyName, state in pairs(keys) do
			if (getKeyState(keyName)) then
				tmpRight=true
			end
		end
		if tmpRight then
			left=false
			right=true
		end
	end

	if (left) then
		setPedControlState('vehicle_left', false)
		setPedControlState('vehicle_right', true)
	elseif (right) then
		setPedControlState('vehicle_right', false)
		setPedControlState('vehicle_left', true)
	else 
		setPedControlState('vehicle_right', false)
		setPedControlState('vehicle_left', false)
	end
	
	
	local keys = getBoundKeys ('accelerate')
	if keys then
		tmpUp = false
		for keyName, state in pairs(keys) do
			if (getKeyState(keyName)) then
				tmpUp=true
			end
		end
		if tmpUp then
			down=false
			up=true
		end
	end 
	
	local keys = getBoundKeys ('brake_reverse')
	if keys then
		tmpDown = false
		for keyName, state in pairs(keys) do
			if (getKeyState(keyName)) then
				tmpDown=true
			end
		end
		if tmpDown then
			down=true
			up=false
		end
	end
	
	if (up) then
		setPedControlState('accelerate', false)
		setPedControlState('brake_reverse', true)
	elseif (down) then
		setPedControlState('brake_reverse', false)
		setPedControlState('accelerate', true)
	else 
		setPedControlState('brake_reverse', false)
		setPedControlState('accelerate', false)
	end
end

roll = 0
rollGrow = false
function drugCam()
	if (rollGrow) then
		if (roll > 15) then rollGrow = false end
		roll = roll + 1
	else
		if (roll < -15) then rollGrow = true end
		roll = roll -1
	end
	local xx, yy, zz = getElementPosition(getLocalPlayer())
	local rot = getPedRotation(getLocalPlayer())
	local lx = xx + math.sin (math.rad(-rot)) * -10
	local ly = yy + math.cos (math.rad(-rot)) * -10
	setCameraMatrix(lx, ly, zz + 4, xx, yy, zz, roll)
	fxAddBlood(xx, yy, zz, 0, 0, 0, 6)
end

function startDrug2()
	startDrug(4)
end
function stopDrug2()
	stopDrug()
end

----------------------------------
--addCommandHandler("sd", startDrug2)
--addCommandHandler("sds", stopDrug2)
----------------------------------

function restoreWeather(ww)
	setWeather(ww or 0 )
end

addEvent("restoreWeather", true)
addEventHandler("restoreWeather", getRootElement(), restoreWeather)