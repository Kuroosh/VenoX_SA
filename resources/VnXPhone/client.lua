
local currentphonestate = "home"
local screenX, screenY = guiGetScreenSize()
local sx, sy = screenX/1366, screenY/768
local streamlaeuft_vnxphone = true
local leiser_vnx_phone_music = 0.1 
local lauter_vnx_phone_music = 0.1
local status_vnx_pornhub = false 

function interfacewegnew()
    triggerEvent("hidehudclient", getLocalPlayer())
end 
addCommandHandler("hudwegdularry", interfacewegnew)
function turnhandy_off_dev()
    if getElementData(getLocalPlayer(), "handystate") == "off" then 
        vnxDestroyWindow("turnoff_loading_vnxphone")
        DrawVnXPhoneHome()
    else 
        DrawVnXPhone() 
        vnxDestroyWindow("home_button")
    end
    bindKey ( "o", "down", DrawVnXPhone)
    triggerServerEvent ( "handychange", getLocalPlayer(), getLocalPlayer() )
    vnxDrawButtonColored("home_button","Home Button","",sx*1205,sy*594,sx*30,sy*30,tocolor(175,0,0,0),tocolor(200,0,0,0),tocolor(255,255,255,0),tocolor(255,255,255,0),tocolor(175,0,0,0),tocolor(225,0,0,0),"DrawVnXPhoneHome") 
end
------------------------------------------------------------------------------------------------------------------------------------

function drawlefttoploadingcube()
    if(an_val5 < an_end5) then 
        an_val5 = an_val5 + 1 
        --outputDebugString(an_val5)
    --    dxDrawRectangle(an_val5, sy*400, sx*50, sy*50, tocolor(0,105,145,200))
        dxDrawRectangle(sx*an_val5, sy*400, sx*50, sy*50, tocolor(0,30,30,150))
    else
        dxDrawRectangle(sx*an_end5, sy*400, sx*50, sy*50, tocolor(0,80,80,150))
    end  
end
--------------------------------------------------------------------------

function drawrighttoploadingcube()
    if(rec_2_ < rec_2_end) then 
        rec_2_ = rec_2_ + 1 
        --outputDebugString(an_val5)
    --    dxDrawRectangle(an_val5, sy*400, sx*50, sy*50, tocolor(0,105,145,200))
        dxDrawRectangle(sx*1230, sy*rec_2_, sx*50, sy*50, tocolor(0,120,150,150))
    else
        dxDrawRectangle(sx*1230, sy*rec_2_end, sx*50, sy*50, tocolor(0,150,200,150))
    end  
end
--------------------------------------------------------------------------

--------------------------------------------------------------------------
function drawrightbottomloadingcube()
    if(rec_3_ > rec_3_end) then 
        rec_3_ = rec_3_ - 1 
        --outputDebugString(an_val5)
    --    dxDrawRectangle(an_val5, sy*400, sx*50, sy*50, tocolor(0,105,145,200))
        dxDrawRectangle(sx*rec_3_, sy*465, sx*50, sy*50, tocolor(0,105,145,150))
    else
        dxDrawRectangle(sx*rec_3_end, sy*465, sx*50, sy*50, tocolor(0,150,200,150))
    end  
end
------------------------------------------------------------------------------------------------------------------------------------

function drawleftbottomloadingcube()
    if(rec_4_ > rec_4_end) then 
        rec_4_ = rec_4_ - 1 
        --outputDebugString(an_val5)
    --    dxDrawRectangle(an_val5, sy*400, sx*50, sy*50, tocolor(0,105,145,200))
        dxDrawRectangle(sx*1165, sy*rec_4_, sx*50, sy*50, tocolor(0,150,200,150))
    else
        dxDrawRectangle(sx*1165, sy*rec_4_, sx*50, sy*50, tocolor(0,200,220,150))
    end  
end
------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------
function handyausschalten()
    -- HIER NUR HANDY AUSSCHALTBAR MACHEN
    --triggerServerEvent ( "handychange", getLocalPlayer(), getLocalPlayer() )
    
    setTimer ( function()
        showloading = true
        unbindKey ( "o", "down", DrawVnXPhone)
        if getElementData(getLocalPlayer(), "handystate") == "on" then
            ------------------------------------------------------------------------------------------------------------------------
            vnxDestroyWindow("vnx_phone_main_wallpaper")
            vnxDestroyWindow("vnx_phone_main_call")
            vnxDestroyWindow("vnx_phone_main_msg")
            vnxDestroyWindow("vnx_phone_main_ph")
            vnxDestroyWindow("vnx_phone_main_music")
            vnxDestroyWindow("select_phone_btn_2")
            vnxDestroyWindow("select_phone_btn_3")
            vnxDestroyWindow("select_phone_btn_4")
            vnxDestroyWindow("vnx_phone_main_close")
            vnxDrawText("turnoff_loading_vnxphone", "Info Loading Text", "Venox Phone wird Heruntergefahren", sx*1122, sy*505, sx*200, sy*50, tocolor(255,255,255,255), 1,"default-bold-small","center","center")
            removeEventHandler("onClientRender", getRootElement(), statusbars)
            vnxDrawImage("vnx_logo_dev", "JustAPhoneLogo", sx*1122, sy*235, sx*205, sy*200, "images/logo", "donothing")
            vnxLoadingstufe2()
            vnxDestroyWindow("home_button")
            vnxDestroyWindow("uhrzeut_loading_info")
            ------------------------------------------------------------------------------------------------------------------------
        elseif getElementData(getLocalPlayer(), "handystate") == "off" then 
            ------------------------------------------------------------------------------------------------------------------------
            vnxDestroyWindow("turnoff_loading_vnxphone")
            vnxDestroyWindow("vnx_logo_dev")
            vnxDestroyWindow("handy_loading")
            vnxDestroyWindow("turnphone_on_button")
            vnxDestroyWindow("vnx_logo_dev")
            vnxDestroyWindow("handy_loading_info")
            vnxDestroyWindow("vnx_phone_main_wallpaper")
            vnxDestroyWindow("vnx_phone_main_call")
            vnxDestroyWindow("vnx_phone_main_msg")
            vnxDestroyWindow("vnx_phone_main_ph")
            vnxDestroyWindow("vnx_phone_main_music")
            vnxDestroyWindow("select_phone_btn_2")
            vnxDestroyWindow("select_phone_btn_3")
            vnxDestroyWindow("select_phone_btn_4")
            vnxDrawText("turnoff_loading_vnxphone", "Info Loading Text", "Venox Phone wird gestartet.", sx*1122, sy*505, sx*200, sy*50, tocolor(255,255,255,255), 1,"default-bold-small","center","center")
            removeEventHandler("onClientRender", getRootElement(), statusbars)
            vnxDrawImage("vnx_logo_dev", "JustAPhoneLogo", sx*1122, sy*235, sx*205, sy*200, "images/logo", "donothing")
            vnxLoadingstufe2()
            vnxDestroyWindow("home_button")
            vnxDestroyWindow("uhrzeut_loading_info")
            ------------------------------------------------------------------------------------------------------------------------
        else 
            outputDebugString("ERROR : VnX Phone status konnte nicht gelesen werden bei : "..getLocalPlayer())
        end 
    end, 400, 1 )
    
    function vnxLoadingstufe2()
        local timer2 =   setTimer ( function()
            an_end5 = 1230 
            an_start5 = 1165
            an_val5 = an_start5 
            if showloading == true then
                --vnxDestroyWindow("turnoff_loading_vnxphone")
                removeEventHandler("onClientRender", getRootElement(), drawleftbottomloadingcube)
                removeEventHandler("onClientRender", getRootElement(), drawlefttoploadingcube)
                addEventHandler("onClientRender", getRootElement(), drawlefttoploadingcube)
                --vnxDrawText("turnoff_loading_vnxphone", "Info Loading Text", "Venox Phone wird Heruntergefahren", InterfaceBreite, sy*300, sx*200, sy*50, tocolor(255,255,255,255), 1,"default-bold-small","center","center")
                vnxLoadingstufe3()
            end
        end, 1600, 1 )
    end
    function vnxLoadingstufe3()
        local timer3 = setTimer ( function()
            rec_2_end = 465 
            rec_2_start = 400
            rec_2_ = rec_2_start 
            if showloading == true then
                --vnxDestroyWindow("turnoff_loading_vnxphone")
                removeEventHandler("onClientRender", getRootElement(), drawlefttoploadingcube)
                addEventHandler("onClientRender", getRootElement(), drawrighttoploadingcube)
                --vnxDrawText("turnoff_loading_vnxphone", "Info Loading Text", "Venox Phone wird Heruntergefahren", InterfaceBreite, sy*300, sx*200, sy*50, tocolor(255,255,255,255), 1,"default-bold-small","center","center")
                vnxLoadingstufe4()
            end 
        end, 1600, 1 )
    end
    function vnxLoadingstufe4()
        local timer4 =   setTimer ( function()
            rec_3_end = 1165 
            rec_3_start = 1230
            rec_3_ = rec_3_start 
            if showloading == true then
                --vnxDestroyWindow("turnoff_loading_vnxphone")
                removeEventHandler("onClientRender", getRootElement(), drawlefttoploadingcube)
                removeEventHandler("onClientRender", getRootElement(), drawrighttoploadingcube)
                addEventHandler("onClientRender", getRootElement(), drawrightbottomloadingcube)
                --vnxDrawText("turnoff_loading_vnxphone", "Info Loading Text", "Venox Phone wird Heruntergefahren", InterfaceBreite, sy*300, sx*200, sy*50, tocolor(255,255,255,255), 1,"default-bold-small","center","center")
                vnxLoadingstufe5()
            end 
        end, 1600, 1 )
    end
    function vnxLoadingstufe5()
        local timer5 = setTimer ( function()
            rec_4_end = 400 
            rec_4_start = 465
            rec_4_ = rec_4_start 
         if showloading == true then
            --vnxDestroyWindow("turnoff_loading_vnxphone")
            removeEventHandler("onClientRender", getRootElement(), drawlefttoploadingcube)
            removeEventHandler("onClientRender", getRootElement(), drawrighttoploadingcube)
            removeEventHandler("onClientRender", getRootElement(), drawrightbottomloadingcube)
            addEventHandler("onClientRender", getRootElement(), drawleftbottomloadingcube)
            vnxLoadingstufe2()
         end
            --vnxDrawText("turnoff_loading_vnxphone", "Info Loading Text", "Venox Phone wird Heruntergefahren", InterfaceBreite, sy*300, sx*200, sy*50, tocolor(255,255,255,255), 1,"default-bold-small","center","center")
        end, 1600, 1 )
    end
    setTimer ( function()
            removeEventHandler("onClientRender", getRootElement(), drawlefttoploadingcube)
            removeEventHandler("onClientRender", getRootElement(), drawrighttoploadingcube)
            removeEventHandler("onClientRender", getRootElement(), drawrightbottomloadingcube)
            removeEventHandler("onClientRender", getRootElement(), drawleftbottomloadingcube)
            turnhandy_off_dev()
            showloading = false
            vnxDestroyWindow("turnoff_loading_vnxphone")
    end, 8000, 1 )
