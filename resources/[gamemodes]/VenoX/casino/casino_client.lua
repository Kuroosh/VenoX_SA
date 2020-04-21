-- Caligulas
createBlip ( 2195.9187011719, 1677.1341552734, 11.345178604126, 25, 1.2, 255, 0, 0, 255, 0, 200 )
caligulasTresor = createObject (2332, 2150.6000976563, 1595.1999511719, 1005.5999755859, 0, 0, 90)
setElementInterior(caligulasTresor, 1)

-- Four Dragons
createBlip ( 2020.2043457031, 1007.7569580078, 9.8054075241089, 25, 1.2, 255, 0, 0, 255, 0, 200 )
fourdragonsTresor = createObject (2332, 1940.5999755859, 984.46002197266, 992)	
setElementInterior(fourdragonsTresor, 10)

-- The Casino
createBlip ( 1657.4000244141, 2237.5, 18.39999961853, 25, 1.2, 255, 0, 0, 255, 0, 200 )
thecasinoTresor = createObject (2332, 1143.2600097656, -2.3900001049042, 1000.0999755859, 0, 0, 270)	
setElementInterior(thecasinoTresor, 12)
setObjectScale(thecasinoTresor, 1.34)
thecasinoDoor = createObject ( 1498, 1638.0899658203, 2227.1999511719, 10, 0, 0, 270)

-- Caligulas Casino --
addEventHandler ( "onResourceStart", resourceRoot, function ( )
	caligulasPed = {
		[0] = createInvulnerablePed ( 189, 2155.1176757813, 1599.4368896484, 1005.8151245117, -90, 1 ),
		[1] = createInvulnerablePed ( 189, 2197.58203125, 1603.6123046875, 1004.711730957, -90, 1 ),
		[2] = createInvulnerablePed ( 189, 2190.7133789063, 1604.6125488281, 1004.711730957, 90, 1 ),
	}

	-- Four Dragons Casino --
	fourdragonsPed = {
		[0] = createInvulnerablePed ( 169, 1953.7731933594, 1017.8639526367, 992.11798095703, -90, 10 ),
		[1] = createInvulnerablePed ( 169, 1947.8448486328, 1017.8309326172, 992.12371826172, 90, 10 ),
	}

	-- The Casino --
	thecasinoPed = {
		[0] = createInvulnerablePed ( 248, 1141.5, -8.271484375, 1000.700012207, 90, 12 ),
	}
end, true, "high+999" )

caligulasstelle = 3
fourdragonsstelle = 2 
thecasinostelle = 1

function getRandomCroupierSkin ()

	if math.random ( 1, 2 ) == 1 then
		return 194
	else
		return 240
	end
end