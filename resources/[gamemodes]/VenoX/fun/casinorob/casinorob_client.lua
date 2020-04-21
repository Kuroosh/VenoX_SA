local angezielt = false
local thecasino = nil
local xscreen, yscreen = guiGetScreenSize ()
local aufbrechzeit = 0
local progress = 0
local robSound = nil
local spawnprotectiontimer = nil
local roulettMarkerX = {}
local roulettMarkerY = {}
local roulettMarkerZ = {}
local blackJackMarkerX = {}
local blackJackMarkerY = {}
local blackJackMarkerZ = {}
local slotX = {}
local slotY = {}
local slotZ = {}


function whichCasinoGettingRobbed ( target )
	local time = getRealTime()
	--if time.hour >= 14 and time.hour < 21 then     GEÄNDERT
		if target then
			if getElementInterior (source) == 1 or getElementInterior (source) == 10 or getElementInterior (source) == 12 then
				if getPedWeaponSlot ( source ) ~= 0 then
					if getPedControlState ("aim_weapon") == true then
						local targetingcasinoped = false
						if getElementInterior(source) == 1 then
							if vnxGetElementData(source, "fraktion") == 3 or vnxGetElementData(source, "fraktion") == 7 or vnxGetElementData(source, "fraktion") == 9 or vnxGetElementData(source, "fraktion") == 12 or vnxGetElementData(source, "fraktion") == 13 then 
								for i, index in pairs ( caligulasPed ) do
									if target == caligulasPed[i] then
										targetingcasinoped = true
									end
								end
								if not targetingcasinoped then
									return false
								end
								local x, y = getElementPosition(source)
								local px, py = getElementPosition (target)
								if getDistanceBetweenPoints2D (x, y, px, py) <= 10 then
									if target == caligulasPed[0] or target == caligulasPed[1] or target == caligulasPed[2] then
										thecasino = "caligulas"
										triggerServerEvent("setCasinoPreparationServer", getLocalPlayer())
									else
										if angezielt == false then
											angezielt = true
											setTimer(function() angezielt = false end, 5000, 1)
											local randomnumber = math.random(5)
											if randomnumber == 1 then
												if getElementModel(target) == 194 then
													outputChatBox("Maria sagt: Ich habe doch erst heute angefangen, ich wei\195\159 von nichts!", 255, 255, 255)
												elseif getElementModel(target) == 240 then
													outputChatBox("Dieter sagt: Ich habe doch erst heute angefangen, ich wei\195\159 von nichts!", 255, 255, 255)
												end
											elseif randomnumber == 2 then
												if getElementModel(target) == 194 then
													outputChatBox("Hannah sagt: Ich wei\195\159 von nichts!", 255, 255, 255)
												elseif getElementModel(target) == 240 then
													outputChatBox("Paul sagt: Ich wei\195\159 von nichts", 255, 255, 255)
												end
											elseif randomnumber == 3 then
												if getElementModel(target) == 194 then
													outputChatBox("Lena schreit: Biittte niichht!!!", 255, 255, 255)
												elseif getElementModel(target) == 240 then
													outputChatBox("Max schreit: Biittte niichht!!!", 255, 255, 255)
												end
											elseif randomnumber == 4 then
												if getElementModel(target) == 194 then
													outputChatBox("Julia sagt: Fragen Sie jemand anderen, ich habe keine Ahnung!", 255, 255, 255)
												elseif getElementModel(target) == 240 then
													outputChatBox("Stefan sagt: Fragen Sie jemand anderen, ich habe keine Ahnung!", 255, 255, 255)
												end
											elseif randomnumber == 5 then
												if getElementModel(target) == 194 then
													outputChatBox("Kimberly sagt: Ich mache hier nur meinen Job.", 255, 255, 255)
												elseif getElementModel(target) == 240 then
													outputChatBox("Marcel sagt: Ich mache hier nur meinen Job.", 255, 255, 255)
												end
											end
										end
									end	
								end				
							end
						elseif getElementInterior(source) == 10 then
							if vnxGetElementData(source, "fraktion") == 2 or vnxGetElementData(source, "fraktion") == 9 then   
								for i, index in pairs ( fourdragonsPed ) do
									if target == fourdragonsPed[i] then
										targetingcasinoped = true
									end
								end
								if not targetingcasinoped then
									return false
								end
								local x, y = getElementPosition(source)
								local px, py = getElementPosition (target)
								if getDistanceBetweenPoints2D (x, y, px, py) <= 10 then
									if target == fourdragonsPed[0] or target == fourdragonsPed[1] then	
										thecasino = "fourdragons"
										triggerServerEvent("setCasinoPreparationServer", getLocalPlayer())
									else
										if angezielt == false then
											angezielt = true
											setTimer(function() angezielt = false end, 5000, 1)
											local randomnumber = math.random(5)
											if randomnumber == 1 then
												if getElementModel(target) == 194 then
													outputChatBox("Maria sagt: Ich habe doch erst heute angefangen, ich wei\195\159 von nichts!", 255, 255, 255)
												elseif getElementModel(target) == 240 then
													outputChatBox("Dieter sagt: Ich habe doch erst heute angefangen, ich wei\195\159 von nichts!", 255, 255, 255)
												end
											elseif randomnumber == 2 then
												if getElementModel(target) == 194 then
													outputChatBox("Hannah sagt: Ich wei\195\159 von nichts!", 255, 255, 255)
												elseif getElementModel(target) == 240 then
													outputChatBox("Paul sagt: Ich wei\195\159 von nichts", 255, 255, 255)
												end
											elseif randomnumber == 3 then
												if getElementModel(target) == 194 then
													outputChatBox("Lena schreit: Biittte niichht!!!", 255, 255, 255)
												elseif getElementModel(target) == 240 then
													outputChatBox("Max schreit: Biittte niichht!!!", 255, 255, 255)
												end
											elseif randomnumber == 4 then
												if getElementModel(target) == 194 then
													outputChatBox("Julia sagt: Fragen Sie jemand anderen, ich habe keine Ahnung!", 255, 255, 255)
												elseif getElementModel(target) == 240 then
													outputChatBox("Stefan sagt: Fragen Sie jemand anderen, ich habe keine Ahnung!", 255, 255, 255)
												end
											elseif randomnumber == 5 then
												if getElementModel(target) == 194 then
													outputChatBox("Kimberly sagt: Ich mache hier nur meinen Job.", 255, 255, 255)
												elseif getElementModel(target) == 240 then
													outputChatBox("Marcel sagt: Ich mache hier nur meinen Job.", 255, 255, 255)
												end
											end
										end
									end
								end
							end
						elseif getElementInterior(source) == 12 then
							if vnxGetElementData(source, "fraktion") == 3 or vnxGetElementData(source, "fraktion") == 2 then  
								for i, index in pairs ( thecasinoPed ) do
									if target == thecasinoPed[i] then
										targetingcasinoped = true
									end
								end
								if not targetingcasinoped then
									return false
								end
								local x, y = getElementPosition(source)
								local px, py = getElementPosition (target)
								if getDistanceBetweenPoints2D (x, y, px, py) <= 10 then
									thecasino = "thecasino"
									triggerServerEvent("setCasinoPreparationServer", getLocalPlayer())
								end
							end
						end
					end
				end
			end
		end
