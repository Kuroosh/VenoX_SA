function clearInv ( player )

	--[[local pname = getPlayerName ( player )
	-- if getElementData ( player, "playerid" ) then
		removeElementData ( player, "dice" )
		removeElementData ( player, "palmseeds" )
		removeElementData ( player, "flowerseeds" )
		removeElementData ( player, "phonebook" )
		removeElementData ( player, "lottozahlen" )
		removeElementData ( player, "food1" )
		removeElementData ( player, "food2" )
		removeElementData ( player, "food3" )
		removeElementData ( player, "guninv1" )
		removeElementData ( player, "guninv2" )
		removeElementData ( player, "guninv3" )
		removeElementData ( player, "guninv4" )
		removeElementData ( player, "guninv5" )
		removeElementData ( player, "zigaretten" )
		removeElementData ( player, "peilsender" )
		removeElementData ( player, "mats" )
		outputDebugString ("Inventory fuer Spieler "..pname.." wurden befreit!")
	--end]]
end

function clearUserdata ( player )

	--[[local pname = getPlayerName ( player )
	-- if getElementData ( player, "playerid" ) then
		removeElementData ( player, "money" )
		removeElementData ( player, "points" )
		removeElementData ( player, "packages" )
		removeElementData ( player, "spawnpos_x" )
		removeElementData ( player, "spawnpos_y" )
		removeElementData ( player, "spawnpos_z" )
		removeElementData ( player, "spawnrot_x" )
		removeElementData ( player, "spawnint" )
		removeElementData ( player, "spawndim" )
		removeElementData ( player, "fraktion" )
		removeElementData ( player, "rang" )
		removeElementData ( player, "adminlvl" )
		removeElementData ( player, "playingtime" )
		removeElementData ( player, "curcars" )
		removeElementData ( player, "maxcars" )
		for i = 1, 10 do
			removeElementData ( player, "carslot"..i )
		end
		removeElementData ( player, "deaths" )
		removeElementData ( player, "kills" )
		removeElementData ( player, "" )
		removeElementData ( player, "" )
		removeElementData ( player, "" )
		removeElementData ( player, "" )
		removeElementData ( player, "" )
		removeElementData ( player, "" )
		removeElementData ( player, "" )
		removeElementData ( player, "jailtime" )
		removeElementData ( player, "prisontime" )
		removeElementData ( player, "helltime" )
		removeElementData ( player, "heaventime" )
		removeElementData ( player, "housekey" )
		removeElementData ( player, "bizkey" )
		removeElementData ( player, "bankmoney" )
		removeElementData ( player, "drugs" )
		removeElementData ( player, "skinid" )
		removeElementData ( player, "carlicense" )
		removeElementData ( player, "bikelicense" )
		removeElementData ( player, "lkwlicense" )
		removeElementData ( player, "helilicense" )
		removeElementData ( player, "planelicensea" )
		removeElementData ( player, "planelicenseb" )
		removeElementData ( player, "segellicense" )
		removeElementData ( player, "motorbootlicense" )
		removeElementData ( player, "fishinglicense" )
		removeElementData ( player, "wanteds" )
		removeElementData ( player, "stvo_punkte" )
		removeElementData ( player, "gunlicense" )
		removeElementData ( player, "perso" )
		removeElementData ( player, "boni" )
		removeElementData ( player, "incomepayday" )
		removeElementData ( player, "pdayincome" )
		removeElementData ( player, "pdaykosten" )
		removeElementData ( player, "telenr" )
		removeElementData ( player, "warns" )
		removeElementData ( player, "gunboxa" )
		removeElementData ( player, "gunboxb" )
		removeElementData ( player, "gunboxc" )
		removeElementData ( player, "job" )
		removeElementData ( player, "jobtime" )
		removeElementData ( player, "club" )
		removeElementData ( player, "favchannel" )
		removeElementData ( player, "bonuspoints" )
		removeElementData ( player, "truckerlvl" )
		outputDebugString ("Daten fuer Spieler "..pname.." wurden befreit!")
	--end]]
end

function clearPackage ( player )

	--[[local pname = getPlayerName ( player )
	removeElementData ( player, "foundpackages" )
	for i = 1, 25 do
		removeElementData ( player, "package"..i )
	end
	outputDebugString ("Pakete fuer Spieler "..pname.." wurden befreit!")]]
end

function clearAchiev ( player )

	--[[local pname = getPlayerName ( player )
	-- if getElementData ( player, "playerid" ) then
		removeElementData ( player, "schlaflosinsa" )
		removeElementData ( player, "gunloads" )
		removeElementData ( player, "angler_achiev" )
		removeElementData ( player, "licenses_achiev" )
		removeElementData ( player, "carwahn_achiev" )
		removeElementData ( player, "collectr_achiev" )
		removeElementData ( player, "rl_achiev" )
		removeElementData ( player, "own_foots" )
		removeElementData ( player, "kingofthehill_achiev" )
		outputDebugString ("Bonus fuer Spieler "..pname.." wurden befreit!")
	--end]]
end

function clearBonus ( player )

	--[[local pname = getPlayerName ( player )
	-- if getElementData ( player, "playerid" ) then
		removeElementData ( player, "lungenvol")
		removeElementData ( player, "muscle" )
		removeElementData ( player, "stamina" )
		removeElementData ( player, "boxen" )
		removeElementData ( player, "kungfu" )
		removeElementData ( player, "streetfighting" )
		removeElementData ( player, "pistolskill" )
		removeElementData ( player, "deagleskill" )
		removeElementData ( player, "shotgunskill" )
		removeElementData ( player, "assaultskill" )
		removeElementData ( player, "mp5skill" )
		removeElementData ( player, "vortex" )
		removeElementData ( player, "quad" )
		removeElementData ( player, "carslotupgrade" )
		outputDebugString ("Bonus fuer Spieler "..pname.." wurden befreit!")
	--end]]
end

function clearDataSettings ( player )
	
	--[[local pname = getPlayerName ( player )
	-- if getElementData ( player, "playerid" ) then
		removeElementData ( player, "armingBomb" )
		removeElementData ( player, "cheatingtrys" )
		removeElementData ( player, "isInRace" )
		removeElementData ( player, "callswithpolice" )
		removeElementData ( player, "isLive" )
		removeElementData ( player, "oldwanteds" )
		removeElementData ( player, "isInArea51Mission" )
		removeElementData ( player, "isInDrivingSchool" )
		outputDebugString ("Settings fuer Spieler "..pname.." wurden befreit!")
	--end]]
	elementData[player] = nil
end