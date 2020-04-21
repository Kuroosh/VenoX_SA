------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

local LSPDExit = createMarker ( 246.80000305176, 62, 1004.0999755859, "corona", 1.5, 0, 255, 0, 150 )
setElementInterior (LSPDExit, 6)

local LSPDEnter = createMarker ( 1555.1999511719, -1675.5999755859, 16.200000762939, "corona", 1.5, 0, 255, 0, 150 )

local LSPDLiftIn = createMarker ( 217.60000610352, 67, 1005, "corona", 1.5, 0, 255, 0, 150 )
setElementInterior ( LSPDLiftIn, 6 )

local LSPDLiftOut = createMarker ( 1568.6999511719, -1690.0999755859, 6.1999998092651, "corona", 1.5, 0, 255, 0, 150 )

local function LSoutTOinLift ( hitElement, dim )
	if getElementType(hitElement) == "player" and (dim) then
		if isPedInVehicle ( hitElement ) == false then
			removePedFromVehicle ( hitElement )
			fadeElementInterior ( hitElement, 6, 219.19999694824, 69.300003051758, 1005 )
		end
	end
end
addEventHandler ( "onMarkerHit", LSPDLiftOut, LSoutTOinLift )

local function LSinTOoutLift ( hitElement, dim )
	if getElementType(hitElement) == "player" and (dim) then
		if isPedInVehicle ( hitElement ) == false then
			removePedFromVehicle ( hitElement )
			fadeElementInterior ( hitElement, 0, 1569, -1694.6999511719, 5.9000000953674 )
		end
	end
end
addEventHandler ( "onMarkerHit", LSPDLiftIn, LSinTOoutLift )

local function LSPDExit_func ( hitElement, dim )
	if getElementType(hitElement) == "player" and (dim) then
		if isPedInVehicle ( hitElement ) == false then
			removePedFromVehicle ( hitElement )
			fadeElementInterior ( hitElement, 0, 1552.4000244141, -1675.5999755859, 16.200000762939 )
		end
	end
end
addEventHandler ( "onMarkerHit", LSPDExit, LSPDExit_func )

local function LSPDEnter_func ( hitElement, dim )
	if getElementType(hitElement) == "player" and (dim) then
		if isPedInVehicle ( hitElement ) == false then
			removePedFromVehicle ( hitElement )
			fadeElementInterior ( hitElement, 6, 246.60000610352, 64.5, 1003.5999755859 )
			infobox ( hitElement, "\n\nWillkommen im LSPD!", 5000, 0, 125, 0 )
		end
	end
end
addEventHandler ( "onMarkerHit", LSPDEnter, LSPDEnter_func )