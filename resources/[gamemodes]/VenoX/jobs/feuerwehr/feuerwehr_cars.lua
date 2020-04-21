--[[createFactionVehicle ( 599, -2485.2998046875, 2242.5, 5.1999998092651, 0, 0, 180, 11, 3, 3, 0, 0 ) 
createFactionVehicle ( 599, -2480.099609375, 2242.5, 5.1999998092651, 0, 0, 180, 11, 3, 3, 0, 0 ) 
createFactionVehicle ( 552, -2454.19921875, 2241.7998046875, 4.5999999046326, 0, 0, 180, 11, 3, 3, 0, 0 )
createFactionVehicle ( 552, -2448, 2241.7998046875, 4.5999999046326, 0, 0, 180, 11, 3, 3, 0, 0 )
createFactionVehicle ( 552, -2442.5, 2241.7998046875, 4.5999999046326, 0, 0, 180, 11, 3, 3, 0, 0 )
createFactionVehicle ( 456, -2444.3994140625, 2225.3994140625, 5.1999998092651, 0, 0, 0, 11, 3, 3, 0, 0  )
createFactionVehicle ( 456, -2449.7998046875, 2225.3994140625, 5.1999998092651, 0, 0, 0, 11, 3, 3, 0, 0  )
createFactionVehicle ( 456, -2455.69921875, 2225.3994140625, 5.1999998092651, 0, 0, 0, 11, 3, 3, 0, 0 )
createFactionVehicle ( 407, -2464.599609375, 2225.2998046875, 5.1999998092651, 0, 0, 0, 11, 3, 3, 0, 0 )
createFactionVehicle ( 407, -2470, 2225.2998046875, 5.1999998092651, 0, 0, 0, 11, 3, 3, 0, 0 )
createFactionVehicle ( 407, -2475.3994140625, 2225.2998046875, 5.1999998092651, 0, 0, 0, 11, 3, 3, 0, 0 )
createFactionVehicle ( 407, -2480.5, 2225.2998046875, 5.1999998092651, 0, 0, 0, 11, 3, 3, 0, 0 )
createFactionVehicle ( 407, -2485.599609375, 2225.2998046875, 5.1999998092651, 0, 0, 0, 11, 3, 3, 0, 0 )
]]
----------------LS---------------------

createFactionVehicle ( 552, 1459.80969, -1566.18164, 13.8729, 0, 0, 179.923, 11, 3, 3, 0, 0 ) 
createFactionVehicle ( 400, 1491.55566, -1566.18164, 13.41425, 0, 0, 179.918, 11, 3, 3, 0, 0 ) 
createFactionVehicle ( 400, 1507.96582, -1566.18164, 13.42645, 0, 0, 179.918, 11, 3, 3, 0, 0 )
createFactionVehicle ( 407, 1523.57263, -1566.18164, 13.9291, 0, 0, 179.923, 11, 3, 3, 0, 0 )
createFactionVehicle ( 407, 1539.04626, -1489.12915, 13.9291, 0, 0, 179.918, 11, 3, 3, 0, 0 )
createFactionVehicle ( 400, 1507.5, -1530.19995, 13.8, 0, 0, 0, 11, 3, 3, 0, 0  )
createFactionVehicle ( 552, 1459.59998, -1532.90002, 13.9, 0, 0, 0, 11, 3, 3, 0, 0  )
createFactionVehicle ( 544, 1539.58606, -1531.78772, 13.9, 0, 0, 0, 11, 3, 3, 0, 0 )
createFactionVehicle ( 407, 1491.19995, -1530.19995, 13.8, 0, 0, 0, 11, 3, 3, 0, 0 )
createFactionVehicle ( 417, 1482.71008, -1548.95898, 34.8027, 0, 0, 0, 11, 3, 3, 0, 0 )
createFactionVehicle ( 544, 1523.46667, -1531.78711, 13.9, 0, 0, 0, 11, 3, 3, 0, 0 )
createFactionVehicle ( 416, 1539.65393, -1565.75427, 13.9164, 0, 0, 179.918, 11, 3, 3, 0, 0 )
createFactionVehicle ( 525, 1527.93518, -1489.12891, 13.46898, 0, 0, 179.918, 11, 3, 3, 0, 0 )


