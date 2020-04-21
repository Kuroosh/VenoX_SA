------------------------
---- By VenoX RL Crew &--
---- Solid_Snake -------
------------------------


local player = getLocalPlayer()
local screenx, screeny = guiGetScreenSize()
-------------------------------------------------------------------------------------------------------------------------------------------------------------
function settings_close_wmain()
	vnxDestroyWindow("settings_window_main")
	vnxDestroyWindow("button_background")
	vnxDestroyWindow("anzeigen_button")
	vnxDestroyWindow("hudvorschau")
	vnxDestroyWindow("hud_1")
	vnxDestroyWindow("hud_2")
	vnxDestroyWindow("hud_3")
	vnxDestroyWindow("hud_4")
	vnxDestroyWindow("settings_window_main_anzeigen")
	vnxDestroyWindow("settings_window_main_sounds")
	vnxDestroyWindow("settings_window_main_account")
	vnxDestroyWindow("settings_window_main_vnxpoints")
	vnxDestroyWindow("settings_window_main_teamspeak3")
	vnxDestroyWindow("settings_window_main_information")
	vnxDestroyWindow("hud_text_settings")


	vnxDestroyWindow("settings_window_main")
    vnxDestroyWindow("fraktions_window_main")
    vnxDestroyWindow("informations_window_main")
    vnxDestroyWindow("stats_window_main")
    vnxDestroyWindow("handy_window_main")
	vnxDestroyWindow("support_window_main")

	vnxDestroyWindow("crosshairvorschau")
	vnxDestroyWindow("crosshair_text_settings")
	junk_crosshairshit()
    

	--executeCommandHandler("self")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Crosshair_Text_Font = dxCreateFont(":venox/fonts/arial.ttf", 10)
function anzeigen_window_settings()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	vnxDestroyWindow("hud_1")
	vnxDestroyWindow("hud_2")
	vnxDestroyWindow("hud_3")
	vnxDestroyWindow("hud_4")
	vnxDestroyWindow("crosshairvorschau")
	vnxDestroyWindow("crosshair_text_settings")
	junk_crosshairshit()
	vnxDrawImage("hudvorschau","hud_1",sx*480,sy*245,sx*180,sy*100,":VenoX/anzeigen/settings/images/hudvorschau","hud_window_settings")
	vnxDrawText("hud_text_settings","HUD Auswahl","HUD Auswählen",sx*450,sy*255, sx*250, sy*200, tocolor(255, 255, 255, 255), 1.3, Crosshair_Text_Font, "center", "center") -- hud_settings_text amk (text)


	vnxDrawImage("crosshairvorschau","hud_1",sx*710,sy*245,sx*180,sy*100,":VenoX/anzeigen/settings/images/crosshair_background","crosshair_window_settings")
	vnxDrawText("crosshair_text_settings","Crosshair Auswahl","Crosshair Auswählen",sx*630,sy*255, sx*350, sy*200, tocolor(255, 255, 255, 255), 1.3, Crosshair_Text_Font, "center", "center")
end


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function sound_window_settings()
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	vnxDestroyWindow("hudvorschau")
	vnxDestroyWindow("hud_1")
	vnxDestroyWindow("hud_2")
	vnxDestroyWindow("hud_3")
	vnxDestroyWindow("hud_4")
	vnxDestroyWindow("hud_text_settings")


	vnxDestroyWindow("crosshairvorschau")
	vnxDestroyWindow("crosshair_text_settings")
	junk_crosshairshit()

	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function account_window_settings()
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	vnxDestroyWindow("hudvorschau")
	vnxDestroyWindow("hud_1")
	vnxDestroyWindow("hud_2")
	vnxDestroyWindow("hud_3")
	vnxDestroyWindow("hud_4")
	vnxDestroyWindow("hud_text_settings")


	vnxDestroyWindow("crosshairvorschau")
	vnxDestroyWindow("crosshair_text_settings")
	junk_crosshairshit()
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function vnx_points_settings()
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	vnxDestroyWindow("hudvorschau")
	vnxDestroyWindow("hud_1")
	vnxDestroyWindow("hud_2")
	vnxDestroyWindow("hud_3")
	vnxDestroyWindow("hud_4")
	vnxDestroyWindow("hud_text_settings")


	vnxDestroyWindow("crosshairvorschau")
	vnxDestroyWindow("crosshair_text_settings")
	junk_crosshairshit()
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function teamspeak3_window_settings()
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	vnxDestroyWindow("hudvorschau")
	vnxDestroyWindow("hud_1")
	vnxDestroyWindow("hud_2")
	vnxDestroyWindow("hud_3")
	vnxDestroyWindow("hud_4")
	vnxDestroyWindow("hud_text_settings")


	vnxDestroyWindow("crosshairvorschau")
	vnxDestroyWindow("crosshair_text_settings")
	junk_crosshairshit()
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function information_window_settings()
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	vnxDestroyWindow("hudvorschau")
	vnxDestroyWindow("hud_1")
	vnxDestroyWindow("hud_2")
	vnxDestroyWindow("hud_3")
	vnxDestroyWindow("hud_4")
	vnxDestroyWindow("hud_text_settings")


	vnxDestroyWindow("crosshairvorschau")
	vnxDestroyWindow("crosshair_text_settings")
	junk_crosshairshit()
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function crosshairapply1()
	 local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(1).png")
	 local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
	 local name = getPlayerName(getLocalPlayer())
	 local screenX, screenY = guiGetScreenSize()
	 local sx, sy = screenX/1366, screenY/768
	dxSetShaderValue ( shader, "gTexture", texture )
	engineApplyShaderToWorldTexture ( shader, "sitem16")
	outputDebugString(name.." hat Das erste Crosshair ausgewaehlt")

	vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*454,sy*248,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*454,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*454,sy*316,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*524,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	triggerServerEvent( "crosshair_trigger_1", getLocalPlayer(), getLocalPlayer())
end
function crosshairapply2()
	local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(2).png")
	local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
	local name = getPlayerName(getLocalPlayer())
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
		dxSetShaderValue ( shader, "gTexture", texture )
		engineApplyShaderToWorldTexture ( shader, "sitem16")
	outputDebugString(name.." hat Das zweite Crosshair ausgewaehlt")
	
	vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*544,sy*248,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*544,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*544,sy*316,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*614,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	triggerServerEvent( "crosshair_trigger_2", getLocalPlayer(), getLocalPlayer())