end 

------------------------------------------------------------------------------------------------------------------------------------
function destroyelementonphone()
    vnxDestroyWindow("vnx_phone_main")
    vnxDestroyWindow("turnoff_loading_vnxphone")
    vnxDestroyWindow("select_phone_btn_2")
    vnxDestroyWindow("select_phone_btn_3")
    vnxDestroyWindow("select_phone_btn_4")
    showCursor(false)
end 
function donothing() end
------------------------------------------------------------------------------------------------------------------------------------
function statusbars()
    dxDrawRectangle(sx*1126, sy*525, sx*186, sy*60, tocolor(0,0,0,160), false, false,false,false)
    dxDrawImage(sx*1124, sy*530, sx*45, sy*50, "images/call.png")
    dxDrawImage(sx*1174, sy*530, sx*45, sy*50, "images/message.png")
    dxDrawImage(sx*1222, sy*530, sx*45, sy*50, "images/music.png")
    dxDrawImage(sx*1268, sy*534, sx*43, sy*43, "images/pornhub.png")
end 

function clearstatusbarsandicons()
    vnxDestroyWindow("vnx_phone_main_wallpaper")
    vnxDestroyWindow("vnx_phone_main_call")
    vnxDestroyWindow("vnx_phone_main_msg")
    vnxDestroyWindow("vnx_phone_main_ph")
    vnxDestroyWindow("vnx_phone_main_music")
    vnxDestroyWindow("vnx_phone_main_close")
    vnxDestroyWindow("vnx_phone_main_ammu")
end 
------------------------------------------------------------------------------------------------------------------------------------
function DrawVnXPhoneHome()	
    local time = getRealTime()
	local hours = time.hour
	local minutes = time.minute
	local seconds = time.second
	-- Make sure to add a 0 to the front of single digits.
	if (hours < 10) then
		hours = "0"..hours
	end
	if (minutes < 10) then
		minutes = "0"..minutes
	end
	if (seconds < 10) then
		seconds = "0"..seconds
    end
    currentphonestate = "home"
    addEventHandler("onClientRender", getRootElement(), statusbars)
    vnxDestroyWindow("vnx_phone_main")
    vnxDestroyWindow("handy_loading")
    vnxDestroyWindow("turnphone_on_button")
    vnxDestroyWindow("vnx_logo_dev")
    vnxDestroyWindow("handy_loading_info")
    clearstatusbarsandicons()
    destroy_ammunation_vnxphone()
    vnxDestroyWindow("player_call_window")
    vnxDestroyWindow("phone_background_wallpaper")
    vnxDestroyWindow("select_phone_btn")
    vnxDestroyWindow("player_msg_window")
    vnxDestroyWindow("player_msg_edit")
    vnxDestroyWindow("select_phone_btn_2")
    vnxDestroyWindow("select_phone_btn_3")
    vnxDestroyWindow("select_phone_btn_4")
    if status_vnx_pornhub == true then 
        destroyElement (BrowserForPornhub)
        destroyElement(BrowserForPornhub_Background)
    end 
    status_vnx_pornhub = false 
    --vnxDrawRectangle("uhrzeit_background_rec", "Info Loading Text",sx*1126, sy*255, sx*186, sy*15, tocolor(0,0,0,180))
    vnxDrawText("uhrzeut_loading_info", "Info Loading Text", hours.." : "..minutes, sx*1122, sy*236, sx*200, sy*50, tocolor(255,255,255,255), 1,"default-bold-small","center","center")
    vnxDrawImage("vnx_phone_main", "JustAPhone", sx*1000, sy*200, sx*440, sy*440, "images/vnxphone")
    vnxDrawImage("vnx_phone_main_wallpaper", "JustAPhone", sx*1126, sy*255, sx*186, sy*330, "images/wallpaper1")

    vnxDrawImage("vnx_phone_main_call", "JustAPhone", sx*1124, sy*530, sx*45, sy*50, "images/call", "show_call_window_vnxphone")

    vnxDrawImage("vnx_phone_main_msg", "JustAPhone", sx*1174, sy*530, sx*45, sy*50, "images/message", "show_sms_window_vnxphone")
    vnxDrawImage("vnx_phone_main_music", "JustAPhone", sx*1222, sy*530, sx*45, sy*50, "images/music", "show_music_window_vnxphone")
    vnxDrawImage("vnx_phone_main_ph", "JustAPhone", sx*1268, sy*534, sx*43, sy*43, "images/pornhub", "show_pornhub_window_vnxphone")
    vnxDrawImage("vnx_phone_main_close", "JustAPhone", sx*1130, sy*265, sx*45, sy*50, "images/off", "handyausschalten")
    vnxDrawImage("vnx_phone_main_ammu", "Ammunation_Btn", sx*1190, sy*265, sx*45, sy*50, "images/ammunation", "show_ammunation_window_vnxphone")
