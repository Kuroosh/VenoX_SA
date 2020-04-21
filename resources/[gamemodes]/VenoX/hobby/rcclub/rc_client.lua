--[[local rcClubPickup = createPickup ( -2241.82, 128.58, 34.96, 3, 1239, 50, 0 )
createBlip ( -2241.82, 128.58, 34.96, 47, 2, 255, 0, 0, 255, 0, 200, getRootElement() )

local rcVanBar

function showRCClubWindow ()

	showCursor ( true )
	setElementClicked ( true )
	
	if isElement ( gWindow["rcClub"] ) then
		destroyElement ( gWindow["rcClub"] )
	end
	
	gWindow["rcClub"] = guiCreateWindow(screenwidth/2-298/2,screenheight/2-190/2,298,190,"RC-Club",false)
	guiSetAlpha(gWindow["rcClub"],1)
	
	if vnxClientGetElementData ( "club" ) ~= "rc" then
		gButton["joinLeaveRCClub"] = guiCreateButton(9,19,66,43,"Mitglied\nwerden",false,gWindow["rcClub"])
		guiSetAlpha(gButton["joinLeaveRCClub"],1)
		guiSetFont(gButton["joinLeaveRCClub"],"default-bold-small")
	else
		gButton["joinLeaveRCClub"] = guiCreateButton(9,19,66,43,"Club\nverlassen",false,gWindow["rcClub"])
		guiSetAlpha(gButton["joinLeaveRCClub"],1)
		guiSetFont(gButton["joinLeaveRCClub"],"default-bold-small")
	end
	
	gButton["buyRCVan"] = guiCreateButton(85,44,67,43,"RC-Van\nkaufen",false,gWindow["rcClub"])
	guiSetAlpha(gButton["buyRCVan"],1)
	guiSetFont(gButton["buyRCVan"],"default-bold-small")
	gButton["closeRCClub"] = guiCreateButton(9,72,66,43,"Schliessen",false,gWindow["rcClub"])
	guiSetAlpha(gButton["closeRCClub"],1)
	guiSetFont(gButton["closeRCClub"],"default-bold-small")
	
	gRadio["rcClubCar"] = guiCreateRadioButton(162,20,119,20,"RC Bandit",false,gWindow["rcClub"])
	guiSetAlpha(gRadio["rcClubCar"],1)
	guiSetFont(gRadio["rcClubCar"],"default-bold-small")
	gRadio["rcClubChopper"] = guiCreateRadioButton(162,45,119,20,"RC Goblin",false,gWindow["rcClub"])
	guiSetAlpha(gRadio["rcClubChopper"],1)
	guiSetFont(gRadio["rcClubChopper"],"default-bold-small")
	gRadio["rcClubTiger"] = guiCreateRadioButton(162,70,119,20,"RC Tiger",false,gWindow["rcClub"])
	guiSetAlpha(gRadio["rcClubTiger"],1)
	guiSetFont(gRadio["rcClubTiger"],"default-bold-small")
	gRadio["rcClubBaron"] = guiCreateRadioButton(162,95,119,20,"RC Baron",false,gWindow["rcClub"])
	guiSetAlpha(gRadio["rcClubBaron"],1)
	guiSetFont(gRadio["rcClubBaron"],"default-bold-small")
	
	gLabel[2] = guiCreateLabel(250,20,278,64,"10.000 $",false,gWindow["rcClub"])
	guiSetAlpha(gLabel[2],1)
	guiLabelSetColor(gLabel[2],0,200,0)
	guiLabelSetVerticalAlign(gLabel[2],"top")
	guiLabelSetHorizontalAlign(gLabel[2],"left",false)
	guiSetFont(gLabel[2],"default-bold-small")
	gLabel[4] = guiCreateLabel(250,45,278,64,"17.500 $",false,gWindow["rcClub"])
	guiSetAlpha(gLabel[4],1)
	guiLabelSetColor(gLabel[4],0,200,0)
	guiLabelSetVerticalAlign(gLabel[4],"top")
	guiLabelSetHorizontalAlign(gLabel[4],"left",false)
	guiSetFont(gLabel[4],"default-bold-small")
	gLabel[3] = guiCreateLabel(250,70,278,64,"22.500 $",false,gWindow["rcClub"])
	guiSetAlpha(gLabel[3],1)
	guiLabelSetColor(gLabel[3],0,200,0)
	guiLabelSetVerticalAlign(gLabel[3],"top")
	guiLabelSetHorizontalAlign(gLabel[3],"left",false)
	guiSetFont(gLabel[3],"default-bold-small")
	gLabel[3] = guiCreateLabel(250,95,278,64,"32.500 $",false,gWindow["rcClub"])
	guiSetAlpha(gLabel[3],1)
	guiLabelSetColor(gLabel[3],0,200,0)
	guiLabelSetVerticalAlign(gLabel[3],"top")
	guiLabelSetHorizontalAlign(gLabel[3],"left",false)
	guiSetFont(gLabel[3],"default-bold-small")
	
	addEventHandler ( "onClientGUIClick", gButton["closeRCClub"],
		function ()
			showCursor ( false )
			setElementClicked ( false )
			destroyElement ( gWindow["rcClub"] )
		end,
	false )
	addEventHandler ( "onClientGUIClick", gButton["joinLeaveRCClub"],
		function ()
			if guiGetText ( gButton["joinLeaveRCClub"] ) == "Mitglied\nwerden" then
				guiSetText ( gButton["joinLeaveRCClub"], "Club\nverlassen" )
				triggerServerEvent ( "joinRCClub", lp )
			else
				guiSetText ( gButton["joinLeaveRCClub"], "Mitglied\nwerden" )
				triggerServerEvent ( "leaveGardenclub", lp )
			end
		end,
	false )
	addEventHandler ( "onClientGUIClick", gButton["buyRCVan"],
		function ()
			if guiRadioButtonGetSelected ( gRadio["rcClubTiger"] ) or guiRadioButtonGetSelected ( gRadio["rcClubCar"] ) or guiRadioButtonGetSelected ( gRadio["rcClubBaron"] ) or guiRadioButtonGetSelected ( gRadio["rcClubChopper"] ) then
				if guiRadioButtonGetSelected ( gRadio["rcClubCar"] ) then
					triggerServerEvent ( "buyRCVehicleVan", lp, "car" )
				elseif guiRadioButtonGetSelected ( gRadio["rcClubBaron"] ) then
					triggerServerEvent ( "buyRCVehicleVan", lp, "baron" )
				elseif guiRadioButtonGetSelected ( gRadio["rcClubTiger"] ) then
					triggerServerEvent ( "buyRCVehicleVan", lp, "tiger" )
				elseif guiRadioButtonGetSelected ( gRadio["rcClubChopper"] ) then
					triggerServerEvent ( "buyRCVehicleVan", lp, "goblin" )
				end
				showCursor ( false )
				setElementClicked ( false )
				destroyElement ( gWindow["rcClub"] )
			end
		end,
	false )
	
	gLabel[1] = guiCreateLabel(10,123,278,64,"Im RC-Club kannst du Vans erwerben, von denen\naus du RC Fahrzeuge kontrollieren kannst.\nKosten:\n250 $ pro Beitritt sowie 50 $ / Abrechnung",false,gWindow["rcClub"])
	guiSetAlpha(gLabel[1],1)
	guiLabelSetColor(gLabel[1],200,200,0)
	guiLabelSetVerticalAlign(gLabel[1],"top")
	guiLabelSetHorizontalAlign(gLabel[1],"left",false)
	guiSetFont(gLabel[1],"default-bold-small")
end

addEventHandler ( "onClientPickupHit", rcClubPickup,
	function ( hit )
		if hit == lp then
			showRCClubWindow ()
		end
	end
)

function rcVehicleEnter ( veh )

	if source == lp then
		if getElementModel ( veh ) == 464 then
			toggleControl ( "vehicle_fire", false )
			toggleControl ( "vehicle_secondary_fire", false )
			
			addEventHandler ( "onClientPlayerVehicleExit", lp, rcVehicleExit )
		end
	end
end
addEventHandler ( "onClientPlayerVehicleEnter", getRootElement(), rcVehicleEnter )

function rcVehicleExit ()

	toggleControl ( "vehicle_fire", true )
	toggleControl ( "vehicle_secondary_fire", true )
end

function showDistanceToRCVan ( veh )

	rcVanBar = vioGuiCreateProgressBar ( screenwidth / 2 - 100, screenheight - 75 + 10 + 30, 72 * 1.5, 15 * 1.5, false, 0.5, nil )
	vioGuiSetProgressBarFuelState ( rcVanBar, 0 )
	addEventHandler ( "onClientRender", getRootElement(), drawRCDistance )
	setTimer ( updateDistanceToRCVan, 1000, 1, veh, rcVanBar )
end
addEvent ( "showDistanceToRCVan", true )
addEventHandler ( "showDistanceToRCVan", getRootElement(), showDistanceToRCVan )

function hideDistanceToRCVan ( veh )

	if isElement ( rcVanBar ) then
		destroyElement ( rcVanBar )
	end
	removeEventHandler ( "onClientRender", getRootElement(), drawRCDistance )
end
addEvent ( "hideDistanceToRCVan", true )
addEventHandler ( "hideDistanceToRCVan", getRootElement(), hideDistanceToRCVan )

function updateDistanceToRCVan ( veh )

	if isElement ( veh ) and isElement ( rcVanBar ) then
		local x1, y1, z1 = getElementPosition ( veh )
		local x2, y2, z2 = getElementPosition ( getPedOccupiedVehicle ( lp ) )
		local distance = getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 )
		if distance <= 250 then
			setTimer ( updateDistanceToRCVan, 1000, 1, veh )
			vioGuiSetProgressBarFuelState ( rcVanBar, 1 - distance / 250 )
			return true
		else
			toggleControl ( "enter_exit", false )
			setControlState ( "enter_exit", false )
			toggleControl ( "enter_exit", true )
			
			triggerServerEvent ( "destroyMyRCVehicle", lp )
		end
	end
	destroyElement ( rcVanBar )
	removeEventHandler ( "onClientRender", getRootElement(), drawRCDistance )
end

function drawRCDistance ()

	dxDrawText ( "Signalstaerke:", screenwidth/2-100, screenheight-100-2 + 42, 200, 100, tocolor ( 0, 0, 0 ), .75, "bankgothic", "left", "top" )
	dxDrawText ( "Signalstaerke:", screenwidth/2-100+2, screenheight-100 + 42, 200, 100, tocolor ( 160, 160, 220 ), .75, "bankgothic", "left", "top" )
end

RCVehicles = {
 [441]=true,
 [464]=true,
 [465]=true,
 [501]=true,
 [564]=true
 }

function RC ( player )

	if player == lp then
		local veh = source
		if RCVehicles[getElementModel ( veh )] then
			setElementPosition ( lp, getElementPosition ( lp ) )
		end
	end
end
addEventHandler ( "onClientVehicleStartEnter", getRootElement (), RC )]]