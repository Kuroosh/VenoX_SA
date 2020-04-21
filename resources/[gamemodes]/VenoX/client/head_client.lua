function adjustPlayerHead ()

	if getCameraTarget () then
		x, y, z = getWorldFromScreenPosition ( screenwidth / 2, screenheight / 2, 50 )
		setPedLookAt ( lp, x, y, z, -1, nil )
	end
end
setTimer ( adjustPlayerHead, 100, 0 )

-- DEBUG --
curSpyGlass = false
spyGoglesActive = false
spyGoglesDistance = 0
spyGoglesMaxDistance = 50

function lookGlass ()

	if not spyGoglesActive and not getElementClicked () and vnxClientGetElementData ( "fglass" ) then
		setElementClicked ( true )
		setPlayerHudComponentVisible ( "radar", false )
		showCursor ( true )
		addEventHandler ( "onClientRender", getRootElement(), renderSpyGogles )
		bindKey ( "mouse_wheel_up", "down", spyGoglesWheelUp )
		bindKey ( "mouse_wheel_down", "down", spyGoglesWheelDown )
		bindKey ( "enter", "down", spyGoglesEnter )
		bindKey ( "space", "down", spyGoglesEnter )
		setPlayerHudComponentVisible ( "crosshair", false )
		spyGoglesActive = true
		showVioGUIMouse = false
		gImage["spyGogles"] = guiCreateStaticImage ( 0, 0, 1, 1, "images/lookout.png", true )
		gImage["spyGoglesRedDot"] = guiCreateStaticImage ( screenwidth / 2 - 2, screenheight / 2 - 2, 4, 4, "images/reddot.png", false )
	end
end
addCommandHandler ( "fglass", lookGlass )

function spyGoglesWheelUp ()

	if spyGoglesDistance < spyGoglesMaxDistance then
		spyGoglesDistance = spyGoglesDistance + 1.5
	end
	if spyGoglesDistance > spyGoglesMaxDistance then
		spyGoglesDistance = spyGoglesMaxDistance
	end
end
function spyGoglesWheelDown ()

	if spyGoglesDistance > 0 then
		spyGoglesDistance = spyGoglesDistance - 1.5
	end
	if spyGoglesDistance < 0 then
		spyGoglesDistance = 0
	end
end
function spyGoglesEnter ()

	setElementClicked ( false )
	destroyElement ( gImage["spyGogles"] )
	destroyElement ( gImage["spyGoglesRedDot"] )
	showVioGUIMouse = true
	showCursor ( false )
	setElementClicked ( false )
	removeEventHandler ( "onClientRender", getRootElement(), renderSpyGogles )
	unbindKey ( "mouse_wheel_up", "down", spyGoglesWheelUp )
	unbindKey ( "mouse_wheel_down", "down", spyGoglesWheelDown )
	unbindKey ( "enter", "down", spyGoglesEnter )
	unbindKey ( "space", "down", spyGoglesEnter )
	spyGoglesActive = false
	curSpyGlass = false
	--nameTagVisible[curSpyGlass] = false
	setCameraTarget ( lp, lp )
	setPlayerHudComponentVisible ( "radar", true )
	--nameTagVisible[curSpyGlass] = false
	curSpyGlass = false
end

function renderSpyGogles ()

	--nameTagVisible[curSpyGlass] = false
	curSpyGlass = false
	local x, y, z = getPedBonePosition ( lp, 8 )
	local cX, cY, wX, wY, wZ = getCursorPosition ()
	local boolean, x, y, z, hit = processLineOfSight ( x, y, z, wX, wY, wZ )
	if boolean then
		if hit then
			if isElement ( hit ) then
				if getElementType ( hit ) == "player" then
					curSpyGlass = hit
					--nameTagVisible[curSpyGlass] = true
					nameTagImages[curSpyGlass] = {}
					nameTagCheckPlayerSight ( hit )
				end
			end
		end
	end
	
	setCursorPosition ( screenwidth / 2, screenheight / 2 )
	
	local x1, y1, z1 = getPedBonePosition ( lp, 8 )
	local x2, y2, z2 = wX, wY, wZ
	
	local max = getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 )
	
	local m = ( y1 - y2 ) / ( x1 - x2 )
	
	local d = spyGoglesDistance
	
	local xd = math.sqrt ( ( d ^ ( 2 ) ) / ( 1 + m * m ) )
	local yd = xd * m
	
	local nx, ny, nz
	local rot = findRotation ( x1, y1, x2, y2 )
	if rot >= 180 then
		nx = xd + x1
		ny = yd + y1
	else
		nx = x1 - xd
		ny = y1 - yd
	end
	
	nz = ( z2 - z1 ) / max * d + z1
	
	local hit, cx, cy, cz = processLineOfSight ( nx, ny, nz, x2, y2, z2 )
	
	if hit then
		if cx and cy and cz then
			x2, y2, z2 = cx, cy, cz
		end
	end
	
	local _, cxN, cyN, czN = processLineOfSight ( x1, y1, z1, nx, ny, nz )
	if cxN and cyN and czN then
		nx, ny, nz = cxN, cyN, czN
	end
	
	setCameraMatrix ( nx, ny, nz, x2, y2, z2 )
	setPedRotation ( lp, rot )
end