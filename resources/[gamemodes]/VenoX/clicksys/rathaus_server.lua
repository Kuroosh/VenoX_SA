function LizenzKaufen_func ( player, lizens )

	if player == client then
		local pname = getPlayerName ( player )
		if lizens == "planeb" then
			if tonumber(vnxGetElementData ( player, "planelicenseb" )) == 0 then
				if tonumber(vnxGetElementData ( player, "money" )) >= 34950 then
					if vnxGetElementData ( player, "planelicensea" ) == 1 then
						vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 34950 )
						vnxSetElementData ( player, "planelicenseb", 1 )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nFluglizens\nTyp B erhalten!", 5000, 0, 255, 0 )
						playSoundFrontEnd ( player, 40 )
						dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "FlugscheinKlasseB", 1, "UID", playerUID[pname] )
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "Du benoetigst\nzuerst einen\nFlugschein Typ A!", 5000, 255, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast bereits\neinen Flugschein!", 5000, 255, 0, 0 )
			end
		elseif lizens == "wschein" then
			if tonumber(vnxGetElementData ( player, "gunlicense" )) == 0 then
				if tonumber(vnxGetElementData ( player, "money" )) >= waffenscheinprice then
					if tonumber(vnxGetElementData ( player, "playingtime" )) >= 1 then
						vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - waffenscheinprice )
						prompt ( player, "Du hast soeben deinen Waffenschein erhalten,\nder dich zum Besitz einer Waffe berechtigt.\nTraegst du deine Waffen offen, so wird die\nPolizei sie dir abnehmen.\nFalls du zu oft negativ auffaellst ( z.b.\ndurch Schiesserein ), koennen sie dir ihn\nauch wieder abnehmen.\n\nAusserdem: GRUNDLOSES Toeten von Spielern ist verboten.\nGruende sind nicht: Geldgier, \"Hat mich angeguggt\"\nusw., sondern z.b. Selbstverteidigung oder Gangkriege.", 30 )
						playSoundFrontEnd ( player, 40 )
						vnxSetElementData ( player, "gunlicense", 1 )
						dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "Waffenschein", 1, "UID", playerUID[pname] )
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nErst ab 1ner \nminute verfuegbar!", 5000, 255, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits\neinen Waffenschein!", 5000, 255, 0, 0 )
			end
		elseif lizens == "bike" then
			if tonumber(vnxGetElementData ( player, "bikelicense" )) == 0 then
				if tonumber(vnxGetElementData ( player, "money" )) >= 450 then
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 450 )
					vnxSetElementData ( player, "bikelicense", 1 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nMotorradfuehrerschein\nerhalten!", 5000, 0, 255, 0 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "Motorradtfuehrerschein", 1, "UID", playerUID[pname] )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast bereits\neinen\nMotorradfuehrerschein!", 5000, 255, 0, 0 )
			end
		elseif lizens == "planea" then
			if tonumber(vnxGetElementData ( player, "planelicensea" )) == 0 then
				if tonumber(vnxGetElementData ( player, "money" )) >= 15000 then
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 15000 )
					vnxSetElementData ( player, "planelicensea", 1 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nFlugschein\nerhalten!", 5000, 0, 255, 0 )
					playSoundFrontEnd ( player, 40 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "FlugscheinKlasseA", 1, "UID", playerUID[pname] )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast bereits\neinen\nFlugschein!", 5000, 255, 0, 0 )
			end
		elseif lizens == "fishing" then
			if tonumber(vnxGetElementData ( player, "fishinglicense" )) == 0 then
				if tonumber(vnxGetElementData ( player, "money" )) >= 79 then
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 79 )
					vnxSetElementData ( player, "fishinglicense", 1 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nAngelschein\nerhalten!", 5000, 0, 255, 0 )
					playSoundFrontEnd ( player, 40 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "Angelschein", 1, "UID", playerUID[pname] )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast bereits\neinen Angelschein!", 5000, 255, 0, 0 )
			end
		elseif lizens == "car" then
			local price
			if vnxGetElementData ( player, "playingtime" ) >= 60 * 50 then
				price = 4750
			elseif vnxGetElementData ( player, "playingtime" ) >= 60 * 25 then
				price = 1750
			else
				price = 750
			end
			vnxSetElementData ( player, "drivingLicensePrice", price )
			if tonumber(vnxGetElementData ( player, "carlicense" )) == 0 then
				if tonumber(vnxGetElementData ( player, "money" )) >= price then
					startDrivingSchoolTheory_func ()
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast bereits\neinen Fuehrerschein!", 5000, 255, 0, 0 )
			end
		elseif lizens == "perso" then
			if tonumber(vnxGetElementData ( player, "perso" )) == 0 then
				if tonumber(vnxGetElementData ( player, "money" )) >= 40 then
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 40 )
					vnxSetElementData ( player, "perso", 1 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nPersonalausweiss\nerhalten!", 5000, 0, 255, 0 )
					playSoundFrontEnd ( player, 40 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "Perso", 1, "UID", playerUID[pname] )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast bereits\neinen\nPersonalausweiss!", 5000, 255, 0, 0 )
			end
		elseif lizens == "lkw" then
			if tonumber(vnxGetElementData ( player, "lkwlicense" )) == 0 then
				if tonumber(vnxGetElementData ( player, "money" )) >= 450 then
					if vnxGetElementData ( player, "carlicense" ) == 1 then
						vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 450 )
						vnxSetElementData ( player, "lkwlicense", 1 )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nLKW-Fuehrerschein\nerhalten!", 5000, 0, 255, 0 )
						playSoundFrontEnd ( player, 40 )
						dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "LKWfuehrerschein", 1, "UID", playerUID[pname] )
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "Du benoetigst\nzuerst einen\nFuehrerschein!", 5000, 255, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast bereits\neinen\nLKW-Fuehrerschein!", 5000, 255, 0, 0 )
			end
		elseif lizens == "heli" then
			if tonumber(vnxGetElementData ( player, "helilicense" )) == 0 then
				if tonumber(vnxGetElementData ( player, "money" )) >= 20000 then
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 20000 )
					vnxSetElementData ( player, "helilicense", 1 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nHelikopter-\nflugschein\nerhalten!", 5000, 0, 255, 0 )
					playSoundFrontEnd ( player, 40 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "Helikopterfuehrerschein", 1, "UID", playerUID[pname] )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast bereits\neinen Helikopter-\nflugschein!", 5000, 255, 0, 0 )
			end
		elseif lizens == "raft" then
			if tonumber(vnxGetElementData ( player, "segellicense" )) == 0 then
				if tonumber(vnxGetElementData ( player, "money" )) >= 350 then
					if vnxGetElementData ( player, "motorbootlicense" ) == 1 then
						vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 350 )
						vnxSetElementData ( player, "segellicense", 1 )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSegellizens\nerhalten!", 5000, 0, 255, 0 )
						playSoundFrontEnd ( player, 40 )
						dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "Segelschein", 1, "UID", playerUID[pname] )
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "Du benoetigst\nzuerst einen\nMotorboot-\nfuehrerschein!", 5000, 255, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast bereits\neinen Segelschein!", 5000, 255, 0, 0 )
			end
		elseif lizens == "motorboot" then
			if tonumber(vnxGetElementData ( player, "motorbootlicense" )) == 0 then
				if tonumber(vnxGetElementData ( player, "money" )) >= 400 then
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 400 )
					vnxSetElementData ( player, "motorbootlicense", 1 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nMotorboot-\nfuehrerschein\nerhalten!", 5000, 0, 255, 0 )
					playSoundFrontEnd ( player, 40 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "Motorbootschein", 1, "UID", playerUID[pname] )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast bereits\neinen Motorboot-\nfuehrerschein!", 5000, 255, 0, 0 )
			end
		elseif lizens == "maxveh" then
			if vnxGetElementData ( player, "carslotupgrade" ) ~= "buyed" then
				if tonumber(vnxGetElementData ( player, "money" )) >= fahrzeugslotprice[5] then
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - fahrzeugslotprice[5] )
					vnxSetElementData ( player, "carslotupgrade", "buyed" )
					vnxSetElementData ( player, "maxcars", 7 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nMax. Fahrzeuganzahl\nauf 7\nerhöht!", 5000, 0, 255, 0 )
					playSoundFrontEnd ( player, 40 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "CarslotUpgrades", "buyed", "UID", playerUID[pname] )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			elseif tonumber(vnxGetElementData ( player, "carslotupgrade2" )) ~= 1 then
				if tonumber(vnxGetElementData ( player, "money" )) >= fahrzeugslotprice[7] then
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - fahrzeugslotprice[7] )
					vnxSetElementData ( player, "carslotupgrade2", 1 )
					vnxSetElementData ( player, "maxcars", 9 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nMax. Fahrzeuganzahl\nauf 9\nerhöht!", 5000, 0, 255, 0 )
					playSoundFrontEnd ( player, 40 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "CarslotUpdate2", 1, "UID", playerUID[pname] )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			elseif tonumber(vnxGetElementData ( player, "carslotupgrade3" )) ~= 1 then
				if tonumber(vnxGetElementData ( player, "money" )) >= fahrzeugslotprice[9] then
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - fahrzeugslotprice[9] )
					vnxSetElementData ( player, "carslotupgrade3", 1 )
					vnxSetElementData ( player, "maxcars", 11 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nMax. Fahrzeuganzahl\nauf 11\nerhöht!", 5000, 0, 255, 0 )
					playSoundFrontEnd ( player, 40 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "CarslotUpdate3", 1, "UID", playerUID[pname] )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			elseif tonumber(vnxGetElementData ( player, "carslotupgrade4" )) ~= 1 then
				if tonumber(vnxGetElementData ( player, "money" )) >= fahrzeugslotprice[11] then
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - fahrzeugslotprice[11] )
					vnxSetElementData ( player, "carslotupgrade4", 1 )
					vnxSetElementData ( player, "maxcars", 13 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nMax. Fahrzeuganzahl\nauf 13\nerhöht!", 5000, 0, 255, 0 )
					playSoundFrontEnd ( player, 40 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "CarslotUpdate4", 1, "UID", playerUID[pname] )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			elseif tonumber(vnxGetElementData ( player, "carslotupgrade5" )) ~= 1 then
				if tonumber(vnxGetElementData ( player, "money" )) >= fahrzeugslotprice[13] then
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - fahrzeugslotprice[13] )
					vnxSetElementData ( player, "carslotupgrade5", 1 )
					if vnxGetElementData ( player, "adminlvl" ) >= 3 then
						vnxSetElementData ( player, "maxcars", 20 )
					else
						vnxSetElementData ( player, "maxcars", 15 )
					end
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nMax. Fahrzeuganzahl\nmaximiert!", 5000, 0, 255, 0 )
					playSoundFrontEnd ( player, 40 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "CarslotUpdate5", 1, "UID", playerUID[pname] )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast bereits\ndie maximale\nFahrzeuganzahl\ngekauft!", 5000, 255, 0, 0 )
			end
		end
		checkAchievLicense ( player )
	end
