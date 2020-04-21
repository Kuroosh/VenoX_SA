function showTrunkGui_func ( drugs, mats, gun, ammo )

	if gWindow["trunkClick"] then
		guiSetVisible ( gWindow["trunkClick"], true )
	else
		--gWindow["trunkClick"] = guiCreateWindow(screenwidth/2-357/2,screenheight/2-232/2,357,232,"Kofferraum",false)
		gWindow["trunkClick"] = guiCreateStaticImage(screenwidth/2-357/2,screenheight/2-232/2,357,232,"images/hud/background.png",false)
		guiWindowSetMovable ( gWindow["trunkClick"], false )
		guiWindowSetSizable ( gWindow["trunkClick"], false )
		guiSetAlpha(gWindow["trunkClick"],1)
		
		gLabel["trunkInfo1"] = guiCreateLabel(17,22,48,18,"Drogen:",false,gWindow["trunkClick"])
		guiSetAlpha(gLabel["trunkInfo1"],1)
		guiLabelSetColor(gLabel["trunkInfo1"],000,200,000)
		guiLabelSetVerticalAlign(gLabel["trunkInfo1"],"top")
		guiLabelSetHorizontalAlign(gLabel["trunkInfo1"],"left",false)
		guiSetFont(gLabel["trunkInfo1"],"default-bold-small")
		gLabel["trunkDrugs"] = guiCreateLabel(24,41,49,17,"500 g",false,gWindow["trunkClick"])
		guiSetAlpha(gLabel["trunkDrugs"],1)
		guiLabelSetColor(gLabel["trunkDrugs"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["trunkDrugs"],"top")
		guiLabelSetHorizontalAlign(gLabel["trunkDrugs"],"left",false)
		guiSetFont(gLabel["trunkDrugs"],"default-bold-small")
		gEdit["trunkDrugs"] = guiCreateEdit(17,89,65,31,"500",false,gWindow["trunkClick"])
		guiSetAlpha(gEdit["trunkDrugs"],1)
		gLabel["trunkInfo3"] = guiCreateLabel(85,96,17,17,"g",false,gWindow["trunkClick"])
		guiSetAlpha(gLabel["trunkInfo3"],1)
		guiLabelSetColor(gLabel["trunkInfo3"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["trunkInfo3"],"top")
		guiLabelSetHorizontalAlign(gLabel["trunkInfo3"],"left",false)
		guiSetFont(gLabel["trunkInfo3"],"default-bold-small")
		gLabel["trunkInfo4"] = guiCreateLabel(107,23,72,18,"Materialien:",false,gWindow["trunkClick"])
		guiSetAlpha(gLabel["trunkInfo4"],1)
		guiLabelSetColor(gLabel["trunkInfo4"],200,100,000)
		guiLabelSetVerticalAlign(gLabel["trunkInfo4"],"top")
		guiLabelSetHorizontalAlign(gLabel["trunkInfo4"],"left",false)
		guiSetFont(gLabel["trunkInfo4"],"default-bold-small")
		gLabel["trunkMats"] = guiCreateLabel(117,41,70,17,"200 Stk.",false,gWindow["trunkClick"])
		guiSetAlpha(gLabel["trunkMats"],1)
		guiLabelSetColor(gLabel["trunkMats"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["trunkMats"],"top")
		guiLabelSetHorizontalAlign(gLabel["trunkMats"],"left",false)
		guiSetFont(gLabel["trunkMats"],"default-bold-small")
		gEdit["trunkMats"] = guiCreateEdit(109,88,65,31,"500",false,gWindow["trunkClick"])
		guiSetAlpha(gEdit["trunkMats"],1)
		gLabel["trunkInfo2"] = guiCreateLabel(177,96,25,17,"Stk.",false,gWindow["trunkClick"])
		guiSetAlpha(gLabel["trunkInfo2"],1)
		guiLabelSetColor(gLabel["trunkInfo2"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["trunkInfo2"],"top")
		guiLabelSetHorizontalAlign(gLabel["trunkInfo2"],"left",false)
		guiSetFont(gLabel["trunkInfo2"],"default-bold-small")
		gLabel["trunkInfo5"] = guiCreateLabel(215,23,97,20,"Waffe:",false,gWindow["trunkClick"])
		guiSetAlpha(gLabel["trunkInfo5"],1)
		guiLabelSetColor(gLabel["trunkInfo5"],200,000,000)
		guiLabelSetVerticalAlign(gLabel["trunkInfo5"],"top")
		guiLabelSetHorizontalAlign(gLabel["trunkInfo5"],"left",false)
		guiSetFont(gLabel["trunkInfo5"],"default-bold-small")
		gLabel["trunkStoredGun"] = guiCreateLabel(208,39,139,30,"",false,gWindow["trunkClick"])
		guiSetAlpha(gLabel["trunkStoredGun"],1)
		guiLabelSetColor(gLabel["trunkStoredGun"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["trunkStoredGun"],"top")
		guiLabelSetHorizontalAlign(gLabel["trunkStoredGun"],"left",false)
		guiSetFont(gLabel["trunkStoredGun"],"default-bold-small")
		gLabel["trunkInfo6"] = guiCreateLabel(215,69,76,20,"In der Hand:",false,gWindow["trunkClick"])
		guiSetAlpha(gLabel["trunkInfo6"],1)
		guiLabelSetColor(gLabel["trunkInfo6"],200,000,00)
		guiLabelSetVerticalAlign(gLabel["trunkInfo6"],"top")
		guiLabelSetHorizontalAlign(gLabel["trunkInfo6"],"left",false)
		guiSetFont(gLabel["trunkInfo6"],"default-bold-small")
		gLabel["trunkHandGun"] = guiCreateLabel(208,86,144,30,"",false,gWindow["trunkClick"])
		guiSetAlpha(gLabel["trunkHandGun"],1)
		guiLabelSetColor(gLabel["trunkHandGun"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["trunkHandGun"],"top")
		guiLabelSetHorizontalAlign(gLabel["trunkHandGun"],"left",false)
		guiSetFont(gLabel["trunkHandGun"],"default-bold-small")
		
		gButton["trunkClose"] = guiCreateButton(331,24,15,15,"x",false,gWindow["trunkClick"])
		guiSetAlpha(gButton["trunkClose"],1)
		addEventHandler ( "onClientGUIClick", gButton["trunkClose"],
			function ( btn, state )
				if state == "up" then
					guiSetVisible ( gWindow["trunkClick"], false )
					guiSetVisible ( gWindow["vehCarDelete"], false )
					showCursor ( false )
					vnxClientSetElementData ( "clickedVehicle", false )
					setElementClicked ( false )
				end
			end,
		false )
		
		gButton["trunkTakeDrugs"] = guiCreateButton(17,123,68,40,"Nehmen",false,gWindow["trunkClick"])
		guiSetAlpha(gButton["trunkTakeDrugs"],1)
		gButton["trunkStoreDrugs"] = guiCreateButton(17,175,68,40,"Lagern",false,gWindow["trunkClick"])
		guiSetAlpha(gButton["trunkStoreDrugs"],1)
		
		gButton["trunkTakeMats"] = guiCreateButton(108,123,68,40,"Nehmen",false,gWindow["trunkClick"])
		guiSetAlpha(gButton["trunkTakeMats"],1)
		gButton["trunkStoreMats"] = guiCreateButton(108,175,68,40,"Lagern",false,gWindow["trunkClick"])
		guiSetAlpha(gButton["trunkStoreMats"],1)
		
		gButton["trunkTakeGun"] = guiCreateButton(234,123,68,40,"Nehmen",false,gWindow["trunkClick"])
		guiSetAlpha(gButton["trunkTakeGun"],1)
		gButton["trunkStoreGun"] = guiCreateButton(234,175,68,40,"Lagern",false,gWindow["trunkClick"])
		guiSetAlpha(gButton["trunkStoreGun"],1)
		
		trunkButtons = {
		[gButton["trunkTakeDrugs"]] = true,
		[gButton["trunkStoreDrugs"]] = true,
		[gButton["trunkTakeMats"]] = true,
		[gButton["trunkStoreMats"]] = true,
		[gButton["trunkTakeGun"]] = true,
		[gButton["trunkStoreGun"]] = true
		}
		
		for key, index in pairs ( trunkButtons ) do
			addEventHandler ( "onClientGUIClick", key, trunkClick, false )
		end
	end
	guiSetText ( gLabel["trunkDrugs"], drugs.." g" )
	guiSetText ( gLabel["trunkMats"], mats.." Stk." )
	local gunText = "-"
	if ammo == 0 or gun <= 1 then
		gunText = "Keine"
	elseif ammo > 1 then
		if singleTrunkWeapons[gun] then
			fix = "Stk."
		else
			fix = "Schuss"
		end
		gunText = weaponNames[gun].."\n"..ammo.." "..fix
	else
		gunText = weaponNames[gun]
	end
	guiSetText ( gLabel["trunkStoredGun"], gunText )
	
	gun = getPedWeapon ( lp )
	ammo = getPedTotalAmmo ( lp )
	local gunText = "-"
	if ammo == 0 or gun <= 1 then
		gunText = "Keine"
	elseif ammo > 1 then
		if singleTrunkWeapons[gun] then
			fix = "Stk."
		else
			fix = "Schuss"
		end
		gunText = weaponNames[gun].."\n"..ammo.." "..fix
	else
		gunText = weaponNames[gun]
	end
	guiSetText ( gLabel["trunkHandGun"], gunText )
	guiSetText ( gEdit["trunkDrugs"], "0" )
	guiSetText ( gEdit["trunkMats"], "0" )
	
	if getElementData ( lp, "adminlvl" ) >= 3 then
		--gWindow["vehCarDelete"] = guiCreateWindow(0,screenheight/2-132/2,151,137,"Admin",false)
		gWindow["vehCarDelete"] = guiCreateStaticImage(0,screenheight/2-132/2,151,137,"images/hud/background.png",false)
		guiSetAlpha(gWindow["vehCarDelete"],1)
		if getElementData ( lp, "adminlvl" ) >= 3 then
			gButton["vehCarDel"] = guiCreateButton(0.0596,0.1898,0.3974,0.2555,"Loeschen",true,gWindow["vehCarDelete"])
			guiSetAlpha(gButton["vehCarDel"],1)
		end
		gButton["vehCarResp"] = guiCreateButton(0.4901,0.1898,0.457,0.2555,"Respawnen",true,gWindow["vehCarDelete"])
		guiSetAlpha(gButton["vehCarResp"],1)
		gLabel["vehCarInfo1"] = guiCreateLabel(0.0596,0.4891,0.3113,0.1387,"Grund:",true,gWindow["vehCarDelete"])
		guiSetAlpha(gLabel["vehCarInfo1"],1)
		guiLabelSetColor(gLabel["vehCarInfo1"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["vehCarInfo1"],"top")
		guiLabelSetHorizontalAlign(gLabel["vehCarInfo1"],"left",false)
		guiSetFont(gLabel["vehCarInfo1"],"default-bold-small")
		gMemo["vehCarReason"] = guiCreateMemo(0.0596,0.6058,0.8808,0.3358,"",true,gWindow["vehCarDelete"])
		guiSetAlpha(gMemo["vehCarReason"],1)
		
		addEventHandler("onClientGUIClick", gButton["vehCarResp"], 
			function()
				local veh = vnxClientGetElementData ( "clickedVehicle" )
				local towcar = getElementData ( veh, "carslotnr_owner" )
				local pname = getElementData ( veh, "owner" )
				triggerServerEvent ( "respawnVeh", lp, towcar, pname, veh )
			end
		)
		if getElementData ( lp, "adminlvl" ) >= 3 then
			addEventHandler("onClientGUIClick", gButton["vehCarDel"], 
				function()
					local veh = vnxClientGetElementData ( "clickedVehicle" )
					local towcar = getElementData ( veh, "carslotnr_owner" )
					local pname = getElementData ( veh, "owner" )
					if not pname then
						outputChatBox ( "Dieses Fahrzeug gehoert keinem Spieler!", 125, 0, 0 )
					else
						triggerServerEvent ( "deleteVeh", lp, towcar, pname, veh, guiGetText ( gMemo["vehCarReason"] ) )
					end
				end,
			false)
		end
	end
end
addEvent ( "showTrunkGui", true )
addEventHandler ( "showTrunkGui", getRootElement(), showTrunkGui_func )

function trunkClick ( btn, state )

	if state == "up" then
		if trunkButtons[source] then
			local drugs = guiGetText ( gLabel["trunkDrugs"] )
			drugs = tonumber ( string.sub ( drugs, 1, ( #drugs ) - 2 ) )
			
			local mats = guiGetText ( gLabel["trunkMats"] )
			mats = tonumber ( string.sub (mats, 1, ( #mats ) - 5 ) )
			
			local drugsValue = tonumber ( guiGetText ( gEdit["trunkDrugs"] ) )
			local matsValue = tonumber ( guiGetText ( gEdit["trunkMats"] ) )
			
			if source == gButton["trunkTakeDrugs"] or source == gButton["trunkTakeMats"] or source == gButton["trunkTakeGun"] then
				if source == gButton["trunkTakeGun"] then
					if guiGetText ( gLabel["trunkStoredGun"] ) ~= "Keine" then
						triggerServerEvent ( "trunkStorageServer", lp, "gun", "", true )
						guiSetText ( gLabel["trunkHandGun"], guiGetText ( gLabel["trunkStoredGun"] ) )
						guiSetText ( gLabel["trunkStoredGun"], "Keine" )
					else
						outputChatBox ( "Du hast im Moment keine Waffe eingelagert!", 125, 0, 0 )
					end
				elseif source == gButton["trunkTakeDrugs"] then
					if drugs >= drugsValue then
						triggerServerEvent ( "trunkStorageServer", lp, "drugs", drugsValue, true )
						guiSetText ( gLabel["trunkDrugs"], ( drugs - drugsValue ).." g" )
					else
						outputChatBox ( "Du nicht so viele Drogen gelagert!", 125, 0, 0 )
					end
				else
					if mats >= matsValue then
						triggerServerEvent ( "trunkStorageServer", lp, "mats", matsValue, true )
						guiSetText ( gLabel["trunkMats"], ( mats - matsValue ).." Stk." )
					else
						outputChatBox ( "Du nicht so viele Materialien gelagert!", 125, 0, 0 )
					end
				end
			else
				if source == gButton["trunkStoreGun"] then
					if guiGetText ( gLabel["trunkStoredGun"] ) == "Keine" then
						if guiGetText ( gLabel["trunkHandGun"] ) ~= "Keine" then
							triggerServerEvent ( "trunkStorageServer", lp, "gun", "", false )
							guiSetText ( gLabel["trunkStoredGun"], guiGetText ( gLabel["trunkHandGun"] ) )
							guiSetText ( gLabel["trunkHandGun"], "Keine" )
						else
							outputChatBox ( "Du hast keine Waffe in der Hand!", 125, 0, 0 )
						end
					else
						outputChatBox ( "Du hast bereits eine Waffe eingelagert!", 125, 0, 0 )
					end
				elseif source == gButton["trunkStoreDrugs"] then
					if vnxClientGetElementData("drugs") >= drugsValue then
						triggerServerEvent ( "trunkStorageServer", lp, "drugs", drugsValue, false )
						guiSetText ( gLabel["trunkDrugs"], ( drugs + drugsValue ).." g" )
					else
						outputChatBox ( "Du nicht so viele Drogen!", 125, 0, 0 )
					end
				else
					if vnxClientGetElementData("mats") >= matsValue then
						triggerServerEvent ( "trunkStorageServer", lp, "mats", matsValue, false )
						guiSetText ( gLabel["trunkMats"], ( mats + matsValue ).." Stk." )
					else
						outputChatBox ( "Du nicht so viele Materialien!", 125, 0, 0 )
					end
				end
			end
		end
	end
end