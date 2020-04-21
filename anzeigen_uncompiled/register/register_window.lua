---------By-------------------
----------VenoX---------------
----------Reallife------------
--------------Crew------------
-----www.venox-reallife.com-----
------------------------------




addEvent ( "ShowRegisterGui", true )
addEvent ( "DisableRegisterGui", true )



function register_close_windows()
	infobox_start_func("Du kannst das Register Menü\n nicht schließen ! ", 7500 )
end



local screenx, screeny = guiGetScreenSize()
local player = getLocalPlayer(  )

local registerpos = {
	[1] = {-2024.7099609375, 180.859375, 60.8359375, 180, 180, 180, 0, 100 }, --KommtSpaeterNochmitRein --BHf richtung autobahn
	[2] = {-1800.7099609375, 180.859375, 60.8359375, -1569.7216796875 , 704.4970703125 , -5.2421875}, -- RIchtung PD ( mann sieht die autobahn etc)
	[3] = {-1850.7099609375, 180.859375, 60.8359375, -2000.7216796875 , 404.4970703125 , -5.2421875}, -- Done
	[4] = {-1870.7099609375, 180.859375, 50.8359375, -1900.7216796875 , 404.4970703125 , -5.2421875}, -- Done 
	[5] = {-2170.7099609375, 180.859375, 50.8359375, -1600.7216796875 , 404.4970703125 , -5.2421875}, -- Done
	[6] = {-1170.7099609375, 460.859375, 50.8359375, -1333.318359375 , 475.0810546875 , 4.1875},
}

local skinrandomm = {
	
	[1] = {280}

}

function nothin()

end

function m_btnfunc()
	local x1, y2 = screenx / 2 - 1366 / 2, screeny / 2 - 768 / 2
	geschlechtnewvnx = 0
	--outputDebugString( "du bist ein junge" )
	vnxDestroyWindow("m_btn")
	vnxDestroyWindow("w_btn")
	vnxDrawImage("greenV","Ein einfaches V",x1+370,y2+75,70,30,"anzeigen/register/images/tick","nothin")
	vnxDrawButton("w_btn", "Hilfe_Button", "Weiblich", x1 + 450, y2+75, 70, 30, "w_btnfunc")
end

function w_btnfunc()
	local x1, y2 = screenx / 2 - 1366 / 2, screeny / 2 - 768 / 2
	geschlechtnewvnx = 1
	--outputDebugString( "du bist ein maedchen" )
	vnxDestroyWindow("w_btn")
	vnxDestroyWindow("m_btn")
	--vnxDrawButton("m_btn", "Hilfe_Button", "Männlich", x1 + 370, y2+75, 70, 30, "m_btnfunc")
	vnxDrawImage("greenV","Ein einfaches V",x1+450,y2+75,70,30,"anzeigen/register/images/tick","nothin")
	vnxDrawButton("m_btn", "Hilfe_Button", "Männlich", x1 + 370, y2+75, 70, 30, "m_btnfunc")
end


addEventHandler ( "ShowRegisterGui", root, function ( )
	local x, y = screenx / 2 - 500 / 2, screeny / 2 - 172 / 2
    local x1, y2 = screenx / 2 - 1366 / 2, screeny / 2 - 768 / 2
	local name = getPlayerName(player)
	showCursor( true)
    showChat(false)
    fadeCamera ( true, 3.0)
    local rn = math.random(1 ,6)
	local cameraMatrix = registerpos[rn]
    setCameraMatrix( cameraMatrix[1], cameraMatrix[2], cameraMatrix[3], cameraMatrix[4], cameraMatrix[5], cameraMatrix[6])
    guiSetInputMode("allow_binds")
    --------------------------------------------------------------------------------------------------------------------------------------------------------
   	--dxDrawImage( float posX, float posY, float width, float height, mixed image [, float rotation = 0, float rotationCenterOffsetX = 0, float rotationCenterOffsetY = 0, int color = tocolor(255,255,255,255), bool postGUI = false ] )
	vnxDrawWindow("register_main_window", "Register", "Willkommen "..name, x1, y2+5, 1400, 125, "register_close_windows", true, true , true, true , true)
	--------------------------------------------------------------------------------------------------------------------------------------------------------
	register = playSound("http://www.iloveradio.de/ilovexmas.m3u") 
    setSoundVolume(register, 0.031) 
    --------------------------------------------------------------------------------------------------------------------------------------------------------

    --vnxDrawText("password_text","Password_Text","Password",x1+50,y2+20, 200, 300, tocolor(0, 105, 145, 255), 1, "pricedown", "center", "center") -- PW_Text 
    --------------------------------------------------------------------------------------------------------------------------------------------------------
    vnxDrawEdit("password","edit","Passwort hier eintippen",x1+50,y2+45,200,true,true) -- PW Edit
    --------------------------------------------------------------------------------------------------------------------------------------------------------

    --vnxDrawText("password_wdh_text","Password_Text","Password Wiederholen",x-70,y-100, 300, 300, tocolor(0, 105, 145, 255), 1, "pricedown", "center", "center") -- PW_Text 

    --------------------------------------------------------------------------------------------------------------------------------------------------------

   	vnxDrawEdit("password_wdh","edit","Passwort Wiederholen",x1+50,y2+85,200,true,true) -- PW Wiederholen
    
    --------------------------------------------------------------------------------------------------------------------------------------------------------

    vnxDrawEdit("email_edit","edit","E-Mail hier eintippen",x1+350,y2+45,200,true,true) -- E-Mail

    --------------------------------------------------------------------------------------------------------------------------------------------------------

    --vnxDrawText("email_edit_text","Email_text", "E-Mail",x+230,y-190, 300, 300, tocolor(0, 105, 145, 255), 1, "pricedown", "center", "center") -- PW_Text 

    --------------------------------------------------------------------------------------------------------------------------------------------------------
    vnxDrawButton("register_btn", "Hilfe_Button", "Register", x1 + 630 , y2+60, 90, 40, "abfrage_register")
    --------------------------------------------------------------------------------------------------------------------------------------------------------
    vnxDrawButton("m_btn", "Hilfe_Button", "Männlich", x1 + 370, y2+75, 70, 30, "m_btnfunc")
    --------------------------------------------------------------------------------------------------------------------------------------------------------
    vnxDrawButton("w_btn", "Hilfe_Button", "Weiblich", x1 + 450, y2+75, 70, 30, "w_btnfunc")

end)




