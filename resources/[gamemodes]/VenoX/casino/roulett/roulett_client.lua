--Caligulas Casino
createInvulnerablePed ( 189, 2197.58203125, 1603.6123046875, 1004.711730957, -90, 1 )
createInvulnerablePed ( 189, 2190.7133789063, 1604.6125488281, 1004.711730957, 90, 1 )

createInvulnerablePed ( 189, 2155.1176757813, 1599.4368896484, 1005.8151245117, -90, 1 )

--Four Dragons Casino
createInvulnerablePed ( 169, 1953.7731933594, 1017.8639526367, 992.11798095703, -90, 10 )
createInvulnerablePed ( 169, 1947.8448486328, 1017.8309326172, 992.12371826172, 90, 10 )
local roulettMarkerPos = {}

local roulettMarker = createMarker ( 2156.9755859375, 1599.4689941406, 1005.1513671875, "cylinder", 1, 125, 0, 0, 150 )
addEventHandler ( "onClientMarkerHit", roulettMarker,
	function ( hit )
		if hit == lp then
			local x, y, z = getElementPosition ( hit )
			if math.abs ( z - 1005.1513671875 ) < 3 then
				showChipBuy_func ()
			end
		end
	end
)
setElementInterior ( roulettMarker, 1 )

local table1 = createObject ( 1978, 1951.9113769531, 1040.8560791016, 992.90997314453, 0, 0, 270 )
setElementInterior ( table1, 10 )
setElementDimension ( table1, 0 )
local table2 = createObject ( 1978, 1951.9113769531, 1040.8560791016, 992.90997314453, 0, 0, 270 )
setElementInterior ( table2, 10 )
setElementDimension ( table2, 1 )

i = 1
roulettTables = {}
 roulettTables["x"] = {}
 roulettTables["y"] = {}
 roulettTables["z"] = {}
 roulettTables["int"] = {}
  roulettTables["x"][i], roulettTables["y"][i], roulettTables["z"][i], roulettTables["int"][i] = 2242.7966308594, 1588.8745117188, 1006.0559692383, 1
  i = i + 1
  roulettTables["x"][i], roulettTables["y"][i], roulettTables["z"][i], roulettTables["int"][i] = 2241.8732910156, 1614.2368164063, 1006.0559692383, 1
  i = i + 1
  roulettTables["x"][i], roulettTables["y"][i], roulettTables["z"][i], roulettTables["int"][i] = 2230.9973144531, 1614.2836914063, 1006.0559692383, 1
  i = i + 1
  roulettTables["x"][i], roulettTables["y"][i], roulettTables["z"][i], roulettTables["int"][i] = 2231.0014648438, 1588.8724365234, 1006.0559692383, 1
  i = i + 1
  roulettTables["x"][i], roulettTables["y"][i], roulettTables["z"][i], roulettTables["int"][i] = 1952.3425292969, 1040.5407714844, 992.740234375, 10
  i = i + 1

for i, index in pairs ( roulettTables["x"] ) do

	local x, y, z, int = roulettTables["x"][i], roulettTables["y"][i], roulettTables["z"][i], roulettTables["int"][i]
	
	local dx, dy, dz = x - 0.496826172, y + 1.93823242, z - 0.226013184	
	local mx, my, mz = x - 0.409179688, y - 1.03735352, z - 0.895385742
	local rot = findRotation ( dx, dy, mx, my )
	local rnd = getRandomCroupierSkin ()
	createInvulnerablePed ( rnd, dx, dy, dz, rot, int, 0 )
	createInvulnerablePed ( rnd, dx, dy, dz, rot, int, 1 )
	local roulettMarker = createMarker ( mx, my, mz, "cylinder", 1, 125, 0, 0, 150 )
	addEventHandler ( "onClientMarkerHit", roulettMarker,
		function ( hit )
			if hit == lp then
				if not roulettStarted then
					setWalkable ( false )
					
					roulettStarted = true
					
					setElementDimension ( lp, 1 )
					triggerServerEvent ( "roulettStart", lp )
					
					local x, y, z = roulettMarkerPos[source]["tx"], roulettMarkerPos[source]["ty"], roulettMarkerPos[source]["tz"]
					local int = getElementInterior ( source )
					
					local x2, y2, z2 = getElementPosition ( source )
					_, _, z2 = getElementPosition ( lp )
					setTimer ( setElementPosition, 300, 1, lp, x2, y2, z2 )
					setTimer ( setPedRotation, 300, 1, lp, findRotation ( x2, y2, x, y ) )
					
					startRoulett_func ( x, y, z, int )
				end
			end
		end
	)
	setElementInterior ( roulettMarker, int )
	
	roulettMarkerPos[roulettMarker] = { ["tx"] = x, ["ty"] = y, ["tz"] = z }
