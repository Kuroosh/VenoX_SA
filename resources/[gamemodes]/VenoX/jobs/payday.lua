local loehne_payday = {}

for i = 1, 15, 1 do
	loehne_payday[i] = {}
end
---------StaatsFraki----------------	
loehne_payday[1][0] = 300
loehne_payday[1][1] = 450
loehne_payday[1][2] = 600
loehne_payday[1][3] = 750
loehne_payday[1][4] = 900
loehne_payday[1][5] = 1050
------------------------------------
loehne_payday[6][0] = 350
loehne_payday[6][1] = 550
loehne_payday[6][2] = 750
loehne_payday[6][3] = 950
loehne_payday[6][4] = 1150
loehne_payday[6][5] = 1350
------------------------------------
loehne_payday[8][0] = 200
loehne_payday[8][1] = 600
loehne_payday[8][2] = 850
loehne_payday[8][3] = 1100
loehne_payday[8][4] = 1350
loehne_payday[8][5] = 15000
-----------Closed-------------------------------------------------------
loehne_payday[4][0] = 600
loehne_payday[4][1] = 1000
loehne_payday[4][2] = 1400
loehne_payday[4][3] = 1800
loehne_payday[4][4] = 2200
loehne_payday[4][5] = 2600
---------------Neutrale Fraki--------------------------------------------
loehne_payday[5][0] = 200
loehne_payday[5][1] = 600
loehne_payday[5][2] = 750
loehne_payday[5][3] = 950
loehne_payday[5][4] = 1350
loehne_payday[5][5] = 1500
------------------------------------------------------------------------
loehne_payday[10][0] = 200
loehne_payday[10][1] = 600
loehne_payday[10][2] = 750
loehne_payday[10][3] = 950
loehne_payday[10][4] = 1350
loehne_payday[10][5] = 1500
------------------------------------------------------------------------
loehne_payday[11][0] = 200
loehne_payday[11][1] = 600
loehne_payday[11][2] = 750
loehne_payday[11][3] = 950
loehne_payday[11][4] = 1350
loehne_payday[11][5] = 1500
---------------Böse Fraki--------------------------------------------
loehne_payday[2][0] = 200
loehne_payday[2][1] = 400
loehne_payday[2][2] = 500
loehne_payday[2][3] = 700
loehne_payday[2][4] = 900
loehne_payday[2][5] = 1000
------------------------------------------------------------------------
loehne_payday[3][0] = 200
loehne_payday[3][1] = 400
loehne_payday[3][2] = 500
loehne_payday[3][3] = 700
loehne_payday[3][4] = 900
loehne_payday[3][5] = 1000

loehne_payday[7][0] = 200
loehne_payday[7][1] = 400
loehne_payday[7][2] = 500
loehne_payday[7][3] = 700
loehne_payday[7][4] = 900
loehne_payday[7][5] = 1000

loehne_payday[9][0] = 200
loehne_payday[9][1] = 400
loehne_payday[9][2] = 500
loehne_payday[9][3] = 700
loehne_payday[9][4] = 900
loehne_payday[9][5] = 1000

loehne_payday[12][0] = 200
loehne_payday[12][1] = 400
loehne_payday[12][2] = 500
loehne_payday[12][3] = 700
loehne_payday[12][4] = 900
loehne_payday[12][5] = 1000

loehne_payday[13][0] = 200
loehne_payday[13][1] = 400
loehne_payday[13][2] = 500
loehne_payday[13][3] = 700
loehne_payday[13][4] = 900
loehne_payday[13][5] = 1000

loehne_payday[13][0] = 200
loehne_payday[13][1] = 400
loehne_payday[13][2] = 500
loehne_payday[13][3] = 700
loehne_payday[13][4] = 900
loehne_payday[13][5] = 1000

loehne_payday[14][0] = 200
loehne_payday[14][1] = 400
loehne_payday[14][2] = 500
loehne_payday[14][3] = 700
loehne_payday[14][4] = 900
loehne_payday[14][5] = 1000
------------------------------------
loehne_payday[15][0] = 200
loehne_payday[15][1] = 300
loehne_payday[15][2] = 400
loehne_payday[15][3] = 500
loehne_payday[15][4] = 850
loehne_payday[15][5] = 1000
------------------------------------


