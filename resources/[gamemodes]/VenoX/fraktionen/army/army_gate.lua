-- Army-Tore Area51

local hGate1 = createObject( 2909, 131.10000610352, 1941.3000488281, 22, 0, 0, 89.895629882813 )
local hGate2 = createObject( 2909, 131.10000610352, 1941.3000488281, 19.60000038147, 180, 0, 89.895629882813 )
local hGate3 = createObject( 2909, 139, 1941.3000488281, 22, 0, 0, 89.895629882813 )
local hGate4 = createObject( 2909, 139, 1941.3000488281, 19.60000038147, 180, 0, 89.895629882813 )
local hGateState = false
	setObjectScale ( hGate1, 0.95 )
	setObjectScale ( hGate2, 0.95 )
	setObjectScale ( hGate3, 0.95 )
	setObjectScale ( hGate4, 0.95 )

local bGate1 = createObject( 2929, 215.9, 1875.5, 13.9, 0, 0, 0)
local bGate2 = createObject( 2927, 211.8, 1875.5, 13.9, 0, 0, 0)
local bGateState = false

local nGate = createObject( 988, 75.300003051758, 1918.5999755859, 17.60000038147, 0, 0, 274 )
	setElementDoubleSided ( nGate, true )
	setObjectScale ( nGate, 1.1 )
local nGateState = false

----------------------------------------------------

local area51_hangar11 = createObject( 16775, 286.5498046875, 1953.8681640625, 19.04842376709, 0, 0, 270 )
local area51_hangar12 = createObject( 16775, 286.5322265625, 1958.802734375, 19.04842376709, 0, 0, 270 )
local area51_hangar1_state = "zu"

local area51_hangar21 = createObject( 16775, 286.5498046875, 1987.6591796875, 19.04842376709, 0, 0, 270 )
local area51_hangar22 = createObject( 16775, 286.5322265625, 1992.5458984375, 19.04842376709, 0, 0, 270 )
local area51_hangar2_state = "zu"

local area51_hangar31 = createObject( 16775, 286.5498046875, 2021.87109375, 19.04842376709, 0, 0, 270 )
local area51_hangar32 = createObject( 16775, 286.5322265625, 2026.6669921875, 19.04842376709, 0, 0, 270 )
local area51_hangar3_state = "zu"

local hangarGate1 = createObject( 16773, 128.2, 1815.5999755859, 18.4, 0, 0, 0)
local hangarGate2 = createObject( 16773, 118.6, 1815.5999755859, 18.4, 0, 0, 0)
local hangarState = false
local hangarMoving = false

----------------
-- Army Tore SF
-- sfarmygate2 = createObject(985, -1522.759765625,481.740234375,6.8699998855591,0,0,356.7919921875)
-- sfarmygate1 = createObject(986, -1530.7001953125,482.2998046875,6.8699998855591,0,0,355.24291992188)
-- sfarmygatestate = true
----------------

-----------------------

function mv_func ( player )

	local x, y, z = getElementPosition ( player )
	
	if isOnDuty(player) or vnxGetElementData ( player, "adminlvl" ) >= 3 then
	
		if getDistanceBetweenPoints3D ( x, y, z, 286.5498046875, 1953.8681640625, 19.04842376709 ) <= 15 then -- Halle1
		
			if ( area51_hangar1_state == "zu" ) then 
		
				moveObject( area51_hangar11, 2500, 286.5498046875, 1953.8681640625, 10.04842376709 )
				moveObject( area51_hangar12, 2500, 286.5322265625, 1958.802734375, 10.04842376709 )
				area51_hangar1_state = "auf"
				return
			
			else
			
				moveObject( area51_hangar11, 2500, 286.5498046875, 1953.8681640625, 19.04842376709 )
				moveObject( area51_hangar12, 2500, 286.5322265625, 1958.802734375, 19.04842376709 )
				area51_hangar1_state = "zu"
				return
			
			end
			
		elseif getDistanceBetweenPoints3D ( x, y, z, 286.5498046875, 1987.6591796875, 19.04842376709 ) <= 15 then -- Halle2
		
			if ( area51_hangar2_state == "zu" ) then 
		
				moveObject( area51_hangar21, 2500, 286.5498046875, 1987.6591796875, 10.04842376709 )
				moveObject( area51_hangar22, 2500, 286.5322265625, 1992.5458984375, 10.04842376709 )
				area51_hangar2_state = "auf"
				return
			
			else
			
				moveObject( area51_hangar21, 2500, 286.5498046875, 1987.6591796875, 19.04842376709 )
				moveObject( area51_hangar22, 2500, 286.5322265625, 1992.5458984375, 19.04842376709 )
				area51_hangar2_state = "zu"
				return
			end
				
		elseif getDistanceBetweenPoints3D ( x, y, z, 286.5498046875, 2021.87109375, 19.04842376709 ) <= 15 then -- Halle3
		
			if ( area51_hangar3_state == "zu" ) then 
		
				moveObject( area51_hangar31, 2500, 286.5498046875, 2021.87109375, 10.04842376709 )
				moveObject( area51_hangar32, 2500, 286.5322265625, 2026.6669921875, 10.04842376709 )
				area51_hangar3_state = "auf"
				return
			
			else
			
				moveObject( area51_hangar31, 2500, 286.5498046875, 2021.87109375, 19.04842376709 )
				moveObject( area51_hangar32, 2500, 286.5322265625, 2026.6669921875, 19.04842376709 )
				area51_hangar3_state = "zu"
				return
			
			end
			
		end
		
	end
	
