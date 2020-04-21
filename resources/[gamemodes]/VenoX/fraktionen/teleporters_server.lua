local marker
local markerDatas = {}

function createFactionTeleporter ( x1, y1, z1, int1, dim1, size, x2, y2, z2, int2, dim2, rot, fraktion1, fraktion2, fraktion3 )

	local opticMarker = createMarker ( x1, y1, z1, "cylinder", 1, getColorFromString ( "#FF000099" ) )
	local marker = createMarker ( x1, y1, z1 + 1, "corona", 1, 0, 0, 0, 0 )
	setElementInterior ( marker, int1 )
	setElementInterior ( opticMarker, int1 )
	setElementDimension ( marker, int1 )
	setElementDimension ( opticMarker, dim1 )

	markerDatas[marker] = { ["fraktion1"] = fraktion1, ["fraktion2"] = fraktion2, ["fraktion3"] = fraktion3, ["int"] = int2, ["dim"] = dim2, ["rot"] = rot, ["x"] = x2, ["y"] = y2, ["z"] = z2 }

	addEventHandler ( "onMarkerHit", marker,
		function ( hit, dim )
			if getElementType ( hit ) == "player" then
				if not getPedOccupiedVehicle ( hit ) then
					if getElementInterior ( hit ) == getElementInterior ( source ) --[[and dim then]] then
						local frac = vnxGetElementData ( hit, "fraktion" )
						if not markerDatas[source]["fraktion1"] or frac == markerDatas[source]["fraktion1"] or ( markerDatas[source]["fraktion2"] and frac == markerDatas[source]["fraktion2"] ) or ( markerDatas[source]["fraktion3"] and frac == markerDatas[source]["fraktion3"] ) then
							local int = markerDatas[source]["int"]
							local dim = markerDatas[source]["dim"]
							local rot = markerDatas[source]["rot"]
							local x, y, z = markerDatas[source]["x"], markerDatas[source]["y"], markerDatas[source]["z"]
							fadeElementInterior ( hit, int, x, y, z, rot, dim )
						end
					end
				end
			end
		end
	)
end

local x1, y1, z1, int1, size, x2, y2, z2, int2, rot
size = 1
-- Dach -> Inner
x1, y1, z1 = 2175.60546875, 1627.1845703125, 47.589630126953
x2, y2, z2 = 2270.939453125, 1635.5747070313, 1008.008605957
int1, int2 = 0, 1
rot = 180
createFactionTeleporter ( x1, y1, z1, int1, 0, size, x2, y2, z2, int2, 0, rot, 2 )

-- Inner -> Dach
x1, y1, z1 = 2270.9641113281, 1637.6722412109, 1007.3486328125
x2, y2, z2 = 2174.1049804688, 1627.2492675781, 48.246990203857
int1, int2 = 1, 0
rot = 90
createFactionTeleporter ( x1, y1, z1, int1, 0, size, x2, y2, z2, int2, 0, rot, 2 )

-- Garage -> Inner
x1, y1, z1 = 2283.5319824219, 1726.1629638672, 10.016862869263
x2, y2, z2 = 2157.3452148438, 1598.1253662109, 999.61895751953
int1, int2 = 0, 1
rot = 270
createFactionTeleporter ( x1, y1, z1, int1, 0, size, x2, y2, z2, int2, 0, rot, 2 )

-- Inner -> Garage
x1, y1, z1 = 2155.833984375, 1598.0736083984, 998.94165039063
x2, y2, z2 = 2285.0327148438, 1726.0914306641, 10.696100234985
int1, int2 = 1, 0
rot = 270
createFactionTeleporter ( x1, y1, z1, int1, 0, size, x2, y2, z2, int2, 0, rot, 2 )

mafiaCasinoInToOut = createMarker ( 2309.67, 1733.28, 9.79, "cylinder", 5, getColorFromString ( "#FF000099" ) )
addEventHandler ( "onMarkerHit", mafiaCasinoInToOut,
	function ( hit, dim )
		if getElementType ( hit ) == "player" then
			if getPedOccupiedVehicleSeat ( hit ) == 0 then
				if getElementInterior ( hit ) == getElementInterior ( source ) then
					if vnxGetElementData ( hit, "fraktion" ) == 2 then
						local veh = getPedOccupiedVehicle ( hit )
						setElementPosition ( veh, 2323.4599609375, 1733.2225341797, 10.671875 )
						setElementRotation ( veh, 0, 0, 270 )
						setElementFrozen ( veh, true )
						setElementVelocity ( veh, 0, 0, 0 )
						setTimer ( setElementFrozen, 500, 1, veh, false )
					end
				end
			end
		end
	end
)

mafiaCasinoOutToIn = createMarker ( 2316.4267578125, 1733.3040771484, 9.7964038848877, "cylinder", 5, getColorFromString ( "#FF000099" ) )
addEventHandler ( "onMarkerHit", mafiaCasinoOutToIn,
	function ( hit, dim )
		if getElementType ( hit ) == "player" then
			if getPedOccupiedVehicleSeat ( hit ) == 0 then
				if getElementInterior ( hit ) == getElementInterior ( source ) then
					if vnxGetElementData ( hit, "fraktion" ) == 2 then
						local veh = getPedOccupiedVehicle ( hit )
						setElementPosition ( veh, 2303.0354003906, 1733.1401367188, 10.8203125 )
						setElementRotation ( veh, 0, 0, 90 )
						setElementFrozen ( veh, true )
						setElementVelocity ( veh, 0, 0, 0 )
						setTimer ( setElementFrozen, 500, 1, veh, false )
					end
				end
			end
		end
	end
)

