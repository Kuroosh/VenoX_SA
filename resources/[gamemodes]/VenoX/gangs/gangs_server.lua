function creategang_func ( player )

	local housekey = vnxGetElementData ( player, "housekey" )
	if housekey > 0 then
		local pname = getPlayerName ( player )
		if vnxGetElementData ( player, "fraktion" ) == 0 then
			if not isInGang ( pname, nil ) then
				local bankmoney = vnxGetElementData ( player, "bankmoney" )
				if bankmoney >= costsToCreateGang then
					if not vnxGetElementData ( player, "gangCreateTry" ) then
						vnxSetElementData ( player, "gangCreateTry", true )
						outputChatBox ( "Du willst eine Gang gruenden - das wird dich "..formNumberToMoneyString ( costsToCreateGang ).." kosten.", player, 200, 200, 0 )
						outputChatBox ( "Tippe erneut /create gang, um zu bestaetigen.", player, 200, 200, 0 )
					else
						vnxSetElementData ( player, "gangCreateTry", false )
						createNewGang ( pname.."s Gang", getElementModel ( player ), housekey )
						insertInGang ( pname, housekey, 3, true )
						outputChatBox ( "Du hast soeben deine eigene Gang gegruendet - Mehr erfaehrst du im Hausmenue.", player, 0, 125, 0 )
						vnxSetElementData ( player, "bankmoney", bankmoney - costsToCreateGang )
					end
				else
					infobox ( player, "\n\nEine neue Gang\nzu erstellen kostet\n"..formNumberToMoneyString ( costsToCreateGang ), 5000, 125, 0, 0 )
				end
			else
				infobox ( player, "\n\n\nDu bist bereits\nin einer Gang!", 5000, 125, 0, 0 )
			end
		else
			infobox ( player, "\n\n\nDu bist in\neiner Fraktion!", 5000, 125, 0, 0 )
		end
	else
		infobox ( player, "\n\n\nDu hast kein\neigenes Haus!", 5000, 125, 0, 0 )
	end
end
addCommandHandler ( "creategang", creategang_func )

function leavegang_func ( player )

	local pname = getPlayerName ( player )
	if isInGang ( pname ) then
		if not isInGang ( pname, vnxGetElementData ( player, "housekey" ) ) then
			removePlayerFromGang ( pname )
			infobox ( player, "\n\n\nDu hast deine\nGang verlassen.", 5000, 125, 0, 0 )
		else
			infobox ( player, "\n\n\nDu musst die\nGang erst auf-\nloesen.", 5000, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "leavegang", leavegang_func )

function guninvite_func ( player, cmd, name )

	uninvitedPlayer = getPlayerFromName ( name )
	if uninvitedPlayer then
		if isInGang ( uninvitedPlayer, getPlayerGang ( player ) ) then
			if not isInGang ( uninvitedPlayer, vnxGetElementData ( uninvitedPlayer, "housekey" ) ) then
				if getPlayerGangRank ( player ) >= 3 then
					if not isFounderOfGang ( player ) then
						removePlayerFromGang ( uninvitedPlayer )
						outputChatBox ( getPlayerName ( player ).." hat dich aus der Gang geworfen.", uninvitedPlayer, 125, 0, 0 )
						outputChatBox ( "Du hast "..getPlayerName ( uninvitedPlayer ).." aus der Gang geworfen.", player, 0, 200, 0 )
					end
				else
					infobox ( player, "\n\nDu hast nicht\ndie erforderlichen\nRechte!", 5000, 125, 0, 0 )
				end
			else
				infobox ( player, "\n\n\nDer Spieler ist\nder Gruender!", 5000, 125, 0, 0 )
			end
		else
			infobox ( player, "\n\nDer Spieler ist\nnicht in deiner\nGang!", 5000, 125, 0, 0 )
		end
	else
		if not isFounderOfGang ( name, getPlayerGang ( name ) ) then
			if getPlayerGangRank ( player ) >= 3 then
				removePlayerFromGang ( name )
			else
				infobox ( player, "\n\nDu hast nicht\ndie erforderlichen\nRechte!", 5000, 125, 0, 0 )
			end
		end
	end
