rubbishCount = 8
-- Models
	-- Müll für Stufe 1 ( Zu Fuß )
	rubbish = {}
	 rubbish[1] = 2749
	 rubbish[2] = 926
	 rubbish[3] = 1264
	 rubbish[4] = 1357
	 rubbish[5] = 1484
	 rubbish[6] = 2953
	 rubbish[7] = 1582
	 rubbish[8] = 1455

	-- Müll für Stufe 2 ( Sweeper )
	streetRubbish = {}
	 streetRubbish[1] = 18100
	 streetRubbish[2] = 2675
	 streetRubbish[3] = 2670
	 streetRubbish[4] = 2673
	 streetRubbish[5] = 2674
	 streetRubbish[6] = 2672
	 streetRubbish[7] = 2671

	-- Müll für Stufe 3 ( Trashmaster )
	trashBins = {}
	 trashBins[1] = 1372
	 trashBins[2] = 1332
	 trashBins[3] = 1333
	 trashBins[4] = 1334

-- Koordinaten
	-- Zu Fuß
	trashKoords = {}
	 trashKoords["x"] = {}
	 trashKoords["y"] = {}
	 trashKoords["z"] = {}
	  curCount = 1
	  trashKoords["x"][curCount], trashKoords["y"][curCount], trashKoords["z"][curCount] = -1874.7779541016, -1637.9874267578, 21.436069488525
	  curCount = curCount + 1
	  trashKoords["x"][curCount], trashKoords["y"][curCount], trashKoords["z"][curCount] = -1870.8054199219, -1672.2993164063, 28.596586227417
	  curCount = curCount + 1
	  trashKoords["x"][curCount], trashKoords["y"][curCount], trashKoords["z"][curCount] = -1837.0181884766, -1671.798828125, 21.399225234985
	  curCount = curCount + 1
	  trashKoords["x"][curCount], trashKoords["y"][curCount], trashKoords["z"][curCount] = -1854.4360351563, -1680.9812011719, 21.436069488525
	  curCount = curCount + 1
	  trashKoords["x"][curCount], trashKoords["y"][curCount], trashKoords["z"][curCount] = -1829.3811035156, -1650.5344238281, 21.399225234985
	  curCount = curCount + 1
	  trashKoords["x"][curCount], trashKoords["y"][curCount], trashKoords["z"][curCount] = -1891.5842285156, -1646.0185546875, 21.399225234985
	  curCount = curCount + 1
	  trashKoords["x"][curCount], trashKoords["y"][curCount], trashKoords["z"][curCount] = -1809.2377929688, -1663.5531005859, 23.360162734985
	  curCount = curCount + 1
	  trashKoords["x"][curCount], trashKoords["y"][curCount], trashKoords["z"][curCount] = -1810.0999755859, -1633.2895507813, 22.664850234985
	  curCount = curCount + 1
	  trashKoords["x"][curCount], trashKoords["y"][curCount], trashKoords["z"][curCount] = -1907.529296875, -1636.2115478516, 21.399225234985
	  curCount = curCount + 1
	  trashKoords["x"][curCount], trashKoords["y"][curCount], trashKoords["z"][curCount] = -1841.1442871094, -1645.0932617188, 21.399225234985
	  curCount = curCount + 1
	  trashKoords["x"][curCount], trashKoords["y"][curCount], trashKoords["z"][curCount] = -1839.3332519531, -1625.3967285156, 21.399225234985
	  curCount = curCount + 1
	  trashKoords["x"][curCount], trashKoords["y"][curCount], trashKoords["z"][curCount] = -1839.3332519531, -1625.3967285156, 21.399225234985
	  curCount = curCount + 1
	  trashKoords["x"][curCount], trashKoords["y"][curCount], trashKoords["z"][curCount] = -1839.0865478516, -1601.4899902344, 21.399225234985
	  curCount = curCount + 1
	  trashKoords["x"][curCount], trashKoords["y"][curCount], trashKoords["z"][curCount] = -1883.0159912109, -1692.0927734375, 21.392236709595
	  rubbishFoodKoordinates = curCount

	-- Sweeper
	trashKoordsSweeper = {}
	 trashKoordsSweeper["marker"] = {}
	 trashKoordsSweeper["rubbish"] = {}
	  trashKoordsSweeper["marker"]["x"] = {}
	  trashKoordsSweeper["marker"]["y"] = {}
	  trashKoordsSweeper["rubbish"]["x"] = {}
	  trashKoordsSweeper["rubbish"]["y"] = {}
	  trashKoordsSweeper["rubbish"]["z"] = {}
	   curCount = 1
	   trashKoordsSweeper["marker"]["x"][curCount], trashKoordsSweeper["marker"]["y"][curCount] = -2006.4782714844, 565.35247802734
	   trashKoordsSweeper["rubbish"]["x"][curCount], trashKoordsSweeper["rubbish"]["y"][curCount], trashKoordsSweeper["rubbish"]["z"][curCount] = -2006.4721679688, 565.29931640625, 34.079887390137
	   curCount = curCount + 1
	   trashKoordsSweeper["marker"]["x"][curCount], trashKoordsSweeper["marker"]["y"][curCount] = -2004.0955810547, 730.37951660156
	   trashKoordsSweeper["rubbish"]["x"][curCount], trashKoordsSweeper["rubbish"]["y"][curCount], trashKoordsSweeper["rubbish"]["z"][curCount] = -2004.2767333984, 730.13543701172, 44.609573364258
	   curCount = curCount + 1
	   trashKoordsSweeper["marker"]["x"][curCount], trashKoordsSweeper["marker"]["y"][curCount] = -2002.4820556641, 922.47186279297
	   trashKoordsSweeper["rubbish"]["x"][curCount], trashKoordsSweeper["rubbish"]["y"][curCount], trashKoordsSweeper["rubbish"]["z"][curCount] = -2001.2891845703, 921.12896728516, 44.303417205811
	   curCount = curCount + 1
	   trashKoordsSweeper["marker"]["x"][curCount], trashKoordsSweeper["marker"]["y"][curCount] = -1884.2705078125, 1178.529296875
	   trashKoordsSweeper["rubbish"]["x"][curCount], trashKoordsSweeper["rubbish"]["y"][curCount], trashKoordsSweeper["rubbish"]["z"][curCount] = -1883.5325927734, 1178.6022949219, 44.384704589844
	   curCount = curCount + 1
	   trashKoordsSweeper["marker"]["x"][curCount], trashKoordsSweeper["marker"]["y"][curCount] = -2261.64453125, 1179.7016601563
	   trashKoordsSweeper["rubbish"]["x"][curCount], trashKoordsSweeper["rubbish"]["y"][curCount], trashKoordsSweeper["rubbish"]["z"][curCount] = -2261.3217773438, 1179.5615234375, 54.599864959717
	   curCount = curCount + 1
	   trashKoordsSweeper["marker"]["x"][curCount], trashKoordsSweeper["marker"]["y"][curCount] = -2269.9733886719, 540.78643798828
	   trashKoordsSweeper["rubbish"]["x"][curCount], trashKoordsSweeper["rubbish"]["y"][curCount], trashKoordsSweeper["rubbish"]["z"][curCount] = -2269.8618164063, 540.71636962891, 34.079887390137
	   curCount = curCount + 1
	   trashKoordsSweeper["marker"]["x"][curCount], trashKoordsSweeper["marker"]["y"][curCount] = -2251.8950195313, 321.42077636719
	   trashKoordsSweeper["rubbish"]["x"][curCount], trashKoordsSweeper["rubbish"]["y"][curCount], trashKoordsSweeper["rubbish"]["z"][curCount] = -2251.5834960938, 321.10855102539, 34.186061859131
	   curCount = curCount + 1
	   trashKoordsSweeper["marker"]["x"][curCount], trashKoordsSweeper["marker"]["y"][curCount] = -2421.8564453125, 40.447635650635
	   trashKoordsSweeper["rubbish"]["x"][curCount], trashKoordsSweeper["rubbish"]["y"][curCount], trashKoordsSweeper["rubbish"]["z"][curCount] = -2421.8308105469, 40.915622711182, 34.295085906982
	   curCount = curCount + 1
	   trashKoordsSweeper["marker"]["x"][curCount], trashKoordsSweeper["marker"]["y"][curCount] = -2250.6477050781, -196.96076965332
	   trashKoordsSweeper["rubbish"]["x"][curCount], trashKoordsSweeper["rubbish"]["y"][curCount], trashKoordsSweeper["rubbish"]["z"][curCount] = -2250.9333496094, -196.83932495117, 34.171875
	   curCount = curCount + 1
	   trashKoordsSweeper["marker"]["x"][curCount], trashKoordsSweeper["marker"]["y"][curCount] = -1991.0158691406, 139.11303710938
	   trashKoordsSweeper["rubbish"]["x"][curCount], trashKoordsSweeper["rubbish"]["y"][curCount], trashKoordsSweeper["rubbish"]["z"][curCount] = -1991.1889648438, 138.92549133301, 26.631114959717
	   rubbishSweeperKoordinates = curCount
	   
	-- Trashmaster
	trashKoordsTrashmaster = {}
	 trashKoordsTrashmaster["marker"] = {}
	 trashKoordsTrashmaster["rubbish"] = {}
	  trashKoordsTrashmaster["marker"]["x"] = {}
	  trashKoordsTrashmaster["marker"]["y"] = {}
	  trashKoordsTrashmaster["rubbish"]["x"] = {}
	  trashKoordsTrashmaster["rubbish"]["y"] = {}
	  trashKoordsTrashmaster["rubbish"]["z"] = {}
	  trashKoordsTrashmaster["rubbish"]["rz"] = {}
	   curCount = 1
	   trashKoordsTrashmaster["marker"]["x"][curCount], trashKoordsTrashmaster["marker"]["y"][curCount] = -2007.8472900391, 141.83213806152
	   trashKoordsTrashmaster["rubbish"]["x"][curCount], trashKoordsTrashmaster["rubbish"]["y"][curCount], trashKoordsTrashmaster["rubbish"]["z"][curCount], trashKoordsTrashmaster["rubbish"]["rz"][curCount] = -2012.8875732422, 142.28065490723, 27.609567642212, 0
	   curCount = curCount + 1
	   trashKoordsTrashmaster["marker"]["x"][curCount], trashKoordsTrashmaster["marker"]["y"][curCount] = -2008.5052490234, 544.86553955078
	   trashKoordsTrashmaster["rubbish"]["x"][curCount], trashKoordsTrashmaster["rubbish"]["y"][curCount], trashKoordsTrashmaster["rubbish"]["z"][curCount], trashKoordsTrashmaster["rubbish"]["rz"][curCount] = -2013.2310791016, 544.82342529297, 35.093940734863, 0
	   curCount = curCount + 1
	   trashKoordsTrashmaster["marker"]["x"][curCount], trashKoordsTrashmaster["marker"]["y"][curCount] = -2237.2692871094, 570.33154296875
	   trashKoordsTrashmaster["rubbish"]["x"][curCount], trashKoordsTrashmaster["rubbish"]["y"][curCount], trashKoordsTrashmaster["rubbish"]["z"][curCount], trashKoordsTrashmaster["rubbish"]["rz"][curCount] = -2236.6257324219, 575.21643066406, 35.093940734863, 0
	   curCount = curCount + 1
	   trashKoordsTrashmaster["marker"]["x"][curCount], trashKoordsTrashmaster["marker"]["y"][curCount] = -2542.7312011719, 569.63067626953
	   trashKoordsTrashmaster["rubbish"]["x"][curCount], trashKoordsTrashmaster["rubbish"]["y"][curCount], trashKoordsTrashmaster["rubbish"]["z"][curCount], trashKoordsTrashmaster["rubbish"]["rz"][curCount] = -2542.197265625, 575.16571044922, 14.732720375061, 0
	   curCount = curCount + 1
	   trashKoordsTrashmaster["marker"]["x"][curCount], trashKoordsTrashmaster["marker"]["y"][curCount] = -2525.4562988281, 1003.5202026367
	   trashKoordsTrashmaster["rubbish"]["x"][curCount], trashKoordsTrashmaster["rubbish"]["y"][curCount], trashKoordsTrashmaster["rubbish"]["z"][curCount], trashKoordsTrashmaster["rubbish"]["rz"][curCount] = -2521.0307617188, 1003.2095336914, 78.343940734863, 0
	   curCount = curCount + 1
	   trashKoordsTrashmaster["marker"]["x"][curCount], trashKoordsTrashmaster["marker"]["y"][curCount] = -2471.1196289063, 1209.6456298828
	   trashKoordsTrashmaster["rubbish"]["x"][curCount], trashKoordsTrashmaster["rubbish"]["y"][curCount], trashKoordsTrashmaster["rubbish"]["z"][curCount], trashKoordsTrashmaster["rubbish"]["rz"][curCount] =  -2475.666015625, 1209.6162109375, 35.297065734863, 270
	   curCount = curCount + 1
	   trashKoordsTrashmaster["marker"]["x"][curCount], trashKoordsTrashmaster["marker"]["y"][curCount] = -2600.5720214844, 1336.3809814453
	   trashKoordsTrashmaster["rubbish"]["x"][curCount], trashKoordsTrashmaster["rubbish"]["y"][curCount], trashKoordsTrashmaster["rubbish"]["z"][curCount], trashKoordsTrashmaster["rubbish"]["rz"][curCount] =  -2603.1701660156, 1340.5126953125, 7.2472562789917, 45
	   rubbishTrashKoordinates = curCount

