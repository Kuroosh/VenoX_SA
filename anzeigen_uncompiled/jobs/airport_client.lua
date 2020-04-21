addEvent ( "stopAirportJob", true )
local baggageNumber = {}
function hideAllMarkersAirport()
	if source == getLocalPlayer() then
		if isElement(BaggageUnload1Vehicle) then
			destroyElement ( BaggageUnload1Vehicle )
		end
		if isElement(BaggageUnload2Vehicle) then
			destroyElement ( BaggageUnload2Vehicle )
		end
		if isElement(BaggageUnload3Vehicle) then
			destroyElement ( BaggageUnload3Vehicle )
		end
		if isElement(BaggageUnload1) then
			destroyElement ( BaggageUnload1 )
		end
		if isElement(BaggageUnload2) then
			destroyElement ( BaggageUnload2 )
		end
		if isElement(BaggageUnload3) then
			destroyElement ( BaggageUnload3 )
		end
		if isElement(BaggageUnload1Blip) then
			destroyElement ( BaggageUnload1Blip )
		end
		if isElement(BaggageUnload2Blip) then
			destroyElement ( BaggageUnload2Blip )
		end
		if isElement(BaggageUnload3Blip) then
			destroyElement ( BaggageUnload3Blip )
		end
		if isElement(CropdusterMarker1) then
			destroyElement ( CropdusterMarker1 )
		end
		if isElement(CropdusterMarker2) then
			destroyElement ( CropdusterMarker2 )
		end
		if isElement(CropdusterMarker3) then
			destroyElement ( CropdusterMarker3 )
		end
		if isElement(CropdusterMarker4) then
			destroyElement ( CropdusterMarker4 )
		end
		if isElement(CropdusterMarker5) then
			destroyElement ( CropdusterMarker5 )
		end
		if isElement(CropdusterMarker1Blip) then
			destroyElement ( CropdusterMarker1Blip )
		end
		if isElement(CropdusterMarker2Blip) then
			destroyElement ( CropdusterMarker2Blip )
		end
		if isElement(CropdusterMarker3Blip) then
			destroyElement ( CropdusterMarker3Blip )
		end
		if isElement(CropdusterMarker4Blip) then
			destroyElement ( CropdusterMarker4Blip )
		end
		if isElement(CropdusterMarker5Blip) then
			destroyElement ( CropdusterMarker5Blip )
		end
		if isElement(AirportTargetBlip) then
			destroyElement ( AirportTargetBlip )
		end
		if isElement(AirportTargetMarker) then
			destroyElement ( AirportTargetMarker )
		end
	end
end
addEventHandler ( "stopAirportJob", getRootElement(), hideAllMarkersAirport )

function showDeliverPoints()

	local dim = vnxClientGetElementData ( "jobDimension" )
	hideDeliverPoints()
	BaggageUnload1Vehicle = createVehicle ( 577, -1338.7501220703, -223.37954711914, 14.209453582764, 0, 0, 134.99987792969 )
	BaggageUnload1 = createMarker ( -1361.6362304688, -228.25860595703, 14.143964767456, "checkpoint", 10, 125, 0, 0, 255, getRootElement() )
	BaggageUnload2Vehicle = createVehicle ( 592, -1501.3070068359, -154.43298339844, 15, 0, 0, 135 )
	BaggageUnload2 = createMarker ( -1522.2647705078, -160.74020385742, 14.1484375, "checkpoint", 10, 125, 0, 0, 255, getRootElement() )
	BaggageUnload3Vehicle = createVehicle ( 417, -1221.8127441406, -8.256688117981, 14.623241424561 )
	BaggageUnload3 = createMarker ( -1234.8166503906, -12.079794883728, 14.1484375, "checkpoint", 10, 125, 0, 0, 255, getRootElement() )
	addEventHandler ( "onClientMarkerHit", BaggageUnload1, BaggageUnloadMarkerHit )
	addEventHandler ( "onClientMarkerHit", BaggageUnload2, BaggageUnloadMarkerHit )
	addEventHandler ( "onClientMarkerHit", BaggageUnload3, BaggageUnloadMarkerHit )
	setElementDimension ( BaggageUnload1Vehicle, dim )
	setElementDimension ( BaggageUnload2Vehicle, dim )
	setElementDimension ( BaggageUnload3Vehicle, dim )
	baggageNumber[BaggageUnload1] = 1 
	baggageNumber[BaggageUnload2] = 2 
	baggageNumber[BaggageUnload3] = 3 
	count = 0
	setElementDimension ( BaggageUnload1, dim )
	setElementDimension ( BaggageUnload2, dim )
	setElementDimension ( BaggageUnload3, dim )
	BaggageUnload1Blip = createBlip ( -1361.6362304688, -228.25860595703, 14.143964767456, 0, 2, 255, 0, 0, 255, 0, 99999.0, lp )
	BaggageUnload2Blip = createBlip ( -1522.2647705078, -160.74020385742, 14.1484375, 0, 2, 255, 0, 0, 255, 0, 99999.0, lp )
	BaggageUnload3Blip = createBlip ( -1234.8166503906, -12.079794883728, 14.1484375, 0, 2, 255, 0, 0, 255, 0, 99999.0, lp )
	setElementDimension ( BaggageUnload1Blip, dim )
	setElementDimension ( BaggageUnload2Blip, dim )
	setElementDimension ( BaggageUnload3Blip, dim )
