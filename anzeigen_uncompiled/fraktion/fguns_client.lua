--dxDrawText("Fraktions Kasse \n-----------------------\n\nMats : 4034\nWeed : 330\nKokain : 1132\nGeld : 334653", 763, 370, 936, 547, tocolor(255, 255, 255, 255), 1.00, arial_font_pro, "center", "top", false, false, false, false, false)
--dxDrawRectangle(758, 370, 5, 220, tocolor(0, 105, 145, 179), false)
--dxDrawRectangle(758, 365, 200, 5, tocolor(0, 105, 145, 179), false)


local arial_font_pro = dxCreateFont(":pr0/files/fonts/arial.ttf", 10)
local screenX, screenY = guiGetScreenSize()
local sx, sy = screenX/1366, screenY/768
local Moneycost = {
	[1] = 100,
	[2] = 300,
	[3] = 400,
	[4] = 400,
	[5] = 400,
	[6] = 400,
	[7] = 500,
	[8] = 45000,
	[9] = 65000
}
local Matscost = {
	[1] = 20,
	[2] = 40,
	[3] = 60,
	[4] = 60,
	[5] = 60,
	[6] = 60,
	[7] = 80,
	[8] = 1000,
	[9] = 5000
}

function drawfstatefguns()
    dxDrawText("Fraktions Kasse \n-----------------------\n\nMats : "..fguns_mats.."\nWeed : "..fguns_drugs.."\nKokain : "..fguns_kokain.."\nGeld : "..fguns_money.." $", sx*763, sy*370, sx*936, sy*547, tocolor(255, 255, 255, 255), 1.00, arial_font_pro, "center", "top", false, false, false, false, false)
    dxDrawRectangle(sx*758, sy*370, sx*5, sy*220, tocolor(0, 105, 145, 179), false)
    dxDrawRectangle(sx*758, sy*365, sx*200, sy*5, tocolor(0, 105, 145, 179), false)
end 

function drawfstatefgunsvnx(fmoney, fmats, fdrugs, fkoks)
    fguns_kokain = fkoks
    fguns_money = fmoney
    fguns_mats = fmats 
    fguns_drugs = fdrugs
    addEventHandler("onClientRender", getRootElement(), drawfstatefguns)
end 
addEvent ( "startFgunsGui_Depot", true )
addEventHandler( "startFgunsGui_Depot", getRootElement(), drawfstatefgunsvnx )
function close_fguns_vnx()
    vnxDestroyWindow("fguns_new_window")
    ---------------------------------------
    vnxDestroyWindow("triaden_katana_icon")
    vnxDestroyWindow("triaden_katana_btn")
    vnxDestroyWindow("triaden_baseball_icon")
    vnxDestroyWindow("triaden_baseball_btn")
    ---------------------------------------
    vnxDestroyWindow("mafia_messer_icon")
    vnxDestroyWindow("mafia_messer_btn")
    vnxDestroyWindow("mafia_lupara_icon")
    vnxDestroyWindow("mafia_lupara_btn")
    ---------------------------------------
    vnxDestroyWindow("otherf_9mm_icon")
    vnxDestroyWindow("otherf_9mm_btn")
    ---------------------------------------
    vnxDestroyWindow("deagle_fguns_icon")
    vnxDestroyWindow("deagle_fguns_btn")
    vnxDestroyWindow("deagle_fguns_icon_lockedb")
    vnxDestroyWindow("deagle_fguns_icon_locked")