function showStreetCleanGUI_func ()

	endjob_func ()
	if gWindow["cleanJob"] then
		guiSetVisible ( gWindow["cleanJob"], true )
	else
		gWindow["cleanJob"] = guiCreateWindow(screenwidth/2-221/2,screenheight/2-419/2,221,419,"Strassenreinigung",false)
		guiSetAlpha(gWindow["cleanJob"],1)
		guiWindowSetMovable(gWindow["cleanJob"],false)
		guiWindowSetSizable(gWindow["cleanJob"],false)
		gLabel[1] = guiCreateLabel(9,25,160,17,"Deine aktuellen Jobpunkte:",false,gWindow["cleanJob"])
		guiSetAlpha(gLabel[1],1)
		guiLabelSetColor(gLabel[1],255,255,255)
		guiLabelSetVerticalAlign(gLabel[1],"top")
		guiLabelSetHorizontalAlign(gLabel[1],"left",false)
		guiSetFont(gLabel[1],"default-bold-small")
		gLabel[2] = guiCreateLabel(96,44,25,16,"0",false,gWindow["cleanJob"])
		guiSetAlpha(gLabel[2],1)
		guiLabelSetColor(gLabel[2],0,200,0)
		guiLabelSetVerticalAlign(gLabel[2],"top")
		guiLabelSetHorizontalAlign(gLabel[2],"left",false)
		guiSetFont(gLabel[2],"default-bold-small")
		gButton[1] = guiCreateButton(50,141,111,41,"Als Muellsammler arbeiten",false,gWindow["cleanJob"])
		guiSetAlpha(gButton[1],1)
		guiSetFont(gButton[1],"default-bold-small")
		gLabel[3] = guiCreateLabel(11,75,190,60,"Bewege dich über das Gelände\nund sammle den Müll ein -\npro eingesammeltem Teil Müll\nbekommst du 5$ Bezahlung.",false,gWindow["cleanJob"])
		guiSetAlpha(gLabel[3],1)
		guiLabelSetColor(gLabel[3],255,255,255)
		guiLabelSetVerticalAlign(gLabel[3],"top")
		guiLabelSetHorizontalAlign(gLabel[3],"left",false)
		guiSetFont(gLabel[3],"default-bold-small")
		gLabel[4] = guiCreateLabel(40,190,145,56,"Fahr durch die Stadt und\nbeseitige den Müll -\npro Müllhaufen erhälst\ndu 50$.",false,gWindow["cleanJob"])
		guiSetAlpha(gLabel[4],1)
		guiLabelSetColor(gLabel[4],255,255,255)
		guiLabelSetVerticalAlign(gLabel[4],"top")
		guiLabelSetHorizontalAlign(gLabel[4],"left",false)
		guiSetFont(gLabel[4],"default-bold-small")
		gButton[2] = guiCreateButton(51,253,111,41,"Als Strassen-\nreiniger arbeiten",false,gWindow["cleanJob"])
		guiSetAlpha(gButton[2],1)
		guiSetFont(gButton[2],"default-bold-small")
		gLabel[5] = guiCreateLabel(24,310,180,44,"Fahr mit dem Müllwagen durch\ndie Stadt und leere die Tonnen.\nPro Tonne erhälst du 80$.",false,gWindow["cleanJob"])
		guiSetAlpha(gLabel[5],1)
		guiLabelSetColor(gLabel[5],255,255,255)
		guiLabelSetVerticalAlign(gLabel[5],"top")
		guiLabelSetHorizontalAlign(gLabel[5],"left",false)
		guiSetFont(gLabel[5],"default-bold-small")
		gButton[3] = guiCreateButton(53,356,111,41,"Als Müllwagen-\nfahrer arbeiten",false,gWindow["cleanJob"])
		guiSetAlpha(gButton[3],1)
		guiSetFont(gButton[3],"default-bold-small")
		gLabel[6] = guiCreateLabel(59,295,95,14,"* ab 50 Jobpunkten",false,gWindow["cleanJob"])
		guiSetAlpha(gLabel[6],1)
		guiLabelSetColor(gLabel[6],255,255,255)
		guiLabelSetVerticalAlign(gLabel[6],"top")
		guiLabelSetHorizontalAlign(gLabel[6],"left",false)
		guiSetFont(gLabel[6],"default-small")
		gLabel[7] = guiCreateLabel(63,400,95,14,"* ab 250 Jobpunkten",false,gWindow["cleanJob"])
		guiSetAlpha(gLabel[7],1)
		guiLabelSetColor(gLabel[7],255,255,255)
		guiLabelSetVerticalAlign(gLabel[7],"top")
		guiLabelSetHorizontalAlign(gLabel[7],"left",false)
		guiSetFont(gLabel[7],"default-small")
		gButton[4] = guiCreateButton(194,22,17,17,"x",false,gWindow["cleanJob"])
		guiSetAlpha(gButton[4],1)
		
		addEventHandler ( "onClientGUIClick", gButton[4], 
			function()
				guiSetVisible ( gWindow["cleanJob"], false )
				showCursor ( false )
				triggerServerEvent ( "cancel_gui_server", lp )
			end,
		false )
		
		addEventHandler ( "onClientGUIClick", gButton[1], 
			function()
				guiSetVisible ( gWindow["cleanJob"], false )
				showCursor ( false )
				triggerServerEvent ( "cancel_gui_server", lp )
					
				startFoodJob ()
			end,
		false )
		addEventHandler ( "onClientGUIClick", gButton[2], 
			function()
				if vnxClientGetElementData ( "streetCleanPoints" ) >= 50 then
					guiSetVisible ( gWindow["cleanJob"], false )
					showCursor ( false )
					triggerServerEvent ( "cancel_gui_server", lp )
					
					startSweeperJob ()
				else
					infobox ( "\nDu benötigst min.\n50 Jobpunkte, um\nals Straßenreiniger\narbeiten zu können.", 5000, 125, 0, 0 )
				end
			end,
		false )
		addEventHandler ( "onClientGUIClick", gButton[3], 
			function()
				if vnxClientGetElementData ( "streetCleanPoints" ) >= 250 then
					guiSetVisible ( gWindow["cleanJob"], false )
					showCursor ( false )
					triggerServerEvent ( "cancel_gui_server", lp )
					
					startTrashmasterJob ()
				else
					infobox ( "\nDu benötigst mind.\n250 Jobpunkte, um\nals Müllwagenfahrer\narbeiten zu koennen.", 5000, 125, 0, 0 )
				end
			end,
		false )
	end
	guiSetText ( gLabel[2], tostring ( vnxClientGetElementData ( "streetCleanPoints" ) ) )
