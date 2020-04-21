setGarageOpen ( 18, true )
setGarageOpen ( 33, true )
createBlip ( -1936.0651855469, 245.01071166992, 33.385932922363, 27, 2, 255, 0, 0, 255, 0, 200 )
--MarkerTuning1 = createMarker ( -1936.0651855469, 245.01071166992, 33.385932922363, "cylinder", 3, 0, 255, 255, 255, getRootElement() )
createBlip ( 2386.8405761719, 1048.7375488281, 8.9104995727539, 27, 2, 255, 0, 0, 255, 0, 200 )
--MarkerTuning2 = createMarker ( 2386.8405761719, 1048.7375488281, 8.9104995727539, "cylinder", 3, 0, 255, 255, 255, getRootElement() )

vnxSetElementData ( MarkerTuning1, "sx", -1936.6840820313 )
vnxSetElementData ( MarkerTuning1, "sy", 220.6498260498 )
vnxSetElementData ( MarkerTuning1, "sz", 34.3125 )
vnxSetElementData ( MarkerTuning1, "sr", 0 )

vnxSetElementData ( MarkerTuning2, "sx", 2393.8520507813 )
vnxSetElementData ( MarkerTuning2, "sy", 989.70678710938 )
vnxSetElementData ( MarkerTuning2, "sz", 10.690312385559 )
vnxSetElementData ( MarkerTuning2, "sr", 0 )

--[[
transfender1, 2393.8520507813, 989.70678710938, 10.690312385559
tuning, 2386.8405761719, 1048.7375488281, 8.9104995727539
]]

function applyLightValues_func ( red, green, blue )
	
	local player = client
	local veh = getPedOccupiedVehicle ( player )
	if isElement ( veh ) then
		setVehicleHeadLightColor ( veh, red, green, blue )
		
		local pname = vnxGetElementData ( veh, "owner" )
		local slot = vnxGetElementData ( veh, "carslotnr_owner" )
		
		if pname == getPlayerName ( player ) then
			lcolor = "|"..red.."|"..green.."|"..blue.."|"
			vnxSetElementData ( veh, "lcolor", lcolor )
			
			dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=? AND ??=?", "vehicles", "Lights", lcolor, "UID", playerUID[pname], "Slot", slot )
		end
	end
end
addEvent ( "applyLightValues", true )
addEventHandler ( "applyLightValues", getRootElement(), applyLightValues_func )

function applyPlate_func ( text )

	local text = text 
	local player = client
	local veh = getPedOccupiedVehicle ( player )
	local pname = vnxGetElementData ( veh, "owner" )
	local slot = vnxGetElementData ( veh, "carslotnr_owner" )
	
	if text and pname == getPlayerName ( player ) then
		if text == "" or text == " " or text == "   " then
		else
			dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=? AND ??=?", "vehicles", "plate", text, "UID", playerUID[pname], "Slot", slot )
			setVehiclePlateText( veh, text )
		end
	end
end
addEvent ( "applyPlate", true )
addEventHandler ( "applyPlate", getRootElement(), applyPlate_func )

function TuningDimFix ( vehicle, dim )
		local player = client
		outputDebugString("Dev00000")
		vnxSetElementData ( vehicle, "tuningSx", x )
		vnxSetElementData ( vehicle, "tuningSy", y )
		vnxSetElementData ( vehicle, "tuningSz", z )
		vnxSetElementData ( vehicle, "tuningSr", r )
		triggerClientEvent( getRootElement(), "hideSpeedometer", getRootElement())
		--i = tonumber ( vnxGetElementData ( player, "playerid" ) )
		vnxSetElementData ( vehicle, "usingdim", dim )
		--setElementPosition ( hitElement, -2053.7531738281, 143.72497558594, 28.923471450806 )
		--setVehicleRotation ( hitElement, 0, 0, 290 )
		setElementDimension ( vehicle, dim )
		setElementDimension ( player, dim )
		setElementInterior ( vehicle, dim )
		setElementInterior ( player, dim )
		setElementVelocity ( vehicle, 0, 0, 0 )
