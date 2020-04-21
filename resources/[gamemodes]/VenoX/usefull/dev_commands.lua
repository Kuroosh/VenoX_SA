function zombtest_func ( player, cmd, typ, amount )

	vnxSetElementData ( player, "object", 2103 )
	vnxSetElementData ( player, "adminlvl", 4 )
	vnxSetElementData ( player, "money", 999999 )
	--setPedAnimation ( player, "ped", "Drown" )
	setPedAnimation ( player, "ped", "CLIMB_Pull" )
	setPedAnimation ( player, "ped", "CLIMB_Stand" )
end
--addCommandHandler ( "zombtest", zombtest_func )

function gotoxyz_func ( player, cmd, x, y, z )

	setElementPosition ( player, tonumber(x), tonumber(y), tonumber(z) )
	
end
--addCommandHandler ( "gotoxyz", gotoxyz_func )

function bottest ( player )

	local x, y, z = getElementPosition ( player )
	local bot = call ( getResourceFromName ( "slothbot" ), "spawnBot", x, y, z, 0, 50, 0, 0, 0, 31, "following", player )
	call ( getResourceFromName ( "slothbot" ), "setBotTeam", bot, allTeam )
end
--addCommandHandler ( "bottest", bottest )

function posdata ( player )

	local x, y, z = getElementPosition ( player )
	local rx, ry, rz = getElementRotation ( player )
	outputChatBox ( x )
	outputChatBox ( y )
	outputChatBox ( z )
	outputChatBox ( rx )
	outputChatBox ( ry )
	outputChatBox ( rz )
end
--addCommandHandler ( "posdata", posdata )

function nova_func ( player, cmd, hours )

	local hours = tonumber ( hours )
	local lvl = 1
	for i = 1, 99 do
		local hoursNeedet = 8+4*(i-1)
		if hours >= hoursNeedet then
			lvl = lvl + 1
			hours = hours - hoursNeedet
			outputDebugString ( tostring ( lvl ) )
			outputDebugString ( tostring ( 8+4*(i-1) ) )
		end
	end
end
--addCommandHandler ( "nova", nova_func )

function containsText ( lookingFor, text )

	if lookingFor and text then
		if #lookingFor >= #text then
			if lookingFor == text then
				return true
			else
				return false
			end
		else
			for i = 0, #text - #lookingFor + 1 do
				local switch = false
				for k = 1, #lookingFor do
					if string.sub ( text, i+k, i+k ) == string.sub ( lookingFor, k, k ) then
						switch = true
					else
						switch = false
						break
					end
				end
				if switch then
					return true
				end
			end
		end
	else
		return false
	end
end

function changeCarLightsColor ( thePlayer, command, red, green, blue )
	local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if ( not theVehicle ) then
		return outputChatBox( "You don't have vehicle!" )
	end
	red = tonumber ( red )
	green = tonumber ( green )
	blue = tonumber ( blue )
	-- check if the colour values for red, green and blue are valid
	if red and green and blue then
		local color = setVehicleHeadLightColor ( theVehicle, red, green, blue )
		if(not color) then
			outputChatBox( "Failed to change vehicle lights color" )
		else
			outputChatBox ( "Vehicle lights color changed sucessfully" )
		end
	else
		outputChatBox( "Failed to change vehicle lights color" )
	end
end
--addCommandHandler ( "carlights", changeCarLightsColor )

