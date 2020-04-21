motherChipStacks = {}
local pokerPlayerState = {}
local pokerStacks = {}
local bigBlindToRender, smallBlindToRender

ChipCoinValues = {}
	ChipCoinValues[1] =   1
	ChipCoinValues[2] =   5
	ChipCoinValues[3] =  25
	ChipCoinValues[4] =  50
	ChipCoinValues[5] = 125
	ChipCoinValues[6] = 250
ChipStackValues = {}
	ChipStackValues[1] =    500
	ChipStackValues[2] =   2500
	ChipStackValues[3] =  10000
	ChipStackValues[4] =  50000
	ChipStackValues[5] = 250000
	ChipStackValues[6] = 500000

ChipCoinModels = {}
	ChipCoinModels[1] = 1905
	ChipCoinModels[2] = 1907
	ChipCoinModels[3] = 1909
	ChipCoinModels[4] = 1919
	ChipCoinModels[5] = 1908
	ChipCoinModels[6] = 1900
ChipStackModels = {}
	ChipStackModels[1] = 1911
	ChipStackModels[2] = 1903
	ChipStackModels[3] = 1904
	ChipStackModels[4] = 1941
	ChipStackModels[5] = 1902
	ChipStackModels[6] = 1901

chipPosZDiffStack = 0.0068969726
chipPos = {}
	chipPos = { ["x"] = {}, ["y"] = {} }
		local x, y
		x, y = 2482.8974609375, -1665.3518066406
		chipPos["x"][7], chipPos["y"][7] = 2482.84765625 - x, -1665.3286132813 - y
		x, y = 2482.8447265625, -1665.3818359375 
		chipPos["x"][2], chipPos["y"][2] = 2482.84765625 - x, -1665.3286132813 - y
		x, y = 2482.79296875, -1665.345703125 
		chipPos["x"][3], chipPos["y"][3] = 2482.84765625 - x, -1665.3286132813 - y
		x, y = 2482.7946777344, -1665.2854003906 
		chipPos["x"][4], chipPos["y"][4] = 2482.84765625 - x, -1665.3286132813 - y
		x, y = 2482.849609375, -1665.2576904297 
		chipPos["x"][5], chipPos["y"][5] = 2482.84765625 - x, -1665.3286132813 - y
		x, y = 2482.9016113281, -1665.2934570313 
		chipPos["x"][6], chipPos["y"][6] = 2482.84765625 - x, -1665.3286132813 - y
		
		-- Coins
		x, y = 2482.8447265625, -1665.3197021484 
		chipPos["x"][1], chipPos["y"][1] = 2482.84765625 - x, -1665.3286132813 - y

local chipDrawPositions = {}
	chipDrawPositions["x"] = {}
	chipDrawPositions["y"] = {}
	chipDrawPositions["z"] = {}
	chipDrawPositions["amount"] = {}

function drawChipsStacks ( x, y, z, amount, poker, bigBlind, smallBlind, inState )

	local totalChip = 0
	local int = getElementInterior ( lp )
	local dim = getElementDimension ( lp )
	local i = getFreeChipsSlots()
	local curChipStackHight = 0
	motherChipStacks[i] = createObject ( 1337, 0, 0, 0 )
	local motherStack = motherChipStacks[i]
	if poker then
		pokerStacks[motherStack] = true
		if inState then
			pokerPlayerState[motherStack] = inState
		end
	end
	chipDrawPositions["x"][motherStack] = x
	chipDrawPositions["y"][motherStack] = y
	chipDrawPositions["z"][motherStack] = z
	chipDrawPositions["amount"][motherStack] = amount
	if amount > 812550 then
		leftChipsToShow = 812550
	else
		leftChipsToShow = amount
	end
	chipStack = 1
	for i = 6, 1, -1 do
		if ChipStackValues[i] <= leftChipsToShow then
			leftChipsToShow = leftChipsToShow - ChipStackValues[i]
			local object = createObject ( ChipStackModels[i], x + chipPos["x"][chipStack], y + chipPos["y"][chipStack], z )
			chipStack = chipStack + 1
			setElementParent ( object, motherStack )
			setElementInterior ( object, int )
			setElementDimension ( object, dim )
		end
	end
	for i = 6, 1, -1 do
		if ChipCoinValues[i] <= leftChipsToShow then
			local chips = math.floor ( leftChipsToShow / ChipCoinValues[i] )
			leftChipsToShow = leftChipsToShow - ChipCoinValues[i] * chips
			for k = 1, chips do
				local object = createObject ( ChipCoinModels[i], x + chipPos["x"][chipStack], y + chipPos["y"][chipStack], z + curChipStackHight )
				setElementParent ( object, motherStack )
				curChipStackHight = curChipStackHight + chipPosZDiffStack
				setElementInterior ( object, int )
				setElementDimension ( object, dim )
				totalChip = totalChip + 1
				if totalChip > 10 then
					break
				end
			end
		end
	end
	setElementData ( motherStack, "chips", amount )
	if bigBlind then
		bigBlindToRender = motherStack
	elseif smallBlind then
		smallBlindToRender = motherStack
	end
	if not chipStackDrawEvent then
		addEventHandler ( "onClientRender", getRootElement(), drawChipStackTexts )
		chipStackDrawEvent = true
	end
	return motherStack
end

function destroyChipStack ( stack )

	if chipDrawPositions["x"][stack] then
		chipDrawPositions["x"][stack] = nil
		if isElement ( stack ) then destroyElement ( stack ) end
	end
end

function drawChipStackTexts ()

	i = false
	for key, index in pairs ( chipDrawPositions["x"] ) do
		i = true
		if isElement ( key ) then
			local x, y, z, amount = chipDrawPositions["x"][key], chipDrawPositions["y"][key], chipDrawPositions["z"][key], chipDrawPositions["amount"][key]
			local sx, sy = getScreenFromWorldPosition ( x, y, z, 100, true )
			if sx and sy and amount then
				if pokerPlayerState[key] then
					dxDrawText ( pokerPlayerState[key], sx+20, sy-10, sx, sy, tocolor ( 200, 200, 0, 255 ), 2, "sans" )
				end
				if pokerStacks[key] then
					dxDrawText ( amount.." $", sx, sy + 30, sx, sy, tocolor ( 0, 125, 0, 255 ), 2, "sans" )
				else
					dxDrawText ( amount.." $", sx, sy, sx, sy, tocolor ( 0, 125, 0, 255 ), 2, "sans" )
				end
				if key == bigBlindToRender then
					dxDrawImage ( sx - 55, sy - 12 + 30, 50, 50, "images/cards/bigblind.png", 0, 0, 0, nil, true )
				elseif key == smallBlindToRender then
					dxDrawImage ( sx - 55, sy - 12 + 30, 50, 50, "images/cards/smallblind.png", 0, 0, 0, nil, true )
				end
			else
				chipStackDrawEvent = false
				removeEventHandler ( "onClientRender", getRootElement(), drawChipStackTexts )
			end
		end
	end
	if not i then
		chipStackDrawEvent = false
		removeEventHandler ( "onClientRender", getRootElement(), drawChipStackTexts )
	end
end

function hideAllChips ()

	for key, index in pairs ( chipDrawPositions["x"] ) do
		destroyElement ( key )
	end
end

usedChipsSlots = {}
function getFreeChipsSlots ()

	for i = 1, 50 do
		if not usedChipsSlots[i] then
			usedChipsSlots[i] = true
			return i
		end
	end
end