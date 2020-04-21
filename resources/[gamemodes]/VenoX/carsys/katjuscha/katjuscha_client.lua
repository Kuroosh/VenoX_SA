katjMoving = 50
local katjuschaArray = { }


function katjuschaClientStartFire ( x, y, z, player, veh, id, x2, y2, z2, SAM1, SAM2, SAM3, SAM4 )
	-- DEBUG --
	setTimer ( fireKatjuschaRocketClient_func, 400, 1, player, veh, id, 1, x, y, z, SAM1 )
	setTimer ( fireKatjuschaRocketClient_func, 800, 1, player, veh, id, 2, x, y, z, SAM2 )
	setTimer ( fireKatjuschaRocketClient_func, 1200, 1, player, veh, id, 3, x, y, z, SAM3 )
	setTimer ( fireKatjuschaRocketClient_func, 1600, 1, player, veh, id, 4, x, y, z, SAM4 )
	setTimer ( fireKatjuschaRocketClient_func, 2400, 1, player, veh, id, 5, x, y, z, SAM1 )
	setTimer ( fireKatjuschaRocketClient_func, 2800, 1, player, veh, id, 6, x, y, z, SAM2 )
	setTimer ( fireKatjuschaRocketClient_func, 3200, 1, player, veh, id, 7, x, y, z, SAM3 )
	setTimer ( fireKatjuschaRocketClient_func, 3600, 1, player, veh, id, 8, x, y, z, SAM4 )
end
addEvent ( "fireKatjuschaRocketClient", true )
addEventHandler ( "fireKatjuschaRocketClient", getRootElement(), katjuschaClientStartFire )


function fireKatjuschaRocketClient_func ( player, veh, id, rID, x2, y2, z2, SAM )
	if not katjuschaArray[id] then
		katjuschaArray[id] = {}
	end
	katjuschaArray[id][rID] = { 
		["Rocket"] = createObject ( 3790, 2485.1535644531, -1663.7504882813, 12.540796279907 ),
		["Marker"] = createMarker ( 2486.3100585938, -1663.8648681641, 12.621975898743, "corona", 2, 255, 255, 255, 255 ) }
	setElementParent ( katjuschaArray[id][rID]["Marker"], katjuschaArray[id][rID]["Rocket"] )
	attachElementsInCorrectWay ( katjuschaArray[id][rID]["Marker"], katjuschaArray[id][rID]["Rocket"] )
	local x1, y1, z1 = getElementPosition ( SAM )
	local rX, rY, rZ = getElementRotation ( veh )
	setElementPosition ( katjuschaArray[id][rID]["Rocket"], x1, y1, z1 )
	setElementRotation ( katjuschaArray[id][rID]["Rocket"], 180, 30+rY-180, rZ+90 )
	local x3, y3 = getHalfWayBetweenPoints3D ( x1, y1, x2, y2 )
	local addHight = getDistanceBetweenPoints2D ( x1, y1, x2, y2 ) / 2
	local movingTime = math.floor ( addHight )*katjMoving
	moveObject ( katjuschaArray[id][rID]["Rocket"], movingTime,  x3, y3, z2 + addHight, 0, -30 --[[, -1*(rZ+90)+findRotation ( x2, y2, x1, y1 ) / 2]] )
	setTimer ( moveObject, movingTime, 1, katjuschaArray[id][rID]["Rocket"], movingTime, x2+math.random(-7,7), y2+math.random(-7,7), z2, 0, -30--[[, findRotation ( x2, y2, x1, y1 ) / 2]] )
	setTimer ( katjuschaExplode, movingTime*2, 1, id, rID, player )
end


function katjuschaExplode ( id, rID, player )
	local x, y, z = getElementPosition ( katjuschaArray[id][rID]["Rocket"] )
	destroyElement ( katjuschaArray[id][rID]["Rocket"] )
	if not isElement ( player ) then player = nil end
	createExplosion ( x, y, z, 10 )
	createExplosion ( x, y, z, 1 )
	createExplosion ( x, y, z, 0 )
end


function getHalfWayBetweenPoints3D ( x1, y1, x2, y2 )
	local x = x2 + ( x1 - x2 ) / 2
	local y = y2 + ( y1 - y2 ) / 2
	return x, y
end