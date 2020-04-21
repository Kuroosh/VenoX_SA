local maxZoom = 500
local zoomPerMeter = 10
local oldX, oldY, oldZ
local camX, camY, camBaseZ
local zoom = 0
local ac130CamPosiition
local fireEnabled

function startAC130Fire ( key )

	if getKeyState ( "mouse1" ) and fireEnabled then
		fireEnabled = false
		setTimer (
			function ()
				fireEnabled = true
			end,
		750, 1 )
		ac130_fire ()
		AC130FireTimer = setTimer ( startAC130Fire, 1000, 1, false )
		
		if key and key == "mouse1" then
			unbindKey ( "mouse1", "down", startAC130Fire )
			bindKey ( "mouse1", "up", stopAC130Fire )
		end
	end
end
function stopAC130Fire ()

	if isTimer ( AC130FireTimer ) then
		killTimer ( AC130FireTimer )
	end
	bindKey ( "mouse1", "down", startAC130Fire )
	unbindKey ( "mouse1", "up", stopAC130Fire )
end

function joinAC130Gun ( camPos )

	fireEnabled = true
	gImage["ac130Grey"] = guiCreateStaticImage ( 1, 1, screenwidth, screenheight, "images/colors/c_grey.jpg", false )
	guiSetAlpha ( gImage["ac130Grey"], 0.3 )
	gImage["cross-hair"] = guiCreateStaticImage ( screenwidth / 2 - 200 /2, screenheight / 2 - 100 / 2, 200, 100, "images/cross-hair.png", false )
	
	ac130CamPosiition = camPos
	
	oldX, oldY, oldZ = getElementPosition ( ac130CamPosiition )
	zoom = 0
	showCursor ( true )
	setElementClicked ( true )
	
	--bindKey ( "mouse_wheel_up", "down", gunship_zoom_out )
	--bindKey ( "mouse_wheel_down", "down", gunship_zoom_in )
	bindKey ( "mouse1", "down", startAC130Fire )
	bindKey ( "enter", "down", ac130_exit )
	
	addEventHandler ( "onClientRender", getRootElement(), reAdjustCamPos )
	showVioGUIMouse = false
end
addEvent ( "joinAC130Gun", true )
addEventHandler ( "joinAC130Gun", getRootElement(), joinAC130Gun )

function reAdjustCamPos ()

	if isPedDead ( lp ) then
		ac130_exit ()
		return true
	end
	camX, camY, camBaseZ = getElementPosition ( ac130CamPosiition )
	
	local camDX = camX - oldX
	local camDY = camY - oldY
	local camDZ = camBaseZ - oldZ
	
	sx, sy, x, y, z = getCursorPosition ()
	
	x = x + camDX
	y = y + camDY
	z = z + camDZ
	
	local dX = camX - x
	local dY = camY - y
	local dZ = camBaseZ - z
	
	local curBiggest = 0
	if ( dX > curBiggest ) then
		curBiggest = dX
	end
	if ( dY > curBiggest ) then
		curBiggest = dY
	end
	if ( dZ > curBiggest ) then
		curBiggest = dZ
	end
	
	-- Zoom --
	local var, posX, posY, posZ
	
	local length = math.sqrt ( dX * dX + dY * dY + dZ * dZ )
	
	var = length / 100		-- Länge von 1 % des Weges
	var = zoom / var / 100	-- Anzahl der % an Zoom, um das zu erreichen
	
	if var > 0.9 then
		var = 0.9
	end
	
	posX = camX - var * dX
	posY = camY - var * dY
	posZ = camBaseZ - var * dZ
	-- Zoom --
	
	setCameraMatrix ( posX, posY, posZ, x, y, z )
	if z > camBaseZ then
		setCursorPosition ( math.floor ( screenwidth / 2 ), math.floor ( screenheight / 2 ) + 5 )
	else
		setCursorPosition ( math.floor ( screenwidth / 2 ), math.floor ( screenheight / 2 ) )
	end
	
	oldX, oldY, oldZ = camX, camY, camBaseZ
end

function gunship_zoom_out ()

	zoom = zoom + zoomPerMeter
	if zoom > maxZoom then
		zoom = maxZoom
	end
end
function gunship_zoom_in ()

	zoom = zoom - zoomPerMeter
	if zoom < 0 then
		zoom = 0
	end
end

function ac130_fire ()

	playSoundFrontEnd ( math.random ( 27, 30 ) )
	_, _, x, y, z = getCursorPosition ()
	hit, x, y, z = processLineOfSight ( camX, camY, camBaseZ, x, y, z )
	if hit then
		triggerServerEvent ( "ad130shotFire", lp, 0, x, y, z )
	end
end

function ac130_exit ()

	showVioGUIMouse = true
	triggerServerEvent ( "opticExitVehicle", lp )
	unbindKey ( "enter", "down", ac130_exit )
	unbindKey ( "mouse1", "down", startAC130Fire )
	unbindKey ( "enter", "down", ac130_exit )
	setCameraTarget ( lp )
	destroyElement ( gImage["ac130Grey"] )
	destroyElement ( gImage["cross-hair"] )
	showCursor ( false )
	setElementClicked ( false )
	removeEventHandler ( "onClientRender", getRootElement(), reAdjustCamPos )
end