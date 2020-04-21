local x, y, width, height
local NosBottleWidth, NosBottleHeight = 75 / 2, 200 / 2
local nosX = screenwidth - 221 - NosBottleWidth - 10-- / 2 - NosBottleWidth / 2
local nosY = screenheight - 50 --211
distToBottom = 45 / 200 * NosBottleHeight
distToTop = 28 / 200 * NosBottleHeight
fixDist = 7 / 200 * NosBottleHeight
nosAmountToDraw = 0
function nosRender ()

	if drawNos and getPedOccupiedVehicle ( lp ) and getVehicleUpgradeOnSlot ( getPedOccupiedVehicle ( lp ), 8 ) then
		local x = nosX
		local y = nosY
		width, height = NosBottleWidth, NosBottleHeight
		height = height - distToBottom - distToTop
		height = height / 100 * nosAmountToDraw
		dxDrawImageSection ( x, y + fixDist - distToTop, width, -height, 1, distToTop, width, height, "images/carsys/nos/nos.png" )
	else
		drawNos = false
		destroyElement ( nosBottle )
		nosBottle = nil
		removeEventHandler ( "onClientRender", getRootElement(), nosRender )
	end
end

function refreshNosValues ()

	local veh = getPedOccupiedVehicle ( lp )
	if getPedOccupiedVehicleSeat ( lp ) == 0 then
		if getElementData ( veh, "nitro" ) > 0 then
			nosAmountToDraw = getElementData ( veh, "nitro" )
			if usedNos then
				nosAmountToDraw = nosAmountToDraw - usedNos
			end
			if not drawNos then
				drawNos = true
				addEventHandler ( "onClientRender", getRootElement(), nosRender )
				local x = nosX
				local y = nosY - NosBottleHeight
				width, height = NosBottleWidth, NosBottleHeight
				nosBottle = guiCreateStaticImage ( x, y, width, height, "images/carsys/nos/bottle.png", false )
			end
			return nil
		end
	end
	drawNos = false
	if nosBottle then
		destroyElement ( nosBottle )
		nosBottle = nil
		removeEventHandler ( "onClientRender", getRootElement(), nosRender )
	end
end