end

function hideDeliverPoints()

	if isElement ( BaggageUnload1Vehicle ) then
		destroyElement ( BaggageUnload1Vehicle )
		destroyElement ( BaggageUnload2Vehicle )
		destroyElement ( BaggageUnload3Vehicle )
	end
	if isElement ( BaggageUnload1 ) then
		destroyElement ( BaggageUnload1 )
		destroyElement ( BaggageUnload2 )
		destroyElement ( BaggageUnload3 )
		destroyElement ( BaggageUnload1Blip )
		destroyElement ( BaggageUnload2Blip )
		destroyElement ( BaggageUnload3Blip )
	end
end

function BaggageUnloadMarkerHit ( hit, dim )

	if dim and hit == lp then
		if source == BaggageUnload1 or source == BaggageUnload2 or source == BaggageUnload3 then
			local trailer = getVehicleTowedByVehicle ( getPedOccupiedVehicle ( hit ) )
			if trailer then
				local blip = baggageNumber[source]
				destroyElement ( source	)
				destroyElement ( _G["BaggageUnload"..blip.."Blip"] )
				count = count + 1
				if count == 3 then
					triggerServerEvent ( "baggageMissionComplete", lp )
				else
					outputChatBox ( "Hol dir einen neuen Anhänger!", 10, 150, 10 )
				end
				playSoundFrontEnd ( 43 )
				triggerServerEvent ( "killTrailer", hit, trailer )
			end
		end
	end
end


function hideCropdusterPoints()

	for i = 1, 5 do
		if isElement(_G["CropdusterMarker"..i]) then
			destroyElement ( _G["CropdusterMarker"..i] )
		end
		if isElement(_G["CropdusterMarker"..i.."Blip"]) then
			destroyElement ( _G["CropdusterMarker"..i.."Blip"] )
		end
	end
end


function CropDusterMarkerHit ( hit, dim )
	if hit == lp and dim then
		local veh = getPedOccupiedVehicle ( hit )
		local i = getElementData ( source, "i" )
		destroyElement ( _G["CropdusterMarker"..i.."Blip"] )
		destroyElement ( source )
		count = count + 1
		if count == 5 then
			triggerServerEvent ( "cropdusterMissionComplete", lp )
		end
		playSoundFrontEnd ( 43 )
	end
end


