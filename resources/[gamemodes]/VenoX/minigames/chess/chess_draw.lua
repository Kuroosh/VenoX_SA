local oldElementOver, selectedElement
local reachableFieldsForCurrentFigure = {}
		reachableFieldsForCurrentFigure["x"] = {}
		reachableFieldsForCurrentFigure["y"] = {}
local reachableFieldCounter = 0

local chessFieldsDraw = {}
	for x = 1, 8 do
		chessFieldsDraw[x] = {}
	end

function markReachableFieldsForFigure ( x, y )

	local color = chessColor
	
	reachableFieldCounter = 0
	reachableFieldsForCurrentFigure["x"] = {}
	reachableFieldsForCurrentFigure["y"] = {}
	
	local figure = chessFields[x][y]
	if color == 2 then
		figure = figure / 10
	end
	-- Pawn --
	if figure == 1 then
		local add
		if color == 1 then	
			add = - 1
		else
			add = 1
		end
		if y + add <= 8 then
			-- Forward steps
			if chessFields[x][y + add] == 0 then
				-- Normal step
				addFieldToReachable ( x, y + add )
				-- First Step ( double )
				if ( color == 1 and y == 7 ) or ( color == 2 and y == 2 ) then
					if ( color == 1 and y == 7 ) then
						if chessFields[x][y - 2] == 0 then
							addFieldToReachable ( x, y - 2 )
						end
					else
						if chessFields[x][y + 2] == 0 then
							addFieldToReachable ( x, y + 2 )
						end
					end
				end
			end
			-- Possible Attack field
			if x < 8 then
				if chessFields[x + 1][y + add] > 0 then
					if getFigureColor ( chessFields[x + 1][y + add] ) ~= chessColor then
						addFieldToReachable ( x + 1, y + add )
					end
				end
			end
			if x > 1 then
				if chessFields[x - 1][y + add] > 0 then
					if getFigureColor ( chessFields[x - 1][y + add] ) ~= chessColor then
						addFieldToReachable ( x - 1, y + add )
					end
				end
			end
		end
	-- Castle
	elseif figure == 2 then
		-- Down ( with attack )
		for i = y, 8 do
			if i > y then
				if chessFields[x][i] > 0 then
					if getFigureColor ( chessFields[x][i] ) ~= color then
						addFieldToReachable ( x, i )
					end
					break
				else
					addFieldToReachable ( x, i )
				end
			end
		end
		-- Up
		for i = y, 1, -1 do
			if i < y then
				if chessFields[x][i] > 0 then
					if getFigureColor ( chessFields[x][i] ) ~= color then
						addFieldToReachable ( x, i )
					end
					break
				else
					addFieldToReachable ( x, i )
				end
			end
		end
		-- Left
		for i = x, 1, -1 do
			if i < x then
				if chessFields[i][y] > 0 then
					if getFigureColor ( chessFields[i][y] ) ~= color then
						addFieldToReachable ( i, y )
					end
					break
				else
					addFieldToReachable ( i, y )
				end
			end
		end
		-- Right
		for i = x, 8 do
			if i > x then
				if chessFields[i][y] > 0 then
					if getFigureColor ( chessFields[i][y] ) ~= color then
						addFieldToReachable ( i, y )
					end
					break
				else
					addFieldToReachable ( i, y )
				end
			end
		end
	-- Knight
	elseif figure == 3 then
		local zx, zy
		for key, index in pairs ( knightJumpPossibility["x"] ) do
			zx, zy = knightJumpPossibility["x"][key] + x, knightJumpPossibility["y"][key] + y
			if zx >= 1 and zx <= 8 and zy >= 1 and zy <= 8 then
				if ( chessFields[zx][zy] == 0 or getFigureColor ( chessFields[zx][zy] ) ~= color ) then
					addFieldToReachable ( zx, zy )
				end
			end
		end
	-- Bishop
	elseif figure == 4 then
		-- Right-Down
		local zx, zy
		for i = x, 8 do
			zx, zy = i, i - x + y
			if zx ~= x or zy ~= y then
				if zx >= 1 and zx <= 8 and zy >= 1 and zy <= 8 then
					if chessFields[zx][zy] == 0 then
						addFieldToReachable ( zx, zy )
					else
						if getFigureColor ( chessFields[zx][zy] ) ~= color then
							addFieldToReachable ( zx, zy )
						end
						break
					end
				end
			end
		end
		-- Left-Top
		local zx, zy
		for i = x, 1, -1 do
			zx, zy = i, i - x + y
			if zx ~= x or zy ~= y then
				if zx >= 1 and zx <= 8 and zy >= 1 and zy <= 8 then
					if chessFields[zx][zy] == 0 then
						addFieldToReachable ( zx, zy )
					else
						if getFigureColor ( chessFields[zx][zy] ) ~= color then
							addFieldToReachable ( zx, zy )
						end
						break
					end
				end
			end
		end
		-- Right-Up
		local zx, zy
		for i = y, 1, -1 do
			zx, zy = y - i + x, i
			if zx ~= x or zy ~= y then
				if zx >= 1 and zx <= 8 and zy >= 1 and zy <= 8 then
					if chessFields[zx][zy] == 0 then
						addFieldToReachable ( zx, zy )
					else
						if getFigureColor ( chessFields[zx][zy] ) ~= color then
							addFieldToReachable ( zx, zy )
						end
						break
					end
				end
			end
		end
		-- Left-Down
		local zx, zy
		for i = y, 8 do
			zx, zy = y - i + x, i
			if zx ~= x or zy ~= y then
				if zx >= 1 and zx <= 8 and zy >= 1 and zy <= 8 then
					if chessFields[zx][zy] == 0 then
						addFieldToReachable ( zx, zy )
					else
						if getFigureColor ( chessFields[zx][zy] ) ~= color then
							addFieldToReachable ( zx, zy )
						end
						break
					end
				end
			end
		end
	-- Queen
	elseif figure == 5 then
		-- Right-Down
		local zx, zy
		for i = x, 8 do
			zx, zy = i, i - x + y
			if zx ~= x or zy ~= y then
				if zx >= 1 and zx <= 8 and zy >= 1 and zy <= 8 then
					if chessFields[zx][zy] == 0 then
						addFieldToReachable ( zx, zy )
					else
						if getFigureColor ( chessFields[zx][zy] ) ~= color then
							addFieldToReachable ( zx, zy )
						end
						break
					end
				end
			end
		end
		-- Left-Top
		local zx, zy
		for i = x, 1, -1 do
			zx, zy = i, i - x + y
			if zx ~= x or zy ~= y then
				if zx >= 1 and zx <= 8 and zy >= 1 and zy <= 8 then
					if chessFields[zx][zy] == 0 then
						addFieldToReachable ( zx, zy )
					else
						if getFigureColor ( chessFields[zx][zy] ) ~= color then
							addFieldToReachable ( zx, zy )
						end
						break
					end
				end
			end
		end
		-- Right-Up
		local zx, zy
		for i = y, 1, -1 do
			zx, zy = y - i + x, i
			if zx ~= x or zy ~= y then
				if zx >= 1 and zx <= 8 and zy >= 1 and zy <= 8 then
					if chessFields[zx][zy] == 0 then
						addFieldToReachable ( zx, zy )
					else
						if getFigureColor ( chessFields[zx][zy] ) ~= color then
							addFieldToReachable ( zx, zy )
						end
						break
					end
				end
			end
		end
		-- Left-Down
		local zx, zy
		for i = y, 8 do
			zx, zy = y - i + x, i
			if zx ~= x or zy ~= y then
				if zx >= 1 and zx <= 8 and zy >= 1 and zy <= 8 then
					if chessFields[zx][zy] == 0 then
						addFieldToReachable ( zx, zy )
					else
						if getFigureColor ( chessFields[zx][zy] ) ~= color then
							addFieldToReachable ( zx, zy )
						end
						break
					end
				end
			end
		end
		-- Down ( with attack )
		for i = y, 8 do
			if i > y then
				if chessFields[x][i] > 0 then
					if getFigureColor ( chessFields[x][i] ) ~= color then
						addFieldToReachable ( x, i )
					end
					break
				else
					addFieldToReachable ( x, i )
				end
			end
		end
		-- Up
		for i = y, 1, -1 do
			if i < y then
				if chessFields[x][i] > 0 then
					if getFigureColor ( chessFields[x][i] ) ~= color then
						addFieldToReachable ( x, i )
					end
					break
				else
					addFieldToReachable ( x, i )
				end
			end
		end
		-- Left
		for i = x, 1, -1 do
			if i < x then
				if chessFields[i][y] > 0 then
					if getFigureColor ( chessFields[i][y] ) ~= color then
						addFieldToReachable ( i, y )
					end
					break
				else
					addFieldToReachable ( i, y )
				end
			end
		end
		-- Right
		for i = x, 8 do
			if i > x then
				if chessFields[i][y] > 0 then
					if getFigureColor ( chessFields[i][y] ) ~= color then
						addFieldToReachable ( i, y )
					end
					break
				else
					addFieldToReachable ( i, y )
				end
			end
		end
	-- King
	elseif figure == 6 then
		local zx, zy
		for key, index in pairs ( kingMovementPosition["x"] ) do
			zx, zy = kingMovementPosition["x"][key] + x, kingMovementPosition["y"][key] + y
			if zx >= 1 and zx <= 8 and zy >= 1 and zy <= 8 then
				if ( chessFields[zx][zy] == 0 or getFigureColor ( chessFields[zx][zy] ) ~= color ) then
					if not wouldFieldBeDangerousForKing ( zx, zy ) then
						addFieldToReachable ( zx, zy )
					end
				end
			end
		end
		addPossibleRook ()
	end
	
	drawReachableFields ()
