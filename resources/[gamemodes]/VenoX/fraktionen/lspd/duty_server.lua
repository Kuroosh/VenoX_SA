------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

LSPDDutyIcon = createPickup ( 256.89999389648, 70.099998474121, 1003.561340332, 3, 1239, 50, 0 )
setElementInterior ( LSPDDutyIcon, 6 )
--ticketIcon = createPickup ( 246.54, 118.03, 1002.86, 3, 1239, 50, 0 )
--setElementInterior ( ticketIcon, 6 )

function dutyhit ( player )
	infobox ( player, "Tippe /duty oder\n/swat, um in den\nDienst zu gehen.", 5000, 200, 200, 0 )
end
addEventHandler ( "onPickupHit", LSPDDutyIcon, dutyhit )

function isNearLSPDDutyIcon ( player )

	local x1, y1, z1 = getElementPosition ( player )
	local x2, y2, z2 = getElementPosition ( LSPDDutyIcon )
	if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) < 5 then
		return true
	end
	return false
end