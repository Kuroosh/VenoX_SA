function buyDonuts_func ( id )

	local player = client
	local price = donutPrices[id]
	local money = vnxGetElementData ( player, "money" )
	local hp = 100
	if id == 2 then
		hp = 50
	elseif id == 3 then
		hp = 25
	end
	if price then
		if money >= price then
			local newhunger = getElementHunger ( player ) + hp
			if newhunger > 100 then
				setElementHunger ( player, 100 )
			else
				setElementHunger ( player, newhunger )
			end
			vnxSetElementData ( player, "money", money - price )
		else
			infobox ( player, "Du hast nicht\ngenug Geld!", 5000, 125, 0, 0 )
		end
	end
end
addEvent ( "buyDonuts", true )
addEventHandler ( "buyDonuts", getRootElement(), buyDonuts_func )