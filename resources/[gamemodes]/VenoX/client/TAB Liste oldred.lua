local x, y = guiGetScreenSize()
local pl = {}
local scroll = 0
local updateTimer 
local player = getLocalPlayer()
local alpha = 0
local maxplayers = 80

bindKey("tab","up",function()
    setElementData(lp,'ElementClicked',false)
    unbindKey("mouse_wheel_down","down",scrollDown)
    unbindKey("mouse_wheel_up","down",scrollUp)
    setElementData(player,"inScoreboard",false)
    removeEventHandler("onClientRender", root, drawScoreboard)
    toggleControl("next_weapon",true)
    toggleControl("previous_weapon",true)
    toggleControl("fire",true)
    alpha = 0
end)

function scrollDown()
    if #getElementsByType("player") - scroll <= 2 then
        scroll = #getElementsByType("player")
    else
        scroll = scroll + 2
    end
end

function scrollUp()
    if scroll <= 2 then
        scroll = 0
    else
        scroll = scroll - 2
    end
end

function formString(text)
    if string.len(text) == 1 then
        text = "0"..text
    end
    return text
end

local admin_names = {
    [0] = 'User',
    [1] = 'Ticketsupporter',
    [2] = 'Supporter',
    [3] = 'Moderator',
    [4] = 'Super-Moderator',
    [5] = 'Scripter',
    [6] = 'Admin',
    [7] = 'Serverleiter',
    [8] = 'Inhaber'
}

local playeronline = 0
local fraktionNames = { [0]="Zivilist", [1]="SAPD", [2]="Mafia", [3]="Triaden", [4]="Terroristen", [5]="Reporter", [6]="FBI", [7]="Los Aztecas", [8]="Army", [9]= "Angels of Death", [10] = "Groove", [11] = "Groove", [12] = "Groove", [13] = "Groove", [14] = "Groove" }
    
for i=0, #fraktionNames+1 do
    pl[i] = {}
end
    
