local goThere = createMarker( 284.46, 2056.21, 16.64, 'cylinder', 1.5, 0, 0, 255, 150 )
local comeBack = createMarker( 286.40, 2056.44, 1012.47, 'cylinder', 1.5, 0, 0, 255, 150 )

function MarkerHit( hitPlayer, matchingDimension )
setElementPosition ( hitPlayer, 291.48, 2056.34, 1014.21 )
outputChatBox ( "** Welcome To Admin-Base SkyRoadJumpBase **" )
end
addEventHandler( "onMarkerHit", goThere, MarkerHit )

function MarkerHit1( hitPlayer, matchingDimension )
setElementPosition ( hitPlayer, 291.14, 2040.31, 17.64 )
outputChatBox ( "** Good Bye For Admin-Base SkyRoadJumpBase **" )
end
addEventHandler( "onMarkerHit", comeBack, MarkerHit1 )