end 
------------------------------------------------------------------------------------------------------------------------------------
showloading = false
local vnxphonedraw = false 
function DrawVnXPhone()
    local time = getRealTime()
	local hours = time.hour
	local minutes = time.minute
	local seconds = time.second
	-- Make sure to add a 0 to the front of single digits.
	if (hours < 10) then
		hours = "0"..hours
	end
	if (minutes < 10) then
		minutes = "0"..minutes
	end
	if (seconds < 10) then
		seconds = "0"..seconds
    end
    if getElementData ( getLocalPlayer(), "loggedin" ) == 1 then
        if vnxphonedraw == true then 
            vnxDestroyWindow("vnx_phone_main")
            vnxDestroyWindow("handy_loading")
            vnxDestroyWindow("turnphone_on_button")
            vnxDestroyWindow("vnx_logo_dev")
            vnxDestroyWindow("handy_loading_info")
            clearstatusbarsandicons()
            destroy_ammunation_vnxphone()
            vnxDestroyWindow("home_button")
            vnxDestroyWindow("uhrzeut_loading_info")
            vnxDestroyWindow("turnoff_loading_vnxphone")
            vnxDestroyWindow("select_phone_btn")
            vnxDestroyWindow("player_call_window")
            vnxDestroyWindow("phone_background_wallpaper")
            vnxDestroyWindow("player_msg_window")
            vnxDestroyWindow("player_msg_edit")
            vnxDestroyWindow("select_phone_btn_2")
            vnxDestroyWindow("select_phone_btn_3")
            vnxDestroyWindow("select_phone_btn_4")
            triggerEvent( "showSpeedometer", getLocalPlayer())
            removeEventHandler("onClientRender", getRootElement(), statusbars)
            removeEventHandler("onClientRender", getRootElement(), drawlefttoploadingcube)
            removeEventHandler("onClientRender", getRootElement(), drawrighttoploadingcube)
            removeEventHandler("onClientRender", getRootElement(), drawrightbottomloadingcube)
            removeEventHandler("onClientRender", getRootElement(), drawleftbottomloadingcube)
            if status_vnx_pornhub == true then 
                destroyElement (BrowserForPornhub)
                destroyElement(BrowserForPornhub_Background)
            end 
            status_vnx_pornhub = false 
            showloading = false
            showCursor(false)
            vnxphonedraw = false 
                local vnxhud = tonumber(getElementData( getLocalPlayer(), "hud"))
                triggerEvent( "showhudclient", getLocalPlayer(), vnxhud)
                --outputDebugString( vnxhud.. " ist die nummer von "..getPlayerName( getLocalPlayer()) )
                setPlayerHudComponentVisible( "radar", true )
        else
            triggerEvent( "hidehudclient", getLocalPlayer())
            triggerEvent( "hideSpeedometer", getLocalPlayer())
            if getElementData(getLocalPlayer(), "handystate") == "off" then
                showCursor(true)
                vnxDestroyWindow("home_button")
                vnxDrawImage("vnx_phone_main", "JustAPhone", sx*1000, sy*200, sx*440, sy*440, "images/vnxphone", "donothing")
                vnxDrawImage("vnx_logo_dev", "JustAPhoneLogo", sx*1110, sy*235, sx*225, sy*220, "images/logo", "donothing")
                vnxDrawText("handy_loading_info", "Handy Loading Text", "Venox Phone 1.0 Dev. \n\nBy Solid_Snake & VnX - RL Crew", sx*1122, sy*415, sx*200, sy*50, tocolor(255,255,255,255), 0.7,"default","center","center")
                vnxDrawText("handy_loading", "Handy Loading Text", "Dein Handy ist Ausgeschaltet!\n\n Anschalten?", sx*1122, sy*475, sx*200, sy*50, tocolor(255,255,255,255), 1,"default","center","center")
                vnxDrawButtonColored("turnphone_on_button","Anschalten Button","Handy Starten",sx*1126,sy*525,sx*188,sy*30,tocolor(175,0,0,150),tocolor(200,0,0,150),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(175,0,0,0),tocolor(225,0,0,0),"handyausschalten")
                vnxphonedraw = true 
            else
                vnxDrawButtonColored("home_button","Home Button","",sx*1205,sy*594,sx*30,sy*30,tocolor(175,0,0,0),tocolor(200,0,0,0),tocolor(255,255,255,0),tocolor(255,255,255,0),tocolor(175,0,0,0),tocolor(225,0,0,0),"DrawVnXPhoneHome")       
                vnxDrawText("uhrzeut_loading_info", "Info Loading Text", hours.." : "..minutes, sx*1122, sy*236, sx*200, sy*50, tocolor(255,255,255,255), 1,"default-bold-small","center","center")
                showCursor(true)   
                --addEventHandler("onClientRender", getRootElement(), statusbars)
                if currentphonestate == "call" then 
                    show_call_window_vnxphone()
                elseif currentphonestate == "sms" then 
                    show_sms_window_vnxphone()
                elseif currentphonestate == "music" then 
                    show_music_window_vnxphone()
                elseif currentphonestate == "pornhub" then 
                    show_pornhub_window_vnxphone()
                elseif currentphonestate == "ammu" then 
                    show_ammunation_window_vnxphone()
                elseif currentphonestate == "home" then 
                DrawVnXPhoneHome()
                end 
                vnxphonedraw = true 
            end
        end
    end 
end 
bindKey ( "o", "down", DrawVnXPhone)
------------------------------------------------------------------------------------------------------------------------------------
function send_sms_vnxphone()
    local selectedtext = vnxGetEditText("player_msg_edit","edit")
    local selectednumber = vnxGetGridlistSelectedItem("player_msg_window", "info")[2]
    local selecteduser = vnxGetGridlistSelectedItem("player_msg_window", "info")[1]
    triggerServerEvent ( "SMS", getLocalPlayer(), getLocalPlayer(), selectednumber, selectedtext )
    -- Später ändern
    --outputChatBox ( "#00C8FF[SMS An : #FFFFFF"..selecteduser.." #00C8FF] : #FFFFFF"..selectedtext.."", 255, 255, 255 ,true)
end

function show_sms_window_vnxphone()
    currentphonestate = "sms"   
    clearstatusbarsandicons()
    removeEventHandler("onClientRender", getRootElement(), statusbars)
    ----------------------------------------------------------------------
    vnxDrawImage("vnx_phone_main", "JustAPhone", sx*1000, sy*200, sx*440, sy*440, "images/vnxphone", "donothing")
    vnxDrawImage("phone_background_wallpaper", "WP", sx*1126, sy*255, sx*186, sy*330, "images/sms_wp")
	vnxDrawEdit("player_msg_edit","edit", "", sx*1126, sy*475, sx*186, true, true)
    local playermsg = {}
    vnxDrawGridlist("player_msg_window","info", sx*1123,sy*270,sx*189,sy*200, { { "Spieler", sx*100 }, { "Nummer", sy*120 } }, playermsg)
    for i, v in ipairs(getElementsByType("player")) do
        if getElementData(getLocalPlayer(), "loggedin") == 1 then
            local name = getPlayerName(v)
            local telenr = tonumber(getElementData(v, "telenr"))
            if telenr == nil then telenr = "Verbinden ..." end
            table.insert(playermsg, { "", "" })
            table.insert(playermsg, { name, telenr })
        end
    end
    vnxDrawButtonColored("select_phone_btn","SMS Button","SMS Senden",sx*1126,sy*515,sx*188,sy*30,tocolor(40,40,40,150),tocolor(40,40,40,150),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,255),tocolor(0,150,200,255),"send_sms_vnxphone")
end

------------------------------------------------------------------------------------------------------------------------------------
function call_sel_player()
    local selecteduser = vnxGetGridlistSelectedItem("player_call_window", "info")[1]
    local selectednumber = vnxGetGridlistSelectedItem("player_call_window", "info")[2]
    triggerServerEvent ( "callSomeone", getLocalPlayer(), getLocalPlayer(), selectednumber)
end 
function show_call_window_vnxphone()
    currentphonestate = "call"
    clearstatusbarsandicons()
    removeEventHandler("onClientRender", getRootElement(), statusbars)
    ----------------------------------------------------------------------
    local playercall = {}
    vnxDrawImage("vnx_phone_main", "JustAPhone", sx*1000, sy*200, sx*440, sy*440, "images/vnxphone", "donothing")
    vnxDrawImage("phone_background_wallpaper", "WP", sx*1126, sy*255, sx*186, sy*330, "images/blue_call_wallpaper")
    vnxDrawGridlist("player_call_window","info", sx*1123,sy*270,sx*189,sy*200, { { "Spieler", sx*100 }, { "Nummer", sy*120 } }, playercall)
    for i, v in ipairs(getElementsByType("player")) do
        if getElementData(getLocalPlayer(), "loggedin") == 1 then
            local name = getPlayerName(v)
            local telenr = tonumber(getElementData(v, "telenr"))
            if telenr == nil then telenr = "Verbinden ..." end
            table.insert(playercall, { "", "" })
            table.insert(playercall, { name, telenr })
        end
    end
    vnxDrawButtonColored("select_phone_btn","call btn Button","Anrufen",sx*1126,sy*475,sx*75,sy*30,tocolor(40,40,40,150),tocolor(80,80,80,150),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,150),tocolor(0,150,200,150),"call_sel_player")
end 
------------------------------------------------------------------------------------------------------------------------------------