end

-- Settings --
roulettMovementSpeed = 0.1 -- In seconds per field

-- END Settings - Don't change below! --
roulettMovementSpeed = roulettMovementSpeed * 100
roulettBlockXSize = ( 1.68652344 ) / 11 --/ 12
roulettBlockYSize = ( 0.490234375 ) / 2 --/ 3
roulettFieldXSize = roulettBlockXSize / 2
roulettFieldYSize = roulettBlockYSize / 2

roulettFields = {}

for i = 1, 13 do
	roulettFields[i] = {}
	for k = 1, 6 do
		roulettFields[i][k] = true
	end
end

roulettFields["zero"] = true
roulettFields["1st"] = true
roulettFields["2nd"] = true
roulettFields["3rd"] = true
roulettFields["top"] = true
roulettFields["middle"] = true
roulettFields["bottom"] = true
roulettFields["1-18"] = true
roulettFields["19-36"] = true
roulettFields["even"] = true
roulettFields["odd"] = true
roulettFields["black"] = true
roulettFields["red"] = true
roulettFields["zero"] = true

function startRoulett_func ( tableX, tableY, tableZ, int )

	local dim = getElementDimension ( lp )
	setPlayerHudComponentVisible ( "radar", false )
	
	roulettStarted = true
	
	infobox ( "\nBewege das Feld mit\nden Pfeiltaste, druecke\nEnter zum starten\nund die Leer-\nTaste zum verlassen.", 5000, 125, 0, 0 )
	
	setInvulnerable ( true )
	
	roulettXMain = tableX
	roulettYMain = tableY
	roulettZMain = tableZ
	
	showRoulettWindow ()
	roulettMarker = createObject ( 2992, tableX, tableY, tableZ )
	
	roulettMoving = false
	
	curRoulettField = "number"
	curRoulettFieldX = 1
	curRoulettFieldY = 2
	reMoveRoulettMarker ()
	
	setElementInterior ( roulettMarker, int )
	setElementDimension ( roulettMarker, dim )
	setElementInterior ( lp, int )
	roulettCam ()
	
	curRoulettBets = {}
	for i = 1, 23 do
		curRoulettBets[i] = {}
		for k = 1, 6 do
			curRoulettBets[i][k] = false
		end
	end
	
	bindRoulettKeys ()
	
	setElementClicked ( true )
end
addEvent ( "startRoulett", true )
addEventHandler ( "startRoulett", getRootElement(), startRoulett_func )

function endRoulett_func ()

	setElementDimension ( lp, 0 )
	triggerServerEvent ( "roulettEnd", lp )
	destroyElement ( roulettMarker )
	hideAllChips ()
	setWalkable ( true )
	roulettStarted = false
	setInvulnerable ( false )
	unbindRoulettKeys ()
	removeEventHandler ( "onClientRender", getRootElement(), roulettCam_render )
	setElementClicked ( false )
	setCameraTarget ( lp )
	showCursor ( false )
	destroyElement ( gWindow["roulett"] )
	setPlayerHudComponentVisible ( "radar", true )
end
addEvent ( "endRoulett", true )
addEventHandler ( "endRoulett", getRootElement(), endRoulett_func )

