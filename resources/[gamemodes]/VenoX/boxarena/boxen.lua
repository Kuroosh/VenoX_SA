--[[createMarker ( -2270.4819335938, -155.90458679199, 34.299884796143, "cylinder", 1, 125, 0, 0, 255 )
local boxenExitOptic = createMarker ( 1741.6705322266, 1783.4482421875, 1544.0844726563, "cylinder", 1, 125, 0, 0, 255 )
local boxenEntrance = createMarker ( -2270.4819335938, -155.90458679199, 35.299884796143, "corona", 1, 125, 0, 0, 0 )
local boxenExit = createMarker ( 1741.6705322266, 1783.4482421875, 1545.0844726563, "corona", 1, 125, 0, 0, 0 )
setElementInterior ( boxenExitOptic, 5 )
setElementInterior ( boxenExit, 5 )

function boxenMarkerHit ( hit )

	if getElementInterior ( hit ) == 5 then
		fadeElementInterior ( hit, 0, -2267.333984375, -155.49554443359, 34.969539642334 )
	else
		if not getPedOccupiedVehicle ( hit ) then
			fadeElementInterior ( hit, 5, 1741.3571777344, 1775.3503417969, 1546 )
			setElementFrozen ( hit, true )
			setTimer ( setElementFrozen, 1500, 1, hit, false )
		end
	end
end
addEventHandler ( "onMarkerHit", boxenEntrance, boxenMarkerHit )
addEventHandler ( "onMarkerHit", boxenExit, boxenMarkerHit )]]--


boxEnterMarker = createMarker ( -2270.4819335938, -155.90458679199, 34.299884796143, "cylinder", 1.5, 255, 0, 0, 150 )
boxExitMarker = createMarker ( 1741.6705322266, 1783.4482421875, 1544.0844726563, "cylinder", 1.5, 255, 0, 0, 150 )
setElementInterior ( boxExitMarker, 5 )

function enterbox ( hit, dim )

	if hit and dim then
		if getElementType ( hit ) == "player" then
			if not getPedOccupiedVehicle ( hit ) then
				local x, y, z, r = 1741.3571777344, 1775.3503417969, 1546, 0
				setElementInterior ( hit, 5, x, y, z, r )
			end
		end
	end
end
addEventHandler ( "onMarkerHit", boxEnterMarker, enterbox )

function exitbox ( hit, dim )

	if hit and dim then
		if getElementType ( hit ) == "player" then
			if not getPedOccupiedVehicle ( hit ) then
				local x, y, z, r = -2267.333984375, -155.49554443359, 34.969539642334, 105
				setElementInterior ( hit, 0, x, y, z, r )
			end
		end
	end
end
addEventHandler ( "onMarkerHit", boxExitMarker, exitbox )