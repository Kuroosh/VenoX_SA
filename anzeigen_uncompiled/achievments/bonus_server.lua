carslotUpgradePrices = { [3]=50, [5]=60, [7]=75 }


function setMaximumCarsForPlayer ( player )

	local pname = getPlayerName ( player )
	
	local carslotUpdate5, carslotUpdate4, carslotUpdate3, carslotUpdate2, carslotUpdate1 = getCarslotUpdate ( pname )

	vnxSetElementData ( player, "carslotupgrade", carslotUpdate1 )
	vnxSetElementData ( player, "carslotupgrade2", carslotUpdate2 )
	vnxSetElementData ( player, "carslotupgrade3", carslotUpdate3 )
	vnxSetElementData ( player, "carslotupgrade4", carslotUpdate4 )
	vnxSetElementData ( player, "carslotupgrade5", carslotUpdate5 )
	
	local maxcars = 5
	if carslotUpdate5 == 1 then
		maxcars = 15
		if vnxGetElementData ( player, "adminlvl" ) >= 3 then
			maxcars = 20
		end
	elseif carslotUpdate4 == 1 then
		maxcars = 13
	elseif carslotUpdate3 == 1 then
		maxcars = 11
	elseif carslotUpdate2 == 1 then
		maxcars = 9
	elseif carslotUpdate1 == "buyed" then
		maxcars = 7
	end
	
	vnxSetElementData ( player, "maxcars", maxcars )
end

