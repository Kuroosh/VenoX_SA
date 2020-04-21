addEvent ( "updateCoinsInCoinshop", true )

local width, height = guiGetScreenSize()
local shopwindow = nil
local shopButtons = {}
local shopLabel = nil
local cars = { { "Mesa", 500, 2000 }, { "Alpha", 602, 1000 }, { "Remington", 534, 1000 } }


addEventHandler ( "updateCoinsInCoinshop", root, function ()
	guiSetText ( shopLabel, "Coins: "..vnxClientGetElementData ( "coins" ) )
end )

local function closeCoinShop ( )
	showCursor ( false )
	setElementClicked ( false )
	destroyElement ( shopwindow )
end

local function buttonOneFunc ( button, state )
	if button == "left" and state == "up" then
		if vnxClientGetElementData ( "coins" ) >= cars[1][3] then
			triggerServerEvent ( "giveCoinShopCar", localPlayer, cars[1][2], cars[1][3] )
		else
			infobox ( "Nicht genug Coins", 4000, 200, 0, 0 )
		end
	end
end

local function buttonTwoFunc ( button, state )
	if button == "left" and state == "up" then
		if vnxClientGetElementData ( "coins" ) >= cars[1][3] then
			triggerServerEvent ( "giveCoinShopCar", localPlayer, cars[2][2], cars[2][3] )
		else
			infobox ( "Nicht genug Coins", 4000, 200, 0, 0 )
		end
	end
end

local function buttonThreeFunc ( button, state )
	if button == "left" and state == "up" then
		if vnxClientGetElementData ( "coins" ) >= cars[1][3] then
			triggerServerEvent ( "giveCoinShopCar", localPlayer, cars[3][2], cars[3][3] )
		else
			infobox ( "Nicht genug Coins", 4000, 200, 0, 0 )
		end
	end
end

local function buttonFourFunc ( button, state )
	if button == "left" and state == "up" then
		if vnxClientGetElementData ( "coins" ) >= 10 then
			triggerServerEvent ( "giveCoinShopCigaretts", localPlayer )
		else
			infobox ( "Nicht genug Coins", 4000, 200, 0, 0 )
		end
	end
end

local function buttonFiveFunc ( button, state )
	if button == "left" and state == "up" then
		if vnxClientGetElementData ( "coins" ) >= 300 then
			triggerServerEvent ( "giveCoinShopNickchange", localPlayer )
		else
			infobox ( "Nicht genug Coins", 4000, 200, 0, 0 )
		end
	end
end

local function buttonSixFunc ( button, state )
	if button == "left" and state == "up" then
		if vnxClientGetElementData ( "coins" ) >= 200 then
			triggerServerEvent ( "giveCoinShopMoney", localPlayer )
		else
			infobox ( "Nicht genug Coins", 4000, 200, 0, 0 )
		end
	end
end


addCommandHandler ( "coinshop", function ()
	showCursor ( true )
	setElementClicked ( true )
	
	shopwindow = guiCreateWindow ( width/2-250, height/2-77, 500, 153, "VenoX Reallife-RL Coin-Shop", false )
	guiWindowSetSizable ( shopwindow, false )
	guiWindowSetMovable ( shopwindow, true )
	shopButtons[1] = guiCreateButton ( 0.4, 0.75, 0.2, 0.2, "Verlassen", true, shopwindow )
	shopButtons[2] = guiCreateButton ( 0.075, 0.2, 0.25, 0.2, cars[1][3].."\n"..cars[1][1], true, shopwindow )
	shopButtons[3] = guiCreateButton ( 0.375, 0.2, 0.25, 0.2, cars[2][3].."\n"..cars[2][1], true, shopwindow )
	shopButtons[4] = guiCreateButton ( 0.675, 0.2, 0.25, 0.2, cars[3][3].."\n"..cars[3][1], true, shopwindow )
	shopButtons[5] = guiCreateButton ( 0.075, 0.45, 0.25, 0.2, "10\n100 Zigaretten", true, shopwindow )
	shopButtons[6] = guiCreateButton ( 0.375, 0.45, 0.25, 0.2, "300\nNickchange", true, shopwindow )
	shopButtons[7] = guiCreateButton ( 0.675, 0.45, 0.25, 0.2, "200\n20.000$", true, shopwindow )
	shopLabel = guiCreateLabel ( 0.675, 0.75, 0.25, 0.2, "Coins: "..vnxClientGetElementData ( "coins" ), true, shopwindow )
	
	guiLabelSetVerticalAlign ( shopLabel, "center" )
	
	addEventHandler ( "onClientGUIClick", shopButtons[1], closeCoinShop, false )
	addEventHandler ( "onClientGUIClick", shopButtons[2], buttonOneFunc, false )
	addEventHandler ( "onClientGUIClick", shopButtons[3], buttonTwoFunc, false )
	addEventHandler ( "onClientGUIClick", shopButtons[4], buttonThreeFunc, false )
	addEventHandler ( "onClientGUIClick", shopButtons[5], buttonFourFunc, false )
	addEventHandler ( "onClientGUIClick", shopButtons[6], buttonFiveFunc, false )
	addEventHandler ( "onClientGUIClick", shopButtons[7], buttonSixFunc, false )
end )

