function createMovingArrow ( player, x, y, z, rangeDown, size, time, withBlip )

	if isElement ( player ) then
		if not rangeDown then
			rangeDown = 1.35
		end
		if not size then
			size = 1
		end
		if not time then
			time = 2500
		end
		triggerClientEvent ( player, "createMovingArrow", player, x, y, z, rangeDown, size, time, withBlip )
	end
end

function hideallArrows ( player )

	if isElement ( player ) then
		triggerClientEvent ( player, "hideallArrows", player )
	end
end