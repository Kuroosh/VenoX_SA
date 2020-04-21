local gateMoved = false
local triadGate = createObject ( 986, -2241.7890625, 643.9013671875, 50.107360839844, 0, 0, 90 )
function gate_func ( player )
	if isTriad(player) or isOnDuty(player) or vnxGetElementData ( player, "adminlvl" ) >= 3 then	
		if getDistanceBetweenPoints3D ( -2241.7890625, 643.9013671875, 50.107360839844, getElementPosition ( player ) ) < 10 then
			if gateMoved == false then
				moveObject ( triadGate, 3000, -2241.7890625, 643.9013671875, 41.357360839844, 0, 0, 0 )
				gateMoved = true
			else
				moveObject ( triadGate, 3000, -2241.7890625, 643.9013671875, 50.107360839844, 0, 0, 0 )
				gateMoved = false
			end
		end
	end
end
addCommandHandler ( "mv", gate_func )


local gate_lv_1 = createObject(980, 997.40002, 1755.6, 12.5, 0, 0, 270)
local gate_lv_1_status = false 

function gate_lv_1_triaden(player)
	if isTriad(player) or isOnDuty(player) or vnxGetElementData ( player, "adminlvl" ) >= 3 then	
		if getDistanceBetweenPoints3D ( 997.40002, 1755.6, 12.5, getElementPosition ( player ) ) < 10 then
			if gate_lv_1_status == false then
				moveObject ( gate_lv_1, 3000, 997.40002, 1755.6, 7, 0, 0, 0 )
				gate_lv_1_status = true
			else
				moveObject ( gate_lv_1, 3000, 997.40002, 1755.6, 12.5, 0, 0, 0 )
				gate_lv_1_status = false
			end
		end
	end
end 
addCommandHandler ( "mv", gate_lv_1_triaden )

local gate_lv_2 = createObject(980, 997.5, 1711, 12.7, 0, 0, 270)
local gate_lv_2_status = false 

function gate_lv_2_triaden(player)
	if isTriad(player) or isOnDuty(player) or vnxGetElementData ( player, "adminlvl" ) >= 3 then	
		if getDistanceBetweenPoints3D ( 997.5, 1711, 12.5, getElementPosition ( player ) ) < 10 then
			if gate_lv_2_status == false then
				moveObject ( gate_lv_2, 3000, 997.5, 1711, 7, 0, 0, 0 )
				gate_lv_2_status = true
			else
				moveObject ( gate_lv_2, 3000,  997.5, 1711, 12.7, 0, 0, 0 )
				gate_lv_2_status = false
			end
		end
	end
end 
addCommandHandler ( "mv", gate_lv_2_triaden )