function select_music_window_vnxphone()
    local selectedstream = vnxGetGridlistSelectedItem("player_call_window", "info")[1]
    if (phone_vnx_music) then 
        stopSound(phone_vnx_music)
    end 
        if selectedstream == "i ❤ Radio" then 
            streamlaeuft_vnxphone = true
            phone_vnx_music = playSound("http://www.iloveradio.de/iloveradio.m3u")
            outputChatBox("#00C8FF[Venox-Phone] : #FFFFFFEs läuft momentan : #00C8FF"..selectedstream, 150,0,0,true) 
        elseif selectedstream == "HardBase.FM" then 
            streamlaeuft_vnxphone = true
            phone_vnx_music = playSound("http://listen.hardbase.fm/dsl.pls")
            outputChatBox("#00C8FF[Venox-Phone] : #FFFFFFEs läuft momentan : #00C8FF"..selectedstream, 150,0,0,true) 
        elseif selectedstream == "Blackbeats.FM" then 
            streamlaeuft_vnxphone = true
            phone_vnx_music = playSound("http://blackbeats.fm/listen.asx")
            outputChatBox("#00C8FF[Venox-Phone] : #FFFFFFEs läuft momentan : #00C8FF"..selectedstream, 150,0,0,true) 
        elseif selectedstream == "TechnoBase.FM" then 
            streamlaeuft_vnxphone = true
            phone_vnx_music = playSound("http://listen.technobase.fm/aacplus.pls")
            outputChatBox("#00C8FF[Venox-Phone] : #FFFFFFEs läuft momentan : #00C8FF"..selectedstream, 150,0,0,true) 
        elseif selectedstream == "Energy Wien 104.2" then 
            streamlaeuft_vnxphone = true
            phone_vnx_music = playSound("http://85.10.203.75:8000/vie.m3u")
            outputChatBox("#00C8FF[Venox-Phone] : #FFFFFFEs läuft momentan : #00C8FF"..selectedstream, 150,0,0,true) 
        elseif selectedstream == "I ❤ Dreist" then 
            streamlaeuft_vnxphone = true
            phone_vnx_music = playSound("http://www.iloveradio.de/ilovedreist.m3u")
            outputChatBox("#00C8FF[Venox-Phone] : #FFFFFFEs läuft momentan : #00C8FF"..selectedstream, 150,0,0,true) 
        elseif selectedstream == "Deutschrap Extreme" then 
            streamlaeuft_vnxphone = true
            phone_vnx_music = playSound("http://www.iloveradio.de/iloveradio.m3u")
            outputChatBox("#00C8FF[Venox-Phone] : #FFFFFFEs läuft momentan : #00C8FF"..selectedstream, 150,0,0,true) 
        else 
            outputChatBox("Ungültiger - Stream!", 100,0,0)
        end
end 

function stop_music_window_vnxphone()
    if streamlaeuft_vnxphone == true then 
        stopSound(phone_vnx_music)
        streamlaeuft_vnxphone = false 
    else 
        outputChatBox("Es läuft momentan kein Stream!", 255,255,255)
    end
end 

------------------------------------------------------------------------------------------------------------------------------------
function show_music_window_vnxphone()
    currentphonestate = "music"
    clearstatusbarsandicons()
    removeEventHandler("onClientRender", getRootElement(), statusbars)
    ----------------------------------------------------------------------
    local musicstreams = {}
    table.insert(musicstreams, { "" })
    table.insert(musicstreams, { "i ❤ Radio" })
    table.insert(musicstreams, { "" })
    table.insert(musicstreams, { "HardBase.FM" })
    table.insert(musicstreams, { "" })
    table.insert(musicstreams, { "Blackbeats.FM" })
    table.insert(musicstreams, { "" })
    table.insert(musicstreams, { "TechnoBase.FM" })
    table.insert(musicstreams, { "" })
    table.insert(musicstreams, { "Energy Wien 104.2" })
    table.insert(musicstreams, { "" })
    table.insert(musicstreams, { "Deutschrap Extreme" })
    table.insert(musicstreams, { "" })
    table.insert(musicstreams, { "I ❤ Dreist" })
    table.insert(musicstreams, { "" })
    vnxDrawImage("vnx_phone_main", "JustAPhone", sx*1000, sy*200, sx*440, sy*440, "images/vnxphone", "donothing")
    vnxDrawImage("phone_background_wallpaper", "WP", sx*1126, sy*255, sx*186, sy*330, "images/music_wp")
    vnxDrawGridlist("player_call_window","info", sx*1123,sy*270,sx*189,sy*200, { { "Stream Name ", sx*100 } }, musicstreams)
    vnxDrawButtonColored("select_phone_btn","call btn Button","Abspielen",sx*1126,sy*475,sx*75,sy*30,tocolor(0,125,0,150),tocolor(0,200,0,150),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"select_music_window_vnxphone")
    vnxDrawButtonColored("select_phone_btn_2","stop btn Button","Musik\nStoppen",sx*1237,sy*475,sx*75,sy*30,tocolor(125,0,0,150),tocolor(200,0,0,150),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"stop_music_window_vnxphone")
    vnxDrawButtonColored("select_phone_btn_3","call btn Button","Lauter",sx*1126,sy*515,sx*75,sy*30,tocolor(0,125,0,150),tocolor(0,200,0,150),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"lauter_music_vnxphone")
    vnxDrawButtonColored("select_phone_btn_4","stop btn Button","Leiser",sx*1237,sy*515,sx*75,sy*30,tocolor(125,0,0,150),tocolor(200,0,0,150),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"leiser_music_vnxphone")
end 

function lauter_music_vnxphone()
    if streamlaeuft_vnxphone == true then 
        local toVol = math.round ( getSoundVolume ( phone_vnx_music ) + lauter_vnx_phone_music, 2 )
        if ( toVol <= 10.0 ) then
            outputChatBox ( "Radio gesetzt auf "..math.floor ( toVol * 100 ).."%!", 0, 200, 0 )
            triggerServerEvent ( "vnx_musik_triggern_lautstaerke", localPlayer, toVol ) 
        else
            outputChatBox ( "Das Volumen kann nicht höher gemacht werden.", 100, 0, 0 )
        end
    end
end
function leiser_music_vnxphone()
    if streamlaeuft_vnxphone == true then 
        local toVol = math.round ( getSoundVolume ( phone_vnx_music ) - leiser_vnx_phone_music, 2 )
        if ( toVol > 0.0 ) then
            outputChatBox ( "Radio gesetzt auf "..math.floor ( toVol * 100 ).."%!", 0, 200, 0 )
            triggerServerEvent ( "vnx_musik_triggern_lautstaerke", localPlayer, toVol )
        else
            outputChatBox ( "Das Radio kann nicht leiser gemacht werden.", 100, 0, 0 )
        end
    end
end

addEvent ( "vnx_change_stream_lautstärke", true )
addEventHandler ( "vnx_change_stream_lautstärke", getLocalPlayer(), function ( vol ) 
	if ( isElement ( phone_vnx_music ) ) then
		setSoundVolume ( phone_vnx_music, tonumber ( vol ) )
	end
end )

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

------------------------------------------------------------------------------------------------------------------------------------


local preisforeinkaufswagen = 0 


function destroy_ammunation_vnxphone()
    vnxDestroyWindow("9mm_overlay_ammunation_vnxphone")
    vnxDestroyWindow("deagle_overlay_ammunation_vnxphone")
    vnxDestroyWindow("shotgun_overlay_ammunation_vnxphone")
    vnxDestroyWindow("mp5_overlay_ammunation_vnxphone")
    vnxDestroyWindow("ak_overlay_ammunation_vnxphone")
    vnxDestroyWindow("m4_overlay_ammunation_vnxphone")
    vnxDestroyWindow("rifle_overlay_ammunation_vnxphone")
    --------------------------------------------------------
    vnxDestroyWindow("9mm_overlay_ammunation_vnxphone_zahl")
    vnxDestroyWindow("deagle_overlay_ammunation_vnxphone_zahl")
    vnxDestroyWindow("shotgun_overlay_ammunation_vnxphone_zahl")
    vnxDestroyWindow("mp5_overlay_ammunation_vnxphone_zahl")
    vnxDestroyWindow("ak_overlay_ammunation_vnxphone_zahl")
    vnxDestroyWindow("m4_overlay_ammunation_vnxphone_zahl")
    vnxDestroyWindow("rifle_overlay_ammunation_vnxphone_zahl")
    --------------------------------------------------------
    vnxDestroyWindow("9mm_button_ammunation_vnxphone_")
    vnxDestroyWindow("deagle_button_ammunation_vnxphone_")
    vnxDestroyWindow("shotgun_button_ammunation_vnxphone_")
    vnxDestroyWindow("mp5_button_ammunation_vnxphone_")
    vnxDestroyWindow("ak_button_ammunation_vnxphone_")
    vnxDestroyWindow("m4_button_ammunation_vnxphone_")
    vnxDestroyWindow("rifle_button_ammunation_vnxphone_")
        --------------------------------------------------------
    vnxDestroyWindow("9mm_button_ammunation_vnxphone")
    vnxDestroyWindow("deagle_button_ammunation_vnxphone")
    vnxDestroyWindow("shotgun_button_ammunation_vnxphone")
    vnxDestroyWindow("mp5_button_ammunation_vnxphone")
    vnxDestroyWindow("ak_button_ammunation_vnxphone")
    vnxDestroyWindow("m4_button_ammunation_vnxphone")
    vnxDestroyWindow("rifle_button_ammunation_vnxphone")
    --------------------------------------------------------
    vnxDestroyWindow("weiter_button_ammunation_vnxphone")
end 

local weste_sel_vnxphone = 0
local neunmilli_sel_vnxphone = 0
local deagle_sel_vnxphone = 0
local shotgun_sel_vnxphone = 0
local mp5_sel_vnxphone = 0
local ak_sel_vnxphone = 0
local m4_sel_vnxphone = 0
local rifle_sel_vnxphone = 0
local einkaufswagenpreis = 0



