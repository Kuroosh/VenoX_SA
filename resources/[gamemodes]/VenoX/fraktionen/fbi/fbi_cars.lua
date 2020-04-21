fbiCars = {}

-- createFactionVehicle ( model, x, y, z, rx, ry, rz, 6, 0, 0, 0, 0 )

fbiCars[1] = createFactionVehicle ( 497, -2462.4187011719, 522.23236083984, 51, 0, 0, 0, 6, 0, 0, 0, 0 ) -- Maverick 1
fbiCars[2] = createFactionVehicle ( 447, -2480.1748046875, 522.08630371094, 51, 0, 0, 0, 6, 0, 0, 0, 0 ) -- SeaSparrow
fbiCars[3] = createFactionVehicle ( 411, -2440.7897949219, 500.4065246582, 29.7, 0, 0, 25.805053710938, 6, 0, 0, 0, 0 ) -- Infernus
fbiCars[4] = createFactionVehicle ( 415, -2430.1098632813, 515.35406494141, 29.7, 0, 0, 220, 6, 0, 0, 0, 0 ) -- Cheetah 1
fbiCars[5] = createFactionVehicle ( 415, -2426.1662597656, 518.52447509766, 29.7, 0, 0, 223.96569824219, 6, 0, 0, 0, 0 ) -- Cheetah 2
fbiCars[6] = createFactionVehicle ( 415, -2445.1672363281, 523.02789306641, 29.7, 0, 0, 0, 6, 0, 0, 0, 0 ) -- Cheetah 3
fbiCars[7] = createFactionVehicle ( 597, -2418.8041992188, 524.45080566406, 29.7, 0, 0, 230.97143554688, 6, 0, 0, 0, 0 ) -- Enforcer
fbiCars[8] = createFactionVehicle ( 490, -2416.2280273438, 528.17468261719, 30, 0, 0, 240.89605712891, 6, 0, 0, 0, 0 ) -- Rancher 1
fbiCars[9] = createFactionVehicle ( 490, -2414.5490722656, 531.81390380859, 30, 0, 0, 248.83172607422, 6, 0, 0, 0, 0 ) -- Rancher 2
fbiCars[10] = createFactionVehicle ( 601, -2413.3103027344, 535.69073486328, 30, 0, 0, 260.73931884766, 6, 0, 0, 0, 0 ) -- Rancher 3
fbiCars[11] = createFactionVehicle ( 427, -2412.6123046875, 540.1435546875, 30, 0, 0, 272.6484375, 6, 0, 0, 0, 0 ) -- Rancher 4
fbiCars[12] = createFactionVehicle ( 597, -2421.8315429688, 520.83325195313, 29.7, 0, 0, 225.01995849609, 6, 0, 0, 0, 0 ) -- PD car
fbiCars[13] = createFactionVehicle ( 523, -2443.5415429688, 513.79325195313, 29.7, 0, 0, 250.01995849609, 6, 0, 0, 0, 0 ) --PD Bike
fbiCars[14] = createFactionVehicle ( 523, -2443.5415429688, 511.49325195313, 29.7, 0, 0, 250.01995849609, 6, 0, 0, 0, 0 ) -- PD Bike
fbiCars[15] = createFactionVehicle ( 582, -2441.5415429688, 533.05325195313, 30, 0, 0, 270.01995849609, 6, 0, 0, 0, 0 ) -- FCR
--fbiCars[13] = createFactionVehicle ( 523, -2443.5415429688, 511.49325195313, 29.7, 0, 0, 250.01995849609, 6, 0, 0, 0, 0 ) -- S.W.A.T.
FederalBoxville = createFactionVehicle ( 609, -2439.05, 522.28, 30.11, 0, 0, 0, 6, 0, 0, 0, 0 ) -- Boxville


-- LVPD FBI Cars:

