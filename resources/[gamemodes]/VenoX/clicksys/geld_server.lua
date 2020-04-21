function pay_func ( player, cmd, target, money )

	local money = tonumber ( money )
	if target and getPlayerFromName ( target ) then
		local target = getPlayerFromName ( target )
		if target and money then
			money = math.abs ( math.floor ( money + 0.5 ) )
			local pmoney = vnxGetElementData ( player, "money" )
			if pmoney >= money then
				local x1, y1, z1 = getElementPosition ( player )
				local x2, y2, z2 = getElementPosition ( target )
				if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 5 then
					if vnxGetElementData ( player, "playingtime" ) >= 1 then
						if not vnxGetElementData ( player, "gotdamoney" ) then
							takePlayerSaveMoney ( player, money )
							givePlayerSaveMoney ( target, money )
							meCMD_func ( player, "meCMD", "steckt "..getPlayerName ( target ).." ein paar Scheine zu..." )
							infobox ( target, "Du hast von\n"..getPlayerName ( player ).." "..money.." $\nerhalten!", 5000, 0, 200, 0 )
							infobox ( player, "Du hast \n"..getPlayerName ( target ).." "..money.." $\ngegeben!", 5000, 0, 200, 0 )
						else
							infobox ( player, "Du darfst\nnoch kein Geld\ngeben!!", 5000, 150, 0, 0 )
						end
					else
						infobox ( player, "\nErst ab 1\nMinute moeglich!", 5000, 150, 0, 0 )
					end
				else
					infobox ( player, "\nDu bist zu\nweit entfernt!", 5000, 150, 0, 0 )
				end
			else
				infobox ( player, "\nSoviel Geld hast\ndu nicht!", 5000, 150, 0, 0 )
			end
		else
			infobox ( player, "\nGebrauch:\n/pay [Name] [Summe]", 5000, 150, 0, 0 )
		end
	end
end
addCommandHandler ( "pay", pay_func )

function moneychange ( player, betrag )

	vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + betrag )
	playSoundFrontEnd ( player, 40 )
end

function givePlayerSaveMoney ( player, amount )

	local amount = tonumber ( amount )
	if isElement ( player ) and amount then
		vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + amount )
		playSoundFrontEnd ( player, 40 )
	end
end

function takePlayerSaveMoney ( player, amount )

	local amount = tonumber ( amount )
	if isElement ( player ) and amount then
		vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - amount )
		playSoundFrontEnd ( player, 40 )
	end
end

function showBankMoney_func ()

	if source == source then
		local bankmoney = vnxGetElementData ( source, "bankmoney" )
		outputChatBox ("Du hast "..bankmoney.." $ auf der Bank.", source, 0, 0, 255 )
	end
end
addEvent ( "showBankMoney", true )
addEventHandler ("showBankMoney", getRootElement(), showBankMoney_func )

function cashPointPayIn_func ( summe )
	if summe then
		local summe = math.abs(math.floor(tonumber(summe)))
		if source == client then
			if vnxGetElementData ( source, "money" ) >= tonumber(summe) and not vnxGetElementData ( source, "gotdamoney")  then
				outputChatBox ("Du hast "..tonumber(summe).." $ eingezahlt!", source, 0, 0, 255 )
				vnxSetElementData ( source, "money", vnxGetElementData ( source, "money" ) - tonumber(summe) )
				vnxSetElementData ( source, "bankmoney", vnxGetElementData ( source, "bankmoney" ) + tonumber(summe) )
				playSoundFrontEnd ( source, 40 )
				infoShow(source, "plus", "+ "..summe.." $ Eingezahlt.")
				triggerClientEvent ( source, "vnxBankauszug", source, "Einzahlung", summe, "Einzahlung")
			end
		end
	end
end
addEvent ( "cashPointPayIn", true )
addEventHandler ( "cashPointPayIn", getRootElement(), cashPointPayIn_func )

function getPlaceOfPlayer ( player )

	local x, y, z = getElementPosition ( player )
	return getZoneName ( x, y, z, true )
end

function cashPointPayOut_func ( summe )

	local summe = math.abs(math.floor(tonumber(summe)))
	if source == client then
		if vnxGetElementData ( source, "bankmoney" ) >= tonumber(summe) then
			outputChatBox ("Du hast "..tonumber(summe).." $ abgehoben!", source, 0, 0, 255 )
			vnxSetElementData ( source, "bankmoney", vnxGetElementData ( source, "bankmoney" ) - tonumber(summe) )
			vnxSetElementData ( source, "money", vnxGetElementData ( source, "money" ) + tonumber(summe) )
			playSoundFrontEnd ( source, 40 )
			infoShow(source, "minus", "+ "..summe.." $ Ausgezahlt.")
			triggerClientEvent ( source, "vnxBankauszug", source, "Auszahlung", summe, "Auszahlung")
			
		end
	end
end
addEvent ( "cashPointPayOut", true )
addEventHandler ( "cashPointPayOut", getRootElement(), cashPointPayOut_func )

