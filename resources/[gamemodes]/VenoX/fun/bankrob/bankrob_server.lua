local bankeingang = {}
bankeingang[1] = createMarker ( 2364.8955078125, 2377.5654296875, 10.1203125, "cylinder", 1, 255, 0, 0 ) -- ausserhalb
bankeingang[2] = createMarker ( 286.5390625, -159.1982421875, 885.51331787109, "cylinder", 1, 255, 0, 0 ) -- innerhalb
local bank_rob_col = createColSphere ( 267.767578125, -174.8671875, 873.62127685547, 5 ) -- rob
local bank_door = createObject ( 2924, 303.10000610352, -169.19999694824, 886.40002441406, 0, 0, 90 )
setElementInterior (bank_door,7)
setElementInterior (bankeingang[2],7)
bank_wird_ausgeraubt = 0
bank_robber = 0
bank_i = 3
bank_timer = 0
bank_robbed = 0
local movingVal = 5
bank_timer_global = 0
local bank_door_value = 0
local bereitsdraussen = false
local gotKey = nil

addEventHandler( "onElementClicked", bank_door, 
	function ( _, state, player )
	
		if state == "down" and player then
		else
			return
		end
		
		if bank_wird_ausgeraubt ~= 0 or aktionlaeuft then
			if isTimer ( bank_timer_global ) then
				local _time, _, _2 = getTimerDetails ( bank_timer_global )
				local var = _time / 1000
				local var1 = math.floor ( var / 60 )
				
				outputChatBox ( "Du kannst in "..var1.." Minuten wieder ausrauben.", player, 125, 0, 0 )
			end
			infobox ( player, "Zur Zeit kann\ndie Aktion nicht\ngestartet werden!", 5000, 150, 0, 0 )
			return
		end
		
		
		if isEvil(player) then
		else
			infobox ( player, "\nNur für böse\nFraktionisten!", 5000, 150, 0, 0 )
			return
		end
		
		local key = gotKey == player
		
		if not key or key == 0 then
			infobox ( player, "Du hast keinen\nSchlüssel für\ndiese Tür!", 5000, 150, 0, 0 )
		else
		
			local x, y, z = getElementPosition ( bank_door )
			
			moveObject ( bank_door, 1000, x, y, z-movingVal )
			gotKey = nil
			bank_door_value = bank_door_value+1
			outputChatBox ( "Die Tür bleibt nun genau 20 Minuten offen! Die Polizei ist bereits auf dem Weg, also beeilt euch!", player, 125, 0, 0 )
			setTimer ( 
				function ()
					local x, y, z = getElementPosition ( bank_door )
					moveObject ( bank_door, 1000, x, y, z+movingVal )
					bank_door_value = 0
				end, 1200000, 1 )
		
		end
	
	end )

createBlip ( 2364.8955078125, 2377.5654296875, 10.8203125, 52 )

function giveBankKeyCard ( _, player )

	if not player then return end
	
	outputChatBox ( "Du hast den Bankdirektor getötet und erhältst die Schlüsselkarte! Öffne die Tür zum Tresor! ( Klicke darauf )", player, 0, 125, 0 )
	gotKey = player
	
	local target = player
	
	if vnxGetElementData ( target, "wanteds" ) <= 3 then
		vnxSetElementData ( target, "wanteds", vnxGetElementData ( target, "wanteds" ) + 3 )
		setPlayerWantedLevel ( target, vnxGetElementData ( target, "wanteds" ) )
	else
		vnxSetElementData ( target, "wanteds", 6 )
		setPlayerWantedLevel ( target, vnxGetElementData ( target, "wanteds" ) )
	end
	
	outputChatBox ( "Du hast ein Verbrechen begangen: Mord, Gemeldet von: Bank-Sicherheit", target, 255, 255, 0 )
	local msg = "Die Bank-Sicherheit meldet einen Mord von "..getPlayerName(target).." und fordert umgehend Hilfe!"
	sendMSGForFaction ( msg, 1, 0, 0, 200 )
	sendMSGForFaction ( msg, 6, 0, 0, 200 )
	sendMSGForFaction ( msg, 8, 0, 0, 200 )

end

local bank_ped 
bank_ped = createPed ( 17, 291.6162109375, -165.625, 886.21331787109, 90 )
addEventHandler( "onPedWasted", bank_ped, giveBankKeyCard )
setElementInterior ( bank_ped, 7 )
setElementData ( bank_ped, "bank_ped", true )

function r_bankped ()

	destroyElement ( bank_ped )
	bank_ped = createPed ( 17, 291.6162109375, -165.625, 886.21331787109, 90 )
	addEventHandler( "onPedWasted", bank_ped, giveBankKeyCard )
	triggerClientEvent ( "onBankPedGetsCool", bank_ped, bank_ped )
	setElementInterior ( bank_ped, 7 )
	setElementData ( bank_ped, "bank_ped", true )

