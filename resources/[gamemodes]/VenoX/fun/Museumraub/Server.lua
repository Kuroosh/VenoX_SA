addEvent ( "startmuseumrob", true )
addEvent ( "gottheartifact", true )
addEvent ( "hitahostage", true )

local exit1marker = createMarker ( 1727.1999511719, -1638.5, 20.200000762939, "corona", 1, 0, 0, 255, 255 )
local exit2marker = createMarker ( 1701.4000244141, -1667.8000488281, 20.200000762939, "corona", 1, 0, 0, 255, 255 )
local entrance1marker = createMarker ( 1726.9000244141, -1636.3000488281, 20.200000762939, "corona", 1, 0, 0, 255, 255 )
local entrance2marker = createMarker ( 1699.0999755859, -1667.9000244141, 20.200000762939, "corona", 1, 0, 0, 255, 255 )
createBlip ( 1726.9000244141, -1637.3000488281, 20.200000762939, 52, 1, 255, 0, 0, 255, 0, 200 ) 
setElementInterior ( exit1marker, 18 )
setElementInterior ( exit2marker, 18 )


local museumrobmarkerpositions = {
	{ 1729, -1647.6999511719, 19.299999237061 },
	{ 1728.5, -1655.5999755859, 19.299999237061 },
	{ 1712.4000244141, -1665.4000244141, 19.299999237061 },
	{ 1714.0999755859, -1655.4000244141, 19.299999237061 },
	{ 1721.6999511719, -1658.8000488281, 19.299999237061 }
}
local deliverymarkerposition = { -1650.2, -181.88, 14 }

local robberGangs = { [2] = true, [3] = true, [7] = true, [9] = true, [12] = true, [13] = true }
local robbercarid = 414   -- Mule
local museumprice = 1500   -- Falls man nur die ersten 4 einsammelt
local museummainprice = 2000   -- Falls man den 5. bekommt
local mincopsonline = 0

local museumrobbing = false
local playerInMuseum, museumrobmarker, markerGettingRobbed = {}, {}, {}
local nextmuseumrob, artifactscollected, animpedtyp, planespeed = 0, 0, 0, 0
local robberfaction, robberplayer, robbercar, delivermarker, deliverblip


function hitAHostage ( )
	if vnxGetElementData ( source, "money" ) >= 300 then
		outputChatBox ( "Verletze nicht die Zivilisten! Dafür werden dir 300$ abgezogen!", source, 255, 0, 0 )
		takePlayerSaveMoney ( source, 300 )
	elseif vnxGetElementData ( source, "bankmoney" ) >= 300 then
		outputChatBox ( "Verletze nicht die Zivilisten! Dafür werden dir 300$ von der Bank abgezogen!", source, 255, 0, 0 )
		vnxSetElementData ( source, "bankmoney", vnxGetElementData ( source, "bankmoney" ) - 300 )
	elseif vnxGetElementData ( source, "money" ) + vnxGetElementData ( source, "bankmoney" ) >= 300 then
		outputChatBox ( "Verletze nicht die Zivilisten! Dafür werden dir 300$ von Hand und der Bank abgezogen!", source, 255, 0, 0 )	
		local money = vnxGetElementData ( source, "money" )
		takePlayerSaveMoney ( source, money )
		vnxSetElementData ( source, "bankmoney", vnxGetElementData ( source, "bankmoney" ) - ( 300 - money ) )
	else
		local money = vnxGetElementData ( source, "money" ) + vnxGetElementData ( source, "bankmoney" )
		outputChatBox ( "Verletze nicht die Zivilisten! Dafür wird dir all dein restliches Geld weggenommen!", source, 255, 0, 0 )	
		takePlayerSaveMoney ( source, vnxGetElementData ( source, "money" ) )
		vnxSetElementData ( source, "bankmoney", 0 )
	end
end
addEventHandler ( "hitahostage", getRootElement(), hitAHostage )


