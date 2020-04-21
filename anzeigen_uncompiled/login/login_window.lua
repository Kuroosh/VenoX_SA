
local moov = 0
local object1, object2
function isPedAiming ( ped )

	if getLocalPlayer then
		return getPedControlState ( ped, "aim_weapon" )
	else
		return getPedControlState ( ped, "aim_weapon" )
	end
	return false
end

function smoothMoveCamera ( x1, y1, z1, x1t, y1t, z1t, x2, y2, z2, x2t, y2t, z2t, time )
	if(moov == 1) then return end
	object1 = createObject ( 1337, x1, y1, z1 )
	object2 = createObject ( 1337, x1t, y1t, z1t )
	setElementAlpha ( object1, 0 )
	setElementAlpha ( object2, 0 )
	setObjectScale(object1, 0)
	setObjectScale(object2, 0)
	moveObject ( object1, time, x2, y2, z2, 0, 0, 0, "InOutQuad" )
	moveObject ( object2, time, x2t, y2t, z2t, 0, 0, 0, "InOutQuad" )
	
	addEventHandler ( "onClientRender", getRootElement(), camRender )
	moov = 1
	setTimer ( removeCamHandler, time, 1 )
	setTimer ( destroyElement, time, 1, object1 )
	setTimer ( destroyElement, time, 1, object2 )
end

function removeCamHandler ()
	moov = 0
	removeEventHandler ( "onClientRender", getRootElement(), camRender )
end

function camRender ()

	local x1, y1, z1 = getElementPosition ( object1 )
	local x2, y2, z2 = getElementPosition ( object2 )
	setCameraMatrix ( x1, y1, z1, x2, y2, z2 )

end



local player = getLocalPlayer()
local cur_cam_pos = 1
local cur_cam_pos_timer


function ShowInfoWindow ()
	infobox_start_func("\nHerzlich Willkommen\nauf VenoX Reallife!!", 7500 )
end


function startedTheResource ()
	for i = 1, 100 do
		outputChatBox (" ")
	end
	setTimer ( ShowInfoWindow, 1000, 1 )
	triggerServerEvent ( "regcheck", getLocalPlayer(), getLocalPlayer() )
end

addEventHandler('cdn:onClientReady', root, startedTheResource)



function vnxskinsavelogin(pl,skinid)
	fileDelete("anzeigen/login/assets.vnx")
	if not fileExists ( "anzeigen/login/assets.vnx") then
		fileCreate ( "anzeigen/login/assets.vnx" )
	end
	skinidviewlogin = fileOpen ( "anzeigen/login/assets.vnx")
	local filesize = fileGetSize ( skinidviewlogin )
	fileSetPos ( skinidviewlogin, filesize )
	local time = getRealTime()
	--datum zweck betrag
	local skinidforlogin = getPedSkin(getLocalPlayer())
	fileWrite ( skinidviewlogin, skinidforlogin )
	fileClose ( skinidviewlogin )
end

function SkinIDForLogin ()
local file = fileCreate ( "anzeigen/login/assets.txt" )
				 fileWrite ( file, ""..getPedSkin(getLocalPlayer()))
				 fileClose ( file )
end
addEvent ( "SkinIDForLogin", true )
addEventHandler ("SkinIDForLogin", getRootElement(), SkinIDForLogin )




function login_close()
	--outputChatBox("du darfst das login nicht schliessen")
	infobox_start_func("Fehler : Du kannst das Log-In nicht \nSchliessen ! ", 7500 )
	playSoundFrontEnd ( 42 )

end

function hilfe_close()
	vnxDestroyWindow("hilfe_window_main")
	vnxDestroyWindow("pw_lost_btn" )
end


local dxfont0_drugs = dxCreateFont(":VenoX/fonts/drugs.ttf", 19)
local dxfont1_drugs = dxCreateFont(":VenoX/fonts/drugs.ttf", 10)
local dxfont2_drugs = dxCreateFont(":VenoX/fonts/drugs.ttf", 13)
local dxfont3_RobotoThin = dxCreateFont(":VenoX/fonts/Roboto-Thin.ttf", 10)

