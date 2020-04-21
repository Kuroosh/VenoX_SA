addEvent ( "makePedInvulnerable", true )

function createInvulnerablePed ( skin, x, y, z, r, int, dim )

	local ped = createPed ( skin, x, y, z )
	if not dim then
		dim = 0
	end
	setElementInterior ( ped, int )
	setElementDimension ( ped, dim )
	setPedRotation ( ped, r )
	addEventHandler ( "onClientPedDamage", ped,
		function ()
			cancelEvent()
		end
	)
	return ped
end

function makePedInvulnerable_func ( peds )
	for ped, _ in pairs ( peds ) do
		addEventHandler ( "onClientPedDamage", ped, _cancelEvent )
	end
end
addEventHandler ( "makePedInvulnerable", root, makePedInvulnerable_func )


function _cancelEvent ( )
	cancelEvent()
end