local closedbuttonclicked = false 
local closedButtonHoverfix = false 

function moveableclose()
    closedbuttonclicked = true 
    vnxDestroyWindow("moveable_dx_window")
    outputChatBox("Window wurde geschlossen :D ", 0,200,255)
    showCursor(false)
end 



function dxmovablewindow()

    showCursor(true)

    local screenCX, screenCY = guiGetScreenSize()
    local sx, sy = screenCX/1366, screenCY/768


    local function isCursorOverRectangle(x,y,w,h)
		if isCursorShowing() then
			local mx,my = getCursorPosition() -- relative
			cursorx,cursory = mx*screenCX,my*screenCY
			if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
				closedButtonHoverfix = false 
			end
		end
	    return false
	end

    local sClicked = false

    local x, y, w, h = 100, 100, 200, 300
    local offx, offy
    local offw, offh



    local function process()
        local mx,my = getCursorPosition() -- relative
        cursorx,cursory = mx*screenCX,my*screenCY

        if sClicked == "mouse1" then
            x, y = cursorx-offx, cursory-offy
        elseif sClicked == "mouse2" then
            local dist = math.max((cursorx-x)*offh/offw, cursory-y)
            w, h = math.max(10/offh*offw, dist/offh*offw+1), math.max(10, dist+1)
            --w = w*h/offh
            --h = h2
        end
    end


    addEventHandler("onClientHUDRender", getRootElement(), function()
        if closedbuttonclicked == false then 
            if sClicked == "mouse1" then
                vnxDrawWindow("moveable_dx_window", "Stats_Window", "Venox Moveable Window dev.5.1.", sx*x, sy*y, sx*w, sy*h, "moveableclose")
            --elseif sClicked == "mouse2" then
                --vnxDrawWindow("moveable_dx_window", "Stats_Window", "Venox Moveable Window dev.5.1.", sx*x, sy*y, sx*w, sy*h, "nil")
            else
                vnxDrawWindow("moveable_dx_window", "Stats_Window", "Venox Moveable Window dev.5.1.", sx*x, sy*y, sx*w, sy*h, "moveableclose")
            end
            if isCursorOverRectangle(x, y, w, h) then
                local mx,my = getCursorPosition() -- relative
                cursorx,cursory = mx*screenCX,my*screenCY

                if getKeyState("mouse1") then
                    if not sClicked then
                        sClicked = "mouse1"
                        offx, offy = cursorx-x, cursory-y
                        addEventHandler("onClientCursorMove", getRootElement(), process)
                    end
                elseif getKeyState("mouse2") then
                    if not sClicked then
                        sClicked = "mouse2"
                        offx, offy = cursorx-x, cursory-y
                        offw, offh = w,h
                        addEventHandler("onClientCursorMove", getRootElement(), process)
                    end
                else
                    if sClicked then
                        sClicked = false
                        removeEventHandler("onClientCursorMove", getRootElement(), process)
                        local mx,my = getCursorPosition() -- relative
                        cursorx,cursory = mx*screenCX,my*screenCY
                    end
                end
            end
        end 
    end)
end



local function triggerwindowformovable()
    dxmovablewindow()
    closedbuttonclicked = false 
    showCursor(true)
end
--addCommandHandler("dev34", triggerwindowformovable)
-------------------------------------------------------------------------------------------------------------------------------------------

local screenCX, screenCY = guiGetScreenSize()
local sx, sy = screenCX/1366, screenCY/768
-------------------------------------------------------------------------------------------------------------------------------------------


local dxfont0_PetitFormalScript = dxCreateFont(":gui/fonts/PetitFormalScript.ttf", 15)
local dxfont1_PetitFormalScript = dxCreateFont(":gui/fonts/PetitFormalScript.ttf", 10)
local dxfont2_PetitFormalScript = dxCreateFont(":gui/fonts/PetitFormalScript.ttf", 12)
local pizzajoblefttimer = nil 
-------------------------------------------------------------------------------------------------------------------------------------------

