i = 1
casinoTeleporters = {}
	casinoTeleporters["x"] = {}
	casinoTeleporters["y"] = {}
	casinoTeleporters["z"] = {}
	casinoTeleporters["int"] = {}
	
	casinoTeleporters["tx"] = {}
	casinoTeleporters["ty"] = {}
	casinoTeleporters["tz"] = {}
	casinoTeleporters["tint"] = {}
	casinoTeleporters["r"] = {}
	
	casinoTeleporters["size"] = {}

		-- Caligulas ( Out -> In )
		casinoTeleporters["x"][i], casinoTeleporters["y"][i], casinoTeleporters["z"][i], casinoTeleporters["int"][i] = 2195.9187011719, 1677.1341552734, 11.345178604126, 0
		casinoTeleporters["tx"][i], casinoTeleporters["ty"][i], casinoTeleporters["tz"][i], casinoTeleporters["tint"][i], casinoTeleporters["r"][i] = 2233.89453125, 1711.6635742188, 1011.2369384766, 1, 180
		casinoTeleporters["size"][i] = 2
		i = i + 1
		
		-- Caligulas ( In -> Out )
		casinoTeleporters["x"][i], casinoTeleporters["y"][i], casinoTeleporters["z"][i], casinoTeleporters["int"][i] = 2233.9501953125, 1713.791015625, 1010.7177734375, 1
		casinoTeleporters["tx"][i], casinoTeleporters["ty"][i], casinoTeleporters["tz"][i], casinoTeleporters["tint"][i], casinoTeleporters["r"][i] = 2193.3491210938, 1677.1180419922, 12.016412734985, 0, 90
		casinoTeleporters["size"][i] = 2
		i = i + 1
		
		-- Four Dragons ( Out -> In )
		casinoTeleporters["x"][i], casinoTeleporters["y"][i], casinoTeleporters["z"][i], casinoTeleporters["int"][i] = 2020.2043457031, 1007.7569580078, 9.8054075241089, 0
		casinoTeleporters["tx"][i], casinoTeleporters["ty"][i], casinoTeleporters["tz"][i], casinoTeleporters["tint"][i], casinoTeleporters["r"][i] = 2015.7701416016, 1017.8104858398, 996.52423095703, 10, 90
		casinoTeleporters["size"][i] = 2
		i = i + 1
		
		-- Four Dragons ( In -> Out )
		casinoTeleporters["x"][i], casinoTeleporters["y"][i], casinoTeleporters["z"][i], casinoTeleporters["int"][i] = 2018.6097412109, 1017.8402099609, 995.84375, 10
		casinoTeleporters["tx"][i], casinoTeleporters["ty"][i], casinoTeleporters["tz"][i], casinoTeleporters["tint"][i], casinoTeleporters["r"][i] = 2023.0834960938, 1007.7553710938, 10.469537734985, 0, -90
		casinoTeleporters["size"][i] = 2
		i = i + 1
		
		-- The Casino ( Out -> In )
		casinoTeleporters["x"][i], casinoTeleporters["y"][i], casinoTeleporters["z"][i], casinoTeleporters["int"][i] = 1658.5, 2251.1999511719, 10.10000038147, 0
		casinoTeleporters["tx"][i], casinoTeleporters["ty"][i], casinoTeleporters["tz"][i], casinoTeleporters["tint"][i], casinoTeleporters["r"][i] = 1133.1499755859, -12.300000190735, 1000.70001220703, 12, 0
		casinoTeleporters["size"][i] = 2
		i = i + 1
		
		-- The Casino ( In -> Out )
		casinoTeleporters["x"][i], casinoTeleporters["y"][i], casinoTeleporters["z"][i], casinoTeleporters["int"][i] = 1133.1499755859, -15.300000190735, 999.70001220703, 12
		casinoTeleporters["tx"][i], casinoTeleporters["ty"][i], casinoTeleporters["tz"][i], casinoTeleporters["tint"][i], casinoTeleporters["r"][i] = 1658.5, 2254.1999511719, 10.10000038147, 0, 0
		casinoTeleporters["size"][i] = 2
		i = i + 1
		
		-- The Casino Door ( Out -> In )
		casinoTeleporters["x"][i], casinoTeleporters["y"][i], casinoTeleporters["z"][i], casinoTeleporters["int"][i] = 1636.1999511719, 2226.3999023438, 9.8000001907349, 0
		casinoTeleporters["tx"][i], casinoTeleporters["ty"][i], casinoTeleporters["tz"][i], casinoTeleporters["tint"][i], casinoTeleporters["r"][i] = 1139.8000488281, 6.3000001907349, 1000.70001220703, 12, -90 
		casinoTeleporters["size"][i] = 2
		i = i + 1
		
		-- The Casino Door ( In -> Out )
		casinoTeleporters["x"][i], casinoTeleporters["y"][i], casinoTeleporters["z"][i], casinoTeleporters["int"][i] = 1142.8000488281, 6.3000001907349, 999.70001220703, 12
		casinoTeleporters["tx"][i], casinoTeleporters["ty"][i], casinoTeleporters["tz"][i], casinoTeleporters["tint"][i], casinoTeleporters["r"][i] = 1633.1999511719, 2226.3999023438, 10.8000001907349, 0, -90
		casinoTeleporters["size"][i] = 2
		i = i + 1

