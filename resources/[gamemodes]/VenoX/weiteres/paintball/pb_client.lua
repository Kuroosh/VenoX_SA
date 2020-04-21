delay = 30000
r = math.random (0,255)
g = math.random (0,255)
b = math.random (0,255)


function setColor (cmd, r2, g2, b2)
	if r2 then
	    if tonumber (r2) >= 0 and tonumber (r2) <= 255 then
	    	r = tonumber (r2)
	    end
	end
 	if g2 then
	    if tonumber (g2) >= 0 and tonumber (g2) <= 255 then
	    	g = tonumber (g2)
	    end
	end
 	if b2 then
	    if tonumber (b2) >= 0 and tonumber (b2) <= 255 then
	    	b = tonumber (b2)
	    end
	end
end

function weaponfired (weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement )
	local marker = createMarker ( hitX, hitY, hitZ, "corona", 0.1, r, g, b, 255 )
	setElementDimension(marker, 1000)
setElementInterior(marker, 2)
setTimer ( destroyElement, delay, 1, marker )
end

command = addCommandHandler ( "color", setColor)
addEventHandler ( "onClientPlayerWeaponFire", getRootElement(), weaponfired )