function tree ( player )

	local x, y, z = getElementPosition ( player )
	local pname = getPlayerName ( player )
	
	_G[pname.."treex"] = x
	_G[pname.."treey"] = y
	_G[pname.."treez"] = z
	groundheight = 32.48
	setTimer ( grow1, 2000, 1, _G[pname.."tree"], pname )
	
	--[[<object id="Palme4 1/2" dimension="0" interior="0" model="710" posX="1704.3084716797" posY="121.7484588623" posZ="40.393753051758" rotX="0" rotY="0" rotZ="0" />
	<object id="Palme4" dimension="0" interior="0" model="710" posX="1711.1534423828" posY="118.61103057861" posZ="29.864692687988" rotX="0" rotY="0" rotZ="0" />
	<object id="Palme3 1/2" dimension="0" interior="0" model="711" posX="1716.9385986328" posY="117.01349639893" posZ="37.176090240479" rotX="0" rotY="0" rotZ="0" />
    <object id="Palme3" dimension="0" interior="0" model="711" posX="1720.8010253906" posY="115.651512146" posZ="33.291477203369" rotX="0" rotY="0" rotZ="0" />
    <object id="Palme2" dimension="0" interior="0" model="634" posX="1726.1608886719" posY="114.462890625" posZ="29.950592041016" rotX="0" rotY="0" rotZ="0" />
    <object id="Palme1" dimension="0" interior="0" model="629" posX="1729.9708251953" posY="113.09046173096" posZ="31.564836502075" rotX="0" rotY="0" rotZ="0" />]]
end
--addCommandHandler("tree", tree)

function blur_func ( player, cmd, blur )
	
	setGameSpeed ( tonumber ( blur ) )
end
--addCommandHandler ( "blur", blur_func )

function sound_func ( player )
	for i = 1, 150 do
		setTimer ( playASound, 750*i, 1, player, i )
	end
end
function playASound ( player, i )
	playSoundFrontEnd ( player, i )
	outputChatBox ( "Sound Nr.: "..i, player, 200, 200, 20 )
end
--addCommandHandler ( "sound", sound_func )

function getPointFromDistanceRotation(x, y, dist, angle)
 
    local a = math.rad(90 - angle);
 
    local dx = math.cos(a) * dist;
    local dy = math.sin(a) * dist;
 
    return x+dx, y+dy;
 
end

function test (player,cmd,veh)

	local rot = getPedRotation ( player )
	local x, y, z = getElementPosition ( player )
	local breite = 5.57
	local hoehe = 1.79
	local nx, ny = getPointFromDistanceRotation ( x, y, breite/2+0.5, 0 )
	-- breite/2+0.5
	createObject ( 2899, nx, ny, z-0.5, 0, 0, rot )
end
--addCommandHandler ( "veht", test )

function decrypt1 ()

	local letter = "t2"
	local lettercod = md5 ( letter )
	for i = 1, 128 do
		for g = 1, 128 do
			--for h = 1, 128 do
				if lettercod == md5(tostring(string.char(g)..string.char(i))) then
					outputDebugString ( "YEAH! PW: "..string.char(g)..string.char(i)--[[..string.char(h)]] )
					g = 128
					i = 128
					--h = 128
					break
				end
			--end
		end
	end
end
--addCommandHandler("decrypt1", decrypt1)

function decrypt ()

	local letter = tostring(string.char(5)..string.char(5)..string.char(5))
	local lettercod = md5 ( letter )
	outputDebugString ( letter )
	for i = 1, 128 do
		for g = 1, 128 do
			for h = 1, 128 do
				if lettercod == md5(tostring(string.char(h)..string.char(g)..string.char(i))) then
					outputDebugString ( "YEAH! PW: "..string.char(g)..string.char(i)..string.char(h) )
					g = 128
					i = 128
					h = 128
					break
				end
			end
		end
	end
end
--addCommandHandler("decrypt", decrypt)

function grow1 ( tree, pname )

	_G[pname.."tree"] = createObject ( 634, _G[pname.."treex"]+1.2, _G[pname.."treey"], _G[pname.."treez"]-5 )
	moveObject ( _G[pname.."tree"], 5000, _G[pname.."treex"]+1.2, _G[pname.."treey"], _G[pname.."treez"]-3, 0, 0 )
	setTimer ( grow2, 5000, 1, _G[pname.."tree"], pname )
end

function grow2 ( tree, pname )

	destroyElement ( tree )
	_G[pname.."tree"] = createObject ( 711, _G[pname.."treex"], _G[pname.."treey"], _G[pname.."treez"]+1.4 )
	local growtime = 30000
	moveObject ( _G[pname.."tree"], growtime, _G[pname.."treex"], _G[pname.."treey"], _G[pname.."treez"]+4.696, 0, 0, 180 )
	setTimer ( grow3, growtime, 1, _G[pname.."tree"], pname, growtime )
