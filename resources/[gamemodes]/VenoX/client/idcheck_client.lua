local function drawIDText ( button, state, _, _, _, _, _, element )
	if button == "left" and state == "down" then
		if element and isElement ( element ) then
			local x, y, z = getElementPosition ( element )
			local id = getElementID ( element ) or "nil"
			local typ = getElementType ( element ) or "nil"
			local model = getElementModel ( element ) or "nil"
			outputChatBox ( id .. ": "..typ.." - ".. model .. " | " .. x .. " - ".. y .. " - ".. z )
		end
	end
end


local isshowing = false
addCommandHandler ( "showelement", function ( )
	if isshowing then
		removeEventHandler ( "onClientClick", root, drawIDText )
		isshowing = false
		outputChatBox ( "Element-Anzeige ausgeschaltet", 200, 0, 0 )
	else
		addEventHandler ( "onClientClick", root, drawIDText )
		isshowing = true
		outputChatBox ( "Element-Anzeige angeschaltet - Klicke auf etwas" )
	end
end )