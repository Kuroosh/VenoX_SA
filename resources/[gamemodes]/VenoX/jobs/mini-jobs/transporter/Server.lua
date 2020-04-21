rRoot = getResourceRootElement(getThisResource())
---

function onMTstart()
	--outputDebugString("[Missions]Transporter By Al3grab | Started")
	--
	setUpMarkers()
	--

	--
	MISSION_TIME = MISSION_TIME_MIN * 60 * 1000
	--tFlood = {}
	--
end
addEventHandler("onResourceStart",rRoot,onMTstart)

function requestDx()
	if ( DXTEXT == true and DXTEXT_MAX_DISTINANCE and transPosz and type(transPosz) == "table" ) then
		triggerClientEvent(source,"startDxDrawing",source,transPosz,DXTEXT_MAX_DISTINANCE)
	end
end
addEvent("requestDx",true)
addEventHandler("requestDx",root,requestDx)

function setUpMarkers()
		transMarkers = {}
	if ( transPosz and type(transPosz) == "table" ) then
		for k,v in ipairs ( transPosz ) do
			x,y,z = v[1],v[2],v[3]
			--createBlip(x,y,z,42,1,255,255,0,255)
			if ( x and y and z )  then
				transMarkers[k] = createMarker(x,y,z,MARKER_TYPE,MARKER_SIZE,255,255,0,100)
				if ( transMarkers[k] ) then
					
						function onHit(hitter)
							if ( hitter and getElementType(hitter) == "player" ) then
							--if not tFlood[hitter] == true then
								if not missionOn then
									showTransWin(hitter)
								else
									outputChatBox("** #00FF00Job ist derzeit #FF0000Nicht#00FF00 verfuegbar, versuche es spaeter noch einmal.",hitter,255,0,0,true)
								end
							--else
							--		outputChatBox("** #FFFF00Du kannst diesen Job nicht machen, versuche es spaeter erneut.",hitter,255,0,0,true)
							--end
							end
						end 
						addEventHandler("onMarkerHit",transMarkers[k],onHit)
				end
			end
		end
	end
		--outputChatBox("** #00FF00Transporter Mission is available now !",root,255,0,0,true)
		missionOn = false
end

function showTransWin(plr) -- showing the transporter window
	if plr then
		triggerClientEvent(plr,"showTransWin",plr)
	end
end

