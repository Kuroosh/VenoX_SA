------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

wattsMoving = false
wattsMoved = false


wattsgate = createObject(975,1141,-1207.6999511719,19.5999998474121,0,0,270)

local function wattsgate_func(player, command)
	tx,ty,tz = getElementPosition(wattsgate)
	px, py, pz = getElementPosition(player)
	if isBallas(player) or isCop(player) or isFBI(player) or isArmy(player) or vnxGetElementData( player, "adminlvl" ) >= 3 then
		if (tonumber(px) <= tonumber(tx)+15) and (tonumber(px) >= tonumber(tx)-15) and (tonumber(py) <= tonumber(ty)+15) and (tonumber(py) >= tonumber(ty)-15) and (tonumber(pz) <= tonumber(tz)+20) and (tonumber(pz) >= tonumber(tz)-20) then
			if wattsMoving == false then
				wattsMoving = true
				if wattsMoved == false then
					moveObject( wattsgate, 1500, 1141,-1216.6999511719,19.5999998474121)
					setTimer ( triggerWattsGateVarb, 1500, 1 )
					wattsMoved = true
				else
					moveObject( wattsgate, 1500, 1141,-1207.6999511719,19.5999998474121)
					setTimer ( triggerWattsGateVarb, 1500, 1 )
					wattsMoved = false
				end
			end
		end
	end
end
addCommandHandler("mv", wattsgate_func)

function triggerWattsGateVarb ()

	wattsMoving = false
end

wattsSFMoving = false
wattsSFMoved = false


wattsSFgate = createObject(975,-2490.2998046875,-128,26.299999237061,0,0,90)

local function wattsSFgate_func(player, command)
	tx,ty,tz = getElementPosition(wattsSFgate)
	px, py, pz = getElementPosition(player)
	if isBallas(player) or isCop(player) or isFBI(player) or isArmy(player) or vnxGetElementData( player, "adminlvl" ) >= 3 then
		if (tonumber(px) <= tonumber(tx)+15) and (tonumber(px) >= tonumber(tx)-15) and (tonumber(py) <= tonumber(ty)+15) and (tonumber(py) >= tonumber(ty)-15) and (tonumber(pz) <= tonumber(tz)+20) and (tonumber(pz) >= tonumber(tz)-20) then
			if wattsSFMoving == false then
				wattsSFMoving = true
				if wattsSFMoved == false then
					moveObject( wattsSFgate, 1500, -2490.2998046875,-128,20.299999237061)
					setTimer ( triggerWattsSFGateVarb, 1000, 1 )
					wattsSFMoved = true
				else
					moveObject( wattsSFgate, 1500, -2490.2998046875,-128,26.299999237061)
					setTimer ( triggerWattsSFGateVarb, 1000, 1 )
					wattsSFMoved = false
				end
			end
		end
	end
end
addCommandHandler("mv", wattsSFgate_func)

function triggerWattsSFGateVarb ()

	wattsSFMoving = false
end