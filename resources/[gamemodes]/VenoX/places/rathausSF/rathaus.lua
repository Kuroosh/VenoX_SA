--[[jobchoosepickup = createPickup ( 362.39953613281, 180.4635925293, 1008.0034790039, 3, 1210, 50)
setElementInterior (jobchoosepickup, 3, 362.39953613281, 180.4635925293, 1008.0034790039)

createMarker ( -1492.8582763672, 920.14044189453, 6.1, "cylinder", 1, getColorFromString ( "#FF000099" ) )
cityHallEnter = createMarker ( -1492.8582763672, 920.14044189453, 6.1+.5, "corona", 1, 0, 0, 0, 0 )
cityHallExit = createMarker ( 389.89999389648, 173.82061767578, 1007.3699951172+.5, "corona", 1, 0, 0, 0, 0 )
cityHallExitOptic = createMarker ( 389.89999389648, 173.82061767578, 1007.3699951172, "cylinder", 1, getColorFromString ( "#FF000099" ) )
setElementInterior ( cityHallExit, 3 )
setElementInterior ( cityHallExitOptic, 3 )

function jobchoosepickup_func (player)

	setElementFrozen ( player, true )
    setTimer ( setElementFrozen, 100, 1, player, false )
	triggerClientEvent ( player, "showJobGui", getRootElement() )
	showCursor ( player, true )
	setElementClicked ( player, true )
end
addEventHandler ( "onPickupHit", jobchoosepickup, jobchoosepickup_func )

function pickedUpRathaus (source, dim)

	if getPedOccupiedVehicle(source) == false and dim then
		fadeElementInterior ( source, 3, 388.5, 173.82061767578, 1008.032043457, 90 )
		toggleControl ( source, "fire", false )
		toggleControl ( source, "enter_exit", false )
		vnxSetElementData(source,"nodmzone", 1)
	end
end
addEventHandler ( "onMarkerHit", cityHallEnter, pickedUpRathaus )

function pickedUpRathaus2 (source)

   fadeElementInterior ( source, 0, -1498.32, 920.14, 6.1, 180 )
   toggleControl ( source, "fire", true )
   toggleControl ( source, "enter_exit", true )
   vnxSetElementData(source,"nodmzone", 0)
end
addEventHandler ( "onMarkerHit", cityHallExit, pickedUpRathaus2 )

rathausmarker = createMarker ( 362.45562744141, 173.81, 1007.5, "corona", 2, 125, 0, 0, 0 )
setElementInterior (rathausmarker, 3)
rathausmarker2 = createMarker ( 362.45562744141, 173.81, 1007, "cylinder", 1, 125, 0, 0 )
setElementInterior (rathausmarker2, 3)

function rathausmarker_func (player)
   
    setElementFrozen ( player, true )
    setTimer ( setElementFrozen, 100, 1, player, false )
	triggerClientEvent ( player, "ShowRathausMenue", getRootElement() )
	showCursor ( player, true )
	setElementClicked ( player, true )
end
addEventHandler ( "onMarkerHit", rathausmarker, rathausmarker_func )

rathausped = createPed(141, 359.7138671875, 173.625765625, 1008.38934)
setElementInterior (rathausped, 3)
setPedRotation(rathausped, 280)

--]]