g_base_col = createColCuboid ( 97.3376, 1800.0384, -32.0937, 250, 280, 120 )

g_root = getRootElement ()

function hit ( pla, dim, hitElement )
	if getElementType ( pla ) == "player" then
	local vehicle = getPedOccupiedVehicle ( pla )
		if vehicle or not vehicle then
			local skin = getElementModel ( pla )
                        if skin == 287 then
			else
				setElementData ( pla, "inRestrictedArea", "true" )
				triggerClientEvent ( pla, "destroyTrepassor", g_root, pla )
				--outputChatBox ( ""..getPlayerName(pla).." verschwinde von der Area51 oder du stirbst!!", g_root, 255, 0, 0 )
				outputChatBox ( "Verschwinde von der Area51 oder du stirbst. Du hast 40Sekunden zeit!!", getRootElement(), 255, 0, 0 )
			end
		end
	end
end
addEventHandler ( "onColShapeHit", g_base_col, hit )

function leave ( pla, dim )
	if getElementType ( pla ) == "player" then
	local vehicle = getPedOccupiedVehicle ( pla )
		if vehicle or not vehicle then
			local skin = getElementModel ( pla )
                        if skin == 287 then
			else
				setElementData ( pla, "inRestrictedArea", "false" )
				triggerClientEvent ( pla, "destroyTimers", g_root, pla )
				outputDebugString ( "*"..getPlayerName(pla).." has left col shape" )
			end
		end
	end
end
addEventHandler ( "onColShapeLeave", g_base_col, leave )