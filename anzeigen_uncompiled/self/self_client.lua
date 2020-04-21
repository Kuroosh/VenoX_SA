------------------------
---- By VenoX RL Crew &--
---- Solid_Snake -------
------------------------


local player = getLocalPlayer()
local screenx, screeny = guiGetScreenSize()

-------------------------------------------------------------------------------------------------------------------------------------------------------------
function Self_Main()
    if getElementData(player, "loggedin") == 1 then
        if window_already_open == false then
            setElementData(player, "selfopen", 1)
            local screenX, screenY = guiGetScreenSize()
            local sx, sy = screenX/1366, screenY/768
            --[[dxDrawRectangle(0, 0, 1366, 164, tocolor(0, 0, 0, 209), false)		--MainBackground

                dxDrawRectangle(0, 163, 1366, 5, tocolor(0, 105, 145, 209), false)	--BlueClanTangle]]
            showCursor(true)
            showChat(false)
            removeEventHandler("onClientRender", root, HUD1)
            removeEventHandler("onClientRender", root, HUD2)
            removeEventHandler("onClientRender", root, HUD3)
            removeEventHandler("onClientRender", root, HUD4)
            removeEventHandler("onClientRender", root, HUD5)
            removeEventHandler("onClientRender", root, HUD6)
            setPlayerHudComponentVisible("all", false)

            --[[ setPlayerHudComponentVisible("radar", true)
            setPlayerHudComponentVisible("crosshair", true)
            ]]
            vnxDrawWindow("Selfmenu", "window", "Selfmenü", sx*0, sy*0, sx*1366, sy*200, "bankSchliessen")

            vnxDrawButton("info", "annehmen", "Informationen", sx*450, sy*40, sx*100, sy*40, "informations_window")

            vnxDrawButton("fraktion", "Fraktion", "Fraktion", sx*820, sy*40, sx*100, sy*40, "fraktions_window")

            vnxDrawButton("stats", "Stats", "Handy", sx*630, sy*40, sx*100, sy*40, "stats_window")


            vnxDrawButton("handy", "Handy", "Spawn", sx*450, sy*100, sx*100, sy*40, "handy_window")


            vnxDrawButton("support", "Support", "Support", sx*820, sy*100, sx*100, sy*40, "support_window")


            vnxDrawButton("settings", "Einstellungen", "Einstellungen", sx*630, sy*100, sx*100, sy*40, "settings_window") --Global Func ,, Settings_client.lua,,


            if tonumber(getElementData(getLocalPlayer(), "adminlvl")) >= 2 then
                vnxDrawButton("Selfmenu", "Close", "Schließen", sx*450, sy*160, sx*220, sy*30, "bankSchliessen")
                vnxDrawButton("Selfmenu", "adminmenue", "Admin", sx*700, sy*160, sx*220, sy*30, "SelfAdminmenue")
            else
                vnxDrawButton("Selfmenu", "Close", "Schließen", sx*450, sy*160, sx*470, sy*30, "bankSchliessen")
            end

            --vnxDrawButton("fraktion", "Fraktion","Fraktion",635,65,100,30,"fraktions_window")

            -- vnxDrawButton("stats", "Stats","Stats",770,65,100,30,"stats_window")


            --vnxDrawButton("info", "Information","Information",500,105,100,30,"informations_window")

            --vnxDrawButton("handy", "Handy","Handy",635,105,100,30,"handy_window")

            --vnxDrawButton("supporter", "Support","Support",770,105,100,30,"support_window")
        end
    end
end
addEvent( "showSelfWindow", true )
addEventHandler( "showSelfWindow", getRootElement(), Self_Main )

