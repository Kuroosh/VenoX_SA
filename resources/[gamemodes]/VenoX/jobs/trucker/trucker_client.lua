function showTransporteurRouteSelection_func ()

	local skill = vnxClientGetElementData ( "truckerlvl" )
	if skill > 50 then
		skill = 50
	end
	
	gWindow["transporteur"] = guiCreateWindow(screenwidth/2-329/2,screenheight/2-209/2,329,209,"Transporteur",false)
	guiSetAlpha ( gWindow["transporteur"], 1 )
	gLabel[1] = guiCreateLabel(10,22,307,27,"Hier kannst du einen Auftrag annehmen und deinen\nLevel einsehen, der pro Auftrag steigt.",false,gWindow["transporteur"])
	guiLabelSetColor(gLabel[1],200,200,0)
	guiLabelSetVerticalAlign(gLabel[1],"top")
	guiLabelSetHorizontalAlign(gLabel[1],"left",false)
	guiSetFont(gLabel[1],"default-bold-small")
	
	gImage["skill"] = createSkillBar ( skill / 50, gWindow["transporteur"], 30, 73, 77, 21 )
	
	gLabel[2] = guiCreateLabel(20,2,38,16,"LVL "..skill,false,gImage["skill"])
	guiLabelSetColor(gLabel[2],0,0,0)
	guiLabelSetVerticalAlign(gLabel[2],"top")
	guiLabelSetHorizontalAlign(gLabel[2],"left",false)
	guiSetFont(gLabel[2],"default-bold-small")
	gLabel[3] = guiCreateLabel(19,57,85,18,"Dein Level:",false,gWindow["transporteur"])
	guiLabelSetColor(gLabel[3],255,255,255)
	guiLabelSetVerticalAlign(gLabel[3],"top")
	guiLabelSetHorizontalAlign(gLabel[3],"left",false)
	guiSetFont(gLabel[3],"default-bold-small")
	gLabel[4] = guiCreateLabel(194,56,57,16,"Fahrzeug",false,gWindow["transporteur"])
	guiLabelSetColor(gLabel[4],255,255,255)
	guiLabelSetVerticalAlign(gLabel[4],"top")
	guiLabelSetHorizontalAlign(gLabel[4],"left",false)
	guiSetFont(gLabel[4],"default-bold-small")
	
	if skill >= 5 then
		gCheck["truckerTime"] = guiCreateCheckBox(14,101,88,23,"Zeitfahrt",false,false,gWindow["transporteur"])
		guiSetFont(gCheck["truckerTime"],"default-bold-small")
		if skill >= 20 then
			gCheck["truckerDanger"] = guiCreateCheckBox(14,121,93,23,"Gefahrengut",false,false,gWindow["transporteur"])
			guiSetFont(gCheck["truckerDanger"],"default-bold-small")
		end
	end
	
	gRadio["truckerPizzaboy"] = guiCreateRadioButton(163,72,107,16,"Pizzaboy",false,gWindow["transporteur"])
	guiSetFont(gRadio["truckerPizzaboy"],"default-bold-small")
	--guiLabelSetColor ( gRadio["truckerPizzaboy"], 255, 0, 0 )
	if skill >= 10 then
		gRadio["truckerVan"] = guiCreateRadioButton(163,88,107,16,"Van",false,gWindow["transporteur"])
		guiSetFont(gRadio["truckerVan"],"default-bold-small")
		if skill >= 15 then
			gRadio["truckerRoadtrain"] = guiCreateRadioButton(163,88+16,107,16,"Roadtrain",false,gWindow["transporteur"])
			guiSetFont(gRadio["truckerRoadtrain"],"default-bold-small")
			if skill >= 25 then
				gRadio["truckerLinerunner"] = guiCreateRadioButton(163,88+16*2,107,16,"Linerunner",false,gWindow["transporteur"])
				guiSetFont(gRadio["truckerLinerunner"],"default-bold-small")
				if skill >= 30 then
					gRadio["truckerTanker"] = guiCreateRadioButton(163,88+16*3,107,16,"Tanker",false,gWindow["transporteur"])
					guiSetFont(gRadio["truckerTanker"],"default-bold-small")
				end
			end
		end
	end
	
	gButton["startTour"] = guiCreateButton(39,152+5,77,40,"Tour starten",false,gWindow["transporteur"])
	gButton["closeTourButton"] = guiCreateButton(329-39-77,152+5,77,40,"Fenster schliessen",false,gWindow["transporteur"])
	
	gLabel[5] = guiCreateLabel(123,155,55,16,"Gewinn:",false,gWindow["transporteur"])
	guiLabelSetColor(gLabel[5],200,200,0)
	guiLabelSetVerticalAlign(gLabel[5],"top")
	guiLabelSetHorizontalAlign(gLabel[5],"left",false)
	guiSetFont(gLabel[5],"default-bold-small")
	gLabel["paymentForJob"] = guiCreateLabel(136,170,55,16,"0 $",false,gWindow["transporteur"])
	guiLabelSetColor(gLabel["paymentForJob"],0,200,0)
	guiLabelSetVerticalAlign(gLabel["paymentForJob"],"top")
	guiLabelSetHorizontalAlign(gLabel["paymentForJob"],"left",false)
	guiSetFont(gLabel["paymentForJob"],"default-bold-small")
	
	addEventHandler ( "onClientGUIClick", gButton["closeTourButton"],
		function ()
			destroyElement ( gWindow["transporteur"] )
			showCursor ( false )
			setElementClicked ( false )
		end,
	false )
	addEventHandler ( "onClientGUIClick", gButton["startTour"],
		function ()
			showCursor ( false )
			setElementClicked ( false )
			
			if guiRadioButtonGetSelected ( gRadio["truckerPizzaboy"] ) then
				triggerServerEvent ( "startTransporteurRoute", lp, "pizza", guiCheckBoxGetSelected ( gCheck["truckerTime"] ), guiCheckBoxGetSelected ( gCheck["truckerDanger"] ) )
				
			elseif guiRadioButtonGetSelected ( gRadio["truckerVan"] ) then
				triggerServerEvent ( "startTransporteurRoute", lp, "van", guiCheckBoxGetSelected ( gCheck["truckerTime"] ), guiCheckBoxGetSelected ( gCheck["truckerDanger"] ) )
			elseif guiRadioButtonGetSelected ( gRadio["truckerRoadtrain"] ) then
				triggerServerEvent ( "startTransporteurRoute", lp, "roadtrain", guiCheckBoxGetSelected ( gCheck["truckerTime"] ), guiCheckBoxGetSelected ( gCheck["truckerDanger"] ) )
			elseif guiRadioButtonGetSelected ( gRadio["truckerLinerunner"] ) then
				triggerServerEvent ( "startTransporteurRoute", lp, "linerunner", guiCheckBoxGetSelected ( gCheck["truckerTime"] ), guiCheckBoxGetSelected ( gCheck["truckerDanger"] ) )
			elseif guiRadioButtonGetSelected ( gRadio["truckerTanker"] ) then
				triggerServerEvent ( "startTransporteurRoute", lp, "tanker", guiCheckBoxGetSelected ( gCheck["truckerTime"] ), guiCheckBoxGetSelected ( gCheck["truckerDanger"] ) )
			end
			destroyElement ( gWindow["transporteur"] )
		end,
	false )
	refreshTruckerMoneyAmount ()
