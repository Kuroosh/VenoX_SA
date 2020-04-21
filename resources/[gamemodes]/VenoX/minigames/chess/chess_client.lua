ableToDraw = false
chessFields = {}
chessColor = 0
curChessFieldSelected = {}
	curChessFieldSelected["x"] = 0
	curChessFieldSelected["y"] = 0

function startNewChessParty_func ( ownColor )

	sideOutFigures = {}
	kingMoved = false
	leftCastleMoved = false
	rightCastleMoved = false
	drawList ()
	curChessFieldSelected["x"] = nil
	curChessFieldSelected["y"] = nil
	chessColor = ownColor
	setChessToBasic ()
	local field = showChessSurface ()
	redrawChessField ( field )
	addEventHandler ( "onClientGUIClick", field, chessBoardClicked )
end
addEvent ( "startNewChessParty", true )
addEventHandler ( "startNewChessParty", getRootElement(), startNewChessParty_func )

function chessBoardClicked ()

	if ableToDraw then
		local special = ""
		ableToDraw = false
		local x, y = getElementData ( source, "x" ), getElementData ( source, "y" )
		if x and y then
			if chessFields[x][y] > 0 then
				local color = false
				if chessColor == 1 and chessFields[x][y] < 10 then
					color = "white"
				elseif chessColor == 2 and chessFields[x][y] >= 10 then
					color = "black"
				end
				if color then
					local oldX, oldY = curChessFieldSelected["x"], curChessFieldSelected["y"]
					if oldX and oldY then
						removeFieldNewBGColor ( oldX, oldY )
						drawFieldBackgroundAgain ( oldX, oldY )
					end
					hideReachableFields ()
					setFieldNewBGColor ( x, y, "selected" )
					curChessFieldSelected["x"] = x
					curChessFieldSelected["y"] = y
					drawFieldBackgroundAgain ( x, y )
					markReachableFieldsForFigure ( x, y )
				elseif isFieldValid ( x, y ) then
					if chessFields[x][y] == 6 or chessFields[x][y] == 60 then
						endDraw ( x, y, x, y, "won" )
					else
						if figure == 1 or figure == 10 then
							if y == 8 or y == 1 then
								special = "queen"
							end
						end
						local oldX, oldY = curChessFieldSelected["x"], curChessFieldSelected["y"]
						hideReachableFields ()
						removeFieldNewBGColor ( oldX, oldY )
						drawFieldBackgroundAgain ( oldX, oldY )
						
						changeFigurePosition_func ( oldX, oldY, x, y )
						
						endDraw ( oldX, oldY, x, y, special )
					end
					return nil
				end
			elseif isFieldValid ( x, y ) then
				local oldX, oldY = curChessFieldSelected["x"], curChessFieldSelected["y"]
				hideReachableFields ()
				removeFieldNewBGColor ( oldX, oldY )
				drawFieldBackgroundAgain ( oldX, oldY )
				local figure = chessFields[oldX][oldY]
				
				if leftRookPossible and x == 3 then
					special = "rookLeft"
					changeFigurePosition_func ( oldX, oldY, x, y, special )
					endDraw ( oldX, oldY, x, y, special )
				elseif rightRookPossible and x == 7 then
					special = "rookRight"
					changeFigurePosition_func ( oldX, oldY, x, y, special )
					endDraw ( oldX, oldY, x, y, special )
				else
					if chessFields[oldX][oldY] == 6 or chessFields[oldX][oldY] == 60 then
						kingMoved = true
					elseif oldX == 1 and ( oldY == 1 or oldY == 8 ) then
						leftCastleMoved = true
					elseif oldX == 8 and ( oldY == 1 or oldY == 8 ) then
						rightCastleMoved = true
					end
					
					if figure == 1 or figure == 10 then
						if y == 8 or y == 1 then
							special = "queen"
						end
					end
					changeFigurePosition_func ( oldX, oldY, x, y, special )
					endDraw ( oldX, oldY, x, y, special )
					return nil
				end
			end
		end
		ableToDraw = true
	end