end
addEvent ( "LizenzKaufen", true )
addEventHandler ( "LizenzKaufen", getRootElement(), LizenzKaufen_func )

function checkAchievLicense ( player )

	if tonumber ( vnxGetElementData ( player, "motorbootlicense" ) ) == 1 and tonumber ( vnxGetElementData ( player, "segellicense" ) ) == 1 and tonumber ( vnxGetElementData ( player, "helilicense" ) ) == 1 and tonumber ( vnxGetElementData ( player, "lkwlicense" ) ) == 1 and tonumber ( vnxGetElementData ( player, "lkwlicense" ) ) == 1 and tonumber ( vnxGetElementData ( player, "perso" ) )  == 1 and tonumber ( vnxGetElementData ( player, "carlicense" ) ) == 1 and tonumber ( vnxGetElementData ( player, "fishinglicense" ) ) == 1 and tonumber ( vnxGetElementData ( player, "planelicensea" ) ) == 1 and tonumber ( vnxGetElementData ( player, "planelicenseb" ) ) == 1 and tonumber ( vnxGetElementData ( player, "bikelicense" ) ) == 1 and tonumber ( vnxGetElementData ( player, "gunlicense" ) ) == 1 and vnxGetElementData ( player, "licenses_achiev" ) ~= "done" then
		if vnxGetElementData ( player, "licenses_achiev" ) ~= "done" then																						-- Achiev: Mr. License
			vnxSetElementData ( player, "licenses_achiev", "done" )																								-- Achiev: Mr. License
			triggerClientEvent ( player, "showAchievmentBox", player, " Mr. License", 40, 10000 )																-- Achiev: Mr. License
			vnxSetElementData ( player, "bonuspoints", tonumber(vnxGetElementData ( player, "bonuspoints" )) + 40 )												-- Achiev: Mr. License
			dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "achievments", "Lizensen", "done", "UID", playerUID[getPlayerName(player)] )						-- Achiev: Mr. License
		end	
	end
end