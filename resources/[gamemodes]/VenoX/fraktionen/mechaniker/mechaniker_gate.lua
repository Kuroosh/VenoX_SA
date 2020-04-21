--[[------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------
---- Script by Noneatme ------

local gate = {}
local gatevar = {}
gate[1] = createObject(7891, -2658.802734375, 431.8349609375, 5.3074681282043, 0, 0, 90) -- Vordere Tor
setObjectScale(gate[1], 0.9)
-- Offen: -2658.802734375, 433.68450927734, 7.4074683189392, 0, 90, 90
gatevar[1] = false


addCommandHandler("mv", function(thePlayer)
	if (isMechaniker(thePlayer) or isMedic(thePlayer)) then
		local x, y, z = getElementPosition(gate[1])
		local x2, y2, z2 = getElementPosition(thePlayer)
		if(getDistanceBetweenPoints3D(x, y, z, x2, y2, z2) > 10) then return end
		local i = 1
		if(gatevar[i] == false) then
			gatevar[i] = true
			moveObject(gate[i], 1500, -2658.802734375, 433.68450927734, 7.4074683189392, 0, 90, 0, "InOutQuad")
		else
			gatevar[i] = false
			moveObject(gate[i], 1500, -2658.802734375, 431.8349609375, 5.3074681282043, 0, -90, 0, "InOutQuad")
		end
	end
end)

local element = {}
element["schranke1"] = createObject(968, -2642.8999023438, 386.92501831055, 4.0999999046326, 0, -90, 90)
element["schranke2"] = createObject(968, -2646.1999511719, 345.10000610352, 4.1999998092651, 0, -90, 0)
element["schranke3"] = createObject(968, -2696.6442871094, 457.92163085938, 4.0859365463257, 0, 270, 90)

local svar = {}
svar[1] = true
svar[2] = true
svar[3] = true

local smoving = {}
smoving[1] = false
smoving[2] = false
smoving[3] = false

for i = 1, #svar, 1 do
	addCommandHandler("mv", function(thePlayer)
		if(isMechaniker(thePlayer) or isMedic(thePlayer)) then
			local x, y, z = getElementPosition(element["schranke"..i])
			local x2, y2, z2 = getElementPosition(thePlayer)
			if(getDistanceBetweenPoints3D(x, y, z, x2, y2, z2) > 10) then return end
			if(svar[i] == false) then
				svar[i] = true
				moveObject(element["schranke"..i], 1500, x, y, z, 0, -90, 0, "OutBounce")
			else
				svar[i] = false
				moveObject(element["schranke"..i], 1500, x, y, z, 0, 90, 0, "OutBounce")
			end
		end
	end)
end]]
	
