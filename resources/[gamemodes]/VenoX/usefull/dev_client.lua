function atest_func ( player, cmd )

	local a1 = playSound ( "http://metafiles.gl-systemhaus.de/hr/youfm_2.m3u" )
	local a2 = playSound ( "asdadasd" )
	
	if not a1 then
		stopSound ( a1 )
	end
	if not a2 then
		stopSound ( a2 )
	end
	
	outputChatBox ( "playSound: "..tostring(a1)..", "..tostring(a2) )
end
--addCommandHandler ( "atest", atest_func )

function drawRCDistance ()

	dxDrawText ( "Funkreichweite:", screenwidth/2-100, screenheight-100-2 + 42, 200, 100, tocolor ( 0, 0, 0 ), .75, "bankgothic", "left", "top" )
	dxDrawText ( "Funkreichweite:", screenwidth/2-100+2, screenheight-100 + 42, 200, 100, tocolor ( 160, 160, 220 ), .75, "bankgothic", "left", "top" )
end

--[[addDist = {}
 addDist[3461] = 1

function startObjectDrop_func ( model )
	
	dropObjekt = createObject ( model, 0, 0, 0 )
	massDistance = getElementDistanceFromCentreOfMassToBaseOfModel ( dropObjekt )
	setElementCollisionsEnabled ( dropObjekt, false )
	outputChatBox ( "Distance: "..massDistance )
	addEventHandler ( "onClientRender", getRootElement(),
		function ()
			sx, sy, x, y, z = getCursorPosition ()
			local px, py, pz = getPedBonePosition ( lp, 6 )
			bool, nx, ny, nz, hit = processLineOfSight ( px, py, pz, x, y, z, true, true, false )
			nz = nz + 3
			bool, nx, ny, nz, hit = processLineOfSight ( nx, ny, nz, x, y, z, true, true, false )
			nz = nz + 3
			bool, nx, ny, nz, hit = processLineOfSight ( nx, ny, nz, x, y, z, true, true, false )
			if not bool then
				nx, ny, nz = x, y, z
			end
			if addDist[getElementModel ( dropObjekt )] then
				nz = nz + addDist[getElementModel ( dropObjekt )]
			end
			setElementPosition ( dropObjekt, nx, ny, nz + massDistance )
		end
	)
	addEventHandler ( "onClientClick", getRootElement(),
		function ()
			local x, y, z = getElementPosition ( dropObjekt )
			destroyElement ( dropObjekt )
			triggerServerEvent ( "finishObjectPlace", lp, x, y, z )
		end
	)
end
-- DEV --
addCommandHandler ( "drop", startObjectDrop_func )
-- DEV --
addEvent ( "startObjectDrop", true )
addEventHandler ( "startObjectDrop", getRootElement(), startObjectDrop_func )
]]
function water_func ( cmd, r, g, b, a)

	setWaterColor ( tonumber ( r ), tonumber ( g ), tonumber ( b ), tonumber ( a ) )
end
--addCommandHandler ( "water", water_func )

function ktest_func ()

	setElementPosition ( lp, 10, 0, 5 )
end
--addCommandHandler ( "ktest", ktest_func )

function gnarf_func ()

	setElementData ( lp, "test", not getElementData ( lp, "test" ) )
end
--addCommandHandler ( "gnarf", gnarf_func )

function campos ()

	camDriveI ()
	outputChatBox ( "Gsd" )
end
--addCommandHandler ( "camtest", campos )

function camDriveI ()

	speedfactor = getDistanceBetweenPoints3D ( -2681.7158203125, 1934.0498046875, 216.9231262207, -2682.2709960938, 1825.5369873047, 152.13279724121 ) / 1000
	loginCamDrive1 ()
end
--[[
Campos1, -2871.3120117188, 1004.6670532227, 798.84606933594
Camlookat1, -2771.1157226563, 1002.7713012695, 783.31921386719
Campos2, -2439.0822753906, 1106.50390625, 113.23735046387
Camlookat2, -2336.5017089844, 1071.3299560547, 65.994071960449
Campos3, -2322.4240722656, 1056.5222167969, 60.977352142334
Camlookat3, -2241.2734375, 1065.2810058594, 58.689472198486
Campos4, -2241.1882324219, 1065.2863769531, 58.708957672119
Camlookat4, -2187.2465820313, 1089.5546875, 57.733261108398
Campos5, -2192.537109375, 1087.4829101563, 56.025562286377
Camlookat5, -2104.1884765625, 1042.4140625, 56.937641143799
Campos6, -2123.4851074219, 1055.3798828125, 58.733810424805
Camlookat6, -2091.4501953125, 1055.3826904297, 59.719539642334
Campos7, -1992.3912353516, 1043.1374511719, 67.657035827637
Lookat7, -1948.140625, 1104.7061767578, 67.635696411133
Campos8, -1948.140625, 1104.7061767578, 67.635696411133
Lookat8, -1988.2930908203, 1117.2947998047, 61.296997070313
]]

