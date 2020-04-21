
local screenX, screenY = guiGetScreenSize()
local sx, sy = screenX/1366, screenY/768

local isSound = false
local carradios = {}
local subTrackOnSoundDown = 0.1
local subTrackOnSoundUp = 0.1
local bone = exports.bone_attach
local vnxGetSet = exports.VenoX
local window_already_open = false 
function closevippanel()
    showCursor(false)
    window_already_open = false
    vnxDestroyWindow("vipp_draw_main")
    vnxDestroyWindow("ghettoblaster_link_vip_edit")
    removeEventHandler("onClientRender", getRootElement(), drawrenderstuffvip)
    vnxDestroyWindow("lauter_taste_ghettoblaster")
    vnxDestroyWindow("leiser_taste_ghettoblaster")
    vnxDestroyWindow("abspiel_taste_ghettoblaster")
    vnxDestroyWindow("volltanken_button_vip")

    vnxDestroyWindow("atm_edit_vipwindow")
    vnxDestroyWindow("atm_edit_vipwindow_einzahlen")
    vnxDestroyWindow("atm_edit_vipwindow_auszahlen")
    vnxDestroyWindow("vip_button_deagle")
    vnxDestroyWindow("vip_button_shotgun")
    vnxDestroyWindow("vip_button_uzi")
    vnxDestroyWindow("vip_button_ak")

end
--[[-------------------------------------------------
Notes:

> This code is using a custom font. This will only work as long as the location it is from always exists, and the resource it is part of is running.
    To ensure it does not break, it is highly encouraged to move custom fonts into your local resource and reference them there.
--]]-------------------------------------------------



