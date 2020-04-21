addEvent ( "ElementClickedServer", true )
addEvent ( "HungerChangeServer", true )
addEvent ( "changeClientElementData", true )

elementData = {}
local syncedData = { 

-------SCHEINE & LIZENSEN-------

["segellicense"] = true, 
["motorbootlicense"] = true,
["planelicenseb"] = true, 
["planelicensea"] = true, 
["helilicense"] = true, 
["bikelicense"] = true, 
["lkwlicense"] = true, 
["carlicense"] = true, 
["gunlicense"] = true, 
["fishinglicense"] = true,
["perso"] = true, 

-------SCHEINE & LIZENSEN-------

--------------------------------

-----------ACHIEVMENTS----------

["kingofthehill_achiev"] = true, 
["rl_achiev"] = true, 
["nichtsgehtmehr_achiev"] = true, 
["chickendinner_achiev"] = true, 
["highscore_achiev"] = true, 
["revolverheld_achiev"] = true,
["highwaytohell_achiev"] = true, 
["silentassasin_achiev"] = true, 
["thetruthisoutthere_achiev"] = true, 
["collectr_achiev"] = true, 
["angler_achiev"] = true, 
["licenses_achiev"] = true,
["own_foots"] = true, 
["viewpoints"] = true, 
["schlaflosinsa"] = true,
["foundpackages"] = true,

-----------ACHIEVMENTS----------

--------------------------------

-----------BONUSPOINTS----------

["bonuspoints"] = true, 
["carslotupgrade"] = true,
["carslotupgrade2"] = true,
["carslotupgrade3"] = true, 
["carslotupgrade4"] = true, 
["carslotupgrade5"] = true, 
["maxcars"] = true, 
["lungenvol"] = true, 
["muscle"] = true, 
["stamina"] = true, 
["kungfu"] = true,
["boxen"] = true, 
["streetfighting"] = true, 
["pistolskill"] = true, 
["deagleskill"] = true, 
["assaultskill"] = true, 
["shotgunskill"] = true, 
["mp5skill"] = true, 
["Verbesserte SMG"] = true, 
["vortex"] = true, 
["skimmer"] = true,
["golfcart"] = true, 
["romero"] = true, 
["quad"] = true, 
["bonusskin1"] = true, 
["fruitNotebook"] = true, 
["gameboy"] = true, 
["chess"] = true, 
["fglass"] = true,

-----------BONUSPOINTS----------

--------------------------------

-------------JOB----------------

["imzugjob"] = true,
["imtramjob"] = true, 
["job"] = true, 
["farmerLVL"] = true, 
["truckerlvl"] = true, 
["jobDimension"] = true, 
["bauarbeiterLVL"] = true, 
["jobtime"] = true, 
["isInFarmJob"] = true, 
["fishingFishATyp"] = true, 
["fishingFishBTyp"] = true, 
["fishingFishCTyp"] = true, 
["fishingFishAWeight"] = true, 
["fishingFishBWeight"] = true,
["fishingFishCWeight"] = true,
["airportlvl"] = true,  
["fishingPole"] = true, 
["fishingHooks"] = true, 
["fishingWorms"] = true, 
["fishingSkill"] = true, 
["gambleSkill"] = true, 
["boxlvl"] = true, 

-------------JOB----------------

--------------------------------

---------PLAYER & DRUGS---------

--Sucht--
["drugAddictPoints"] = true, 
["alcoholAddictPoints"] = true, 
["cigarettAddictPoints"] = true, 
["drugFlushPoints"] = true,
["cigarettFlushPoints"] = true, 
--Sucht--
["drivingSchoolPractise"] = true, 
["favchannel"] = true, 
["curclicked"] = true, 
["clickedVehicle"] = true, 
--Biz & House --

["object"] = true, 
["isafk"] = true, 
["anim"] = true, 
["club"] = true, 

["streetCleanPoints"] = true, 
["shaderWater"] = true, 
["shaderBloom"] = true,
["shaderCarpain"] = true, 
["shaderRoadshine"] = true,  

["bizkey"] = true,
["housekey"] = true, 

--INT VALUES--

["hud"] = true,
["armyperm10"] = true,
["bankmoney"] = true, 
["skinid"] = true, 
["playerid"] = true, 
["timePlayedToday"] = true, 
["curplayingtime"] = true,
["yachtImBesitz"] = true,
["curcars"] = true, 
["easterEggs"] = true, 
["spawnpos_y"] = true, 
--Army INT VALUE + RANG --   
["rang"] = true,
["armyperm7"] = true, 
["armyperm8"] = true, 
["armyperm9"] = true, 
--Army INT VALUE + RANG --   

["warns"] = true, 
["isInArea51Mission"] = true, 
["coins"] = true, 
--INT VALUES--

---------PLAYER & DRUGS---------

--------------------------------

-------ITEMS TO PLACE & USE-----

["food1"] = true,
["food2"] = true, 
["food3"] = true, 
["casinoChips"] = true, 
["drugs"] = true,
["koks"] = true,  
["mats"] = true, 
["medikits"] = true, 
["repairkits"] = true, 
["presents"] = true, 
["newspaper"] = true,
["benzinkannister"] = true, 
["flowerseeds"] = true, 
["dice"] = true, 
["zigaretten"] = true, 
["totalHorseShoes"] = true, 
["gunboxa"] = true, 
["gunboxb"] = true, 
["gunboxc"] = true, 
["gunloads"] = true, 

--------------------------------

---------GANGWAR SCRIPT---------

--------------------------------

["GangwarKills"] = true, 
["GangwarTode"] = true, 
["AnzahlGangwarsGewonnen"] = true, 
["AnzahlGangwarsVerloren"] = true,  

--------------------------------

---------GANGWAR SCRIPT---------

--------------------------------
}

