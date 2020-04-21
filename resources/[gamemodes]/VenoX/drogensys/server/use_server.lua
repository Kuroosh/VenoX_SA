cigarChokeTime = 3000
local smokingPlayers = {}

function removeAddicts_func ()

	local player = client
	local total = getTotalAddictLevel ( player )
	local totalCost = getTotalAddictLevel ( player ) * addictRemoveCost
	local money = vnxGetElementData ( player, "money" )
	if money >= totalCost then
		takePlayerSaveMoney ( player, totalCost )
		
		vnxSetElementData ( player, "cigarettAddictPoints", 0 )
		vnxSetElementData ( player, "alcoholAddictPoints", 0 )
		vnxSetElementData ( player, "drugAddictPoints", 0 )
		
		vnxSetElementData ( player, "cigarettFlushPoints", 0 )
		vnxSetElementData ( player, "alcoholFlushPoints", 0 )
		vnxSetElementData ( player, "drugFlushPoints", 0 )
		
		triggerClientEvent ( player, "showAddictInfo", player, true )
	else
		infobox ( player, "\n\n\nDu hast nicht\ngenug Geld!", 7500, 125, 0, 0 )
	end
end
addEvent ( "removeAddicts", true )
addEventHandler ( "removeAddicts", getRootElement(), removeAddicts_func )

function takeDrugs ( player )

	local curPoints = vnxGetElementData ( player, "drugAddictPoints" )
	local curFlush = vnxGetElementData ( player, "drugFlushPoints" )
	meCMD_func ( player, "cmd", "raucht Grass." )
	
	vnxSetElementData ( player, "drugAddictPoints", curPoints + 1 )
	vnxSetElementData ( player, "drugFlushPoints", curFlush + 5 )
	
	setElementHealth ( player, 100 )
	if getElementHunger(player) then
		setElementHunger ( player, getElementHunger(player) + 25 )
	end
	outputLog ( getPlayerName(player).." hat Drogen genommen", "Heilung" )
	
	toggleAllControls ( player, false, true, true )
	
	setPedAnimation ( player, "crack", "crckdeth2", 1, true, true, false )
	setTimer ( setPedAnimation, 5000, 1, player )
	triggerClientEvent ( player, "showAddictInfo", player, true )
	setTimer ( toggleAllControls, 5000, 1, player, true, true, true )
	triggerClientEvent ( player, "startDrugEffect", player, getDrugStrength ( player ), "stone" )
end
addCommandHandler ( "takeweed", takeDrugs )

function takeKoks ( player )

	local koks = vnxGetElementData ( player, "koks" )
	if koks >= 1 then
		vnxSetElementData ( player, "lastcrime", "drogen" )
		vnxSetElementData ( player, "koks", koks - 1 )
		vnxSetElementData ( player, "aufEntzug", false )
		local curPoints = vnxGetElementData ( player, "koksAddictPoints" ) or 0
		local curFlush = vnxGetElementData ( player, "koksFlushPoints" ) or 0
		meCMD_func ( player, "cmd", "zieht Koks!" )
		outputLog ( "[KOKAIN]: "..getPlayerName ( player ).." hat Koks gezogen!", "use" )
		outputChatBox ( "Um trotzdem fahren zu können, musst du die M Taste im Auto drücken, dann erscheint der Mauszeiger.", player, 200, 0, 0 )
		local level = tonumber(curFlush) + 1
		
		vnxSetElementData ( player, "koksAddictPoints", tonumber (curPoints) + 1 )
		vnxSetElementData ( player, "koksFlushPoints", level )
		local drug = koks
		setPedAnimation ( player, "eat", "M_smkstnd_loop", 5000, true, false, false)
		--triggerClientEvent ( player, "eatSomething", getRootElement(), 5 )
		triggerClientEvent ( player, "startKokainEffect", player, level, drug )
		triggerClientEvent ( player, "showAddictInfo", player, true )
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Kokain dabei\n( mind. 1 g)!", 7500, 200, 0, 0 )
	end
end
addCommandHandler ( "takekokain", takeKoks )


