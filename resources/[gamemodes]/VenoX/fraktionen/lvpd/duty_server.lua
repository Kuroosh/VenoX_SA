LVPDDuty = createPickup ( 297.53289794922, 186.17768859863, 1006.821105957, 3, 1239, 50, 0 )
setElementInterior ( LVPDDuty, 3 )

function dutyhit ( player )

	infobox ( player, "Tippe /duty oder\n/swat, um in den\nDienst zu gehen.\n/fskin zum Outfit\naendern.", 5000, 200, 200, 0 )
end
addEventHandler ( "onPickupHit", LVPDDuty, dutyhit )

function isNearLVPDDutyIcon ( player )

	local x1, y1, z1 = getElementPosition ( player )
	local x2, y2, z2 = getElementPosition ( LVPDDuty )
	if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) < 5 then
		return true
	end
	return false
end