function payday ( player )

	if math.floor ( vnxGetElementData ( player, "playingtime" ) / 60 ) == ( vnxGetElementData ( player, "playingtime" ) / 60 ) then
		local paket = vnxGetElementData ( player, "Paket" )
		local player_payday = {}
		
		local faction = getPlayerFaction ( player )
		local rank = getPlayerRank ( player )
		player_payday["Boni"] = tonumber(vnxGetElementData( player, "boni" )) 
		
		if isEvil ( player ) then
		
			player_payday["Zuschuesse"] = loehne_payday[faction][rank]
			
		else
		
			player_payday["Zuschuesse"] = 2000			
		end
		
		if isStateFaction ( player ) then
		
			local incoming = tonumber(vnxGetElementData( player, "pdayincome" ))
			local multiplikator
			
			if incoming > 50 then
				multiplikator = 1
			elseif incoming > 40 then
				multiplikator = 5/6
			elseif incoming > 30 then
				multiplikator = 4/6
			elseif incoming > 20 then
				multiplikator = 3/6
			elseif incoming > 10 then
				multiplikator = 2/6
			else
				multiplikator = 1/6
			end
			
			local var = math.floor(loehne_payday[faction][rank] * multiplikator)
		
			player_payday["Lohn"] = var
			
		elseif faction >= 1 then
		
			player_payday["Lohn"] = loehne_payday[faction][rank]
			
		else
		
			player_payday["Lohn"] = 0
		
		end
		
		local grund 
		local costs
		
		if vnxGetElementData ( player, "handyType" ) == 1 then
			grund = 10
			costs = tonumber(vnxGetElementData( player, "handyCosts" ))
		elseif vnxGetElementData ( player, "handyType" ) == 2 then
			grund = 0
			costs = 0
		else
			grund = 50
			costs = 0
		end
		
		player_payday["Handykosten"] = grund + costs
		
		local club = vnxGetElementData ( player, "club" )
		
		if club == "gartenverein" then
			player_payday["Clubkosten"] = 800
			outputChatBox ( "Um deine Clubmitgliedschaft zu kündigen, tippe /leaveclub", player, 125, 0, 0 )
		elseif club == "biker" then
			player_payday["Clubkosten"] = 500
			bizArray["MistysBar"]["kasse"] = bizArray["MistysBar"]["kasse"] + 50
			outputChatBox ( "Um deine Clubmitgliedschaft zu kündigen, tippe /leaveclub", player, 125, 0, 0 )
		elseif club == "rc" then
			player_payday["Clubkosten"] = 500
			outputChatBox ( "Um deine Clubmitgliedschaft zu kündigen, tippe /leaveclub", player, 125, 0, 0 )
		else
			player_payday["Clubkosten"] = 0
		end
		local var_zinsen = vnxGetElementData( player, "bankmoney" ) * 0.003
		local Zinsen = math.floor(var_zinsen)
		
		if Zinsen > 1500 then
			player_payday["Zinsen"] = 2000
		else
			player_payday["Zinsen"] = Zinsen
		end
		
		player_payday["Fahrzeugsteuer"] = math.floor( vnxGetElementData(player, "curcars") * 75 )
		
		rent = 0
		
		if vnxGetElementData ( player, "housekey" ) < 0 then
			local ID = math.abs(vnxGetElementData ( player, "housekey" ))
			local haus = houses["pickup"][ID]
			rent = vnxGetElementData ( haus, "miete" )
			local Kasse = tonumber ( dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Kasse", "houses", "ID", ID ), -1 )[1]["Kasse"] )
			dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ID = ?", "houses", "Kasse", Kasse + rent, ID )
		end
		
		player_payday["Miete"] = rent
		
		if vnxGetElementData ( player, "socialState" ) == "Rentner" then
			player_payday["Zuschuesse"] = player_payday["Zuschuesse"] + 2500
		end
		
		local amount = factionGangAreas[faction] or 0
						
		if vnxGetElementData ( player, "stvo_punkte" ) >= 1 then
			vnxSetElementData ( player, "stvo_punkte", vnxGetElementData ( player, "stvo_punkte" ) - 1 )
			outputChatBox ( "Dir wurde soeben 1 STVO Punkt erlassen!", player, 125, 0, 0 )
		end
		
		if math.floor ( tonumber ( vnxGetElementData ( player, "playingtime" ) ) / 60 ) == ( tonumber ( vnxGetElementData ( player, "playingtime" ) ) / 60 ) and tonumber ( vnxGetElementData ( player, "wanteds" ) ) >= 1 then
			vnxSetElementData ( player, "wanteds", vnxGetElementData ( player, "wanteds" ) - 1 )
			setPlayerWantedLevel ( player, vnxGetElementData ( player, "wanteds" ) )
			outputChatBox ( "Dir wurde soeben 1 Wantedpunkt erlassen!", player, 125, 0, 0 )
		end
						
		outputChatBox ( "=== #0096FFZahltag #FFFFFF===", player, 255, 255, 255 , true)
		--outputChatBox ( "Einkommen:", player, 255, 255, 255 )
		outputChatBox ( "#0096FFJob: #FFFFFF"..player_payday["Lohn"].." $; #0096FFboni: #FFFFFF"..player_payday["Boni"].."$; #0096FFZuschüsse: #FFFFFF"..player_payday["Zuschuesse"].." $;", player, 0, 255, 0 , true)
		--outputChatBox ( "#0096C8JobKosten: #FFFFFF", player, 255, 0, 0 , true)
		outputChatBox ( "#0096FFHandykosten: #FFFFFF"..player_payday["Handykosten"].."$;", player, 255, 0, 0 , true)
		outputChatBox ( "#0096FFClub: #FFFFFF"..player_payday["Clubkosten"].." $; #0096FFFahrzeugsteuer: #FFFFFF"..player_payday["Fahrzeugsteuer"].." $; #0096FFMiete: #FFFFFF"..player_payday["Miete"].." $;", player, 255, 0, 0 , true)
		outputChatBox ( "#0096FFZinsen: #FFFFFF"..player_payday["Zinsen"].." $", player, 0, 225, 0 , true)
		--outputChatBox ( "#0096FFAusserdem erhaelst du : #FFFFFF50 EXP", player, 0, 225, 0 , true)
		--g_EXP:givePlayerEXP(player, 50)
		
		if amount > 0 then
			player_payday["Gangarea"] = amount * 150
			outputChatBox ( "#0096FFEinnahmen durch Ganggebiete: #FFFFFF"..player_payday["Gangarea"].." $", player, 255, 0, 0 , true)
		else
			player_payday["Gangarea"] = 0
		end
		
		player_payday["Gesamt"] = player_payday["Lohn"] + player_payday["Boni"] + player_payday["Zuschuesse"] - player_payday["Handykosten"] - player_payday["Clubkosten"] - player_payday["Fahrzeugsteuer"] - player_payday["Miete"] + player_payday["Zinsen"] + player_payday["Gangarea"]
		
		local exp = 150
		local vipMoney = math.floor((player_payday["Gesamt"]/200)*vipPayDayExtra[paket])
		--outputChatBox ( "Einnahmen: "..player_payday["Gesamt"].."$ ", player, 0, 150, 200 )
		outputChatBox ( "VIP Geld: "..vipMoney.."$ ", player, 0, 200, 0 )
		outputChatBox ( "#0096FFEXP: #FFFFFF"..exp.." P", player, 0, 150, 200,true )
		player_payday["Gesamt"] = player_payday["Gesamt"] + vipMoney
		outputChatBox ( "#FFFFFF_______________", player, 0, 150, 200 , true)
		outputChatBox ( "#0096FFEinnahmen: #FFFFFF"..player_payday["Gesamt"].." $ ", player, 0, 200, 0 , true)
		outputChatBox ( "#0096FFDie Einnahmen wurden auf dein Konto überwiesen!", player, 0, 150, 200 , true)
		
		if isHalloween then
			local eggs = vnxGetElementData ( player, "easterEggs" )
			vnxSetElementData ( player, "easterEggs", eggs + 1 )
			outputChatBox ( "Außerdem hast du einen Kürbis bekommen. Loese ihn mit /halloween ein!", player, 0, 125, 0 )
		end
		
		triggerClientEvent ( player, "createNewStatementEntry", player, "Abrechnung\n", player_payday["Gesamt"], "\n" )

		vnxSetElementData ( player, "pdayincome", 0 )
		vnxSetElementData ( player, "boni", 0 )

		triggerClientEvent ( player, "achievsound", player )

		vnxSetElementData ( player, "bankmoney", vnxGetElementData ( player, "bankmoney" ) + player_payday["Gesamt"] )
		datasave_remote ( player )
		givePlayerXP(player, 150)
	end
	
end

-- PING KICK PINGKICK PING --
--[[function pingCheck ( player )

	if not isElement(player) then
		return
	end

	local ping = getPlayerPing ( player )
	
	if ping >= 400 then
		local x, y, z = getElementPosition ( player )
		triggerEvent ( "logoutPlayer", player, player, x, y, z, getElementInterior ( player ), getElementDimension ( player ), player )
	end
	
	setTimer ( pingCheck, 5000, 1, player )

end]]


function playingtime ( player )

	if isElement ( player ) then
	
		if vnxGetElementData ( player, "loggedin" ) == 1 then
		
			setPlayerWantedLevel ( player, tonumber( vnxGetElementData ( player, "wanteds" ) ))
			local pname = getPlayerName ( player )
			vnxSetElementData ( player, "lastcrime", "none" )
			
			if not vnxGetElementData ( player, "isafk" ) then
				vnxSetElementData ( player, "curplayingtime", vnxGetElementData ( player, "curplayingtime" ) + 1 )						-- Achiev: Schlaflos in SA, 12 Stunden am St??zocken, 30 Punkte
				
				if math.random ( 1, 10 ) == 1 then
					checkForSymptoms ( player )
				end
					
				if math.floor ( vnxGetElementData ( player, "curplayingtime" ) / 3 ) == vnxGetElementData ( player, "curplayingtime" ) / 3 then
					lowerFlush ( player )
				elseif math.floor ( vnxGetElementData ( player, "curplayingtime" ) / 20 ) == vnxGetElementData ( player, "curplayingtime" ) / 20 then
					lowerAddict ( player )
				end
					
				vnxSetElementData ( player, "playingtime", vnxGetElementData ( player, "playingtime" ) + 1 )								-- Spielzeit
			
				local jailed = tonumber( vnxGetElementData ( player, "jailtime" ) )
				
				if jailed > 1 then
				
					vnxSetElementData ( player, "jailtime", jailed - 1 )
					
				elseif jailed == 1 then
				
					freePlayerFromJail ( player )
						
				end
				
				local prisonjailed = tonumber( vnxGetElementData ( player, "prison" ) )
				
				if prisonjailed > 1 then
				
					vnxSetElementData ( player, "prison", prisonjailed - 1 )
					
				elseif prisonjailed == 1 then
				
					freePlayerFromJail ( player )
						
				end 
					
				if tonumber ( vnxGetElementData ( player, "jobtime" ) ) ~= 0 then
					vnxSetElementData ( player, "jobtime", tonumber ( vnxGetElementData ( player, "jobtime" ) ) - 1 )
				end
			
			
				if isOnDuty ( player ) or isArmy ( player ) then	
				
					if isFBI(player) then
						bonus = 1.2
					else
						bonus = 1
					end
					
					local income = tonumber(vnxGetElementData( player, "pdayincome" ))
					vnxSetElementData ( player, "pdayincome", income+1 )

				end
			
				payday ( player )
				dbExec ( handler, "UPDATE ?? SET ??=?, ??=? WHERE ??=?", "userdata", "Bankgeld", vnxGetElementData ( player, "bankmoney"), "Geld", vnxGetElementData ( player, "money" ), "UID", playerUID[pname] )
				
				-- PING PINGCHECK CHECK --
				--[[if getPlayerPing ( player ) >= 350 then
					setTimer ( pingCheck, 7500, 1, player )
				end]]

				--vnxSetElementData ( player, "timePlayedToday", vnxGetElementData ( player, "timePlayedToday" ) + 1 )
				
				--[[if vnxGetElementData ( player, "timePlayedToday" ) >= 720 and vnxGetElementData ( player, "schlaflosinsa" ) ~= "done" then						-- Achiev: Schlaflos in SA, 12 Stunden am St??zocken, 30 Punkte
					triggerClientEvent ( player, "showAchievmentBox", player, "Schlaflos in RR", 50, 10000 )													-- Achiev: Schlaflos in SA, 12 Stunden am St??zocken, 30 Punkte
					vnxSetElementData ( player, "bonuspoints", vnxGetElementData ( player, "bonuspoints" ) + 500 )												-- Achiev: Schlaflos in SA, 12 Stunden am St??zocken, 30 Punkte
					vnxSetElementData ( player, "schlaflosinsa", "done" )																						-- Achiev: Schlaflos in SA, 12 Stunden am St??zocken, 30 Punkte
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "achievments", "SchlaflosInRR", "done", "UID", playerUID[getPlayerName ( player )] )										-- Achiev: Schlaflos in SA, 12 Stunden am St??zocken, 30 Punkte
				end	]]
			end
			
			--_G[pname.."paydaytime"] = setTimer ( playingtime, 50000, 1, player )
				
		end
			
	end
	
end