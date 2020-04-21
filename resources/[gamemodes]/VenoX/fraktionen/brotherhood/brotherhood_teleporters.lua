local BrotherhoodFromInt = createPickup ( 773.9560546875 , -78.732421875 , 1000.6626586914, 3, 1318, 50, 0 )
local BrotherhoodToInt = createPickup ( -1819.326171875 , -149.5263671875 , 9.3984375, 3, 1318, 50, 0 )
setElementInterior(BrotherhoodFromInt , 7)
--in
function BrotherhoodToInt_func ( player )
	if isBrotherhood ( player ) then
		if isPedInVehicle ( player ) == false then
			triggerClientEvent(player,"blendLoadingScreen",player)
			setElementPosition ( player, 774.1904296875 , -73.9169921875 , 1000.6534423828 )
			setElementInterior(player , 7)
			setElementRotation ( player, 0, 0, 90 )
		end
	else
		outputChatBox ("Nur für Brotherhood Mitglieder!", player, 160, 40, 40 )
	end
end
addEventHandler("onPickupHit", BrotherhoodToInt, BrotherhoodToInt_func)


--Out 
function BrotherhoodFromInt_func ( player )
	if isBrotherhood ( player ) then
		if isPedInVehicle ( player ) == false then
			triggerClientEvent(player,"blendLoadingScreen",player)
			setElementPosition ( player, -1819.7099609375 , -152.9853515625 , 9.3984375 )
			setElementRotation ( player, 0, 0, 180 )
			setElementInterior(player , 0)
		end
	else
		outputChatBox("Nur für Brotherhood Mitglieder!", player, 160, 40, 40 )
	end
end 
addEventHandler("onPickupHit", BrotherhoodFromInt, BrotherhoodFromInt_func)