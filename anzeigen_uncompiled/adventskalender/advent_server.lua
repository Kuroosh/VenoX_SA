local invulnerablePeds = {}
local invulnerableTicketPedsCoordinates = {}

function createInvulnerableTicketPed ( skin, x, y, z, rot, int, dim )

	local ped = createPed ( skin, x, y, z, rot )
	setPedRotation ( ped, rot )
	invulnerableTicketPedsCoordinates[ped] = { ["x"] = x, ["y"] = y, ["z"] = z, ["rot"] = rot }
	setElementDimension ( ped, dim )
	setElementInterior ( ped, int )
	addEventHandler ( "onPedWasted", ped,
		function ()
			local x = invulnerableTicketPedsCoordinates[source]["x"]
			local y = invulnerableTicketPedsCoordinates[source]["y"]
			local z = invulnerableTicketPedsCoordinates[source]["z"]
			local skin = getElementModel ( source )
			local dim = getElementDimension ( source )
			local int = getElementInterior ( source )
			local rot = invulnerableTicketPedsCoordinates[source]["rot"]
			destroyElement ( source )
			createInvulnerableTicketPed ( skin, x, y, z, rot, int, dim )
			--[[ped = createPed ( skin, x, y, z, rot )
			vnxSetElementData ( ped, "x", x )
			vnxSetElementData ( ped, "y", y )
			vnxSetElementData ( ped, "z", z )
			vnxSetElementData ( ped, "rot", rot )
			setElementDimension ( ped, dim )
			setElementInterior ( ped, int )]]
		end
	)
end
-- SF
--createInvulnerableTicketPed ( 283, 238.91540527344, 112.89644622803, 1002.867980957, -90, 10, 0 )
-- LV
--createInvulnerableTicketPed ( 283, 293.81640625, 182.29084777832, 1006.821105957, 180 - 45, 3, 0 )

function createInvulnerablePed ( skin, x, y, z, rot, int, dim )

	if not int then
		int = 0
	end
	if not dim then
		dim = 0
	end
	local ped = createPed ( skin, x, y, z, rot )
	setElementInterior ( ped, int )
	setElementDimension ( ped, dim )
	invulnerablePeds[ped] = true
	return ped
end

function syncInvulnerablePedsWithPlayer ( player )
	for key, index in pairs ( invulnerablePeds ) do
		if not isElement ( key ) then
			invulnerablePeds[key] = nil
		end
	end
	triggerClientEvent ( player, "makePedInvulnerable", player, invulnerablePeds )
end


local wmBlip = createBlip ( -2081.1, 1386.6, 6.8, 12 )
setElementVisibleTo(wmBlip, getRootElement(), true)

-- Sounds
function wmarktSounds()
	setTimer(function()
		riesenRadAnsage()
		kloSpuelung()
	end, 5000, 1)
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), wmarktSounds)

local lastAnsage = 2
function riesenRadAnsage()
	if (lastAnsage == 1) then
		lastAnsage = 2
	else
		lastAnsage = 1
	end
	triggerClientEvent(getRootElement(), "playWmarktSound3D", getRootElement(), "anzeigen/adventskalender/ansage"..lastAnsage..".mp3", 175, -2083.7, 1421.2, 6.9, false, true)
	setTimer(riesenRadAnsage, 150000, 1) -- 2.5min
end

function kloSpuelung()
	triggerClientEvent(getRootElement(), "playWmarktSound3D", getRootElement(), "anzeigen/adventskalender/klospuelung.mp3", 25, -2094.5, 1417.2, 7.4, false)
	setTimer(kloSpuelung, 90000, 1) -- 1.5min
end

