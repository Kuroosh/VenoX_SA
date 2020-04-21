local WarnungEnterATBasis = createColSphere ( 2441.3029, -2123.406005, 13.546875, 2 )
local EnterATBasis = createMarker ( 2443.6120, -2134.379, 16.2712249, "cylinder", 1.5, 139, 0, 0, 255 )
local ExitATBasis = createMarker ( -790.59997558594, 491.89999389648, 1370.8000488281, "cylinder", 1.5, 139, 0, 0, 255 )
	setElementInterior ( ExitATBasis, 1 )
local StartAT = createPickup ( -777.3912, 496.16735, 1368.530, 3, 1314 )
	setElementInterior ( StartAT, 1 )
local ATWand = createObject ( 2395, -779.29998779297, 499, 1367.5 )
	setElementInterior ( ATWand, 1 )
	setElementRotation ( ATWand, 0, 0, 180 )	
local AbgabeATBlip = createBlip ( 247.609375, 1420.5849609375, 10.567667007446, 19, 2, 255, 0, 0, 255, 0, 200 )
	setElementVisibleTo ( AbgabeATBlip, getRootElement(), false )
local AbgabeAT = createMarker ( 247.609375, 1420.5849609375, 9.567667007446, "cylinder", 3.5, 139, 0, 0, 255 )
	setElementVisibleTo ( AbgabeAT, getRootElement(), false )
	
-- Load Marker (Random)
local LoadATBlip1 = createBlip ( 1346.171875, 344.609375, 18.985010147095, 19, 2, 255, 0, 0, 255, 0, 200 )
	setElementVisibleTo ( LoadATBlip1, getRootElement(), false )
local LoadATBlip2 = createBlip ( -201.451171875, -227.859375, 1.421875, 19, 2, 255, 0, 0, 255, 0, 200 )
	setElementVisibleTo ( LoadATBlip2, getRootElement(), false )
local LoadATBlip3 = createBlip ( -1021.955078125, -670.7421875, 32.0078125, 19, 2, 255, 0, 0, 255, 0, 200 )
	setElementVisibleTo ( LoadATBlip3, getRootElement(), false )
local LoadATBlip4 = createBlip ( 1010, 344, 18.7, 19, 2, 255, 0, 0, 255, 0, 200 )
	setElementVisibleTo ( LoadATBlip4, getRootElement(), false )

local LoadAT1 = createMarker ( 1346.171875, 344.609375, 18.7, "cylinder", 3.5, 139, 0, 0, 255 )
	setElementVisibleTo ( LoadAT1, getRootElement(), false )
local LoadAT2 = createMarker ( -201.451171875, -227.859375, 0.421875, "cylinder", 3.5, 139, 0, 0, 255 )
	setElementVisibleTo ( LoadAT2, getRootElement(), false )
local LoadAT3 = createMarker ( -1021.955078125, -670.7421875, 32.0078125, "cylinder", 3.5, 139, 0, 0, 255 )
	setElementVisibleTo ( LoadAT3, getRootElement(), false )
local LoadAT4 = createMarker ( 1010, 344, 17.7, "cylinder", 3.5, 139, 0, 0, 255 )
	setElementVisibleTo ( LoadAT4, getRootElement(), false )

local ATKaution = 12000 
local ATFBankMoney = 30000
local ATGewinn = 10500 
	
-- Nicht ändern!	
local loadATCheck1 = false
local loadATCheck2 = false
local loadATCheck3 = false
local loadATCheck4 = false
local AbgabeATCheck = false
local ATStartable = true
local ATRunning = false
local destroyedBYFunction = false
local driverScript = nil
local ATTruck = nil
local ATTrailer = nil
local destroytimer = nil


function WarnPlayer ( player )
	if isOnDuty(player) then
		outputChatBox ("Willkommen an der AT-Geheim Basis!", player, 0, 255, 0)
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "Zutritt verwehrt!\nWeiteres Betreten \nverboten!", 3500, 125, 0, 0 )
	end
end
addEventHandler ( "onColShapeHit", WarnungEnterATBasis, WarnPlayer )


