------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

local ComptonFromIntSF = createMarker ( 422.043, 2536.47, 10, "corona", 1.5, 255, 0, 0, 150 )
local ComptonToIntSF = createMarker ( -2205.7, 13.6, 35.3, "corona", 1.5, 255, 0, 0, 150 )
setElementInterior (ComptonFromIntSF, 10)

local function ComptonToIntSF_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isGrove(hitElement) or isCop(hitElement) or isFBI(hitElement) or isArmy(hitElement) then
			fadeElementInterior ( hitElement, 10, 420.10, 2536.864, 10 )
			infobox ( hitElement, "\n\nWillkommen, Compton G!", 5000, 0, 125, 0 )
		else
			outputChatBox ( "Du bist kein Mitglied der Compton Families oder nicht befugt!", hitElement, 125, 0, 0 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", ComptonToIntSF, ComptonToIntSF_func )

local function ComptonFromIntSF_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isGrove(hitElement) or isCop(hitElement) or isFBI(hitElement) or isArmy(hitElement) then
			fadeElementInterior ( hitElement, 0, -2207.885, 13.556, 35.32 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", ComptonFromIntSF, ComptonFromIntSF_func )


local ComptonToInt = createMarker ( 2421.5, -1219.5000244141, 24.599999237061, "corona", 1.5, 255, 0, 0, 150 )
local ComptonFromInt = createMarker ( 1204.5966796875, -13.3916015625, 1000.92, "corona", 1.5, 255, 0, 0, 150 )
setElementInterior (ComptonFromInt, 2)


local function ComptonToInt_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isGrove(hitElement) or isCop(hitElement) or isFBI(hitElement) or isArmy(hitElement) then
			fadeElementInterior ( hitElement, 2, 1205.0712890625, -10.9082031251, 1000.921875 )
			infobox ( hitElement, "\n\nWillkommen, Compton G!", 5000, 0, 125, 0 )
		else
			outputChatBox ( "Du bist kein Mitglied der Compton Families oder nicht befugt!", hitElement, 125, 0, 0 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", ComptonToInt, ComptonToInt_func )

local function ComptonFromInt_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isGrove(hitElement) or isCop(hitElement) or isFBI(hitElement) or isArmy(hitElement) then
			fadeElementInterior ( hitElement, 0, 2421.5, -1221.9000244141, 25.299999237061 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", ComptonFromInt, ComptonFromInt_func )