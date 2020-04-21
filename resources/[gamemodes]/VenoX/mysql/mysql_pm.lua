--[[function pm_func ( player, cmd, target, ... )

	if vnxGetElementData ( player, "adminlvl" ) < 2 then
		outputChatBox ( "PMs sind deaktiviert! Bitte nutze /call, /sms oder schreibe eine E-Mail.", player, 125, 0, 0 )
		return true
	end

	local parametersTable = {...}
	local msg = table.concat( parametersTable, " " ) 
	local money = vnxGetElementData ( player, "money" )
	local pname = getPlayerName ( player )
	if true then
		--if money >= pm_price then
			if target and #msg >= 1 then	
				if getElementData ( getPlayerFromName(target), "loggedin" ) == 1 then
					local msg = "Nachricht von "..pname.."("..timestamp().."): "..msg
					outputChatBox ( "Nachricht wurde gesendet!", player, 0, 125, 0 )
					outputChatBox ( msg, getPlayerFromName(target), 200, 200, 0 )
					--takeMSGMoney ( player )
				else
					if playerUID[target] then
						offlinemsg ( msg, pname, target )
						outputChatBox ( "Der Spieler ist offline - die Nachricht wird später zugestellt!", player, 200, 200, 0 )
						--takeMSGMoney ( player )
					else
						outputChatBox ( "Der Spieler existiert nicht!", player, 125, 0, 0 )
					end
				end
			else
				outputChatBox ( "Gebrauch: /pm [Empfaenger] [Text]", player, 125, 0, 0 )
			end
		--else
		--	outputChatBox ( "Eine PM kostet "..pm_price.." $!", player, 125, 0, 0 )
		--end
	end
end
addCommandHandler ( "pm", pm_func )


function checkmsgs ( player )
	local result = dbPoll ( dbQuery ( handler, "SELECT * FROM pm WHERE EmpfaengerUID = ?", playerUID[getPlayerName ( player )] ), -1 )
	if result and result[1] then
		for i=1, #result do
			outputChatBox ( "Nachricht von "..result[i]["Sender"].."("..result[i]["Datum"].."): "..result[i]["Text"], player, 200, 200, 0 )
		end
		dbExec ( handler, "DELETE FROM pm WHERE EmpfaengerUID = ?", playerUID[getPlayerName ( player )] )
	end
end


function takeMSGMoney ( player )
	--if getElementData ( player, "premium" ) then
	--else
		vnxSetElementData ( player, "money", vnxGetElementData(player,"money")-pm_price )
	--end
end
]]