local cam_pos = {
	{-2003.1451416016, 994.40289306641, 75.748260498047, -1967.6363525391, 903.46746826172, 54.071701049805},
	{-1487.1851806641, 959.185546875, 47.184825897217, -1543.9299316406, 879.21813964844, 27.557083129883},
	{-1527.9423828125, 743.83679199219, 24.552722930908, -1616.470703125, 697.46551513672, 21.025955200195},
	{-1714.9029541016, 734.49957275391, 43.880352020264, -1632.3620605469, 682.16387939453, 22.715166091919},
	{-1613.1927490234, 392.39205932617, 94.868537902832, -1582.0834960938, 486.4758605957, 81.435302734375},
	{-1734.1821289063, -68.189117431641, 61.877647399902, -1806.2397460938, 0.21225738525391, 50.52222442627},
	{-2205.2971191406, -319.54095458984, 93.928131103516, -2155.7709960938, -237.74501037598, 64.660499572754},
	{-2211.9077148438, 217.99597167969, 91.279426574707, -2296.6184082031, 176.53701782227, 58.034015655518},
	{-2421.2731933594, 77.858360290527, 41.524158477783, -2518.4978027344, 95.378410339355, 26.019008636475},
	{-2732.9562988281, 36.468860626221, 35.596424102783, -2665.3347167969, 109.25875854492, 24.241016387939},
	{-2305.4050292969, 721.41198730469, 149.51162719727, -2234.2507324219, 658.73547363281, 117.75141143799},
	{-2068.4306640625, 774.38671875, 115.21590423584, -2005.0228271484, 840.52648925781, 75.153785705566}
}
function setToNextLoginCam()
	cur_cam_pos = cur_cam_pos+1
	if(cur_cam_pos > #cam_pos) then cur_cam_pos = 1 end 
	local x, y, z, x2, y2, z2 = cam_pos[cur_cam_pos][1], cam_pos[cur_cam_pos][2], cam_pos[cur_cam_pos][3], cam_pos[cur_cam_pos][4], cam_pos[cur_cam_pos][5], cam_pos[cur_cam_pos][6]
	local x3, y3, z3, x4, y4, z4 = getCameraMatrix()
	smoothMoveCamera(x3, y3, z3, x4, y4, z4, x, y, z, x2, y2, z2, 20000)
end


	addEvent("ShowLoginWindow", true)
	addEventHandler("ShowLoginWindow", root, function()
	local name = getPlayerName( player )

	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	guiSetInputMode("allow_binds")
	showCursor( true)
	showChat( false )
   	fadeCamera ( true, 3.0)


	function show_login_window()
		if(isTimer(cur_cam_pos_timer)) then
			killTimer(cur_cam_pos_timer)
		end
		local rand = math.random(1, #cam_pos)
		cur_cam_pos = rand
		local x, y, z, x2, y2, z2 = cam_pos[rand][1], cam_pos[rand][2], cam_pos[rand][3], cam_pos[rand][4], cam_pos[rand][5], cam_pos[rand][6]
		setCameraMatrix(x, y, z, x2, y2, z2)
		setToNextLoginCam()
		cur_cam_pos_timer = setTimer(setToNextLoginCam, 20000, 1)
		--local login_image = getPedSkin(getLocalPlayer())
		if fileExists ( "anzeigen/login/assets.txt" ) then
			local file = fileOpen ( "anzeigen/login/assets.txt" )
			statusskinid = fileRead ( file, fileGetSize ( file ) )
			fileClose ( file )
			--outputDebugString(getPlayerName(getLocalPlayer()).." skin wurde geladen, skin NR : "..statusskinid)
		else 
			statusskinid = 0 
		end

		local screenX, screenY = guiGetScreenSize()
		local sx, sy = screenX/1366, screenY/768


        dxDrawText("Login", sx, sy, sx*1366, sy*50, tocolor(255, 255, 255, 255), 1.00, dxfont0_drugs, "center", "center", false, false, false, false, false)
        dxDrawText("Changelog´s", sx*10 - 1, sy*159 - 1, sx*280 - 1, sy*205 - 1, tocolor(0, 0, 0, 255), 1.00, "pricedown", "center", "center", false, false, false, false, false)
        dxDrawText("Changelog´s", sx*10 + 1, sy*159 - 1, sx*280 + 1, sy*205 - 1, tocolor(0, 0, 0, 255), 1.00, "pricedown", "center", "center", false, false, false, false, false)
        dxDrawText("Changelog´s", sx*10 - 1, sy*159 + 1, sx*280 - 1, sy*205 + 1, tocolor(0, 0, 0, 255), 1.00, "pricedown", "center", "center", false, false, false, false, false)
        dxDrawText("Changelog´s", sx*10 + 1, sy*159 + 1, sx*280 + 1, sy*205 + 1, tocolor(0, 0, 0, 255), 1.00, "pricedown", "center", "center", false, false, false, false, false)
        dxDrawText("Changelog´s", sx*10, sy*159, sx*280, sy*205, tocolor(255, 255, 255, 255), 1.00, "pricedown", "center", "center", false, false, false, false, false)
        dxDrawText(" 16.03.2019\n ---------------\n + Update 4.3.5.  \n\n + Krankenhaus Neu. \n\n + Klick System auf Spieler neu. \n\n + /fortnitedance [1-13] Neu!!. \n\n + Lorenzo eingefügt. \n\n + Neue Carmods. \n\n + Bug Fixes", sx*12, sy*209, sx*280, sy*476, tocolor(255, 255, 255, 255), 1.00, dxfont1_drugs, "left", "top", false, false, false, false, false)
        dxDrawText("Willkommen zurück "..getPlayerName(getLocalPlayer()), sx*460, sy*165, sx*910, sy*199, tocolor(255, 255, 255, 255), 1.00, dxfont2_drugs, "center", "center", false, false, false, false, false)
        dxDrawImage(sx*623, sy*213, sx*120, sy*120, tostring("anzeigen/login/images/skins/"..statusskinid..".png"))
        dxDrawText("Bitte gib hier dein Passwort ein.", sx*460, sy*343, sx*910, sy*377, tocolor(255, 255, 255, 255), 1.00, dxfont1_drugs, "center", "center", false, false, false, false, false)
	end
	addEventHandler("onClientRender", root, show_login_window)

	--local rn = math.random(1 ,8)
	--local cameraMatrix = loginpos[rn]
	--setCameraMatrix( cameraMatrix[1], cameraMatrix[2], cameraMatrix[3], cameraMatrix[4], cameraMatrix[5], cameraMatrix[6])
	--outputDebugString(""..cameraMatrix[1].." "..cameraMatrix[2].." "..cameraMatrix[3].." "..cameraMatrix[4].." "..cameraMatrix[5].." "..cameraMatrix[6].." ")
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	bindKey ( "enter", "down", abfrage )	
	vnxDrawRectangle("login_window_1", "login_window",sx, sy, sx*1366, sy*50, tocolor(0, 0, 0, 120))
	vnxDrawRectangle("login_window_2", "login_window",sx*460, sy*165, sx*450, sy*320, tocolor(0, 0, 0, 120))
	--executeCommandHandler("snow")
	vnxDrawRectangle("login_window_3", "login_window",sx*0, sy*0, sx*1366, sy*3, tocolor(0, 105, 145, 255))
	vnxDrawRectangle("login_window_4", "login_window",sx*10, sy*159, sx*270, sy*320, tocolor(0, 0, 0, 120))
	vnxDrawRectangle("login_window_5", "login_window",sx*10, sy*206, sx*270, sy*3, tocolor(0, 105, 145, 255))
	vnxDrawRectangle("login_window_6", "login_window",sx*7, sy*156, sx*276, sy*3, tocolor(0, 105, 145, 255))
	vnxDrawRectangle("login_window_7", "login_window",sx*280, sy*159, sx*3, sy*320, tocolor(0, 105, 145, 255))
	vnxDrawRectangle("login_window_8", "login_window",sx*7, sy*159, sx*3, sy*320, tocolor(0, 105, 145, 255))
	vnxDrawRectangle("login_window_9", "login_window",sx*4, sy*476, sx*276, sy*3, tocolor(0, 105, 145, 255))
	vnxDrawRectangle("login_window_10", "login_window",sx*460, sy*161, sx*450, sy*4, tocolor(0, 105, 145, 255))
	vnxDrawRectangle("login_window_11", "login_window",sx*460, sy*199, sx*450, sy*4, tocolor(0, 105, 145, 120))
	vnxDrawImage("pass_view_login_off", "Einfach ein Lutscher", sx*767, sy*386, sx*25, sy*25, ":VenoX/anzeigen/login/images/pass_view", "pass_view_login_on")

	vnxDrawEdit("edit_password_login_window","edit", "", sx*600, sy*387, sx*165, true, true)
	vnxSetEditMasked("edit_password_login_window", "edit", true)
	vnxDrawButtonColored("einloggen_button_login", "Einlogg Func", "Einloggen", sx*623, sy*428, sx*120, sy*40, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,255,255), "abfrage")
	vnxDrawButtonColored("info_button_login", "Info Func", "Information", sx*470, sy*429, sx*120, sy*40, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,255,255), "show_info_window_login")
	vnxDrawButtonColored("hilfe_button_login", "Hilfe Func", "Hilfe", sx*780, sy*429, sx*120, sy*40, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,255,255), "show_help_window_login")
	setPlayerHudComponentVisible( "radar", false )

	loginsound1 = playSound("https://www.venox-reallife.com/kellerodercockschelle.mp3") 
	setSoundVolume(loginsound1, 0.05) 