--	end     GEÄNDERT
end	


function setCasinoPreparation_func ()
	setCasinorobPedAnimations ( true )
	if thecasino == "fourdragons" then
		setElementPosition (barMarkers["marker"][3], barMarkers["x"][3]+2000, barMarkers["y"][3]+2000, barMarkers["z"][3]+2000 )
		setElementPosition (barMarkers["marker"][4], barMarkers["x"][4]+2000, barMarkers["y"][4]+2000, barMarkers["z"][4]+2000 )
		for i, marker in pairs (roulettMarker) do
			if getElementInterior(roulettMarker[i]) == 10 then
				local x,y,z = getElementPosition(roulettMarker[i])
				if roulettMarkerX[i] == nil then
					roulettMarkerX[i] = x
					roulettMarkerY[i] = y
					roulettMarkerZ[i] = z
				end
				setElementPosition(roulettMarker[i], x+2000, y+2000,z+2000)
			end
		end
		for i, marker in pairs (blackJackMarker) do
			if getElementInterior(blackJackMarker[i]) == 10 then
				local x,y,z = getElementPosition(blackJackMarker[i])
				if blackJackMarkerX[i] == nil then
					blackJackMarkerX[i] = x
					blackJackMarkerY[i] = y
					blackJackMarkerZ[i] = z
				end
				setElementPosition(blackJackMarker[i], x+2000, y+2000,z+2000)
			end
		end
		for i, slots in pairs (slot) do
			if getElementInterior(slot[i]["Marker"]) == 10 then
				local x,y,z = getElementPosition(slot[i]["Marker"])
				if slotX[i] == nil then
					slotX[i] = x
					slotY[i] = y
					slotZ[i] = z
				end
				setElementPosition(slot[i]["Marker"], x+2000, y+2000,z+2000)
			end
		end
	elseif thecasino == "caligulas" then
		setElementPosition (barMarkers["marker"][5], barMarkers["x"][5]+2000, barMarkers["y"][5]+2000, barMarkers["z"][5]+2000 )
		setElementPosition (barMarkers["marker"][6], barMarkers["x"][6]+2000, barMarkers["y"][6]+2000, barMarkers["z"][6]+2000 )
		for i, marker in pairs (roulettMarker) do
			if getElementInterior(roulettMarker[i]) == 1 then
				local x,y,z = getElementPosition(roulettMarker[i])
				if roulettMarkerX[i] == nil then
					roulettMarkerX[i] = x
					roulettMarkerY[i] = y
					roulettMarkerZ[i] = z
				end
				setElementPosition(roulettMarker[i], x+2000, y+2000,z+2000)
			end
		end
		for i, marker in pairs (blackJackMarker) do
			if getElementInterior(blackJackMarker[i]) == 1 then
				local x,y,z = getElementPosition(blackJackMarker[i])
				if blackJackMarkerX[i] == nil then
					blackJackMarkerX[i] = x
					blackJackMarkerY[i] = y
					blackJackMarkerZ[i] = z
				end
				setElementPosition(blackJackMarker[i], x+2000, y+2000,z+2000)
			end
		end
		for i, slots in pairs (slot) do
			if getElementInterior(slot[i]["Marker"]) == 1 then
				local x,y,z = getElementPosition(slot[i]["Marker"])
				if slotX[i] == nil then
					slotX[i] = x
					slotY[i] = y
					slotZ[i] = z
				end
				setElementPosition(slot[i]["Marker"], x+2000, y+2000,z+2000)
			end
		end
	elseif thecasino == "thecasino" then
		setElementPosition (barMarkers["marker"][9], barMarkers["x"][9]+2000, barMarkers["y"][9]+2000, barMarkers["z"][9]+2000 )
	end
