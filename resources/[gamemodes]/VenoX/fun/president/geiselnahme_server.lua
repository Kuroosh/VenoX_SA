local presiped, presiveh, hostagefrak, hostageEndTimer, presiblip, presiSafeMarker, presiSafeBlip = nil, nil, nil, nil, nil, nil, nil
local hostageStart, hostageEnd = 0, 0
local presidied = false


local function hostageCouldntSaved ( )
	outputChatBox ( "Der Präsident wurde freigekauft!", root, 200, 0, 0 )
	clearElementVisibleTo ( presiblip )
	setElementVisibleTo ( presiblip, root, false )
	if isElement ( presiveh ) then
		destroyElement ( presiveh )
	end
	if isElement ( presiped ) then
		destroyElement ( presiped )
	end
	if isTimer ( hostageEndTimer ) then
		killTimer ( hostageEndTimer )
	end
	if isElement ( presiSafeMarker ) then
		destroyElement ( presiSafeMarker )
	end
	if isElement ( presiSafeBlip ) then
		destroyElement ( presiSafeBlip )
	end
	local damoney = 20000
	if factionDepotData["money"][1] >= 20000 then
		factionDepotData["money"][1] = factionDepotData["money"][1] - 20000
	else
		damoney = factionDepotData["money"][1]
		factionDepotData["money"][1] = 0
		sendMSGForFaction ( "In der Kasse waren nur "..damoney.."$", hostagefrak, 0, 200, 0 )
	end
	setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1 )
	factionDepotData["money"][hostagefrak] = factionDepotData["money"][hostagefrak] + damoney	
	triggerClientEvent ( "praesiWhatEverEnded", root )
end


function hostagePresidentDied ( _, killer )
	presidied = true
	outputChatBox ( "Der Präsident ist gestorben!", root, 200, 0, 0 )
	clearElementVisibleTo ( presiblip )
	setElementVisibleTo ( presiblip, root, false )
	if isElement ( presiveh ) then
		destroyElement ( presiveh )
	end
	if isElement ( presiped ) then
		destroyElement ( presiped )
	end
	if isTimer ( hostageEndTimer ) then
		killTimer ( hostageEndTimer )
	end
	if isElement ( presiSafeMarker ) then
		destroyElement ( presiSafeMarker )
	end
	if isElement ( presiSafeBlip ) then
		destroyElement ( presiSafeBlip )
	end
	if isElement ( killer ) and getElementType ( killer ) == "player" then
		local pname = getPlayerName ( killer )
		if isOnDuty ( killer ) then
			sendMSGForFaction ( "Der Mörder war "..pname..", daher bekommt ihr das Geld ersetzt.", hostagefrak, 0, 200, 0 )
			sendMSGForFaction ( "Der Mörder war "..pname..", daher wurde das Geld direkt gezahlt.", 1, 200, 0, 0 )
			sendMSGForFaction ( "Der Mörder war "..pname..", daher wurde das Geld direkt gezahlt.", 6, 200, 0, 0 )
			sendMSGForFaction ( "Der Mörder war "..pname..", daher wurde das Geld direkt gezahlt.", 8, 200, 0, 0 )
			local damoney = 20000
			if factionDepotData["money"][1] >= 20000 then
				factionDepotData["money"][1] = factionDepotData["money"][1] - 20000
			else
				damoney = factionDepotData["money"][1]
				factionDepotData["money"][1] = 0
				sendMSGForFaction ( "In der Kasse waren nur "..damoney.."$", hostagefrak, 0, 200, 0 )
			end
			factionDepotData["money"][hostagefrak] = factionDepotData["money"][hostagefrak] + damoney	
		end
		outputLog ( "Präsi-GN - "..pname.." hat den Präsidenten getötet - "..fraktionNames[vnxGetElementData(killer,"fraktion")], "aktion" )
	end
	setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1 )
	triggerClientEvent ( "praesiWhatEverEnded", root )
end