addCommandHandler("self", Self_Main)
-------------------------------------------------------------------------------------------------------------------------------------------------------------
function bankSchliessen()
    setElementData(player, "selfopen", 0)
    vnxDestroyWindow("Selfmenu")
    vnxDestroyWindow("settings")
    vnxDestroyWindow("fraktion")
    vnxDestroyWindow("stats")
    vnxDestroyWindow("info")
    vnxDestroyWindow("handy")
    vnxDestroyWindow("support")
    showCursor(false)
    showChat(true)
    setPlayerHudComponentVisible( "radar", true )
    vnxDestroyWindow("settings_window_main")
    vnxDestroyWindow("fraktions_window_main")
    vnxDestroyWindow("informations_window_main")
    vnxDestroyWindow("stats_window_main")
    vnxDestroyWindow("handy_window_main")
    vnxDestroyWindow("support_window_main")
    

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
    
	vnxDestroyWindow("crosshairvorschau")
	vnxDestroyWindow("crosshair_text_settings")
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


    triggerServerEvent("close_Self_show_hud", getLocalPlayer())
end

---------------------------------------- DIE CLOSE FUNCTIONS  -------------------------------------------------------------------
function settings_close()
    vnxDestroyWindow("settings_window_main")
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

function fraktions_close()
    vnxDestroyWindow("fraktions_window_main")

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

function stats_close()
    vnxDestroyWindow("stats_window_main")

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

function info_close()
    vnxDestroyWindow("informations_window_main")

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

function handy_close()
    vnxDestroyWindow("handy_window_main")

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


function support_close()
    executeCommandHandler("self")
    vnxDestroyWindow("support_window_main")
    destroyElement (BrowserForTicketsCP_Background)
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
    triggerEvent( "showSpeedometer", getLocalPlayer())
end


---------------------------------------- DIE CLOSE FUNCTIONS  -------------------------------------------------------------------


---------------------------------------- DIE WINDOWS -------------------------------------------------------------------
--[[function settings_window()
	local x, y = screenx / 2 - 500 / 2, screeny / 2 - 172 / 2
	vnxDrawWindow("settings_window_main", "SettingsWindow", "Einstellungen", x+70, y-93, 370, 330, "settings_close")
    


    --Don't change anything here...--
    vnxDestroyWindow("fraktions_window_main")
    vnxDestroyWindow("stats_window_main")
    vnxDestroyWindow("informations_window_main")
    vnxDestroyWindow("handy_window_main")
    vnxDestroyWindow("support_window_main")
end]]



------------------------------------------------------------ Fraktions_Window------------------------------------------------------------------------------
addEvent ( "syncPlayerList", true )

local fraktionMemberList = {}
local fraktionMemberListInvite = {}
 
addEventHandler ( "syncPlayerList", root, function ( array1, array2 )
	fraktionMemberList = {}
	fraktionMemberListInvite = {}
	for i, v in pairs ( array1 ) do
		fraktionMemberList[i] = v
	end
	for i, v in pairs ( array2 ) do
		fraktionMemberListInvite[i] = v
    end
 end )
 
 function table.clear(tbl)
	for index, value in ipairs(tbl) do 
		if (type(value) == "table") then
			table.clear(value)
		else
			tbl[index] = nil
		end
	end
end
MemberListFactionNew = {}
factionopengridtest = false 
function updatefactionwindow()
    fraktions_close()
    fraktions_window()
end 


