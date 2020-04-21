local screenX, screenY = guiGetScreenSize ()

local function drawTheMapForReporter ( )
	dxDrawImage ( 0, 0, screenX, screenY, "images/radar/map.jpg"
end 


addCommandHandler ( "reporterstart", function ( )
	addEventHandler ( "onClientRender", root, drawTheMapForReporter )
end )