function hostageVehicleExploded ( )
	if not presidied then
		setTimer ( killPed, 500, 1, presiped )
	end
end


function hostageCouldBeSaved ( hitElement, dim )
	if hitElement == presiveh and dim and not presidied then
		outputChatBox ( "Der Präsident wurde befreit!", root, 0, 200, 0 )
		clearElementVisibleTo ( presiblip )
		setElementVisibleTo ( presiblip, root, false )
		if isElement ( presiveh ) then
			destroyElement ( presiveh )
		end
		if isElement ( presiped ) then
			destroyElement ( presiped )
		end
		if isTimer ( hostageEndTimer ) then
			killTimer ( hostageEndTimer )
		end
		if isElement ( presiSafeMarker ) then
			destroyElement ( presiSafeMarker )
		end
		if isElement ( presiSafeBlip ) then
			destroyElement ( presiSafeBlip )
		end
		factionDepotData["money"][1] = factionDepotData["money"][1] + 10000
		sendMSGForFaction ( "Als Belohnung bekommt ihr vom Staat 10.000$", 1, 0, 200, 0 )
		sendMSGForFaction ( "Als Belohnung bekommt ihr vom Staat 10.000$", 6, 0, 200, 0 )
		sendMSGForFaction ( "Als Belohnung bekommt ihr vom Staat 10.000$", 8, 0, 200, 0 )
		setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1 )
		triggerClientEvent ( "praesiWhatEverEnded", root )
	end
end


function startTakingPresidentAsHostage ( veh, ped, frak, blip )	
	outputChatBox ( "Der President wurde als Geisel genommen!", root, 255, 0, 0 )
	sendMSGForFaction ( "Verteidigt 10 Minuten die Stretch!", frak, 0, 0, 200 )
	sendMSGForFaction ( "Ihr habt 10 Minuten den Präsidenten zum PD zu bringen!", 1, 0, 0, 200 )
	sendMSGForFaction ( "Ihr habt 10 Minuten den Präsidenten zum PD zu bringen!", 8, 0, 0, 200 )
	sendMSGForFaction ( "Ihr habt 10 Minuten den Präsidenten zum PD zu bringen!", 8, 0, 0, 200 )
	presiped = ped
	presidied = false
	addEventHandler ( "onPedWasted", ped, hostagePresidentDied )
	addEventHandler ( "onVehicleExplode", veh, hostageVehicleExploded )
	outputLog ( "Präsi-GN - "..fraktionNames[frak], "aktion" )
	presiveh = veh
	hostagefrak = frak
	presiblip = blip
	hostageStart = getTickCount()
	hostageEnd = getTickCount() + 10 * 60 * 1000
	hostageEndTimer = setTimer ( hostageCouldntSaved, 10*60*1000, 1 )
	local lefttimeforend = hostageEnd - hostageStart
	presiSafeMarker = createMarker ( -1589.8237304688, 716.3316, -6.2421875, "checkpoint", 4, 255, 0, 0, 100 )
	presiSafeBlip = createBlip ( -1589.8237304688, 716.3316, -6.2421875, 19, 2, 255, 0, 0, 255, 0, 99999, root )
	addEventHandler ( "onMarkerHit", presiSafeMarker, hostageCouldBeSaved )
	for playeritem, _ in pairs ( fraktionMembers[1] ) do
		triggerClientEvent ( playeritem, "startPresiHostage", playeritem, ped, veh, lefttimeforend )
	end
	for playeritem, _ in pairs ( fraktionMembers[6] ) do
		triggerClientEvent ( playeritem, "startPresiHostage", playeritem, ped, veh, lefttimeforend )
	end
	for playeritem, _ in pairs ( fraktionMembers[8] ) do
		triggerClientEvent ( playeritem, "startPresiHostage", playeritem, ped, veh, lefttimeforend )
	end
	for playeritem, _ in pairs ( fraktionMembers[frak] ) do
		triggerClientEvent ( playeritem, "startPresiHostage", playeritem, ped, veh, lefttimeforend )
	end
end