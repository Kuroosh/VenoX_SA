--[[function magnet (source, commandName)

	local x, y, z = getElementPosition ( source )
	local veh = createVehicle ( 417, x, y, z )
	setVehicleAsMagnetHelicopter (  veh )
end
addCommandHandler ("magnet",magnet)]]

function setVehicleAsMagnetHelicopter ( veh )

	if getElementModel ( veh ) == 417 then
		local x, y, z = getElementPosition ( veh )
		local magnet = createObject ( 1301, x, y, z-1.5)
		attachElements ( magnet, veh, 0, 0, -1.5 )
		vnxSetElementData ( veh, "magpos", -1.5 )
		vnxSetElementData ( veh, "magnet", magnet )
		vnxSetElementData ( veh, "magnetic", true )
		vnxSetElementData ( veh, "hasmagnetactivated", false )
	end
end

function destroyMagnet ( veh )

	if veh then
		source = veh
	end
	if vnxGetElementData ( source, "magnetic" ) then
		local magnet = vnxGetElementData ( veh, "magnet" )
		destroyElement ( magnet )
	end
end
addEventHandler ( "onVehicleExplode", getRootElement(), destroyMagnet )

function magnetUp ( player )

	local veh = getPedOccupiedVehicle ( player )
	if veh then
		local magpos = vnxGetElementData ( veh, "magpos" )
		if magpos then
			if magpos < -1.5 then
				local magnet = vnxGetElementData ( veh, "magnet" )
				detachElements ( magnet )
				local magpos = magpos+0.1
				attachElements ( magnet, veh, 0, 0, magpos, 0, 0, 0 )
				vnxSetElementData ( veh, "magpos", magpos )
			end
		end
	end
end
function magnetDown ( player )

	local veh = getPedOccupiedVehicle ( player )
	if veh then
		local magpos = vnxGetElementData ( veh, "magpos" )
		if magpos then
			if magpos > -15 then
				local magnet = vnxGetElementData ( veh, "magnet" )
				detachElements ( magnet )
				local magpos = magpos-0.1
				attachElements ( magnet, veh, 0, 0, magpos, 0, 0, 0 )
				vnxSetElementData ( veh, "magpos", magpos )
			end
		end
	end
end

function bindTrigger ()

	if getElementType ( source ) == "player" then
		if not isKeyBound ( source, "lctrl", "down", magnetVehicleCheck ) then
			bindKey ( source, "lctrl", "down", magnetVehicleCheck )
			bindKey ( source, "rctrl", "down", magnetVehicleCheck )
			bindKey ( source, "num_sub", "down", magnetUp )
			bindKey ( source, "num_add", "down", magnetDown )
		end
	end
end
function unbindTrigger ()

	if isKeyBound ( source, "lctrl", "down", magnetVehicleCheck ) then
		unbindKey ( source, "lctrl", "down", magnetVehicleCheck )
		unbindKey ( source, "rctrl", "down", magnetVehicleCheck )
		unbindKey ( source, "num_sub", "down", magnetUp )
		unbindKey ( source, "num_add", "down", magnetDown )
	end
end
addEventHandler ( "onPlayerVehicleEnter", getRootElement(), bindTrigger )
addEventHandler ( "onPlayerVehicleExit", getRootElement(), unbindTrigger )
addEventHandler ( "onPlayerWasted", getRootElement(), unbindTrigger )

function magnetVehicleCheck ( player )

	local veh = getPedOccupiedVehicle ( player )
	if veh then
		if vnxGetElementData ( veh, "magnetic" ) then
			if vnxGetElementData ( veh, "hasmagnetactivated" ) then
				vnxSetElementData ( veh, "hasmagnetactivated", false )
				detachElements ( vnxGetElementData ( veh, "magneticVeh" ) )
			else
				local magnet = vnxGetElementData ( veh, "magnet" )
				local x, y, z = getElementPosition ( magnet )
				local magpos = vnxGetElementData ( veh, "magpos" )
				local marker = createColSphere ( x , y , z, 2 )
				local vehs = getElementsWithinColShape ( marker, "vehicle" )
				destroyElement ( marker )
				grabveh = false
				for key, vehitem in ipairs(vehs) do
					if vehitem ~= veh then
						local grabveh = vehitem
						attachElements ( grabveh, magnet, 0, 0, -1, 0, 0, getVehicleRotation(grabveh) )
						vnxSetElementData ( veh, "hasmagnetactivated", true )
						vnxSetElementData ( veh, "magneticVeh", grabveh )
						break
					end
				end
			end
		end
	end
end