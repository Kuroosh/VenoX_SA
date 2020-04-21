-- Clientside: carsys/tempomat.lua
function findRotation(x1,y1,x2,y2)
 
	local t = -math.deg(math.atan2(x2-x1,y2-y1))
	if t < 0 then t = t + 360 end;
	return t;
end
blitzer = { 
 ["x1"]={}, 
 ["y1"]={}, 
 ["z1"]={}, 
 ["x2"]={}, 
 ["y2"]={}
 }

local i = 0
i = i + 1
blitzer["x1"][i], blitzer["y1"][i], blitzer["z1"][i] = -2013.5216064453, -13.082443237305, 34.445068359375
blitzer["x2"][i], blitzer["y2"][i] = -2006.4067382813, -12.700618743896
i = i + 1
blitzer["x1"][i], blitzer["y1"][i], blitzer["z1"][i] = -1995.7777099609, 465.98248291016, 34.821102142334
blitzer["x2"][i], blitzer["y2"][i] = -2003.7452392578, 466.14938354492
i = i + 1
blitzer["x1"][i], blitzer["y1"][i], blitzer["z1"][i] = -2012.9271240234, 877.46392822266, 45.094539642334
blitzer["x2"][i], blitzer["y2"][i] = -2003.8637695313, 877.74536132813
i = i + 1
blitzer["x1"][i], blitzer["y1"][i], blitzer["z1"][i] = -1550.8793945313, 593.17877197266, 6.8367257118225
blitzer["x2"][i], blitzer["y2"][i] = -1559.515625, 593.39599609375
i = i + 1
blitzer["x1"][i], blitzer["y1"][i], blitzer["z1"][i] = -1791.4112548828, -590.40228271484, 16.077056884766
blitzer["x2"][i], blitzer["y2"][i] = -1791.5382080078, -579.81536865234
i = i + 1
blitzer["x1"][i], blitzer["y1"][i], blitzer["z1"][i] = -2859.4008789063, 415.58126831055, 4.1492257118225
blitzer["x2"][i], blitzer["y2"][i] = -2853.2426757813, 415.76467895508
i = i + 1
blitzer["x1"][i], blitzer["y1"][i], blitzer["z1"][i] = -2696.8813476563, 1715.0677490234, 67.798553466797
blitzer["x2"][i], blitzer["y2"][i] = -2689.2900390625, 1714.8492431641
i = i + 1
blitzer["x1"][i], blitzer["y1"][i], blitzer["z1"][i] = -2665.8942871094, 1714.1595458984, 67.787239074707
blitzer["x2"][i], blitzer["y2"][i] = -2674.0373535156, 1714.3308105469
i = i + 1
blitzer["x1"][i], blitzer["y1"][i], blitzer["z1"][i] = -2175.5458984375, 1341.4688720703, 6.8367257118225
blitzer["x2"][i], blitzer["y2"][i] = -2175.2990722656, 1332.1190185547
i = i + 1
blitzer["x1"][i], blitzer["y1"][i], blitzer["z1"][i] = -1661.8132324219, -1642.5202636719, 36.109039306641
blitzer["x2"][i], blitzer["y2"][i] = -1664.3250732422, -1636.5543212891

activeBlitzerPositions = {}

for i = 1, 10 do
	activeBlitzerPositions[i] = false
end

function createBlitzer ()

	local pos = math.random ( 1, 10 )
	if not activeBlitzerPositions[pos] then
		activeBlitzerPositions[pos] = true
		local x1, y1, z1 = blitzer["x1"][pos], blitzer["y1"][pos], blitzer["z1"][pos]
		local x2, y2 = blitzer["x2"][pos], blitzer["y2"][pos]
		local rz = findRotation ( x1, y1, x2, y2 )
		
		blitzerObjectA = createObject ( 1208, x1, y1, z1 + 15.474786758423-14.798044204712, 0, 0, rz )
		blitzerObjectB = createObject ( 1323, x1, y1, z1 + 0.09, 0, 180, rz + 180 )
		
		blitzerSphere = createColSphere ( x2, y2, z1, 10 )
		addEventHandler ( "onColShapeHit", blitzerSphere,
			function ( hit, dim )
				if hit and dim then
					if getElementType ( hit ) == "vehicle" then
						local driver = getVehicleOccupant ( hit, 0 )
						if not isOnStateDuty ( driver ) and getElementModel ( hit ) ~= 438 then
							if not isMedic ( driver ) then
								local player = driver
								local vx, vy, vz = getElementVelocity ( hit )
								local speed = math.sqrt ( vx ^ 2 + vy ^ 2 + vz ^ 2 )		
								if speed > 100 * 0.00464 then
									local kmhToMuch = ( speed - 100 * 0.00464 ) / 0.00464
									triggerClientEvent ( driver, "blitzer", driver )
									
									local strafe = math.abs ( math.floor ( kmhToMuch ^ ( 1.15 ) * 1 ) )
									local points = math.abs ( math.floor ( kmhToMuch / 20 ) )
									
									if points > 5 then
										points = 5
									end
									
									vnxSetElementData ( player, "bankmoney", vnxGetElementData ( driver, "bankmoney" ) - strafe )
									
									triggerClientEvent ( player, "createNewStatementEntry", player, "Strafzahlung\n", strafe*-1, math.abs ( math.floor ( kmhToMuch ) ).." km/h zu\nschnell gefahren" )
									
									vnxSetElementData ( player, "stvo_punkte", points + vnxGetElementData ( player, "stvo_punkte" ) )
									
									setTimer (
										function ( player, kmh, tomuch, strafe, points )
											if isElement ( player ) then
												triggerClientEvent ( player, "showBlitzerGUI", player, kmh, tomuch, strafe, points )
											end
										end,
									1000, 1, player, math.abs ( math.floor ( kmhToMuch ) ) + 100, math.abs ( math.floor ( kmhToMuch ) ), strafe, points )
									outputChatBox ( "Das war bereits dein "..vnxGetElementData(player, "stvo_punkte")..". Punkt - Bei 15 wird dir dein Fuehrerschein beim naechsten Einloggen entzogen!", player, 255, 255, 0 )
									factionDepotData["money"][1] = factionDepotData["money"][1] + strafe
								end
							end
						end
					end
				end
			end
		)
	else
		for i = 1, 10 do
			if not activeBlitzerPositions[i] then
				createBlitzer ()
				break
			end
		end
	end
end
createBlitzer ()