end
addEvent ( "showStreetCleanGUI", true )
addEventHandler ( "showStreetCleanGUI", getRootElement(), showStreetCleanGUI_func )

local rubbistOnFoodWastedEvent = false

function endjob_func ()

	if isElement ( rubbishPickup ) then
		destroyElement ( rubbishPickup )
		infobox ( "\nMission abgebrochen!", 5000, 125, 0, 0 )
		if getPedOccupiedVehicle ( lp ) then
			triggerServerEvent ( "trashVehDestroy", lp )
		end
	end
	if rubbistOnFoodWastedEvent then
		removeEventHandler ( "onClientPlayerWasted", lp, endjob_func )
		rubbistOnFoodWastedEvent = false
	end
end
addCommandHandler ( "endjob", endjob_func )
addEvent ( "endTrashJob", true )
addEventHandler ( "endTrashJob", getRootElement(), endjob_func )

-- Foodjob --
function startFoodJob ()

	infobox ( "Sammel den Müll\nein, der auf dem\nRadar markiert ist -\ntippe /endjob, um den\nJob abzubrechen.", 7500, 0, 125, 0 )
	
	rubbistOnFoodWastedEvent = true
	addEventHandler ( "onClientPlayerWasted", lp, endjob_func )
	
	createNewRubbish ()
