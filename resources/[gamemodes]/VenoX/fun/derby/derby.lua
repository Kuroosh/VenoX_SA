eingang = createMarker (-1993.1748046875, -444.12890625, 38.734375, "corona", 1, 0, 120, 200 )
ausgang = createMarker ( -1443.89453125, 930.1767578125, 1036.4827880859, "corona", 1, 0, 120, 200 )
setElementInterior (ausgang, 15 )

local state = false

addCommandHandler("derby", function(player)
   if isReporter(player) or vnxGetElementData ( player, "adminlvl" ) >= 3 then
    if (state == false) then
	    state = true
		outputChatBox("Die Derbyarena wurde aufgeschlossen", player, 0, 255, 0)
	else
	    state = false
		outputChatBox("Die Derbyarena wurde abgeschlossen", player, 255, 0, 0)
	end
   else
        outputChatBox("Du bist nicht befugt", player, 255, 0, 0)
   end
end)

function reinderby ( player )
	if (state == true) then
	    if not getPedOccupiedVehicle (player) then
		    setElementInterior (player, 15 )
		    setElementPosition (player, -1443.138671875, 934.134765625, 1036.5002441406)
			toggleControl ( player, "fire", false )
			vnxSetElementData ( player, "nodmzone", 1 )
	    end
	else
	    outputChatBox("Die Arena ist nicht geöffnet", player, 255, 0, 0)
	end
end
addEventHandler("onMarkerHit", eingang, reinderby)

function rausderby ( player )
	if not getPedOccupiedVehicle (player) then
		setElementInterior (player, 0)
		setElementDimension (player, 0)
		setElementPosition(player, -1981.830078125, -444.5390625, 35.534351348877)
		toggleControl ( player, "fire", true )
		vnxSetElementData ( player, "nodmzone", 0 )
	end
end
addEventHandler("onMarkerHit", ausgang, rausderby)
		
local veh
function createDerbyCar( x, y, z, r )
	if not r then
	r = 0
	end
	veh = createVehicle( 504, x, y, z, 0, 0, r )
	setVehicleColor( veh, 150, 130, 80 )
	setVehiclePaintjob( veh, 3 )
	toggleVehicleRespawn( veh, true )
	setVehicleRespawnDelay( veh, 1000 )
	setVehicleIdleRespawnDelay( veh, 60000*25 )
	setElementInterior (veh, 15)
	derbyfahrzeuge = true
	vnxSetElementData ( veh, "derbycar", true )
end

	   

createDerbyCar(-1497.8000500,961.7999900,1037.0000000,325.0000000)
createDerbyCar(-1487.1992200,954.1992200,1036.9000200,324.9980000)
createDerbyCar(-1489.7998000,956.0996100,1036.9000200,324.9980000)
createDerbyCar(-1492.5000000,958.0000000,1036.9000200,324.9980000)
createDerbyCar(-1495.0999800,959.9000200,1037.0000000,325.0000000)
createDerbyCar(-1507.6999500,974.7000100,1037.1999500,300.0000000)
createDerbyCar(-1505.9000200,971.5999800,1037.1999500,299.9980000)
createDerbyCar(-1511.0999800,980.5999800,1037.3000500,299.9980000)
createDerbyCar(-1509.2998000,977.6992200,1037.3000500,299.9980000)
createDerbyCar(-1512.8000500,983.5999800,1037.4000200,299.9980000)
createDerbyCar(-1514.4000200,996.2999900,1037.5999800,270.0000000)
createDerbyCar(-1514.3000500,999.4000200,1037.6999500,270.0000000)
createDerbyCar(-1514.3000500,1002.4000200,1037.6999500,270.0000000)
createDerbyCar(-1514.3000500,1005.4000200,1037.6999500,270.0000000)
createDerbyCar(-1514.0999800,1008.4000200,1037.8000500,270.0000000)
createDerbyCar(-1505.9000200,1020.9000200,1038.0000000,235.0000000)
createDerbyCar(-1503.9000200,1023.5999800,1038.0000000,234.9980000)
createDerbyCar(-1501.9000200,1026.1999500,1038.0999800,234.9980000)
createDerbyCar(-1500.0999800,1028.8000500,1038.0999800,234.9980000)
createDerbyCar(-1498.0999800,1031.1999500,1038.1999500,234.9980000)
createDerbyCar(-1486.9000200,1039.0000000,1038.3000500,210.0000000)
createDerbyCar(-1484.1999500,1040.5000000,1038.3000500,209.9980000)
createDerbyCar(-1481.5000000,1042.0000000,1038.3000500,209.9980000)
createDerbyCar(-1478.8000500,1043.5999800,1038.3000500,209.9980000)
createDerbyCar(-1476.0000000,1045.0000000,1038.4000200,209.9980000)
createDerbyCar(-1461.9000200,1050.1999500,1038.4000200,195.0000000)
createDerbyCar(-1458.8000500,1051.0000000,1038.4000200,194.9960000)
createDerbyCar(-1455.6999500,1051.9000200,1038.4000200,194.9960000)
createDerbyCar(-1452.6999500,1052.6999500,1038.4000200,194.9960000)
createDerbyCar(-1449.5000000,1053.5000000,1038.4000200,194.9960000)


