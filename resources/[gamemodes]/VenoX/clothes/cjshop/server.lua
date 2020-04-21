addEvent ( "buyCloth_Bonus", true )
addEvent ( "addremoveCloth_Bonus", true )

local picpath = { "clothes/cjshop/Bilder/", ".jpg" }	-- AUCH CLIENTSEITIG ÄNDERN
local typeprices =  { [0] = 5000, [1] = 5000, [2] = 5000, [3] = 5000, [4] = 5000, [5] = 5000, [6] = 5000, [7] = 5000, [8] = 5000, 
					  [9] = 5000, [10] = 5000, [11] = 5000, [12] = 5000, [13] = 5000, [14] = 5000, [15] = 5000, [16] = 5000, [17] = 50000 }
local clothesbought = {}
local clothesused = {}
local indexespertype = {}
local _setElementModel = setElementModel

addCommandHandler ( "updatemetaforclothesshop", function () 
	local meta = xmlLoadFile ( "meta.xml" )
	for i=0, 17 do
		for j=0, 100 do
			if fileExists ( picpath[1].."Type"..i.."index"..j..picpath[2] ) then
				local child = xmlCreateChild ( meta, "file" )
				xmlNodeSetAttribute ( child, "src", picpath[1].."Type"..i.."index"..j..picpath[2] )
			else
				break
			end
		end
	end
	xmlSaveFile ( meta )
	xmlUnloadFile ( meta )
end )

local function saveClothType ( player, clothtype )
	local str = ""
	for i=0, indexespertype[clothtype]-1 do
		str = str.. ( clothesbought[player][clothtype][i] and "1" or "0" )
	end
	dbExec ( handler, "UPDATE Kleidungsteile SET Type"..clothtype.." = ? WHERE UID = ?", str, playerUID[getPlayerName(player)] )
end

local function saveUsedClothes ( player )
	local str = ""
	for i=0, 17 do
		str = str .. ( clothesused[player][i] or "-" ).."|"
	end
	dbExec ( handler, "UPDATE Kleidungsteile SET Benutzt = ? WHERE UID = ?", str, playerUID[getPlayerName(player)] )
end

addEventHandler ( "buyCloth_Bonus", root, function ( clothtype, index )
	if vnxGetElementData ( client, "money" ) >= typeprices[clothtype] then
		if not clothesbought[client][clothtype][index] then
			vnxSetElementData ( client, "money", vnxGetElementData ( client, "money" ) - typeprices[clothtype] )
			clothesbought[client][clothtype][index] = true
			triggerClientEvent ( client, "boughtCloth_Bonus", client, clothtype, index )
			saveClothType ( client, clothtype )
		else
			outputChatBox ( "Du besitzt es schon", client, 150, 0, 0 )
		end
	else
		outputChatBox ( "Du hast nicht genug Geld dafür", client, 150, 0, 0 )
	end
end )

addEventHandler ( "addremoveCloth_Bonus", root, function ( clothtype, index )
	if clothesbought[client][clothtype][index] then
		if clothesused[client][clothtype] then
			removePedClothes ( client, clothtype )
			clothesused[client][clothtype] = nil
			triggerClientEvent ( client, "addedremovedCloth_Bonus", client, clothtype, index, true )
			outputChatBox ( "Kleidungsteil ausgezogen", client, 200, 0, 0 )
		else
			local newtexture, newmodel = getClothesByTypeIndex ( clothtype, index )
			addPedClothes ( client, newtexture, newmodel, clothtype )
			clothesused[client][clothtype] = index
			triggerClientEvent ( client, "addedremovedCloth_Bonus", client, clothtype, index, "added" )
			outputChatBox ( "Kleidungsteil angezogen", client, 0, 200, 0 )
		end
		saveUsedClothes ( client )
	else 
		if clothesused[client][clothtype] then
			removePedClothes ( client, clothtype )
			clothesused[client][clothtype] = nil
			triggerClientEvent ( client, "addedremovedCloth_Bonus", client, clothtype, index, nil )
			saveUsedClothes ( client )
		else
			outputChatBox ( "Du besitzt dieses Stück nicht", client, 150, 0, 0 )
		end
	end
end )

