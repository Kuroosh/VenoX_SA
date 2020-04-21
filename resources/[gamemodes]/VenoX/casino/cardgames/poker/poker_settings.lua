--[[
States:
0 = AFK-Mode
1 = Side-Out
2 = In
]]

pokerSettings = {}
	pokerSettings.maxPlayersPerTable = 7
	pokerSettings.maxBuyIn = 1000
	pokerSettings.minBuyIn = 20

pokerEnterPlaces = {}
	pokerEnterPlaces["x"] = {}
	pokerEnterPlaces["y"] = {}
	pokerEnterPlaces["z"] = {}
	pokerEnterPlaces["sx"] = {}
	pokerEnterPlaces["sy"] = {}
	pokerEnterPlaces["sz"] = {}
	pokerEnterPlaces["sr"] = {}
	pokerEnterPlaces["int"] = {}
	pokerEnterPlaces["sint"] = {}
	pokerEnterPlaces["dim"] = {}
	pokerEnterPlaces["sdim"] = {}
	pokerEnterPlaces["size"] = {}
		i = 1
		pokerEnterPlaces["x"][i], pokerEnterPlaces["y"][i], pokerEnterPlaces["z"][i] = 2330.58, 2166.05, 9.75
		pokerEnterPlaces["int"][i], pokerEnterPlaces["dim"][i], pokerEnterPlaces["size"][i] = 0, 0, 1
		pokerEnterPlaces["sx"][i], pokerEnterPlaces["sy"][i], pokerEnterPlaces["sz"][i] = 2333.12, 2164.60, 10.47
		pokerEnterPlaces["sint"][i], pokerEnterPlaces["sdim"][i], pokerEnterPlaces["sr"][i] = 0, 0, 90

pokerCamAddHight = 5

pokerDekoration = {}
	pokerDekoration["id"] = {}
	pokerDekoration["x"] = {}
	pokerDekoration["y"] = {}
	pokerDekoration["z"] = {}
	pokerDekoration["r"] = {}
	pokerDekoration["int"] = {}
		i = 1
		pokerDekoration["id"][i] = 2189
		pokerDekoration["x"][i], pokerDekoration["y"][i], pokerDekoration["z"][i], pokerDekoration["r"][i] = 1123.185546875, 11.482323646545, 1001.8822631836, 0
		pokerDekoration["int"][i] = 12
		i = i + 1
		pokerDekoration["id"][i] = 1720
		pokerDekoration["x"][i], pokerDekoration["y"][i], pokerDekoration["z"][i], pokerDekoration["r"][i] = 1122.3151855469, 10.482846260071, 1001.0784912109, 135
		pokerDekoration["int"][i] = 12
		i = i + 1
		pokerDekoration["id"][i] = 1720
		pokerDekoration["x"][i], pokerDekoration["y"][i], pokerDekoration["z"][i], pokerDekoration["r"][i] = 1124.16796875, 10.457970619202, 1001.0816040039, 225
		pokerDekoration["int"][i] = 12
		i = i + 1
		pokerDekoration["id"][i] = 1720
		pokerDekoration["x"][i], pokerDekoration["y"][i], pokerDekoration["z"][i], pokerDekoration["r"][i] = 1123.2341308594, 10.173879623413, 1001.0827636719, 180
		pokerDekoration["int"][i] = 12

--[[
1: 1122.0906982422, 11.262459754944, 1002.5390625, 12
2: 1122.7365722656, 12.420342445374, 1002.5390625, 12
3: 1123.7979736328, 12.357813835144, 1002.5390625, 12
4: 1124.2633056641, 11.565485954285, 1002.5390625, 12
5: 1124.3010253906, 10.365673065186, 1002.5390625, 12
6: 1123.2751464844, 10.055057525635, 1002.5390625, 12
7: 1122.2471923828, 10.439483642578, 1002.5390625, 12
]]

pokerPlayerPositions = {}
	pokerPlayerPositions["x"] = {}
	pokerPlayerPositions["y"] = {}
	pokerPlayerPositions["z"] = {}
	pokerPlayerPositions["int"] = {}
		i = 1
		pokerPlayerPositions["x"][i], pokerPlayerPositions["y"][i], pokerPlayerPositions["z"][i], pokerPlayerPositions["int"][i] = 1122.0906982422, 11.262459754944, 1002.5390625, 12
		i = i + 1
		pokerPlayerPositions["x"][i], pokerPlayerPositions["y"][i], pokerPlayerPositions["z"][i], pokerPlayerPositions["int"][i] = 1122.7365722656, 12.420342445374, 1002.5390625, 12
		i = i + 1
		pokerPlayerPositions["x"][i], pokerPlayerPositions["y"][i], pokerPlayerPositions["z"][i], pokerPlayerPositions["int"][i] = 1123.7979736328, 12.357813835144, 1002.5390625, 12
		i = i + 1
		pokerPlayerPositions["x"][i], pokerPlayerPositions["y"][i], pokerPlayerPositions["z"][i], pokerPlayerPositions["int"][i] = 1124.2633056641, 11.565485954285, 1002.5390625, 12
		i = i + 1
		pokerPlayerPositions["x"][i], pokerPlayerPositions["y"][i], pokerPlayerPositions["z"][i], pokerPlayerPositions["int"][i] = 1124.3010253906, 10.365673065186, 1002.5390625, 12
		i = i + 1
		pokerPlayerPositions["x"][i], pokerPlayerPositions["y"][i], pokerPlayerPositions["z"][i], pokerPlayerPositions["int"][i] = 1123.2751464844, 10.055057525635, 1002.5390625, 12
		i = i + 1
		pokerPlayerPositions["x"][i], pokerPlayerPositions["y"][i], pokerPlayerPositions["z"][i], pokerPlayerPositions["int"][i] = 1122.2471923828, 10.439483642578, 1002.5390625, 12

pokerChipZPosition = 1001.8654785156

pokerChipPositions = {}
	pokerChipPositions["x"] = {}
	pokerChipPositions["y"] = {}
		i = 0
		pokerChipPositions["x"][i], pokerChipPositions["y"][i] = 1123.1826171875, 11.502511978149
		i = i + 1
		pokerChipPositions["x"][i], pokerChipPositions["y"][i] = 1122.4694824219, 11.52539730072
		i = i + 1
		pokerChipPositions["x"][i], pokerChipPositions["y"][i] = 1122.8935546875, 12.076237678528
		i = i + 1
		pokerChipPositions["x"][i], pokerChipPositions["y"][i] = 1123.5867919922, 12.04781627655
		i = i + 1
		pokerChipPositions["x"][i], pokerChipPositions["y"][i] = 1123.8699951172, 11.524878501892
		i = i + 1
		pokerChipPositions["x"][i], pokerChipPositions["y"][i] = 1123.6086425781, 11.069892883301
		i = i + 1
		pokerChipPositions["x"][i], pokerChipPositions["y"][i] = 1123.1796875, 10.832103729248
		i = i + 1
		pokerChipPositions["x"][i], pokerChipPositions["y"][i] = 1122.6625976563, 11.041925430298
		i = i + 1