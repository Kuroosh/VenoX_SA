codriverVehs = { [500]=true, [422]=true, [478]=true }

function glue()
	local player = getLocalPlayer()
	if not getPedOccupiedVehicle(player) then
		local vehicle = getPedContactElement(player)
		if vehicle and getElementType(vehicle) == "vehicle" then
			if raftboats[getElementModel(vehicle)] or motorboats[getElementModel(vehicle)] or codriverVehs[getElementModel(vehicle)] then
				local px, py, pz = getElementPosition(player)
				local vx, vy, vz = getElementPosition(vehicle)
				local sx = px - vx
				local sy = py - vy
				local sz = pz - vz
				
				local rotpX = 0
				local rotpY = 0
				local rotpZ = getPedRotation(player)
				
				local rotvX,rotvY,rotvZ = getElementRotation(vehicle)
				
				local t = math.rad(rotvX)
				local p = math.rad(rotvY)
				local f = math.rad(rotvZ)
				
				local ct = math.cos(t)
				local st = math.sin(t)
				local cp = math.cos(p)
				local sp = math.sin(p)
				local cf = math.cos(f)
				local sf = math.sin(f)
				
				local z = ct*cp*sz + (sf*st*cp + cf*sp)*sx + (-cf*st*cp + sf*sp)*sy
				local x = -ct*sp*sz + (-sf*st*sp + cf*cp)*sx + (cf*st*sp + sf*cp)*sy
				local y = st*sz - sf*ct*sx + cf*ct*sy
				
				local rotX = rotpX - rotvX
				local rotY = rotpY - rotvY
				local rotZ = rotpZ - rotvZ
				
				local slot = getPedWeaponSlot(player)
				
				triggerServerEvent("gluePlayer", player, vehicle, x, y, z, rotX, rotY, rotZ)
				
				unbindKey("x","down",glue)
				bindKey("enter","down",unglue)
			end
		end
	end
end
bindKey("x","down",glue)

function unglue ()
	local player = getLocalPlayer()
	triggerServerEvent("ungluePlayer", player)
	unbindKey("enter","down",unglue)
	bindKey("x","down",glue)
end