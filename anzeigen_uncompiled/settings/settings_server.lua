------------------------
---- By VenoX RL Crew &--
---- Solid_Snake -------
------------------------
function testitlmfao()
	setPlayerHudComponentVisible( source, "all", false ) 
end
addCommandHandler( "radioweg12", testitlmfao )
------------------------------------------------------------------------------------------------------------


addEvent("close_Self_show_hud", true)
addEventHandler( "close_Self_show_hud", getRootElement(), function()
	triggerClientEvent(source, "showhudclient", source, getAccountData(getPlayerAccount(source), "VenoX.HUD"))
end)



function hud_trigger_1(player)
	--local player = client 
	tonumber(setElementData( player, "hud", 1 ))
	--dbExec( player, "UPDATE ?? SET ??=?", "userdata", "hud", 1 )
	--dbExec ( player, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "hud", 1, player )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "hud", "1", "UID", playerUID[player] )
	triggerClientEvent( source, "showhudclient", source, 1)
	outputDebugString( getPlayerName(player) .." hat hud 1 ausgewaehlt." )
end
addEvent( "hud_trigger_1", true )
addEventHandler( "hud_trigger_1", getRootElement(), hud_trigger_1 )
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

function hud_trigger_2(player)
	--local player = client 
	tonumber(setElementData( player, "hud", 2 ))
	--dbExec( name, "UPDATE ?? SET ??=?", "userdata", "hud", 2 )
	--dbExec ( player, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "hud", 2, player )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "hud", "2", "UID", playerUID[player] )
	triggerClientEvent( source, "showhudclient", source, 2)
	--outputDebugString( name.." hat hud 2 ausgewaehlt." )
	outputDebugString ( getPlayerName(player) .." hat die HUD 2 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "hud_trigger_2", true )
addEventHandler( "hud_trigger_2", getRootElement(), hud_trigger_2 )


function hud_trigger_3(player)
	--local player = client 
	tonumber(setElementData( player, "hud", 3 ))
	--dbExec( name, "UPDATE ?? SET ??=?", "userdata", "hud", 2 )
	--dbExec ( player, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "hud", 2, player )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "hud", "3", "UID", playerUID[player] )
	triggerClientEvent( source, "showhudclient", source, 3)
	--outputDebugString( name.." hat hud 2 ausgewaehlt." )
	outputDebugString ( getPlayerName(player) .." hat die HUD 3 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "hud_trigger_3", true )
addEventHandler( "hud_trigger_3", getRootElement(), hud_trigger_3 )

function hud_trigger_4(player)
	--local player = client 
	tonumber(setElementData( player, "hud", 4 ))
	--dbExec( name, "UPDATE ?? SET ??=?", "userdata", "hud", 2 )
	--dbExec ( player, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "hud", 2, player )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "hud", "4", "UID", playerUID[player] )
	triggerClientEvent( source, "showhudclient", source, 4)
	--outputDebugString( name.." hat hud 2 ausgewaehlt." )
	outputDebugString ( getPlayerName(player) .." hat die HUD 4 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "hud_trigger_4", true )
addEventHandler( "hud_trigger_4", getRootElement(), hud_trigger_4 )


----------------------------------------------------------------------
function crosshair_Loose(player)
	vnxSetElementData( player, "crosshair", 0 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "0", "UID", playerUID[player] )
	--dbExec ( handler, "UPDATE userdata SET crosshair = ? WHERE UID = ?", "siteM16(1).png", playerUID[player]  )
	outputChatBox("Crosshair gelöscht / Ab Nächsten Reconnect Aktiv.", player, 125,0,0)
end
addCommandHandler("delcrosshair", crosshair_Loose)

function crosshair_trigger_1(player)
	vnxSetElementData( player, "crosshair", 1 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "1", "UID", playerUID[player] )
	--dbExec ( handler, "UPDATE userdata SET crosshair = ? WHERE UID = ?", "siteM16(1).png", playerUID[player]  )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 1 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_1", true )
addEventHandler( "crosshair_trigger_1", getRootElement(), crosshair_trigger_1 )

function crosshair_trigger_2(player)
	vnxSetElementData( player, "crosshair", 2 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "2", "UID", playerUID[player] )
	--dbExec ( handler, "UPDATE userdata SET crosshair = ? WHERE UID = ?", "siteM16(2).png", playerUID[player]  )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 2 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_2", true )
addEventHandler( "crosshair_trigger_2", getRootElement(), crosshair_trigger_2 )

function crosshair_trigger_3(player)
	vnxSetElementData( player, "crosshair", 3 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "3", "UID", playerUID[player] )
	--dbExec ( handler, "UPDATE userdata SET crosshair = ? WHERE UID = ?", "siteM16(3).png", playerUID[player]  )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 3 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_3", true )
addEventHandler( "crosshair_trigger_3", getRootElement(), crosshair_trigger_3 )

function crosshair_trigger_4(player)
	vnxSetElementData( player, "crosshair", 4 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "4", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 4 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_4", true )
addEventHandler( "crosshair_trigger_4", getRootElement(), crosshair_trigger_4 )

function crosshair_trigger_5(player)
	vnxSetElementData( player, "crosshair", 5 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "5", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 5 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_5", true )
addEventHandler( "crosshair_trigger_5", getRootElement(), crosshair_trigger_5 )

function crosshair_trigger_6(player)
	vnxSetElementData( player, "crosshair_vnx", "6" )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "6", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 6 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_6", true )
addEventHandler( "crosshair_trigger_6", getRootElement(), crosshair_trigger_6 )

function crosshair_trigger_7(player)
	vnxSetElementData( player, "crosshair_vnx", "7" )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "7", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 7 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_7", true )
addEventHandler( "crosshair_trigger_7", getRootElement(), crosshair_trigger_7 )

function crosshair_trigger_8(player)
	vnxSetElementData( player, "crosshair_vnx", 8 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "8", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 8 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_8", true )
addEventHandler( "crosshair_trigger_8", getRootElement(), crosshair_trigger_8 )

function crosshair_trigger_9(player)
	vnxSetElementData( player, "crosshair_vnx", 9 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "9", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 9 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_9", true )
addEventHandler( "crosshair_trigger_9", getRootElement(), crosshair_trigger_9 )

function crosshair_trigger_10(player)
	vnxSetElementData( player, "crosshair_vnx", 10 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "10", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 10 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_10", true )
addEventHandler( "crosshair_trigger_10", getRootElement(), crosshair_trigger_10 )

function crosshair_trigger_11(player)
	vnxSetElementData( player, "crosshair_vnx", 11 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "11", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 11 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_11", true )
addEventHandler( "crosshair_trigger_11", getRootElement(), crosshair_trigger_11 )

function crosshair_trigger_12(player)
	vnxSetElementData( player, "crosshair_vnx", 12 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "12", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 12 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_12", true )
addEventHandler( "crosshair_trigger_12", getRootElement(), crosshair_trigger_12 )

function crosshair_trigger_13(player)
	vnxSetElementData( player, "crosshair_vnx", "13" )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "13", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 13 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_13", true )
addEventHandler( "crosshair_trigger_13", getRootElement(), crosshair_trigger_13 )

function crosshair_trigger_14(player)
	vnxSetElementData( player, "crosshair_vnx", "14" )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "14", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 14 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_14", true )
addEventHandler( "crosshair_trigger_14", getRootElement(), crosshair_trigger_14 )

function crosshair_trigger_15(player)
	vnxSetElementData( player, "crosshair_vnx", "15" )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "15", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 15 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_15", true )
addEventHandler( "crosshair_trigger_15", getRootElement(), crosshair_trigger_15 )



-----------------------------------------------------------

function crosshair_trigger_16(player)
	vnxSetElementData( player, "crosshair", 16 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "16", "UID", playerUID[player] )
	--dbExec ( handler, "UPDATE userdata SET crosshair = ? WHERE UID = ?", "siteM16(1).png", playerUID[player]  )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 16 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_16", true )
addEventHandler( "crosshair_trigger_16", getRootElement(), crosshair_trigger_16 )

function crosshair_trigger_17(player)
	vnxSetElementData( player, "crosshair", 17 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "17", "UID", playerUID[player] )
	--dbExec ( handler, "UPDATE userdata SET crosshair = ? WHERE UID = ?", "siteM16(2).png", playerUID[player]  )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 17 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_17", true )
addEventHandler( "crosshair_trigger_17", getRootElement(), crosshair_trigger_17 )

function crosshair_trigger_18(player)
	vnxSetElementData( player, "crosshair", 18 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "18", "UID", playerUID[player] )
	--dbExec ( handler, "UPDATE userdata SET crosshair = ? WHERE UID = ?", "siteM16(3).png", playerUID[player]  )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 18 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_18", true )
addEventHandler( "crosshair_trigger_18", getRootElement(), crosshair_trigger_18 )

function crosshair_trigger_19(player)
	vnxSetElementData( player, "crosshair", 19 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "19", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 19 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_19", true )
addEventHandler( "crosshair_trigger_19", getRootElement(), crosshair_trigger_19 )

function crosshair_trigger_20(player)
	vnxSetElementData( player, "crosshair", 20 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "20", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 20 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_20", true )
addEventHandler( "crosshair_trigger_20", getRootElement(), crosshair_trigger_20 )

function crosshair_trigger_21(player)
	vnxSetElementData( player, "crosshair", 21 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "21", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 21 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_21", true )
addEventHandler( "crosshair_trigger_21", getRootElement(), crosshair_trigger_21 )

function crosshair_trigger_22(player)
	vnxSetElementData( player, "crosshair", 22 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "22", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 22 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_22", true )
addEventHandler( "crosshair_trigger_22", getRootElement(), crosshair_trigger_22 )

function crosshair_trigger_23(player)
	vnxSetElementData( player, "crosshair", 23 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "23", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 23 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_23", true )
addEventHandler( "crosshair_trigger_23", getRootElement(), crosshair_trigger_23 )

function crosshair_trigger_24(player)
	vnxSetElementData( player, "crosshair", 24 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "24", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 24 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_24", true )
addEventHandler( "crosshair_trigger_24", getRootElement(), crosshair_trigger_24 )

function crosshair_trigger_25(player)
	vnxSetElementData( player, "crosshair", 25 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "25", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 25 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_25", true )
addEventHandler( "crosshair_trigger_25", getRootElement(), crosshair_trigger_25 )

function crosshair_trigger_26(player)
	vnxSetElementData( player, "crosshair", 26 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "26", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 26 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_26", true )
addEventHandler( "crosshair_trigger_26", getRootElement(), crosshair_trigger_26 )

function crosshair_trigger_27(player)
	vnxSetElementData( player, "crosshair", 27 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "27", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 27 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_27", true )
addEventHandler( "crosshair_trigger_27", getRootElement(), crosshair_trigger_27 )

function crosshair_trigger_28(player)
	vnxSetElementData( player, "crosshair", 28 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "28", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 28 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_28", true )
addEventHandler( "crosshair_trigger_28", getRootElement(), crosshair_trigger_28 )

function crosshair_trigger_29(player)
	vnxSetElementData( player, "crosshair", 29 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "29", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 29 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_29", true )
addEventHandler( "crosshair_trigger_29", getRootElement(), crosshair_trigger_29 )

function crosshair_trigger_29(player)
	vnxSetElementData( player, "crosshair_vnx", 29 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "29", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 29 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_29", true )
addEventHandler( "crosshair_trigger_29", getRootElement(), crosshair_trigger_29 )
--------------------------------------------------------------------------------------

function crosshair_trigger_30(player)
	vnxSetElementData( player, "crosshair", 30 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "30", "UID", playerUID[player] )
	--dbExec ( handler, "UPDATE userdata SET crosshair = ? WHERE UID = ?", "siteM16(1).png", playerUID[player]  )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 30 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_30", true )
addEventHandler( "crosshair_trigger_30", getRootElement(), crosshair_trigger_30 )

function crosshair_trigger_31(player)
	vnxSetElementData( player, "crosshair", 31 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "31", "UID", playerUID[player] )
	--dbExec ( handler, "UPDATE userdata SET crosshair = ? WHERE UID = ?", "siteM16(2).png", playerUID[player]  )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 17 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_31", true )
addEventHandler( "crosshair_trigger_31", getRootElement(), crosshair_trigger_31 )

function crosshair_trigger_32(player)
	vnxSetElementData( player, "crosshair", 32 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "32", "UID", playerUID[player] )
	--dbExec ( handler, "UPDATE userdata SET crosshair = ? WHERE UID = ?", "siteM16(3).png", playerUID[player]  )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 32 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_32", true )
addEventHandler( "crosshair_trigger_32", getRootElement(), crosshair_trigger_32 )

function crosshair_trigger_33(player)
	vnxSetElementData( player, "crosshair", 33 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "33", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 33 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_33", true )
addEventHandler( "crosshair_trigger_33", getRootElement(), crosshair_trigger_33 )

function crosshair_trigger_34(player)
	vnxSetElementData( player, "crosshair", 34 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "34", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 34 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_34", true )
addEventHandler( "crosshair_trigger_34", getRootElement(), crosshair_trigger_34 )

function crosshair_trigger_35(player)
	vnxSetElementData( player, "crosshair", 35 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "35", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 21 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_35", true )
addEventHandler( "crosshair_trigger_35", getRootElement(), crosshair_trigger_35 )

function crosshair_trigger_36(player)
	vnxSetElementData( player, "crosshair", 36 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "36", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 36 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_36", true )
addEventHandler( "crosshair_trigger_36", getRootElement(), crosshair_trigger_36 )

function crosshair_trigger_37(player)
	vnxSetElementData( player, "crosshair", 37 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "37", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 37 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_37", true )
addEventHandler( "crosshair_trigger_37", getRootElement(), crosshair_trigger_37 )

function crosshair_trigger_38(player)
	vnxSetElementData( player, "crosshair", 38 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "38", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 38 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_38", true )
addEventHandler( "crosshair_trigger_38", getRootElement(), crosshair_trigger_38 )

function crosshair_trigger_39(player)
	vnxSetElementData( player, "crosshair", 39 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "39", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 39 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_39", true )
addEventHandler( "crosshair_trigger_39", getRootElement(), crosshair_trigger_39 )

function crosshair_trigger_40(player)
	vnxSetElementData( player, "crosshair", 40 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "40", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 40 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_40", true )
addEventHandler( "crosshair_trigger_40", getRootElement(), crosshair_trigger_40 )

function crosshair_trigger_41(player)
	vnxSetElementData( player, "crosshair", 41 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "41", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 41 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_41", true )
addEventHandler( "crosshair_trigger_41", getRootElement(), crosshair_trigger_41 )

function crosshair_trigger_42(player)
	vnxSetElementData( player, "crosshair", 42 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "42", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 42 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_42", true )
addEventHandler( "crosshair_trigger_42", getRootElement(), crosshair_trigger_42 )

function crosshair_trigger_43(player)
	vnxSetElementData( player, "crosshair", 43 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "43", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 43 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_43", true )
addEventHandler( "crosshair_trigger_43", getRootElement(), crosshair_trigger_43 )

function crosshair_trigger_44(player)
	vnxSetElementData( player, "crosshair_vnx", 44 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "44", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 44 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_44", true )
addEventHandler( "crosshair_trigger_44", getRootElement(), crosshair_trigger_44 )

function crosshair_trigger_45(player)
	vnxSetElementData( player, "crosshair_vnx", 45 )
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "crosshair", "45", "UID", playerUID[player] )
	outputDebugString ( getPlayerName(player) .." hat die Crosshair 45 ausgewaehlt", 3, 255, 255, 255)  
end
addEvent( "crosshair_trigger_45", true )
addEventHandler( "crosshair_trigger_45", getRootElement(), crosshair_trigger_45 )