function buyChips_func ( amount, buy )
--[[
	local amount = math.abs ( math.floor ( tonumber ( amount ) ) )
	if amount then
		local player = client
		if buy then
			if vnxGetElementData ( player, "money" ) >= amount then
				vnxSetElementData ( player, "casinoChips", vnxGetElementData ( player, "casinoChips" ) + amount )
				takePlayerSaveMoney ( player, amount )
				infobox ( player, "\n\nDu hast dir\n"..amount.." Chips\ngekauft!", 5000, 0, 125, 0 )
			else
				infobox ( player, "\nDu hast kein\nGeld dafür!", 5000, 125, 0, 0 )
			end
		else
			if vnxGetElementData ( player, "casinoChips" ) >= amount then
				vnxSetElementData ( player, "casinoChips", vnxGetElementData ( player, "casinoChips" ) - amount )
				givePlayerSaveMoney ( player, amount )
				infobox ( player, "\n\nDu hast fuer\n"..amount.." Chips\nverkauft!", 5000, 0, 125, 0 )
			else
				infobox ( player, "\n\n\nDu hast nicht\ngenug Chips!", 5000, 125, 0, 0 )
			end
		end
	else
		infobox ( player, "\n\n\nUngueltiger Wert!", 5000, 125, 0, 0 )
	end
	casinoMoneySave ( player )]]
end
addEvent ( "buyChips", true )
addEventHandler ( "buyChips", getRootElement(), buyChips_func )