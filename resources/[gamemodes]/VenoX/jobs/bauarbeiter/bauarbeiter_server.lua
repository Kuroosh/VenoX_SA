-- "bauarbeiterLVL" einfügen --
--[[
jobicons["Bauarbeiter"] = createPickup ( 816.79998779297, 856.79998779297, 12.5, 3, 1239, 250 )
local blip = createBlip ( 816.79998779297, 856.79998779297, 12.5, 58, 2, 255, 255, 0, 255, 0, 200 )
local lastTimerMarkerHit = {}
local JobCounter = {}

addEventHandler ( "onPickupHit", jobicons["Bauarbeiter"],
	function ( player )
		if not vnxGetElementData ( player, "isInBauingJob" ) and not getPedOccupiedVehicle ( player ) then
			if vnxGetElementData ( player, "job" ) == "bauarbeiter" then
				triggerClientEvent ( player, "showBauingWindow", player )
			else
				infobox ( player, "Hier kannst du\nals Bauarbeiter -\ntippe /job, um den\nJob anzunehmen.", 5000, 200, 200, 0 )
			end
		end
	end
)

function BauarbeiterJobRecieve ( action )

	local player = client
	
	local sTime = getSecondTime ( 0 )
	lastTimerMarkerHit[player] = sTime - 4
	
	local inBauingJob = vnxGetElementData ( player, "isInBauingJob" ) == true
	local BauingJobCounter = JobCounter[player]
	if not BauingJobCounter then
		JobCounter[player] = 0
		BauingJobCounter = 0
	end
	if action == "skin" then
		if vnxGetElementData ( player, "bauarbeiterLVL" ) >= 500 then
			setElementModel ( player, 27 )
			vnxSetElementData ( player, "skinid", 27 )
		else
			infobox ( player, "Dafuer brauchst du\nBau-Level 500!", 5000, 125, 0, 0 )
		end
	elseif action == "job1" then
		if not inBauingJob then
			JobCounter[player] = 0
			showNextBauarbeiterJobMarker ( player, BauingJobCounter, 1 )
			infobox ( player, "Wenn du genug von\nder Arbeit hast, verlasse\neinfach den Bau oder\ntippe /cancel job.", 10000, 200, 200, 0 )
			vnxSetElementData ( player, "isInBauingJob", true )
			
			triggerClientEvent ( player, "startBauingJob", player )
		end
	elseif action == "job2" then
		if not inBauingJob then
			if vnxGetElementData ( player, "bauarbeiterLVL" ) >= 100 then
				if vnxGetElementData ( player, "carlicense" ) == 1 then
					JobCounter[player] = 0
					showNextBauarbeiterJobMarker ( player, BauingJobCounter, 2 )
					infobox ( player, "Wenn du genug von\nder Arbeit hast, verlasse\neinfach den Bau oder\ntippe /cancel job.", 10000, 200, 200, 0 )
					vnxSetElementData ( player, "isInBauingJob", true )
					
					local veh = createVehicle ( bauvehSpawns["id"][1], bauvehSpawns["x"][1], bauvehSpawns["y"][1], bauvehSpawns["z"][1], 0, 0, bauvehSpawns["rz"][1] )
					warpPedIntoVehicle ( player, veh )
					setVehicleLocked ( veh, true )
					activeCarGhostMode ( player, 5000 )
					addEventHandler ( "onPlayerQuit", player, BauingWorkerQuit )
					addEventHandler ( "onVehicleExit", veh,
						function ( player )
							triggerClientEvent ( player, "cancelBauing", player, "", "Bauing" )
						end
					)
					vnxSetElementData ( player, "BauingJobVeh", veh )
					
					triggerClientEvent ( player, "startBauingJob", player )
				else
					infobox ( player, "Du hast keinen\nFuehrerschein!", 5000, 200, 0, 0 )
				end
			else
				infobox ( player, "Dafuer brauchst du\nBau-Level 100!", 5000, 125, 0, 0 )
			end
		end
	elseif action == "job3" then
		if not inBauingJob then
			if vnxGetElementData ( player, "bauarbeiterLVL" ) >= 250 then
				if vnxGetElementData ( player, "lkwlicense" ) == 1 then
					JobCounter[player] = 0
					showNextBauarbeiterJobMarker ( player, BauingJobCounter, 3 )
					infobox ( player, "Wenn du genug von\nder Arbeit hast, verlasse\neinfach den Bau oder\ntippe /cancel job.", 10000, 200, 200, 0 )
					vnxSetElementData ( player, "isInBauingJob", true )
					
					local veh = createVehicle ( bauvehSpawns["id"][2], bauvehSpawns["x"][2], bauvehSpawns["y"][2], bauvehSpawns["z"][2], 0, 0, bauvehSpawns["rz"][2] )
					warpPedIntoVehicle ( player, veh )
					setVehicleLocked ( veh, true )
					activeCarGhostMode ( player, 5000 )
					addEventHandler ( "onPlayerQuit", player, BauingWorkerQuit )
					addEventHandler ( "onVehicleExit", veh,
						function ( player )
							triggerClientEvent ( player, "cancelBauing", player, "", "Bauing" )
						end
					)
					vnxSetElementData ( player, "BauingJobVeh", veh )
					
					triggerClientEvent ( player, "startBauingJob", player )
				else
					infobox ( player, "Du hast keinen\nLKW-Fuehrerschein!", 5000, 200, 0, 0 )
				end
			else
				infobox ( player, "Dafuer brauchst du\nBau-Level 250!", 5000, 125, 0, 0 )
			end
		end
	end
end
addEvent ( "BauarbeiterJobRecieve", true )
addEventHandler ( "BauarbeiterJobRecieve", getRootElement(), BauarbeiterJobRecieve )

function showNextBauarbeiterJobMarker ( player, BauingJobCounter, i )
	local time = lastTimerMarkerHit[player]
	local sTime = getSecondTime ( 0 )
	if true then--not time or time + 2 < sTime then
		BauingJobCounter = BauingJobCounter + 1
		if BauingJobCounter > BauarbeiterJobCounter[i] then
			BauingJobCounter = 1
			if i == 1 then
				infobox ( player, "Du erhälst einen\n100 $ Bonus für\ndie Anlage! (5 EXP) ", 5000, 0, 200, 0 )
				vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 100 )
				g_EXP:givePlayerEXP(player, 5)
			end
		end
		if BauingJobCounter % 10 == 0 then
			if i == 2 then
				infobox ( player, "Du erhälst 100 $\n10er-Bonus! (5 EXP)", 5000, 0, 200, 0 )
				vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 100 )
				g_EXP:givePlayerEXP(player, 5)
			else
				infobox ( player, "Du erhälst 200 $\n10er-Bonus! (5 EXP )", 5000, 0, 200, 0 )
				vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 200 )
				g_EXP:givePlayerEXP(player, 5)
			end
		end
		JobCounter[player] = BauingJobCounter
		if i == 2 or i == 3 then
			BauingJobCounter = math.random ( 1, BauarbeiterJobCounter[i] )
		end
		local x, y, z = BauingJob["x"][i][BauingJobCounter], BauingJob["y"][i][BauingJobCounter], BauingJob["z"][i][BauingJobCounter]
		triggerClientEvent ( player, "showNextBauarbeiterJobMarker", player, x, y, z, i )
		lastTimerMarkerHit[player] = sTime
	else
		local ip = getPlayerIP ( player )
		local serial = getPlayerSerial ( player )
		local pname = getPlayerName ( player )
		dbExec ( handler, "INSERT INTO ?? (??, ??, ??, ??, ??, ??) VALUES (?,?,?,?,?,?)", "ban", "UID", "AdminUID", "Grund", "Datum", "IP", "Serial", playerUID[pname], 0, 'Teleport', timestamp(), ip, serial)
		kickPlayer ( player, "Von: "..pname..", Grund: Teleport (Gebannt!)" )
	end