function bindRoulettKeys ()

	bindKey ( "arrow_u", "down", roulettMarkerMoveUp )
	bindKey ( "arrow_d", "down", roulettMarkerMoveDown )
	bindKey ( "arrow_r", "down", roulettMarkerMoveRight )
	bindKey ( "arrow_l", "down", roulettMarkerMoveLeft )
	bindKey ( "enter", "down", roulettEnter )
	bindKey ( "space", "down", endRoulett_func )
end
function unbindRoulettKeys ()

	unbindKey ( "arrow_u", "down", roulettMarkerMoveUp )
	unbindKey ( "arrow_d", "down", roulettMarkerMoveDown )
	unbindKey ( "arrow_r", "down", roulettMarkerMoveRight )
	unbindKey ( "arrow_l", "down", roulettMarkerMoveLeft )
	unbindKey ( "enter", "down", roulettEnter )
	unbindKey ( "space", "down", endRoulett_func )
end

function roulettEnter ()

	local roulettBets = ""
	local roulettTotalBets = 0
	for key1, index1 in pairs ( curRoulettBets ) do
		if tonumber ( key1 ) then
			for key2, index2 in pairs ( curRoulettBets[key1] ) do
				if curRoulettBets[key1][key2] then
					if getElementData ( curRoulettBets[key1][key2], "chips" ) then
						roulettBets = roulettBets..key1.."|"..key2..","..getElementData ( curRoulettBets[key1][key2], "chips" )..";"
						roulettTotalBets = roulettTotalBets + 1
					end
				end
			end
		else
			if curRoulettBets[key1] then
				roulettBets = roulettBets..key1..","..getElementData ( curRoulettBets[key1], "chips" )..";"
				roulettTotalBets = roulettTotalBets + 1
			end
		end
	end
	if #roulettBets < 1 then
		infobox ( "\n\nDu hast auf\nkeines der Felder\ngesetzt!", 5000, 125, 0, 0 )
	else
		unbindRoulettKeys ()
		destroyElement ( roulettMarker )
		triggerServerEvent ( "startRoulett", lp, roulettBets, roulettTotalBets )
		destroyElement ( gWindow["roulett"] )
		showCursor ( false )
	end
end

function placeRoulettChips ( money )

	local x, y, z = getElementPosition ( roulettMarker )
	if curRoulettField == "number" then
		destroyChipStack ( curRoulettBets[curRoulettFieldX][curRoulettFieldY] )
		if money > 0 then
			curRoulettBets[curRoulettFieldX][curRoulettFieldY] = drawChipsStacks ( x, y, z, money )
		end
	else
		destroyChipStack ( curRoulettBets[curRoulettField] )
		if money > 0 then
			curRoulettBets[curRoulettField] = drawChipsStacks ( x, y, z, money )
		end
	end
end

function getBetOnField ()

	if curRoulettField == "number" then
		if curRoulettBets[curRoulettFieldX][curRoulettFieldY] then
			if getElementData ( curRoulettBets[curRoulettFieldX][curRoulettFieldY], "chips" ) then
				return getElementData ( curRoulettBets[curRoulettFieldX][curRoulettFieldY], "chips" )
			end
		end
	else
		if curRoulettBets[curRoulettField] then
			if getElementData ( curRoulettBets[curRoulettField], "chips" ) then
				return getElementData ( curRoulettBets[curRoulettField], "chips" )
			end
		end
	end
	return 0
end