function ATBasis ( player )
	if not getPedOccupiedVehicle ( player ) then
		if isOnDuty(player) then
			setElementPosition ( player, -780.2607421875, 492.7265625, 1368.5748291016 )
			setElementInterior ( player, 1 )
			setElementRotation ( player, 0, 0, -360 )
		else
			local oldwanted = getPlayerWantedLevel ( player )
			if oldwanted <= 4 then
				outputChatBox ( "Du bist kein Staatsfraktionist!", player, 125, 0, 0 )
				setElementPosition ( player, 2441.9123, -2121.296, 13.54 )
				setElementRotation ( player, 0, 0, 0 )
			elseif oldwanted == 5 then
				outputChatBox ( "Du bist kein Staatsfraktionist!", player, 125, 0, 0 )
				setElementPosition ( player, 2441.9123, -2121.296, 13.54 )
				setElementRotation ( player, 0, 0, 0 )
			else
				setElementPosition ( player, 2441.9123, -2121.296, 13.54 )
				setElementRotation ( player, 0, 0, 0 )
				outputChatBox ( "Du bist kein Staatsfraktionist!", player, 125, 0, 0 )
				outputChatBox ( "Einbruchversuch in einen gesperrten Bereich ist untersagt!", player, 125, 0, 0 )
			end
		end
	end	
end
addEventHandler ( "onMarkerHit", EnterATBasis, ATBasis )


function ExitATBasis_func ( player )
	setElementInterior ( player, 0 )
	setElementPosition ( player, 2441.9123, -2121.296, 13.54 )
	setElementRotation ( player, 0, 0, 0 )
end
addEventHandler ( "onMarkerHit", ExitATBasis, ExitATBasis_func )


function StartAT_func ( player )
	triggerClientEvent ( player, "infobox_start", getRootElement(), "Tippe /atrans\nUm den \nAtom-Transport\nzu starten!", 3500, 125, 0, 0 )
	cancelEvent()
end
addEventHandler ( "onPickupHit", StartAT, StartAT_func )


