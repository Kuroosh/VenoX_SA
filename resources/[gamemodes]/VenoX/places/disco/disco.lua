--[[    <marker id="DiscoExit" type="cylinder" color="#FF000099" size="1.5" interior="17" dimension="0" posX="493.41168212891" posY="-24.308652877808" posZ="999.57861328125" rotX="0" rotY="0" rotZ="0" />
    <object id="InnerPos|90" doublesided="false" model="1337" interior="17" dimension="0" posX="493.40060424805" posY="-22.230197906494" posZ="1000.328918457" rotX="0" rotY="0" rotZ="0" />
    <object id="object (CEhllyhil03a) (1)" doublesided="false" model="13370" interior="0" dimension="0" posX="-2558.0258789063" posY="196.2742767334" posZ="46.675621032715" rotX="0" rotY="0" rotZ="0" />
    <object id="DiscoOutSpawn|105" doublesided="false" model="1337" interior="0" dimension="0" posX="-2552.9599609375" posY="193.01498413086" posZ="5.7878270149231" rotX="0" rotY="0" rotZ="0" />
    <marker id="marker (cylinder) (1)" type="cylinder" color="#FF000099" size="1.5" interior="0" dimension="0" posX="-2551.1716308594" posY="193.70712280273" posZ="5.0384402275085" rotX="0" rotY="0" rotZ="0" />
]]

local discoBlip = 48
createBlip ( -2552.9599609375, 193.01498413086, 5.7878270149231, discoBlip, 2, 255, 0, 0, 255, 0, 200, getRootElement() )

discoEnterMarker = createMarker ( -2551.1716308594, 193.70712280273, 5.0384402275085, "cylinder", 1.5, 255, 0, 0, 150 )
discoExitMarker = createMarker ( 493.41168212891, -24.308652877808, 999.57861328125, "cylinder", 1.5, 255, 0, 0, 150 )
setElementInterior ( discoExitMarker, 17 )

function enterDisco ( hit, dim )

	if hit and dim then
		if getElementType ( hit ) == "player" then
			if not getPedOccupiedVehicle ( hit ) then
				local x, y, z, r = 493.40060424805, -22.230197906494, 1000.328918457, 0
				fadeElementInterior ( hit, 17, x, y, z, r )
			end
		end
	end
end
addEventHandler ( "onMarkerHit", discoEnterMarker, enterDisco )

function exitDisco ( hit, dim )

	if hit and dim then
		if getElementType ( hit ) == "player" then
			if not getPedOccupiedVehicle ( hit ) then
				local x, y, z, r = -2552.9599609375, 193.01498413086, 5.7878270149231, 105
				fadeElementInterior ( hit, 0, x, y, z, r )
			end
		end
	end
end
addEventHandler ( "onMarkerHit", discoExitMarker, exitDisco )