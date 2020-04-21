------ FBI Base ------

local function FBIRein(player)
    if getElementType(player) == "player" and not isPedInVehicle(player) then
		setElementInterior ( player, 10, 987.66186523438, -4.663423538208, 248.5625, 0, 0 )
		triggerClientEvent(player,"blendLoadingScreen",player)
	end	
end

local function FBIRaus(player)
    if getElementType(player) == "player" and not isPedInVehicle(player) then
		setElementInterior ( player, 0, -2469.3479003906, 482.94918823242, 29.585912704468, 0, 0 )
		triggerClientEvent(player,"blendLoadingScreen",player)
	end	
end

local function FBIHeliUnten(player)
	if getElementType(player) == "player" and not isPedInVehicle(player) then
	    setElementPosition( player, -2454.2243652344, 512.92053222656, 45.211734771729,true)
	    triggerClientEvent(player,"blendLoadingScreen",player)
    end
end

local function FBIHeliOben(player)
	if getElementType(player) == "player" and not isPedInVehicle(player) then
	    setElementPosition( player, -2444.6506347656,528.23571777344,29.918523788452,true) 
	    triggerClientEvent(player,"blendLoadingScreen",player)
    end
end


local FBIRein = createCustomPickup(-2470.2028808594, 485.21612548828, 30.056027908325 , 0, 0, "anzeigen/cpickup/images/rein.png", FBIRein)
local FBIRaus = createCustomPickup(985.66186523438, -4.663423538208, 248.5625 , 0, 0, "anzeigen/cpickup/images/raus.png", FBIRaus)
local FBIHeliUnten = createCustomPickup(-2446.7297363281, 528.22644042969, 30.273189544678 , 0, 0, "anzeigen/cpickup/images/fbi-heli.png", FBIHeliUnten)
local FBIHeliOben = createCustomPickup(-2454.3820800781, 515.05053710938, 45.502365112305 , 0, 0, "anzeigen/cpickup/images/fbi-heli.png", FBIHeliOben)