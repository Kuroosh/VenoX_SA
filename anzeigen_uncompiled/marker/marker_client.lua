local arrows = {}
local movingArrowBlip = false

function createMovingArrow ( x, y, z, rangeDown, size, time, withBlip )

	local int = getElementInterior ( lp )
	local dim = getElementDimension ( lp )
	
	local attach = createObject ( 2670, x, y, z )
	setElementInterior ( attach, int )
	setElementDimension ( attach, dim )
	local arrow = createMarker ( x, y, z, "arrow", size, tocolor ( "#FFD20099" ) )
	setElementInterior ( arrow, int )
	setElementDimension ( arrow, dim )
	attachElements ( arrow, attach )
	setElementAlpha ( attach, 0 )
	
	arrows[arrow] = arrow
	
	local blip = false
	if withBlip then
		blip = createBlip ( x, y, z, 0, 1, 255, 0, 0, 255, 0, 99999 )
		movingArrowBlip = blip
	end
	moveArrow ( attach, arrow, rangeDown, z, size, time, blip )
end
addEvent ( "createMovingArrow", true )
addEventHandler ( "createMovingArrow", getRootElement(), createMovingArrow )

function moveArrow ( attach, arrow, rangeDown, z, size, time, withBlip )

	if isElement ( arrow ) then
		local cX, cY, cZ = getElementPosition ( attach )
		
		local tZ
		if cZ == z then
			tZ = z - rangeDown
		else
			tZ = z
		end
		
		moveObject ( attach, time / 2, cX, cY, tZ )
		setTimer ( moveArrow, time / 2 + 50, 1, attach, arrow, rangeDown, z, size, time, blip )
	else
		if isElement ( withBlip ) then
			destroyElement ( withBlip )
		end
		if isElement ( attach ) then
			destroyElement ( attach )
		end
	end
end

function hideallArrows ()

	for key, index in pairs ( arrows ) do
		destroyElement ( key )
	end
	if isElement ( movingArrowBlip ) then
		destroyElement ( movingArrowBlip )
		movingArrowBlip = false
	end
	arrows = {}
end
addEvent ( "hideallArrows", true )
addEventHandler ( "hideallArrows", getRootElement(), hideallArrows )