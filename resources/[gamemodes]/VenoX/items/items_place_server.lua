objects = {}
objectCount = 0
clientSoundFiles = {}
	clientSoundFiles["x"] = {}
	clientSoundFiles["y"] = {}
	clientSoundFiles["z"] = {}
	clientSoundFiles["url"] = {}
	

function finishObjectPlace_func ( x, y, z, rx, ry, rz, special )

	local player = client
	local model = vnxGetElementData ( player, "object" )
	if placeAblesToBeSaved[model] then
		createObjectToSave ( model, x, y, z, rx, player, 3 )
	else
		if model > 0 then
			objectCount = objectCount + 1
			local object = createObject ( model, x, y, z, rx, ry, rz )
			objects[objectCount] = object
			vnxSetElementData ( objects[objectCount], "placeableObject", true )
			vnxSetElementData ( player, "object", 0 )
			if model == 841 or model == 842 then -- Fackeln
				local fire = createObject ( 3461, x, y, z - 1.8 )
				setElementParent ( fire, objects[objectCount] )
			end
		end
	end
end
addEvent ( "finishObjectPlace", true )
addEventHandler ( "finishObjectPlace", getRootElement(), finishObjectPlace_func )

function purchaseItem_func ( model )

	local player = client
	local price = placeablePrices[model]
	if vnxGetElementData ( player, "money" ) >= price then
		if vnxGetElementData ( player, "object" ) == 0 then
			takePlayerSaveMoney ( player, price )
			vnxSetElementData ( player, "object", model )
			infobox ( player, "\n\nDu hast das Objekt\nerworben!\nEs ist nun in\ndeinem Inventar.", 5000, 0, 2000, 0 )
		else
			infobox ( player, "\n\n\nDu hast bereits\nein Objekt!", 5000, 200, 0, 0 )
		end
	else
		infobox ( player, "\n\n\nDu hast nicht\ngenug Geld!", 5000, 200, 0, 0 )
	end
end
addEvent ( "purchaseItem", true )
addEventHandler ( "purchaseItem", getRootElement(), purchaseItem_func )

placedObjects = {}

function createObjectToSave ( model, x, y, z, rx, placer, daysToKeep )

	local time = getMinTime () + 60 * 24 * daysToKeep
	local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "UID", "object", "UID", playerUID[getPlayerName(placer)] ), -1 )
	if not result or not result[1] or #result < maxPlaceAbleObjectsPerPlayer then
		if vnxGetElementData ( player, "playingtime" ) >= 600 then
			dbExec ( handler, "INSERT INTO ?? ( ??, ??, ??, ??, ??, ??, ?? ) VALUES (?,?,?,?,?,?,?)", "object", "model", "x", "y", "z", "rx", "placerUID", "deleteTime", model, x, y, z, rx, playerUID[getPlayerName ( placer )], time )
			setTimer (
				function ( model, x, y, z, rx, placer )
					local id = tonumber ( dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "id", "object", "taken", "0" ), -1 )[1]["id"] )
					dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "object", "taken", "1", "id", id )
					local object = createObject ( model, x, y, z, 0, 0, rx )
					vnxSetElementData ( object, "placer", getPlayerName ( placer ) )
					vnxSetElementData ( object, "id", id )
					vnxSetElementData ( object, "placeableObjectMySQL", true )
					placedObjects[id] = object
				end,
			500, 1, model, x, y, z, rx, placer )
			vnxSetElementData ( player, "object", 0 )
			infobox ( player, "Objekt platziert.", 5000, 0, 200, 0 )
		else
			infobox ( player, "Du hast keine 10\nSpielstunden!", 5000, 125, 0, 0 )
		end
	else
		infobox ( player, "Du kannst maximal\n"..maxPlaceAbleObjectsPerPlayer.." Objekte zur\nselben Zeit platzieren.\nTippe /delmyobjects\nzum loeschen.", 5000, 125, 0, 0 )
	end
end

function delmyobjects ( player )
	local pname = getPlayerName ( player )
	local result = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "id", "object", "UID", playerUID[pname] ), -1 )
	if result and result[1] then
		for i = 1, #result do
			local id = tonumber ( result[1]["id"] )
			if id then
				id = tonumber ( id )
				destroyElement ( placedObjects[id] )
			end
		end
		dbExec ( handler, "DELETE FROM ?? WHERE ??=?", "object", "playerUID", playerUID[getPlayerName(player)] )
	end
	outputChatBox ( "Alle von dir plazierten Objekte wurden geloescht.", player, 200, 200, 0 )
end
addCommandHandler ( "delmyobjects", delmyobjects )



function createNextPlaceableObject ( data )

	local id = data["id"]
	
	local model = data["model"]
	
	local x = data["x"]
	local y = data["y"]
	local z = data["z"]
	local rx = data["rx"]
	
	local placer = data["placer"]
	
	local object = createObject ( model, x, y, z, 0, 0, rx )
	
	vnxSetElementData ( object, "placer", placer )
	vnxSetElementData ( object, "id", id )
	vnxSetElementData ( object, "placeableObjectMySQL", true )
	
	placedObjects[id] = object
end