-- Peds
local ped = createInvulnerablePed ( 151, -2062.3999, 1394.69995, 7.1, 90 ) -- Uhren Stand
setElementFrozen(ped, true)
addEventHandler("onElementClicked", ped, function(btn, stat, player)
if (getPlayerName(player) == "Solid_Snake") then outputChatBox("Ped1", player) end
end)
local ped = createInvulnerablePed ( 34, -2094.19995, 1403.5, 7.1, 270 ) -- Alkohol
setElementFrozen(ped, true)
addEventHandler("onElementClicked", ped, function(btn, stat, player)
if (btn == "left" and stat == "down") then triggerClientEvent(player, "dynamicPedKlickAdvent", getRootElement(), "Glühwein", 10, "Heisser Glühwein an kalten Tagen!\nEr darf auf keinem Weihnachtsmarkt fehlen!") end
end)
local ped = createInvulnerablePed ( 261, -2094.1001, 1407.5, 7.1, 261 ) -- Drinks/TV?
setElementFrozen(ped, true)
addEventHandler("onElementClicked", ped, function(btn, stat, player)
if (getPlayerName(player) == "Solid_Snake") then outputChatBox("Ped3", player) end
end)
local ped = createInvulnerablePed ( 55, -2062.5, 1390.19995, 7.1, 92.005 ) -- Spiele Stand
setElementFrozen(ped, true)
addEventHandler("onElementClicked", ped, function(btn, stat, player)
if (getPlayerName(player) == "Solid_Snake") then outputChatBox("Ped4", player) end
end)
local ped = createInvulnerablePed ( 120, -2089.1001, 1369, 7.1, 270 ) -- Gemüse Stand
setElementFrozen(ped, true)
addEventHandler("onElementClicked", ped, function(btn, stat, player)
if (getPlayerName(player) == "Solid_Snake") then outputChatBox("Ped5", player) end
end)
local ped = createInvulnerablePed ( 238, -2093.5, 1393, 7.1, 270 )  -- Nudel stand
setElementFrozen(ped, true)
addEventHandler("onElementClicked", ped, function(btn, stat, player)
if (btn == "left" and stat == "down") then triggerClientEvent(player, "dynamicPedKlickAdvent", getRootElement(), "Gebrannte Mandeln", 5, "Leckere gebrannte Mandeln.\nDa kann man einfach nicht wiederstehen.") end
end)
local ped = createInvulnerablePed ( 71, -2092.30005, 1351.09998, 7.1, 350 ) -- Security Rechts
setElementFrozen(ped, true)
local ped = createInvulnerablePed ( 71, -2068.80005, 1344.30005, 7.1, 350 ) -- Security Links
setElementFrozen(ped, true)
local ped = createInvulnerablePed ( 177, -2093.1001, 1389.80005, 7.1, 250 ) -- eismann
setElementFrozen(ped, true)
addEventHandler("onElementClicked", ped, function(btn, stat, player)
if (btn == "left" and stat == "down") then triggerClientEvent(player, "dynamicPedKlickAdvent", getRootElement(), "Eis", 2, "Leckeres Vanilleeis mit Sahne.") end
end)
local ped = createInvulnerablePed ( 291, -2081.30005, 1421.69995, 7.1, 240 )
setElementFrozen(ped, true)
local ped = createInvulnerablePed ( 38, -2092.80005, 1415.19995, 7.1, 90 )
setElementFrozen(ped, true)
local ped = createInvulnerablePed ( 185, -2092.80005, 1417, 7.1, 90 )
setElementFrozen(ped, true)
local ped = createInvulnerablePed ( 130, -2092.69995, 1418.69995, 7.1, 70 )
setElementFrozen(ped, true)
local ped = createInvulnerablePed ( 247, -2091.30005, 1416.59998, 7.1, 55 )
setElementFrozen(ped, true)
local ped = createInvulnerablePed ( 240, -2075.23, 1353.80005, 7.5, 85 ) -- Pizza
setElementFrozen(ped, true)
addEventHandler("onElementClicked", ped, function(btn, stat, player)
if (btn == "left" and stat == "down") then triggerClientEvent(player, "dynamicPedKlickAdvent", getRootElement(), "Pizza", 10, "Für den großen Hunger ist auch gesort.\nSalamipizza mit extra Käse.") end
end)
local ped = createInvulnerablePed ( 240, -2072.30005, 1365.5, 7.5, 85 )
setElementFrozen(ped, true)
addEventHandler("onElementClicked", ped, function(btn, stat, player)
if (getPlayerName(player) == "Solid_Snake") then outputChatBox("Ped16", player) end
end)
local ped = createInvulnerablePed ( 240, -2077.80005, 1385.2, 7.5, 180 ) -- Ice Cold Drinks
setElementFrozen(ped, true)
addEventHandler("onElementClicked", ped, function(btn, stat, player)
if (btn == "left" and stat == "down") then triggerClientEvent(player, "dynamicPedKlickAdvent", getRootElement(), "Cola", 3, "Don't drink and Drive!\nDann also nur eine Cola.") end
end)
local ped = createInvulnerablePed ( 240, -2072, 1396, 7.5, 180 ) -- Ice Cold Drinks
setElementFrozen(ped, true)
addEventHandler("onElementClicked", ped, function(btn, stat, player)
if (btn == "left" and stat == "down") then triggerClientEvent(player, "dynamicPedKlickAdvent", getRootElement(), "Cola", 3, "Don't drink and Drive!\nDann also nur eine Cola.") end
end)

