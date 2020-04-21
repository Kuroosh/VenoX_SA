tetrisSettings = {}
-- This is the size of the Cubes - change it however you want, the rest will fit - always!
 tetrisSettings.boxsize = 12
 
 tetrisSettings.SizeX = tetrisSettings.boxsize * 10
 tetrisSettings.SizeY = tetrisSettings.boxsize * 18

empty = false

leftSizeX, leftSizeY = 32, 288
rightSizeX, rightSizeY = 128, 288

stretch = tetrisSettings.SizeY / 288

cleftSizeX, cleftSizeY = 32 * stretch, 288 * stretch
crightSizeX, crightSizeY = 128 * stretch, 288 * stretch

totalXSize = tetrisSettings.SizeX + ( leftSizeX + rightSizeX ) * stretch
totalYSize = tetrisSettings.SizeY

nextBlockShowX, nextBlockShowY = 74, 273

gImage = {}
gLabel = {}
gButton = {}
gWindow = {}

screenwidth, screenheight = guiGetScreenSize ()

function startTetris ( cmd, diff )
	
	if vnxClientGetElementData ( "gameboy" ) == 1 then
		if isElement ( gImage["Back"] ) then
			outputChatBox ( "Du kannst nur ein Spiel zur selben Zeit spielen.", 125, 0, 0 )
		else
			local diff = math.abs ( math.floor ( tonumber ( diff ) ) )
			if diff then
				if diff <= 10 then
					level = diff
					speed = 1100 - level * 100
					createTetrisField ( nil )
					outputChatBox ( "Tippe /stopblocks, um das Spiel zu beenden.", 125, 0, 0 )
					toggleAllControls ( false, true, false )
				end
			else
				outputChatBox ( "Bitte nutze /blocks [1-10]", 125, 0, 0 )
			end
		end
	end
end
addCommandHandler ( "blocks", startTetris )

function stoptetris_func ()

	for i = 1, 4 do
		_G["x"..i] = nil
		_G["y"..i] = nil
	end
	
	for x = 1, 10 do
		for y = 1, 18 do
			removeBlock ( x, y )
		end
	end
	destroyElement ( gImage["Back"] )
	
	unbindKey ( "arrow_l", "down", moveLeft )
	unbindKey ( "arrow_r", "down", moveRight )
	unbindKey ( "arrow_d", "down", moveDown )
	unbindKey ( "enter", "down", moveTurn )
	
	destroyElement ( music )
	
	if isTimer ( gameTimer ) then
		killTimer ( gameTimer )
	end
	
	keysBound = false
	blockFalling = false
	
	toggleAllControls ( true, true, false )
end
addCommandHandler ( "stopblocks", stoptetris_func )

