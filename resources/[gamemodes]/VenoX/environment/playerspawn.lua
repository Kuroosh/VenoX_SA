function onPlayerSpawn_func ()

	setPedSkin ( source, vnxGetElementData ( source, "skinid") )
	setPlayerHudComponentVisible ( source, "radar", true )
	setTimer ( ShowWanteds_func, 250, 1, source )
	
    if isKeyBound ( source, "r", "down", reload ) then
        unbindKey ( source, "r", "down", reload )
    end
    
    bindKey ( source, "r", "down", reload )
	if isArmy(source) then
	setPedArmor ( source, 100 )
  	end
end
addEventHandler("onPlayerSpawn", getRootElement(), onPlayerSpawn_func )

function ShowWanteds_func ( player )
	
	setPlayerWantedLevel ( player, tonumber(vnxGetElementData ( player, "wanteds" )) )
end