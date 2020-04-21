function clientRenderMagnet ()
	local vehitem = getPedOccupiedVehicle ( getLocalPlayer() )
	if vehitem then
		local mv = getElementData ( vehitem, "magnet" )
		if mv then
			local x1, y1, z1 = getElementPosition ( mv )
			local x2, y2, z2 = getElementPosition ( vehitem )
			dxDrawLine3D ( x1, y1, z1, x2, y2, z2, tocolor ( 100, 100, 100, 255 ), 10 )
		else
			removeEventHandler ( "onClientRender", getRootElement(), clientRenderMagnet )
		end
	else
		removeEventHandler ( "onClientRender", getRootElement(), clientRenderMagnet )
	end
end


addEventHandler ( "onClientPlayerVehicleEnter", localPlayer, function ( vehicle )
	if getElementData ( vehicle, "magnet" ) then
		addEventHandler ( "onClientRender", getRootElement(), clientRenderMagnet )
	end
end )