function StartATCMD_func ( player )
	local x, y, z = getElementPosition ( player )
	local rx, ry, rz = getElementRotation ( player )
	local money = vnxGetElementData ( player, "money" )	
	driverScript = player
	local driverCheck = getPlayerName ( player )
	if getDistanceBetweenPoints3D ( -777.3912, 496.16735, 1368.530, x, y, z ) < 2 then
		if not aktionlaeuft then
			if ( ATStartable ) then
				if not ( ATRunning ) then
					if isOnDuty(player) then
						if getRealTime().hour >= 12 then
							if money >= ATKaution then
								if getFactionMembersOnline ( 1 ) + getFactionMembersOnline ( 6 ) + getFactionMembersOnline ( 8 ) < 2 then
									infobox ( player, "Nicht genug\nStaatsfraktionisten online!", 5000, 150, 0, 0 )
									return
								end
								vnxSetElementData ( player, "money", money - ATKaution )
								ATTruck = createVehicle ( 515, 2545.5009765625, -2117.2802734375, 14.5575923919680, 0, 0, 90, "ATOM" )
								setVehicleColor ( ATTruck, 0, 0, 0 )
								setElementHealth ( ATTruck, 2000 )
								outputLog ( "Atomtruck - "..getPlayerName(player).." - "..fraktionNames[vnxGetElementData ( player, "fraktion")], "aktion" )
								addEventHandler ( "onVehicleExplode", ATTruck, destroyAT_func )
								ATTrailer = createVehicle ( 591, 2555.736328125, -2117.27734375, 14.580474853516, 0, 0, 90 )
								setVehicleColor ( ATTrailer, 0, 0, 0 )
								attachTrailerToVehicle ( ATTruck, ATTrailer)
								setElementInterior ( player, 0 )
								warpPedIntoVehicle ( player, ATTruck )
								destroytimer = setTimer ( destroyATsetTrue_func, 20 * 60 * 1000, 1 ) -- 1200000
								ATRunning = true
								outputChatBox ( "Du hast einen Atom-Transport gestartet! Fahre den Truck so schnell wie möglich zum Beladen! Du hast 20 Minuten Zeit!", driverScript, 0, 125, 0 )
								local msgS = ""..driverCheck.." hat einen Atom-Transport gestartet! Eskortiert diesen zum Beladepunkt und dann zum Abgabepunkt!"
								local msgB = "Es wurde ein Atom-Transport beladen! Haltet diesen auf bevor dieser Abgegeben wird!"
											
								sendMSGForFaction ( msgS, 1, 0, 0, 200 )
								sendMSGForFaction ( msgS, 6, 0, 0, 200 )
								sendMSGForFaction ( msgS, 8, 0, 0, 200 )
											
								sendMSGForFaction ( msgB, 2, 0, 0, 200 )
								sendMSGForFaction ( msgB, 3, 0, 0, 200 )
								sendMSGForFaction ( msgB, 4, 0, 0, 200 )
								sendMSGForFaction ( msgB, 7, 0, 0, 200 )
								sendMSGForFaction ( msgB, 9, 0, 0, 200 )
								sendMSGForFaction ( msgB, 12, 0, 0, 200 )
								sendMSGForFaction ( msgB, 13, 0, 0, 200 )
											
								randomMarker = math.random ( 4 )
								if ( randomMarker == 1 ) then
									-- loadMarker 1
									loadATCheck1 = true
									setElementVisibleTo ( LoadAT1, root, true )
									setElementVisibleTo ( LoadATBlip1, root, true )
											
								elseif ( randomMarker == 2 ) then
									-- loadMarker 2
									loadATCheck2 = true
									setElementVisibleTo ( LoadAT2, root, true )
									setElementVisibleTo ( LoadATBlip2, root, true )
											
								elseif ( randomMarker == 3 ) then
									-- loadMarker 3
									loadATCheck3 = true
									setElementVisibleTo ( LoadAT3, root, true )
									setElementVisibleTo ( LoadATBlip3, root, true )
											
								elseif ( randomMarker == 4 ) then
									-- loadMarker 4
									loadATCheck4 = true
									setElementVisibleTo ( LoadAT4, root, true )
									setElementVisibleTo ( LoadATBlip4, root, true )
								end
							else
								outputChatBox ("Du hast nicht genügend Geld dabei! Du brauchst "..ATKaution.."$", player, 255, 0, 0) -- Debug
							end
						else
							outputChatBox ("Dafür ist es zu früh", player, 255, 0, 0) -- Debug
						end
					else
						outputChatBox ("Du bist kein Polizist im Dienst!", player, 255, 0, 0) -- Debug
					end
				else
					outputChatBox ( "Es kann immer nur ein Atom-Transport gestartet werden!", player, 255, 0, 0 )
				end
			else
				outputChatBox ( "Es wurde heute erst ein Atom-Transport gestartet! Bitte warte bis morgen!", player, 255, 0, 0 )
			end
		else
			outputChatBox ( "Es läuft schon eine Aktion!!", player, 255, 0, 0 )
		end
	end
end


function LoadAT1_func ( hitelement )
	if getElementType( hitelement ) == "vehicle" then
		local veh = hitelement
		if ( hitElement == AtomTransporter ) then
			if loadATCheck1 then
				loadATCheck1 = false
				AbgabeATCheck = true
				setElementVisibleTo ( AbgabeAT, root, true )
				setElementVisibleTo ( AbgabeATBlip, root, true )
				clearElementVisibleTo ( LoadATBlip1 )
				clearElementVisibleTo ( LoadAT1 )
				setElementVisibleTo ( LoadATBlip1, root, false )
				setElementVisibleTo ( LoadAT1, root, false )
				outputChatBox ( "Der Atom-Transporter wurde beladen! Fahre ihn nun zum Ziel", driverScript, 0, 125, 0 )
						
				local msgS = "Der Atom-Transporter wurde beladen! Eskortiert diesen jetzt zum Abladepunkt!"
				local msgB = "Der Atom-Transporter wurde beladen! Ihr müsst euch beilen, der Transporter wird bald abgegeben!"
				sendMSGForFaction ( msgS, 1, 200, 0, 0 )
				sendMSGForFaction ( msgS, 6, 200, 0, 0 )
				sendMSGForFaction ( msgS, 8, 200, 0, 0 )
							
				sendMSGForFaction ( msgB, 2, 0, 0, 200 )
				sendMSGForFaction ( msgB, 3, 0, 0, 200 )
				sendMSGForFaction ( msgB, 4, 0, 0, 200 )
				sendMSGForFaction ( msgB, 7, 0, 0, 200 )
				sendMSGForFaction ( msgB, 9, 0, 0, 200 )
				sendMSGForFaction ( msgB, 12, 0, 0, 200 )
				sendMSGForFaction ( msgB, 13, 0, 0, 200 )
			end
		end
	end