addEventHandler ( "onPlayerSpawn", root, function ( )
	if clothesused[source] then
		for i=0, 17 do
			if clothesused[source][i] then
				local texture, model = getClothesByTypeIndex ( i, clothesused[source][i] )
				addPedClothes ( source, texture, model, i )
			end
		end
	end
end )

function setElementModel ( element, model )
	if tonumber ( model ) == 0 then
		if clothesused[element] then
			for i=0, 17 do
				if clothesused[element][i] then
					local texture, model = getClothesByTypeIndex ( i, clothesused[element][i] )
					addPedClothes ( element, texture, model, i )
				end
			end
		end
	end
	return _setElementModel ( element, model )
end

local function useClothesResult ( query, player )
	if isElement ( player ) then
		local pname = getPlayerName ( player )
		clothesbought[player] = { [0] = {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {} }
		clothesused[player] = { }
		local result = dbPoll ( query, 0 )
		if result and result[1] then
			result = result[1]
			local usingstr = result["Benutzt"]
			local clothtype = 1
			local differencer = string.byte ( "|" )
			local index = gettok ( usingstr, clothtype, differencer )
			while index and index ~= "" do
				if tonumber ( index ) then
					clothesused[player][clothtype-1] = tonumber ( index )
				elseif index == "-" then
					clothesused[player][clothtype-1] = false
				end
				clothtype = clothtype + 1 
				index = gettok ( usingstr, clothtype, differencer )
			end
			for type=0, 17 do
				local str = result["Type"..type]
				local index = 1
				local number = string.sub ( str, index, index )
				while number and number ~= "" do
					if number == "1" then
						clothesbought[player][type][index-1] = true
					end
					index = index + 1
					number = string.sub ( str, index, index )
				end
			end	
			local model = getElementModel ( player )
				if model == 0 then
					for clothtype=0, 17 do
						if clothesused[player][clothtype] then
						local texture, model = getClothesByTypeIndex ( clothtype, clothesused[player][clothtype] )
						addPedClothes ( player, texture, model, clothtype )
					end
				end
			end
		else
			dbExec ( handler, "INSERT INTO Kleidungsteile (UID) VALUES (?)", playerUID[pname] )
		end
	else
		dbFree ( query )
	end
end

function loadDBClothes ( player )
	local pname = getPlayerName ( player )
	dbQuery ( useClothesResult, { player }, handler, "SELECT * FROM Kleidungsteile WHERE UID = ?", playerUID[pname] )
end

addEventHandler ( "onPlayerQuit", root, function ( )
	clothesbought[source] = nil
	clothesused[source] = nil
end )

addEventHandler ( "onResourceStart", resourceRoot, function ( )
	for i=0, 17 do
		for j=0, 100 do
			if fileExists ( picpath[1].."Type"..i.."index"..j..picpath[2] ) then
				indexespertype[i] = ( indexespertype[i] or 0 ) + 1
			else
				break
			end
		end
	end
end )


function CJKleidungKaufen (player)
	local triggerarray = {}
	for type=0, 17 do
		if clothesbought[player][type] then
			triggerarray[type] = {}
			for index, _ in pairs ( clothesbought[player][type] ) do
				triggerarray[type][index] = true
			end
		end
		if clothesused[player][type] then
			triggerarray[type][clothesused[player][type]] = "added"
		end
	end
	triggerLatentClientEvent ( player, "openClothShop_Bonus", 50000, false, player, triggerarray )
end

local KleidungKauf = createCustomPickup(148.51037597656,-73.720077514648,1001.8046875, 0, 0, "anzeigen/cpickup/images/cj.png", CJKleidungKaufen)