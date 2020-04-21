local gMysqlHost = "127.0.0.1"
local gMysqlUser = "venox_reallife"
local gMysqlPass = "Qc5ly0&8"
local gMysqlDatabase = "admin_vnx"
handler = nil
playerUID = {}
playerUIDName = {}
achievementID = {}
achievementName = {}
achievementDescription = {}
achievementGainXP = {}
achievementGainMoney = {}
achievementPic = {}


function MySQL_Startup ( ) 
	handler = dbConnect ( "mysql", "dbname=".. gMysqlDatabase .. ";host="..gMysqlHost..";port=3306", gMysqlUser, gMysqlPass )
	savesqlu = gMysqlUser
	if not handler then
		outputDebugString("[MySQL_Startup] Couldn't run query: Unable to connect to the MySQL server!")
		outputDebugString("[MySQL_Startup] Please shutdown the server and start the MySQL server!")
		return
	end	
	local result = dbPoll ( dbQuery ( handler, "SELECT UID, Name FROM ??", "players" ), -1 )
	for i=1, #result do
		local id = tonumber ( result[i]["UID"] )
		local name = result[i]["Name"]
		playerUID[name] = id
		playerUIDName[id] = name
	end
	savesglu = gMysqlPass
	playerUIDName[0] = "none"
	playerUID["none"] = 0
end
MySQL_Startup()

function MySQL_SetString(tablename, feldname, var, bedingung)
	if not handler then return false end
	if var and bedingung then
		local result = mysql_query(handler, "UPDATE "..tablename.." SET "..feldname.." = '"..var.."' WHERE "..bedingung)
		if( not result) then
			outputDebugString("Error executing the query: (" .. mysql_errno(handler) .. ") " .. mysql_error(handler))
		else
			mysql_free_result(result)
			return false
		end
	end
end

function saveEverythingForScriptStop ( )
	saveDepotInDB()
	updateBizKasse()
end
addEventHandler ( "onResourceStop", resourceRoot, saveEverythingForScriptStop )

function dbExist(tablename, objekt)
	local result = dbQuery(handler,"SELECT * FROM "..tablename.." WHERE "..objekt)
	rows, numrows, err= dbPoll(result, -1)
		if rows[1] then
			return true
		else
			return false
		end
end

function loadAchievements ( )
	local result = dbPoll ( dbQuery ( handler, "SELECT ??,??,??,??,??,?? FROM ??", "ID", "Name", "Description", "image", "GainXP", "GainMoney", "achievementlist" ), -1 )
	for i=1, #result do
		local id = tonumber ( result[i]["ID"] )
		local name = result[i]["Name"]
		local desc = result[i]["Description"]
		local pic = tostring ( result[i]["image"] )
		local xp = tonumber ( result[i]["GainXP"] )
		local money = tonumber ( result[i]["GainMoney"] )
		achievementID[id] = id
		achievementName[id] = name
		achievementDescription[id] = desc
		achievementGainXP[id] = xp
		achievementGainMoney[id] = money
		if pic then
			achievementPic[id] = pic
		else
			achievementPic[id] = "error.png"
		end
		outputDebugString("["..id.."] Achievement `"..name.."` loadet.")
	end
end
if handler then

	setTimer ( loadAchievements, 500, 1 )
end

function MySQL_SetVar(tablename, feldname, var, bedingung)
	if not handler then return false end
	if var then
		local result = mysql_query(handler, "UPDATE "..tablename.." SET "..feldname.." = "..var.." WHERE "..bedingung)
		if( not result) then
			 outputDebugString("Error executing the query: (" .. mysql_errno(handler) .. ") " .. mysql_error(handler))
		else
			mysql_free_result(result)
			return false
		end
	end
end


function MySQL_GetVar(tablename, feldname, bedingung)
	if not handler then return false end
	local result = mysql_query(handler, "SELECT "..feldname.." from "..tablename.." WHERE "..bedingung)
	if( not result) then
		outputDebugString("Error executing the query: (" .. mysql_errno(handler) .. ") " .. mysql_error(handler))
	else
		if(mysql_num_rows(result) > 0) then
			local dsatz = mysql_fetch_assoc(result)
			local savename = feldname
			mysql_free_result(result)
			return tonumber(dsatz[feldname])
		else
			mysql_free_result(result)
			return false
		end
	end
end