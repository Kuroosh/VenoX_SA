fishNames = {
 [1]="Schildkroete",
 [2]="Stiefel",
 [3]="Lachs",
 [4]="Forelle",
 [5]="Schnapper",
 [6]="Hai",
 [7]="Geldbeutel",
 [8]="Barsch",
 [9]="Schwertfisch",
 [10]="Rochen",
 [11]="Aal",
 [12]="Thunfisch"
}

local fishBiten = false
local fishingImage
local fishingTimer

function beginFishing ()

	if vnxClientGetElementData ( "fishingPole" ) and vnxClientGetElementData ( "fishingHooks" ) > 0 and vnxClientGetElementData ( "fishingWorms" ) > 0 then
		if not vnxClientGetElementData ( "anim" ) or vnxClientGetElementData ( "anim" ) == 0 then
			if isPedOnGround ( lp ) then
				setElementFrozen ( lp, true )
				showCursor ( true )
				setElementClicked ( true )
				addEventHandler ( "onClientClick", getRootElement(), fishClick )
			else
				infobox ( "Nur auf dem Boden erlaubt!", 5000, 125, 0, 0 )
			end
		else
			infobox ( "Beende vorher\ndie Animation!", 5000, 125, 0, 0 )
		end
	else
		infobox ( "Du brauchst eine\nAngel, Haken und\nWuermer!", 5000, 125, 0, 0 )
	end
end
addCommandHandler ( "fish", beginFishing )

function fishClick ( btn, state, _, _, wx, wy, wz, element )

	setElementFrozen ( lp, false )
	removeEventHandler ( "onClientClick", getRootElement(), fishClick )
	if not element then
		local pX, pY, pZ = getElementPosition ( lp )
		local bool, wX, wY, wZ = testLineAgainstWater ( pX, pY, pZ + 100, wx, wy, wz )
		if bool then
			local x1, y1, z1 = getElementPosition ( lp )
			local x2, y2, z2 = wx, wy, wz
			local nX = x2 - ( ( x1 - x2 ) / ( z1 - z2 ) ) * ( z2 )
			local nY = y2 - ( ( y1 - y2 ) / ( z1 - z2 ) ) * ( z2 )
			
			local dist = getDistanceBetweenPoints2D ( x1, y1, nX, nY )
			
			if dist <= 35 then
				setPedRotation ( lp, findRotation ( x1, y1, nX, nY ) )
				setPedAnimation ( lp, "SWORD", "sword_3", -1, false, false, false, true )
				startFishing ()
				return nil
			end
		end
	end
	showCursor ( false )
	setElementClicked ( false )
	outputChatBox ( "Du musst deine Angel in Wasser in deiner Naehe werfen!", 125, 0, 0 )
end

function startFishing ()

	fishBiten = false
	
	bindKey ( "mouse1", "down", leftMouseFishing )
	
	fishingImage = guiCreateStaticImage ( screenwidth/2-100/2, 0, 100, 100, "images/skills/fishing/top.png", false )
	
	local rnd = math.random ( 1000, 20000 )
	local time = ( 3000 + rnd )
	fishingTimer = setTimer (
		function ()
			fishBiten = true
			destroyElement ( fishingImage )
			fishingImage = guiCreateStaticImage ( screenwidth/2-100/2, 0, 100, 100, "images/skills/fishing/down.png", false )
			fishingTimer = setTimer (
				function ()
					destroyElement ( fishingImage )
					unbindKey ( "mouse1", "down", leftMouseFishing )
					startFishing ()
				end,
			200 + math.random ( 50, 500 ), 1 )
		end,
	time, 1 )
end

function leftMouseFishing ()

	destroyElement ( fishingImage )
	if isTimer ( fishingTimer ) then
		killTimer ( fishingTimer )
	end
	unbindKey ( "mouse1", "down", leftMouseFishing )
	
	setPedAnimation ( lp, nil, nil )
	
	showCursor ( false )
	setElementClicked ( false )
	
	if fishBiten then
		triggerServerEvent ( "fishCought", lp )
	else
		outputChatBox ( "Leider nichts erwischt.", 125, 0, 0 )
	end
end

-- Fishing Shop --
fishingShop = createMarker ( -1353.87, 2057.60, 52.04, "cylinder", 1, 255, 0, 0, 150, getRootElement() )