function bottest_func ( ped )

	setTimer ( setPedControlState, 200, 1, ped, "enter_exit", true )
	setTimer ( setPedControlState, 700, 1, ped, "enter_exit", false )
end
addEvent ( "bottest", true )
addEventHandler ( "bottest", getRootElement(), bottest_func )

function loginCamDrive1 () -- 1 & 2

	local x1, y1, z1 = -2871.3120117188, 1004.6670532227, 798.84606933594
	local x2, y2, z2 = -2439.0822753906, 1106.50390625, 113.23735046387
	local x1t, y1t, z1t = -2771.1157226563, 1002.7713012695, 783.31921386719
	local x2t, y2t, z2t = -2336.5017089844, 1071.3299560547, 65.994071960449
	local time = getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) / speedfactor

	smoothMoveCamera ( x1, y1, z1, x1t, y1t, z1t, x2, y2, z2, x2t, y2t, z2t, time )
	setTimer ( loginCamDrive2, time + 5, 1 )
end

function loginCamDrive2 () -- 2 & 3

	speedfactor = getDistanceBetweenPoints3D ( -2681.7158203125, 1934.0498046875, 216.9231262207, -2682.2709960938, 1825.5369873047, 152.13279724121 ) / 3000
	
	local x1, y1, z1 = -2439.0822753906, 1106.50390625, 113.23735046387
	local x2, y2, z2 = -2322.4240722656, 1056.5222167969, 60.977352142334
	local x1t, y1t, z1t = -2336.5017089844, 1071.3299560547, 65.994071960449
	local x2t, y2t, z2t = -2241.2734375, 1065.2810058594, 58.689472198486
	local time = getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) / speedfactor

	smoothMoveCamera ( x1, y1, z1, x1t, y1t, z1t, x2, y2, z2, x2t, y2t, z2t, time )
	setTimer ( loginCamDrive3, time + 5, 1 )
end

function loginCamDrive3 () -- 3 & 4

	speedfactor = getDistanceBetweenPoints3D ( -2681.7158203125, 1934.0498046875, 216.9231262207, -2682.2709960938, 1825.5369873047, 152.13279724121 ) / 5000

	local x1, y1, z1 = -2322.4240722656, 1056.5222167969, 60.977352142334
	local x2, y2, z2 = -2241.1882324219, 1065.2863769531, 58.708957672119
	local x1t, y1t, z1t = -2241.2734375, 1065.2810058594, 58.689472198486
	local x2t, y2t, z2t = -2187.2465820313, 1089.5546875, 57.733261108398
	local time = getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) / speedfactor

	smoothMoveCamera ( x1, y1, z1, x1t, y1t, z1t, x2, y2, z2, x2t, y2t, z2t, time )
	setTimer ( loginCamDrive4, time + 5, 1 )
end

function loginCamDrive4 () -- 4 & 5

	speedfactor = getDistanceBetweenPoints3D ( -2681.7158203125, 1934.0498046875, 216.9231262207, -2682.2709960938, 1825.5369873047, 152.13279724121 ) / 7500
	
	local x1, y1, z1 = -2241.1882324219, 1065.2863769531, 58.708957672119
	local x2, y2, z2 = -2192.537109375, 1087.4829101563, 56.025562286377
	local x1t, y1t, z1t = -2187.2465820313, 1089.5546875, 57.733261108398
	local x2t, y2t, z2t = -2104.1884765625, 1042.4140625, 56.937641143799
	local time = getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) / speedfactor

	smoothMoveCamera ( x1, y1, z1, x1t, y1t, z1t, x2, y2, z2, x2t, y2t, z2t, time )
	setTimer ( loginCamDrive5, time + 5, 1 )
end

function loginCamDrive5 () -- 5 & 6

	local x1, y1, z1 = -2192.537109375, 1087.4829101563, 56.025562286377
	local x2, y2, z2 = -2123.4851074219, 1055.3798828125, 58.733810424805
	local x1t, y1t, z1t = -2104.1884765625, 1042.4140625, 56.937641143799
	local x2t, y2t, z2t = -2091.4501953125, 1055.3826904297, 59.719539642334
	local time = getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) / speedfactor

	smoothMoveCamera ( x1, y1, z1, x1t, y1t, z1t, x2, y2, z2, x2t, y2t, z2t, time )
	setTimer ( loginCamDrive6, time + 5, 1 )
end

function loginCamDrive6 () -- 6 & 7

	local x1, y1, z1 = -2123.4851074219, 1055.3798828125, 58.733810424805
	local x2, y2, z2 = -1992.3912353516, 1043.1374511719, 67.657035827637
	local x1t, y1t, z1t = -2091.4501953125, 1055.3826904297, 59.719539642334
	local x2t, y2t, z2t = -1948.140625, 1104.7061767578, 67.635696411133
	local time = getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) / speedfactor

	smoothMoveCamera ( x1, y1, z1, x1t, y1t, z1t, x2, y2, z2, x2t, y2t, z2t, time )
	setTimer ( loginCamDrive7, time + 5, 1 )