end
addEventHandler ( "onMarkerHit", LoadAT1, LoadAT1_func )


function LoadAT2_func ( hitelement )
	if getElementType( hitelement ) == "vehicle" then
		local veh = hitelement
		if ( hitElement == AtomTransporter ) then
			if loadATCheck2 then
				loadATCheck2 = false
				AbgabeATCheck = true
				setElementVisibleTo ( AbgabeAT, root, true )
				setElementVisibleTo ( AbgabeATBlip, root, true )
				clearElementVisibleTo ( LoadATBlip2 )
				clearElementVisibleTo ( LoadAT2 )
				setElementVisibleTo ( LoadATBlip2, root, false )
				setElementVisibleTo ( LoadAT2, root, false )
				outputChatBox ( "Der Atom-Transporter wurde beladen! Fahre ihn nun zum Ziel", driverScript, 0, 125, 0 )
							
				local msgS = "Der Atom-Transporter wurde beladen! Eskortiert diesen jetzt zum Abladepunkt!"
				local msgB = "Der Atom-Transporter wurde beladen! Ihr müsst euch beilen, der Transporter wird bald abgegeben!"
				sendMSGForFaction ( msgS, 1, 200, 0, 0 )
				sendMSGForFaction ( msgS, 6, 200, 0, 0 )
				sendMSGForFaction ( msgS, 8, 200, 0, 0 )
						
				sendMSGForFaction ( msgB, 2, 0, 0, 200 )
				sendMSGForFaction ( msgB, 3, 0, 0, 200 )
				sendMSGForFaction ( msgB, 4, 0, 0, 200 )
				sendMSGForFaction ( msgB, 7, 0, 0, 200 )
				sendMSGForFaction ( msgB, 9, 0, 0, 200 )
				sendMSGForFaction ( msgB, 12, 0, 0, 200 )
				sendMSGForFaction ( msgB, 13, 0, 0, 200 )
			end
		end
	end
end
addEventHandler ( "onMarkerHit", LoadAT2, LoadAT2_func )


function LoadAT3_func ( hitelement )
	if getElementType( hitelement ) == "vehicle" then
		local veh = hitelement
		if ( hitElement == AtomTransporter ) then
			if loadATCheck3 then
				loadATCheck3 = false
				AbgabeATCheck = true
				setElementVisibleTo ( AbgabeAT, root, true )
				setElementVisibleTo ( AbgabeATBlip, root, true )
				clearElementVisibleTo ( LoadATBlip3 )
				clearElementVisibleTo ( LoadAT3 )
				setElementVisibleTo ( LoadATBlip3, root, false )
				setElementVisibleTo ( LoadAT3, root, false )
				outputChatBox ( "Der Atom-Transporter wurde beladen! Fahre ihn nun zum Ziel", driverScript, 0, 125, 0 )
	
				local msgS = "Der Atom-Transporter wurde beladen! Eskortiert diesen jetzt zum Abladepunkt!"
				local msgB = "Der Atom-Transporter wurde beladen! Ihr müsst euch beilen, der Transporter wird bald abgegeben!"
				sendMSGForFaction ( msgS, 1, 200, 0, 0 )
				sendMSGForFaction ( msgS, 6, 200, 0, 0 )
				sendMSGForFaction ( msgS, 8, 200, 0, 0 )
									
				sendMSGForFaction ( msgB, 2, 0, 0, 200 )
				sendMSGForFaction ( msgB, 3, 0, 0, 200 )
				sendMSGForFaction ( msgB, 4, 0, 0, 200 )
				sendMSGForFaction ( msgB, 7, 0, 0, 200 )
				sendMSGForFaction ( msgB, 9, 0, 0, 200 )
				sendMSGForFaction ( msgB, 12, 0, 0, 200 )
				sendMSGForFaction ( msgB, 13, 0, 0, 200 )
			end
		end
	end
end
addEventHandler ( "onMarkerHit", LoadAT3, LoadAT3_func )


