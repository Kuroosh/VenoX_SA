------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------
---- Script by Noneatme ------

-- VARIABLEN --

local cFunc = {}
local cSetting = {}

addEvent("applySpecialEvent", true)

local eventmarker1
local eventmarker2
local eventblip
local timer
-- FUNCTIONS --

cFunc["removeEvent"] = function(typ)
	if(typ == "2") then
		destroyElement(eventmarker2)
		destroyElement(eventblip)
		outputChatBox("Event gescheitert!", 255, 0, 0)
	end
end

addEventHandler("applySpecialEvent", getLocalPlayer(), function(typ)
	if(typ == "1") then
		if(isElement(eventmarker1)) then
			return;
		end
		eventmarker1 = createMarker(1464.8758544922, -585.751953125, 89.217292785645, "corona", 1.0, 0, 255, 0, 200)
		addEventHandler("onClientMarkerHit", eventmarker1, function(h)
			if(h == localPlayer) then
				destroyElement(source)
				triggerServerEvent("applySpecialEventFinish", localPlayer, typ)
			end
		end)
	elseif(typ == "2") then
		if(isElement(eventmarker2)) then
			return;
		end
		eventmarker2 = createMarker(-1816.685546875, 629.93798828125, 89.296875, "cylinder", 5.0, 0, 255, 0, 100)
		eventblip = createBlip(-1816.685546875, 629.93798828125, 89.296875, 0, 2, 255, 0, 0, 255, 0, 99999.0)
		timer = setTimer(cFunc["removeEvent"], 20000, 1, typ)
		addEventHandler("onClientMarkerHit", eventmarker2, function(h)
			if(h == localPlayer) then
				destroyElement(source)
				triggerServerEvent("applySpecialEventFinish", localPlayer, typ)
				destroyElement(eventblip)
				killTimer(timer)
			end
		end)
		
	end
end)