---------------------------------------
    vnxDestroyWindow("mp5_fguns_icon")
    vnxDestroyWindow("mp5_fguns_btn")
    vnxDestroyWindow("mp5_fguns_icon_lockedb")
    vnxDestroyWindow("mp5_fguns_icon_locked")
    ---------------------------------------
    vnxDestroyWindow("ak47_fguns_icon")
    vnxDestroyWindow("ak47_fguns_btn")
    vnxDestroyWindow("ak47_fguns_icon_lockedb")
    vnxDestroyWindow("ak47_fguns_icon_locked")
    ---------------------------------------
    vnxDestroyWindow("M4_fguns_icon")
    vnxDestroyWindow("M4_fguns_btn")
    vnxDestroyWindow("M4_fguns_icon_lockedb")
    vnxDestroyWindow("M4_fguns_icon_locked")
    ---------------------------------------
    vnxDestroyWindow("rifle_fguns_icon")
    vnxDestroyWindow("rifle_fguns_btn")
    vnxDestroyWindow("rifle_fguns_icon_lockedb")
    vnxDestroyWindow("rifle_fguns_icon_locked")
    ---------------------------------------
    vnxDestroyWindow("sniper_fguns_icon")
    vnxDestroyWindow("sniper_fguns_btn")
    vnxDestroyWindow("sniper_fguns_icon_lockedb")
    vnxDestroyWindow("sniper_fguns_icon_locked")
    ---------------------------------------
    vnxDestroyWindow("rocketlauncher_fguns_icon")
    vnxDestroyWindow("rocketlauncher_fguns_btn")
    vnxDestroyWindow("rocketlauncher_fguns_icon_lockedb")
    vnxDestroyWindow("rocketlauncher_fguns_icon_locked")
    removeEventHandler("onClientRender", getRootElement(), deagle_locked_fguns)
    removeEventHandler("onClientRender", getRootElement(), mp5_locked_fguns)
    removeEventHandler("onClientRender", getRootElement(), ak47_locked_fguns)
    removeEventHandler("onClientRender", getRootElement(), m4_locked_fguns)
    removeEventHandler("onClientRender", getRootElement(), rifle_locked_fguns)
    removeEventHandler("onClientRender", getRootElement(), sniper_locked_fguns)
    removeEventHandler("onClientRender", getRootElement(), rocketlauncher_locked_fguns)
    removeEventHandler("onClientRender", getRootElement(), drawfstatefguns)
    window_already_open = false
    showCursor(false)
end 
function molotov_buy_fguns()
    triggerServerEvent ( "giveFgunsWeapon", lp, "Molotov", Moneycost[4], Matscost[4] )
end 
function messer_buy_fguns()
    triggerServerEvent ( "giveFgunsWeapon", lp, "Messer", Moneycost[1], Matscost[1] )
end 
function baseball_buy_fguns()
    triggerServerEvent ( "giveFgunsWeapon", lp, "Baseball", Moneycost[1], Matscost[1] )
end 
function lupara_buy_fguns()
    triggerServerEvent ( "giveFgunsWeapon", lp, "Lupara", Moneycost[4], Matscost[4] )
end 
function katana_buy_fguns()
    triggerServerEvent ( "giveFgunsWeapon", lp, "Katana", Moneycost[4], Matscost[4] )
end 
function deagle_buy_fguns()
    triggerServerEvent ( "giveFgunsWeapon", lp, "Deagle", Moneycost[2], Matscost[2] )
end 
function mp5_buy_fguns()
    triggerServerEvent ( "giveFgunsWeapon", lp, "Mp5", Moneycost[3], Matscost[3] )
end 
function ak47_buy_fguns()
    triggerServerEvent ( "giveFgunsWeapon", lp, "AK47", Moneycost[6], Matscost[6] )
end 
function m4_buy_fguns()
    triggerServerEvent ( "giveFgunsWeapon", lp, "M4", Moneycost[7], Matscost[7] )
end 
function rifle_buy_fguns()
    triggerServerEvent ( "giveFgunsWeapon", lp, "Gewehr", Moneycost[5], Matscost[5] )
end 
function sniper_buy_fguns()
    triggerServerEvent ( "giveFgunsWeapon", lp, "Sniper", Moneycost[8], Matscost[8] )
end 
function rocket_buy_fguns()
    triggerServerEvent ( "giveFgunsWeapon", lp, "Raketenwerfer", Moneycost[9], Matscost[9] )
end 
function deagle_locked_fguns()
    dxDrawText("Verfügbar ab \nRank 1 & 60 Minuten.", sx*650, sy*160, sx*730, sy*190, tocolor(255, 255, 255, 255), 0.90, arial_font_pro, "center", "center", false, false, false, false, false)