local maleSkins = {1, 2, 7, 14, 15, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 32, 33, 34, 35, 36, 37, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 57, 58, 59, 60, 61, 62, 66, 67, 68, 71, 72, 73, 78, 79, 80, 81, 82, 83, 84, 94, 95, 96, 97, 98, 99, 100, 101, 108, 109, 110, 122, 128, 132, 133, 134, 135, 136, 137, 142, 143, 144, 146, 147, 153, 154, 155, 156, 158, 159, 160, 161, 162, 167, 168, 170, 171, 176, 177, 179, 180, 182, 183, 184, 185, 187, 189, 200, 202, 203, 204, 206, 209, 210, 212, 213, 217, 220, 221, 222, 223, 227, 228, 229, 230, 234, 235, 236, 239, 240, 241, 242, 249, 250, 252, 253, 255, 258, 259, 261, 262, 264, 269, 270, 271, 291, 302, 303, 306, 307, 310}
local femaleSkins = {9, 10, 11, 12, 13, 31, 38, 39, 40, 41, 53, 54, 55, 56, 63, 64, 69, 75, 76, 77, 85, 87, 88, 89, 90, 91, 92, 93, 129, 130, 131, 138, 139, 140, 141, 145, 148, 150, 151, 152, 157, 169, 172, 178, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 201, 205, 207, 211, 214, 215, 216, 218, 219, 225, 226, 231, 232, 233, 238, 243, 244, 245, 246, 251, 256, 257, 263 }



function abfrage_register()
    local name = getPlayerName(getLocalPlayer())
    local password1 = vnxGetEditText("password", "edit")
    local password2 = vnxGetEditText("password_wdh", "edit")  
    local email = vnxGetEditText("email_edit", "edit")
    date = "nil"
    advertiser = "nil"
    local email2 = "E-Mail hier eintippen"
    local geschlecht0 = 0
    local geschlecht1 = 1
    if password1 == password2 then
        if email == email2 then
            infobox_start_func("Ungültige E-Mail.", 7500 )
        else 
        	if geschlechtnewvnx == 0 then 
	            --triggerServerEvent ( "register", lp, hash ( "sha512", password1 ), "", email, "" )
	            triggerServerEvent ( "register", lp, hash ( "sha512", password1 ), date, email, advertiser)
	            vnxDestroyWindow("register_main_window")
	            vnxDestroyWindow("password_text")
	            vnxDestroyWindow("password")
	            vnxDestroyWindow("password_wdh_text")
	            vnxDestroyWindow("password_wdh")
	            vnxDestroyWindow("email_edit")
	            vnxDestroyWindow("email_edit_text")
	            vnxDestroyWindow("register_btn")
	           	vnxDestroyWindow("m_btn")
	            vnxDestroyWindow("w_btn")
	            vnxDestroyWindow("greenV")
	            showCursor( false )
	           	local rnd = math.random ( 1, #maleSkins )
				setElementModel( getLocalPlayer(  ), maleSkins[rnd])
				setPlayerHudComponentVisible( "all", false )
				setPlayerHudComponentVisible( "radar", true )
				setPlayerHudComponentVisible( "crosshair", true )
            else
	           	triggerServerEvent ( "register", lp, hash ( "sha512", password1 ), date, email, advertise)
	            vnxDestroyWindow("register_main_window")
	            vnxDestroyWindow("password_text")
	            vnxDestroyWindow("password")
	            vnxDestroyWindow("password_wdh_text")
	            vnxDestroyWindow("password_wdh")
	            vnxDestroyWindow("email_edit")
	            vnxDestroyWindow("email_edit_text")
	            vnxDestroyWindow("register_btn")
	            vnxDestroyWindow("m_btn")
	            vnxDestroyWindow("w_btn")
	            vnxDestroyWindow("greenV")
	            showCursor( false )
	            local rnd = math.random ( 1, #femaleSkins )
				setElementModel( getLocalPlayer(  ), femaleSkins[rnd])
				setPlayerHudComponentVisible( "all", false )
				setPlayerHudComponentVisible( "radar", true )
				setPlayerHudComponentVisible( "crosshair", true )
	        end
        end    
    else
        infobox_start_func("Die beiden Passwörter stimmen nicht überein!", 7500 )
    end
end


addEventHandler ( "DisableRegisterGui", root, function ( )

stopSound( register )
showChat(true)
showCursor( false )

end )