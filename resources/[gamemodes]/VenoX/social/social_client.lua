availableSocialStates = {}
reachableSocialStates = {}
socialStateGroups = {}
-- Anfaengerraenge --
socialStateGroups[1] = { [1]=true, [2]=true, [3]=true, [4]=true, [5]=true }
-- Fraktionsraenge --
socialStateGroups[2] = { [6]=true, [7]=true, [14]=true }
-- Job Raenge --
socialStateGroups[3] = { [8]=true }
-- Achievment Raenge --
socialStateGroups[4] = { [9]=true, [19]=true, [23]=true, [24]=true, [27]=true }
-- Geld Raenge --
socialStateGroups[5] = { [11]=true, [12]=true, [13]=true }
-- Besitz Raenge --
socialStateGroups[6] = { [10]=true, [15]=true, [16]=true, [17]=true, [18]=true }
-- Sucht Raenge --
socialStateGroups[7] = { [20]=true, [21]=true, [22]=true }
-- Hobby Raenge --
socialStateGroups[8] = { [25]=true, [26]=true }

socialStates = {
 [1]="Flüchtling",
 [2]="Illegaler Immigrant",
 [3]="Immigrant",
 [4]="Bürger",
 [5]="Arbeiter",
 [6]="Neuling",
 [7]="Aufsteiger",
 [8]="Dealer",
 [9]="Waffenschieber",
 [10]="Hausbesitzer",
 [11]="Finanzhai",
 [12]="Millionär",
 [13]="Multimillionär",
 [14]="Fädenzieher",
 [15]="Geschäftsmann",
 [16]="Wirtschaftsboss",
 [17]="Reich & Schön",
 [18]="God of NoVa",
 [19]="Rentner",
 [20]="Kettenraucher",
 [21]="Saufbruder",
 [22]="Junkie",
 [23]="Glücksschmied",
 [24]="Hasadeur",
 [25]="Blumenkind",
 [26]="Ferngesteuert",
 [27]="Silent Assasin"
}

socialStateCount = 0
for key, index in pairs ( socialStates ) do
	socialStateCount = socialStateCount + 1
end

function stringToSocID ( id )

	for key, index in pairs ( socialStates ) do
		if index == id then
			return key
		end
	end
end