function bonusBuy_func ( player, bonus )

	if player == client then
		local pname = getPlayerName ( player )
		local bonuspoints = tonumber ( vnxGetElementData ( player, "bonuspoints" ) )
		if bonus == " Lungenvolumen" then
			if vnxGetElementData ( player, "lungenvol" ) ~= "none" then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				if bonuspoints >= 35 then
					outputChatBox ( "Du hast den Bonus gekauft!", player, 0, 125, 0 )
					setPedStat ( player, 225, 500 )
					vnxSetElementData ( player, "lungenvol", "buyed" )
					vnxSetElementData ( player, "bonuspoints", bonuspoints - 35 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "Lungenvolumen", "buyed", "UID", playerUID[pname] )
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Muskeln" then
			if vnxGetElementData ( player, "muscle" ) ~= "none" then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				if bonuspoints >= 40 then
					outputChatBox ( "Du hast den Bonus gekauft!", player, 0, 125, 0 )
					setPedStat ( player, 23, 500 )
					vnxSetElementData ( player, "muscle", "buyed" )
					vnxSetElementData ( player, "bonuspoints", bonuspoints - 40 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "Muskeln", "buyed", "UID", playerUID[pname] )
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Kondition" then
			if vnxGetElementData ( player, "stamina" ) ~= "none" then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				if bonuspoints >= 25 then
					outputChatBox ( "Du hast den Bonus gekauft!", player, 0, 125, 0 )
					setPedStat ( player, 22, 500 )
					vnxSetElementData ( player, "stamina", "buyed" )
					vnxSetElementData ( player, "bonuspoints", bonuspoints - 25 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "Kondition", "buyed", "UID", playerUID[pname] )
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Boxen" then
			if vnxGetElementData ( player, "boxen" ) ~= "none" then
				setPedFightingStyle ( player, 5 )
				outputChatBox ( "Aktueller Stil: Boxen", player, 175, 175, 20 )
				dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "CurStyle", "5", "UID", playerUID[pname] )
			else
				if bonuspoints >= 25 then
					outputChatBox ( "Du hast den Bonus gekauft - vergiss nicht, ihn zu aktivieren!", player, 0, 125, 0 )
					vnxSetElementData ( player, "boxen", "buyed" )
					vnxSetElementData ( player, "bonuspoints", bonuspoints - 25 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "Boxen", "buyed", "UID", playerUID[pname] )
					triggerClientEvent ( player, "refreshBonus", player, "Verwenden" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Kung-Fu" then
			if vnxGetElementData ( player, "kungfu" ) ~= "none" then
				setPedFightingStyle ( player, 6 )
				outputChatBox ( "Aktueller Stil: Kung-Fu", player, 175, 175, 20 )
				dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "CurStyle", "6", "UID", playerUID[pname] )
			else
				if bonuspoints >= 35 then
					outputChatBox ( "Du hast den Bonus gekauft - vergiss nicht, ihn zu aktivieren!", player, 0, 125, 0 )
					vnxSetElementData ( player, "kungfu", "buyed" )
					vnxSetElementData ( player, "bonuspoints", bonuspoints - 35 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "KungFu", "buyed", "UID", playerUID[pname] )
					triggerClientEvent ( player, "refreshBonus", player, "Verwenden" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Streetfighting" then
			if vnxGetElementData ( player, "streetfighting" ) ~= "none" then
				setPedFightingStyle ( player, 7 )
				outputChatBox ( "Aktueller Stil: Streetfighting", player, 175, 175, 20 )
				dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "CurStyle", "7", "UID", playerUID[pname] )
			else
				if bonuspoints >= 40 then
					outputChatBox ( "Du hast den Bonus gekauft - vergiss nicht, ihn zu aktivieren!", player, 0, 125, 0 )
					vnxSetElementData ( player, "streetfighting", "buyed" )
					vnxSetElementData ( player, "bonuspoints", bonuspoints - 40 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "Streetfighting", "buyed", "UID", playerUID[pname] )
					triggerClientEvent ( player, "refreshBonus", player, "Verwenden" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Pistole" then
			if vnxGetElementData ( player, "pistolskill" ) ~= "none" then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				if bonuspoints >= 20 then
					outputChatBox ( "Du hast den Bonus gekauft!", player, 0, 125, 0 )
					setPedStat ( player, 69, 900 )
					setPedStat ( player, 70, 999 )
					vnxSetElementData ( player, "pistolskill", "buyed" )
					vnxSetElementData ( player, "bonuspoints", bonuspoints - 20 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "PistolenSkill", "buyed", "UID", playerUID[pname] )
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Deagle" then
			if vnxGetElementData ( player, "deagleskill" ) ~= "none" then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				if bonuspoints >= 30 then
					outputChatBox ( "Du hast den Bonus gekauft!", player, 0, 125, 0 )
					setPedStat ( player, 71, 999 )
					vnxSetElementData ( player, "deagleskill", "buyed" )
					vnxSetElementData ( player, "bonuspoints", bonuspoints - 30 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "DeagleSkill", "buyed", "UID", playerUID[pname] )
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Sturmgewehr" then
			if vnxGetElementData ( player, "assaultskill" ) ~= "none" then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				if bonuspoints >= 30 then
					outputChatBox ( "Du hast den Bonus gekauft!", player, 0, 125, 0 )
					setPedStat ( player, 77, 999 )
					setPedStat ( player, 78, 999 )
					vnxSetElementData ( player, "assaultskill", "buyed" )
					vnxSetElementData ( player, "bonuspoints", bonuspoints - 30 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "AssaultSkill", "buyed", "UID", playerUID[pname] )
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Schrotflinten" then
			if vnxGetElementData ( player, "shotgunskill" ) ~= "none" then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				if bonuspoints >= 20 then
					outputChatBox ( "Du hast den Bonus gekauft!", player, 0, 125, 0 )
					setPedStat ( player, 72, 999 )
					setPedStat ( player, 74, 999 )
					vnxSetElementData ( player, "shotgunskill", "buyed" )
					vnxSetElementData ( player, "bonuspoints", bonuspoints - 20 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "ShotgunSkill", "buyed", "UID", playerUID[pname] )
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " MP5" then
			if vnxGetElementData ( player, "mp5skill" ) ~= "none" then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				if bonuspoints >= 35 then
					outputChatBox ( "Du hast den Bonus gekauft!", player, 0, 125, 0 )
					setPedStat ( player, 76, 999 )
					vnxSetElementData ( player, "mp5skill", "buyed" )
					vnxSetElementData ( player, "bonuspoints", bonuspoints - 35 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "MP5Skills", "buyed", "UID", playerUID[pname] )
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Vortex" then
			if vnxGetElementData ( player, "vortex" ) ~= "none" then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				if bonuspoints >= 30 then
					outputChatBox ( "Du hast den Bonus gekauft und kannst das Vortex nun an der Bonushalle erwerben!", player, 0, 125, 0 )
					outputChatBox ( "( LKW-Icon )", player, 0, 125, 0 )
					vnxSetElementData ( player, "vortex", "buyed" )
					vnxSetElementData ( player, "bonuspoints", bonuspoints - 30 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "Vortex", "buyed", "UID", playerUID[pname] )
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Quad" then
			if vnxGetElementData ( player, "quad" ) ~= "none" then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				if bonuspoints >= 30 then
					outputChatBox ( "Du hast den Bonus gekauft und kannst das Quad nun an der Bonushalle erwerben!", player, 0, 125, 0 )
					outputChatBox ( "( LKW-Icon )", player, 0, 125, 0 )
					vnxSetElementData ( player, "quad", "buyed" )
					vnxSetElementData ( player, "bonuspoints", bonuspoints - 30 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "Quad", "buyed", "UID", playerUID[pname] )
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Leichenwagen" then
			if vnxGetElementData ( player, "romero" ) == 1 then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				if bonuspoints >= 50 then
					outputChatBox ( "Du hast den Bonus gekauft und kannst den Leichenwagen nun an der Bonushalle erwerben!", player, 0, 125, 0 )
					outputChatBox ( "( LKW-Icon )", player, 0, 125, 0 )
					vnxSetElementData ( player, "romero", 1 )
					vnxSetElementData ( player, "bonuspoints", bonuspoints - 50 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "Leichenwagen", 1, "UID", playerUID[pname] )
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Caddy" then
			if vnxGetElementData ( player, "golfcart" ) then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				if bonuspoints >= 25 then
					outputChatBox ( "Du hast den Bonus gekauft und kannst das Caddy nun an der Bonushalle erwerben!", player, 0, 125, 0 )
					outputChatBox ( "( LKW-Icon )", player, 0, 125, 0 )
					vnxSetElementData ( player, "golfcart", true )
					vnxSetElementData ( player, "bonuspoints", bonuspoints - 25 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "Caddy", 1, "UID", playerUID[pname] )
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Skimmer" then
			if vnxGetElementData ( player, "skimmer" ) == 1 then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				if bonuspoints >= 50 then
					outputChatBox ( "Du hast den Bonus gekauft und kannst den Skimmer nun an der Bonushalle erwerben!", player, 0, 125, 0 )
					outputChatBox ( "( LKW-Icon )", player, 0, 125, 0 )
					vnxSetElementData ( player, "skimmer", 1 )
					vnxSetElementData ( player, "bonuspoints", bonuspoints - 50 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "Skimmer", 1, "UID", playerUID[pname] )
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Fahrzeugslots" then
			outputChatBox ( "Fahrzeugslots bitte im Rathaus kaufen!", player, 255, 0, 0 )
			--[[if vnxGetElementData ( player, "carslotupgrade3" ) == 1 then
				outputChatBox ( "Diesen Bonus hast du bereits gekauft!", player, 125, 0, 0 )
			else
				local points = vnxGetElementData ( player, "bonuspoints" )
				if vnxGetElementData ( player, "carslotupgrade" ) == "none" then
					if points >= 50 then
						outputChatBox ( "Du hast den Bonus gekauft und kannst nun maximal 5 Fahrzeuge besitzen.", player, 0, 125, 0 )
						vnxSetElementData ( player, "carslotupgrade", "buyed" )
						vnxSetElementData ( player, "bonuspoints", bonuspoints - 50 )
						dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "CarslotUpgrades", "buyed", "UID", playerUID[pname] )
						vnxSetElementData ( player, "maxcars", 5 )
					else
						outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
					end
				elseif vnxGetElementData ( player, "carslotupgrade2" ) == 0 then
					if points >= 60 then
						outputChatBox ( "Du hast den Bonus gekauft und kannst nun maximal 7 Fahrzeuge besitzen.", player, 0, 125, 0 )
						vnxSetElementData ( player, "carslotupgrade2", 1 )
						vnxSetElementData ( player, "bonuspoints", bonuspoints - 60 )
						dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "CarslotUpdate2", 1, "UID", playerUID[pname] )
						vnxSetElementData ( player, "maxcars", 7 )
					else
						outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
					end
				elseif vnxGetElementData ( player, "carslotupgrade3" ) == 0 then
					if points >= 75 then
						outputChatBox ( "Du hast den Bonus gekauft und kannst nun maximal 10 Fahrzeuge besitzen.", player, 0, 125, 0 )
						vnxSetElementData ( player, "carslotupgrade3", 1 )
						vnxSetElementData ( player, "bonuspoints", bonuspoints - 75 )
						dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "CarslotUpdate3", 1, "UID", playerUID[pname] )
						vnxSetElementData ( player, "maxcars", 10 )
					else
						outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
					end
				end
				triggerClientEvent ( player, "refreshBonus", player )
			end]]
		elseif bonus == " Cluckin Bell" then
			if vnxGetElementData ( player, "bonusskin1" ) ~= "none" then
				if not getPedOccupiedVehicle ( player ) then
					setElementModel ( player, 167 )
					vnxSetElementData ( player, "skinid", 167 )
				else
					outputChatBox ( "Du kannst deinen Skin nicht in Fahrzeugen verwenden!", player, 125, 0, 0 )
				end
			else
				if bonuspoints >= 25 then
					outputChatBox ( "Du hast den Skin gekauft! Waehle ihn jetzt aus, um ihn zu aktivieren!", player, 0, 125, 0 )
					vnxSetElementData ( player, "bonusskin1", "buyed" )
					vnxSetElementData ( player, "bonuspoints", bonuspoints - 25 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "BonusSkin1", "buyed", "UID", playerUID[pname] )
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Notebook" then
			if vnxGetElementData ( player, "fruitNotebook" ) >= 1 then
				outputChatBox ( "Du hast dein Notebook bereits! Waehle es im Inventar aus!", player, 125, 0, 0 )
			else
				if bonuspoints >= 25 then
					outputChatBox ( "Du hast dein Notebook gekauft und kannst es jetzt im Inventar verwenden!", player, 0, 125, 0 )
					vnxSetElementData ( player, "fruitNotebook", 1 )
					vnxSetElementData ( player, "bonuspoints", bonuspoints - 25 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "inventar", "FruitNotebook", 1, "UID", playerUID[pname] )
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Spielekonsole" then
			if vnxGetElementData ( player, "gameboy" ) >= 1 then
				ouputChatBox ( "Du hast bereits einen Gameboy!", player, 125, 0, 0 )
			else
				if bonuspoints >= 25 then
					vnxSetElementData ( player, "gameboy", 1 )
					outputChatBox ( "Du hast dir eine Spielekonsole gekauft und kannst sie nun im Inventar verwenden!", player, 0, 125, 0 )
					vnxSetElementData ( player, "bonuspoints", bonuspoints - 25 )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "inventar", "Gameboy", "1", "UID", playerUID[pname] )
					triggerClientEvent ( player, "refreshBonus", player, "" )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Schachspiel" then
			if vnxGetElementData ( player, "chess" ) then
				outputChatBox ( "Du hast bereits ein Schachspiel in deinem Inventar!", player, 125, 0, 0 )
			else
				if bonuspoints >= 15 then
					outputChatBox ( "Schachspiel gekauft - schau in deinem Inventar nach!", player, 0, 125, 0 )
					vnxSetElementData ( player, "chess", true )
					vnxSetElementData ( player, "bonuspoints", bonuspoints - 15 )
					triggerClientEvent ( player, "refreshBonus", player, "" )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "Schach", "1", "UID", playerUID[pname] )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Fernglas" then
			if vnxGetElementData ( player, "fglass" ) then
				outputChatBox ( "Du hast bereits ein Fernglas in deinem Inventar!", player, 125, 0, 0 )
			else
				if bonuspoints >= 10 then
					outputChatBox ( "Fernglas gekauft - schau in deinem Inventar nach!", player, 0, 125, 0 )
					vnxSetElementData ( player, "fglass", true )
					vnxSetElementData ( player, "bonuspoints", bonuspoints - 10 )
					triggerClientEvent ( player, "refreshBonus", player, "" )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "fglass", "1", "UID", playerUID[pname] )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		elseif bonus == " Doppel SMG" then
			if vnxGetElementData ( player, "doubleSMG" ) then
				if getPedStat ( player, 75 ) == 999 then
					setPedStat ( player, 75, 600 )
					outputChatBox ( "Es wird eine Waffe verwendet.", player, 200, 200, 0 )
				else
					setPedStat ( player, 75, 990 )
					outputChatBox ( "Deine Uzi ist nun verbessert und bereit fuer den Kampf.", player, 200, 200, 0 )
				end
			else
				if bonuspoints >= 50 then
					outputChatBox ( "Skill gekauft!", player, 0, 125, 0 )
					setPedStat ( player, 75, 900 )
					vnxSetElementData ( player, "doubleSMG", false )
					vnxSetElementData ( player, "bonuspoints", bonuspoints - 50 )
					triggerClientEvent ( player, "refreshBonus", player, "" )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "bonustable", "uzi", "1", "UID", playerUID[pname] )
				else
					outputChatBox ( "Du hast nicht genug Bonuspunkte!", player, 125, 0, 0 )
				end
			end
		end
	end
end
addEvent ( "bonusBuy", true )
addEventHandler ( "bonusBuy", getRootElement(), bonusBuy_func )