end


function enter_bank ( thePlayer, matchingDimension )

	if getElementType ( thePlayer ) == "player" and matchingDimension then
	
		if getPedOccupiedVehicle ( thePlayer ) then
			return
		end

		setElementInterior ( thePlayer, 7 )
		setElementPosition ( thePlayer, 287.1630859375, -162.38671875, 886.220703125 )
		setElementRotation ( thePlayer, 0, 0, 180 )
		
		if bank_wird_ausgeraubt == 0 then
			if isPedDead ( bank_ped ) or not isElement ( bank_ped ) then
				destroyElement ( bank_ped )
				bank_ped = createPed ( 17, 291.6162109375, -165.625, 886.21331787109, 90 )
				addEventHandler( "onPedWasted", bank_ped, giveBankKeyCard )
				setElementInterior ( bank_ped, 7 )
				setElementData ( bank_ped, "bank_ped", true )
			end
		end
		
	
	end
	
end

addEventHandler ( "onMarkerHit", bankeingang[1], enter_bank )

function exit_bank ( thePlayer, matchingDimension )

	if getElementType ( thePlayer ) == "player" and matchingDimension then
	
		if getPedOccupiedVehicle ( thePlayer ) then
			return
		end
	
		setElementInterior ( thePlayer, 0 )
		setElementPosition ( thePlayer, 2361.6572265625, 2378.244140625, 10.8203125 )
		setElementRotation ( thePlayer, 0, 0, 90 )
	
	end
	
	if vnxGetElementData (thePlayer, "gotdamoney") and not bereitsdraussen then
		vnxSetElementData ( bank_robber, "money", vnxGetElementData (bank_robber, "money" ) + 35000 )
		bereitsdraussen = true
		removeEventHandler ( "onPlayerWasted", thePlayer, robber_die ) 
	end
	
end

addEventHandler ( "onMarkerHit", bankeingang[2], exit_bank )

function rob_bank ( thePlayer, matchingDimension )

	outputChatBox ( "Gebe /bankrob ein, um die Bank auszurauben.", thePlayer, 0, 125, 0 )
	
end

addEventHandler ( "onColShapeHit", bank_rob_col, rob_bank )

function robber_wasted ()

	removeEventHandler ( "onPlayerWasted", bank_robber, robber_wasted )
	removeEventHandler ( "onColShapeLeave", bank_rob_col, bank_col_leave )
	bank_i = 3
	bank_timer = 0

end

function info_bank_timer ()

	if bank_i == 0 then
	 
		if isElementWithinColShape ( bank_robber, bank_rob_col ) then

	
			outputChatBox ( "Der Bankraub war erfolgreich.", root, 0, 125, 0 )
			outputChatBox ( "Du erhältst das Geld draußen, flüchte schnell!", bank_robber, 0, 125, 0 )
			vnxSetElementData (bank_robber, "gotdamoney", true)
			setTimer ( function ( player )
				if vnxGetElementData (player, "gotdamoney") then
					if not bereitsdraussen then
						outputChatBox ( "Das Geld hat sich in Luft aufgelöst!", player, 200, 0, 0 )
					end
					vnxSetElementData (player, "gotdamoney", nil)
				end
			end, 30*60*1000, 1, bank_robber )
			bereitsdraussen = false
			setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1)
			removeEventHandler ( "onPlayerWasted", bank_robber, robber_wasted )
			removeEventHandler ( "onPlayerWasted", bank_robber, robber_die ) 
			removeEventHandler ( "onColShapeLeave", bank_rob_col, bank_col_leave )
			bank_i = 3
			bank_timer = 0
		
		else
		
			outputChatBox ( "Der Bankraub ist fehlgeschlagen.", root, 125, 0, 0 )
			removeEventHandler ( "onPlayerWasted", bank_robber, robber_die ) 
			bank_robber = 0
			if isTimer ( bank_timer ) then
				killTimer ( bank_timer )
			end
			setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1)
			robber_wasted()
		
		end
	
	else
	
		outputChatBox ( "Noch "..bank_i.." Minuten bis zum Abschluss.", bank_robber, 0, 125, 0 )
		bank_i = bank_i - 1	
	
	end

end

function bank_col_leave (ele)

	if ele == bank_robber then
	
		outputChatBox ( "Der Bankraub ist fehlgeschlagen.", root, 125, 0, 0 )
		removeEventHandler ( "onPlayerWasted", ele, robber_die ) 
		killTimer ( bank_timer )
		setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1)
		robber_wasted()
	
	end

end