function buyAdventItm(player, itm, price)
	if (client == player) then
		local price = tonumber(price)
		if (vnxGetElementData(player, "money") >= price) then
			if (itm == "Glühwein") then
				drinkAlcohol ( player, "Gluehwein" )
				triggerClientEvent(player, "infobox_start", getRootElement(), "\n\nGetraenk gekauft!", 3000, 0, 255, 0)
			elseif (itm == "Gebrannte Mandeln" or itm == "Eis" or itm == "Pizza") then
				if (itm == "pizza") then am = 50 else am = 25 end
				setPedAnimation(player, "food", "EAT_Burger",1,true,false,true)
				setTimer ( setPedAnimation, 3000, 1, player )
				triggerClientEvent ( player, "sec_health_give", getRootElement(), 999 )
				setElementHealth ( player, getElementHealth ( player ) + am )
				triggerClientEvent ( player, "eatSomething", getRootElement(), am )
				triggerClientEvent(player, "infobox_start", getRootElement(), "\n\nSnack gekauft!", 3000, 0, 255, 0)
			elseif (itm == "Cola") then
				setPedAnimation(player,"VENDING","VEND_Use",2500,false,false,false)
				setTimer(setPedAnimation,2500,1,player,"VENDING","VEND_Use_pt2",-1,false,false,false)
				setTimer(setPedAnimation,3000,1,player,"VENDING","VEND_Drink_P",-1,false,false,false)
				setTimer(function()
					triggerClientEvent ( player, "eatSomething", getRootElement(), 25 )
					setPedAnimation ( player )
				end, 3000, 1)
				triggerClientEvent(player, "infobox_start", getRootElement(), "\n\nGetraenk gekauft!", 3000, 0, 255, 0)
			end
			vnxSetElementData(player, "money", vnxGetElementData(player, "money") - price)
		else
			triggerClientEvent(player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld.", 3000, 255, 155, 0)
		end
	end
end
addEvent("buyAdventItm", true)
addEventHandler("buyAdventItm", getRootElement(), buyAdventItm)

-- Marker im Tannenbaum
local markerBlink = {
	{ -2082.30005, 1405.40002, 10.2 },
	{ -2083, 1405.90002, 13.1 },
	{ -2078.80005, 1404.5, 10.2 },
	{ -2082.80005, 1401.90002, 9.3 },
	{ -2081.30005, 1401.59998, 13 },
	{ -2080.30005, 1405.5, 13.1 }
}

function createTannenbaumMarker(nr,x,y,z)
	if isElement(_G["blinkMarker"..nr]) then
		for i = 1, 10 do
			setTimer(function()
				setElementAlpha(_G["blinkMarker"..nr], 255 / 10 * ( 10 - i ))
			end, 100*i, 1)
		end
		setTimer(function()
			destroyElement(_G["blinkMarker"..nr])
			createTannenbaumMarker(nr,x,y,z)
		end, 1010, 1)
	else
		_G["blinkMarker"..nr] = createMarker(x, y, z, "corona", 1, math.random(0,255), math.random(0,255), math.random(0,255))
		setElementAlpha(_G["blinkMarker"..nr], 1)
		-- 255/10 = 25.5
		for i = 1, 10 do
			setTimer(function()
				setElementAlpha(_G["blinkMarker"..nr], 25*i)
			end, 100*i, 1)
		end
		setTimer(function()
			setElementAlpha(_G["blinkMarker"..nr], 255)
			local time = tonumber(math.random(1,3) * 1000)
			setTimer(createTannenbaumMarker, time, 1, nr, x, y, z)
		end, 1000, 1)
	end	
end
for i, pos in ipairs(markerBlink) do
	createTannenbaumMarker(i,pos[1],pos[2],pos[3])
end

-- Kalender
function openAdventDoor_func(player, tag)
   if (player == client) then
		local pname = getPlayerName(player)
		local time = getRealTime()
		local day = time.monthday
		--local kalender = tonumber(MySQL_GetString("xmas", "kalender", "Name LIKE '"..pname.."'"))
		--if (kalender == 1) then
			if (day == tag) then
				giveAdventPrive(player)
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nHeute ist\nnicht der\n"..tag..".12!", 5000, 200, 200, 0 )
			end
		--[[else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast\nkeinen\nAdventskalender!", 5000, 200, 200, 0 )
		end]]
	end
end
addEvent("openAdventDoor", true)
addEventHandler("openAdventDoor", getRootElement(), openAdventDoor_func)

function giveAdventPrive(player)
    local pname = getPlayerName(player)
	local rt = getRealTime()
	local day = rt.monthday
	local check = MySQL_GetVar("xmas", "d"..day, "Name='"..pname.."'")
	
	if (check == 0) then
		MySQL_SetVar("xmas", "d"..day, 1, "Name LIKE '"..pname.."'")
		
		local presents = math.random(1,3)
		vnxSetElementData(player, "presents", vnxGetElementData(player, "presents") + presents)
		triggerClientEvent(player, "infobox_start", getRootElement(), "\nDu hast\n"..presents.." Geschenke\nerhalten!", 5000, 200, 200, 0)
		
	else
		triggerClientEvent(player, "infobox_start", getRootElement(), "\nDu hast\ndieses Tor\nbereits\ngeöffnet!", 5000, 200, 200, 0 )
	end
end

function givePlayerFreeCar ( player, id, vip )
	outputDebugString("NICHTT AKTIV")
	--vnxSetElementData ( player, "everyCarBuyableForFree", true )
	--carbuy(player, 0, id, -1986.13, 1328.59, 8, 0, 0, 0, 0, 0, 0, 0, 0, false, false, vip)
	--vnxSetElementData ( player, "everyCarBuyableForFree", false )
end
