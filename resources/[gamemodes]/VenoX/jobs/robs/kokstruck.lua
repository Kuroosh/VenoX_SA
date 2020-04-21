-- UTILS
function isLeapYear(year)
    if year then year = math.floor(year)
    else year = getRealTime().year + 1900 end
    return ((year % 4 == 0 and year % 100 ~= 0) or year % 400 == 0)
end

function getTimestamp(year, month, day, hour, minute, second)
    -- initiate variables
    local monthseconds = { 2678400, 2419200, 2678400, 2592000, 2678400, 2592000, 2678400, 2678400, 2592000, 2678400, 2592000, 2678400 }
    local timestamp = 0
    local datetime = getRealTime()
    year, month, day = year or datetime.year + 1900, month or datetime.month + 1, day or datetime.monthday
    hour, minute, second = hour or datetime.hour, minute or datetime.minute, second or datetime.second
    
    -- calculate timestamp
    for i=1970, year-1 do timestamp = timestamp + (isLeapYear(i) and 31622400 or 31536000) end
    for i=1, month-1 do timestamp = timestamp + ((isLeapYear(year) and i == 2) and 2505600 or monthseconds[i]) end
    timestamp = timestamp + 86400 * (day - 1) + 3600 * hour + 60 * minute + second
    
    timestamp = timestamp - 3600 --GMT+1 compensation
    if datetime.isdst then timestamp = timestamp - 3600 end
    
    return timestamp
end

local koksTruck = false
local koksTruckTimer = nil
local actionlaeuftTimer = nil
local koksTruckTimerAction = nil


