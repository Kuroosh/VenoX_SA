local invulnerablePeds = {}
local invulnerableTicketPedsCoordinates = {}

function createInvulnerableTicketPed ( skin, x, y, z, rot, int, dim )

	local ped = createPed ( skin, x, y, z, rot )
	setPedRotation ( ped, rot )
	invulnerableTicketPedsCoordinates[ped] = { ["x"] = x, ["y"] = y, ["z"] = z, ["rot"] = rot }
	setElementDimension ( ped, dim )
	setElementInterior ( ped, int )
	addEventHandler ( "onPedWasted", ped,
		function ()
			local x = invulnerableTicketPedsCoordinates[source]["x"]
			local y = invulnerableTicketPedsCoordinates[source]["y"]
			local z = invulnerableTicketPedsCoordinates[source]["z"]
			local skin = getElementModel ( source )
			local dim = getElementDimension ( source )
			local int = getElementInterior ( source )
			local rot = invulnerableTicketPedsCoordinates[source]["rot"]
			destroyElement ( source )
			createInvulnerableTicketPed ( skin, x, y, z, rot, int, dim )
			--[[ped = createPed ( skin, x, y, z, rot )
			vnxSetElementData ( ped, "x", x )
			vnxSetElementData ( ped, "y", y )
			vnxSetElementData ( ped, "z", z )
			vnxSetElementData ( ped, "rot", rot )
			setElementDimension ( ped, dim )
			setElementInterior ( ped, int )]]
		end
	)
end
-- SF
createInvulnerableTicketPed ( 283, 238.91540527344, 112.89644622803, 1002.867980957, -90, 10, 0 )
-- LV
createInvulnerableTicketPed ( 283, 293.81640625, 182.29084777832, 1006.821105957, 180 - 45, 3, 0 )

function createInvulnerablePed ( skin, x, y, z, rot, int, dim )

	if not int then
		int = 0
	end
	if not dim then
		dim = 0
	end
	local ped = createPed ( skin, x, y, z, rot )
	setElementInterior ( ped, int )
	setElementDimension ( ped, dim )
	invulnerablePeds[ped] = true
	return ped
end

function syncInvulnerablePedsWithPlayer ( player )
	for key, index in pairs ( invulnerablePeds ) do
		if not isElement ( key ) then
			invulnerablePeds[key] = nil
		end
	end
	triggerClientEvent ( player, "makePedInvulnerable", player, invulnerablePeds )
end
