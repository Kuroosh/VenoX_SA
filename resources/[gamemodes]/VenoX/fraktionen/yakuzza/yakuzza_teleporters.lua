local ItalianMafiaFromInt = createPickup ( -2496, 2378.9, 1501.3, 3, 1318, 50, 0 )
local ItalianMafiaToInt = createPickup ( -2463.1787109375, 132.025390625, 35.171875, 3, 1318, 50, 0 )
local ItalianMafiaToHeli = createMarker ( -2458.515625 , 127.646484375 , 35.171875, "corona", 1.5, 0, 150, 200, 255)
local ItalianMafiaFromHeli = createMarker ( -2476.732421875 , 155.548828125 , 64.933219909668, "corona", 1.5, 0, 150, 200, 255)
--Int
function ItalianMafiaToInt_func ( player )
	if isIMafia ( player ) then
		if isPedInVehicle ( player ) == false then
			triggerClientEvent(player,"blendLoadingScreen",player)
			setElementPosition ( player, -2495.9, 2376.4, 1501 )
			setElementRotation ( player, 0, 0, 90 )
		end
	else
		outputChatBox ("Nur für ItalianMafia Mitglieder!", player, 100, 100, 100 )
	end
end
addEventHandler("onPickupHit", ItalianMafiaToInt, ItalianMafiaToInt_func)

function ItalianMafiaToHeli_func ( player )
	if isIMafia ( player ) then
		if isPedInVehicle ( player ) == false then
			triggerClientEvent(player,"blendLoadingScreen",player)
			setElementPosition ( player, -2480.509765625 , 155.1455078125 , 64.9375 )
			setElementRotation ( player, 0, 0, 90)
		end
	else
		outputChatBox ("Nur für ItalianMafia Mitglieder!", player, 100, 100, 100 )
	end
end
addEventHandler( "onMarkerHit", ItalianMafiaToHeli, ItalianMafiaToHeli_func )

function ItalianMafiaFromHeli_func ( player )
	if isIMafia ( player ) then
		if isPedInVehicle ( player ) == false then
			triggerClientEvent(player,"blendLoadingScreen",player)
			setElementPosition ( player, -2456.3427734375 , 129.6689453125 , 35.171875 )
			setElementRotation ( player, 0, 0, 90)
		end
	else
		outputChatBox ("Nur für ItalianMafia Mitglieder!", player, 100, 100, 100 )
	end
end
addEventHandler( "onMarkerHit", ItalianMafiaFromHeli, ItalianMafiaFromHeli_func )


--Out 
function ItalianMafiaFromInt_func ( player )
	if isIMafia ( player ) then
		if isPedInVehicle ( player ) == false then
			triggerClientEvent(player,"blendLoadingScreen",player)
			setElementPosition ( player, -2466.8251953125, 137.6875, 35.171875 )
			setElementRotation ( player, 0, 0, 180 )
		end
	else
		outputChatBox("Nur für ItalianMafia Mitglieder!", player, 100, 100, 100 )
	end
end 
addEventHandler("onPickupHit", ItalianMafiaFromInt, ItalianMafiaFromInt_func)