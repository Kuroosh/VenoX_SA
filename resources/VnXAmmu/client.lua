
local screenX, screenY = guiGetScreenSize()
local sx, sy = screenX/1366, screenY/768

function drawsafewindow()
	vnxDrawRectangle("login_window_2", "login_window",sx*1100, sy*200, sx*200, sy*60, tocolor(0, 0, 0, 120))
end 
addCommandHandler("drawdashit", drawsafewindow)