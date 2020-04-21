local shamal_list = {}
local shamal_test = {}
local shamal_user = {}
local isInShamal = {}

function killPedIfShamalExplode ( )

	for player, state in pairs ( shamal_user[source] ) do
	
		killPed(player)
		isInShamal[player] = nil
	
	end

end

function shamal_server_enter ( player )

	if client == player and not getPedOccupiedVehicle(player) then
	
		if not isInShamal[player] then
	
			local x, y, z = getElementPosition ( player )
			local sphere_2 = createColSphere ( x, y, z, 10 )		
			local spehere_table = getElementsWithinColShape ( sphere_2, "vehicle" )
			
			for theKey,theVehicle in pairs(spehere_table) do
					
				if getElementModel(theVehicle) == 519 then
				
					if tonumber(shamal_list[theVehicle]) then
					
						setElementInterior ( player, 1 )
						setElementDimension ( player, tonumber(shamal_list[theVehicle]) )
						setElementPosition ( player, 1.808619, 32.384357, 1199.593750 )
						isInShamal[player] = theVehicle
						shamal_user[theVehicle][player] = true
					
					else
					
						local dimen = math.random ( 1, 60000 )
						
						if shamal_test[dimen] then
						
							while shamal_test[dimen] do
							
								dimen = math.random ( 1, 60000 )
														 
							end
						
						end
						
						shamal_list[theVehicle] = dimen
						shamal_test[dimen] = true
						shamal_user[theVehicle] = {}
						
						setElementInterior ( player, 1 )
						setElementDimension ( player, dimen )
						setElementPosition ( player, 1.808619, 32.384357, 1199.593750 )
						isInShamal[player] = theVehicle
						addEventHandler( "onVehicleExplode", theVehicle, killPedIfShamalExplode )
						shamal_user[theVehicle][player] = true
					
					end
								
				end
				
				return
					
			end
					
			destroyElement(sphere_2)
			
		else
		
			local veh = isInShamal[player]
			local x, y, z = getElementPosition( veh )
			
			setElementInterior ( player, 0 )
			setElementDimension ( player, 0 )
			setElementPosition ( player, x+3, y+3, z )
			shamal_user[veh][player] = false
			isInShamal[player] = nil
		
		end
	
	end
	
end

addEvent( "onEnterAnShamal", true )
addEventHandler( "onEnterAnShamal", getRootElement(), shamal_server_enter )