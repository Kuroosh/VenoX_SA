function checkZombieAlertZones ()

	local bots = getElementsWithinColShape ( playerShape, "ped" )
	for key, ped in ipairs ( bots ) do
		if getElementData ( ped, "zombie" ) and not getElementData ( ped, "alert" ) then
			if isPlayerInBotSight ( ped ) then
				triggerServerEvent ( "zombieSpottedEnemy", ped, lp )
			end
		end
	end
end

function checkZombieAttackZones ()

	local attackBots = getElementsWithinColShape ( playerAttackShape, "ped" )
	for key, ped in ipairs ( attackBots ) do
		if not isPedDead ( ped ) then
			if getElementData ( ped, "zombie" ) and getElementData ( ped, "alert" ) then
				setElementHealth ( lp, getElementHealth ( lp ) - math.random ( 5, 15 ) )
				showBloodFlash ()
				setPedControlState ( ped, "fire", true )
				setTimer ( setPedControlState, 800, 1, ped, "fire", false )
				--[[
				setPedAnimation ( ped )
				--setPedControlState ( ped, "fire", false )
				--setPedVoice(theZomb, "PED_TYPE_DISABLED")
				local x, y, z = getElementPosition ( lp )
				setPedAimTarget ( ped, x, y, z )
				local x1, y1, z1 = getElementPosition ( ped )
				local rot = findRotation ( x1, y1, x, y )
				setPedRotation ( ped, rot )
				setPedControlState ( ped, "fire", true )
				setTimer ( setPedControlState, 800, 1, ped, "fire", false )]]
			end
		end
	end
end

function makeZombieJump_func ( zombie )

	setPedAnimation ( zombie )
	setPedControlState ( zombie, "jump", true )
	setTimer ( setPedControlState, 800, 1, zombie, "jump", false )
end
addEvent ( "makeZombieJump", true )
addEventHandler ( "makeZombieJump", getRootElement(), makeZombieJump_func )

function onZombieHeadshot ( attacker, weapon, bodypart )

	if attacker then
		if source == lp then
			if getElementData ( attacker, "zombie" ) then
				setElementHealth ( lp, getElementHealth ( lp ) - math.random ( 7, 20 ) )
			end
		elseif attacker == lp then
			if bodypart == 9 and getElementData ( source, "zombie" ) then
				triggerServerEvent ( "killZombie", getRootElement(), source )
			end
		end
	end
end
addEventHandler ( "onClientPedDamage", getRootElement(), onZombieHeadshot )

function renderZombieAnimations ()

	setPedAnimation ( zombie, "ped", "run_old", -1, true, true, true )
end

function createPlayerColShapes ()

	local x, y, z = getElementPosition ( lp )
	playerShape = createColSphere ( x, y, z, 40 )
	playerAttackShape = createColSphere ( x, y, z, 1 )
	setTimer ( updateColPositions, 1000, -1 )
	setTimer ( checkZombieAlertZones, 1000, -1 )
	setTimer ( checkZombieAttackZones, 1000, -1 )
end
addEventHandler ( "onClientResourceStart", getResourceRootElement ( getThisResource() ), createPlayerColShapes )

function updateColPositions ()

	local x, y, z = getElementPosition ( lp )
	setElementPosition ( playerShape, x, y, z )
	setElementPosition ( playerAttackShape, x, y, z )
end