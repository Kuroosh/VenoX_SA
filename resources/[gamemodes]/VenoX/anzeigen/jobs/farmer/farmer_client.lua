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
	loadFarmerWindowGui_VnX()
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
	dxDrawText("Moin Moin "..name..", Du interesse an Gummi Stiefel?", sx*475, sy*430, sx*875, sy*464, tocolor(255, 255, 255, 255), 1.00, dxfont00_arial, "center", "center", false, false, false, false, false)
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



local screenX, screenY = guiGetScreenSize()
local sx, sy = screenX/1366, screenY/768
local farmerjob_status = "jobauswahl"



function close_farmerjob_gui()
	vnxDestroyWindow("farmer_gui")
	showCursor(false)
	farmerjob_status = "jobauswahl"
	removeEventHandler("onClientRender", root, render_farmerjob_vnx)
	vnxDestroyWindow("farmer_job_button1")
	vnxDestroyWindow("farmer_job_button2")
	vnxDestroyWindow("farmer_job_button3")
	vnxDestroyWindow("farmer_job_button4")
	vnxDestroyWindow("farmer_job_button_accept")
	vnxDestroyWindow("farmer_job_button_kuendigen")
	window_already_open = false 
end 
function render_farmerjob_vnx()
		dxDrawRectangle(sx*370, sy*195, sx*650, sy*5, tocolor(0, 105, 145, 178), false)
		dxDrawRectangle(sx*370, sy*516, sx*650, sy*5, tocolor(0, 105, 145, 178), false)
		--dxDrawRectangle(sx*370, sy*121, sx*650, sy*40, tocolor(0, 0, 0, 178), false)
		if farmerjob_status == nil or farmerjob_status == false or farmerjob_status == "jobauswahl" then 
			dxDrawText("Auf dem Feld : \nBitte wähle einen Auftrag aus...", sx*380 - 1, sy*211 - 1, sx*1010 - 1, sy*506 - 1, tocolor(0, 0, 0, 255), 1.10, dxfont0_arial, "center", "center", false, false, false, false, false)
			dxDrawText("Auf dem Feld : \nBitte wähle einen Auftrag aus...", sx*380 + 1, sy*211 - 1, sx*1010 + 1, sy*506 - 1, tocolor(0, 0, 0, 255), 1.10, dxfont0_arial, "center", "center", false, false, false, false, false)
			dxDrawText("Auf dem Feld : \nBitte wähle einen Auftrag aus...", sx*380 - 1, sy*211 + 1, sx*1010 - 1, sy*506 + 1, tocolor(0, 0, 0, 255), 1.10, dxfont0_arial, "center", "center", false, false, false, false, false)
			dxDrawText("Auf dem Feld : \nBitte wähle einen Auftrag aus...", sx*380 + 1, sy*211 + 1, sx*1010 + 1, sy*506 + 1, tocolor(0, 0, 0, 255), 1.10, dxfont0_arial, "center", "center", false, false, false, false, false)
			dxDrawText("Auf dem Feld : \nBitte wähle einen Auftrag aus...", sx*380, sy*211, sx*1010, sy*506, tocolor(255, 255, 255, 255), 1.10, dxfont0_arial, "center", "center", false, false, false, false, false)
		elseif farmerjob_status == "aufdemfeld_text" then 
			dxDrawText("Auf dem Feld : \nDu musst Getreide sähen\nund erhälst dafür pro\ngesähte Pflanze 30$.", sx*380 - 1, sy*211 - 1, sx*1010 - 1, sy*506 - 1, tocolor(0, 0, 0, 255), 1.10, dxfont0_arial, "center", "center", false, false, false, false, false)
			dxDrawText("Auf dem Feld : \nDu musst Getreide sähen\nund erhälst dafür pro\ngesähte Pflanze 30$.", sx*380 + 1, sy*211 - 1, sx*1010 + 1, sy*506 - 1, tocolor(0, 0, 0, 255), 1.10, dxfont0_arial, "center", "center", false, false, false, false, false)
			dxDrawText("Auf dem Feld : \nDu musst Getreide sähen\nund erhälst dafür pro\ngesähte Pflanze 30$.", sx*380 - 1, sy*211 + 1, sx*1010 - 1, sy*506 + 1, tocolor(0, 0, 0, 255), 1.10, dxfont0_arial, "center", "center", false, false, false, false, false)
			dxDrawText("Auf dem Feld : \nDu musst Getreide sähen\nund erhälst dafür pro\ngesähte Pflanze 30$.", sx*380 + 1, sy*211 + 1, sx*1010 + 1, sy*506 + 1, tocolor(0, 0, 0, 255), 1.10, dxfont0_arial, "center", "center", false, false, false, false, false)
			dxDrawText("Auf dem Feld : \nDu musst Getreide sähen\nund erhälst dafür pro\ngesähte Pflanze 30$.", sx*380, sy*211, sx*1010, sy*506, tocolor(255, 255, 255, 255), 1.10, dxfont0_arial, "center", "center", false, false, false, false, false)
		elseif farmerjob_status == "traktorfahren_text" then 
			dxDrawText("Auf dem Feld : \nDu musst Pflanzen mit\ndem Traktor ernten\n- dafür erhälst du\n45$ pro Pflanze.", sx*380 - 1, sy*211 - 1, sx*1010 - 1, sy*506 - 1, tocolor(0, 0, 0, 255), 1.10, dxfont0_arial, "center", "center", false, false, false, false, false)
			dxDrawText("Auf dem Feld : \nDu musst Pflanzen mit\ndem Traktor ernten\n- dafür erhälst du\n45$ pro Pflanze.", sx*380 + 1, sy*211 - 1, sx*1010 + 1, sy*506 - 1, tocolor(0, 0, 0, 255), 1.10, dxfont0_arial, "center", "center", false, false, false, false, false)
			dxDrawText("Auf dem Feld : \nDu musst Pflanzen mit\ndem Traktor ernten\n- dafür erhälst du\n45$ pro Pflanze.", sx*380 - 1, sy*211 + 1, sx*1010 - 1, sy*506 + 1, tocolor(0, 0, 0, 255), 1.10, dxfont0_arial, "center", "center", false, false, false, false, false)
			dxDrawText("Auf dem Feld : \nDu musst Pflanzen mit\ndem Traktor ernten\n- dafür erhälst du\n45$ pro Pflanze.", sx*380 + 1, sy*211 + 1, sx*1010 + 1, sy*506 + 1, tocolor(0, 0, 0, 255), 1.10, dxfont0_arial, "center", "center", false, false, false, false, false)
			dxDrawText("Auf dem Feld : \nDu musst Pflanzen mit\ndem Traktor ernten\n- dafür erhälst du\n45$ pro Pflanze.", sx*380, sy*211, sx*1010, sy*506, tocolor(255, 255, 255, 255), 1.10, dxfont0_arial, "center", "center", false, false, false, false, false)
		elseif farmerjob_status == "maehdresher_text" then 
			dxDrawText("Auf dem Feld : \nDu musst Getreide mit\ndem Mähdrescher\nernten - dafür erhälst\ndu 60$ pro Pflanze.", sx*380 - 1,sy*211 - 1, sx*1010 - 1, sy*506 - 1, tocolor(0, 0, 0, 255), 1.10, dxfont0_arial, "center", "center", false, false, false, false, false)
			dxDrawText("Auf dem Feld : \nDu musst Getreide mit\ndem Mähdrescher\nernten - dafür erhälst\ndu 60$ pro Pflanze.", sx*380 + 1, sy*211 - 1, sx*1010 + 1, sy*506 - 1, tocolor(0, 0, 0, 255), 1.10, dxfont0_arial, "center", "center", false, false, false, false, false)
			dxDrawText("Auf dem Feld : \nDu musst Getreide mit\ndem Mähdrescher\nernten - dafür erhälst\ndu 60$ pro Pflanze.", sx*380 - 1, sy*211 + 1, sx*1010 - 1, sy*506 + 1, tocolor(0, 0, 0, 255), 1.10, dxfont0_arial, "center", "center", false, false, false, false, false)
			dxDrawText("Auf dem Feld : \nDu musst Getreide mit\ndem Mähdrescher\nernten - dafür erhälst\ndu 60$ pro Pflanze.", sx*380 + 1, sy*211 + 1, sx*1010 + 1, sy*506 + 1, tocolor(0, 0, 0, 255), 1.10, dxfont0_arial, "center", "center", false, false, false, false, false)
			dxDrawText("Auf dem Feld : \nDu musst Getreide mit\ndem Mähdrescher\nernten - dafür erhälst\ndu 60$ pro Pflanze.", sx*380, sy*211, sx*1010, sy*506, tocolor(255, 255, 255, 255), 1.10, dxfont0_arial, "center", "center", false, false, false, false, false)
		elseif farmerjob_status == "hartzivrico" then 
			dxDrawText("Auf dem Feld : \nDu bekommst einen Bauer Skin. [ Hartz - IV Rico ]", sx*380 - 1, sy*211 - 1, sx*1010 - 1, sy*506 - 1, tocolor(0, 0, 0, 255), 1.10, dxfont0_arial, "center", "center", false, false, false, false, false)
			dxDrawText("Auf dem Feld : \nDu bekommst einen Bauer Skin. [ Hartz - IV Rico ]", sx*380 + 1, sy*211 - 1, sx*1010 + 1, sy*506 - 1, tocolor(0, 0, 0, 255), 1.10, dxfont0_arial, "center", "center", false, false, false, false, false)
			dxDrawText("Auf dem Feld : \nDu bekommst einen Bauer Skin. [ Hartz - IV Rico ]", sx*380 - 1, sy*211 + 1, sx*1010 - 1, sy*506 + 1, tocolor(0, 0, 0, 255), 1.10, dxfont0_arial, "center", "center", false, false, false, false, false)
			dxDrawText("Auf dem Feld : \nDu bekommst einen Bauer Skin. [ Hartz - IV Rico ]", sx*380 + 1, sy*211 + 1, sx*1010 + 1, sy*506 + 1, tocolor(0, 0, 0, 255), 1.10, dxfont0_arial, "center", "center", false, false, false, false, false)
			dxDrawText("Auf dem Feld : \nDu bekommst einen Bauer Skin. [ Hartz - IV Rico ]", sx*380, sy*211, sx*1010, sy*506, tocolor(255, 255, 255, 255), 1.10, dxfont0_arial, "center", "center", false, false, false, false, false)
		end 