end

function createNewRubbish ()

	local model = rubbish[math.random ( 1, rubbishCount )]
	local rnd = math.random ( 1, rubbishFoodKoordinates )
	local x, y, z = trashKoords["x"][rnd], trashKoords["y"][rnd], trashKoords["z"][rnd]
	if not oldX or ( oldX ~= x ) then
		z = z + 0.5
		if isElement ( rubbishPickup ) then
			destroyElement ( rubbishPickup )
		end
		if isElement ( rubbishPickupBlip ) then
			destroyElement ( rubbishPickupBlip )
		end
		if isElement ( rubbishPickupCol ) then
			destroyElement ( rubbishPickupCol )
		end
		rubbishPickup = createPickup ( x, y, z, 3, model )
		rubbishPickupBlip = createBlip ( x, y, z, 0, 1, 255, 0, 0 )
		rubbishPickupCol = createColSphere ( x, y, z, 1 )
		setElementParent ( rubbishPickupBlip, rubbishPickup )
		setElementParent ( rubbishPickup, rubbishPickupCol )
		addEventHandler ( "onClientColShapeHit", rubbishPickupCol, rubbishCollected )
	else
		createNewRubbish ()
	end
end

function rubbishCollected ( hit )

	if hit == lp then
		if not getPedOccupiedVehicle ( lp ) then
			playSoundFrontEnd ( 40 )
			triggerServerEvent ( "foundRubbish", lp )
			oldX, oldY = getElementPosition ( rubbishPickup )
			destroyElement ( source )
			createNewRubbish ()
		end
	end
