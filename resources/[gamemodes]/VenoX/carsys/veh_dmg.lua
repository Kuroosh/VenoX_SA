function veh_indestr_func (loss)

	if not getVehicleOccupant ( source, 0 ) then
		setElementHealth ( source, getElementHealth ( source ) + loss )
	end
end
addEventHandler ( "onVehicleDamage", getRootElement(), veh_indestr_func )