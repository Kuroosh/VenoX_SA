local speedUpVeh
local leaderVeh

function formationFound ( veh )
	addEventHandler ( "onClientVehicleExit", veh, formationStop )
	setPedCanBeKnockedOffBike ( lp, false )
end
addEvent ( "formationFound", true )
addEventHandler ( "formationFound", getRootElement(), formationFound )


function formationStop ( player )
	if player == localPlayer then
		removeEventHandler ( "onClientVehicleExit", source, formationStop )
		infobox ( "Deine Formation\nwurde aufgelöst!", 5000, 125, 0, 0 )
	end
end


function formationSpeedUpMember ( )
	if isElement ( speedUpVeh ) and isElement ( leaderVeh ) then
		local vx, vy, vz = getElementVelocity ( leaderVeh )
		local x1, y1, z1 = getElementPosition ( speedUpVeh )
		local x2, y2, z2 = getElementPosition ( leaderVeh )
		if z1 > z2 then         	 -- Ungetestet
			vz = vz - 0.1          	 -- Ungetestet
		end         				 -- Ungetestet
		setElementVelocity ( speedUpVeh, vx, vy, vz )
		local speed = math.sqrt ( vx ^ 2 + vy ^ 2 + vz ^ 2 ) / 0.00464
		local r1X, r1Y, r1Z = getElementRotation ( leaderVeh )
		local r2X, r2Y, r2Z = getElementRotation ( speedUpVeh )
		setElementRotation ( speedUpVeh, r2X, r2Y, r1Z )
		local dist = getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 )
		if dist >= 15 then
			setElementVelocity ( speedUpVeh, vx * 1.1, vy * 1.1, vz * 1.1 )
			setElementPosition ( speedUpVeh, x1 - ( x1 - x2 ) * 0.01, y1 - ( y1 - y2 ) * 0.01, z1 )
		elseif dist >= 8 then
			setElementVelocity ( speedUpVeh, vx * 1.03, vy * 1.03, vz * 1.03 )
			setElementPosition ( speedUpVeh, x1 - ( x1 - x2 ) * 0.01, y1 - ( y1 - y2 ) * 0.01, z1 )
		end
	else
		leavaeFormation()
	end
end


function formationStopMember ( player )
	if player == localPlayer then
		removeEventHandler ( "onClientVehicleExit", source, formationStopMember )
		leavaeFormation()
	end
end


function joinFormation ( veh, lveh )
	speedUpVeh = veh
	addEventHandler ( "onClientVehicleExit", speedUpVeh, formationStopMember ) 
	setPedCanBeKnockedOffBike ( lp, false )
	leaderVeh = lveh
	addEventHandler ( "onClientRender", root, formationSpeedUpMember )
end
addEvent ( "joinFormation", true )
addEventHandler ( "joinFormation", getRootElement(), joinFormation )


function leavaeFormation ()
	setPedCanBeKnockedOffBike ( lp, true )
	infobox ( "Deine Formation\nwurde aufgelöst!", 4000, 155, 0, 0 )
	removeEventHandler ( "onClientRender", root, formationSpeedUpMember )
end
addEvent ( "leavaeFormation", true )
addEventHandler ( "leavaeFormation", getRootElement(), leavaeFormation )