function showCropdusterPoints ()

	local dim = vnxClientGetElementData ( "jobDimension" )
	hideCropdusterPoints()
	CropdusterMarker1  = createMarker ( -1104.9104003906, -978.28009033203, 189.46875, "ring", 10, 125, 0, 0, 255, localPlayer )
	CropdusterMarker2  = createMarker ( -281.89483642578, -1521.7196044922, 89.01439666748, "ring", 10, 125, 0, 0, 255, localPlayer )
	CropdusterMarker3  = createMarker ( -263.64831542969, -1369.1451416016, 77.448867797852, "ring", 10, 125, 0, 0, 255, localPlayer )
	CropdusterMarker4  = createMarker ( -279.80813598633, -957.28393554688, 127.56575012207, "ring", 10, 125, 0, 0, 255, localPlayer )
	CropdusterMarker5  = createMarker ( -480.54431152344, -1359.1550292969, 93.225845336914, "ring", 10, 125, 0, 0, 255, localPlayer )
	setElementData ( CropdusterMarker1, "i", 1 )
	setElementData ( CropdusterMarker2, "i", 2 )
	setElementData ( CropdusterMarker3, "i", 3 )
	setElementData ( CropdusterMarker4, "i", 4 )
	setElementData ( CropdusterMarker5, "i", 5 )
	setElementDimension ( CropdusterMarker1, dim )
	setElementDimension ( CropdusterMarker2, dim )
	setElementDimension ( CropdusterMarker3, dim )
	setElementDimension ( CropdusterMarker4, dim )
	setElementDimension ( CropdusterMarker5, dim )
	addEventHandler ( "onClientMarkerHit", CropdusterMarker1, CropDusterMarkerHit )
	addEventHandler ( "onClientMarkerHit", CropdusterMarker2, CropDusterMarkerHit )
	addEventHandler ( "onClientMarkerHit", CropdusterMarker3, CropDusterMarkerHit )
	addEventHandler ( "onClientMarkerHit", CropdusterMarker4, CropDusterMarkerHit )
	addEventHandler ( "onClientMarkerHit", CropdusterMarker5, CropDusterMarkerHit )
	CropdusterMarker1Blip = createBlip ( -1104.9104003906, -978.28009033203, 189.46875, 0, 2, 255, 0, 0, 255, 0, 99999.0, lp )
	CropdusterMarker2Blip = createBlip ( -281.89483642578, -1521.7196044922, 89.01439666748, 0, 2, 255, 0, 0, 255, 0, 99999.0, lp )
	CropdusterMarker3Blip = createBlip ( -263.64831542969, -1369.1451416016, 77.448867797852, 0, 2, 255, 0, 0, 255, 0, 99999.0, lp )
	CropdusterMarker4Blip = createBlip ( -279.80813598633, -957.28393554688, 127.56575012207, 0, 2, 255, 0, 0, 255, 0, 99999.0, lp )
	CropdusterMarker5Blip = createBlip ( -480.54431152344, -1359.1550292969, 93.225845336914, 0, 2, 255, 0, 0, 255, 0, 99999.0, lp )
	setElementDimension ( CropdusterMarker1Blip, dim )
	setElementDimension ( CropdusterMarker2Blip, dim )
	setElementDimension ( CropdusterMarker3Blip, dim )
	setElementDimension ( CropdusterMarker4Blip, dim )
	setElementDimension ( CropdusterMarker5Blip, dim )
	outputChatBox ( "Verteile die Pestiziede über den Feldern!", 200, 200, 0 )
end

function startFreightMission ( veh )

	hideAllMarkersAirport()
	local dim = vnxClientGetElementData ( "jobDimension" )
	if isElement ( AirportTargetMarker ) then
		destroyElement ( AirportTargetMarker )
		destroyElement ( AirportTargetBlip )
	end
	local rnd = math.random ( 1, 3 )
	if rnd == 1 then		-- Schrottplatz
		AirportTargetMarker = createMarker ( 393.78289794922, 2502.5717773438, 15.734373092651, "ring", 10, 125, 0, 0, 255, getRootElement() )
		AirportTargetBlip = createBlip ( 393.78289794922, 2502.5717773438, 15.734373092651, 0, 2, 255, 0, 0, 255, 0, 99999.0, lp )
		outputChatBox ( "Fliege dein Flugzeug unbeschädigt zum Flugzeugfriedhof.", 200, 200, 0 )
	elseif rnd == 2 then 	-- LV
		AirportTargetMarker = createMarker ( 1433.0295410156, 1463.6586914063, 10.8203125, "ring", 10, 125, 0, 0, 255, getRootElement() )
		AirportTargetBlip = createBlip ( 1433.0295410156, 1463.6586914063, 10.8203125, 0, 2, 255, 0, 0, 255, 0, 99999.0, lp )
		outputChatBox ( "Fliege dein Flugzeug unbeschädigt zum Las Venturas International Airport.", 200, 200, 0 )
	else					-- LS
		AirportTargetMarker = createMarker ( 1834.8217773438, -2494.7470703125, 13.554689407349, "ring", 10, 125, 0, 0, 255, getRootElement() )
		AirportTargetBlip = createBlip ( 1834.8217773438, -2494.7470703125, 13.554689407349, 0, 2, 255, 0, 0, 255, 0, 99999.0, lp )
		outputChatBox ( "Fliege dein Flugzeug unbeschädigt zum Los Santos International Airport.", 200, 200, 0 )
	end
	addEventHandler ( "onClientMarkerHit", AirportTargetMarker, hitAirportTargetMarker )
	if veh == 511 or veh == 593 then
		x, y, z = -1345.1088867188, -528.98895263672, 15.555714607239
		rot = 205
	elseif veh == 519 or veh == 553 then
		x, y, z = -1422.5704345703, -560.97271728516, 16.543201446533
		rot = 205
	elseif veh == 592 then
		x, y, z = -1626.5688476563, -476.66955566406, 23.178987503052
		rot = 45
	else
		x, y, z = -1619.9566650391, -483.23001098633, 22.035705566406
		rot = 45
	end
	setElementDimension ( AirportTargetBlip, dim )
	setElementDimension ( AirportTargetMarker, dim )
	guiSetVisible ( gWindow["airportJob"], false )
	showCursor(false)
	setElementClicked ( false )
	triggerServerEvent ( "cancel_gui_server", lp )
	triggerServerEvent ( "airportJobFlight", lp, veh, x, y, z, rot )