end

function loginCamDrive7 () -- 7 & 8

	local x1, y1, z1 = -1992.3912353516, 1043.1374511719, 67.657035827637
	local x2, y2, z2 = -1948.140625, 1104.7061767578, 67.635696411133
	local x1t, y1t, z1t = -1948.140625, 1104.7061767578, 67.635696411133
	local x2t, y2t, z2t = -1988.2930908203, 1117.2947998047, 61.296997070313
	local time = getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) / speedfactor

	smoothMoveCamera ( x1, y1, z1, x1t, y1t, z1t, x2, y2, z2, x2t, y2t, z2t, time )
	setTimer ( loginCamDrive8, time + 5, 1 )
end

function smoothMoveCamera ( x1, y1, z1, x1t, y1t, z1t, x2, y2, z2, x2t, y2t, z2t, time )

	object1 = createObject ( 1337, x1, y1, z1 )
	object2 = createObject ( 1337, x1t, y1t, z1t )
	setElementAlpha ( object1, 0 )
	setElementAlpha ( object2, 0 )
	moveObject ( object1, time, x2, y2, z2 )
	moveObject ( object2, time, x2t, y2t, z2t )
	
	addEventHandler ( "onClientRender", getRootElement(), camRender )
	setTimer ( removeCamHandler, time, 1 )
	setTimer ( destroyElement, time, 1, object1 )
	setTimer ( destroyElement, time, 1, object2 )
end

function removeCamHandler ()

	removeEventHandler ( "onClientRender", getRootElement(), camRender )
end

function camRender ()

	local x1, y1, z1 = getElementPosition ( object1 )
	local x2, y2, z2 = getElementPosition ( object2 )
	setCameraMatrix ( x1, y1, z1, x2, y2, z2 )
end

--[[
function loginCamDrive1 ()

	local x1, y1, z1 = -2681.7158203125, 1934.0498046875, 216.9231262207
	local x2, y2, z2 = -2682.2709960938, 1825.5369873047, 152.13279724121
	local x1t, y1t, z1t = -2681.8959960938, 1834.5554199219, 204.25393676758
	local x2t, y2t, z2t = -2682.4833984375, 1726.5500488281, 140.3770904541
	local time = 10000
	
	smoothMoveCamera ( x1, y1, z1, x1t, y1t, z1t, x2, y2, z2, x2t, y2t, z2t, time )
end

function loginCamDrive2 ()

	local x1, y1, z1 = -2682.2709960938, 1825.5369873047, 152.13279724121
	local x2, y2, z2 = -2681.6276855469, 1495.1013183594, 99.998870849609
	local x1t, y1t, z1t = -2682.4833984375, 1726.5500488281, 140.3770904541
	local x2t, y2t, z2t = -2682.4833984375, 1726.5500488281, 140.3770904541
	local time = 10000
	
	smoothMoveCamera ( x1, y1, z1, x1t, y1t, z1t, x2, y2, z2, x2t, y2t, z2t, time )
end

function loginCamDrive3 ()

	local x1, y1, z1 = -2681.6276855469, 1495.1013183594, 99.998870849609
	local x2, y2, z2 = -2681.6447753906, 1422.8494873047, 67.56616973877
	local x1t, y1t, z1t = -2682.4833984375, 1726.5500488281, 140.3770904541
	local x2t, y2t, z2t = -2681.5173339844, 1352.2436523438, 66.19132232666
	local time = 10000
	
	smoothMoveCamera ( x1, y1, z1, x1t, y1t, z1t, x2, y2, z2, x2t, y2t, z2t, time )
end

function loginCamDrive4 ()

	local x1, y1, z1 = 
	local x2, y2, z2 = 
	local x1t, y1t, z1t = 
	local x2t, y2t, z2t = 
	local time = 10000
	
	smoothMoveCamera ( x1, y1, z1, x1t, y1t, z1t, x2, y2, z2, x2t, y2t, z2t, time )
end

<object id="CamPos2, -2681.5969238281, 1352.4329833984, 66.102478027344
<object id="CamPos3, -2677.0629882813, 1280.9547119141, 55.078914642334
<object id="Lookat2, -2681.9111328125, 1284.7982177734, 65.775436401367
<object id="CamLookat3, -2677.0966796875, 1274.1221923828, 55.078914642334
<object id="CamPos4, -2675.7912597656, 1256.5955810547, 60.578914642334
<object id="Lookat4, -2673.6479492188, 1240.4858398438, 64.828918457031" rotX="0" rotY="6" rotZ="356" />

Lookat5, -2686.6267089844, 1141.2766113281, 63.080780029297
CamPos5, -2685.2058105469, 1150.4683837891, 56.187694549561
Lookat6, -2637.2495117188, 1173.5991210938, 40.164852142334
Pos6, -2657.6184082031, 1153.2390136719, 37.9225730896]]