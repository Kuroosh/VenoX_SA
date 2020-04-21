local screenX, screenY = guiGetScreenSize()
local sx, sy = screenX/1366, screenY/768

function prerenderRollerWindow()
    dxDrawText("Willkommen beim Rollerverleih von VenoX City!!\nHier kannst du dir einen Roller für 20 Minuten ausleihen.\nWenn du weniger als 15 Spielstunden hast,\nkostet dich der Roller nichts.\nAndernfalls musst du 75$ bezahlen.", sx*485, sy*201, sx*902, sy*411, tocolor(255, 255, 255, 255), 1.30, "default", "center", "center", false, false, false, false, false)
end 

function CloseRollerWindow()
vnxDestroyWindow("RollerWindow")
vnxDestroyWindow("rentarollerbutton")
vnxDestroyWindow("rentarollerbuttoncancel")
removeEventHandler("onClientRender", getRootElement(),prerenderRollerWindow )
window_already_open = false 
showCursor(false)
end

local theid = nil
function accept_roller_rent()
    showCursor( false )
    window_already_open = false 
    triggerServerEvent ( "onServerRentRoller", localPlayer, theid )
    CloseRollerWindow()
    outputChatBox ( "------------Venox City Info------------", 0, 200, 255 )
    outputChatBox ( "Du hast einen Faggio ausgeliehen!", 0, 200, 255 )
    outputChatBox ( "Mit der Taste ,, X ,, ( Gedrückt halten ) Startest du deinen Motor.", 0, 200, 255 )
    outputChatBox ( "Mit der Taste ,, L ,, Schaltest du dein Licht ein.", 0, 200, 255 )
    outputChatBox ( "Viel Spaß beim Fahren wünscht dir das Venox - Reallife Team :) ", 0, 200, 255 )
    outputChatBox ( "------------Venox City Info------------", 0, 200, 255 )
end 


function drawverleihwindow( id )

    if window_already_open == false then

        window_already_open = true 
        showCursor(true)
        theid = id
        vnxDrawWindow("RollerWindow", "window", "Venox City Rollerverleih", sx*485, sy*174, sx*417, sy*336, "CloseRollerWindow")
        vnxDrawButtonColored("rentarollerbutton", "Accept_v", "Roller Mieten [ 75 $ ]", sx*495, sy*421, sx*150, sy*51, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,150,0,255), tocolor(0,255,0,255), "accept_roller_rent")
        vnxDrawButtonColored("rentarollerbuttoncancel", "Accept_v", "Nein Danke.", sx*742, sy*421, sx*150, sy*51, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(150,0,0,255), tocolor(255,0,0,255), "CloseRollerWindow")
        addEventHandler("onClientRender", getRootElement(),prerenderRollerWindow )
    end
end 

addEvent("onClientRentRoller", true)
addEventHandler("onClientRentRoller", root, drawverleihwindow)