-- Hunter: 425	Prim/Sek = Raketen/MG
-- Hydra: 520,	Prim/Sek = 
-- Panzer: 432,	Prim/Sek = Schuss

function vehFire1 ()

	local lv = getPedOccupiedVehicle ( lp )
	if getElementModel ( lv ) == 432 then
		if not isTimer ( reEnableFireTime ) then
			reEnableFireTime = setTimer ( reEnableFire, 15000, 1 )
			toggleControl ( "vehicle_fire", false )
			toggleControl ( "vehicle_secondary_fire", false )
			setPedControlState ( "vehicle_fire", true )
			setTimer ( setPedControlState, 100, 1, "vehicle_fire", false )
		end
	elseif getElementModel ( lv ) == 425 then
		if not isTimer ( reEnableFireTime ) then
			reEnableFireTime = setTimer ( reEnableFire, 5000, 1 )
			toggleControl ( "vehicle_fire", false )
			setPedControlState ( "vehicle_fire", true )
			setTimer ( setPedControlState, 100, 1, "vehicle_fire", false )
		end
	end
end
function vehFire2 ()

	local lv = getPedOccupiedVehicle ( lp )
	if getElementModel ( lv ) == 432 or getElementModel ( lv ) == 520 then
		if not isTimer ( reEnableFireTime ) then
			reEnableFireTime = setTimer ( reEnableFire, 8000, 1 )
			toggleControl ( "vehicle_fire", false )
			toggleControl ( "vehicle_secondary_fire", false )
			setPedControlState ( "vehicle_secondary_fire", true )
			setTimer ( setPedControlState, 100, 1, "vehicle_secondary_fire", false )
		end
	end
end

function reEnableFire ()

	toggleControl ( "vehicle_fire", true )
	toggleControl ( "vehicle_secondary_fire", true )
end

bindKey ( "vehicle_fire", "down", vehFire1 )
bindKey ( "vehicle_secondary_fire", "down", vehFire2 )