function updateScoreboard()
    for i=0, #fraktionNames+1 do
        pl[i] = {}
    end
    local players = getElementsByType("player")
    playeronline = #players
    for i=1, playeronline do
        local name = string.gsub ( getPlayerName ( players[i] ), "#%x%x%x%x%x%x", "" ) 
        local spielzeit = "-"
        local nr = "-"
        local ping = getPlayerPing ( players[i] )
        local color = {255,255,255}
        local fname = "-"
        local frak = 0
        local status = '-'
        local r, g, b = 255, 255, 255
        local aname = '-'
        local frakrang = '-'
        local job = '-'
        local telenr = '-'
        local rang = '-'
        if getElementData ( players[i], "loggedin" ) == 1 then
            nr = getElementData ( players[i], "telenr" )
            local ptime = tonumber(getElementData(players[i],"playingtime"))
            local hour = math.floor(ptime/60)
            local minute = ptime - hour*60
            spielzeit = formString(hour)..":"..formString(minute)
            frak = getElementData ( players[i], "fraktion" )
            local adminlvl = getElementData(players[i], 'adminlvl')
            rang = getElementData(players[i], 'rang')
            job = getElementData(players[i], 'job')
            local vip = getElementData(players[i], 'vip')
           
 
            if adminlvl > #admin_names then
                aname = 'Projektleiter';
            elseif adminlvl == 0 then
                if vip == 1 then
                    aname = '[VIP]User';
                else
                    aname = admin_names[adminlvl];
                end
            else
                aname = admin_names[adminlvl];
            end
           
            r, g, b = factionColors[frak][1], factionColors[frak][2], factionColors[frak][3]
            status = getElementData(players[i], 'socialState');
        end
        pl[frak+1][#pl[frak+1]+1] = { ["Nr"] = nr, ["Name"] = name, ["Spielzeit"] = spielzeit, ["Ping"] = ping, ["Color"] = color, ["Fraktion"] = frak, ["Rang"] = rang, ["Job"] = job, ["Ping"] = ping, ["Status"] = status, ["AName"] = aname, ["R"] = r, ["G"] = g, ["B"] = b }
    end
end
 
 
function getPingColor(ping)
    if (ping > 100) then
        return 200,0,0
    elseif (ping < 100) then
        return 20,200,20
    else
        return 200,20,20
    end
end
 
function drawScoreboard()
    alpha = 255
 
    dxDrawRectangle(x * 0.5 - (700 * 0.5), y * 0.5 - (480 * 0.5), 700, 70, tocolor(255, 0, 0, 200))
    dxDrawRectangle(x * 0.5 - (700 * 0.5), y * 0.5 + (340 * 0.5), 700, 30, tocolor(255, 0, 0, 200))
    dxDrawLine(x / 2 - 700 / 2, y / 2 - 343 / 2, x / 2 + 700 / 2, y / 2 - 343 / 2, tocolor(255, 255, 255, 150), 2)
    dxDrawLine(x / 2 - 700 / 2, y / 2 + 340 / 2, x / 2 + 700 / 2, y / 2 + 340 / 2, tocolor(255, 255, 255, 150), 2)
    dxDrawRectangle(x * 0.5 - (700 * 0.5), y * 0.5 - (400 * 0.5), 700, 400, tocolor(0, 0, 0, 150))
    dxDrawText("Venox Reallife", x / 2 + 350, y / 2 - 250, x / 2 - (700 / 2), y / 2 - (380 / 2), tocolor(255, 255, 255, 255), 1.4, "default", "center", "center")
    dxDrawText("Name", x / 2 - 280, y / 2 - 180, x / 2 - (700 / 2), y / 2 - (380 / 2), tocolor(255, 255, 255, 255), 1, "default", "center", "center")
    dxDrawText("Status", x / 2 + 30, y / 2 - 180, x / 2 - (700 / 2), y / 2 - (380 / 2), tocolor(255, 255, 255, 255), 1, "default", "center", "center")
    dxDrawText("Fraktion", x / 2 + 340, y / 2 - 180, x / 2 - (700 / 2), y / 2 - (380 / 2), tocolor(255, 255, 255, 255), 1, "default", "center", "center")
    dxDrawText("Spielzeit", x / 2 + 600, y / 2 - 180, x / 2 - (700 / 2), y / 2 - (380 / 2), tocolor(255, 255, 255, 255), 1, "default", "center", "center")
    dxDrawText("Telefon", x / 2 + 800, y / 2 - 180, x / 2 - (700 / 2), y / 2 - (380 / 2), tocolor(255, 255, 255, 255), 1, "default", "center", "center")
    dxDrawText("Ping", x / 2 + 960, y / 2 - 180, x / 2 - (700 / 2), y / 2 - (380 / 2), tocolor(255, 255, 255, 255), 1, "default", "center", "center")
    dxDrawText("Spieler online:", x / 2 - 255, y / 2 + 560, x / 2 - (700 / 2), y / 2 - (380 / 2), tocolor(255, 255, 0, 255), 1, "default", "center", "center")
    dxDrawText(playeronline .. "/10", x / 2 - 150, y / 2 + 560, x / 2 - (700 / 2), y / 2 - (380 / 2), tocolor(255, 255, 255, 255), 1, "default", "center", "center")

    local number = 0
    for i=0, #fraktionNames+1 do
        for j=1, #pl[i] do
            number = number + 1
            if number >= 0+scroll then
                if number > 18+scroll then
                    return
                end
                dxDrawText(pl[i][j]["Name"], 630 * (x / 1920), 472 * (y / 1080) + (22 * number) - 20, 707 * (x / 1920), 295 * (y / 1080) + (22 * number) - 20, tocolor(pl[i][j]["R"], pl[i][j]["G"], pl[i][j]["B"], alpha), 1.00 * (y / 1080), "default", "left", "center", false, false, false, false, false)
                dxDrawText(i ~= 0 and fraktionNames[i - 1] or "-", 938 * (x / 1920), 472 * (y / 1080) + (22 * number) - 20, 803 * (x / 1920), 295 * (y / 1080) + (22 * number) - 20, tocolor(pl[i][j]["R"], pl[i][j]["G"], pl[i][j]["B"], alpha), 1.00 * (y / 1080), "default", "left", "center", false, false, false, false, false)
                dxDrawText(pl[i][j]["Spielzeit"], 1275 * (x / 1920), 472 * (y / 1080) + (22 * number) - 20, 891 * (x / 1920), 295 * (y / 1080) + (22 * number) - 20, tocolor(pl[i][j]["R"], pl[i][j]["G"], pl[i][j]["B"], alpha), 1.00 * (y / 1080), "default", "center", "center", false, false, false, false, false)
                dxDrawText(pl[i][j]["Nr"], 1325 * (x / 1920), 472 * (y / 1080) + (22 * number) - 20, 1042 * (x / 1920), 295 * (y / 1080) + (22 * number) - 20, tocolor(pl[i][j]["R"], pl[i][j]["G"], pl[i][j]["B"], alpha), 1.00 * (y / 1080), "default", "center", "center", false, false, false, false, false)
                dxDrawText(pl[i][j]["AName"], 318 * (x / 1920), 472 * (y / 1080) + (22 * number) - 20, 1292 * (x / 1920), 295 * (y / 1080) + (22 * number) - 20, tocolor(pl[i][j]["R"], pl[i][j]["G"], pl[i][j]["B"], alpha), 1.00 * (y / 1080), "default", "center", "center", false, false, false, false, false)
                pr, pg, pb = getPingColor(pl[i][j]["Ping"])
                dxDrawText(pl[i][j]["Ping"], 1193 * (x / 1920), 472 * (y / 1080) + (22 * number) - 20, 1335 * (x / 1920), 295 * (y / 1080) + (22 * number) - 20, tocolor(pr, pg, pb, alpha), 1.00 * (y / 1080), "default", "center", "center", false, false, false, false, false)
            end
        end
    end
end

bindKey("tab","down",function()
    if getElementData(lp,"loggedin") == 1 and getElementData(lp,"inTut") == false then
        if getElementData(player,"ElementClicked") == false then
            setElementData(lp,'ElementClicked',true)
            addEventHandler("onClientRender", root, drawScoreboard)
            setElementData(player,"inScoreboard",true)
            updateScoreboard()
            if isTimer(updateTimer) then killTimer(updateTimer)
                updateTimer = setTimer(updateScoreboard,10000,-1)
                bindKey("mouse_wheel_down","down",scrollDown)
                bindKey("mouse_wheel_up","down",scrollUp)
                toggleControl("next_weapon",false)
                toggleControl("previous_weapon",false)
                toggleControl("fire",false)
                alpha = 0
            end
        end
    end
end)