end
addEvent ( "showTransporteurRouteSelection", true )
addEventHandler ( "showTransporteurRouteSelection", getRootElement(), showTransporteurRouteSelection_func )

function refreshTruckerMoneyAmount ()

	if isElement ( gWindow["transporteur"] ) then
		local veh
		if gRadio["truckerPizzaboy"] and guiRadioButtonGetSelected ( gRadio["truckerPizzaboy"] ) then
			veh = "pizza"
		elseif gRadio["truckerVan"] and guiRadioButtonGetSelected ( gRadio["truckerVan"] ) then
			veh = "van"
		elseif gRadio["truckerRoadtrain"] and guiRadioButtonGetSelected ( gRadio["truckerRoadtrain"] ) then
			veh = "roadtrain"
		elseif gRadio["truckerLinerunner"] and guiRadioButtonGetSelected ( gRadio["truckerLinerunner"] ) then
			veh = "linerunner"
		elseif gRadio["truckerTanker"] and guiRadioButtonGetSelected ( gRadio["truckerTanker"] ) then
			veh = "tanker"
		end
		
		local amount = calcTruckerJobTourValue ( veh, gCheck["truckerTime"] and guiCheckBoxGetSelected ( gCheck["truckerTime"] ) or 0, gCheck["truckerDanger"] and guiCheckBoxGetSelected ( gCheck["truckerDanger"] ) or 0 )
		
		guiSetText ( gLabel["paymentForJob"], amount.."$" )
		setTimer ( refreshTruckerMoneyAmount, 200, 1 )
	end