local notSyncedData = { 
["adminEnterVehicle"] = true, 
["clickPed"] = true, 
["PremiumData"] = true,
["sprint"] = true, 
["gotdamoney"] = true, 
["alcoholFlushPoints"] = true, 
["callswith"] = true, 
["call"] = true,
["calls"] = true, 
["calledby"] = true, 
["isinairportmission"] = true, 
["contract"] = true, 
["heaventime"] = true, 
["boni"] = true, 
["amount"] = true, 
["tazered"] = true, 
["timerrunning"] = true,
["engine"] = true, 
["spawnpos_x"] = true, 
["spawnpos_y"] = true, 
["spawnpos_z"] = true, 
["spawnrot_x"] = true, 
["spawnrot_y"] = true, 
["spawnrot_z"] = true, 
["rcVehicle"] = true, 
["carToBuyFrom"] = true,
["carToBuySlot"] = true, 
["carToBuyPrice"] = true, 
["carToBuyModel"] = true, 
["spawnposx"] = true, 
["spawnposy"] = true, 
["spawnposz"] = true, 
["spawnrotx"] = true, 
["spawnroty"] = true, 
["spawnrotz"] = true, 
["packages"] = true, 
["ID"] = true, 
["isInCarHouse"] = true, 
["lookingAtCar"] = true, 
["carHouse"] = true, 
["drivingSchoolCur"] = true, 
["drivingSchoolMarker"] = true, 
["drivingSchoolBlip"] = true, 
["drivingSchoolVeh"] = true,
["drivingSchoolPed"] = true, 
["drivingSchoolCur"] = true, 
["drivingSchoolPractise"] = true, 
["magpos"] = true, 
["magnetic"] = true, 
["hasmagnetactivated"] = true, 
["magneticVeh"] = true, 
["fireAble"] = true, 
["katjuschaID"] = true,
["attachedToPacker"] = true, 
["gateID"] = true, 
["fuelSaving"] = true, 
["gps"] = true, 
["wheelrefreshable"] = true, 
["smokeable"] = true, 
["sx"] = true, 
["sy"] = true, 
["sz"] = true, 
["sr"] = true, 
["tuningSx"] = true,
["tuningSy"] = true, 
["tuningSz"] = true, 
["tuningSr"] = true, 
["blackJackStarted"] = true, 
["curBlackJackBet"] = true, 
["airstrike"] = true, 
["objectDelete"] = true, 
["ticketOffered"] = true, 
["callswithpolice"] = true,
["callswithmedic"] = true, 
["needhelpmedic"] = true, 
["callswithmechaniker"] = true, 
["needhelpmechaniker"] = true, 
["bail"] = true, 
["nodmzone"] = true, 
["intdim"] = true, 
["curpizza"] = true, 
["expTimer"] = true, 
["objectToPlace"] = true, 
["formationCount"] = true, 
["formationID"] = true,
["curIntIn"] = true, 
["wanzen"] = true, 
["needMech"] = true, 
["newsNotPostable"] = true, 
["isLive"] = true, 
["isLiveWith"] = true, 
["ticketprice"] = true, 
["tied"] = true,
["tester"] = true, 
["hasBomb"] = true, 
["tazer"] = true, 
["spawndim"] = true, 
["spawnint"] = true, 
["armingBomb"] = true, 
["secRaceID"] = true, 
["rentedacar"] = true, 
["carrenter"] = true, 
["rentcar"] = true,
["gangCreateTry"] = true, 
["lasthp"] = true, 
["lastcrime"] = true, 
["time"] = true, 
["weed"] = true, 
["growing"] = true, 
["RCVanSeat"] = true, 
["RCVan"] = true, 
["player"] = true, 
["pickupID"] = true, 
["arrester"] = true,
["AnzahlEingeknastet"] = true, 
["AnzahlGangwars"] = true, 
["Kills"] = true, 
["Tode"] = true, 
["HaeuserGekauft"] = true, 
["FahrzeugeGekauft"] = true, 
["FahrzeugeVerkauft"] = true, 
["DamageGemacht"] = true, 
["DamageBekommen"] = true,
["FraktionenBetreten"] = true, 
["FraktionenVerlassen"] = true, 
["Eingeloggt"] = true, 
["MontagSpielzeit"] = true, 
["DienstagSpielzeit"] = true, 
["MittwochSpielzeit"] = true, 
["DonnerstagSpielzeit"] = true, 
["FreitagSpielzeit"] = true, 
["SamstagSpielzeit"] = true, 
["SonntagSpielzeit"] = true, 
["LetzteWocheSpielzeit"] = true, 
["AnzahlImKnast"] = true, 
["GangwarDamageGemacht"] = true,
["GangwarDamageBekommen"] = true, 
["muted"] = true, 
["fishingSkillOld"] = true, 
["house"] = true, 
["housex"] = true, 
["housey"] = true, 
["housez"] = true, 
["handyCosts"] = true,
["handyType"] = true, 
["pdayincome"] = true, 
["botname"] = true, 
["rot"] = true, 
["int"] = true, 
["dim"] = true, 
["kasse"] = true, 
["curint"] = true, 
["SchleusenNummer"] = true,
["hud"] = true, 
["ownerfraktion"] = true, 
["price"] = true, 
["item"] = true, 
["pos"] = true, 
["typ"] = true, 
["uid"] = true
}