end
function crosshairapply3()
	local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(3).png")
	local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
	local name = getPlayerName(getLocalPlayer())
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
		dxSetShaderValue ( shader, "gTexture", texture )
		engineApplyShaderToWorldTexture ( shader, "sitem16")
	outputDebugString(name.." hat Das dritte Crosshair ausgewaehlt")
	
	vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*644,sy*248,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*644,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*644,sy*316,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*714,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	triggerServerEvent( "crosshair_trigger_3", getLocalPlayer(), getLocalPlayer())
end
function crosshairapply4()
	local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(4).png")
	local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
	local name = getPlayerName(getLocalPlayer())
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
		dxSetShaderValue ( shader, "gTexture", texture )
		engineApplyShaderToWorldTexture ( shader, "sitem16")
	outputDebugString(name.." hat Das vierte Crosshair ausgewaehlt")
	
	vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*744,sy*248,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*744,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*744,sy*316,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*814,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	triggerServerEvent( "crosshair_trigger_4", getLocalPlayer(), getLocalPlayer())
end
function crosshairapply5()
	local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(5).png")
	local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
	local name = getPlayerName(getLocalPlayer())
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
		dxSetShaderValue ( shader, "gTexture", texture )
		engineApplyShaderToWorldTexture ( shader, "sitem16")
	outputDebugString(name.." hat Das fünfte Crosshair ausgewaehlt")
	
	vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*844,sy*248,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*844,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*844,sy*316,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*914,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	triggerServerEvent( "crosshair_trigger_5", getLocalPlayer(), getLocalPlayer())
end
------------------------------------------------------------------------------------------------------------------------------
function crosshairapply6()
	local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(6).png")
	local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
	local name = getPlayerName(getLocalPlayer())
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
   dxSetShaderValue ( shader, "gTexture", texture )
   engineApplyShaderToWorldTexture ( shader, "sitem16")
   outputDebugString(name.." hat Das sechste Crosshair ausgewaehlt")

   vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*454,sy*348,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*454,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*454,sy*416,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*524,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   triggerServerEvent( "crosshair_trigger_6", getLocalPlayer(), getLocalPlayer())
end
------------------------------------------------------------------------------------------------------------------------------
function crosshairapply7()
   local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(7).png")
   local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
   local name = getPlayerName(getLocalPlayer())
   local screenX, screenY = guiGetScreenSize()
   local sx, sy = screenX/1366, screenY/768
	   dxSetShaderValue ( shader, "gTexture", texture )
	   engineApplyShaderToWorldTexture ( shader, "sitem16")
   outputDebugString(name.." hat Das siebte Crosshair ausgewaehlt")
   
   vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*544,sy*348,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*544,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*544,sy*416,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*614,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   triggerServerEvent( "crosshair_trigger_7", getLocalPlayer(), getLocalPlayer())
end
------------------------------------------------------------------------------------------------------------------------------
function crosshairapply8()
   local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(8).png")
   local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
   local name = getPlayerName(getLocalPlayer())
   local screenX, screenY = guiGetScreenSize()
   local sx, sy = screenX/1366, screenY/768
	   dxSetShaderValue ( shader, "gTexture", texture )
	   engineApplyShaderToWorldTexture ( shader, "sitem16")
   outputDebugString(name.." hat Das achte Crosshair ausgewaehlt")
   
   vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*644,sy*348,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*644,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*644,sy*416,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*714,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   triggerServerEvent( "crosshair_trigger_8", getLocalPlayer(), getLocalPlayer())
end
------------------------------------------------------------------------------------------------------------------------------
function crosshairapply9()
   local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(9).png")
   local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
   local name = getPlayerName(getLocalPlayer())
   local screenX, screenY = guiGetScreenSize()
   local sx, sy = screenX/1366, screenY/768
	   dxSetShaderValue ( shader, "gTexture", texture )
	   engineApplyShaderToWorldTexture ( shader, "sitem16")
   outputDebugString(name.." hat Das neunte Crosshair ausgewaehlt")
   
   vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*744,sy*348,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*744,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*744,sy*416,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*814,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   triggerServerEvent( "crosshair_trigger_9", getLocalPlayer(), getLocalPlayer())
end
------------------------------------------------------------------------------------------------------------------------------
function crosshairapply10()
	local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(10).png")
	local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
	local name = getPlayerName(getLocalPlayer())
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
		dxSetShaderValue ( shader, "gTexture", texture )
		engineApplyShaderToWorldTexture ( shader, "sitem16")
	outputDebugString(name.." hat Das zehnte Crosshair ausgewaehlt")
	
	vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*843,sy*348,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*843,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*843,sy*416,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*913,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	triggerServerEvent( "crosshair_trigger_10", getLocalPlayer(), getLocalPlayer())
end
-----------------------------------------------------------------------------------------------------------------------------
function crosshairapply11()
	local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(11).png")
	local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
	local name = getPlayerName(getLocalPlayer())
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
		dxSetShaderValue ( shader, "gTexture", texture )
		engineApplyShaderToWorldTexture ( shader, "sitem16")
	outputDebugString(name.." hat Das 11 Crosshair ausgewaehlt")
	
	vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*454,sy*448,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*454,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*454,sy*516,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*524,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	triggerServerEvent( "crosshair_trigger_11",  getLocalPlayer(), getLocalPlayer())
end
------------------------------------------------------------------------------------------------------------------------------
function crosshairapply12()
	local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(12).png")
	local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
	local name = getPlayerName(getLocalPlayer())
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
   dxSetShaderValue ( shader, "gTexture", texture )
   engineApplyShaderToWorldTexture ( shader, "sitem16")
   outputDebugString(name.." hat Das 12 Crosshair ausgewaehlt")

   vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*544,sy*448,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*544,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*544,sy*516,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*614,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   triggerServerEvent( "crosshair_trigger_12", getLocalPlayer(), getLocalPlayer())