function Spenden_func ( summe )

	local summe = math.abs(math.floor(tonumber(summe)))
	if source == client then
		if vnxGetElementData ( source, "bankmoney" ) >= tonumber(summe) and not vnxGetElementData ( source, "gotdamoney") then
			outputChatBox ("Du hast "..tonumber(summe).." $ gespendet!", source, 0, 0, 255 )
			vnxSetElementData ( source, "bankmoney", vnxGetElementData ( source, "bankmoney" ) - tonumber(summe) )
			playSoundFrontEnd ( source, 40 )
		end
	end
end
addEvent ( "Spenden", true )
addEventHandler ("Spenden", getRootElement(), Spenden_func )

function cashPointTransfer_func ( summe, ziel, online, reason )

	if source == client then
		if online then
			vnxSetElementData ( source, "bankmoney", vnxGetElementData ( source, "bankmoney" ) - 80 )
			reason = "Onlineueberweisung"
		end
		local summe = math.abs(math.floor(tonumber(summe)))
		if vnxGetElementData ( source, "playingtime" ) >= 180 then
			if getPlayerFromName ( ziel ) then
				if tonumber(summe) >= 1 then
					if vnxGetElementData ( source, "bankmoney" ) >= tonumber(summe) then
						local player = getPlayerFromName ( ziel )
						if vnxGetElementData ( player, "loggedin" ) == 1 then
							vnxSetElementData ( source, "bankmoney", vnxGetElementData ( source, "bankmoney" ) - tonumber(summe) )
							vnxSetElementData ( player, "bankmoney", vnxGetElementData ( player, "bankmoney" ) + tonumber(summe) )
							outputChatBox ( "Du hast von "..getPlayerName(source).." "..tonumber(summe).." $ erhalten ("..reason..")!", player, 0, 255, 0 )
							outputChatBox ( "Du hast "..getPlayerName(player).." "..tonumber(summe).." $ ueberwiesen!", source, 0, 150, 255 )
							playSoundFrontEnd ( source, 40 )
							playSoundFrontEnd ( player, 40 )
							local playername = getPlayerName(source)
							if vnxGetElementData ( source, "playingtime" ) <= 180 then
								for playeritem, rang in pairs ( adminsIngame ) do
									if rang > 1 then
										outputChatBox ( "Log: "..playername.." hat an "..ziel.." "..summe.." $ überwiesen!", playeritem, 200, 200, 0 )
									end
								end
							end
							outputLog ( "Log: "..playername.." hat an "..ziel.." "..summe.." $ überwiesen!", "Geld" )
							triggerClientEvent ( source, "vnxBankauszug", source, "Überweisung", summe, "Überweisung an "..getPlayerName ( player ))
							triggerClientEvent ( player, "vnxBankauszug", player, "Überweisung", summe, "Überweisung von "..getPlayerName ( source ))
						else
							outputChatBox ("Der Spieler ist noch nicht eingeloggt!", source, 255, 0, 0 )
						end
					else
						outputChatBox ("Du hast nicht genug Geld!", source, 255, 0, 0 )
					end
				else
					outputChatBox ("Ungueltiger Betrag!", source, 255, 0, 0 )
				end
			else
				outputChatBox ("Du musst einen gueltigen Spielernamen eingeben!", source, 255, 0, 0 )
			end
		else
			outputChatBox ( "Du kannst erst ab 3 Stunden Spielzeit Geld vergeben!", source, 125, 0, 0 )
		end
	end
end
addEvent ( "Ueberweisen", true )
addEvent ( "cashPointTransfer", true )
addEventHandler ( "Ueberweisen", getRootElement(), cashPointTransfer_func )
addEventHandler ( "cashPointTransfer", getRootElement(), cashPointTransfer_func )

function geldgeben_func ( summe )

	if source == client then
		local summe = math.abs(math.floor(tonumber(summe)))
		if tonumber(summe) + 5 ~= nil then
			if vnxGetElementData ( source, "playingtime" ) >= 1 then
				local x1, y1, z1 = getElementPosition ( source )
				local player = getPlayerFromName ( vnxGetElementData ( source, "curclicked" ) )
				local x2, y2, z2 = getElementPosition ( player )
				local summe = tonumber(summe)
				if summe <= vnxGetElementData ( source, "money" ) then
					if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 10 then
						vnxSetElementData ( source, "money", vnxGetElementData ( source, "money" ) - summe )
						vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + summe )
						setPlayerMoney( source, vnxGetElementData ( source, "money" ) )
						setPlayerMoney( player, vnxGetElementData ( player, "money" ) )
						outputChatBox ( "Du hast "..getPlayerName(player).. " "..summe.." $ gegeben!", source, 0, 255, 0 )
						outputChatBox ( "Du hast von "..getPlayerName(source).. " "..summe.." $ erhalten!", player, 0, 0, 255 )
						playSoundFrontEnd ( player, 40 )
						playSoundFrontEnd ( source, 40 )
					else
						outputChatBox ( "Du bist zu weit weg!", source, 255, 0, 0 )
					end
				else
					outputChatBox ( "Du hast nicht genug Geld!", source, 255, 0, 0 )
				end
			else
				outputChatBox ( "Du kannst erst ab 1 Minute Spielzeit Geld vergeben!", source, 125, 0, 0 )
			end
		else
			outputChatBox ( "Ungültiger Betrag!", source, 255, 0, 0 )
		end
	end
end
addEvent ( "geldgeben", true )
addEventHandler ( "geldgeben", getRootElement(), geldgeben_func )