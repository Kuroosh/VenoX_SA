local adminLevels = {
	["VIP"] = 1,
	["Ticketsupporter"] = 2,
	["Supporter"] = 3,
	["Moderator"] = 4,
	["Administrator"] = 5,
	["Stlv.Projektleitung"] = 6,
	["Projektleiter"] = 7
}
local rang = vnxGetElementData ( player, "adminlvl" )
local rank = ""


--[[function globalMessage(thePlayer, cmd, ...) 
    local message = table.concat ( { ... }, " " ) 
    local name = getPlayerName(thePlayer)     

   	if rang == 7 then
		rank = "Projektleitung"
    	outputChatBox("#C89600[GLOBAL]#FFFFFF"..rank..""..name..": #FFFFFF"..message, getRootElement(), 255, 255, 255, true) 
	elseif rang == 1 then
		outputChatBox("#C89600[GLOBAL][VIP]#FFFFFF"..name..": #FFFFFF"..message, getRootElement(), 255, 255, 255, true) 
	elseif rang == 0 then
		outputChatBox("#C89600[GLOBAL]#FFFFFF"..name..": #FFFFFF"..message, getRootElement(), 255, 255, 255, true) 
   	end    
end
addCommandHandler("global", globalMessage) ]]


--local message = table.concat ( { ... }, " " ) 
--local name = getPlayerName(player)  
globalchatstatus = "an"

function globalMessage ( player, cmd, ... )
	if getElementData(player, "globalchatstatus") == 1 then 
		triggerClientEvent ( player, "infobox_start", getRootElement(), "Der Globalchat ist ausgeschaltet! \nNutze /globalset um ihn Anzuschalten ", 5000, 125, 0, 0 )
	else 
		if globalchatstatus == "aus" then 
			triggerClientEvent ( player, "infobox_start", getRootElement(), "Der Globalchat ist ausgeschaltet von der Projektleitung!", 5000, 125, 0, 0 )
		elseif globalchatstatus == "an" then 
			for i, v in ipairs(getElementsByType("player")) do
				local ok = getElementData(v, "globalchatstatus")
				if ok == 0 or ok == nil or ok == false then 
						local parametersTable = {...}
						local stringWithAllParameters = table.concat( parametersTable, " " )
						local message = table.concat ( { ... }, " " ) 
						local name = getPlayerName(player)  
						local rang = vnxGetElementData ( player, "adminlvl" )
						local rank = ""
						if vnxGetElementData ( player, "playingtime" ) >= 180 then
							if rang == 0 then
								rank = ""
								outputChatBox("#00BFFF[GLOBAL]#FFFFFF"..name..": #FFFFFF"..message, v, 255, 255, 255, true)
								outputLog ( "[ "..getPlayerName(player)..": "..message.." ]", "globalchat" )
							elseif rang == 1 then
								rank = "[VIP]"
								outputChatBox("#00BFFF[GLOBAL]#53006D"..rank.."	#FFFFFF"..name..": #FFFFFF"..message, v, 255, 255, 255, true) 
								outputLog ( "[ "..getPlayerName(player)..": "..message.." ]", "globalchat" )
							elseif rang == 2 then
								rank = "[VnX]"
								outputChatBox("#00BFFF[GLOBAL]#C800C8"..rank.."	#FFFFFF"..name..": #FFFFFF"..message, v, 255, 255, 255, true) 
								outputLog ( "[ "..getPlayerName(player)..": "..message.." ]", "globalchat" )
							elseif rang == 3 then
								rank = "[VnX]"
								outputChatBox("#00BFFF[GLOBAL]#006600"..rank.."	#FFFFFF"..name..": #FFFFFF"..message, v, 255, 255, 255, true) 
								outputLog ( "[ "..getPlayerName(player)..": "..message.." ]", "globalchat" )
							elseif rang == 4 then
								rank = "[VnX]"
								outputChatBox("#00BFFF[GLOBAL]#002DE0"..rank.."	#FFFFFF"..name..": #FFFFFF"..message, v, 255, 255, 255, true)
								outputLog ( "[ "..getPlayerName(player)..": "..message.." ]", "globalchat" ) 
							elseif rang == 5 then
								rank = "[VnX]"
								outputChatBox("#00BFFF[GLOBAL]#E8AE00"..rank.."	#FFFFFF"..name..": #FFFFFF"..message, v, 255, 255, 255, true) 
								outputLog ( "[ "..getPlayerName(player)..": "..message.." ]", "globalchat" )
							elseif rang == 6 then
								rank = "[VnX]"
								outputChatBox("#00BFFF[GLOBAL]#EC0000"..rank.." #FFFFFF"..name..": #FFFFFF"..message, v, 255, 255, 255, true) 
								outputLog ( "[ "..getPlayerName(player)..": "..message.." ]", "globalchat" )

							elseif rang == 7 then
								rank = "[VnX]"
								outputChatBox("#00BFFF[GLOBAL]#B40000"..rank.." #FFFFFF"..name..": #FFFFFF"..message, v, 255, 255, 255, true)
								outputLog ( "[ "..getPlayerName(player)..": "..message.." ]", "globalchat" ) 
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu musst erst 3H spielen.", 5000, 125, 0, 0 )
						end
					end
				end
			end 
	end 
end
addCommandHandler("global", globalMessage)

function globalchatstatus_vnx(player)
	if getElementData(player,"globalchatstatus") == 0 or getElementData(player,"globalchatstatus") == false or getElementData(player,"globalchatstatus") == nil then
		setElementData(player, "globalchatstatus", 1)
		triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast den Globalchat Ausgeschaltet!", 5000, 125, 0, 0 )
	else
		setElementData(player, "globalchatstatus", 0)
		triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast den Globalchat Angeschaltet!", 5000, 125, 0, 0 )
	end
end 
addCommandHandler("globalset", globalchatstatus_vnx)



function shutdownglobalchat_vnx(player, cmd)
	local rang = vnxGetElementData ( player, "adminlvl" )
	if globalchatstatus == "aus" then 
		triggerClientEvent ( player, "infobox_start", getRootElement(), "Der Globalchat ist bereits Ausgeschaltet!", 5000, 125, 0, 0 )
	else 
		if rang >= 5 then 	
			globalchatstatus = "aus"
			outputChatBox("Das Admin-Team hat den Globalchat ausgeschaltet!", getRootElement(), 150, 0, 0, true)
		end
	end
end 
addCommandHandler("aus_global", shutdownglobalchat_vnx)

function startglobalchat_vnx(player, cmd)
	local rang = vnxGetElementData ( player, "adminlvl" )
	if globalchatstatus == "an" then 
		triggerClientEvent ( player, "infobox_start", getRootElement(), "Der Globalchat ist bereits Angeschaltet!", 5000, 125, 0, 0 )
	else 
		if rang >= 5 then 	
			globalchatstatus = "an"
			outputChatBox("Das Admin-Team hat den Globalchat angeschaltet!", getRootElement(), 0, 150, 0, true)
		end
	end
end 
addCommandHandler("an_global", startglobalchat_vnx)