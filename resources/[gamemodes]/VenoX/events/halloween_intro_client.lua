local camLookAtX, camLookAtY, halloweenCamPos
local HalloweenModels = {
 [1]=13,
 [2]=22,
 [3]=68,
 [4]=84,
 [5]=152,
 [6]=162,
 [7]=264
}

local zombiePositions = {}
	zombiePositions["x"] = {}
	zombiePositions["y"] = {}
	zombiePositions["z"] = {}

local i = 0
i = i + 1
zombiePositions["x"][i], zombiePositions["y"][i], zombiePositions["z"][i] = 913.24499511719, -1103.3891601563, 23.946100234985
i = i + 1
zombiePositions["x"][i], zombiePositions["y"][i], zombiePositions["z"][i] = 895.55462646484, -1106.3125, 23.149225234985
i = i + 1
zombiePositions["x"][i], zombiePositions["y"][i], zombiePositions["z"][i] = 869.08483886719, -1108.5260009766, 23.8812084198
i = i + 1
zombiePositions["x"][i], zombiePositions["y"][i], zombiePositions["z"][i] = 886.93902587891, -1097.1392822266, 23.879888534546
i = i + 1
zombiePositions["x"][i], zombiePositions["y"][i], zombiePositions["z"][i] = 905.06921386719, -1094.5563964844, 23.946100234985
i = i + 1
zombiePositions["x"][i], zombiePositions["y"][i], zombiePositions["z"][i] = 918.78948974609, -1097.4002685547, 23.954639434814
i = i + 1
zombiePositions["x"][i], zombiePositions["y"][i], zombiePositions["z"][i] = 919.36199951172, -1108.2281494141, 23.923425674438
i = i + 1
zombiePositions["x"][i], zombiePositions["y"][i], zombiePositions["z"][i] = 864.36004638672, -1099.8049316406, 23.946100234985
i = i + 1
zombiePositions["x"][i], zombiePositions["y"][i], zombiePositions["z"][i] = 848.19622802734, -1106.0549316406, 23.916841506958
i = i + 1
zombiePositions["x"][i], zombiePositions["y"][i], zombiePositions["z"][i] = 839.73645019531, -1099.0528564453, 23.916841506958
i = i + 1
zombiePositions["x"][i], zombiePositions["y"][i], zombiePositions["z"][i] = 835.41534423828, -1110.8784179688, 23.839847564697
i = i + 1
zombiePositions["x"][i], zombiePositions["y"][i], zombiePositions["z"][i] = 929.67938232422, -1110.2612304688, 23.850492477417
i = i + 1
zombiePositions["x"][i], zombiePositions["y"][i], zombiePositions["z"][i] = 930.51190185547, -1092.0285644531, 23.850492477417
i = i + 1
zombiePositions["x"][i], zombiePositions["y"][i], zombiePositions["z"][i] = 940.51928710938, -1104.5961914063, 23.850492477417
i = i + 1
zombiePositions["x"][i], zombiePositions["y"][i], zombiePositions["z"][i] = 935.65948486328, -1117.8385009766, 23.850492477417
i = i + 1
zombiePositions["x"][i], zombiePositions["y"][i], zombiePositions["z"][i] = 943.47680664063, -1089.142578125, 23.850492477417
i = i + 1
zombiePositions["x"][i], zombiePositions["y"][i], zombiePositions["z"][i] = 925.80029296875, -1080.3283691406, 23.850492477417
i = i + 1
zombiePositions["x"][i], zombiePositions["y"][i], zombiePositions["z"][i] = 894.421875, -1078.8986816406, 23.850492477417
local zombieSpawnPositions = i

local HalloweenZombiesOnLoadScreen = {}

