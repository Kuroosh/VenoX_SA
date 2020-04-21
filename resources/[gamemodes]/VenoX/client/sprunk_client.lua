curSprunkShape = 0
local i
sprunkAutomats = {}
 sprunkAutomats["x"] = {}
 sprunkAutomats["y"] = {}
 sprunkAutomats["z"] = {}
 i = 1
 sprunkAutomats["x"][i], sprunkAutomats["y"][i], sprunkAutomats["z"][i] = -1981, 145.65, 27.6875
 i = 2
 sprunkAutomats["x"][i], sprunkAutomats["y"][i], sprunkAutomats["z"][i] = -2420.2631835938, 985.95007324219, 44.946102142334
 i = 3
 sprunkAutomats["x"][i], sprunkAutomats["y"][i], sprunkAutomats["z"][i] = -2420.2907714844, 984.58905029297, 44.946102142334
 i = 4
 sprunkAutomats["x"][i], sprunkAutomats["y"][i], sprunkAutomats["z"][i] = 240.24826049805, 115.30881500244, 1002.867980957
 i = 5
 sprunkAutomats["x"][i], sprunkAutomats["y"][i], sprunkAutomats["z"][i] = -2838.62890625, 2810.0478515625, 68.059410095215
 i = 6
 sprunkAutomats["x"][i], sprunkAutomats["y"][i], sprunkAutomats["z"][i] = -2765.2397460938, 378.81604003906, 6.434627532959
 i = i + 1
 sprunkAutomats["x"][i], sprunkAutomats["y"][i], sprunkAutomats["z"][i] = 2155.8598632813, 1606.6507568359, 999.61877441406
 i = i + 1
 sprunkAutomats["x"][i], sprunkAutomats["y"][i], sprunkAutomats["z"][i] = 2209.9604492188, 1607.1987304688, 999.61846923828
 i = i + 1
 sprunkAutomats["x"][i], sprunkAutomats["y"][i], sprunkAutomats["z"][i] = 2222.2583007813, 1606.9058837891, 999.61938476563
 i = i + 1
 sprunkAutomats["x"][i], sprunkAutomats["y"][i], sprunkAutomats["z"][i] = 1659.4747314453, 1722.9838867188, 10.477336883545
 i = i + 1
 sprunkAutomats["x"][i], sprunkAutomats["y"][i], sprunkAutomats["z"][i] = 2085.7368164063, 2071.4147949219, 10.707124710083
 i = i + 1
 sprunkAutomats["x"][i], sprunkAutomats["y"][i], sprunkAutomats["z"][i] = 2281.0305175781, 2432.3679199219, 10.917348861694
 i = i + 1
 sprunkAutomats["x"][i], sprunkAutomats["y"][i], sprunkAutomats["z"][i] = 2088.2448730469, 1455.8695068359, 10.917348861694
 i = i + 1
 sprunkAutomats["x"][i], sprunkAutomats["y"][i], sprunkAutomats["z"][i] = 2159.3474121094, 946.12158203125, 10.917348861694
 i = i + 1
 sprunkAutomats["x"][i], sprunkAutomats["y"][i], sprunkAutomats["z"][i] = 2173.3696289063, 1603.1229248047, 1005.1578979492
  i = i + 1
 sprunkAutomats["x"][i], sprunkAutomats["y"][i], sprunkAutomats["z"][i] = -2447, 517.1, 30.3

createObject ( 1775, 2281.0305175781, 2432.3679199219, 10.917348861694 )
createObject ( 1775, 2088.2448730469, 1455.8695068359, 10.917348861694, 0, 0, 230 )
createObject ( 1775, 2159.3474121094, 946.12158203125, 10.917348861694, 0, 0, 272 )
createObject ( 1775, -2447, 517.1, 30.3, 0, 0, 90 )
local c = createObject ( 1775, 2173.3696289063, 1603.1229248047, 1005.1578979492, 0, 0, 274 )
setElementInterior ( c, 1 )
-- Cityhall
createObject ( 1775, -2765.2397460938, 378.81604003906, 6.434627532959, 0, 0, 90 )
local x, y, z, shape
local sprunkIDs = {}
for i, index in pairs ( sprunkAutomats["x"] ) do
	x, y, z = sprunkAutomats["x"][i], sprunkAutomats["y"][i], sprunkAutomats["z"][i]
	shape = createColSphere ( x, y, z, 3 )
	sprunkAutomats[i] = shape
	sprunkIDs[shape] = i
	addEventHandler ( "onClientColShapeHit", shape,
		function ( hit, dim )
			if hit == lp then
				if dim then
					curSprunkShape = sprunkIDs[source]
				end
			end
		end
	)
end


local isUsingSprunkAutomat = false

function useSprunkAutomat ()

	if not getPedOccupiedVehicle ( lp ) then
		if curSprunkShape > 0 then
			local x2, y2, z2 = getElementPosition ( lp )
			if not isUsingSprunkAutomat then
				local x1, y1, z1 = getElementPosition ( sprunkAutomats[curSprunkShape] )
				local dist = getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 )
				if dist < 3 then
					if mymoney >= 1 then
						isUsingSprunkAutomat = true
						local snack = sprunkAutomats[curSprunkShape]
						local x1, y1 = getElementPosition ( lp )
						local x2, y2 = getElementPosition ( snack )
						setPedRotation ( lp, findRotation ( x1, y1, x2, y2 ) )
						setPedAnimation(lp,"VENDING","VEND_Use",2500,false,false,false)
						setTimer(setPedAnimation,2500,1,lp,"VENDING","VEND_Use_pt2",-1,false,false,false)
						setTimer(setPedAnimation,3000,1,lp,"VENDING","VEND_Drink_P",-1,false,false,false)
						setTimer ( killAnimation, 3500, 1, lp )
						sprunksound_func()
					end
				end
			end
		end
	end
end
bindKey ( "enter_exit", "down", useSprunkAutomat )

function killAnimation ( player )

	isUsingSprunkAutomat = false
	setPedAnimation ( player )
	setElementHunger ( getElementHunger()+25 )
	triggerServerEvent ( "sprunkAutomatUse", player )
end

function enteringVehicleWhileSprunk ()

	if isUsingSprunkAutomat then
		cancelEvent()
		local x,y,z = getElementPosition ( lp )
		setElementPosition ( lp, x, y, z )
	end
end
addEventHandler ( "onClientVehicleStartEnter", getRootElement(), enteringVehicleWhileSprunk )