function fraktions_window()
    local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768

    local name = getPlayerName(player)
    local source = getLocalPlayer()
    local rang = tonumber(getElementData ( player, "rang" ))
    local fac = tonumber(getElementData(player, "fraktion"))
    --rank = rang
    frak = fac
    --if factionopengridtest == false then
        MemberListFactionNew = nil 
        MemberListFactionNew = {}
        for player, rang in pairs(fraktionMemberList) do
                table.insert(MemberListFactionNew, { "", "" })
                table.insert(MemberListFactionNew, { player, rang }) 
        end 
    --else 
        --updatefactionwindow()
        --outputDebugString("penis")
    --end
    factionopengridtest = true  

    --[[table.insert(member, { "", "" })
    table.insert(member, { ""..name, ""..rang })
    table.insert(member, { "", "" })]]


    vnxDrawWindow("fraktions_window_main", "Fraktions_Window", "Fraktion", sx*450, sy*205, sx*470, sy*300, "fraktions_close")

    vnxDrawGridlist("fraktions_window_main", "Fraktions_Gridlist", sx*450, sy*235, sx*270, sy*270, { { "Name", sx*200 }, { "Rang", sy*120 } }, MemberListFactionNew)

    vnxDrawButton("fraktions_window_main", "uninvite_button", "Rauswerfen", sx*775, sy*250, sx*105, sy*40, "uninvite")

    vnxDrawButton("fraktions_window_main", "uprank_button", "Befoerdern", sx*775, sy*310, sx*105, sy*40, "rankup")

    vnxDrawButton("fraktions_window_main", "derank_button", "Degradieren", sx*775, sy*370, sx*105, sy*40, "rankdown")

    vnxDrawButton("fraktions_window_main", "update_button", "Update", sx*775, sy*430, sx*105, sy*40, "updatefactionwindow")

    function uninvite()
        local player = getLocalPlayer()
        local pname = vnxGetGridlistSelectedItem("fraktions_window_main", "Fraktions_Gridlist")[1]
        if #pname > 0 then
            triggerServerEvent("fraktion_uninvite", getLocalPlayer(), pname)
        else
            --triggerClientEvent ( player, "infobox_start", getRootElement(), "\nUngueltiger\nSpieler!", 5000, 125, 0, 0 )
            infobox_start_func("\nUngueltiger\nSpieler!", 7500)
        end
        updatefactionwindow()
        -- Refresh grid
    end

    function rankup()
        local player = getLocalPlayer()
        local pname = vnxGetGridlistSelectedItem("fraktions_window_main", "Fraktions_Gridlist")[1]
        if #pname > 0 then
            triggerServerEvent("giverank_func", getLocalPlayer(), player, getPlayerFromName(pname))
        else
            --triggerClientEvent ( player, "infobox_start", getRootElement(), "\nUngueltiger\nSpieler!", 5000, 125, 0, 0 )
            infobox_start_func("\nUngueltiger\nSpieler!", 7500)
        end
        updatefactionwindow()
    end


    function rankdown()
        local player = getLocalPlayer()
        local pname = vnxGetGridlistSelectedItem("fraktions_window_main", "Fraktions_Gridlist")[1]
        if #pname > 0 then
            triggerServerEvent("fraktion_degradieren", getLocalPlayer(), player, getPlayerFromName(pname))
        else
            --triggerClientEvent ( player, "infobox_start", getRootElement(), "\nUngueltiger\nSpieler!", 5000, 125, 0, 0 )
            infobox_start_func("\nUngueltiger\nSpieler!", 7500)
        end
        updatefactionwindow()
    end

    --Don't change anything here...--
    vnxDestroyWindow("settings_window_main")
    vnxDestroyWindow("stats_window_main")
    vnxDestroyWindow("informations_window_main")
    vnxDestroyWindow("handy_window_main")
    vnxDestroyWindow("support_window_main")
    vnxDestroyWindow("uninvite_button")

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
end

------------------------------------------------------------ Stats_Window------------------------------------------------------------------------------

local x, y, w, h = 450, 205, 470, 300


function stats_window() --VNX PHONE OLD 
    local screenX, screenY = guiGetScreenSize()
    local sx, sy = screenX/1366, screenY/768
        vnxDrawWindow("stats_window_main", "Stats_Window", "Venox Phone 0.3", sx*x, sy*y, sx*w, sy*h, "stats_close")

        --vnxDrawWindow("stats_window_main", "Stats_Window", "Venox Phone 0.3", sx*x, sy*y, sx*w, sy*h, "stats_close")


    --Don't change anything here...--
    vnxDestroyWindow("settings_window_main")
    vnxDestroyWindow("fraktions_window_main")
    vnxDestroyWindow("informations_window_main")
    vnxDestroyWindow("handy_window_main")
    vnxDestroyWindow("support_window_main")

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
end


