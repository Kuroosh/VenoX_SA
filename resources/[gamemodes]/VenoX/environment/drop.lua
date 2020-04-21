function drugDropHit ( player )
	
	if not getPedOccupiedVehicle ( player ) then
		local pickup = source
		local amount = vnxGetElementData ( pickup, "amount" )
		if amount then
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast soeben\nein Paket mit\n"..amount.." Gramm Drogen\ngefunden!", 7500, 200, 0, 0 )
			vnxSetElementData ( player, "drugs", vnxGetElementData ( player, "drugs" ) + amount )
			playSoundFrontEnd ( player, 40 )
			destroyElement ( source )
		end
	end
end

function matDropHit ( player )
	
	if not getPedOccupiedVehicle ( player ) then
		local pickup = source
		local amount = vnxGetElementData ( pickup, "amount" )
		if amount then
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast soeben\nein Paket mit\n"..amount.." Materialien\ngefunden!", 7500, 200, 0, 0 )
			vnxSetElementData ( player, "mats", vnxGetElementData ( player, "mats" ) + amount )
			playSoundFrontEnd ( player, 40 )
			destroyElement ( source )
		end
	end
end

function moneyDropHit ( player )
	
	if not getPedOccupiedVehicle ( player ) then
		local pickup = source
		local money = vnxGetElementData ( pickup, "money" )
		if money then
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast soeben\n"..money.." $ gefunden!", 7500, 200, 0, 0 )
			givePlayerSaveMoney ( player, money )
			destroyElement ( source )
		end
	end
end

function deleteObject ( object )

	if getElementModel ( object ) == 1210 then
		destroyElement ( object )
	elseif getElementModel ( object ) == 1212 then
		destroyElement ( object )
	end
end

function getDropAmount ( amount )

	return ( amount and math.floor ( amount / 5 ) or 0 )
end