function fishingShop_hit ( player, dim )

	if player == lp and dim and not getPedOccupiedVehicle ( player ) then
		showCursor ( true )
		setElementClicked ( true )
		
		local hooks = vnxClientGetElementData ( "fishingHooks" )
		local worms = vnxClientGetElementData ( "fishingWorms" )
		local maxWormHooks = 5 + math.floor ( calcFishingSkillLevel ( lp ) ^ ( 1.1 ) * 5 )
		
		gWindow["fishingShop"] = guiCreateWindow(screenwidth/2-398/2,screenheight/2-250/2,398,250,"Angelshop",false)
		guiSetAlpha(gWindow["fishingShop"],1)
		
		gButton["fishShopBuyPole"] = guiCreateButton(10,29,109,48,"Angel\n\n",false,gWindow["fishingShop"])
		guiSetAlpha(gButton["fishShopBuyPole"],1)
		guiSetFont(gButton["fishShopBuyPole"],"default-bold-small")
		gLabel[1] = guiCreateLabel(40,29,32,14,fishingPolePrice.." $",false,gButton["fishShopBuyPole"])
		guiSetAlpha(gLabel[1],1)
		guiLabelSetColor(gLabel[1],0,200,0)
		guiLabelSetVerticalAlign(gLabel[1],"top")
		guiLabelSetHorizontalAlign(gLabel[1],"left",false)
		guiSetFont(gLabel[1],"default-bold-small")
		
		gButton["fishShopBuyHooks"] = guiCreateButton(10,86,109,48,"Haken\n("..hooks.."/"..maxWormHooks..")\n",false,gWindow["fishingShop"])
		guiSetAlpha(gButton["fishShopBuyHooks"],1)
		guiSetFont(gButton["fishShopBuyHooks"],"default-bold-small")
		gLabel[2] = guiCreateLabel(40,29,32,14,fishingHookPrice.." $",false,gButton["fishShopBuyHooks"])
		guiSetAlpha(gLabel[2],1)
		guiLabelSetColor(gLabel[2],0,200,0)
		guiLabelSetVerticalAlign(gLabel[2],"top")
		guiLabelSetHorizontalAlign(gLabel[2],"left",false)
		guiSetFont(gLabel[2],"default-bold-small")
		
		gButton["fishShopBuyWorms"] = guiCreateButton(10,143,109,48,"Koeder\n("..worms.."/"..maxWormHooks..")\n",false,gWindow["fishingShop"])
		guiSetAlpha(gButton["fishShopBuyWorms"],1)
		guiSetFont(gButton["fishShopBuyWorms"],"default-bold-small")
		gLabel[3] = guiCreateLabel(40,29,32,14,fishingWormPrice.." $",false,gButton["fishShopBuyWorms"])
		guiSetAlpha(gLabel[3],1)
		guiLabelSetColor(gLabel[3],0,200,0)
		guiLabelSetVerticalAlign(gLabel[3],"top")
		guiLabelSetHorizontalAlign(gLabel[3],"left",false)
		guiSetFont(gLabel[3],"default-bold-small")
		
		addEventHandler ( "onClientGUIClick", gButton["fishShopBuyWorms"],
			function ()
				local amount = tonumber ( guiGetText ( gMemo["fishingCount"] ) )
				triggerServerEvent ( "fishShopBuy", lp, "worms", amount )
			end,
		false )
		addEventHandler ( "onClientGUIClick", gButton["fishShopBuyHooks"],
			function ()
				local amount = tonumber ( guiGetText ( gMemo["fishingCount"] ) )
				triggerServerEvent ( "fishShopBuy", lp, "hooks", amount )
			end,
		false )
		addEventHandler ( "onClientGUIClick", gButton["fishShopBuyPole"],
			function ()
				triggerServerEvent ( "fishShopBuy", lp, "pole", 1 )
			end,
		false )
		
		gLabel[2] = guiCreateLabel(130,23,188,58,"Mit einer Angel kannst du - je\nnach Talent und Skill-LVL -\nverschiedene Fische fangen,\nverkaufen und bald auch kochen.",false,gWindow["fishingShop"])
		guiSetAlpha(gLabel[2],1)
		guiLabelSetColor(gLabel[2],255,255,255)
		guiLabelSetVerticalAlign(gLabel[2],"top")
		guiLabelSetHorizontalAlign(gLabel[2],"left",false)
		guiSetFont(gLabel[2],"default-bold-small")
		gImage[1] = guiCreateStaticImage(332,29+57*0,50,50,"images/inventory/fishing/pole.png",false,gWindow["fishingShop"])
		guiSetAlpha(gImage[1],1)
		
		gLabel[3] = guiCreateLabel(130,143,171,48,"Zum Angeln brauchst du\nnicht nur eine Angel, sondern\nauch Koeder und Haken",false,gWindow["fishingShop"])
		guiSetAlpha(gLabel[3],1)
		guiLabelSetColor(gLabel[3],255,255,255)
		guiLabelSetVerticalAlign(gLabel[3],"top")
		guiLabelSetHorizontalAlign(gLabel[3],"left",false)
		guiSetFont(gLabel[3],"default-bold-small")
		gMemo["fishingCount"] = guiCreateNumberField ( 163, 105, 74, 31, 0, false, gWindow["fishingShop"], true, true )
		gImage[2] = guiCreateStaticImage(332,29+57*1,50,50,"images/inventory/fishing/hook.png",false,gWindow["fishingShop"])
		guiSetAlpha(gImage[2],1)
		
		guiSetAlpha(gMemo["fishingCount"],1)
		gLabel[4] = guiCreateLabel(177,88,43,17,"Anzahl:",false,gWindow["fishingShop"])
		guiSetAlpha(gLabel[4],1)
		guiLabelSetColor(gLabel[4],200,200,0)
		guiLabelSetVerticalAlign(gLabel[4],"top")
		guiLabelSetHorizontalAlign(gLabel[4],"left",false)
		guiSetFont(gLabel[4],"default-bold-small")
		gImage[3] = guiCreateStaticImage(332,29+57*2,50,50,"images/inventory/fishing/worm.png",false,gWindow["fishingShop"])
		guiSetAlpha(gImage[3],1)
		
		gButton["fishShopClose"] = guiCreateButton(398/2-78/2,207,78,32,"Schliessen",false,gWindow["fishingShop"])
		guiSetAlpha(gButton["fishShopClose"],1)
		addEventHandler ( "onClientGUIClick", gButton["fishShopClose"],
			function ()
				showCursor ( false )
				setElementClicked ( false )
				destroyElement ( gWindow["fishingShop"] )
			end,
		false )
	end
end
addEventHandler ( "onClientMarkerHit", fishingShop, fishingShop_hit )

function reOpenFishingShopGUI_func ()

	destroyElement ( gWindow["fishingShop"] )
	fishingShop_hit ( lp, true )
end
addEvent ( "reOpenFishingShopGUI", true )
addEventHandler ( "reOpenFishingShopGUI", getRootElement(), reOpenFishingShopGUI_func )