end
------------------------------------------------------------------------------------------------------------------------------
function crosshairapply13()
   local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(13).png")
   local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
   local name = getPlayerName(getLocalPlayer())
   local screenX, screenY = guiGetScreenSize()
   local sx, sy = screenX/1366, screenY/768
	   dxSetShaderValue ( shader, "gTexture", texture )
	   engineApplyShaderToWorldTexture ( shader, "sitem16")
   outputDebugString(name.." hat Das 13 Crosshair ausgewaehlt")
   
   vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*644,sy*448,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*644,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*644,sy*516,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*714,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   triggerServerEvent( "crosshair_trigger_13", getLocalPlayer(), getLocalPlayer())
end
------------------------------------------------------------------------------------------------------------------------------
function crosshairapply14()
   local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(14).png")
   local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
   local name = getPlayerName(getLocalPlayer())
   local screenX, screenY = guiGetScreenSize()
   local sx, sy = screenX/1366, screenY/768
	   dxSetShaderValue ( shader, "gTexture", texture )
	   engineApplyShaderToWorldTexture ( shader, "sitem16")
   outputDebugString(name.." hat Das 14 Crosshair ausgewaehlt")
   
   vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*744,sy*448,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*744,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*744,sy*516,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*814,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   triggerServerEvent( "crosshair_trigger_14", getLocalPlayer(), getLocalPlayer())
end
------------------------------------------------------------------------------------------------------------------------------
function crosshairapply15()
   local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(15).png")
   local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
   local name = getPlayerName(getLocalPlayer())
   local screenX, screenY = guiGetScreenSize()
   local sx, sy = screenX/1366, screenY/768
	   dxSetShaderValue ( shader, "gTexture", texture )
	   engineApplyShaderToWorldTexture ( shader, "sitem16")
   outputDebugString(name.." hat Das 15 Crosshair ausgewaehlt")
   
   vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*844,sy*448,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*844,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*844,sy*516,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*914,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   triggerServerEvent( "crosshair_trigger_15", getLocalPlayer(), getLocalPlayer())
end

function crosshairapply16()
	local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(16).png")
	local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
	local name = getPlayerName(getLocalPlayer())
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
   dxSetShaderValue ( shader, "gTexture", texture )
   engineApplyShaderToWorldTexture ( shader, "sitem16")
   outputDebugString(name.." hat Das erste Crosshair ausgewaehlt")

   vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*454,sy*248,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*454,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*454,sy*316,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*524,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   triggerServerEvent( "crosshair_trigger_16", getLocalPlayer(), getLocalPlayer())
end
function crosshairapply17()
   local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(17).png")
   local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
   local name = getPlayerName(getLocalPlayer())
   local screenX, screenY = guiGetScreenSize()
   local sx, sy = screenX/1366, screenY/768
	   dxSetShaderValue ( shader, "gTexture", texture )
	   engineApplyShaderToWorldTexture ( shader, "sitem16")
   outputDebugString(name.." hat Das zweite Crosshair ausgewaehlt")
   
   vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*544,sy*248,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*544,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*544,sy*316,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*614,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   triggerServerEvent( "crosshair_trigger_17", getLocalPlayer(), getLocalPlayer())
end
function crosshairapply18()
   local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(18).png")
   local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
   local name = getPlayerName(getLocalPlayer())
   local screenX, screenY = guiGetScreenSize()
   local sx, sy = screenX/1366, screenY/768
	   dxSetShaderValue ( shader, "gTexture", texture )
	   engineApplyShaderToWorldTexture ( shader, "sitem16")
   outputDebugString(name.." hat Das dritte Crosshair ausgewaehlt")
   
   vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*644,sy*248,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*644,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*644,sy*316,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*714,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   triggerServerEvent( "crosshair_trigger_18", getLocalPlayer(), getLocalPlayer())
end
function crosshairapply19()
   local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(19).png")
   local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
   local name = getPlayerName(getLocalPlayer())
   local screenX, screenY = guiGetScreenSize()
   local sx, sy = screenX/1366, screenY/768
	   dxSetShaderValue ( shader, "gTexture", texture )
	   engineApplyShaderToWorldTexture ( shader, "sitem16")
   outputDebugString(name.." hat Das vierte Crosshair ausgewaehlt")
   
   vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*744,sy*248,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*744,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*744,sy*316,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*814,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   triggerServerEvent( "crosshair_trigger_19", getLocalPlayer(), getLocalPlayer())
end
function crosshairapply20()
   local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(20).png")
   local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
   local name = getPlayerName(getLocalPlayer())
   local screenX, screenY = guiGetScreenSize()
   local sx, sy = screenX/1366, screenY/768
	   dxSetShaderValue ( shader, "gTexture", texture )
	   engineApplyShaderToWorldTexture ( shader, "sitem16")
   outputDebugString(name.." hat Das fünfte Crosshair ausgewaehlt")
   
   vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*844,sy*248,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*844,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*844,sy*316,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*914,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   triggerServerEvent( "crosshair_trigger_20", getLocalPlayer(), getLocalPlayer())
end
------------------------------------------------------------------------------------------------------------------------------
function crosshairapply21()
   local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(21).png")
   local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
   local name = getPlayerName(getLocalPlayer())
   local screenX, screenY = guiGetScreenSize()
   local sx, sy = screenX/1366, screenY/768
  dxSetShaderValue ( shader, "gTexture", texture )
  engineApplyShaderToWorldTexture ( shader, "sitem16")
  outputDebugString(name.." hat Das sechste Crosshair ausgewaehlt")

  vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*454,sy*348,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
  vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*454,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
  vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*454,sy*416,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
  vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*524,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
  triggerServerEvent( "crosshair_trigger_21", getLocalPlayer(), getLocalPlayer())
end
------------------------------------------------------------------------------------------------------------------------------
function crosshairapply22()
  local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(22).png")
  local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
  local name = getPlayerName(getLocalPlayer())
  local screenX, screenY = guiGetScreenSize()
  local sx, sy = screenX/1366, screenY/768
	  dxSetShaderValue ( shader, "gTexture", texture )
	  engineApplyShaderToWorldTexture ( shader, "sitem16")
  outputDebugString(name.." hat Das siebte Crosshair ausgewaehlt")
  
  vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*544,sy*348,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
  vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*544,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
  vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*544,sy*416,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
  vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*614,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
  triggerServerEvent( "crosshair_trigger_22", getLocalPlayer(), getLocalPlayer())
