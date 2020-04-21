-- welt objecte --
removeWorldModel(9623, 50, -2681.3515625, 1274.609375, 57.421875)
removeWorldModel(9868, 50, -2681.3515625, 1274.609375, 57.421875)


-- VARIABLEN --

local mautstellenpreis = 25
local gate = {}
local gatevar = {}
local gatemoving = {}
local gatecol = {}
local movingtimer = {}
local ped = {}

local disallowed = {
	[455] = true
}
-- GATES --
-- Von SF nach LV --
-- ALLE TORE SIND ZU BEIM START --

-- Einfahrt(nach LV)
local temp = 1
gate[temp] = createObject(968, -1658.3016357422, 544.09899902344, 37.900001525879, 0, 90, 315.24426269531) --Früher 88.994781494141
gatevar[temp] = false
gatemoving[temp] = false
gatecol[temp] = createColSphere(-1658.9656982422, 537.95556640625, 38.231918334961, 5)
setElementData(gatecol[temp], "mautstellenid", temp)

-- Ausfahrt(nach SF)
temp = 2
gate[temp] = createObject(968, -1673.673828125, 547.4609375, 37.899982452393, 0, 90, 137)
gatevar[temp] = false
gatemoving[temp] = false
gatecol[temp] = createColSphere(-1672.9270019531, 553.46875, 38.230781555176, 5)
setElementData(gatecol[temp], "mautstellenid", temp)
setElementData(gatecol[temp], "weiterfahrt", true)

-- Von LV nach SF --
-- Einfahrt (Nach SF)
temp = 3
gate[temp] = createObject(968, -1139.9455566406, 1110.1457519531, 38.011909484863, 0, 90, 135)
gatevar[temp] = false
gatemoving[temp] = false
gatecol[temp] = createColSphere(-1139.1903076172, 1116.265625, 38.066013336182, 5)
setElementData(gatecol[temp], "mautstellenid", temp)

-- Ausfahrt (nach LV)
temp = 4
gate[temp] = createObject(968, -1123.8515625, 1107.2841796875, 37.839832305908, 0, 90, 315)
gatevar[temp] = false
gatemoving[temp] = false
gatecol[temp] = createColSphere(-1124.2266845703, 1101.5460205078, 38.077590942383, 5)
setElementData(gatecol[temp], "mautstellenid", temp)
setElementData(gatecol[temp], "weiterfahrt", true)

-- von SF nach Bayside --

-- Einfahrt (nach Bayside)--
temp = 5
gate[temp] = createObject(968, -2672.1806640625, 1277.4462890625, 55.314693450928, 0, 90, 0)
gatevar[temp] = false
gatemoving[temp] = false
gatecol[temp] = createColSphere(-2669.1574707031, 1272.1342773438, 55.4296875, 5)
setElementData(gatecol[temp], "mautstellenid", temp)

-- Ausfahrt (von Bayside)
temp = 6
gate[temp] = createObject(968, -2690.8325195313, 1267.7491455078, 55.343799591064, 0, 90, 180)
gatevar[temp] = false
gatemoving[temp] = false
gatecol[temp] = createColSphere(-2694.3657226563, 1273.1763916016, 55.4296875, 5)
setElementData(gatecol[temp], "mautstellenid", temp)
setElementData(gatecol[temp], "weiterfahrt", true)

-- von Bayside nach SF --
-- Einfahrt (nach SF) --

temp = 7
gate[temp] = createObject(968, -2688.9206542969, 2161.6372070313, 55.229675292969, 0, 90, 180)
gatevar[temp] = false
gatemoving[temp] = false
gatecol[temp] = createColSphere(-2692.2014160156, 2165.6672363281, 55.4296875, 5)
setElementData(gatecol[temp], "mautstellenid", temp)

-- Ausfahrt (nach Bayside)
temp = 8
gate[temp] = createObject(968, -2675.4311523438, 2170.5581054688, 55.20467376709, 0, 90, 1.4)
gatevar[temp] = false
gatemoving[temp] = false
gatecol[temp] = createColSphere(-2672.0085449219, 2165.3879394531, 55.4296875, 5)
setElementData(gatecol[temp], "mautstellenid", temp)
setElementData(gatecol[temp], "weiterfahrt", true)

