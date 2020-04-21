local bankeingang = {}
bankeingang[1] = createColSphere ( 2364.8955078125, 2377.5654296875, 10.8203125, 1 ) -- ausserhalb
bankeingang[2] = createColSphere ( 286.5390625, -159.1982421875, 886.21331787109, 1 ) -- innerhalb

bank_wird_ausgeraubt = 0
bank_robber = 0
bank_i = 3
bank_timer = 0
bank_robbed = 0

bank_timer_global = 0

createBlip ( 2364.8955078125, 2377.5654296875, 10.8203125, 52 )

local bank_rob_col = createColSphere ( 267.767578125, -174.8671875, 873.62127685547, 5 ) -- rob

local bank_ped 
bank_ped = createPed ( 17, 291.6162109375, -165.625, 886.21331787109, 90 )
setElementInterior ( bank_ped, 7 )
setElementData ( bank_ped, "bank_ped", true )

function r_bankped ()

	destroyElement ( bank_ped )
	bank_ped = createPed ( 17, 291.6162109375, -165.625, 886.21331787109, 90 )
	setElementInterior ( bank_ped, 7 )
	setElementData ( bank_ped, "bank_ped", true )

end

setTimer ( r_bankped, 600000, 0 ) 

function enter_bank ( thePlayer, matchingDimension )

	if getElementType ( thePlayer ) == "player" then
	
		setElementInterior ( thePlayer, 7 )
		setElementPosition ( thePlayer, 287.1630859375, -162.38671875, 886.220703125 )
		setElementRotation ( thePlayer, 0, 0, 180 )
	
	end
	
end

addEventHandler ( "onColShapeHit", bankeingang[1], enter_bank )

function exit_bank ( thePlayer, matchingDimension )

	if getElementType ( thePlayer ) == "player" then
	
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
			local bank_money = 20000 * aval
	
			outputChatBox ( "Dein Bankraub war erfolgreich.", bank_robber, 0, 125, 0 )
			outputChatBox ( "Du hast "..bank_money.." Geld erhalten. Fluechte schnell!", bank_robber, 0, 125, 0 )
			vnxSetElementData ( bank_robber, "money", vnxGetElementData (bank_robber, "money" ) + bank_money )
			robber_wasted ()
		
		else
		
			outputChatBox ( "Dein Bankraub ist fehlgeschlagen.", source, 125, 0, 0 )
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
	
		outputChatBox ( "Dein Bankraub ist fehlgeschlagen.", ele, 125, 0, 0 )
		killTimer ( bank_timer )
		robber_wasted()
	
	end

end

function robber_die ()

	outputChatBox ( "Dein Bankraub ist fehlgeschlagen.", source, 125, 0, 0 )
	killTimer ( bank_timer )
	robber_wasted()

end

function bank_rob ( player, _ )

	if isEvil ( player ) and vnxGetElementData ( player, "rang" ) >= 2 and isElementWithinColShape ( player, bank_rob_col ) then
	
		if bank_wird_ausgeraubt ~= 1 then
	
			bank_wird_ausgeraubt = 1
			outputChatBox ( "Du hast einen Bankraub gestartet. Bleibe 4 Minuten bei den Geldsaecken.", player, 0, 125, 0 )
			outputChatBox ( "Solltest du sterben oder weggehen, wird der Raub abgebrochen.", player, 0, 125, 0 )
			
			sendMSGForFaction ( "Die Las Venturas Bank meldet einen Einbruch in den Tresorraum!", 1, 150, 0, 0 )
			sendMSGForFaction ( "Sie sollten sich umgehend dorthin bewegen!", 1, 150, 0, 0 )

			sendMSGForFaction ( "Die Las Venturas Bank meldet einen Einbruch in den Tresorraum!", 6, 150, 0, 0 )
			sendMSGForFaction ( "Sie sollten sich umgehend dorthin bewegen!", 6, 150, 0, 0 )
			
			sendMSGForFaction ( "Die Las Venturas Bank meldet einen Einbruch in den Tresorraum!",8, 150, 0, 0 )
			sendMSGForFaction ( "Sie sollten sich umgehend dorthin bewegen!", 8, 150, 0, 0 )
			
			bank_robber = player
			
			bank_timer = setTimer ( info_bank_timer, 60000, 4 )
			
			bank_timer_global = setTimer ( 
				function ()
				
					bank_wird_ausgeraubt = 0
				
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
		outputChatBox ( "Diese Funktion steht dir erst ab Rang 2 in einer boesen Fraktion zur Verfuegung.", player, 125, 0, 0 )
	end

end

addCommandHandler ( "bankrob", bank_rob )