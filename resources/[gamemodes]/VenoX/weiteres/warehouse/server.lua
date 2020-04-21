local var = {}
local dim = 5

local running = false
local timer = false
local truck = false
local blip = false
local marker = false
local kiste = {}
local currentkiste = 1
local crate_id = 2912

local geld_minimal, geld_maximal = 500, 1000

local koordinaten = {
	[1] = "-718.91430664063, 2442.8762207031, 126.23124694824", -- surenos
	[2] = "0, 0, 0", -- ?
	[3] = "0, 0, 0", -- ?
	[4] = "0, 0, 0", -- ?
	[5] = "0, 0, 0", -- ?
}

addEvent("onWarenhausUeberfallStart", true)

var["element:tuer"] = createObject(1498, 1426.3249511719, -1307.8471679688, 12.558536529541, 0, 0, 270) -- die Tuer
var["element:blip"] = createBlip(1426.3249511719, -1307.8471679688, 12.558536529541, 51, 2, 255, 0, 0, 255, 0, 500)
var["element:warenhaustuer"] = createObject(972, 1052.2280273438, 2090.2683105469, 9.8203125)
setElementDimension(var["element:warenhaustuer"], dim)

var["element:marker1"] = createMarker(1425.4056396484, -1308.5848388672, 12.7546875, "cylinder", 1.0, 0, 255, 0, 150)
-- Davor: 1424.2760009766, -1308.6253662109, 13.5546875

var["element:marker2"] = createMarker(1062.1541748047, 2077.4145507813, 10.0203125, "cylinder", 1.0, 0, 255, 0, 150)
setElementDimension(var["element:marker2"], dim)
-- Davor: 1062.1513671875, 2078.7114257813, 10.8203125


addEventHandler("onMarkerHit", var["element:marker1"], function(thePlayer, match)
	if(match) then
		if(getElementType(thePlayer) == "player") and (isPedInVehicle(thePlayer) == false) then
			setElementPosition(thePlayer, 1062.1513671875, 2078.7114257813, 10.8203125)
			setElementDimension(thePlayer, dim)
			if(isEvil(thePlayer)) and (running == false) then
				outputChatBox("Finde/erpresse den Manager, um an Waffen zu kommen!", thePlayer, 0, 255, 0)
			end
		end
	end
end)

addEventHandler("onMarkerHit", var["element:marker2"], function(thePlayer, match)
	if(match) then
		if(getElementType(thePlayer) == "player") and (isPedInVehicle(thePlayer) == false) then
			setElementPosition(thePlayer, 1424.2760009766, -1308.6253662109, 13.5546875)
			setElementDimension(thePlayer, 0)
		end
	end
end)


-- PEDS --
local ped = {}

ped[1] = createPed(153, 1072.4138183594, 2092.3110351563, 10.8203125, 269.1672668457)
ped[2] = createPed(16, 1073.83984375, 2092.44921875, 10.8203125, 90)
ped[3] = createPed(260, 1080.7761230469, 2095.388671875, 10.8203125, 312.74435424805)
ped[4] = createPed(27, 1073.5207519531, 2107.90625, 14.689616203308, 239.42367553711)
ped[5] = createPed(153, 1077.6317138672, 2106.0400390625, 10.8203125, 64.2919921875)
ped[6] = createPed(16, 1070.634765625, 2101.1958007813, 10.8203125, 185.86647033691)
ped[7] = createPed(27, 1067.5140380859, 2106.5219726563, 10.8203125, 11.024810791016)
ped[8] = createPed(260, 1065.19140625, 2106.4772949219, 10.8203125, 271.38381958008)
ped[9] = createPed(16, 1083.0916748047, 2094.2033691406, 15.350400924683, 0.128173828125)
ped[10] = createPed(153, 1083.0750732422, 2094.8356933594, 15.350400924683, 180.6348876953125)
ped[11] = createPed(260, 1090.1307373047, 2121.2099609375, 10.8203125, 87.862335205078)
ped[12] = createPed(153, 1088.953125, 2121.1882324219, 10.8203125, 272.2490234375)

for index, p in next, ped do
	setElementDimension(p, dim)
end

setTimer(function()
	setPedAnimation(ped[1], "ped" , "IDLE_chat", -1, true, false, false)
	setPedAnimation(ped[3], "bomber", "BOM_Plant_Loop", -1, true, false, false)
	setPedAnimation(ped[5], "ped" , "IDLE_chat", -1, true, false, false)
	setPedAnimation(ped[7], "bomber", "BOM_Plant_Loop", -1, true, false, false)
	setPedAnimation(ped[8], "ped" , "IDLE_chat", -1, true, false, false)

	setPedAnimation(ped[10], "ped" , "IDLE_chat", -1, true, false, false)
	setPedAnimation(ped[9], "ped" , "XPRESSscratch", -1, true, false, false)

	setPedAnimation(ped[11], "ped" , "phone_talk", -1, true, false, false)
	setPedAnimation(ped[12], "ped" , "IDLE_chat", -1, true, false, false)
end, 1000, 1)

