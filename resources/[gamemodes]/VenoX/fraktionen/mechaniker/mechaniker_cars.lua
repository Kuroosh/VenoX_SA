------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------
---- Script by Noneatme ------

mechanikerVehicles = {}
mechanikerVehicles[4] = createFactionVehicle (440, -2393.39, -136.79, 35.5, 0, 0, 269.49, 11, 255, 255, 255, 0 ) -- Rumpo
mechanikerVehicles[5] = createFactionVehicle (440, -2393.29, -131.29, 35.5, 0, 0, 269.49, 11, 255, 255, 255, 0 ) -- Rumpo
mechanikerVehicles[6] = createFactionVehicle (586, -2378.89, -180.5, 35, 0, 0, 0, 11, 255, 255, 255, 0 ) -- Wayfarer
mechanikerVehicles[7] = createFactionVehicle (586, -2380.39, -181.29, 35, 0, 0, 0, 11, 255, 255, 255, 0 ) -- Wayfarer
mechanikerVehicles[8] = createFactionVehicle (586, -2381.79, -182.20, 35, 0, 0, 0, 11, 255, 255, 255, 0 ) -- Wayfarer
mechanikerVehicles[9] = createFactionVehicle (422, -2399.5, -199.90, 35.40, 0, 0, 14.99, 11, 255, 255, 255, 0 ) -- Bobcat
mechanikerVehicles[10] = createFactionVehicle (422, -2402.89, -200.70, 35.40, 0, 0, 14.99, 11, 255, 255, 255, 0 ) -- Bobcat
mechanikerVehicles[11] = createFactionVehicle (422, -2406.39, -201.59, 35.40, 0, 0, 14.99, 11, 255, 255, 255, 0 ) -- Bobcat
mechanikerVehicles[12] = createFactionVehicle (417, -2404.20, -148.09, 41.5, 0, 0, 0, 11, 255, 255, 255, 0 ) -- Leviathan


setVehicleAsMagnetHelicopter(mechanikerVehicles[12])

function Mechaniker_magnet (car)
	if getElementData (car, "magnet") == false then
		setVehicleAsMagnetHelicopter(car)
	end
end


for index, c in next, mechanikerVehicles do
	setVehicleColor(c, 255, 255, 255, 0, 255, 0, 0, 0, 0)
	setElementFrozen ( c, true )

	addEventHandler ( "onVehicleEnter", c, function (player, seat, jacked)
		if isMechanikerCar (source) then
			Mechaniker_magnet(source)
		end
	end )
if getElementModel(c) == 525 then
	addVehicleSirens(c, 3, 2, false, true, true, true)
	setVehicleSirens(c, 1, 0.55, -0.5, 1.5, 255, 0, 0, 200, 200)
	setVehicleSirens(c, 2, -0.55, -0.5, 1.5, 255, 0, 0, 255, 200)
	setVehicleSirens(c, 3, 0, -0.5, 1.5, 255, 255, 0, 255, 200)
end
end

function MechanikerMagnetExplode()
	setElementData( mechanikerVehicles[12], "magnet", false)
end
addEventHandler("onVehicleExplode", mechanikerVehicles[12], MechanikerMagnetExplode)
