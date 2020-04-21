liarsDice = {}
 liarsDice["pX"] = { [1]=1205.71, [2]=1204.60, [3]=1203.34 }
 liarsDice["pX"] = { [1]=18.33, [2]=16.28, [3]=18.44 }
 liarsDice["pZ"] = { [1]=1203.34, [2]=18.44, [3]=1000.57 }
 liarsDice["tables"] = {}
  liarsDice["tables"]["players"] = {}
  liarsDice["tables"]["dices"] = {}
  liarsDice["tables"]["ante"] = {}

local liarsDiceTables = 0

local table = createObject ( 2189, 1204.61, 17.64, 1000.93 )
setElementInterior ( table, 2 )
--[[
info1, 1205.2176513672, 17.98637008667, 1001.1163330078
info2, 1204.603515625, 16.981378555298, 1000.8663330078
info3, 1204.1087646484, 18.016033172607, 1001.1163330078

lookat, 1204.63, 17.63, 1000.12
campos, 1204.63, 17.63, 1003.36

spawn0" doublesided="false" model="1337" interior="2" dimension="0, 1210.8116455078, 3.4388380050659, 1000.571105957
]]
liarsDiceMarkerOptic = createMarker ( 1210.79, 5.45, 999.89, "cylinder", 1, 125, 0, 0 )
liarsDiceMarker = createMarker ( 1210.79, 5.45, 999.89 + 1.5, "corona", 1, 125, 0, 0, 0 )
setElementInterior ( liarsDiceMarkerOptic, 2 )
setElementInterior ( liarsDiceMarker, 2 )

addEventHandler ( "onMarkerHit", liarsDiceMarker,
	function ( player, dim )
		if dim then
			local string = ""
			local count = 0
			
			local host, players, ante
			
			for id, index in pairs ( liarsDice["tables"]["id"] ) do
				count = count + 1
				host, players, ante = liarsDice["tables"]["host"][id], table. size ( liarsDice["tables"]["players"][id] ), liarsDice["tables"]["ante"][id]
				string = string..host.."|"..players.."|"..ante.." $|"
			end
			
			triggerClientEvent ( player, "openLiarsDiceServerList", player, string, count )
		end
	end
)

function openNewLiarsDiceTable_func ( amount )

	local amount = math.abs ( math.floor ( tonumber ( amount ) ) )
	local player = client
	if amount then
		local money = vnxGetElementData ( player, "money" )
		if money >= amount then
			liarsDiceTables = liarsDiceTables + 1
			local id = liarsDiceTables
			
			liarsDice["tables"]["players"][id] = {}
			 liarsDice["tables"]["players"][id][1] = false
			 liarsDice["tables"]["players"][id][2] = false
			 liarsDice["tables"]["players"][id][3] = false
			 liarsDice["tables"]["players"][id]["c"] = 0
			liarsDice["tables"]["dices"][id] = {}
			 liarsDice["tables"]["dices"][id][1] = { [1]="lost", [2]="lost", [3]="lost", [4]="lost", [5]="lost" }
			 liarsDice["tables"]["dices"][id][2] = { [1]="lost", [2]="lost", [3]="lost", [4]="lost", [5]="lost" }
			 liarsDice["tables"]["dices"][id][3] = { [1]="lost", [2]="lost", [3]="lost", [4]="lost", [5]="lost" }
			liarsDice["tables"]["ante"][id] = amount
			setPlayerJoinLiarsDice ( player, id )
		else
			infobox ( player, "Du hast nicht\ngenug Geld!", 5000, 125, 0, 0 )
		end
	end
end
addEvent ( "openNewLiarsDiceTable", true )
addEventHandler ( "openNewLiarsDiceTable", getRootElement(), openNewLiarsDiceTable_func )

function setPlayerJoinLiarsDice ( player, id )

	local pos = false
	for i = 1, 3 do
		if not liarsDice["tables"]["players"][id][i] then
			pos = i
			break
		end
	end
	if pos then
		liarsDice["tables"]["players"][id]["c"] = liarsDice["tables"]["players"][id]["c"] + 1
		liarsDice["tables"]["players"][id][pos] = player
		
		liarsDiceSyncNames ( id )
		triggerClientEvent ( player, "joinLiarsDiceTable", player )
		
	else
		infobox ( player, "Der Tisch ist\nleider voll.", 5000, 125, 0, 0 )
	end
end

function setPlayerLeaveLiarsDice ( player )

	setElementDimension ( player, 0 )
	setCameraTarget ( player, player )
	showCursor ( player, false )
	setElementClicked ( player, false )
end

function liarsDiceSyncNames ( id )

	local names = {}
	for i = 1, 3 do
		if liarsDice["tables"]["players"][id][i] then
			names[i] = getPlayerName ( liarsDice["tables"]["players"][id][i] )
		else
			names[i] = "-"
		end
	end
	for key, index in pairs ( liarsDice["tables"]["players"][id] ) do
		if key then
			triggerClientEvent ( key, "recieveLiarsDiceNames", key, names[1], names[2], names[3] )
		end
	end
end