for index, col in next, gatecol do
	addEventHandler("onColShapeHit", col, function(hitElement)
		if(getElementType(hitElement) == "vehicle") and (getVehicleOccupant(hitElement)) then
			local id = tonumber(getElementData(source, "mautstellenid"))
			if(gatevar[id] == true) then return end
			if(gatemoving[id] == true) then
				stopObject(gate[id])
				if(isTimer(movingtimer[id])) then
					killTimer(movingtimer[id])
				end
				local x, y, z = getElementRotation(gate[id])
				setElementRotation(gate[id], x, 90, z)
			end
			local thePlayer = getVehicleOccupant(hitElement)
			local money = vnxGetElementData (thePlayer, "money")
			if not(getVehicleSirensOn(hitElement)) then
				if(getElementData(source, "weiterfahrt") ~= true) then
				---
					if ( money < mautstellenpreis ) then
						outputChatBox("Du benötigst "..mautstellenpreis.."$ um diese Mautstelle zu passieren.", thePlayer, 150, 0, 0)
						return
					end
					
				end
				if(getElementData(source, "weiterfahrt") ~= true) then
				---
					vnxSetElementData (thePlayer, "money", money - mautstellenpreis)
					--givePlayerMoney(thePlayer, - mautstellenpreis)
					setPedAnimation(thePlayer, "CAR", "Sit_relaxed", -1, true, false, false)
				end
			end
			local col = source
			setTimer(function()
						local gesuchter = getPlayerName(thePlayer)
						local wanteds = vnxGetElementData (thePlayer, "wanteds")
						local strecke
						if (id == 1) then
							strecke = "SF nach LV (SF)"
						elseif (id == 3) then
							strecke = "LV nach SF (LV)"
						elseif (id == 6) then
							strecke = "Bayside nach SF (Bayside)"
						elseif (id == 8) then
							strecke = "SF nach Bayside (SF)"
						end
					--local id2 = getElementModel(hitElement)
					--if(disallowed[id2]) and (disallowed[id2] == true) then
					if vnxGetElementData ( hitElement, "illegalcar") == 1 then
						local rand = math.random(0, 5)
						if(rand == 5) then
							-- SICHERHEITSHINWEIS --
							local msg = "[ILLEGAL]:"..gesuchter.." befindet sich mit illegalen Waren auf der Strecke: "..strecke..""
							sendMSGForFaction ( msg, 1, 200, 0, 0 )
							sendMSGForFaction ( msg, 6, 200, 0, 0 )
							sendMSGForFaction ( msg, 8, 200, 0, 0 )
							outputChatBox("Zollbeamter: Sie transportieren illegale Ware! Steigen Sie sofort aus!", thePlayer, 255, 255, 255)
							if wanteds < 6 then
								vnxSetElementData (thePlayer, "wanteds", wanteds + 1)
								setPlayerWantedLevel(thePlayer, getPlayerWantedLevel(thePlayer)+1)
							end
							return
						end
					end
					if not(getVehicleSirensOn(hitElement)) then
						if (id == 1) or (id == 3) or (id == 6) or (id == 8) then
							if wanteds == 1 then
								local rand = math.random(1, 6)
								if (rand == 6) then
									local msg = "[ILLEGAL]: Der Gesuchte "..gesuchter.." befindet sich auf der Strecke: "..strecke..""
									sendMSGForFaction ( msg, 1, 200, 0, 0 )
									sendMSGForFaction ( msg, 6, 200, 0, 0 )
									sendMSGForFaction ( msg, 8, 200, 0, 0 )
									outputChatBox("Zollbeamter: Steigen Sie sofort aus ihrem Fahrzeug, Sie werden gesucht!", thePlayer, 255, 255, 255)
								return
								end
							elseif wanteds == 2 then
								local rand = math.random(1, 5)
								if (rand == 5) then
									local msg = "[ILLEGAL]: Der Gesuchte "..gesuchter.." befindet sich auf der Strecke: "..strecke..""
									sendMSGForFaction ( msg, 1, 200, 0, 0 )
									sendMSGForFaction ( msg, 6, 200, 0, 0 )
									sendMSGForFaction ( msg, 8, 200, 0, 0 )
									outputChatBox("Zollbeamter: Steigen Sie sofort aus ihrem Fahrzeug, Sie werden gesucht!", thePlayer, 255, 255, 255)
								return
								end					
							elseif wanteds == 3 then
								local rand = math.random(1, 4)
								if (rand == 4) then
									local msg = "[ILLEGAL]: Der Gesuchte "..gesuchter.." befindet sich auf der Strecke: "..strecke..""
									sendMSGForFaction ( msg, 1, 200, 0, 0 )
									sendMSGForFaction ( msg, 6, 200, 0, 0 )
									sendMSGForFaction ( msg, 8, 200, 0, 0 )
									outputChatBox("Zollbeamter: Steigen Sie sofort aus ihrem Fahrzeug, Sie werden gesucht!", thePlayer, 255, 255, 255)
								return
								end					
							elseif wanteds == 4 then
								local rand = math.random(1, 3)
								if (rand == 3) then
									local msg = "[ILLEGAL]: Der Gesuchte "..gesuchter.." befindet sich auf der Strecke: "..strecke..""
									sendMSGForFaction ( msg, 1, 200, 0, 0 )
									sendMSGForFaction ( msg, 6, 200, 0, 0 )
									sendMSGForFaction ( msg, 8, 200, 0, 0 )
									outputChatBox("Zollbeamter: Steigen Sie sofort aus ihrem Fahrzeug, Sie werden gesucht!", thePlayer, 255, 255, 255)
								return
								end					
							elseif wanteds == 5 then
								local rand = math.random(1, 2)
								if (rand == 2) then
									local msg = "[ILLEGAL]: Der Gesuchte "..gesuchter.." befindet sich auf der Strecke: "..strecke..""
									sendMSGForFaction ( msg, 1, 200, 0, 0 )
									sendMSGForFaction ( msg, 6, 200, 0, 0 )
									sendMSGForFaction ( msg, 8, 200, 0, 0 )
									outputChatBox("Zollbeamter: Steigen Sie sofort aus ihrem Fahrzeug, Sie werden gesucht!", thePlayer, 255, 255, 255)
								return
								end				
							elseif wanteds == 6 then
								local rand = 1
								if (rand == 1) then
									local msg = "[ILLEGAL]: Der Gesuchte "..gesuchter.." befindet sich auf der Strecke: "..strecke..""
									sendMSGForFaction ( msg, 1, 200, 0, 0 )
									sendMSGForFaction ( msg, 6, 200, 0, 0 )
									sendMSGForFaction ( msg, 8, 200, 0, 0 )
									outputChatBox("Zollbeamter: Steigen Sie sofort aus ihrem Fahrzeug, Sie werden gesucht!", thePlayer, 255, 255, 255)
								return
								end				
							else
							end
						end
					end
				if(getElementData(col, "weiterfahrt") ~= true) then
					setPedAnimation(thePlayer)
					outputChatBox("Zollbeamter: Gute Weiterfahrt!", thePlayer, 255, 255, 255)
				end
				gatemoving[id] = true
				gatevar[id] = true
				local x, y, z = getElementPosition(gate[id])
				moveObject(gate[id], 1000, x, y, z, 0, -90, 0, "InOutQuad")
				movingtimer[id] = setTimer(function()
					gatemoving[id] = false
					local rx, ry, rz = getElementRotation(gate[id])
					if rz ~= 0 then
						setElementRotation(gate[id], rx, 0, rz)
					end
				end, 1000, 1)
			end, 1000, 1)
		end
	end)
	addEventHandler("onColShapeLeave", col, function(hitElement)
		if(getElementType(hitElement) == "vehicle") and (getVehicleOccupant(hitElement)) then
			local id = tonumber(getElementData(source, "mautstellenid"))
			if(gatevar[id] == false) then return end
			if(gatemoving[id] == true) then
				stopObject(gate[id])
				killTimer(movingtimer[id])
				local x, y, z = getElementRotation(gate[id])
				setElementRotation(gate[id], x, 0, z)
			end
			local time = 1000
			if(getVehicleTowedByVehicle(hitElement)) then
				time = 3000
			end
			setTimer(function()
				local thePlayer = getVehicleOccupant(hitElement)
				gatemoving[id] = true
				gatevar[id] = false
				local x, y, z = getElementPosition(gate[id])
				local rx, ry, rz = getElementRotation(gate[id])
				moveObject(gate[id], 1000, x, y, z, 0, 90, 0, "InOutQuad")
				movingtimer[id] = setTimer(function()
					gatemoving[id] = false
					local rx, ry, rz = getElementRotation(gate[id])
					if rz ~= 90 then
						setElementRotation(gate[id], rx, 90, rz)
					end
				end, 1000, 1)
			end, time, 1)
		end
	end)
end