end

function addPossibleRook ()

	leftRookPossible = false
	rightRookPossible = false
	if not kingMoved then
		local x, y = getKingPosition ( chessColor )
		-- Left castle ( long )
		if not leftCastleMoved then
			if chessFields[2][y] == 0 and chessFields[3][y] == 0 then
				if not wouldFieldBeDangerousForKing ( 5, y ) and not wouldFieldBeDangerousForKing ( 4, y ) and not wouldFieldBeDangerousForKing ( 3, y ) then
					addFieldToReachable ( 3, y )
					leftRookPossible = true
				end
			end
		end
		if not rightCastleMoved then
			if chessFields[6][y] == 0 and chessFields[7][y] == 0 then
				-- Right castle ( short )
				if not wouldFieldBeDangerousForKing ( 5, y ) and not wouldFieldBeDangerousForKing ( 6, y ) and not wouldFieldBeDangerousForKing ( 7, y ) then
					addFieldToReachable ( 7, y )
					rightRookPossible = true
				end
			end
		end
	end
end

--[[
function isGameLost ()

	local x, y = getKingPosition ( chessColor )
	local possibleFields = 0
	local zx, zy
	for key, index in pairs ( kingMovementPosition["x"] ) do
		zx, zy = kingMovementPosition["x"][key] + x, kingMovementPosition["y"][key] + y
		if zx >= 1 and zx <= 8 and zy >= 1 and zy <= 8 then
			if ( chessFields[zx][zy] == 0 or getFigureColor ( chessFields[zx][zy] ) ~= color ) then
				if not wouldFieldBeDangerousForKing ( zx, zy ) then
					possibleFields = possibleFields + 1
				end
			end
		end
	end
	if possibleFields == 0 and wouldFieldBeDangerousForKing ( x, y ) then
		return true
	end
	return false
end
]]

