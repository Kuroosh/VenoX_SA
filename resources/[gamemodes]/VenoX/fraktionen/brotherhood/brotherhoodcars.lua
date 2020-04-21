BrotherhoodCars = {}
BrotherhoodCars[1] = createFactionVehicle ( 411, -1819.017578125 , -155.609375 , 9.2298860549927, 0, 0, 70, 2, 0, 0, 0, 0 )--Elegant AMK 
BrotherhoodCars[2] = createFactionVehicle ( 560, -1818.998046875 , -158.9609375 , 9.2285804748535, 0, 0, 70, 2, 0, 0, 0, 0 )-- Noch ein Elegant AMK 
BrotherhoodCars[3] = createFactionVehicle ( 560, -1818.990234375 , -162.9326171875 , 9.2303791046143, 0, 0, 70, 2, 0, 0, 0, 0 )-- Noch ein Elegant AMK 
BrotherhoodCars[4] = createFactionVehicle ( 558, -1819 , -166.4580078125 , 9.2269859313965, 0, 0, 70, 2, 0, 0, 0, 0 )-- Hustler AMK 
BrotherhoodCars[5] = createFactionVehicle ( 558, -1819.1396484375 , -169.951171875 , 9.2215852737427, 0, 0, 70, 2, 0, 0, 0, 0 )-- Noch ein Hustler AMK 
BrotherhoodCars[6] = createFactionVehicle ( 550, -1818.978515625 , -174.0498046875 , 9.2210159301758, 0, 0, 70, 2, 0, 0, 0, 0 )-- Sunrise AMK 
BrotherhoodCars[14] = createFactionVehicle ( 521,-1818.19921875 , -177.400390625 , 8.9710922241211, 0, 0, 90, 2, 0, 0, 0, 0 ) --NRG 500
BrotherhoodCars[15] = createFactionVehicle ( 521, -1817.8671875 , -179.1171875 , 8.9086446762085, 0, 0, 90, 2, 0, 0, 0, 0 ) --NRG 500
BrotherhoodCars[16] = createFactionVehicle ( 522, -1817.6875 , -181.365234375 , 8.9086446762085, 0, 0, 90, 2, 0, 0, 0, 0 )
BrotherhoodCars[17] = createFactionVehicle ( 487, -1812.39453125 , -162.3173828125 , 18.350057601929, 0, 0, 180, 2, 0, 0, 0, 0 )
BrotherhoodCars[18] = createFactionVehicle ( 487, -1812.6318359375 , -174.7666015625 , 18.324590682983, 0, 0, 180, 2, 0, 0, 0, 0 )


--BrotherhoodCars[13] = createFactionVehicle ( 526, -2451.7138671875, 157.7451171875, 34.737922668457, 0, 0, 180, 2, 0, 0, 0, 0 ) --Noch ein Fortune AMK



for k, v in pairs ( BrotherhoodCars ) do
	setVehicleColor ( v, 160, 40, 40, 0, 0, 0 )
end