function LoadAT4_func ( hitelement )
	if getElementType( hitelement ) == "vehicle" then
		local veh = hitelement
		if ( hitElement == AtomTransporter ) then
			if loadATCheck4 then
				loadATCheck4 = false
				AbgabeATCheck = true
				setElementVisibleTo ( AbgabeAT, root, true )
				setElementVisibleTo ( AbgabeATBlip, root, true )
				clearElementVisibleTo ( LoadATBlip4 )
				clearElementVisibleTo ( LoadAT4 )
				setElementVisibleTo ( LoadATBlip4, root, false )
				setElementVisibleTo ( LoadAT4, root, false )
				outputChatBox ( "Der Atom-Transporter wurde beladen! Fahre ihn nun zum Ziel", driverScript, 0, 125, 0 )
					
				local msgS = "Der Atom-Transporter wurde beladen! Eskortiert diesen jetzt zum Abladepunkt!"
				local msgB = "Der Atom-Transporter wurde beladen! Ihr müsst euch beilen, der Transporter wird bald abgegeben!"
				sendMSGForFaction ( msgS, 1, 200, 0, 0 )
				sendMSGForFaction ( msgS, 6, 200, 0, 0 )
				sendMSGForFaction ( msgS, 8, 200, 0, 0 )
									
				sendMSGForFaction ( msgB, 2, 0, 0, 200 )
				sendMSGForFaction ( msgB, 3, 0, 0, 200 )
				sendMSGForFaction ( msgB, 4, 0, 0, 200 )
				sendMSGForFaction ( msgB, 7, 0, 0, 200 )
				sendMSGForFaction ( msgB, 9, 0, 0, 200 )
				sendMSGForFaction ( msgB, 12, 0, 0, 200 )
				sendMSGForFaction ( msgB, 13, 0, 0, 200 )
			end
		end
	end
end
addEventHandler ( "onMarkerHit", LoadAT4, LoadAT4_func )


function finishAT_func ( hitelement )
	if getElementType( hitelement ) == "vehicle" then
		local veh = hitelement
		local money = vnxGetElementData ( driverScript, "money" )
		if ( hitElement == AtomTransporter ) then
			if AbgabeATCheck then
				loadATCheck1 = false
				loadATCheck2 = false
				loadATCheck3 = false
				loadATCheck4 = false
				AbgabeATCheck = false
				clearElementVisibleTo ( AbgabeAT )
				clearElementVisibleTo ( AbgabeATBlip )
				setElementVisibleTo ( AbgabeAT, root, false )
				setElementVisibleTo ( AbgabeATBlip, root, false )
				setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1 )
				killTimer ( destroytimer )
				ATStartable = false
				ATRunning = false
				destroyElement ( ATTruck )
				destroyElement ( ATTrailer )
				vnxSetElementData ( driverScript, "money", money + ATKaution )
				factionDepotData["money"][1] = factionDepotData["money"][1] + ATKaution + ATFBankMoney
				local ATFBank = ATKaution + ATFBankMoney
				
				outputChatBox ("Du hast den Atom-Transporter erfoglreich abgegeben! Die Staatsfraktions Bank erhält einen kleinen Bonus!", driverScript, 0, 125, 0)
				outputChatBox ("Es wurden auf die Staatsfraktions Bank "..ATFBank.."$ ünerwiesen!", driverScript, 0, 125, 0)
					
				local msgS = ""..getPlayerName(driverScript).." hat den Atom-Transporter erfoglreich abgeliefert! Eure Staatsfraktion's Bank erhält einen Bonus von "..ATFBank.."$"
				local msgB = "Der Atom-Transporter wurde abgegeben! Das nächstemal müsst ihr euch mehr anstengen!"
						
				sendMSGForFaction ( msgS, 1, 200, 0, 0 )
				sendMSGForFaction ( msgS, 6, 200, 0, 0 )
				sendMSGForFaction ( msgS, 8, 200, 0, 0 )
									
				sendMSGForFaction ( msgB, 2, 0, 0, 200 )
				sendMSGForFaction ( msgB, 3, 0, 0, 200 )
				sendMSGForFaction ( msgB, 4, 0, 0, 200 )
				sendMSGForFaction ( msgB, 7, 0, 0, 200 )
				sendMSGForFaction ( msgB, 9, 0, 0, 200 )
				sendMSGForFaction ( msgB, 12, 0, 0, 200 )
				sendMSGForFaction ( msgB, 13, 0, 0, 200 )								
			end
		end
	end	