function robber_die ()

	outputChatBox ( "Der Bankraub ist fehlgeschlagen.", root, 125, 0, 0 )
	removeEventHandler ( "onPlayerWasted", bank_robber, robber_die ) 
	killTimer ( bank_timer )
	setTimer ( function() aktionlaeuft = false end, aktionpuffer, 1)
	bank_robber = 0
	robber_wasted()

end

function bank_rob ( player, _ )

	if isEvil ( player ) and isElementWithinColShape ( player, bank_rob_col ) then
	
		if bank_wird_ausgeraubt ~= 1 then
		
			if bank_door_value < 1 then
				outputChatBox ( "Error 403", player, 0, 125, 0 )
				return
			end
	
			bank_wird_ausgeraubt = 1
			aktionlaeuft = true
			outputChatBox ( "Ein Bankrob wurde gestartet!", getRootElement(), 155, 0, 0 )
			outputChatBox ( "Du hast einen Bankraub gestartet. Bleibe 4 Minuten bei den Geldsaecken.", player, 0, 125, 0 )
			outputChatBox ( "Solltest du sterben oder weggehen, wird der Raub abgebrochen.", player, 0, 125, 0 )
			
			sendMSGForFaction ( "Die Las Venturas Bank meldet einen Einbruch in den Tresorraum!", 1, 150, 0, 0 )
			sendMSGForFaction ( "Sie sollten sich umgehend dorthin bewegen!", 1, 150, 0, 0 )

			sendMSGForFaction ( "Die Las Venturas Bank meldet einen Einbruch in den Tresorraum!", 6, 150, 0, 0 )
			sendMSGForFaction ( "Sie sollten sich umgehend dorthin bewegen!", 6, 150, 0, 0 )
			
			sendMSGForFaction ( "Die Las Venturas Bank meldet einen Einbruch in den Tresorraum!",8, 150, 0, 0 )
			sendMSGForFaction ( "Sie sollten sich umgehend dorthin bewegen!", 8, 150, 0, 0 )
			
			bank_robber = player
			bereitsdraussen = false
			outputLog ( "Bankraub - "..getPlayerName(player).." - "..fraktionNames[vnxGetElementData ( player, "fraktion")], "aktion" )
			
			bank_timer = setTimer ( info_bank_timer, 60000, 4 )
			
			bank_timer_global = setTimer ( 
				function ()
				
					bank_wird_ausgeraubt = 0
					if isElement ( bank_ped ) then
						destroyElement ( bank_ped )
					end
					bank_ped = createPed ( 17, 291.6162109375, -165.625, 886.21331787109, 90 )
					addEventHandler( "onPedWasted", bank_ped, giveBankKeyCard )
					setElementInterior ( bank_ped, 7 )
					setElementData ( bank_ped, "bank_ped", true )
				
				end, 7200000, 1 )
			
			addEventHandler ( "onPlayerWasted", player, robber_die ) 
			addEventHandler ( "onColShapeLeave", bank_rob_col, bank_col_leave )
		
		else
			
			local _time, _, _2 = getTimerDetails ( bank_timer_global )
			
			local var = _time / 1000
			local var1 = math.floor ( var / 60 )
			
			outputChatBox ( "Du kannst in "..var1.." Minuten wieder ausrauben.", player, 125, 0, 0 )
		
		end
	
	end

end

addCommandHandler ( "bankrob", bank_rob )


function nehmeGeldAb ( player, cmd, target )
	if isOnDuty ( player ) then
		if target then
			local targetpl = findPlayerByName ( target )
			if targetpl then
				local x1, y1, z1 = getElementPosition ( player )
				local x2, y2, z2 = getElementPosition ( targetpl )
				if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) < 10 then
					if vnxGetElementData ( targetpl, "gotdamoney" ) then
						if bereitsdraussen then
							if vnxGetElementData ( targetpl, "money" ) >= 35000 then
								vnxSetElementData ( targetpl, "money", vnxGetElementData ( targetpl, "money" ) - 35000 )
							else 
								vnxSetElementData ( targetpl, "money", 0 )
							end
							vnxSetElementData (targetpl, "gotdamoney", false)
							outputChatBox ( "Das Geld wurde abgenommen!", targetpl, 255, 0, 0 )
							outputChatBox ( "Du hast ihm das Geld abgenommen!", player, 0, 255, 0 )
						else
							vnxSetElementData (targetpl, "gotdamoney", false)
							outputChatBox ( "Das Geld wurde abgenommen!", targetpl, 255, 0, 0 )
							outputChatBox ( "Du hast ihm das Geld abgenommen!", player, 0, 255, 0 )
						end
					else
						outputChatBox ( "Er hat das Geld nicht!", player, 255, 0, 0 )
					end
				end
			end
		end
	end
end
addCommandHandler ( "abnehmen", nehmeGeldAb )

					