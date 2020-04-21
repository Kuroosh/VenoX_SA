lookoutMarkerXDist = -2079.9479980469 - -2079.9396972656
lookoutMarkerYDist = 1060.4010009766 - 1061.5550537109
lookoutMarkerZDist = 65.319007873535 - 64.518218994141
dist = getDistanceBetweenPoints2D ( 0, 0, lookoutMarkerXDist, lookoutMarkerYDist )
lookoutMarkerRot = findRotation ( 0, 0, lookoutMarkerXDist, lookoutMarkerYDist )

local screenwidth, screenheight = guiGetScreenSize()
local div = 1000 / 667
local sDiv = screenwidth / screenheight

--[[ Bsp.:
1920 x 1080
1600 x 1200

div = 1.499925

sDiv1 = 1.777777
sDiv2 = 1.333333
]]

if screenheight * sDiv <= screenwidth then
	lookoutIMGWidth = screenheight * sDiv
	lookoutIMGHeight = screenheight
elseif screenwidth / sDiv <= screenheight then
	lookoutIMGWidth = screenwidth
	lookoutIMGHeight = screenheight / sDiv
else
	lookoutIMGWidth = screenwidth / 1.5
	lookoutIMGHeight = lookoutIMGWidth / div
end

lookoutIMGX = ( screenwidth - lookoutIMGWidth ) / 2
lookoutIMGY = ( screenheight - lookoutIMGHeight ) / 2

lookDistance = 50

lookouts = {}
 lookouts["model"] = 951
 lookouts["x"] = {}
 lookouts["y"] = {}
 lookouts["z"] = {}
 lookouts["r"] = {}
 local i = 1
 lookouts["x"][i], lookouts["y"][i], lookouts["z"][i], lookouts["r"][i] = -1419.9284667969, 857.7392578125, 6.937680721283, 90
 i = i + 1
 lookouts["x"][i], lookouts["y"][i], lookouts["z"][i], lookouts["r"][i] = -1412.7540283203, -789.517578125, 85.404197692871, 180
 i = i + 1
 lookouts["x"][i], lookouts["y"][i], lookouts["z"][i], lookouts["r"][i] = -2376.9445800781, -578.57611083984, 131.86737060547, 90
 i = i + 1
 lookouts["x"][i], lookouts["y"][i], lookouts["z"][i], lookouts["r"][i] = -2654.259765625, 1933.9750976563, 64.194389343262, 90
 i = i + 1
 lookouts["x"][i], lookouts["y"][i], lookouts["z"][i], lookouts["r"][i] = -2295.3625488281, 2225.2114257813, 4.7323718070984, 0
 i = i + 1
 lookouts["x"][i], lookouts["y"][i], lookouts["z"][i], lookouts["r"][i] = -1473.8321533203, -910.90747070313, 202.12022399902, 180
 i = i + 1
 lookouts["x"][i], lookouts["y"][i], lookouts["z"][i], lookouts["r"][i] = -2077.0847167969, 1065.6423339844, 65.302925109863, 90
 i = i + 1
 lookouts["x"][i], lookouts["y"][i], lookouts["z"][i], lookouts["r"][i] = -1521.4138183594, 676.62213134766, 139.02362060547, 270
 i = i + 1
 lookouts["x"][i], lookouts["y"][i], lookouts["z"][i], lookouts["r"][i] = -2624.8615722656, -230.37841796875, 18.277492523193, 180
-- i = i + 1
-- lookouts["x"][i], lookouts["y"][i], lookouts["z"][i], lookouts["r"][i] = -2079.9479980469, 1060.4010009766, 65.319007873535, 0
 i = i + 1
 lookouts["x"][i], lookouts["y"][i], lookouts["z"][i], lookouts["r"][i] = -2228.5498046875, -1744.6362304688, 480.63589477539, 90

local lookoutObjects = {}
local lookOutMarker = {}
local lookOutMarkerID = {}
local nextLookout = nil
 