-- functions --

local function resetWarenhaus()
	running = false
	setPedRotation(ped[12], 272)
	setPedAnimation(ped[1], "ped" , "IDLE_chat", -1, true, false, false)
	setPedAnimation(ped[3], "bomber", "BOM_Plant_Loop", -1, true, false, false)
	setPedAnimation(ped[5], "ped" , "IDLE_chat", -1, true, false, false)
	setPedAnimation(ped[7], "bomber", "BOM_Plant_Loop", -1, true, false, false)
	setPedAnimation(ped[8], "ped" , "IDLE_chat", -1, true, false, false)

	setPedAnimation(ped[10], "ped" , "IDLE_chat", -1, true, false, false)
	setPedAnimation(ped[9], "ped" , "XPRESSscratch", -1, true, false, false)

	setPedAnimation(ped[11], "ped" , "phone_talk", -1, true, false, false)
	setPedAnimation(ped[12], "ped" , "IDLE_chat", -1, true, false, false)
	for index, kisten in pairs(kiste) do
		if(isElement(kisten)) then
			destroyElement(kisten)
		end
	end
	currentkiste = 1
	if(isElement(truck)) then
		destroyElement(truck)
	end
	if(isElement(blip)) then
		destroyElement(blip)
	end
	if(isElement(marker)) then
		destroyElement(marker)
	end
end

local function dropVehicleCrate(id)
	if(isElement(kiste[id])) and (isElement(truck)) then
		local x, y, z = getElementVelocity(truck)
		detachElements(kiste[id])
		setElementVelocity(kiste[id], x, y, z+0.2)
		if(getVehicleOccupant(truck)) then
			if((currentkiste-1) > 0) then
				outputChatBox("Du hast eine Kiste verloren! Sei vorsichtig, du hast nurnoch "..(currentkiste-1)..".", getVehicleOccupant(truck), 255, 0, 0)
			else
				outputChatBox("Du hast all deine Kisten verloren!", getVehicleOccupant(truck), 255, 0, 0)
			end
		end
	end
end