local neunmilli_sel_ammo_vnxphone = 0
local deagle_sel_ammo_vnxphone = 0
local shotgun_sel_ammo_vnxphone = 0
local mp5_sel_ammo_vnxphone = 0
local ak_sel_ammo_vnxphone = 0
local m4_sel_ammo_vnxphone = 0
local rifle_sel_ammo_vnxphone = 0
----------------------------------------------------------------------------------------
function neunmilli_sel_ammo_plus()
    if neunmilli_sel_ammo_vnxphone >= 0 then
        neunmilli_sel_ammo_vnxphone = neunmilli_sel_ammo_vnxphone + 1
        einkaufswagenpreis = einkaufswagenpreis + 30
        destroy_ammunation_vnxphone()
        show_ammunation_window_Ammo_vnxphone()
    end
end
function neunmilli_sel_ammo_minus()
    if neunmilli_sel_ammo_vnxphone > 0 then
        neunmilli_sel_ammo_vnxphone = neunmilli_sel_ammo_vnxphone - 1
        einkaufswagenpreis = einkaufswagenpreis - 30
        destroy_ammunation_vnxphone()
        show_ammunation_window_Ammo_vnxphone()
    end
end
----------------------------------------------------------------------------------------
function deagle_sel_ammo_plus()
    if deagle_sel_ammo_vnxphone >= 0 then
        deagle_sel_ammo_vnxphone = deagle_sel_ammo_vnxphone + 1
        einkaufswagenpreis = einkaufswagenpreis + 300
        destroy_ammunation_vnxphone()
        show_ammunation_window_Ammo_vnxphone()
    end
end
function deagle_sel_ammo_minus()
    if deagle_sel_ammo_vnxphone > 0 then
        deagle_sel_ammo_vnxphone = deagle_sel_ammo_vnxphone - 1
        einkaufswagenpreis = einkaufswagenpreis - 300
        destroy_ammunation_vnxphone()
        show_ammunation_window_Ammo_vnxphone()
    end
end
----------------------------------------------------------------------------------------
function shotgun_sel_ammo_plus()
    if shotgun_sel_ammo_vnxphone >= 0 then
        shotgun_sel_ammo_vnxphone = shotgun_sel_ammo_vnxphone + 1
        einkaufswagenpreis = einkaufswagenpreis + 6
        destroy_ammunation_vnxphone()
        show_ammunation_window_Ammo_vnxphone()
    end
end
function shotgun_sel_ammo_minus()
    if shotgun_sel_ammo_vnxphone > 0 then
        shotgun_sel_ammo_vnxphone = shotgun_sel_ammo_vnxphone - 1
        einkaufswagenpreis = einkaufswagenpreis - 6
        destroy_ammunation_vnxphone()
        show_ammunation_window_Ammo_vnxphone()
    end
end
----------------------------------------------------------------------------------------
function mp5_sel_ammo_plus()
    if mp5_sel_ammo_vnxphone >= 0 then
        mp5_sel_ammo_vnxphone = mp5_sel_ammo_vnxphone + 1
        einkaufswagenpreis = einkaufswagenpreis + 280
        destroy_ammunation_vnxphone()
        show_ammunation_window_Ammo_vnxphone()
    end
end
function mp5_sel_ammo_minus()
    if mp5_sel_ammo_vnxphone > 0 then
        mp5_sel_ammo_vnxphone = mp5_sel_ammo_vnxphone - 1
        einkaufswagenpreis = einkaufswagenpreis - 280
        destroy_ammunation_vnxphone()
        show_ammunation_window_Ammo_vnxphone()
    end
end
----------------------------------------------------------------------------------------
function ak_sel_ammo_plus()
    if ak_sel_ammo_vnxphone >= 0 then
        ak_sel_ammo_vnxphone = ak_sel_ammo_vnxphone + 1
        einkaufswagenpreis = einkaufswagenpreis + 680
        destroy_ammunation_vnxphone()
        show_ammunation_window_Ammo_vnxphone()
    end
end
function ak_sel_ammo_minus()
    if ak_sel_ammo_vnxphone > 0 then
        ak_sel_ammo_vnxphone = ak_sel_ammo_vnxphone - 1
        destroy_ammunation_vnxphone()
        show_ammunation_window_Ammo_vnxphone()
        einkaufswagenpreis = einkaufswagenpreis - 680
    end
end
----------------------------------------------------------------------------------------

function m4_sel_ammo_plus()
    if m4_sel_ammo_vnxphone >= 0 then
        m4_sel_ammo_vnxphone = m4_sel_ammo_vnxphone + 1
        einkaufswagenpreis = einkaufswagenpreis + 680
        destroy_ammunation_vnxphone()
        show_ammunation_window_Ammo_vnxphone()
    end
end
function m4_sel_ammo_minus()
    if m4_sel_ammo_vnxphone > 0 then
        m4_sel_ammo_vnxphone = m4_sel_ammo_vnxphone - 1
        einkaufswagenpreis = einkaufswagenpreis - 680
        destroy_ammunation_vnxphone()
        show_ammunation_window_Ammo_vnxphone()
    end
end

function rifle_sel_ammo_plus()
    if rifle_sel_ammo_vnxphone >= 0 then
        rifle_sel_ammo_vnxphone = rifle_sel_ammo_vnxphone + 1
        einkaufswagenpreis = einkaufswagenpreis + 40
        destroy_ammunation_vnxphone()
        show_ammunation_window_Ammo_vnxphone()
    end
end
function rifle_sel_ammo_minus()
    if rifle_sel_ammo_vnxphone > 0 then
        rifle_sel_ammo_vnxphone = rifle_sel_ammo_vnxphone - 1
        einkaufswagenpreis = einkaufswagenpreis - 40
        destroy_ammunation_vnxphone()
        show_ammunation_window_Ammo_vnxphone()
    end
end
-----------------------------------------------------------------------------------------------------------------------------------
function weste_sel()
    if weste_sel_vnxphone == 0 then
        weste_sel_vnxphone = 1
        einkaufswagenpreis = einkaufswagenpreis + 150
        destroy_ammunation_vnxphone()
        show_ammunation_einkaufswagen()
    elseif weste_sel_vnxphone == 1 then 
        weste_sel_vnxphone = 0
        einkaufswagenpreis = einkaufswagenpreis - 150
        destroy_ammunation_vnxphone()
        show_ammunation_einkaufswagen()
    end
end
function neunmilli_sel()
    if neunmilli_sel_vnxphone == 0 then
        neunmilli_sel_vnxphone = 1
        einkaufswagenpreis = einkaufswagenpreis + 300
        destroy_ammunation_vnxphone()
        show_ammunation_window_vnxphone()
    elseif neunmilli_sel_vnxphone == 1 then 
        neunmilli_sel_vnxphone = 0
        einkaufswagenpreis = einkaufswagenpreis - 300
        destroy_ammunation_vnxphone()
        show_ammunation_window_vnxphone()
    end
end
function deagle_sel()
    if deagle_sel_vnxphone == 0 then
        deagle_sel_vnxphone = 1
        einkaufswagenpreis = einkaufswagenpreis + 1500
        destroy_ammunation_vnxphone()
        show_ammunation_window_vnxphone()
    elseif deagle_sel_vnxphone == 1 then 
        deagle_sel_vnxphone = 0
        einkaufswagenpreis = einkaufswagenpreis - 1500
        destroy_ammunation_vnxphone()
        show_ammunation_window_vnxphone()
    end
end
function shotgun_sel()
    if shotgun_sel_vnxphone == 0 then
        shotgun_sel_vnxphone = 1
        einkaufswagenpreis = einkaufswagenpreis + 800
        destroy_ammunation_vnxphone()
        show_ammunation_window_vnxphone()
    elseif shotgun_sel_vnxphone == 1 then 
        shotgun_sel_vnxphone = 0
        einkaufswagenpreis = einkaufswagenpreis - 800
        destroy_ammunation_vnxphone()
        show_ammunation_window_vnxphone()
    end
end
function mp5_sel()
    if mp5_sel_vnxphone == 0 then
        mp5_sel_vnxphone = 1
        einkaufswagenpreis = einkaufswagenpreis + 1080
        destroy_ammunation_vnxphone()
        show_ammunation_window_vnxphone()
    elseif mp5_sel_vnxphone == 1 then 
        mp5_sel_vnxphone = 0
        einkaufswagenpreis = einkaufswagenpreis - 1080
        destroy_ammunation_vnxphone()
        show_ammunation_window_vnxphone()
    end
end
function ak_sel()
    if ak_sel_vnxphone == 0 then
        ak_sel_vnxphone = 1
        einkaufswagenpreis = einkaufswagenpreis + 1480
        destroy_ammunation_vnxphone()
        show_ammunation_window_vnxphone()
    elseif ak_sel_vnxphone == 1 then 
        ak_sel_vnxphone = 0
        einkaufswagenpreis = einkaufswagenpreis - 1480
        destroy_ammunation_vnxphone()
        show_ammunation_window_vnxphone()
    end
