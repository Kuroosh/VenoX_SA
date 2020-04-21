--client

function getXPForNextLevel(player)
    local xp = tonumber(getElementData(player,"MainXP"))
    local level =  tonumber(getElementData(player,"MainLevel"))
    if level < (maxlevel+1) then
        nxp = levelSys[level]
        lvlDatas =nxp/xp
        lvlDatas = 100/lvlDatas
    end
end
addEvent ( "getXPForNextLevel", true )
addEventHandler ( "getXPForNextLevel", getRootElement(), getXPForNextLevel )


function showLevel()
    getXPForNextLevel(getLocalPlayer())
    setTimer ( function()
            if lvlDatas >= 100 then
                triggerServerEvent ( "checkPlayerLevelUP", lp,lp)
            end
    end, 7000, 1 )
end
addEvent ( "showLevel", true )
addEventHandler ( "showLevel", getRootElement(), showLevel )


--local dxfont0_DSDIGI = dxCreateFont(":VenoX/fonts/DSDIGI.ttf", 10)
local screenX, screenY = guiGetScreenSize()
local sx, sy = screenX/1366, screenY/768
LevelUPSound = false
local dxfont0_drugs = dxCreateFont(":VenoX/fonts/drugs.ttf", 16)
local dxfont1_drugs = dxCreateFont(":VenoX/fonts/drugs.ttf", 10)
local dxfont2_drugs = dxCreateFont(":VenoX/fonts/drugs.ttf", 5)

function drawLevelUP ()
	local level = getElementData ( getLocalPlayer(), "MainLevel")
    --dxDrawImage(827*sx, 217*sy, 256*sx, 152*sy, ":VenoX/anzeigen/levelsystem/levelup.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    --dxDrawText("Du bist nun Level  "..level, 910*sx, 261*sy, 1056*sx, 294*sy, tocolor(255, 255, 255, 255), 1.00, dxfont0_DSDIGI, "left", "top", false, false, true, false, false)
    --dxDrawText("NÄchstes Level bei:\n\n"..levelSys[level].." XP", 834*sx, 312*sy, 1073*sx, 359*sy, tocolor(255, 255, 255, 255), 1.00, dxfont0_DSDIGI, "left", "top", false, false, false, false, false)

    dxDrawRectangle(sx*500, sy*10, sx*373, sy*119, tocolor(0, 0, 0, 188), false)
    dxDrawRectangle(sx*500, sy*8, sx*373, sy*3, tocolor(0, 150, 200, 254), false)
    dxDrawText("LEVEL UP", sx*499, sy*11, sx*873, sy*37, tocolor(255, 255, 255, 255), 1.00, dxfont0_drugs, "center", "bottom", false, false, false, false, false)
    dxDrawRectangle(sx*500, sy*37, sx*373, sy*3, tocolor(0, 150, 200, 254), false)
    dxDrawText("Du bist soeben auf Level "..level.." aufgestiegen.", sx*499, sy*40, sx*873, sy*66, tocolor(255, 255, 255, 255), 1.00, dxfont1_drugs, "center", "center", false, false, false, false, false)
    dxDrawText("EXP zum nächsten Level : "..levelSys[level], sx*499, sy*66, sx*873, sy*92, tocolor(255, 255, 255, 255), 1.00, dxfont1_drugs, "center", "center", false, false, false, false, false)
    dxDrawText("Anzeige schliesst sich automatisch", sx*499, sy*102, sx*873, sy*128, tocolor(255, 255, 255, 255), 1.00, dxfont2_drugs, "center", "center", false, false, false, false, false)
	if LevelUPSound == false then
		--playSound("neues/achievementSystem/achievment.mp3")
	end
	LevelUPSound = true
end


function drawLevelUP_func ()

	addEventHandler ( "onClientRender", root, drawLevelUP )
	setTimer ( function()
		removeEventHandler ( "onClientRender", root, drawLevelUP )
		LevelUPSound = false
	end, 10000, 1 )
end
addEvent("drawLevelUP", true)
addEventHandler("drawLevelUP", getRootElement(), drawLevelUP_func)