end 

function render_aufdemfeld_job()
	farmerjob_status = "aufdemfeld_text"
	show_accept_job_farmer_btn()
end 
function render_traktor_farmer_job()
	farmerjob_status = "traktorfahren_text"
	show_accept_job_farmer_btn()
end
function render_maehdresher_farmer_job()
	farmerjob_status = "maehdresher_text"
	show_accept_job_farmer_btn()
end 
function render_ricovonvirtualderharzer_farmer_job()
	farmerjob_status = "hartzivrico"
	show_accept_job_farmer_btn()
end 

function show_accept_job_farmer_btn()
	vnxDrawButtonColored("farmer_job_button_accept", "Aufs Feld Arbeiten button", "Job Starten", sx*490, sy*531, sx*200, sy*34, tocolor(0, 150,0,178), tocolor(0,200,0,178), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0), "accept_start_vnx_farmerjob")
	vnxDrawButtonColored("farmer_job_button_kuendigen", "Aufs Feld Arbeiten button", "Job Kündigen", sx*700, sy*531, sx*200, sy*34, tocolor(150, 0,0,178), tocolor(200,0,0,178), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0), "getthefuckoutta_vnx_farmerjob")
end 
function getthefuckoutta_vnx_farmerjob()
	close_farmerjob_gui()
	executeCommandHandler("/cancel job", getLocalPlayer())
	triggerServerEvent("kuendigen_job", getLocalPlayer(), getLocalPlayer())
	outputChatBox("#00C8FF[#FFFFFFVinzent Cassel#00C8FF] FFFFFF: Du bist nun Arbeitslos... Meld dich am besten bei der Agentur oder so für Geld pff....", getLocalPlayer(), 255,255,255,true)
