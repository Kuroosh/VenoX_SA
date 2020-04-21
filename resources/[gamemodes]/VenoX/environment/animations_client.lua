local screenWidth, screenHeight = guiGetScreenSize()
local anima = nil

function Animshow(anim)
	removeEventHandler ( "onClientRender", getRootElement(), Animrender)
	anima = anim
	addEventHandler( "onClientRender", getRootElement(), Animrender)
end
addEvent("Animshow",true)
addEventHandler("Animshow", getLocalPlayer(), Animshow)
local screenX, screenY = guiGetScreenSize()
local sx, sy = screenX/1366, screenY/768
function Animrender()

	dxDrawText("Animation : "..anima, sx*326 - 1, sy*601 - 1, sx*794 - 1, sy*656 - 1, tocolor(0, 0, 0, 255), 3.00, "arial", "left", "top", false, false, false, false, false)
	dxDrawText("Animation : "..anima, sx*326 + 1, sy*601 - 1, sx*794 + 1, sy*656 - 1, tocolor(0, 0, 0, 255), 3.00, "arial", "left", "top", false, false, false, false, false)
	dxDrawText("Animation : "..anima, sx*326 - 1, sy*601 + 1, sx*794 - 1, sy*656 + 1, tocolor(0, 0, 0, 255), 3.00, "arial", "left", "top", false, false, false, false, false)
	dxDrawText("Animation : "..anima, sx*326 + 1, sy*601 + 1, sx*794 + 1, sy*656 + 1, tocolor(0, 0, 0, 255), 3.00, "arial", "left", "top", false, false, false, false, false)
	dxDrawText("Animation : "..anima, sx*326, sy*601, sx*794, sy*656, tocolor(255, 255, 255, 255), 3.00, "arial", "left", "top", false, false, false, false, false)
	dxDrawRectangle(sx*326, sy*656, sx*464, sy*3, tocolor(0, 200, 255, 255), false)
	dxDrawText("Leertaste benutzen um die Animation zu beenden", sx*326 - 1, sy*669 - 1, sx*794 - 1, sy*724 - 1, tocolor(0, 0, 0, 255), 3.00, "arial", "left", "top", false, false, false, false, false)
	dxDrawText("Leertaste benutzen um die Animation zu beenden", sx*326 + 1, sy*669 - 1, sx*794 + 1, sy*724 - 1, tocolor(0, 0, 0, 255), 3.00, "arial", "left", "top", false, false, false, false, false)
	dxDrawText("Leertaste benutzen um die Animation zu beenden", sx*326 - 1, sy*669 + 1, sx*794 - 1, sy*724 + 1, tocolor(0, 0, 0, 255), 3.00, "arial", "left", "top", false, false, false, false, false)
	dxDrawText("Leertaste benutzen um die Animation zu beenden", sx*326 + 1, sy*669 + 1, sx*794 + 1, sy*724 + 1, tocolor(0, 0, 0, 255), 3.00, "arial", "left", "top", false, false, false, false, false)
	dxDrawText("Leertaste benutzen um die Animation zu beenden", sx*326, sy*669, sx*794, sy*724, tocolor(255, 255, 255, 255), 3.00, "arial", "left", "top", false, false, false, false, false)
end

function removeAnimDraw()
	removeEventHandler ( "onClientRender", getRootElement(), Animrender)
end
addEvent("Animhide",true)
addEventHandler("Animhide", root, removeAnimDraw)