local robmarker = createMarker ( 2509.6199023438, -1689.9529755859, 12.61199961853, "cylinder", 1.2, 125, 0, 0 )
local carrobDeliver1 = createMarker ( -1420.5999755859, 2583.8000488281, 54.799999237061, "cylinder", 5, 125, 0, 0, 170 )
--local carrobDeliver2 = createMarker ( -394.2286, 2227.5720, 41.4296, "cylinder", 5, 125, 0, 0, 170 )
local carrobblip = createBlip ( 2509.6199023438, -1689.9529755859, 12.61199961853, 12, 1, 255, 0, 0, 255, 0, 200 )
local robblip1 = createBlip ( -1420.5999755859, 2584.5, 55.799999237061, 19 )
--local robblip2 = createBlip ( -394.2286, 2227.5720, 41.4296, 41 )
local carrobTimer = nil
local marker = nil
local robcar = nil
local carrobTimerAction = nil

setElementVisibleTo (carrobDeliver1, root, false)
--setElementVisibleTo (carrobDeliver2, root, false)
setElementVisibleTo (robblip1, root, false)
--setElementVisibleTo (robblip2, root, false)
	
local function outputMarkerHit ( hitElement )

	outputChatBox ("Tippe /carrob um das Fahrzeug des Innenminsters zu stehlen!", hitElement, 125, 0, 0 )
end
addEventHandler ("onMarkerHit", robmarker, outputMarkerHit )	

local function startrob ( player )

	local veh = math.random ( 1 )
	if veh == 1 then
		vehid = 421
	end
    setElementVisibleTo ( robblip1, root, true )
	--setElementVisibleTo ( robblip2, player, true )
	setElementVisibleTo (carrobDeliver1, root, true)
	--setElementVisibleTo (carrobDeliver2, root, true)
	robcar = createVehicle ( vehid, 2505.1049023438, -1695.22, 12.91199961853, 0, 0, 0, "Stolen" )
    marker = createMarker ( 2505.1049023438, -1695.22, 12.91199961853, "arrow",  1,  getColorFromString ( "#FE000199" ) )
    attachElements( marker, robcar, 0, 0, 1.8 )
	setVehicleColor ( robcar, math.random ( 1, 54 ), math.random ( 1,54 ), math.random ( 1,54 ) )
	setElementHealth ( robcar, 1500 )
	warpPedIntoVehicle ( player, robcar )
	outputLog ( "Carrob - "..getPlayerName(player).." - "..fraktionNames[vnxGetElementData ( player, "fraktion")], "aktion" )
	carrobTimer = setTimer ( function () 
		outputChatBox ( "Das gestohlene Fahrzeug ist wegen der Zeit zerstört worden!", getRootElement(), 255, 0, 0 )
		removeEventHandler ("onVehicleExplode", robcar, VehicleIsExplode )
		clearElementVisibleTo ( robblip1 )
		setElementVisibleTo ( robblip1, root, false )
		setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1 )
		--destroyElement ( robblip2 )
		--robblip2 = nil
		destroyElement (robcar)
		robcar = nil
		setTimer ( function()
			setGarageOpen ( 9, false )
			setGarageOpen ( 40, false )
			setGarageOpen ( 44, false )
		end, 10*60*1000, 1 )
		destroyElement ( marker )
		setElementVisibleTo (carrobDeliver1, root, false)
		--setElementVisibleTo (carrobDeliver2, root, false)
		--setElementVisibleTo ( robblip2, root, false )
	end, 20*60*1000, 1 )
	aktionlaeuft = true
	addEventHandler ("onVehicleExplode", robcar, VehicleIsExplode )
	setGarageOpen ( 40, true )
	setGarageOpen ( 44, true )
    setGarageOpen ( 9, true )
	addEventHandler ("onMarkerHit", carrobDeliver1, CarRobDeliver_func )
	--addEventHandler ("onMarkerHit", carrobDeliver2, CarRobDeliver_func )
	local msg = "Abgabepunkt: ElQuebrados in einer Garage, alle Staatsfraktionen begeben sich zum Abgabeort!"
	sendMSGForFaction ( msg, 1, 255, 0, 0 )
	sendMSGForFaction ( msg, 6, 255, 0, 0 )
	sendMSGForFaction ( msg, 8, 255, 0, 0 )
	
	outputChatBox ("Fahre das Fahrzeug zum Abgabepunkt Punkt!", player, 0, 125, 0 )
end

