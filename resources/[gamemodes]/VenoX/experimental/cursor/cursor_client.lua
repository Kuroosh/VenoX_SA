function newMouseImage ()

	if isCursorShowing () then
		local x, y = getCursorPosition ()
		local x = x * screenwidth
		local y = y * screenheight
		width = 13
		height = 20
		dxDrawImage ( x, y, width, height, 'cursor.bmp', 0, 0, 0, tocolor ( 255, 255, 255, 255 ), true )
	end
end
addEventHandler ( "onClientRender", getRootElement(), newMouseImage )