end

addCommandHandler ( "mv", mv_func )

----------------

-- SF Army Base /mv

----------------

-- Army Tore SF --
sfarmygate1 = createObject(986, -1530.7001953125,482.2998046875,6.8699998855591,0,0,355.24291992188)
sfarmygate2 = createObject(985, -1522.759765625,481.740234375,6.8699998855591,0,0,356.7919921875)
sfarmygatestate1 = false


function sfarmybase_func1(player)

	tx,ty,tz = getElementPosition(sfarmygate1)
	tx,ty,tz = getElementPosition(sfarmygate2)
	px, py, pz = getElementPosition(player)
	
	local dis = getDistanceBetweenPoints3D ( tx, ty, tz, px, py, pz )
	if isArmy ( player ) or isOnDuty(player) or vnxGetElementData ( player, "adminlvl" ) >= 3 then 
		if (dis <= 20) then
			if (sfarmygatestate1 == false) then
				moveObject( sfarmygate1, 2500, -1530.7001953125, 482.2998046875, 6.8699998855591)
				moveObject( sfarmygate2, 2500, -1522.759765625, 481.740234375, 6.8699998855591)  
				sfarmygatestate1 = true
			else
				moveObject( sfarmygate1, 2500, -1538.6999511719, 482.70001220703, 6.8699998855591)
				moveObject( sfarmygate2, 2500, -1514.9000244141, 481.5, 6.8699998855591)
				sfarmygatestate1 = false
			end
		end
	end
	
end

addCommandHandler("mv", sfarmybase_func1)
-------------

-- Army Schranke SF --
local ArmySchranke1 = createObject ( 968, -1548.5, 521.6, 6.9, 0, 270, 84.1 )  
local schrankstatus1 = false
local schrankmoving1 = false
local schranke1Col = createColSphere ( -1548.5, 521.6, 6.9, 8 )
local schranke1zutimer = nil

local function mv1_func ( player, dim )
	if dim then
		local player = getElementType ( player ) == "player" and player or getElementType ( player ) == "vehicle" and getVehicleController ( player ) or false
		if player and ( isCop(player) or isFBI(player) or isArmy(player) ) then
			if not schrankstatus1 and not schrankmoving1 then
				moveObject ( ArmySchranke1, 2000, -1548.5, 521.6, 6.9, 0, 84, 0 )
				schrankstatus1 = true
				schrankmoving1 = true
				setTimer ( function () schrankmoving1 = false end, 2000, 1 )
				schranke1zutimer = setTimer ( lassSchranke10AutomatischZuGehen, 5000, 1 )
			elseif isTimer ( schranke1zutimer ) then
				killTimer ( schranke1zutimer )
				schrankstatus1 = false
				schranke1zutimer = setTimer ( lassSchranke10AutomatischZuGehen, 5000, 1 )
			end
		end
	end
end
addEventHandler ( "onColShapeHit", schranke1Col, mv1_func )