-- INGAME
local koks1Truck = createBlip (1912.69, -2690.063, 13.2, 59, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
local koksTruck1Entrance = createMarker (1912.69, -2690.063, 12, "cylinder", 2, 0, 218, 255, 150)

local deliverBlip = createBlip(2879.8999023438, 1607.9, 10.8, 19, 2, 15, 107, 0, 255, 0, 99999 )
local deliverMarker = createMarker (2879.8999023438, 1607.9, 10.8, "cylinder", 5, 15, 107, 0, 255)
setElementVisibleTo(deliverBlip, root, false)
setElementVisibleTo(deliverMarker, root, false)

local truck = nil
local trailer = nil

function koksTruckEntrance_func ( player, dim )
	if getElementType(player) == "player" and dim then
		if not isPedInVehicle(player) then
			if isEvil(player) then
				if koksTruck == false then
					if aktionlaeuft == false then 
						outputDebugString(tostring(koksTruck).." "..tostring(aktionlaeuft))
						outputChatBox ( "[INFO]: Verwende /kokstruck [Anzahl] um einen Truck zu starten! Maximal 1000g Kokain und 1 Truck pro Stunde!", player, 0, 150, 200 )
					else 
						outputDebugString(tostring(koksTruck).." "..tostring(aktionlaeuft))
						infobox ( player, "Es läuft eine Aktion oder ein\nKokaintruck!", 5000, 155, 0, 0 )
						if isTimer ( koksTruckTimerAction ) then
							local timeleft = getTimerDetails ( koksTruckTimerAction )
							outputChatBox ( "Zeit bis zum nächsten Kokaintruck: "..math.floor(timeleft/1000/60*100)/100 .." Minuten!", player, 155, 0, 0 )
						end
					end 
				else 
					outputDebugString(tostring(koksTruck).." "..tostring(aktionlaeuft))
					infobox ( player, "Es läuft eine Aktion oder ein\nKokaintruck!", 5000, 155, 0, 0 )
					if isTimer ( koksTruckTimerAction ) then
						local timeleft = getTimerDetails ( koksTruckTimerAction )
						outputChatBox ( "Zeit bis zum nächsten Kokaintruck: "..math.floor(timeleft/1000/60*100)/100 .." Minuten!", player, 155, 0, 0 )
					end
				end
			end
		end
	end
end
addEventHandler ( "onMarkerHit",  koksTruck1Entrance,  koksTruckEntrance_func )

function koksTruck_func ( player, cmd, koks )
	if not koks then
		-- Print Syntax
		infobox ( player, "\n\nVerwende: /kokstruck [Anzahl]", 5000, 125, 0, 0 )
	else
		-- Is the player in a evil faction
		if isEvil(player) then
		
			-- Isnt he not to far away
			local x, y, z = getElementPosition ( player )
			if getDistanceBetweenPoints3D ( 1912.69, -2690.063, 12.9, x, y, z ) < 5 then
			
				-- Is the kokaintruck available
				if koksTruck == false and aktionlaeuft == false then
					if getRealTime().hour < 10 then
						if getFactionMembersOnline ( 1 ) + getFactionMembersOnline ( 6 ) + getFactionMembersOnline ( 8 ) >= 2 then
							infobox ( player, "Nicht genug\nStaatsfraktionisten online!", 5000, 150, 0, 0 )
							return
						end
					end
					outputDebugString(tostring(koksTruck).." "..tostring(aktionlaeuft))

					-- Get kokain costs
					local koksnumber = tonumber(koks)
					local koksprice = koksnumber * 15
					
					if 1000 >= koksnumber and koksnumber > 0 then
						if vnxGetElementData(player, "money") >= koksprice then
							-- Take money
							vnxSetElementData(player, "lastcrime", "kokstruck")
							vnxSetElementData(player, "money", vnxGetElementData(player,"money")-koksprice)
								loadKoksTruck(player, koksnumber, koksprice)
								koksTruckTimer = setTimer ( vehicleDestroyKoksTruck, 15*60*1000, 1 )
								aktionlaeuft = true
								outputLog("[KOKAINTRUCK]: "..getPlayerName ( player ).." hat einen Kokaintruck gestartet!", "bad")
								outputLog("KoksTruck - "..getPlayerName(player).." - "..fraktionNames[vnxGetElementData(player, "fraktion")], "aktion")
						else
							triggerClientEvent(player, "infobox_start", getRootElement(), "\n\nDu hast zu wenig Geld!", 7000, 125, 0, 0)
						end
					else
						triggerClientEvent(player, "infobox_start", getRootElement(), "\n\nVerwende: /kokstruck [Anzahl]\n(maximal 1000g Kokain!)!", 7000, 125, 0, 0)
					end
				else
					outputDebugString(tostring(koksTruck).." "..tostring(aktionlaeuft))
					infobox ( player, "Es läuft/lief bereits eine Aktion oder ein\nKokainTruck!", 5000, 155, 0, 0 )
					if isTimer ( koksTruckTimerAction ) then
						local timeleft = getTimerDetails ( koksTruckTimerAction )
						outputChatBox ( "Zeit bis zum nächsten Kokaintruck: "..math.floor(timeleft/1000/60*100)/100 .." Minuten!", player, 155, 0, 0 )
					end
				end
			else
				triggerClientEvent(player, "infobox_start", getRootElement(), "\n\nDu bist zu\nweit weg!", 7000, 125, 0, 0)
			end
		else
			triggerClientEvent(player, "infobox_start", getRootElement(), "\n\nDu bist kein Mitglied einer bösen Fraktion!", 7000, 125, 0, 0)
		end
	end
end
addCommandHandler ( "kokstruck", koksTruck_func )

function loadKoksTruck(player, koks, koksprice)
	if isElement(truck) and isElement(trailer) then
		destroyElement(truck)
		destroyElement(trailer)
	end
	aktionlaeuft = true
	koksTruck = true
	if koksTruckTimer and isTimer ( koksTruckTimer ) then
		killTimer ( koksTruckTimer )
	end
	
	-- Create actual vehicle
	truck = createVehicle(515, 1922.235, -2648.141, 14, 0, 0, 360, "VenoX-KT")
	trailer = createVehicle(435, 2520.686, -1460.826, 24.36, 0, 0, 360)
	attachTrailerToVehicle(truck, trailer)
	
	setVehiclePaintjob(truck, 2)
	setVehicleColor(truck, 0, 50, 210, 255, 255, 255 )
	setElementHealth(truck, 2000 )
	vnxSetElementData(truck, "koks", koks)
	vnxSetElementData(truck, "kosten", koksprice)
	vnxSetElementData(truck, "kokstruck", 1)
	vnxSetElementData(trailer, "kokstruckTrailer", 1)
	warpPedIntoVehicle(player, truck)
	
	-- Print message
	outputChatBox("[ILLEGAL]: Ein Kokaintruck wurde beladen!", root, 200, 0, 0 )
	outputChatBox("[AUFGABE]: Bringe nun den Kokaintruck zum Marker zu dem bandenboss in LV!", player, 0, 100, 200)
	
	-- Add handler
	addEventHandler("onMarkerHit", deliverMarker, abgebenTruck)
	addEventHandler("onVehicleExplode", truck, vehicleDestroyedKoksTruck)
	
	-- Make delivery point visible
	clearElementVisibleTo(deliverBlip)
	clearElementVisibleTo(deliverMarker)
	setElementVisibleTo(deliverBlip, root, true)
	setElementVisibleTo(deliverMarker, root, true)
end

function abgebenTruck(hitElement, dim)
	if dim and getElementType(hitElement) == "vehicle" and vnxGetElementData(hitElement, "kokstruck") == 1 and getVehicleOccupant(hitElement) then
		-- Remove event handlers
		removeEventHandler("onMarkerHit", deliverMarker, abgebenTruck)
		removeEventHandler("onVehicleExplode", hitElement, vehicleDestroyedKoksTruck)
		
		-- Earn koks
		vnxSetElementData(getVehicleOccupant(hitElement), "koks", vnxGetElementData(getVehicleOccupant(hitElement), "koks") + vnxGetElementData(hitElement, "koks"))
		-- Clean vehicles
		destroyElement(truck)
		destroyElement(trailer)

		-- Log it
		outputChatBox("[KOKAINTRUCK]: Der Kokaintruck wurde abgegeben!", getRootElement(), 200, 200, 200)
		outputLog("[KOKAINTRUCK]: Der Kokaintruck ist abgegeben worden!", "bad")


		koksTruck = true
		koksTruckTimerAction = setTimer ( function() koksTruck = false end, 60*60*1000, 1 )
		actionlaeuftTimer = setTimer ( function() aktionlaeuft = false end, 5*60*1000, 1 )
		-- Clearify visibility
		clearElementVisibleTo(deliverBlip)
		clearElementVisibleTo(deliverMarker)
		setElementVisibleTo(deliverBlip, root, false)
		setElementVisibleTo(deliverMarker, root, false)
		if koksTruckTimer and isTimer ( koksTruckTimer ) then
			killTimer ( koksTruckTimer )
			koksTruckTimer = nil
		end
	end
end

function vehicleDestroyedKoksTruck()
	-- Remove event handlers
	if isElement ( truck ) then
		destroyElement ( truck )
	end
	koksTruck = true
	removeEventHandler("onVehicleExplode", source, truck)

	removeEventHandler ( "onMarkerHit", deliverMarker, abgebenTruck)		
	destroyElement(trailer)
		
	outputChatBox("[KOKAINTRUCK]: Der Kokaintruck ist explodiert!", getRootElement(), 0, 200, 0)
	outputLog("[KOKAINTRUCK]: Der Kokaintruck ist explodiert!", "bad")
	clearElementVisibleTo(deliverBlip)
	clearElementVisibleTo(deliverMarker)
	setElementVisibleTo(deliverBlip, root, false)
	setElementVisibleTo(deliverMarker, root, false)
	--setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1 )
	koksTruckTimerAction = setTimer ( function() koksTruck = false end, 60*60*1000, 1 )
	actionlaeuftTimer = setTimer ( function() aktionlaeuft = false end, 5*60*1000, 1 )
	if koksTruckTimer and isTimer ( koksTruckTimer ) then
		killTimer ( koksTruckTimer )
		koksTruckTimer = nil
	end
