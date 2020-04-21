function importRecieve ( toImport )

	local player = client
	local money = vnxGetElementData ( player, "money" )
	if toImport == "tec9" or toImport == "uzi" then
		if vnxGetElementData ( player, "gunlicense" ) == 1 then
			if not ( toImport == "uzi" and getPedWeapon ( player, 4 ) == 28 ) or ( toImport == "tec9" and getPedWeapon ( player, 4 ) == 32 ) then
				if money >= 750 then
					if toImport == "tec9" then
						giveWeapon ( player, 32, 50, true )
					else
						giveWeapon ( player, 28, 50, true )
					end
					vnxSetElementData ( player, "money", money - 750 )
				else
					infobox ( player, "Du hast nicht\ngenug Geld!", 5000, 200, 0, 0 )
				end
			else
				infobox ( player, "Du hast diese\nWaffe bereits!", 5000, 200, 0, 0 )
			end
		else
			infobox ( player, "Du hast keinen\nWaffenschein!", 5000, 200, 0, 0 )
		end
	elseif toImport == "ammo" then
		if getPedWeapon ( player, 4 ) == 28 or getPedWeapon ( player, 4 ) == 32 then
			if money >= 150 then
				giveWeapon ( player, getPedWeapon ( player, 4 ), 50, true )
				vnxSetElementData ( player, "money", money - 150 )
			else
				infobox ( player, "Du hast nicht\ngenug Geld!", 5000, 200, 0, 0 )
			end
		else
			infobox ( player, "Du musst die\njeweilige Waffe besitzen,\nwenn du Munnition\nkaufen willst!", 5000, 200, 0, 0 )
		end
	end
end
addEvent ( "importRecieve", true )
addEventHandler ( "importRecieve", getRootElement(), importRecieve )