end)
local dxfont0_RobotoThin = dxCreateFont(":VenoX/fonts/Roboto-Thin.ttf", 10)
local dxfont1_drugs = dxCreateFont(":VenoX/fonts/drugs.ttf", 19)
local dxfont2_drugs = dxCreateFont(":VenoX/fonts/drugs.ttf", 10)
local dxfont3_drugs = dxCreateFont(":VenoX/fonts/drugs.ttf", 9)

function pass_view_login_on()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	vnxDestroyWindow("pass_view")
	vnxDestroyWindow("pass_view_login_off")
	vnxSetEditMasked("edit_password_login_window", "edit", false)
	vnxDrawImage("pass_view_login_on", "Einfach ein Lutscher", sx*767, sy*386, sx*25, sy*25, ":VenoX/anzeigen/login/images/eye_closed", "pass_view_login_off")
	playSoundFrontEnd ( 2 )
end

function pass_view_login_off()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	vnxDestroyWindow("pass_view")
	vnxDestroyWindow("pass_view_login_on")
	vnxSetEditMasked("edit_password_login_window", "edit", true)
	vnxDrawImage("pass_view_login_off", "Einfach ein Lutscher", sx*767, sy*386, sx*25, sy*25, ":VenoX/anzeigen/login/images/pass_view", "pass_view_login_on")
	playSoundFrontEnd ( 1 )
