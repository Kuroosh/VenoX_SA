local screenx, screeny = guiGetScreenSize(getLocalPlayer())
window_already_open = false 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function dutyWindow()
	if getElementData(getLocalPlayer(),"loggedin") == 1 then  
		if getElementData(getLocalPlayer(),"fraktion") == 1 then
			if window_already_open == false then 
			local x, y = screenx/2-500/2,screeny/2-400/2
			local e, f = screenx/2-470/2,screeny/2-50/2
			local g, h = screenx/2+120/2,screeny/2-50/2
			local e, f = screenx/2-470/2,screeny/2-80/2
			local g, h = screenx/2+120/2,screeny/2-80/2
			local z, u = screenx/2+120/2,screeny/2+100/2
			local c, v = screenx/2-470/2,screeny/2+100/2
			local player = getLocalPlayer(  )
			local name = getPlayerName( player )
			showCursor(true)
			window_already_open = true
			vnxDrawWindow("duty_window","window","Willkommen Officer "..name,x,y,500,400,"close_sfpd_client")
			vnxDrawButton("SWAT","button","S.W.A.T",z,u,170,80,"swat_func")
			vnxDrawButton("duty","button","DUTY",c,v,170,80,"duty_func")
			vnxDrawButton("offdutybutton","button","OFF-DUTY",e,f,170,80,"offduty_func")
			setElementFrozen( getLocalPlayer(), true )
			--vnxDrawButton("fskinPD","button","SKIN AENDERN",g,h,170,80,"fskin_func")
			end
		end
	else
		return
	end
end

