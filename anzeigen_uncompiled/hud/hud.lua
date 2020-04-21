local sx, sy=guiGetScreenSize()
local spx, spy= 1366, 768
local px, py= (sx/spx) , (sy/spy)

local _dxDrawLine = dxDrawLine
local function dxDrawLine ( ... )
    local array = { ... }
    array[1] = array[1]*px
    array[2] = array[2]*py
    array[3] = array[3]*px
    array[4] = array[4]*py
    array[6] = array[6]*py
    return _dxDrawLine ( unpack ( array ) )
end

local _dxDrawRectangle = dxDrawRectangle
local function dxDrawRectangle ( ... )
    local array = { ... }
    array[1] = array[1]*px
    array[2] = array[2]*py
    array[3] = array[3]*px
    array[4] = array[4]*py
    return _dxDrawRectangle ( unpack ( array ) )
end

local _dxDrawText = dxDrawText
local function dxDrawText ( ... )
    local array = { ... }
    array[2] = array[2]*px
    array[3] = array[3]*py
    array[4] = array[4]*px
    array[5] = array[5]*py
    array[7] = array[7]*py
    return _dxDrawText ( unpack ( array ) )
end

local _dxDrawImage = dxDrawImage
local function dxDrawImage ( ... )
    local array = { ... }
    array[1] = array[1]*px
    array[2] = array[2]*py
    array[3] = array[3]*px
    array[4] = array[4]*py
    return _dxDrawImage ( unpack ( array ) )
end

local _dxDrawCircle = dxDrawCircle
local function dxDrawCircle ( ... )
    local array = { ... }
    array[1] = array[1]*px
    array[2] = array[2]*py
    array[3] = array[3]*px
    return _dxDrawCircle ( unpack ( array ) )
end

local state = 2

function HUD0()
	setPlayerHudComponentVisible("all", true)
    setPlayerHudComponentVisible("radar", false)
    setPlayerHudComponentVisible("vehicle_name", false)
    setPlayerHudComponentVisible("radio", false)

end


function convertNumber ( number )  
    local formatted = number  
    while true do      
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')    
        if ( k==0 ) then      
            break   
        end  
    end  
    return formatted
