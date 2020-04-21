adminwindowopenstate = false 

function closeAdminWindowNew()
    dgsCloseWindow(MainAdminWindow)
    outputDebugString("Closed.")
    showCursor(false)
    adminwindowopenstate = false 
end 

function formString(text)
	if string.len(text) == 1 then
		text = "0"..text
	end
	return text
end

local screenX, screenY = guiGetScreenSize()
local sx, sy = screenX/1366, screenY/768
local function DrawAdminWindow()
    if adminwindowopenstate == false then 
        showCursor(true)
        MainAdminWindow = dgsCreateWindow ( sx*400, sy*200, sx*600, sy*400, "Admin Window", false, tocolor(255,255,255,255),25,nil,tocolor(0,0,0,160),nil,tocolor(0,0,0,120),nil,true)
        dgsWindowSetSizable(MainAdminWindow,false)
        dgsWindowSetMovable(MainAdminWindow,true)
        local Usergrid = dgsCreateGridList ( sx*10, sy*5, sx*150, sy*350, false, MainAdminWindow,20,tocolor(0,0,0,120), tocolor(255,255,255,255), tocolor(0,0,0,160), tocolor(0,0,0,0),tocolor(0,150,200,255),tocolor(0,150,200,255),nil,nil,nil,nil,nil)
        local closebtnAdminWindow = dgsCreateButton(sx*575, sy-30,25,35,"",false,MainAdminWindow,tocolor(255,255,255,255),nil,nil,":pr0/files/images/GUI/close_btn.png", ":pr0/files/images/GUI/close_btn.png", ":pr0/files/images/GUI/close_btn.png", tocolor(255,255,255,255),tocolor(255,0,0,255))
        local SpielerTab = dgsCreateTabPanel ( sx*170, sy*5, sx*280, sy*350, false, MainAdminWindow, 20, tocolor(0,0,0,0) )
        local SpielerSelTab = dgsCreateTab("Spieler", SpielerTab)
        local FraktionSelTab = dgsCreateTab("Fraktion", SpielerTab)
        local infoselTab = dgsCreateTab("Informationen", SpielerTab)

        local SpielerLabel = dgsCreateLabel(sx*5,sy*5,sx*100,sy*200,"Wähle einen Spieler aus.",false,SpielerSelTab)

        addEventHandler ( "onDgsMouseClick", closebtnAdminWindow, closeAdminWindowNew )
        local adduseringrid = dgsGridListAddColumn( Usergrid, "Spieler", 1 )
        for id, player in ipairs(getElementsByType("player")) do
            row = dgsGridListAddRow ( Usergrid )
            dgsGridListSetItemText ( Usergrid, row, adduseringrid, getPlayerName ( player ) )
            dgsGridListSetItemColor ( Usergrid, row, adduseringrid, tocolor( 255, 255, 255, 255 ) )
        end 
        addEventHandler ( "onDgsMouseClick", Usergrid, function ( )



            if source == Usergrid then 
                local Selected = dgsGridListGetSelectedItem(Usergrid)
                if Selected ~=-1 then 
                    local output = dgsGridListGetItemText(Usergrid,Selected,adduseringrid)
                    if getElementData(getPlayerFromName(output), "loggedin") == 1 then 
                        local ptime = tonumber(getElementData(getPlayerFromName(output),"playingtime")) 
                        local hour = math.floor(ptime/60)
                        local minute = ptime - hour*60
                        local spielzeitawindow = formString(hour)..":"..formString(minute)

                        local adminlvl = tonumber(getElementData(getPlayerFromName(output), "adminlvl"))
                        local status = getElementData(getPlayerFromName(output), "socialState");
                        local bargeld = getPlayerMoney(getPlayerFromName(output))
                        local bankgeld = tonumber(getElementData(getPlayerFromName(output), "bankmoney"))
                        dgsSetText ( SpielerLabel, 
                        "Name : "..output.."\n\n"
                        .."Spielzeit : "..spielzeitawindow.."\n\n"
                        .."Admin Level : "..adminlvl.."\n\n"
                        .."Status : "..status.."\n\n"
                        .."Bargeld : "..bargeld.."\n\n"
                        .."Bankgeld : "..bankgeld.."\n\n"
                    )
                    else 
                        local spielzeitawindow = "nicht Eingeloggt."
                        local adminlvl = "nicht Eingeloggt."
                        local status = "nicht Eingeloggt."
                        local bargeld = "-"
                        local bankgeld = "-"
                        dgsSetText ( SpielerLabel, 
                        "Name : "..output.."\n\n"
                        .."Spielzeit : "..spielzeitawindow.."\n\n"
                        .."Admin Level : "..adminlvl.."\n\n"
                        .."Status : "..status.."\n\n"
                        .."Bargeld : "..bargeld.."\n\n"
                        .."Bankgeld : "..bankgeld.."\n\n"
                    )
                    end 
                end
            end
        end )
        adminwindowopenstate = true 
    end
end  
addCommandHandler("testlib", DrawAdminWindow)