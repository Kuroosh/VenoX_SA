

function iraeume ( player, cmd, i )

	if vnxGetElementData ( player, "adminlvl" ) >= 3 then
		local int, intx, inty, intz = getInteriorData ( i )
		if int then
			setElementInterior ( player, int, intx, inty, intz )
		else
			infobox ( player, "Der Interior\nexistiert nicht!", 4000, 200, 0, 0 )
		end
	end
end
addCommandHandler ( "adminint", iraeume )

function in_func ( player )

	local house = vnxGetElementData ( player, "house" )
	if isElement ( house ) then
		local px, py, pz = getElementPosition ( player )
		local hx, hy, hz = getElementPosition ( house )
		if getDistanceBetweenPoints3D ( px, py, pz, hx, hy, hz ) <= 5 then
			if ( getElementModel ( house ) == 1273 or getElementModel ( house ) == 1272 ) and vnxGetElementData ( house, "curint" ) > 0 then
				if not vnxGetElementData ( house, "locked" ) or math.abs ( vnxGetElementData ( player, "housekey" ) ) == vnxGetElementData ( house, "id" ) or vnxGetElementData ( house, "id" ) == getPlayerGang ( player ) then
					local i = vnxGetElementData ( house, "curint" )
					vnxSetElementData ( player, "curIntIn", i )
					local int, intx, inty, intz = getInteriorData ( i )
					local dim = vnxGetElementData ( house, "id" )
					if i == 0 then
						dim = 0
					end
					setElementDimension ( player, dim )
					fadeElementInterior ( player, int, intx, inty, intz )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Tippe /out, um\ndas Haus zu\nverlassen und\ndruecke F2, um\ndas Hausmenue zu\noeffnen.", 7500, 125, 0, 0 )
					bindKey ( player, "F2", "down", house_func )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs ist abgeschlossen!", 7500, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist bei\nkeinem Haus!", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist bei\nkeinem Haus!", 7500, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist bei\nkeinem Haus!", 7500, 125, 0, 0 )
	end
end
addCommandHandler ( "in", in_func )

function out_func ( player )

	local dim = getElementDimension ( player )
	local haus = vnxGetElementData ( player, "house" )
	if not isElement ( haus ) then
		haus = houses["pickup"][getElementDimension ( player )]
	end
	if isElement ( haus ) then
		local i = vnxGetElementData ( haus, "curint" )
		local int, intx, inty, intz = getInteriorData ( i )
		if int then
			local px, py, pz = getElementPosition ( player )
			if getDistanceBetweenPoints3D ( px, py, pz, intx, inty, intz ) <= 10 then
				vnxGetElementData ( player, "curIntIn", 0 )
				local dim = getElementDimension ( player )
				local sx, sy, sz = getElementPosition ( haus )
				fadeElementInterior ( player, 0, sx, sy, sz )
				setElementDimension ( player, 0 )
				unbindKey ( player, "F2", "down", house_func )
			end
		end
	else
		outputChatBox ( "Du bist in keinem Haus!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "out", out_func )

function rent_func ( player )

	local haus = vnxGetElementData ( player, "house" )
	if haus then
		local x1, y1, z1 = getElementPosition ( player )
		local x2, y2, z2 = getElementPosition ( haus )
		local pname = getPlayerName ( player )
		local distance = getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 )
		local miete = tonumber ( vnxGetElementData ( haus, "miete" ) )
		local kasse = tonumber ( vnxGetElementData ( haus, "kasse" ) )
		if distance < 5 then
			if vnxGetElementData ( haus, "miete" ) >= 1 and vnxGetElementData ( haus, "owner" ) ~= "none" then
				if vnxGetElementData ( player, "housekey" ) == 0 then
					if vnxGetElementData ( player, "money" ) >= miete then
						vnxSetElementData ( player, "housekey", tonumber ( vnxGetElementData ( haus, "id" ) ) * -1 )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast dich\nerfolgreich einge-\nmietet, tippe /unrent,\num auszuziehen!", 7500, 0, 200, 0 )
						moneychange ( player, miete*-1 )
						local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Kasse", "houses", "ID", getElementDimension ( player ) ), -1 )
						if result and result[1] then
							kasse = tonumber ( result[1]["Kasse"] )
							dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "houses", "Kasse", kasse + miete, "ID", vnxGetElementData ( haus, "id" ) )
							vnxSetElementData ( haus, "kasse", kasse + miete )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast zu\nwenig Geld!", 7500, 125, 0, 0 )
					end
				elseif vnxGetElementData ( player, "housekey" ) < 0 then
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Du bist bereits\nin ein Haus\neingemietet! Tippe\n/unrent, um aus-\nzuziehen!", 7500, 125, 0, 0 )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Dir gehört bereits\nein Haus - Tippe\nzuerst /sellhouse!", 7500, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nHier kansnt du\ndich nicht\neinmieten!", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist bei\nkeinem Haus!", 7500, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "rent", rent_func )

