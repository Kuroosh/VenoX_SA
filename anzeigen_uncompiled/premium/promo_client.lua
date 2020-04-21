
local screenX, screenY = guiGetScreenSize()
local sx, sy = screenX/1366, screenY/768


function closepromowindow()
    showCursor(false)
    vnxDestroyWindow("promo_draw_main")
    vnxDestroyWindow("promo_edit")
    vnxDestroyWindow("promo_send")
    window_already_open = false
end

function triggerPromoCode()
    local getPromocode = vnxGetEditText("promo_edit", "edit")
    outputDebugString(getPromocode)
    triggerServerEvent( "promotioncodevalid", getLocalPlayer(), getLocalPlayer(), getPromocode)
end

function promocode()
    if getElementData(getLocalPlayer(), "loggedin") == 1 then
        showCursor(true)
        if window_already_open == false then
            vnxDrawWindow("promo_draw_main", "Promo Code Window", "", sx*450, sy*250, sx*500, sy*135, "closepromowindow")
            vnxDrawEdit("promo_edit", "edit", "PROMOTIONCODE", sx*475, sy*300,  sx*450, true,true)
            vnxDrawButtonColored("promo_send", "send button", "Promotion Code Checken", sx*475, sy*330, sx*450, sy*35, tocolor(0,105,145,255), tocolor(7,158,207,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0),"triggerPromoCode")
            window_already_open = true
        end 
    end
end 
addCommandHandler("promocode", promocode)