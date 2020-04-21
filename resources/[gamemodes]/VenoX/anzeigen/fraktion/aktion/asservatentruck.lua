local asservatentruck = false
local asservartentruckTimer = nil
local actionlaeuftTimer = nil
local asservartentruckTimerAction = nil
--local asservatenmarker = createMarker (-1560.796875 , 282.046875 , 6.3, "cylinder", 1.4, 0, 218, 255, 150)
local asservatenabgabemarker = createMarker (310.056640625 , 1883.6669921875 , 17.0, "cylinder", 5, 0, 218, 255, 150)
local asservatenabgabeBlip = createBlip(310.056640625 , 1883.6669921875 , 17.0, 19, 2, 15, 107, 0, 255, 0, 99999 )
local pedas = createPed(280,-1560.8291015625 , 282.693359375 , 7.1875,180,true)
local betaaservarten = "false"
setElementFrozen(pedas,true)
setTimer(setElementHealth,51,0,pedas,100)
setElementVisibleTo(asservatenabgabeBlip, root, false)
setElementVisibleTo(asservatenabgabemarker, root, false)

function asservartentruck_info(player)
    if betaaservarten == "yes" then 
       outputChatBox("Pschhhhht.... Ich bin ein Update Spoiler :3", player, 0, 150, 200 )
    else 
    outputChatBox("Verwende /asservatentruck um einen Asservaten Truck zu starten! ", player, 0, 150, 200 )
    end 
end 
--addEventHandler ( "onMarkerHit",  asservatenmarker,  asservartentruck_info )


function asservatentruck_func(player)
    local x, y, z = getElementPosition ( player )
    local veh = getPedOccupiedVehicle ( player ) 
    if not veh then 
        if getDistanceBetweenPoints3D (-1560.796875,282.046875, 6.3, x, y, z ) < 5 then
            if isOnDuty(player) then
                if aktionlaeuft == false and asservatentruck == false then 
					local time = getRealTime()
					local hours = time.hour
                        if hours >= 9 then
                            outputDebugString("Asservatentruck von zeither gestartet ( RealTime) "..hours)
                            --if getFactionMembersOnline ( 1 ) + getFactionMembersOnline ( 6 ) + getFactionMembersOnline ( 8 ) <= 1 then
                                --outputDebugString(getFactionMembersOnline ( 1 ) + getFactionMembersOnline ( 6 ) + getFactionMembersOnline ( 8 ))
                               -- outputDebugString("Asservatentruck : Nicht genug staatsfraktionisten Online!")
                                --infobox ( player, "Nicht genug\nStaatsfraktionisten online!", 5000, 150, 0, 0 )
                               -- return
                            --else 
                                if vnxGetElementData(player,"koks") >= 1000 and vnxGetElementData(player,"mats") >= 500 and vnxGetElementData(player,"drugs") >= 500 then 
                                            --outputChatBox("Nur zwischen 10:00 - 00:00 uhr Möglich !", source, 125,0,0)
                                        outputDebugString("Asservatentruck von zeither gestartet ( RealTime) "..hours)
                                        
                                        
                                        koks_asservatentruck = vnxGetElementData(player,"koks")
                                        mats_asservatentruck = vnxGetElementData(player,"mats")
                                        weed_asservatentruck = vnxGetElementData(player,"drugs")
                                        aktionlaeuft = true
                                        outputLog("Asservatenkammer - "..getPlayerName(player).." - "..fraktionNames[vnxGetElementData(player, "fraktion")], "aktion")
                                        loadasservatentruck(player, weed_asservatentruck, koks_asservatentruck, mats_asservatentruck)
                                else 
                                    outputChatBox("Du hast nicht genug Weed/Kokain/Mats Dabei! ( Mindestens 1000 von Kokain und 500 von Drogen und Mats!)", player, 125, 0, 0)
                                end 
                            --end
                        else 
                            outputDebugString("Asservatentruck von zeither gestartet ( RealTime) "..hours)
                           outputChatBox("Nur zwischen 11:00 - 00:00 uhr Möglich !", player, 125,0,0)
                        end 
                else 
                    --outputDebugString(tostring(asservatentruck).." "..tostring(aktionlaeuft))
                    --infobox ( player, "Es läuft/lief bereits eine Aktion oder ein\nAsservatentruck!", 5000, 155, 0, 0 )
                    triggerClientEvent(player, "infobox_start", getRootElement(), "Es läuft/lief bereits eine Aktion oder ein\nAsservatentruck!", 7000, 125, 0, 0)
                    if isTimer ( asservartentruckTimerAction ) then
                        local timeleft = getTimerDetails ( asservartentruckTimerAction )
                        outputChatBox ( "Zeit bis zum nächsten asservatentruck: "..math.floor(timeleft/1000/60*100)/100 .." Minuten!", player, 155, 0, 0 )
                    end
                end 
            else 
                outputChatBox("Du bist nicht On-Duty!", player, 120,0,0)
            end
        else 
            triggerClientEvent(player, "infobox_start", getRootElement(), "Du bist nicht am Asservatenkammer Marker", 7000, 125, 0, 0)
        end 
    end
