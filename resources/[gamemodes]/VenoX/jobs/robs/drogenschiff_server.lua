------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
-------- 2012 - 2013 ---------
--------------------------------
--[[
local robfaction

function attachRotationAdjusted ( from, to )
    local frPosX, frPosY, frPosZ = getElementPosition( from )
    local frRotX, frRotY, frRotZ = getElementRotation( from )
    local toPosX, toPosY, toPosZ = getElementPosition( to )
    local toRotX, toRotY, toRotZ = getElementRotation( to )
    local offsetPosX = frPosX - toPosX
    local offsetPosY = frPosY - toPosY
    local offsetPosZ = frPosZ - toPosZ
    local offsetRotX = frRotX - toRotX
    local offsetRotY = frRotY - toRotY
    local offsetRotZ = frRotZ - toRotZ
    offsetPosX, offsetPosY, offsetPosZ = applyInverseRotation ( offsetPosX, offsetPosY, offsetPosZ, toRotX, toRotY, toRotZ )
    attachElements( from, to, offsetPosX, offsetPosY, offsetPosZ, offsetRotX, offsetRotY, offsetRotZ )
end

function applyInverseRotation ( x,y,z, rx,ry,rz )
    local DEG2RAD = (math.pi * 2) / 360
    rx = rx * DEG2RAD
    ry = ry * DEG2RAD
    rz = rz * DEG2RAD
    local tempY = y
    y =  math.cos ( rx ) * tempY + math.sin ( rx ) * z
    z = -math.sin ( rx ) * tempY + math.cos ( rx ) * z
    local tempX = x
    x =  math.cos ( ry ) * tempX - math.sin ( ry ) * z
    z =  math.sin ( ry ) * tempX + math.cos ( ry ) * z
    tempX = x
    x =  math.cos ( rz ) * tempX + math.sin ( rz ) * y
    y = -math.sin ( rz ) * tempX + math.cos ( rz ) * y
    return x, y, z
end


local ship = createObject(8493,2968.65185547,-2040.21,16.79500961,0.00000000,0.00000000,360.00000000)
local ship_B = createObject(9159,2968.43115234,-2040.21,16.50687408,0.00000000,0.00000000,360.00000000)
attachRotationAdjusted( ship_B, ship)
setElementData ( ship , "atLS" , true )
--local TMrchMrk1 = createMarker(2876.56, -2057.755, 7, "cylinder", 1.7, 255, 255, 0, 255)
local TPToShipMrk = createMarker(2940.677, -2051.9, 3.55, "corona", 1.5, 255, 0, 0, 150)
local TPToDock = createMarker(2968.11, -2075, 8.9, "corona", 1.5, 255, 0, 0, 150)
local sellMerchandiseMrk = createMarker(2359.861328125, 533.91015625, 0.796875, "cylinder", 1.7, 255, 0, 0, 150)



function BuyMerchandise(player)
	if isEvil( player ) then
		if isElementWithinMarker(player, TMrchMrk1) then
			triggerClientEvent(player, "showBuyMerchandiseWnd", player)
		end
	else
		outputChatBox("Du bist in keiner bösen Fraktion.", player, 200, 0, 0)
	end
end
addEventHandler("onMarkerHit", TMrchMrk1, BuyMerchandise)

setTimer (
	function ( )
		createBlipAttachedTo(sellMerchandiseMrk, settingSellMerchandiseMarkerBlip, 2, 255, 0, 0, 255, 0, 500, getRootElement())
	end
, 100 , 1 )

addEventHandler("onMarkerHit", TPToShipMrk,
function(hitElement)
		if isEvil(hitElement) then
			if getElementData(hitElement, "gotMerchandise", true) then
				if getElementData ( ship , "atLS" ) and not getElementData(ship, "moving", true) then
					fadeCamera(hitElement, false)
					setTimer(setElementPosition, 1000, 1, hitElement, 2967.97, -2053.72, 5.5)
					setTimer(fadeCamera, 1000, 1, hitElement, true)
					outputChatBox("[INFO]: Tippe /sail um das Schiff zu starten.", hitElement, 200, 200, 0)
					outputChatBox("[INFO]: Du kannst auch das Schiff mit dem Marker verlassen, jedoch kannst du dann keine Drogen abgeben!", hitElement, 150, 150, 0)
					setElementData(hitElement, "setship", true)
				else
					outputChatBox("Das Schiff ist noch nicht zurück!", hitElement, 150, 0, 0)
				end
			else
				outputChatBox("Du hast keine Drogen!", hitElement, 150, 0, 0)
			end
		else
			outputChatBox("Du bist in keiner bösen Fraktion!", hitElement, 150, 0, 0)
		end
end
)

addEventHandler("onMarkerHit", TPToDock,
	function(hitElement)
		if isEvil(hitElement) then
			fadeCamera(hitElement, false)
			setTimer(setElementPosition, 1000, 1, hitElement, 2935.677, -2051.9, 3.55)
			setTimer(fadeCamera, 1000, 1, hitElement, true)
			setElementData(hitElement, "setship", false)
		end
	end
)

addEvent("BuyMerchandise", true)
addEventHandler("BuyMerchandise", root,
	function(ammount)
		if not client then return end
		if not getElementData(client, "gotMerchandise") then
			if tonumber(ammount) >= 15000 then
				outputChatBox("Du darfst nicht mehr als 15.000$ ausgeben!", client, 150, 0, 0, true)
			else
				ammount = tonumber(ammount)
				setElementData(client, "gotMerchandise", true)
				setElementData(client, "merchandiseAmmount", ammount)
				outputChatBox("[AUFGABE]: Du hast #00FF00"..ammount.."$#FFFFFF ausgegeben für Drogen. Geh zum Schiff!", client, 0, 100, 200, true)
				laSetElementData ( client, "money", laGetElementData ( client, "money" ) - ammount )
				takePlayerMoney ( ammount )
				outputLog ( "[DROGENSCHIFF]: "..getPlayerName ( client ).." hat für "..ammount.."$ Drogen gekauft!", "bad" )
			end	
		else
			outputChatBox("Du hast bereits Drogen dabei!", client, 150, 0, 0, true)
			outputChatBox("[INFO]: Du kannst es mit /drogen überprüfen.", client, 150, 150, 0, true)
		end
	end
)

addCommandHandler("drogen",
	function(src, cmd)
		if getElementData(src, "gotMerchandise") then
			outputChatBox("[INFO]: Du hast #00FF00"..getElementData(src, "merchandiseAmmount").."$#FFFFFF ausgegeben für Drogen. Du musst zum Schiff!", src, 150, 150, 0, true)
		else
			outputChatBox("Du hast keine Drogen.", src, 150, 0, 0)
		end
	end
)
--sailing (moving the ship) command
addCommandHandler("sail",
	function(src, cmd)
		if isEvil(src) or (laGetElementData ( src, "adminlvl" )) >= 4 then
			if getElementData ( ship , "atLV" ) then
				outputChatBox ( "Das Schiff ist bereits in LV" , src, 150, 0,0  )
				return
			end
			local sx, sy, sz = getElementPosition(ship)
			if isPlayerInRangeOfPoint(src, sx,sy,sz,35) or (laGetElementData ( src, "adminlvl" )) >= 4 then
				if getElementData(src, "gotMerchandise") or (laGetElementData ( src, "adminlvl" )) >= 4 then
					if not getElementData(ship, "moving") then
						moveObject(ship, 240000, 3081.7802734375, 440.63671875, 13.2831835746765)
						movingTimer1 = setTimer(setElementRotation, 240000, 1, ship, 0, 0, -270)
						movingTimer2 = setTimer(moveObject, 240000, 1, ship, 30000,2363.837890625, 516.2529296875, 13.5234065055847)
						local msg = "[ILLEGAL]: Ein Drogenschiff wurde beladen!"
						local fraktion = laGetElementData (src, "fraktion")
						robfaction = fraktion
						sendMSGForFaction ( msg, 1, 200, 0, 0 )
						sendMSGForFaction ( msg, 12, 200, 0, 0 )
						if robfaction ~= 2 then
							sendMSGForFaction ( msg, 2, 200, 200, 0 )
						end
						sendMSGForFaction ( msg, 3, 200, 0, 0 )
						sendMSGForFaction ( msg, 6, 200, 0, 0 )
						if robfaction ~= 7 then
							sendMSGForFaction ( msg, 7, 200, 200, 0 )
						end
						sendMSGForFaction ( msg, 8, 200, 0, 0 )
						if robfaction ~= 9 then
							sendMSGForFaction ( msg, 9, 200, 200, 0 )
						end
						if robfaction ~= 10 then
							sendMSGForFaction ( msg, 10, 200, 200, 0 )
						end
						sendMSGForFaction ( msg, robfaction, 0, 150, 0 )
						outputLog ( "[DROGENSCHIFF]: "..getPlayerName ( src ).." hat ein Drogenschiff gestartet!", "bad" )
						setElementData(ship, "moving", true)
						movingTimer3 = setTimer(setElementData, 270000, 1, ship, "moving", false)
						setTimer (
							function ( ) 
								removeElementData ( ship , "atLS" )
								setElementData ( ship , "atLV" , true )
								local msg = "[DROGENSCHIFF]: Das Drogenschiff ist angekommen!"
								sendMSGForFaction ( msg, 1, 200, 0, 0 )
								sendMSGForFaction ( msg, 12, 200, 0, 0 )
								if robfaction ~= 2 then
									sendMSGForFaction ( msg, 2, 200, 200, 0 )
								end
								sendMSGForFaction ( msg, 3, 200, 0, 0 )
								sendMSGForFaction ( msg, 6, 200, 0, 0 )
								if robfaction ~= 7 then
									sendMSGForFaction ( msg, 7, 200, 200, 0 )
								end
								sendMSGForFaction ( msg, 8, 200, 0, 0 )
								if robfaction ~= 9 then
									sendMSGForFaction ( msg, 9, 200, 200, 0 )
								end
								if robfaction ~= 10 then
									sendMSGForFaction ( msg, 10, 200, 200, 0 )
								end
								sendMSGForFaction ( msg, robfaction, 0, 150, 0 )
								outputLog ( "[DROGENSCHIFF]: Das Drogenschiff ist angekommen!", "bad" )
							end
						, 270000 , 1 )
					else
						outputChatBox("Das Schiff segelt bereits!", src, 150, 0, 0)
					end
				else
					outputChatBox("Du hast keine Drogen, kauf zuerst welche!", src, 150, 0, 0)
				end
			else
				outputChatBox("Du bist zu weit vom Schiff entfernt!", src, 150, 0, 0)
			end
		else
			outputChatBox("Du bist in keiner böse Fraktion!", src, 175, 0, 0)
		end
	end
)

--sailing back
addCommandHandler("sailback",
	function(src, cmd)
		if isEvil(src) or (laGetElementData ( src, "adminlvl" )) >= 1 then
			if getElementData ( ship , "atLS" ) then
				outputChatBox ( "Das Schiff ist bereits in LS." , src, 150, 0, 0)
				return
			end
			local sx, sy, sz = getElementPosition(ship)
			if isPlayerInRangeOfPoint(src, sx,sy,sz,35) or (laGetElementData ( src, "adminlvl" )) >= 1 then
				if not getElementData(ship, "moving") then
					setElementData(ship, "moving", true)
					setElementRotation(ship, 0, 0, 270)
					moveObject(ship, 30000, 3081.7802734375, 440.63671875, 13.2831835746765)
					outputLog ( "[DROGENSCHIFF]: "..getPlayerName ( src ).." hat ein Drogenschiff zurueckgesendet!", "bad" )
					movingTimer4 = setTimer(setElementRotation, 30000, 1, ship, 0, 0, 180)
					movingTimer5 = setTimer(moveObject, 30000, 1, ship, 240000, 2968.65185547,-2040.21,16.79500961 )
					movingTimer6 = setTimer(setElementData, 270000, 1, ship, "moving", false)
					movingTimer7 = setTimer(outputChatBox, 270100, 1, "[INFO]: Das Schiff ist angekommen.", src, 150, 150, 0)
					movingTimer8 = setTimer(setElementRotation, 270100, 1, ship, 0, 0, 360)
					setTimer (
						function ( ) 
							removeElementData ( ship , "atLV" )
							setElementData ( ship , "atLS" , true )
						end
					, 270000 , 1 )
				else
					outputChatBox("Das Schiff segelt bereits!", src, 175, 0, 0)
				end
			else
				outputChatBox("Du bist zu weit vom Schiff entfernt!", src, 150, 0, 0)
			end
		else
			outputChatBox("Du bist in keiner bösen Fraktion!", src, 175, 0, 0)
		end
	end
)

addEventHandler("onMarkerHit", sellMerchandiseMrk,
	function(player)
		if isEvil(player) then
			if getElementData(player, "gotMerchandise") then
				if getElementData(player, "setship") then
					if getElementData ( ship , "atLV" ) then
						local ammount = getElementData(player, "merchandiseAmmount") * 1.1
						setElementData(player, "gotMerchandise", false)
						laSetElementData ( player, "money", laGetElementData ( player, "money" ) + ammount )
						givePlayerMoney ( ammount )
						outputChatBox("Du hast für die Drogen folgende Summe bekommen: #00FF00$"..getElementData(player, "merchandiseAmmount") * 1.1, player, 0, 150, 0, true)
						outputLog ( "[DROGENSCHIFF]: "..getPlayerName ( player ).." hat "..getElementData(player, "merchandiseAmmount").." Gramm Drogen verkauft!", "bad" )
						setElementData(player, "merchandiseAmmount", 0)
						setElementData(player, "setship", false)
					else
						outputChatBox("Wo ist das Schiff?! Ohne das Schiff kommst du nicht weit!", player, 175, 0, 0)
					end
				else
					outputChatBox("Bugusing wird mit einem Permabann bestraft! Du musst mit dem Schiff reisen!", player, 250, 0, 0)
				end
			else
				outputChatBox("Du hast keine Drogen!", player, 175, 0, 0)
			end
		end
	end
)
]]