PoliceComputer = createObject ( 2190, 229.83325195313, 124.82567596436, 1010.1395874023, 0, 0, 200 )
setElementInterior ( PoliceComputer, 10 )

SFPDExit = createMarker ( 246.40328979492, 107.60005950928, 1002.1927490234 + 0.5, "corona", 1, 0, 0, 0, 0 )
SFPDExitOptic = createMarker ( 246.40328979492, 107.60005950928, 1002.1927490234, "cylinder", 1, getColorFromString ( "#FF000099" ) )
setElementInterior (SFPDExit, 10)
setElementInterior (SFPDExitOptic, 10)

createMarker ( -1605.423828125, 710.54425048828, 12.792203903198, "cylinder", 1, getColorFromString ( "#FF000099" ) )
SFPDEnter = createMarker ( -1605.423828125, 710.54425048828, 12.792203903198+0.5, "corona", 1, 0, 0, 0, 0 )

SFPDLiftInner = createMarker ( 214.28958129883, 120.01245880127, 1002.1906738281, "cylinder", 1, getColorFromString ( "#FF000099" ) )
SFPDLiftInnerOp = createMarker ( 214.28958129883, 120.01245880127, 1002.1906738281, "corona", 1.5, 0, 0, 0, 0 )
setElementInterior ( SFPDLiftInner, 10 )
setElementInterior ( SFPDLiftInnerOp, 10 )
SFPDLiftOuter = createMarker ( -1606.3905029297, 672.76336669922, -6.2766346931458, "cylinder", 1, getColorFromString ( "#FF000099" ) )
SFPDLiftOuterOp = createMarker ( -1606.3905029297, 672.76336669922, -6.2766346931458, "corona", 1.5, 0, 0, 0, 255 )

LVPDLiftIn = createMarker ( 2277.6525878906, 2458.3308105469, 38.3, "corona", 1, 0, 0, 0, 0 )
LVPDLiftInOptic = createMarker ( 2277.6525878906, 2458.3308105469, 37.624977111816, "cylinder", 1, getColorFromString ( "#FF000099" ) )
LVPDLiftOutOptic = createMarker ( 251.55657958984, 196.95166015625, 1007.099609375, "cylinder", 1, getColorFromString ( "#FF000099" ) )
LVPDLiftOut = createMarker ( 251.55657958984, 196.95166015625, 1007.5, "corona", 1, 0, 0, 0, 0 )
setElementInterior ( LVPDLiftOutOptic, 3 )
setElementInterior ( LVPDLiftOut, 3 )

--[[
pdEnter" type="cylinder" color="#FF000099" size="1" interior="0, , -1605.423828125, 710.54425048828, 12.792203903198
pdOutSpawn" doublesided="false" model="1337" interior="0, , -1605.4925537109, 711.98028564453, 13.516412734985
sfPDExit" type="cylinder" color="#0000ff99" size="1" interior="10, , 246.40328979492, 107.60005950928, 1002.1927490234
SFPDInner0" doublesided="false" model="1337" interior="10, , 246.3826751709, 108.66905212402, 1002.867980957
]]

function LVPDLiftIn_func ( player, dim )
   
	if dim then
		if source == LVPDLiftOut then
			fadeElementInterior ( player, 0, 2277.6550292969, 2459.4965820313, 38.332901000977, 0 )
		else
			fadeElementInterior ( player, 3, 251.57582092285, 195.37438964844, 1007.821105957, 180 )
		end
	end
end
addEventHandler ( "onMarkerHit", LVPDLiftIn, LVPDLiftIn_func )
addEventHandler ( "onMarkerHit", LVPDLiftOut, LVPDLiftIn_func )

function SFPDLift_func ( player, dim )
   
	if dim then
		local frak = vnxGetElementData ( player, "fraktion" )
		if frak == 1 or frak == 6 or frak == 8 then
			if source == SFPDLiftOuterOp then
				fadeElementInterior ( player, 10, 216.59045410156, 119.97569274902, 1002.867980957 )
			else
				fadeElementInterior ( player, 0, -1606.3637695313, 673.97595214844, -5.5929617881775 )
			end
		end
	end
end
addEventHandler ( "onMarkerHit", SFPDLiftInnerOp, SFPDLift_func )
addEventHandler ( "onMarkerHit", SFPDLiftOuterOp, SFPDLift_func )

function SFPDExit_func ( player, dim )
   
	if dim then
		fadeElementInterior ( player, 0, -1605.4925537109, 711.98028564453, 13.516412734985, 0 )
		triggerClientEvent(player,"blendLoadingScreen",player)
	end
end
addEventHandler ( "onMarkerHit", SFPDExit, SFPDExit_func )

function SFPDEnter_func ( player, dim )

	if dim then
		if not getPedOccupiedVehicle ( player ) then
			fadeElementInterior ( player, 10, 246.3826751709, 108.66905212402, 1003, 0 )
			triggerClientEvent ( player, "SFPDEnterClient", getRootElement() )
			triggerClientEvent(player,"blendLoadingScreen",player)
		end
	end
end
addEventHandler ( "onMarkerHit", SFPDEnter, SFPDEnter_func )