function goInOutMuseum ( hitElement, dim )
	if getElementType ( hitElement ) == "player" and dim then
		if source == exit1marker then
			setElementInterior ( hitElement, 0 )
			setElementPosition ( hitElement, 1727.1999511719, -1634.5999755859, 20.200000762939 )
			setElementRotation ( hitElement, 0, 0, 0, "default", true )
			triggerClientEvent ( hitElement, "stopmuseumsounds", hitElement )
			playerInMuseum[hitElement] = nil
			if hitElement == robberplayer and artifactscollected >= 1 then
				createTheMuseumCar ( )
			end
		elseif source == exit2marker then
			setElementInterior ( hitElement, 0 )
			setElementPosition ( hitElement, 1697.5999755859, -1668, 20.200000762939 )
			setElementRotation ( hitElement, 0, 0, 270.001373, "default", true )
			triggerClientEvent ( hitElement, "stopmuseumsounds", hitElement )
			playerInMuseum[hitElement] = nil
			if hitElement == robberplayer and artifactscollected >= 1 then
				createTheMuseumCar ( )
			end
		elseif source == entrance1marker then
			setElementPosition ( hitElement, 1727.099609375, -1640.400390625, 20.200000762939 )
			setElementInterior ( hitElement, 18 )
			setElementRotation ( hitElement, 0, 0, 180, "default", true )
			playerInMuseum[hitElement] = true
			if museumrobbing then
				triggerClientEvent ( hitElement, "museumalarm", hitElement, animpedtyp )
			else
				triggerClientEvent ( hitElement, "museumsound", hitElement )
			end
		elseif source == entrance2marker then
			setElementPosition ( hitElement, 1702.7998046875, -1667.7998046875, 20.200000762939 )
			setElementInterior ( hitElement, 18 )
			setElementRotation ( hitElement, 0, 0, 90, "default", true )
			playerInMuseum[hitElement] = true
			if museumrobbing then
				triggerClientEvent ( hitElement, "museumalarm", hitElement, animpedtyp )
			else
				triggerClientEvent ( hitElement, "museumsound", hitElement )
			end
		end
		vnxSetElementData ( hitElement, "spawnProtection", true )
		setTimer ( vnxSetElementData, 1000, 1, hitElement, "spawnProtection", false )
	end
end
addEventHandler ( "onMarkerHit", exit1marker, goInOutMuseum )
addEventHandler ( "onMarkerHit", exit2marker, goInOutMuseum )
addEventHandler ( "onMarkerHit", entrance1marker, goInOutMuseum )
addEventHandler ( "onMarkerHit", entrance2marker, goInOutMuseum )


function startMuseumRob_click ( )
	if robberGangs[vnxGetElementData ( source, "fraktion" )] then
		if getTickCount() > nextmuseumrob then
			if not museumrobbing then
				if not aktionlaeuft then
					local time = getRealTime()
					local hours = time.hour
					if hours >= 11 then
						--outputChatBox("Nur zwischen 10:00 - 00:00 uhr Möglich !", source, 125,0,0)
						outputDebugString("Museumsraub von zeither gestartet ( RealTime) "..hours)
						if getFactionMembersOnline ( 1 ) + getFactionMembersOnline ( 6 ) + getFactionMembersOnline ( 8 ) <= 1 then
							outputDebugString(getFactionMembersOnline ( 1 ) + getFactionMembersOnline ( 6 ) + getFactionMembersOnline ( 8 ))
							outputDebugString("Museumsraub : Nicht genug staatsfraktionisten Online!")
							infobox ( source, "Nicht genug\nStaatsfraktionisten online!", 5000, 150, 0, 0 )
							return
						else 
							startMuseumRob ( source )
						end 
					else 
						outputChatBox("Nur zwischen 10:00 - 00:00 uhr Möglich !", source, 125,0,0)
					end 
				end
			end
		else
			for thePlayer, _ in pairs ( playerInMuseum ) do
				outputChatBox ( "Gisela sagt: Es wurde uns schon alles geklaut, wir haben nichts mehr.", thePlayer, 255, 255, 255 )
			end
		end
	end
end
addEventHandler ( "startmuseumrob", getRootElement(), startMuseumRob_click )


