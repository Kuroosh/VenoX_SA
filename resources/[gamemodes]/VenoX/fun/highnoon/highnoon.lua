highnoonIcon = createPickup ( -2617.2189941406, 209.10488891602, 4.4970808029175, 3, 1239, 1, 99 )

function highnoonIconHit ( hit )

	outputChatBox ( "Tippe /highnoon [Name] [Preisgeld], um jemanden herauszufordern!", hit, 125, 0, 0 )
end
addEventHandler ( "onPickupHit", highnoonIcon, highnoonIconHit )

function highnoon_func ( player, cmd, name, summe, runden )

	local name = getPlayerFromName ( name )
	runden = 1
	if name and name ~= player then
		local summe = math.abs ( tonumber ( summe ) )
		if summe then
			if summe <= vnxGetElementData ( player, "money" ) and vnxGetElementData ( name, "money" ) then
				local runden = tonumber ( runden )
				if runden then
					if runden >= 1 and runden <= 10 then
						local x1, y1, z1 = getElementPosition ( player )
						local x2, y2, z2 = getElementPosition ( name )
						local x3, y3, z3 = getElementPosition ( highnoonIcon )
						if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 5 and getDistanceBetweenPoints3D ( x1, y1, z1, x3, y3, z3 ) <= 5 then
							outputChatBox ( "Du hast "..getPlayerName ( name ).." zu einem Duell herausgefordert!", player, 0, 125, 0 )
							outputChatBox ( getPlayerName ( player ).." hat dich zu einem Duell um "..summe.." $ herausgefordert - tippe /accepthighnoon zum anzunehmen!", name, 125, 125, 200 )
							vnxSetElementData ( player, "highNoonQuestion", getPlayerName ( name ) )
							vnxSetElementData ( name, "highNoonQuestion", getPlayerName ( player ) )
							vnxSetElementData ( name, "highNoonSumme", summe )
							vnxSetElementData ( name, "highNoonRunden", runden )
						else
							outputChatBox ( "Du und dein Gegner muessen am Waffenladen sein!", player, 125, 0, 0 )
						end
					else
						outputChatBox ( "Bitte gib eine Rundenanzahl von 1-10 an!", player, 125, 0, 0 )
					end
				else
					outputChatBox ( "Bitte gib eine Rundenanzahl von 1-10 an!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Du oder dein Gegner haben nicht genug Bargeld!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Bitte gib einen Betrag ein!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Ungueltiger Spieler!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "highnoon", highnoon_func )

function accepthighnoon_func ( player, cmd )

	local name = vnxGetElementData ( player, "highNoonQuestion" )
	if name then
		local name = getPlayerFromName ( name )
		if name then
			setElementDimension ( player, 0 )
			setElementDimension ( name, 0 )
			local summe = vnxGetElementData ( player, "highNoonSumme" )
			if summe <= vnxGetElementData ( player, "money" ) and vnxGetElementData ( name, "money" ) then
				if not isPedDead ( player ) and not isPedDead ( name ) and not vnxGetElementData ( player, "isInHighNoon" ) and not vnxGetElementData ( name, "isInHighNoon" ) then
					removePedFromVehicle ( player )
					removePedFromVehicle ( name )
					if cmd == "accepthighnoon" then
						vnxSetElementData ( player, "highNoonWin", 0 )
						vnxSetElementData ( name, "highNoonWin", 0 )
					end
					local x1, y1, z1 = getElementPosition ( player )
					local x2, y2, z2 = getElementPosition ( name )
					local x3, y3, z3 = getElementPosition ( highnoonIcon )
					if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 5 and getDistanceBetweenPoints3D ( x1, y1, z1, x3, y3, z3 ) <= 5 then
						local runden = vnxGetElementData ( player, "highNoonRunden" )
						local rnd = math.floor ( math.random ( 1, 3 ) )
						if rnd == 1 then
							x1, y1, z1, r1 = -327.20141601563, 2214.8466796875, 43.005302429199, 130
							x2, y2, z2, r2 = -338.6721496582, 2226.546875, 43.005302429199, 335
						elseif rnd == 2 then
							x1, y1, z1, r1 = -375.46380615234, 2203.1652832031, 41.742977142334, 105
							x2, y2, z2, r2 = -378.09051513672, 2215.6633300781, 41.742977142334, 285
						elseif rnd == 3 then
							x1, y1, z1, r1 = -364.48175048828, 2227.7470703125, 42.133602142334, 275
							x2, y2, z2, r2 = -364.6962890625, 2216.3852539063, 42.133602142334, 95
						end
						vnxSetElementData ( name, "highNoonSumme", summe )
						local rnd = math.random ( 4, 9 )
						local dim = tonumber ( vnxGetElementData ( player, "playerid" ) )
						takeAllWeapons ( player )
						setElementDimension ( player, dim )
						setPedArmor ( player, 0 )
						vnxSetElementData ( player, "isInHighNoon", true )
						vnxSetElementData ( name, "highNoonRunden", runden )
						giveWeapon ( player, 24, 9999, false )
						setElementPosition ( player, x1, y1, z1, 0, 0, r1 )
						setElementModel ( player, 33 )
						triggerClientEvent ( player, "startHighNoon", getRootElement(), rnd )
						setElementHealth ( player, 1 )
						setPlayerNametagShowing ( player, false )
						takeAllWeapons ( name )
						setElementDimension ( name, dim )
						setPlayerNametagShowing ( name, false )
						setElementHealth ( name, 1 )
						setPedArmor ( name, 0 )
						triggerClientEvent ( name, "startHighNoon", getRootElement(), rnd )
						setElementModel ( name, 34 )
						setElementPosition ( name, x2, y2, z2, 0, 0, r2 )
						giveWeapon ( name, 24, 9999, false )
						vnxSetElementData ( name, "isInHighNoon", true )
						local pname = getPlayerName ( name )
						_G[pname.."highnoon"] = setTimer ( highNoonDraw, (rnd+10)*1000, 1, player, name )
						if cmd == "accepthighnoon" then
							vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - summe )
							vnxSetElementData ( name, "money", vnxGetElementData ( name, "money" ) - summe )
						end
					else
						outputChatBox ( "Du und dein Gegner muessen am Waffenladen sein!", player, 125, 0, 0 )
					end
				else
					outputChatBox ( "Einer von euch kann momentan kein Duell bestreiten!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Einer von euch hat nicht genug Geld!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Dein Duellpartner ist offline!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Niemand hat dir eine Duellanfrage gestellt!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "accepthighnoon", accepthighnoon_func )

function highNoonDraw ( p1, p2 )

	local runden = vnxGetElementData ( p1, "highNoonRunden" )
	local summe = vnxGetElementData ( p1, "highNoonSumme" )
	if (vnxGetElementData ( p1, "isInHighNoon" ) and vnxGetElementData ( p2, "isInHighNoon" )) then
		if isPedDead ( p1 ) and isPedDead ( p2 ) then
			endHighNoonForPlayer ( p1, false )
			endHighNoonForPlayer ( p2, false )
		elseif isPedDead ( p1 ) then
			endHighNoonForPlayer ( p1, false )
			if isElement ( p2 ) then
				endHighNoonForPlayer ( p2, true )
				vnxSetElementData ( p2, "highNoonWin", vnxGetElementData ( p2, "highNoonWin" ) + 1 )
				outputChatBox ( "Du hast das Duell gewonnen und erhaelst "..summe.." $!", p2, 200, 200, 0 )
				
				setElementPosition ( p2, -2617.2189941406, 209.10488891602, 4.4970808029175 )
				setElementDimension ( p1, 1 )
				setElementDimension ( p2, 1 )
				setElementHealth ( p2, 100 )
			end
		elseif isPedDead ( p2 ) then
			endHighNoonForPlayer ( p2, false )
			outputChatBox ( "Du hast das Duell verloren! Viel Glueck beim naechsten mal!", p2, 125, 0, 0 )
			if isElement ( p1 ) then
				endHighNoonForPlayer ( p1, true )
				outputChatBox ( "Du hast das Duell gewonnen und erhaelst "..summe.." $!", p1, 200, 200, 0 )
				vnxSetElementData ( p1, "highNoonWin", vnxGetElementData ( p1, "highNoonWin" ) + 1 )
				
				setElementPosition ( p1, -2617.2189941406, 209.10488891602, 4.4970808029175 )
				setElementDimension ( p1, 1 )
				setElementDimension ( p2, 1 )
				setElementHealth ( p1, 100 )
			end
		else
			outputChatBox ( "Unentschieden!", p1, 125, 0, 0 )
			outputChatBox ( "Unentschieden!", p2, 125, 0, 0 )
			endHighNoonForPlayer ( p1, true )
			endHighNoonForPlayer ( p2, true )
			setElementPosition ( p2, -2617.2189941406, 209.10488891602, 4.4970808029175 )
			setElementDimension ( p2, 1 )
			setElementHealth ( p2, 100 )
			setElementPosition ( p1, -2617.2189941406, 209.10488891602, 4.4970808029175 )
			setElementDimension ( p1, 1 )
			setElementHealth ( p1, 100 )
		end
		checkIfItIsOver ( p1, p2 )
	end
end

function checkIfItIsOver ( p1, p2 )

	local runden = vnxGetElementData ( p1, "highNoonRunden" ) - 1
	if runden then
		if runden >= 1 then
			outputChatBox ( "Naechste Runde in 10 Sekunden ( Noch "..runden.." weitere Runden )!", p1, 200, 200, 0 )
			outputChatBox ( "Naechste Runde in 10 Sekunden ( Noch "..runden.." weitere Runden )!", p2, 200, 200, 0 )
			vnxSetElementData ( p1, "highNoonRunden", runden )
			vnxSetElementData ( p2, "highNoonRunden", runden )
			setElementDimension ( p1, 1 )
			setElementDimension ( p2, 1 )
			setTimer ( accepthighnoon_func, 10000, 1, p1 )
		else
			local summe = vnxGetElementData ( p1, "highNoonSumme" )
			setElementDimension ( p1, 0 )
			setElementDimension ( p2, 0 )
			if vnxGetElementData ( p1, "highNoonWin" ) > vnxGetElementData ( p2, "highNoonWin" ) then
				vnxSetElementData ( p1, "money", vnxGetElementData ( p2, "money" ) + (summe*2) )
				outputChatBox ( "Du hast das Duell verloren! Viel Glueck beim naechsten mal!", p2, 125, 0, 0 )
				outputChatBox ( "Du hast das Duell gewonnen und erhaelst "..(summe*2).." $!", p1, 200, 200, 0 )
			elseif vnxGetElementData ( p1, "highNoonWin" ) < vnxGetElementData ( p2, "highNoonWin" ) then
				vnxSetElementData ( p2, "money", vnxGetElementData ( p2, "money" ) + (summe*2) )
				outputChatBox ( "Du hast das Duell verloren! Viel Glueck beim naechsten mal!", p1, 125, 0, 0 )
				outputChatBox ( "Du hast das Duell gewonnen und erhaelst "..(summe*2).." $!", p2, 200, 200, 0 )
			else
				vnxSetElementData ( p2, "money", vnxGetElementData ( p2, "money" ) + summe )
				vnxSetElementData ( p1, "money", vnxGetElementData ( p1, "money" ) + summe )
				outputChatBox ( "Unentschieden!", p1, 200, 200, 0 )
				outputChatBox ( "Unentschieden!", p2, 200, 200, 0 )
			end
		end
	end
end

function endHighNoon ( p1, p2, summe )

	local runden = vnxGetElementData ( p1, "highNoonRunden" )
	if isElement ( p1 )	then
		if not isPedDead ( p1 ) then
			showChat ( p1, true )
		end
	end
	if isElement ( p2 ) then
		if not isPedDead ( p2 ) then
			showChat ( p2, true )
		end
	end
	if isElement ( p1 ) then
		if vnxGetElementData ( p1, "isInHighNoon" ) then
			if isPedDead ( p1 ) then
				endHighNoonForPlayer ( p1, false )
				if isElement ( p2 ) then
					endHighNoonForPlayer ( p2, true )
					vnxSetElementData ( p2, "highNoonWin", vnxGetElementData ( p2, "highNoonWin" ) + 1 )
					setElementPosition ( p2, -2617.2189941406, 209.10488891602, 4.4970808029175 )
					setElementDimension ( p1, 1 )
					setElementDimension ( p2, 1 )
					setElementHealth ( p2, 100 )
					setElementHealth ( p1, 100 )
				end
			else
				vnxSetElementData ( p1, "highNoonWin", vnxGetElementData ( p1, "highNoonWin" ) + 1 )
				endHighNoonForPlayer ( p1, true )
				if isElement ( p2 ) then
					endHighNoonForPlayer ( p2, false )
				end
				setElementPosition ( p1, -2617.2189941406, 209.10488891602, 4.4970808029175 )
				setElementDimension ( p1, 1 )
				setElementDimension ( p2, 1 )
				setElementHealth ( p1, 100 )
			end
		end
	elseif isElement ( p2 ) then
		if vnxGetElementData ( p2, "isInHighNoon" ) then
			vnxSetElementData ( p2, "highNoonWin", vnxGetElementData ( p2, "highNoonWin" ) + 1 )
			endHighNoonForPlayer ( p2, true )
			setElementPosition ( p2, -2617.2189941406, 209.10488891602, 4.4970808029175 )
			setElementDimension ( p2, 1 )
			setElementHealth ( p2, 100 )
			setElementHealth ( p1, 100 )
		end
	end
	local pname = getPlayerName ( p1 )
	if pname then
		if isTimer ( _G[pname.."highnoon"] ) then
			killTimer ( _G[pname.."highnoon"] )
		else
			local pname = getPlayerName ( p2 )
			if isTimer ( _G[pname.."highnoon"] ) then
				killTimer ( _G[pname.."highnoon"] )
			end
		end
	end
	checkIfItIsOver ( p1, p2 )
end
addEvent ( "duellHasEnd", true )
addEventHandler ( "duellHasEnd", getRootElement(), endHighNoon )

function endHighNoonForPlayer ( player, bool )

	triggerClientEvent ( player, "endHighNoon", getRootElement() )
	takeAllWeapons ( player )
	setElementModel ( player, tonumber ( vnxGetElementData ( player, "skinid" ) ) )
	setElementDimension ( player, 0 )
	setPlayerNametagShowing ( player, true )
	if bool then
		vnxSetElementData ( player, "isInHighNoon", false )
	end
end