end

function looseChessGame ()

	outputChatBox ( "You loose." )
end

function changeFigurePosition_func ( x1, y1, x2, y2, special )

	if special == "rookRight" then
		chessFields[x2][y2] = chessFields[x1][y1]
		chessFields[x1][y1] = 0
		
		chessFields[6][y1] = chessFields[8][y2]
		chessFields[8][y1] = 0
		
		for i = 5, 8 do
			drawFieldBackgroundAgain ( i, y1 )
		end
		addToDrawList ( "0-0" )
	elseif special == "rookLeft" then
		chessFields[x2][y2] = chessFields[x1][y1]
		chessFields[x1][y1] = 0
		
		chessFields[4][y2] = chessFields[1][y2]
		chessFields[1][y2] = 0
		
		for i = 1, 5 do
			drawFieldBackgroundAgain ( i, y1 )
		end
		addToDrawList ( "0-0-0" )
	else
		local figure = chessFields[x1][y1]
		if chessFields[x2][y2] > 0 then
			drawBeatenFigure ( chessFields[x2][y2] )
		end
		chessFields[x2][y2] = figure
		chessFields[x1][y1] = 0
		
		if special == "queen" then
			if chessFields[x2][y2] == 1 then
				newFigure = 5
			else
				newFigure = 50
			end
			chessFields[x2][y2] = newFigure
			if chessFields[x2][y2] < 10 then
				drawBeatenFigure ( 1 )
			else
				drawBeatenFigure ( 10 )
			end
		end
		
		drawFieldBackgroundAgain ( x1, y1 )
		drawFieldBackgroundAgain ( x2, y2 )
		
		local l1, l2, n1, n2
		l1 = string.char ( x1 + 64 )
		l2 = string.char ( x2 + 64 )
		n1 = y1
		n2 = y2
		addToDrawList ( l1..n1.."-"..l2..n2 )
	end
end
addEvent ( "changeFigurePosition", true )
addEventHandler ( "changeFigurePosition", getRootElement(), changeFigurePosition_func )

function endDraw ( x1, y1, x2, y2, special )

	triggerServerEvent ( "endDraw", getLocalPlayer(), x1, y1, x2, y2, special )
	showCursor ( false )
end

function startChessDraw_func ()

	showCursor ( true )
	ableToDraw = true
	local x, y = getKingPosition ( chessColor )
	if wouldFieldBeDangerousForKing ( x, y ) then
		outputChatBox ( "Du stehst im Schach!", 125, 0, 0 )
	end
end
addEvent ( "startChessDraw", true )
addEventHandler ( "startChessDraw", getRootElement(), startChessDraw_func )

function endGame_func ()

	destroyElement ( chessDrawWindow )
	destroyElement ( getChessSurface () )
	showCursor ( false )
end
addEvent ( "endGame", true )
addEventHandler ( "endGame", getRootElement(), endGame_func )

function setChessToBasic ()

	ableToDraw = false
	chessFields = {}
		for x = 1, 8 do
			chessFields[x] = {}
			for y = 1, 8 do
				chessFields[x][y] = 0
			end
		end
	
	chessFields[1][1] = 20
	chessFields[2][1] = 30
	chessFields[3][1] = 40
	chessFields[4][1] = 50
	chessFields[5][1] = 60
	chessFields[6][1] = 40
	chessFields[7][1] = 30
	chessFields[8][1] = 20
	for i = 1, 8 do
		chessFields[i][2] = 10
	end
	
	for i = 1, 8 do
		chessFields[i][7] = 1
	end
	chessFields[1][8] = 2
	chessFields[2][8] = 3
	chessFields[3][8] = 4
	chessFields[4][8] = 5
	chessFields[5][8] = 6
	chessFields[6][8] = 4
	chessFields[7][8] = 3
	chessFields[8][8] = 2
end