end 
addCommandHandler("asservatentruck", asservatentruck_func)

function loadasservatentruck(player, weed, koks, mats)
    if isElement(asservattruck) and isElement(trailer) then
		destroyElement(asservattruck)
		destroyElement(trailer)
	end
	aktionlaeuft = true
	asservatentruck = true
	if asservartentruckTimer and isTimer ( asservartentruckTimer ) then
		killTimer ( asservartentruckTimer )
    end
    outputDebugString(koks_asservatentruck.. " | "..mats_asservatentruck.." | "..weed_asservatentruck)
	asservattruck = createVehicle(455, -1567.5703125 , 290.1142578125 , 7.1875, 0, 0, 90, "STAATSTRUCK")
	setVehicleColor(asservattruck, 0, 50, 210, 255, 255, 255 )
	setElementHealth(asservattruck, 2000 )
    vnxSetElementData(asservattruck, "koks", koks_asservatentruck)
    vnxSetElementData(asservattruck, "mats", mats_asservatentruck)
    vnxSetElementData(asservattruck, "drugs", weed_asservatentruck)
	vnxSetElementData(asservattruck, "aservattentruck", 1)
    warpPedIntoVehicle(player, asservattruck)
    vnxSetElementData(player, "koks", 0)
    vnxSetElementData(player, "mats",0)
    vnxSetElementData(player, "drugs",0)
	-- Print message
	outputChatBox("[ASSERVATENTRUCK]: Ein AsservatenTruck wurde beladen!", root, 0, 200, 0 )
	outputChatBox("[AUFGABE]: Bringe nun den AsservatenTruck zum Marker zu dem Chef in der Area51!", player, 0, 255, 0)
    asservartentruckTimer = setTimer ( vehicleDestroyAsservattruck, 15*60*1000, 1 )
	-- Add handler
	addEventHandler("onMarkerHit", asservatenabgabemarker, abgebenAsservatentruck)
	addEventHandler("onVehicleExplode", asservattruck, vehicleDestroyedAsservattruck)
	
	-- Make delivery point visible
	clearElementVisibleTo(asservatenabgabeBlip)
	clearElementVisibleTo(asservatenabgabemarker)
	setElementVisibleTo(asservatenabgabeBlip, root, true)
	setElementVisibleTo(asservatenabgabemarker, root, true)
end 