end

-- Sweeperjob --
function startSweeperJob ()

	infobox ( "Sammel den Müll\nein, der auf dem\nRadar markiert ist -\ntippe /endjob, um den\nJob abzubrechen.", 7500, 0, 125, 0 )
	triggerServerEvent ( "createStreetCleanVeh", lp, 574 )
	createNewSweeperRubbish ()
end

function createNewSweeperRubbish ()

	local model = streetRubbish[math.random ( 1, 7 )]
	local rnd = math.random ( 1, rubbishSweeperKoordinates )
	local x1, y1, z1 = trashKoordsSweeper["marker"]["x"][rnd], trashKoordsSweeper["marker"]["y"][rnd]
	local x2, y2, z2 = trashKoordsSweeper["rubbish"]["x"][rnd], trashKoordsSweeper["rubbish"]["y"][rnd], trashKoordsSweeper["rubbish"]["z"][rnd]
	z1 = z2
	if not oldX or ( oldX ~= x1 ) then
		rubbishPickup = createMarker ( x1, y1, z1, "checkpoint", 5, 255, 0, 0, 125 )
		rubbishPickupBlip = createBlip ( x1, y1, z1, 0, 2, 255, 0, 0 )
		rubbishPickupRubbish = createObject ( model, x2, y2, z2 )
		setElementParent ( rubbishPickupBlip, rubbishPickup )
		setElementParent ( rubbishPickupRubbish, rubbishPickup )
		addEventHandler ( "onClientMarkerHit", rubbishPickup, sweeperRubbishCollected )
	else
		createNewSweeperRubbish ()
	end
