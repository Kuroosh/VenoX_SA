donutMenueID = 1

local donutTablet = false
local donutMenueTexts = ""
local donutTextRenderHandled = false

local donutShopEnter = createMarker ( -2767.5422363281, 788.79730224609, 51.770000457764, "cylinder", 1, 255, 0, 0, 150 )
local donutShopExit = createMarker ( 377.08053588867, -193.18133544922, 999.60778808594, "cylinder", 1, 255, 0, 0, 150 )
local donutShopBuy = createMarker ( 379.37365722656, -190.40823364258, 999.60778808594, "cylinder", 1, 255, 0, 0, 150 )
setElementInterior ( donutShopExit, 17 )
setElementInterior ( donutShopBuy, 17 )

local servicePed = createInvulnerablePed ( 156, 380.77111816406, -188.92721557617, 1000.282, 180, 17, 0 )

local donutTablets = { [1]=2221, [2]=2223, [3]=2222 }

function donutShopEnter_hit ( player, dim )

	if dim and player == lp then
		fadeElementInterior ( player, 17, 377.09197998047, -192.18324279785, 1000.282043457, 0, 0 )
	end
end
addEventHandler ( "onClientMarkerHit", donutShopEnter, donutShopEnter_hit )

function donutShopExit_hit ( player, dim )

	if dim and player == lp then
		fadeElementInterior ( player, 0, -2766.353515625, 788.80780029297, 52.430477142334, 270, 0 )
	end
end
addEventHandler ( "onClientMarkerHit", donutShopExit, donutShopExit_hit )

function donutShopBuy_hit ( player, dim )

	if dim and player == lp then
		local x, y, z = getPedBonePosition ( servicePed, 3 )	-- or 6
		setCameraMatrix ( 379.34420776367, -190.4210357666, 1001.3024902344, x, y, z )
		setElementFrozen ( player, true )
		handelDonutBuy ( 1 )
		
		bindKey ( "arrow_l", "down", donutTabletSelectionLeft )
		bindKey ( "arrow_r", "down", donutTabletSelectionRight )
		bindKey ( "space", "down", donutTabletSelectionCancel )
		bindKey ( "enter", "down", donutTabletSelectionBuy )
		
		setRadarVisible ( false )
	end
end
addEventHandler ( "onClientMarkerHit", donutShopBuy, donutShopBuy_hit )

function donutTabletSelectionBuy ()

	playSoundFrontEnd ( 40 )
	triggerServerEvent ( "buyDonuts", lp, donutMenueID )
end
function donutTabletSelectionCancel ()

	setElementFrozen ( player, false )
	
	destroyElement ( donutTablet )
	removeEventHandler ( "onClientRender", getRootElement(), renderDonutInfoText )
	donutTextRenderHandled = false
	setCameraTarget ( lp, lp )
	
	unbindKey ( "arrow_l", "down", donutTabletSelectionLeft )
	unbindKey ( "arrow_r", "down", donutTabletSelectionRight )
	unbindKey ( "space", "down", donutTabletSelectionCancel )
	unbindKey ( "enter", "down", donutTabletSelectionBuy )
	
	setRadarVisible ( true )
end
function donutTabletSelectionLeft ()

	donutMenueID = donutMenueID - 1
	if donutMenueID < 1 then
		donutMenueID = 3
	end
	handelDonutBuy ()
end
function donutTabletSelectionRight ()

	donutMenueID = donutMenueID + 1
	if donutMenueID > 3 then
		donutMenueID = 1
	end
	handelDonutBuy ()
end

function handelDonutBuy ()

	local id = donutMenueID
	if isElement ( donutTablet ) then
		destroyElement ( donutTablet )
		donutTablet = false
	end
	donutTablet = createObject ( donutTablets[id], 380.01153564453, -189.80604553223, 1000.7800292969, 0, 0, 45 )
	setElementInterior ( donutTablet, 17 )
	if id == 1 then
		donutMenueTexts = "Kleine Portion Donuts\nKosten: "..donutPrices[id].." $"
	elseif id == 2 then
		donutMenueTexts = "Mittlere Portion Donuts\nKosten: "..donutPrices[id].." $"
	elseif id == 3 then
		donutMenueTexts = "Grosse Portion Donuts\nKosten: "..donutPrices[id].." $"
	end
	if not donutTextRenderHandled then
		addEventHandler ( "onClientRender", getRootElement(), renderDonutInfoText )
		donutTextRenderHandled = true
	end
	setElementPosition ( donutTablet, 380.01153564453, -189.80604553223, 1000.7900292969 )
end

function renderDonutInfoText ()

	dxDrawText ( donutMenueTexts.."\nDein Geld: "..mymoney.." $", 1, 1, screenwidth, screenheight, tocolor ( 0, 0, 0 ), 3, "default-bold", "center", "center", true, false )
	dxDrawText ( donutMenueTexts.."\nDein Geld: "..mymoney.." $", 1-3, 1-3, screenwidth-3, screenheight-3, tocolor ( 255, 255, 50 ), 3, "default-bold", "center", "center", false, true )
end