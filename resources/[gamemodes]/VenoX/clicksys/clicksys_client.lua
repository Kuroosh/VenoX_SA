function bindThatCursor()
	showCursor (not isCursorShowing ())
setElementClicked ( false )
end
bindKey ("b", "down", bindThatCursor)
bindKey ("ralt", "down", bindThatCursor)


function showhmenue ( )
	if tonumber(getElementData ( localPlayer, "loggedin" )) == 1 then
		if not getElementClicked() then
			setElementClicked ( true )
			triggerEvent ( "ShowHelpmenueGui", root )
			showCursor ( true )
		end
	end
end
bindKey ("f1", "down", showhmenue)