function checkForSymptoms ( player )

	local smokeFlush = vnxGetElementData ( player, "cigarettFlushPoints" )
	local drinkFlush = vnxGetElementData ( player, "alcoholFlushPoints" )
	local drugFlush = vnxGetElementData ( player, "drugFlushPoints" )
	
	local smokeAddict = vnxGetElementData ( player, "cigarettAddictPoints" )
	local drinkAddict = vnxGetElementData ( player, "alcoholAddictPoints" )
	local drugAddict = vnxGetElementData ( player, "drugAddictPoints" )
	
	if math.floor ( smokeAddict/addictLevelDivisors[1] ) < smokeFlush then
		infobox ( player, "Du hast zu lange\nnicht geraucht und\nhast Entzugs-\nerscheinungen.\nBesorg dir ein\npaar Zigaretten!", 7500, 125, 0, 0 )
		detoxSympton ( player )
	elseif math.floor ( drinkAddict/addictLevelDivisors[2] ) < drinkFlush then
		infobox ( player, "Du hast zu lange\nnicht getrunken und\nhast Entzugs-\nerscheinungen.\nBesorg dir einen\nDrink!", 7500, 125, 0, 0 )
		detoxSympton ( player )
	elseif math.floor ( drugAddict/addictLevelDivisors[3] ) < drugFlush then
		infobox ( player, "Du hast zu lange\nnichts genommen und\nhast Entzugs-\nerscheinungen.\nBesorg dir etwas\nStoff!", 7500, 125, 0, 0 )
		detoxSympton ( player )
	end
end

function detoxSympton ( player )

	if getPedOccupiedVehicle ( player ) then
		toggleControl ( player, "accelerate", false )
		setControlState ( player, "accelerate", true )
		setTimer ( toggleControl, 5000, 1, player, "accelerate", true )
		setTimer ( setControlState, 5000, 1, player, "accelerate", false )
	else
		crackAnimation_func ( player )
	end
end

function lowerFlush ( player )

	local smokeFlush = vnxGetElementData ( player, "cigarettFlushPoints" )
	local drinkFlush = vnxGetElementData ( player, "alcoholFlushPoints" )
	local drugFlush = vnxGetElementData ( player, "drugFlushPoints" )
	
	local change = false
	
	if smokeFlush and smokeFlush > 0 then
		change = true
		vnxSetElementData ( player, "cigarettFlushPoints", smokeFlush - 1 )
	end
	if drinkFlush and drinkFlush > 0 then
		change = true
		vnxSetElementData ( player, "alcoholFlushPoints", drinkFlush - 1 )
	end
	if drugFlush and drugFlush > 0 then
		change = true
		vnxSetElementData ( player, "drugFlushPoints", drugFlush - 1 )
	end
	
	if change then
		triggerClientEvent ( player, "showAddictInfo", player, true )
	end
end

function lowerAddict ( player )

	local smokeAddict = vnxGetElementData ( player, "cigarettAddictPoints" )
	local drinkAddict = vnxGetElementData ( player, "alcoholAddictPoints" )
	local drugAddict = vnxGetElementData ( player, "drugAddictPoints" )
	
	local change = false
	
	if smokeAddict > 0 then
		vnxSetElementData ( player, "cigarettAddictPoints", smokeAddict - 1 )
		if math.floor ( smokeAddict / addictLevelDivisors[1] ) > math.floor ( vnxGetElementData ( player, "cigarettAddictPoints" ) / addictLevelDivisors[1] ) then
			change = true
		end
	end
	if drinkAddict > 0 then
		vnxSetElementData ( player, "alcoholAddictPoints", drinkAddict - 1 )
		if math.floor ( drinkAddict / addictLevelDivisors[2] ) > math.floor ( vnxGetElementData ( player, "alcoholAddictPoints" ) / addictLevelDivisors[2] ) then
			change = true
		end
	end
	if drugAddict > 0 then
		vnxSetElementData ( player, "drugAddictPoints", drugAddict - 1 )
		if math.floor ( drugAddict / addictLevelDivisors[3] ) > math.floor ( vnxGetElementData ( player, "drugAddictPoints" ) / addictLevelDivisors[3] ) then
			change = true
		end
	end
	
	if change then
		triggerClientEvent ( player, "showAddictInfo", player, true )
	end
end

