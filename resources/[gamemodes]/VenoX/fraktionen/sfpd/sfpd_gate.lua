local SFPDgateMoved = false
local SFPDGate1 = createObject ( 10184, -1631.7, 688.5, 8.6, 0, 0, 90 )
--local SFPDGate2 = createObject ( 980, -1622.7777099609, 688.29217529297, 8.96089, 0, 0, 0 )

function mv_func ( player )

	if isCop(player) or isFBI(player) or isArmy(player) or vnxGetElementData ( player, "adminlvl" ) >= 3 then
		if getDistanceBetweenPoints3D ( -1634.3143310547, 688.29608154297, 8.9608917236328, getElementPosition ( player ) ) < 17 then
			if SFPDgateMoved == false then
				moveObject ( SFPDGate1, 2700, -1631.7, 688.5, 12.9, 0, 0, 0 )
				--moveObject ( SFPDGate2, 3000, -1612.7661132813, 688.50366210938, 8.9608917236328, 0, 0, 0 )
				SFPDgateMoved = true
			else
				moveObject ( SFPDGate1, 2700, -1631.7, 688.5, 8.6, 0, 0, 0 )
				--moveObject ( SFPDGate2, 3000, -1622.7777099609, 688.29217529297, 8.96089, 0, 0, 0 )
				SFPDgateMoved = false
			end
		end
	end
end
addCommandHandler ( "mv", mv_func )

createObject ( 966, -1572.203063965, 658.837, 6.078, 0, 0, 270 )
createObject ( 966, -1701.4298, 687.596, 23.882, 0, 0, 90 )
local SFPDSchranke1 = createObject ( 968, -1572.1713867188, 658.84716796875, 6.903124332428, 0, 90, 90 )  
local schrankstatus1 = false
local schrankmoving1 = false
local schranke1Col = createColSphere ( -1572.1999511719, 662, 6.1999998092651, 6 )
local schranke1zutimer = nil


local function mv1_func ( player, dim )
	if dim then
		local player = getElementType ( player ) == "player" and player or getElementType ( player ) == "vehicle" and getVehicleController ( player ) or false
		if player and ( isCop(player) or isFBI(player) or isArmy(player) ) then
			if not schrankstatus1 and not schrankmoving1 then
				moveObject ( SFPDSchranke1, 2000, -1572.1713867188, 658.84716796875, 6.903124332428, 0, -90, 0 )
				schrankstatus1 = true
				schrankmoving1 = true
				setTimer ( function () schrankmoving1 = false end, 2000, 1 )
				schranke1zutimer = setTimer ( lassSchranke1AutomatischZuGehen, 5000, 1 )
			elseif isTimer ( schranke1zutimer ) then
				killTimer ( schranke1zutimer )
				schranke1zutimer = setTimer ( lassSchranke1AutomatischZuGehen, 5000, 1 )
			end
		end
	end
end
addEventHandler ( "onColShapeHit", schranke1Col, mv1_func )


local SFPDSchranke2 = createObject ( 968, -1701.4373779297, 687.6, 24.623020172119, 0, 270, 90 )
local schrankstatus2 = false
local schrankmoving2 = false
local schranke2Col = createColSphere ( -1702.4, 683.9, 23.9, 6 )
local schranke2zutimer = nil

local function mv2_func ( player, dim )
	if dim then
		local player = getElementType ( player ) == "player" and player or getElementType ( player ) == "vehicle" and getVehicleController ( player ) or false
		if player and ( isCop(player) or isFBI(player) or isArmy(player) ) then
			if not schrankstatus2 and not schrankmoving2 then
				moveObject ( SFPDSchranke2, 2000, -1701.4373779297, 687.6, 24.623020172119, 0, 90, 0 )
				schrankstatus2 = true
				schrankmoving2 = true
				setTimer ( function () schrankmoving2 = false end, 2000, 1 )
				schranke2zutimer = setTimer ( lassSchranke2AutomatischZuGehen, 5000, 1 )
			elseif isTimer ( schranke2zutimer ) then
				killTimer ( schranke2zutimer )
				schranke2zutimer = setTimer ( lassSchranke2AutomatischZuGehen, 5000, 1 )
			end
		end
	end
end
addEventHandler ( "onColShapeHit", schranke2Col, mv2_func )

function lassSchranke1AutomatischZuGehen ( )
	moveObject ( SFPDSchranke1, 2000, -1572.1713867188, 658.84716796875, 6.903124332428, 0, 90, 0 )
	setTimer ( function () schrankmoving1 = false end, 2000, 1 )
	schrankstatus1 = false
	schrankmoving1 = true
end


function lassSchranke2AutomatischZuGehen ( )
	moveObject ( SFPDSchranke2, 2000, -1701.4373779297, 687.6, 24.623020172119, 0, -90, 0 )
	setTimer ( function () schrankmoving2 = false end, 2000, 1 )
	schrankstatus2 = false
	schrankmoving2 = true
end

SFPDKerker1 = createObject ( 14843, 227.77272033691, 130.39471435547, 1003.4538574219, 0, 0, 90 )
setElementInterior ( SFPDKerker1 , 10 )
SFPDKerker1Moved = false

	
function mv_func ( player )

	if isCop(player) or isFBI(player) or isArmy(player) or vnxGetElementData ( player, "adminlvl" ) >= 3 then
		if getDistanceBetweenPoints3D ( 227.77272033691, 130.39471435547, 1003.4538574219, getElementPosition ( player ) ) < 10 then
			if SFPDKerker1Moved == false then
				moveObject ( SFPDKerker1, 2000, 227.77272033691, 132.4690246582, 1003.4538574219 )
				SFPDKerker1Moved = true
			else
				moveObject ( SFPDKerker1, 2000, 227.77272033691, 130.39471435547, 1003.4538574219 )
				SFPDKerker1Moved = false
			end
		end
	end
end
addCommandHandler ( "mv", mv_func )

SFPDKerker2 = createObject ( 14843, 213.0556640625, 116.5341796875, 999.25439453125, 0, 0, 0 )
setElementInterior ( SFPDKerker2 , 10)
SFPDKerker2Moved = false

function mv_func ( player )

	if isCop(player) or isFBI(player) or isArmy(player) or vnxGetElementData ( player, "adminlvl" ) >= 3 then
		if getDistanceBetweenPoints3D ( 216.57464599609, 116.53038787842, 999.25439453125, getElementPosition ( player ) ) < 10 then
			if SFPDKerker2Moved == false then
				moveObject ( SFPDKerker2, 2000, 210.65234375, 116.55247497559, 999.25439453125 )
				SFPDKerker2Moved = true
			else
				moveObject ( SFPDKerker2, 2000, 213.0556640625, 116.5341796875, 999.25439453125 )
				SFPDKerker2Moved = false
			end
		end
	end
end
addCommandHandler ( "mv", mv_func )