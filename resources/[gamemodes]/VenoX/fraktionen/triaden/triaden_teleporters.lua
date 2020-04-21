local extraheight = 1.2
TriadDownEntrance = createMarker ( -2172.6772460938, 679.87579345703, 54.16397857666+extraheight, "corona", 1, getColorFromString ( "#FF000099" ) )
TriadDownExit = createMarker ( -2170.3583984375, 635.75671386719, 1051.3493652344+extraheight, "corona", 1, getColorFromString ( "#FF000099" ) )
setElementInterior ( TriadDownExit, 1 )
TriadRoofEntrance = createMarker ( -2163.9565429688, 676.29083251953, 82.131492614746+extraheight, "corona", 1, getColorFromString ( "#FF000099" ) )
TriadToRoof = createMarker ( -2171.1403808594, 645.33117675781, 1056.5302734375+extraheight, "corona", 1, getColorFromString ( "#FF000099" ) )
setElementInterior ( TriadToRoof, 1 )

function TriadDownEntrance_func ( player, dim )
   
	if dim == true and getPedOccupiedVehicle ( player ) == false and ( isTriad(player) or isOnDuty(player) or isArmy(player) ) then
		fadeElementInterior ( player, 1, -2170.2390136719, 637.73980712891, 1052.0241699219 )
		if isTriad (player) then
			outputChatBox ( "Wilkommen, Triade!", player, 0, 125, 0 )
			triggerClientEvent(player,"blendLoadingScreen",player)
		end
	else
		outputChatBox ( "Du bist kein Triade/sitzt in einem Fahrzeug!", player, 125, 0, 0 )
	end
end
addEventHandler ( "onMarkerHit", TriadDownEntrance, TriadDownEntrance_func )

function TriadDownExit_func ( player, dim )
   
	if dim == true then
		fadeElementInterior ( player, 0, -2173.5454101563, 682.26794433594, 54.813526153564 )
		triggerClientEvent(player,"blendLoadingScreen",player)
	end
end
addEventHandler ( "onMarkerHit", TriadDownExit, TriadDownExit_func )

function TriadRoofEntrance_func ( player, dim )
   
	if dim == true and getPedOccupiedVehicle ( player ) == false and ( isTriad(player) or isOnDuty(player) or isArmy(player)) then
		setElementInterior ( player, 1, -2169.7309570313, 645.28344726563, 1057.2429199219 )
		if isTriad(player) then
			outputChatBox ( "Wilkommen, Triade!", player, 0, 125, 0 )
			triggerClientEvent(player,"blendLoadingScreen",player)
		end
	else
		outputChatBox ( "Du bist kein Triade/sitzt in einem Fahrzeug!", player, 125, 0, 0 )
	end
end
addEventHandler ( "onMarkerHit", TriadRoofEntrance, TriadRoofEntrance_func )

function TriadToRoof_func ( player, dim )
   
	if dim == true then
		setElementInterior ( player, 0, -2163.9748535156, 674.06390380859, 82.821098327637 )
		triggerClientEvent(player,"blendLoadingScreen",player)
	end
end
addEventHandler ( "onMarkerHit", TriadToRoof, TriadToRoof_func )

