MafiaExit = createMarker ( -42.649452209473, 1405.7553710938, 1084.0788574219, "corona", 1, getColorFromString ( "#FF000099" ) )
setElementInterior (MafiaExit, 8)

vincenzo = createInvulnerablePed ( 46, -50.07, 1403.25, 1084.42, 0, 8, 0 )
local x, y, z = getElementPosition ( vincenzo )
vnxSetElementData ( vincenzo, "sx", x )
vnxSetElementData ( vincenzo, "sy", y )
vnxSetElementData ( vincenzo, "sz", z )
vnxSetElementData ( vincenzo, "dim", 0 )
vnxSetElementData ( vincenzo, "int", 8 )
vnxSetElementData ( vincenzo, "rot", getPedRotation ( vincenzo ) )
vnxSetElementData ( vincenzo, "botname", "vincenzo" )

MafiaEnter = createMarker ( -777.915, 883.9804, 11.98, "corona", 1, getColorFromString ( "#FF000099" ) )


function MafiaExit_func ( player, dim )
   
	if dim then
		fadeElementInterior ( player, 0, -777.915, 881.9804, 11.98 )
		toggleControl ( player, "fire", true )
		toggleControl ( player, "enter_exit", true )
		toggleControl ( player, "action", true )
		vnxSetElementData ( player,"nodmzone", 0)
	end
end
addEventHandler ( "onMarkerHit", MafiaExit, MafiaExit_func )


function MafiaEnter_func ( player, dim )

	if dim then
		if not getPedOccupiedVehicle ( player ) then
			if vnxGetElementData ( player, "fraktion" ) == 2 then
				fadeElementInterior ( player, 8, -42.649452209473, 1407.25, 1084.078 )
				toggleControl ( player, "fire", false )
				toggleControl ( player, "enter_exit", false )
				toggleControl ( player, "action", false )
				vnxSetElementData( player,"nodmzone", 1)
			end
		end
	end
end
addEventHandler ( "onMarkerHit", MafiaEnter, MafiaEnter_func )