local ArmySchranke2 = createObject ( 968, -1549.7, 508.4, 6.9, 0, 90, 83.6 )
local schrankstatus2 = false
local schrankmoving2 = false
local schranke2Col = createColSphere ( -1549.7, 508.4, 6.9, 8 )
local schranke2zutimer = nil

local function mv2_func ( player, dim )
	if dim then
		local player = getElementType ( player ) == "player" and player or getElementType ( player ) == "vehicle" and getVehicleController ( player ) or false
		if player and ( isCop(player) or isFBI(player) or isArmy(player) ) then
			if not schrankstatus2 and not schrankmoving2 then
				moveObject ( ArmySchranke2, 2000, -1549.7, 508.4, 6.9, 0, -84, 0 )
				schrankstatus2 = true
				schrankmoving2 = true
				setTimer ( function () schrankmoving2 = false end, 2000, 1 )
				schranke2zutimer = setTimer ( lassSchranke20AutomatischZuGehen, 5000, 1 )
			elseif isTimer ( schranke2zutimer ) then
				killTimer ( schranke2zutimer )
				schranke2zutimer = setTimer ( lassSchranke20AutomatischZuGehen, 5000, 1 )
			end
		end
	end
end
addEventHandler ( "onColShapeHit", schranke2Col, mv2_func )


function lassSchranke10AutomatischZuGehen ( )
	moveObject ( ArmySchranke1, 2000, -1548.5, 521.6, 6.9, 0, -84, 0 )
	setTimer ( function () schrankmoving1 = false end, 2000, 1 )
	schrankstatus1 = false
	schrankmoving1 = true
end



function lassSchranke20AutomatischZuGehen ( )
	moveObject ( ArmySchranke2, 2000, -1549.7, 508.4, 6.9, 0, 84, 0 )
	setTimer ( function () schrankmoving2 = false end, 2000, 1 )
	schrankstatus2 = false
	schrankmoving2 = true
end

-------------




function moveArmyGate( player )
local x, y, z = getElementPosition( player )
	if isArmy ( player ) or isOnDuty(player) or vnxGetElementData ( player, "adminlvl" ) >= 3 then 
		if getDistanceBetweenPoints3D ( x, y, z, 139, 1941.3000488281, 20.700000762939 ) <= 15 or getDistanceBetweenPoints3D ( x, y, z, 131.10000610352, 1941.3000488281, 20.700000762939 ) <= 15 then
			if hGateState == false then
				moveObject( hGate1, 4000, 124.19999694824, 1941.3000488281, 22 )
				moveObject( hGate2, 4000, 124.19999694824, 1941.3000488281, 19.60000038147 )
				moveObject( hGate3, 4000, 146.39999389648, 1941.3000488281, 22 )
				moveObject( hGate4, 4000, 146.39999389648, 1941.3000488281, 19.60000038147 )
				hGateState = true
			elseif hGateState == true then
				moveObject( hGate1, 4000, 131.10000610352, 1941.3000488281, 22 )
				moveObject( hGate2, 4000, 131.10000610352, 1941.3000488281, 19.60000038147 )
				moveObject( hGate3, 4000, 139, 1941.3000488281, 22 )
				moveObject( hGate4, 4000, 139, 1941.3000488281, 19.60000038147 )
				hGateState = false
			end
		elseif getDistanceBetweenPoints3D( x, y, z, 75.300003051758, 1918.5999755859, 17.60000038147 ) <= 15 then
			if nGateState == false then
				moveObject( nGate, 1500, 75.7, 1912.8000488281, 17.60000038147 )	
				nGateState = true
			elseif nGateState == true then
				moveObject( nGate, 1500, 75.300003051758, 1918.5999755859, 17.60000038147 )
				nGateState = false
			end
		elseif getDistanceBetweenPoints3D( x, y, z, 212.9, 1875.5, 13.9 ) <= 15 then
			if bGateState == false then
				moveObject( bGate1, 4000, 219.8, 1875.5, 13.9 )
				moveObject( bGate2, 4000, 208, 1875.5, 13.9 )	
				bGateState = true
			elseif bGateState == true then
				moveObject( bGate1, 4000, 215.9, 1875.5, 13.9 )
				moveObject( bGate2, 4000, 211.8, 1875.5, 13.9 )
				bGateState = false
			end
		end
	end
end
addCommandHandler("mv", moveArmyGate)


