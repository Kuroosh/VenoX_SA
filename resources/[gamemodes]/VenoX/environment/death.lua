addEvent ( "onPlayerWastedTriggered", true )

thedeathtimer = {}

function playerdeath ( killer, weapon, part )
	local player = client
	if part == 9 then
		setPedHeadless ( client, true )
	end
	vnxSetElementData ( player, "alcoholFlushPoints", 0 )
	vnxSetElementData ( player, "drugFlushPoints", 0 )
	vnxSetElementData ( player, "cigarettFlushPoints", 0 )
	if isKeyBound ( player, "enter_exit", "down", heliCoSeat ) then
		heliCoSeat ( player )
	end
	if vnxGetElementData ( player, "callswith" ) then
		if vnxGetElementData ( player, "callswith" ) ~= "none" then
			local caller = isElement ( vnxGetElementData ( player, "callswith" ) ) and vnxGetElementData ( player, "callswith" ) or getPlayerFromName ( vnxGetElementData ( player, "callswith" ) )
			if caller then
				vnxSetElementData ( caller, "callswith", "none" )
				vnxSetElementData ( caller, "call", false )
				vnxSetElementData ( caller, "calls", "none" )
				vnxSetElementData ( caller, "callswith", "none" )
				vnxSetElementData ( caller, "calledby", "none" )
				outputChatBox ( "*Knack* - Die Leitung ist tod!", caller, 125, 0, 0 )
			else
				vnxSetElementData ( player, "callswith", "none" )
				vnxSetElementData ( player, "call", false )
				vnxSetElementData ( player, "calls", "none" )
				vnxSetElementData ( player, "callswith", "none" )
				vnxSetElementData ( player, "calledby", "none" )
			end
		end
	end
	if vnxGetElementData ( player, "isInDrivingSchool" ) then
		cancelDrivingSchoolPlayer ( player )
	end
	if getPedOccupiedVehicle ( player ) then
		removePedFromVehicle ( player )
	end
	if isElement ( killer ) and killer ~= player and weapon and not isOnStateDuty(killer) then
		outputServerLog ( getPlayerName ( killer ).." hat "..getPlayerName(player).." mit Waffe "..weapon.." erledigt!" )
		if vnxGetElementData ( player, "fraktion" ) == 0 then
			local x1, y1, z1 = getElementPosition ( player )
			local x2, y2, z2 = getElementPosition ( killer )
			local dist = getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 )
			if dist < 7.5 then
				outputChatBox ( "Du hast ein Verbrechen begangen: Mord, gemeldet von: Anonym", killer, 0, 0, 150 )
				if vnxGetElementData ( killer, "wanteds" ) <= 5 then
					vnxSetElementData ( killer, "wanteds", vnxGetElementData ( killer, "wanteds" ) + 1 )
					setPlayerWantedLevel ( killer, vnxGetElementData ( killer, "wanteds" ) )
				end
			elseif dist < 15 then
				if math.random ( 1, 2 ) == 1 then
					outputChatBox ( "Du hast ein Verbrechen begangen: Mord, gemeldet von: Anonym", killer, 0, 0, 150 )
					if vnxGetElementData ( killer, "wanteds" ) <= 5 then
						vnxSetElementData ( killer, "wanteds", vnxGetElementData ( killer, "wanteds" ) + 1 )
						setPlayerWantedLevel ( killer, vnxGetElementData ( killer, "wanteds" ) )
					end
				else
					vnxSetElementData ( killer, "lastcrime", "mord" )
				end
			else
				vnxSetElementData ( killer, "lastcrime", "mord" )
			end
		end
	end
	vnxSetElementData ( player, "isinairportmission", false )
	vnxSetElementData ( player, "isInRace", false )
	unbindKey ( player, "mouse_wheel_up", "down", weaponsup )
	unbindKey ( player, "mouse_wheel_down", "down", weaponsdown )
	unbindKey ( player , "g", "down", rein )
	unbindKey ( player, "enter", "down", eject )
	unbindKey ( player, "rshift", "down", helidriveby )
	unbindKey ( player, "1", "down", tazer_func )
	local timeToBeDeath = 60*1000
	if vnxGetElementData ( player, "playingtime" ) >= 100 then
		timeToBeDeath = timeToBeDeath + 2
	elseif vnxGetElementData ( player, "playingtime" ) >= 50 then
		timeToBeDeath = timeToBeDeath + 1
	end
	if isElement ( killer ) then
		if isHitman ( killer ) then
			local contract = vnxGetElementData ( player, "contract" )
			if contract > 0 then
				timeToBeDeath = timeToBeDeath + 2
				vnxSetElementData ( player, "contract", 0 )
				vnxSetElementData ( killer, "money", tonumber ( vnxGetElementData ( killer, "money" ) ) + contract )
				playSoundFrontEnd ( killer, 40 )
				outputChatBox ( "Du solltest dir Gedanken machen - auf dich waren "..contract.." $ Kopfgeld ausgesetzt!", player, 125, 0, 0 )
				outputChatBox ( "Ziel erledigt. Belohnung: "..contract.." $.", killer, 125, 0, 0 )
			end
		end
	end	
	vnxSetElementData ( player, "heaventime", timeToBeDeath )
	setTimer ( endfade, 5000, 1, player, timeToBeDeath )
	giveAchievement( player, 3 )
	if vnxGetElementData ( source, "isInArea51Mission" ) then
		setPlayerOutOfArea51 ( source )
		outputChatBox ( "Mission gescheitert!", source, 125, 0, 0 )
	end
	if killer and killer ~= player and getElementType ( killer ) == "player" then 
		local kills = tonumber ( vnxGetElementData ( killer, "kills" ) )
		blackListKillCheck ( player, killer, weapon )
		if isOnDuty ( killer ) or isArmy ( killer ) then
			if vnxGetElementData ( player, "wanteds" ) == 0 then
				outputChatBox ( "Du hast einen Zivilisten erledigt!", killer, 125, 0, 0 )
			else
				local strafe = vnxGetElementData ( player, "wanteds" ) * wantedprice
				local wanteds = vnxGetElementData ( player, "wanteds" )
				local time = vnxGetElementData ( player, "wanteds" ) * math.ceil(jailtimeperwanted * 1.2)
				vnxSetElementData ( player, "wanteds", 0 )
				setPlayerWantedLevel ( player, 0 )
				if tonumber(strafe) > vnxGetElementData ( player, "money" ) then		
					vnxSetElementData ( player, "money", 0 )
				else
					vnxSetElementData ( player, "money", tonumber(vnxGetElementData ( player, "money" )) - tonumber(strafe) )
				end
				vnxSetElementData ( player, "jailtime", time )
				vnxSetElementData ( player, "bail", 0 )
				local grammafix  = " ohne Kaution " 
				outputChatBox ( "Du wurdest von Polizist "..getPlayerName(killer).." erledigt und"..grammafix.."für "..strafe.." $ und "..time.." Minuten eingesperrt!", player, 0, 125, 0 )
				vnxSetElementData ( killer, "boni", vnxGetElementData ( killer, "boni" )+(wanteds*wantedkillmoney) )
				vnxSetElementData ( killer, "AnzahlEingeknastet", vnxGetElementData ( killer, "AnzahlEingeknastet" ) + 1 )
				vnxSetElementData ( player, "AnzahlImKnast", vnxGetElementData ( player, "AnzahlImKnast" ) + 1 )
				outputChatBox ( "Du hast "..getPlayerName ( player ).." erledigt und erhälst bei der nächsten Abrechnung "..(wanteds*wantedkillmoney).."$ Bonus!", killer, 0, 125, 0 )
			end
		end
	end
	if isKeyBound ( player, "mouse3", "up", explodeTerror, player ) then
		explodeTerror ( player )
	end
	local curdrogen = vnxGetElementData ( player, "drugs" )
	local amount = getDropAmount ( curdrogen )
	if amount > 0 then
		vnxSetElementData ( player, "drugs", curdrogen - amount )
		local x, y, z = getElementPosition ( player )
		local pickup = createPickup ( 0, 0, 0, 3, 1210, 1 )
		setElementPosition ( pickup, x, y, z )
		vnxSetElementData ( pickup, "amount", amount )
		setElementDimension ( pickup, getElementDimension ( player ) )
		setElementInterior ( pickup, getElementInterior ( player ) )	
		addEventHandler ( "onPickupHit", pickup, drugDropHit )
	end
	local curmats = vnxGetElementData ( player, "mats" )
	amount = getDropAmount ( curmats )
	if amount > 0 then
		vnxSetElementData ( player, "mats", curmats - amount )
		local x, y, z = getElementPosition ( player )
		local pickup = createPickup ( 0, 0, 0, 3, 1210, 1 )
		setElementPosition ( pickup, x + 0.5, y, z )
		vnxSetElementData ( pickup, "amount", amount )
		setElementDimension ( pickup, getElementDimension ( player ) )
		setElementInterior ( pickup, getElementInterior ( player ) )	
		addEventHandler ( "onPickupHit", pickup, matDropHit )
	end
	local money = vnxGetElementData ( player, "money" )
	local loss = 5
	if money and money > 0 then
		local damoney = math.abs(math.floor(money/100*(100-loss)))
		vnxSetElementData ( player, "money", damoney )
		local x, y, z = getElementPosition ( player )
		local pickup = createPickup ( 0, 0, 0, 3, 1212, 1 )
		setElementPosition ( pickup, x, y + 0.5, z )
		vnxSetElementData ( pickup, "money", money - damoney )
		setElementDimension ( pickup, getElementDimension ( player ) )
		setElementInterior ( pickup, getElementInterior ( player ) )			
		addEventHandler ( "onPickupHit", pickup, moneyDropHit )
	end
	setElementDimension ( player, 0 )
	setElementInterior ( player, 0 )
	showChat ( player, true )
	setPlayerHudComponentVisible ( player, "radar", true )
	checkIfMedicRespawn ( player )
	if isElement ( killer ) then
		outputLog ( getPlayerName ( player ).." wurde von ".. getPlayerName ( killer ) .." getötet ( Waffe: "..weapon.." )", "kill" )
		vnxSetElementData ( killer, "Kills", vnxGetElementData ( killer, "Kills" ) + 1 )
		giveAchievement( killer, 4 )
	elseif weapon then
		outputLog ( getPlayerName ( player ).." ist gestorben. Grund: "..weapon, "death" )
	else
		outputLog ( getPlayerName ( player ).." ist gestorben.", "death" )
	end
	vnxSetElementData ( player, "Tode", vnxGetElementData ( player, "Tode" ) + 1 )