function getPlayerSocialAvailableStates ()

	local spielzeit = getElementData ( lp, "playingtime" )
	local totalMoney = mymoney + vnxClientGetElementData ( "bankmoney" )
	availableSocialStates = nil
	availableSocialStates = {}
	reachableSocialStates = nil
	reachableSocialStates = {}
	for i = 1, socialStateCount do
		reachableSocialStates[i] = false
		availableSocialStates[i] = false
	end
	
	-- **Gruppe 1 - Anfaengerraenge ** --
		if spielzeit <= 180 and vnxClientGetElementData ( "perso" ) ~= 1 then
			-- Flüchtling
			availableSocialStates[1] = true
			reachableSocialStates[2] = true
		elseif spielzeit >= 300 and vnxClientGetElementData ( "curcars" ) >= 1 and vnxClientGetElementData ( "job" ) ~= "none" then
			-- Arbeiter
			availableSocialStates[5] = true
			reachableSocialStates[6] = true
			reachableSocialStates[8] = true
			reachableSocialStates[10] = true
			reachableSocialStates[11] = true
			reachableSocialStates[15] = true
		elseif spielzeit >= 180 and vnxClientGetElementData ( "perso" ) == 1 then 
			-- Buerger
			availableSocialStates[4] = true
			reachableSocialStates[5] = true
		elseif spielzeit >= 45 and vnxClientGetElementData ( "perso" ) == 1 then
			-- Immigrant
			availableSocialStates[3] = true
			reachableSocialStates[4] = true
		else
			-- Illegaler Immigrant
			availableSocialStates[2] = true
			reachableSocialStates[3] = true
		end
	-- **Gruppe 2 - Fraktionsbasiert** --
		if getElementData ( lp, "fraktion" ) >= 1 then
			if vnxClientGetElementData ( "rang" ) >= 4 and spielzeit >= 15000 then
				-- Faedenzieher --
				availableSocialStates[14] = true
			elseif vnxClientGetElementData ( "rang" ) >= 2 and spielzeit >= 4500 then
				-- Aufsteiger --
				availableSocialStates[7] = true
				reachableSocialStates[14] = true
			elseif spielzeit >= 1200 then
				-- Neuling --
				availableSocialStates[6] = true
				reachableSocialStates[7] = true
			else
				reachableSocialStates[6] = true
			end
		end
	-- **Gruppe 3 - Jobbasiert** --
		if vnxClientGetElementData ( "job" ) == "dealer" then
			-- Dealer --
			availableSocialStates[8] = true
		end
	-- **Gruppe 4 - Achievmentbasiert** --
		if vnxClientGetElementData ( "gunloads" ) == "done" then
			availableSocialStates[9] = true
		end
		if vnxClientGetElementData ( "job" ) == "none" then
			if getElementData ( lp, "fraktion" ) == 0 then
				if getElementData ( lp, "playingtime" ) >= 45000 then
					availableSocialStates[19] = true
				end
			end
		else
			reachableSocialStates[19] = true
		end
	-- **Gruppe 5 - Geldbasiert** --
		if totalMoney >= 3000000 then
			availableSocialStates[13] = true
		elseif totalMoney >= 1000000 then
			availableSocialStates[12] = true
			reachableSocialStates[13] = true
		elseif totalMoney >= 500000 then
			availableSocialStates[11] = true
			reachableSocialStates[12] = true
		else
			reachableSocialStates[11] = true
		end
	-- **Gruppe 6 - Besitzbasiert** --
		if spielzeit >= 30000 and vnxClientGetElementData ( "housekey" ) > 0 and vnxClientGetElementData ( "collectr_achiev" ) == "done" and vnxClientGetElementData ( "yachtImBesitz" ) then
			availableSocialStates[18] = true
		elseif spielzeit >= 30000 and vnxClientGetElementData ( "housekey" ) > 0 and vnxClientGetElementData ( "yachtImBesitz" ) then
			availableSocialStates[17] = true
			reachableSocialStates[18] = true
		elseif spielzeit >= 30000 and totalMoney >= 500000 and vnxClientGetElementData ( "bizkey" ) >= 1 then
			availableSocialStates[16] = true
			reachableSocialStates[17] = true
		elseif vnxClientGetElementData ( "bizkey" ) >= 1 then
			availableSocialStates[15] = true
			reachableSocialStates[16] = true
		elseif vnxClientGetElementData ( "housekey" ) > 0 then
			availableSocialStates[10] = true
			reachableSocialStates[15] = true
		else
			reachableSocialStates[10] = true
		end
	-- **Gruppe 7 - Suchtbasiert** --
		if vnxClientGetElementData ( "drugAddictPoints" ) and vnxClientGetElementData ( "alcoholAddictPoints" ) and vnxClientGetElementData ( "cigarettAddictPoints" ) then
			if math.floor ( vnxClientGetElementData ( "cigarettAddictPoints" ) / addictLevelDivisors[1] ) >= 3 then
				availableSocialStates[20] = true
			elseif math.floor ( vnxClientGetElementData ( "alcoholAddictPoints" ) / addictLevelDivisors[2] ) >= 3 then
				availableSocialStates[21] = true
			elseif math.floor ( vnxClientGetElementData ( "drugAddictPoints" ) / addictLevelDivisors[3] ) >= 3 then
				availableSocialStates[22] = true
			end
		end
	-- **Gruppe 8 - Hobbybasiert** --
		if vnxClientGetElementData ( "club" ) == "rc" then
			availableSocialStates[26] = true
		elseif vnxClientGetElementData ( "club" ) == "gartenverein" then
			availableSocialStates[25] = true
		end
	return nil
end

function getNextBestState ()

	for key, state in pairs ( availableSocialStates ) do
		if availableSocialStates[key] then
			return socialStates[key]
		end
	end
end

function checkForSocialStateChanges ()

	if getElementData ( lp, "loggedin" ) == 1 then
		local oldAvailableSocialStates = table.copy ( availableSocialStates )
		local debug = getPlayerSocialAvailableStates ()
		for key, state in pairs ( availableSocialStates ) do
			if not oldAvailableSocialStates[key] and availableSocialStates[key] then
				outputChatBox ( "Du hast einen neuen sozialen Status freigeschaltet: "..socialStates[key].."!", 0, 125, 0 )
				outputChatBox ( "Vergiss nicht, ihn im Optionsmenue zu aktivieren!", 0, 125, 0 )
			end
		end
		for key, state in pairs ( oldAvailableSocialStates ) do
			if not availableSocialStates[key] and oldAvailableSocialStates[key] then
				if socialNeeds[getElementData ( lp, "socialState" )] then
					if not availableSocialStates[stringToSocID(getElementData ( lp, "socialState" ))] then
						local newState = getNextBestState ()
						setElementData ( lp, "socialState", newState, true )
						outputChatBox ( "Du hast deinen sozialen Status verloren - dein Status wurde auf "..newState.." gesetzt!", 125, 0, 0 )
					else
						outputChatBox ( "Du hast einen sozialen Status verloren: "..socialStates[key].."!", 125, 0, 0 )
					end
				end
			end
		end
	end
end