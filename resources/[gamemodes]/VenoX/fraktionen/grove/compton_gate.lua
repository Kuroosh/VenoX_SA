------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

ComptonGate1 = createObject(969,-2178.347, 44.9, 34.3,0,0,270)
ComptongateLS1 = createObject(2927,2418.8994140625,-1245.8994140625,24.60000038147,0,0,0)
ComptongateLS2 = createObject(2927,2414.7998046875,-1245.8994140625,24.60000038147,0,0,0)

Comptongate1Moving = false

Comptongate1Moved = false

local function Compton_Gate_SF_func ( source )

	if isGrove (source) or isCop(source) or isFBI(source) or isArmy(source) or vnxGetElementData( source, "adminlvl" ) >= 3 then
		if getDistanceBetweenPoints3D ( -2178.347, 44.9, 34.3, getElementPosition ( source ) ) < 17 then
			if Comptongate1Moving == false then
				Comptongate1Moving = true
				if Comptongate1Moved == false then
					moveObject ( ComptonGate1, 1500, -2178.347, 34.9, 34.3, 0, 0, 0 )
					setTimer ( triggerComptonGate1Varb, 1500, 1 )
					Comptongate1Moved = true
				else
					moveObject ( ComptonGate1, 1500, -2178.347, 44.9, 34.3, 0, 0, 0 )
					setTimer ( triggerComptonGate1Varb, 1500, 1 )
					Comptongate1Moved = false
				end
			end
		end
	end
end
addCommandHandler ( "mv", Compton_Gate_SF_func )

function triggerComptonGate1Varb ()

	Comptongate1Moving = false
end

local function Comptongate_func_LS(source, command)
	tx,ty,tz = getElementPosition(ComptongateLS1)
	px, py, pz = getElementPosition(source)
	if isGrove (source) or isCop(source) or isFBI(source) or isArmy(source) or vnxGetElementData( source, "adminlvl" ) >= 3 then
		if (tonumber(px) <= tonumber(tx)+15) and (tonumber(px) >= tonumber(tx)-15) and (tonumber(py) <= tonumber(ty)+15) and (tonumber(py) >= tonumber(ty)-15) and (tonumber(pz) <= tonumber(tz)+20) and (tonumber(pz) >= tonumber(tz)-20) then
			if tonumber(tz) == 21 then
				moveObject( ComptongateLS1, 1500, 2418.8994140625,-1245.8994140625, 24.60000038147)
               	moveObject( ComptongateLS2, 1500, 2414.7998046875,-1245.8994140625, 24.60000038147)
			else
				moveObject( ComptongateLS1, 1500, 2418.8994140625,-1245.8994140625, 21)
               	moveObject( ComptongateLS2, 1500, 2414.7998046875,-1245.8994140625, 21)
			end
		end
	end
end
addCommandHandler("mv", Comptongate_func_LS)