local dxfont0_arial = dxCreateFont("fonts/arial.ttf", 10)
        -- WAFFEN FÜR AUSWHAL dxDrawImage(483, 454, 108, 93, ":VenoX/images/hud/24.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        -- WAFFEN FÜR AUSWHAL dxDrawImage(601, 454, 108, 93, ":VenoX/images/hud/24.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        -- WAFFEN FÜR AUSWHALdxDrawImage(719, 454, 108, 93, ":VenoX/images/hud/24.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        -- WAFFEN FÜR AUSWHALdxDrawImage(837, 454, 108, 93, ":VenoX/images/hud/24.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        --ATM EDIT dxDrawRectangle(581, 305, 263, 20, tocolor(0, 0, 0, 255), false)
       --Auszahl button  dxDrawRectangle(854, 305, 47, 19, tocolor(0, 180, 0, 255), false)
        --Einzahl Button TastedxDrawRectangle(911, 305, 47, 19, tocolor(180, 0, 0, 255), false)


function drawrenderstuffvip()
    
    dxDrawText(" Fahrzeug Tanken zum Günstigen Preis : ", sx*427, sy*160, sx*694, sy*190, tocolor(255, 255, 255, 255), 1.00, dxfont0_arial, "left", "center", false, false, false, false, false)
    dxDrawText(" \n Ghettoblaster nutzen : \n (Youtube nicht Möglich ! )   ", sx*427, sy*246, sx*694, sy*276, tocolor(255, 255, 255, 255), 1.00, dxfont0_arial, "left", "center", false, false, false, false, false)
    dxDrawText("Verfügbar ab VIP Level Platin : Mobiler Ammunation ", sx*427, sy*398, sx*694, sy*428, tocolor(255, 255, 255, 255), 1.00, dxfont0_arial, "left", "center", false, false, false, false, false)
    dxDrawRectangle(sx*427, sy*428, sx*546, sy*5, tocolor(0, 148, 170, 120), false)
    dxDrawRectangle(sx*427, sy*227, sx*546, sy*5, tocolor(0, 148, 170, 120), false)
    dxDrawRectangle(sx*427, sy*296, sx*546, sy*5, tocolor(0, 148, 170, 120), false)
    dxDrawRectangle(sx*427, sy*388, sx*546, sy*5, tocolor(0, 148, 170, 120), false)
    dxDrawText(" Mobiler Bankautomat : ", sx*427, sy*301, sx*694, sy*331, tocolor(255, 255, 255, 255), 1.00, dxfont0_arial, "left", "center", false, false, false, false, false)
    dxDrawText(" Mobiler ATM Verfügbar ab VIP Level Gold.", sx*427, sy*341, sx*694, sy*371, tocolor(255, 255, 255, 255), 1.00, dxfont0_arial, "left", "center", false, false, false, false, false)
    dxDrawImage(sx*444, sy*440, sx*110, sy*88, ":VenoX/images/hud/24.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(sx*574, sy*440, sx*110, sy*88, ":VenoX/images/hud/25.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(sx*704, sy*440, sx*110, sy*88, ":VenoX/images/hud/29.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(sx*834, sy*440, sx*110, sy*88, ":VenoX/images/hud/30.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

end 

--103,20

-- 

function abspielen_gb()
    isSound = true
    local theurl = vnxGetEditText("ghettoblaster_link_vip_edit", "edit")
    triggerServerEvent ( "onPlayerPlaceSpeakerBox", localPlayer, theurl, isPedInVehicle ( localPlayer ) )
    closevippanel()
    vippanel()
end 
function tanken_vip()
	triggerServerEvent ( "fillComplete1", getLocalPlayer(), getLocalPlayer() )
end 
function lauter_gb_vip()
        if ( isSound ) then
            local toVol = math.round ( getSoundVolume ( speakerSound [ localPlayer ] ) + subTrackOnSoundUp, 2 )
            if ( toVol <= 1.0 ) then
                outputChatBox ( "Volumen gesetzt auf "..math.floor ( toVol * 100 ).."%!", 0, 255, 0 )
                triggerServerEvent ( "onPlayerChangeSpeakerBoxVolume", localPlayer, toVol ) 
            else
                outputChatBox ( "Das Volumen kann nicht höher gemacht werden.", 255, 0, 0 )
            end
        end
end
function leiser_gb_vip()
        if ( isSound ) then
            local toVol = math.round ( getSoundVolume ( speakerSound [ localPlayer ] ) - subTrackOnSoundDown, 2 )
            if ( toVol > 0.0 ) then
                outputChatBox ( "Volumen gesetzt auf "..math.floor ( toVol * 100 ).."%!", 0, 255, 0 )
                triggerServerEvent ( "onPlayerChangeSpeakerBoxVolume", localPlayer, toVol )
            else
                outputChatBox ( "Das Volumen kann nicht leiser gemacht werden.", 255, 0, 0 )
            end
        end
end

function destroygbvip()
    isSound = false
    triggerServerEvent ( "onPlayerDestroySpeakerBox", localPlayer )
    closevippanel()
    vippanel()
end 

function destroyexplodevip()
    isSound = false
    triggerServerEvent ( "onPlayerDestroySpeakerBox", localPlayer )
end 
function buy_deagle_vip()
    local paketvip = getElementData(getLocalPlayer(), "Paket")
    if paketvip >= 4 then
        local w0 = getPedWeapon ( getLocalPlayer(), 0 )
        local w1 = getPedWeapon ( getLocalPlayer(), 1 )
        local w2 = getPedWeapon ( getLocalPlayer(), 2 )
        local w3 = getPedWeapon ( getLocalPlayer(), 3 )
        local w4 = getPedWeapon ( getLocalPlayer(), 4 )
        local w5 = getPedWeapon ( getLocalPlayer(), 5 )
        local w6 = getPedWeapon ( getLocalPlayer(), 6 )
        local w7 = getPedWeapon ( getLocalPlayer(), 7 )
        if w5 == 30 then
            closevippanel()
            vippanel()
            triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "ammo", "eagleammo", w0, w1, w2, w3, w4, w5, w6, w7 )
        else 
            closevippanel()
            vippanel()
            triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "eagle", w0, w1, w2, w3, w4, w5, w6, w7 )
        end
    else 
        outputChatBox("#00C8FF[VIP-Window] : #FFFFFFDu hast nicht VIP #e5e4e2Platin.", 200,150,0, true)
    end
end 
function buy_shotgun_vip()
    local paketvip = getElementData(getLocalPlayer(), "Paket")
    if paketvip >= 4 then 
        local w0 = getPedWeapon ( getLocalPlayer(), 0 )
        local w1 = getPedWeapon ( getLocalPlayer(), 1 )
        local w2 = getPedWeapon ( getLocalPlayer(), 2 )
        local w3 = getPedWeapon ( getLocalPlayer(), 3 )
        local w4 = getPedWeapon ( getLocalPlayer(), 4 )
        local w5 = getPedWeapon ( getLocalPlayer(), 5 )
        local w6 = getPedWeapon ( getLocalPlayer(), 6 )
        local w7 = getPedWeapon ( getLocalPlayer(), 7 )
        triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "shotty", w0, w1, w2, w3, w4, w5, w6, w7 )
    else 
        outputChatBox("#00C8FF[VIP-Window] : #FFFFFFDu hast nicht VIP #e5e4e2Platin.", 200,150,0, true)
    end
end 
function buy_uzi_vip()
    local paketvip = getElementData(getLocalPlayer(), "Paket")
    if paketvip >= 4 then 
        local w0 = getPedWeapon ( getLocalPlayer(), 0 )
        local w1 = getPedWeapon ( getLocalPlayer(), 1 )
        local w2 = getPedWeapon ( getLocalPlayer(), 2 )
        local w3 = getPedWeapon ( getLocalPlayer(), 3 )
        local w4 = getPedWeapon ( getLocalPlayer(), 4 )
        local w5 = getPedWeapon ( getLocalPlayer(), 5 )
        local w6 = getPedWeapon ( getLocalPlayer(), 6 )
        local w7 = getPedWeapon ( getLocalPlayer(), 7 )
        if w4 == 29 then
            closevippanel()
            vippanel()
            triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "ammo", "mp5ammo", w0, w1, w2, w3, w4, w5, w6, w7 )
        else 
            closevippanel()
            vippanel()
            triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "mp5", w0, w1, w2, w3, w4, w5, w6, w7 )
        end 
    else 
        outputChatBox("#00C8FF[VIP-Window] : #FFFFFFDu hast nicht VIP #e5e4e2Platin.", 200,150,0, true)
    end
