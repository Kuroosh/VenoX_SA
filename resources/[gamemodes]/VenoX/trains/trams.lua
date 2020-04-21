tram1 = createVehicle ( 449, -2257, 541, 34, "TRAM" )
tram2 = createVehicle ( 449, -1714, 1298, 6.6, "TRAM" )
setTrainDerailable ( tram1, false )
setTrainDerailable ( tram2, false )
setVehicleLocked ( tram1, true )
setVehicleLocked ( tram2, true )

function speedUpTrams ()

	setTrainSpeed ( tram1, tramSpeed )
	setTrainSpeed ( tram2, tramSpeed )
	setTrainDerailable ( tram1, false )
	setTrainDerailable ( tram2, false )
	setTimer ( speedUpTrams, 1000, 1 )
end
setTimer ( speedUpTrams, 15000, 1 )