jobchoosepickup = createPickup ( 362.39953613281, 180.4635925293, 1008.0034790039, 3, 1210, 50)
setElementInterior (jobchoosepickup, 3, 362.39953613281, 180.4635925293, 1008.0034790039)
---------------------------------------------------------------------------------------------------------------------------------------
--createMarker ( -1492.8582763672, 920.14044189453, 6.1, "cylinder", 1, getColorFromString ( "#FF000099" ) )
---------------------------------------------------------------------------------------------------------------------------------------
--cityHallExitOptic = createMarker ( 389.89999389648, 173.82061767578, 1007.3699951172, "cylinder", 1, getColorFromString ( "#FF000099" ) )
---------------------------------------------------------------------------------------------------------------------------------------
--setElementInterior ( cityHallExitOptic, 3 )

---------------------------------------------------------------------------------------------------------------------------------------

function jobchoosepickup_func (player)

	setElementFrozen ( player, true )
    setTimer ( setElementFrozen, 100, 1, player, false )
	--triggerClientEvent ( player, "showJobGui", getRootElement() )
	showCursor ( player, true )
	setElementClicked ( player, true )
end
addEventHandler ( "onPickupHit", jobchoosepickup, jobchoosepickup_func )

---------------------------------------------------------------------------------------------------------------------------------------

function pickedUpRathaus (source, dim)

	if getPedOccupiedVehicle(source) == false then
		triggerClientEvent(source,"blendLoadingScreen",source)
		fadeElementInterior ( source, 3, 388.5, 173.82061767578, 1008.032043457, 90 )
		toggleControl ( source, "fire", false )
		toggleControl ( source, "enter_exit", false )
		vnxSetElementData(source,"nodmzone", 1)
	end
end
--addEventHandler ( "onMarkerHit", cityHallEnter, pickedUpRathaus )
createCustomPickup(-1492.8582763672, 920.14044189453, 7, 0, 0, "anzeigen/rathaus/image/cityhall.png", pickedUpRathaus)
---------------------------------------------------------------------------------------------------------------------------------------

function pickedUpRathaus2 (source)
   triggerClientEvent(source,"blendLoadingScreen",source)
   fadeElementInterior ( source, 0, -1498.32, 920.55, 7, 180 )
   toggleControl ( source, "fire", true )
   toggleControl ( source, "enter_exit", true )
   vnxSetElementData(source,"nodmzone", 0)
end
createCustomPickup( 389.89999389648, 173.82061767578, 1008, 0, 0, "anzeigen/rathaus/image/door_out.png", pickedUpRathaus2)

---------------------------------------------------------------------------------------------------------------------------------------

--rathausmarker = createMarker ( 362.45562744141, 173.81, 1007.5, "corona", 2, 125, 0, 0, 0 )
--setElementInterior (rathausmarker, 3)
---------------------------------------------------------------------------------------------------------------------------------------
--[[rathausmarker2 = createMarker ( 362.45562744141, 173.81, 1007, "cylinder", 1, 125, 0, 0 )

setElementInterior (rathausmarker2, 3)]]

---------------------------------------------------------------------------------------------------------------------------------------

function rathausmarker_func (player)
   
    setElementFrozen ( player, true )
    setTimer ( setElementFrozen, 100, 1, player, false )
	triggerClientEvent ( player, "Rathaus_Window", getRootElement() )
	showCursor ( player, true )
	setElementClicked ( player, true )
end
--addEventHandler ( "onMarkerHit", rathausmarkerVnX, rathausmarker_func )
local rathausmarkerVnX = createCustomPickup(362.45562744141,  173.81, 1008, 3, 0, "anzeigen/rathaus/image/rathaus_pickup.png", rathausmarker_func)
---------------------------------------------------------------------------------------------------------------------------------------
rathausped = createPed(141, 359.7138671875, 173.625765625, 1008.38934)
setElementInterior (rathausped, 3)
setPedRotation(rathausped, 280)
setTimer(setElementHealth,51,0,rathausped,100)


