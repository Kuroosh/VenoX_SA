addEvent ( "onServerRentRoller", true )
addEvent ( "cancel_faggio_gui", true )

local faggioroller = {}
local faggiorollerTimer = {}
local rollermarkerID = {}
local rollermarker = {
	createMarker ( -1984.3, 167.6, 26.7, "cylinder", 1.5, 0, 120, 200, 200 ),
	createMarker ( -2736, 386.30000610352, 3.4, "cylinder", 1.5, 0, 120, 200, 200 ),
	createMarker ( -2413.5, 349.29998779297, 34.200000762939, "cylinder", 1.5, 0, 120, 200, 200 ),
	createMarker ( -195.6, 1214.2, 18.5, "cylinder", 1.5, 255, 120, 0, 255 )
}
local stand = {
	--createObject ( 3862, -1982.6999511719, 167.5, 27.89999961853, 0, 0, 270 ),
	createObject ( 3861, -2736, 388.80000610352, 4.5, 0, 0, 0 ),
	createObject ( 3863, -2415.3999023438, 350.5, 35.299999237061, 0, 0, 57 ),
	createObject ( 3862, -193.4, 1214.2, 19.8, 0, 0, 270 )
}
local standped = {
	createPed ( 17, -1981, 167.5, 27.7, 90,true ),
	createPed ( 17, -2736, 389.2, 4.4, 180,true ),
	createPed ( 17, -2415.6999511719, 350.79998779297, 35.200000762939, 239,true ),
    createPed(17, -192.7, 1214.2, 19.7, 180,true)
}
local faggioSpawnPoint = {
	{ ["x"] = -1982.7, ["y"] = 176.3, ["z"] = 27.6, ["rot"] = 0 },
	{ ["x"] = -2732.3000488281, ["y"] = 388.39999389648, ["z"] = 4, ["rot"] = 180 },
	{ ["x"] = -2413.099609375, ["y"] = 352.900390625, ["z"] = 34.799999237061, ["rot"] = 234.99737548828 },
	{ ["x"] = -193.7, ["y"] = 1211.4, ["z"] = 19.3, ["rot"] = 90 }
}


local function startRollerverleih ( hitElement, dim )
	if getElementType ( hitElement ) == "player" and not isPedInVehicle ( hitElement) then
		if dim then
			local id = rollermarkerID[source]
			triggerClientEvent ( hitElement, "onClientRentRoller", hitElement, id )
		end
	end
end


for i=1, #rollermarker do
	rollermarkerID[rollermarker[i]] = i
	addEventHandler ( "onMarkerHit", rollermarker[i], startRollerverleih )
end 


local function destroyRoller ( player, cmd )
	if (player and isElement(player) and getElementType ( player ) == "player") or (source and isElement(source) and getElementType (source) == "player") then
		if not isElement ( player ) then
			player = source
		end
		if cmd ~= "droller" then
			if faggioroller[player] then
				destroyElement ( faggioroller[player] )
				faggioroller[player] = nil
			end
		elseif vnxGetElementData ( player, "adminlvl" ) >= 3 then
			for playeritem, roller in pairs ( faggioroller ) do
				destroyElement ( roller )
				faggioroller[playeritem] = nil
				if faggiorollerTimer[playeritem] and isTimer(faggiorollerTimer[playeritem]) then
					killTimer ( faggiorollerTimer[playeritem] )
					faggiorollerTimer[playeritem] = nil
				end
			end
			outputChatBox ( "Du hast alle Roller zerstört!", player, 0, 255, 0 )
		end
	elseif source and isElement ( source ) and getElementType ( source ) == "player" then
		if faggioroller[source] then
			destroyElement ( faggioroller[source] )
			faggioroller[source] = nil
		end
		if faggiorollerTimer[source] and isTimer(faggiorollerTimer[source]) then
			killTimer ( faggiorollerTimer[source] )
			faggiorollerTimer[source] = nil
		end
	end
end


local function rentRoller ( id )
	if vnxGetElementData ( client, "money" ) >= 75 or vnxGetElementData ( client, "playingtime" ) < (15*60) then
		if vnxGetElementData ( client, "playingtime" ) >= (15*60) then
			vnxSetElementData ( client, "money", vnxGetElementData ( client, "money") - 75 )
		end
		local x, y, z = getElementPosition ( client )
		if isElement ( faggioroller[client] ) then
			destroyElement (faggioroller[client])
			faggioroller[client] = nil
		end
		faggioroller[client] = createVehicle ( 462, faggioSpawnPoint[id]["x"], faggioSpawnPoint[id]["y"], faggioSpawnPoint[id]["z"], 0, 0, faggioSpawnPoint[id]["rot"], getPlayerName(client) )
		setVehicleColor ( faggioroller[client], 0, 218, 255 )
		warpPedIntoVehicle ( client, faggioroller[client] )
		triggerClientEvent ( client, "infobox_start", getRootElement(), "Du hast ein\nFaggio ausgeliehen!", 5000, 0, 218, 255 )
		removeEventHandler ( "onPlayerQuit", client, destroyRoller )
		addEventHandler ( "onPlayerQuit", client, destroyRoller )
		if faggiorollerTimer[client] and isTimer (faggiorollerTimer[client]) then
			killTimer ( faggiorollerTimer[client] )
			faggiorollerTimer[client] = nil
		end
		faggiorollerTimer[client] = setTimer ( destroyRoller, 20*60*1000, 1, faggioroller[client] )
	else
		triggerClientEvent ( client, "infobox_start", getRootElement(), "Nicht genug\nGeld auf\nder Hand!", 5000, 125, 0, 0 )	
	end
end
	
local function cancel_faggio_gui_func ()
	setElementClicked ( client, false )
end


addCommandHandler ( "droller", destroyRoller )
addEventHandler ( "onServerRentRoller", getRootElement(), rentRoller )
addEventHandler ( "cancel_faggio_gui", getRootElement(), cancel_faggio_gui_func )