function createTetrisField ( parent )

	fields = {}
	fixedFields = {}
	fixedFieldsM = {}
	for x = 1, 10 do
		fields[x] = {}
		fixedFields[x] = {}
		fixedFieldsM[x] = {}
		for y = 1, 18 do
			fields[x][y] = empty
			fixedFields[x][y] = empty
			fixedFieldsM[x][y] = empty
		end
	end
	
	showFields = {}
	for x = 1, 4 do
		showFields[x] = {}
		for y = 1, 4 do
			showFields[x][y] = empty
		end
	end
	
	music = playSound ( "sounds/tetris.mp3", true )
	
	gImage["Back"] = guiCreateStaticImage ( screenwidth / 2 - totalXSize / 2, screenheight / 2 - totalYSize / 2, totalXSize, totalYSize, "images/black.bmp", false, parent )
	gImage["Left"] = guiCreateStaticImage ( 0, 0, leftSizeX * stretch, tetrisSettings.SizeY, "images/tetris/left.bmp", false, gImage["Back"] )
	gImage["Center"] = guiCreateStaticImage ( leftSizeX * stretch, 0, tetrisSettings.SizeX, tetrisSettings.SizeY, "images/tetris/white.bmp", false, gImage["Back"] )
	gImage["Right"] = guiCreateStaticImage ( tetrisSettings.SizeX + leftSizeX * stretch, 0, rightSizeX * stretch, tetrisSettings.SizeY, "images/tetris/right.bmp", false, gImage["Back"] )

	gLabel["score"] = guiCreateLabel(0.2917,0.1574,1,1,tostring(0),true,gImage["Right"])
	guiLabelSetColor(gLabel["score"],0,0,0)
	guiLabelSetVerticalAlign(gLabel["score"],"top")
	guiLabelSetHorizontalAlign(gLabel["score"],"left",false)
	guiSetFont(gLabel["score"],"default-bold-small")
	gLabel["level"] = guiCreateLabel(0.2604,0.3935,1,1,tostring(level),true,gImage["Right"])
	guiLabelSetColor(gLabel["level"],0,0,0)
	guiLabelSetVerticalAlign(gLabel["level"],"top")
	guiLabelSetHorizontalAlign(gLabel["level"],"left",false)
	guiSetFont(gLabel["level"],"default-bold-small")
	gLabel["lines"] = guiCreateLabel(0.3333,0.5556,1,1,"0",true,gImage["Right"])
	guiLabelSetColor(gLabel["lines"],0,0,0)
	guiLabelSetVerticalAlign(gLabel["lines"],"top")
	guiLabelSetHorizontalAlign(gLabel["lines"],"left",false)
	guiSetFont(gLabel["lines"],"default-bold-small")
	
	gImage["showbox"] = guiCreateStaticImage ( 0.39, 0.73, (tetrisSettings.boxsize*4)/(rightSizeX * stretch), (tetrisSettings.boxsize*4)/tetrisSettings.SizeY, "images/tetris/white.bmp", true, gImage["Right"] )
	
	if not keysBound then
		bindKey ( "arrow_l", "down", moveLeft )
		bindKey ( "arrow_r", "down", moveRight )
		bindKey ( "arrow_d", "down", moveDown )
		
		bindKey ( "enter", "down", moveTurn )
		keysBound = true
	end
	
	startGame ()
end

function moveTurn ()

	if blockFalling then
		local typ = curClass
		local model = curModel
		local pos = curPos + 1
		if pos == 5 then
			pos = 1
		end
		
		ox1, oy1 = hx1, hy1
		ox2, oy2 = hx2, hy2
		ox3, oy3 = hx3, hy3
		ox4, oy4 = hx4, hy4
		
		nx1, ny1 = class[typ][pos]["x1"], class[typ][pos]["y1"]
		nx2, ny2 = class[typ][pos]["x2"], class[typ][pos]["y2"]
		nx3, ny3 = class[typ][pos]["x3"], class[typ][pos]["y3"]
		nx4, ny4 = class[typ][pos]["x4"], class[typ][pos]["y4"]
		
		for i = 1, 4 do
			_G["nx"..i] = _G["nx"..i] - _G["ox"..i] + _G["x"..i]
			_G["ny"..i] = _G["ny"..i] - _G["oy"..i] + _G["y"..i]
		end
		
		sucess = true
		for i = 1, 4 do
			local x, y = _G["nx"..i], _G["ny"..i]
			if x < 1 or x > 10 or fixedFields[x][y] or y > 18 then
				sucess = false
				break
			end
		end
		if sucess then
			curPos = pos
			for i = 1, 4 do
				removeBlock ( _G["x"..i], _G["y"..i] )
			end
			for i = 1, 4 do
				_G["hx"..i], _G["hy"..i] = class[typ][pos]["x"..i], class[typ][pos]["y"..i]
			end
			for i = 1, 4 do
				_G["x"..i] = _G["nx"..i]
				_G["y"..i] = _G["ny"..i]
				
				drawBlock ( _G["x"..i], _G["y"..i], curModel )
			end
		end
	end
end

function moveLeft ()

	if blockFalling then
		moveLeft_func ()
	end
end

function moveLeft_func ()

	if getKeyState ( "arrow_l" ) then
		if blockFalling then
			sucess = true
			for i = 1, 4 do
				local cx, cy = _G["x"..i] - 1, _G["y"..i]
				if ( cx ) < 1 or fixedFields[cx][cy] then
					sucess = false
					break
				end
			end
			if sucess then
				for i = 1, 4 do
					local cx, cy = _G["x"..i], _G["y"..i]
					
					removeBlock ( cx, cy )
				end
				for i = 1, 4 do
					_G["x"..i] = _G["x"..i] - 1
					local cx, cy = _G["x"..i], _G["y"..i]
					
					drawBlock ( cx, cy, curModel )
				end
			end
			setTimer ( moveLeft_func, 400, 1 )
		end
	end
