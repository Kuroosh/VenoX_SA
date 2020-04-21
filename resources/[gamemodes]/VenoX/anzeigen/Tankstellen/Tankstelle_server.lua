function setVehicleFuelState ()

	if vnxGetElementData ( source, "ownerfraktion" ) or not vnxGetElementData ( source, "owner" ) then
		vnxSetElementData ( source, "fuelstate", 100 )
		vnxSetElementData ( source, "engine", false )
		setVehicleEngineState ( source, false )
		if hotdogVehicles[source] then
			hotdogsInVehicle[source] = 0
		end
	end
end
addEventHandler ( "onVehicleRespawn", getRootElement(), setVehicleFuelState )

function refreshVehDistance_func ( veh, nd )

	if tonumber ( nd ) then
		if getPedOccupiedVehicle ( client ) == veh then
			vnxSetElementData ( veh, "distance", nd )
		end
	end
end
addEvent ( "refreshVehDistance", true )
addEventHandler ( "refreshVehDistance", getRootElement(), refreshVehDistance_func )

function getNearestTanke ( player )

	local x1, y1, z1 = getElementPosition ( player )
	
	if getDistanceBetweenPoints3D ( x1, y1, z1, -2420.09765625, 969.890625, 45.296875 ) <= 100 then
			
		return "Nord"
			
	end
					
		
	if getDistanceBetweenPoints3D ( x1, y1, z1, -1675.880859375, 431.7705078125, 7.1796875 ) <= 100 then
			
		return "Sued"
		
	end
		
	if getDistanceBetweenPoints3D ( x1, y1, z1, -2231.6591796875, -2558.095703125, 31.921875 ) <= 100 then
			
		return "Pine"
			
	end
	
	return false
	
end

function nonFuelVehicleEnter ()

	if not vnxGetElementData ( source, "fuelstate" ) then
		vnxSetElementData ( source, "fuelstate", 100 )
	end
	if not vnxGetElementData ( source, "distance" ) then
		vnxSetElementData ( source, "distance", 0 )
	end
end
addEventHandler ( "onVehicleEnter", getRootElement(), nonFuelVehicleEnter )

function setVehicleNewFuelState ( veh )

	if isElement ( veh ) then
		if getVehicleEngineState ( veh ) then
			local vx, vy, vz = getElementVelocity ( veh )
			if helicopters[getElementModel ( veh )] or planea[getElementModel ( veh )] or planeb[getElementModel ( veh )] then
				vehfactor = 400
			else
				vehfactor = 300
			end
			if vnxGetElementData ( veh, "fuelSaving" ) then
				vehfactor = vehfactor * 2
			end
			if vehfactor then
				local speed = math.floor ( math.sqrt(vx^2 + vy^2 + vz^2)*214 ) / vehfactor + 0.2
				local newFuel = tonumber ( vnxGetElementData ( veh, "fuelstate" ) ) - speed
				vnxSetElementData ( veh, "fuelstate", newFuel )
				if vnxGetElementData ( veh, "fuelstate" ) <= 0 then
					if getVehicleOccupant ( veh, 0 ) then
						outputChatBox ( "Deinem Fahrzeug ist das Benzin ausgegangen - suche dir eine Tankstelle und kauf dir einen Benzinkanister!", getVehicleOccupant ( veh, 0 ), 125, 0, 0 )
					end
					saveBenzinForPrivVeh ( veh )
					vnxSetElementData ( veh, "engine", false )
					setVehicleEngineState ( veh, false )
					vnxSetElementData ( veh, "timerrunning", false )
				elseif math.floor(vnxGetElementData(veh,"fuelstate"))/10 == math.floor(vnxGetElementData(veh,"fuelstate")/10) then
					saveBenzinForPrivVeh ( veh )
					setTimer ( setVehicleNewFuelState, 10000, 1, veh )
				else
					setTimer ( setVehicleNewFuelState, 10000, 1, veh )
				end
			end
		else
			vnxSetElementData ( veh, "timerrunning", false )
		end
	end
end

function saveBenzinForPrivVeh ( veh )

	local pname = vnxGetElementData ( veh, "owner" )
	local slot = vnxGetElementData ( veh, "carslotnr_owner" )
	if pname and slot then
		dbExec ( handler, "UPDATE ?? SET ??=?, ??=? WHERE ??=? AND ??=?", "vehicles", "Benzin", vnxGetElementData(allPrivateCars[pname][slot],"fuelstate"), "Distance", vnxGetElementData(allPrivateCars[pname][slot],"distance"), "UID", playerUID[pname], "Slot", slot )
	end
end