end 

function accept_start_vnx_farmerjob()
	if farmerjob_status == "aufdemfeld_text" then 
		triggerServerEvent ( "farmerJobRecieve", getLocalPlayer(), "job1" )
		close_farmerjob_gui()
	elseif 	farmerjob_status == "traktorfahren_text" then 
		triggerServerEvent ( "farmerJobRecieve", getLocalPlayer(), "job2" )
		close_farmerjob_gui()
	elseif farmerjob_status == "maehdresher_text" then 
		triggerServerEvent ( "farmerJobRecieve", getLocalPlayer(), "job3" )
		close_farmerjob_gui()
	elseif farmerjob_status == "hartzivrico" then 
		triggerServerEvent ( "farmerJobRecieve", getLocalPlayer(), "skin" )
		close_farmerjob_gui()
	else 
		outputChatBox("#00C8FF[#FFFFFFFarmer-Job#00C8FF] #FFFFFF: Du hast keinen Job ausgewählt!.", getLocalPlayer(), 255,255,255)
	end
end 

function loadFarmerWindowGui_VnX()
	if window_already_open == false then
		window_already_open = true 
		showCursor(true)
		vnxDrawWindow("farmer_gui", "Farmer_Window_ID", "Farmer Job", sx*370, sy*75, sx*650, sy*500, "close_farmerjob_gui")
		vnxDrawButtonColored("farmer_job_button1", "Aufs Feld Arbeiten button", "Auf dem Feld arbeiten", sx*380, sy*131, sx*150, sy*40, tocolor(0, 105,145,178), tocolor(0,150,200,178), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0), "render_aufdemfeld_job")
		vnxDrawButtonColored("farmer_job_button2", "Aufs Feld Arbeiten button", "Traktor fahren", sx*540, sy*131, sx*150, sy*40, tocolor(0, 105,145,178), tocolor(0,150,200,178), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0), "render_traktor_farmer_job")
		vnxDrawButtonColored("farmer_job_button3", "Aufs Feld Arbeiten button", "Mähdrescher fahren", sx*700, sy*131, sx*150, sy*40, tocolor(0, 105,145,178), tocolor(0,150,200,178), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0), "render_maehdresher_farmer_job")
		vnxDrawButtonColored("farmer_job_button4", "Aufs Feld Arbeiten button", "Farmeroutfit verwenden\n[Also Rico]", sx*860, sy*131, sx*150, sy*40, tocolor(0, 105,145,178), tocolor(0,150,200,178), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0), "render_ricovonvirtualderharzer_farmer_job")

		addEventHandler("onClientRender", root, render_farmerjob_vnx)
	end
end 
addEvent ( "showFarmingWindow", true )
addEventHandler ( "showFarmingWindow", getRootElement(), loadFarmerWindowGui_VnX )


