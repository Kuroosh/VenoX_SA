zombies = {}

--- DEBUG ---

function startzombie_func ( player )

	local x, y, z = getElementPosition ( player )
	aiMasterStart ()
	for i = 1, 5 do
		createZombie ( getRandomZombieSkin (), x+math.random(-5,5)+10, y+math.random(-5,5)+10, z, false )
	end
	for i = 1, 10 do
		if math.random ( 1, 2 ) == 1 then
			dx = math.random(-15,-7)
		else
			dx = math.random(15,7)
		end
		if math.random ( 1, 2 ) == 1 then
			dy = math.random(-15,-7)
		else
			dy = math.random(15,7)
		end
		createZombie ( getRandomZombieSkin (), x+dx, y+dy, z+3, true )
	end
end
--addCommandHandler ( "startzombie", startzombie_func )

--- DEBUG ---

--- USEFULL ---

--[[
Eat-Animation
setPedAnimation ( ped, "MEDIC", "cpr", -1, false, true, false)

Walk-Animation
setPedAnimation ( ped, "PED", "Player_Sneak", -1, true, true, true)

Run-Animation A
setPedAnimation ( ped, "ped", "run_old", -1, true, true, true )

Run-Animation B
setPedAnimation ( ped, "WUZI", "Wuzi_Walk", -1, true, true, true )
]]

--- USEFULL ---


function zombieSpottedEnemy_func ( target )

	zombie = source
	nr = getElementData ( zombie, "nr" )
	setElementData ( zombie, "alert", true )
	_G["slaveZombieTarget"..nr] = target
	_G["slaveZombieAlert"..nr] = true
end
addEvent ( "zombieSpottedEnemy", true )
addEventHandler ( "zombieSpottedEnemy", getRootElement(), zombieSpottedEnemy_func )

function killZombie_func ( zombie )

	killPed ( zombie )
	setPedHeadless ( zombie, true )
end
addEvent ( "killZombie", true )
addEventHandler ( "killZombie", getRootElement(), killZombie_func )

function createZombie ( skin, x, y, z, attack )

	nr = nil
	for i = 1, maxzombies do
		if not _G["slaveZombie"..i] then
			nr = i
			break
		end
	end
	if nr then
		_G["slaveZombie"..nr] = createPed ( skin, x, y, z )
		
		setElementData ( _G["slaveZombie"..nr], "zombie", true )
		setElementData ( _G["slaveZombie"..nr], "nr", nr )
		if attack then
			_G["slaveZombieTarget"..nr] = getClosestPlayerAround ( _G["slaveZombie"..nr] )
			if not _G["slaveZombieTarget"..nr] then
				setElementData ( _G["slaveZombie"..nr], "alert", false )
				_G["slaveZombieAlert"..nr] = false
			else
				setElementData ( _G["slaveZombie"..nr], "alert", true )
				_G["slaveZombieAlert"..nr] = true
			end
		else
			_G["slaveZombieAlert"..nr] = false
			_G["slaveZombieTarget"..nr] = false
			setElementData ( _G["slaveZombie"..nr], "alert", false )
		end
		_G["slaveZombieAnimation"..nr] = math.random ( 1, 2 )
		currentZombies = currentZombies + 1
	end
end

function onZombieKilledPlayer ()

	local x, y, z = getElementPosition ( source )
	local zombieRange = createColSphere ( x, y, z, 30 )
	local players = getElementsWithinColShape ( zombieRange, "ped" )
	for key, ped in ipairs ( players ) do
		if getElementData ( ped, "alert" ) then
			local nr = getElementData ( ped, "nr" )
			if _G["slaveZombieTarget"..nr] == source then
				_G["slaveZombieTarget"..nr] = false
				_G["slaveZombieAlert"..nr] = false
				setElementData ( ped, "alert", false )
			end
		end
	end
end
addEventHandler ( "onPlayerDeath", getRootElement(), onZombieKilledPlayer )