addEvent("dutywiendowanclient",true)
addEventHandler("dutywiendowanclient",getRootElement(),dutyWindow)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function close_sfpd_client()
	window_already_open = false
	vnxDestroyWindow("duty_window")
	vnxDestroyWindow("duty_window_weapons")
	vnxDestroyWindow("SWAT")
	vnxDestroyWindow("duty")
	vnxDestroyWindow("offdutybutton")
	------------------------------------
	vnxDestroyWindow("deagle_image")
	vnxDestroyWindow("deagle_button")
	vnxDestroyWindow("deagle_text")
	vnxDestroyWindow("deagle_locked")
	vnxDestroyWindow("deagle_image_background")
	vnxDestroyWindow("deagle_text_verfuegbar")

	------------------------------------
	vnxDestroyWindow("pistole_image")
	vnxDestroyWindow("pistole_button")
	vnxDestroyWindow("pistole_text")
	vnxDestroyWindow("pistole_text_verfuegbar")

	------------------------------------
	vnxDestroyWindow("silence_image")
	vnxDestroyWindow("silence_button")
	vnxDestroyWindow("silence_text")
	vnxDestroyWindow("silence_locked")
	vnxDestroyWindow("silence_image_background")
	vnxDestroyWindow("silence_text_verfuegbar")

	------------------------------------
	vnxDestroyWindow("shotgun_image")
	vnxDestroyWindow("shotgun_button")
	vnxDestroyWindow("shotgun_text")
	vnxDestroyWindow("shotgun_image_background")
	vnxDestroyWindow("shotgun_locked")
	vnxDestroyWindow("shotgun_text_verfuegbar")
	------------------------------------
	vnxDestroyWindow("mp5_image")
	vnxDestroyWindow("mp5_button")
	vnxDestroyWindow("mp5_text")
	vnxDestroyWindow("mp5_image_background")
	vnxDestroyWindow("mp5_locked")
	vnxDestroyWindow("mp5_text_verfuegbar")

	------------------------------------
	vnxDestroyWindow("m4_image")
	vnxDestroyWindow("m4_button")
	vnxDestroyWindow("m4_text")
	vnxDestroyWindow("m4_image_background")
	vnxDestroyWindow("m4_locked")
	vnxDestroyWindow("m4_text_verfuegbar")
	------------------------------------
	vnxDestroyWindow("sniper_image")
	vnxDestroyWindow("sniper_button")
	vnxDestroyWindow("sniper_text")
	vnxDestroyWindow("sniper_image_background")
	vnxDestroyWindow("sniper_locked")
	vnxDestroyWindow("sniper_text_verfuegbar")
	------------------------------------
	vnxDestroyWindow("gas_image")
	vnxDestroyWindow("gas_button")
	vnxDestroyWindow("gas_text")
	vnxDestroyWindow("gas_image_background")
	vnxDestroyWindow("gas_locked")
	vnxDestroyWindow("gas_text_verfuegbar")
	vnxDestroyWindow("to_skin_button")
	showCursor(false)
	setElementFrozen( getLocalPlayer(), false )
	window_already_open = false
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function pistole_give_func()
	local player = getLocalPlayer()
	local x, y = screenx/2-500/2,screeny/2-400/2
	triggerServerEvent( "pistole_button_sfpd", getLocalPlayer(), getLocalPlayer() )
	vnxDestroyWindow("pistole_button")
	vnxDrawText("pistole_text","Deagle_text","Erfolgreich ausgeruestet!",x-23,y+90, 100, 40, tocolor(0, 131, 191, 255), 1, "default", "center", "center")
	-----------------------------------------------------------------------------------------------
	if tonumber(getElementData( player, "rang" )) >= 1 then	
	vnxDestroyWindow("deagle_text")
	vnxDrawButton("deagle_button","Deagle_Button","Deagle",x+193,y+90,100,30,"deagle_give_func")
	-----------------------------------------------------------------------------------------------
	vnxDestroyWindow("silence_text")
	vnxDrawButton("silence_button","Deagle_Button","Silenced",x+400,y+90,100,30,"silence_give_func")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function deagle_give_func()
	local x, y = screenx/2-500/2,screeny/2-400/2
	triggerServerEvent( "deagle_button_sfpd", getLocalPlayer(), getLocalPlayer() )
	vnxDestroyWindow("deagle_button")
	vnxDrawText("deagle_text","Deagle_text","Erfolgreich ausgeruestet!",x+195,y+90, 100, 40, tocolor(0, 131, 191, 255), 1, "default", "center", "center")
	-----------------------------------------------------------------------------------------------
	vnxDestroyWindow("pistole_text")
	vnxDrawButton("pistole_button","Pistole_Button","Pistole",x-23,y+90,100,30,"pistole_give_func")
	-----------------------------------------------------------------------------------------------
	vnxDestroyWindow("silence_text")
	vnxDrawButton("silence_button","Deagle_Button","Silenced",x+400,y+90,100,30,"silence_give_func")
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function silence_give_func()
	local x, y = screenx/2-500/2,screeny/2-400/2
	triggerServerEvent( "silence_button_sfpd", getLocalPlayer(), getLocalPlayer() )
	vnxDestroyWindow("silence_button")
	vnxDrawText("silence_text","Silence_text","Erfolgreich ausgeruestet!",x+400,y+90, 100, 40, tocolor(0, 131, 191, 255), 1, "default", "center", "center")
	-----------------------------------------------------------------------------------------------
	vnxDestroyWindow("pistole_text")
	vnxDrawButton("pistole_button","Pistole_Button","Pistole",x-23,y+90,100,30,"pistole_give_func")
	-----------------------------------------------------------------------------------------------
	vnxDestroyWindow("deagle_text")
	vnxDrawButton("deagle_button","Deagle_Button","Deagle",x+193,y+90,100,30,"deagle_give_func")
	-----------------------------------------------------------------------------------------------
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function shotgun_give_func()
	local x, y = screenx/2-500/2,screeny/2-400/2
	triggerServerEvent( "shotgun_button_sfpd", getLocalPlayer(), getLocalPlayer() )
	vnxDestroyWindow("shotgun_button")
	vnxDrawText("shotgun_text","Shotgun_Text","Erfolgreich ausgeruestet!",x-23,y+260, 100, 40, tocolor(0, 131, 191, 255), 1, "default", "center", "center")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function mp5_give_func()
	local x,y = screenx/2-500/2,screeny/2-400/2
	triggerServerEvent( "mp5_button_sfpd", getLocalPlayer(), getLocalPlayer() )
	vnxDestroyWindow("mp5_button")
	vnxDrawText("mp5_text","Mp5_text","Erfolgreich ausgeruestet!",x+195,y+260, 100, 40, tocolor(0, 131, 191, 255), 1, "default", "center", "center")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function m4_give_func()
	local x,y = screenx/2-500/2,screeny/2-400/2
	triggerServerEvent( "m4_button_sfpd", getLocalPlayer(), getLocalPlayer() )
	vnxDestroyWindow("m4_button")
	vnxDrawText("m4_text","M4_text","Erfolgreich ausgeruestet!",x+400,y+260, 100, 40, tocolor(0, 131, 191, 255), 1, "default", "center", "center")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function sniper_give_func()
	local x,y = screenx/2-500/2,screeny/2-400/2
	triggerServerEvent( "sniper_button_sfpd", getLocalPlayer(), getLocalPlayer() )
	--infobox_start_func("Du hast eine Sniper mit 7 Schuss gekauft!", 7500 )
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function gas_give_func()
	local x,y = screenx/2-500/2,screeny/2-400/2
	triggerServerEvent( "gas_button_sfpd", getLocalPlayer(), getLocalPlayer() )
	--infobox_start_func("Du hast eine Sniper mit 7 Schuss gekauft!", 7500 )
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function offduty_func()
	vnxDestroyWindow("duty_window")
	vnxDestroyWindow("SWAT")
	vnxDestroyWindow("duty")
	vnxDestroyWindow("offdutybutton")
	showCursor(false)
	setElementFrozen( getLocalPlayer(), false )
	window_already_open = false 
	triggerServerEvent( "offdutybutton", getLocalPlayer(), getLocalPlayer() )
