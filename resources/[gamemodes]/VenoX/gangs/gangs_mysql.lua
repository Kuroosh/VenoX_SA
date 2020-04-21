addEvent ( "onVioPlayerLogin", true )

gangData = {}
	gangData["ranks"] = {}

function loadGangData ( gangID )
	local gangDataDSatz
	local house = houses["pickup"][gangID]
	local gangDataResult = dbPoll ( dbQuery ( handler, "SELECT LeaderMSG from gang_basic WHERE HausID = '"..gangID.."'" ), -1 )
	if gangDataResult then
		if gangDataResult[1] then	
			gangData[gangID] = {
				["members"] = { ["online"] = {} },
				["msg"] = gangDataResult[1]["LeaderMSG"]
			}
			refreshGangRanks ( gangID )
			vnxSetElementData ( house, "gangHQOf", getGangName ( gangID ) )
			return nil
		end
	end
	vnxSetElementData ( house, "gangHQOf", false )
end


function getMembersInGangCount ( id )
	local result = dbPoll ( dbQuery ( handler, "SELECT Gang FROM gang_members WHERE Gang = '"..id.."'" ), -1 )
	return result and #result or 0
end


function getGangMembersString ( id )
	local strings = ";"
	local result = dbPoll ( dbQuery ( handler, "SELECT UID, Rang FROM gang_members WHERE Gang = '"..id.."'" ), -1 )
	local amount = 0
	if result then
		amount = #result
		for i=1, amount do
			strings = strings..playerUIDName[tonumber(result[i]["UID"])].."|"..result[i]["Rang"]..";"
		end
	end
	return strings, amount
end


function refreshGangRanks ( gangID )
	local result = dbPoll ( dbQuery ( handler, "SELECT Rang1, Rang2, Rang3 from gang_basic WHERE HausID = '"..gangID.."'" ), -1 )
	if result then
		if result[1] then
			local rang1 = result[1]["Rang1"]
			local rang2 = result[1]["Rang2"]
			local rang3 = result[1]["Rang3"]
			
			gangData[gangID]["ranks"] = {}
			
			gangData[gangID]["ranks"][1] = rang1
			gangData[gangID]["ranks"][2] = rang2
			gangData[gangID]["ranks"][3] = rang3
		end
	end
end

	
function setGangMSG ( id, msg )
	dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "gang_basic", "LeaderMSG", msg, "HausID", id )
	gangData[id]["msg"] = msg
end

function getGangMSG ( id )

	return gangData[id]["msg"]
end

function isFounderOfGang ( player, gangFounderID )

	if not isElement ( player ) then
		if getPlayerFromName ( player ) then
			player = getPlayerFromName ( player )
		end
	end
	if isElement ( player ) then
		if gangFounderID then
			if getPlayerGangRank ( player ) >= 3 and gangFounderID == vnxGetElementData ( player, "housekey" ) then
				return true
			end
		elseif getPlayerGangRank ( player ) >= 3 and getPlayerGang ( player ) == vnxGetElementData ( player, "housekey" ) then
			return true
		end
	else
		local result = dbPoll ( dbQuery ( handler, "SELECT Founder FROM gang_members WHERE UID = ? AND Gang = ? AND Founder = ?", playerUID[player], gangFounderID, "1" ), -1 )
		if result and result[1] then
			return true
		else
			return false
		end
	end
	gangFounderID = nil
	return false
end

function playerLoginGangMembers ( player )

	local pname = getPlayerName ( player )
	local result = dbPoll ( dbQuery ( handler, "SELECT Rang, Gang FROM gang_members WHERE UID = ?", playerUID[pname] ), -1 )
	if result and result[1] then
		gangData["ranks"][player] = tonumber ( result[1]["Rang"] )
		gangData[tonumber(result[1]["Gang"])]["members"]["online"][player] = true
	end
end

function isGang ( id )

	if gangData[id] then
		return true
	else
		return false
	end
end

function playerDisconnectGangMembers ( player )
	if gangData["ranks"][player] then
		local gang = getPlayerGang ( getPlayerName ( player ) )
		if gang then
			if gang > 0 then
				gangData[gang]["members"]["online"][player] = nil
			end
		end
		gangData["ranks"][player] = nil
	end
end

function getGangMSG ( id )

	return gangData[id]["msg"]
end

function getGangMaxMembers ( id )
	local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "MaxMembers", "gang_basic", "HausID", id ), -1 )
	if result and result[1] then
		return tonumber ( result[1]["MaxMembers"] )
	end
	return false
end

function getGangMoney ( id )
	local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Kasse", "houses", "ID", id ), -1 )
	if result and result[1] then
		return tonumber ( result[1]["Kasse"] )
	end
	return false
end

function setGangMoney ( id, amount )
	dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "houses", "Kasse", amount, "ID", id )
end

function gangVehicleCost ( id )

	return 0
end

function getGangMats ( id )
	local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Mats", "gang_basic", "HausID", id ), -1 )
	if result and result[1] then
		return tonumber ( result[1]["Mats"] )
	end
	return false
end

function setGangMats ( id, amount )
	dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "gang_basic", "Mats", amount, "HausID", id )
end

function getGangDrugs ( id )
	local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Drugs", "gang_basic", "HausID", id ), -1 )
	if result and result[1] then
		return tonumber ( result[1]["Drugs"] )
	end
	return false
end