local function render_pizzajob()
    dxDrawRectangle(sx*495, sy*101, sx*366, sy*3, tocolor(0, 150, 200, 220), false)
    dxDrawImage(sx*505, sy*150, sx*64, sy*64, ":VenoX/jobs/pizza/assets/pizzaboy.png", 0, 0, 0, tocolor(255, 255, 255, 220), false)
    dxDrawText("Venox Pizza Job", sx*495, sy*104, sx*861, sy*133, tocolor(255, 255, 255, 255), 1.00, dxfont0_PetitFormalScript, "center", "center", false, false, false, false, false)
    dxDrawText("Pizza-Boy", sx*579, sy*150, sx*861, sy*169, tocolor(255, 255, 255, 255), 1.00, dxfont0_PetitFormalScript, "center", "center", false, false, false, false, false)
    dxDrawText("Lade einen Pizza - Roller mit \n25 Pizzen und bekomme \n100 $ pro Marker.", sx*579, sy*180, sx*861, sy*215, tocolor(255, 255, 255, 255), 1.00, dxfont1_PetitFormalScript, "center", "center", false, false, false, false, false)
    dxDrawRectangle(sx*501, sy*256, sx*350, sy*3, tocolor(0, 150, 200, 220), false)
    dxDrawImage(sx*505, sy*269, sx*64, sy*64, ":VenoX/jobs/pizza/assets/sultan.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawText("Pizza-Van", sx*579, sy*269, sx*861, sy*288, tocolor(255, 255, 255, 255), 1.00, dxfont0_PetitFormalScript, "center", "center", false, false, false, false, false)
    dxDrawText("Lade einen Van mit \n75 Pizzen und bekomme \n275 $ pro Marker.",sx* 579, sy*300, sx*861,sy*335, tocolor(255, 255, 255, 255), 1.00, dxfont1_PetitFormalScript, "center", "center", false, false, false, false, false)
    dxDrawRectangle(sx*501, sy*378, sx*350, sy*3, tocolor(0, 150, 200, 220), false)
    dxDrawText("Lade einen Truck mit \n4000 Pizzen und bekomme \n1650 $ pro Marker.", sx*579, sy*420, sx*861, sy*455, tocolor(255, 255, 255, 255), 1.00, dxfont1_PetitFormalScript, "center", "center", false, false, false, false, false)
    dxDrawText("Pizza-Truck", sx*579, sy*391, sx*861, sy*410, tocolor(255, 255, 255, 255), 1.00, dxfont0_PetitFormalScript, "center", "center", false, false, false, false, false)
    dxDrawImage(sx*505, sy*391, sx*64, sy*64, ":VenoX/jobs/pizza/assets/rumpo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawRectangle(sx*501, sy*497, sx*350, sy*3, tocolor(0, 150, 200, 220), false)
    dxDrawText("Pizza Job Level : 53", sx*501, sy*500, sx*851, sy*530, tocolor(255, 255, 255, 255), 1.00, dxfont2_PetitFormalScript, "center", "center", false, false, false, false, false)
    dxDrawRectangle(sx*559, sy*530, sx*238, sy*3, tocolor(0, 150, 200, 220), false)
    dxDrawText("Dev : 4.3.4 - By Solid_Snake , LargePeach & VnX RL Crew\nwww.venox-reallife.com", sx*501, sy*540, sx*851, sy*570, tocolor(255, 255, 255, 255), 0.70, "default", "center", "center", false, false, false, false, false)
    dxDrawImage(sx*829, sy*104, sx*32, sy*32, ":VenoX/images/dx/close.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
end 

function close_job_pizza()
    vnxDestroyWindow("close_window_pizzajob_vnx")
    vnxDestroyWindow("faggio_pizza_job_vnx")
    vnxDestroyWindow("rumpo_pizza_job_vnx")
    vnxDestroyWindow("truck_pizza_job_vnx")
    vnxDestroyWindow("pizza_rec_grey")
    vnxDestroyWindow("pizza_rec_black")
    removeEventHandler("onClientRender", getRootElement(), render_pizzajob)
    showCursor(false)
end 

function pizzaJobVehicleExit()
    pizzajoblefttimer = setTimer (
		function ( player )
            outputChatBox("Job Fehlgeschlagen.", 125,0,0)
            removeEventHandler("onClientRender", getRootElement(), render_pizzeninvehicle_vnx)
		end,
	10000, 1, player )
end
addEvent("PizzajobAusFahrzeug", true)
addEventHandler("PizzajobAusFahrzeug", getRootElement(), pizzaJobVehicleExit)

function pizzaJobVehicleEnter()
    killTimer(pizzajoblefttimer)
end
addEvent("PizzajobInsFahrzeug", true)
addEventHandler("PizzajobInsFahrzeug", getRootElement(), pizzaJobVehicleEnter)

function render_pizzeninvehicle_vnx()
    if getPedOccupiedVehicle(getLocalPlayer()) == false then  
        if pizzajoblefttimer == false or pizzajoblefttimer == nil then 
        else 
            local remaining, executesRemaining, totalExecutes = getTimerDetails(pizzajoblefttimer)
            dxDrawLine(sx*478 - 1, sy*10 - 1, sx*478 - 1, sy*46, tocolor(11, 200, 254, 200), 1, false)
            dxDrawLine(sx*889, sy*10 - 1, sx*478 - 1, sy*10 - 1, tocolor(11, 200, 254, 200), 1, false)
            dxDrawLine(sx*478 - 1, sy*46, sx*889, sy*46, tocolor(11, 200, 254, 200), 1, false)
            dxDrawLine(sx*889, sy*46, sx*889, sy*10 - 1, tocolor(11, 200, 254, 200), 1, false)
            dxDrawRectangle(sx*478, sy*10, sx*411, sy*36, tocolor(0, 0, 0, 200), false)
            dxDrawRectangle(sx*479, sy*11, sx*0, sy*34, tocolor(0, 154, 198, 200), false)
            dxDrawText("Steig wieder in ein Fahrzeug oder der job wird beendet.\n"..remaining, sx*479, sy*11, sx*888, sy*45, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        end
    else 
        local aktuellepizzenimfahrzeug = getElementData(getPedOccupiedVehicle(getLocalPlayer()), "pizzaimfahrzeug")
        if aktuellepizzenimfahrzeug == false then 
            if pizzajoblefttimer == false or pizzajoblefttimer == nil then 
            else 
            local remaining, executesRemaining, totalExecutes = getTimerDetails(pizzajoblefttimer)
            dxDrawLine(sx*478 - 1, sy*10 - 1, sx*478 - 1, sy*46, tocolor(11, 200, 254, 200), 1, false)
            dxDrawLine(sx*889, sy*10 - 1, sx*478 - 1, sy*10 - 1, tocolor(11, 200, 254, 200), 1, false)
            dxDrawLine(sx*478 - 1, sy*46, sx*889, sy*46, tocolor(11, 200, 254, 200), 1, false)
            dxDrawLine(sx*889, sy*46, sx*889, sy*10 - 1, tocolor(11, 200, 254, 200), 1, false)
            dxDrawRectangle(sx*478, sy*10, sx*411, sy*36, tocolor(0, 0, 0, 200), false)
            dxDrawRectangle(sx*479, sy*11, sx*0, sy*34, tocolor(0, 154, 198, 200), false)
            dxDrawText("Das ist Kein Job - Fahrzeug!\n"..remaining, sx*479, sy*11, sx*888, sy*45, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
            end
        else
            dxDrawLine(sx*478 - 1, sy*10 - 1, sx*478 - 1, sy*46, tocolor(11, 200, 254, 200), 1, false)
            dxDrawLine(sx*889, sy*10 - 1, sx*478 - 1, sy*10 - 1, tocolor(11, 200, 254, 200), 1, false)
            dxDrawLine(sx*478 - 1, sy*46, sx*889, sy*46, tocolor(11, 200, 254, 200), 1, false)
            dxDrawLine(sx*889, sy*46, sx*889, sy*10 - 1, tocolor(11, 200, 254, 200), 1, false)
            dxDrawRectangle(sx*478, sy*10, sx*411, sy*36, tocolor(0, 0, 0, 200), false)
            dxDrawRectangle(sx*479, sy*11, sx*409*(aktuellepizzenimfahrzeug/50), sy*34, tocolor(0, 154, 198, 200), false)
            dxDrawText("Du hast noch "..aktuellepizzenimfahrzeug.."/50 Pizzen", sx*479, sy*11, sx*888, sy*45, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
        end
    end
end 


function markerabgegebenfaggio()
    local fahrzeuginfo = getPedOccupiedVehicle(getLocalPlayer())
    local id = getVehicleID(fahrzeuginfo)
    if getPedOccupiedVehicle(getLocalPlayer()) == true and id == 448 then 
        triggerServerEvent("givepizzamoney_faggio", getLocalPlayer(), getLocalPlayer(), "pizzaboymoneygot")
    else 
        outputChatBox("Du hurensohn bist nicht im Fahrzeug du pisser !! ")
    end 
end 

function Job_start_pizza_faggio()
    outputChatBox("Du hast keine Pizzen!", 125, 0, 0)
    outputChatBox("Hol Pizzen aus dem Lager. Der Standort der Garage wird dir als Rote Flagge auf dem Radar angezeigt.", 0, 125, 0)
    close_job_pizza()
    triggerServerEvent("job_start_pizzaboy_vnx", getLocalPlayer(), getLocalPlayer(), "pizzaboy")
    setTimer (
        function ( player )
        addEventHandler("onClientRender", getRootElement(), render_pizzeninvehicle_vnx)
        end,
    500, 1, player )
    --addEventHandler ( "onPlayerWasted", player, pizzaJobPlayerWasted )
    --addEventHandler ( "onPlayerQuit", player, pizzaJobPlayerQuit )
    --addEventHandler ( "onVehicleExplode", veh, pizzaJobVehicleDown )
end 
function Job_start_pizza_rumpo()
    outputChatBox("Du hast den Rumpo Schwuchtel Job gestartet :D")
end 
function Job_start_pizza_truck()
    outputChatBox("Du hast den Truck Schwuchtel Job gestartet :D")
end 

local function showcheckboxforwindow()
    local screenCX, screenCY = guiGetScreenSize()
    local sx, sy = screenCX/1366, screenCY/768
    showCursor(true)
    vnxDrawRectangle("pizza_rec_grey","grauerb", sx*495, sy*104, sx*366, sy*470, tocolor(40, 40, 40, 220))
    vnxDrawRectangle("pizza_rec_black","blackb", sx*495, sy*104, sx*366, sy*29, tocolor(10, 10, 10, 220))
    vnxDrawImage("close_window_pizzajob_vnx", "Der Close Button für den Pizza job", sx*829, sy*104, sx*32, sy*32, ":VenoX/images/dx/close", "close_job_pizza")
    vnxDrawButtonColored("faggio_pizza_job_vnx", "Faggio Button", "Job Starten", sx*579, sy*224, sx*272, sy*22, tocolor(0,150,200,220), tocolor(0,200,255,220), tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(255,255,255,0),tocolor(255,255,255,0), "Job_start_pizza_faggio")
    vnxDrawButtonColored("rumpo_pizza_job_vnx", "Faggio Button", "Job Starten", sx*579, sy*346, sx*272, sy*22, tocolor(0,150,200,220), tocolor(0,200,255,220), tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(255,255,255,0),tocolor(255,255,255,0), "Job_start_pizza_rumpo")
    vnxDrawButtonColored("truck_pizza_job_vnx", "Faggio Button", "Job Starten", sx*579, sy*465, sx*272, sy*22, tocolor(0,150,200,220), tocolor(0,200,255,220), tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(255,255,255,0),tocolor(255,255,255,0), "Job_start_pizza_truck")
    addEventHandler("onClientRender", getRootElement(), render_pizzajob)
end 
addCommandHandler("pizzajob",showcheckboxforwindow)