local casinoMarker = {}
local casinoMarkerID = {}

for key, index in pairs ( casinoTeleporters["x"] ) do
	local i = key
	casinoMarker[i] = createMarker ( casinoTeleporters["x"][i], casinoTeleporters["y"][i], casinoTeleporters["z"][i], "cylinder", casinoTeleporters["size"][i], getColorFromString ( "#FF000099" ) )
	casinoMarkerID[casinoMarker[i]] = i
	setElementInterior ( casinoMarker[i], casinoTeleporters["int"][i] )
	addEventHandler ( "onMarkerHit", casinoMarker[i], function ( hit, dim )
		if dim and getElementType ( hit ) == "player" then
			if not getPedOccupiedVehicle ( hit ) then
				local i = casinoMarkerID[source]
				local x, y, z, int, rot = casinoTeleporters["tx"][i], casinoTeleporters["ty"][i], casinoTeleporters["tz"][i], casinoTeleporters["tint"][i], casinoTeleporters["r"][i]
				if caligulasrobbed or fourdragonsrobbed or thecasinorobbed then
					triggerClientEvent(hit, "getCasinorobSpawnprotection", hit)
				end
				if i==1 or i==3 or i==5 or i==7 then
					triggerClientEvent ( hit, "bindTargetCasino", hit, "true" )
				elseif i==2 or i==4 or i==6 or i==8 then
					triggerClientEvent ( hit, "bindTargetCasino", hit, "false" )
				end
				if caligulasrobbed and i == 1 then
					triggerClientEvent(hit, "playSoundOfRob", hit, "caligulas")
				elseif fourdragonsrobbed  and i == 3 then
					triggerClientEvent(hit, "playSoundOfRob", hit, "fourdragons")
				elseif thecasinorobbed and i == 5 then
					triggerClientEvent(hit, "playSoundOfRob", hit, "thecasino")
				elseif thecasinorobbed and i == 7 then
					triggerClientEvent(hit, "playSoundOfRob", hit, "thecasino")
				elseif caligulasrobbed and i == 2 then
					triggerClientEvent(hit, "stopSoundOfRob", hit)
				elseif fourdragonsrobbed and i == 4 then
					triggerClientEvent(hit, "stopSoundOfRob", hit)
				elseif thecasinorobbed and i == 6 then
					triggerClientEvent(hit, "stopSoundOfRob", hit)
				elseif thecasinorobbed and i == 8 then
					triggerClientEvent(hit, "stopSoundOfRob", hit)
				end
				fadeElementInterior ( hit, int, x, y, z, rot )
			end
		end
	end )
end