function roulettMarkerMoveUp ()

	if not roulettMoving then
		if curRoulettField == "number" then
			local x, y = curRoulettFieldX, curRoulettFieldY
			if x == 23 then
				if y <= 2 then
					curRoulettField = "top"
				elseif y == 3 then
					if math.random ( 0, 1 ) == 1 then curRoulettField = "top" else curRoulettField = "middle" end
				elseif y == 4 then
					curRoulettField = "middle"
				elseif y == 5 then
					if math.random ( 0, 1 ) == 1 then curRoulettField = "bottom" else curRoulettField = "middle" end
				elseif y == 6 then
					curRoulettField = "bottom"
				end
			else
				curRoulettFieldX = x + 1
			end
		elseif curRoulettField == "zero" then
			curRoulettFieldX, curRoulettFieldY = 1, 4
			curRoulettField = "number"
			
		elseif curRoulettField == "1st" then
			curRoulettField = "2nd"
		elseif curRoulettField == "2nd" then
			curRoulettField = "3rd"

		elseif curRoulettField == "1-18" then
			curRoulettField = "even"
		elseif curRoulettField == "even" then
			curRoulettField = "red"
		elseif curRoulettField == "red" then
			curRoulettField = "black"
		elseif curRoulettField == "black" then
			curRoulettField = "odd"
		elseif curRoulettField == "odd" then
			curRoulettField = "19-36"
		end
		reMoveRoulettMarker ()
		roulettMarkerOver ()
	end
end
function roulettMarkerMoveDown ()

	if not roulettMoving then
		if curRoulettField == "number" then
			local x, y = curRoulettFieldX, curRoulettFieldY
			if x == 1 then
				curRoulettField = "zero"
			else
				curRoulettFieldX = x - 1
			end
		elseif curRoulettField == "top" then
			curRoulettFieldX, curRoulettFieldY = 23, 2
			curRoulettField = "number"
		elseif curRoulettField == "middle" then
			curRoulettFieldX, curRoulettFieldY = 23, 4
			curRoulettField = "number"
		elseif curRoulettField == "bottom" then
			curRoulettFieldX, curRoulettFieldY = 23, 6
			curRoulettField = "number"
			
		elseif curRoulettField == "3rd" then
			curRoulettField = "2nd"
		elseif curRoulettField == "2nd" then
			curRoulettField = "1st"
		elseif curRoulettField == "19-36" then
			curRoulettField = "odd"
		elseif curRoulettField == "odd" then
			curRoulettField = "black"
		elseif curRoulettField == "black" then
			curRoulettField = "red"
		elseif curRoulettField == "red" then
			curRoulettField = "even"
		elseif curRoulettField == "even" then
			curRoulettField = "1-18"
		end
		reMoveRoulettMarker ()
		roulettMarkerOver ()
	end
end



function roulettMarkerMoveRight ()

	if not roulettMoving then
		if curRoulettField == "number" then
			local x, y = curRoulettFieldX, curRoulettFieldY
			if y == 6 then
				if x <= 7 then
					curRoulettField = "1st"
				elseif x <= 15 then
					curRoulettField = "2nd"
				else
					curRoulettField = "3rd"
				end
			else
				local x, y = curRoulettFieldX, curRoulettFieldY
				curRoulettFieldY = y + 1
			end
		elseif curRoulettField == "3rd" then
			if math.random ( 1, 2 ) == 1 then curRoulettField = "odd" else curRoulettField = "19-36" end
		elseif curRoulettField == "2nd" then
			if math.random ( 1, 2 ) == 1 then curRoulettField = "black" else curRoulettField = "red" end
		elseif curRoulettField == "1st" then
			if math.random ( 1, 2 ) == 1 then curRoulettField = "1-18" else curRoulettField = "even" end
		elseif curRoulettField == "top" then
			curRoulettField = "middle"
		elseif curRoulettField == "middle" then
			curRoulettField = "bottom"
		end
		reMoveRoulettMarker ()
		roulettMarkerOver ()
	end