function getKingPosition ( color )

	for i = 1, 8 do
		for k = 1, 8 do
			if ( color == 1 and chessFields[i][k] == 6 ) or ( color == 2 and chessFields[i][k] == 60 ) then
				x = i
				y = k
				return x, y
			end
		end
	end
end

function wouldFieldBeDangerousForKing ( x, y, color )

	if x >= 1 and x <= 8 and y >= 1 and y <= 8 then
		local zx, zy
		if not color then
			color = chessColor
		end
		-- Pawn
		local add, figureToBeat
		if color == 1 then
			add = 1
			figureToBeat = 10
		else
			add = -1
			figureToBeat = 1
		end
		if y + add >= 1 and y + add <= 8 then
			if x + 1 <= 8 then
				if chessFields[x+1][y+add] == figureToBeat then
					return true
				end
			end
			if x - 1 >= 1 then
				if chessFields[x-1][y+add] == figureToBeat then
					return true
				end
			end
		end
		-- Knight
		for key, index in pairs ( knightJumpPossibility["x"] ) do
			zx, zy = knightJumpPossibility["x"][key] + x, knightJumpPossibility["y"][key] + y
			if zx >= 1 and zx <= 8 and zy >= 1 and zy <= 8 then
				if getFigureColor ( chessFields[zx][zy] ) ~= color then
					if chessFields[zx][zy] == 3 or chessFields[zx][zy] == 30 then
						return true
					end
				end
			end
		end
		-- Castle / Queen
			-- Down ( with attack )
			for i = y, 8 do
				if i > y then
					if chessFields[x][i] > 0 then
						if getFigureColor ( chessFields[x][i] ) ~= color then
							if chessFields[x][i] == 2 or chessFields[x][i] == 5 or chessFields[x][i] == 20 or chessFields[x][i] == 50 then
								return true
							end
						end
						break
					end
				end
			end
			-- Up
			for i = y, 1, -1 do
				if i < y then
					if chessFields[x][i] > 0 then
						if getFigureColor ( chessFields[x][i] ) ~= color then
							if chessFields[x][i] == 2 or chessFields[x][i] == 5 or chessFields[x][i] == 20 or chessFields[x][i] == 50 then
								return true
							end
						end
						break
					end
				end
			end
			-- Left
			for i = x, 1, -1 do
				if i < x then
					if chessFields[i][y] > 0 then
						if getFigureColor ( chessFields[i][y] ) ~= color then
							if chessFields[i][y] == 2 or chessFields[i][y] == 5 or chessFields[i][y] == 20 or chessFields[i][y] == 50 then
								return true
							end
						end
						break
					end
				end
			end
			-- Right
			for i = x, 8 do
				if i > x then
					if chessFields[i][y] > 0 then
						if getFigureColor ( chessFields[i][y] ) ~= color then
							if chessFields[i][y] == 2 or chessFields[i][y] == 5 or chessFields[i][y] == 20 or chessFields[i][y] == 50 then
								return true
							end
						end
						break
					end
				end
			end
		-- Bishop / Queen
			-- Right-Down
			local zx, zy
			for i = x, 8 do
				zx, zy = i, i - x + y
				if zx ~= x or zy ~= y then
					if zx >= 1 and zx <= 8 and zy >= 1 and zy <= 8 then
						if chessFields[zx][zy] > 0 then
							if getFigureColor ( chessFields[zx][zy] ) ~= color then
								if chessFields[zx][zy] == 4 or chessFields[zx][zy] == 40 or chessFields[zx][zy] == 5 or chessFields[zx][zy] == 50 then
									return true
								end
							end
							break
						end
					end
				end
			end
			-- Left-Top
			for i = x, 1, -1 do
				zx, zy = i, i - x + y
				if zx ~= x or zy ~= y then
					if zx >= 1 and zx <= 8 and zy >= 1 and zy <= 8 then
						if chessFields[zx][zy] > 0 then
							if getFigureColor ( chessFields[zx][zy] ) ~= color then
								if chessFields[zx][zy] == 4 or chessFields[zx][zy] == 40 or chessFields[zx][zy] == 5 or chessFields[zx][zy] == 50 then
									return true
								end
							end
							break
						end
					end
				end
			end
			-- Right-Up
			for i = y, 1, -1 do
				zx, zy = y - i + x, i
				if zx ~= x or zy ~= y then
					if zx >= 1 and zx <= 8 and zy >= 1 and zy <= 8 then
						if chessFields[zx][zy] > 0 then
							if getFigureColor ( chessFields[zx][zy] ) ~= color then
								if chessFields[zx][zy] == 4 or chessFields[zx][zy] == 40 or chessFields[zx][zy] == 5 or chessFields[zx][zy] == 50 then
									return true
								end
							end
							break
						end
					end
				end
			end
			-- Left-Down
			for i = y, 8 do
				zx, zy = y - i + x, i
				if zx ~= x or zy ~= y then
					if zx >= 1 and zx <= 8 and zy >= 1 and zy <= 8 then
						if chessFields[zx][zy] > 0 then
							if getFigureColor ( chessFields[zx][zy] ) ~= color then
								if chessFields[zx][zy] == 4 or chessFields[zx][zy] == 40 or chessFields[zx][zy] == 5 or chessFields[zx][zy] == 50 then
									return true
								end
							end
							break
						end
					end
				end
			end
		end
	return false