end

function moveRight ()

	if blockFalling then
		moveRight_func ()
	end
end

function moveRight_func ()

	if getKeyState ( "arrow_r" ) then
		if blockFalling then
			if blockFalling then
				sucess = true
				for i = 1, 4 do
					local cx, cy = _G["x"..i] + 1, _G["y"..i]
					if ( cx ) > 10 or fixedFields[cx][cy] then
						sucess = false
						break
					end
				end
				if sucess then
					for i = 1, 4 do
						local cx, cy = _G["x"..i], _G["y"..i]
						
						removeBlock ( cx, cy )
					end
					for i = 1, 4 do
						_G["x"..i] = _G["x"..i] + 1
						local cx, cy = _G["x"..i], _G["y"..i]
						
						drawBlock ( cx, cy, curModel )
					end
				end
			end
			setTimer ( moveRight_func, 400, 1 )
		end
	end
end

function moveDown ( key, state )

	if blockFalling then
		if state == "down" then
			setTimer ( moveDown_func, 200, 1 )
		end
	end
end

function moveDown_func ()

	if getKeyState ( "arrow_d" ) then
		if blockFalling then
			sucess = true
			for i = 1, 4 do
				local cx, cy = _G["x"..i], _G["y"..i] + 1
				if ( cy ) >= 18 or fixedFields[cx][cy] then
					sucess = false
					break
				end
			end
			if sucess then
				for i = 1, 4 do
					local cx, cy = _G["x"..i], _G["y"..i]
					
					removeBlock ( cx, cy )
				end
				for i = 1, 4 do
					_G["y"..i] = _G["y"..i] + 1
					local cx, cy = _G["x"..i], _G["y"..i]
					
					drawBlock ( cx, cy, curModel )
				end
			end
			setTimer ( moveDown_func, 200, 1 )
		end
	end
end

function startGame()

	gameTimer = setTimer ( startBlock, 5000, 1 )
	for y = 18, 1, -1 do
		for x = 10, 1, -1 do
			setTimer ( drawBlock, 50 + math.abs ( y - 18 + x - 20 ) * 10, 1, x, y, math.random ( 1, 5 ) )
			setTimer ( removeBlock, 50 + math.abs ( y - 18 + x - 20 ) * 10 + 2000, 1, x, y )
		end
	end
end

function startBlock ()

	if not ncurClass then
		ncurClass = classIDs [ math.random ( 1, 7 ) ]
		ncurPos = 1
		ncurModel = math.random ( 1, 5 )
	end
	curClass = ncurClass
	curPos = ncurPos
	curModel = ncurModel
	
	ncurClass = classIDs [ math.random ( 1, 7 ) ]
	ncurPos = 1
	ncurModel = math.random ( 1, 5 )
	
	showNextBlockInfo()
	
	blockFalling = true
	
	for i = 1, 4 do
		_G["x"..i] = class[curClass][curPos]["x"..i] + 3
		_G["y"..i] = class[curClass][curPos]["y"..i]
		_G["hx"..i] = class[curClass][curPos]["x"..i]
		_G["hy"..i] = class[curClass][curPos]["y"..i]
		drawBlock ( _G["x"..i], _G["y"..i], curModel )
	end
	gameTimer = setTimer ( moveBlock, speed, 1 )
end

function showNextBlockInfo()

	if isElement ( gImage["showbox"] ) then
		destroyElement ( gImage["showbox"] )
		gImage["showbox"] = guiCreateStaticImage ( 0.39, 0.73, (tetrisSettings.boxsize*4)/(rightSizeX * stretch), (tetrisSettings.boxsize*4)/tetrisSettings.SizeY, "images/tetris/white.bmp", true, gImage["Right"] )
		
		for i = 1, 4 do
			x = class[ncurClass][ncurPos]["x"..i]
			y = class[ncurClass][ncurPos]["y"..i]
			local x, y = (x-1)*(tetrisSettings.boxsize), (y-1)*(tetrisSettings.boxsize)
			local width, height = tetrisSettings.boxsize, tetrisSettings.boxsize
			local path = models[ncurModel]
			guiCreateStaticImage ( x, y, width, height, path, false, gImage["showbox"] )
		end
	end
