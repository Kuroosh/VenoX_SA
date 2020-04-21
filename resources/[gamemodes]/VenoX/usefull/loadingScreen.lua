--- Copyright VenoX Reallife  ---

local sx,sy = guiGetScreenSize()
local blendIn = false
local blendOut = false
local loadingscreen = false

function blendLoadingScreen_func()
	blendIn = true
	blendOut = false
	loadingscreen = true
	alpha = 0
	addEventHandler("onClientRender",getRootElement(),drawBlendingScreen)
	setTimer(blendOutLoadingScreen_func,3000,1)
	playSoundFrontEnd ( 42 )
end
addEvent("blendLoadingScreen",true)
addEventHandler("blendLoadingScreen",getRootElement(),blendLoadingScreen_func)

function blendOutLoadingScreen_func()
	blendIn = false
	blendOut = true
	if loadingscreen then
		setTimer(function()
			removeEventHandler("onClientRender",getRootElement(),drawBlendingScreen)
		end,1000,1)
	end
	loadingscreen = false
end
addEvent("blendOutLoadingScreen",true)
addEventHandler("blendOutLoadingScreen",getRootElement(),blendOutLoadingScreen_func)

function drawBlendingScreen()
	if blendIn == true and alpha < 255 then alpha = alpha +15 end
	if blendOut == true and alpha >= 0 and alpha <= 255  then alpha = alpha -15	end
	if alpha > 255 then alpha = 255 end
	if alpha < 0 then alpha = 0 end
    dxDrawRectangle ( 0, 0, sx, sy,tocolor ( 0, 0, 0, alpha ),true )
    dxDrawImage ( sx/2 - 300, sy/2-150, 550, 280, 'images/loading/ladescreen.jpg',0,0,0, tocolor ( 255, 255, 255, alpha ),true)
	--dxDrawText ( "Einen Moment bitte...", 0, 0, sx, sy, tocolor(0,255,255,alpha), 5, "default-bold", "center", "center",false,false,true)
end
