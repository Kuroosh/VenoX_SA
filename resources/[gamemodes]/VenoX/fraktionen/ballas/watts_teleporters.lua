------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

local WattsToInt = createMarker ( 1155.3000488281, -1180.9000244141, 31.899999237061, "corona", 1.5, 255, 0, 0, 150 )
local WattsFromInt = createMarker ( 2541.5595703125, -1303.998046875, 1025.0703125, "corona", 1.5, 255, 0, 0, 150 )
setElementInterior (WattsFromInt, 2)

local WattsFromHeli = createMarker ( 1170.9000244141, -1174.6999511719, 90.400001525879, "corona", 1.5, 255, 0, 0, 150 )
local WattsToHeli = createMarker ( 2529.0437011719, -1293.9339599609, 1031.421875, "corona", 1.5, 255, 0, 0, 150 )
setElementInterior (WattsToHeli, 2)


local function WattsToInt_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isBallas (source) or isCop(source) or isFBI(source) or isArmy(source) then
			fadeElementInterior ( hitElement, 2, 2543.9558105469, -1304.1212158203, 1025.0703125 )
			infobox ( hitElement, "\n\nWillkommen, Watts Soldier!", 5000, 0, 125, 0 )
		else
			outputChatBox ( "Du bist kein Mitglied der Watts Soldiers oder nicht befugt!", hitElement, 125, 0, 0 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", WattsToInt, WattsToInt_func )

local function WattsFromInt_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isBallas (source) or isCop(source) or isFBI(source) or isArmy(source) then
			fadeElementInterior ( hitElement, 0, 1153.3000488281, -1180.8000488281, 32.89999961853 )
		else
			outputChatBox ( "Du bist kein Mitglied der Watts Soldiers oder nicht befugt!", hitElement, 125, 0, 0 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", WattsFromInt, WattsFromInt_func )



local function WattsFromHeli_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isBallas (source) or isCop(source) or isFBI(source) or isArmy(source) then
			fadeElementInterior ( hitElement, 2, 2526.9040527344, -1293.7293701172, 1031.421875 )
			infobox ( hitElement, "\n\nWillkommen, Watts Soldier!", 5000, 0, 125, 0 )
		else
			outputChatBox ( "Du bist kein Mitglied der Watts Soldiers oder nicht befugt!", hitElement, 125, 0, 0 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", WattsFromHeli, WattsFromHeli_func )

local function WattsToHeli_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isBallas (source) or isCop(source) or isFBI(source) or isArmy(source) or vnxGetElementData( source, "adminlvl" ) >= 3 then
			fadeElementInterior ( hitElement, 0, 1168.6999511719, -1177, 91.400001525879 )
		else
			outputChatBox ( "Du bist kein Mitglied der Watts Soldiers oder nicht befugt!", hitElement, 125, 0, 0 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", WattsToHeli, WattsToHeli_func )