local triadCasinoCoordinates = {}
triadCasinoTeleporters = {}
	local i = 0
	
	i = i + 1
	-- Roof -> Inner
	local optic
	local x, y, z, int, tx, ty, tz, tint, trot = 2018.0836181641, 1007.6577758789, 38.091094970703, 0, 1963.1157226563, 1062.2529296875, 994.11798095703, 10, 210
	optic = createMarker ( x, y, z, "cylinder", 1, getColorFromString ( "#FF000099" ) )
	setElementInterior ( optic, int )
	triadCasinoTeleporters[i] = createMarker ( x, y, z + 1, "corona", 1, 0, 0, 0, 0 )
	setElementInterior ( triadCasinoTeleporters[i], int )
	triadCasinoCoordinates[triadCasinoTeleporters[i]] = { ["x"] = tx, ["y"] = ty, ["z"] = tz, ["int"] = tint, ["rot"] = rot }


	-- Inner -> Roof
	i = i + 1
	local x, y, z, int, tx, ty, tz, tint, trot = 1963.8132324219, 1063.4484863281, 993.42401123047, 10, 2016.6575927734, 1007.6748046875, 38.74, 0, 90
	optic = createMarker ( x, y, z, "cylinder", 1, getColorFromString ( "#FF000099" ) )
	setElementInterior ( optic, int )
	triadCasinoTeleporters[i] = createMarker ( x, y, z + 1, "corona", 1, 0, 0, 0, 0 )
	setElementInterior ( triadCasinoTeleporters[i], int )
	triadCasinoCoordinates[triadCasinoTeleporters[i]] = { ["x"] = tx, ["y"] = ty, ["z"] = tz, ["int"] = tint, ["rot"] = rot }
	
	-- Garage -> Inner
	i = i + 1
	local x, y, z, int, tx, ty, tz, tint, trot = 1919.9337158203, 992.11108398438, 9.8066940307617, 0, 1963.1610107422, 973.486328125, 994.11798095703, 10, 330
	optic = createMarker ( x, y, z, "cylinder", 1, getColorFromString ( "#FF000099" ) )
	setElementInterior ( optic, int )
	triadCasinoTeleporters[i] = createMarker ( x, y, z + 1, "corona", 1, 0, 0, 0, 0 )
	setElementInterior ( triadCasinoTeleporters[i], int )
	triadCasinoCoordinates[triadCasinoTeleporters[i]] = { ["x"] = tx, ["y"] = ty, ["z"] = tz, ["int"] = tint, ["rot"] = rot }
	
	-- Inner -> Garage
	i = i + 1
	local x, y, z, int, tx, ty, tz, tint, trot = 1963.8889160156, 972.15161132813, 993.41467285156, 10, 1918.3533935547, 992.06750488281, 10.461921691895, 0, 270 - 180
	optic = createMarker ( x, y, z, "cylinder", 1, getColorFromString ( "#FF000099" ) )
	setElementInterior ( optic, int )
	triadCasinoTeleporters[i] = createMarker ( x, y, z + 1, "corona", 1, 0, 0, 0, 0 )
	setElementInterior ( triadCasinoTeleporters[i], int )
	triadCasinoCoordinates[triadCasinoTeleporters[i]] = { ["x"] = tx, ["y"] = ty, ["z"] = tz, ["int"] = tint, ["rot"] = rot }


for i, index in pairs ( triadCasinoTeleporters ) do

	addEventHandler ( "onMarkerHit", triadCasinoTeleporters[i],
		function ( hit )
			if getElementType ( hit ) == "player" then
				if not getPedOccupiedVehicle ( hit ) then
					if isTriad ( hit ) then
						local x, y, z, int, rot = triadCasinoCoordinates[source]["x"], triadCasinoCoordinates[source]["y"], triadCasinoCoordinates[source]["z"], triadCasinoCoordinates[source]["int"], triadCasinoCoordinates[source]["rot"] 
						fadeElementInterior ( hit, int, x, y, z, rot )
					end
				end
			end
		end
	)
end





------------------------------------------------------------------------



local function TriadenRaus(player)
    if getElementType(player) == "player" and not isPedInVehicle(player) then
		fadeElementInterior ( player, 0, 943.90234375 , 1733.23828125 , 8.8515625, 270 )
		setElementDimension(player, 0)
		triggerClientEvent(player,"blendLoadingScreen",player)
	end	
end

local function TriadenRein(player)
    if getElementType(player) == "player" and not isPedInVehicle(player) then
		fadeElementInterior ( player, 12, 2324.521484375 , -1146.98828125 , 1050.7100830078, 270 )
		triggerClientEvent(player,"blendLoadingScreen",player)
		setElementDimension(player, 14)
	end	
end
local TriadenRaus = createCustomPickup(2324.3662109375 , -1148.9404296875 , 1050.7100830078, 0, 0, "images/nametag/triaden.png", TriadenRaus)
local TriadenRein = createCustomPickup(937.705078125 , 1733.25 , 8.8515625, 0, 0, "images/nametag/triaden.png", TriadenRein)