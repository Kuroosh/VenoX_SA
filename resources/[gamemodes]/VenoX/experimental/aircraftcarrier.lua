traeger_rot = 270
traegerhuelle = createObject ( 10771, -2945.4990234375, 1895.6409912109, 5.0292205810547, 0, 0, traeger_rot )
traegerhuelle2 = createObject ( 10771, -2945.4990234375, 1895.6409912109, 5.0292205810547, 0, 0, traeger_rot )
traegerdeko = createObject ( 11237, -2942.5952148438, 1888.0831298828, 38.148162841797, 0, 0, 0 )
traegerbruecke = createObject ( 10770, -2942.2377929688, 1888.0931396484, 38.103894042969, 0, 0, 0 )
traegerpainting = createObject ( 10772, -2944.1548339844, 1895.4365234375, 16.808713912964, 0, 0, 0 )
traegerlowerdeck = createObject ( 11145, -3008.5187988281, 1895.6112060547, 3.8160109519958, 0, 0, 0 )
traegerlift = createObject ( 3115, -3044.515625, 1895.6612548828, 16.533159255981, 0, 0, 0 )
traegerlift2 = createObject ( 3114, -3002.2551269531, 1910.5833740234, 16.533159255981, 0, 0, 0 )
carrierhydra1 = createVehicle ( 520, -3046.0178222656, 1896.8093261719, 18.768978118896, 0, 0, 0 )
traegerseetor = createObject ( 3113, -3051.8176269531, 1895.1263427734, -0.6461999416351 )

attachElements ( traegerhuelle2, traegerhuelle, 0, 0, 0 )
attachElements ( traegerdeko, traegerhuelle, 2.90380857995, -7.5578613281, 33.1189422607423 )
attachElements ( traegerbruecke, traegerhuelle, 3.2612304687, -7.55786122262, 33.074673461915 )
attachElements ( traegerpainting, traegerhuelle, 1.3441894531, -0.2044677734, 11.7794333191 )
attachElements ( traegerlowerdeck, traegerhuelle, -63.0197753906, -0.0297851562, -1.21320990610967 )
attachElements ( traegerlift, traegerhuelle, -99.0166015625, 0.0202636719, 11.5039386749263 )
attachElements ( traegerlift2, traegerhuelle, -56.7561035156, 14.9423828125, 11.2539386749263 )
attachElements ( traegerseetor, traegerhuelle, -106.3186035156, -0.51464843751, -5.09384057521821 )
attachElements ( carrierhydra1, traegerhuelle, -100.5187988281, 1.168334961, 13.7397575378413, 0, 0, 270 )
	
function move1 ()

	tempo = 700
	x, y, z = getElementPosition ( traegerhuelle )
	distx = math.abs ( x - -3032.8425292969 )
	disty = math.abs ( y - 1187.8460693359 )
	distt = distx + disty
	ttime = distt * ( tempo )
	moveObject ( traegerhuelle, ttime, -3032.8425292969, -1187.8460693359, z )
	moveObject ( traegerhuelle, ttime, -3032.8425292969, -1187.8460693359, z )
	--setTimer ( turn1 )
end
	
setTimer ( move1, 15000, 1 )

function playerjoindings ()

	bindKey ( source, "b", "down", hydraattatch )
	bindKey ( source, "c", "down", hydradetatch )
end
addEventHandler( "onPlayerJoin", getRootElement(), playerjoindings )

function turn1 ()

	moveObject ( traegerhuelle, 5000, getElementPosition ( traegerhuelle ), 0, 0, 0 )
	setTimer ( move2, 5000, 1 )
end

function carrierrespawn ( player )										--- Wiederbeleben

	x, y, z = getElementPosition ( traegerhuelle )
	setElementPosition ( player, x, y, ( z + 12.5382877349853 ) )
end
--addCommandHandler ( "cspawn", carrierrespawn )

function hydradetatch ( source )

	if ( isElementAttached ( ( getPedOccupiedVehicle ( source ) ) ) ) then
		outputChatBox ( " Detatch" )
		x, y, z = getElementPosition ( source )
		rx, ry, rz = getPedRotation ( source )
		detachElements ( getPedOccupiedVehicle ( source ), traegerhuelle )
		setElementPosition ( getPedOccupiedVehicle ( source ), x, y, z )
	end
end

function hydraattatch ( source )

	veh = getPedOccupiedVehicle ( source )
	x, y, z = getElementPosition ( veh )
	x2, y2, z2 = getElementPosition ( traegerhuelle )
	d = math.abs ( x - x2 ) + math.abs ( y - y2 )
	if  z <= 20 and z >= 16 then
		ox, oy, oz = getObjectRotation ( traegerhuelle )
		x, y, z = getElementPosition ( veh )
		x2, y2, z2 = getElementPosition ( traegerhuelle )
		nx = ( math.abs ( x ) - math.abs ( x2 ) ) * -1
		ny = ( y - y2 )
		nz = math.abs ( z2 - z )
		rx, ry, rz = getVehicleRotation ( veh )
		rz = rz - 180
		outputChatBox ( " Attach" )
		if traeger_rot == 0 then
			attachElements ( veh, traegerhuelle, nx, ny, nz, rx, ry, rz )
			outputChatBox ( "Rotation des Trägers: 0°" )
		else 
			if traeger_rot == 90 then
				attachElements ( veh, traegerhuelle, ny, -nx, nz, ry, rx, rz )
				outputChatBox ( "Rotation des Trägers: 90°" )
			else
				if traeger_rot == 180 then
					attachElements ( veh, traegerhuelle, -nx, -ny, nz, rx, ry, rz )
					outputChatBox ( "Rotation des Trägers: 180°" )
				else
					if traeger_rot == 270 then
						attachElements ( veh, traegerhuelle, -ny, nx, nz, rx, ry, rz )
						outputChatBox ( "Rotation des Trägers: 270°" )
					end
				end
			end
		end
	end
end