end

function addFieldToReachable ( x, y )

	reachableFieldCounter = reachableFieldCounter + 1
	reachableFieldsForCurrentFigure["x"][reachableFieldCounter] = x
	reachableFieldsForCurrentFigure["y"][reachableFieldCounter] = y
end

function drawReachableFields ()

	for key, index in pairs ( reachableFieldsForCurrentFigure["x"] ) do
		x = reachableFieldsForCurrentFigure["x"][key]
		y = reachableFieldsForCurrentFigure["y"][key]
		setFieldNewBGColor ( x, y, "valid" )
		drawFieldBackgroundAgain ( x, y )
	end
end

function hideReachableFields ()

	for key, index in pairs ( reachableFieldsForCurrentFigure["x"] ) do
		x = reachableFieldsForCurrentFigure["x"][key]
		y = reachableFieldsForCurrentFigure["y"][key]
		removeFieldNewBGColor ( x, y )
		drawFieldBackgroundAgain ( x, y )
	end
end

function getFigureColor ( id )

	if not id then
		return false
	end
	if id == 0 then
		return false
	elseif id >= 10 then
		return 2
	else
		return 1
	end
end

function showChessSurface ()

	local x, y, width, height, path
	width, height = settings.fieldXSize * ( 8 + 2 ), settings.fieldYSize * ( 8 + 6 )
	x = screenwidth / 2 - width / 2
	y = screenheight / 2 - height / 2
	path = "images/chess/board/bg.png"
	chessSurface = guiCreateStaticImage ( x, y, width, height, path, false, nil )
	chessResignButton = guiCreateButton ( 0, 100, 50, 70, "", false, chessSurface )
	guiSetAlpha ( chessResignButton, 0 )
	addEventHandler ( "onClientGUIClick", chessResignButton,
		function ()
			triggerServerEvent ( "resign", getLocalPlayer() )
		end,
	false )
	return chessSurface