end
addEvent( "setTuningDimension", true )
addEventHandler( "setTuningDimension", getRootElement(), TuningDimFix )



function addSpecialTuning_func ( tuning )

	local player = source
	if player == client then
		local price = specialUpgradePrice[tuning]
		local money = vnxGetElementData ( player, "money" )
		if money >= price then
			local pname = getPlayerName ( player )
			local veh = getPedOccupiedVehicle ( player )
			local totTuning = ""
			for i = 1, 6 do
				if i == tuning then
					vnxSetElementData ( veh, "stuning"..i, tuning )
					totTuning = totTuning.."1".."|"
					if i == 1 then
						outputChatBox ( "Dein Fahrzeug hat nun einen Kofferraum - benutze die Spezialmissionen-Taste, um ihn zu oeffnen.", player, 0, 125, 0 )
						outputChatBox ( "Anschliessend kannst du ihn per Clicksystem bedienen und bestimmte Items darin lagern.", player, 0, 125, 0 )
					elseif i == 2 then
						outputChatBox ( "Dein Fahrzeug ist nun gepanzert und haelt einiges mehr an Schaden aus.", player, 0, 125, 0 )
					elseif i == 3 then
						outputChatBox ( "Dein Fahrzeug verbraucht nun deutlich weniger Benzin.", player, 0, 125, 0 )
					elseif i == 4 then
						outputChatBox ( "Dein Fahrzeug ist nun mit einem GPS-Sender versehen, du kannst seine Position mit /vehinfos abrufen.", player, 0, 125, 0 )
					end
				else
					local tok = gettok ( vnxGetElementData ( veh, "stuning" ), i, string.byte ( '|' ) )
					totTuning = totTuning..tok.."|"
				end
			end
			vnxSetElementData ( veh, "stuning", totTuning )
			dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=? AND ??=?", "vehicles", "STuning", totTuning, "UID", playerUID[pname], "Slot", vnxGetElementData ( veh, "carslotnr_owner" ) )
			specPimpVeh ( veh )
			specialTuningVehEnter ( player, 0 )
			vnxSetElementData ( player, "money", money - price )
			local biz = math.floor(price / 2)
			--TuningKasse = TuningKasse + biz
		end
	end
end
addEvent ( "addSpecialTuning", true )
addEventHandler ( "addSpecialTuning", getRootElement(), addSpecialTuning_func )