function fillComplete_func ( player, varb )

	if player == client then
		local veh = getPedOccupiedVehicle ( player )
		if veh and getPedOccupiedVehicleSeat ( player ) == 0 then
			local fuel = vnxGetElementData(veh,"fuelstate")
			if fuel <= 99 then
				if varb then multy = 3 else multy = 1 end
				local costs = math.floor((100-fuel)*literPrice)*multy
				if costs <= vnxGetElementData ( player, "money" ) then
					----------------------------
					
					local the_tankstelle = getNearestTanke ( player )
					
					if the_tankstelle ~= false then
					
						if the_tankstelle == "Nord" then
					
							bizArray["TankstelleNord"]["kasse"] = bizArray["TankstelleNord"]["kasse"] + math.floor(costs)
						
						elseif the_tankstelle == "Sued" then
						
							bizArray["TankstelleSued"]["kasse"] = bizArray["TankstelleSued"]["kasse"] + math.floor(costs)
						
						elseif the_tankstelle == "Pine" then
						
							bizArray["TankstellePine"]["kasse"] = bizArray["TankstellePine"]["kasse"] + math.floor(costs)
						
						end
					
					end
					
					------------------------------					
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - costs )
					setElementFrozen ( veh, true )
					setTimer ( fillCar, 3000, 1, veh, 100-fuel )
                else
                    playSoundFrontEnd ( player, 42 )
					outputChatBox ( "Du hast nicht genug Geld! Dein Fahrzeug aufzutanken kostet "..costs.." $!", player, 150, 0, 0 )
				end
            else
                playSoundFrontEnd ( player, 42 )
				outputChatBox ( "Du musst noch nicht tanken!", player, 0, 200, 0 )
			end
        else
            playSoundFrontEnd ( player, 42 )
			outputChatBox ( "Dazu musst du ein Fahrzeug fahren!", player, 0, 150, 200 )
		end
	end
end
addEvent ( "fillComplete", true )
addEventHandler ( "fillComplete", getRootElement(), fillComplete_func )

function fillPart_func ( player, liters )

	local liters = math.abs ( tonumber ( liters ) )
	local veh = getPedOccupiedVehicle ( player )
	if player == client then
		if veh and getPedOccupiedVehicleSeat ( player ) == 0 then
			local fuel = vnxGetElementData(veh,"fuelstate")
			local fuel = math.abs ( fuel )
			if fuel <= 99 then
				if liters and fuel+liters <= 100 then
					if varb then multy = 3 else multy = 1 end
					local costs = math.floor((liters)*literPrice)*multy
					if costs <= vnxGetElementData ( player, "money" ) then
						
						local the_tankstelle = getNearestTanke ( player )
						
						if the_tankstelle ~= false then
						
							if the_tankstelle == "Nord" then
						
								bizArray["TankstelleNord"]["kasse"] = bizArray["TankstelleNord"]["kasse"] + math.floor(costs)
							
							elseif the_tankstelle == "Sued" then
							
								bizArray["TankstelleSued"]["kasse"] = bizArray["TankstelleSued"]["kasse"] + math.floor(costs)
							
							elseif the_tankstelle == "Pine" then
							
								bizArray["TankstellePine"]["kasse"] = bizArray["TankstellePine"]["kasse"] + math.floor(costs)
							
							end
						
						end
						
						vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - costs )
						setElementFrozen ( veh, true )
						setTimer ( fillCar, 3000, 1, veh, liters )
                    else
                        playSoundFrontEnd ( player, 42 )
						outputChatBox ( "Du hast nicht genug Geld! Dein Fahrzeug aufzutanken kostet "..costs.." $!", player, 0, 150, 200 )
					end
                else
                    playSoundFrontEnd ( player, 42 )
					outputChatBox ( "Bitte gib einen gueltigen Wert ein!", player, 0, 150, 200 )
				end
            else
                playSoundFrontEnd ( player, 42 )
				outputChatBox ( "Du musst noch nicht tanken!", player, 0, 200, 0 )
			end
        else
            playSoundFrontEnd ( player, 42 )
			outputChatBox ( "Dazu musst du ein Fahrzeug fahren!", player, 0, 150, 200 )
		end
	end
end
addEvent ( "fillPart", true )
addEventHandler ( "fillPart", getRootElement(), fillPart_func )

function buySnack_func ( player )

	if player == client then
		if vnxGetElementData ( player, "money" ) >= snackPrice then
			local health = getElementHealth ( player )
			if health <= 95 then
				setElementHealth ( player, health+5 )
			else
				setElementHealth ( player, 100 )
			end
			--setElementHunger ( player, getElementHunger ( player ) + 20 )
			
					local the_tankstelle = getNearestTanke ( player )
					
					if the_tankstelle ~= false then
					
						if the_tankstelle == "Nord" then
					
							bizArray["TankstelleNord"]["kasse"] = bizArray["TankstelleNord"]["kasse"] + math.floor(snackPrice)
						
						elseif the_tankstelle == "Sued" then
						
							bizArray["TankstelleSued"]["kasse"] = bizArray["TankstelleSued"]["kasse"] + math.floor(snackPrice)
						
						elseif the_tankstelle == "Pine" then
						
							bizArray["TankstellePine"]["kasse"] = bizArray["TankstellePine"]["kasse"] + math.floor(snackPrice)
						
						end
					
					end
			
			vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - snackPrice )
		else
			outputChatBox ( "Du hast nicht genug Geld! Ein Snack kostet "..snackPrice.." $!", player, 125, 0, 0 )
		end
	end