end


function information_window_login()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	close_help_window_login()
	dxDrawRectangle(sx*1125, sy*179, sx*231, sy*282, tocolor(0, 0, 0, 120), false)
	dxDrawText("Unseren Teamspeak 3,\nfindest du unter : ", sx*1125 - 1, sy*224 - 1, sx*1356 - 1, sy*255 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont0_RobotoThin, "center", "center", false, false, false, false, false)
	dxDrawText("Unseren Teamspeak 3,\nfindest du unter : ", sx*1125 + 1, sy*224 - 1, sx*1356 + 1, sy*255 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont0_RobotoThin, "center", "center", false, false, false, false, false)
	dxDrawText("Unseren Teamspeak 3,\nfindest du unter : ", sx*1125 - 1, sy*224 + 1, sx*1356 - 1, sy*255 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont0_RobotoThin, "center", "center", false, false, false, false, false)
	dxDrawText("Unseren Teamspeak 3,\nfindest du unter : ", sx*1125 + 1, sy*224 + 1, sx*1356 + 1, sy*255 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont0_RobotoThin, "center", "center", false, false, false, false, false)
	dxDrawText("Unseren Teamspeak 3,\nfindest du unter : ", sx*1125, sy*224, sx*1356, sy*255, tocolor(255, 255, 255, 255), 1.00, dxfont0_RobotoThin, "center", "center", false, false, false, false, false)
	dxDrawText("Unser Forum, \n kannst du erreichen unter :", sx*1125 - 1, sy*296 - 1, sx*1356 - 1, sy*327 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont0_RobotoThin, "center", "center", false, false, false, false, false)
	dxDrawText("Unser Forum, \n kannst du erreichen unter :", sx*1125 + 1, sy*296 - 1, sx*1356 + 1, sy*327 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont0_RobotoThin, "center", "center", false, false, false, false, false)
	dxDrawText("Unser Forum, \n kannst du erreichen unter :", sx*1125 - 1, sy*296 + 1, sx*1356 - 1, sy*327 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont0_RobotoThin, "center", "center", false, false, false, false, false)
	dxDrawText("Unser Forum, \n kannst du erreichen unter :", sx*1125 + 1, sy*296 + 1, sx*1356 + 1, sy*327 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont0_RobotoThin, "center", "center", false, false, false, false, false)
	dxDrawText("Unser Forum, \n kannst du erreichen unter :", sx*1125, sy*296, sx*1356, sy*327, tocolor(255, 255, 255, 255), 1.00, dxfont0_RobotoThin, "center", "center", false, false, false, false, false)
	dxDrawText("Information", sx*1125, sy*179, sx*1356, sy*210, tocolor(255, 255, 255, 255), 1.00, dxfont1_drugs, "center", "center", false, false, false, false, false)
	dxDrawRectangle(sx*1125, sy*210, sx*231, sy*4, tocolor(0, 105, 145, 200), false)
	dxDrawText("ts3.venox-reallife.com", sx*1125, sy*258, sx*1356, sy*289, tocolor(255, 255, 255, 255), 1.00, dxfont2_drugs, "center", "center", false, false, false, false, false)
	dxDrawText("ts3.venox-reallife.com", sx*1125, sy*258, sx*1356, sy*289, tocolor(255, 255, 255, 255), 1.00, dxfont2_drugs, "center", "center", false, false, false, false, false)
	dxDrawText("www.venox-reallife.com", sx*1125, sy*330, sx*1356, sy*361, tocolor(255, 255, 255, 255), 1.00, dxfont2_drugs, "center", "center", false, false, false, false, false)
	dxDrawText("www.venox-reallife.com", sx*1125, sy*330, sx*1356, sy*361, tocolor(255, 255, 255, 255), 1.00, dxfont2_drugs, "center", "center", false, false, false, false, false)
	dxDrawRectangle(sx*1167, sy*255, sx*148, sy*3, tocolor(0, 105, 145, 200), false)
	dxDrawRectangle(sx*1167, sy*327, sx*148, sy*3, tocolor(0, 105, 145, 200), false)
	dxDrawText("Unser Controlpanel, \n kannst du erreichen unter :", sx*1125 - 1, sy*367 - 1, sx*1356 - 1, sy*398 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont0_RobotoThin, "center", "center", false, false, false, false, false)
	dxDrawText("Unser Controlpanel, \n kannst du erreichen unter :", sx*1125 + 1, sy*367 - 1, sx*1356 + 1, sy*398 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont0_RobotoThin, "center", "center", false, false, false, false, false)
	dxDrawText("Unser Controlpanel, \n kannst du erreichen unter :", sx*1125 - 1, sy*367 + 1, sx*1356 - 1, sy*398 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont0_RobotoThin, "center", "center", false, false, false, false, false)
	dxDrawText("Unser Controlpanel, \n kannst du erreichen unter :", sx*1125 + 1, sy*367 + 1, sx*1356 + 1, sy*398 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont0_RobotoThin, "center", "center", false, false, false, false, false)
	dxDrawText("Unser Controlpanel, \n kannst du erreichen unter :", sx*1125, sy*367, sx*1356, sy*398, tocolor(255, 255, 255, 255), 1.00, dxfont0_RobotoThin, "center", "center", false, false, false, false, false)
	dxDrawRectangle(sx*1167, sy*398, sx*148, sy*3, tocolor(0, 105, 145, 200), false)
	dxDrawText("www.venox-reallife.com/controlpanel", sx*1125, sy*401, sx*1356, sy*432, tocolor(255, 255, 255, 255), 1.00, dxfont3_drugs, "center", "center", false, false, false, false, false)
	dxDrawText("www.venox-reallife.com/controlpanel", sx*1125 - 1, sy*401 - 1, sx*1356 - 1, sy*432 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont3_drugs, "center", "center", false, false, false, false, false)
	dxDrawText("www.venox-reallife.com/controlpanel", sx*1125 + 1, sy*401 - 1, sx*1356 + 1, sy*432 - 1, tocolor(0, 0, 0, 255), 1.00, dxfont3_drugs, "center", "center", false, false, false, false, false)
	dxDrawText("www.venox-reallife.com/controlpanel", sx*1125 - 1, sy*401 + 1, sx*1356 - 1, sy*432 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont3_drugs, "center", "center", false, false, false, false, false)
	dxDrawText("www.venox-reallife.com/controlpanel", sx*1125 + 1, sy*401 + 1, sx*1356 + 1, sy*432 + 1, tocolor(0, 0, 0, 255), 1.00, dxfont3_drugs, "center", "center", false, false, false, false, false)
	dxDrawText("www.venox-reallife.com/controlpanel", sx*1125, sy*401, sx*1356, sy*432, tocolor(255, 255, 255, 255), 1.00, dxfont3_drugs, "center", "center", false, false, false, false, false)

