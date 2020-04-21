local ped = {}

local dim = 5

-- "ped", "phone_talk",
-- "ped", "XPRESSscratch",

local gabelstabler = createVehicle(530, 1090.9854736328, 2116.4152832031, 10.620398521423, 0, 0, 60)
setElementDimension(gabelstabler, dim)
setVehicleDamageProof(gabelstabler, true)

local managercol = createColSphere(1088.953125, 2121.1882324219, 10.8203125, 3)
setElementDimension(managercol, dim)

bindKey("aim_weapon", "down", function()
	if(getElementDimension(localPlayer) == dim) and (isElementWithinColShape(localPlayer, managercol) == true) then
		if(getPedWeapon(localPlayer) ~= 0) then
			triggerServerEvent("onWarenhausUeberfallStart", localPlayer)
		end
	end
end)