end 
function buy_ak_vip()
    local paketvip = getElementData(getLocalPlayer(), "Paket")
    if paketvip >= 4 then 
        local w0 = getPedWeapon ( getLocalPlayer(), 0 )
        local w1 = getPedWeapon ( getLocalPlayer(), 1 )
        local w2 = getPedWeapon ( getLocalPlayer(), 2 )
        local w3 = getPedWeapon ( getLocalPlayer(), 3 )
        local w4 = getPedWeapon ( getLocalPlayer(), 4 )
        local w5 = getPedWeapon ( getLocalPlayer(), 5 )
        local w6 = getPedWeapon ( getLocalPlayer(), 6 )
        local w7 = getPedWeapon ( getLocalPlayer(), 7 )
        if w5 == 30 then
            closevippanel()
            vippanel()
            triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "ammo", "m4ammo", w0, w1, w2, w3, w4, w5, w6, w7 )
        else
            closevippanel()
            vippanel()
            triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "ak47", w0, w1, w2, w3, w4, w5, w6, w7 )
        end
    else 
        outputChatBox("#00C8FF[VIP-Window] : #FFFFFFDu hast nicht VIP #e5e4e2Platin.", 200,150,0, true)
    end

end 


function vippanel()
    local paketvip = getElementData(getLocalPlayer(), "Paket")
    if paketvip >= 1 then 
        local w0 = getPedWeapon ( getLocalPlayer(), 0 )
        local w1 = getPedWeapon ( getLocalPlayer(), 1 )
        local w2 = getPedWeapon ( getLocalPlayer(), 2 )
        local w3 = getPedWeapon ( getLocalPlayer(), 3 )
        local w4 = getPedWeapon ( getLocalPlayer(), 4 )
        local w5 = getPedWeapon ( getLocalPlayer(), 5 )
        local w6 = getPedWeapon ( getLocalPlayer(), 6 )
        local w7 = getPedWeapon ( getLocalPlayer(), 7 )
        if window_already_open == false then
            window_already_open = true 
            addEventHandler("onClientRender", getRootElement(), drawrenderstuffvip)
            showCursor(true)
            vnxDrawWindow("vipp_draw_main", "VIP Panel Window", "Premium Panel", sx*427, sy*123, sx*546, sy*449, "closevippanel")
            vnxDrawButtonColored("volltanken_button_vip", "send button", "Volltanken [300 $]", sx*704, sy*156, sx*263, sy*61, tocolor(0,105,145,255), tocolor(7,158,207,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0),"tanken_vip")
            vnxDrawEdit("ghettoblaster_link_vip_edit", "edit", "", sx*581, sy*251, sx*263, true,  true)
            if (isSound) then 
                vnxDrawButtonColored("abspiel_taste_ghettoblaster", "send button", "Stoppen", sx*854, sy*251, sx*103, sy*19, tocolor(39,39,39,255), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,150,200,255), tocolor(0,150,200,255),"destroygbvip")
            else
                vnxDrawButtonColored("abspiel_taste_ghettoblaster", "send button", "Abspielen", sx*854, sy*251, sx*103, sy*19, tocolor(39,39,39,255), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,150,200,255), tocolor(0,150,200,255),"abspielen_gb")
            end
            vnxDrawButtonColored("lauter_taste_ghettoblaster", "send button", "+", sx*854, sy*276, sx*47, sy*19, tocolor(39,39,39,255), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(125,0,0,255), tocolor(175,0,0,255),"lauter_gb_vip")
            vnxDrawButtonColored("leiser_taste_ghettoblaster", "send button_2", "-", sx*911, sy*276, sx*47, sy*19, tocolor(39,39,39,255), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,125,0,255), tocolor(0,175,0,255),"leiser_gb_vip")
        ---------------------------------------------------------------------------------------------------------------------
            vnxDrawEdit("atm_edit_vipwindow", "edit", "", sx*586, sy*309, sx*196, true,  true)
            vnxDrawButtonColored("atm_edit_vipwindow_einzahlen", "send button_1", "+", sx*792, sy*309, sx*71, sy*19, tocolor(39,39,39,255), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,125,0,255), tocolor(0,175,0,255),"atm_einzahlen_vipwindow")
            vnxDrawButtonColored("atm_edit_vipwindow_auszahlen", "send button_2", "-", sx*873, sy*309, sx*71, sy*19, tocolor(39,39,39,255), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(125,0,0,255), tocolor(175,0,0,255),"atm_auszahlen_vipwindow")
        ---------------------------------------------------------------------------------------------------------------------
            if w2 == 24 then
                vnxDrawButtonColored("vip_button_deagle", "Deagle_Buy_Button", "Deagle Magazin \n [ 150 $ ]", sx*447, sy*530, sx*100, sy*30, tocolor(39,39,39,255), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255),"buy_deagle_vip")
            else 
                vnxDrawButtonColored("vip_button_deagle", "Deagle_Buy_Button", "Deagle Kaufen \n [ 640 $ ]", sx*447, sy*530, sx*100, sy*30, tocolor(39,39,39,255), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255),"buy_deagle_vip")
            end
            if w3 == 25 then
                vnxDrawButtonColored("vip_button_shotgun", "Shotgun_Buy_Button", "Shotgun Kaufen \n [ 400 $ ]", sx*577, sy*530, sx*100, sy*30, tocolor(39,39,39,255), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,200,255,255),"buy_shotgun_vip")
            else 
                vnxDrawButtonColored("vip_button_shotgun", "Shotgun_Buy_Button", "Shotgun Kaufen \n [ 400 $ ]", sx*577, sy*530, sx*100, sy*30, tocolor(39,39,39,255), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,200,255,255),"buy_shotgun_vip")
            end 
            if w4 == 29 then
                vnxDrawButtonColored("vip_button_uzi", "Uzi_Buy_Button", "Mp5 Magazin \n [ 140 $ ]", sx*707, sy*530, sx*100, sy*30, tocolor(39,39,39,255), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,255,255),"buy_uzi_vip")
            else 
                vnxDrawButtonColored("vip_button_uzi", "Uzi_Buy_Button", "Mp5 Kaufen \n [ 540 $ ]", sx*707, sy*530, sx*100, sy*30, tocolor(39,39,39,255), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,255,255),"buy_uzi_vip")
            end
            if w5 == 30 then 
                vnxDrawButtonColored("vip_button_ak", "Ak_Buy_Button", "Ak-47 Magazin \n [ 340 $ ]", sx*837, sy*530, sx*100, sy*30, tocolor(39,39,39,255), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,255,255),"buy_ak_vip")
            else
                vnxDrawButtonColored("vip_button_ak", "Ak_Buy_Button", "Ak-47 Kaufen \n [ 740 $ ]", sx*837, sy*530, sx*100, sy*30, tocolor(39,39,39,255), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,255,255),"buy_ak_vip")
            end
        end
    else 
        outputChatBox("#00C8FF[VIP-Window] : #FFFFFFDu hast kein #00C8FFVIP!", 150,0,0,true) 
    end 