end

function close_info_window_login()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	vnxDestroyWindow("info_button_login_on")
	removeEventHandler("onClientRender", root, information_window_login)
	vnxDrawButtonColored("info_button_login", "Info Func", "Information", sx*470, sy*429, sx*120, sy*40, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,255,255), "show_info_window_login")
end

function show_info_window_login()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	vnxDestroyWindow("info_button_login")
	vnxDrawButtonColored("info_button_login_on", "Info Func", "Schließen", sx*470, sy*429, sx*120, sy*40, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(125,0,0,255), tocolor(175,0,0,255), "close_info_window_login")
	addEventHandler("onClientRender", root, information_window_login)
end


function contact_sucessfull()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	dxDrawText("Ein Admin wurde kontaktiert! \nBitte meld dich auf unserem Ts3 : \n ts3.venox-reallife.com\n damit wir dir weiter helfen können", sx*911 - 1, sy*280 - 1, sx*1202 - 1, sy*409 - 1, tocolor(0, 0, 0, 255), 0.50, "bankgothic", "center", "center", false, false, false, false, false)
	dxDrawText("Ein Admin wurde kontaktiert! \nBitte meld dich auf unserem Ts3 : \n ts3.venox-reallife.com\n damit wir dir weiter helfen können", sx*911 + 1, sy*280 - 1, sx*1202 + 1, sy*409 - 1, tocolor(0, 0, 0, 255), 0.50, "bankgothic", "center", "center", false, false, false, false, false)
	dxDrawText("Ein Admin wurde kontaktiert! \nBitte meld dich auf unserem Ts3 : \n ts3.venox-reallife.com\n damit wir dir weiter helfen können", sx*911 - 1, sy*280 + 1, sx*1202 - 1, sy*409 + 1, tocolor(0, 0, 0, 255), 0.50, "bankgothic", "center", "center", false, false, false, false, false)
	dxDrawText("Ein Admin wurde kontaktiert! \nBitte meld dich auf unserem Ts3 : \n ts3.venox-reallife.com\n damit wir dir weiter helfen können", sx*911 + 1, sy*280 + 1, sx*1202 + 1, sy*409 + 1, tocolor(0, 0, 0, 255), 0.50, "bankgothic", "center", "center", false, false, false, false, false)
	dxDrawText("Ein Admin wurde kontaktiert! \nBitte meld dich auf unserem Ts3 : \n ts3.venox-reallife.com\n damit wir dir weiter helfen können", sx*911, sy*280, sx*1202, sy*409, tocolor(255, 255, 255, 255), 0.50, "bankgothic", "center", "center", false, false, false, false, false)
