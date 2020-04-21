bonusVehicles = {
 [460]=true, -- Wasserflugzeug
 [539]=true, -- Vortex
 [471]=true, -- Quad
 [442]=true, -- Leichenwagen
 [457]=true  -- Golfwagen
}

camper = {
 [483]=true,
 [508]=true
}

function hasPlayerLicense ( player, id )

	if bonusVehicles[id] then
		if id == 460 then
			if vnxGetElementData ( player, "skimmer" ) == 1 then
				if tonumber ( vnxGetElementData ( player, "planelicensea" ) ) == 1 then
					return true
				else
					outputChatBox ( "Du hast keinen Flugschein der Klasse A!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Du hast den Bonus nicht erworben!", player, 125, 0, 0 )
				return false
			end
		elseif id == 539 then
			if vnxGetElementData ( player, "vortex" ) ~= "none" then
				if tonumber ( vnxGetElementData ( player, "carlicense" ) ) == 1 then
					return true
				else
					outputChatBox ( "Du hast keinen Führerschein! - Lass dich nicht erwischen!", player, 125, 0, 0 )
					return true
				end
			else
				outputChatBox ( "Du hast den Bonus nicht erworben!", player, 125, 0, 0 )
				return false
			end
		elseif id == 471 then
			if vnxGetElementData ( player, "quad" ) == "buyed" then
				if tonumber ( vnxGetElementData ( player, "bikelicense" ) ) == 1 then
					return true
				else
					outputChatBox ( "Du hast keinen Motorrad-Führerschein!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Du hast den Bonus nicht erworben!", player, 125, 0, 0 )
				return false
			end
		elseif id == 442 then
			if vnxGetElementData ( player, "romero" ) == 1 then
				if tonumber ( vnxGetElementData ( player, "carlicense" ) ) == 1 then
					return true
				else
					outputChatBox ( "Du hast keinen Führerschein!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Du hast den Bonus nicht erworben!", player, 125, 0, 0 )
				return false
			end
		elseif id == 457 then
			if vnxGetElementData ( player, "golfcart" ) then
				return true
			else
				outputChatBox ( "Du hast den Bonus nicht erworben!", player, 125, 0, 0 )
				return false
			end
		end
		return false
	elseif cars[id] then
		if tonumber ( vnxGetElementData ( player, "carlicense" ) ) == 1 then
			return true
		else
			outputChatBox ( "Du hast keinen Führerschein!", player, 125, 0, 0 )
			return false
		end
	elseif lkws[id] then
		if tonumber ( vnxGetElementData ( player, "lkwlicense" ) ) == 1 then
			return true
		else
			outputChatBox ( "Du hast keinen LKW-Führerschein!", player, 125, 0, 0 )
			return false
		end
	elseif bikes[id] then
		if tonumber ( vnxGetElementData ( player, "bikelicense" ) ) == 1 then
			return true
		else
			outputChatBox ( "Du hast keinen Motorrad-Führerschein!", player, 125, 0, 0 )
			return false
		end
	elseif helicopters[id] then
		if tonumber ( vnxGetElementData ( player, "helilicense" ) ) == 1 then
			return true
		else
			outputChatBox ( "Du hast keinen Flugschein Klasse C!", player, 125, 0, 0 )
			return false
		end
	elseif planea[id] then
		if tonumber ( vnxGetElementData ( player, "planelicensea" ) ) == 1 then
			return true
		else
			outputChatBox ( "Du hast keinen Flugschein Klasse A!", player, 125, 0, 0 )
			return false
		end
	elseif planeb[id] then
		if tonumber ( vnxGetElementData ( player, "planelicenseb" ) ) == 1 then
			return true
		else
			outputChatBox ( "Du hast keinen Flugschein Klasse B!", player, 125, 0, 0 )
			return false
		end
	elseif motorboats[id] then
		if tonumber ( vnxGetElementData ( player, "motorbootlicense" ) ) == 1 then
			return true
		else
			outputChatBox ( "Du hast keinen Motorbootschein!", player, 125, 0, 0 )
			return false
		end
	elseif raftboats[id] then
		if tonumber ( vnxGetElementData ( player, "segellicense" ) ) == 1 then
			return true
		else
			outputChatBox ( "Du hast keinen Segelschein!", player, 125, 0, 0 )
			return false
		end
	elseif nolicense[id] then
		return true
	else
		return true
	end