function sellhouse_func ( player )

	local ID = tonumber ( vnxGetElementData ( player, "housekey" ) )
	if ID > 0 then
		local haus = houses["pickup"][ID]
		local pname = getPlayerName ( player )
		local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=? AND ?? LIKE ?", "Typ", "buyit", "AnbieterUID", playerUID[pname], "Typ", "Houses" ), -1 )
		if not result or not result[1] then
			if not isGang ( ID ) then
				outputLog ( pname.." hat sein Haus verkauft.", "house" )
				vnxSetElementData ( player, "spawnpos_x", -2458.288085 )
				vnxSetElementData ( player, "spawnpos_y", 774.354492 )
				vnxSetElementData ( player, "spawnpos_z", 35.171875 )
				vnxSetElementData ( player, "spawnrot_x", 52 )
				vnxSetElementData ( player, "spawnint", 0 )
				vnxSetElementData ( player, "spawndim", 0 )
				vnxSetElementData ( player, "housekey", 0 )
				local owner = vnxGetElementData ( haus, "owner" )
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast soeben\ndein Haus verkauft!", 7500, 0, 200, 0 )
				dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "houses", "UID", 0, "UID", playerUID[getPlayerName(player)] )
				dbExec ( handler, "UPDATE ?? SET ??=? WHERE ?? LIKE ?", "userdata", "Hausschluessel", 0, "UID", playerUID[getPlayerName(player)] )
				local hauswert = tonumber ( vnxGetElementData ( haus, "preis" ) )
				moneychange ( player, hauswert )
				datasave_remote(player)
				setHouseSold ( haus, player )
			else
				infobox ( player, "\n\n\nLoese erst deine\nGang auf!", 5000, 125, 0, 0 )
			end
		else
			outputChatBox ( "Dein Haus wird momentan versteigert!", player, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDir gehoert\nkein Haus!", 7500, 125, 0, 0 )
	end
end
addCommandHandler ( "sellhouse", sellhouse_func )

function unrent_func ( player )

	local ID = vnxGetElementData ( player, "housekey" )
	if ID < 0 then
		vnxSetElementData ( player, "spawnpos_x", -2458.288085 )
		vnxSetElementData ( player, "spawnpos_y", 774.354492 )
		vnxSetElementData ( player, "spawnpos_z", 35.171875 )
		vnxSetElementData ( player, "spawnrot_x", 52 )
		vnxSetElementData ( player, "spawnint", 0 )
		vnxSetElementData ( player, "spawndim", 0 )
		vnxSetElementData ( player, "housekey", 0 )
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast dich\nausgemietet!", 7500, 0, 200, 0 )
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist nirgends\neingemietet!", 7500, 125, 0, 0 )
	end
end
addCommandHandler ( "unrent", unrent_func )

function setrent_func ( player, cmd, preis )

	local ID = vnxGetElementData ( player, "housekey" )
	local haus = houses["pickup"][ID]
	local preis = math.abs(math.floor(preis))
	if ID > 0 then
		local miete =  math.abs ( tonumber ( preis ) )
		if miete and miete <= 1000 then
			vnxSetElementData ( haus, "miete", miete )
			dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "houses", "Miete",  miete, "ID", vnxGetElementData ( haus, "id" ) )
			if miete == 0 then
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDein Haus ist\nnun nicht mehr\nzu mieten!", 7500, 0, 200, 0 )
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDein Haus ist\nnun fuer "..miete.." $\nzu mieten!", 7500, 0, 200, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "Fehler: Tippe\n/setrent [Summe],\n0 $ = Nicht\nmietbar, max.\n1000 $!", 7500, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDir gehoert\nkein Haus!", 7500, 125, 0, 0 )
	end