function startHalloweenCamFlight ()

	guiSetEnabled ( damageImage, true )
	guiSetAlpha ( damageImage, 1 )
	loadHalloweenSkins ()
	setWeather ( 9 )
	setTime ( 1, 0 )
	camLookAtX, camLookAtY, camLookAtZ = 895.65313720703, -1101.6677246094, 24.171594619751
	halloweenCamPos = createObject ( 1337, 945.86889648438, -1103.2341308594, 29.125005722046 )
	setElementAlpha ( halloweenCamPos, 0 )
	moveObject ( halloweenCamPos, 20000, 822.66461181641, -1116.329345703, 29.125005722046 )
	
	setTimer ( turnHalloweenCamAroundA, 20000, 1 )
	setTimer ( churchBell, 3000, 12 )
	
	-- Spawn zombies --
	for i = 1, zombieSpawnPositions do
		local zombie = createPed ( HalloweenModels[math.random ( 1, 7 )], zombiePositions["x"][i], zombiePositions["y"][i], zombiePositions["z"][i] )
		setPedRotation ( zombie, math.random ( 1, 360 ) )
		setElementDimension ( zombie, getElementDimension ( lp ) )
		setElementParent ( zombie, halloweenCamPos )
		letZombieDoAnything ( zombie )
	end
	-- 				 --
	
	addEventHandler ( "onClientRender", getRootElement(), halloweenCamRender )
end

function churchBell ()

	if isElement ( halloweenCamPos ) then
		local sound = playSound ( "sounds/bell.ogg", false )
		setSoundVolume ( sound, 0.5 )
	end
end

function letZombieDoAnything ( ped )

	if isElement ( ped ) then
		setPedAnimation ( ped )
		setElementDimension ( ped, getElementDimension ( lp ) )
		local rnd = math.random ( 1, 4 )
		if rnd == 1 then
			setPedRotation ( ped, math.random ( 1, 360 ) )
			setPedAnimation ( ped, "ped", "run_old" )
			setTimer ( letZombieDoAnything, 2000, 1, ped )
		elseif rnd == 2 then
			setPedRotation ( ped, math.random ( 1, 360 ) )
			setPedAnimation ( ped, "PED", "Player_Sneak" )
			setTimer ( letZombieDoAnything, 2000, 1, ped )
		elseif rnd == 3 then
			-- Do nothing
			setTimer ( letZombieDoAnything, 3000, 1, ped )
		else
			setPedAnimation ( ped, "MEDIC", "cpr", -1, false, true, false, true )
			setTimer ( letZombieDoAnything, 4200, 1, ped )
		end
	end
end

function loadHalloweenSkins ()

	--[[local models = {
	 [13]=true,
	 [22]=true,
	 [68]=true,
	 [84]=true,
	 [152]=true,
	 [162]=true,
	 [264]=true
	}
	local skin
	for key, index in pairs ( models ) do
		skin = engineLoadTXD ( "models/"..key..".txd" )
		engineImportTXD ( skin, key )
	end]]
end

function unloadHalloweenSkins ()

	-- Unable
end

function stopHalloweenCamFlight ()

	destroyElement ( halloweenCamPos )
	guiSetEnabled ( damageImage, false )
	guiSetAlpha ( damageImage, 0 )
	unloadHalloweenSkins ()
	triggerServerEvent ( "resyncWeatherAndTimeFromHalloween", lp )
end

function resyncWeatherAndTimeFromHalloween ( weather, hours, minutes )

	setWeather ( weather )
	setTime ( hours, minutes )
end
addEvent ( "resyncWeatherAndTimeFromHalloween", true )
addEventHandler ( "resyncWeatherAndTimeFromHalloween", getRootElement (), resyncWeatherAndTimeFromHalloween )

function halloweenCamRender ()

	if isElement ( halloweenCamPos ) then
		setTime ( 1, 0 )
		if not ( getWeather == 9 ) then
			setWeather ( 9 )
		end
		local x1, y1, z1 = getElementPosition ( halloweenCamPos )
		local x2, y2, z2 = camLookAtX, camLookAtY, camLookAtZ
		setCameraMatrix ( x1, y1, z1, x2, y2, z2 )
	else
		removeEventHandler ( "onClientRender", getRootElement(), halloweenCamRender )
	end
end

function turnHalloweenCamAroundA ()

	if isElement ( halloweenCamPos ) then
		moveObject ( halloweenCamPos, 20000, 945.86889648438, -1103.2341308594, 29.125005722046 )
		setTimer ( turnHalloweenCamAroundB, 20000, 1 )
	end
end

function turnHalloweenCamAroundB ()

	if isElement ( halloweenCamPos ) then
		moveObject ( halloweenCamPos, 20000, 822.66461181641, -1116.329345703, 29.125005722046 )
		setTimer ( turnHalloweenCamAroundA, 20000, 1 )
	end
end

-- Michi --

