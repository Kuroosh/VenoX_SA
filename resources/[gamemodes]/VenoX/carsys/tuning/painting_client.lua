local seaPaint = createMarker ( -1583.24, 156.23, -1, "cylinder", 10, 255, 0, 0, 150, getRootElement() )
local airPaint = createMarker ( 404.25, 2454.38, 15.25, "cylinder", 10, 255, 0, 0, 150, getRootElement() )
createBlip ( 404.25, 2454.38, 0, 63, 1.5, 255, 0, 0, 255, 0, 200 )
createBlip ( -1583.24, 156.23, 0, 63, 1.5, 255, 0, 0, 255, 0, 200 )

addEventHandler ( "onClientMarkerHit", seaPaint,
	function ( player, dim )
		if dim and player == lp then
			if getPedOccupiedVehicleSeat ( lp ) == 0 then
				local id = getElementModel ( getPedOccupiedVehicle ( lp ) )
				if motorboats[id] or raftboats[id] then
					showColorSelection ()
				end
			end
		end
	end
)

addEventHandler ( "onClientMarkerHit", airPaint,
	function ( player, dim )
		if dim and player == lp then
			if getPedOccupiedVehicleSeat ( lp ) == 0 then
				local id = getElementModel ( getPedOccupiedVehicle ( lp ) )
				if planea[id] or planeb[id] or helicopters[id] then
					local x, y, z = getElementPosition ( lp )
					if z <= 25 then
						showColorSelection ()
					end
				end
			end
		end
	end
)

colorSelectionImage = nil
colorSelected = nil
local curSelectedColor
local vColorOld = {}
local vColorNew = {}
local idTable = {}
idTable["Farbe A"] = 1
idTable["Farbe B"] = 2
idTable["Farbe C"] = 3
idTable["Farbe D"] = 4

function showColorSelection ()

	local veh = getPedOccupiedVehicle ( lp )
	if veh then
		vColorOld[1], vColorOld[2], vColorOld[3], vColorOld[4] = getVehicleColor ( veh )
		vColorNew[1], vColorNew[2], vColorNew[3], vColorNew[4] = vColorOld[1], vColorOld[2], vColorOld[3], vColorOld[4]
		local vehicleColorSelectionWindow = guiCreateWindow ( screenwidth / 2 - 500 / 2, screenheight / 2 - 165 / 2, 500, 165, "Farbauswahl", false )
		showCursor ( true )
		setElementClicked ( true )
		guiWindowSetMovable ( vehicleColorSelectionWindow, false )
		guiWindowSetSizable ( vehicleColorSelectionWindow, false )
		guiSetAlpha ( vehicleColorSelectionWindow, 1 )
		colorSelectionImage = guiCreateStaticImage ( 1, 20, 400, 140, "images/colors/carcolors.png", false, vehicleColorSelectionWindow )
		
		local x, y = calcVehColorSelection ( vColorOld[1] )
		showCarColorSelection ( x, y )
		
		gRadio["vehColorSelectionColor1"] = guiCreateRadioButton ( 422, 20, 65, 20, "Farbe A", false, vehicleColorSelectionWindow )
		gRadio["vehColorSelectionColor2"] = guiCreateRadioButton ( 422, 35, 65, 20, "Farbe B", false, vehicleColorSelectionWindow )
		gRadio["vehColorSelectionColor3"] = guiCreateRadioButton ( 422, 50, 65, 20, "Farbe C", false, vehicleColorSelectionWindow )
		gRadio["vehColorSelectionColor4"] = guiCreateRadioButton ( 422, 65, 65, 20, "Farbe D", false, vehicleColorSelectionWindow )
		
		gButton["vehColorSelectionClose"] = guiCreateButton ( 422, 85, 80, 30, "Schliessen", false, vehicleColorSelectionWindow )
		gButton["vehColorSelectionAccept"] = guiCreateButton ( 422, 125, 120, 30, "Lackieren", false, vehicleColorSelectionWindow )
		
		addEventHandler ( "onClientGUIClick", gButton["vehColorSelectionClose"],
			function ()
				destroyElement ( vehicleColorSelectionWindow )
				showCursor ( false )
				setElementClicked ( false )
				setVehicleColor ( getPedOccupiedVehicle ( lp ), vColorOld[1], vColorOld[2], vColorOld[3], vColorOld[4] )
			end,
		false )
		addEventHandler ( "onClientGUIClick", gButton["vehColorSelectionAccept"],
			function ()
				vColorOld[1], vColorOld[2], vColorOld[3], vColorOld[4] = vColorNew[1], vColorNew[2], vColorNew[3], vColorNew[4]
				setVehicleColor ( getPedOccupiedVehicle ( lp ), vColorOld[1], vColorOld[2], vColorOld[3], vColorOld[4] )
				local color = "|"..vColorOld[1].."|"..vColorOld[2].."|"..vColorOld[3].."|"..vColorOld[4].."|" 
				setElementData ( getPedOccupiedVehicle ( lp ), "color", color )
				--triggerServerEvent ( "changeVehicleColor", lp, vColorOld[1], vColorOld[2], vColorOld[3], vColorOld[4] )
			end,
		false )
		
		guiRadioButtonSetSelected ( gRadio["vehColorSelectionColor1"], true )
		curSelectedColor = 1
		
		for i = 1, 4 do
			guiSetFont ( gRadio["vehColorSelectionColor"..i], "default-bold-small" )
			
			addEventHandler ( "onClientGUIClick", gRadio["vehColorSelectionColor"..i],
				function ()
					local id = idTable[guiGetText ( source )]
					
					local x, y = calcVehColorSelection ( vColorNew[id] )
					showCarColorSelection ( x, y )
					
					curSelectedColor = id
				end,
			false )
		end
		
		addEventHandler ( "onClientGUIClick", colorSelectionImage,
			function ( btn, state, x, y )
				x = x - ( screenwidth / 2 - 501 / 2 - 1 / 2 )
				y = y - ( screenheight / 2 - 165 / 2 )
				
				x = math.floor ( x / 20 )
				y = math.floor ( y / 20 ) - 1
				
				local id = x + y * 20
				
				if id > 126 then
					id = 0
				end
				vColorNew[curSelectedColor] = id
				setVehicleColor ( getPedOccupiedVehicle ( lp ), vColorNew[1], vColorNew[2], vColorNew[3], vColorNew[4] )
				showCarColorSelection ( x, y )
			end,
		false )
	end
end

function showCarColorSelection ( x, y )

	if isElement ( colorSelected ) then
		destroyElement ( colorSelected )
	end
	x = x * 20
	y = y * 20
	colorSelected = guiCreateStaticImage ( x, y, 20, 20, "images/colors/selection.png", false, colorSelectionImage )
end

function cselect ()

	showColorSelection ()
end
--addCommandHandler ( "cselect", cselect )

function calcVehColorSelection ( color )

	local x, y = 0, 0
	while color > 20 do
		color = color - 20
		y = y + 1
	end
	x = color
	return x, y
end