function acceptjobfarmer()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	showCursor(true)
	vnxDrawWindow("AcceptJob_farmer_Main", "Das HauptWindow", "Jobangebot von Vincent Cassel", sx*450, sy*200, sx*450, sy*350, "closejobofferfarmer")
	vnxDrawImage("Frank_Der_Arbeitgeber","Frank der Manager",sx*475,sy*230,sx*400,sy*200,":VenoX/anzeigen/jobs/images/vincent_cassel")
	vnxDrawButtonColored("Accept_Job_farmer", "Der Vincent Job button", "Ja sehr gerne...",  sx*475, sy*470, sx*150, sy*60, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,125,0,255), tocolor(0,255,0,255), "accept_job_farmer_btn")
	vnxDrawButtonColored("Nope_Job_farmer", "Der Vincent Job button", "Vielleicht\nwann anders...", sx*725, sy*470, sx*150, sy*60, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(125,0,0,255), tocolor(180,0,0,255), "decline_job_farmer_btn")
	addEventHandler("onClientRender", root, acceptjob_text_farmer)
end
addEvent ( "showacceptjobfarmer_gui", true )
addEventHandler ( "showacceptjobfarmer_gui", getRootElement(), acceptjobfarmer )

function accept_job_farmer_btn(player)
	closejobofferfarmer()
	triggerServerEvent ( "AcceptJob_farmer", getLocalPlayer() )
	farmerJob_Main_Window()
end
function decline_job_farmer_btn()
	closejobofferfarmer()
end
function closejobofferfarmer()
	showCursor(false)
	showChat(true)
	setPlayerHudComponentVisible("radar", true)
	vnxDestroyWindow("AcceptJob_farmer_Main")
	vnxDestroyWindow("Frank_Der_Arbeitgeber")
	vnxDestroyWindow("Accept_Job_farmer")
	vnxDestroyWindow("Nope_Job_farmer")
	vnxDestroyWindow("farmer_Header")
	vnxDestroyWindow("farmer_grid_sel")
	vnxDestroyWindow("select_button_farmer")
	removeEventHandler("onClientRender", root, acceptjob_text_farmer)
	removeEventHandler("onClientRender", root, farmer_job_lvlshow)
	removeEventHandler("onClientRender", root, farmer_error_window)
	removeEventHandler("onClientRender", root, farmer_error_window_a)
	removeEventHandler("onClientRender", root, farmer_error_window_b)
	vnxDestroyWindow("select_kuendigung_farmer")
end
local dxfont0_arial = dxCreateFont(":pr0/files/fonts/arial.ttf", 10)
function acceptjob_text_farmer(player)

	local name = getPlayerName(getLocalPlayer())
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	dxDrawText("Moin Moin "..name..", Du interesse an Gummi Stiefel?", sx*475, sy*430, sx*875, sy*464, tocolor(255, 255, 255, 255), 1.00, dxfont0_arial, "center", "center", false, false, false, false, false)
end




local farmingJobTargetMarker, farmingAreaMarker
local playerToGroundLevel = 1.3085

function showNextFarmerJobMarker ( x, y, z, typ )

	local size = 1
	if typ == 2 then
		size = 10
	elseif typ == 3 then
		size = 10
	end
	local marker = createMarker ( x, y, z, "checkpoint", size, 200, 0, 0, 125, nil )
	farmingJobTargetMarker = marker
	local blip = createBlip ( x, y, z, 0, 2, 255, 0, 0, 255, 0, 99999 )
	setElementParent ( blip, marker )
	if typ == 1 then
		addEventHandler ( "onClientMarkerHit", marker, farmerJobMarker1Hit )
	elseif typ == 2 then
		addEventHandler ( "onClientMarkerHit", marker, farmerJobMarker2Hit )
	elseif typ == 3 then
		addEventHandler ( "onClientMarkerHit", marker, farmerJobMarker3Hit )
	end
end
addEvent ( "showNextFarmerJobMarker", true )
addEventHandler ( "showNextFarmerJobMarker", getRootElement(), showNextFarmerJobMarker )

function farmerJobMarker1Hit ( player )

	if player == lp and not getPedOccupiedVehicle ( player ) then
		setElementFrozen ( lp, true )
		local x, y, z = getElementPosition ( lp )
		local z = z - playerToGroundLevel * 2
		setTimer (
			function ( x, y, z )
				local crop = createObject ( 3409, x, y, z )
				moveObject ( crop, 5000, x, y, z + playerToGroundLevel )
				setTimer ( destroyElement, 60000, 1, crop )
			end,
		1500, 1, x, y, z )
		
		triggerServerEvent ( "farmerJobMarkerHit", lp, 1 )
		destroyElement ( source )
	end
end

function farmerJobMarker2Hit ( player )

	if getPedOccupiedVehicle ( lp ) and player == lp then
		triggerServerEvent ( "farmerJobMarkerHit", lp, 2 )
		destroyElement ( source )
	end
end
function farmerJobMarker3Hit ( player )

	if getPedOccupiedVehicle ( lp ) and player == lp then
		triggerServerEvent ( "farmerJobMarkerHit", lp, 3 )
		destroyElement ( source )
	end
end

function startFarmingJob ()

	farmingAreaMarker = createMarker ( -1186.4422607422, -1048.7531738281, 129.21875, "checkpoint", 450, 200, 0, 0, 125, nil )
	addEventHandler ( "onClientPlayerWasted", lp, clientFarmerWasted )
	addEventHandler ( "onClientMarkerLeave", farmingAreaMarker,
		function ( player )
			if player == lp then
				cancel_farming ( "", "farming" )
			end
		end
	)
end
addEvent ( "startFarmingJob", true )
addEventHandler ( "startFarmingJob", getRootElement(), startFarmingJob )

function cancel_farming ( cmd, arg )

	if arg == "farming" or arg == "job" then
		if isElement ( farmingAreaMarker ) then
			destroyElement ( farmingAreaMarker )
		end
		if isElement ( farmingJobTargetMarker ) then
			destroyElement ( farmingJobTargetMarker )
		end
		triggerServerEvent ( "cancelFarmingJob", lp )
		
		infobox ( "Du hast die Arbeit\nabgebrochen.", 5000, 125, 0, 0 )
		removeEventHandler ( "onClientPlayerWasted", lp, clientFarmerWasted )
	end
end
addEvent ( "cancelFarming", true )
addEventHandler ( "cancelFarming", getRootElement(), cancel_farming )
addCommandHandler ( "cancel", cancel_farming )

function clientFarmerWasted ()
	cancel_farming ( "", "farming" )
	removeEventHandler ( "onClientPlayerWasted", lp, clientFarmerWasted )
end