for index, car in next, getElementsByType("vehicle") do
	if(getElementModel(car) == 552) then
		local veh = car
		removeVehicleSirens(veh)
		addVehicleSirens(veh, 6, 2, true, true, true, false)
		setVehicleSirens(veh, 1, 1, -3.9, -0.5, 255, 0, 0, 255, 255)
		setVehicleSirens(veh, 2, -1, -3.9, -0.5, 255, 0, 0, 255, 255)
		setVehicleSirens(veh, 3, -1, -3.9, 0.8, 0, 0, 255, 255, 255)
		setVehicleSirens(veh, 4, 1, -3.9, 0.8, 0, 0, 255, 255, 255)
		setVehicleSirens(veh, 5, 0.8, 3.3, -0.1, 0, 0, 255, 255, 255)
		setVehicleSirens(veh, 6, -0.7, 3.3, -0.1, 0, 0, 255, 255, 255)
	end
	if(getElementModel(car) == 407) then
		local veh = car
		--removeVehicleSirens(veh)
		addVehicleSirens(veh, 4, 2, true, true, true, false)
		setVehicleSirens(veh, 1, 0.8, -4.4, -0.5, 255, 0, 0, 255, 255)
		setVehicleSirens(veh, 2, -0.8, -4.4, -0.5, 255, 0, 0, 255, 255)
		setVehicleSirens(veh, 3, -0.8, -3.9, 1.5, 255, 255, 0, 255, 255)
		setVehicleSirens(veh, 4, 0.8, -3.9, 1.5, 255, 255, 0, 255, 255)
	end
	if(getElementModel(car) == 400) then
		local veh = car
		removeVehicleSirens(veh)
		addVehicleSirens(veh, 4, 2, true, true, true, false)
		setVehicleSirens(veh, 1, 0.8, 3.1, 1.8, 0, 0, 255, 255, 255)
		setVehicleSirens(veh, 2, -0.8, 3.1, 1.8, 0, 0, 255, 255, 255)
		setVehicleSirens(veh, 3, 0.8, -3.7, 1.3, 0, 0, 255, 255, 255)
		setVehicleSirens(veh, 4, -0.8, -3.7, 1.3, 0, 0, 255, 255, 255)
	end
	if(getElementModel(car) == 552) then
		setVehicleHandling(car, "engineAcceleration", 19) 
		setVehicleHandling(car, "maxVelocity", 250)
	end
	if(getElementModel(car) == 456) then
		setVehicleHandling(car, "engineAcceleration", 20) 
		setVehicleHandling(car, "maxVelocity", 250)
	end
	setElementHealth(car, 5000)		-- SIRENS --
end


function EmergencyLights ( source )     
    theVehicle = getPedOccupiedVehicle ( source )     
    if ( theVehicle ) then                           
		if isOnDuty(player) or isSEK(player) or isMedic(player) or isFeuerwehr(player) or isFBI(player) or isArmy(player) then
        if ( getVehicleOverrideLights ( theVehicle ) ~= 2 ) then 
            setVehicleOverrideLights ( theVehicle, 2 )
            setTimer ( setLight, 400, 1 )	         
        else
            setVehicleOverrideLights ( theVehicle, 0 )   
            killTimer ( fick )
			killTimer ( fick1 )        
        end
		end
    end
end

function setLight ( )
            local fick = setTimer ( setLight2, 400, 1 )	      
           	setVehicleHeadLightColor (theVehicle, 000, 000, 255)	    
end

function setLight2 (  )
		    setVehicleHeadLightColor (theVehicle, 255, 000, 000)	      
			local fick1 = setTimer ( setLight, 400, 1 )	 
end

addCommandHandler ( "elights", EmergencyLights )
