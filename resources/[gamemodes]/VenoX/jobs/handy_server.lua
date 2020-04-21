function handychange_func ( player )

	if player == client then
		if vnxGetElementData ( player, "handystate" ) == "on" then
			vnxSetElementData ( player, "handystate", "off" )
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nHandy ausgeschaltet!", 5000, 0, 200, 0 )
		else
			vnxSetElementData ( player, "handystate", "on" )
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nHandy angeschaltet!", 5000, 0, 200, 0 )
		end
	end
end
addEvent ( "handychange", true )
addEventHandler ( "handychange", getRootElement(), handychange_func )

function smscmd_func ( player, cmd, number, ... )

	if number then
		local parametersTable = {...}
		local sendtext = table.concat( parametersTable, " " )
		if sendtext then
			if #sendtext >= 1 then
				SMS_func ( player, tonumber(number), sendtext )
			else
				outputChatBox ( "Bitte gib einen Text ein!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Bitte gib einen Text ein!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Bitte gib eine gueltige Nummer an!", player, 125, 0, 0 )
	end
end
--addCommandHandler ( "sms", smscmd_func )

function callcmd_func ( player, cmd, number )

	callSomeone_func ( player, number )
end
addCommandHandler ( "call", callcmd_func )

function SMS_func ( player, sendnr, sendtext )

	if player == client or not client then
		if vnxGetElementData ( player, "handystate" ) == "on" then
			local pmoney = vnxGetElementData ( player, "money" )
			if ( vnxGetElementData ( player, "handyType" ) == 2 and vnxGetElementData ( player, "handyCosts" ) >= smsprice ) or vnxGetElementData ( player, "handyType" ) ~= 2 then
				local players = getElementsByType("player")
				for i=1, #players do 
					local playeritem = players[i]
					if vnxGetElementData ( playeritem, "telenr" ) then
						if vnxGetElementData ( playeritem, "telenr" ) == sendnr then
							if vnxGetElementData ( playeritem, "handystate" ) == "on" then
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSMS versendet!", 5000, 0, 200, 0 )
								playSoundFrontEnd ( player, 40 )
								triggerClientEvent ( playeritem, "phonesms", player )
								--outputChatBox ( "#00C8FF[SMS von : #FFFFFF"..getPlayerName(player).." #00C8FF][#FFFFFF"..vnxGetElementData(player,"telenr").."#00C8FF] : #FFFFFF"..sendtext.."", 255, 255, 255 ,true)
								outputChatBox ( "#00C8FF[SMS Von : #FFFFFF"..getPlayerName(player).." #00C8FF][#FFFFFF"..vnxGetElementData(player,"telenr").."#00C8FF] : #FFFFFF"..sendtext.."", playeritem, 255, 255, 0, true )
								outputChatBox ( "#00C8FF[SMS An : #FFFFFF"..getPlayerName(playeritem).." #00C8FF][#FFFFFF"..vnxGetElementData(player,"telenr").."#00C8FF] : #FFFFFF"..sendtext.."", player, 255, 255, 255 ,true)
								outputLog (  getPlayerName( player ).." hat an "..sendnr.." eine SMS gesendet : "..sendtext, "sms" )
								if vnxGetElementData ( player, "handyType" ) == 2 then
									vnxSetElementData ( player, "handyCosts", vnxGetElementData ( player, "handyCosts" ) - smsprice )
								elseif vnxGetElementData ( player, "handyType" ) == 1 then
									vnxSetElementData ( player, "handyCosts", vnxGetElementData ( player, "handyCosts" ) + smsprice )
								end
								return
							end
						end
					end
				end
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Das Handy des\nSpielers ist ausge-\nschaltet oder der\nSpieler ist nicht\nonline!", 7500, 125, 0, 0 )
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht\nmehr genug Guthaben!\nDu kannst im 24-7\ndein Guthaben\naufladen.", 5000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDein Handy ist\naus!", 5000, 125, 0, 0 )
		end
	end