end


freightModel = { [511]=true, [593]=true, [519]=true, [553]=true, [592]=true, [577]=true }

function hitAirportTargetMarker ( hit, dim )
	if hit == lp then
		if freightModel[ getElementModel ( getPedOccupiedVehicle ( lp ) ) ] then
			destroyElement ( source )
			destroyElement ( AirportTargetBlip )
			local veh = getPedOccupiedVehicle ( hit )
			local vehid = getElementModel ( veh )
			triggerServerEvent ( "airportJobFreightFinished", lp, vehid )
			playSoundFrontEnd ( 43 )
		end
	end
end
----------------------------------------------------------------------------------------------------------------

function acceptjobairport()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	showCursor(true)
	vnxDrawWindow("AcceptJob_Airport_Main", "Das HauptWindow", "Jobangebot von Frank Novak", sx*450, sy*200, sx*450, sy*350, "closejobofferairport")
	vnxDrawImage("Frank_Der_Arbeitgeber","Frank der Manager",sx*475,sy*230,sx*400,sy*200,":VenoX/anzeigen/jobs/images/frank_job_airport")
	vnxDrawButtonColored("Accept_Job_Airport", "Der Frank Job button", "Ja sehr gerne...",  sx*475, sy*470, sx*150, sy*60, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,125,0,255), tocolor(0,255,0,255), "accept_job_airport_btn")
	vnxDrawButtonColored("Nope_Job_Airport", "Der Frank Job button", "Vielleicht\nwann anders...", sx*725, sy*470, sx*150, sy*60, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(125,0,0,255), tocolor(180,0,0,255), "decline_job_airport_btn")
	addEventHandler("onClientRender", root, acceptjob_text)
end
addEvent ( "showacceptjobairport_gui", true )
addEventHandler ( "showacceptjobairport_gui", getRootElement(), acceptjobairport )

----------------------------------------------------------------------------------------------------------------
function closejobofferairport()
	showCursor(false)
	showChat(true)
	setPlayerHudComponentVisible("radar", true)
	vnxDestroyWindow("AcceptJob_Airport_Main")
	vnxDestroyWindow("Frank_Der_Arbeitgeber")
	vnxDestroyWindow("Accept_Job_Airport")
	vnxDestroyWindow("Nope_Job_Airport")
	vnxDestroyWindow("Airport_Header")
	vnxDestroyWindow("airport_grid_sel")
	vnxDestroyWindow("select_button_airport")
	removeEventHandler("onClientRender", root, acceptjob_text)
	removeEventHandler("onClientRender", root, airport_job_lvlshow)
	removeEventHandler("onClientRender", root, airport_error_window)
	removeEventHandler("onClientRender", root, airport_error_window_a)
	removeEventHandler("onClientRender", root, airport_error_window_b)
	vnxDestroyWindow("select_kuendigung_airport")
end
local dxfont0_arial = dxCreateFont(":pr0/files/fonts/arial.ttf", 10)
function acceptjob_text(player)

	local name = getPlayerName(getLocalPlayer())
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	dxDrawText("Guten Tag "..name..", bist du daran interessiert hier zu arbeiten?", sx*475, sy*430, sx*875, sy*464, tocolor(255, 255, 255, 255), 1.00, dxfont0_arial, "center", "center", false, false, false, false, false)
end

