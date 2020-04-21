addCommandHandler("getpos", function ( player, cmd )
	local x,y,z = getElementPosition( player )
	outputChatBox( x.." , "..y.." , "..z , player , 0,125,0)
end)