end


function contact_admins_helpwindow()
	close_info_window_login()
	addEventHandler("onClientRender", root, contact_sucessfull)
	vnxDestroyWindow("admin_help_button_login")
	triggerServerEvent( "contact_admins_help", getLocalPlayer(), getLocalPlayer())
	
end



local dxfont0_drugs = dxCreateFont(":VenoX/fonts/drugs.ttf", 10)
function help_window_login()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	close_info_window_login()
	dxDrawText("Einen Admin zur Hilfe rufen ?", sx*910, sy*256, sx*1203, sy*296, tocolor(255, 255, 255, 255), 1.00, dxfont0_drugs, "center", "top", false, false, false, false, false)
	dxDrawText("Einen Admin zur Hilfe rufen ?", sx*910, sy*256, sx*1203, sy*296, tocolor(255, 255, 255, 255), 1.00, dxfont0_drugs, "center", "top", false, false, false, false, false)
end


function close_help_window_login()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	vnxDestroyWindow("admin_help_window_0")
	vnxDestroyWindow("admin_help_window_1")
	vnxDestroyWindow("admin_help_window_2")
	vnxDestroyWindow("admin_help_button_login")
	vnxDestroyWindow("hilfe_button_login_close")
	removeEventHandler("onClientRender", root, help_window_login)
	removeEventHandler("onClientRender", root, contact_sucessfull)
	vnxDrawButtonColored("hilfe_button_login", "Hilfe Func", "Hilfe", sx*780, sy*429, sx*120, sy*40, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,255,255), "show_help_window_login")
