local screenX, screenY = guiGetScreenSize()
local sx, sy = screenX/1366, screenY/768
local client = getLocalPlayer()
local header_click_vnx = "nix"

function render_name()
    dxDrawRectangle(sx*777, sy*241, sx*210, sy*25, tocolor(1, 0, 0, 209), false)
    dxDrawText(vnxClientGetElementData("curclicked"), sx*776 - 1, sy*241 - 1, sx*987 - 1, sy*266 - 1, tocolor(0, 0, 0, 255), 0.90, "diploma", "center", "center", false, false, false, false, false)
    dxDrawText(vnxClientGetElementData("curclicked"), sx*776 + 1, sy*241 - 1, sx*987 + 1, sy*266 - 1, tocolor(0, 0, 0, 255), 0.90, "diploma", "center", "center", false, false, false, false, false)
    dxDrawText(vnxClientGetElementData("curclicked"), sx*776 - 1, sy*241 + 1, sx*987 - 1, sy*266 + 1, tocolor(0, 0, 0, 255), 0.90, "diploma", "center", "center", false, false, false, false, false)
    dxDrawText(vnxClientGetElementData("curclicked"),sx*776 + 1, sy*241 + 1, sx*987 + 1, sy*266 + 1, tocolor(0, 0, 0, 255), 0.90, "diploma", "center", "center", false, false, false, false, false)
    dxDrawText(vnxClientGetElementData("curclicked"), sx*776, sy*241, sx*987, sy*266, tocolor(255, 255, 255, 255), 0.90, "diploma", "center", "center", false, false, false, false, false)

end 

function close_playerclick_client()
    showCursor(false)
    vnxDestroyWindow("playerclick_main_vnx")
    vnxDestroyWindow("playerclick_show_vnx")
    vnxDestroyWindow("playerclick_give_vnx")
    vnxDestroyWindow("playerclick_faction_vnx")
    vnxDestroyWindow("playerclick_dance_vnx")
    vnxDestroyWindow("playerclick_close_vnx")
    removeEventHandler("onClientRender", getRootElement(), render_name)
    ----------------------------------------
    close_license_show()
    close_give_item_func()
    close_fraktion_show_click()
    close_fortnitedance_show_click()
end 
------------------------------------------------------------------------------------------------------------------------
function close_license_show()
    removeEventHandler("onClientRender", getRootElement(), drawscheine_text)
    vnxDestroyWindow("playerclick_show_license_vnx")
    vnxDestroyWindow("playerclick_show_gwdnote_vnx")
    vnxDestroyWindow("playerclick_show_vnx_show")
end 
function close_give_item_func()
    vnxDestroyWindow("playerclick_give_vnx_background")
    vnxDestroyWindow("item_list_grid")
    vnxDestroyWindow("item_give_button_vnx")
    vnxDestroyWindow("edit_menge_grid_vnx")
end 
function close_fraktion_show_click()
    removeEventHandler("onClientRender", getRootElement(), drawscheine_text)
    vnxDestroyWindow("playerclick_show_vnx_show")
    vnxDestroyWindow("playerclick_cuff_vnx")
    vnxDestroyWindow("playerclick_takeweapons_vnx")
    vnxDestroyWindow("playerclick_frisk_vnx")
    vnxDestroyWindow("playerclick_takeillegal_vnx")
    vnxDestroyWindow("playerclick_staatstest_vnx")
    vnxDestroyWindow("playerclick_takeweaponlicense_vnx")
end 
function close_fortnitedance_show_click()
    vnxDestroyWindow("fortnitedance_select_button_vnx")
    vnxDestroyWindow("fortnitedance_grid_vnx")
    vnxDestroyWindow("playerclick_show_vnx_show")
end 
------------------------------------------------------------------------------------------------------------------------