for key, index in pairs ( lookouts["x"] ) do
	local x, y, z, r = lookouts["x"][key], lookouts["y"][key], lookouts["z"][key], lookouts["r"][key]
	lookoutObjects[key] = createObject ( lookouts["model"], x, y, z, 0, 0, r )
	x, y = getPointFromDistanceRotation ( x, y, dist, lookoutMarkerRot + r )
	lookOutMarker[key] = createMarker ( x, y, z - lookoutMarkerZDist, "cylinder", 1, 255, 0, 0, 150 )
	lookOutMarkerID[lookOutMarker[key]] = key
	addEventHandler ( "onClientMarkerHit", lookOutMarker[key], function ( hit )
		if hit == lp then
			nextLookout = lookOutMarkerID[source]
			infobox ( "\n\nDrücke \"E\", um\ndas Fernglas zu\nbenutzen.", 7500, 200, 200, 200 )
		end
	end )
end


function useViewPoint ()
	if not nextLookout then return false end
	local nextl = nextLookout
	local lookout = lookOutMarker[nextl]
	if isElement ( lookout ) then
		local dx1, dy1, dz1 = getElementPosition ( lookout )
		local dx2, dy2, dz2 = getElementPosition ( lp )
		if getDistanceBetweenPoints3D ( dx1, dy1, dz1, dx2, dy2, dz2 ) <= 5 then
			triggerServerEvent ( "lookoutFound", lp, nextl )
			
			local x, y, z = getElementPosition ( lookoutObjects[nextl] )
			local rx, ry, rz = getElementRotation ( lookoutObjects[nextl] )
			
			local x1, y1 = getPointFromDistanceRotation ( x, y, lookDistance, rz )
			local x2, y2 = getPointFromDistanceRotation ( x1, y1, 50, rz )
			
			if not viewingNow then
				lookoutImage ( true )
				bindKey ( "enter_exit", "down", hideMarker )
			end
			
			setElementAlpha ( lookout, 0 )
			
			setCameraMatrix ( x1, y1, z, x2, y2, z )
		end
	end
end
bindKey ( "e", "down", useViewPoint )


function hideMarker ()
	lookoutImage ( false )
end


function lookoutImage ( show )

	local path = "images/lookout.png"
	local bPath = "images/colors/c_black.jpg"
	
	if show then
		infobox ( "\n\nDrücke Enter, um\ndas Fernglass zu\nverlassen.", 7500, 200, 200, 200 )
		
		viewingNow = true
		gImage["lookout1"] = guiCreateStaticImage ( lookoutIMGX, lookoutIMGY, lookoutIMGWidth, lookoutIMGHeight, path, false, nil )
		
		-- Oben --
		gImage["lookout2"] = guiCreateStaticImage ( 0, 0, screenwidth, lookoutIMGY, bPath, false, nil )
		-- Unten --
		gImage["lookout3"] = guiCreateStaticImage ( 0, lookoutIMGY + lookoutIMGHeight - 1, screenwidth, lookoutIMGY + 1, bPath, false, nil )
		-- Links --
		gImage["lookout4"] = guiCreateStaticImage ( 0, lookoutIMGY, lookoutIMGX, screenwidth, bPath, false, nil )
		-- Rechts --
		gImage["lookout5"] = guiCreateStaticImage ( lookoutIMGX + lookoutIMGWidth, lookoutIMGY, lookoutIMGX, screenwidth, bPath, false, nil )
	else
		unbindKey ( "enter_exit", "down", lookoutImage, false )
		viewingNow = false
		for i = 1, 5 do
			destroyElement ( gImage["lookout"..i] )
		end
		setCameraTarget ( lp, lp )
	end
end


function hideLookoutMarkers_func ( dataString )
	for i = 1, 10 do
		local tok = tonumber ( gettok ( dataString, i, string.byte ( '|' ) ) )
		if tok == 1 then
			setElementAlpha ( lookOutMarker[i], 0 )
		end
	end
end
addEvent ( "hideLookoutMarkers", true )
addEventHandler ( "hideLookoutMarkers", getRootElement(), hideLookoutMarkers_func )