function gluePlayer(vehicle, x, y, z, rotX, rotY, rotZ)
	if source == client then
		attachElements(source, vehicle, x, y, z, rotX, rotY, rotZ)
		setPedWeaponSlot(source, 0)
		bindKey ( source, "mouse_wheel_up", "down", weaponsup )
		bindKey ( source, "mouse_wheel_down", "down", weaponsdown )
	end
end
addEvent("gluePlayer",true)
addEventHandler("gluePlayer",getRootElement(),gluePlayer)

function ungluePlayer()
	if source == client then
		detachElements(source)
		unbindKey ( source, "mouse_wheel_up", "down", weaponsup )
		unbindKey ( source, "mouse_wheel_down", "down", weaponsdown )
	end
end
addEvent("ungluePlayer",true)
addEventHandler("ungluePlayer",getRootElement(),ungluePlayer)