end
addCommandHandler ( "ganguninvite", guninvite_func )

function ginvite_func ( player, cmd, name )

	local invitedPlayer = getPlayerFromName ( name )
	local pname = getPlayerName ( player )
	if invitedPlayer then
		if isInGang ( player ) then
			if not isInGang ( invitedPlayer ) then
				if getPlayerGangRank ( player ) >= 3 then
					local id = getPlayerGang ( player )
					if vnxGetElementData ( invitedPlayer, "fraktion" ) == 0 then
						if getMembersInGangCount ( id ) < getGangMaxMembers ( id ) then
							insertInGang ( getPlayerName ( invitedPlayer ), id, 1 )
							infobox ( player, "\n\nDu hast "..name.."\nin deine Gang\naufgenommen.", 5000, 0, 200, 0 )
							infobox ( invitedPlayer, "\n\nDu wurdest von\n"..pname.." in eine\nGang eingeladen.", 5000, 0, 200, 0 )
						else
							infobox ( player, "\nDie Gang ist voll!\nMelde dich im\n Forum oder wirf\njemanden raus!", 5000, 125, 0, 0 )
						end
					else
						infobox ( player, "\n\n\nDer Spieler ist\nbereits in einer\nFraktion!", 5000, 125, 0, 0 )
					end
				else
					infobox ( player, "\n\n\nDu bist nicht\nbefugt!", 5000, 125, 0, 0 )
				end
			else
				infobox ( player, "\n\nDer Spieler ist\nbereits in einer\nGang!", 5000, 125, 0, 0 )
			end
		else
			infobox ( player, "\n\n\nDu bist in\nkeiner Gang!", 5000, 125, 0, 0 )
		end
	else
		infobox ( player, "\n\n\nUngueltiger Spieler!", 5000, 125, 0, 0 )
	end
end
addCommandHandler ( "ganginvite", ginvite_func )

function ggiverank_func ( player, cmd, name, rank )

	local member = getPlayerFromName ( name )
	local gang = getPlayerGang ( player )
	if getPlayerGang ( member ) == gang then
		if getPlayerGangRank ( player ) >= 3 then
			if member ~= player and getPlayerGangRank ( member ) < 3 then
				setPlayerGangRank ( member, rank )
				infobox ( player, "Rang gesetzt.", 5000, 0, 125, 0 )
			end
		else
			infobox ( player, "\n\n\nDu bist nicht\nbefugt!", 5000, 125, 0, 0 )
		end
	else
		infobox ( player, "\n\n\nUngueltiger Spieler!", 5000, 125, 0, 0 )
	end
end
addCommandHandler ( "ganggiverank", ggiverank_func )