local function setPlayerToUeberfall(thePlayer)
	outputChatBox("Das Warenhaus wird ueberfallen!", getRootElement(), 255, 0, 0)
	fadeCamera(thePlayer, true)
	toggleAllControls(thePlayer, true)
	setElementDimension(thePlayer, 0)
	setElementPosition(thePlayer, 1425.728515625, -1341.6932373047, 13.579707145691)
	truck = createVehicle(456, 1421.7349853516, -1347.0494384766, 13.963488578796, 0, 0, 0, "DAFUQ")
	setVehicleVariant(truck, 1, 1)
	warpPedIntoVehicle(thePlayer, truck)
	outputChatBox("Fahre den Laster zu deiner Basis! Pass auf, dass du keine Kisten verlierst, die oben draufgeschnallt wurden!", thePlayer, 0, 255, 255)
	-- MARKER --
	-- SICHERHEITSHINWEIS --
	local fraktion = 1
	local x, y, z = gettok(koordinaten[fraktion], 1, ","), gettok(koordinaten[fraktion], 2, ","), gettok(koordinaten[fraktion], 3, ",")
	marker = createMarker(x, y, z, "checkpoint", 4, 0, 255, 0, thePlayer)
	blip = createBlip(x, y, z, 0, 2, 255, 0, 0, 255, 0, 99999.0, thePlayer)
	addEventHandler("onMarkerHit", marker, function(hitElement)
		if(hitElement == truck) then
			local kisten = currentkiste -- Das sind die Kisten die oben noch drauf sind
			local geld = math.random(geld_minimal, geld_maximal)*kisten
			local occupant = getVehicleOccupant(hitElement)
			-- SICHERHEITSHINWEIS --
			--givePlayerMoney(occupant, geld)
			thcSetElementData ( occupant, "money", thcGetElementData ( occupant, "money" ) + geld )
			giveWeapon(occupant, 35, 1, true)
			outputChatBox("Du hast erfolgreich "..kisten.." Kisten ins Lager gebracht und $"..geld.." erbeutet!", occupant, 0, 255, 0)
			outputChatBox("Ausserdem hast du einen Raketenwerfer erhalten.", occupant, 0, 255, 0)
			destroyElement(truck)
			destroyElement(blip)
			destroyElement(marker)
			for index, k in pairs(kiste) do
				destroyElement(k)
			end
		end
	end)
	-- KISTEN --
	local veh = truck
	kiste[1] = createObject(crate_id, 0, 0, 0)
	attachElements(kiste[1], veh, 0.7, 0, 2.3)
	kiste[2] = createObject(crate_id, 0, 0, 0)
	attachElements(kiste[2], veh, -0.7, 0, 2.3)
	kiste[3] = createObject(crate_id, 0, 0, 0)
	attachElements(kiste[3], veh, 0.7, -1.3, 2.3)
	kiste[4] = createObject(crate_id, 0, 0, 0)
	attachElements(kiste[4], veh, -0.7, -1.3, 2.3)
	kiste[5] = createObject(crate_id, 0, 0, 0)
	attachElements(kiste[5], veh, -0.7, -2.6, 2.3)
	kiste[6] = createObject(crate_id, 0, 0, 0)
	attachElements(kiste[6], veh, 0.7, -2.6, 2.3)
	kiste[7] = createObject(crate_id, 0, 0, 0)
	attachElements(kiste[7], veh, -0.7, -3.9, 2.3)
	kiste[8] = createObject(crate_id, 0, 0, 0)
	attachElements(kiste[8], veh, 0.7, -3.9, 2.3)
	for i = 1, #kiste, 1 do
		setObjectScale(kiste[i], 1.6)
	end
	currentkiste = 8
	addEventHandler("onVehicleExplode", truck, function()
		for index, k in pairs(kiste) do
			setTimer(destroyElement, 2000, 1, k)
		end
		setTimer(destroyElement, 3000, 1, truck)
	end)
	addEventHandler("onVehicleDamage", truck, function(loss)
		local health = getElementHealth(source)
		if(health < 300) then
			if(currentkiste > 0) then
				dropVehicleCrate(currentkiste)
				currentkiste = currentkiste-1
			end
		end
		if(health < 400) then
			if(currentkiste > 1) then
				dropVehicleCrate(currentkiste)
				currentkiste = currentkiste-1
			end
		end
		if(health < 500) then
			if(currentkiste > 2) then
				dropVehicleCrate(currentkiste)
				currentkiste = currentkiste-1
			end
		end
		if(health < 600) then
			if(currentkiste > 3) then
				dropVehicleCrate(currentkiste)
				currentkiste = currentkiste-1
			end
		end
		if(health < 700) then
			if(currentkiste > 4) then
				dropVehicleCrate(currentkiste)
				currentkiste = currentkiste-1
			end
		end
		if(health < 800) then
			if(currentkiste > 5) then
				dropVehicleCrate(currentkiste)
				currentkiste = currentkiste-1
			end
		end
		if(health < 900) then
			if(currentkiste > 6) then
				dropVehicleCrate(currentkiste)
				currentkiste = currentkiste-1
			end
		end
		if(health < 1000) then
			if(currentkiste > 7) then
				dropVehicleCrate(currentkiste)
				currentkiste = currentkiste-1
			end
		end
	end)
end
-- truck: 1421.7349853516, -1347.0494384766, 13.963488578796, 0.23348999023438
-- EVENT HANDLERS --

addEventHandler("onWarenhausUeberfallStart", getRootElement(), function()
	if not(isEvil(source)) then 
		outputChatBox("Manager sagt: Was machst du hier?", source, 255, 255, 255)
		return
	end
	if(running == true) then
		outputChatBox("Ein Ueberfall hat bereits stattgefunden! Du musst noch Warten!", source, 255, 0, 0)
	return end
	
	for index, p in next, ped do
		setPedAnimation(p, "ped", "cower", -1, true, false, false)
	end
	local x1, y1 = getElementPosition(ped[12])
	local x2, y2 = getElementPosition(source)
	local rot = math.atan2(y2 - y1, x2 - x1) * 180 / math.pi
	rot = rot-90
	setPedRotation(ped[12], rot)
	setPedAnimation(ped[12], "shop", "SHP_Rob_HandsUp", -1, true, false, false)
	running = true
	timer = setTimer(resetWarenhaus, 30*60*1000, 1)
	outputChatBox(getPlayerName(source).." sagt: Haende hoch! Sofort!", source, 255, 255, 255)
	local thePlayer = source
	setTimer(function()
		outputChatBox("Manager sagt: Was wollen sie von mir?!", thePlayer, 255, 255, 255)
		setTimer(function()
			outputChatBox(getPlayerName(thePlayer).." sagt: Wo sind die Waffen?!", thePlayer, 255, 255, 255)
			setTimer(function()
				outputChatBox("Manager sagt: Hinter dem Warenhaus, toeten sie mich nicht!", thePlayer, 255, 255, 255)
				setTimer(function()
					setPedAnimation(ped[12], "ped", "cower", -1, true, false, false)
					toggleAllControls(thePlayer, false)
					fadeCamera(thePlayer, false)
					setTimer(setPlayerToUeberfall, 3000, 1, thePlayer)
				end, 3000, 1)
			end, 1500, 1)
		end, 1500, 1)
	end, 1000, 1)
end)