function accept_job_airport_btn(player)
	closejobofferairport()
	triggerServerEvent ( "AcceptJob_Airport", getLocalPlayer() )
	AirportJob_Main_Window()
end

function decline_job_airport_btn()
	closejobofferairport()
end


local airport_job = {}

table.insert(airport_job, { "", "" })

table.insert(airport_job, { "Kofferpacker", " 200 $ " })

table.insert(airport_job, { "", "" })

table.insert(airport_job, { "Insektenvernichter", " 350 $ " })

table.insert(airport_job, { "", "" })

table.insert(airport_job, { "Leichter Flug", " 500 $ " })

table.insert(airport_job, { "", "" })

table.insert(airport_job, { "Leichter Flug Fortgeschritten", " 550 $ " })

table.insert(airport_job, { "", "" })

table.insert(airport_job, { "Mittlerer Flug", " 650 $ " })

table.insert(airport_job, { "", "" })

table.insert(airport_job, { "Mittlerer Flug Fortgeschritten", " 700 $ " })

table.insert(airport_job, { "", "" })

table.insert(airport_job, { "Schwerer Flug", " 800 $ " })

table.insert(airport_job, { "", "" })

table.insert(airport_job, { "Schwerer Flug Fortgeschritten", " 850 $ " })

table.insert(airport_job, { "", "" })


function airport_job_lvlshow()
	local levelairport = tonumber ( vnxClientGetElementData ( "airportlvl" ) )
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	dxDrawText(levelairport.."", sx*750 + 1, sy*315 + 1, sx*1000 + 1, sy*350 + 1, tocolor(0, 0, 0, 255), 1.00, "pricedown", "center", "top", false, false, false, false, false)
	dxDrawText(levelairport.."", sx*750, sy*315, sx*1000, sy*350, tocolor(0, 105, 145, 255), 1.00, "pricedown", "center", "top", false, false, false, false, false)
	dxDrawText("Dein Piloten Level : ", sx*750, sy*280, sx*1000, sy*315, tocolor(255, 255, 255, 255), 1.00, "pricedown", "center", "top", false, false, false, false, false)
	dxDrawRectangle(sx*750, sy*350, sx*250, sy*5, tocolor(0, 105, 145, 255), false)
	dxDrawRectangle(sx*750, sy*310, sx*250, sy*5, tocolor(0, 105, 145, 255), false)
end



function airport_error_window()
	local levelairport = tonumber ( vnxClientGetElementData ( "airportlvl" ) )
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	removeEventHandler("onClientRender", root, airport_job_lvlshow)
	--dxDrawText(levelairport.."", sx*750 + 1, sy*315 + 1, sx*1000 + 1, sy*350 + 1, tocolor(0, 0, 0, 255), 1.00, "pricedown", "center", "top", false, false, false, false, false)
	dxDrawText("Du brauchst einen\nFührerschein!", sx*750, sy*315, sx*1000, sy*350, tocolor(150, 0, 0, 255), 0.8, "pricedown", "center", "center", false, false, false, false, false)
	--dxDrawText("Dein Piloten Level : ", sx*750, sy*280, sx*1000, sy*315, tocolor(255, 255, 255, 255), 1.00, "pricedown", "center", "top", false, false, false, false, false)
	dxDrawRectangle(sx*750, sy*350, sx*250, sy*5, tocolor(120, 0, 0, 255), false)
	dxDrawRectangle(sx*750, sy*310, sx*250, sy*5, tocolor(120, 0, 0, 255), false)
end

function airport_error_window_a()
	local levelairport = tonumber ( vnxClientGetElementData ( "airportlvl" ) )
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	removeEventHandler("onClientRender", root, airport_job_lvlshow)
	--dxDrawText(levelairport.."", sx*750 + 1, sy*315 + 1, sx*1000 + 1, sy*350 + 1, tocolor(0, 0, 0, 255), 1.00, "pricedown", "center", "top", false, false, false, false, false)
	dxDrawText("Du brauchst einen\nFlugschein A!", sx*750, sy*315, sx*1000, sy*350, tocolor(150, 0, 0, 255), 0.8, "pricedown", "center", "center", false, false, false, false, false)
	--dxDrawText("Dein Piloten Level : ", sx*750, sy*280, sx*1000, sy*315, tocolor(255, 255, 255, 255), 1.00, "pricedown", "center", "top", false, false, false, false, false)
	dxDrawRectangle(sx*750, sy*350, sx*250, sy*5, tocolor(120, 0, 0, 255), false)
	dxDrawRectangle(sx*750, sy*310, sx*250, sy*5, tocolor(120, 0, 0, 255), false)