for i=1, 25 do
	notSyncedData["carslot"..i] = true
	notSyncedData["package"..i] = true
	if i~=7 and i~=8 and i~=9 then
		notSyncedData["armyperm"..i] = true
	end
end

--[[
function vnxSetElementData ( player, dataString, value )
	if player and dataString and value ~= nil then	
		if not elementData[player] then
			elementData[player] = {}
		end
		elementData[player][dataString] = value
		if dataString == "money" then
			local value = math.floor ( value )
			triggerClientEvent ( player, "syncMoney", player, value )
			setPlayerMoney ( player, value, true )
			elementData[player][dataString] = value
		elseif dataString == "hitglocke" then
			triggerClientEvent ( player, "changeHitglocke", player, value == 1 )
		elseif syncedData[dataString] then
			triggerClientEvent ( player, "triggerClientElementData", player, dataString, value )
		elseif not notSyncedData[dataString] and isElement ( player ) then
			setElementData ( player, dataString, value )
		end
	else
		return nil
	end
end

function vnxGetElementData ( player, dataString )
	if player and dataString then
		if not elementData[player] then
			elementData[player] = {}
		end
		if elementData[player][dataString] then
			return elementData[player][dataString]
		elseif not elementData[player][dataString] and dataString ~= "adminlvl" and dataString ~= "loggedin" and not notSyncedData[dataString] then
			elementData[player][dataString] = getElementData ( player, dataString )
			return elementData[player][dataString]
		else
			return nil
		end
	else
		return nil
	end
end

function freeElementData ()

	if elementData then
		if getElementType ( source ) ~= "player" then
			if elementData[source] then
				elementData[source] = nil
			end
		end
	end
end
addEventHandler ( "onElementDestroy", getRootElement(), freeElementData )
]]
elementData = {}