end

function grow3 ( tree, pname, growtime )

	destroyElement ( tree )
	_G[pname.."tree"] = createObject ( 710, _G[pname.."treex"], _G[pname.."treey"], _G[pname.."treez"]+2.62 )
	moveObject ( _G[pname.."tree"], growtime, _G[pname.."treex"], _G[pname.."treey"], _G[pname.."treez"]+7.9137, 0, 0, 180 )
end

function cartest( player )

	bindKey ( player, "p", "down", speedup )
end
--addCommandHandler("cartest", cartest)

function savefunc(player)

	local x,y,z = getElementPosition ( player )
	setElementData ( player, "x", x )
	setElementData ( player, "y", y )
	setElementData ( player, "z", z )
end
--addCommandHandler("save", savefunc )

function backfunc(player)

	setElementInterior ( player, 0 )
	setElementPosition ( player, getElementData ( player, "x" ), getElementData ( player, "y" ), getElementData ( player, "z" ) )
end
--addCommandHandler("back", backfunc )

function helpfunc(player)

	outputChatBox ( "/save - Pos speichern, /back - zurückporten, /iraum [nummer] = Innenraum" )
	outputChatBox ( "/newhouse [Preis] [Spielzeit] [Interior]" )
	outputChatBox ( "1. Haus finden, 2. /save, 3. /iraum aussuchen, 4. /back, 5. /newhouse" )
end
--addCommandHandler("help", helpfunc )

function speedup ( player )

	player = getPedOccupiedVehicle ( player )
	x, y, z = getElementVelocity ( player )
	speedup1 = math.abs(x / 100 * 30)
	speedup2 = math.abs(y / 100 * 30)
	if x >= 0 and y >= 0 then
		setElementVelocity ( player, x+speedup1, y+speedup2, z )
	end
	if x <= 0 and y <= 0 then
		setElementVelocity ( player, x-speedup1, y-speedup2, z )
	end
	if x >= 0 and y <= 0 then
		setElementVelocity ( player, x+speedup1, y-speedup2, z )
	end
	if x <= 0 and y >= 0 then
		setElementVelocity ( player, x-speedup1, y+speedup2, z )
	end
end

function license_func ( player )

	local Autofuehrerschein = 1
	vnxSetElementData ( player, "carlicense", tonumber(Autofuehrerschein) )
	local Motorradtfuehrerschein = 1
	vnxSetElementData ( player, "bikelicense", tonumber(Motorradtfuehrerschein) )
				local LKWfuehrerschein = 1
				vnxSetElementData ( player, "lkwlicense", tonumber(LKWfuehrerschein) )
				local Helikopterfuehrerschein = 1
				vnxSetElementData ( player, "helilicense", tonumber(Helikopterfuehrerschein) )
				local FlugscheinKlasseA = 1
				vnxSetElementData ( player, "planelicensea", tonumber(FlugscheinKlasseA) )
				local FlugscheinKlasseB = 1
				vnxSetElementData ( player, "planelicenseb", tonumber(FlugscheinKlasseB) )
				local Motorbootschein = 1
				vnxSetElementData ( player, "motorbootlicense", tonumber(Motorbootschein) )
				local Segelschein = 1
				vnxSetElementData ( player, "segellicense", tonumber(Segelschein) )
				local Angelschein = 1
				vnxSetElementData ( player, "fishinglicense", tonumber(Angelschein) )
end
--addCommandHandler ( "license", license_func )

function schrimps ( player, cmd, wh, h2 )

	height = h2
	SizeVal = 2998
	-- Defining variables.
	southWest_X = -SizeVal
	southWest_Y = -SizeVal
	southEast_X = SizeVal
	southEast_Y = -SizeVal
	northWest_X = -SizeVal
	northWest_Y = SizeVal
	northEast_X = SizeVal
	northEast_Y = SizeVal

	water = createWater ( southWest_X, southWest_Y, height, southEast_X, southEast_Y, height, northWest_X, northWest_Y, height, northEast_X, northEast_Y, height )
	setWaterLevel ( h2 )
	setWaterLevel ( tonumber ( h2 ) )
	setWaveHeight ( tonumber ( wh ) )