function moveHangarGate( player )
	local x, y, z = getElementPosition( player )
	if isArmy ( player ) and getPlayerRank ( player ) >= 4 then
		if getDistanceBetweenPoints3D( x, y, z, 123.4, 1815.5999755859, 18.4) <= 15 then
			if hangarState == false then
				moveObject( hangarGate1, 5000, 128.2, 1815.5999755859, 10 )
				moveObject( hangarGate2, 5000, 118.6, 1815.5999755859, 10 )
				hangarState = true
			elseif hangarState == true then
				moveObject( hangarGate1, 5000, 128.2, 1815.5999755859, 18.4 )
				moveObject( hangarGate2, 5000, 118.6, 1815.5999755859, 18.4 )
				hangarState = false
			end
		end
	end
end
addCommandHandler("mv", moveHangarGate)



-- Army Gate Boote --
Armygate443 = createObject ( 3113, -1465.8, 501.3, 1.1, 0, 0, 0 )
local ArmyGateMoved = false
function mv_func_army ( player )

	if isArmy ( player ) or isOnDuty(player) or vnxGetElementData ( player, "adminlvl" ) >= 3 then 
		if getDistanceBetweenPoints3D ( -1465.8, 501.3, 1.1, getElementPosition ( player ) ) < 50 then
			if ArmyGateMoved == false then
				moveObject ( Armygate443, 3000, -1468.7, 501.3, 11.9, 0, 0, 0 )
				ArmyGateMoved = true
			else
				moveObject ( Armygate443, 3000, -1465.8, 501.3, 1.1, 0, 0, 0 )
				ArmyGateMoved = false
			end
		end
	end
end
addCommandHandler ( "mv", mv_func_army )



-- Army Lift FL Große Platte --
Armygate441 = createObject ( 3115, -1456.7, 501.3, 9.9, 0, 0, 0 )
local ArmyGateMoved2 = false
function mv_func_army2 ( player )

	if isArmy (player) or vnxGetElementData ( player, "adminlvl" ) >= 6 then
		if getDistanceBetweenPoints3D ( -1456.7, 501.3, 1.7, getElementPosition ( player ) ) < 50 then
			if ArmyGateMoved2 == false then
				moveObject ( Armygate441, 2000, -1456.7, 501.3, 9.9, 0, 0, 0 )
				ArmyGateMoved2 = true
			else
				moveObject ( Armygate441, 2000, -1456.7, 501.3, 16.9, 0, 0, 0 )
				ArmyGateMoved2 = false
			end
		end
	end
end
addCommandHandler ( "alift1", mv_func_army2 )



-- Army Lift FL Lange Platte --
Armygate444 = createObject ( 3114, -1414.45, 516.45, 9.6, 0, 0, 0 )
local ArmyGateMoved3 = false
function mv_func_army3 ( player )

	if isArmy (player) or vnxGetElementData ( player, "adminlvl" ) >= 6 then
		if getDistanceBetweenPoints3D ( -1414.45, 516.45, 1.6, getElementPosition ( player ) ) < 50 then
			if ArmyGateMoved3 == false then
				moveObject ( Armygate444, 2000, -1414.45, 516.45, 9.6, 0, 0, 0 )
				ArmyGateMoved3 = true
			else
				moveObject ( Armygate444, 2000, -1414.45, 516.45, 16.7, 0, 0, 0 )
				ArmyGateMoved3 = false
			end
		end
	end
end
addCommandHandler ( "alift2", mv_func_army3 )



-- Army Lift Hunter Platte --
Armygate445 = createObject ( 3115, -1575.1, 309.1, 6.0, 0, 0, 180 )
local ArmyGateMoved4 = false
function mv_func_army4 ( player )

	if isArmy (player) or vnxGetElementData ( player, "adminlvl" ) >= 6 then
		if getDistanceBetweenPoints3D ( -1575.1, 309.1, 6.0, getElementPosition ( player ) ) < 100 then
			if ArmyGateMoved4 == false then
				moveObject ( Armygate445, 6000, -1575.1, 309.1, 6.0, 0, 0, 0 )
				ArmyGateMoved4 = true
			else
				moveObject ( Armygate445, 6000, -1575.1, 309.1, 53.1, 0, 0, 0 )
				ArmyGateMoved4 = false
			end
		end
	end
end
addCommandHandler ( "alift3", mv_func_army4 )