end

function BauarbeiterJobMarkerHit ( typ )

	local player = client
	local BauingJobCounter = JobCounter[player]
	if not BauingJobCounter then
		JobCounter[player] = 0
		BauingJobCounter = 0
	end
	
	local player = client
	local bauarbeiterLVL = vnxGetElementData ( player, "bauarbeiterLVL" )
	if typ == 1 then
		vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 50 )
		vnxSetElementData ( player, "bauarbeiterLVL", bauarbeiterLVL + 1 )
		setElementFrozen ( player, true )
		
		setPedAnimation ( player, "BOMBER", "BOM_Plant_Crouch_In", 1500, false, false, false, true )
		setTimer ( setPedAnimation, 1500, 1, player, "BOMBER", "BOM_Plant_Loop", -1, true, false, false, true )
		
		setTimer (
			function ( player )
				if isElement ( player ) then
					setTimer ( setPedAnimation, 1500, 1, player, "BOMBER", "BOM_Plant_Crouch_Out", 1500, false, false, false, true )
					setTimer ( setPedAnimation, 1500, 1, player )
					setTimer ( setElementFrozen, 1500, 1, player, false )
				end
			end,
		3500, 1, player )
		showNextBauarbeiterJobMarker ( player, BauingJobCounter, 1 )
	elseif typ == 2 then
		vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 110 )
		vnxSetElementData ( player, "bauarbeiterLVL", bauarbeiterLVL + 2 )
		showNextBauarbeiterJobMarker ( player, BauingJobCounter, 2 )
	elseif typ == 3 then
		vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 1200 )
		vnxSetElementData ( player, "bauarbeiterLVL", bauarbeiterLVL + 2 )
		showNextBauarbeiterJobMarker ( player, BauingJobCounter, 3 )
	end
	if bauarbeiterLVL == 100 then
		infobox ( player, "Du hast soeben\nBau-\nLevel 100 erreicht -\ndu kannst nun mit\ndem Dozer fahren. (500 EXP)", 5000, 0, 200, 0 )
		g_EXP:givePlayerEXP(player, 500)
	elseif bauarbeiterLVL == 250 then
		infobox ( player, "Du hast soeben\nBau-\nLevel 250 erreicht -\ndu kannst nun mit\ndem Beton Truck\nfahren. (1000 EXP)", 5000, 0, 200, 0 )
		g_EXP:givePlayerEXP(player, 1000)
	elseif bauarbeiterLVL == 500 then
		infobox ( player, "Du hast soeben Bau-\nLevel 500 erreicht -\ndu kannst nun das\nBauoutfit verwenden. (3000 EXP)", 5000, 0, 200, 0 )
		g_EXP:givePlayerEXP(player, 3000)
	end