function getClosestPlayerAround ( zombie )

	local x1, y1, z1 = getElementPosition ( zombie )
	local zombieRange = createColSphere ( x1, y1, z1, 15 )
	local players = getElementsWithinColShape ( zombieRange, "player" )
	for key, playeritem in ipairs ( players ) do
		if not isPedDead ( playeritem ) then
			return playeritem
		end
	end
	return false
end

function aiMasterCheck ()

	if currentZombies > 0 then
		for i = 1, maxzombies do
			if _G["slaveZombie"..i] then
				if isPedDead ( _G["slaveZombie"..i] ) then
					deleteNumber = deleteNumber + 1
					_G["slaveZombieDelete"..deleteNumber] = _G["slaveZombie"..i]
					_G["slaveZombie"..i] = false
					setTimer ( destroyElement, 10000, 1, _G["slaveZombieDelete"..deleteNumber] )
					currentZombies = currentZombies - 1
				else
					if isZombieInRange ( _G["slaveZombie"..i], run, i ) then
						if _G["slaveZombieAlert"..i] and isElement ( _G["slaveZombieTarget"..i] ) then
							moveZombieTowardsPlayer ( _G["slaveZombie"..i], _G["slaveZombieTarget"..i] )
						else
							_G["slaveZombieAlert"..i] = false
							_G["slaveZombieTarget"..i] = false
							if run == 3 then
								if math.random ( 1, 2 ) == 1 then
									setPedAnimation ( _G["slaveZombie"..i], "PED", "Player_Sneak", -1, true, true, true )
									setPedRotation ( _G["slaveZombie"..i], math.random ( 1, 360 ) )
								else
									setPedAnimation ( _G["slaveZombie"..i] )
								end
							end
						end
					else
						destroyElement ( _G["slaveZombie"..i] )
						_G["slaveZombie"..i] = false
						_G["slaveZombieAlert"..i] = false
						_G["slaveZombieTarget"..i] = false
						currentZombies = currentZombies - 1
					end
				end
			end
		end
	end
	if run == 3 then
		run = 0
	end
	run = run + 1
end

function moveZombieTowardsPlayer ( zombie, target )

	local x1, y1, z1 = getElementPosition ( zombie )
	local x2, y2, z2 = getElementPosition ( target )
	local rot = findRotation ( x1, y1, x2, y2 )
	setPedRotation ( zombie, rot )
	--setPedAnimation ( zombie, "WUZI", "Wuzi_Walk", -1, true, true, true )
	setPedAnimation ( zombie, "ped", "run_old", -1, true, true, true )
	if math.random ( 1, 5 ) == 1 then
		local zombieRange = createColSphere ( x1, y1, z1, 30 )
		local players = getElementsWithinColShape ( zombieRange, "player" )
		for key, playeritem in ipairs ( players ) do
			triggerClientEvent ( playeritem, "makeZombieJump", getRootElement(), zombie )
		end
	end
end

function isZombieInRange ( zombie, run, nr )

	if ( run == 1 and nr <= maxzombiesPart ) or ( run == 2 and nr <= maxzombiesPart*2 and nr > maxzombiesPart ) or ( run == 3 and nr <= maxzombiesPart*3 and nr > maxzombiesPart*2 ) then
		local x, y, z = getElementPosition ( zombie )
		local zombieRange = createColSphere ( x, y, z, zombieDeleteRange )
		local players = getElementsWithinColShape ( zombieRange, "player" )
		for key, player in ipairs(players) do
			return true
		end
		return false
	end
	return true
end

function aiMasterStart ()

	currentZombies = 0
	for i = 1, maxzombies do
		_G["slaveZombie"..i] = false
		_G["slaveZombieAlert"..i] = false
		_G["slaveZombieTarget"..i] = false
		_G["slaveZombieAnimation"..i] = false
	end
	run = 0
	aiMasterCheck = setTimer ( aiMasterCheck, 400, -1 )
end

function findRotation(x1,y1,x2,y2)
 
	local t = -math.deg ( math.atan2 ( x2 - x1, y2 - y1 ) )
	if t < 0 then t = t + 360 end
	return t
end