function vehicleDestroyedAsservattruck(player)
	asservatentruck = true
	removeEventHandler("onVehicleExplode", asservattruck, vehicleDestroyedAsservattruck)

	removeEventHandler ( "onMarkerHit", asservatenabgabemarker, abgebenAsservatentruck)		
		
	outputChatBox("[ASSERVATENTRUCK]: Der Asservatentruck ist explodiert!", root, 0, 200, 0)
    outputLog("[ASSERVATENTRUCK]: Der Asservatentruck ist explodiert!", "aktion")
           
    kokainammount = vnxGetElementData(asservattruck, "koks") / 10
    matsammount = vnxGetElementData(asservattruck, "mats") / 10
    drugsammount = vnxGetElementData(asservattruck, "drugs") / 10

    local x, y, z = getElementPosition ( asservattruck )
    local col = createColSphere ( x, y, z, 50 )
    local players = getElementsWithinColShape ( col, "player" )
    for i=1, #players do
        if isEvil(players[i]) then
            vnxSetElementData ( players[i], "koks", vnxGetElementData ( players[i], "koks" ) + kokainammount )
            outputChatBox("Das Fahrzeug wurde zerstört! Jeder Böse Fraktionist in der Nähe kriegt für die Menge Kokain : "..(kokainammount).." g.",players[i], 0, 125, 0)
            vnxSetElementData ( players[i], "mats", vnxGetElementData ( players[i], "mats" ) + matsammount )
            outputChatBox("Das Fahrzeug wurde zerstört! Jeder Böse Fraktionist in der Nähe kriegt für die Menge Mats : "..(matsammount)..".",players[i], 0, 125, 0)
            vnxSetElementData ( players[i], "drugs", vnxGetElementData ( players[i], "drugs" ) + drugsammount )
            outputChatBox("Das Fahrzeug wurde zerstört! Jeder Böse Fraktionist in der Nähe kriegt für die Menge Drogen : "..(drugsammount).." g.",players[i], 0, 125, 0)
        elseif isOnDuty(players[i]) then
            outputChatBox("Das Fahrzeug wurde zerstört! Jeder Böse Fraktionist in der Nähe kriegt für die Menge Kokain : "..(kokainammount).." g.",players[i], 125, 0, 0)
            outputChatBox("Das Fahrzeug wurde zerstört! Jeder Böse Fraktionist in der Nähe kriegt für die Menge Mats : "..(matsammount)..".",players[i], 125, 0, 0)
            outputChatBox("Das Fahrzeug wurde zerstört! Jeder Böse Fraktionist in der Nähe kriegt für die Menge Drogen : "..(drugsammount).." g.",players[i], 125, 0, 0)
        end 
    end
    if isElement ( asservattruck ) then
		destroyElement ( asservattruck )
    end
	clearElementVisibleTo(asservatenabgabeBlip)
	clearElementVisibleTo(asservatenabgabemarker)
	setElementVisibleTo(asservatenabgabeBlip, root, false)
	setElementVisibleTo(asservatenabgabemarker, root, false)
	--setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1 )
	asservartentruckTimerAction = setTimer ( function() asservatentruck = false end, 240*60*1000, 1 )
	actionlaeuftTimer = setTimer ( function() aktionlaeuft = false end, 5*60*1000, 1 )
	if asservartentruckTimer and isTimer ( asservartentruckTimer ) then
		killTimer ( asservartentruckTimer )
		asservartentruckTimer = nil
	end
end 


function vehicleDestroyAsservattruck ()
    vnxSetElementData(asservattruck, "koks", 0)
    vnxSetElementData(asservattruck, "koks", 0)
    vnxSetElementData(asservattruck, "drugs",0)
	outputChatBox ( "Der Asservatentruck wurde wegen Zeitüberschreitung zerstört!", root, 0, 200, 0 )
	asservatentruck = true
	asservartentruckTimerAction = setTimer ( function() asservatentruck = false end, 240*60*1000, 1 )
	actionlaeuftTimer = setTimer ( function() aktionlaeuft = false end, 5*60*1000, 1 )
    if isElement ( asservattruck ) then
		destroyElement ( asservattruck )
    end
	clearElementVisibleTo(asservatenabgabeBlip)
	clearElementVisibleTo(asservatenabgabemarker)
	setElementVisibleTo(asservatenabgabeBlip, root, false)
	setElementVisibleTo(asservatenabgabemarker, root, false)

	--setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1 )
	if asservartentruckTimer and isTimer ( asservartentruckTimer ) then
		killTimer ( asservartentruckTimer )
		asservartentruckTimer = nil
	end
