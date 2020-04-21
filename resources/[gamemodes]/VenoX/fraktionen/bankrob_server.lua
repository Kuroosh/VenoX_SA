--[[local bankeingang = {}
bankeingang[1] = createColSphere ( 2364.8955078125, 2377.5654296875, 10.8203125, 1 ) -- ausserhalb
bankeingang[2] = createColSphere ( 286.5390625, -159.1982421875, 886.21331787109, 1 ) -- innerhalb
local bankeingangmarker = {}
bankeingangmarker[1] = createMarker ( 2364.8955078125, 2377.5654296875, 10.8203125, "corona", 2.0, 255, 0, 0) -- ausserhalb-marker
bankeingangmarker[2] = createMarker ( 286.5390625, -159.1982421875, 886.21331787109, "corona", 2.0, 255, 0, 0) -- innerhalb-marker
local bank_rob_col = createColSphere ( 267.767578125, -174.8671875, 873.62127685547, 6 ) -- rob
local bank_door = createObject ( 2924, 303.10000610352, -169.19999694824, 886.40002441406, 0, 0, 90 )
setElementInterior (bank_door,7)
bank_wird_ausgeraubt = 0
bank_robber = 0
bank_i = 3
bank_timer = 0
bank_robbed = 0
local movingVal = 5
bank_timer_global = 0
local bank_door_value = 0
local gotKey = nil

addEventHandler( "onElementClicked", bank_door,
	function ( _, state, player )

		if state == "down" and player then
		else
			return
		end

		if bank_wird_ausgeraubt ~= 0 then
			local _time, _, _2 = getTimerDetails ( bank_timer_global )
			local var = _time / 1000
			local var1 = math.floor ( var / 60 )
			outputChatBox ("Du kannst in "..var1.." Minuten wieder ausrauben.", player, 255, 0, 0 )
			return
		end

		if isEvil(player) then
		else
			outputChatBox ("Nur f\195\188r b\195\182se Fraktionisten!", player, 255, 0, 0 )
			return
		end

		local key = gotKey == player

		if not key or key == 0 then
			outputChatBox ( "Du hast keinen Schl\195\188ssel f\195\188r diese T\195\188r!", player, 0, 125, 0 )
		else

			local x, y, z = getElementPosition ( bank_door )

			moveObject ( bank_door, 1000, x, y, z-movingVal )
			gotKey = nil
			bank_door_value = bank_door_value+1
			outputChatBox ( "Die T\195\188r bleibt nun genau 20 Minuten offen! Die Polizei ist bereits auf dem Weg, also beeilt euch!", player, 125, 0, 0 )
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

	outputChatBox ( "Du hast den Bankdirektor get\195\182tet und erh\195\164ltst die Schl\195\188sselkarte! \195\150ffne die T\195\188r zum Tresor! ( Klicke darauf )", player, 0, 125, 0 )
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
	if isEvil(target) then
		local msg = "Eine Bank in San Andreas wird \195\188berfallen von "..getPlayerName(target).." und fordert umgehend Hilfe!"
		sendMSGForFaction ( msg, 1, 255, 0, 0 )
		sendMSGForFaction ( msg, 6, 255, 0, 0 )
		sendMSGForFaction ( msg, 8, 255, 0, 0 )
		msg = "Eine Bank in San Andreas wird \195\188berfallen."
		sendMSGForFaction ( msg, 2, 255, 0, 0 )
		sendMSGForFaction ( msg, 3, 255, 0, 0 )
		sendMSGForFaction ( msg, 7, 255, 0, 0 )
		sendMSGForFaction ( msg, 9, 255, 0, 0 )
	end

end

local bank_ped
bank_ped = createPed ( 17, 291.6162109375, -165.625, 886.21331787109, 90 )
addEventHandler( "onPedWasted", bank_ped, giveBankKeyCard )
triggerClientEvent ( "onBankPedGetsCool", bank_ped, bank_ped )
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

setTimer ( r_bankped, 600000, 0 )

function enter_bank ( thePlayer, matchingDimension )

	if getElementType ( thePlayer ) == "player" then

		if getPedOccupiedVehicle ( thePlayer ) then
			return
		end

		setElementInterior ( thePlayer, 7 )
		setElementPosition ( thePlayer, 287.1630859375, -162.38671875, 886.220703125 )
		setElementRotation ( thePlayer, 0, 0, 180 )

	end

end

addEventHandler ( "onColShapeHit", bankeingang[1], enter_bank )

function exit_bank ( thePlayer, matchingDimension )

	if getElementType ( thePlayer ) == "player" then

		if getPedOccupiedVehicle ( thePlayer ) then
			return
		end

		setElementInterior ( thePlayer, 0 )
		setElementPosition ( thePlayer, 2361.6572265625, 2378.244140625, 10.8203125 )
		setElementRotation ( thePlayer, 0, 0, 90 )

	end

end

addEventHandler ( "onColShapeHit", bankeingang[2], exit_bank )

function rob_bank ( thePlayer, matchingDimension )

	outputChatBox ( "Gebe /bankrob ein, um die Bank auszurauben.", thePlayer, 0, 125, 0 )

end

addEventHandler ( "onColShapeHit", bank_rob_col, rob_bank )

function robber_wasted ()

	removeEventHandler ( "onPlayerWasted", bank_robber, robber_wasted )
	removeEventHandler ( "onColShapeLeave", bank_rob_col, bank_col_leave )
	bank_robber = 0
	bank_i = 3
	bank_timer = 0

end

function info_bank_timer ()

	if bank_i == 0 then

		if isElementWithinColShape ( bank_robber, bank_rob_col ) then

			local aval = 1 - ( bank_robbed / 10 )
			local bank_money = 35000 * aval

			outputChatBox ( "Der Bankraub war erfolgreich.", getRootElement(), 0, 125, 0 )
			outputChatBox ( "Du hast "..bank_money.." Geld erhalten. Fl\195\188chte schnell!", bank_robber, 0, 125, 0 )
			vnxSetElementData ( bank_robber, "money", vnxGetElementData (bank_robber, "money" ) + bank_money )
			robber_wasted ()

		else

			outputChatBox ( "Der Bankraub ist fehlgeschlagen.", getRootElement(), 125, 0, 0 )
			killTimer ( bank_timer )
			robber_wasted()

		end

	else

		outputChatBox ( "Noch "..bank_i.." Minuten bis zum Abschluss.", bank_robber, 0, 125, 0 )
		bank_i = bank_i - 1

	end

end

function bank_col_leave (ele)

	if ele == bank_robber then

		outputChatBox ( "Der Bankraub ist fehlgeschlagen.", getRootElement(), 125, 0, 0 )
		killTimer ( bank_timer )
		robber_wasted()

	end

end

function robber_die ()

	outputChatBox ( "Der Bankraub ist fehlgeschlagen.", getRootElement(), 125, 0, 0 )
	killTimer ( bank_timer )
	robber_wasted()

end

function bank_rob ( player, _ )

	if isEvil ( player ) and vnxGetElementData ( player, "rang" ) >= 2 and isElementWithinColShape ( player, bank_rob_col ) then

		if bank_wird_ausgeraubt ~= 1 then

			if bank_door_value < 1 then
				outputChatBox ( "Error 403", player, 0, 125, 0 )
				return
			end

			bank_wird_ausgeraubt = 1
			outputChatBox ( "Du hast einen Bankraub gestartet. Bleibe 4 Minuten bei den Gelds\195\164cken.", player, 0, 125, 0 )
			outputChatBox ( "Solltest du sterben oder weggehen, wird der Raub abgebrochen.", player, 0, 125, 0 )

			sendMSGForFaction ( "Eine Bank in San Andreas meldet einen Raub\195\188berfall", 1, 150, 0, 0 )
			sendMSGForFaction ( "Macht euch startklar und seid vorbereitet!", 1, 150, 0, 0 )
			sendMSGForFaction ( "Bank: Las Venturas!", 1, 150, 0, 0 )

			sendMSGForFaction ( "Eine Bank in San Andreas meldet einen Raub\195\188berfall!", 6, 150, 0, 0 )
			sendMSGForFaction ( "Macht euch startklar und seid vorbereitet!", 6, 150, 0, 0 )
			sendMSGForFaction ( "Bank: Las Venturas!", 6, 150, 0, 0 )

			sendMSGForFaction ( "Eine Bank in San Andreas meldet einen Raub\195\188berfall!!",8, 150, 0, 0 )
			sendMSGForFaction ( "Macht euch startklar und seid vorbereitet!", 8, 150, 0, 0 )
			sendMSGForFaction ( "Bank: Las Venturas!", 8, 150, 0, 0 )

			bank_robber = player

			bank_timer = setTimer ( info_bank_timer, 60000, 4 )

			bank_timer_global = setTimer (
				function ()

					bank_wird_ausgeraubt = 0
					outputChatBox("Die Bank in Las Venturas hat sich erholt ...", getRootElement(), 160, 160, 160)

				end, 7200000, 1 )

			addEventHandler ( "onPlayerWasted", player, robber_die )
			addEventHandler ( "onColShapeLeave", bank_rob_col, bank_col_leave )

		else

			local _time, _, _2 = getTimerDetails ( bank_timer_global )

			local var = _time / 1000
			local var1 = math.floor ( var / 60 )

			outputChatBox ( "Du kannst in "..var1.." Minuten wieder ausrauben.", player, 125, 0, 0 )

		end

	else
		outputChatBox ( "Diese Funktion steht dir erst ab Rang 2 in einer b\195\182sen Fraktion zur Verf\195\188gung.", player, 125, 0, 0 )
	end

end

addCommandHandler ( "bankrob", bank_rob )--]]