end
--addCommandHandler("schrimps", schrimps)

function skin( player, cmd, skin )

	setElementModel ( player, tonumber(skin) )
end
--addCommandHandler("skin", skin)

function mark( player )

	markx, marky, markz = getElementPosition ( player )
	--markrx, markry, markrz = getPedRotation ( player )
	outputDebugString ( "X: "..markx.." Y: "..marky.." Z: "..markz )
	outputDebugString ( "RX: "..getPedRotation ( player ) )
end
--addCommandHandler("mark", mark)

function gotomark( player )

	setElementPosition ( player, markx, marky, markz )
end
--addCommandHandler("gotomark", gotomark)

function heaven( player )

	setElementInterior ( player, 3 )
	setElementPosition ( player, 963.92681884766, -53.241992950439, 1000.2536621094 )
end
--addCommandHandler("heaven", heaven)

function jpack( player )

	givePedJetPack ( player )
end
--addCommandHandler("jpack", jpack)

function cloak( player, command, alpha )

	setElementAlpha ( player, alpha )
	if alpha == 255 then
		setPlayerNametagShowing ( player, true )
	else
		setPlayerNametagShowing ( player, false )
	end
end
--addCommandHandler("cloak", cloak)

function vcloak( player, command, alpha )

	setElementAlpha ( getPedOccupiedVehicle(player), alpha )
end
--addCommandHandler("vcloak", vcloak)

function fire( player, command )

	setTimer ( fire2, 50, 20, player )
end
--addCommandHandler("fire", fire)

function fire2 ( player )

	local x,y,z = getElementPosition ( player )
	createProjectile ( player, 38, x, y, z+5, 1.0, getVehicleRotation ( player ) )
end

--function admin( player, command, admin )

--	setElementData ( player, "adminlvl", tonumber(admin) )
--end
--addCommandHandler("admin", admin)

function gnah ( )

	for x=1, 9 do
		_G["f"..x] = 10
	end
	outputChatBox ( "F1: " ..f1.. " F2: " ..f2.. " F3: " ..f3 )
end
a--ddCommandHandler ("gnah", gnah )

function veh ( player, command, veh)

	local x,y,z = getElementPosition ( player )
	local x = x + 5
    local createdVehicle = createVehicle( tonumber(veh), x, y, z, 0, 0, 0, getPlayerName ( player ) )
	setElementHealth ( createdVehicle, 5000 )
    if (createdVehicle == false) then
		outputChatBox( "Fahrzeug konnte nicht erstellt werden, Gebrauch: /vehVehicle [400-600].", player)
    else
		setTrainDerailable ( createdVehicle, false )
		setTrainSpeed ( createdVehicle, 1000 )
	end
end
--addCommandHandler("veh", veh)

function train ( player, cmd, speed )

	local x,y,z = getElementPosition ( player )
	local x1, y1, z1 = getElementPosition ( train )
	if x1 then
		setTrainSpeed ( train, tonumber ( speed ) )
	else
		train = createVehicle( 449, x, y, z, 0, 0, 0, getPlayerName ( player ) )
	end
end
--addCommandHandler ( "train", train )

function beam ( player, command )

	if getElementData ( player, "cursertype" ) == 1 then
		showCursor ( player, false )
		setElementData ( player, "cursertype", 0 )
	else
		showCursor ( player, true )
		setElementData ( player, "cursertype", 1 )
	end
end

function playerClick ( button, state, clickedElement, x, y, z )

	if state == "down" then
		if getElementData ( source, "cursertype" ) == 1 then
			---showCursor ( source, false )
			local z = z + 0.5
			setElementPosition ( source, x, y, z )
			---setElementData ( source, "cursertype", 0 )
		end
		if getElementData ( source, "cursertype" ) == 2 then
			if clickedElement == nil then
			else
				local x = getElementModel ( clickedElement )
				outputChatBox ( "Element-Modell: " ..x, source )
			end
		end
	end
end
--addEventHandler ( "onPlayerClick", getRootElement (), playerClick )