end

function show_help_window_login()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	vnxDestroyWindow("hilfe_button_login")
	close_info_window_login()
	addEventHandler("onClientRender", root, help_window_login)
	vnxDrawRectangle("admin_help_window_0","admin_help_window",sx*910, sy*256, sx*293, sy*162, tocolor(0, 0, 0, 120))
	vnxDrawRectangle("admin_help_window_1","admin_help_window",sx*910, sy*252, sx*293, sy*4, tocolor(0, 105, 145, 120))
	vnxDrawRectangle("admin_help_window_2","admin_help_window",sx*958, sy*277, sx*197, sy*4, tocolor(0, 105, 145, 120))
	vnxDrawButtonColored("admin_help_button_login", "Info Func", "Einen Admin rufen", sx*957, sy*296, sx*200, sy*60, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "contact_admins_helpwindow")
	vnxDrawButtonColored("hilfe_button_login_close", "Info Func", "Schließen", sx*780, sy*429, sx*120, sy*40, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(125,0,0,255), tocolor(175,0,0,255), "close_help_window_login")
end


function abfrage()
	local name = getPlayerName(getLocalPlayer())
	local password = tostring(vnxGetEditText("edit_password_login_window", "edit"))
	if password:len() >= 4 then
		triggerServerEvent ( "einloggen", lp, lp, password )
		playSoundFrontEnd ( 42 )
	elseif password:len() == 0 then
		infobox_start_func("Bitte gib dein Passwort ein.", 7500 )
		playSoundFrontEnd ( 1 )
	end
end


addEvent("destroyLoginWindow", true)
addEventHandler("destroyLoginWindow", root, function()
	stopSound( loginsound1 )
	showChat(true)
	killTimer(cur_cam_pos_timer)
	removeCamHandler ()
	setPlayerHudComponentVisible( "all", false )
	setPlayerHudComponentVisible( "radar", true )
	setPlayerHudComponentVisible( "crosshair", true )
	showCursor(false)
	setPlayerHudComponentVisible("radio", false ) 
	removeEventHandler("onClientRender", root, show_login_window)
	vnxDestroyWindow("hilfe_button_login_close")
	vnxDestroyWindow("edit_password_login_window")
	vnxDestroyWindow("einloggen_button_login")
	vnxDestroyWindow("info_button_login")
	vnxDestroyWindow("hilfe_button_login")
	vnxDestroyWindow("login_window")
	vnxDestroyWindow("login_window_1")
	vnxDestroyWindow("login_window_2")
	vnxDestroyWindow("login_window_3")
	vnxDestroyWindow("login_window_4")
	vnxDestroyWindow("login_window_5")
	vnxDestroyWindow("login_window_6")
	vnxDestroyWindow("login_window_7")
	vnxDestroyWindow("login_window_8")
	vnxDestroyWindow("login_window_9")
	vnxDestroyWindow("login_window_10")
	vnxDestroyWindow("login_window_11")
	vnxDestroyWindow("info_button_login_on")
	vnxDestroyWindow("admin_help_button_login")
	vnxDestroyWindow("pass_view_login_on")
	vnxDestroyWindow("pass_view_login_off")
	vnxDestroyWindow("admin_help_window_0")
	vnxDestroyWindow("admin_help_window_1")
	vnxDestroyWindow("admin_help_window_2")
	vnxDestroyWindow("admin_help_button_login")
	vnxDestroyWindow("hilfe_button_login_close")
	removeEventHandler("onClientRender", root, contact_sucessfull)
	removeEventHandler("onClientRender", root, information_window_login)
	removeEventHandler("onClientRender", root, help_window_login)
	local vnxhud = tonumber(getElementData( getLocalPlayer(), "hud"))
	triggerEvent( "showhudclient", getLocalPlayer(), vnxhud)
	local showcrosshairclient = tonumber(getElementData( getLocalPlayer(), "crosshair"))
	triggerEvent( "trigger_crosshair_vnx", getLocalPlayer(), getLocalPlayer(), showcrosshairclient)
	setElementData(player, "selfopen", 0)
	--fileDelete("anzeigen/login/assets.vnx")
	unbindKey ( "enter", "down", abfrage )
	SkinIDForLogin()
	--setTimer(function()
		--triggerServerEvent ( "loadpaintjobafterlogin", getLocalPlayer(), getLocalPlayer())
	--end, 5000, 1)
end)