function smokeCigarett ( player )

	if not smokingPlayers[player] then
		smokingPlayers[player ]= true
		
		local curPoints = vnxGetElementData ( player, "cigarettAddictPoints" )
		local curFlush = vnxGetElementData ( player, "cigarettFlushPoints" )
		meCMD_func ( player, "cmd", "raucht eine Zigarette." )
		
		vnxSetElementData ( player, "cigarettAddictPoints", curPoints + 1 )
		vnxSetElementData ( player, "cigarettFlushPoints", curFlush + 1 )
		
		if not isPedInVehicle ( player ) then
			setPedAnimation ( player, "smoking", "M_smkstnd_loop", 1, true, true, false )
			setTimer ( setPedAnimation, 2000, 1, player )
		end
		
		addPlayerHealth ( player, 10 )
		setElementHunger ( player, getElementHunger(player)+20 )
		outputLog ( getPlayerName(player).." hat Zigarette geraucht", "Heilung" )
		
		local drinkFlush = vnxGetElementData ( player, "alcoholFlushPoints" )
		local drugFlush = vnxGetElementData ( player, "drugFlushPoints" )
		
		if drinkFlush > 0 then
			vnxSetElementData ( player, "alcoholFlushPoints", drinkFlush - 1 )
		end
		if drugFlush > 0 then
			vnxSetElementData ( player, "drugFlushPoints", drugFlush - 1 )
		end
		
		triggerClientEvent ( player, "showAddictInfo", player, true )
		
		--toggleAllControls ( player, false, true, true )
		
		if vnxGetElementData ( player, "cigarettFlushPoints" ) >= 2 * vnxGetElementData ( player, "cigarettAddictPoints" )  / addictLevelDivisors[1] + 1 then
			setTimer ( setPedChoking, 2750, 1, player, true )
			setTimer ( setPedChoking, 2750 + cigarChokeTime, 1, player, false )
			
			totalSmokeTime = 2750 + cigarChokeTime
			
			infobox ( player, "Offenbar hast du\nzu viele Zigaretten\nin kurzer Zeit\ngeraucht - gewöhne\ndeine Lungen an\nZigaretten!", 7500, 125, 0, 0 )
		else
			totalSmokeTime = 2000
		end
		
		setTimer ( 
			function ( player )
				smokingPlayers[player] = false
			end,
		totalSmokeTime, 1, player )
	end
end

function drinkAlcohol ( player, sort )

	local points = alcoholSorts[sort]
	local curPoints = vnxGetElementData ( player, "alcoholAddictPoints" )
	local curFlush = vnxGetElementData ( player, "alcoholFlushPoints" )
	meCMD_func ( player, "cmd", "trinkt ein"..alcoholGramma[sort].."." )
	
	vnxSetElementData ( player, "alcoholAddictPoints", curPoints + points )
	vnxSetElementData ( player, "alcoholFlushPoints", curFlush + points * 3 )
	
	addPlayerHealth ( player, 10 * points )
	setElementHunger ( player, getElementHunger(player) + 20 * points )
	outputLog ( getPlayerName(player).." hat Alkohol getrunken", "Heilung" )
	
	if hasDrunkToMuch ( player ) then
		setTimer ( killPed, 5000, 1, player )
		setPedAnimation ( player, "food", "EAT_Vomit_P", 5000, true, true, false )
		
		infobox ( player, "\n\nDu hast zu viel\ngetrunken und dir\neine Alkoholvergiftung\nzugezogen.", 7500, 125, 0, 0 )
	else
		setTimer ( setPedAnimation, 5000, 1, player )
		setPedAnimation ( player, "VENDING", "VEND_Drink2_P", 5000, true, true, false )
		
		triggerClientEvent ( player, "showAddictInfo", player, true )
		triggerClientEvent ( player, "startDrugEffect", player, getAlcoholStrength ( player ), "drunk" )
	end
end

function getAlcoholStrength ( player )

	local curFlush = vnxGetElementData ( player, "alcoholAddictPoints" )
	curFlush = curFlush / 5 + 1
	local curAddict = vnxGetElementData ( player, "alcoholFlushPoints" )
	curAddict = curAddict / addictLevelDivisors[2] + 1
	
	local strength = ( curFlush * curAddict ) / 500 * 1.1
	if strength > 1 then
		strength = 1
	elseif strength < 0.1 then
		strength = 0.1
	end
	
	return strength
end

function getDrugStrength ( player )

	local curFlush = vnxGetElementData ( player, "alcoholAddictPoints" )
	curFlush = curFlush / 5 + 1
	local curAddict = vnxGetElementData ( player, "alcoholFlushPoints" )
	curAddict = curAddict / addictLevelDivisors[3] + 1
	
	local strength = ( curFlush * curAddict ) / 10 ^ ( curAddict ) + 0.1
	if strength > 1 then
		strength = 1
	elseif strength < 0.1 then
		strength = 0.1
	end
	
	return strength
end
--[[
Old
function hasDrunkToMuch ( player )

	local curAddict = vnxGetElementData ( player, "alcoholFlushPoints" ) / addictLevelDivisors[2] + 1
	local curFlush = vnxGetElementData ( player, "alcoholAddictPoints" )
	if curFlush > curAddict * 0.75 then
		return true
	end
	return false
end
]]
function hasDrunkToMuch ( player )

	local curAddict = vnxGetElementData ( player, "alcoholFlushPoints" ) / addictLevelDivisors[2] + 1
	local curFlush = vnxGetElementData ( player, "alcoholAddictPoints" )
	if math.floor ( curFlush / 10 - curAddict ) >= 1 then
		return true
	end
	return false
end


function restoreWeather()
	local ww,bb = getWeather()
	triggerClientEvent(client, "restoreWeather", client, ww )
end

addEvent("restoreWeather", true)
addEventHandler("restoreWeather", getRootElement(), restoreWeather)