end

function sweeperRubbishCollected ( hit )

	if hit == lp then
		if getPedOccupiedVehicle ( lp ) then
			playSoundFrontEnd ( 40 )
			triggerServerEvent ( "foundSweeperRubbish", lp )
			oldX, oldY = getElementPosition ( source )
			destroyElement ( source )
			createNewSweeperRubbish ()
		end
	end
end

-- Trashmasterjob

function startTrashmasterJob ()

	infobox ( "Leere die Tonnen,\ndie auf dem\nRadar markiert sind -\ntippe /endjob, um den\nJob abzubrechen.", 7500, 0, 125, 0 )
	triggerServerEvent ( "createStreetCleanVeh", lp, 408 )
	createNewTrashRubbish ()
end

function createNewTrashRubbish ()

	local model = trashBins[math.random ( 1, 4 )]
	local rnd = math.random ( 1, rubbishTrashKoordinates )
	local x1, y1, z1 = trashKoordsTrashmaster["marker"]["x"][rnd], trashKoordsTrashmaster["marker"]["y"][rnd]
	local x2, y2, z2, r2 = trashKoordsTrashmaster["rubbish"]["x"][rnd], trashKoordsTrashmaster["rubbish"]["y"][rnd], trashKoordsTrashmaster["rubbish"]["z"][rnd], trashKoordsTrashmaster["rubbish"]["rz"][rnd]
	z1 = z2
	if not oldX or ( oldX ~= x1 ) then
		rubbishPickup = createMarker ( x1, y1, z1, "checkpoint", 5, 255, 0, 0, 125 )
		rubbishPickupBlip = createBlip ( x1, y1, z1, 0, 2, 255, 0, 0 )
		rubbishPickupRubbish = createObject ( model, x2, y2, z2, 0, 0, r2 )
		setElementParent ( rubbishPickupBlip, rubbishPickup )
		setElementParent ( rubbishPickupRubbish, rubbishPickup )
		addEventHandler ( "onClientMarkerHit", rubbishPickup, trashmasterRubbishCollected )
	else
		createNewTrashRubbish ()
	end
end

function trashmasterRubbishCollected ( hit )

	if lp == hit then
		if getPedOccupiedVehicle ( lp ) then
			playSoundFrontEnd ( 40 )
			triggerServerEvent ( "foundTrashmasterRubbish", lp )
			oldX, oldY = getElementPosition ( source )
			destroyElement ( source )
			createNewTrashRubbish ()
		end
	end
end