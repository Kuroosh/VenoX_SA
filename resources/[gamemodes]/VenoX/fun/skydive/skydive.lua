PlaneExitMarker = createMarker ( 315.65246582031, 1029.5246582031, 1949.32, "corona", 20, 125, 0, 0, 200 )
setElementInterior ( PlaneExitMarker, 9 )
PlaneEnterMarker = createMarker ( -1552.60546875, -427.16171264648, 4.99, "cylinder", 1.2, 125, 0, 0, 200 )

BasejumpTowerDown = createMarker ( -1753.609375, 883.71209716797, 295.5009765625, "corona", 1, 125, 0, 0, 200 )
BasejumpTowerUp = createMarker ( -1749.3293457031, 870.81555175781, 24.035942077637, "cylinder", 3, 125, 0, 0, 200 )

skydivePrice = 50

function PlaneEnterMarkerHit ( player, dim )

	triggerClientEvent ( player, "infobox_start", getRootElement(), "Tippe /parachute,\num fuer "..skydivePrice.." $\neinen Fallschirm-sprung zu\nmachen", 7500, 0, 125, 0 )
end
addEventHandler ( "onMarkerHit", PlaneEnterMarker, PlaneEnterMarkerHit )

function PlaneExitMarkerHit ( player, dim )

	if dim then
		fadeElementInterior ( player, 0, -2250, 455, 3000 )
	end
end
addEventHandler ( "onMarkerHit", PlaneExitMarker, PlaneExitMarkerHit )

function parachute_func ( player )

	local x, y, z = getElementPosition ( player )
	if getDistanceBetweenPoints3D ( -1552.60546875, -427.16171264648, 4.99, x, y, z ) <= 3 then
		if vnxGetElementData ( player, "money" ) >= skydivePrice then
			takePlayerSaveMoney ( player, skydivePrice )
			removePedFromVehicle ( player )
			fadeElementInterior ( player, 9, 315.77294921875, 986.72650146484, 1958.1627197266 )
			giveWeapon ( player, 46, 1, true )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht\ngenug Geld,\nein Sprung\nkostet "..skydivePrice.." $!", 7500, 0, 125, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist zu\nweit entfernt!", 7500, 125, 0, 0 )
	end
end
addCommandHandler ( "parachute", parachute_func )

function BasejumpTowerHit ( player, dim )

	if dim then
		if source == BasejumpTowerDown then
			fadeElementInterior ( player, 0, -1749.3260498047, 867.03533935547, 24.735162734985 )
		elseif source == BasejumpTowerUp then
			fadeElementInterior ( player, 0, -1753.6976318359, 885.82843017578, 295.52423095703 )
		end
	end
end
addEventHandler ( "onMarkerHit", BasejumpTowerDown, BasejumpTowerHit )
addEventHandler ( "onMarkerHit", BasejumpTowerUp, BasejumpTowerHit )