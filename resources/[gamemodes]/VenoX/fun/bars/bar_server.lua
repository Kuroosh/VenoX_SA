function drinkSomethingFromBar_func ( drink )

	local player = client
	if alcoholSorts[drink] then
		local pmoney = vnxGetElementData ( player, "money" )
		local cost = alcoholPrices[drink]
		if cost <= pmoney then
			takePlayerSaveMoney ( player, cost )
			drinkAlcohol ( player, drink )
		else
			infobox ( player, "\n\n\nDu hast nicht\ngenug Geld!", 5000, 125, 0, 0 )
		end
	end
end
addEvent ( "drinkSomethingFromBar", true )
addEventHandler ( "drinkSomethingFromBar", getRootElement(), drinkSomethingFromBar_func )