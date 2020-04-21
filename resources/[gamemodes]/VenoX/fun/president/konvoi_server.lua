local presihausmarker = createMarker ( 1124.156, -2037.015, 68.885, "cylinder", 2, 255, 0, 0, 200 )
createBlip ( 1124.156, -2037.015, 68.885, 60, 2, 255, 0, 0, 255, 0, 200 )
local presidentabgabemarker = nil
local presidentabgabeblip = nil
local naechsterpresikonvoi = 0
local presiveh = nil
local presiped = nil
local presipeddown = false
local presiBlip = {
	[2] = createBlip ( -708.4, 956.2, 12.5, 19, 2 ),
	[3] = createBlip ( -2188.4, 641.2, 49.4, 19, 2 ),
	[7] = createBlip ( -1302.6999511719, 2516.6, 87.2, 19, 2 ),
	[9] = createBlip ( 2491.8, 1536, 10.7, 19, 2 ) }
local presiMarker = {
	[2] = createMarker ( -708.4, 956.2, 12.5, "checkpoint", 3, 0, 0, 200, 150 ),
	[3] = createMarker ( -2188.4, 641.2, 49.4, "checkpoint", 3, 0, 0, 200, 150 ),
	[7] = createMarker ( -1302.6999511719, 2516.6, 87.2, "checkpoint", 3, 0, 0, 200, 150 ),
	[9] = createMarker ( 2491.8, 1536, 10.7, "checkpoint", 3, 0, 0, 200, 150 ) }
	
	
local function presidentGotStolen ( hitElement, dim )
	if hitElement == presiveh and dim and not presipeddown then
		local player = getVehicleController ( hitElement )
		if player then
			local id = 0
			for index, marker in pairs ( presiMarker ) do
				if marker == source then
					id = index
					break
				end
			end
			local frak = vnxGetElementData ( player, "fraktion" )
			if id == frak then
				destroyElement ( presidentabgabeblip )
				destroyElement ( presidentabgabemarker )
				clearElementVisibleTo ( presiMarker[id] )
				setElementVisibleTo ( presiMarker[id], root, false )
				clearElementVisibleTo ( presiBlip[id] )
				for playeritem, _ in pairs ( fraktionMembers[1] ) do
					setElementVisibleTo ( presiBlip[id], playeritem, true )
				end
				for playeritem, _ in pairs ( fraktionMembers[6] ) do
					setElementVisibleTo ( presiBlip[id], playeritem, true )
				end
				for playeritem, _ in pairs ( fraktionMembers[8] ) do
					setElementVisibleTo ( presiBlip[id], playeritem, true )
				end
				for playeritem, _ in pairs ( fraktionMembers[frak] ) do
					setElementVisibleTo ( presiBlip[id], playeritem, true )
				end
				removeEventHandler ( "onVehicleExplode", presiveh, presidentVehicleDestroyed )
				removeEventHandler ( "onVehicleEnter", presiveh, presidentVehicleGettingStolen )
				removeEventHandler ( "onVehicleExit", presiveh, presidentVehicleGettingExitted )
				setElementHealth ( presiveh, 1000 )
				removeEventHandler ( "onPedWasted", presiped, presidentGotWasted )
				naechsterpresikonvoi = getTickCount() + 2 * 60 * 60 * 1000 + 10 * 60 * 1000
				startTakingPresidentAsHostage ( hitElement, presiped, frak, presiBlip[id] )	
				presiped = nil
				presiveh = nil
			end
		end
	end
end

	
for index, marker in pairs ( presiMarker ) do
	setElementVisibleTo ( marker, root, false )
	setElementVisibleTo ( presiBlip[index], root, false )
	addEventHandler ( "onMarkerHit", marker, presidentGotStolen )
end 


addEventHandler ( "onMarkerHit", presihausmarker, function ( hitElement, dim )
	if getElementType ( hitElement ) == "player" and dim then
		if isOnDuty ( hitElement ) then
			infobox ( hitElement, "Benutze /presikonvoi\num den Konvoi\nzu starten!", 4000, 0, 200, 0 )
		else
			infobox ( hitElement, "\nHier wohnt\nder President!", 4000, 0, 200, 0 )
		end
	end
end )