end
addEvent ( "buySnack", true )
addEventHandler ( "buySnack", getRootElement(), buySnack_func )


function buyKannister_func ( player )

	if player == client then
		if vnxGetElementData ( player, "money" ) >= kannisterPrice then
			if tonumber ( vnxGetElementData ( player, "benzinkannister" ) ) >= 1 then
				outputChatBox ( "Du hast bereits einen Kanister!", player, 125, 0, 0 )
			else
				
				local the_tankstelle = getNearestTanke ( player )
						
				if the_tankstelle ~= false then
						
					local piu = kannisterPrice
						
					if the_tankstelle == "Nord" then
						
						bizArray["TankstelleNord"]["kasse"] = bizArray["TankstelleNord"]["kasse"] + math.floor(piu)
						
					elseif the_tankstelle == "Sued" then
							
						bizArray["TankstelleSued"]["kasse"] = bizArray["TankstelleSued"]["kasse"] + math.floor(piu)
							
					elseif the_tankstelle == "Pine" then
						
						bizArray["TankstellePine"]["kasse"] = bizArray["TankstellePine"]["kasse"] + math.floor(piu)
							
					end
					
				end
			
				vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - kannisterPrice )
				outputChatBox ( "Du hast einen Benzinkanister erworben! Nutze /fill, um ihn zu verwenden.", player, 0, 150, 0 )
				vnxSetElementData ( player, "benzinkannister", tonumber ( vnxGetElementData ( player, "benzinkannister" ) )+1 )
			end
		else
			outputChatBox ( "Du hast nicht genug Geld! Ein Benzinkanister kostet "..math.floor(literPrice*15)+kannisterPrice.." $!", player, 125, 0, 0 )
		end
	end
end
addEvent ( "buyKannister", true )
addEventHandler ( "buyKannister", getRootElement(), buyKannister_func )

function fillThisCar ( player )

	local veh = getPedOccupiedVehicle ( player )
	if veh then
		local fuel = tonumber ( vnxGetElementData ( veh, "fuelstate" ) )
		if fuel then
			if fuel <= 85 then
				if tonumber ( vnxGetElementData ( player, "benzinkannister" ) ) >= 1 then
					vnxSetElementData ( veh, "fuelstate", fuel+15 )
					outputChatBox ( "Fahrzeug aufgefuellt!", player, 0, 125, 0 )
					vnxSetElementData ( player, "benzinkannister", tonumber ( vnxGetElementData ( player, "benzinkannister" ) ) - 1 )
				else
					outputChatBox ( "Du hast keinen Benzinkanister!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Das Fahrzeug hat noch genug Benzin!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du musst in einem Fahrzeug sitzen!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Du musst in einem Fahrzeug sitzen!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "fill", fillThisCar )

function fillCar ( veh, liters )

	local liters = math.abs ( liters )
	if isElement ( veh ) then
		vnxSetElementData ( veh, "fuelstate", tonumber ( vnxGetElementData ( veh, "fuelstate" ) ) + liters )
		local player = getVehicleOccupant ( veh, 0 )
		if player then
			outputChatBox ( "Dein Fahrzeug wurde betankt!", player, 20, 150, 20 )
		end
		setElementFrozen ( veh, false )
	end
end

function Zigaretten_Button_Tankstelle ( player )

	if player == client then
		if vnxGetElementData ( player, "money" ) >= 500 then
			
					local the_tankstelle = getNearestTanke ( player )
					
					if the_tankstelle ~= false then
					
						if the_tankstelle == "Nord" then
					
							bizArray["TankstelleNord"]["kasse"] = bizArray["TankstelleNord"]["kasse"] + math.floor(500)
						
						elseif the_tankstelle == "Sued" then
						
							bizArray["TankstelleSued"]["kasse"] = bizArray["TankstelleSued"]["kasse"] + math.floor(500)
						
						elseif the_tankstelle == "Pine" then
						
							bizArray["TankstellePine"]["kasse"] = bizArray["TankstellePine"]["kasse"] + math.floor(500)
						
						end
					
					end
			
			vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 500 )
			outputChatBox ( "Du hast eine Schachtel Zigaretten gekauft! Nutze /smoke, um zu Rauchen oder Öffne dein Inventar.", player, 0, 150, 200 )
			vnxSetElementData ( player, "zigaretten", tonumber ( vnxGetElementData ( player, "zigaretten" ) )+17 )
		else
			outputChatBox ( "Du hast nicht genug Geld! Eine Schachtel kostet 500 $!", player, 125, 0, 0 )
		end
	end
end
addEvent ( "buyKippen", true )
addEventHandler ( "buyKippen", getRootElement(), Zigaretten_Button_Tankstelle )