function drawscheine_text()
    if header_click_vnx == "Scheine" then 
        dxDrawText("Scheine Zeigen :", sx*995 - 1, sy*268 - 1, sx*1241 - 1, sy*300 - 1, tocolor(0, 0, 0, 255), 1.00, "arial", "center", "center", false, false, false, false, false)
        dxDrawText("Scheine Zeigen :", sx*995 + 1, sy*268 - 1, sx*1241 + 1, sy*300 - 1, tocolor(0, 0, 0, 255), 1.00, "arial", "center", "center", false, false, false, false, false)
        dxDrawText("Scheine Zeigen :", sx*995 - 1, sy*268 + 1, sx*1241 - 1, sy*300 + 1, tocolor(0, 0, 0, 255), 1.00, "arial", "center", "center", false, false, false, false, false)
        dxDrawText("Scheine Zeigen :", sx*995 + 1, sy*268 + 1, sx*1241 + 1, sy*300 + 1, tocolor(0, 0, 0, 255), 1.00, "arial", "center", "center", false, false, false, false, false)
        dxDrawText("Scheine Zeigen :", sx*995, sy*268, sx*1241, sy*300, tocolor(255, 255, 255, 255), 1.00, "arial", "center", "center", false, false, false, false, false)
    elseif header_click_vnx == "Fraktion" then 
        dxDrawText("Aktion ausführen :", sx*995 - 1, sy*268 - 1, sx*1241 - 1, sy*300 - 1, tocolor(0, 0, 0, 255), 1.00, "arial", "center", "center", false, false, false, false, false)
        dxDrawText("Aktion ausführen :", sx*995 + 1, sy*268 - 1, sx*1241 + 1, sy*300 - 1, tocolor(0, 0, 0, 255), 1.00, "arial", "center", "center", false, false, false, false, false)
        dxDrawText("Aktion ausführen :", sx*995 - 1, sy*268 + 1, sx*1241 - 1, sy*300 + 1, tocolor(0, 0, 0, 255), 1.00, "arial", "center", "center", false, false, false, false, false)
        dxDrawText("Aktion ausführen :", sx*995 + 1, sy*268 + 1, sx*1241 + 1, sy*300 + 1, tocolor(0, 0, 0, 255), 1.00, "arial", "center", "center", false, false, false, false, false)
        dxDrawText("Aktion ausführen :", sx*995, sy*268, sx*1241, sy*300, tocolor(255, 255, 255, 255), 1.00, "arial", "center", "center", false, false, false, false, false)
    end 
end 
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
function show_license_to_player_client()
    triggerServerEvent ( "showLicenses", getLocalPlayer(), getLocalPlayer() )
end 
function show_gwdnote_to_player_client()
    triggerServerEvent ( "showGWD", getLocalPlayer(), getLocalPlayer() )
end 

function tie_playerclick_client()
	triggerServerEvent ( "cuffGUI", getLocalPlayer(), getLocalPlayer(), "cuff", vnxClientGetElementData("curclicked") )
end 
function takeweapons_playerclick_client()
	triggerServerEvent ( "takeweapons", getLocalPlayer(), getLocalPlayer(), "takeweapons", vnxClientGetElementData("curclicked") )
end 
function frisk_playerclick_client()
	triggerServerEvent ( "friskGUI", getLocalPlayer(), getLocalPlayer(), "frisk", vnxClientGetElementData("curclicked") )
end 
function takeillegal_playerclick_client()
	triggerServerEvent ( "takeillegalGUI", getLocalPlayer(), getLocalPlayer(), "takeillegal", vnxClientGetElementData("curclicked") )

end 
function staatstest_playerclick_client()
	triggerServerEvent ( "test", getLocalPlayer(), getLocalPlayer(), "test", vnxClientGetElementData("curclicked") )
end 
function takewlicense_playerclick_client()
	triggerServerEvent ( "takegunlicenseGUI", getLocalPlayer(), vnxClientGetElementData("curclicked") )
