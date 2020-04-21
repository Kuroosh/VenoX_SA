function stripperAnimations ()

	nuttedance1 = createPed ( 138, -2670.4604492188, 1410.4173583984, 907.21954345703 )
	nuttedance2 = createPed ( 214, -2677.5344238281, 1402.2591552734, 907.2195 )
	nuttedance3 = createPed ( 87, -2677.9592285156, 1416.2357177734, 907.212 )
	nuttedance4 = createPed ( 244, -2670.9343261719, 1427.6400146484, 906.3 )
	
	nuttedance5 = createPed ( 214, 1214.455078125, -4.5791082382202, 1000.977355957 )
	nuttedance6 = createPed ( 87, 1208.2216796875, -6.2964754104614, 1000.977355957 )
	nuttedance7 = createPed ( 244, 1221.2036132813, 8.4139709472656, 1000.9848632813 )
	setPedRotation ( nuttedance7, 270 - 45 )
	
	setElementInterior ( nuttedance1, 3 )
	setElementInterior ( nuttedance2, 3 )
	setElementInterior ( nuttedance3, 3 )
	setElementInterior ( nuttedance4, 3 )
	setElementInterior ( nuttedance5, 2 )
	setElementInterior ( nuttedance6, 2 )
	setElementInterior ( nuttedance7, 2 )

	setPedRotation ( nuttedance1, 0-90 )
	setPedRotation ( nuttedance2, 0-90 )
	setPedRotation ( nuttedance3, 37.5-90 )
	setPedRotation ( nuttedance4, 270-90 )
	
	for i = 1, 7 do
		local x, y, z = getElementPosition ( _G["nuttedance"..i] )

		vnxSetElementData ( _G["nuttedance"..i], "sx", x )
		vnxSetElementData ( _G["nuttedance"..i], "sy", y )
		vnxSetElementData ( _G["nuttedance"..i], "sz", z )
		vnxSetElementData ( _G["nuttedance"..i], "dim", 0 )
		if i <= 4 then
			vnxSetElementData ( _G["nuttedance"..i], "int", 3 )
		else
			vnxSetElementData ( _G["nuttedance"..i], "int", 2 )
		end
		vnxSetElementData ( _G["nuttedance"..i], "rot", getPedRotation ( _G["nuttedance"..i] ) )
		vnxSetElementData ( _G["nuttedance"..i], "botname", "nuttedance"..i )
	end

	setTimer ( stripperAnimationsStart, 10000, 1 )
end
setTimer ( stripperAnimations, 1000, 1 )

function stripperAnimationsStart ()

	setPedAnimation ( nuttedance1, "STRIP", "STR_Loop_A",-1,true,false,false )
	setPedAnimation ( nuttedance2, "STRIP", "STR_Loop_B",-1,true,false,false )
	setPedAnimation ( nuttedance3, "STRIP", "STR_Loop_C",-1,true,false,false )
	setPedAnimation ( nuttedance4, "STRIP", "STR_Loop_A",-1,true,false,false )
	setPedAnimation ( nuttedance5, "STRIP", "STR_Loop_A",-1,true,false,false )
	setPedAnimation ( nuttedance6, "STRIP", "STR_Loop_B",-1,true,false,false )
	setPedAnimation ( nuttedance7, "STRIP", "STR_Loop_C",-1,true,false,false )
	setTimer ( changeDance, 10000, 0 )
end

function changeDance ()
	
	setPedAnimation ( nuttedance1 )
	setPedAnimation ( nuttedance2 )
	setPedAnimation ( nuttedance3 )
	setPedAnimation ( nuttedance4 )
	setPedAnimation ( nuttedance5 )
	setPedAnimation ( nuttedance6 )
	setPedAnimation ( nuttedance7 )
	local rnd = math.random(1,3)
	if rnd == 1 then
		setPedAnimation ( nuttedance1, "STRIP", "STR_Loop_A",-1,true,false,false )
	elseif rnd == 2 then
		setPedAnimation ( nuttedance1, "STRIP", "STR_Loop_B",-1,true,false,false )
	else
		setPedAnimation ( nuttedance1, "STRIP", "STR_Loop_C",-1,true,false,false )
	end
	local rnd = math.random(1,3)
	if rnd == 1 then
		setPedAnimation ( nuttedance2, "STRIP", "STR_Loop_A",-1,true,false,false )
	elseif rnd == 2 then
		setPedAnimation ( nuttedance2, "STRIP", "STR_Loop_B",-1,true,false,false )
	else
		setPedAnimation ( nuttedance2, "STRIP", "STR_Loop_C",-1,true,false,false )
	end
	local rnd = math.random(1,3)
	if rnd == 1 then
		setPedAnimation ( nuttedance3, "STRIP", "STR_Loop_A",-1,true,false,false )
	elseif rnd == 2 then
		setPedAnimation ( nuttedance3, "STRIP", "STR_Loop_B",-1,true,false,false )
	else
		setPedAnimation ( nuttedance3, "STRIP", "STR_Loop_C",-1,true,false,false )
	end
	local rnd = math.random(1,3)
	if rnd == 1 then
		setPedAnimation ( nuttedance4, "STRIP", "STR_Loop_A",-1,true,false,false )
	elseif rnd == 2 then
		setPedAnimation ( nuttedance4, "STRIP", "STR_Loop_B",-1,true,false,false )
	else
		setPedAnimation ( nuttedance4, "STRIP", "STR_Loop_C",-1,true,false,false )
	end
	
	local rnd = math.random(1,3)
	if rnd == 1 then
		setPedAnimation ( nuttedance5, "STRIP", "STR_Loop_A",-1,true,false,false )
	elseif rnd == 2 then
		setPedAnimation ( nuttedance5, "STRIP", "STR_Loop_B",-1,true,false,false )
	else
		setPedAnimation ( nuttedance5, "STRIP", "STR_Loop_C",-1,true,false,false )
	end
	local rnd = math.random(1,3)
	if rnd == 1 then
		setPedAnimation ( nuttedance6, "STRIP", "STR_Loop_A",-1,true,false,false )
	elseif rnd == 2 then
		setPedAnimation ( nuttedance6, "STRIP", "STR_Loop_B",-1,true,false,false )
	else
		setPedAnimation ( nuttedance6, "STRIP", "STR_Loop_C",-1,true,false,false )
	end
	local rnd = math.random(1,3)
	if rnd == 1 then
		setPedAnimation ( nuttedance7, "STRIP", "STR_Loop_A",-1,true,false,false )
	elseif rnd == 2 then
		setPedAnimation ( nuttedance7, "STRIP", "STR_Loop_B",-1,true,false,false )
	else
		setPedAnimation ( nuttedance7, "STRIP", "STR_Loop_C",-1,true,false,false )
	end
end