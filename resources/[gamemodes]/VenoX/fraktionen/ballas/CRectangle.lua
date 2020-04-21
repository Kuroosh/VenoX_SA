--
-- Created by Tonic
--

local Info = {}
local screenx, screeny = guiGetScreenSize()
local x, y = 1920, 1080

function Info.draw()
    local tick = getTickCount()
    local progress = (tick - Info.starttick) / 1100
    if progress > 1 then
        starttick = Info.starttick
        goingup = not Info.goingup
    end
    local w, _, _ = interpolateBetween(0, 0, 0, screenx, 0, 0, goingup and progress or progress, "OutBounce")
    dxDrawRectangle(0, screeny * 0.5 - 250, w, 200, tocolor(0, 0, 0, 170))
    if (tostring(Info.text)) then
        dxDrawText(tostring(Info.text), 0, screeny * 0.5 + 30, w, 200, tocolor(255, 255, 255, 255), 3, "default", "center", "center")
    end

end

function createInfo(text)
    if (Info.status == true) then
        removeEventHandler("onClientRender", root, Info.draw)
    end
    Info.starttick = getTickCount()
    Info.goingup = true
    Info.text = text
    Info.status = true
    addEventHandler("onClientRender", root, Info.draw)
	setTimer(function()
		removeEventHandler("onClientRender", root, Info.draw)
	end, 5000, 1)
end
addEvent("createInfo", true)
addEventHandler("createInfo", root, createInfo)