end

function setbetadata(player)
    if getPlayerName(player) == "Solid_Snake" then 
        vnxSetElementData(player, "koks", 1000)
        vnxSetElementData(player, "mats",1000)
        vnxSetElementData(player, "drugs",1000)
    end
end 
addCommandHandler("givedashitforsolid",setbetadata )



function abgebenAsservatentruck(hitElement, dim)
    if dim and getElementType(hitElement) == "vehicle" and vnxGetElementData(hitElement, "aservattentruck") == 1 and getVehicleOccupant(hitElement) then
		-- Remove event handlers
		removeEventHandler("onMarkerHit", asservatenabgabemarker, abgebenAsservatentruck)
		removeEventHandler("onVehicleExplode", hitElement, vehicleDestroyedAsservattruck)
       
        kokainammount = vnxGetElementData(asservattruck, "koks")
        matsammount = vnxGetElementData(asservattruck, "mats")
        drugsammount = vnxGetElementData(asservattruck, "drugs")
        local x, y, z = getElementPosition ( asservattruck )
        local col = createColSphere ( x, y, z, 50 )
        local players = getElementsWithinColShape ( col, "player" )
        for i=1, #players do
            if isOnDuty ( players[i] ) then
                vnxSetElementData ( players[i], "money", vnxGetElementData ( players[i], "money" ) + kokainammount * 7 )
                outputChatBox("Das Fahrzeug wurde abgegeben, jeder Staatsfraktionist in der Nähe kriegt für die Menge Kokain : "..(kokainammount*7).." $.",players[i], 0, 125, 0)
                vnxSetElementData ( players[i], "money", vnxGetElementData ( players[i], "money" ) + matsammount * 4 )
                outputChatBox("Das Fahrzeug wurde abgegeben, jeder Staatsfraktionist in der Nähe kriegt für die Menge Kokain : "..(matsammount*4).." $.",players[i], 0, 125, 0)
                vnxSetElementData ( players[i], "money", vnxGetElementData ( players[i], "money" ) + drugsammount * 6 )
                outputChatBox("Das Fahrzeug wurde abgegeben, jeder Staatsfraktionist in der Nähe kriegt für die Menge Kokain : "..(drugsammount*6).." $.",players[i], 0, 125, 0)
            end
        end
        vnxSetElementData(asservattruck, "koks", 0)
        vnxSetElementData(asservattruck, "koks", 0)
        vnxSetElementData(asservattruck, "drugs",0)
		-- Clean vehicles
		destroyElement(asservattruck)
		-- Log it
		outputChatBox("[ASSERVATENTRUCK]: Der Asservatentruck wurde abgegeben!", root, 200, 200, 200)
		outputLog("[ASSERVATENTRUCK]: Der Asservatentruck ist abgegeben worden!", "aktion")

		asservatentruck = true
        asservartentruckTimerAction = setTimer ( function() asservatentruck = false end, 240*60*1000, 1 )
        actionlaeuftTimer = setTimer ( function() aktionlaeuft = false end, 5*60*1000, 1 )
		-- Clearify visibility
		clearElementVisibleTo(asservatenabgabeBlip)
		clearElementVisibleTo(asservatenabgabemarker)
		setElementVisibleTo(asservatenabgabeBlip, root, false)
		setElementVisibleTo(asservatenabgabemarker, root, false)
		if asservartentruckTimer and isTimer ( asservartentruckTimer ) then
			killTimer ( asservartentruckTimer )
			asservartentruckTimer = nil
        end
    end
	--end
end 

local asservatentruckinfo = createCustomPickup(-1560.7734375 , 281.8681640625 , 7.1875, 0, 0, "anzeigen/cpickup/images/asservaten.png", asservartentruck_info)