end 
function giveitem_tootherp_playerclick_client()
	local selectedText = vnxGetGridlistSelectedItem("item_list_grid","Gridlist mit allen items")[1]
	local ammountedit_playerclick = vnxGetEditText("edit_menge_grid_vnx", "edit")
	if selectedText == "Geld : " then
		triggerServerEvent ( "geldgeben", getLocalPlayer(), ammountedit_playerclick )
	elseif selectedText == "Kokain : " then 
		triggerServerEvent ( "giveitem", getLocalPlayer(), vnxClientGetElementData ( "curclicked" ), "kokain", nil, tonumber (ammountedit_playerclick) )
	elseif selectedText == "Benzinkannister : " then 
		triggerServerEvent ( "giveitem", getLocalPlayer(), vnxClientGetElementData ( "curclicked" ), "fill", nil, tonumber (ammountedit_playerclick) )
	elseif selectedText == "Hanf-samen : " then 
		triggerServerEvent ( "giveitem", getLocalPlayer(), vnxClientGetElementData ( "curclicked" ), "grow", nil, tonumber (ammountedit_playerclick) )
	elseif selectedText == "Weed : " then 
		triggerServerEvent ( "giveitem", getLocalPlayer(), vnxClientGetElementData ( "curclicked" ), "usedrugs", nil, tonumber (ammountedit_playerclick) )
	elseif selectedText == "Mats : " then 
		triggerServerEvent ( "giveitem", getLocalPlayer(), vnxClientGetElementData ( "curclicked" ), "mats", nil, tonumber (ammountedit_playerclick) )
	elseif selectedText == "Zigaretten : " then 
		triggerServerEvent ( "giveitem", getLocalPlayer(), vnxClientGetElementData ( "curclicked" ), "smoke", nil, tonumber (ammountedit_playerclick) )
	elseif selectedText == "Medikits : " then 
		triggerServerEvent ( "giveitem", getLocalPlayer(), vnxClientGetElementData ( "curclicked" ), "medikits", nil, tonumber (ammountedit_playerclick) )
	end
end 
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
function show_item_give_func()
    close_license_show()
    close_fraktion_show_click()
    close_fortnitedance_show_click()
    local drogen = tonumber(getElementData(getLocalPlayer(), "drugs"))
    local itemlist_grid_vnx = {}
    if drogen >= 1 then 
        table.insert(itemlist_grid_vnx, { "Weed : ", "" ..drogen })
	end 
	if getPlayerMoney(getLocalPlayer()) >= 1 then 
        table.insert(itemlist_grid_vnx, { "Geld : ", "" ..getPlayerMoney(getLocalPlayer()) })
    end 
    if tonumber(getElementData(getLocalPlayer(), "koks")) >= 1 then 
        table.insert(itemlist_grid_vnx, { "Kokain : ", "" .. tonumber(getElementData(getLocalPlayer(), "koks")) })
    end
    if tonumber(getElementData(getLocalPlayer(), "benzinkannister")) >= 1 then 
        table.insert(itemlist_grid_vnx, { "Benzinkannister : ", "" .. tonumber(getElementData(getLocalPlayer(), "benzinkannister")) })
    end
    if tonumber(getElementData(getLocalPlayer(), "flowerseeds")) >= 1 then 
        table.insert(itemlist_grid_vnx, { "Hanf-samen : ", "" .. tonumber(getElementData(getLocalPlayer(), "flowerseeds")) })
    end
    if tonumber(getElementData(getLocalPlayer(), "zigaretten")) >= 1 then 
        table.insert(itemlist_grid_vnx, { "Zigaretten : ", "" .. tonumber(getElementData(getLocalPlayer(), "zigaretten")) })
    end
    if tonumber(getElementData(getLocalPlayer(), "mats")) >= 1 then 
        table.insert(itemlist_grid_vnx, { "Mats : ", "" .. tonumber(getElementData(getLocalPlayer(), "mats")) })
    end
    if tonumber(getElementData(getLocalPlayer(), "medikits")) >= 1 then 
        table.insert(itemlist_grid_vnx, { "Medikits : ", "" .. tonumber(getElementData(getLocalPlayer(), "medikits")) })
    end 
    vnxDrawRectangle("playerclick_give_vnx_background","Background Rec",sx*992,sy*269,sx*200,sy*181,tocolor(0,0,0,176) )
    vnxDrawGridlist("item_list_grid","Gridlist mit allen items",sx*992,sy*269,sx*200,sy*107,{ { "Item", sx*130 }, { "Menge", sy*120 } }, itemlist_grid_vnx)
    vnxDrawEdit("edit_menge_grid_vnx", "edit", "", sx*994, sy*385, sx*196,true,false)
    vnxDrawButtonColored("item_give_button_vnx", "Zeigen Button", "Geben", sx*994, sy*416, sx*196, sy*30, tocolor(40,40,40,50), tocolor(80,80,80,70), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,200,255,255), tocolor(0,200,255,255),"giveitem_tootherp_playerclick_client")
