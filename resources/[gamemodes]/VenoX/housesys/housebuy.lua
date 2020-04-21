function housePickup ( player )

	if getElementModel ( source ) == 1273 or getElementModel ( source ) == 1272 then
		if vnxGetElementData ( source, "owner" ) == "none" then					--Frei
			preis = vnxGetElementData ( source, "preis" )
			triggerClientEvent ( player, "infobox_start", getRootElement(), "Dieses Haus steht\nzum Verkauf für\n"..preis.."!", 5000, 0, 125, 0 )
			outputChatBox ( "Tippe /buyhouse [bank/bar] um das Haus mit Bargeld/vom Konto zu kaufen (2% mehr Kosten!)", player, 0, 125, 0 )
			local x, y, z = getElementPosition ( source )
			vnxSetElementData ( player, "housex", x )
			vnxSetElementData ( player, "housey", y )
			vnxSetElementData ( player, "housez", z )
			vnxSetElementData ( player, "house", source )
		elseif vnxGetElementData ( source, "owner" ) ~= "none" then				-- Verkauft
			if not vnxGetElementData ( source, "gangHQOf" ) then
				fix = ""
				if vnxGetElementData ( source, "miete" ) and vnxGetElementData ( source, "miete" ) > 0 then
					fix = "Miete: "..vnxGetElementData ( source, "miete" ).." $, /rent\nzum mieten!"
				else
					fix = ""
				end
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Dieses Haus gehört:\n"..vnxGetElementData(source,"owner").."\n"..fix, 7500, 200, 200, 0 )
			end
			local x, y, z = getElementPosition ( source )
			vnxSetElementData ( player, "housex", x )
			vnxSetElementData ( player, "housey", y )
			vnxSetElementData ( player, "housez", z )
			vnxSetElementData ( player, "house", source )
		end
	end
end


function buyhouse_func ( player, cmd, zahlart )

	if zahlart == "bank" or zahlart == "bar" then
		if vnxGetElementData ( player, "housex" ) ~= 0 then
			local haus = vnxGetElementData ( player, "house" )
			local x1, y1, z1 = getElementPosition ( player )
			local x2 = vnxGetElementData ( player, "housex" )
			local y2 = vnxGetElementData ( player, "housey" )
			local z2 = vnxGetElementData ( player, "housez" )
			local pname = getPlayerName ( player )
			local distance = getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 )
			if distance < 5 then
				if vnxGetElementData ( haus, "owner" ) == "none" then
					if vnxGetElementData ( player, "playingtime" ) > 240 then
						local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=? AND ?? LIKE ?", "Typ", "buyit", "HoechstbietenderUID", playerUID[pname], "Typ", "Houses" ), -1 )
						if not result or not result[1] then
							if haus ~= "none" then
								if tonumber(vnxGetElementData ( player, "housekey" )) <= 0 then
									local hauskosten = tonumber(vnxGetElementData ( haus, "preis" ))
									if zahlart == "bank" then
										local hauskosten = hauskosten*1.02
										if vnxGetElementData ( player, "bankmoney" ) >= hauskosten then
											dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "houses", "UID", playerUID[pname], "ID", vnxGetElementData ( haus, "id" ) )
											
											vnxSetElementData ( player, "bankmoney", vnxGetElementData ( player, "bankmoney" ) - hauskosten )
											
											triggerClientEvent ( player, "createNewStatementEntry", player, "Hauskauf", hauskosten * - 1, "\n" )
											
											vnxSetElementData ( player, "housekey", vnxGetElementData ( haus, "id" ) )
											vnxSetElementData ( haus, "owner", pname )
											
											datasave_remote(player)
											vnxSetElementData ( player, "HaeuserGekauft", vnxGetElementData ( player, "HaeuserGekauft" ) + 1 )
											
											triggerClientEvent ( player, "infobox_start", getRootElement(), "Glückwunsch,\ndu hast das Haus\ngekauft!Für\nmehr Infos, öffne\ndas Hilfemenü!", 10000, 125, 0, 0 )
											triggerClientEvent ( player, "achievsound", getRootElement() )
											outputLog ( getPlayerName ( player ).." hat ein Haus gekauft ( "..vnxGetElementData ( haus, "id" ).." )", "house" )
											setHouseBought ( haus, pname )
										else
											triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht\ngenug Geld auf\ndemKonto!", 5000, 125, 0, 0 )
										end
									else
										if vnxGetElementData ( player, "money" ) >= hauskosten then
											dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "houses", "UID", playerUID[pname], "ID", vnxGetElementData ( haus, "id" ) )

											vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - hauskosten )
											
											vnxSetElementData ( player, "housekey", vnxGetElementData ( haus, "id" ) )
											vnxSetElementData ( haus, "owner", pname )
											
											datasave_remote(player)
											vnxSetElementData ( player, "HaeuserGekauft", vnxGetElementData ( player, "HaeuserGekauft" ) + 1 )

											triggerClientEvent ( player, "infobox_start", getRootElement(), "Glückwunsch,\ndu hast das Haus\ngekauft!Für\nmehr Infos, öffne\ndas Hilfemenü!", 10000, 125, 0, 0 )
											triggerClientEvent ( player, "achievsound", getRootElement() )
											
											outputLog ( getPlayerName ( player ).." hat ein Haus gekauft ( "..vnxGetElementData ( haus, "id" ).." )", "house" )
											setHouseBought ( haus, pname )
										else
											triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht\ngenug Bargeld!", 5000, 125, 0, 0 )
										end
									end
									dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "Hausschluessel", vnxGetElementData ( player, "housekey" ), "UID", playerUID[getPlayerName(player)] )
								else
									triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits\nein Haus!", 5000, 125, 0, 0 )
								end
							end
						else
							outputChatBox ( "Du ersteigerst momentan bereits ein Haus!", player, 0, 125, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nErst ab\n4 Stunden!", 5000, 125, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht\ngenug Geld!", 5000, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist bei\nkeinem Haus!", 5000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist bei\nkeinem Haus!", 5000, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nBitte als Zahlart\nbar oder bank\nangeben!!", 5000, 125, 0, 0 )
	end
end
addCommandHandler ( "buyhouse", buyhouse_func )