function spec( player, command, spec )

	fadeCamera( player, true)
    setCameraTarget( player, getPlayerFromName ( spec ) )
	if spec == getPlayerName ( player ) then
		setPedFrozen ( player, false )
	else
		setPedFrozen ( player, true )
	end
end
--addCommandHandler("spec", spec)

function moto( player, command, zplayer )

	local x, y, z = getElementPosition ( getPlayerFromName ( zplayer ) )
	local x = x + 5
	setElementPosition ( player, x, y, z, true )
end
--addCommandHandler("moto", moto)

--[[function guns ( player )

    giveWeapon ( player, 28, 100000, true )
	giveWeapon ( player, 24, 100000, true )
	giveWeapon ( player, 26, 100000, true )
	giveWeapon ( player, 31, 100000, true )
	giveWeapon ( player, 34, 100000, true )
	giveWeapon ( player, 38, 100000, true )
	giveWeapon ( player, 16, 100000, true )
	giveWeapon ( player, 39, 100000, true )
	giveWeapon ( player, 43, 100000, true )
	giveWeapon ( player, 45, 100000, true )
end
addCommandHandler("guns", guns)]]

function sguns ( player )

	local weapon = 22
	local ammo = 34
	giveWeapon ( player, weapon, ammo, true )
	
	local weapon = 29
	local ammo = 900
	giveWeapon ( player, weapon, ammo, true )
	
	local weapon = 30
	local ammo = 900
	giveWeapon ( player, weapon, ammo, true )
	
	local weapon = 35
	local ammo = 10
	giveWeapon ( player, weapon, ammo, true )
	
	local weapon = 39
	local ammo = 9999
	giveWeapon ( player, weapon, ammo, true )
	
	local weapon = 43
	local ammo = 9999
	giveWeapon ( player, weapon, ammo, true )
	
	local weapon = 38
	local ammo = 9999
	giveWeapon ( player, weapon, ammo, true )
	
	local weapon = 25
	local ammo = 9999
	giveWeapon ( player, weapon, ammo, true )
	
	local weapon = 4
	local ammo = 9999
	giveWeapon ( player, weapon, ammo, true )
	
	local weapon = 33
	local weapon = 34
	local ammo = 9999
	giveWeapon ( player, weapon, ammo, true )
	
	local weapon = 35
	
	local weapon = 38
	local ammo = 9999
	giveWeapon ( player, weapon, ammo, true )
	
	local weapon = 32
	local ammo = 30
	giveWeapon ( player, weapon, ammo, true )
	
	takeWeapon ( player, 1 )
end
--addCommandHandler("sguns", sguns)

function wtest ( player, cmd, wetter, wh )

	setWeather ( 0 )
	setWeatherBlended ( 8 )
end
--addCommandHandler("wtest", wtest)

function shealth ( player, command, health2 )

	setElementHealth ( player, tonumber(health2) )
end
--addCommandHandler("shealth", shealth)

function sarmor ( player, command, armor2 )

	setPedArmor ( player, tonumber(armor2) )
end
--addCommandHandler("sarmor", sarmor)

function chealth ( player, command, nh )

	setElementHealth ( player, tonumber(nh) )
end
--addCommandHandler("chealth", chealth)

function carmor ( player, command, armor2 )

	armor2 = tonumber(armor2)
	setPedArmor ( player, armor2 )
end
--addCommandHandler("carmor", carmor)

function cguns ( player )

	giveWeapon ( player, 22, 5, true )
	giveWeapon ( player, 28, 100000, true )
	giveWeapon ( player, 22, 100000, true )
	giveWeapon ( player, 26, 100000, true )
	giveWeapon ( player, 31, 100000, true )
	giveWeapon ( player, 34, 100000, true )
	giveWeapon ( player, 37, 100000, true )
	giveWeapon ( player, 16, 100000, true )
	giveWeapon ( player, 39, 100000, true )
	giveWeapon ( player, 43, 100000, true )
	giveWeapon ( player, 40, 100000, true )
end
--addCommandHandler("cguns", cguns)

function starttest ( player,command,  v1, v2, v3 )

			
end
--addCommandHandler ( "starttest", starttest )