end

function getChessSurface ()

	return chessSurface
end

function redrawChessField ( parent )

	for i = 1, 8 do
		for k = 1, 8 do
			fieldBGColors = {}
			if isElement ( chessFieldsDraw[i][k] ) then
				destroyElement ( chessFieldsDraw[i][k] )
			end
			local x, y, width, height, path, fColor, img
			width, height = settings.fieldXSize, settings.fieldYSize
			x, y = ( width * ( i - 1 + 1 ) ), ( height * ( k - 1 + 3 ) )
			path = getFieldBGPath ( i, k )
			
			chessFieldsDraw[i][k] = guiCreateStaticImage ( x, y, width, height, path, false, parent )
			setElementData ( chessFieldsDraw[i][k], "x", i )
			setElementData ( chessFieldsDraw[i][k], "y", k )
			
			addEventHandler ( "onClientMouseMove", chessFieldsDraw[i][k],
				function ()
					if source ~= chessSurface then
						if not oldElementOver or not ( getElementData ( source, "x" ) == getElementData ( oldElementOver, "x" ) and getElementData ( source, "y" ) == getElementData ( oldElementOver, "y" ) ) then
							local x, y
							if isElement ( oldElementOver ) then
								x, y = getElementData ( oldElementOver, "x" ), getElementData ( oldElementOver, "y" )
								path = getFieldBGPath ( x, y )
								guiStaticImageLoadImage ( chessFieldsDraw[x][y], path )
								drawFigureOnField ( x, y, chessFieldsDraw[x][y] )
							end
							x, y = getElementData ( source, "x" ), getElementData ( source, "y" )
							
							if not fieldBGColors or not fieldBGColors[x] or not fieldBGColors[x][y] then
								guiStaticImageLoadImage ( source, "images/chess/board/mouse_over.png" )
								drawFigureOnField ( x, y, source )
							end
							oldElementOver = source
						end
					end
				end
			)
			
			drawFigureOnField ( i, k, chessFieldsDraw[i][k] )
		end
	end
end

function drawFieldBackgroundAgain ( x, y )

	path = getFieldBGPath ( x, y )
	guiStaticImageLoadImage ( chessFieldsDraw[x][y], path )
	drawFigureOnField ( x, y, chessFieldsDraw[x][y] )
end

