-------------------------
------- (c) 2010 --------
------- by Zipper -------
-- and Vio MTA:RL Crew --
-------------------------

evelse = { [594]=true }
trailers = { [606]=true,  [607]=true, [610]=true, [590]=true, [569]=true, [611]=true, [584]=true, [608]=true, [435]=true, [450]=true, [591]=true}
rc_vehs = { [411]=true, [464]=true, [501]=true, [465]=true, [564]=true }
trains = { [537]=true, [538]=true, [569]=true, [590]=true, [537]=true, [449]=true, }
cars = { [579]=true, [400]=true, [404]=true, [489]=true, [505]=true, [479]=true, [442]=true, [458]=true, [429]=true, [411]=true, [559]=true, [541]=true, [415]=true, [561]=true, [480]=true, [560]=true, [562]=true, [506]=true, [565]=true, 
[451]=true, [434]=true, [558]=true, [555]=true, [477]=true, [503]=true, [502]=true, [494]=true, [434]=true, [565]=true, [568]=true, [557]=true, [424]=true, [504]=true, [495]=true, [539]=true, [483]=true, [508]=true, [500]=true,  [444]=true,
[556]=true, [536]=true, [575]=true, [534]=true, [567]=true, [535]=true, [576]=true, [412]=true, [459]=true, [422]=true, [482]=true, [605]=true, [530]=true, [418]=true, [582]=true, [413]=true, [440]=true, [543]=true, [583]=true, [478]=true,
[554]=true, [602]=true, [496]=true, [401]=true, [518]=true, [527]=true, [589]=true, [419]=true, [533]=true, [526]=true, [474]=true, [545]=true, [517]=true, [410]=true, [600]=true, [436]=true, [580]=true, [439]=true, [549]=true, [491]=true,
[445]=true, [604]=true, [507]=true, [585]=true, [466]=true, [492]=true, [546]=true, [551]=true, [516]=true, [467]=true, [426]=true, [547]=true, [405]=true, [409]=true, [550]=true, [566]=true, [540]=true, [421]=true, [529]=true, [485]=true,
[438]=true, [574]=true, [420]=true, [525]=true, [552]=true, [416]=true, [596]=true, [597]=true, [499]=true, [428]=true, [598]=true, [470]=true, [528]=true, [590]=true }

lkws = { [499]=true, [609]=true, [498]=true, [524]=true, [532]=true, [578]=true, [486]=true, [406]=true, [573]=true, [455]=true, [588]=true, [403]=true, [514]=true, [423]=true, [414]=true, [443]=true, [515]=true, [531]=true, [456]=true,
[433]=true, [427]=true, [407]=true, [544]=true, [432]=true, [431]=true, [437]=true, [408]=true, }

motorboats = { [472]=true, [473]=true, [493]=true, [595]=true, [430]=true, [453]=true, [452]=true, [446]=true }
bikes = { [471]=true, [523]=true, [581]=true, [521]=true, [463]=true, [522]=true, [461]=true, [468]=true, [586]=true }
raftboats = { [484]=true, [454]=true }
helicopters = { [548]=true, [425]=true, [417]=true, [487]=true, [488]=true, [497]=true, [563]=true, [447]=true, [469]=true }
planetypa = { [512]=true, [593]=true, [476]=true, [460]=true, [513]=true }
planetypb = { [592]=true, [577]=true, [511]=true, [520]=true, [553]=true, [519]=true }
nolicense = { [457]=true, [539]=true, [571]=true, [572]=true, [509]=true, [481]=true, [462]=true, [510]=true, [448]=true }


c_EnableScaling = false

c_XOffset = 0
c_YOffset = 0
c_ImageW = 221
c_ImageH = 211
c_BarW = 50
c_BarH = 10
c_BarYOffset = 70

c_FireTimeMs = 5000
c_BarAlpha = 120
c_BarFlashInterval = 300