end 
addCommandHandler("vip", vippanel)

---------------------------------------------------------------------------------------------------------------------

function atm_einzahlen_vipwindow()
    local paketvip = getElementData(getLocalPlayer(), "Paket")
    if paketvip >= 3 then 
        local amount = tonumber (vnxGetEditText("atm_edit_vipwindow", "edit"))
        triggerServerEvent ( "cashPointPayIn", getLocalPlayer(), amount )
    else 
        outputChatBox("#00C8FF[VIP-Window] : #FFFFFFDu hast nicht VIP #DAA520Gold.", 200,150,0, true)
    end
end 

function atm_auszahlen_vipwindow()
    local paketvip = getElementData(getLocalPlayer(), "Paket")
    if paketvip >= 3 then 
        local amount = tonumber (vnxGetEditText("atm_edit_vipwindow", "edit"))
        triggerServerEvent ( "cashPointPayOut", getLocalPlayer(), amount )
    else 
        outputChatBox("#00C8FF[VIP-Window] : #FFFFFFDu hast nicht VIP #DAA520Gold.", 200,150,0, true)
    end
end


---------------------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------------------------------


speakerSound = { }
addEvent ( "onPlayerStartSpeakerBoxSound", true )
addEventHandler ( "onPlayerStartSpeakerBoxSound", root, function ( url, isCar )
	local who = source
	if ( isElement ( speakerSound [ who ] ) ) then destroyElement ( speakerSound [ who ] ) end
	local x, y, z = getElementPosition ( who )
	speakerSound [ who ] = playSound3D ( url, x, y, z, true )
	setSoundVolume ( speakerSound [ who ], 1 )
	setSoundMinDistance ( speakerSound [ who ], 13 )
	setSoundMaxDistance ( speakerSound [ who ], 48 )
	local int = getElementInterior ( who )
	setElementInterior ( speakerSound [ who ], int ) 
	setElementDimension ( speakerSound [ who ], getElementDimension ( who ) )
	if ( isCar ) then
		local car = getPedOccupiedVehicle ( who )
		attachElements ( speakerSound [ who ], car, 0, 0, 1 )
		addEventHandler ( "onClientVehicleRespawn", car, deleteTheVIPRadio )
		addEventHandler ( "onClientVehicleExplode", car, deleteTheVIPRadio )
		carradios[car] = who
	else
		bone:attachElementToBone ( speakerSound [ who ], who, 12, 0, 0, 0.42, 180, 0, 180 )
	end
end )

