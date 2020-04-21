Eingangblip=createBlip(1939, 2382.5, 9.8, 18, 4, 0, 100, 0, 255)
paintball=createMarker( 1939, 2382.5, 9.8, "cylinder", 1.5, 255, 255, 0, 255 )
warptab = {}
warptab[1]= {2538,-1281,1046}
warptab[2]= {2533,-1306,1046}
warptab[3]= {2570,-1281,1046}
warptab[4]= {2570,-1306,1046}
warptab[5]= {2577,-1304,1046}
warptab[6]= {2577,-1281,1046}
warptab[7]= {2582,-1285,1046}
warptab[8]= {2576,-1282,1039}
warptab[9]= {2568,-1306,1039}
warptab[10]= {2570,-1283,1033}
warptab[11]= {2564,-1305,1033}
warptab[12]= {2564,-1282,1033}
warptab[13]= {2532,-1281,1033}
warptab[14]= {2528,-1289,1033}
warptab[15]= {2525,-1297,1033}
warptab[20]= {2569,-1282,1048}
warptab[21]= {2569,-1385,1048}
warptab[22]= {2569,-1288,1048}
warptab[23]= {2569,-1291,1048}
warptab[24]= {2569,-1294,1048}
warptab[25]= {2569,-1297,1048}
warptab[26]= {2569,-1300,1048}
warptab[27]= {2569,-1303,1048}
function warp(player)
	local warpp = math.random(1, 15)
	outputChatBox("*Willkommen in der Painballhalle*", player, 255, 255, 0, false)
	outputChatBox("Hier ist das Schiessen erlaubt", player, 255, 255, 0, false)
	outputChatBox("Alle anderen Regeln gelten auch hier!", player, 255, 255, 0, false)
	outputChatBox("Mit #1AFF00/go #FFFF00kannst du die Halle verlassen!", player, 255, 255, 0, true)
	setElementPosition(player, unpack(warptab[warpp]))
	setElementDimension(player, 1000)
	setElementInterior(player, 2)
	giveWeapon ( player, 33, 200, true)
	setPlayerHudComponentVisible(player, "radar", false)
end
	
addEventHandler("onMarkerHit", paintball, warp)


function verlassen(player)
	if getElementDimension(player)==1000 then
	outputChatBox("Du hast die Paintballhalle verlassen", player, 255, 255, 100, false)
	setElementPosition(player, 1939, 2386, 11, 0, 0, 180)
	setElementDimension(player, 0)
	setElementInterior(player, 0)
	setWeaponAmmo(player, 33, 0)
	end
end

addCommandHandler("go", verlassen)



function treffer(attacker,waffe)
	if (attacker ~= nil) then
		name1 = getPlayerName(attacker)
		name2 = getPlayerName(source)
		if attacker then
			if ( waffe == 33 ) then
				if getElementDimension(attacker) == 1000 then
					setElementFrozen ( source, true )
					setTimer(setElementFrozen, 10000, 1, source, false)
					local warpp = math.random(20, 27)
					setElementPosition(source, unpack(warptab[warpp]))
					setElementDimension(source, 1000)
					setElementInterior(source, 2)
					setTimer( tot, 10000 , 1 , source)
					setWeaponAmmo(source, 33, 0)
					outputChatBox("du wurdest von "..name1.." getroffen",source,255,0,0)
					outputChatBox("du hast "..name2.." getroffen", attacker, 0,0,255)
					outputChatBox("Mit #1AFF00/go #FFFF00kannst du die Halle verlassen!", source, 255, 255, 0, true)
				end
			end
		end
	end
end
addEventHandler("onPlayerDamage",getRootElement(),treffer)


function tot(source)
	local warpp = math.random(1, 15)
    setElementPosition(source, unpack(warptab[warpp]))
	setElementDimension(source, 1000)
	setElementInterior(source, 2)
	setElementHealth(source, 100)
	giveWeapon (source, 33, 200, true)
end



