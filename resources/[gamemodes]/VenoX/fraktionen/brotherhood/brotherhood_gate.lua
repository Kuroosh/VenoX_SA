BrotherhoodGate1 = createObject ( 971, -1826.8, -176.5, 12, 0, 0, 89.75 )

--<object id="object (subwaygate) (1)" breakable="true" interior="0" alpha="255" model="971" doublesided="false" scale="1" dimension="0" posX="-1826.8" posY="-176.5" posZ="12" rotX="0" rotY="0" rotZ="270"></object>
local BrotherhoodGateMoved = false

function mv_func ( player )

	if isBrotherhood(player) or isOnDuty(player) or vnxGetElementData ( player, "adminlvl" ) >= 3 then
		if getDistanceBetweenPoints3D ( -1826.8, -176.5, 12, getElementPosition ( player ) ) < 17 then
			if BrotherhoodGateMoved == false then
				moveObject ( BrotherhoodGate1, 971, -1826.8, -176.5, 12, 0, 0, 0 )
				BrotherhoodGateMoved = true
			else
				moveObject ( BrotherhoodGate1, 971, -1826.8, -176.5, 3, 0, 0, 0 )
				BrotherhoodGateMoved = false
			end
		end
	end
end
addCommandHandler ( "mv", mv_func )