end
function m4_sel()
    if m4_sel_vnxphone == 0 then
        m4_sel_vnxphone = 1
        einkaufswagenpreis = einkaufswagenpreis + 1680
        destroy_ammunation_vnxphone()
        show_ammunation_window_vnxphone()
    elseif m4_sel_vnxphone == 1 then 
        m4_sel_vnxphone = 0
        einkaufswagenpreis = einkaufswagenpreis - 1680
        destroy_ammunation_vnxphone()
        show_ammunation_window_vnxphone()
    end
end
function rifle_sel()
    if rifle_sel_vnxphone == 0 then
        rifle_sel_vnxphone = 1
        einkaufswagenpreis = einkaufswagenpreis + 800
        destroy_ammunation_vnxphone()
        show_ammunation_window_vnxphone()
    elseif rifle_sel_vnxphone == 1 then 
        rifle_sel_vnxphone = 0
        einkaufswagenpreis = einkaufswagenpreis - 800
        destroy_ammunation_vnxphone()
        show_ammunation_window_vnxphone()
    end
end


function show_ammunation_window_vnxphone()
    currentphonestate = "ammu"
    removeEventHandler("onClientRender", getRootElement(), statusbars)
    clearstatusbarsandicons()
    ----------------------------------------------------------------------
    vnxDrawImage("vnx_phone_main", "JustAPhone", sx*1000, sy*200, sx*440, sy*440, "images/vnxphone", "donothing")
    vnxDrawImage("phone_background_wallpaper", "WP", sx*1126, sy*255, sx*186, sy*330, "images/ammunation_background")
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    vnxDrawText("9mm_overlay_ammunation_vnxphone", "Deagle Loading Text", "9mm\n300$", sx*1135, sy*280, sx*200, sy*30, tocolor(255,255,255,255), 1,"default-bold-small","left","center")
    vnxDrawText("deagle_overlay_ammunation_vnxphone", "Deagle Loading Text", "Deagle\n1500$", sx*1135, sy*320, sx*200, sy*30, tocolor(255,255,255,255), 1,"default-bold-small","left","center")
    vnxDrawText("shotgun_overlay_ammunation_vnxphone", "Deagle Loading Text", "Shotgun\n800$", sx*1135, sy*360, sx*200, sy*30, tocolor(255,255,255,255), 1,"default-bold-small","left","center")
    vnxDrawText("mp5_overlay_ammunation_vnxphone", "Deagle Loading Text", "Mp5\n1080$", sx*1135, sy*400, sx*200, sy*30, tocolor(255,255,255,255), 1,"default-bold-small","left","center")
    vnxDrawText("ak_overlay_ammunation_vnxphone", "Deagle Loading Text", "Ak-47\n1480$", sx*1135, sy*440, sx*200, sy*30, tocolor(255,255,255,255), 1,"default-bold-small","left","center")
    vnxDrawText("m4_overlay_ammunation_vnxphone", "Deagle Loading Text", "M4A1\n1680$", sx*1135, sy*480, sx*200, sy*30, tocolor(255,255,255,255), 1,"default-bold-small","left","center")
    vnxDrawText("rifle_overlay_ammunation_vnxphone", "Deagle Loading Text", "Gewehr\n800$", sx*1135, sy*520, sx*200, sy*30, tocolor(255,255,255,255), 1,"default-bold-small","left","center")
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- 9MM Zahl 
    vnxDrawText("9mm_overlay_ammunation_vnxphone_zahl", "Deagle Loading Text", neunmilli_sel_vnxphone, sx*1240, sy*280, sx*200, sy*30, tocolor(255,255,255,255), 1.2,"default-bold-small","left","center")
    -- Deagle Zahl 
    vnxDrawText("deagle_overlay_ammunation_vnxphone_zahl", "Deagle Loading Text", deagle_sel_vnxphone, sx*1240, sy*320, sx*200, sy*30, tocolor(255,255,255,255), 1.2,"default-bold-small","left","center")
    -- Shotgun Zahl 
    vnxDrawText("shotgun_overlay_ammunation_vnxphone_zahl", "Deagle Loading Text", shotgun_sel_vnxphone, sx*1240, sy*360, sx*200, sy*30, tocolor(255,255,255,255), 1.2,"default-bold-small","left","center")
    -- Mp5 Zahl 
    vnxDrawText("mp5_overlay_ammunation_vnxphone_zahl", "Deagle Loading Text", mp5_sel_vnxphone, sx*1240, sy*400, sx*200, sy*30, tocolor(255,255,255,255), 1.2,"default-bold-small","left","center")
    -- ak47 Zahl 
    vnxDrawText("ak_overlay_ammunation_vnxphone_zahl", "Deagle Loading Text", ak_sel_vnxphone, sx*1240, sy*440, sx*200, sy*30, tocolor(255,255,255,255), 1.2,"default-bold-small","left","center")
     -- M4 Zahl 
    vnxDrawText("m4_overlay_ammunation_vnxphone_zahl", "Deagle Loading Text", m4_sel_vnxphone, sx*1240, sy*480, sx*200, sy*30, tocolor(255,255,255,255), 1.2,"default-bold-small","left","center")
     -- M4 Zahl 
    vnxDrawText("rifle_overlay_ammunation_vnxphone_zahl", "Deagle Loading Text", rifle_sel_vnxphone, sx*1240, sy*520, sx*200, sy*30, tocolor(255,255,255,255), 1.2,"default-bold-small","left","center")
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    if neunmilli_sel_vnxphone == 1 then 
        vnxDrawButtonColored("9mm_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*280,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"neunmilli_sel")
        vnxDrawButtonColored("9mm_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*280,sx*30,sy*30,tocolor(40,40,40,255),tocolor(0,200,255,0),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"")
    else 
        vnxDrawButtonColored("9mm_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*280,sx*30,sy*30,tocolor(40,40,40,255),tocolor(0,200,255,0),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"")
        vnxDrawButtonColored("9mm_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*280,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"neunmilli_sel")
    end 
    if deagle_sel_vnxphone == 1 then 
        vnxDrawButtonColored("deagle_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*320,sx*30,sy*30,tocolor(40,40,40,255),tocolor(0,200,255,0),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"")
        vnxDrawButtonColored("deagle_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*320,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"deagle_sel")
    else 
        vnxDrawButtonColored("deagle_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*320,sx*30,sy*30,tocolor(40,40,40,255),tocolor(0,200,255,0),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"")
        vnxDrawButtonColored("deagle_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*320,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"deagle_sel")
    end 
    if shotgun_sel_vnxphone == 1 then 
        vnxDrawButtonColored("shotgun_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*360,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"shotgun_sel")
        vnxDrawButtonColored("shotgun_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*360,sx*30,sy*30,tocolor(40,40,40,255),tocolor(0,200,255,0),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"")
    else 
        vnxDrawButtonColored("shotgun_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*360,sx*30,sy*30,tocolor(40,40,40,255),tocolor(0,200,255,0),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"")
        vnxDrawButtonColored("shotgun_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*360,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"shotgun_sel")
    end 
    if mp5_sel_vnxphone == 1 then 
        vnxDrawButtonColored("mp5_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*400,sx*30,sy*30,tocolor(40,40,40,255),tocolor(0,200,255,0),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"")
        vnxDrawButtonColored("mp5_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*400,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"mp5_sel")
    else 
        vnxDrawButtonColored("mp5_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*400,sx*30,sy*30,tocolor(40,40,40,255),tocolor(0,200,255,0),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"")
        vnxDrawButtonColored("mp5_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*400,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"mp5_sel")
    end 
    if ak_sel_vnxphone == 1 then 
        vnxDrawButtonColored("ak_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*440,sx*30,sy*30,tocolor(40,40,40,255),tocolor(0,200,255,0),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"")
        vnxDrawButtonColored("ak_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*440,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"ak_sel")
    else 
        vnxDrawButtonColored("ak_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*440,sx*30,sy*30,tocolor(40,40,40,255),tocolor(0,200,255,0),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"")
        vnxDrawButtonColored("ak_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*440,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"ak_sel")
    end 
    if m4_sel_vnxphone == 1 then 
        vnxDrawButtonColored("m4_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*480,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"m4_sel")
        vnxDrawButtonColored("m4_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*480,sx*30,sy*30,tocolor(40,40,40,255),tocolor(0,200,255,0),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"")
    else 
        vnxDrawButtonColored("m4_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*480,sx*30,sy*30,tocolor(40,40,40,255),tocolor(0,200,255,0),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"")
        vnxDrawButtonColored("m4_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*480,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"m4_sel")
    end 
    if rifle_sel_vnxphone == 1 then 
        vnxDrawButtonColored("rifle_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*520,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"rifle_sel")
        vnxDrawButtonColored("rifle_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*520,sx*30,sy*30,tocolor(40,40,40,255),tocolor(0,200,255,0),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"")
    else 
        vnxDrawButtonColored("rifle_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*520,sx*30,sy*30,tocolor(40,40,40,255),tocolor(0,200,255,0),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"")
        vnxDrawButtonColored("rifle_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*520,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"rifle_sel")
    end 
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    vnxDrawButtonColored("weiter_button_ammunation_vnxphone","call btn Button","Weiter zur Magazin Auswahl\n["..einkaufswagenpreis.." $ ]",sx*1126,sy*555,sx*185,sy*30,tocolor(40,40,40,255),tocolor(80,80,80,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,255),tocolor(0,150,200,255),"show_ammunation_window_Ammo_vnxphone")
end

function show_ammunation_window_Ammo_vnxphone()
    currentphonestate = "ammu"
    outputChatBox ( "[Venox Gun Shop] : EINKAUFEN AUF EIGENE GEFAHR! [Aufgrund von Beta]", 150, 0, 0 ,true)
    removeEventHandler("onClientRender", getRootElement(), statusbars)
    clearstatusbarsandicons()
    destroy_ammunation_vnxphone()
    ----------------------------------------------------------------------
    vnxDrawImage("vnx_phone_main", "JustAPhone", sx*1000, sy*200, sx*440, sy*440, "images/vnxphone", "donothing")
    vnxDrawImage("phone_background_wallpaper", "WP", sx*1126, sy*255, sx*186, sy*330, "images/ammunation_background")
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    vnxDrawText("9mm_overlay_ammunation_vnxphone", "Deagle Loading Text", "9mm\n30$ Mag.", sx*1135, sy*280, sx*200, sy*30, tocolor(255, 255, 255,255), 1,"default","left","center")
    vnxDrawText("deagle_overlay_ammunation_vnxphone", "Deagle Loading Text", "Deagle\n300$ Mag.", sx*1135, sy*320, sx*200, sy*30, tocolor(255, 255, 255,255), 1,"default","left","center")
    vnxDrawText("shotgun_overlay_ammunation_vnxphone", "Deagle Loading Text", "Shotgun\n6$ Mag.", sx*1135, sy*360, sx*200, sy*30, tocolor(255, 255, 255,255), 1,"default","left","center")
    vnxDrawText("mp5_overlay_ammunation_vnxphone", "Deagle Loading Text", "Mp5\n280$ Mag.", sx*1135, sy*400, sx*200, sy*30, tocolor(255, 255, 255,255), 1,"default","left","center")
    vnxDrawText("ak_overlay_ammunation_vnxphone", "Deagle Loading Text", "Ak-47\n680$ Mag.", sx*1135, sy*440, sx*200, sy*30, tocolor(255, 255, 255,255), 1,"default","left","center")
    vnxDrawText("m4_overlay_ammunation_vnxphone", "Deagle Loading Text", "M4A1\n680$ Mag.", sx*1135, sy*480, sx*200, sy*30, tocolor(255, 255, 255,255), 1,"default","left","center")
    vnxDrawText("rifle_overlay_ammunation_vnxphone", "Deagle Loading Text", "Gewehr\n40$ Mag.", sx*1135, sy*520, sx*200, sy*30, tocolor(255, 255, 255,255), 1,"default","left","center")
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- 9MM Zahl 
    if neunmilli_sel_ammo_vnxphone == 0 then
        colorneunr, colorneung, colorneunb =  255, 255, 255
    else
        colorneunr, colorneung, colorneunb =  255, 255, 255
    end

    if deagle_sel_ammo_vnxphone == 0 then
        colordeagler, colordeagleg, colordeagleb =  255, 255, 255
    else 
        colordeagler, colordeagleg, colordeagleb =  255, 255, 255
    end

    if shotgun_sel_ammo_vnxphone == 0 then
        colorshotgunr, colorshotgung, colorshotgunb =  255, 255, 255
    else
        colorshotgunr, colorshotgung, colorshotgunb = 255, 255, 255
    end 
    if mp5_sel_ammo_vnxphone == 0 then
        colormp5r, colormp5g, colormp5b =  255, 255, 255
    else 
        colormp5r, colormp5g, colormp5b =  255, 255, 255
    end

    if ak_sel_ammo_vnxphone == 0 then
        colorakr, colorakg, colorakb =  255, 255, 255
    else 
        colorakr, colorakg, colorakb =  255, 255, 255
    end 

    if m4_sel_ammo_vnxphone == 0 then
        colorm4r, colorm4g, colorm4b =  255, 255, 255
    else 
        colorm4r, colorm4g, colorm4b =  255, 255, 255
    end
    if rifle_sel_ammo_vnxphone == 0 then 
        colorrifler, colorrifleg, colorrifleb =  255, 255, 255
    else 
        colorrifler, colorrifleg, colorrifleb =  255, 255, 255
    end
    vnxDrawText("9mm_overlay_ammunation_vnxphone_zahl", "Deagle Loading Text", neunmilli_sel_ammo_vnxphone, sx*1240, sy*280, sx*200, sy*30, tocolor(colorneunr, colorneung, colorneunb,255), 1.2,"default","left","center")
    -- Deagle Zahl 
    vnxDrawText("deagle_overlay_ammunation_vnxphone_zahl", "Deagle Loading Text", deagle_sel_ammo_vnxphone, sx*1240, sy*320, sx*200, sy*30, tocolor(colordeagler, colordeagleg, colordeagleb,255), 1.2,"default","left","center")
    -- Shotgun Zahl 
    vnxDrawText("shotgun_overlay_ammunation_vnxphone_zahl", "Deagle Loading Text", shotgun_sel_ammo_vnxphone, sx*1240, sy*360, sx*200, sy*30, tocolor(colorshotgunr, colorshotgung, colorshotgunb,255), 1.2,"default","left","center")
    -- Mp5 Zahl 
    vnxDrawText("mp5_overlay_ammunation_vnxphone_zahl", "Deagle Loading Text", mp5_sel_ammo_vnxphone, sx*1240, sy*400, sx*200, sy*30, tocolor(colormp5r, colormp5g, colormp5b,255), 1.2,"default","left","center")
    -- ak47 Zahl 
    vnxDrawText("ak_overlay_ammunation_vnxphone_zahl", "Deagle Loading Text", ak_sel_ammo_vnxphone, sx*1240, sy*440, sx*200, sy*30, tocolor(colorakr, colorakg, colorakb,255), 1.2,"default","left","center")
     -- M4 Zahl 
    vnxDrawText("m4_overlay_ammunation_vnxphone_zahl", "Deagle Loading Text", m4_sel_ammo_vnxphone, sx*1240, sy*480, sx*200, sy*30, tocolor(colorm4r, colorm4g, colorm4b,255), 1.2,"default","left","center")
     -- M4 Zahl 
    vnxDrawText("rifle_overlay_ammunation_vnxphone_zahl", "Deagle Loading Text", rifle_sel_ammo_vnxphone, sx*1240, sy*520, sx*200, sy*30, tocolor(colorrifler, colorrifleg, colorrifleb,255), 1.2,"default","left","center")
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    if neunmilli_sel_ammo_vnxphone > 0 then 
        vnxDrawButtonColored("9mm_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*280,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"neunmilli_sel_ammo_minus")
        vnxDrawButtonColored("9mm_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*280,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"neunmilli_sel_ammo_plus")
    else 
        vnxDrawButtonColored("9mm_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*280,sx*30,sy*30,tocolor(40,40,40,255),tocolor(0,200,255,0),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"")
        vnxDrawButtonColored("9mm_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*280,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"neunmilli_sel_ammo_plus")
    end 
    if deagle_sel_ammo_vnxphone > 0 then 
        vnxDrawButtonColored("deagle_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*320,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"deagle_sel_ammo_plus")
        vnxDrawButtonColored("deagle_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*320,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"deagle_sel_ammo_minus")
    else 
        vnxDrawButtonColored("deagle_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*320,sx*30,sy*30,tocolor(40,40,40,255),tocolor(0,200,255,0),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"")
        vnxDrawButtonColored("deagle_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*320,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"deagle_sel_ammo_plus")
    end 
    if shotgun_sel_ammo_vnxphone > 0 then 
        vnxDrawButtonColored("shotgun_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*360,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"shotgun_sel_ammo_minus")
        vnxDrawButtonColored("shotgun_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*360,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,0),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"shotgun_sel_ammo_plus")
    else 
        vnxDrawButtonColored("shotgun_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*360,sx*30,sy*30,tocolor(40,40,40,255),tocolor(0,200,255,0),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"")
        vnxDrawButtonColored("shotgun_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*360,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"shotgun_sel_ammo_plus")
    end 
    if mp5_sel_ammo_vnxphone > 0 then 
        vnxDrawButtonColored("mp5_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*400,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"mp5_sel_ammo_plus")
        vnxDrawButtonColored("mp5_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*400,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"mp5_sel_ammo_minus")
    else 
        vnxDrawButtonColored("mp5_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*400,sx*30,sy*30,tocolor(40,40,40,255),tocolor(0,200,255,0),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"")
        vnxDrawButtonColored("mp5_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*400,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"mp5_sel_ammo_plus")
    end 
    if ak_sel_ammo_vnxphone > 0 then 
        vnxDrawButtonColored("ak_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*440,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"ak_sel_ammo_plus")
        vnxDrawButtonColored("ak_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*440,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"ak_sel_ammo_minus")
    else 
        vnxDrawButtonColored("ak_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*440,sx*30,sy*30,tocolor(40,40,40,255),tocolor(0,200,255,0),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"")
        vnxDrawButtonColored("ak_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*440,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"ak_sel_ammo_plus")
    end 
    if m4_sel_ammo_vnxphone > 0 then 
        vnxDrawButtonColored("m4_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*480,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"m4_sel_ammo_minus")
        vnxDrawButtonColored("m4_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*480,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"m4_sel_ammo_plus")
    else 
        vnxDrawButtonColored("m4_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*480,sx*30,sy*30,tocolor(40,40,40,255),tocolor(0,200,255,0),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"")
        vnxDrawButtonColored("m4_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*480,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"m4_sel_ammo_plus")
    end 
    if rifle_sel_ammo_vnxphone > 0 then 
        vnxDrawButtonColored("rifle_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*520,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"rifle_sel_ammo_minus")
        vnxDrawButtonColored("rifle_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*520,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"rifle_sel_ammo_plus")
    else 
        vnxDrawButtonColored("rifle_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*520,sx*30,sy*30,tocolor(40,40,40,255),tocolor(0,200,255,0),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"")
        vnxDrawButtonColored("rifle_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*520,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"rifle_sel_ammo_plus")
    end 
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    vnxDrawButtonColored("weiter_button_ammunation_vnxphone","call btn Button","Weiter zum Einkaufswagen.\n["..einkaufswagenpreis.." $ ]",sx*1126,sy*555,sx*185,sy*30,tocolor(0,125,0,255),tocolor(0,200,0,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"show_ammunation_einkaufswagen")
end


function show_ammunation_einkaufswagen()
    destroy_ammunation_vnxphone()
    vnxDrawText("9mm_overlay_ammunation_vnxphone", "Deagle Loading Text", "Weste\n150 $", sx*1135, sy*280, sx*200, sy*30, tocolor(255, 255, 255,255), 1,"default","left","center")
    vnxDrawText("9mm_overlay_ammunation_vnxphone_zahl", "Deagle Loading Text", weste_sel_vnxphone, sx*1240, sy*280, sx*200, sy*30, tocolor(255,255,255,255), 1.2,"default-bold-small","left","center")
    if weste_sel_vnxphone == 1 then 
        vnxDrawButtonColored("9mm_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*280,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"weste_sel")
        vnxDrawButtonColored("9mm_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*280,sx*30,sy*30,tocolor(40,40,40,255),tocolor(0,200,255,0),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"")
    else 
        vnxDrawButtonColored("9mm_button_ammunation_vnxphone_","call btn Button","-",sx*1190,sy*280,sx*30,sy*30,tocolor(40,40,40,255),tocolor(0,200,255,0),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"")
        vnxDrawButtonColored("9mm_button_ammunation_vnxphone","call btn Button","+",sx*1270,sy*280,sx*30,sy*30,tocolor(0,150,200,255),tocolor(0,200,255,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"weste_sel")
    end 
    vnxDrawButtonColored("deagle_overlay_ammunation_vnxphone_zahl","call btn Button","Einkaufswagen Leeren",sx*1126,sy*465,sx*185,sy*30,tocolor(125,0,0,255),tocolor(200,0,0,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"einkaufswagen_leeren_vnxphone")
    vnxDrawButtonColored("weiter_button_ammunation_vnxphone","call btn Button","Bestellen.\n["..einkaufswagenpreis.." $ ]",sx*1126,sy*500,sx*185,sy*30,tocolor(0,125,0,255),tocolor(0,200,0,255),tocolor(255,255,255,255),tocolor(255,255,255,255),tocolor(0,105,145,0),tocolor(0,150,200,0),"bestellen_ammunation_vnxphone")
end 


function einkaufswagen_leeren_vnxphone()
weste_sel_vnxphone = 0
neunmilli_sel_vnxphone = 0
deagle_sel_vnxphone = 0
shotgun_sel_vnxphone = 0
mp5_sel_vnxphone = 0
ak_sel_vnxphone = 0
m4_sel_vnxphone = 0
rifle_sel_vnxphone = 0
einkaufswagenpreis = 0
neunmilli_sel_ammo_vnxphone = 0
deagle_sel_ammo_vnxphone = 0
shotgun_sel_ammo_vnxphone = 0
mp5_sel_ammo_vnxphone = 0
ak_sel_ammo_vnxphone = 0
m4_sel_ammo_vnxphone = 0
rifle_sel_ammo_vnxphone = 0
outputChatBox ( "#00C8FF[#FFFFFFVenox Gun Shop #00C8FF] : #FFFFFF Einkaufswagen geleert! ", 255, 255, 255 ,true)

show_ammunation_einkaufswagen()
end 


function bestellen_ammunation_vnxphone()
    destroy_ammunation_vnxphone()
    outputDebugString( "Hat einen Bestellwert von : "..tonumber(einkaufswagenpreis).." $")
    triggerServerEvent ( "ammunationOnlineDeliver", getLocalPlayer(), einkaufswagenpreis, 
	neunmilli_sel_vnxphone, deagle_sel_vnxphone, shotgun_sel_vnxphone,mp5_sel_vnxphone, ak_sel_vnxphone, m4_sel_vnxphone, rifle_sel_vnxphone, mp5_sel_vnxphone, ak_sel_vnxphone, m4_sel_vnxphone, rifle_sel_vnxphone, 0, 0, weste_sel_vnxphone, neunmilli_sel_ammo_vnxphone, deagle_sel_ammo_vnxphone, shotgun_sel_ammo_vnxphone, mp5_sel_ammo_vnxphone, ak_sel_ammo_vnxphone, m4_sel_ammo_vnxphone, rifle_sel_ammo_vnxphone )
end 





-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------






-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function show_pornhub_window_vnxphone()
currentphonestate = "pornhub"
clearstatusbarsandicons()
removeEventHandler("onClientRender", getRootElement(), statusbars)
outputDebugString("Funktion aufgerufen nahui")
vnxDrawImage("vnx_phone_main", "JustAPhone", sx*1000, sy*200, sx*440, sy*440, "images/vnxphone", "donothing")
----------------------------------------------------------------------
    if status_vnx_pornhub == false then 
            BrowserForPornhub_Background = guiCreateBrowser( sx*1126, sy*255, sx*186, sy*330, false, false, false )
            BrowserForPornhub = guiGetBrowser( BrowserForPornhub_Background )
            addEventHandler( "onClientBrowserCreated", BrowserForPornhub, function( )
            requestBrowserDomains({ "http://pornhubdeutsch.net/" }, true, function(wasaccepted)
                status_vnx_pornhub = true 
                setBrowserProperty(BrowserForPornhub, "mobile", "0")
                if wasaccepted then
                    outputDebugString("Loading: " .. tostring(isBrowserLoading(BrowserForPornhub)))
                    outputDebugString("Blocked: "..tostring(isBrowserDomainBlocked("http://pornhubdeutsch.net/", true)))      
                    loadBrowserURL( BrowserForPornhub, "http://pornhubdeutsch.net/" )
                    --triggerEvent( "hideSpeedometer", getLocalPlayer())
                end
            end)
        end)
    end 
end 
------------------------------------------------------------------------------------------------------------------------------------


------First------
------Venox------
------Func.------
--by--vinzblack--

function  LargeFunction()
    local screenX, screenY = guiGetScreenSize()
    local sx, sy = screenX/1366, screenY/768
    showCursor(true)
    vnxDrawWindow("window_Largepeach", "PeachWindow", "LargePeachInformationen", sx*450,sy*250,sx*400,sy*200, "closeLargePeachWindow")
    vnxDrawButton("LargePeachButton","LargePeachChatBox","LargePeach-Info",sx*455,sy*350,sx*390,sy*35,"chatLargePeach")
end
addCommandHandler("largeinfo", LargeFunction)

function closeLargePeachWindow()
    vnxDestroyWindow("window_Largepeach")
    vnxDestroyWindow("LargePeachButton")
    showCursor(false)
end 

function chatLargePeach()
	outputChatBox( "LargePeach das ist eine Info für dich!", 255, 165, 0, false )
end 


local ccx,ccy,ccz,ccrx,ccry,ccrz = 0,2.5,0.1,0,0,0 
local cx,cy,cz,crx,cry,crz = 0,-1.5,-0.1,0,0,-90 