end 
function mp5_locked_fguns()
    dxDrawText("Verfügbar ab \nRank 2 & 3 Stunden.", sx*800, sy*160, sx*880, sy*190, tocolor(255, 255, 255, 255), 0.90, arial_font_pro, "center", "center", false, false, false, false, false)
end 
function ak47_locked_fguns()
    dxDrawText("Verfügbar ab \nRank 3 & 10 Stunden.", sx*500, sy*310, sx*580, sy*340, tocolor(255, 255, 255, 255), 0.90, arial_font_pro, "center", "center", false, false, false, false, false)
end 
function m4_locked_fguns()
    dxDrawText("Verfügbar ab \nRank 3 & 10 Stunden.", sx*650, sy*310, sx*730, sy*340, tocolor(255, 255, 255, 255), 0.90, arial_font_pro, "center", "center", false, false, false, false, false)
end 
function rifle_locked_fguns()
    dxDrawText("Verfügbar ab \nRank 2 & 5 Stunden.", sx*800, sy*310, sx*880, sy*340, tocolor(255, 255, 255, 255), 0.90, arial_font_pro, "center", "center", false, false, false, false, false)
end 
function sniper_locked_fguns()
    dxDrawText("Verfügbar ab \nRank 4 & 20 Stunden.", sx*500, sy*460, sx*580, sy*490, tocolor(255, 255, 255, 255), 0.90, arial_font_pro, "center", "center", false, false, false, false, false)
end 
function rocketlauncher_locked_fguns()
    dxDrawText("Verfügbar ab \nRank 5 & 50 Stunden.", sx*650, sy*460, sx*730, sy*490, tocolor(255, 255, 255, 255), 0.90, arial_font_pro, "center", "center", false, false, false, false, false)
end 