---------------------------------------------------------------------------------------------------------------------------------------



function LizenzKaufen_func ( player, lizens )

	if player == client then
		local pname = getPlayerName ( player )
		if lizens == "planeb" then
			if tonumber(vnxGetElementData ( player, "planelicenseb" )) == 0 then
				if tonumber(vnxGetElementData ( player, "money" )) >= 53250 then
					if vnxGetElementData ( player, "planelicensea" ) == 1 then
						vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 53250 )
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
				if tonumber(vnxGetElementData ( player, "money" )) >= 27450 then
					if tonumber(vnxGetElementData ( player, "playingtime" )) >= 1 then
						vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 27450 )
						--prompt ( player, "Du hast soeben deinen Waffenschein erhalten,\nder dich zum Besitz einer Waffe berechtigt.\
						outputChatBox ( "------------WAFFENSCHEIN INFORMATION------------", player, 0, 150, 0 )
						outputChatBox ( "Du hast soeben deinen Waffenschein erhalten, der dich zum Besitz einer Waffe berechtigt.", player, 0, 125, 0 )
						outputChatBox ( "Traegst du deine Waffen offen, so wird die Polizei sie dir abnehmen.", player, 0, 125, 0 )
						outputChatBox ( "Falls du zu oft negativ auffaellst ( z.b.\ndurch Schiesserein ), koennen sie dir ihn\nauch wieder abnehmen.", player, 0, 125, 0 )
						outputChatBox ( "Ausserdem: GRUNDLOSES Toeten von Spielern ist verboten. Gruende sind nicht: Geldgier, Hat mich angeguggt usw., sondern z.b. Selbstverteidigung oder Gangkriege.", player, 0, 125, 0 )
						outputChatBox ( "------------WAFFENSCHEIN INFORMATION------------", player, 0, 150, 0 )
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
				if tonumber(vnxGetElementData ( player, "money" )) >= 6750 then
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 6750 )
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
				if tonumber(vnxGetElementData ( player, "money" )) >= 31850 then
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 31850 )
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
				if tonumber(vnxGetElementData ( player, "money" )) >= 850 then
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 850 )
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
				price = 10500
			elseif vnxGetElementData ( player, "playingtime" ) >= 60 * 25 then
				price = 10500
			else
				price = 10500
			end
			vnxSetElementData ( player, "drivingLicensePrice", price )
			if tonumber(vnxGetElementData ( player, "carlicense" )) == 0 then
				if tonumber(vnxGetElementData ( player, "money" )) >= price then
					triggerClientEvent ( player, "deleteWindowsRathaus", getRootElement())
					startDrivingSchoolTheory_func ()
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast bereits\neinen Fuehrerschein!", 5000, 255, 0, 0 )
			end
		elseif lizens == "perso" then
			if tonumber(vnxGetElementData ( player, "perso" )) == 0 then
				if tonumber(vnxGetElementData ( player, "money" )) >= 450 then
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 450 )
					vnxSetElementData ( player, "perso", 1 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nPersonalausweis\nerhalten!", 5000, 0, 255, 0 )
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
				if tonumber(vnxGetElementData ( player, "money" )) >= 8450 then
					if vnxGetElementData ( player, "carlicense" ) == 1 then
						vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 8450 )
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
				if tonumber(vnxGetElementData ( player, "money" )) >= 23920 then
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 23920 )
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
				if tonumber(vnxGetElementData ( player, "money" )) >= 3520 then
					if vnxGetElementData ( player, "motorbootlicense" ) == 1 then
						vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 3520 )
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
				if tonumber(vnxGetElementData ( player, "money" )) >= 4250 then
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 4250 )
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
	end
end
addEvent ( "LizenzKaufen", true )
addEventHandler ( "LizenzKaufen", getRootElement(), LizenzKaufen_func )