function presidentGotWasted ( _, killer )
	outputChatBox ( "Der Präsident ist gestorben!", root, 200, 0, 0 )
	presipeddown = true
	destroyElement ( presidentabgabeblip )
	destroyElement ( presidentabgabemarker )
	triggerClientEvent ( "praesiWhatEverEnded", root )
	for index, marker in pairs ( presiMarker ) do
		clearElementVisibleTo ( marker )
		clearElementVisibleTo ( presiBlip[index] )
		setElementVisibleTo ( marker, root, false )
		setElementVisibleTo ( presiBlip[index], root, false )
	end 
	setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1 )
	naechsterpresikonvoi = getTickCount() + 2 * 60 * 60 * 1000
	if isElement ( killer ) and getElementType ( killer ) == "player" then
		local frac = vnxGetElementData ( killer, "fraktion" )
		if isOnDuty ( killer ) then 
			local msg = "Der Mörder war "..getPlayerName(killer)..", daher werden 20.000$ aus der Fraktionskasse als Entschädigung gezahlt."
			sendMSGForFaction ( msg, 1, 200, 0, 0 )
			sendMSGForFaction ( msg, 6, 200, 0, 0 )
			sendMSGForFaction ( msg, 8, 200, 0, 0 )
			factionDepotData["money"][1] = factionDepotData["money"][1] - 20000	
		end
		outputLog ( "Präsi-Konvoi - "..getPlayerName(killer).." hat Präsi getötet - "..fraktionNames[vnxGetElementData(killer,"fraktion")], "aktion" )
	end
	setTimer ( function ( )
		if isElement ( presiveh ) then
			destroyElement ( presiveh )
		end
		destroyElement ( presiped )
	end, 10000, 1 )
end


function presidentVehicleDestroyed ( )
	if not presipeddown then
		setTimer ( killPed, 500, 1, presiped )
		sendMSGForFaction ( "Ihr müsst die Stretch (5.000$) von der Fraktionskasse bezahlen!", 1, 255, 0, 0 )
		sendMSGForFaction ( "Ihr müsst die Stretch (5.000$) von der Fraktionskasse bezahlen!", 6, 255, 0, 0 )
		sendMSGForFaction ( "Ihr müsst die Stretch (5.000$) von der Fraktionskasse bezahlen!", 8, 255, 0, 0 )
	end
end
 

function presidentVehicleGettingStolen ( player, seat )
	local frac = vnxGetElementData ( player, "fraktion" )
	if evilFraction[frac] then
		setElementVisibleTo ( presiBlip[frac], player, true )
		setElementVisibleTo ( presiMarker[frac], player, true )
		setElementVisibleTo ( presidentabgabeblip, player, false )
	elseif seat == 0 and not isOnDuty ( player ) then
		removePedFromVehicle ( player )
		killPed ( player )
	end
end


function presidentVehicleGettingExitted ( player, seat )
	local frac = vnxGetElementData ( player, "fraktion" )
	if evilFraction[frac] then
		setElementVisibleTo ( presiBlip[frac], player, false )
		setElementVisibleTo ( presiMarker[frac], player, false )
		setElementVisibleTo ( presidentabgabeblip, player, true )
	end
end


function presidentHasArrived ( hitElement, dim )
	if getElementType ( hitElement ) == "vehicle" and hitElement == presiveh and not presipeddown then
		outputChatBox ( "Der Präsident ist gesund angekommen!", root, 0, 200, 0 )
		sendMSGForFaction ( "Als Belohnung bekommt ihr 20.000$ vom Staat in die Kasse.", 1, 0, 200, 0 )
		sendMSGForFaction ( "Als Belohnung bekommt ihr 20.000$ vom Staat in die Kasse.", 6, 0, 200, 0 )
		sendMSGForFaction ( "Als Belohnung bekommt ihr 20.000$ vom Staat in die Kasse.", 8, 0, 200, 0 )
		factionDepotData["money"][1] = factionDepotData["money"][1] + 20000	
		destroyElement ( presidentabgabeblip )
		destroyElement ( presidentabgabemarker )
		for index, marker in pairs ( presiMarker ) do
			clearElementVisibleTo ( marker )
			clearElementVisibleTo ( presiBlip[index] )
			setElementVisibleTo ( marker, root, false )
			setElementVisibleTo ( presiBlip[index], root, false )
		end 
		setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1 )
		naechsterpresikonvoi = getTickCount() + 2 * 60 * 60 * 1000
		destroyElement ( presiveh )
		destroyElement ( presiped )
		triggerClientEvent ( "praesiWhatEverEnded", root )
	end