g_tFireStart = nil

multiply = 1.35

KMDistance = 0
maxDistanceKilometer = 999999

local white = tocolor ( 255, 255, 255, 255 )

function getKmhBySpeed ( speed )
	return speed/218.77
end

function getDrehzahl( veh )
	local vx, vy, vz = getElementVelocity ( veh )
	if not getVehicleEngineState ( veh ) then
		return 0
	elseif vx then
		this = getVehicleHandling ( veh )
		local speed = math.floor ( math.sqrt(vx^2 + vy^2 + vz^2)*214 )
		if speed < 35 then
			return speed/35
		elseif speed < 70 then
			return (speed-35)/35
		elseif speed < 125 then
			return (speed-70)/55
		elseif speed < 170 then
			return (speed-125)/45
		elseif speed < 220 then
			return (speed-170)/50
		elseif speed < 300 then
			return (300-220)/80
		else
			return (300-220)/80
		end
	end
end

function drawNeedle()
    if not isPedInVehicle(lp) then
        hideSpeedometer()
    end
    local vehSpeed = getVehicleSpeed()
	local veh = getPedOccupiedVehicle(lp)
	if veh then
		
		local hour, minute = getTime ()
		if hour >= 20 or hour <= 8 then
			if hour >= 20 then
				hour = 4 - ( 24 - hour )
			elseif hour <= 8 then
				hour = 4 - ( hour / 2 )
			end
			local alpha = math.floor ( hour * 63.75 )
			--dxDrawImage ( g_screenWidth - g_ImageW - g_XOffset,	g_screenHeight - g_ImageH - g_YOffset, g_ImageW, g_ImageH, "images/disc_night.bmp", 0, 0, 0, tocolor ( 255, 255, 255, alpha ), true )
		end
		nh = (g_screenHeight - g_ImageH - g_YOffset) - 5
		nw = (g_screenWidth - g_ImageW - g_XOffset) + 2
		n2h = (g_screenHeight - g_ImageH - g_YOffset) - 3
		n2w = (g_screenWidth - g_ImageW - g_XOffset) + 81
		lh = (g_screenHeight - g_ImageH - g_YOffset) + 175
		
		local lights = getVehicleOverrideLights ( veh )
		if lights then
			if lights == 2 then
				dxDrawImage( g_screenWidth - g_ImageW - g_XOffset + 52 / 2 / 2 + 10 + 85, g_screenHeight - g_ImageH + 89 + 39 / 2, 52/2, 39/2, "images/lights.png", 0, 0, 0, white, true)
			end
		end
		if getVehicleEngineState ( veh ) then
			dxDrawImage ( math.floor ( g_screenWidth - g_ImageW - g_XOffset - 52 / 2 / 2 - 10 + 85 ), math.floor ( g_screenHeight - g_ImageH + 89 + 39 / 2 ), math.floor ( 52/2 ), math.floor ( 39/2 ), "images/engine.png", 0, 0, 0, white, true )
		--else
			--dxDrawImage ( math.floor ( g_screenWidth - g_ImageW - g_XOffset - 52 / 2 / 2 - 10 + 85 ), math.floor ( g_screenHeight - g_ImageH + 89 + 39 / 2 ), math.floor ( 52/2 ), math.floor ( 39/2 ), "images/engineoff.png", 0, 0, 0, white, true )
		end
		
		lhz = math.abs(20/2)
		lwz = math.abs(8)
		lts = math.abs(25/2)
		ltg = math.abs(60)
		
		l1x = (g_screenWidth - g_ImageW - g_XOffset) + ltg
		l2x = (g_screenWidth - g_ImageW - g_XOffset) + lts + ltg
		l3x = (g_screenWidth - g_ImageW - g_XOffset) + lts*2 + ltg
		l4x = (g_screenWidth - g_ImageW - g_XOffset) + lts*3 + ltg
		l5x = (g_screenWidth - g_ImageW - g_XOffset) + lts*4 + ltg
		l6x = (g_screenWidth - g_ImageW - g_XOffset) + lts*5 + ltg
		
		
		NR1, NR2, NR3, NR4, NR5, NR6 = getVehicleTraveledDistance ( veh )
		
		dxDrawImage(l1x-3, lh-3, l6x+3-(l1x-3)+lhz, lwz+6, "images/numbers/empty.png", 0, 0, 0, white, true)
		dxDrawImage(l1x, lh, lhz, lwz, "images/numbers/"..NR1..".png", 0, 0, 0, white, true)
		dxDrawImage(l2x, lh, lhz, lwz, "images/numbers/"..NR2..".png", 0, 0, 0, white, true)
		dxDrawImage(l3x, lh, lhz, lwz, "images/numbers/"..NR3..".png", 0, 0, 0, white, true)
		dxDrawImage(l4x, lh, lhz, lwz, "images/numbers/"..NR4..".png", 0, 0, 0, white, true)
		dxDrawImage(l5x, lh, lhz, lwz, "images/numbers/"..NR5..".png", 0, 0, 0, white, true)
		dxDrawImage(l6x, lh, lhz, lwz, "images/numbers/"..NR6..".png", 0, 0, 0, white, true)
		dxDrawImage(l6x-3, lh+lwz-1, 4, 4, "images/reddot.png", 0, 0, 0, white, true)
		
		vehFuel = getElementData ( veh, "fuelstate" )
		if not vehFuel then
			setElementData ( veh, "fuelstate", 100 )
			vehFuel = 100
		end
		if vehFuel and nh and nw and n2h and n2w then
			vehFuel = vehFuel*1.85
			dxDrawImage(nw, nh, g_ImageW/2, g_ImageH/2, "images/needle.png", vehFuel+13, 0, 0, white, true)
		end
		local drehzahl = getDrehzahl( veh )
		if drehzahl then
			--dxDrawImage(n2w, n2h, g_ImageW/3*2, g_ImageH/3*2, "images/needle.png", 78+172*drehzahl, 0, 0, white, true)
		end
		
		dxDrawImage(needlX, needlY, g_ImageW, g_ImageH, "images/needle.png", vehSpeed-3, 0, 0, white, true)
	end