end
addEvent ( "BauarbeiterJobMarkerHit", true )
addEventHandler ( "BauarbeiterJobMarkerHit", getRootElement(), BauarbeiterJobMarkerHit )

function cancelBauingJob ( player )

	if isElement ( vnxGetElementData ( player, "BauingJobVeh" ) ) then
		destroyElement ( vnxGetElementData ( player, "BauingJobVeh" ) )
	end
	vnxSetElementData ( player, "BauingJobVeh", false )
	vnxSetElementData ( player, "isInBauingJob", false )
	removeEventHandler ( "onPlayerQuit", player, BauingWorkerQuit )
end
addEvent ( "cancelBauingJob", true )
addEventHandler ( "cancelBauingJob", getRootElement(),
	function ()
		cancelBauingJob ( client )
	end
)

function BauingWorkerQuit ()

	cancelBauingJob ( source )
end

BauarbeiterJobCounter = {}
BauingJob = {}
	BauingJob["x"] = {}
	BauingJob["y"] = {}
	BauingJob["z"] = {}
	for i = 1, 3 do
		BauingJob["x"][i] = {}
		BauingJob["y"][i] = {}
		BauingJob["z"][i] = {}
		BauarbeiterJobCounter[i] = {}
	end
	bauvehSpawns = {}
	bauvehSpawns["id"] = {}
	bauvehSpawns["x"] = {}
	bauvehSpawns["y"] = {}
	bauvehSpawns["z"] = {}
	bauvehSpawns["rz"] = {}

bauvehSpawns["id"][1], bauvehSpawns["x"][1], bauvehSpawns["y"][1], bauvehSpawns["z"][1], bauvehSpawns["rz"][1] = 486, 753.40002441406, 885.40002441406, -0.89999997615814, 10
bauvehSpawns["id"][2], bauvehSpawns["x"][2], bauvehSpawns["y"][2], bauvehSpawns["z"][2], bauvehSpawns["rz"][2] = 524, 351.60000610352, 891.90002441406, 21.5, 340

