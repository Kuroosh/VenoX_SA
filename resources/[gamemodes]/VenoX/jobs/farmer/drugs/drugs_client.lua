-------------------------
------- (c) 2010 --------
------- by Zipper -------
-- and Vio MTA:RL Crew --
-------------------------

function boatfix ()

	--setElementCollisionsEnabled ( drugboat, false )
end
addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), boatfix )

function createDrugJobMarker_func()

	drugJobMarker = createMarker ( -1862.1405029297, -144.07493591309, 10.876323699951, "cylinder", 3, getColorFromString ( "#FF000099" ) )
end
addEvent ( "createDrugJobMarker", true )
addEventHandler ( "createDrugJobMarker", getRootElement(), createDrugJobMarker_func )

function destroyDrugJobMarker_func()

	destroyElement ( drugJobMarker )
	destroyElement ( drugJobPlaneMarker )
	destroyElement ( drugSFPDBlip )
	destroyElement ( drugSFPDMarker )
	destroyElement ( drugPlaneMarker )
end
addEvent ( "destroyDrugJobMarker", true )
addEventHandler ( "destroyDrugJobMarker", getRootElement(), destroyDrugJobMarker_func )

function hitDrugJobMarker_func ( player )

	if getPedOccupiedVehicle ( player ) == false then
		if source == drugJobMarker then
			if player == getLocalPlayer() then
				if tonumber ( vnxClientGetElementData ( "jobtime" ) ) == 0 then
					destroyDrugJobMarker_func()
					rnd = math.random( 1, 2 ) -- 1 = Flugzeug, 2 = Bootcheckpoints, 3 = SFPD, 4 = Autos, 5 = Tauchen
					if rnd == 1 then
						planeDrugRoute()
						drugJobPlaneMarker = createBlip ( -2301.7600097656, -2804.5095214844, 14.660495758057, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() )
					elseif rnd == 2 then
						sfpdDrugRoute()
						curjob = "sfpd"
					elseif rnd == 3 then
						outputChatBox ( "Route 3 - Coming soon!" )
					elseif rnd == 4 then
						outputChatBox ( "Route 4 - Coming soon!" )
					else
						outputChatBox ( "Route 5 - Coming soon!" )
					end
				else
					infobox_start_func("Du musst noch\n"..vnxClientGetElementData ( "jobtime").." Minuten\nwarten, bevor du\ndie naechste Tour\nmachen kannst!", 7500, 125, 0, 0 )
				end
			end
		end
		if source == drugPlaneMarker and player == getLocalPlayer() then
			setTimer ( drugsFoundClient, 3000, 1 )
			toggleAllControls ( false, true, false )
		end
		if source == drugSFPDMarker and player == getLocalPlayer() then
			setTimer ( SFPDdrugsFoundClient, 3000, 1 )
			toggleAllControls ( false, true, false )
		end
	end
end
addEventHandler ( "onClientMarkerHit", getRootElement(), hitDrugJobMarker_func )

function sfpdDrugRoute()

	infobox_start_func("Einem Informanten zu\nfolge wurde vom\nSFPD eine große\nMenge Drogen\nbeschlagnahmt.", 7500, 125, 0, 0 )
	drugSFPDBlip = createBlip ( -1605.7623291016, 711.326171875, 14, 0, 2, 255, 0, 0, 255, 0, 99999.0, getLocalPlayer() )
	drugSFPDMarker = createMarker ( 223.98358154297, 127.49185180664, 1009.2152099609, "cylinder", 1, getColorFromString ( "#00ff0099" ) )
	setElementInterior ( drugSFPDMarker, 10 )
end

function drugsFoundClient ()

	rnd = math.random ( 1, 6 )
	destroyDrugJobMarker_func()
	if rnd == 1 or rnd == 2 or rnd == 3 then
		drugsfound = math.random ( 10, 20 )
		infobox_start_func("\nDu hast soeben\n"..drugsfound.." Gramm Drogen\ngefunden!", 7500, 0, 125, 0 )
	elseif rnd == 4 then
		drugsfound = math.random ( 3, 7 )
		infobox_start_func("Der Beutel ist\nvoellig zerfetzt -\nDu hast nur \nnoch "..drugsfound.." Gramm Drogen\nretten koennen!", 7500, 200, 200, 0 )
	elseif rnd == 5 then
		infobox_start_func("Es ist eine\nFalle - Die Cops\nhaben dich\nbeobachtet!", 7500, 125, 0, 0 )
		drugsfound = "cops"
	else
		infobox_start_func("Der Tank des\nFlugzeugs ist in\nFlammen aufgegangen\n- RENN!!!", 7500, 125, 0, 0 )
		createFire ( -2301.7600097656, -2804.5095214844, 14.660495758057, 3 )
		drugsfound = "boom"
	end
	toggleAllControls ( true )
	createDrugJobMarker_func()
	triggerServerEvent ( "drugRecieve", getLocalPlayer(), drugsfound )
end

function SFPDdrugsFoundClient ()

	rnd = math.random ( 1, 5 )
	destroyDrugJobMarker_func()
	if rnd == 1 or rnd == 2 then
		drugsfound = math.random ( 10, 20 )
		infobox_start_func("\nDu hast soeben\n"..drugsfound.." Gramm Drogen\ngefunden!", 7500, 0, 125, 0 )
	elseif rnd == 3 then
		drugsfound = math.random ( 3, 7 )
		infobox_start_func("Der Beutel ist\nvoellig zerfetzt -\nDu hast nur \nnoch "..drugsfound.." Gramm Drogen\nretten koennen!", 7500, 200, 200, 0 )
	elseif rnd == 4 then
		infobox_start_func("Es ist eine\nFalle - Die Cops\nhaben dich\nbeobachtet!", 7500, 125, 0, 0 )
		drugsfound = "cops"
	else
		infobox_start_func("\nOffenbar war jemand\nvor dir da -\nalle Drogen sind\nschon weg!", 7500, 125, 0, 0 )
		createFire ( -2301.7600097656, -2804.5095214844, 14.660495758057, 3 )
		drugsfound = "nil"
	end
	toggleAllControls ( true )
	createDrugJobMarker_func()
	triggerServerEvent ( "drugRecieve", getLocalPlayer(), drugsfound )
end

function planeDrugRoute ()

	infobox_start_func("Einem Informanten zu\nfolge ist im\nCounty ein Flug-\nzeug abestuertzt.\nBerge die Drogen!", 7500, 125, 0, 0 )
	drugPlaneMarker = createMarker ( -2311.2800292969, -2804.0612792969, 11.192306518555, "cylinder", 2, getColorFromString ( "#00ff0099" ) )
end

function SFPDEnterClient_func ()

	if drugSFPDBlip then
		infobox_start_func("\nDie Drogen befinden\nsich im oberen\nStockwerk!", 7500, 125, 0, 0 )
		destroyElement ( drugSFPDBlip )
	end
end
addEvent ( "SFPDEnterClient", true )
addEventHandler ( "SFPDEnterClient", getRootElement(), SFPDEnterClient_func )