end
------------------------------------------------------------------------------------------------------------------------------
function crosshairapply23()
  local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(23).png")
  local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
  local name = getPlayerName(getLocalPlayer())
  local screenX, screenY = guiGetScreenSize()
  local sx, sy = screenX/1366, screenY/768
	  dxSetShaderValue ( shader, "gTexture", texture )
	  engineApplyShaderToWorldTexture ( shader, "sitem16")
  outputDebugString(name.." hat Das achte Crosshair ausgewaehlt")
  
  vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*644,sy*348,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
  vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*644,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
  vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*644,sy*416,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
  vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*714,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
  triggerServerEvent( "crosshair_trigger_23", getLocalPlayer(), getLocalPlayer())
end
------------------------------------------------------------------------------------------------------------------------------
function crosshairapply24()
  local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(24).png")
  local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
  local name = getPlayerName(getLocalPlayer())
  local screenX, screenY = guiGetScreenSize()
  local sx, sy = screenX/1366, screenY/768
	  dxSetShaderValue ( shader, "gTexture", texture )
	  engineApplyShaderToWorldTexture ( shader, "sitem16")
  outputDebugString(name.." hat Das neunte Crosshair ausgewaehlt")
  
  vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*744,sy*348,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
  vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*744,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
  vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*744,sy*416,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
  vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*814,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
  triggerServerEvent( "crosshair_trigger_24", getLocalPlayer(), getLocalPlayer())
end
------------------------------------------------------------------------------------------------------------------------------
function crosshairapply25()
   local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(25).png")
   local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
   local name = getPlayerName(getLocalPlayer())
   local screenX, screenY = guiGetScreenSize()
   local sx, sy = screenX/1366, screenY/768
	   dxSetShaderValue ( shader, "gTexture", texture )
	   engineApplyShaderToWorldTexture ( shader, "sitem16")
   outputDebugString(name.." hat Das zehnte Crosshair ausgewaehlt")
   
   vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*843,sy*348,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*843,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*843,sy*416,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*913,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   triggerServerEvent( "crosshair_trigger_25", getLocalPlayer(), getLocalPlayer())
end
-----------------------------------------------------------------------------------------------------------------------------
function crosshairapply26()
   local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(26).png")
   local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
   local name = getPlayerName(getLocalPlayer())
   local screenX, screenY = guiGetScreenSize()
   local sx, sy = screenX/1366, screenY/768
	   dxSetShaderValue ( shader, "gTexture", texture )
	   engineApplyShaderToWorldTexture ( shader, "sitem16")
   outputDebugString(name.." hat Das 11 Crosshair ausgewaehlt")
   
   vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*454,sy*448,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*454,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*454,sy*516,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*524,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   triggerServerEvent( "crosshair_trigger_26", getLocalPlayer(), getLocalPlayer())
end
------------------------------------------------------------------------------------------------------------------------------
function crosshairapply27()
   local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(27).png")
   local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
   local name = getPlayerName(getLocalPlayer())
   local screenX, screenY = guiGetScreenSize()
   local sx, sy = screenX/1366, screenY/768
  dxSetShaderValue ( shader, "gTexture", texture )
  engineApplyShaderToWorldTexture ( shader, "sitem16")
  outputDebugString(name.." hat Das 12 Crosshair ausgewaehlt")

  vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*544,sy*448,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
  vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*544,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
  vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*544,sy*516,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
  vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*614,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
  triggerServerEvent( "crosshair_trigger_27", getLocalPlayer(), getLocalPlayer())
end
------------------------------------------------------------------------------------------------------------------------------
function crosshairapply28()
  local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(28).png")
  local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
  local name = getPlayerName(getLocalPlayer())
  local screenX, screenY = guiGetScreenSize()
  local sx, sy = screenX/1366, screenY/768
	  dxSetShaderValue ( shader, "gTexture", texture )
	  engineApplyShaderToWorldTexture ( shader, "sitem16")
  outputDebugString(name.." hat Das 13 Crosshair ausgewaehlt")
  
  vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*644,sy*448,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
  vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*644,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
  vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*644,sy*516,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
  vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*714,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
  triggerServerEvent( "crosshair_trigger_28", getLocalPlayer(), getLocalPlayer())
end
------------------------------------------------------------------------------------------------------------------------------
function crosshairapply29()
  local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(29).png")
  local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
  local name = getPlayerName(getLocalPlayer())
  local screenX, screenY = guiGetScreenSize()
  local sx, sy = screenX/1366, screenY/768
	  dxSetShaderValue ( shader, "gTexture", texture )
	  engineApplyShaderToWorldTexture ( shader, "sitem16")
  outputDebugString(name.." hat Das 14 Crosshair ausgewaehlt")
  
  vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*744,sy*448,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
  vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*744,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
  vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*744,sy*516,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
  vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*814,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
  triggerServerEvent( "crosshair_trigger_29", getLocalPlayer(), getLocalPlayer())
end
------------------------------------------------------------------------------------------------------------------------------
function crosshairapply30()
  local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(30).png")
  local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
  local name = getPlayerName(getLocalPlayer())
  local screenX, screenY = guiGetScreenSize()
  local sx, sy = screenX/1366, screenY/768
	  dxSetShaderValue ( shader, "gTexture", texture )
	  engineApplyShaderToWorldTexture ( shader, "sitem16")
  outputDebugString(name.." hat Das 15 Crosshair ausgewaehlt")
  
  vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*844,sy*448,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
  vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*844,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
  vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*844,sy*516,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
  vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*914,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
  triggerServerEvent( "crosshair_trigger_30", getLocalPlayer(), getLocalPlayer())