end

function VehicleEnter ( veh, seat )

	if getElementType ( source ) == "ped" then
		return true
	end
	if getPedOccupiedVehicleSeat ( source ) == 0 then
		if lkws[getElementModel ( veh )] == true then
			if tonumber(vnxGetElementData ( source, "lkwlicense" )) == 1 then
			else
				opticExitVehicle ( source )
				outputChatBox ( "Du hast noch keinen LKW-Führerschein!", source, 255, 0, 0 )
			end
		end
		if helicopters[getElementModel ( veh )] == true then
			if tonumber(vnxGetElementData ( source, "helilicense" )) == 1 then
			else
				opticExitVehicle ( source )
				outputChatBox ( "Du hast noch keinen HelikopterFührerschein!", source, 255, 0, 0 )
			end
		end
		if planea[getElementModel ( veh )] == true then
			if tonumber(vnxGetElementData ( source, "planelicensea" )) == 1 then
			else
				opticExitVehicle ( source )
				outputChatBox ( "Du hast noch keinen Flugschein der Klasse A!", source, 255, 0, 0 )
			end
		end
		planeb[511] = false
		planeb[553] = false
		if planeb[getElementModel ( veh )] == true then
			if tonumber(vnxGetElementData ( source, "planelicenseb" )) == 1 then
			else
				opticExitVehicle ( source )
				outputChatBox ( "Du hast noch keinen Flugschein der Klasse B!", source, 255, 0, 0 )
			end
		end
		if bikes[getElementModel ( veh )] == true then
			if tonumber(vnxGetElementData ( source, "bikelicense" )) == 1 then
			else
				opticExitVehicle ( source )
				outputChatBox ( "Du hast noch keinen MotorradtFührerschein!", source, 255, 0, 0 )
			end
		end
		if raftboats[getElementModel ( veh )] == true then
			if tonumber(vnxGetElementData ( source, "segellicense" )) == 1 then
			else
				opticExitVehicle ( source )
				outputChatBox ( "Du hast noch keinen Segelschein!", source, 255, 0, 0 )
			end
		end
		if motorboats[getElementModel ( veh )] == true then
			if tonumber(vnxGetElementData ( source, "motorbootlicense" )) == 1 then
			else
				opticExitVehicle ( source )
				outputChatBox ( "Du hast noch keinen Motorboot Führerschein!", source, 255, 0, 0 )
			end
		end
	end
end
addEventHandler ( "onPlayerVehicleEnter", getRootElement(), VehicleEnter )

function opticExitVehicle ( player )

	local veh = getPedOccupiedVehicle ( player )
	if isElement ( veh ) then
		if getPedOccupiedVehicleSeat ( player ) == 0 then
			setElementVelocity ( veh, 0, 0, 0 )
		end
		setControlState ( player, "enter_exit", false )
		setTimer ( removePedFromVehicle, 750, 1, player )
		setTimer ( setControlState, 150, 1, player, "enter_exit", false )
		setTimer ( setControlState, 200, 1, player, "enter_exit", true )
		setTimer ( setControlState, 700, 1, player, "enter_exit", false )
	end
end
addEvent ( "opticExitVehicle", true )
addEventHandler ( "opticExitVehicle", getRootElement(),
	function ()
		opticExitVehicle ( client )
	end
)

function hasPlayerPerso ( player )

	return ( vnxGetElementData ( player, "perso" ) == 1 )
end