function deleteTheVIPRadio ( ) 
	if isElement ( speakerSound [ source ] ) then 
        destroyElement ( speakerSound [ source ] ) 
	elseif isElement (source) and getElementType ( source ) == "vehicle" then
		destroyElement ( speakerSound [ carradios[source] ] ) 
		speakerSound [ carradios[source] ] = nil
        carradios[source] = nil
        destroyexplodevip()
		removeEventHandler ( "onClientVehicleRespawn", source, deleteTheVIPRadio )
		removeEventHandler ( "onClientVehicleExplode", source, deleteTheVIPRadio )
	end
end 
addEvent ( "onPlayerDestroySpeakerBox", true )
addEventHandler ( "onPlayerDestroySpeakerBox", root, deleteTheVIPRadio )

function attackerSpeakerOnPlayer ( thebox ) 
	bone:attachElementToBone ( thebox, source, 12, 0, 0, 0.42, 180, 0, 180 )
end
addEvent ( "attachSpeakerBoxOnPlayer", true )
addEventHandler ( "attachSpeakerBoxOnPlayer", root, attackerSpeakerOnPlayer )

--------------------------
-- Volume				--
--------------------------
addEvent ( "onPlayerChangeSpeakerBoxVolumeC", true )
addEventHandler ( "onPlayerChangeSpeakerBoxVolumeC", root, function ( vol ) 
	if ( isElement ( speakerSound [ source ] ) ) then
		setSoundVolume ( speakerSound [ source ], tonumber ( vol ) )
	end
end )


function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end