end

local truckerJobMissionTimeLeft

function startTruckerJobTimer_func ( seconds )

	truckerJobMissionTimeLeft = seconds
	addEventHandler ( "onClientRender", getRootElement(), renderTruckerJobTimer )
	setTimer ( truckerJobTime, 950, 1 )
end
addEvent ( "startTruckerJobTimer", true )
addEventHandler ( "startTruckerJobTimer", getRootElement(), startTruckerJobTimer_func )

function truckerJobTime ()

	local veh = getPedOccupiedVehicle ( lp )
	if veh then
		if isElement ( veh ) then
			truckerJobMissionTimeLeft = truckerJobMissionTimeLeft - 1
			if truckerJobMissionTimeLeft > 0 then
				setTimer ( truckerJobTime, 950, 1 )
			else
				removeEventHandler ( "onClientRender", getRootElement(), renderTruckerJobTimer )
				triggerServerEvent ( "truckerJobTimeExpired", lp )
				setTimer (
					function ()
						removeEventHandler ( "onClientRender", getRootElement(), renderTruckerJobTimer )
					end,
				2000, 1 )
			end
		else
			removeEventHandler ( "onClientRender", getRootElement(), renderTruckerJobTimer )
		end
	else
		removeEventHandler ( "onClientRender", getRootElement(), renderTruckerJobTimer )
	end
end

function renderTruckerJobTimer ()

	dxDrawText ( truckerJobMissionTimeLeft.." Sekunden", 1, 1, screenwidth+2, screenheight+2, tocolor ( 0, 0, 0, 255), 1, "bankgothic", "center", "bottom", false, false, true )
	dxDrawText ( truckerJobMissionTimeLeft.." Sekunden", 0, 0, screenwidth, screenheight, tocolor ( 200, 200, 200, 255), 1, "bankgothic", "center", "bottom", false, false, true )
end

-- Outsource? --
local missionStateToShow = ""
local mStateC = { ["r"]=0, ["g"]=0, ["b"]=0 }

function showMissionState ( text, time, r, g, b )

	missionStateToShow = text
	mStateC["r"] = r
	mStateC["g"] = g
	mStateC["b"] = b
	addEventHandler ( "onClientRender", getRootElement(), renderMissionState )
	setTimer ( 
		function ()
			removeEventHandler ( "onClientRender", getRootElement(), renderMissionState )
		end,
	time, 1 )
end
addEvent ( "showMissionState", true )
addEventHandler ( "showMissionState", getRootElement(), showMissionState )

function renderMissionState ()

	dxDrawText ( missionStateToShow, 2, 2, screenwidth+2, screenheight+2, tocolor ( 0, 0, 0, 255), 3, "pricedown", "center", "center", false, false, true )
	dxDrawText ( missionStateToShow, 0, 0, screenwidth, screenheight, tocolor ( mStateC["r"], mStateC["g"], mStateC["b"], 255), 3, "pricedown", "center", "center", false, false, true )
end

function showTruckerJobDamageBar_func ()

	gWindow["vehDamage"] = guiCreateWindow(screenwidth/2-137/2,0,137,58,"Schaden",false)
	guiSetAlpha(gWindow["vehDamage"],1)
	gProgress["vehDamage"] = guiCreateProgressBar(9,19,118,29,false,gWindow["vehDamage"])
	guiSetAlpha(gProgress["vehDamage"],1)
	setTimer ( checkTruckerJobVehDamage, 200, 1 )
end
addEvent ( "showTruckerJobDamageBar", true )
addEventHandler ( "showTruckerJobDamageBar", getRootElement(), showTruckerJobDamageBar_func )

function checkTruckerJobVehDamage ()

	local veh = getPedOccupiedVehicle ( lp )
	if veh then
		if isElement ( veh ) then
			if not isPedDead ( lp ) then
				local dmg = ( 1000 - getElementHealth ( veh ) ) * 3
				if dmg > 100 then
					dmg = 100
				end
				guiProgressBarSetProgress ( gProgress["vehDamage"], dmg )
				if dmg >= 100 then
					triggerServerEvent ( "explodeMyTruck", lp )
				else
					setTimer ( checkTruckerJobVehDamage, 200, 1 )
					return nil
				end
			end
		end
	end
	destroyElement ( gWindow["vehDamage"] )
end