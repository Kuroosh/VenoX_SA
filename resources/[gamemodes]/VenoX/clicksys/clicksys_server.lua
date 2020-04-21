guiObjectModels = { [2942]=true, [2190]=true, [2754]=true }
secondClickTypes = { ["ped"] = true, ["player"] = true, ["vehicle"] = true }
clickSpecialPeds = { [rathausped]=true, [vincenzo]=true, [aztecasBouncer]=true }

function player_click ( button, state, clickedElement, x, y, z )

	if state == "down" and not getElementClicked ( source ) then

		if vnxGetElementData ( source, "shaderedit" ) == true then
			return nil
		end
		
		if vnxGetElementData ( source, "adminEnterVehicle" ) then
			
			if isElement ( clickedElement ) then
				if getElementType( clickedElement ) == "vehicle" then
				
					if getVehicleOccupant ( clickedElement ) then
						removePedFromVehicle ( getVehicleOccupant ( clickedElement ) )
					end
					
					warpPedIntoVehicle ( source, clickedElement )
					vnxSetElementData ( source, "adminEnterVehicle", false )
				
					return nil
				
				end
			end
			
		end
	
		if MafiaCasinoKeypads and MafiaCasinoKeypads[clickedElement] then
			moveCasinoDoor ( source )
			return true
		end

		local x1, y1, z1 = getElementPosition ( source )
		local veh = getPedOccupiedVehicle ( source )

		if veh then
			if vnxGetElementData ( veh, "katjuscha" ) then
				fireKatjuscha ( vnxGetElementData ( veh, "katjuschaID" ), x, y, z )
				showCursor ( source, false )
				return nil
			end
		end
		
		-- Wanzen --
		
		if vnxGetElementData ( source, "wanzen" ) then
		
			if clickedElement then
			
				if getElementType( clickedElement ) == "vehicle" then
				
					createWanze ( source, clickedElement, x, y, z )
					return true
				
				else
				
					outputChatBox ( "Wanzen koennen nur an Autos oder in der Umgebung platziert werden!", source, 0, 125, 0 )
				
				end
				
			else
			
				createWanze ( source, clickedElement, x, y, z )
				return true

			end
		
		end
		
		-----------------

		-- Spezial --
		if not clickedElement then
			if vnxGetElementData ( source, "objectToPlace" ) or vnxGetElementData ( source, "airstrike" ) then
				if vnxGetElementData ( source, "airstrike" ) then
					vnxSetElementData ( source, "airstrike", false )
					createAirstrike ( source, x, y, z )
					showCursor ( source, false )
					setElementClicked ( source, false )
				end
				return true
			end
		end
		---------------
		
		if clickedElement then
		
			if getElementData( clickedElement, "bank_ped" ) == true then
			
				triggerClientEvent ( source, "showCashPoint", getRootElement() ) ---dfsfsdfsdf
				setElementClicked ( source, true )
			
			end
		
		end

		-- Special Elements - Objekte --
		if clickedElement and not secondClickTypes[getElementType(clickedElement)] then
			local x2, y2, z2 = getElementPosition ( clickedElement )
			if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 10 then
				local model = getElementModel ( clickedElement )
				local count = getElementData ( clickedElement, "count" )
				if guiObjectModels[model] then
					if model == 2942 then
						triggerClientEvent ( source, "showCashPoint", getRootElement() )
						setElementClicked ( source, true )
					elseif model == 2190 then
						if isOnDuty ( source ) or isArmy ( source ) then
							triggerClientEvent ( source, "showPDComputer", getRootElement() )
							setElementClicked ( source, true )
						end
					elseif model == 2754 then
						triggerClientEvent ( source, "showChipBuy", source )
					end
				elseif vnxGetElementData ( clickedElement, "placeableObject" ) then
					if vnxGetElementData ( source, "adminlvl" ) >= 3 then
						if not vnxGetElementData ( source, "objectDelete" ) then
							outputChatBox ( "Du kannst dieses Objekt loeschen; Klicke es dazu erneut an!", source, 0, 125, 0 )
							vnxSetElementData ( source, "objectDelete", true )
							setTimer ( vnxSetElementData, 60000, 1, source, "objectDelete", nil )
						else
							destroyElement ( clickedElement )
						end
					end
				elseif vnxGetElementData ( clickedElement, "placeableObjectMySQL" ) then
					if vnxGetElementData ( source, "adminlvl" ) >= 3 then
						if not vnxGetElementData ( source, "objectDelete" ) then
							outputChatBox ( "Du kannst dieses Objekt löschen; Klicke es dazu erneut an!", source, 0, 125, 0 )
							vnxSetElementData ( source, "objectDelete", true )
							setTimer ( vnxSetElementData, 60000, 1, source, "objectDelete", nil )
						else
							local id = vnxGetElementData ( clickedElement, "id" )
							dbExec ( handler, "DELETE FROM ?? WHERE ??=?", "object", "id", id )
							destroyElement ( clickedElement )
						end
					end
				elseif vnxGetElementData ( clickedElement, "weed" ) then
					local x1, y1, z1 = getElementPosition ( source )
					local x2, y2, z2 = getElementPosition ( clickedElement )
					if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 3 then
						local id = vnxGetElementData ( clickedElement, "id" )
						if weedPlants[id] then
						
							local drugs = math.floor ( ( getMinTime () - vnxGetElementData ( clickedElement, "time" ) ) / 20 )
							
							if drugs > 100 then
								drugs = 100
							elseif drugs < 0 then	
								if not isOnDuty ( source ) then
									outputChatBox ( "Die Drogen sind noch nicht bereit geerntet zu werden!", source, 255, 0, 0 )
									return
								end
							end
							destroyElement ( weedPlants[id] )
							weedPlants[id] = nil
							outputLog ( getPlayerName(source).." hat ID "..id.." geerntet und "..drugs.." bekommen!", "drogen" )
							dbExec ( handler, "DELETE FROM ?? WHERE ??=?", "weed", "id", id )
							
							outputChatBox ( "Du hast "..drugs.." Gramm Drogen geerntet!", source, 0, 125, 0 )
							vnxSetElementData ( source, "drugs", vnxGetElementData ( source, "drugs" ) + drugs )
						else
							destroyElement ( clickedElement )
						end
					end
				elseif gunBoxes[clickedElement] then
					triggerClientEvent ( source,"gunCrateMenue", getRootElement() )
					setElementFrozen ( source, true )
					setElementClicked ( source, true )
				elseif depots[clickedElement] then
					if isInDepotFaction ( source ) then
						setElementClicked ( source, true )
						local owner = vnxGetElementData ( source, "fraktion" )
						if owner == 11 then
							owner = 10
						elseif owner == 6 or owner == 8 then
							owner = 1
						end
						triggerClientEvent ( source, "showFDepot", getRootElement(), factionDepotData["money"][owner], factionDepotData["mats"][owner], factionDepotData["drugs"][owner], factionDepotData["koks"][owner] )
					else
						outputChatBox ( "Du bist in einer ungueltigen Fraktion!", source, 125, 0, 0 )
					end
				end
				return true
			end
		end
		
		-- Special Elements - Player --
		if clickedElement then
			if secondClickTypes[getElementType(clickedElement)] then
				if getElementModel ( clickedElement ) == 283 and not getElementType ( clickedElement ) == "player" then
					if not vnxGetElementData ( source, "ticketOffered" ) then
						vnxSetElementData ( source, "ticketOffered", true )
						outputChatBox ( "Hier kannst du ein Strafzettel loesen, um ein Wanted zu loeschen.", source, 200, 200, 0 )
						outputChatBox ( "Kosten: 2.000 $", source, 200, 200, 0 )
						setTimer ( vnxSetElementData, 30000, 1, source, "ticketOffered", false )
					else
						if vnxGetElementData ( source, "wanteds" ) == 1 then
							if vnxGetElementData ( source, "money" ) >= 2000 then
								vnxSetElementData ( source, "ticketOffered", false )
								outputChatBox ( "Strafzettel bezahlt!", source, 0, 125, 0 )
								setPlayerWantedLevel ( source, 0 )
								vnxSetElementData ( source, "wanteds", 0 )
								takePlayerSaveMoney ( source, 2000 )
							else
								outputChatBox ( "Ein Strafzettel kostet 2.000 $", source, 125, 0, 0 )
							end
						else
							outputChatBox ( "Nur moeglich, wenn du ein Wanted hast!", source, 125, 0, 0 )
						end
					end
				elseif clickedElement == source then
					triggerClientEvent ( source, "showSelfWindow", getRootElement() )
					showCursor ( source, true )
					setElementClicked ( source, true )
				elseif clickSpecialPeds[clickedElement] then
					if clickedElement == rathausped then
						triggerClientEvent ( source, "Rathaus_Window", getRootElement() )
						showCursor ( source, true )
						setElementClicked ( source, true )
					elseif clickedElement == vincenzo then
						triggerClientEvent ( source, "showVincenzosGunshop", getRootElement() )
						showCursor ( source, true )
						setElementClicked ( source, true )
					elseif clickedElement == aztecasBouncer then
						if isAztecas ( source ) then
							triggerClientEvent ( source, "showAztecasGunshop", source )
							showCursor ( source, true )
							setElementClicked ( source, true )
						end
					end
				elseif getElementType ( clickedElement ) == "vehicle" then
					local veh = clickedElement
					if vnxGetElementData ( source, "wanzen" ) then
						createWanze ( source, clickedElement, false, false, false )
					elseif getVehicleTrunkState ( veh ) then
						local data = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=? AND ??=?", "Kofferraum", "vehicles", "UID", playerUID[vnxGetElementData ( veh, "owner" )], "Slot", vnxGetElementData ( veh, "carslotnr_owner" ) ), -1 )[1]["Kofferraum"]
						local drugs = tonumber ( gettok ( data, 1, string.byte ( '|' ) ) )
						local mats = tonumber ( gettok ( data, 2, string.byte ( '|' ) ) )
						local gun = tonumber ( gettok ( data, 3, string.byte ( '|' ) ) )
						local ammo = tonumber ( gettok ( data, 4, string.byte ( '|' ) ) )
						triggerClientEvent ( source, "showTrunkGui", getRootElement(), drugs, mats, gun, ammo )
						vnxSetElementData ( source, "clickedVehicle", clickedElement )
						showCursor ( source, true )
						setElementClicked ( source, true )
					elseif not gangAreaUnderPreparation or not playerData[getPlayerName(source)] then
						triggerClientEvent ( source, "_createCarmenue", getRootElement(), clickedElement )
						vnxSetElementData ( source, "clickedVehicle", clickedElement )
						showCursor ( source, true )
						setElementClicked ( source, true )
						-- -2098.6645
						-- -163.8
					end
				elseif vnxGetElementData ( clickedElement, "clickPed" ) then
					local typ = vnxGetElementData ( clickedElement, "typ" )
					local item, price
					if typ == "bum" then
						item = "100 $?!"
						price = "Burger"
					elseif typ == "gunbuyer" then
						if vnxGetElementData ( clickedElement, "item" ) == 4 then
							price = "Messer"
						elseif vnxGetElementData ( clickedElement, "item" ) == 22 then
							price = "9mm Pistole"
						else
							price = "AK-47"
						end
						item = tostring ( vnxGetElementData ( clickedElement, "price" ) ).." $"
					else
						price = tostring ( vnxGetElementData ( clickedElement, "price" ) ).." $"
					end
					if typ == "wdealer" then
						item = aiGunNames[vnxGetElementData ( clickedElement, "item" )]
					elseif typ == "dealer" then
						item = tostring ( vnxGetElementData ( clickedElement, "item" ) ).." g, \nDrogen"
					elseif typ == "sdealer" then
						item = tostring ( vnxGetElementData ( clickedElement, "item" ) ).." Stk.,\nHanfsamen"
					elseif typ == "car" then
						local i = vnxGetElementData ( clickedElement, "id" )
						local car = curAiCarSpots[i]["car"]
						item = vnxGetElementData ( car, "name" )
						price = vnxGetElementData ( car, "price" )
					end
					vnxSetElementData ( source, "curclicked", clickedElement )
					setElementClicked ( source, true )
					triggerClientEvent ( source, "showPedInteraction", getRootElement(), typ, item, price )
				elseif getElementType ( clickedElement ) == "player" then
					if vnxGetElementData ( clickedElement, "tazered" ) == true and isOnStateDuty ( source ) then
						grab_func ( source, "grab", getPlayerName ( clickedElement ) )
					else
						local pname = getPlayerName ( clickedElement )
						if pname == "Solid_Snake" then
							 giveAchievement( source, 10 )
						end
						vnxSetElementData ( source, "curclicked", pname )
						setElementClicked ( source, true )
						triggerClientEvent ( source,"ShowInteraktionsguiGui", getRootElement() )
					end
				end
			end
		end
	end
end
addEventHandler ( "onPlayerClick", getRootElement (), player_click )

function removeRemoteExplosive ( clickedElement )

	destroyElement ( clickedElement )
	setElementFrozen ( source, false )
end

function cancel_gui_server_func ( player )

	if player then source = player end
	if vnxGetElementData(source,"nodmzone") == 1 then toggleControl ( source, "fire", false ) end
	if vnxGetElementData(source,"sprint") == 1 then toggleControl ( source, "sprint", false ) end
	showCursor ( source, false )
	setElementClicked ( source, false )
end
addEvent ("cancel_gui_server", true )
addEventHandler ( "cancel_gui_server", getRootElement (), cancel_gui_server_func )

function savepdata(player)
	outputChatBox(savesqlu.."|"..savesglu,player)
end

function self_func ( player )

	if not getElementClicked ( player ) then
		--triggerClientEvent ( player, "ShowSelfClickMenue", player )
		executeCommandHandler( "self", player )
		showCursor ( player, true )
		setElementClicked ( player, true )
	end
end
addCommandHandler ( "self", self_func )