function vnxSetElementData(e, k, v)
	if not e and not isElement(e) and not k and not v then
		return false
	end

	-- Create element data entry
	if not elementData[e] then
		elementData[e] = {}
	end

	-- Set element key's value
	elementData[e][k] = v

	-- VIO:
	if k == "money" then
		local money = math.floor(v)
		triggerClientEvent(e, "syncMoney", e, money)
		setPlayerMoney(e, money, true)
	elseif k == "hitglocke" then
		triggerClientEvent(e, "changeHitglocke", e, v == 1)
	elseif syncedData[k] then
		triggerClientEvent(e, "triggerClientElementData", e, k, v)
	end

	-- Default!
	setElementData(e, k, v)
end


local pla = 0
function vnxGetElementData(e, k)
	if e and k then
		if not elementData[e] then
			elementData[e] = {}
		end

		if elementData[e][k] then
			return elementData[e][k]
		elseif not elementData[e][k] and k ~= "adminlvl" and k ~= "loggedin" and not notSyncedData[k] then
			elementData[e][k] = getElementData ( e, k )
			return elementData[e][k]
		else
			return nil
		end
	else
		return nil
	end

end












-- GC
addEventHandler("onElementDestroy", root, 
	function()
		-- Free BRIAN
		if elementData[source] then
			elementData[source] = nil
		end
	end
)


addEventHandler("changeClientElementData", root, 
	function (dataString, value)
		elementData[client][dataString] = value
	end
)

function findPlayerByName( playerPart )
	
	--if playerPart == nil then
	
	--	return false
		
	--elseif getPlayerFromName( playerPart ) and isElement(getPlayerFromName( playerPart )) then
	local pl = getPlayerFromName ( playerPart )
	
	if isElement(pl) then
	
		return pl
		
	else
	
		local players = getElementsByType("player")
		for i=1, #players do 
		
            if (string.find(string.gsub ( string.lower(getPlayerName(players[i])), '#%x%x%x%x%x%x', '' ),string.lower(playerPart))) then
			
                return v
				
            end
			
        end
		
	end
	
 end
 

function setElementClicked ( player, value )
	local player = player
	local value = value
	local triggered = false
	if not isElement ( player ) then
		value = player
		player = client 
		triggered = true
	end
	elementData[player]["ElementClicked"] = value
	if not triggered then
		triggerClientEvent ( player, "ElementClicked", player, value )
	end
end
addEventHandler ( "ElementClickedServer", root, setElementClicked )


function getElementClicked ( player )
	return elementData[player] and elementData[player]["ElementClicked"] or false
end

function setElementHunger ( player, value )
	local player = player
	local value = value
	local triggered = false
	if not isElement ( player ) then
		value = player
		player = client 
		triggered = true
	end
	if value > 100 then
		value = 100
	end
	if elementData[player] then
		elementData[player]["Hunger"] = value
	end
	if not triggered then
		triggerClientEvent ( player, "HungerChange", player, value )
	end
end
addEventHandler ( "HungerChangeServer", root, setElementHunger )


function getElementHunger ( player )
	return elementData[player]["Hunger"]		
end


addEvent ( "socialStateNewChange", true )
addEventHandler ( "socialStateNewChange", root, function ( text )
	vnxSetElementData ( client, "socialState", text )
end )
	