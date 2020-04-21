createMarker ( -2270.4819335938, -155.90458679199, 34.299884796143, "cylinder", 1, 125, 0, 0, 255 )
local boxenExitOptic = createMarker ( 1741.6705322266, 1783.4482421875, 1544.0844726563, "cylinder", 1, 125, 0, 0, 255 )
local boxenEntrance = createMarker ( -2270.4819335938, -155.90458679199, 35.299884796143, "corona", 1, 125, 0, 0, 0 )
local boxenExit = createMarker ( 1741.6705322266, 1783.4482421875, 1545.0844726563, "corona", 1, 125, 0, 0, 0 )
setElementInterior ( boxenExitOptic, 5 )
setElementInterior ( boxenExit, 5 )

function boxenMarkerHit ( hit, dim )
	if dim then
		if getElementInterior ( hit ) == 5 then
			fadeElementInterior ( hit, 0, -2267.333984375, -155.49554443359, 34.969539642334 )
		else
			if not getPedOccupiedVehicle ( hit ) then
				fadeElementInterior ( hit, 5, 1741.9647216797, 1781.1187744141, 1544.7521972656 )
				setElementFrozen ( hit, true )
				setTimer ( setElementFrozen, 1500, 1, hit, false )
			end
		end
	end
end
addEventHandler ( "onMarkerHit", boxenEntrance, boxenMarkerHit )
addEventHandler ( "onMarkerHit", boxenExit, boxenMarkerHit )