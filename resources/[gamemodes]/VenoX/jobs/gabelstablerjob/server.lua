local car1 = createVehicle(455, 1107.5999755859, 1896.4000244141, 11.300000190735, 0, 0, 90)
setElementFrozen(car1, true)
setVehicleDamageProof(car1, true)

local car2 = createVehicle(455, 1107.8000488281, 1926, 11.300000190735, 0, 0, 90)
setElementFrozen(car2, true)
setVehicleDamageProof(car2, true)

local car3 = createVehicle(455, 1133.3000488281, 1896.5999755859, 11.300000190735, 0, 0, 270)
setElementFrozen(car3, true)
setVehicleDamageProof(car3, true)

local car4 = createVehicle(455, 1133.3000488281, 1911.5999755859, 11.300000190735, 0, 0, 270)
setElementFrozen(car4, true)
setVehicleDamageProof(car4, true)

local car5 = createVehicle(455, 1107.9000244141, 1911.4000244141, 11.300000190735, 0, 0, 90)
setElementFrozen(car5, true)
setVehicleDamageProof(car5, true)

local lohn = 30
local stabler = {}

gabelstablerjobicon = createPickup(1054.0999755859, 1919, 10.5, 3, 1239, 1000)
local marker = createMarker(1054.0999755859, 1919, 10.5, "corona", 1.0, 0, 0, 0, 0)
local blip = createBlip(1054.0999755859, 1919, 10.5, 58, 2, 255, 0, 0, 255, 0, 999)




addEventHandler("onMarkerHit", marker, function(hitElement)
	if(getElementType(hitElement) == "player") then
		-- SICHERHEITSHINWEIS, LEYYNEN HIER AEHM JOB HINZUFUEGEN ODER WIE DAS BEI VIO IST --
		if vnxGetElementData ( hitElement, "job" ) == "gabelstablerjob" then
			triggerClientEvent("onClientGabelstablerJobHit", hitElement)
		else
			triggerClientEvent ( hitElement, "infobox_start", getRootElement(), "\nTippe /job, um\nals Gabelstabler-\nfahrer zu\narbeiten.", 7500, 200, 200, 0 )
		end
	end
end)



addEvent("onGabelstablerJobStart", true)
addEvent("onGabelstablerJobAbgeliefert", true)
addEvent("onGabelstablerJobStop", true)

addEventHandler("onGabelstablerJobStart", getRootElement(), function()
	if(isElement(stabler[source])) then return end
	if(vnxGetElementData(source, "job") == "gabelstabler") then return end
	setCameraMatrix(source, 1093.2479, 1891.6010, 16, 1075.02, 1883.3138, 10.8203)
	outputChatBox("Lade die Kisten auf deinem Gabelstabler. Fuer jede kiste bekommst du $"..lohn..". Du bekommst extra Geld fuer gruene Kisten.", source, 0, 255, 0)
	setElementFrozen(source, true)
	local thePlayer = source
	setTimer(function()
		outputChatBox("Bringe die Kisten dann zu den Flatbed's.", thePlayer, 0, 255, 0)
		setCameraMatrix(thePlayer, 1094.4500, 1896.004, 16.4873, 1112.6311, 1909.3779, 10.8203)
		setTimer(function()
			fadeCamera(thePlayer, false)
			setTimer(function()
				if(isElement(thePlayer)) then
					setElementFrozen(thePlayer, false)
					setCameraTarget(thePlayer, thePlayer)
					fadeCamera(thePlayer, true)
					vnxSetElementData(thePlayer, "job", "gabelstabler")
					stabler[thePlayer] = createVehicle(getVehicleModelFromName("Forklift"), 1091.6999511719, 1891.3000488281, 10.60000038147, 0, 0, 180, getPlayerName(thePlayer))
					warpPedIntoVehicle(thePlayer, stabler[thePlayer])
					setVehicleDamageProof(stabler[thePlayer], true)
				end
			end, 1500, 1)
		end, 2500, 1)
	end, 5000, 1)
end)

addEventHandler("onGabelstablerJobStop", getRootElement(), function()
	local thePlayer = source
	if(stabler[thePlayer]) and (vnxGetElementData(thePlayer, "job") == "gabelstabler") then
		destroyElement(stabler[thePlayer])
		vnxSetElementData(thePlayer, "job", false)
		triggerClientEvent(thePlayer, "onClientGabelstablerJobQuit", thePlayer)
		outputChatBox("Job beendet!", thePlayer, 0, 255, 255)
		setElementPosition(thePlayer, 1054.4455, 1916.7481, 10.8203)
	end
end)

-- addCommandHandler("stopjob", function(thePlayer)
	-- triggerEvent("onGabelstablerJobStop", thePlayer)
-- end)

addEventHandler("onPlayerWasted", getRootElement(), function()
	if(stabler[source]) then
		triggerEvent("onGabelstablerJobStop", source)
	end
end)

addEventHandler("onPlayerQuit", getRootElement(), function()
	if(stabler[source]) then
		triggerEvent("onGabelstablerJobStop", source)
	end
end)

addEventHandler("onPlayerVehicleExit", getRootElement(), function()
	if(stabler[source]) then
		triggerEvent("onGabelstablerJobStop", source)
	end
end)

addEventHandler("onGabelstablerJobAbgeliefert", getRootElement(), function(lohn2)
	-- SICHERHEITSHINWEIS --
	vnxSetElementData ( source, "money", vnxGetElementData ( source, "money" ) + lohn + lohn2 )
end)