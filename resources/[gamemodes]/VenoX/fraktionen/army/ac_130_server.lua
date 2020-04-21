--[[local ac130CamPos
function ac130 ()

	armyAC130 = createVehicle ( 592, 308.75, 2047.62, 18.76, 0, 0, 180 )
	setElementPosition ( armyAC130, 399.055, 2502.59, 33.75 )
	local veh = armyAC130
	ac130CamPos = createObject ( 1239, 398.68, 2504.05, 31.84, 0, 0, 0 )
	setElementAlpha ( ac130CamPos, 0 )
	attachElementsInCorrectWay ( ac130CamPos, veh )
	
	setElementPosition ( veh, 308.75, 2047.62, 18.76 )
	setElementRotation ( veh, 0, 0, 180 )
	
	setVehicleColor ( veh, 0, 0, 0, 0 )
	addEventHandler ( "onVehicleExplode", armyAC130,
		function ()
			ac130 ()
		end
	)
	
	addEventHandler ( "onVehicleEnter", armyAC130, ac130Enter )
end

function ac130Enter ( player, seat )

	if isArmy ( player ) and getPlayerRank ( player ) >= 4 then
		if seat == 1 and isArmyAirstrikePermitted ( player ) then
			setElementClicked ( player, true )
			triggerClientEvent ( player, "joinAC130Gun", player, ac130CamPos )
		end
	else
		opticExitVehicle ( player )
		outputChatBox ( "Du bist kein Mitglied der Leaderschaft der Army!", player, 125, 0, 0 )
	end
end
ac130 ()

function ad130shotFire ( typ, x, y, z )

	if typ == 0 then
		createExplosion ( x, y, z + 0.5, 4, client )
	elseif typ == 1 then
		
	elseif typ == 2 then
		
	end
end
addEvent ( "ad130shotFire", true )
addEventHandler ( "ad130shotFire", getRootElement(), ad130shotFire )]]