end
------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------
function crosshairapply31()
	local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(31).png")
	local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
	local name = getPlayerName(getLocalPlayer())
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
		dxSetShaderValue ( shader, "gTexture", texture )
		engineApplyShaderToWorldTexture ( shader, "sitem16")
	outputDebugString(name.." hat Das 31 Crosshair ausgewaehlt")
	
	vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*454,sy*248,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*454,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*454,sy*316,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*524,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	triggerServerEvent( "crosshair_trigger_31",  getLocalPlayer(), getLocalPlayer())
 end
 
 function crosshairapply32()
	 local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(32).png")
	 local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
	 local name = getPlayerName(getLocalPlayer())
	 local screenX, screenY = guiGetScreenSize()
	 local sx, sy = screenX/1366, screenY/768
	dxSetShaderValue ( shader, "gTexture", texture )
	engineApplyShaderToWorldTexture ( shader, "sitem16")
	outputDebugString(name.." hat Das erste Crosshair ausgewaehlt")
 
	vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*544,sy*248,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*544,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*544,sy*316,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*614,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	triggerServerEvent( "crosshair_trigger_32", getLocalPlayer(), getLocalPlayer())
 end
 function crosshairapply33()
	local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(33).png")
	local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
	local name = getPlayerName(getLocalPlayer())
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
		dxSetShaderValue ( shader, "gTexture", texture )
		engineApplyShaderToWorldTexture ( shader, "sitem16")
	outputDebugString(name.." hat Das zweite Crosshair ausgewaehlt")
	
	vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*644,sy*248,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*644,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*644,sy*316,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*714,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	triggerServerEvent( "crosshair_trigger_33", getLocalPlayer(), getLocalPlayer())
 end
 function crosshairapply34()
	local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(34).png")
	local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
	local name = getPlayerName(getLocalPlayer())
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
		dxSetShaderValue ( shader, "gTexture", texture )
		engineApplyShaderToWorldTexture ( shader, "sitem16")
	outputDebugString(name.." hat Das dritte Crosshair ausgewaehlt")
	
	vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*744,sy*248,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*744,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*744,sy*316,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*814,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	triggerServerEvent( "crosshair_trigger_34", getLocalPlayer(), getLocalPlayer())
 end
 function crosshairapply35()
	local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(35).png")
	local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
	local name = getPlayerName(getLocalPlayer())
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
		dxSetShaderValue ( shader, "gTexture", texture )
		engineApplyShaderToWorldTexture ( shader, "sitem16")
	outputDebugString(name.." hat Das vierte Crosshair ausgewaehlt")
	
	vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*844,sy*248,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*844,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*844,sy*316,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*914,sy*248,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	triggerServerEvent( "crosshair_trigger_35", getLocalPlayer(), getLocalPlayer())
 end
 function crosshairapply36()
	local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(36).png")
	local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
	local name = getPlayerName(getLocalPlayer())
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
		dxSetShaderValue ( shader, "gTexture", texture )
		engineApplyShaderToWorldTexture ( shader, "sitem16")
	outputDebugString(name.." hat Das fünfte Crosshair ausgewaehlt")
	
	vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*454,sy*348,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*454,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*454,sy*416,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*524,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	triggerServerEvent( "crosshair_trigger_36", getLocalPlayer(), getLocalPlayer())
 end
 ------------------------------------------------------------------------------------------------------------------------------
 function crosshairapply37()
	local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(37).png")
	local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
	local name = getPlayerName(getLocalPlayer())
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
   dxSetShaderValue ( shader, "gTexture", texture )
   engineApplyShaderToWorldTexture ( shader, "sitem16")
   outputDebugString(name.." hat Das sechste Crosshair ausgewaehlt")
 
   vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*544,sy*348,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*544,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*544,sy*416,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*614,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   triggerServerEvent( "crosshair_trigger_37", getLocalPlayer(), getLocalPlayer())
 end
 ------------------------------------------------------------------------------------------------------------------------------
 function crosshairapply38()
   local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(38).png")
   local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
   local name = getPlayerName(getLocalPlayer())
   local screenX, screenY = guiGetScreenSize()
   local sx, sy = screenX/1366, screenY/768
	   dxSetShaderValue ( shader, "gTexture", texture )
	   engineApplyShaderToWorldTexture ( shader, "sitem16")
   outputDebugString(name.." hat Das siebte Crosshair ausgewaehlt")
   
   vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*644,sy*348,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*644,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*644,sy*416,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*714,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   triggerServerEvent( "crosshair_trigger_38", getLocalPlayer(), getLocalPlayer())
 end
 ------------------------------------------------------------------------------------------------------------------------------
 function crosshairapply39()
   local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(39).png")
   local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
   local name = getPlayerName(getLocalPlayer())
   local screenX, screenY = guiGetScreenSize()
   local sx, sy = screenX/1366, screenY/768
	   dxSetShaderValue ( shader, "gTexture", texture )
	   engineApplyShaderToWorldTexture ( shader, "sitem16")
   outputDebugString(name.." hat Das achte Crosshair ausgewaehlt")
   
   vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*744,sy*348,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*744,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*744,sy*416,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*814,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   triggerServerEvent( "crosshair_trigger_39", getLocalPlayer(), getLocalPlayer())
 end
 ------------------------------------------------------------------------------------------------------------------------------
 function crosshairapply40()
   local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(40).png")
   local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
   local name = getPlayerName(getLocalPlayer())
   local screenX, screenY = guiGetScreenSize()
   local sx, sy = screenX/1366, screenY/768
	   dxSetShaderValue ( shader, "gTexture", texture )
	   engineApplyShaderToWorldTexture ( shader, "sitem16")
   outputDebugString(name.." hat Das neunte Crosshair ausgewaehlt")
   
   vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*843,sy*348,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*843,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*843,sy*416,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*913,sy*348,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   triggerServerEvent( "crosshair_trigger_40", getLocalPlayer(), getLocalPlayer())
 end
 ------------------------------------------------------------------------------------------------------------------------------
 function crosshairapply41()
	local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(41).png")
	local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
	local name = getPlayerName(getLocalPlayer())
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
		dxSetShaderValue ( shader, "gTexture", texture )
		engineApplyShaderToWorldTexture ( shader, "sitem16")
	outputDebugString(name.." hat Das zehnte Crosshair ausgewaehlt")
	
	vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*454,sy*448,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*454,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*454,sy*516,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
	vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*524,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	triggerServerEvent( "crosshair_trigger_41", getLocalPlayer(), getLocalPlayer())
 end
 -----------------------------------------------------------------------------------------------------------------------------
 function crosshairapply42()
	local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(42).png")
	local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
	local name = getPlayerName(getLocalPlayer())
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
		dxSetShaderValue ( shader, "gTexture", texture )
		engineApplyShaderToWorldTexture ( shader, "sitem16")
	outputDebugString(name.." hat Das 42 Crosshair ausgewaehlt")
	
	vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*544,sy*448,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*544,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*544,sy*516,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*614,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
	triggerServerEvent( "crosshair_trigger_26", getLocalPlayer(), getLocalPlayer())
 end
 ------------------------------------------------------------------------------------------------------------------------------
 function crosshairapply43()
	local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(43).png")
	local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
	local name = getPlayerName(getLocalPlayer())
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
   dxSetShaderValue ( shader, "gTexture", texture )
   engineApplyShaderToWorldTexture ( shader, "sitem16")
 
   vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*644,sy*448,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*644,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*644,sy*516,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*714,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   triggerServerEvent( "crosshair_trigger_43", getLocalPlayer(), getLocalPlayer())
 end
 ------------------------------------------------------------------------------------------------------------------------------
 function crosshairapply44()
   local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(44).png")
   local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
   local name = getPlayerName(getLocalPlayer())
   local screenX, screenY = guiGetScreenSize()
   local sx, sy = screenX/1366, screenY/768
	   dxSetShaderValue ( shader, "gTexture", texture )
	   engineApplyShaderToWorldTexture ( shader, "sitem16")
   outputDebugString(name.." hat Das 13 Crosshair ausgewaehlt")
   
   vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*744,sy*448,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*744,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*744,sy*516,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*814,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   triggerServerEvent( "crosshair_trigger_44", getLocalPlayer(), getLocalPlayer())
 end
 ------------------------------------------------------------------------------------------------------------------------------
 function crosshairapply45()
   local texture = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16(45).png")
   local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
   local name = getPlayerName(getLocalPlayer())
   local screenX, screenY = guiGetScreenSize()
   local sx, sy = screenX/1366, screenY/768
	   dxSetShaderValue ( shader, "gTexture", texture )
	   engineApplyShaderToWorldTexture ( shader, "sitem16")
   outputDebugString(name.." hat Das 45 Crosshair ausgewaehlt")
   
   vnxDrawRectangle("selected_crosshair_frame_1","der background fuer die Crosshairs",sx*844,sy*448,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_2","der background fuer die Crosshairs",sx*844,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_3","der background fuer die Crosshairs",sx*844,sy*516,sx*70,sy*2,tocolor( 0, 150, 255, 255 ))
   vnxDrawRectangle("selected_crosshair_frame_4","der background fuer die Crosshairs",sx*914,sy*448,sx*2,sy*70,tocolor( 0, 150, 255, 255 ))
   triggerServerEvent( "crosshair_trigger_45", getLocalPlayer(), getLocalPlayer())
 end
 ------------------------------------------------------------------------------------------------------------------------------
 ------------------------------------------------------------------------------------------------------------------------------