end
---------------------------------------------------------------------------------------------------

function image()

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function close_skin_0()
	vnxDestroyWindow("skin_window")
	showCursor(false)
	setElementFrozen( getLocalPlayer(), false )
	vnxDestroyWindow("rank_0")

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function skin_auswahl()

	local player = getLocalPlayer()
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	vnxDestroyWindow("duty_window")
	vnxDestroyWindow("duty_window_weapons")
	vnxDestroyWindow("SWAT")
	vnxDestroyWindow("duty")
	vnxDestroyWindow("offdutybutton")
	------------------------------------
	vnxDestroyWindow("deagle_image")
	vnxDestroyWindow("deagle_button")
	vnxDestroyWindow("deagle_text")
	vnxDestroyWindow("deagle_locked")
	vnxDestroyWindow("deagle_image_background")
	vnxDestroyWindow("deagle_text_verfuegbar")

	------------------------------------
	vnxDestroyWindow("pistole_image")
	vnxDestroyWindow("pistole_button")
	vnxDestroyWindow("pistole_text")
	vnxDestroyWindow("pistole_text_verfuegbar")

	------------------------------------
	vnxDestroyWindow("silence_image")
	vnxDestroyWindow("silence_button")
	vnxDestroyWindow("silence_text")
	vnxDestroyWindow("silence_locked")
	vnxDestroyWindow("silence_image_background")
	vnxDestroyWindow("silence_text_verfuegbar")

	------------------------------------
	vnxDestroyWindow("shotgun_image")
	vnxDestroyWindow("shotgun_button")
	vnxDestroyWindow("shotgun_text")
	vnxDestroyWindow("shotgun_image_background")
	vnxDestroyWindow("shotgun_locked")
	vnxDestroyWindow("shotgun_text_verfuegbar")
	------------------------------------
	vnxDestroyWindow("mp5_image")
	vnxDestroyWindow("mp5_button")
	vnxDestroyWindow("mp5_text")
	vnxDestroyWindow("mp5_image_background")
	vnxDestroyWindow("mp5_locked")
	vnxDestroyWindow("mp5_text_verfuegbar")

	------------------------------------
	vnxDestroyWindow("m4_image")
	vnxDestroyWindow("m4_button")
	vnxDestroyWindow("m4_text")
	vnxDestroyWindow("m4_image_background")
	vnxDestroyWindow("m4_locked")
	vnxDestroyWindow("m4_text_verfuegbar")
	------------------------------------
	vnxDestroyWindow("sniper_image")
	vnxDestroyWindow("sniper_button")
	vnxDestroyWindow("sniper_text")
	vnxDestroyWindow("sniper_image_background")
	vnxDestroyWindow("sniper_locked")
	vnxDestroyWindow("sniper_text_verfuegbar")
	------------------------------------
	vnxDestroyWindow("gas_image")
	vnxDestroyWindow("gas_button")
	vnxDestroyWindow("gas_text")
	vnxDestroyWindow("gas_image_background")
	vnxDestroyWindow("gas_locked")
	vnxDestroyWindow("gas_text_verfuegbar")
	-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


	function skin_0_pick()
		local player = getLocalPlayer(  )
		setElementModel ( player, 284)
	end
	function skin_0_pick_2()
		local player = getLocalPlayer(  )
		setElementModel ( player, 275)
	end



	
	local x, y = screenx/2-500/2,screeny/2-400/2
	vnxDrawWindow("skin_window","window","Wählen sie ihre uniform aus! ",x-160,y-40,330,300,"close_skin_0")
	--vnxDrawWindow("skin_window","window","Wählen sie ihre uniform aus! ",x-150,y-40,330,600,"close_skin_0")
	vnxDestroyWindow("to_skin_button")
	if tonumber(getElementData(player, "rang" )) == 0 then
		vnxDrawImage("rank_0", "Rank_1 Erstwahl", x-125, y-10, 104, 270, "anzeigen/sfpd/rank_0", "skin_0_pick")
		vnxDrawImage("rank_0_1", "Rank_1 Erstwahl", x-10, y-10, 104, 270, "anzeigen/sfpd/rank_0_1", "skin_0_pick_2")
	end