end
addEvent ( "SMS", true )
addEventHandler ( "SMS", getRootElement(), SMS_func )

function callSomeone_func ( player, number )

	if player == client or not client then
		if vnxGetElementData ( player, "handystate" ) == "on" then
			local pmoney = vnxGetElementData ( player, "money" )
			if number == "*100#" then
				if vnxGetElementData ( player, "handyType" ) == 2 then
					outputChatBox ( "Aktuelles Guthaben: "..vnxGetElementData ( player, "handyCosts" ).." $", player, 200, 200, 0 )
				elseif vnxGetElementData ( player, "handyType" ) == 3 then
					outputChatBox ( "Du hast eine Flatrate, Kosten pro Stunde: 50 $", player, 200, 200, 0 )
				elseif vnxGetElementData ( player, "handyType" ) == 1 then
					outputChatBox ( "Aktuelle Kosten: "..vnxGetElementData ( player, "handyCosts" ).." $", player, 200, 200, 0 )
				end
			elseif not speznr[tonumber(number)] then
				number = tonumber ( number )
				if vnxGetElementData(player,"telenr") == number then
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu kannst dich nicht\nselber Anrufen!", 7500, 125, 0, 0 )
					
				else	
					if ( vnxGetElementData ( player, "handyType" ) == 2 and vnxGetElementData ( player, "handyCosts" ) >= callprice ) or vnxGetElementData ( player, "handyType" ) ~= 2 then
						local players = getElementsByType("player")
						for i=1, #players do 
							local playeritem = players[i]
							if vnxGetElementData ( playeritem, "telenr" ) then
								if vnxGetElementData ( playeritem, "telenr" ) == number then
									if vnxGetElementData ( playeritem, "handystate" ) == "on" then
										if not vnxGetElementData ( player, "call" ) then
											if not vnxGetElementData ( playeritem, "call" ) then
												outputChatBox ( "Tippe /hangup ( /hup ), um aufzulegen!", player, 200, 200, 200 )
												outputChatBox ( getPlayerName(player).." (Nummer: "..vnxGetElementData(player,"telenr")..") ruft an, tippe /pickup ( /pup ) um abzunehmen!", playeritem, 50, 125, 0 )
												vnxSetElementData ( player, "calls", playeritem )
												vnxSetElementData ( player, "call", true )
												vnxSetElementData ( playeritem, "calledby", player )
												triggerClientEvent ( player, "phonewartezeichen", player )
												triggerClientEvent ( playeritem, "phonesound", player )
												if vnxGetElementData ( player, "handyType" ) == 2 then
													vnxSetElementData ( player, "handyCosts", vnxGetElementData ( player, "handyCosts" ) - callprice )
												elseif vnxGetElementData ( player, "handyType" ) == 1 then
													vnxSetElementData ( player, "handyCosts", vnxGetElementData ( player, "handyCosts" ) + callprice )
												end
												return
											else
												outputChatBox ( "Besetzt...", player, 125, 0, 0 )
												triggerClientEvent ( player, "phonesound", player )
											end
										else
											outputChatBox ( "Du telefonierst bereits!", player, 125, 0, 0 )
										end
									else
										outputChatBox ( "Handy ist ausgeschaltet!", player, 125, 0, 0 )
									end
									return
								end	
							end
						end
							triggerClientEvent ( player, "infobox_start", getRootElement(), "Das Handy des\nSpielers ist ausge-\nschaltet oder der\nSpieler ist nicht\nonline!", 7500, 125, 0, 0 )
							triggerClientEvent ( player, "phonekeinanschluss", player )
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht\ngenug Geld!\nEin Anruf kostet\n"..callprice.." $!", 7500, 125, 0, 0 )
					end
				end
			else
				--speznr = { [110]=true, [112]=true, [300]=true, [400]=true }
				number = tonumber ( number )
				if number == 110 then
					outputChatBox ( "Sie sprechen mit der Polizei von San Fierro - bitte nennen Sie den Namen des Täters.", player, 0, 0, 125 )
					vnxSetElementData ( player, "callswithpolice", true )
				elseif number == 112 then
					if getFactionMembersOnline(10) > 0 then
						outputChatBox ( "Sie sprechen mit dem Krankenhaus von San Fierro - bitte nennen Sie uns ihr Anliegen.", player, 0, 0, 125 )
						vnxSetElementData ( player, "callswithmedic", true )
					else
						outputChatBox ( "Tut uns Leid, jedoch sind alle Sanitäter anderweitig beschäftigt.", player, 0, 0, 125 )
					end
				elseif number == 300 then
					if getFactionMembersOnline(11) > 0 then
						outputChatBox ( "Sie sprechen mit dem Mechanikerzentrum von San Fierro - bitte nennen Sie uns ihr Anliegen.", player, 0, 0, 125 )
						vnxSetElementData ( player, "callswithmechaniker", true )
					else
						outputChatBox ( "Tut uns Leid, jedoch sind alle Mechaniker anderweitig beschäftigt.", player, 0, 0, 125 )
					end
				elseif number == 400 then
					orderTaxi ( player )
				end
			end
		else 
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDein Handy ist\naus!", 7500, 125, 0, 0 )
		end
	end