end
function roulettMarkerMoveLeft ()

	if not roulettMoving then
		if curRoulettField == "number" then
			local x, y = curRoulettFieldX, curRoulettFieldY
			if y > 1 then
				local x, y = curRoulettFieldX, curRoulettFieldY
				curRoulettFieldY = y - 1
			end
			
		elseif curRoulettField == "3rd" then
			curRoulettField = "number"
			curRoulettFieldX, curRoulettFieldY = 20, 6
		elseif curRoulettField == "2nd" then
			curRoulettField = "number"
			curRoulettFieldX, curRoulettFieldY = 12, 6
		elseif curRoulettField == "1st" then
			curRoulettField = "number"
			curRoulettFieldX, curRoulettFieldY = 4, 6
			
		elseif curRoulettField == "19-36" or curRoulettField == "odd" then
			curRoulettField = "3rd"
		elseif curRoulettField == "black" or curRoulettField == "red" then
			curRoulettField = "2nd"
		elseif curRoulettField == "even" or curRoulettField == "1-18" then
			curRoulettField = "1st"

		elseif curRoulettField == "middle" then
			curRoulettField = "top"
		elseif curRoulettField == "bottom" then
			curRoulettField = "middle"
		end
		reMoveRoulettMarker ()
		roulettMarkerOver ()
	end
end

-- Model, Int, x, y, z ( Top Corner ( 3 ) )

function reMoveRoulettMarker ()

	local xNil, yNil, z = getElementPosition ( roulettMarker )
	local x, y
	
	if curRoulettField == "number" then
		x = roulettXMain - roulettFieldXSize * ( curRoulettFieldX - 1 )
		y = roulettYMain + roulettFieldYSize * ( curRoulettFieldY - 2 )
	elseif curRoulettField == "zero" then
		x = roulettXMain + roulettBlockXSize
		y = roulettYMain + roulettBlockYSize
	elseif curRoulettField == "top" then
		x = roulettXMain - roulettBlockXSize * 12
		y = roulettYMain
	elseif curRoulettField == "middle" then
		x = roulettXMain - roulettBlockXSize * 12
		y = roulettYMain + roulettBlockYSize
	elseif curRoulettField == "bottom" then
		x = roulettXMain - roulettBlockXSize * 12
		y = roulettYMain + roulettBlockYSize * 2
	elseif curRoulettField == "3rd" then
		x = roulettXMain - roulettBlockXSize * 9.5
		y = roulettYMain + roulettBlockYSize * 3
	elseif curRoulettField == "2nd" then
		x = roulettXMain - roulettBlockXSize * 5.5
		y = roulettYMain + roulettBlockYSize * 3
	elseif curRoulettField == "1st" then
		x = roulettXMain - roulettBlockXSize * 1.5
		y = roulettYMain + roulettBlockYSize * 3
	elseif curRoulettField == "1-18" then
		x = roulettXMain - roulettBlockXSize * 0.5
		y = roulettYMain + roulettBlockYSize * 4
	elseif curRoulettField == "even" then
		x = roulettXMain - roulettBlockXSize * 2.5
		y = roulettYMain + roulettBlockYSize * 4
	elseif curRoulettField == "red" then
		x = roulettXMain - roulettBlockXSize * 4.5
		y = roulettYMain + roulettBlockYSize * 4
	elseif curRoulettField == "black" then
		x = roulettXMain - roulettBlockXSize * 6.5
		y = roulettYMain + roulettBlockYSize * 4
	elseif curRoulettField == "odd" then
		x = roulettXMain - roulettBlockXSize * 8.5
		y = roulettYMain + roulettBlockYSize * 4
	elseif curRoulettField == "19-36" then
		x = roulettXMain - roulettBlockXSize * 10.5
		y = roulettYMain + roulettBlockYSize * 4
	end
	roulettMoving = true
	moveObject ( roulettMarker, 250, x, y, z )
	setTimer ( 
		function ()
			roulettMoving = false
		end,
	250, 1 )
end

function roulettCam ()

	addEventHandler ( "onClientRender", getRootElement(), roulettCam_render )
end

function roulettCam_render()
	if isElement ( roulettMarker ) then
		local x, y, z = getElementPosition ( roulettMarker )
		setCameraMatrix ( x + 0.01, y, z + 1.5, x, y, z )
	else
		removeEventHandler ( "onClientRender", getRootElement(), roulettCam_render )
	end
end