end

function getPedOccupiedVehicleSeat ( player )

	local veh = getPedOccupiedVehicle ( player )
	if veh then
		for i = 0, getVehicleMaxPassengers ( veh ) do
			if getVehicleOccupant ( veh, i ) == player then
				return i
			end
		end
	else
		return false
	end
end

function showSpeedometer()
	--if getPedOccupiedVehicleSeat ( lp ) == 0 then
		guiSetVisible(disc, true)
		local x1, y1, z1 = getElementPosition ( getPedOccupiedVehicle ( lp ) )
		refreshVehDistance_client ()
		getDistanceTraveled ( getPedOccupiedVehicle ( lp ), x1, y1, z1 )
		addEventHandler("onClientRender", root, drawNeedle)
	--end
end
addEvent( "showSpeedometer", true )
addEventHandler( "showSpeedometer", getRootElement(), showSpeedometer )

function hideSpeedometer()
    guiSetVisible( disc, false)
	removeEventHandler("onClientRender", root, drawNeedle)
end
addEvent( "hideSpeedometer", true )
addEventHandler( "hideSpeedometer", getRootElement(), hideSpeedometer )

function getVehicleSpeed()
    if isPedInVehicle(lp) then
        local vx, vy, vz = getElementVelocity(getPedOccupiedVehicle(lp))
        return math.sqrt(vx^2 + vy^2 + vz^2) * 161 * multiply
    end
    return 0
end

