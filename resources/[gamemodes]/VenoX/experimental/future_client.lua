function audio ()

	playSound ( "http://metafiles.gl-systemhaus.de/hr/youfm_2.m3u", true );
end
addCommandHandler ( "audio", audio )

function spark ( _, _, _, _, x, y, z )

	outputChatBox ( "CLICK" )
	local dX, dY, dZ = 0, 0, 0
	-- DEBUG --
		local pX, pY, pZ = getPedBonePosition ( lp, 36 )
		dX = pX - x
		dY = pY - y
		dZ = pZ - z
		
		local curBiggest = 0
		if ( dX > curBiggest ) then
			curBiggest = dX
		end
		if ( dY > curBiggest ) then
			curBiggest = dY
		end
		if ( dZ > curBiggest ) then
			curBiggest = dZ
		end
		
		-- Middle --
		local var, posX, posY, posZ
		var = 0.5
		posX = pX - var * dX
		posY = pY - var * dY
		posZ = pZ - var * dZ
		fxAddBlood ( posX, posY, posZ, 0, 0, 0 )
		-- Middle --
		
		dX = dX / curBiggest
		dY = dY / curBiggest
		dZ = dZ / curBiggest
		
		outputChatBox ( "VECTOR: ("..dX.."|"..dY.."|"..dZ..")" )
	-- DEBUG --
	fxAddBulletImpact ( x, y, z, dX, dY, dZ, 1, 1, 1 )
	fxAddGunshot ( pX, pY, pZ, dX * -1, dY * -1, dZ * -1, 1, 1, 1 )
	
	playSoundFrontEnd ( 29 )
end
addEventHandler ( "onClientClick", getRootElement(), spark )