function startTransporterMission(plr) -- starting new transporter mission
	if plr then
		missionOn = true
		
		--outputChatBox("** #00FF00Transporter Mission is #FF0000NOT#00FF00 available now !",root,255,0,0,true)
		--
		easytextout(plr,05551, "Mini-Job gestartet!", 5 * 1000, 0.5, 0.7, 0, 255, 0, 255,2)
		--
		fadeCamera(plr,false)
		setTimer(function() fadeCamera(plr,true,2)
			x,y,z = getElementPosition(plr)
			firstX,firstY,firstZ = x,y,z
				--transVeh = createVehicle(TRANSPORTER_CAR_MODEL,x-10,y,z+1)
				transVeh = createVehicle(TRANSPORTER_CAR_MODEL,-1823.169,-16.048,14.8)
				transPed = createPed(TRANSPORTER_PED_MODEL,x,y,z)
				if transVeh and transPed then
					warpPedIntoVehicle(transPed,transVeh,3)
					setTimer(function()
							easytextout(plr,05551, "Ab ins Auto!", 1000 * 1000, 0.5, 0.7, 0, 255, 0, 255,2)
								vx,vy,vz = getElementPosition(transVeh)
									if vx and vy and vz then
										vehArrow = createMarker(vx,vy,vz+2,"arrow",1,255,255,0)
											if vehArrow then
												function onVehEnter(enterer,seat)
													if enterer ~= plr then
														cancelEvent()
													elseif ( enterer == plr and seat == 0 ) then
														--
														removeEventHandler("onVehicleEnter",root,onVehEnter)
														--
														if isElement(vehArrow) then
															destroyElement(vehArrow)
														end
													--
													randomDrop = math.random(#dropPosz)
														if randomDrop then
															dropX,dropY,dropZ = dropPosz[randomDrop][1],dropPosz[randomDrop][2],dropPosz[randomDrop][3]
															x,y,z = getElementPosition(plr)
															theTransporterPrize = math.floor ( getDistanceBetweenPoints3D(x,y,z,dropX,dropY,dropZ) / 2 )
															dropMarker = createMarker(dropX,dropY,dropZ,DROP_MARKER_TYPE,DROP_MARKER_SIZE,255,255,0,100,plr)
															dropBlip = createBlip(dropX,dropY,dropZ,24,5,255,255,0,255,1,900000,plr)
															function onDrop(hitter	)
																if ( hitter == plr and getPedOccupiedVehicle(hitter) == transVeh ) then
																	removeEventHandler("onMarkerHit",dropMarker,onDrop) 
																	missionDone(hitter,true)
																end
															end 
															addEventHandler("onMarkerHit",dropMarker,onDrop) 
															
														end
													--
													easytextout(plr,05551, "Fahre zu dem D auf dem Minimap!", 5 * 1000, 0.5, 0.8, 0, 255, 0, 255,2)
													startMissionTime(plr)
													sortCheckShit(plr,transVeh,transPed)
										--			triggerServerEvent("TstartMissionTimer",lp, MISSION_TIME, true, "%m:%s:%cs", 0.5, 0.7,true,"default-bold",1,255,255,255)
													end
											end 
											addEventHandler("onVehicleEnter",root,onVehEnter)
											end
										end
									end , 3 * 1000 ,1)
								end
							end,2500,1)
							destroyAllMarkers ()

	
	end
end
addEvent("startTransporterMission",true)
addEventHandler("startTransporterMission",root,startTransporterMission)

function easytextout(plr,id,msg,time,x,y,c1,c2,c3,c4,size) -- output in easytext resource
	exports.easytext:displayMessageForPlayer(plr,id,msg,time,x,y,c1,c2,c3,c4,size)
end

function destroyAllMarkers () -- to clean all markers
	if transMarkers and type(transMarkers) then
		for k,v in ipairs ( transMarkers ) do
			removeEventHandler("onMarkerHit",v,onHit)
			destroyElement(v)
		end
	end
end

function missionDone(Player,Won) -- on mission finish ( player = the player | Won = did he finished it successfuly or not )
if Player then
	stopMissionTime(Player)
	killCheckShit(Player)
	if isElement(dropMarker) then
		destroyElement(dropMarker)
	end
	if isElement(dropBlip) then
		destroyElement(dropBlip)
	end
	if isElement(vehArrow) then
		destroyElement(vehArrow)
	end
	if isElement(transPed) then
		destroyElement(transPed)
	end
	if isElement(transVeh) then
		destroyElement(transVeh)
	end
	--
	if Won == true then -- If he won the mission
		triggerClientEvent(Player,"missionDone",true)
		--
		prize = tonumber(theTransporterPrize) or 500
		vnxSetElementData ( Player, "money", vnxGetElementData ( Player, "money" ) + prize )
		easytextout(Player,05551, "Job abgeschlossen! , Verdienst: "..tonumber(theTransporterPrize).." $", 8 * 1000, 0.5, 0.7, 0, 255, 0, 255,2)
		--outputChatBox("#FFFF00**#00FFFF "..getPlayerName(Player).." #FFFF00 Has Done the Transporter misssion and earned "..tonumber(theTransporterPrize).." $",root,0,255,255,true)
		--
		triggerClientEvent(Player,"missionDone",Player,true)
	else
		triggerClientEvent(Player,"missionDone",Player,false)
		easytextout(Player,05551, "Job nicht abgeschlossen! ", 8 * 1000, 0.5, 0.7, 255, 0, 0, 255,2)
	end
	fadeCamera(Player,false)
		setTimer(function() 
		if firstX and firstY and firstZ then
			--setElementPosition(Player,firstX - 10 , firstY , firstZ)
			setElementPosition(Player,-1843.742,-16.6817,15.0)
			firstX , firstY , firstZ = nil,nil,nil
		end
			fadeCamera(Player,true,2)
		end , 8 * 1000 , 1 )
	setUpMarkers()
	--startFloodTimer(Player)
	--
end
end

--[[function startFloodTimer(plr) -- to start anti-flood timer ..
	if plr then
		tFlood[plr] = true
			setTimer ( function (plr)
				tFlood[plr] = false
			end , tonumber(FLOOD_TIME) * 60 * 1000 , 1 , plr )
	end
end

addEventHandler("onPlayerQuit",root,function()
	tFlood[source] = nil
end )
addEventHandler("onPlayerJoin",root,function()
	tFlood[source] = nil
end )]]

function startMissionTime(Player) -- to start mission timer ..
	if Player then
		TimerDisplay = textCreateDisplay()
		theTime = MISSION_TIME
		m,s,cs = msToTimeStr(theTime)
		fullTime = m..":"..s
		TimerText = textCreateTextItem ( "Time Left : "..tostring(fullTime).."", 0.39, 0.7 ,"medium",0,255,0,255,2.0,"left","center",255)
		textDisplayAddText ( TimerDisplay, TimerText )
		textDisplayAddObserver ( TimerDisplay, Player )
		sortTimerShit(Player,TimerText,theTime)
	end
end

--Robbed from missiontimer resource , and it was robbed from arc_ :p
function msToTimeStr(ms)
	if not ms then
		return ''
	end
	
	if ms < 0 then
		return "0","00","00"
	end
	
	local centiseconds = tostring(math.floor(math.fmod(ms, 1000)/10))
	if #centiseconds == 1 then
		centiseconds = '0' .. centiseconds
	end
	local s = math.floor(ms / 1000)
	local seconds = tostring(math.fmod(s, 60))
	if #seconds == 1 then
		seconds = '0' .. seconds
	end
	local minutes = tostring(math.floor(s / 60))
	
	return minutes, seconds, centiseconds
end

function sortTimerShit(plr,timer,time) -- to sort timer's shit ..
	if timer and time then
			if isTimer(timerShitTimer) then
		killTimer(timerShitTimer)
	end
		timerShitTimer = setTimer(function(plr)
				time = time - 70
				m,s,cs = msToTimeStr(time)
				fullTime = m..":"..s
				textItemSetText(timer,"Time Left : "..tostring(fullTime).."")
				if ( tonumber(m) <= 0 and tonumber(s) <= 0 and tonumber(cs) <= 0 ) then
					onTimerFinish(plr,timer)
				end
		end , 50 , 0 ,plr )
	end
end

function stopMissionTime(Player)
	textDestroyDisplay(TimerDisplay)
	if TimerText then
	textDestroyTextItem(TimerText)
	end
	if isTimer(timerShitTimer) then
		killTimer(timerShitTimer)
	end
end

function onTimerFinish(Player) -- on timer end
	stopMissionTime(Player)
	missionDone(Player,false)
end

function sortCheckShit(player,car,ped) -- for check the health of ped & car
	if car and ped then
		checkShitTimer = setTimer ( function (player,car,ped)
			if car and ped then
				carH = math.floor(getElementHealth(car)/10)
				pedH = math.floor(getElementHealth(ped))
					if ( carH and pedH ) then
						if ( carH < 30 or pedH < 30 ) then
							missionDone(player,false)
							killCheckShit(player)
						end
					end
			end
		end , 1000 , 0 , player,car,ped )
	end
end

function killCheckShit(player)
	if isTimer (checkShitTimer) then
		killTimer(checkShitTimer)
	end
end