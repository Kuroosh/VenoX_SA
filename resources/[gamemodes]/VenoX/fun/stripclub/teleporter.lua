stripEnterMarkerVisible = createMarker ( -2624.5581054688, 1412.1166992188, 6.0725049972534, "cylinder", 1.2, 150, 10, 10, 125, getRootElement() )
stripEnterMarker = createMarker ( -2624.5581054688, 1412.1166992188, 6.9, "corona", 1.2, 150, 10, 10, 0, getRootElement() )
stripBlip = createBlip ( -2624.5581054688, 1412.1166992188, 6.9, 21, 2, 255, 0, 0, 255, 0, 200, getRootElement() )

function StripEnterMarkerHit ( player, dim )

	if not getPedOccupiedVehicle ( player ) and dim then
		fadeElementInterior ( player, 3, -2636.96875, 1404.4047851563, 906.1 )
		toggleControl ( player, "fire", false )
		toggleControl ( player, "enter_exit", false )
		vnxSetElementData( player, "nodmzone", 1 )
	end
end
addEventHandler ( "onMarkerHit", stripEnterMarker, StripEnterMarkerHit )

stripEnterMarkerExitVisible = createMarker ( -2636.9182128906, 1402.5383300781, 905.43, "cylinder", 1.2, 150, 10, 10, 125, getRootElement() )
stripEnterMarkerExit = createMarker ( -2636.9182128906, 1402.5383300781, 905.95, "corona", 1.2, 150, 10, 10, 0, getRootElement() )
setElementInterior ( stripEnterMarkerExitVisible, 3 )
setElementInterior ( stripEnterMarkerExit, 3 )

function StripEnterMarkerExitHit ( player, dim )

	if not getPedOccupiedVehicle ( player ) and dim then
		fadeElementInterior ( player, 0, -2624.2016601563, 1410.0379638672, 6.74 )
		toggleControl ( player, "fire", true )
		toggleControl ( player, "enter_exit", true )
		vnxSetElementData( player, "nodmzone", 0 )
	end
end
addEventHandler ( "onMarkerHit", stripEnterMarkerExit, StripEnterMarkerExitHit )