function setGangDrugs ( id, amount )
	dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "gang_basic", "Drugs", amount, "HausID", id )
end


function getGangVehicleCost ( id )

	return 999
end


function getGangName ( id )
	local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Name", "gang_basic", "HausID", id ), -1 )
	if result and result[1] then
		return result[1]["Name"]
	end
	return false
end

function removePlayerFromGang ( pname )

	if isElement ( pname ) then
		pname = getPlayerName ( pname )
	end
	if getPlayerFromName ( pname ) then
		gangData[getPlayerGang ( pname )]["members"]["online"][getPlayerFromName ( pname )] = false
		gangData["ranks"][getPlayerFromName ( pname )] = 0
	end
	dbExec ( handler, "DELETE FROM ?? WHERE ??=?", "gang_members", "UID", playerUID[pname] )
end

function getPlayerGang ( pname )

	local pname = isElement ( pname ) and getPlayerName ( pname ) or pname
	local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Gang", "gang_members", "UID", playerUID[pname] ), -1 )
	if result and result[1] then
		return tonumber ( result[1]["Gang"] )
	end
	return false
end

function isInGang ( pname, id )
	pname = isElement ( pname ) and getPlayerName ( pname ) or pname
	if not id then
		local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "UID", "gang_members", "UID", playerUID[pname] ), -1 )
		if result and result[1] then
			return true
		else
			return false
		end
	else
		local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=? AND ??=?", "UID", "gang_members", "UID", playerUID[pname], "Gang", id ), -1 )
		if result and result[1] then
			return true
		else
			return false
		end
	end
end

function getPlayerGangRank ( player )

	if isElement ( player ) then
		return gangData["ranks"][player]
	elseif type ( player ) == "string" then
		local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Rang", "gang_members", "UID", playerUID[player] ), -1 )
		if result and result[1] then
			return tonumber ( result[1]["Rang"] )
		end
	end
	return false
end

function setPlayerGangRank ( pname, newRank )

	if isElement ( pname ) then
		pname = getPlayerName ( pname )
	end
	dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "gang_members", "Rang", newRank, "UID", playerUID[pname] )
	local player = getPlayerFromName ( pname )
	if player then
		gangData["ranks"][player] = newRank
		infobox ( "Dir wurde Rang\n"..newRank.." zugewiesen.", player, 125, 0, 0 )
	end
	return true
end


function getGangRankName ( id, rank )

	return gangData[id]["ranks"][rank]
end

function setGangRankName ( id, rank, strings )

	gangData[id]["ranks"][rank] = strings
	dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "gang_basic", "Rang"..rank, strings, "HausID", id )
	refreshGangRanks ( id )
end

function insertInGang ( pname, id, rank, founder )

	if not rank then
		rank = 1
	end
	if isElement ( pname ) then
		pname = getPlayerName ( pname )
	end
	if getPlayerFromName ( pname ) then
		gangData[id]["members"]["online"][getPlayerFromName ( pname )] = true
	end
	dbExec ( handler, "INSERT INTO ?? ( ??, ??, ?? ) VALUES (?,?,?)", "gang_members", "UID", "Gang", "Rang", playerUID[pname], id, rank )
	if founder then
		dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "gang_members", "Founder", "1", "UID", playerUID[pname] )
	end
end

function getPlayerRankNameInGang ( player )

	local gang = getPlayerGang ( player )
	return gangData[gang]["ranks"][getPlayerRankInGang ( player )]
	
end

function getPlayerRankInGang ( pname )
	local pname = isElement ( pname ) and getPlayerName ( pname ) or pname 
	local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Rang", "gang_members", "UID", playerUID[pname] ), -1 )
	if result and result[1] then
		return tonumber ( result[1]["Rang"] )
	end
	return false
end

function sendMessageToGangMembers ( id, msg )

	for key, index in pairs ( gangData[id]["members"]["online"] ) do
		if isElement ( key ) then
			outputChatBox ( msg, key, 200, 200, 0 )
		end
	end
end

function createNewGang ( name, leaderSkin, houseID )

	dbExec ( handler, "INSERT INTO ?? ( ??, ??, ?? ) VALUES (?,?,?)", "gang_basic", "Name", "LeaderMSG", "HausID", name, "Gang wurde gegründet.", houseID )
	loadGangData ( houseID )
end

function getGangFromName ( name )
	local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ?? LIKE ?", "HausID", "gang_basic", "Name", name ), -1 )
	if result and result[1] then
		return tonumber ( result[1]["HausID"] )
	end
	return false
end

function setGangName ( id, name )
	dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "gang_basic", "Name", name, "HausID", id )
	vnxSetElementData ( _G["HouseNR"..id], "gangHQOf", name )
end

function deleteGang ( id )

	sendMessageToGangMembers ( id, "Deine Gang wurde aufgeloest." )
	dbExec ( handler, "DELETE FROM ?? WHERE ??=?", "gang_basic", "HausID", id )
	dbExec ( handler, "DELETE FROM ?? WHERE ??=?", "gang_members", "Gang", id )
	dbExec ( handler, "DELETE FROM ?? WHERE ??=?", "gang_vehicles", "GangID", id )
	for key, index in pairs ( gangData[id]["members"]["online"] ) do
		if isElement ( key ) then
			gangData["ranks"][key] = nil
		end
	end
	gangData[id] = nil
	vnxSetElementData ( _G["HouseNR"..id], "gangHQOf", false )
end