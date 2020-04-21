local Eingang_PD = createMarker ( 217.8037109375, 117.1357421875, 999, "corona", 1.5, 255, 70, 0 )
local Eingang_Knast = createMarker ( 2421.533203125, -1302.83984375, 988.2, "corona", 1.5, 255, 70, 0 )

setElementInterior ( Eingang_PD, 10 )
setElementInterior ( Eingang_Knast, 2 )

-- fadeElementInterior ( player, int, intx, inty, intz, rot, dim )

addEventHandler( "onMarkerHit", Eingang_PD, 
	function ( ele, dim )
	
		if dim and getElementType(ele) == "player" then
		
			if vnxGetElementData ( ele, "jailtime" ) == 0 and vnxGetElementData ( ele, "prison" ) == 0 then
		
				fadeElementInterior ( ele, 2, 2421.5146484375, -1300.9580078125, 988.19055175781, 0, 0 )
			
			end
		
		end
	
	end )
	
addEventHandler( "onMarkerHit", Eingang_Knast, 
	function ( ele, dim )
	
		if dim and getElementType(ele) == "player" then
		
			if vnxGetElementData ( ele, "jailtime" ) == 0 and vnxGetElementData ( ele, "prison" ) == 0 then
			
				fadeElementInterior ( ele, 10, 217.61328125, 118.90625, 999.015625, 0, 0 )
			
			end
		
		end
	
	end )