end 
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

function show_fraktion_functions_window()
    close_give_item_func()
    close_license_show()
    close_fortnitedance_show_click()
    header_click_vnx = "Fraktion"
    addEventHandler("onClientRender", getRootElement(), drawscheine_text)
    vnxDrawRectangle("playerclick_show_vnx_show","Background Rec",sx*995,sy*269,sx*240,sy*181,tocolor(0,0,0,176))
    vnxDrawButtonColored("playerclick_cuff_vnx", "Zeigen Button", "Fesseln", sx*1008, sy*308, sx*100, sy*42, tocolor(0,200,0,50), tocolor(0,220,0,70), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0),"tie_playerclick_client")
    vnxDrawButtonColored("playerclick_takeweapons_vnx", "Zeigen Button", "Entwaffnen", sx*1123, sy*308, sx*100, sy*42, tocolor(200,0,0,50), tocolor(220,0,0,70), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0),"takeweapons_playerclick_client")
    vnxDrawButtonColored("playerclick_frisk_vnx", "Zeigen Button", "Durchsuchen", sx*1008, sy*353, sx*100, sy*42, tocolor(200,0,0,50), tocolor(220,0,0,70), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0),"frisk_playerclick_client")
    vnxDrawButtonColored("playerclick_takeillegal_vnx", "Zeigen Button", "Illegales\nAbnehemen", sx*1123, sy*353, sx*100, sy*42, tocolor(200,0,0,50), tocolor(220,0,0,70), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0),"takeillegal_playerclick_client")
    vnxDrawButtonColored("playerclick_staatstest_vnx", "Zeigen Button", "Drogen/Alkohol\nTest", sx*1008, sy*398, sx*100, sy*42, tocolor(0,200,0,50), tocolor(0,220,0,70), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0),"staatstest_playerclick_client")
    vnxDrawButtonColored("playerclick_takeweaponlicense_vnx", "Zeigen Button", "Waffenschein\nAbnehmen", sx*1123, sy*398, sx*100, sy*42, tocolor(200,0,0,50), tocolor(220,0,0,70), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0),"takewlicense_playerclick_client")
end 
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

function trigger_dance_offer_window_client()
    local fortniteID = vnxGetGridlistSelectedItem("fortnitedance_grid_vnx","Gridlist mit allen taenzen")[2]
    triggerServerEvent ( "offerdancefortnite", getLocalPlayer(), getLocalPlayer(), vnxClientGetElementData("curclicked") , fortniteID)
end 