local carrobAvailable = true
addCommandHandler("carrob", function(player, cmd)
	local x, y, z = getElementPosition ( player )
	local px, py, pz = 2509.6199023438, -1689.9529755859, 12.61199961853
	if getDistanceBetweenPoints3D ( x, y, z, px, py, pz ) <= 3 then
		if carrobAvailable and not aktionlaeuft then
			if isEvil(player) then
				if getRealTime().hour < 10 then
					if getFactionMembersOnline ( 1 ) + getFactionMembersOnline ( 6 ) + getFactionMembersOnline ( 8 ) >= 2 then
						infobox ( player, "Nicht genug\nStaatsfraktionisten online!", 5000, 150, 0, 0 )
						return
					end
				end
				carrobAvailable = false
				carrobTimerAction = setTimer(function ()
					carrobAvailable = true
				end, 1.5*60*60*1000, 1)
				startrob ( player )
				outputChatBox("Das Fahrzeug des Innenministers wurde gestohlen!", getRootElement(), 125, 0, 0 )
				setGarageOpen ( 9, true )
			else
				outputChatBox("Du bist in keiner bösen Fraktion!", player, 125, 0, 0 )
			end
		else
			outputChatBox("Das Fahrzeug des Innenminister ist grade nicht da!", player, 125, 0, 0)
			if isTimer ( carrobTimerAction ) then
				local timeleft = getTimerDetails ( carrobTimerAction )
				outputChatBox ( "Zeit bis zum nächsten Carrob: ".. math.floor(timeleft/1000/60*100)/100 .." Minuten!", player, 155, 0, 0 )
			end
		end
	end
end)

function CarRobDeliver_func ( player )
	if player and isElement ( player ) and getElementType ( player ) == "player" then
		local abgabemoney = 10000
		local rveh = getPedOccupiedVehicle ( player ) 
		if isEvil(player) then
			if getPedOccupiedVehicleSeat ( player ) == 0 then
				if rveh == robcar then
					outputChatBox ("Fahrzeug erfolgreich abgegeben! Du erhälst "..abgabemoney.."$", player, 0, 125, 0 )
					outputChatBox ( "Das Fahrzeug des Innenminister wurde abgegeben!", root, 200, 0, 0 )
					setElementVisibleTo (carrobDeliver1, root, false)
					--setElementVisibleTo (carrobDeliver2, root, false)
					clearElementVisibleTo ( robblip1 )
					setElementVisibleTo ( robblip1, root, false )
					--setElementVisibleTo ( robblip2, root, false )
					--destroyElement ( robblip2 )
					--robblip2 = nil
					destroyElement ( rveh )
					rveh = nil
					destroyElement ( marker )
					marker = nil
					setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1)
					givePlayerSaveMoney ( player, abgabemoney )
					setTimer ( function()
						setGarageOpen ( 9, false )
						setGarageOpen ( 40, false )
						setGarageOpen ( 44, false )
					end, 10*60*1000, 1 )
					robcar = nil
					if isTimer ( carrobTimer ) then
						killTimer ( carrobTimer )
					end	
					--if source == carrobDeliver1 then
					setElementPosition ( player, -1416.8000488281, 2594.3000488281, 55.700000762939 )
					--elseif source == carrobDeliver2 then
					--	setElementPosition ( player, -389.3464, 2231.214, 42.43 )
					--end
				end
			end
		end
	end
end


local carrobped = createMarker ( -1420.8498535156, 2596.0402832031, 55.119110107422, "cylinder", 4, 125, 0, 0, 0 )
local kompliezegarage = createPed ( 305, -1416.3991699219, 2592.21875, 55.805374145508 )

function garagePed ( player )
	if player and isElement ( player ) and getElementType ( player ) == "player" then
		local rveh = getPedOccupiedVehicle ( player ) 
		if rveh == robcar then	
			 outputChatBox ( "Mechaniker: Schickes Auto hast du da angeschleppt, fahr es in die Garage.", player, 255, 255, 255 )
		else
			 outputChatBox ( "Mechaniker: Du bist der falsche Mann, ich warte auf jemand anderen also verzieh dich!", player, 255, 255, 255 )
			
		end
	end
end
addEventHandler ( "onMarkerHit", carrobped, garagePed )

function VehicleIsExplode ()	
	outputChatBox ( "Das gestohlene Fahrzeug ist zerstört worden!", getRootElement(), 255, 0, 0 )
	setTimer ( function()
		setGarageOpen ( 9, false )
		setGarageOpen ( 40, false )
		setGarageOpen ( 44, false )
	end, 10*60*1000, 1 )
	clearElementVisibleTo ( carrobDeliver1 )
	setElementVisibleTo (carrobDeliver1, root, false)
	--setElementVisibleTo (carrobDeliver2, root, false)
	clearElementVisibleTo ( robblip1 )
	setElementVisibleTo ( robblip1, root, false )
	--setElementVisibleTo ( robblip2, root, false )
	robcar = nil
	destroyElement ( marker )
	if isTimer ( carrobTimer ) then
		killTimer ( carrobTimer )
	end
	setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1)
end