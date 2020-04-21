local customPickups = {}

function createCustomPickup(x, y, z, int, dim, image, func)
    local pickup = { x = x, y = y, z = z, int = int, dim = dim, image = image, func = func }
    local colShape = createColSphere(x, y, z, 1)
    setElementID(colShape, "customPickup")
    setElementData(colShape, "customPickup.image", image)
    setElementData(colShape, "customPickup.positions", { x, y, z })
    addEventHandler('onColShapeHit', colShape, eventCustomPickup)
    pickup.colshape = colShape
    customPickups[tostring(colShape)] = pickup
end

function eventCustomPickup(player)
    if getElementID(source) == 'customPickup' and getElementType(player) == 'player' then
        customPickups[tostring(source)].func(player)
    end
end


-- NICHR ANFASSEN!

--[[local function drivingSchoolIn(player)
    if getElementType(player) == "player" and not isPedInVehicle(player) then
        --fadeElementInterior(player, -2029.798339, -106.675910, 1035.171875, 3)
    end
end]]


--local FahrschuleIn = createCustomPickup(-2168.199, 35.9917, 35.17, 0, 0, "anzeigen/cpickupanzeigen/cpickup/images/cpickup/vnxicon.png", drivingSchoolIn)
-------------------------------------------------------------------------------------------------------------------------------------------------------------
------Kleidungsladen------

--[[ local function KleidungRein(player)
	if getElementType(player) == "player" and not isPedInVehicle(player) then
		triggerClientEvent(player,"blendLoadingScreen",player)
		setElementInterior ( player, 18, 161.66276550293, -93.030876159668, 1001.453918457 )
	end
end

local function KleidungRaus(player)
	if getElementType(player) == "player" and not isPedInVehicle(player) then
		triggerClientEvent(player,"blendLoadingScreen",player)
		setElementInterior ( player, 0, -1886.0278320313, 863.37353515625, 34.822071075439 )
	end
end

local function KleidungKauf(player)
	if getElementType(player) == "player" and not isPedInVehicle(player) then
		setElementDimension ( player, math.random ( 1, 100000) )
		triggerClientEvent ( player, "_createSkinauswahlGui", player )
		showCursor ( player, true )
		setElementClicked ( player, true )
		setElementPosition ( player, 181.53558349609, -88.071517944336, 1001.672668457 )
		setCameraMatrix ( player, 178.41389465332, -87.539283752441, 1001.2360839844, 181.53558349609, -88.071517944336, 1001.672668457 )
	end
end ]]
-------------------------------------------------------------------------------------------------------------------------------------------------------------
--[[
local KleidungRein = createCustomPickup(-1882.7956542969, 866.05242919922, 35.17, 0, 0, "anzeigen/cpickupanzeigen/cpickup/images/cpickup/rein.png", KleidungRein)
local KleidungRaus = createCustomPickup(161.54940795898, -95.684967041016, 1001.8046875, 0, 0, "anzeigen/cpickupanzeigen/cpickup/images/cpickup/raus.png", KleidungRaus)
local KleidungKauf = createCustomPickup(181.23762512207, -91.531929016113, 1001.8046875, 0, 0, "anzeigen/cpickupanzeigen/cpickup/images/cpickup/shirt.png", KleidungKauf)
-------------------------------------------------------------------------------------------------------------------------------------------------------------]]

------ Kleidungsladen ------

local function KleidungRein(player)
	if getElementType(player) == "player" and not isPedInVehicle(player) then
		triggerClientEvent(player,"blendLoadingScreen",player)
		setElementInterior ( player, 18, 161.66276550293, -93.030876159668, 1001.453918457 )
	end
end

local function KleidungRaus(player)
	if getElementType(player) == "player" and not isPedInVehicle(player) then
		triggerClientEvent(player,"blendLoadingScreen",player)
		setElementInterior ( player, 0, -1886.0278320313, 863.37353515625, 34.822071075439 )
	end
end

local function KleidungKauf(player)
	if getElementType(player) == "player" and not isPedInVehicle(player) then
		setElementDimension ( player, math.random ( 1, 100000) )
		triggerClientEvent ( player, "_createSkinauswahlGui", player )
		showCursor ( player, true )
		setElementClicked ( player, true )
		setElementPosition ( player, 181.53558349609, -88.071517944336, 1001.672668457 )
		setCameraMatrix ( player, 178.41389465332, -87.539283752441, 1001.2360839844, 181.53558349609, -88.071517944336, 1001.672668457 )
	end
end

local KleidungRein = createCustomPickup(-1882.7956542969, 866.05242919922, 35.17, 0, 0, "anzeigen/cpickup/images/rein.png", KleidungRein)
local KleidungRaus = createCustomPickup(161.54940795898, -95.684967041016, 1001.8046875, 0, 0, "anzeigen/cpickup/images/raus.png", KleidungRaus)
local KleidungKauf = createCustomPickup(181.23762512207, -91.531929016113, 1001.8046875, 0, 0, "anzeigen/cpickup/images/shirt.png", KleidungKauf)



------ CJ Shop ------