end
addEventHandler ( "onPlayerWastedTriggered", root, playerdeath )

function endfade ( player, timeToBeDeath )

	if isElement ( player ) then
		removePedFromVehicle ( player )
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu wurdest erledigt\nund wirst nun im\nKrankenhaus wieder\nzusammen geflickt!", 7500, 125, 0, 0 )
		
		local x1, y1, z1 = getElementPosition ( player )
		local x2, y2, z2 = 1605.4418945313, 1868.0090332031, 27.071100234985
		local x3, y3, z3 = -2537.9006347656, 618.84533691406, 33.35578918457
		local distToSF = getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 )
		local distToLV = getDistanceBetweenPoints3D ( x1, y1, z1, x3, y3, z3 )
		if distToSF > distToLV then
			setCameraMatrix ( player, -2537.9006347656, 618.84533691406, 33.35578918457, -2616.6801757813, 619.22979736328, 39.688884735107 )
		else
			setCameraMatrix ( player, 1605.4418945313, 1868.0090332031, 27.071100234985, 1606.3515625, 1819.0625, 22.315660476685 )
		end
		
		setPlayerHudComponentVisible ( player, "radar", false )
		triggerClientEvent ( player, "showProgressBar", player )
		showChat ( player, true )
		
		refreshDeathTimeForPlayer ( player, 0, timeToBeDeath )
	end