local i = 1
BauingJob["x"][1][i], BauingJob["y"][1][i], BauingJob["z"][1][i] = 688.09997558594, 841.70001220703, -39---1--
i = i + 1
BauingJob["x"][1][i], BauingJob["y"][1][i], BauingJob["z"][1][i] = 677.20001220703, 821.70001220703, -39---2--
i = i + 1
BauingJob["x"][1][i], BauingJob["y"][1][i], BauingJob["z"][1][i] = 533.59997558594, 842.5, -42.5---3--
i = i + 1
BauingJob["x"][1][i], BauingJob["y"][1][i], BauingJob["z"][1][i] = 581.70001220703, 882.79998779297, -44.200000762939---4--
i = i + 1
BauingJob["x"][1][i], BauingJob["y"][1][i], BauingJob["z"][1][i] = 618.59997558594, 890.90002441406, -37.099998474121---5--
i = i + 1
BauingJob["x"][1][i], BauingJob["y"][1][i], BauingJob["z"][1][i] = 627.90002441406, 894.79998779297, -41.099998474121---6--
i = i + 1
BauingJob["x"][1][i], BauingJob["y"][1][i], BauingJob["z"][1][i] = 564.90002441406, 823.90002441406, -29.799999237061---7--
i = i + 1
BauingJob["x"][1][i], BauingJob["y"][1][i], BauingJob["z"][1][i] = 568.29998779297, 824.5, -22.10000038147---8--
i = i + 1
BauingJob["x"][1][i], BauingJob["y"][1][i], BauingJob["z"][1][i] = 638.90002441406, 851.5, -43---9--
i = i + 1
BauingJob["x"][1][i], BauingJob["y"][1][i], BauingJob["z"][1][i] = 637.59997558594, 831.5, -43---10--

BauarbeiterJobCounter[1] = i



i = 1
	BauingJob["x"][2][i], BauingJob["y"][2][i], BauingJob["z"][2][i] = 709.20001220703, 915.79998779297, -18.60000038147---1--
	i = i + 1
	BauingJob["x"][2][i], BauingJob["y"][2][i], BauingJob["z"][2][i] = 691.5, 831.70001220703, -30.200000762939---2--
	i = i + 1
	BauingJob["x"][2][i], BauingJob["y"][2][i], BauingJob["z"][2][i] = 510.10000610352, 795, -22---3--
	i = i + 1
	BauingJob["x"][2][i], BauingJob["y"][2][i], BauingJob["z"][2][i] = 470.20001220703, 879.400002441406, -29.200000762939---4--
	i = i + 1
	BauingJob["x"][2][i], BauingJob["y"][2][i], BauingJob["z"][2][i] = 700.7998779297, 995.09997558594, 5.9000000953674---5--
	i = i + 1
	BauingJob["x"][2][i], BauingJob["y"][2][i], BauingJob["z"][2][i] = 523.92993164063, 967.85668945313, -23.15---6--

	BauarbeiterJobCounter[2] = i



i = 1
	BauingJob["x"][3][i], BauingJob["y"][3][i], BauingJob["z"][3][i] = 2468.5, 1942, 10---1--
	i = i + 1
	BauingJob["x"][3][i], BauingJob["y"][3][i], BauingJob["z"][3][i] = 2656.5, 864.59997558594, 6.1999998092651---2--
	i = i + 1
	BauingJob["x"][3][i], BauingJob["y"][3][i], BauingJob["z"][3][i] = 1257.5, -1258.1999511719, 13.10000038147---3--
	i = i + 1
	BauingJob["x"][3][i], BauingJob["y"][3][i], BauingJob["z"][3][i] = -2401.5, 2348.8000488281, 5---4--
	i = i + 1
	BauingJob["x"][3][i], BauingJob["y"][3][i], BauingJob["z"][3][i] = -2366.3000488281, -100.90000152588, 35.299999237061---5--
	

	BauarbeiterJobCounter[3] = i
]]