end

function airport_error_window_b()
	local levelairport = tonumber ( vnxClientGetElementData ( "airportlvl" ) )
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	removeEventHandler("onClientRender", root, airport_job_lvlshow)
	--dxDrawText(levelairport.."", sx*750 + 1, sy*315 + 1, sx*1000 + 1, sy*350 + 1, tocolor(0, 0, 0, 255), 1.00, "pricedown", "center", "top", false, false, false, false, false)
	dxDrawText("Du brauchst einen\nFlugschein B!", sx*750, sy*315, sx*1000, sy*350, tocolor(150, 0, 0, 255), 0.8, "pricedown", "center", "center", false, false, false, false, false)
	--dxDrawText("Dein Piloten Level : ", sx*750, sy*280, sx*1000, sy*315, tocolor(255, 255, 255, 255), 1.00, "pricedown", "center", "top", false, false, false, false, false)
	dxDrawRectangle(sx*750, sy*350, sx*250, sy*5, tocolor(120, 0, 0, 255), false)
	dxDrawRectangle(sx*750, sy*310, sx*250, sy*5, tocolor(120, 0, 0, 255), false)
end



function AirportJob_Main_Window()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	local name = getPlayerName(getLocalPlayer())
	showChat(false)
	showCursor(true)
	setPlayerHudComponentVisible("radar", false)
	vnxDrawWindow("AcceptJob_Airport_Main", "Das HauptWindow", "Guten Tag Pilot "..name, sx*400, sy*135, sx*600, sy*450, "closejobofferairport")
	vnxDrawImage("Airport_Header", "Piloten", sx*400,sy*165,sx*600,sy*115, ":VenoX/anzeigen/jobs/images/airport_header")
	vnxDrawGridlist("airport_grid_sel", "airport_grid_selected", sx*400, sy*280, sx*350, sy*305, { { "Auftrag", sx*250 }, { "Gehalt", sx*120 } }, airport_job)
	vnxDrawButtonColored("select_button_airport", "Der Frank Job button", "Auftrag Starten", sx*775, sy*380, sx*200, sy*60, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,255,255), "select_airport_mission")

	vnxDrawButtonColored("select_kuendigung_airport", "Der Kündigungs Job button", "Kündigen", sx*775, sy*480, sx*200, sy*60, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(125,0,0,255), tocolor(175,0,0,255), "kuendigung_airport")
	addEventHandler("onClientRender", root, airport_job_lvlshow)
end
addEvent ( "showAirportJobGui", true )
addEventHandler ( "showAirportJobGui", getRootElement(), AirportJob_Main_Window )


function kuendigung_airport( player )
	triggerServerEvent ("kuendigen_job", getLocalPlayer(), getLocalPlayer() )
	closejobofferairport()
end