function show_dance_offer_window_client()
    close_give_item_func()
    close_fraktion_show_click()
    close_license_show()
    local fortnitetaenze = {}
    table.insert(fortnitetaenze, { "Fortnite", "1"})
    table.insert(fortnitetaenze, { "Fortnite", "2"})
    table.insert(fortnitetaenze, { "Fortnite", "3"})
    table.insert(fortnitetaenze, { "Fortnite", "4"})
    table.insert(fortnitetaenze, { "Fortnite", "5"})
    table.insert(fortnitetaenze, { "Fortnite", "6"})
    table.insert(fortnitetaenze, { "Fortnite", "7"})
    table.insert(fortnitetaenze, { "Fortnite", "8"})
    table.insert(fortnitetaenze, { "Fortnite", "9"})
    table.insert(fortnitetaenze, { "Fortnite", "10"})
    table.insert(fortnitetaenze, { "Fortnite", "11"})
    table.insert(fortnitetaenze, { "Fortnite", "12"})
    table.insert(fortnitetaenze, { "Fortnite", "13"})
    vnxDrawRectangle("playerclick_give_vnx_background","Background Rec",sx*992,sy*269,sx*200,sy*181,tocolor(0,0,0,176) )
    vnxDrawButtonColored("fortnitedance_select_button_vnx", "Zeigen Button", "Auswählen", sx*994, sy*416, sx*196, sy*30, tocolor(40,40,40,50), tocolor(80,80,80,70), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,200,255,255), tocolor(0,200,255,255),"trigger_dance_offer_window_client")
    vnxDrawGridlist("fortnitedance_grid_vnx","Gridlist mit allen taenzen",sx*992,sy*269,sx*200,sy*120,{ { "Name", sx*130 }, { "ID", sy*120 } }, fortnitetaenze)
end 
------------------------------------------------------------------------------------------------------------------------
function show_playerclick_client()
    close_give_item_func()
    close_fraktion_show_click()
    close_fortnitedance_show_click()
    header_click_vnx = "Scheine"
    addEventHandler("onClientRender", getRootElement(), drawscheine_text)
    vnxDrawRectangle("playerclick_show_vnx_show","Background Rec",sx*995,sy*269,sx*246,sy*83,tocolor(0,0,0,176) )
    vnxDrawButtonColored("playerclick_show_license_vnx", "Zeigen Button", "Scheine", sx*1005, sy*300, sx*100, sy*42, tocolor(0,150,255,50), tocolor(0,200,255,70), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0),"show_license_to_player_client")
    vnxDrawButtonColored("playerclick_show_gwdnote_vnx", "Zeigen Button", "GWD-Note", sx*1131, sy*300, sx*100, sy*42, tocolor(0,200,0,50), tocolor(0,220,0,70), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0),"show_gwdnote_to_player_client")
end 


function showplayerklick_client()
    showCursor(true )
    addEventHandler("onClientRender", getRootElement(), render_name)
    vnxDrawRectangle("playerclick_main_vnx","Background Rec",sx*776,sy*269,sx*210,sy*181,tocolor(0,0,0,176) )
    vnxDrawButtonColored("playerclick_show_vnx", "Zeigen Button", "Zeigen", sx*776, sy*270, sx*210, sy*35, tocolor(0,105,145,50), tocolor(0,200,255,70), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0),"show_playerclick_client")
    vnxDrawButtonColored("playerclick_give_vnx", "Give Button", "Geben", sx*776, sy*306, sx*210, sy*35, tocolor(0,105,145,50), tocolor(0,200,255,70), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0),"show_item_give_func")
    vnxDrawButtonColored("playerclick_faction_vnx", "Faction Button", "Fraktion", sx*776, sy*342, sx*210, sy*35, tocolor(0,105,145,50), tocolor(0,200,255,70), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0),"show_fraktion_functions_window")
    vnxDrawButtonColored("playerclick_dance_vnx", "Dace Button", "Zum Tanz Auffordern", sx*776, sy*378, sx*210, sy*35, tocolor(0,105,145,50), tocolor(0,200,255,70), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0),"show_dance_offer_window_client")
    vnxDrawButtonColored("playerclick_close_vnx", "close Button", "Schließen", sx*776, sy*414, sx*210, sy*35, tocolor(0,105,145,50), tocolor(0,200,255,70), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0), "close_playerclick_client")
end 
addEvent ( "ShowInteraktionsguiGui", true )
addEventHandler ( "ShowInteraktionsguiGui", getRootElement(), showplayerklick_client )