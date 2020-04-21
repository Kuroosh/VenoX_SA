terrorpackage_price = 250
local terror_marker = createMarker ( -1959.8393554688, -1623.1590576172, 85.096748352051, "cylinder", 3 )
local vehWithBomb = {}

function finishTerrorBomb ( veh, player )

	if isElement(veh) and isElement(player) then
	
		outputChatBox ( "Bombe ist fertig eingebaut!", player, 0, 125, 0 )
		outputChatBox ( "Benutze /detonate, um sie zu zuenden!", player, 0, 125, 0 )
		setElementFrozen ( veh, false )
		vehWithBomb[veh] = true
		
		addEventHandler ( "onVehicleRespawn", veh, 
			function ()
				vehWithBomb[source] = nil
			end )
		
	end

end

addEventHandler( "onMarkerHit", terror_marker, 
	function ( element, dim )
	
		if getElementType( element ) == "vehicle" then
		
			local player = getVehicleOccupant ( element )
		
			if player then 
			
				if isTerror ( player ) then
				
					setElementFrozen ( element, true )
					outputChatBox ( "Bombe wird eingebaut ...", player, 125, 125, 0 )
					
					setTimer ( finishTerrorBomb, 20000, 1, element, player )
				
				end
			
			end
		
		end
	
	end )
	
function terrorExplodeCar ( car, pl )

	local x, y, z = getElementPosition ( car )

	createExplosion ( x, y, z, 0, pl )
	createExplosion ( x, y, z, 10, pl )
	createExplosion ( x, y, z, 8, pl )
	createExplosion ( x, y, z, 4, pl )
	createExplosion ( x, y, z, 2, pl )
	createExplosion ( x, y, z, 1, pl )
	vehWithBomb[car] = nil
	blowVehicle ( car, true )

end
	
addCommandHandler ( "detonate", 
	function ( player )
	
		local veh = getPedOccupiedVehicle ( player )
	
		if isTerror(player) and veh then
		
			local pcheck = getVehicleOccupant ( veh )
			
			if pcheck == player and vehWithBomb[veh] then
			
				outputChatBox ( "Bombe geht in 10 Sekunden hoch ...", player, 125, 125, 0 )
				setTimer ( terrorExplodeCar, 10000, 1, veh, player )
			
			end
		
		end
	
	end, false, false )

function equip_func ( player )

	local money = tonumber ( vnxGetElementData ( player, "money" ) )
	if money >= terrorpackage_price then
		local x, y, z = getElementPosition ( player )
		if getDistanceBetweenPoints3D ( x, y, z, -1998.3441162109, -1537.8443603516, 84.67 ) <= 5 then
			if isTerror ( player ) then
				if vnxGetElementData ( player, "rang" ) >= 2 then
					vnxSetElementData ( player, "money", money - terrorpackage_price )
					playSoundFrontEnd ( player, 40 )
					
					vnxSetElementData ( player, "hasBomb", true )
					
					local weapon = 30
					local ammo = 90
					giveWeapon ( player, weapon, ammo, true )
					
					local weapon = 24
					local ammo = 28
					giveWeapon ( player, weapon, ammo, true )
					
					local weapon = 39
					local ammo = 1
					giveWeapon ( player, weapon, ammo, true )
					
					local weapon = 35
					local ammo = 3
					giveWeapon ( player, weapon, ammo, true )
					
					local weapon = 32
					local ammo = 300
					giveWeapon ( player, weapon, ammo, true )
				end
			else
				outputChatBox ( "Du bist kein Terrorist!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du bist nicht beim Lager!", player, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast zu\nwenig Geld!\nDer Skin kostet\n"..skinpreis.." $!", 5000, 125, 0, 0 )
	end
end
addCommandHandler ( "equip", equip_func )

function arm_func ( player )

	if isTerror ( player ) then
		if isKeyBound ( player, "mouse3", "up", explodeTerror ) then
			outputChatBox ( "Bombe entschaerft!", player, 0, 125, 0 )
			vnxSetElementData ( player, "hasBomb", true )
			setPlayerNametagColor ( player, 200, 200, 200 )
			unbindKey ( player, "mouse3", "up", explodeTerror )
		elseif vnxGetElementData ( player, "armingBomb" ) then
			outputChatBox ( "Du machst die Bombe bereits scharf!", player, 125, 0, 0 )
		elseif vnxGetElementData ( player, "hasBomb" ) then
			setTimer ( arm_bomb, 7500, 1, player )
			outputChatBox ( "Bombe wird scharfgemacht...", player, 125, 125, 0 )
			vnxSetElementData ( player, "armingBomb", true )
		else
			outputChatBox ( "Du hast keine Bombe!", player, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "arm", arm_func )

function arm_bomb ( player )

	if not isPedDead ( player ) and vnxGetElementData ( player, "hasBomb" ) then
		bindKey ( player, "mouse3", "up", explodeTerror, player )
		outputChatBox ( "Bombe ist scharf!", player, 0, 125, 0 )
		setPlayerNametagColor ( player, 200, 0, 0 )
		vnxSetElementData ( player, "hasBomb", false )
	else
		outputChatBox ( "Du hast keine Bombe/bist Tod!", player, 125, 0, 0 )
	end
	vnxSetElementData ( player, "armingBomb", false )
end

function explodeTerror ( keyPresser )

	local x, y, z = getElementPosition ( keyPresser )
	local rnd = math.random ( 7, 12 )
	createExplosion ( x, y, z, rnd, keyPresser )
	setTimer ( reExplode, 100, 1, keyPresser )
	setPlayerNametagColor ( keyPresser, 200, 200, 200 )
	unbindKey ( keyPresser, "mouse3", "up", explodeTerror )
end

function reExplode ( player )

	setTimer ( reReExplode, math.floor(math.random(200,1000)), 1, player )
	setTimer ( reReExplode, math.floor(math.random(200,1000)), 1, player )
	setTimer ( reReExplode, math.floor(math.random(200,1000)), 1, player )
	setTimer ( reReExplode, math.floor(math.random(200,1000)), 1, player )
	setTimer ( reReExplode, math.floor(math.random(200,1000)), 1, player )
end

function reReExplode ( player )

	local veh = getPedOccupiedVehicle ( player )
	local x, y, z = getElementPosition ( player )
	if veh then
		local x, y, z = getElementPosition ( veh )
	end
	local rnd = math.random ( 7, 12 )
	createExplosion ( x, y, z, rnd, player )
end