local screenX, screenY = guiGetScreenSize()
local sx, sy = screenX/1366, screenY/768

------------------------------------------------------------------------------------------------------------------------------
function junk_crosshairshit()
	vnxDestroyWindow("crosshair_1")
	vnxDestroyWindow("crosshair_2")
	vnxDestroyWindow("crosshair_3")
	vnxDestroyWindow("crosshair_4")
	vnxDestroyWindow("crosshair_5")
	vnxDestroyWindow("crosshair_6")
	vnxDestroyWindow("crosshair_7")
	vnxDestroyWindow("crosshair_8")
	vnxDestroyWindow("crosshair_9")
	vnxDestroyWindow("crosshair_10")
	vnxDestroyWindow("crosshair_11")
	vnxDestroyWindow("crosshair_12")
	vnxDestroyWindow("crosshair_13")
	vnxDestroyWindow("crosshair_14")
	vnxDestroyWindow("crosshair_15")
	vnxDestroyWindow("selected_crosshair_frame_1")
	vnxDestroyWindow("selected_crosshair_frame_2")
	vnxDestroyWindow("selected_crosshair_frame_3")
	vnxDestroyWindow("selected_crosshair_frame_4")
	vnxDestroyWindow("selected_crosshair_frame_5")
	vnxDestroyWindow("selected_crosshair_frame_6")
	vnxDestroyWindow("selected_crosshair_frame_7")
	vnxDestroyWindow("selected_crosshair_frame_8")
	vnxDestroyWindow("selected_crosshair_frame_9")
	vnxDestroyWindow("selected_crosshair_frame_10")
	vnxDestroyWindow("selected_crosshair_frame_11")
	vnxDestroyWindow("selected_crosshair_frame_12")
	vnxDestroyWindow("selected_crosshair_frame_13")
	vnxDestroyWindow("selected_crosshair_frame_14")
	vnxDestroyWindow("selected_crosshair_frame_15")
	vnxDestroyWindow("seite1_button_crosshair")
	vnxDestroyWindow("seite2_button_crosshair")
end 

