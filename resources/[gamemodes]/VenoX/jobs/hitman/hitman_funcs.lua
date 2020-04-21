mincontract = 25000

hitmanjobicon = createPickup ( -1830.7301025391, 572.65557861328, 34.81, 3, 1239, 1000, 0 )
setElementAlpha ( hitmanjobicon, 0 )

hitmanblip = createBlip ( -1830.7301025391, 572.65557861328, 34.81, 43, 1, 255, 0, 0, 255, 0, 99999 )
setElementVisibleTo ( hitmanblip, getRootElement(), false )

function hitmanjobiconHit ( player )
	
	if vnxGetElementData ( player, "job" ) == "hitman" then
		outputChatBox ( "Tippe /contracts, um die Auftraege zu sehen, /contract [Name] [Summe], um ein Kopfgeld auszusetzen.", player, 200, 125, 125 )
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "Tippe /job, um\nals Hitman zu\narbeiten -\nAllerdings illegal!", 5000, 200, 200, 0 )
	end
	--outputChatBox ( "Vorruebergehend deaktiviert, bitte wende dich an einen Administrator!", player, 125, 0, 0 )
end
addEventHandler ( "onPickupHit", hitmanjobicon, hitmanjobiconHit )

function arm_func ( player )

	if vnxGetElementData ( player, "job" ) == "hitman" then
		local x1, y1, z1 = getElementPosition ( player )
		local x2, y2, z2 = getElementPosition ( hitmanjobicon )
		if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 10 then
			if vnxGetElementData ( player, "money" ) >= 1000 then
				takePlayerSaveMoney ( player, 300 )
				giveWeapon ( player, 24, 2000, true )
				triggerClientEvent ( player, "sec_gun_give", getRootElement(), 24, 56 )
				giveWeapon ( player, 29, 2000, true )
				triggerClientEvent ( player, "sec_gun_give", getRootElement(), 25, 25)
				giveWeapon ( player, 34, 50, true )
				triggerClientEvent ( player, "sec_gun_give", getRootElement(), 34, 10 )
			else
				outputChatBox ( "Du hast nicht genug Geld - ein Paket kostet 100$!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du bist an einer ungueltigen Stelle!", player, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "arm", arm_func )

function contract_func ( player, cmd, name, geld )

	local target = getPlayerFromName ( name )
	if vnxGetElementData ( player, "silentassasin_achiev" ) == "done" then
		triggerClientEvent ( player, "infobox_start", getRootElement(), "Du darfst kein\nKopfgeld aussezten,\nweil du die Mission\n \"The Truth is out\nthere\"geschafft hast\!", 5000, 125, 0, 0 )
	else
		if target and vnxGetElementData ( target, "loggedin" ) then
			local geld = tonumber ( geld )
			if geld then
				local pmoney = tonumber ( vnxGetElementData ( player, "money" ) )
				if pmoney >= geld then
					if geld >= mincontract then
						vnxSetElementData ( player, "money", pmoney - geld )
						takePlayerMoney ( player, geld )
						playSoundFrontEnd ( player, 40 )
						triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
						vnxSetElementData ( target, "contract", tonumber ( vnxGetElementData ( target, "contract" ) ) + geld )
						outputChatBox ( "Du hast "..geld.." $ Kopfgeld auf "..name.." ausgesetzt - ein Hitman wird sich bald um ihn kuemmern...", player, 0, 125, 0 )
					else
						outputChatBox ( "Bitte setze mindestens "..mincontract.." $ als Belohnung aus!", player, 125, 0, 0 )
					end
				else
					outputChatBox ( "Du hast nicht genug Geld, um einen Mord in Auftrag zu geben.", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Ungueltige Summe!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Der Spieler existiert nicht / ist offline!", player, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "contract", contract_func )

function contracts_func ( player )

	if isHitman ( player ) then
		outputChatBox ( "Aktuelle Aufträge:", player, 200, 200, 20 )
		for id, playeritem in ipairs(getElementsByType("player")) do
			if vnxGetElementData ( player, "loggedin" ) == 1 then
				local contract = tonumber ( vnxGetElementData ( playeritem, "contract" ) )
				local i = 0
				if contract >= mincontract then
					local i = i + 1
					outputChatBox ( getPlayerName ( playeritem )..", Belohnung: "..contract, player, 200, 200, 20 )
					if i == 3 then
						break
					end
				end
			end
		end
	else
		outputChatBox ( "Du bist kein Hitman!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "contracts", contracts_func )]]