function startMuseumRob ( player )
	outputDebugString(getFactionMembersOnline ( 1 ) + getFactionMembersOnline ( 6 ) + getFactionMembersOnline ( 8 ))
	museumrobbing = true 
	robberfaction = vnxGetElementData ( player, "fraktion" )
	robberplayer = player
	addEventHandler ( "onPlayerWasted", player, museumRobPlayerWasted )
	addEventHandler ( "onPlayerQuit", player, museumRobPlayerWasted )
	outputLog ( "Museumraub - "..getPlayerName(player).." - "..fraktionNames[vnxGetElementData ( player, "fraktion")], "aktion" )
	animpedtyp = 1
	for thePlayer, _ in pairs ( playerInMuseum ) do
		triggerClientEvent ( thePlayer, "museumalarm", thePlayer, animpedtyp )
		outputChatBox ( "Gisela sagt: Bitte tut mir nichts, ich deaktiviere die Sicherheitsbarriere, dauert nur 3 Minuten!", thePlayer, 255, 255, 255 )
	end
	museumTimer = setTimer ( tooMuchTimeSpend, 20*60*1000, 1 )
	aktionlaeuft = true
	setTimer ( function() 
		for index, array in pairs ( museumrobmarkerpositions ) do
			if index ~= 5 then
				museumrobmarker[index] = createMarker ( array[1], array[2], array[3], "cylinder", 1.1, 255, 0, 0, 255 )
				setElementInterior ( museumrobmarker[index], 18 )
				addEventHandler ( "onMarkerHit", museumrobmarker[index], getTheArtifactOfMuseum )
				addEventHandler ( "onMarkerLeave", museumrobmarker[index], stopGettingTheArtifactOfMuseum )
			end
		end	
		sendMSGForFaction ( "Sammelt die Artefakte ein!", robberfaction, 0, 155, 0 ) 
	end, 3*60*1000, 1 )
	outputChatBox ( "Das Museum wird ausgeraubt!", getRootElement(), 255, 0, 0 )	
end


function getTheArtifactOfMuseum ( hitElement, dim )
	if getElementType ( hitElement ) == "player" and dim then
		triggerClientEvent ( hitElement, "gettheartifact", hitElement )
		markerGettingRobbed[hitElement] = source
	end
end
	
	
function stopGettingTheArtifactOfMuseum ( hitElement, dim )
	if getElementType ( hitElement ) == "player" and dim then
		triggerClientEvent ( hitElement, "stopgettingtheartifact", hitElement )
		markerGettingRobbed[hitElement] = nil
	end
end


function gotTheArtifact ( )
	if isElement ( markerGettingRobbed[source] ) then
		destroyMuseumMarker ( markerGettingRobbed[source] )
		artifactscollected = artifactscollected + 1
		if artifactscollected == 1 then
			for thePlayer, _ in pairs ( playerInMuseum ) do
				outputChatBox ( "Gertrude sagt: Mein Mann hat einen Herzinfakt, Hilfe!", thePlayer, 255, 255, 255 )
				triggerClientEvent ( thePlayer, "setmuseumpedanimation", thePlayer, 2 )
			end
		elseif artifactscollected == 2 then
			for thePlayer, _ in pairs ( playerInMuseum ) do
				outputChatBox ( "Yin Guan sagt: Ihr nicht davon kommen werden damit!", thePlayer, 255, 255, 255 )
			end
		elseif artifactscollected == 3 then
			for thePlayer, _ in pairs ( playerInMuseum ) do
				outputChatBox ( "Chantal sagt: Isch will raus ey!", thePlayer, 255, 255, 255 )
			end
		elseif artifactscollected == 4 then
			sendMSGForFaction ( "Nun los an den großen Fisch!", robberfaction, 0, 255, 0 )
			museumrobmarker[5] = createMarker ( museumrobmarkerpositions[5][1], museumrobmarkerpositions[5][2], museumrobmarkerpositions[5][3], "cylinder", 1, 255, 0, 0 )
			setElementInterior ( museumrobmarker[5], 18 )
			addEventHandler ( "onMarkerHit", museumrobmarker[5], getTheArtifactOfMuseum )
		else
			if robberwasted then
				createTheMuseumCar()
			else
				sendMSGForFaction ( "Ihr könnt nun rausgehen!", robberfaction, 0, 155, 0 )
			end
		end
	end
end
addEventHandler ( "gottheartifact", getRootElement(), gotTheArtifact )


function museumRobPlayerWasted ( )
	removeEventHandler ( "onPlayerWasted", source, museumRobPlayerWasted )
	removeEventHandler ( "onPlayerQuit", source, museumRobPlayerWasted )
	if artifactscollected ~= 5 then
		robberwasted = true
	else
		createTheMuseumCar()
	end
end


function createTheMuseumCar ( )
	if not isElement ( robbercar ) then
		if isTimer ( museumTimer ) then
			killTimer ( museumTimer )
		end
		sendMSGForFaction ( "Das Fahrzeug steht nun draußen bereit!", robberfaction, 0, 155, 0 )
		sendMSGForFaction ( "Versucht es mit so wenig Schaden wie möglich am Flughafen abzugeben!", robberfaction, 0, 155, 0 )
		destroyMuseumMarker ( "Pluz. strinkt gewaltig!" )
		robbercar = createVehicle ( 414, 1721.482, -1608.429, 13.86, 0, 0, 0, "Bonus" )
		setElementHealth ( robbercar, 2000 )
		museumTimer = setTimer ( tooMuchTimeSpendAfterCar, 20*60*1000, 1 )
		addEventHandler ( "onVehicleExplode", robbercar, museumVehicleExploded )
		addEventHandler ( "onVehicleStartEnter", robbercar, museumVehicleEnter )
		delivermarker = createMarker ( deliverymarkerposition[1], deliverymarkerposition[2], deliverymarkerposition[3], "checkpoint", 4, 0, 0, 255, 155 )
		addEventHandler ( "onMarkerHit", delivermarker, deliverTheRobbercar )
		deliverblip = createBlip ( deliverymarkerposition[1], deliverymarkerposition[2], deliverymarkerposition[3], 19 )
	end
