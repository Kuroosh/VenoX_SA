--[[newPickup = createPickup ( 1720, -1862, 13.7, 3, 1239, 100 )

function newPickupHit ( hit )

	if getElementType ( hit ) == "player" then
		outputChatBox ( "Du brauchst hilfe? /report & gehe ein paar meter ins 'I'", hit, 0, 255, 255 )
	end
end
addEventHandler ( "onPickupHit", newPickup, newPickupHit )]]