end

addEvent ("casinorobOnMarkerHit", true)
addEventHandler ("casinorobOnMarkerHit", getLocalPlayer(), function(marker)
	progress = 0
	addEventHandler("onClientHUDRender", root, casinorobOnMarkerHitDXDraw)
end)

addEvent ("casinorobOnMarkerLeave", true)
addEventHandler ("casinorobOnMarkerLeave", getLocalPlayer(), function()
	removeEventHandler("onClientHUDRender", root, casinorobOnMarkerHitDXDraw)
	progress = 0
end)


function casinorobOnMarkerHitDXDraw ()
	progress = progress + 1
	if thecasino == "caligulas" then
		aufbrechzeit = 3000
	elseif thecasino == "fourdragons" then
		aufbrechzeit = 5000
	elseif thecasino == "thecasino" then
		aufbrechzeit = 5000
	end
	if progress < aufbrechzeit then 
		dxDrawRectangle(xscreen*0.413,0,xscreen*0.174,yscreen*0.04,0xFF000000)
		dxDrawRectangle(xscreen*0.417,yscreen*0.005,xscreen*0.166,yscreen*0.03,tocolor(0,64,128))
		dxDrawRectangle(xscreen*0.417,yscreen*0.005,xscreen*(0.166*(progress/aufbrechzeit)),yscreen*0.03,tocolor(0,128,255))
		dxDrawText("Wird aufgebrochen ...",xscreen*0.5,yscreen*0.02,xscreen*0.5,yscreen*0.02,0xFF000000,scaleX,"default-bold","center","center")
	else
		removeEventHandler("onClientHUDRender", getRootElement(), casinorobOnMarkerHitDXDraw)
		progress = 0
		triggerServerEvent("casinorobMarkerRobbed", getLocalPlayer())	
	end