function seite_2_crosshair()
	junk_crosshairshit()
	vnxDrawImage("crosshair_1","standart crosshair",sx*458,sy*251,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(16)","crosshairapply16")
	
	vnxDrawImage("crosshair_2","standart crosshair",sx*548,sy*251,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(17)","crosshairapply17")

	vnxDrawImage("crosshair_3","standart crosshair",sx*648,sy*251,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(18)","crosshairapply18")

	vnxDrawImage("crosshair_4","standart crosshair",sx*748,sy*251,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(19)","crosshairapply19")
	
	vnxDrawImage("crosshair_5","standart crosshair",sx*848,sy*251,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(20)","crosshairapply20")
	--ZWEITE REIHE 
	vnxDrawImage("crosshair_6","standart crosshair",sx*458,sy*351,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(21)","crosshairapply21")
	
	vnxDrawImage("crosshair_7","standart crosshair",sx*548,sy*351,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(22)","crosshairapply22")

	vnxDrawImage("crosshair_8","standart crosshair",sx*648,sy*351,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(23)","crosshairapply23")

	vnxDrawImage("crosshair_9","standart crosshair",sx*748,sy*351,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(24)","crosshairapply24")
	
	vnxDrawImage("crosshair_10","standart crosshair",sx*848,sy*351,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(25)","crosshairapply25")

	--DRITTE REIHE
	vnxDrawImage("crosshair_11","standart crosshair",sx*458,sy*451,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(26)","crosshairapply26")
	
	vnxDrawImage("crosshair_12","standart crosshair",sx*548,sy*451,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(27)","crosshairapply27")

	vnxDrawImage("crosshair_13","standart crosshair",sx*648,sy*451,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(28)","crosshairapply28")

	vnxDrawImage("crosshair_14","standart crosshair",sx*748,sy*451,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(29)","crosshairapply29")
	
	vnxDrawImage("crosshair_15","standart crosshair",sx*848,sy*451,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(30)","crosshairapply30")

	vnxDrawButtonColored("seite1_button_crosshair", "Crs Func", "Seite 1", sx*451, sy*532, sx*200, sy*20, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "crosshair_window_settings")
	vnxDrawButtonColored("seite2_button_crosshair", "Crs Func", "Seite 3", sx*717, sy*532, sx*200, sy*20, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "seite_3_crosshair")
end 

function seite_3_crosshair()
	junk_crosshairshit()
	vnxDrawImage("crosshair_1","standart crosshair",sx*458,sy*251,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(31)","crosshairapply31")
	
	vnxDrawImage("crosshair_2","standart crosshair",sx*548,sy*251,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(32)","crosshairapply32")

	vnxDrawImage("crosshair_3","standart crosshair",sx*648,sy*251,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(33)","crosshairapply33")

	vnxDrawImage("crosshair_4","standart crosshair",sx*748,sy*251,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(34)","crosshairapply34")
	
	vnxDrawImage("crosshair_5","standart crosshair",sx*848,sy*251,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(35)","crosshairapply35")
	--ZWEITE REIHE 
	vnxDrawImage("crosshair_6","standart crosshair",sx*458,sy*351,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(36)","crosshairapply36")
	
	vnxDrawImage("crosshair_7","standart crosshair",sx*548,sy*351,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(37)","crosshairapply37")

	vnxDrawImage("crosshair_8","standart crosshair",sx*648,sy*351,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(38)","crosshairapply38")

	vnxDrawImage("crosshair_9","standart crosshair",sx*748,sy*351,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(39)","crosshairapply39")
	
	vnxDrawImage("crosshair_10","standart crosshair",sx*848,sy*351,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(40)","crosshairapply40")

	--DRITTE REIHE
	vnxDrawImage("crosshair_11","standart crosshair",sx*458,sy*451,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(41)","crosshairapply41")
	
	vnxDrawImage("crosshair_12","standart crosshair",sx*548,sy*451,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(42)","crosshairapply42")

	vnxDrawImage("crosshair_13","standart crosshair",sx*648,sy*451,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(43)","crosshairapply43")

	vnxDrawImage("crosshair_14","standart crosshair",sx*748,sy*451,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(44)","crosshairapply44")
	
	vnxDrawImage("crosshair_15","standart crosshair",sx*848,sy*451,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(45)","crosshairapply45")

	vnxDrawButtonColored("seite1_button_crosshair", "Crs Func", "Seite 2", sx*451, sy*532, sx*200, sy*20, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "seite_2_crosshair")
	vnxDrawButtonColored("seite2_button_crosshair", "Crs Func", "Seite 4", sx*717, sy*532, sx*200, sy*20, tocolor(20,20,20,150), tocolor(80,80,80,0), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "seite_4_crosshair")
end 



function crosshair_window_settings()
	
	junk_crosshairshit()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	vnxDestroyWindow("hudvorschau")
	vnxDestroyWindow("hud_text_settings")
	vnxDestroyWindow("crosshairvorschau")
	vnxDestroyWindow("crosshair_text_settings")
	local crosswidth = 0.05
	local crosslength = 0.058
	vnxDrawImage("crosshair_1","standart crosshair",sx*458,sy*251,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(1)","crosshairapply1")
	
	vnxDrawImage("crosshair_2","standart crosshair",sx*548,sy*251,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(2)","crosshairapply2")

	vnxDrawImage("crosshair_3","standart crosshair",sx*648,sy*251,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(3)","crosshairapply3")

	vnxDrawImage("crosshair_4","standart crosshair",sx*748,sy*251,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(4)","crosshairapply4")
	
	vnxDrawImage("crosshair_5","standart crosshair",sx*848,sy*251,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(5)","crosshairapply5")
	--ZWEITE REIHE 
	vnxDrawImage("crosshair_6","standart crosshair",sx*458,sy*351,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(6)","crosshairapply6")
	
	vnxDrawImage("crosshair_7","standart crosshair",sx*548,sy*351,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(7)","crosshairapply7")

	vnxDrawImage("crosshair_8","standart crosshair",sx*648,sy*351,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(8)","crosshairapply8")

	vnxDrawImage("crosshair_9","standart crosshair",sx*748,sy*351,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(9)","crosshairapply9")
	
	vnxDrawImage("crosshair_10","standart crosshair",sx*848,sy*351,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(10)","crosshairapply10")

	--DRITTE REIHE
	vnxDrawImage("crosshair_11","standart crosshair",sx*458,sy*451,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(11)","crosshairapply11")
	
	vnxDrawImage("crosshair_12","standart crosshair",sx*548,sy*451,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(12)","crosshairapply12")

	vnxDrawImage("crosshair_13","standart crosshair",sx*648,sy*451,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(13)","crosshairapply13")

	vnxDrawImage("crosshair_14","standart crosshair",sx*748,sy*451,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(14)","crosshairapply14")
	
	vnxDrawImage("crosshair_15","standart crosshair",sx*848,sy*451,sx*64,sy*64,":VenoX/anzeigen/settings/images/crosshair/siteM16(15)","crosshairapply15")


	-- Seite 2 

	vnxDrawButtonColored("seite1_button_crosshair", "Crs Func", "Seite 1", sx*451, sy*532, sx*200, sy*20, tocolor(20,20,20,150), tocolor(80,80,80,0), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "nil")
	vnxDrawButtonColored("seite2_button_crosshair", "Crs Func", "Seite 2", sx*717, sy*532, sx*200, sy*20, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "seite_2_crosshair")

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function hud_window_settings()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	vnxDestroyWindow("hudvorschau")
	vnxDestroyWindow("hud_text_settings")

	vnxDestroyWindow("crosshairvorschau")
	vnxDestroyWindow("crosshair_text_settings")
	junk_crosshairshit()
	vnxDrawImage("hud_1","hud_1",sx*480,sy*250,sx*200,sy*100,":VenoX/anzeigen/settings/images/hud1","hud1_apply")
	vnxDrawImage("hud_2","hud_2",sx*700,sy*250,sx*200,sy*100,":VenoX/anzeigen/settings/images/hud2","hud2_apply")
	vnxDrawImage("hud_3","hud_3",sx*480,sy*370,sx*200,sy*100,":VenoX/anzeigen/settings/images/hud3","hud3_apply")
	vnxDrawImage("hud_4","hud_4",sx*700,sy*370,sx*200,sy*100,":VenoX/anzeigen/settings/images/hud4","hud4_apply")

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function hud1_apply()
	triggerServerEvent( "hud_trigger_1", getLocalPlayer(), getLocalPlayer())
end

function hud2_apply()
	triggerServerEvent( "hud_trigger_2", getLocalPlayer(), getLocalPlayer())
end

function hud3_apply()
	triggerServerEvent( "hud_trigger_3", getLocalPlayer(), getLocalPlayer())
end

function hud4_apply()
	triggerServerEvent( "hud_trigger_4", getLocalPlayer(), getLocalPlayer())
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function settings_window()
    local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	showCursor(true)
	if getElementData ( player, "loggedin" ) == 1 then
	
	------ LIB. -----
	--[[
	vnxDestroyWindow("Selfmenu")
    vnxDestroyWindow("settings")
    vnxDestroyWindow("fraktion")
    vnxDestroyWindow("stats")
    vnxDestroyWindow("info")
    vnxDestroyWindow("handy")
    vnxDestroyWindow("support")
    vnxDestroyWindow("settings_window_main")
    vnxDestroyWindow("fraktions_window_main")
    vnxDestroyWindow("informations_window_main")
    vnxDestroyWindow("stats_window_main")
    vnxDestroyWindow("handy_window_main")
    vnxDestroyWindow("support_window_main")
    ]]
    vnxDestroyWindow("settings_window_main")
	vnxDestroyWindow("button_background")
	vnxDestroyWindow("anzeigen_button")
	vnxDestroyWindow("hudvorschau")
	vnxDestroyWindow("crosshairvorschau")
	vnxDestroyWindow("hud_1")
	vnxDestroyWindow("hud_2")
	vnxDestroyWindow("hud_3")
	vnxDestroyWindow("hud_4")
	vnxDestroyWindow("settings_window_main_anzeigen")
	vnxDestroyWindow("settings_window_main_sounds")
	vnxDestroyWindow("settings_window_main_account")
	vnxDestroyWindow("settings_window_main_vnxpoints")
	vnxDestroyWindow("settings_window_main_teamspeak3")
	vnxDestroyWindow("settings_window_main_information")
	vnxDestroyWindow("hud_text_settings")
	
	
	vnxDestroyWindow("settings_window_main")
    vnxDestroyWindow("fraktions_window_main")
    vnxDestroyWindow("informations_window_main")
    vnxDestroyWindow("stats_window_main")
    vnxDestroyWindow("handy_window_main")
	vnxDestroyWindow("support_window_main")

	vnxDestroyWindow("crosshairvorschau")
	vnxDestroyWindow("crosshair_text_settings")
    junk_crosshairshit()
    
	--triggerServerEvent("close_Self_show_hud", getLocalPlayer())
	
	------------------------------------------------






	vnxDrawWindow("settings_window_main", "SettingsWindow", "Einstellungen", sx*450, sy*205, sx*470, sy*350, "settings_close_wmain")

	vnxDrawRectangle("settings_window_main","der background fuer die buttons",sx*305,sy*205,sx*129,sy*350,tocolor( 0, 0, 0, 160 ))

	vnxDrawButton("settings_window_main_anzeigen", "HUD_New_Button_Window", "Anzeigen", sx*317, sy*210, sx*105, sy*40, "anzeigen_window_settings")

	vnxDrawButton("settings_window_main_sounds", "HUD_New_Button_Window", "Sounds", sx*317, sy*270, sx*105, sy*40, "sound_window_settings")

	vnxDrawButton("settings_window_main_account", "HUD_New_Button_Window", "Account", sx*317, sy*330, sx*105, sy*40, "account_window_settings")

	vnxDrawButton("settings_window_main_vnxpoints", "HUD_New_Button_Window", "VnX - Points", sx*317, sy*390, sx*105, sy*40, "vnx_points_settings")

	vnxDrawButton("settings_window_main_teamspeak3", "HUD_New_Button_Window", "Teamspeak 3", sx*317, sy*450, sx*105, sy*40, "teamspeak3_window_settings")

	vnxDrawButton("settings_window_main_information", "HUD_New_Button_Window", "Information", sx*317 , sy*510, sx*105, sy*40, "information_window_settings")

	--vnxDrawImage("hat", "Schnee", x+35, y-123, 98, 98, "images/login/hat")
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function trigger_crosshair_vnx(player, showcrosshairclient)
	if showcrosshairclient == nil or showcrosshairclient == false then 
	else 
		local shader = dxCreateShader ( ":VenoX/anzeigen/settings/images/crosshair/shader.fx" )
		if showcrosshairclient >= 1 then 
			texture_crosshair = dxCreateTexture ( ":VenoX/anzeigen/settings/images/crosshair/siteM16("..showcrosshairclient..").png")
			dxSetShaderValue ( shader, "gTexture", texture_crosshair )
			engineApplyShaderToWorldTexture ( shader, "sitem16")
		else 
			--outputDebugString(showcrosshairclient)
		end 
	end
end 
addEvent("trigger_crosshair_vnx", true)
addEventHandler("trigger_crosshair_vnx", root, trigger_crosshair_vnx)