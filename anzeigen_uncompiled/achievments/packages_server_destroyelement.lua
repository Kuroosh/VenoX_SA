--[[
function pickupPackageTrigger( player )
	triggerEvent("VnXPointFound", player)
end

packagenummer1 = createCustomPickup(-1785.117, 356.762, 16.760, 0, 0, "anzeigen/cpickup/images/vnxicon.png", pickupPackageTrigger)



function hidepackagenummer1_func ( packagenummer1 )
	setElementDimension ( packagenummer1, 95 )
end
addEvent ( "hidepackagenummer1", true )
addEventHandler ( "hidepackagenummer1", root, hidepackagenummer1_func )


function hidePackagesArray_func ( array )
	for i=1, #array do 
		setElementDimension ( array[i], 95 )
	end
end
addEvent ( "hidePackagesArray", true )
addEventHandler ( "hidePackagesArray", root, hidePackagesArray_func )]]
