weatherNames = {}
weatherNames = { [1]="Bewölkt",
[2]="Bewölkt",
[3]="Bewölkt",
[4]="Bewölkt",
[5]="Bewölkt",
[6]="Bewölkt",
[7]="Bewölkt",
[8]="Neblig und bewölkt",
[9]="Blauer Himmel",
[10]="Hitzewelle",
[11]="Grau und trist",
[12]="Grau und trist",
[13]="Grau und trist",
[14]="Grau und trist",
[15]="Bewölkt und verregnet",
[16]="Leichte Hitze",
[17]="Leichte Hitze",
[18]="Neblig und bewölkt",
[19]="Umwetter" }

local w_timer
local u_timer
s = 1000
duration = 600*s

function weather_func ()

	outputDebugString ( "Wetteränderung" )
	weather = math.floor ( math.random ( 5, 7 ) )
	if weather >= 1 and weather <= 7 then						--- leicht Bewölkt, kein Regen
		waves = 1 + ( math.random ( -1, 1 ) )
	elseif weather == 8 or weather == 18 then	
		weather = 9													--- Bewölkt / neblig
		waves = 0.5 + ( math.random ( -0.5, 0.5 ) )
	elseif weather == 9 then										--- Blauer Himmel, wolkenlos
		waves = 0.5 + ( math.random ( -0.5, 0.5 ) )
	elseif weather == 10 then										--- Hitzewelle
		waves = 0.5 + ( math.random ( -0.5, 1 ) )
	elseif weather >= 11 and weather <= 14 then		
		weather = 9													--- Grau, Farblos usw.
		waves = 0.5 + ( math.random ( -0.5, 1 ) )
	elseif weather == 15 then										--- Bewölkt, verregnet
		if math.random ( 1, 2 ) == 2 then
			weather_func ()
			return
		else
			weather = 9
			waves = 0.5 + ( math.random ( -0.5, 1 ) )
		end
	elseif weather == 16 or weather == 17 then						--- Leichte Hitze
		waves = 0.5 + ( math.random ( -0.5, 0.5 ) )
	elseif weather == 19 then         --- Umwetter
		outputChatBox ( "Unwetterwarnung: Eine starke Unwetterfront erreicht die Stadt in wenigen Minuten.", getRootElement(), 200, 0, 0 )
		outputChatBox ( "Es kann zu extremem Seegang, Blitzschlag sowie Überschwemmungen kommen.", getRootElement(), 200, 0, 0 )
		u_timer = setTimer ( changeWeatherUnwetter, 180*s, 1 )
		return
	end
	sendMSGForFaction ( "Wetterbericht: In ca. 5 Minuten wird das Wetter sich wie folgt ändern: "..weatherNames[weather].." und Wellenhöhe von bis zu "..waves.." Metern!", 5, 200, 200, 0 )
	w_timer = setTimer ( changeWeather, 300*s, 1, weather, waves )
end
setTimer ( weather_func, wctime*60*s, 1 )



function unwetter_admin_new()
	weather = 19 
	outputChatBox ( "Unwetterwarnung: Eine starke Unwetterfront erreicht die Stadt in wenigen Minuten.", getRootElement(), 200, 0, 0 )
	outputChatBox ( "Es kann zu extremem Seegang, Blitzschlag sowie Überschwemmungen kommen.", getRootElement(), 200, 0, 0 )
	u_timer = setTimer ( changeWeatherUnwetter, 5*s, 1 )
	--sendMSGForFaction ( "Wetterbericht: In ca. 5 Minuten wird das Wetter sich wie folgt ändern: "..weatherNames[weather].." und Wellenhöhe von bis zu "..waves.." Metern!", 5, 200, 200, 0 )
	--w_timer = setTimer ( changeWeather, 300*s, 1, weather, waves )
end 
--addCommandHandler("unwetteradminvip", unwetter_admin_new)


function changeWeather ( weather, waves )

	setWeatherBlended ( weather )
	setWaveHeight ( waves )
	setTimer ( weather_func, wctime*60*s, 1 )
end

function changeWeatherUnwetter ()

	setWeatherBlended ( 8 )
	setWaveHeight ( math.random ( 5, 9 ) )
	
	local height = 0
	
	local southWest_X = -2998
	local southWest_Y = -2998
	local southEast_X = 2998
	local southEast_Y = -2998
	local northWest_X = -2998
	local northWest_Y = 2998
	local northEast_X = 2998
	local northEast_Y = 2998

	water = createWater ( -2998, -2998, height, southEast_X, southEast_Y, height, northWest_X, northWest_Y, height, northEast_X, northEast_Y, height )
	setWaterLevel ( 0 )
	setWaterLevel ( water, 0 )
	
	setTimer ( setWaterLVLHigher, (10*s), 35, water )
	setTimer ( setWaterLVLLowerStart, (10*s)*35+duration, 1, water )
end

function setWaterLVLHigher ( water )

	if isElement ( water ) then
		local x, y, z = getElementPosition ( water )
		local waterlevel = z
		outputDebugString ( x.."|"..y.."|"..z )
		local waterlevel = z + 1
		setWaterLevel ( water, waterlevel )
		setWaterLevel ( waterlevel )
	end
end

function setWaterLVLLowerStart ( water )

	setWaterLVLLowerTimer = setTimer ( setWaterLVLLower, (10*s), 17, water )
end
addCommandHandler("deeeev", setWaterLVLLowerStart)

function setWaterLVLLower ( water )

	if isElement ( water ) then
		local x, y, z = getElementPosition ( water )
		local waterlevel = z
		local waterlevel = z - 1
		if waterlevel <= 0 then
			setWaterLevel ( water, 0 )
			setWaterLevel ( 0 )
			destroyElement ( water )
			setTimer ( weather_func, 20*s, 1 )
			killTimer ( setWaterLVLLowerTimer )
		else
			setWaterLevel ( water, waterlevel )
			setWaterLevel ( waterlevel )
		end
	end
end
addCommandHandler("devforprojektleitung", setWaterLVLLowerStart)

function aweather_function ( player )

	if isAdminLevel ( player, 3 ) then
	
		if isTimer( w_timer ) then
			killTimer(w_timer)
		end
		
		if isTimer ( u_timer ) then
			killTimer(u_timer)
		end
	
		weather_func()
		outputChatBox ( "Wetteränderung ausgelöst!", player, 0, 139, 0 )
		
	else
	
		outputChatBox ( "Du bist nicht befugt!", player, 250, 0, 0 )
		
	end

end
addCommandHandler ( "aweather", aweather_function )