end


function startPresiKonvoi ( player )
	outputChatBox ( "=======================================", root, 200, 200, 0 )
	outputChatBox ( "Der Präsidenten-Konvoi wurde gestartet!", root, 200, 200, 0 )
	outputChatBox ( "=======================================", root, 200, 200, 0 )
	presiveh = createVehicle ( 409, 1244.8998, -2012.6852, 59.517, 0, 0, 180, "President" )
	addEventHandler ( "onVehicleExplode", presiveh, presidentVehicleDestroyed )
	addEventHandler ( "onVehicleEnter", presiveh, presidentVehicleGettingStolen )
	addEventHandler ( "onVehicleExit", presiveh, presidentVehicleGettingExitted )
	setVehicleColor ( presiveh, 0, 0, 0 )
	setElementHealth ( presiveh, 2000 )
	presiped = createPed ( 228, 1244.8998, -2012.6852, 59.517 )
	warpPedIntoVehicle ( presiped, presiveh, 3 )
	aktionlaeuft = true
	addEventHandler ( "onPedWasted", presiped, presidentGotWasted )
	setPedStat ( presiped, 24, 999 )
	setElementHealth ( presiped, 999 )
	setPedArmor ( presiped, 100 )
	for playeritem, _ in pairs ( fraktionMembers[1] ) do
		triggerClientEvent ( playeritem, "startPresiKonvoi", playeritem, presiped, presiveh )
	end
	for playeritem, _ in pairs ( fraktionMembers[6] ) do
		triggerClientEvent ( playeritem, "startPresiKonvoi", playeritem, presiped, presiveh )
	end
	for playeritem, _ in pairs ( fraktionMembers[8] ) do
		triggerClientEvent ( playeritem, "startPresiKonvoi", playeritem, presiped, presiveh )
	end
	outputLog ( "Präsi-Konvoi - "..fraktionNames[vnxGetElementData(player,"fraktion")], "aktion" )
	presidentabgabemarker = createMarker ( 132.76, 1922.87, 18.148375, "checkpoint", 4, 255, 0, 0, 100 )
	addEventHandler ( "onMarkerHit", presidentabgabemarker, presidentHasArrived )
	presidentabgabeblip = createBlip ( 132.76, 1922.87, 18.148375, 19, 2, 255, 0, 0, 255, 0, 99999, root )
end


addCommandHandler ( "presikonvoi", function ( player )
	if isOnDuty ( player ) then
		if vnxGetElementData ( player, "rang" ) >= 2 then
			if not aktionlaeuft then
				if naechsterpresikonvoi <= getTickCount() then
					local x, y, z = getElementPosition ( player )
					if getDistanceBetweenPoints3D ( x, y, z, 1124.156, -2037.015, 68.985 ) <= 5 then
						if getRealTime().hour < 12 then
							infobox ( player, "Dafür ist es\nnoch viel zu\nfrüh!", 5000, 150, 0, 0 )
							return
						end
						startPresiKonvoi ( player )
					end
				else
					infobox ( player, "Der President\nist noch\nnicht Zuhause", 4000, 200, 0, 0 )
				end
			else
				infobox ( player, "Es läuft\nnoch eine\nAktion!", 4000, 200, 0, 0 )
			end
		else
			infobox ( player, "Erst ab\nRang 2", 4000, 200, 0, 0 )
		end
	else
		infobox ( player, "Du bist\nnicht befugt", 4000, 200, 0, 0 )
	end
end )












	
	
	
	