end


function deliverTheRobbercar ( hitElement, dim )
	if dim and hitElement == robbercar then
		if getVehicleOccupant ( hitElement, 0 ) then
			local player = getVehicleOccupant ( hitElement, 0 )
			local plane = createVehicle ( 577, -1625.28, -130.36, 14.1, 0, 0, 312 )
			local ped = createPed ( 61, -1625.28, -130.36, 14.1 )
			warpPedIntoVehicle ( ped, plane )
			triggerClientEvent ( "startMuseumRobPlane", root, ped )
			setTimer ( function ( plane, ped )
				destroyElement ( plane )
				destroyElement ( ped )
			end, 10000, 1, plane, ped )
			local vehhp = getElementHealth ( hitElement )
			local money = ( artifactscollected <= 4 and museumprice * artifactscollected ) or ( artifactscollected == 5 and museummainprice * 5 ) or outputDebugString ( "Zu viele Marker?!" )
			local price = math.floor ( money * ( vehhp / 2000 ) )
			givePlayerSaveMoney ( player, price )
			sendMSGForFaction ( "Der Raub war erfolgreich, ihr bekommt dafür $"..price..".", robberfaction, 0, 155, 0 )
			outputChatBox ( "Der Museumraub war erfolgreich!", getRootElement(), 255, 0, 0 )
			deleteEverythingForNextMuseum()
		end	
	end
end


function museumVehicleExploded ( )
	outputChatBox ( "Der Museumraub ist fehlgeschlagen!", getRootElement(), 155, 0, 0 )
	deleteEverythingForNextMuseum()
end


function tooMuchTimeSpend ( )
	sendMSGForFaction ( "Wir haben viel zu viel Zeit verschwendet!", robberfaction, 155, 0, 0 )
	if artifactscollected > 0 then
		createTheMuseumCar()
	else
		sendMSGForFaction ( "Schnell raus hier!", robberfaction, 155, 0, 0 )
	end
end


function tooMuchTimeSpendAfterCar ( )
	sendMSGForFaction ( "Wir haben viel zu viel Zeit verschwendet!", robberfaction, 155, 0, 0 )
	sendMSGForFaction ( "Das Fahrzeug wurde zerstört, wir haben versagt!", robberfaction, 155, 0, 0 )
	deleteEverythingForNextMuseum()
end


function museumVehicleEnter ( player, _, jacked, door )
	if vnxGetElementData ( player, "fraktion" ) ~= robberfaction then
		if not jacked and door == 0 then
			cancelEvent()
		elseif jacked and door == 0 then
			setTimer ( removePedFromVehicle, 500, 1, player )
		end
	end
end


function deleteEverythingForNextMuseum ( )
	museumrobbing = false
	for player, _ in pairs ( playerInMuseum ) do
		triggerClientEvent ( player, "museumsound", player )
	end
	if isElement ( robbercar ) then
		destroyElement ( robbercar )
	end
	nextmuseumrob, artifactscollected, animpedtyp, planespeed = getTickCount() + 2*60*60*1000, 0, 0, 0
	robberfaction, robberplayer, robbercar = nil
	markerGettingRobbed, playerInMuseum = {}, {}	
	if isElement ( delivermarker ) then
		destroyElement ( delivermarker )
		delivermarker = nil
	end
	if isElement ( deliverblip ) then
		destroyElement ( deliverblip )
		deliverblip = nil
	end
	setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1 )
end


function destroyMuseumMarker ( marker )
	if type ( marker ) ~= "string" then
		for index, theMarker in pairs ( museumrobmarker ) do
			if theMarker == marker then
				museumrobmarker[index] = nil
				destroyElement ( theMarker )
				return
			end
		end
	else
		for index, theMarker in pairs ( museumrobmarker ) do
			destroyElement ( theMarker )
		end
		museumrobmarker = {}
	end
end