function informations_window()
    local donator = "-"
    if getElementData(player, "adminlvl") then
        if getElementData(player, "adminlvl") >= 1 then
            donator = "Aktiv";
        else
            donator = "-";
        end
    end
    local name = getPlayerName(player)
    local ptime = tonumber(getElementData(player, "playingtime"))
    local hour = math.floor(ptime / 60)
    local minute = ptime - hour * 60
    spielzeit = tostring(hour) .. ":" .. tostring(minute)

    local pgeld = getPlayerMoney(player)
    local adminlvl = tonumber(getElementData(player, "adminlvl"))
    local status = getElementData(player, "socialState");

    local fac = tonumber(getElementData(player, "fraktion"))
    frak = fac
    local rang = tonumber(getElementData(player, "rang"))
    local job = tonumber(getElementData(player, "job"))
    local stvo = tonumber(getElementData(player, "stvo_punkte"))
    local wanteds = tonumber(getElementData(player, "wanteds"))
    local bgeld = tonumber(vnxClientGetElementData("bankmoney"))
    local infos = {}

    table.insert(infos, { "", "" })

    table.insert(infos, { "Name : ", "" .. name })

    table.insert(infos, { "", "" })

    table.insert(infos, { "Spielzeit : ", "" .. spielzeit })

    table.insert(infos, { "", "" })

    table.insert(infos, { "Status : ", "" .. status })

    table.insert(infos, { "", "" })

    table.insert(infos, { "Bargeld : ", "" .. pgeld })

    table.insert(infos, { "", "" })

    table.insert(infos, { "Bankgeld : ", "" .. bgeld })

    table.insert(infos, { "", "" })

    table.insert(infos, { "Admin Level : ", "" .. adminlvl })

    table.insert(infos, { "", "" })

    table.insert(infos, { "Donator : ", "" .. donator })

    table.insert(infos, { "", "" })

    table.insert(infos, { "Fraktion : ", "" .. fac })

    table.insert(infos, { "", "" })

    table.insert(infos, { "Fraktion's Rang : ", "" .. rang })

    table.insert(infos, { "", "" })

    table.insert(infos, { "Wanted's : ", "" .. wanteds })

    table.insert(infos, { "", "" })

    table.insert(infos, { "Stvo's : ", "" .. stvo })

    table.insert(infos, { "", "" })

    local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768


    -- vnxDrawButton("info", "annehmen", "Informationen", x / 2 - 190, 60, 100, 40, "informations_window")

    vnxDrawWindow("informations_window_main", "info_Window", "Information", sx*450, sy*205, sx*470, sy*300, "info_close")
    --vnxDrawGridlist(w,id,x,y,sx,sy,col,row,func)

    --vnxDrawGridlist("info_grid","info_grid", 500,190,200,"name",3,5)

    --local a, b = screenx / 2 - 500 / 2, screeny / 2 - 222 / 2
    vnxDrawGridlist("informations_window_main", "dieinfos", sx*450, sy*235, sx*470, sy*270, { { "", sx*300 }, { "", sy*120 } }, infos)
    --Don't change anything here...--
    vnxDestroyWindow("settings_window_main")
    vnxDestroyWindow("fraktions_window_main")
    vnxDestroyWindow("stats_window_main")
    vnxDestroyWindow("handy_window_main")
    vnxDestroyWindow("support_window_main")

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
end


function handy_window() --SPAWN CHANGE 
    local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
    local spawns = {}
    table.insert(spawns, { "", "" })
    table.insert(spawns, { "Noobspawn" })
    table.insert(spawns, { "", "" })
    table.insert(spawns, { "Stadthalle" })
    table.insert(spawns, { "", "" })
    if getElementData(getLocalPlayer(), "fraktion") >= 1 then
        table.insert(spawns, { "Basis" })
        table.insert(spawns, { "", "" })
    end
    if getElementData(getLocalPlayer(), "adminlvl") >= 1 then
        table.insert(spawns, { "Hier" })
        table.insert(spawns, { "", "" })
    end
    local frak = getElementData(getLocalPlayer(), "fraktion")
    if frak == 1 or frak == 6 or frak == 8  or frak == 2 or frak == 9 then
        table.insert(spawns, { "Basis Las Venturas" })
    end
    local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
    vnxDrawWindow("handy_window_main", "window", "Spawn", sx*450, sy*205, sx*470, sy*250, "handy_close")
    vnxDrawGridlist("handy_window_main", "list", sx*450, sy*235, sx*270, sy*220, { { "Ort", sx*200 } }, spawns)
    vnxDrawButton("handy_window_main", "wechseln", "SPAWN\n------------\nWECHSELN", sx*765, sy*300, sx*115, sy*60, "spawnChange")


    --Don't change anything here...--
    vnxDestroyWindow("settings_window_main")
    vnxDestroyWindow("fraktions_window_main")
    vnxDestroyWindow("stats_window_main")
    vnxDestroyWindow("informations_window_main")
    vnxDestroyWindow("support_window_main")

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
end