end

function moveBlock ()

	if isElement ( gImage["showbox"] ) then
		sucess = true
		for i = 1, 4 do
			local cx = _G["x"..i]
			local cy = _G["y"..i]
			
			if cy >= 18 then
				sucess = false
				break
			elseif fixedFields[cx][cy+1] then
				sucess = false
				break
			end
		end
		if sucess then
			for i = 1, 4 do
				local cx = _G["x"..i]
				local cy = _G["y"..i]
				
				removeBlock ( cx, cy )
			end
			for i = 1, 4 do
				local cx = _G["x"..i]
				_G["y"..i] = _G["y"..i] + 1
				local cy = _G["y"..i]
				
				drawBlock ( cx, cy, curModel )
			end
			gameTimer = setTimer ( moveBlock, speed, 1 )
		else
			for i = 1, 4 do
				local cx = _G["x"..i]
				local cy = _G["y"..i]
				
				fixedFields[cx][cy] = true
				fixedFieldsM[cx][cy] = curModel
			end
			blockFalling = false
			guiSetText ( gLabel["score"], tonumber ( guiGetText ( gLabel["score"] ) ) + 1 * level )
			checkForFinishedRows()
		end
	end
end

function checkForFinishedRows()

	multiRows = 0
	if isElement ( gImage["showbox"] ) then
		for y = 18, 1, -1 do
			sucess = true
			for x = 1, 10 do
				if not fixedFields[x][y] then
					sucess = false
				end
			end
			if sucess then
				multiRows = multiRows + 1
				rowFinished ( y )
				return
			end
		end
		guiSetText ( gLabel["score"], tonumber ( guiGetText ( gLabel["score"] ) ) + 10 * level * multiRows )
		checkForGameOver ()
	end
end

function rowFinished ( row )

	guiSetText ( gLabel["score"], tonumber ( guiGetText ( gLabel["score"] ) ) + 10 * level )
	guiSetText ( gLabel["lines"], tonumber ( guiGetText ( gLabel["lines"] ) ) + 1 )
	for i = 1, 10 do
		setTimer ( removeBlock, 500, 1, i, row )
		fixedFields[i][row] = false
	end
	setTimer ( moveDownRows, 1000, 1, row )
end

function moveDownRows ( row )

	if isElement ( gImage["showbox"] ) then
		for i = row-1, 1, -1 do
			for x = 1, 10 do
				if fixedFields[x][i] then
					fixedFields[x][i+1] = fixedFields[x][i]
					fixedFields[x][i] = false
					fixedFieldsM[x][i+1] = fixedFieldsM[x][i]
				end
			end
		end
		rebuildRows()
	end
end

function rebuildRows()

	for x = 1, 10 do
		for y = 1, 18 do
			removeBlock ( x, y )
		end
	end
	for x = 1, 10 do
		for y = 1, 18 do
			if fixedFields[x][y] then
				local model = fixedFieldsM[x][y]
				drawBlock ( x, y, model )
			end
		end
	end
	checkForFinishedRows()
end

function checkForGameOver()

	sucess = true
	for i = 1, 10 do
		if fields[i][1] then
			sucess = false
		end
	end
	if sucess then
		startBlock ()
	else
		destroyElement ( music )
		triggerServerEvent ( "tetrisFinished", lp, tonumber ( guiGetText ( gLabel["score"] ) ) )
		setTimer ( stoptetris_func, 5000, 1, "stop", "blocks" )
		--gameTimer = setTimer ( startTetris, 5050, 1, "cmd", tostring(level) )
	end
end

function drawBlock ( x, y, model )

	if isElement ( gImage["Center"] ) then
		px, py = ( x - 1 ) * tetrisSettings.boxsize, ( y - 1 ) * tetrisSettings.boxsize
		path = models[model]
		fields[x][y] = guiCreateStaticImage ( px, py, tetrisSettings.boxsize, tetrisSettings.boxsize, path, false, gImage["Center"] )
	end
end

function removeBlock ( x, y )

	if fields[x][y] then
		destroyElement ( fields[x][y] )
		fields[x][y] = false
	end
end