function closeHalloweenGUI ( )

	destroyElement ( gWindow["halloweenMenue"] )
	showCursor ( false )
	setElementClicked ( false )

end

local gHalloweenButton = {}

function createHalloweenGUI ( )

	if isHalloween then
		if getElementClicked () then
			return
		end

		showCursor ( true )
		setElementClicked ( true )
		
		local x, y = guiGetScreenSize()
		local windowx = x/2 - 627/2
		local windowy = y/2 - 221/2
		
		gWindow["halloweenMenue"] = guiCreateWindow( windowx, windowy, 627, 221, "Halloween-Boni", false )
		gHalloweenButton[1] = guiCreateButton( 10, 25, 147, 65, "Suessigkeiten\nfuer 10 Kuerbisse", false, gWindow["halloweenMenue"] )
		gHalloweenButton[2] = guiCreateButton( 10, 95, 147, 65, "'Sensenmann' fuer 100 Kuerbisse", false, gWindow["halloweenMenue"] )
		gHalloweenButton[3] = guiCreateButton( 162, 25, 147, 65, "10.000$\nfuer 250 Kuerbisse", false, gWindow["halloweenMenue"] )
		gHalloweenButton[4] = guiCreateButton( 162, 95, 147, 65, "Kopflos-Munition\nfuer 150 Kuerbisse", false, gWindow["halloweenMenue"] )
		gHalloweenButton[5] = guiCreateButton( 314, 25, 147, 65, "Auto-Gutschein\nfuer 1200 Kuerbisse", false, gWindow["halloweenMenue"] )
		gHalloweenButton[6] = guiCreateButton( 314, 95, 147, 65, "Turismo\nfuer 2000 Kuerbisse", false, gWindow["halloweenMenue"] )
		gHalloweenButton[7] = guiCreateButton( 467, 25, 147, 65, "Hotring\nfuer 5000 Kuerbisse", false, gWindow["halloweenMenue"] )
		gHalloweenButton[8] = guiCreateButton( 467, 95, 147, 65, "Hausmarker\nfuer 10000 Kuerbisse", false, gWindow["halloweenMenue"] )
		gHalloweenButton[9] = guiCreateButton( (627/2-239/2), 160, 239, 48, "Abbrechen", false, gWindow["halloweenMenue"] )
		
		addEventHandler ( "onClientGUIClick", gHalloweenButton[9],
			function ( )
				closeHalloweenGUI ( )
			end, false )
			
		addEventHandler ( "onClientGUIClick", gHalloweenButton[1],
			function ( )
				closeHalloweenGUI ( )
				triggerServerEvent ( "buyEasterBonus", lp, "suess" )
			end, false )
			
		addEventHandler ( "onClientGUIClick", gHalloweenButton[2],
			function ( )
				closeHalloweenGUI ( )
				triggerServerEvent ( "buyEasterBonus", lp, "state" )
			end, false )
			
		addEventHandler ( "onClientGUIClick", gHalloweenButton[3],
			function ( )
				closeHalloweenGUI ( )
				triggerServerEvent ( "buyEasterBonus", lp, "dollar" )
			end, false )
			
		addEventHandler ( "onClientGUIClick", gHalloweenButton[4],
			function ( )
				closeHalloweenGUI ( )
				triggerServerEvent ( "buyEasterBonus", lp, "munni" )
			end, false )
			
		addEventHandler ( "onClientGUIClick", gHalloweenButton[5],
			function ( )
				closeHalloweenGUI ( )
				triggerServerEvent ( "buyEasterBonus", lp, "gutschein" )
			end, false )
			
		addEventHandler ( "onClientGUIClick", gHalloweenButton[6],
			function ( )
				closeHalloweenGUI ( )
				triggerServerEvent ( "buyEasterBonus", lp, "turismo" )
			end, false )
			
		addEventHandler ( "onClientGUIClick", gHalloweenButton[7],
			function ( )
				closeHalloweenGUI ( )
				triggerServerEvent ( "buyEasterBonus", lp, "ht b" )
			end, false )
			
		addEventHandler ( "onClientGUIClick", gHalloweenButton[8],
			function ( )
				closeHalloweenGUI ( )
				triggerServerEvent ( "buyEasterBonus", lp, "haus" )
			end, false )
	end
end

--addCommandHandler ( "halloween", createHalloweenGUI )