function select_airport_mission()
	local selected_airport_grid = vnxGetGridlistSelectedItem("airport_grid_sel", "airport_grid_selected")
	if selected_airport_grid then
		selected_airport_grid = selected_airport_grid[1]
		outputDebugString(selected_airport_grid)
		if selected_airport_grid == "Kofferpacker" then 
			if vnxClientGetElementData ( "carlicense" ) == 1 then
				closejobofferairport()
				hideAllMarkersAirport()
				triggerServerEvent ( "airportjobDimFix", lp )
				setElementPosition ( lp, -1262.0727539063, 33, 13.84 )
				showCursor(false)
				setElementClicked ( false )
				triggerServerEvent ( "cancel_gui_server", lp )
				count = 0
				showDeliverPoints()
			else
				addEventHandler("onClientRender", root, airport_error_window)
				--outputChatBox ( "Du brauchst einen Führerschein!", 0, 218, 255 )
			end
		elseif selected_airport_grid == "Insektenvernichter" then 
			if tonumber ( vnxClientGetElementData ( "airportlvl" ) ) >= 10 then
				if vnxClientGetElementData ( "planelicensea" ) == 1 then
					closejobofferairport()
					hideAllMarkersAirport()
					triggerServerEvent ( "airportJobInsektenvernichter", lp )
					showCursor(false)
					triggerServerEvent ( "cancel_gui_server", lp )
					count = 0
					showCropdusterPoints()
				else
					addEventHandler("onClientRender", root, airport_error_window_a)
					--outputChatBox ( "Du braucht einen Flugschein Klasse A!", 0, 218, 255 )
				end
			else
				outputChatBox ( "Dein Flughafen-Level ist nicht hoch genug - erst ab Level 10 verfuegbar!", 0, 218, 255 )
			end
		elseif selected_airport_grid == "Leichter Flug" then 
			if tonumber ( vnxClientGetElementData ( "airportlvl" ) ) >= 10 then
				if vnxClientGetElementData ( "planelicensea" )  == 1 then
						closejobofferairport()
						startFreightMission ( 593 )
				else
					addEventHandler("onClientRender", root, airport_error_window_a)
					--outputChatBox ( "Du braucht einen Flugschein Klasse A!", 0, 105, 145 )
				end
			else
				outputChatBox ( "Dein Flughafen-Level ist nicht hoch genug - erst ab 10 Punkte verfuegbar!", 0, 150, 255 )
			end
		elseif selected_airport_grid == "Leichter Flug Fortgeschritten" then 
			if tonumber ( vnxClientGetElementData ( "airportlvl" ) ) >= 15 then
				if vnxClientGetElementData ( "planelicensea" )  == 1 then
						closejobofferairport()
						startFreightMission ( 511 )
				else
					addEventHandler("onClientRender", root, airport_error_window_a)
					--outputChatBox ( "Du braucht einen Flugschein Klasse A!", 0, 105, 145 )
				end
			else
				outputChatBox ( "Dein Flughafen-Level ist nicht hoch genug - erst ab 15 Punkte verfuegbar!", 0, 150, 255 )
			end
		elseif selected_airport_grid == "Mittlerer Flug" then 
			if tonumber ( vnxClientGetElementData ( "airportlvl" ) ) >= 30 then
				if vnxClientGetElementData ( "planelicensea" )  == 1 then
						closejobofferairport()
						startFreightMission ( 553 )
				else
					addEventHandler("onClientRender", root, airport_error_window_a)
					--outputChatBox ( "Du braucht einen Flugschein Klasse A!", 0, 105, 145 )
				end
			else
				outputChatBox ( "Dein Flughafen-Level ist nicht hoch genug - erst ab 30 Punkte verfuegbar!", 0, 150, 255 )
			end
		elseif selected_airport_grid == "Mittlerer Flug Fortgeschritten" then 
			if tonumber ( vnxClientGetElementData ( "airportlvl" ) ) >= 35 then
				if vnxClientGetElementData ( "planelicenseb" )  == 1 then
						closejobofferairport()
						startFreightMission ( 519 )
				else
					addEventHandler("onClientRender", root, airport_error_window_b)
					--outputChatBox ( "Du braucht einen Flugschein Klasse B!", 0, 105, 145 )
				end
			else
				outputChatBox ( "Dein Flughafen-Level ist nicht hoch genug - erst ab 35 Punkte verfuegbar!", 0, 150, 255 )
			end
		elseif selected_airport_grid == "Schwerer Flug" then 
			if tonumber ( vnxClientGetElementData ( "airportlvl" ) ) >= 60 then
				if vnxClientGetElementData ( "planelicenseb" )  == 1 then
						closejobofferairport()
						startFreightMission ( 577 )
				else
					addEventHandler("onClientRender", root, airport_error_window_b)
					--outputChatBox ( "Du braucht einen Flugschein Klasse B!", 0, 105, 145 )
				end
			else
				outputChatBox ( "Dein Flughafen-Level ist nicht hoch genug - erst ab 60 Punkte verfuegbar!", 0, 150, 255 )
			end
		elseif selected_airport_grid == "Schwerer Flug Fortgeschritten" then 
			if tonumber ( vnxClientGetElementData ( "airportlvl" ) ) >= 65 then
				if vnxClientGetElementData ( "planelicenseb" )  == 1 then
						closejobofferairport()
						startFreightMission ( 592 )
				else
					addEventHandler("onClientRender", root, airport_error_window_b)
					--outputChatBox ( "Du braucht einen Flugschein Klasse B!", 0, 105, 145 )
				end
			else
				outputChatBox ( "Dein Flughafen-Level ist nicht hoch genug - erst ab 65 Punkte verfuegbar!", 0, 150, 255 )
			end
		else
			outputDebugString(selected_airport_grid)
		end
	end 
end