end
addCommandHandler ( "setrent", setrent_func )

function house_func ( player, key, state )

	if isInUserHouse ( player ) then
		local amount = tonumber ( dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Kasse", "houses", "ID", getElementDimension ( player ) ), -1 )[1]["Kasse"] )
		if amount then
			if not getElementClicked ( player ) then
				setElementClicked ( player, true )
				showCursor ( player, true )
				setElementClicked ( player, true )
				local id = getElementDimension ( player )
				if isInGang ( player, id ) then
					openClientGangWindow ( player, id )
				else
					triggerClientEvent ( player, "showHouseGui", player, amount )
				end
			end
		end
	end
end

function hlock_func ( player )

	local hkey = vnxGetElementData ( player, "housekey" )
	if hkey > 0 then
		vnxSetElementData ( houses["pickup"][hkey], "locked", not vnxGetElementData ( houses["pickup"][hkey], "locked" ) )
		if vnxGetElementData ( houses["pickup"][hkey], "locked" ) then fix = "ab" else fix = "auf" end
		outputChatBox ( "Haustuer "..fix.."geschlossen!", player, 0, 125, 0 )
	else
		outputChatBox ( "Dir gehört kein Haus!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "hlock", hlock_func )

function houseClickServer_func ( player, cmd, amount )
	playSoundFrontEnd ( player, 20 )
	if cmd == "eat" then
		setPedAnimation ( player, "food", "EAT_Burger", 1, true, false, true )
		setTimer ( setPedAnimation, 1200, 1, player )
		setTimer ( setElementHunger, 1200, 1, player, 100 )
	elseif cmd == "heal" then
		setElementHealth ( player, 100 )
	elseif cmd == "take" or cmd == "give" then
		if amount then
			amount = math.abs(math.floor(amount))
			if getElementDimension ( player ) == vnxGetElementData ( player, "housekey" ) then
				local houseAmount = tonumber ( dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Kasse", "houses", "ID", vnxGetElementData ( player, "housekey" ) ), -1 )[1]["Kasse"] )
				if cmd == "take" then
					if houseAmount >= amount then
						givePlayerSaveMoney ( player, amount )
						dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "houses", "Kasse",  houseAmount - amount, "ID", vnxGetElementData ( player, "housekey" ) )
						triggerClientEvent ( "showHouseGui", player, houseAmount - amount )
					else
						outputChatBox ( "Du hast nicht genug Geld in deiner Hauskasse!", player, 125, 0, 0 )
					end
				elseif cmd == "give" then
					if vnxGetElementData ( player, "money" ) >= amount then
						takePlayerSaveMoney ( player, amount )
						dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "houses", "Kasse",  houseAmount + amount, "ID", vnxGetElementData ( player, "housekey" ) )
						triggerClientEvent ( "showHouseGui", player, houseAmount + amount )
					else
						outputChatBox ( "Du hast nicht genug Geld!", player, 125, 0, 0 )
					end
				end
			else
				outputChatBox ( "Du bist nicht befugt!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Ungültiger Wert!", player, 125, 0, 0 )
		end
	end
end
addEvent ( "houseClickServer", true )
addEventHandler ( "houseClickServer", getRootElement(), houseClickServer_func )


--[[addCommandHandler ( "garage", function ( player )
	local id = vnxGetElementData ( player, "housekey" )
	if id then
		local x, y, z = getElementPosition ( player )
		
		-- Bahnhof-Haus --
		if id == 1 then
			-- Nord-Garage --
			if getDistanceBetweenPoints3D ( x, y, z, -2039.28625, 178.75263, 28.84 ) <= 10 then
				setGarageOpen ( 22, not isGarageOpen ( 22 ) )
			-- Süd-Garage --
			elseif getDistanceBetweenPoints3D ( x, y, z, -2026.6065674, 129.412, 28.9 ) <= 10 then
				setGarageOpen ( 21, not isGarageOpen ( 21 ) )
			end
		end
	end
end )]]