end


function destroyATsetTrue_func ()
	destroyedBYFunction = true
	destroyAT_func()
end
	
	
function destroyAT_func ()	
	clearElementVisibleTo ( LoadAT1 )
	clearElementVisibleTo ( LoadATBlip1 )
	clearElementVisibleTo ( LoadAT2 )
	clearElementVisibleTo ( LoadATBlip2 )
	clearElementVisibleTo ( LoadAT3 )
	clearElementVisibleTo ( LoadATBlip3 )
	clearElementVisibleTo ( LoadAT4 )
	clearElementVisibleTo ( LoadATBlip4 )
	setElementVisibleTo ( LoadAT1, root, false )
	setElementVisibleTo ( LoadAT2, root, false )
	setElementVisibleTo ( LoadAT3, root, false )
	setElementVisibleTo ( LoadAT4, root, false )
	setElementVisibleTo ( LoadATBlip1, root, false )
	setElementVisibleTo ( LoadATBlip2, root, false )
	setElementVisibleTo ( LoadATBlip3, root, false )
	setElementVisibleTo ( LoadATBlip4, root, false )
					
	clearElementVisibleTo ( AbgabeAT )
	clearElementVisibleTo ( AbgabeATBlip )
		
	setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1 )
	
	removeEventHandler ( "onVehicleExplode", ATTruck, destroyAT_func )
	
	if isTimer ( destroytimer )	then
		killTimer ( destroytimer )
	end
	
	ATStartable = false
	ATRunning = false		
	
	if destroyedBYFunction then
		outputChatBox ("Okay!", driverScript, 255, 0, 0)
		destroyedBYFunction = false
		destroyElement ( ATTruck )
		destroyElement ( ATTrailer )
	else
		local tX, tY, tZ = getElementPosition ( ATTruck )
		createExplosion ( tX + 1, tY, tZ, 1 )
		createExplosion ( tX - 1, tY, tZ, 1 )
		createExplosion ( tX, tY + 1, tZ, 1 )
		createExplosion ( tX, tY - 1, tZ, 1 )
		createExplosion ( tX + 1, tY, tZ, 6 )
		createExplosion ( tX - 1, tY, tZ, 6 )
		createExplosion ( tX, tY + 1, tZ, 6 )
		createExplosion ( tX, tY - 1, tZ, 6 )
		createExplosion ( tX, tY, tZ, 1 )
		createExplosion ( tX, tY, tZ, 6 )
		destroyElement ( ATTruck )
		destroyElement ( ATTrailer )
			
		-- Die Explosion ist überhaupt nicht übertrieben ^^ :D	
		
		local msgB = "Herzlichen Glückwunsch! Ihr habt den Atom-Transporter zerstört! Euer Gewinn ("..ATGewinn.."$) wurde eurer Frakikasse gutgeschrieben!"
		
		sendMSGForFaction ( msgB, 2, 0, 200, 0 )
		sendMSGForFaction ( msgB, 3, 0, 200, 0 )
		sendMSGForFaction ( msgB, 4, 0, 200, 0 )
		sendMSGForFaction ( msgB, 7, 0, 200, 0 )
		sendMSGForFaction ( msgB, 9, 0, 200, 0 )
		sendMSGForFaction ( msgB, 12, 0, 200, 0 )
		sendMSGForFaction ( msgB, 13, 0, 200, 0 )
			
		factionDepotData["money"][2] = factionDepotData["money"][2] + ATGewinn
		factionDepotData["money"][3] = factionDepotData["money"][3] + ATGewinn
		factionDepotData["money"][4] = factionDepotData["money"][4] + ATGewinn
		factionDepotData["money"][7] = factionDepotData["money"][7] + ATGewinn
		factionDepotData["money"][9] = factionDepotData["money"][9] + ATGewinn
		factionDepotData["money"][12] = factionDepotData["money"][12] + ATGewinn
		factionDepotData["money"][13] = factionDepotData["money"][13] + ATGewinn
		
		local msgS = "Der Atom-Transporter wurde zersört! Das nächstemal müsst ihr bessere Arbeit leisten!"
		
		sendMSGForFaction ( msgS, 1, 200, 0, 0 )
		sendMSGForFaction ( msgS, 6, 200, 0, 0 )
		sendMSGForFaction ( msgS, 8, 200, 0, 0 )
	end