end



        --[[dxDrawText("2.000 Points", 487 - 1, 49 - 1, 827 - 1, 72 - 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText("2.000 Points", 487 + 1, 49 - 1, 827 + 1, 72 - 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText("2.000 Points", 487 - 1, 49 + 1, 827 - 1, 72 + 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText("2.000 Points", 487 + 1, 49 + 1, 827 + 1, 72 + 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText("2.000 Points", 487, 49, 827, 72, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)]]

function HUD1()
    local stunde, minute=getTime()
    if minute <10 then minute = tostring("0"..minute) end
    if stunde <10 then minute = tostring("0"..stunde) end
    local pgeld = getPlayerMoney(localPlayer)
    local armor = getPedArmor ( localPlayer )
    local health = getElementHealth ( localPlayer, "health" )
    local hunger = math.ceil ( getElementHunger ( localPlayer, "hunger" ) )
    --local RP = math.ceil(getElementData(localPlayer,"RP" ))
    local sterne = getPlayerWantedLevel(localPlayer)
    local atem = getPedOxygenLevel(localPlayer)
    local leben = getElementHealth(localPlayer)
    local waffe = getPedWeapon(localPlayer)
    local ammo = getPedTotalAmmo(localPlayer)
    local magazin = getPedAmmoInClip(localPlayer)
    local time = getRealTime()
    local playerX, playerY, playerZ = getElementPosition ( localPlayer )
    local gebiet = getZoneName ( playerX, playerY, playerZ ) 
    setPlayerHudComponentVisible( "crosshair", true )

    if gebiet == "Unknown" then
    gebiet = "Nicht Lokalisierbar"
    end
    if gebiet == "San Fierro" then
    gebiet = "Police Departmend"
    end
    local stadt = getZoneName ( playerX, playerY, playerZ, true )
    if stadt == "San Fierro" then
    stadt = "SF"
    end
    if stadt == "Las Venturas" then
    stadt = "LV"
    end
    if stadt == "Los Santos" then
    stadt = "LS"
    end
    if stadt == "Unknown" then
        stadt = ""
    end
    local hours = time.hour
        if hours < 10 then
            hours = "0"..hours
        end
        local minutes = time.minute
        if minutes < 10 then
        minutes = "0"..minutes
        end
        local day = time.monthday
        if day < 10 then
        day = "0"..day
        end
        local month = time.month + 1
        if month < 10 then
        month = "0"..month
        end
        local year = time.year + 1900
    --GeldZeugs
        local geldlaenge = string.len(pgeld)
        local targetlaenge = 8- tonumber(geldlaenge)
        local nullen = ""
        for i = 1, targetlaenge, 1 do
        nullen = tostring(nullen.."0")
        end
        local geld = tostring(nullen..""..pgeld)
        
        dxDrawRectangle(1097, 10, 259, 105, tocolor(0, 0, 0, 194), false)
        dxDrawLine(1240 - 1, 27 - 1, 1240 - 1, 41, tocolor(0, 0, 0, 254), 1, false)
        dxDrawLine(1346, 27 - 1, 1240 - 1, 27 - 1, tocolor(0, 0, 0, 254), 1, false)
        dxDrawLine(1240 - 1, 41, 1346, 41, tocolor(0, 0, 0, 254), 1, false)
        dxDrawLine(1346, 41, 1346, 27 - 1, tocolor(0, 0, 0, 254), 1, false)

        dxDrawRectangle(1240, 27, 106, 14, tocolor(254, 254, 255, 81), false) -- Balken Armor Background
        dxDrawRectangle(1240, 27, 106*(armor/100), 7, tocolor(242, 242, 242, 254), false) -- Balken Heller Armor
        dxDrawRectangle(1240, 34, 106*(armor/100), 7, tocolor(206, 206, 206, 254), false) -- Balken Dunkler Armor

        dxDrawLine(1240 - 1, 57 - 1, 1240 - 1, 71, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1346, 57 - 1, 1240 - 1, 57 - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1240 - 1, 71, 1346, 71, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1346, 71, 1346, 57 - 1, tocolor(0, 0, 0, 255), 1, false)


        dxDrawRectangle(1240, 57, 106, 14, tocolor(43, 0, 0, 254), false) -- Background Health
        dxDrawRectangle(1240, 57, 106*(health/100), 7, tocolor(153, 0, 0, 254), false) -- Balken Heller Health
        dxDrawRectangle(1240, 64, 106*(health/100), 7, tocolor(119, 0, 0, 254), false) --Balken Dunkler Health


        dxDrawText(pgeld.." $", 1250 - 1, 84 - 1, 1356 - 1, 108 - 1, tocolor(6, 65, 0, 254), 1.50, "default", "center", "center", false, false, false, false, false)
        dxDrawText(pgeld.." $", 1250 + 1, 84 - 1, 1356 + 1, 108 - 1, tocolor(6, 65, 0, 254), 1.50, "default", "center", "center", false, false, false, false, false)
        dxDrawText(pgeld.." $", 1250 - 1, 84 + 1, 1356 - 1, 108 + 1, tocolor(6, 65, 0, 254), 1.50, "default", "center", "center", false, false, false, false, false)
        dxDrawText(pgeld.." $", 1250 + 1, 84 + 1, 1356 + 1, 108 + 1, tocolor(6, 65, 0, 254), 1.50, "default", "center", "center", false, false, false, false, false)
        dxDrawText(pgeld.." $", 1250, 84, 1356, 108, tocolor(255, 255, 255, 255), 1.50, "default", "center", "center", false, false, false, false, false)

        dxDrawImage(1118, 20, 76, 66, tostring("images/hud/"..waffe..".png"))

        dxDrawImage(1221, 56, 18, 16, ":VenoX/images/21.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        dxDrawText(""..math.ceil(armor).."  %", 1239 - 1, 26 - 1, 1346 - 1, 41 - 1, tocolor(0, 0, 0, 255), 0.50, "bankgothic", "center", "top", false, false, false, false, false)
        dxDrawText(""..math.ceil(armor).."  %", 1239 + 1, 26 - 1, 1346 + 1, 41 - 1, tocolor(0, 0, 0, 255), 0.50, "bankgothic", "center", "top", false, false, false, false, false)
        dxDrawText(""..math.ceil(armor).."  %", 1239 - 1, 26 + 1, 1346 - 1, 41 + 1, tocolor(0, 0, 0, 255), 0.50, "bankgothic", "center", "top", false, false, false, false, false)
        dxDrawText(""..math.ceil(armor).."  %", 1239 + 1, 26 + 1, 1346 + 1, 41 + 1, tocolor(0, 0, 0, 255), 0.50, "bankgothic", "center", "top", false, false, false, false, false)
        dxDrawText(""..math.ceil(armor).."  %", 1239, 26, 1346, 41, tocolor(255, 255, 255, 255), 0.50, "bankgothic", "center", "top", false, false, false, false, false)
        dxDrawText(""..math.ceil(health).."  %", 1239 - 1, 56 - 1, 1346 - 1, 71 - 1, tocolor(0, 0, 0, 255), 0.50, "bankgothic", "center", "top", false, false, false, false, false)
        dxDrawText(""..math.ceil(health).."  %", 1239 + 1, 56 - 1, 1346 + 1, 71 - 1, tocolor(0, 0, 0, 255), 0.50, "bankgothic", "center", "top", false, false, false, false, false)
        dxDrawText(""..math.ceil(health).."  %", 1239 - 1, 56 + 1, 1346 - 1, 71 + 1, tocolor(0, 0, 0, 255), 0.50, "bankgothic", "center", "top", false, false, false, false, false)
        dxDrawText(""..math.ceil(health).."  %", 1239 + 1, 56 + 1, 1346 + 1, 71 + 1, tocolor(0, 0, 0, 255), 0.50, "bankgothic", "center", "top", false, false, false, false, false)
        dxDrawText(""..math.ceil(health).."  %", 1239, 56, 1346, 71, tocolor(255, 255, 255, 255), 0.50, "bankgothic", "center", "top", false, false, false, false, false)
        
        dxDrawRectangle(1097, 7, 259, 3, tocolor(0, 105, 145, 254), false)
        if getElementData (localPlayer, "wanteds") == 1 then
            dxDrawImage(1333, 122, 23, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1213, 122, 23, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1253, 122, 23, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1293, 122, 23, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1133, 122, 23, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1173, 122, 23, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData (localPlayer, "wanteds") == 2 then
            dxDrawImage(1333, 122, 23, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1213, 122, 23, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1253, 122, 23, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1293, 122, 23, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1133, 122, 23, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1173, 122, 23, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData (localPlayer, "wanteds") == 3 then
            dxDrawImage(1333, 122, 23, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1213, 122, 23, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1253, 122, 23, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1293, 122, 23, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1133, 122, 23, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1173, 122, 23, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData (localPlayer, "wanteds") == 4 then
            dxDrawImage(1333, 122, 23, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1213, 122, 23, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1253, 122, 23, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1293, 122, 23, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1133, 122, 23, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1173, 122, 23, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData (localPlayer, "wanteds") == 5 then
            dxDrawImage(1333, 122, 23, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1213, 122, 23, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1253, 122, 23, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1293, 122, 23, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1133, 122, 23, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1173, 122, 23, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData (localPlayer, "wanteds") == 6 then
            dxDrawImage(1333, 122, 23, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1213, 122, 23, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1253, 122, 23, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1293, 122, 23, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1133, 122, 23, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1173, 122, 23, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        else
            dxDrawImage(1333, 122, 23, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1213, 122, 23, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1253, 122, 23, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1293, 122, 23, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1133, 122, 23, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1173, 122, 23, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        end
        dxDrawImage(1221, 26, 18, 16, ":VenoX/images/hud/armour.png", 0, 0, 0, tocolor(207, 207, 207, 254), false)

        dxDrawText(magazin.." / "..ammo, 1118, 91, 1194, 107, tocolor(255, 255, 255, 255), 0.40, "bankgothic", "center", "top", false, false, false, false, false)
        dxDrawText(gebiet..", "..stadt, 1240, 14, 1346, 24, tocolor(255, 255, 255, 255), 0.80, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText(hours..":"..minutes, 1119, 13, 1194, 20, tocolor(255, 255, 255, 255), 0.90, "sans", "center", "center", false, false, false, false, false)
end


addEvent("showhudclient", true)
addEventHandler("showhudclient", getLocalPlayer(), function(hud)
	local vnxhud = tonumber(getElementData( getLocalPlayer(), "hud"))
    if vnxhud == 1 then
        addEventHandler("onClientRender", root, HUD1)
        removeEventHandler("onClientRender", root, HUD6)
        removeEventHandler("onClientRender", root, HUD2)
        removeEventHandler("onClientRender", root, HUD3)
        removeEventHandler("onClientRender", root, HUD4)
        removeEventHandler("onClientRender", root, HUD5)
        setPlayerHudComponentVisible( "crosshair", true )
    elseif vnxhud == 2 then
       addEventHandler("onClientRender", root, HUD2) 
        removeEventHandler("onClientRender", root, HUD1)
        removeEventHandler("onClientRender", root, HUD6)
        removeEventHandler("onClientRender", root, HUD3)
        removeEventHandler("onClientRender", root, HUD4)
        removeEventHandler("onClientRender", root, HUD5)
        setPlayerHudComponentVisible( "crosshair", true )
    elseif vnxhud == 3 then
       addEventHandler("onClientRender", root, HUD3) 
        removeEventHandler("onClientRender", root, HUD1)
        removeEventHandler("onClientRender", root, HUD2)
        removeEventHandler("onClientRender", root, HUD6)
        removeEventHandler("onClientRender", root, HUD4)
        removeEventHandler("onClientRender", root, HUD5)
        setPlayerHudComponentVisible( "crosshair", true )
    elseif vnxhud == 4 then
       addEventHandler("onClientRender", root, HUD4) 
        removeEventHandler("onClientRender", root, HUD1)
        removeEventHandler("onClientRender", root, HUD2)
        removeEventHandler("onClientRender", root, HUD3)
        removeEventHandler("onClientRender", root, HUD6)
        removeEventHandler("onClientRender", root, HUD5)
        setPlayerHudComponentVisible( "crosshair", true )
    
    elseif vnxhud == 5 then
       addEventHandler("onClientRender", root, HUD5) 
        removeEventHandler("onClientRender", root, HUD1)
        removeEventHandler("onClientRender", root, HUD2)
        removeEventHandler("onClientRender", root, HUD3)
        removeEventHandler("onClientRender", root, HUD4)
        removeEventHandler("onClientRender", root, HUD6)
        setPlayerHudComponentVisible( "crosshair", true )
    elseif vnxhud == 6 then
       addEventHandler("onClientRender", root, HUD6) 
        removeEventHandler("onClientRender", root, HUD1)
        removeEventHandler("onClientRender", root, HUD2)
        removeEventHandler("onClientRender", root, HUD3)
        removeEventHandler("onClientRender", root, HUD4)
        removeEventHandler("onClientRender", root, HUD5)
        setPlayerHudComponentVisible( "crosshair", true )    
    else
    	outputDebugString("die vnxhud nr = "..vnxhud)
    	if vnxhud == false then
        addEventHandler( "onClientRender", root, HUD1)
        outputDebugString("die vnxhud nr = false du larry ")
        --removeEventHandler("onClientRender", root, HUD1)
        removeEventHandler("onClientRender", root, HUD2)
        removeEventHandler("onClientRender", root, HUD3)
        removeEventHandler("onClientRender", root, HUD4)
        removeEventHandler("onClientRender", root, HUD5)
        setPlayerHudComponentVisible( "crosshair", true )
        end
    end
end)
addEvent("hidehudclient", true)
addEventHandler("hidehudclient", getLocalPlayer(), function()

        removeEventHandler("onClientRender", root, HUD1)
        removeEventHandler("onClientRender", root, HUD2)
        removeEventHandler("onClientRender", root, HUD3)
        removeEventHandler("onClientRender", root, HUD4)
        removeEventHandler("onClientRender", root, HUD5)
        setPlayerHudComponentVisible("all", false)
end)
function HUD6()

local stunde, minute=getTime()
    if minute <10 then minute = tostring("0"..minute) end
    if stunde <10 then minute = tostring("0"..stunde) end
    local pgeld = getPlayerMoney(localPlayer)
    local armor = getPedArmor ( localPlayer )
    local health = getElementHealth ( localPlayer, "health" )
    local hunger = math.ceil ( getElementHunger ( localPlayer, "hunger" ) )
    local sterne = getPlayerWantedLevel(localPlayer)
    local atem = getPedOxygenLevel(localPlayer)
    local leben = getElementHealth(localPlayer)
    local waffe = getPedWeapon(localPlayer)
    local ammo = getPedTotalAmmo(localPlayer)
    local magazin = getPedAmmoInClip(localPlayer)
    local time = getRealTime()
    local playerX, playerY, playerZ = getElementPosition ( localPlayer )
    local gebiet = getZoneName ( playerX, playerY, playerZ ) 
        if gebiet == "Unknown" then
        gebiet = "Nicht Lokalisierbar"
        end
        if gebiet == "San Fierro" then
        gebiet = "Police Departmend"
        end
        local stadt = getZoneName ( playerX, playerY, playerZ, true )
        if stadt == "San Fierro" then
        stadt = "SF"
        end
        if stadt == "Las Venturas" then
        stadt = "LV"
        end
        if stadt == "Los Santos" then
        stadt = "LS"
        end
        if stadt == "Unknown" then
        stadt = ""
        end
    local hours = time.hour
        if hours < 10 then
            hours = "0"..hours
        end
        local minutes = time.minute
        if minutes < 10 then
        minutes = "0"..minutes
        end
        local day = time.monthday
        if day < 10 then
        day = "0"..day
        end
        local month = time.month + 1
        if month < 10 then
        month = "0"..month
        end
        local year = time.year + 1900
    --GeldZeugs
        local geldlaenge = string.len(pgeld)
        local targetlaenge = 8- tonumber(geldlaenge)
        local nullen = ""
        for i = 1, targetlaenge, 1 do
        nullen = tostring(nullen.."0")
        end
        local geld = tostring(nullen..""..pgeld)
        --local dxfont0_Drugs = dxCreateFont(":guieditor/fonts/Drugs.ttf", 9)
        --local dxfont1_Drugs = dxCreateFont(":guieditor/fonts/Drugs.ttf", 11)
    dxDrawRectangle(1106, 20, 250, 79, tocolor(0, 0, 0, 185), false)
    dxDrawRectangle(1006, 99, 350, 85, tocolor(0, 0, 0, 185), false)
    dxDrawRectangle(1144, 49, 202, 15, tocolor(0, 19, 19, 254), false)
    dxDrawRectangle(1144, 49, 202*(armor/100), 15, tocolor(0, 131, 135, 254), false)
    dxDrawRectangle(1144, 56, 202*(armor/100), 8, tocolor(0, 106, 109, 254), false)
    dxDrawRectangle(1144, 82, 202, 15, tocolor(0, 25, 0, 254), false)
    dxDrawRectangle(1144, 82, 202*(health/100), 15, tocolor(0, 159, 0, 254), false)
    dxDrawRectangle(1144, 89, 202*(health/100), 8, tocolor(0, 129, 0, 254), false)
    dxDrawRectangle(1144, 115, 202, 15, tocolor(72, 85, 0, 254), false)
    dxDrawRectangle(1144, 115, 202*(hunger/100), 15, tocolor(169, 200, 0, 254), false)
    dxDrawRectangle(1144, 122, 202*(hunger/100), 8, tocolor(144, 171, 0, 254), false)
    dxDrawText(pgeld.." $", 1132 - 1, 140 - 1, 1346 - 1, 183 - 1, tocolor(0, 0, 0, 255), 1.40, "pricedown", "center", "center", false, false, false, false, false)
    dxDrawText(pgeld.." $", 1132 + 1, 140 - 1, 1346 + 1, 183 - 1, tocolor(0, 0, 0, 255), 1.40, "pricedown", "center", "center", false, false, false, false, false)
    dxDrawText(pgeld.." $", 1132 - 1, 140 + 1, 1346 - 1, 183 + 1, tocolor(0, 0, 0, 255), 1.40, "pricedown", "center", "center", false, false, false, false, false)
    dxDrawText(pgeld.." $", 1132 + 1, 140 + 1, 1346 + 1, 183 + 1, tocolor(0, 0, 0, 255), 1.40, "pricedown", "center", "center", false, false, false, false, false)
    dxDrawText(pgeld.." $", 1132, 140, 1346, 183, tocolor(255, 255, 255, 255), 1.40, "pricedown", "center", "center", false, false, false, false, false)
    dxDrawImage(1006, 20, 100, 80, tostring("images/hud/"..waffe..".png"))
    dxDrawText(gebiet..", "..stadt, 1144, 29, 1224, 46, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
    dxDrawText(magazin.." / "..ammo, 1032 - 1, 106 - 1, 1078 - 1, 122 - 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
    dxDrawText(magazin.." / "..ammo, 1032 + 1, 106 - 1, 1078 + 1, 122 - 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
    dxDrawText(magazin.." / "..ammo, 1032 - 1, 106 + 1, 1078 - 1, 122 + 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
    dxDrawText(magazin.." / "..ammo, 1032 + 1, 106 + 1, 1078 + 1, 122 + 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
    dxDrawText(magazin.." / "..ammo, 1032, 106, 1078, 122, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
    dxDrawText(""..math.ceil(armor).."  %", 1144 + 1, 48 + 1, 1346 + 1, 64 + 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
    dxDrawText(""..math.ceil(armor).."  %", 1144, 48, 1346, 64, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
    dxDrawText(""..math.ceil(health).."  %", 1144 + 1, 81 + 1, 1346 + 1, 97 + 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
    dxDrawText(""..math.ceil(health).."  %", 1144, 81, 1346, 97, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
    dxDrawText(""..math.ceil(hunger).."  %", 1144 + 1, 114 + 1, 1346 + 1, 130 + 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
    dxDrawText(""..math.ceil(hunger).."  %", 1144, 114, 1346, 130, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
    dxDrawText(hours..":"..minutes, 1297, 27, 1346, 45, tocolor(255, 255, 255, 255), 0.50, "bankgothic", "center", "center", false, false, false, false, false)
    dxDrawImage(1125, 115, 18, 15, ":VenoX/images/hud/hunger.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(1125, 82, 18, 15, ":VenoX/images/hud/health.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(1125, 49, 18, 15, ":VenoX/images/hud/armour.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    --dxDrawRectangle(1007, 230, 349, 20, tocolor(4, 0, 29, 255), false)
    --dxDrawRectangle(1006, 229, 350, 21, tocolor(105, 0, 0, 255), false)
    --dxDrawText(""..math.ceil(RP).."  %", 1005, 228, 1356, 250, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
    --dxDrawText("LVL 1", 1005, 229, 1356, 249, tocolor(255, 0, 0, 255), 3.00, "default", "center", "center", false, false, false, false, false)


    if getElementData (localPlayer, "wanteds") == 0 then
    
        dxDrawImage(1230, 180, 27, 25, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1080, 180, 27, 25, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1130, 180, 27, 25, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1180, 180, 27, 25, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1280, 180, 27, 25, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1030, 180, 27, 25, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    
    end

    if getElementData (localPlayer, "wanteds") == 1 then
    
        dxDrawImage(1230, 180, 27, 25, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1080, 180, 27, 25, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1130, 180, 27, 25, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1180, 180, 27, 25, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1280, 180, 27, 25, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1030, 180, 27, 25, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    
    end
    
    if getElementData (localPlayer, "wanteds") == 2 then
        dxDrawImage(1230, 180, 27, 25, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1080, 180, 27, 25, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1130, 180, 27, 25, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1180, 180, 27, 25, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1280, 180, 27, 25, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1030, 180, 27, 25, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end
    
    if getElementData (localPlayer, "wanteds") == 3 then   
        dxDrawImage(1230, 180, 27, 25, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1080, 180, 27, 25, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1130, 180, 27, 25, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1180, 180, 27, 25, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1280, 180, 27, 25, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1030, 180, 27, 25, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end
    
    if getElementData (localPlayer, "wanteds") == 4 then
        dxDrawImage(1230, 180, 27, 25, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1080, 180, 27, 25, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1130, 180, 27, 25, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1180, 180, 27, 25, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1280, 180, 27, 25, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1030, 180, 27, 25, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end
    
    if getElementData (localPlayer, "wanteds") == 5 then     
        dxDrawImage(1230, 180, 27, 25, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1080, 180, 27, 25, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1130, 180, 27, 25, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1180, 180, 27, 25, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1280, 180, 27, 25, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1030, 180, 27, 25, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end
    
    if getElementData (localPlayer, "wanteds") == 6 then
        dxDrawImage(1230, 180, 27, 25, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1080, 180, 27, 25, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1130, 180, 27, 25, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1180, 180, 27, 25, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1280, 180, 27, 25, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1030, 180, 27, 25, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end
end



function HUD3()
    local stunde, minute=getTime()
	if minute <10 then minute = tostring("0"..minute) end
	if stunde <10 then minute = tostring("0"..stunde) end
	local pgeld = getPlayerMoney(localPlayer)
	local armor = getPedArmor ( localPlayer )
	local health = getElementHealth ( localPlayer, "health" )
	local hunger = math.ceil ( getElementHunger ( localPlayer, "hunger" ) )
	local sterne = getPlayerWantedLevel(localPlayer)
	local atem = getPedOxygenLevel(localPlayer)
	local leben = getElementHealth(localPlayer)
	local waffe = getPedWeapon(localPlayer)
	local ammo = getPedTotalAmmo(localPlayer)
	local magazin = getPedAmmoInClip(localPlayer)
	local time = getRealTime()
	local playerX, playerY, playerZ = getElementPosition ( localPlayer )
	local gebiet = getZoneName ( playerX, playerY, playerZ ) 
		if gebiet == "Unknown" then
		gebiet = "Nicht Lokalisierbar"
		end
		if gebiet == "San Fierro" then
		gebiet = "Police Departmend"
		end
		local stadt = getZoneName ( playerX, playerY, playerZ, true )
		if stadt == "San Fierro" then
		stadt = "SF"
		end
		if stadt == "Las Venturas" then
		stadt = "LV"
		end
		if stadt == "Los Santos" then
		stadt = "LS"
		end
		if stadt == "Unknown" then
		stadt = ""
		end
	local hours = time.hour
		if hours < 10 then
			hours = "0"..hours
		end
		local minutes = time.minute
		if minutes < 10 then
		minutes = "0"..minutes
		end
		local day = time.monthday
		if day < 10 then
		day = "0"..day
		end
		local month = time.month + 1
		if month < 10 then
		month = "0"..month
		end
		local year = time.year + 1900
	--GeldZeugs
		local geldlaenge = string.len(pgeld)
		local targetlaenge = 8- tonumber(geldlaenge)
		local nullen = ""
		for i = 1, targetlaenge, 1 do
		nullen = tostring(nullen.."0")
		end
		local geld = tostring(nullen..""..pgeld)
        dxDrawRectangle(1100, 10, 256, 160, tocolor(0, 0, 0, 170), false)
        dxDrawLine(1138 - 1, 84 - 1, 1138 - 1, 114, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1338, 84 - 1, 1138 - 1, 84 - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1138 - 1, 114, 1338, 114, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1338, 114, 1338, 84 - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawRectangle(1138, 84, 200, 30, tocolor(30, 0, 0, 255), false)
        dxDrawLine(1138 - 1, 45 - 1, 1138 - 1, 75, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1338, 45 - 1, 1138 - 1, 45 - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1138 - 1, 75, 1338, 75, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1338, 75, 1338, 45 - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawRectangle(1138, 45, 200, 30, tocolor(30, 30, 30, 255), false)
        dxDrawText(pgeld.." $", 1140, 125, 1336, 160, tocolor(255, 255, 255, 255), 1.00, "pricedown", "center", "center", false, false, false, false, false)
        dxDrawRectangle(1138, 45, 200*(armor/100), 15, tocolor(196, 196, 196, 254), false)
        dxDrawRectangle(1138, 59, 200*(armor/100), 15, tocolor(159, 159, 159, 254), false)
        dxDrawRectangle(1138, 99, 200*(health/100), 15, tocolor(70, 0, 0, 255), false)
        dxDrawRectangle(1138, 84, 200*(health/100), 15, tocolor(100, 0, 0, 255), false)
        dxDrawText(gebiet..", "..stadt, 1138, 24, 1336, 45, tocolor(255, 255, 255, 255), 1.00, "clear", "left", "top", false, false, false, false, false)
        
        
        dxDrawImage(1008, 25, 82, 69, tostring("images/hud/"..waffe..".png"))
        dxDrawText(magazin.." / "..ammo, 1008, 94, 1090, 109, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawImage(1100, 10, 32, 32, ":VenoX/anzeigen/cpickup/images/vnxicon.png", 360, 0, 0, tocolor(255, 255, 255, 255), false)
        local breath = getPedOxygenLevel(getLocalPlayer())
        local breathf = 200 / 1075
        if isElementInWater(getLocalPlayer()) then
            dxDrawLine(1141 - 1, 210 - 1, 1141 - 1, 240, tocolor(0, 0, 0, 255), 1, false)
            dxDrawLine(1341, 210 - 1, 1141 - 1, 210 - 1, tocolor(0, 0, 0, 255), 1, false)
            dxDrawLine(1141 - 1, 240, 1341, 240, tocolor(0, 0, 0, 255), 1, false)
            dxDrawLine(1341, 240, 1341, 210 - 1, tocolor(0, 0, 0, 255), 1, false)
            dxDrawRectangle(1141, 210, 200, 30, tocolor(0, 30, 30, 255), false)
            dxDrawRectangle(1141, 210, breathf*breath, 15, tocolor(0, 131, 131, 255), false)
            dxDrawRectangle(1141, 225, breathf*breath, 15, tocolor(0, 103, 103, 255), false)
            dxDrawText(""..math.ceil(100/1075*breath).." %", 1141, 210, 1341, 240, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        end
       
       
        if getElementData(getLocalPlayer(), "fraktion") == 1 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/police.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 2 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/brotherhood.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 3 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/triaden.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 5 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/reporter.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 6 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/fbi.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 7 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/aztecas.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 8 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/army.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 9 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/biker.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 10 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/medic.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 11 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/oamt.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 12 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/ballas.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 13 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/grove.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 14 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/mafia.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        end

        if getElementData (localPlayer, "wanteds") == 1 then
            dxDrawImage(1116, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1156, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1196, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1236, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1276, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1316, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData (localPlayer, "wanteds") == 2 then
            dxDrawImage(1116, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1156, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1196, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1236, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1276, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1316, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData (localPlayer, "wanteds") == 3 then
            dxDrawImage(1116, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1156, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1196, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1236, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1276, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1316, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData (localPlayer, "wanteds") == 4 then
            dxDrawImage(1116, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1156, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1196, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1236, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1276, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1316, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData (localPlayer, "wanteds") == 5 then
            dxDrawImage(1116, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1156, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1196, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1236, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1276, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1316, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData (localPlayer, "wanteds") == 6 then
            dxDrawImage(1116, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1156, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1196, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1236, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1276, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1316, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        else
            dxDrawImage(1116, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1156, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1196, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1236, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1276, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1316, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        end
       
       
       
        dxDrawText(""..math.ceil(health).." %", 1137 - 1, 83 - 1, 1337 - 1, 114 - 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText(""..math.ceil(health).." %", 1137 + 1, 83 - 1, 1337 + 1, 114 - 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText(""..math.ceil(health).." %", 1137 - 1, 83 + 1, 1337 - 1, 114 + 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText(""..math.ceil(health).." %", 1137 + 1, 83 + 1, 1337 + 1, 114 + 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText(""..math.ceil(health).." %", 1137, 83, 1337, 114, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText(""..math.ceil(armor).." %", 1137 - 1, 45 - 1, 1337 - 1, 73 - 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText(""..math.ceil(armor).." %", 1137 + 1, 45 - 1, 1337 + 1, 73 - 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText(""..math.ceil(armor).." %", 1137 - 1, 45 + 1, 1337 - 1, 73 + 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText(""..math.ceil(armor).." %", 1137 + 1, 45 + 1, 1337 + 1, 73 + 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText(""..math.ceil(armor).." %", 1137, 45, 1337, 73, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
end


local dxfont0_drugs = dxCreateFont(":venox/fonts/drugs.ttf", 13)
local dxfont1_drugs = dxCreateFont(":venox/fonts/drugs.ttf", 14)
local dxfont2_drugs = dxCreateFont(":venox/fonts/drugs.ttf", 8)
local dxfont3_drugs = dxCreateFont(":venox/fonts/drugs.ttf", 12)
local dxfont4_drugs = dxCreateFont(":venox/fonts/drugs.ttf", 9)
local dxfont5_drugs = dxCreateFont(":venox/fonts/drugs.ttf", 10)

function HUD2()

    local stunde, minute=getTime()
        if minute <10 then minute = tostring("0"..minute) end
        if stunde <10 then minute = tostring("0"..stunde) end
        local pgeld = getPlayerMoney(localPlayer)
        local convertedMoney = convertNumber(pgeld)
        local armor = getPedArmor ( localPlayer )
        local health = getElementHealth ( localPlayer, "health" )
        local hunger = math.ceil ( getElementHunger ( localPlayer, "hunger" ) )
        local sterne = getPlayerWantedLevel(localPlayer)
        local atem = getPedOxygenLevel(localPlayer)
        local leben = getElementHealth(localPlayer)
        local waffe = getPedWeapon(localPlayer)
        local ammo = getPedTotalAmmo(localPlayer)
        local magazin = getPedAmmoInClip(localPlayer)
        local time = getRealTime()
        local playerX, playerY, playerZ = getElementPosition ( localPlayer )
        local gebiet = getZoneName ( playerX, playerY, playerZ ) 
            if gebiet == "Unknown" then
            gebiet = "Nicht Lokalisierbar"
            end
            if gebiet == "San Fierro" then
            gebiet = "Police Departmend"
            end
            local stadt = getZoneName ( playerX, playerY, playerZ, true )
            if stadt == "San Fierro" then
            stadt = "SF"
            end
            if stadt == "Las Venturas" then
            stadt = "LV"
            end
            if stadt == "Los Santos" then
            stadt = "LS"
            end
            if stadt == "Unknown" then
            stadt = ""
            end
        local hours = time.hour
            if hours < 10 then
                hours = "0"..hours
            end
            local minutes = time.minute
            if minutes < 10 then
            minutes = "0"..minutes
            end
            local day = time.monthday
            if day < 10 then
            day = "0"..day
            end
            local month = time.month + 1
            if month < 10 then
            month = "0"..month
            end
            local year = time.year + 1900
        --GeldZeugs
            local geldlaenge = string.len(pgeld)
            local targetlaenge = 8- tonumber(geldlaenge)
            local nullen = ""
            for i = 1, targetlaenge, 1 do
            nullen = tostring(nullen.."0")
            end
            local geld = tostring(nullen..""..pgeld)


 	 	dxDrawRectangle(1073, 31, 73, 84, tocolor(0, 0, 0, 156), false)
        dxDrawRectangle(1146, 93, 40, 38, tocolor(0, 0, 0, 156), false)
        dxDrawRectangle(1146, 71, 41, 22, tocolor(0, 0, 0, 156), false)
        dxDrawRectangle(1146, 31, 40, 40, tocolor(0, 0, 0, 156), false)
        dxDrawRectangle(1186, 133, 172, 30, tocolor(0, 0, 0, 156), false)
        dxDrawRectangle(1073, 115, 73, 16, tocolor(0, 0, 0, 156), false)
        dxDrawRectangle(1058, 31, 15, 100, tocolor(0, 0, 0, 156), false)
        dxDrawRectangle(1058, 10, 301, 21, tocolor(0, 0, 0, 156), false)



        dxDrawLine(1188 - 1, 95 - 1, 1188 - 1, 131, tocolor(116, 0, 0, 254), 1, false)
        dxDrawLine(1356, 95 - 1, 1188 - 1, 95 - 1, tocolor(116, 0, 0, 254), 1, false)
        dxDrawLine(1188 - 1, 131, 1356, 131, tocolor(116, 0, 0, 254), 1, false)
        dxDrawLine(1356, 131, 1356, 95 - 1, tocolor(116, 0, 0, 254), 1, false)


        dxDrawRectangle(1188, 95, 168, 36, tocolor(0, 0, 0, 110), false)

        dxDrawLine(1188 - 1, 33 - 1, 1188 - 1, 69, tocolor(0, 116, 165, 254), 1, false)
        dxDrawLine(1356, 33 - 1, 1188 - 1, 33 - 1, tocolor(0, 116, 165, 254), 1, false)
        dxDrawLine(1188 - 1, 69, 1356, 69, tocolor(0, 116, 165, 254), 1, false)
        dxDrawLine(1356, 69, 1356, 33 - 1, tocolor(0, 116, 165, 254), 1, false)

        dxDrawRectangle(1188, 33, 168, 36, tocolor(0, 0, 0, 110), false)

        dxDrawText(""..math.ceil(armor).." %", 1188 + 1, 33 + 1, 1356 + 1, 69 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont0_drugs, "center", "center", false, false, false, false, false)
        dxDrawText(""..math.ceil(armor).." %", 1188, 33, 1356, 69, tocolor(255, 254, 254, 254), 1.00, dxfont0_drugs, "center", "center", false, false, false, false, false)

        dxDrawRectangle(1190, 35, 164*(armor/100), 32, tocolor(0, 168, 239, 132), false) -- Armor Balken

        dxDrawImage(1149, 31, 0, 0, ":VenoX/images/nametag/armor.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        dxDrawRectangle(1190, 97, 164*(health/100), 32, tocolor(168, 0, 0, 132), false) -- Life Balken

        dxDrawText(""..math.ceil(health).." %", 1188, 95, 1356, 131, tocolor(255, 255, 255, 255), 1.00, dxfont1_drugs, "center", "center", false, false, false, false, false)
    


        dxDrawText("$"..convertedMoney, 1185 + 1, 141 + 1, 1354 + 1, 161 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont1_drugs, "right", "center", false, false, false, false, false)
        dxDrawText("$"..convertedMoney, 1185, 141, 1354, 161, tocolor(255, 255, 255, 255), 1.00, dxfont1_drugs, "right", "center", false, false, false, false, false)
        dxDrawText(gebiet..", "..stadt, 1188, 18, 1354, 31, tocolor(255, 255, 255, 255), 1.00, dxfont2_drugs, "left", "center", false, false, false, false, false)
        dxDrawText(magazin.." / "..ammo, 1075, 98, 1141, 107, tocolor(255, 255, 255, 255), 0.70, dxfont3_drugs, "center", "center", false, false, false, false, false)
        dxDrawRectangle(1187, 71, 179, 22, tocolor(0, 0, 0, 156), false)
        dxDrawRectangle(1359, 10, 12, 61, tocolor(0, 0, 0, 156), false)
        dxDrawRectangle(1358, 93, 12, 70, tocolor(0, 0, 0, 156), false)
        dxDrawRectangle(1185, 160, 0, 1, tocolor(255, 255, 255, 255), false)
        dxDrawRectangle(1058, 131, 128, 32, tocolor(0, 0, 0, 156), false)
        dxDrawRectangle(1058, 7, 308, 3, tocolor(0, 168, 239, 132), false)
        dxDrawText(hours..":"..minutes, 1081, 21, 1136, 33, tocolor(255, 255, 255, 255), 1.00, dxfont4_drugs, "center", "center", false, false, false, false, false)
        dxDrawImage(1149, 95, 36, 34, ":VenoX/images/hud/hud_2/heart2.png", 0, 0, 0, tocolor(249, 0, 0, 254), false)
        dxDrawImage(1149, 35, 36, 34, ":VenoX/images/nametag/armor.png", 0, 0, 0, tocolor(255, 255, 255, 254), false)
        dxDrawImage(1075, 33, 66, 63, tostring("images/hud/"..waffe..".png"))
        dxDrawText("VenoX", 1067, 115, 1146, 142, tocolor(255, 255, 255, 255), 1.00, dxfont5_drugs, "center", "center", false, false, false, false, false)


    if getElementData (localPlayer, "wanteds") == 0 then
       	dxDrawImage(1338, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1293, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1248, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1203, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1158, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1113, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    elseif getElementData (localPlayer, "wanteds") == 1 then
    	dxDrawImage(1338, 171, 26, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1293, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1248, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1203, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1158, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1113, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    elseif getElementData (localPlayer, "wanteds") == 2 then
    	dxDrawImage(1338, 171, 26, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1293, 171, 26, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1248, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1203, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1158, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1113, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    elseif getElementData (localPlayer, "wanteds") == 3 then
    	dxDrawImage(1338, 171, 26, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1293, 171, 26, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1248, 171, 26, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1203, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1158, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1113, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
   	elseif getElementData (localPlayer, "wanteds") == 4 then
    	dxDrawImage(1338, 171, 26, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1293, 171, 26, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1248, 171, 26, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1203, 171, 26, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1158, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1113, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    elseif getElementData (localPlayer, "wanteds") == 5 then
    	dxDrawImage(1338, 171, 26, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1293, 171, 26, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1248, 171, 26, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1203, 171, 26, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1158, 171, 26, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1113, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
   	elseif getElementData (localPlayer, "wanteds") == 6 then
    	dxDrawImage(1338, 171, 26, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1293, 171, 26, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1248, 171, 26, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1203, 171, 26, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1158, 171, 26, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1113, 171, 26, 21, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    else
    	dxDrawImage(1338, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1293, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1248, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1203, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1158, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(1113, 171, 26, 21, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end
end





function HUD5()
local stunde, minute=getTime()
	if minute <10 then minute = tostring("0"..minute) end
	if stunde <10 then minute = tostring("0"..stunde) end
	local pgeld = getPlayerMoney(localPlayer)
	local armor = getPedArmor ( localPlayer )
	local health = getElementHealth ( localPlayer, "health" )
	local hunger = math.ceil ( getElementHunger ( localPlayer, "hunger" ) )
	local sterne = getPlayerWantedLevel(localPlayer)
	local atem = getPedOxygenLevel(localPlayer)
	local leben = getElementHealth(localPlayer)
	local waffe = getPedWeapon(localPlayer)
	local ammo = getPedTotalAmmo(localPlayer)
	local magazin = getPedAmmoInClip(localPlayer)
	local time = getRealTime()
	local playerX, playerY, playerZ = getElementPosition ( localPlayer )
	local gebiet = getZoneName ( playerX, playerY, playerZ ) 
		if gebiet == "Unknown" then
		gebiet = "Nicht Lokalisierbar"
		end
		if gebiet == "San Fierro" then
		gebiet = "Police Departmend"
		end
		local stadt = getZoneName ( playerX, playerY, playerZ, true )
		if stadt == "San Fierro" then
		stadt = "SF"
		end
		if stadt == "Las Venturas" then
		stadt = "LV"
		end
		if stadt == "Los Santos" then
		stadt = "LS"
		end
		if stadt == "Unknown" then
		stadt = ""
		end
	local hours = time.hour
		if hours < 10 then
			hours = "0"..hours
		end
		local minutes = time.minute
		if minutes < 10 then
		minutes = "0"..minutes
		end
		local day = time.monthday
		if day < 10 then
		day = "0"..day
		end
		local month = time.month + 1
		if month < 10 then
		month = "0"..month
		end
		local year = time.year + 1900
	--GeldZeugs
		local geldlaenge = string.len(pgeld)
		local targetlaenge = 8- tonumber(geldlaenge)
		local nullen = ""
		for i = 1, targetlaenge, 1 do
		nullen = tostring(nullen.."0")
		end
		local geld = tostring(nullen..""..pgeld)
        dxDrawRectangle(1100, 10, 256, 160, tocolor(0, 0, 0, 170), false)
        dxDrawLine(1138 - 1, 84 - 1, 1138 - 1, 114, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1338, 84 - 1, 1138 - 1, 84 - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1138 - 1, 114, 1338, 114, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1338, 114, 1338, 84 - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawRectangle(1138, 84, 200, 30, tocolor(30, 0, 0, 255), false)
        dxDrawLine(1138 - 1, 45 - 1, 1138 - 1, 75, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1338, 45 - 1, 1138 - 1, 45 - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1138 - 1, 75, 1338, 75, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1338, 75, 1338, 45 - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawRectangle(1138, 45, 200, 30, tocolor(30, 30, 30, 255), false)
        dxDrawText(pgeld.." $", 1140, 125, 1336, 160, tocolor(255, 255, 255, 255), 1.00, "pricedown", "center", "center", false, false, false, false, false)
        dxDrawRectangle(1138, 45, 200*(armor/100), 15, tocolor(196, 196, 196, 254), false)
        dxDrawRectangle(1138, 59, 200*(armor/100), 15, tocolor(159, 159, 159, 254), false)
        dxDrawRectangle(1138, 99, 200*(health/100), 15, tocolor(70, 0, 0, 255), false)
        dxDrawRectangle(1138, 84, 200*(health/100), 15, tocolor(100, 0, 0, 255), false)
        dxDrawText(gebiet..", "..stadt, 1138, 24, 1336, 45, tocolor(255, 255, 255, 255), 1.00, "clear", "left", "top", false, false, false, false, false)
        
        
        dxDrawImage(1008, 25, 82, 69, tostring("images/hud/"..waffe..".png"))
        dxDrawText(magazin.." / "..ammo, 1008, 94, 1090, 109, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawImage(1100, 10, 32, 32, ":VenoX/anzeigen/cpickup/images/vnxicon.png", 360, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawLine(1141 - 1, 210 - 1, 1141 - 1, 240, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1341, 210 - 1, 1141 - 1, 210 - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1141 - 1, 240, 1341, 240, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1341, 240, 1341, 210 - 1, tocolor(0, 0, 0, 255), 1, false)
        local breath = getPedOxygenLevel(getLocalPlayer())
        local breathf = 200 / 1075
        if isElementInWater(player) then
            dxDrawRectangle(1141, 210, breathf*breath, 30, tocolor(0, 30, 30, 255), false)
            dxDrawRectangle(1141, 210, breathf*breath, 15, tocolor(0, 131, 131, 255), false)
            dxDrawRectangle(1141, 225, breathf*breath, 15, tocolor(0, 103, 103, 255), false)
            dxDrawText(""..math.ceil(100/1075*breath).." %", 1141, 210, 1341, 240, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        end
       
       
        if getElementData(getLocalPlayer(), "fraktion") == 1 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/police.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 2 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/brotherhood.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 3 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/triaden.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 5 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/reporter.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 6 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/fbi.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 7 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/aztecas.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 8 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/army.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 9 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/biker.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 10 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/medic.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 11 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/oamt.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 12 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/ballas.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 13 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/grove.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 14 then 
            dxDrawImage(1106, 124, 34, 36, ":VenoX/images/nametag/mafia.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        end

        if getElementData (localPlayer, "wanteds") == 1 then
            dxDrawImage(1116, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1156, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1196, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1236, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1276, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1316, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData (localPlayer, "wanteds") == 2 then
            dxDrawImage(1116, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1156, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1196, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1236, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1276, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1316, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData (localPlayer, "wanteds") == 3 then
            dxDrawImage(1116, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1156, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1196, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1236, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1276, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1316, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData (localPlayer, "wanteds") == 4 then
            dxDrawImage(1116, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1156, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1196, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1236, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1276, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1316, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData (localPlayer, "wanteds") == 5 then
            dxDrawImage(1116, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1156, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1196, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1236, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1276, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1316, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData (localPlayer, "wanteds") == 6 then
            dxDrawImage(1116, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1156, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1196, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1236, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1276, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1316, 170, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        else
            dxDrawImage(1116, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1156, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1196, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1236, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1276, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1316, 170, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        end
       
       
       
        dxDrawText(""..math.ceil(health).." %", 1137 - 1, 83 - 1, 1337 - 1, 114 - 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText(""..math.ceil(health).." %", 1137 + 1, 83 - 1, 1337 + 1, 114 - 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText(""..math.ceil(health).." %", 1137 - 1, 83 + 1, 1337 - 1, 114 + 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText(""..math.ceil(health).." %", 1137 + 1, 83 + 1, 1337 + 1, 114 + 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText(""..math.ceil(health).." %", 1137, 83, 1337, 114, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText(""..math.ceil(armor).." %", 1137 - 1, 45 - 1, 1337 - 1, 73 - 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText(""..math.ceil(armor).." %", 1137 + 1, 45 - 1, 1337 + 1, 73 - 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText(""..math.ceil(armor).." %", 1137 - 1, 45 + 1, 1337 - 1, 73 + 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText(""..math.ceil(armor).." %", 1137 + 1, 45 + 1, 1337 + 1, 73 + 1, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText(""..math.ceil(armor).." %", 1137, 45, 1337, 73, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
end



function HUD4() --SimpleHUD

	local stunde, minute=getTime()
	if minute <10 then minute = tostring("0"..minute) end
	if stunde <10 then minute = tostring("0"..stunde) end
	local pgeld = getPlayerMoney(localPlayer)
	local armor = getPedArmor ( localPlayer )
	local health = getElementHealth ( localPlayer, "health" )
	local hunger = math.ceil ( getElementHunger ( localPlayer, "hunger" ) )
	local sterne = getPlayerWantedLevel(localPlayer)
	local atem = getPedOxygenLevel(localPlayer)
	local leben = getElementHealth(localPlayer)
	local waffe = getPedWeapon(localPlayer)
	local ammo = getPedTotalAmmo(localPlayer)
	local magazin = getPedAmmoInClip(localPlayer)
	local time = getRealTime()
	local playerX, playerY, playerZ = getElementPosition ( localPlayer )
	local gebiet = getZoneName ( playerX, playerY, playerZ ) 
		if gebiet == "Unknown" then
		gebiet = "Nicht Lokalisierbar"
		end
		if gebiet == "San Fierro" then
		gebiet = "Police Departmend"
		end
		local stadt = getZoneName ( playerX, playerY, playerZ, true )
		if stadt == "San Fierro" then
		stadt = "SF"
		end
		if stadt == "Las Venturas" then
		stadt = "LV"
		end
		if stadt == "Los Santos" then
		stadt = "LS"
		end
		if stadt == "Unknown" then
		stadt = ""
		end
		local hours = time.hour
		if hours < 10 then
			hours = "0"..hours
		end
		local minutes = time.minute
		if minutes < 10 then
		minutes = "0"..minutes
		end
		local day = time.monthday
		if day < 10 then
		day = "0"..day
		end
		local month = time.month + 1
		if month < 10 then
		month = "0"..month
		end
		local year = time.year + 1900
		--GeldZeugs
		local geldlaenge = string.len(pgeld)
		local targetlaenge = 8- tonumber(geldlaenge)
		local nullen = ""
		for i = 1, targetlaenge, 1 do
		nullen = tostring(nullen.."0")
		end
		local geld = tostring(nullen..""..pgeld)
        dxDrawRectangle(1009, 10, 347, 177, tocolor(0, 0, 0, 200), false)
        dxDrawRectangle(1006, 10, 3, 178, tocolor(0, 150, 200, 200), false)
        dxDrawRectangle(1006, 7, 353, 3, tocolor(0, 150, 200, 200), false)
        dxDrawRectangle(1356, 10, 3, 178, tocolor(0, 150, 200, 200), false)
        dxDrawRectangle(1006, 187, 353, 3, tocolor(0, 150, 200, 200), false)

        dxDrawLine(1145 - 1, 25 - 1, 1145 - 1, 47, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1346, 25 - 1, 1145 - 1, 25 - 1, tocolor(0, 0, 0, 255), 1, false)

        dxDrawLine(1145 - 1, 47, 1346, 47, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1346, 47, 1346, 25 - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawRectangle(1145, 25, 201, 22, tocolor(0, 47, 63, 200), false)
        dxDrawLine(1145 - 1, 65 - 1, 1145 - 1, 87, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1346, 65 - 1, 1145 - 1, 65 - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1145 - 1, 87, 1346, 87, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1346, 87, 1346, 65 - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawRectangle(1145, 65, 201, 22, tocolor(47, 0, 0, 200), false)
        dxDrawLine(1145 - 1, 105 - 1, 1145 - 1, 127, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1346, 105 - 1, 1145 - 1, 105 - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1145 - 1, 127, 1346, 127, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(1346, 127, 1346, 105 - 1, tocolor(0, 0, 0, 255), 1, false)


        dxDrawRectangle(1145, 105, 201, 22, tocolor(0, 55, 45, 200), false)
        dxDrawRectangle(1145, 25, 201*(armor/100), 11, tocolor(0, 137, 183, 255), false)
        dxDrawRectangle(1145, 36, 201*(armor/100), 11, tocolor(0, 95, 127, 255), false)
        local breath = getPedOxygenLevel(getLocalPlayer())
        local breathf = 201 / 1075
        dxDrawRectangle(1145, 76, 201*(health/100), 11, tocolor(135, 0, 0, 200), false)
        dxDrawRectangle(1145, 65, 201*(health/100), 11, tocolor(205, 0, 0, 200), false)
        dxDrawRectangle(1145, 116, breathf*breath, 11, tocolor(0, 145, 118, 200), false)
        dxDrawRectangle(1145, 105, breathf*breath, 11, tocolor(0, 201, 163, 200), false)
        dxDrawText("$"..pgeld, 1145, 142, 1346, 172, tocolor(255, 255, 255, 255), 0.70, "bankgothic", "center", "center", false, false, false, false, false)
        dxDrawImage(1021, 25, 104, 80, tostring("images/hud/"..waffe..".png"))
        dxDrawText(magazin.." / "..ammo, 1022, 104, 1125, 117, tocolor(255, 255, 255, 255), 0.80, "default", "center", "bottom", false, false, false, false, false)
        dxDrawText(gebiet..", "..stadt, 1144, 11, 1230, 25, tocolor(255, 255, 255, 255), 0.90, "default", "left", "top", false, false, false, false, false)
        dxDrawText(hours..":"..minutes, 1029, 10, 1115, 24, tocolor(255, 255, 255, 255), 0.90, "clear", "center", "center", false, false, false, false, false)
        --dxDrawImage(1020, 131, 63, 46, ":VenoX/images/nametag/army.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText(""..math.ceil(armor).." %", 1144, 24, 1346, 47, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText(""..math.ceil(health).." %", 1144, 64, 1346, 87, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        dxDrawText(""..math.ceil(100/1075*breath).." %", 1144, 104, 1346, 127, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        
        if getElementData(getLocalPlayer(), "fraktion") == 1 then 
            dxDrawImage(1020, 131, 63, 46, ":VenoX/images/nametag/police.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 2 then 
            dxDrawImage(1020, 131, 63, 46, ":VenoX/images/nametag/brotherhood.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 3 then 
            dxDrawImage(1020, 131, 63, 46, ":VenoX/images/nametag/triaden.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 5 then 
            dxDrawImage(1020, 131, 63, 46, ":VenoX/images/nametag/reporter.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 6 then 
            dxDrawImage(1020, 131, 63, 46, ":VenoX/images/nametag/fbi.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 7 then 
            dxDrawImage(1020, 131, 63, 46, ":VenoX/images/nametag/aztecas.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 8 then 
            dxDrawImage(1020, 131, 63, 46, ":VenoX/images/nametag/army.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 9 then 
            dxDrawImage(1020, 131, 63, 46, ":VenoX/images/nametag/biker.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 10 then 
            dxDrawImage(1020, 131, 63, 46, ":VenoX/images/nametag/medic.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 11 then 
            dxDrawImage(1020, 131, 63, 46, ":VenoX/images/nametag/oamt.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 12 then 
            dxDrawImage(1020, 131, 63, 46, ":VenoX/images/nametag/ballas.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 13 then 
            dxDrawImage(1020, 131, 63, 46, ":VenoX/images/nametag/grove.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 14 then 
            dxDrawImage(1020, 131, 63, 46, ":VenoX/images/nametag/mafia.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "fraktion") == 15 then 
            dxDrawImage(1020, 131, 63, 46, ":VenoX/images/nametag/oamt.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        end 
        
        
        if getElementData (localPlayer, "wanteds") == 1 then
            dxDrawImage(1067, 195, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1115, 195, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1161, 195, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1208, 195, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1255, 195, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1305, 195, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "wanteds") == 2 then 
            dxDrawImage(1067, 195, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1115, 195, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1161, 195, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1208, 195, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1255, 195, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1305, 195, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "wanteds") == 3 then 
            dxDrawImage(1067, 195, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1115, 195, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1161, 195, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1208, 195, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1255, 195, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1305, 195, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "wanteds") == 4 then 
            dxDrawImage(1067, 195, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1115, 195, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1161, 195, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1208, 195, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1255, 195, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1305, 195, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "wanteds") == 5 then 
            dxDrawImage(1067, 195, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1115, 195, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1161, 195, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1208, 195, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1255, 195, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1305, 195, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        elseif getElementData(getLocalPlayer(), "wanteds") == 6 then 
            dxDrawImage(1067, 195, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1115, 195, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1161, 195, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1208, 195, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1255, 195, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1305, 195, 30, 30, ":VenoX/images/hud/wanted_active.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        else 
            dxDrawImage(1067, 195, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1115, 195, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1161, 195, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1208, 195, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1255, 195, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
            dxDrawImage(1305, 195, 30, 30, ":VenoX/images/hud/wanted_inactive.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        end
end


local button = {}
local window = {}

addCommandHandler("hud", function()
local screenW, screenH = guiGetScreenSize()
	if getLocalPlayer() then
		window[1] = guiCreateWindow((screenW - 221) / 2, (screenH - 86) / 2, 221, 86, "HUD-Changer", false)
		guiWindowSetSizable(window[1], false)
		showCursor(true)

		button[1] = guiCreateButton(10, 37, 82, 33, "Change", false, window[1])
		guiSetProperty(button[1], "NormalTextColour", "FFAAAAAA")
		button[2] = guiCreateButton(136, 37, 75, 33, "Close", false, window[1])
		guiSetProperty(button[2], "NormalTextColour", "FFAAAAAA")  

		addEventHandler("onClientGUIClick", button[1], function()
			if state == 0 then
				removeEventHandler("onClientRender", root, HUD1)
				removeEventHandler("onClientRender", root, HUD2)
                removeEventHandler("onClientRender", root, HUD3)
                removeEventHandler("onClientRender", root, HUD4)
                removeEventHandler("onClientRender", root, HUD5)
                removeEventHandler("onClientRender", root, HUD6)
				setPlayerHudComponentVisible("all", true)
				state = 1
			elseif state == 1 then
				setPlayerHudComponentVisible("all", false)
				setPlayerHudComponentVisible("radar", true)
				setPlayerHudComponentVisible("crosshair", true)
				addEventHandler("onClientRender", root, HUD1)
				state = 2
			elseif state == 2 then
				addEventHandler("onClientRender", root, HUD2)
				removeEventHandler("onClientRender", root, HUD1)
				state = 3
            elseif state == 3 then
                addEventHandler("onClientRender", root, HUD3)
                removeEventHandler("onClientRender", root, HUD1)
                removeEventHandler("onClientRender", root, HUD2)
                state = 4
			elseif state == 4 then
                addEventHandler("onClientRender", root, HUD4)
                removeEventHandler("onClientRender", root, HUD1)
                removeEventHandler("onClientRender", root, HUD2)
                removeEventHandler("onClientRender", root, HUD3)
                state = 5
            elseif state == 5 then
                addEventHandler("onClientRender", root, HUD5)
                removeEventHandler("onClientRender", root, HUD1)
                removeEventHandler("onClientRender", root, HUD2)
                removeEventHandler("onClientRender", root, HUD3)
                removeEventHandler("onClientRender", root, HUD4)
                state = 6
            elseif state == 6 then
            	addEventHandler("onClientRender", root, HUD6)
            	removeEventHandler("onClientRender", root, HUD1)
                removeEventHandler("onClientRender", root, HUD2)
                removeEventHandler("onClientRender", root, HUD3)
                removeEventHandler("onClientRender", root, HUD4)
                removeEventHandler("onClientRender", root, HUD5)
                state = 0
            end
		end, false)
		
		addEventHandler("onClientGUIClick", button[2], function()
			guiSetVisible(window[1], false)
			showCursor(false)
		end, false)
	end
end)

--[[bindKey("b", "down", function()
    if state == 0 then
        removeEventHandler("onClientRender", root, HUD1)
		removeEventHandler("onClientRender", root, HUD2)
		setPlayerHudComponentVisible("all", true)
		state = 1
    elseif state == 1 then
        setPlayerHudComponentVisible("all", false)
		setPlayerHudComponentVisible("radar", true)
		setPlayerHudComponentVisible("crosshair", true)
		addEventHandler("onClientRender", root, HUD1)
		state = 2
	elseif state == 2 then
		addEventHandler("onClientRender", root, HUD2)
		removeEventHandler("onClientRender", root, HUD1)
		state = 0
    end
end)]]