end
addEvent ( "callSomeone", true )
addEventHandler ( "callSomeone", getRootElement(), callSomeone_func )

function hangup ( player )
	if isElement ( vnxGetElementData ( player, "callswith" ) ) then
		local caller = vnxGetElementData ( player, "callswith" )
		vnxSetElementData ( caller, "call", false )
		vnxSetElementData ( caller, "callswith", "none" )
		vnxSetElementData ( caller, "calledby", "none" )
		vnxSetElementData ( caller, "calls", "none" )
		outputChatBox ( "Aufgelegt.", caller, 200, 200, 200 )
		triggerClientEvent ( caller, "stopphonesound", caller )
	elseif isElement ( vnxGetElementData ( player, "calledby" ) ) then
		local caller = vnxGetElementData ( player, "calledby" )
		vnxSetElementData ( caller, "call", false )
		vnxSetElementData ( caller, "callswith", "none" )
		vnxSetElementData ( caller, "calledby", "none" )
		vnxSetElementData ( caller, "calls", "none" )
		triggerClientEvent ( caller, "stopphonesound", caller )
		outputChatBox ( "Aufgelegt.", caller, 200, 200, 200 )
	end
	vnxSetElementData ( player, "call", false )
	vnxSetElementData ( player, "callswith", "none" )
	vnxSetElementData ( player, "calledby", "none" )
	vnxSetElementData ( player, "calls", "none" )
	outputChatBox ( "Aufgelegt.", player, 200, 200, 200 )
	triggerClientEvent ( player, "stopphonesound", player )
end
addCommandHandler ( "hangup", hangup )
addCommandHandler ( "hup", hangup )


function pickup ( player )

	local caller = vnxGetElementData ( player, "calledby" )
	vnxSetElementData ( player, "calledby", "none" )
	if isElement ( caller ) then
		vnxSetElementData ( player, "call", true )
		vnxSetElementData ( caller, "call", true )
		vnxSetElementData ( player, "callswith", caller )
		vnxSetElementData ( caller, "callswith", player )
		vnxSetElementData ( player, "calledby", "none" )
		vnxSetElementData ( caller, "calledby", "none" )
		vnxSetElementData ( player, "calls", "none" )
		vnxSetElementData ( caller, "calls", "none" )
		triggerClientEvent ( player, "stopphonesound", player )
		triggerClientEvent ( caller, "stopphonesound", caller )
		outputChatBox ( "Abgehoben.", player, 0, 125, 0 )
		outputChatBox ( "Abgehoben.", caller, 0, 125, 0 )
	else
		outputChatBox ( "Du kannst keinen Anruf annehmen!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "pickup", pickup )
addCommandHandler ( "pup", pickup )