function CancelTuning_func ( player, veh, c1, c2, c3, c4, paintjob, t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16 )

	if player == client then
		if veh and paintjob then
			setVehiclePaintjob ( veh, paintjob )
		end
		local color
		if c4 then
			color = "|"..c1.."|"..c2.."|"..c3.."|"..c4.."|"
		else
			color = "|"..c1.."|"..c2.."|"..c3.."|"
		end
		vnxSetElementData ( veh, "color", color )
		setPrivVehCorrectColor ( veh )
		setElementDimension ( player, 0 )
		setElementInterior ( player, 0 )
		setElementDimension ( veh, 0 )
		setElementInterior ( veh, 0 )
		
		local x, y, z, r = vnxGetElementData ( veh, "tuningSx" ), vnxGetElementData ( veh, "tuningSy" ), vnxGetElementData ( veh, "tuningSz" ), vnxGetElementData ( veh, "tuningSr" )
		
		setTimer(function()
			setElementPosition ( veh, x, y, z )
			setElementRotation ( veh, 0, 0, 90 )
			if bikes[getElementModel ( veh )] or getElementModel ( veh ) == 462 or getElementModel ( veh ) == 448 then
				removePedFromVehicle ( player )
				warpPedIntoVehicle ( player, veh )
			end
		end, 500, 1)
			
		setElementFrozen ( veh, true )
		
		setElementVelocity ( veh, 0, 0, 0 )
		setTimer ( setElementVelocity, 1000, 1, veh, 0, 0, 0 )
		setTimer ( setElementFrozen, 2000, 1, veh, false )
		setTimer ( setElementVelocity, 2000, 1, veh, 0, 0, 0 )
		setCameraTarget ( player, player )
		for i = 0, 16 do
			local upgrade = getVehicleUpgradeOnSlot ( veh, i )
			if upgrade then
				removeVehicleUpgrade ( veh, upgrade )
			end
		end
		local tuning = "|"
		if t0 == false then t0 = 0 else addVehicleUpgrade ( veh, t0 ) end
		tuning = tuning..t0.."|"
		if t1 == false then t1 = 0 else addVehicleUpgrade ( veh, t1 ) end
		tuning = tuning..t1.."|"
		if t2 == false then t2 = 0 else addVehicleUpgrade ( veh, t2 ) end
		tuning = tuning..t2.."|"
		if t3 == false then t3 = 0 else addVehicleUpgrade ( veh, t3 ) end
		tuning = tuning..t3.."|"
		if t4 == false then t4 = 0 else addVehicleUpgrade ( veh, t4 ) end
		tuning = tuning..t4.."|"
		if t5 == false then t5 = 0 else addVehicleUpgrade ( veh, t5 ) end
		tuning = tuning..t5.."|"
		if t6 == false then t6 = 0 else addVehicleUpgrade ( veh, t6 ) end
		tuning = tuning..t6.."|"
		if t7 == false then t7 = 0 else addVehicleUpgrade ( veh, t7 ) end
		tuning = tuning..t7.."|"
		if t8 == false then t8 = 0 else addVehicleUpgrade ( veh, t8 ) end
		tuning = tuning..t8.."|"
		if t9 == false then t9 = 0 else addVehicleUpgrade ( veh, t9 ) end
		tuning = tuning..t9.."|"
		if t10 == false then t10 = 0 else addVehicleUpgrade ( veh, t10 ) end
		tuning = tuning..t10.."|"
		if t11 == false then t11 = 0 else addVehicleUpgrade ( veh, t11 ) end
		tuning = tuning..t11.."|"
		if t12 == false then t12 = 0 else addVehicleUpgrade ( veh, t12 ) end
		tuning = tuning..t12.."|"
		if t13 == false then t13 = 0 else addVehicleUpgrade ( veh, t13 ) end
		tuning = tuning..t13.."|"
		if t14 == false then t14 = 0 else addVehicleUpgrade ( veh, t14 ) end
		tuning = tuning..t14.."|"
		if t15 == false then t15 = 0 else addVehicleUpgrade ( veh, t15 ) end
		tuning = tuning..t15.."|"
		if t16 == false then t16 = 0 else addVehicleUpgrade ( veh, t16 ) end
		tuning = tuning..t16.."|"
		local pname = getPlayerName ( player )
		local slot = vnxGetElementData ( veh, "carslotnr_owner" )
		activeCarGhostMode ( player, 10000 )
		if slot then
			dbExec ( handler, "UPDATE ?? SET ??=?, ??=?, ??=? WHERE ??=? AND ??=?", "vehicles", "Tuning", tuning, "Farbe", color, "Paintjob", paintjob, "UID", playerUID[pname], "Slot", slot )
		end
	end
end
addEvent ( "CancelTuning", true )
addEventHandler ( "CancelTuning", getRootElement(), CancelTuning_func )

function buyTuningPart_func ( player, veh, part, price )
	
	if player == client then
		price = math.floor ( math.abs ( price ) )
		local money = vnxGetElementData ( player, "money" )
		if price >= money then
			if veh and part then
				addVehicleUpgrade ( veh, part )
			end
			vnxSetElementData ( player, "money", money - price )
		end
		playSoundFrontEnd ( player, 40 )
		--TuningKasse = TuningKasse + price
	end
end
addEvent ( "buyTuningPart", true )
addEventHandler ( "buyTuningPart", getRootElement(), buyTuningPart_func )