end

function refreshDeathTimeForPlayer ( player, timeDone, holeTime )

	if isElement ( player ) then
		if timeDone / holeTime >= 1 then
			revive ( player )
			triggerClientEvent ( player, "updateDeathBar", player, 100 )
			return nil
		end
		triggerClientEvent ( player, "updateDeathBar", player, timeDone / holeTime * 100 )
		thedeathtimer[player] = setTimer ( refreshDeathTimeForPlayer, 2500, 1, player, timeDone + 2500, holeTime )
	end
end

function revive ( player )

	if isElement ( player ) then
		toggleAllControls ( player, true )
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist wieder\nfit! Pass beim\nnächsten mal\nbesser auf!", 7500, 0, 125, 0 )
		vnxSetElementData ( player, "heaventime", 0 )
		
		if vnxGetElementData ( player, "money" ) and vnxGetElementData ( player, "money" ) >= hospitalcosts then
			vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - hospitalcosts )
		else
			vnxSetElementData ( player, "money", 0 )
		end
		playSoundFrontEnd ( player, 17 )
		RemoteSpawnPlayer ( player )
		showChat ( player, true )
	end
end

function headFixOnSpawn ()

	setPedHeadless ( source, false )
end
addEventHandler ( "onPlayerSpawn", getRootElement(), headFixOnSpawn )