end



function vehicleDestroyKoksTruck ()
	outputChatBox ( "Der Kokaintruck wurde wegen Zeitüberschreitung zerstört!", getRootElement(), 0, 200, 0 )
	koksTruck = true
	koksTruckTimerAction = setTimer ( function() koksTruck = false end, 60*60*1000, 1 )
	actionlaeuftTimer = setTimer ( function() aktionlaeuft = false end, 5*60*1000, 1 )
	destroyElement(truck)
	destroyElement(trailer)
	clearElementVisibleTo(deliverBlip)
	clearElementVisibleTo(deliverMarker)
	setElementVisibleTo(deliverBlip, root, false)
	setElementVisibleTo(deliverMarker, root, false)

	--setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1 )
	if koksTruckTimer and isTimer ( koksTruckTimer ) then
		killTimer ( koksTruckTimer )
		koksTruckTimer = nil
	end
end


local kokssell = createMarker ( -2174.408, 364.510, 34.4, "cylinder", 1, 0, 218, 255, 150)
local ped = createPed(110,-2175.5,364.60001,35.1,270,true)
setElementFrozen(ped,true)
setTimer(setElementHealth,51,0,ped,100)
createBlip (-2174.408, 364.510, 34.4, 59, 2, 255, 0, 0, 255, 0, 200, getRootElement() )

addCommandHandler("kokssell", function ( player, cmd, amount )
	local x, y, z = getElementPosition ( player )
	if getDistanceBetweenPoints3D(-2174.408, 364.510, 34.4, x, y, z) < 2 then
		local amount = math.abs(math.floor (tonumber( amount)))
		local koks = vnxGetElementData ( player, "koks" )
		if koks >= amount then
			vnxSetElementData ( player, "koks", koks - amount )
			vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + amount * 30 )
			outputChatBox("Du hast für "..amount.." Gramm Kokain "..(amount*30).." verkauft!", player, 0, 125, 0)
		else
			outputChatBox("Du hast nicht soviel Kokain!", player, 125, 0, 0)
		end
	else
		triggerClientEvent(player, "infobox_start", root, "\n\nDu bist zu\nweit weg!", 5000, 0, 97, 230)
	end
end)

addEventHandler("onMarkerHit", kokssell, function(player, dim)
	if getElementType(player) == "player" and dim then
		outputChatBox ( "Ey Du... Hast du bisschen stoff fuer mich?", player, 125, 0, 0 )
		outputChatBox ( "Verwende /kokssell [ANZAHL] um dein Kokain zu verkaufen.", player, 125, 0, 0 )
	end
end)