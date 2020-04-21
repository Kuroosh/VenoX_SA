
function close_vinzblackswindows()
    vnxDestroyWindow("test_window_vinzblack")
    vnxDestroyWindow("test_window_edit_vinzblack")
    vnxDestroyWindow("test_window_button_vinzblack")
    showCursor(false)
end 

function trigger_largepeach()
	local largepeach = vnxGetEditText("test_window_edit_vinzblack","vinzblack_edit")
	triggerServerEvent( "triggerLargePeachbitch", getLocalPlayer( ), getLocalPlayer( ), largepeach)
end 


function  vinzblacksfunction()
    local screenX, screenY = guiGetScreenSize()
    local sx, sy = screenX/1366, screenY/768
   
    showCursor(true)
   
    vnxDrawWindow("test_window_vinzblack", "Vinzblacks erstes Window", "Solid_Snake ist der Boss", sx*450,sy*250,sx*400,sy*200, "close_vinzblackswindows")

    vnxDrawEdit("test_window_edit_vinzblack","vinzblack_edit","",sx*455,sy*300,sx*390,true)

    vnxDrawButton("test_window_button_vinzblack","Button Für Spieler Test","Scheiß Pfirsisch!",sx*455,sy*350,sx*390,sy*35,"trigger_largepeach")


end
addCommandHandler("vinzblack", vinzblacksfunction)