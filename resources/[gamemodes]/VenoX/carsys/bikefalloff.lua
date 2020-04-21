-------------------------
------- (c) 2010 --------
------- by Zipper -------
-- and Vio MTA:RL Crew --
-------------------------

bikes = { [471]=true, [523]=true, [581]=true, [521]=true, [463]=true, [522]=true, [461]=true, [468]=true, [586]=true }

function LPlayerBikeEnter ( player, seat )

	if player == lp then
		if bikes[getElementModel ( source )] or getElementModel ( source ) == 462 then
			if seat == 0 then
				setPedCanBeKnockedOffBike ( getLocalPlayer(), true )
			else
				setPedCanBeKnockedOffBike ( getLocalPlayer(), false )
			end
		end
	end
end
addEventHandler ( "onClientVehicleEnter", getRootElement(), LPlayerBikeEnter )

function heliDMGCancel ( atk, w )

	if w == 50 then
		cancelEvent()
	end
end
addEventHandler ( "onClientPlayerDamage", getRootElement(), heliDMGCancel )