end


function playSoundOfRob_func (dacasino)
	if robSound then
		stopSound(robSound)
	end
	robSound = playSound("sounds/klingel.mp3", true)
	setSoundVolume(robSound, 0.2)
	thecasino = dacasino
	setCasinoPreparation_func()
end
addEvent("playSoundOfRob", true)
addEventHandler("playSoundOfRob", getRootElement(), playSoundOfRob_func)

function stopSoundOfRob_func ()
	if robSound then
		stopSound(robSound)
		robSound = nil
	end
end
addEvent("stopSoundOfRob", true)
addEventHandler("stopSoundOfRob", getRootElement(), stopSoundOfRob_func)

addEvent("oeffneCasinoTresor", true)
addEventHandler("oeffneCasinoTresor", getRootElement(), function(casino)
	if casino == "caligulas" then
		destroyElement(caligulasTresor)
		caligulasTresor = createObject (2003, 2150.6000976563, 1595.1999511719, 1005.5999755859, 0, 0, 90)
		setElementInterior(caligulasTresor, 1)
	elseif casino == "four dragons" then
		destroyElement(fourdragonsTresor)
		fourdragonsTresor = createObject (2003, 1940.5999755859, 984.46002197266, 992)	
		setElementInterior(fourdragonsTresor, 10)
	elseif casino == "the casino" then
		destroyElement(thecasinoTresor)
		thecasinoTresor = createObject (2003, 1143.2600097656, -2.3900001049042, 1000.0999755859, 0, 0, 270)	
		setElementInterior(thecasinoTresor, 12)
	end
end)

addEvent("getCasinorobSpawnprotection", true)
addEventHandler("getCasinorobSpawnprotection", getRootElement(), function()
	removeEventHandler ( "onClientPlayerDamage", getLocalPlayer(), localPlayerCancelDamageInCasinoRob )
	removeEventHandler ( "onClientPlayerWeaponFire", getLocalPlayer(), stopLocalPlayerCancelDamageInCasinoRob )
	addEventHandler ( "onClientPlayerDamage", getLocalPlayer(), localPlayerCancelDamageInCasinoRob )
	addEventHandler ( "onClientPlayerWeaponFire", getLocalPlayer(), stopLocalPlayerCancelDamageInCasinoRob )
	if isTimer(spawnprotectiontimer) then killTimer(spawnprotectiontimer) end
	spawnprotectiontimer = setTimer (
		function ()
			removeEventHandler ( "onClientPlayerDamage", getLocalPlayer(), localPlayerCancelDamageInCasinoRob )
			removeEventHandler ( "onClientPlayerWeaponFire", getLocalPlayer(), stopLocalPlayerCancelDamageInCasinoRob )
		end,
	7000, 1 )
end)

function localPlayerCancelDamageInCasinoRob ()
	cancelEvent ()
end

function stopLocalPlayerCancelDamageInCasinoRob ()
	if isTimer(spawnprotectiontimer) then
		killTimer(spawnprotectiontimer) 
	end
	removeEventHandler ( "onClientPlayerDamage", getLocalPlayer(), localPlayerCancelDamageInCasinoRob )
	removeEventHandler ( "onClientPlayerWeaponFire", getLocalPlayer(), stopLocalPlayerCancelDamageInCasinoRob)
end


