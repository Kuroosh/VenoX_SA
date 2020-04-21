function camfix_func ()

	setCameraClip ( true, true )
end
addEvent ( "camfix", true )
addEventHandler ( "camfix", getRootElement(), camfix_func )