end



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function duty_func( player )
	local player = getLocalPlayer()
		vnxDestroyWindow("duty_window")
		vnxDestroyWindow("SWAT")
		vnxDestroyWindow("duty")
		vnxDestroyWindow("offdutybutton")
		local x, y = screenx/2-500/2,screeny/2-400/2
		local name = getPlayerName( player )
		showCursor(true)
		triggerServerEvent( "dutybutton", getLocalPlayer(), getLocalPlayer() )
		setElementFrozen( getLocalPlayer(), true )
		selectweaponmenusfpd()
end 
function selectweaponmenusfpd()
	local player = getLocalPlayer()
	local name = getPlayerName( player )
	local x, y = screenx/2-500/2,screeny/2-400/2
	if tonumber(getElementData( player, "rang" )) >= 0 then	
		vnxDrawWindow("duty_window_weapons","window","Wählen sie ihre Waffen für ihren Einsatz aus",x-40,y-40,555,520,"close_sfpd_client")
		--vnxDrawButton("to_skin_button","button_skin","Weiter zur\n Skin auswahl -->",x+385,y+375, 120, 50,"skin_auswahl")
		vnxDrawImage("pistole_image", "Pistole_Icon", x-20, y-10, 98, 98, "images/hud/22")
		vnxDrawButton("pistole_button","Pistole_Button","Pistole",x-23,y+90,100,30,"pistole_give_func")
	end