function setCasinorobPedAnimations (robbingit)
	if robbingit then
		if thecasino == "caligulas" then
			for i, ped in pairs (caligulasPed) do
				if i == 0 or i == 1 or i == 2 then
					setPedAnimation(ped, "shop", "SHP_HandsUp_Scr",-1,false,false,false)
				else
					setPedAnimation(ped, "ped", "cower",-1,false,false,false)
				end
			end
		elseif thecasino == "fourdragons" then
			for i, ped in pairs (fourdragonsPed) do
				if i == 0 or i == 1 or i == 2 then
					setPedAnimation(ped, "shop", "SHP_HandsUp_Scr",-1,false,false,false)
				else
					setPedAnimation(ped, "ped", "cower",-1,false,false,false)
				end
			end
		elseif thecasino == "thecasino" then
			for i, ped in pairs (thecasinoPed) do
				setPedAnimation(ped, "shop", "SHP_HandsUp_Scr",-1,false,false,false)
			end
		end
	else
		if thecasino == "caligulas" then
			for i, ped in pairs (caligulasPed) do
				setPedAnimation(ped)
			end
		elseif thecasino == "fourdragons" then
			for i, ped in pairs (caligulasPed) do
				setPedAnimation(ped)
			end
		elseif thecasino == "thecasino" then
			for i, ped in pairs (thecasinoPed) do
				setPedAnimation(ped)
			end
		end
	end
end


function casinorobIstZuende ()
	setCasinorobPedAnimations(false)
	stopLocalPlayerCancelDamageInCasinoRob()
	stopSoundOfRob_func()
	angezielt = false
	progress = 0
	setElementPosition (barMarkers["marker"][3], barMarkers["x"][3], barMarkers["y"][3], barMarkers["z"][3] )
	setElementPosition (barMarkers["marker"][4], barMarkers["x"][4], barMarkers["y"][4], barMarkers["z"][4] )
	setElementPosition (barMarkers["marker"][5], barMarkers["x"][5], barMarkers["y"][5], barMarkers["z"][5] )
	setElementPosition (barMarkers["marker"][6], barMarkers["x"][6], barMarkers["y"][6], barMarkers["z"][6] )
	setElementPosition (barMarkers["marker"][9], barMarkers["x"][9], barMarkers["y"][9], barMarkers["z"][9] )
	if isTimer(spawnprotectiontimer) then
		killTimer(spawnprotectiontimer)
	end
	spawnprotectiontimer = nil
	for i, marker in pairs (roulettMarker) do
		if roulettMarkerX[i] ~= nil then
			setElementPosition(roulettMarker[i], roulettMarkerX[i], roulettMarkerY[i], roulettMarkerZ[i])
			roulettMarkerX[i] = nil
			roulettMarkerY[i] = nil
			roulettMarkerZ[i] = nil
		end
	end
	for i, marker in pairs (blackJackMarker) do
		if blackJackMarkerX[i] ~= nil then
			setElementPosition(blackJackMarker[i], blackJackMarkerX[i], blackJackMarkerY[i], blackJackMarkerZ[i])
			blackJackMarkerX[i] = nil
			blackJackMarkerY[i] = nil
			blackJackMarkerZ[i] = nil
		end
	end
	for i, slots in pairs (slot) do
		if slotX[i] ~= nil then
			setElementPosition(slot[i]["Marker"], slotX[i], slotY[i], slotZ[i])
			slotX[i] = nil
			slotY[i] = nil
			slotZ[i] = nil
		end
	end
	if casino == "caligulas" then
		destroyElement(caligulasTresor)
		caligulasTresor = createObject (2332, 2150.6000976563, 1595.1999511719, 1005.5999755859, 0, 0, 90)
		setElementInterior(caligulasTresor, 1)
	elseif casino == "four dragons" then
		destroyElement(fourdragonsTresor)
		fourdragonsTresor = createObject (2332, 1940.5999755859, 984.46002197266, 992)	
		setElementInterior(fourdragonsTresor, 10)
	elseif casino == "the casino" then
		destroyElement(thecasinoTresor)
		thecasinoTresor = createObject (2332, 1143.2600097656, -2.3900001049042, 1000.0999755859, 0, 0, 270)	
		setElementInterior(thecasinoTresor, 12)
	end
	thecasino = nil
end
addEvent("casinorobistzuende", true)
addEventHandler("casinorobistzuende", getRootElement(), casinorobIstZuende)


addEvent ( "bindTargetCasino", true )
addEventHandler ( "bindTargetCasino", root, function ( bool )
	if bool == "true" then
		addEventHandler("onClientPlayerTarget", getRootElement(), whichCasinoGettingRobbed)
	else
		removeEventHandler("onClientPlayerTarget", getRootElement(), whichCasinoGettingRobbed)
	end
end )
	




