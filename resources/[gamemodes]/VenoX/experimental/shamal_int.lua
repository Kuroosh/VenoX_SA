function shamal_enter ( player )
    
	if getElementModel ( source ) == 519 and getElementData ( source, "locked" ) ~= true and getVehicleOccupant ( source ) == true then
		setElementInterior ( player, 1, 1.5474383831024, 23.249214172363, 1198.9636230469 )
	end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), shamal_enter )

function shamal_doors ( )

	setElementInterior ( createObject ( 3089, 0.935546875, 34.3876953125, 1199.9227294922, 0, 0, 270 ), 1 )
	setElementInterior ( createObject ( 3089, 2.3448967933655, 23.881008148193, 1199.9202880859, 0, 0, 0 ), 1 )
end
addEventHandler ( "onResourceStart", resourceRoot, shamal_doors )