fbiCars[13] = createFactionVehicle ( 490, 2242.2202148438, 2447.2504882813, 3.5935640335083, 0, 0, 90, 6, 0, 0, 0, 0 ) -- Rancher 1
fbiCars[14] = createFactionVehicle ( 490, 2241.55078125, 2456.7524414063, 3.5935640335083, 0, 0, 90, 6, 0, 0, 0, 0 ) -- Rancher 2
fbiCars[15] = createFactionVehicle ( 490, 2241.6481933594, 2465.7797851563, 3.5935640335083, 0, 0, 90, 6, 0, 0, 0, 0 ) -- Rancher 3
fbiCars[16] = createFactionVehicle ( 490, 2241.2680664063, 2471.0139160156, 3.5935640335083, 0, 0, 90, 6, 0, 0, 0, 0 ) -- Rancher 4

fbiCars[17] = createFactionVehicle ( 415, 2314.0190429688, 2460.5991210938, 3.1229588985443, 0, 0, 90, 6, 0, 0, 0, 0 ) -- Cheetah 1
fbiCars[18] = createFactionVehicle ( 415, 2314.2822265625, 2465.08984375, 3.1229588985443, 0, 0, 90, 6, 0, 0, 0, 0 ) -- Cheetah 2
fbiCars[19] = createFactionVehicle ( 415, 2314.58984375, 2470.3295898438, 3.1229588985443, 0, 0, 90, 6, 0, 0, 0, 0 ) -- Cheetah 3

for k, v in pairs ( fbiCars ) do
	setElementFrozen ( v, true )
	addEventHandler ( "onVehicleStartEnter", v, function (player, seat, jacked)
		if seat == 0 and not isOnDuty ( player ) then
			if not jacked then
				cancelEvent ()
			end
		else
			setElementFrozen ( v, false )
		end
	end )
	addEventHandler ( "onVehicleEnter", v, function (player, seat, jacked)
		if seat == 0 and not isOnDuty ( player ) and jacked then
			opticExitVehicle ( player )
			infobox ( player, "Du bist kein\nStaatsfraktionist\nimDienst!", 4000, 255, 0, 0 )
		end
	end )
  if getElementModel (v)  == 597 or getElementModel (v) == 415 or getElementModel (v) == 411 then
        addVehicleSirens( v, 1, 2, true, true, false, false)
    	addVehicleSirens( v, 2, 2, true, true, false, false)
		addVehicleSirens( v, 3, 2, true, true, false, false)
		addVehicleSirens( v, 4, 2, true, true, false, false)
		addVehicleSirens( v, 5, 2, true, true, false, false)
		addVehicleSirens( v, 6, 2, true, true, false, false)
		addVehicleSirens( v, 7, 2, true, true, false, false)

		 if getElementModel (v)  == 597 then
		 	setVehicleSirens( v, 1, -0.5, -0.4, 1, 255, 0, 0, 255, 255) -- Rotes licht oben--
			setVehicleSirens( v, 2, 0.5, -0.4, 1, 0, 0, 255, 255, 255)
			setVehicleSirens( v, 3, 0, -0.4, 1, 255, 255, 255, 255, 255)
			setVehicleSirens( v, 4, -0.5, 2.6, 0, 0, 0, 255, 255, 100) --BLAUESLICHT VORNE AN LAMPE--
			setVehicleSirens( v, 5, 0.4, 2.6, 0, 255, 0, 0, 255, 100) --ROtes licht vorne an Lampe
			--setVehicleSirens( v, 6, 0.6, 0, 1.0, 0, 0, 255, 255, 255) -- blaue sireene
			setVehicleSirens( v, 7, 0, -0.4, 1.0, 255, 255, 255, 255, 255) --weisseslichtObenmitte
	elseif getElementModel (v) == 415 then
			setVehicleSirens( v, 1, 0.3, 0.7, 0.3, 0, 50, 255 )
			setVehicleSirens( v, 2, -0.3, 0.7, 0.3, 0, 50, 255 )
	elseif getElementModel (v)  == 411 then
			setVehicleSirens( v, 1, 0.3, 1, 0.3, 200, 0, 0 )
			setVehicleSirens( v, 2, -0.3, 1, 0.3, 0, 0, 200 )
         end
  end
end