end
	
	
function resetAT ()
	local time = getRealTime()
	local hour = time.hour
	local minute = time.minute

		if ( time.hour + 1 == 12 and time.minute == 0 ) then 
			loadATCheck1 = false
			loadATCheck2 = false
			loadATCheck3 = false
			loadATCheck4 = false
			AbgabeATCheck = false
			ATStartable = true
			killTimer ( checkTime )
		elseif not isTimer ( checkTime ) then
			checkTime = setTimer ( resetAT, 3600000, 1 )
		end
	end
	
	
	
function destroyATAdmin_func ( player, cmd, ... ) -- Admin Befehl
		if ( vnxGetElementData ( player, "adminlvl" ) >= 3 ) then
			local parametersTable = {...}
			local stringWithAllParameters = table.concat( parametersTable, " " )
			
			if stringWithAllParameters == nil then
				outputChatBox ("Bitte einen Grund angeben!", player, 125, 0, 0 )
			elseif stringWithAllParameters == "" or stringWithAllParameters == " " or stringWithAllParameters == "  " then
				outputChatBox ("Bitte einen Grund angeben!", player, 125, 0, 0 )
			else
				if ( ATRunning == true ) then
					local admin = getPlayerName ( player )
					local money = vnxGetElementData ( driverScript, "money" )
						vnxSetElementData ( ATTruck, "Atom", false )
						destroyElement ( ATTruck )
						destroyElement ( ATTrailer )
						vnxSetElementData ( driverScript, "money", money + ATKaution )
						
							clearElementVisibleTo ( LoadAT1 )
							clearElementVisibleTo ( LoadATBlip1 )
							clearElementVisibleTo ( LoadAT2 )
							clearElementVisibleTo ( LoadATBlip2 )
							clearElementVisibleTo ( LoadAT3 )
							clearElementVisibleTo ( LoadATBlip3 )
							clearElementVisibleTo ( LoadAT4 )
							clearElementVisibleTo ( LoadATBlip4 )						
						
						clearElementVisibleTo ( AbgabeAT )
						clearElementVisibleTo ( AbgabeATBlip )
						setTimer ( resetAT, 50, 1 )
							
						if isTimer ( destroytimer )	then
							killTimer ( destroytimer )
						end
							ATStartable = false
							ATRunning = false
					outputChatBox ( "Dein AT wurde von dem Admin "..admin.." aus folgendem Grund zerstört!", driverScript, 255, 0, 0 )
					outputChatBox ( "Grund: "..stringWithAllParameters, driverScript, 255, 0, 0 )
					
					local msg = "Der AT von "..getPlayerName( driverScript ).." wurde von dem Admin "..admin.." zerstört!" 
					
					sendMSGForFaction ( msg, 1, 0, 0, 200 )
					sendMSGForFaction ( msg, 6, 0, 0, 200 )
					sendMSGForFaction ( msg, 8, 0, 0, 200 )			
					sendMSGForFaction ( msg, 2, 0, 0, 200 )
					sendMSGForFaction ( msg, 3, 0, 0, 200 )
					sendMSGForFaction ( msg, 4, 0, 0, 200 )
					sendMSGForFaction ( msg, 7, 0, 0, 200 )
					sendMSGForFaction ( msg, 9, 0, 0, 200 )
					sendMSGForFaction ( msg, 10, 0, 0, 200 )
					outputAdminLog ( admin.." hat den AT von "..getPlayerName( driverScript ).." zerstört! Grund: "..stringWithAllParameters.."") --Datum: "..monthday.."."..month.."."..year.." Uhrzeit:" ..hour..":"..minute.."" )
				else
					outputChatBox ( "Es findet derzeit kein AT statt!", player, 255, 0, 0 )
				end
			end
		else
			outputChatBox ( "Dazu bist du nicht berechtigt!", player, 255, 0, 0 )
		end
	end

addCommandHandler ( "atrans", StartATCMD_func )
addCommandHandler ( "desat", destroyATAdmin_func )
addEventHandler ( "onMarkerHit", AbgabeAT, finishAT_func )

-------------------------