---------------------------------------------------------------------------------------------------

	if tonumber(getElementData(player, "rang" )) >= 1 then
		---------------------------------------------------------------------------------------------------
		vnxDrawImage("deagle_image", "Deagle_Icon", x+195, y-10, 98, 98, "images/hud/24")
		vnxDrawButton("deagle_button","Deagle_Button","Deagle",x+193,y+90,100,30,"deagle_give_func")
		---------------------------------------------------------------------------------------------------
		vnxDrawImage("silence_image", "Silenced_Icon", x+400, y-10, 98, 98, "images/hud/23")
		vnxDrawButton("silence_button","Silenced_Button","Silenced",x+400,y+90,100,30,"silence_give_func")
		---------------------------------------------------------------------------------------------------
	else
		vnxDrawImage("silence_image", "Silenced_Icon", x+400, y-10, 98, 98, "images/hud/23")
		vnxDrawImage("silence_image_background", "Silence_Background", x+400, y-10, 98, 98, "anzeigen/images/weapons/locked_background")
		vnxDrawImage("silence_locked", "Silenced_locked", x+400, y-10, 98, 98, "anzeigen/images/weapons/locked")

		vnxDrawText("silence_text_verfuegbar","Silence_text","Du benötigst Rang 1!",x+400,y+90, 100, 40, tocolor(255, 255, 255, 255), 1, "default", "center", "center")
		---------------------------------------------------------------------------------------------------
		vnxDrawImage("deagle_image", "Deagle_Icon", x+195, y-10, 98, 98, "images/hud/24")
		vnxDrawImage("deagle_image_background", "Shotgun_Icon", x+195, y-10, 98, 98, "anzeigen/images/weapons/locked_background")
		vnxDrawImage("deagle_locked", "Deagle_Locked", x+195, y-10, 98, 98, "anzeigen/images/weapons/locked")
		vnxDrawText("deagle_text_verfuegbar","Deagle_text","Du benötigst Rang 1!",x+193,y+90, 100, 40, tocolor(255, 255, 255, 255), 1, "default", "center", "center")
		---------------------------------------------------------------------------------------------------
	end


	if tonumber(getElementData(player, "rang")) >= 2 then
		---------------------------------------------------------------------------------------------------
		vnxDrawImage("shotgun_image", "Shotgun_Icon", x-20, y+160, 98, 98, "images/hud/25")
		vnxDrawButton("shotgun_button","Shotgun_Button","Shotgun",x-23,y+260,100,30,"shotgun_give_func")
		---------------------------------------------------------------------------------------------------
	else
		---------------------------------------------------------------------------------------------------
		--vnxDrawRectangle("shotgun_locked", "Locked_Shotgun", x-23,y+260,100,30, tocolor( 39, 39, 39, 255) )
		vnxDrawImage("shotgun_image", "Shotgun_Icon", x-20, y+160, 98, 98, "images/hud/25")
		vnxDrawImage("shotgun_image_background", "Shotgun_Icon", x-20, y+160, 98, 98, "anzeigen/images/weapons/locked_background")
		vnxDrawImage("shotgun_locked", "Shotgun_Icon", x-20, y+160, 98, 98, "anzeigen/images/weapons/locked")
		vnxDrawText("shotgun_text_verfuegbar","Shotgun_text","Du benötigst Rang 2!",x-23,y+260, 100, 40, tocolor(255, 255, 255, 255), 1, "default", "center", "center")

		---------------------------------------------------------------------------------------------------
	end

	if tonumber(getElementData(player, "rang")) >= 2 then
		---------------------------------------------------------------------------------------------------
		vnxDrawImage("mp5_image", "Mp5_Icon", x+195, y+160, 98, 98, "images/hud/29")
		vnxDrawButton("mp5_button","Mp5_Button","Mp5",x+195,y+260,100,30,"mp5_give_func")
		---------------------------------------------------------------------------------------------------
	else
		---------------------------------------------------------------------------------------------------
		vnxDrawImage("mp5_image", "Mp5_Icon", x+195, y+160, 98, 98, "images/hud/29")
		vnxDrawImage("mp5_image_background", "mp5_icon", x+195, y+160, 98, 98, "anzeigen/images/weapons/locked_background")
		vnxDrawImage("mp5_locked", "mp5_locked", x+195, y+160, 98, 98, "anzeigen/images/weapons/locked")
		vnxDrawText("mp5_text_verfuegbar","Mp5_Text","Du benötigst Rang 2!",x+195,y+260, 100, 40, tocolor(255, 255, 255, 255), 1, "default", "center", "center")

		---------------------------------------------------------------------------------------------------
	end

	if tonumber(getElementData(player, "rang")) >= 3 then
		vnxDrawImage("m4_image", "M4_Icon", x+400, y+160, 98, 98, "images/hud/31")
		vnxDrawButton("m4_button","M4_Button","M4",x+400,y+260,100,30,"m4_give_func")
		---------------------------------------------------------------------------------------------------
	else
		---------------------------------------------------------------------------------------------------
		vnxDrawImage("m4_image", "M4_Icon", x+400, y+160, 98, 98, "images/hud/31")
		vnxDrawImage("m4_image_background", "m4_icon", x+400, y+160, 98, 98, "anzeigen/images/weapons/locked_background")
		vnxDrawImage("m4_locked", "m4_locked", x+400, y+160, 98, 98, "anzeigen/images/weapons/locked")
		vnxDrawText("m4_text_verfuegbar","M4_text","Du benötigst Rang 3!",x+400,y+260, 100, 40, tocolor(255, 255, 255, 255), 1, "default", "center", "center")
		---------------------------------------------------------------------------------------------------
	end


	if tonumber(getElementData(player, "rang")) >= 4 then
		vnxDrawImage("sniper_image", "Sniper_Icon", x-20, y+330, 98, 98, "images/hud/34")
		vnxDrawButton("sniper_button","Sniper_button","Sniper \n 7.500$ ",x-23,y+430,100,30,"sniper_give_func")
		---------------------------------------------------------------------------------------------------
	else
		---------------------------------------------------------------------------------------------------
		vnxDrawImage("sniper_image", "Sniper_Icon", x-23, y+330, 98, 98, "images/hud/31")
		vnxDrawImage("sniper_image_background", "sniper_icon", x-23, y+330, 98, 98, "anzeigen/images/weapons/locked_background")
		vnxDrawImage("sniper_locked", "sniper_locked", x-23, y+330, 98, 98, "anzeigen/images/weapons/locked")
		vnxDrawText("sniper_text_verfuegbar","Sniper_text","Du benötigst Rang 4!",x-23,y+430, 100, 40, tocolor(255, 255, 255, 255), 1, "default", "center", "center")
		---------------------------------------------------------------------------------------------------
	end

	if tonumber(getElementData(player, "rang")) >= 4 then
		vnxDrawImage("gas_image", "Sniper_Icon", x+195, y+330, 98, 98, "images/hud/17")
		vnxDrawButton("gas_button","Sniper_button","TraenenGas \n 5000$ ",x+195,y+430,100,30,"gas_give_func")
		---------------------------------------------------------------------------------------------------
	else
		---------------------------------------------------------------------------------------------------
		vnxDrawImage("gas_image", "gas_Icon", x+195, y+330, 98, 98, "images/hud/17")
		vnxDrawImage("gas_image_background", "sniper_icon", x+195, y+330, 98, 98, "anzeigen/images/weapons/locked_background")
		vnxDrawImage("gas_locked", "gas_locked", x+195, y+330, 98, 98, "anzeigen/images/weapons/locked")
		vnxDrawText("gas_text_verfuegbar","Sniper_text","Du benötigst Rang 4!",x+195,y+430, 100, 40, tocolor(255, 255, 255, 255), 1, "default", "center", "center")
		---------------------------------------------------------------------------------------------------
	end

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function swat_func()
		if tonumber(getElementData(getLocalPlayer(), "rang" )) >= 2 then
			vnxDestroyWindow("duty_window")
			vnxDestroyWindow("SWAT")
			vnxDestroyWindow("duty")
			vnxDestroyWindow("offdutybutton")
			showCursor(true)
			setElementFrozen( getLocalPlayer(), true )
			selectweaponmenusfpd()
			triggerServerEvent( "swatbutton", getLocalPlayer(), getLocalPlayer() )
		else 
			infobox_start_func("Nur für Inspector oder höher!", 7500) 
		end 

end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------