function drawFigureOnField ( x, y, bg )

	local path, img, width, height
	
	width, height = settings.fieldXSize, settings.fieldYSize
	path = "images/chess/"
	img = chessFields[x][y]
	if img then
		if img > 0 then
			if img < 10 then
				path = path.."white/"..chessFigureImages[img]..".png"
			else
				path = path.."black/"..chessFigureImages[img / 10]..".png"
			end
			guiCreateStaticImage ( 0, 0, width, height, path, false, bg )
		end
	end
end

function setFieldNewBGColor ( x, y, image )

	if not fieldBGColors[x] then
		fieldBGColors[x] = {}
	end
	fieldBGColors[x][y] = image
end

function removeFieldNewBGColor ( x, y )

	if fieldBGColors[x] then
		fieldBGColors[x][y] = nil
	end
end

function getFieldBGPath ( x, y )

	local color = getFieldBGColorIFNotChanged ( x, y )
	if fieldBGColors[x] then
		if fieldBGColors[x][y] then
			color = fieldBGColors[x][y]
		end
	end
	return "images/chess/board/"..color..".png"
end

function isFieldValid ( x, y )

	if x and y then
		if x > 0 and x < 9 and y > 0 and y < 9 then
			if fieldBGColors[x] then
				if fieldBGColors[x][y] then
					return ( fieldBGColors[x][y] == "valid" )
				end
			end
		end
	end
	return false
end

function getFieldBGColorIFNotChanged ( x, y )

	if x / 2 == math.floor ( x / 2 ) then
		if y / 2 == math.floor ( y / 2 ) then
			color = "white"
		else
			color = "black"
		end
	else
		if y / 2 == math.floor ( y / 2 ) then
			color = "black"
		else
			color = "white"
		end
	end
	return color
end

function drawBeatenFigure ( id )

	local color = "white"
	if id >= 10 then
		color = "black"
		id = id / 10
	end
	
	if not sideOutFigures[color] then
		sideOutFigures[color] = {}
		for i = 1, 5 do
			sideOutFigures[color][i] = {}
		end
	else
		for i = 1, 5 do
			if not sideOutFigures[color][i] then
				sideOutFigures[color][i] = {}
			end
		end
	end
	
	local path = "images/chess/"..color.."/"
	local x, y
	-- Pawn
	if id == 1 then
		path = path.."pawn"
		y = 1
		for i = 1, 8 do
			if not sideOutFigures[color][1][i] then
				x = i
				sideOutFigures[color][1][i] = true
				break
			end
		end
	else
		y = 2
		if id == 2 then
			for i = 1, 2 do
				if not sideOutFigures[color][id][i] then
					sideOutFigures[color][id][i] = true
					x = 1 + 7 * ( i - 1 )
					break
				end
			end
			path = path.."castle"
		elseif id == 3 then
			for i = 1, 2 do
				if not sideOutFigures[color][id][i] then
					sideOutFigures[color][id][i] = true
					x = 2 + 5 * ( i - 1 )
					break
				end
			end
			path = path.."knight"
		elseif id == 4 then
			for i = 1, 2 do
				if not sideOutFigures[color][id][i] then
					sideOutFigures[color][id][i] = true
					x = 3 + 3 * ( i - 1 )
					break
				end
			end
			path = path.."bishop"
		elseif id == 5 then
			--if not sideOutFigures[color][id][1] then
				sideOutFigures[color][id][1] = true
				x = 4
			--end
			path = path.."queen"
		elseif id == 6 then
			path = path.."king"
		end
	end
	path = path..".png"
	inverted = false
	if color == "white" then
		basicY = 11 * settings.fieldYSize
	else
		basicY = 2 * settings.fieldYSize
		y = - 1 * y
	end
	y = basicY + y * settings.fieldYSize
	x = x * settings.fieldXSize
	guiCreateStaticImage ( x, y, settings.fieldXSize, settings.fieldYSize, path, false, getChessSurface() )
end

function drawList ()

	chessDrawWindow = guiCreateWindow(screenwidth-97,1,97,231,"Zuege",false)
	guiSetAlpha(chessDrawWindow,1)
	chessDrawList = guiCreateMemo(9,17,79,205,"Start\n",false,chessDrawWindow)
	guiSetAlpha(chessDrawList,1)
end

function addToDrawList ( txt )

	guiSetText ( chessDrawList, guiGetText ( chessDrawList )..txt )
end