katjCount = 0
kS = 1000
katjMoving = 50
local katjuschaArray = {}

function createKatjuscha ( x, y, z, rx, ry, rz )
	katjCount = katjCount + 1
	katjuschaArray[katjCount] = { 	["vehicle"] = createVehicle ( 422, 2481.6918945313, -1660.9809570313, 13.423749923706 ),
									["SAM"] = createObject ( 3267, 2481.6518554688, -1662.2526855469, 12.468755722046+0.2 ),
									["SAM1"] = createObject ( 1239, 2482.3203125, -1660.6856689453, 15.020451545715+0.2 ),
									["SAM2"] = createObject ( 1239, 2482.2885742188, -1660.9114990234, 15.4204454422+0.2 ),
									["SAM3"] = createObject ( 1239, 2480.9584960938, -1660.8966064453, 15.47044467926+0.2 ),
									["SAM4"] = createObject ( 1239, 2480.9384765625, -1660.6474609375, 14.945441246033+0.2 ) }
	vnxSetElementData ( katjuschaArray[katjCount]["vehicle"], "katjuscha", true )
	vnxSetElementData ( katjuschaArray[katjCount]["vehicle"], "fireAble", true )
	vnxSetElementData ( katjuschaArray[katjCount]["vehicle"], "katjuschaID", katjCount )
	for i = 1, 4 do
		setElementAlpha ( katjuschaArray[katjCount]["SAM"..i], 0 )
	end
	
	attachElementsInCorrectWay ( katjuschaArray[katjCount]["SAM"], katjuschaArray[katjCount]["vehicle"] )
	attachElementsInCorrectWay ( katjuschaArray[katjCount]["SAM1"], katjuschaArray[katjCount]["vehicle"] )
	attachElementsInCorrectWay ( katjuschaArray[katjCount]["SAM2"], katjuschaArray[katjCount]["vehicle"] )
	attachElementsInCorrectWay ( katjuschaArray[katjCount]["SAM3"], katjuschaArray[katjCount]["vehicle"] )
	attachElementsInCorrectWay ( katjuschaArray[katjCount]["SAM4"], katjuschaArray[katjCount]["vehicle"] )
	
	setElementPosition ( katjuschaArray[katjCount]["vehicle"], x, y, z )
	setVehicleRotation ( katjuschaArray[katjCount]["vehicle"], rx, ry, rz )
end


function fireKatjuscha ( id, x, y, z )
	local katjuscha = katjuschaArray[id]["vehicle"]
	local player = getVehicleOccupant ( katjuscha, 0 )
	if player and isTerror ( player ) then
		if vnxGetElementData ( katjuscha, "fireAble" ) then
			vnxSetElementData ( katjuscha, "fireAble", false )
			setTimer ( vnxSetElementData, 60*kS, 1, katjuscha, "fireAble", true )
			outputChatBox ( "Salve abgefeuert - naechste Salve in 1 Minute verfügbar!", player, 0, 125, 0 )
			setElementFrozen ( katjuscha, true )
			
			local kx, ky, kz = getElementPosition ( katjuscha )
			soundSphere = createColSphere ( kx, ky, kz, 30 )
			local playersInRange = getElementsWithinColShape ( soundSphere, "player" )
			for i=1, #playersInRange do
				triggerClientEvent ( playersInRange[i], "katjuschasound", playersInRange[i], 12, 400, kx, ky, kz )
			end
			destroyElement ( soundSphere )
			
			fireKatjuschaRocket ( x, y, z, player, katjuscha, id, x2, y2, z2 )
			
			setTimer ( setElementFrozen, 5000, 1, katjuscha, false )
		else
			outputChatBox ( "Du kannst noch nicht wieder feuern!", player, 125, 0, 0 )
		end
	end
end


function fireKatjuschaRocket ( x, y, z, player, veh, id, x2, y2, z2 )
	triggerClientEvent ( "fireKatjuschaRocketClient", getRootElement(), x, y, z, player, veh, id, x2, y2, z2, katjuschaArray[katjCount]["SAM1"], katjuschaArray[katjCount]["SAM2"], katjuschaArray[katjCount]["SAM3"], katjuschaArray[katjCount]["SAM4"] )
end


function katjuscha_func ( p )
	if isTerror ( p ) and vnxGetElementData ( p, "rang" ) >= 4 then
		local x1, y1, z1 = getElementPosition ( p )
		if getDistanceBetweenPoints3D ( x1, y1, z1, -1998.3441162109, -1537.8443603516, 84.67 ) < 20 then
			createKatjuscha ( x1+1, y1+1, z1, 0, 0, 0 )
		end
	end
end
addCommandHandler ( "katjuscha", katjuscha_func )