------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------
---- Script by Noneatme ------

-- HANDLING --

local la_reallife = true

-- EINKLAMMERN! --
--[[
for i = 411, 611, 1 do
	local handling = getOriginalHandling(i)
	setModelHandling(i, "tractionMultiplier", handling['tractionMultiplier']/100*60)
end

for index, car in pairs(getElementsByType("vehicle")) do
	local handling = getOriginalHandling(getElementModel(car))
	setVehicleHandling(car, "tractionMultiplier", handling['tractionMultiplier']/100*60)
end
addEventHandler("onResourceStop", getResourceRootElement(), function()
	outputDebugString("Resource update stopped")
	for i = 411, 611, 1 do
		local handling = getOriginalHandling(i)
		setModelHandling(i, "tractionMultiplier", handling['tractionMultiplier'])
	end
end)]]

-- MARKER --

local weinachtsmarktblip = createBlip(-1983.2833251953, 885.43426513672, 45.203125, 46, 2, 255, 0, 0, 255, 0, 999999.0)

-- AUTOS --

local car = {}
car[1] = createVehicle(423, -1972.63671875, 880.0029296875, 45.231563568115, 0.4888916015625, 0.120849609375, 337.27478027344) -- Mr. Whoopee
car[2] = createVehicle(423, -1972.8134765625, 889.5224609375, 45.224437713623, 0.582275390625, 0.0384521484375, 21.857299804688) -- Mr. Whoopee

for i = 1, 2, 1 do
	setVehicleDamageProof(car[i], true)
	setElementFrozen(car[i], true)
end

-- ESSEN --

addEvent("doLAWeinachtsMarktEat", true)

local preis_leben = {
	[3] = 20,
	[4] = 50,
	[5] = 70

}

addEventHandler("doLAWeinachtsMarktEat", getRootElement(), function(essen, preis)
	if(la_reallife == true) then
		local p = laGetElementData(source, "money")
		if(p < preis) then
			outputChatBox("Du hast leider nicht genug Geld bei dir!", source, 255, 0, 0)
			return
		end
		laSetElementData(source, "money", p-preis)
		givePlayerMoney(source, -preis)
	else
		if(getPlayerMoney(source) < preis) then
			outputChatBox("Du hast leider nicht genug Geld bei dir!", source, 255, 0, 0)
			return
		end
		givePlayerMoney(source, -preis)
	end
	setPedAnimation(source, "food", "EAT_Burger", 3000, true, false, true)
	local x, y, z = getElementPosition(source)
	local c = createColSphere(x, y, z, 8)
	for index, player in next, getElementsWithinColShape(c) do 
		outputChatBox("* "..getPlayerName(source).." isst/trinkt "..essen, player, 255, 0, 255)
	end
	destroyElement(c)
	local h = getElementHealth(source)
	setElementHealth(source, h+preis_leben[preis])
end)