function gangLeaderChangeRecieve_func ( field, v1, v2, v3 )

	local id = getPlayerGang ( client )
	local player = client
	local pname = getPlayerName ( player )
	for i = 1, 3 do
		if field == "rank"..i then
			
			return nil
		end
	end
	if field == "take" or field == "store" then
		local take = ( field == "take" )
		if take and getPlayerGangRank ( player ) < 3 then
			infobox ( player, "Dazu bist du\nnicht berechtigt.", 5000, 125, 0, 0 )
			return nil
		end
		v2 = math.floor ( math.abs ( tonumber ( v2 ) ) )
		if v1 == "money" then
			if take then
				if getGangMoney ( id ) >= v2 then
					local money = vnxGetElementData ( player, "money" )
					vnxSetElementData ( player, "money", money + v2 )
					setGangMoney ( id, getGangMoney ( id ) - v2 )
				else
					infobox ( player, "Nicht genug Geld\nim Lager.", 5000, 125, 0, 0 )
					return nil
				end
			else
				local money = vnxGetElementData ( player, "money" )
				if money >= v2 then
					vnxSetElementData ( player, "money", money - v2 )
					setGangMoney ( id, getGangMoney ( id ) + v2 )
				else
					infobox ( player, "Du hast nicht\ngenug Geld dabei.", 5000, 125, 0, 0 )
					return nil
				end
			end
		elseif v1 == "drugs" then
			local drugs = vnxGetElementData ( player, "drugs" )
			if take then
				if getGangDrugs ( id ) >= v2 then
					vnxSetElementData ( player, "drugs", drugs + v2 )
					setGangDrugs ( id, getGangDrugs ( id ) - v2 )
				else
					infobox ( player, "Nicht genug Drogen\nim Lager.", 5000, 125, 0, 0 )
					return nil
				end
			else
				if drugs >= v2 then
					vnxSetElementData ( player, "drugs", drugs - v2 )
					setGangDrugs ( id, getGangDrugs ( id ) + v2 )
				else
					infobox ( player, "Du hast nicht\ngenug Drogen\ndabei.", 5000, 125, 0, 0 )
					return nil
				end
			end
		elseif v1 == "mats" then
			local mats = vnxGetElementData ( player, "mats" )
			if take then
				if getGangMats ( id ) >= v2 then
					vnxSetElementData ( player, "mats", mats + v2 )
					setGangMats ( id, getGangMats ( id ) - v2 )
				else
					infobox ( player, "Nicht genug Mats\nim Lager.", 5000, 125, 0, 0 )
					return nil
				end
			else
				if mats >= v2 then
					vnxSetElementData ( player, "mats", mats - v2 )
					setGangMats ( id, getGangMats( id ) + v2 )
				else
					infobox ( player, "Du hast nicht\ngenug Mats\ndabei.", 5000, 125, 0, 0 )
					return nil
				end
			end
		end
		infobox ( player, "Lager benutzt.", 5000, 0, 125, 0 )
	elseif field == "changeGangWeapon" then
		v1 = tonumber ( v1 )
		if validWeaponsForGang[v1] then
			dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "gang_basic", "Waffe", v1, "HausID", id )
			infobox ( player, "Gangwaffe gaendert.", 5000, 0, 125, 0 )
		end
	elseif field == "renameGang" then
		if isFounderOfGang ( player ) then
			if getGangFromName ( v1 ) then
				infobox ( player, "Diese Name ist\nbereits vergeben!", 5000, 125, 0, 0 )
			else
				infobox ( player, "Name geaendert.", 5000, 125, 0, 0 )
				setGangName ( id, v1 )
			end
		else
			infobox ( player, "Dazu ist nur\nder Gruender be-\nrechtigt.", 5000, 125, 0, 0 )
		end
	elseif field == "deleteGang" then
		if isFounderOfGang ( player ) then
			deleteGang ( id )
		else
			infobox ( player, "Nur der Gruender\nist zum loeschen\neiner Gang berechtigt.", 5000, 125, 0, 0 )
		end
	elseif field == "giveRank" then
		v2 = math.abs ( math.floor ( tonumber ( v2 ) ) )
		if v2 >= 1 and v2 <= 3 then
			if v1 ~= getPlayerName ( client ) then
				setPlayerGangRank ( v1 , v2 )
				infobox ( player, "Rang gesetzt.", 5000, 125, 0, 0 )
			else
				infobox ( player, "Du darfst dir\nnicht selbst einen\Rang setzen!", 5000, 125, 0, 0 )
			end
		else
			infobox ( player, "Ungueltiger Wert:\n"..v2, 5000, 125, 0, 0 )
		end
	elseif field == "invite" then
		if getPlayerFromName ( v1 ) then
			if getPlayerGangRank ( player ) >= 3 then
				executeCommandHandler ( "ganginvite", player, v1 )
			else
				infobox ( player, "Du bist nicht\nberechtigt!", 5000, 125, 0, 0 )
			end
		else
			infobox ( player, "Ungueltiger Spieler!", 5000, 125, 0, 0 )
		end
	elseif field == "uninvite" then
		if getPlayerGangRank ( player ) >= 3 then
			executeCommandHandler ( "ganguninvite", player, v1 )
		else
			infobox ( player, "Du bist nicht\nberechtigt!", 5000, 125, 0, 0 )
		end
	elseif field == "pinboard" then
		if v1 then
			if getPlayerGangRank ( player ) >= 3 then
				setGangMSG ( id, v1 )
			else
				infobox ( player, "Du bist nicht\nbefugt.", 5000, 125, 0, 0 )
			end
		end
	elseif field == "useSkin" then
		local skin = tonumber ( dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Skin", "gang_basic", "HausID", id ), -1 )[1]["Skin"] ) 
		if skin then
			vnxSetElementData ( player, "skinid", skin )
			setElementModel ( player, skin )
			infobox ( player, "Skin angenommen!", 5000, 0, 125, 0 )
		end
	elseif field == "setSkin" then
		if getPlayerGangRank ( player ) >= 3 then
			local skin = getElementModel ( player )
			if ( skinname[skin] ) then
				dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "gang_basic", "Skin", skin, "HausID", id )
				infobox ( player, "Skin geaendert!", 5000, 0, 125, 0 )
			else
				infobox ( player, "Dieser Skin ist\nnicht verfübar!", 5000, 125, 0, 0 )
			end
		else
			infobox ( player, "Du bist nicht\nberechtigt!", 5000, 125, 0, 0 )
		end
	elseif field == "equip" then
		local money = vnxGetElementData ( player, "money" )
		if money >= costsToArm then
			infobox ( player, "Du hast dich\nausgeruestet!", 5000, 0, 125, 0 )
			setPedArmor ( player, 50 )
			setElementHealth ( player, 100 )
			giveWeapon ( player, tonumber ( dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Waffe", "gang_basic", "HausID", id ), -1 )[1]["Waffe"] ) )
		else
			infobox ( player, "Du hast nicht\ngenug Geld!", 5000, 125, 0, 0 )
		end
	elseif field == "renameRanks" then
		setGangRankName ( id, 1, v1 )
		setGangRankName ( id, 2, v2 )
		setGangRankName ( id, 3, v3 )
		infobox ( player, "Raenge geandert!", 5000, 0, 125, 0 )
	elseif field == "sendMSGToGang" then
		sendMessageToGangMembers ( id, getPlayerName ( client ).." "..v1 )
	end
end
addEvent ( "gangLeaderChangeRecieve", true )
addEventHandler ( "gangLeaderChangeRecieve", getRootElement(), gangLeaderChangeRecieve_func )

function openClientGangWindow ( player )

	if client then
		player = client
	end
	local id = getElementDimension ( player )
	local msg, gangVehicleCost, money, mats, drugs, memberCount, memberString, gangname
	msg = getGangMSG ( id )
	gangVehicleCost = getGangVehicleCost ( id )
	money = getGangMoney ( id )
	mats = getGangMats ( id )
	drugs = getGangDrugs ( id )
	memberCount = getMembersInGangCount ( id )
	memberString = getGangMembersString ( id )
	gangname = getGangName ( id )
	local rank1, rank2, rank3 = getGangRankName ( id, 1 ), getGangRankName ( id, 2 ), getGangRankName ( id, 3 )
	triggerClientEvent ( player, "showGangWindow", player, msg, gangVehicleCost, money, mats, drugs, memberCount, memberString, gangname, rank1, rank2, rank3 )
	getGangMSG ( id )
end
addEvent ( "showGangGUIAgain", true )
addEventHandler ( "showGangGUIAgain", getRootElement(), openClientGangWindow )

function gangEat_func ( player )

	if client == player then
	
		setElementHealth ( player, 100 )
		setPedArmor ( player, 100 )
		setElementHunger ( player, 100 )

	end

end

addEvent ( "gangEatServer", true )
addEventHandler ( "gangEatServer", root, gangEat_func )