addEventHandler("onClientVehicleEnter", root,
	function(player, seat)
		if not trailers[getElementModel ( source )] and getElementModel ( source ) ~= 438 then
			if (player == lp) then
				if (seat == 0) then
					showSpeedometer()
				elseif seat > 0 and seat < 4 then
					setTimer ( showSpeedometer, 1000, 1 )
				end
			end
		end
	end
)

addEventHandler("onClientVehicleStartExit", root,
	function(thePlayer)
		if thePlayer == lp then
			hideSpeedometer()
			KMDistance = 0
		end
	end
)

function round(num)
    return math.floor(num + 0.5)
end

function initGui()
    if disc then
        destroyElement(disc)
    end
    g_screenWidth, g_screenHeight = guiGetScreenSize()
    local scale
    if c_EnableScaling then
        scale = (g_screenWidth/1152 + g_screenHeight/864)/2
    else
        scale = 1
    end
    g_XOffset = round(c_XOffset*scale)
    g_YOffset = round(c_YOffset*scale)
    g_ImageW = round(c_ImageW*scale)
    g_ImageH = round(c_ImageH*scale)
    g_BarW = round(c_BarW*scale)
    g_BarH = round(c_BarH*scale)
    g_BarYOffset = round(c_BarYOffset*scale)
    disc = guiCreateStaticImage(g_screenWidth - g_ImageW - g_XOffset, g_screenHeight - g_ImageH - g_YOffset, g_ImageW, g_ImageH, "images/disc.png", false)
	x, y = guiGetPosition(disc, false)
	y = y + 40
	x = x - 15
	
	needlX = x
	needlY = y
end

addEventHandler("onClientResourceStart", resourceRoot,
	function ()
        initGui()
        guiSetVisible(disc, false)
        setTimer(function()
            local w, h = guiGetScreenSize()
            if (w ~= g_screenWidth) or (h ~= g_screenHeight) then
                initGui()
            end
        end, 500, 0)
		if isPedInVehicle(lp) then
			showSpeedometer()
		end
	end
)

function VehEject_func ()

	removePedFromVehicle ( lp )
end
addEvent ("VehEject", true )
addEventHandler ("VehEject", getRootElement(), VehEject_func )

function refreshVehDistance_client ()

	veh = getPedOccupiedVehicle ( lp )
	if veh then
		if getPedOccupiedVehicleSeat ( lp ) == 0 then
			if not getElementData ( veh, "distance" ) then
			else
				triggerServerEvent ( "refreshVehDistance", getRootElement(), veh, KMDistance + getElementData ( veh, "distance" ) )
				KMDistance = 0
				setTimer ( refreshVehDistance_client, 60000, 1 )
			end
		end
	end
end

function getDistanceTraveled ( veh, x1, y1, z1 )

	local veh = getPedOccupiedVehicle ( lp )
	if veh then
		if getPedOccupiedVehicleSeat ( lp ) == 0 then
			local x2, y2, z2 = getElementPosition ( veh )
			local nd = getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) / 100
			KMDistance = KMDistance + nd
			setTimer ( getDistanceTraveled, 500, 1, veh, x2, y2, z2 )
		end
	end
end

function getVehicleTraveledDistance ( veh )

	local dis = getElementData ( veh, "distance" )
	if not dis then
		setElementData ( veh, "distance", 0 )
	end
	if dis then
		distance = math.floor ( dis ) + math.floor ( KMDistance )
		if distance > maxDistanceKilometer then
			setElementData ( veh, "distance", 0, true )
		end
		minus = math.abs ( ( # ( tostring ( distance ) ) ) - 6 )
		for i = 1, 6 do
			_G["v"..i] = 0
		end
		counter = 0
		while counter < 10 do 
			i = # ( tostring ( distance ) ) - 1
			z = math.floor ( distance / ( 10 ^ ( i ) ) )
			distance = distance - z * ( 10 ^ ( i ) )
			counter = counter + 1
			_G["v"..(counter+minus)] = z
		end
		return v1, v2, v3, v4, v5, v6
	end
end