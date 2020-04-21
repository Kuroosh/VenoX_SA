function onClientPlayerWeaponFireFunc(weapon,ammo,ammoInClip,hitX,hitY,hitZ,hitElement)
	if weapon == 38 then
		local x,y,z = getElementPosition(getLocalPlayer())
		local z = z + 0.6
		if not createProjectile(getLocalPlayer(),19,x,y,z,220) then
		end
	end
end
addEventHandler("onClientPlayerWeaponFire", getLocalPlayer(), onClientPlayerWeaponFireFunc)

function onClientPlayerWeaponFireFunc(weapon,ammo,ammoInClip,hitX,hitY,hitZ,hitElement)
	if weapon == 38 then
		cancelEvent()
	end
end
addEventHandler("onClientPlayerWeaponFire", getLocalPlayer(), onClientPlayerWeaponFireFunc)