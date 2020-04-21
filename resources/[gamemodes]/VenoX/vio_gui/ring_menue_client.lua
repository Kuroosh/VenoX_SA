local ringMenueRowData = {}
local ringMenueOpened, ringMenueFontSize, ringMenueRows, ringMenueCurSelectedRow, ringMenueBackground, ringMenueAutoSize

function ringMenueCreate ( x, y, width, height, size, autoSize )

	if x and y and width and height then
		x, y, width, height = tonumber ( x ), tonumber ( y ), tonumber ( width ), tonumber ( height )
		if x and y and width and height then
			if not size then
				size = 2.5
			end
			
			ringMenueRows = 0
			
			ringMenueCurSelected = 0
			ringMenueFontSize = size
			ringMenueOpened = true
			ringMenueAutoSize = autoSize
			
			ringMenueBackground = guiCreateStaticImage(x,y,width,height,"images/colors/c_black.jpg",false)
			guiSetAlpha ( ringMenueBackground, 0.9 )
			addEventHandler ( "onClientRender", getRootElement(), ringMenueRender )
			
			return ringMenueBackground
		end
	end
	return false
end

function ringMenueAddRow ( functionToCall, text )

	ringMenueRows = ringMenueRows + 1
	ringMenueRowData[ringMenueRows] = {}
	ringMenueRowData[ringMenueRows]["txt"] = text
	ringMenueRowData[ringMenueRows]["func"] = functionToCall
	if ringMenueRows == 1 then
		ringMenueCurSelectedRow = 1
	end
end

function ringMenueRender ()

	if isElement ( ringMenueBackground ) then
		local x, y = guiGetPosition ( ringMenueBackground, false )
		local width, height = guiGetSize ( ringMenueBackground, false )
		local size = ringMenueFontSize
		local dist = math.floor ( size ) + 1
		local txt, add
		add = ""
		local i = 0
		for key, index in pairs ( ringMenueRowData ) do
			txt = ""..add
			txt = txt..ringMenueRowData[key]["txt"]
			dxDrawText ( txt, x - dist, y - dist, width, height, tocolor ( 0, 0, 0, 255 ), size, "pricedown", "left", "top", false, false, true )
			if ringMenueCurSelectedRow == ( i + 1 ) then
				dxDrawText ( txt, x, y, width, height, tocolor ( 255, 255, 255, 255 ), size, "pricedown", "left", "top", false, false, true )
			else
				dxDrawText ( txt, x, y, width, height, tocolor ( 150, 150, 150, 255 ), size, "pricedown", "left", "top", false, false, true )
			end
			i = i + 1
			add = add.."\n"
		end
	else
		ringMenueHide ()
	end
end

function ringMenueHide ()

	removeEventHandler ( "onClientRender", getRootElement(), ringMenueRender )
	if isElement ( ringMenueBackground ) then
		destroyElement ( ringMenueBackground )
	end
	ringMenueOpened = false
end