function support_window()
    local screenX, screenY = guiGetScreenSize()
    local sx, sy = screenX/1366, screenY/768
    vnxDrawWindow("support_window_main", "support_window", "Support", sx*0, sy*0, sx*1366, sy*768, "support_close")
    --local window = guiCreateWindow( sx*450, sy*225, sx*470, sy*300, "", false )
    BrowserForTicketsCP_Background = guiCreateBrowser( sx*0, sy*30, sx*1366, sy*768, false, false, false )
    BrowserForTicketsCP = guiGetBrowser( BrowserForTicketsCP_Background ) -- Get the browser element from gui-browser
    --setBrowserProperty(BrowserForTicketsCP_Background, "mobile", 1)
    setBrowserProperty(BrowserForTicketsCP, "mobile", "1")
    guiSetInputMode("no_binds_when_editing")
    addEventHandler( "onClientBrowserCreated", BrowserForTicketsCP, function( )
        requestBrowserDomains({ "https://cp.venox-reallife.com/?page=support" }, true, function(wasaccepted)
            if wasaccepted then
                outputDebugString("Loading: " .. tostring(isBrowserLoading(BrowserForTicketsCP)))
                outputDebugString("Blocked: "..tostring(isBrowserDomainBlocked("https://cp.venox-reallife.com/?page=support", true)))      
                loadBrowserURL( BrowserForTicketsCP, "https://cp.venox-reallife.com/?page=support" )
                triggerEvent( "hideSpeedometer", getLocalPlayer())
            end
    end)
end)

    --Don't change anything here...--
    vnxDestroyWindow("Selfmenu")
    vnxDestroyWindow("settings")
    vnxDestroyWindow("fraktion")
    vnxDestroyWindow("stats")
    vnxDestroyWindow("info")
    vnxDestroyWindow("handy")
    vnxDestroyWindow("support")
    vnxDestroyWindow("settings_window_main")
    vnxDestroyWindow("fraktions_window_main")
    vnxDestroyWindow("stats_window_main")
    vnxDestroyWindow("informations_window_main")
    vnxDestroyWindow("handy_window_main")

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
end



---------------------------------------- DIE WINDOWS -------------------------------------------------------------------

function spawnChange()
    local selected = vnxGetGridlistSelectedItem("handy_window_main", "list")
    if selected then
        selected = selected[1]
        if selected == "Noobspawn" then
            triggerServerEvent("setPlayerSpawn", getRootElement(), getLocalPlayer(), "noobspawn")
        elseif selected == "Stadthalle" then
            triggerServerEvent("setPlayerSpawn", getRootElement(), getLocalPlayer(), "Stadthalle")
        elseif selected == "Las Venturas" then
            local frak = getElementData(getLocalPlayer(), "fraktion")
			if frak == 1 or frak == 6 or frak == 8  or frak == 2 or frak == 9 then
                triggerServerEvent("setPlayerSpawn", getRootElement(), getLocalPlayer(), "faction", "lv")
            end
        elseif selected == "Basis" then
			triggerServerEvent("setPlayerSpawn", getRootElement(), getLocalPlayer(), "faction", "sf")
        elseif selected == "Hier" then
            triggerServerEvent("setPlayerSpawn", getRootElement(), getLocalPlayer(), "hier")
        end
    end
end


