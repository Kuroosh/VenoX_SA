--zipEntrance = createMarker ( -1882.7956542969, 866.05242919922, 34.165866851807, "cylinder", 1.2, getColorFromString("#FF000099") )
--zipExit = createMarker ( 161.54940795898, -95.684967041016, 1000.807128906, "cylinder", 1.2, getColorFromString("#FF000099") )
--zipBuy = createMarker ( 181.23762512207, -91.531929016113, 1000.82, "checkpoint", 1.2, getColorFromString("#FF000099") )
--setElementInterior ( zipExit, 18 )
--setElementInterior ( zipBuy, 18 )
zipBlip = createBlip ( -1882.7956542969, 866.05242919922, 34.165866851807, 45, 1, 0, 0, 0, 0, 0, 200, getRootElement() )
--

function clothesBuyServer_func ( player, skinid, skinpreis )

	if player == client then
		local skinpreis = tonumber ( skinpreis )
		local money = tonumber( vnxGetElementData ( player, "money" ) )
		if money >= skinpreis then
			vnxSetElementData ( player, "skinid", skinid )
			vnxSetElementData ( player, "money", money - skinpreis )
			playSoundFrontEnd ( player, 40 )
			triggerClientEvent ( player, "sucessfullBuyed", getRootElement() )
			setPedSkin ( player, skinid )
			setElementDimension ( player, 0 )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast zu\nwenig Geld!\nDer Skin kostet\n"..skinpreis.." $!", 5000, 125, 0, 0 )
		end
		setPlayerNametagShowing ( player, true )
	end
end
addEvent ( "clothesBuyServer", true )
addEventHandler ( "clothesBuyServer", getRootElement(), clothesBuyServer_func )

function clothesCancel_func ()

	setElementDimension ( client, 0 )
end
addEvent ( "clothesCancel", true )
addEventHandler ( "clothesCancel", getRootElement(), clothesCancel_func )

function zipMarkerHit ( marker, dim )

	local player = source
	if getPedOccupiedVehicle ( player ) == false and dim then
		--[[if marker == zipEntrance then
			setElementInterior ( player, 18, 161.66276550293, -93.030876159668, 1001.453918457 )
			triggerClientEvent(player,"blendLoadingScreen",player)
		end]]
		--[[if marker == zipExit then
			setElementInterior ( player, 0, -1886.0278320313, 863.37353515625, 34.822071075439 )
			triggerClientEvent(player,"blendLoadingScreen",player)
		end]]
		--[[if marker == zipBuy then
			setElementDimension ( player, math.random ( 1, 100000) )
			triggerClientEvent ( player, "_createSkinauswahlGui", player )
			showCursor ( player, true )
			setElementClicked ( player, true )
			setElementPosition ( player, 181.53558349609, -88.071517944336, 1001.672668457 )
			setCameraMatrix ( player, 178.41389465332, -87.539283752441, 1001.2360839844, 181.53558349609, -88.071517944336, 1001.672668457 )
		end]]
	end
	setPlayerNametagShowing ( player, true )
end
addEventHandler ( "onPlayerMarkerHit", getRootElement(), zipMarkerHit )

--[[local function KleidungRein(player)
	if getElementType(player) == "player" and not isPedInVehicle(player) then
		setElementInterior ( player, 18, 161.66276550293, -93.030876159668, 1001.453918457 )
		triggerClientEvent(player,"blendLoadingScreen",player)
	end
end

local function KleidungRaus(player)
	if getElementType(player) == "player" and not isPedInVehicle(player) then
		setElementInterior ( player, 0, -1886.0278320313, 863.37353515625, 34.822071075439 )
		triggerClientEvent(player,"blendLoadingScreen",player)
	end
end

local KleidungRein = createCustomPickup(-1882.7956542969, 866.05242919922, 34.165866851807, 0, 0, "anzeigen/cpickup/images/shirt.png", KleidungRein)
local KleidungRaus = createCustomPickup(161.54940795898, -95.684967041016, 1000.807128906, 0, 0, "anzeigen/cpickup/images/shirt.png", KleidungRaus)
]]