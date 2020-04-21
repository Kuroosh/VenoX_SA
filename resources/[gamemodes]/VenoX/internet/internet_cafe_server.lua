createMarker ( -1594.703613281, 975.84777832031, 6.1202721595764, "cylinder", 1, 255, 0, 0, 200 )
internetEnterMarker = createMarker ( -1594.703613281, 975.84777832031, 6.1202721595764, "corona", 2, 255, 0, 0, 0 )
internetExitMarkerOptic = createMarker ( -2837.0786132813, 2810.2290039063, 67.285179138184, "cylinder", 1, 255, 0, 0, 200 )
internetExitMarker = createMarker ( -2837.0786132813, 2810.2290039063, 68.285179138184, "corona", 1.5, 255, 0, 0, 0 )

setElementInterior ( internetExitMarkerOptic, 1 )
setElementInterior ( internetExitMarker, 1 )

function internetMarkerHit ( player , dim)

	if getElementType ( player ) == "player" and dim then
		if not getPedOccupiedVehicle ( player ) then
			if source == internetExitMarker then
				fadeElementInterior ( player, 0, -1593.7854003906, 976.64703369141, 6.8444981575012 )
				setTimer ( setElementFrozen, 1000, 1, player, true )
				setTimer ( setElementFrozen, 1250, 1, player, false )
				setPedRotation ( player, 37.5 )
			else
				if vnxGetElementData ( player, "money" ) >= 5 then
					fadeElementInterior ( player, 1, -2837.0725097656, 2811.4958496094, 68.059410095215 )
					setPedRotation ( player, 90 )
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 5 )
					setTimer ( setElementFrozen, 1000, 1, player, true )
					setTimer ( setElementFrozen, 1250, 1, player, false )
					setTimer ( setElementFrozen, 250, 1, player, false )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Eintritt\nkostete 5$!!", 7500, 125, 0, 0 )
				else
					outputChatBox ( "Das Internetcafe zu betreten kostet 5 $!", player, 125, 0, 0 )
				end
			end
		end
	end
end
addEventHandler ( "onMarkerHit", internetEnterMarker, internetMarkerHit )
addEventHandler ( "onMarkerHit", internetExitMarker, internetMarkerHit )