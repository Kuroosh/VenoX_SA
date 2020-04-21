local robberHouses =
{
	{ -2617.080, -177.942, 4.3 };
	{ -2693.601, -186.189, 4.3 };
	{ -2796.733, -87.725, 7.1 };
	{ -2796.849, 24.034, 7.1 };
	{ -2796.951, 104.032, 7.1 };
	{ -2695.151, 76.611, 4.3 };
}

function unpackRobberHouses ()
	return unpack ( robberHouses [ math.random ( #robberHouses ) ] )
end

function resourceBootUp ()
	ourPed = createPed ( 1, -1843.677, -13.789, 15.1 )
	-- ourBlip = createBlipAttachedTo ( ourPed, 41 )
	  --setBlipVisibleDistance ( ourBlip, 300 )
	   setElementFrozen ( ourPed, true )
	    setElementRotation ( ourPed, 0, 0, 0 )
	     setElementInterior ( ourPed, 0 )
	      setElementDimension ( ourPed, 0 )
end
addEventHandler ( "onClientResourceStart", resourceRoot, resourceBootUp )


local robberWindow = guiCreateWindow ( 0.314, 0.2513, 0.3809, 0.3893, "Einbrecher Mini-Job", true )
local robberLabel = guiCreateLabel ( 0.0193, 0.0736, 0.9903, 0.1104, "Einbrecher Mini-Job", true, robberWindow )
guiLabelSetColor ( robberLabel, 255, 0, 0 )
guiLabelSetHorizontalAlign ( robberLabel, "center", false )
guiSetFont ( robberLabel, "default-bold-small" )
local robberInfoLabel = guiCreateLabel ( 0.0309, 0.2441, 0.944, 0.3077, "Breche fuer mich in Haueser ein, du bekommst pro Haus 100-500$! Um den Job zu Stoppen Tippe /stopjobrob", true, robberWindow )
local robberAcceptButton = guiCreateButton ( 0.3533 ,0.7993, 0.1409, 0.1204, "Los!", true, robberWindow )
local robberCloseButton = guiCreateButton ( 0.5309, 0.7993, 0.1409, 0.1204, "Nein Danke!", true, robberWindow )
guiSetVisible ( robberWindow, false )


function detectClickOnPed ( button, state, absX, absY, wx, wy, wz, element )
    if ( element and element == ourPed and not isPedInVehicle ( localPlayer ) ) then
		local x, y, z = getElementPosition ( localPlayer )
		 if ( getDistanceBetweenPoints3D ( x, y, z, wx, wy, wz ) <= 3 ) then
			guiSetVisible ( robberWindow, true )
		end
    end
end
addEventHandler ( "onClientClick", root, detectClickOnPed )


function buttonClick ( button )
    if ( button ~= "left" ) then 
		return
	end
    if ( source == robberCloseButton ) then
		guiSetVisible ( robberWindow, false )
		 showCursor ( false )
		 setElementClicked ( false )
    elseif ( source == robberAcceptButton ) then
             destroyElement ( robhouseMarker )
	       destroyElement ( robhouseBlip )
		triggerServerEvent ( "robberJobAccepted", localPlayer )
		 guiSetVisible ( robberWindow, false )
		  showCursor ( false )
		  setElementClicked ( false )
		   triggerEvent ( "createHouseEvent", localPlayer )
		   -- outputChatBox ( "You are now employed as a Robber!" )
		   outputChatBox(  "Um den Job zu beenden tippe: /stopjobrob" )
    end
end
addEventHandler ( "onClientGUIClick", resourceRoot, buttonClick )

addEvent ( "createHouseEvent", true )
function createHouses ()
	x, y, z = unpackRobberHouses ()
	 robhouseMarker = createMarker ( x, y, z, "cylinder", 3, 255, 51, 102, 85, localPlayer )
	  robhouseBlip = createBlipAttachedTo ( robhouseMarker, 32, localPlayer )
end
addEventHandler ( "createHouseEvent", root, createHouses )

addEventHandler ( "onClientMarkerHit", root,
    function ( hitElement )
        if ( source == robhouseMarker and not isPedInVehicle ( localPlayer ) and hitElement == localPlayer ) then
            triggerServerEvent ( "givePlayerPay", localPlayer )
	     destroyElement ( robhouseMarker )
	       destroyElement ( robhouseBlip )
	        triggerEvent ( "createHouseEvent", localPlayer )
	         playSound ( "files/cash.mp3", false )
        end
    end
)

addEventHandler ( "onClientPedDamage", resourceRoot,
	function ()
		cancelEvent ()
	end
)

function stopthejob(player)
destroyElement ( robhouseMarker )
destroyElement ( robhouseBlip )
outputChatBox("Job abgebrochen!", player)
end
addCommandHandler("stoprobjob", stopthejob)