function createFgunsGui_newVnX (therank, thefrac)
    local ptime = tonumber(getElementData(getLocalPlayer(), "playingtime"))
    showCursor(true)
    if window_already_open == false then
        window_already_open = true 
        vnxDrawWindow("fguns_new_window","window","Was möchtest du Kaufen Bruder ?",sx*437,sy*38,sx*521,sy*552,"close_fguns_vnx")
        if thefrac == 3 then
            if therank >= 2 then
                vnxDrawImage("triaden_katana_icon", "Katana Icon", sx*500, sy*70, sx*80, sy*80, "images/hud/8")
                vnxDrawButtonColored("triaden_katana_btn", "Katana Func", Moneycost[4].."$\n"..Matscost[4].." Mats", sx*500, sy*160, sx*80, sy*30, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "katana_buy_fguns")
            else 
                vnxDrawImage("triaden_baseball_icon", "Baseball Icon", sx*500, sy*70, sx*80, sy*80, "images/hud/5")
                vnxDrawButtonColored("triaden_baseball_btn", "baseball Func", Moneycost[1].."$\n"..Matscost[1].." Mats", sx*500, sy*160, sx*80, sy*30, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "baseball_buy_fguns")
            end 
        elseif thefrac == 2 or thefrac == 14 then 
            if therank >= 2 then
                vnxDrawImage("mafia_lupara_icon", "Lupara Icon", sx*500, sy*70, sx*80, sy*80, "images/hud/26")
                vnxDrawButtonColored("mafia_lupara_btn", "lupara Func", Moneycost[4].."$\n"..Matscost[4].." Mats", sx*500, sy*160, sx*80, sy*30, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "lupara_buy_fguns")
            else
                vnxDrawImage("mafia_messer_icon", "Messer Icon", sx*500, sy*70, sx*80, sy*80, "images/hud/4")
                vnxDrawButtonColored("mafia_messer_btn", "messer Func", Moneycost[1].."$\n"..Matscost[1].." Mats", sx*500, sy*160, sx*80, sy*30, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "messer_buy_fguns")
            end 
        else 
            if therank >= 2 then 
                vnxDrawImage("otherf_9mm_icon", "Molotov Icon", sx*500, sy*70, sx*80, sy*80, "images/hud/18")
                vnxDrawButtonColored("otherf_9mm_btn", "9mm Func", Moneycost[4].."$ |"..Matscost[4].." Mats", sx*500, sy*160, sx*80, sy*30, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "molotov_buy_fguns")
            else 
                vnxDrawImage("otherf_9mm_icon", "9mm Icon", sx*500, sy*70, sx*80, sy*80, "images/hud/4")
                vnxDrawButtonColored("otherf_9mm_btn", "9mm Func", Moneycost[1].."$\n"..Matscost[1].." Mats", sx*500, sy*160, sx*80, sy*30, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "messer_buy_fguns")
            end
        end
    -- Deagle 
        if therank >= 1 and ptime >= 60 then 
            vnxDrawImage("deagle_fguns_icon", "Deagle Icon", sx*650, sy*70, sx*80, sy*80, "images/hud/24")
            vnxDrawButtonColored("deagle_fguns_btn", "9mm Func", Moneycost[2].."$\n"..Matscost[2].." Mats", sx*650, sy*160, sx*80, sy*30, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "deagle_buy_fguns")
        else
            vnxDrawImage("deagle_fguns_icon", "Deagle Icon", sx*650, sy*70, sx*80, sy*80, "images/hud/24")
            vnxDrawImage("deagle_fguns_icon_lockedb", "Deagle Icon", sx*650, sy*70, sx*80, sy*80, "anzeigen/images/weapons/locked_background")
            vnxDrawImage("deagle_fguns_icon_locked", "Deagle Icon", sx*650, sy*70, sx*80, sy*80, "anzeigen/images/weapons/locked")
            addEventHandler("onClientRender", getRootElement(), deagle_locked_fguns)
        end
    -- Mp5
        if therank >= 2 and ptime >= 180 then 
            vnxDrawImage("mp5_fguns_icon", "mp5 Icon", sx*800, sy*70, sx*80, sy*80, "images/hud/29")
            vnxDrawButtonColored("mp5_fguns_btn", "mp5 Func", Moneycost[3].."$\n"..Matscost[3].." Mats", sx*800, sy*160, sx*80, sy*30, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "mp5_buy_fguns")
        else             
            vnxDrawImage("mp5_fguns_icon", "Mp5 Icon", sx*800, sy*70, sx*80, sy*80, "images/hud/29")
            vnxDrawImage("mp5_fguns_icon_lockedb", "mp5 Icon", sx*800, sy*70, sx*80, sy*80, "anzeigen/images/weapons/locked_background")
            vnxDrawImage("mp5_fguns_icon_locked", "Mp5 Icon", sx*800, sy*70, sx*80, sy*80, "anzeigen/images/weapons/locked")
            addEventHandler("onClientRender", getRootElement(), mp5_locked_fguns)
        end

     -- Ak47 
    if therank >= 3 and ptime >= 600 then 
        vnxDrawImage("ak47_fguns_icon", "ak47 Icon", sx*500, sy*220, sx*80, sy*80, "images/hud/30")
        vnxDrawButtonColored("ak47_fguns_btn", "ak47 Func", Moneycost[6].."$\n"..Matscost[6].." Mats", sx*500, sy*310, sx*80, sy*30, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "ak47_buy_fguns")
    else 
        vnxDrawImage("ak47_fguns_icon", "AK Icon", sx*500, sy*220, sx*80, sy*80, "images/hud/30")
        vnxDrawImage("ak47_fguns_icon_lockedb", "ak47 Icon", sx*500, sy*220, sx*80, sy*80, "anzeigen/images/weapons/locked_background")
        vnxDrawImage("ak47_fguns_icon_locked", "ak47 Icon", sx*500, sy*220, sx*80, sy*80, "anzeigen/images/weapons/locked")
        addEventHandler("onClientRender", getRootElement(), ak47_locked_fguns)
    end
    -- M4
    if therank >= 3 and ptime >= 600 then 
        vnxDrawImage("M4_fguns_icon", "M4 Icon", sx*650, sy*220, sx*80, sy*80, "images/hud/31")
        vnxDrawButtonColored("M4_fguns_btn", "M4 Func", Moneycost[7].."$\n"..Matscost[7].." Mats", sx*650, sy*310, sx*80, sy*30, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "m4_buy_fguns")
    else 
        vnxDrawImage("M4_fguns_icon", "M4 Icon", sx*650, sy*220, sx*80, sy*80, "images/hud/31")
        vnxDrawImage("M4_fguns_icon_lockedb", "M4 Icon", sx*650, sy*220, sx*80, sy*80, "anzeigen/images/weapons/locked_background")
        vnxDrawImage("M4_fguns_icon_locked", "M4 Icon", sx*650, sy*220, sx*80, sy*80, "anzeigen/images/weapons/locked")
        addEventHandler("onClientRender", getRootElement(), m4_locked_fguns)
    end
    if therank >= 2 and ptime >= 300 then 
        -- Rifle
        vnxDrawImage("rifle_fguns_icon", "Rifle Icon", sx*800, sy*220, sx*80, sy*80, "images/hud/33")
        vnxDrawButtonColored("rifle_fguns_btn", "Rifle Func", Moneycost[5].."$\n"..Matscost[5].." Mats", sx*800, sy*310, sx*80, sy*30, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "rifle_buy_fguns")
    else
        vnxDrawImage("rifle_fguns_icon", "rifle Icon", sx*800, sy*220, sx*80, sy*80, "images/hud/33")
        vnxDrawImage("rifle_fguns_icon_lockedb", "rifle Icon", sx*800, sy*220, sx*80, sy*80, "anzeigen/images/weapons/locked_background")
        vnxDrawImage("rifle_fguns_icon_locked", "rifle Icon", sx*800, sy*220, sx*80, sy*80, "anzeigen/images/weapons/locked")
        addEventHandler("onClientRender", getRootElement(), rifle_locked_fguns)
    end
    if therank >= 4 and ptime >= 1200 then 
        -- Sniper
        vnxDrawImage("sniper_fguns_icon", "Sniper Icon", sx*500, sy*370, sx*80, sy*80, "images/hud/34")
        vnxDrawButtonColored("sniper_fguns_btn", "Sniper Func", Moneycost[8].."$\n"..Matscost[8].." Mats", sx*500, sy*460, sx*80, sy*30, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "sniper_buy_fguns")
    else 
        vnxDrawImage("sniper_fguns_icon", "sniper Icon", sx*500, sy*370, sx*80, sy*80, "images/hud/34")
        vnxDrawImage("sniper_fguns_icon_lockedb", "sniper Icon", sx*500, sy*370, sx*80, sy*80, "anzeigen/images/weapons/locked_background")
        vnxDrawImage("sniper_fguns_icon_locked", "sniper Icon", sx*500, sy*370, sx*80, sy*80, "anzeigen/images/weapons/locked")
        addEventHandler("onClientRender", getRootElement(), sniper_locked_fguns)
    end
    if therank >= 5 and ptime >= 3000 then 
        -- RocketLauncher
        vnxDrawImage("rocketlauncher_fguns_icon", "Rocketlauncher Icon", sx*650, sy*370, sx*80, sy*80, "images/hud/35")
        vnxDrawButtonColored("rocketlauncher_fguns_btn", "Rocketlauncher Func", Moneycost[9].."$\n"..Matscost[9].." Mats", sx*650, sy*460, sx*80, sy*30, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "rocket_buy_fguns")
    else
        vnxDrawImage("rocketlauncher_fguns_icon", "rocketlauncher Icon", sx*650, sy*370, sx*80, sy*80, "images/hud/35")
        vnxDrawImage("rocketlauncher_fguns_icon_lockedb", "rocketlauncher Icon", sx*650, sy*370, sx*80, sy*80, "anzeigen/images/weapons/locked_background")
        vnxDrawImage("rocketlauncher_fguns_icon_locked", "rocketlauncher Icon", sx*650, sy*370, sx*80, sy*80, "anzeigen/images/weapons/locked")
        addEventHandler("onClientRender", getRootElement(), rocketlauncher_locked_fguns)
    end
end
end 
addEvent ( "startFgunsGui", true )
addEventHandler( "startFgunsGui", getRootElement(), createFgunsGui_newVnX )