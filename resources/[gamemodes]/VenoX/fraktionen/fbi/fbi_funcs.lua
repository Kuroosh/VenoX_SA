FBIDutyIcon = createPickup ( 1002.11277, -11.77045, 248.5625, 3, 1239, 50 )
FBIDutyIcon2 = createPickup ( -2446.488769, 518.59045, 30.22632, 3, 1239, 50 )
setElementInterior ( FBIDutyIcon, 10 )

function FBIDutyIconHit ( player )

	outputChatBox ( "Tippe /duty [1-4] oder /swat, um in den Dienst zu gehen!", player, 125, 0, 0 )
	triggerClientEvent ( player, "fbi_window_client", getRootElement())
end
addEventHandler ( "onPickupHit", FBIDutyIcon, FBIDutyIconHit )
addEventHandler ( "onPickupHit", FBIDutyIcon2, FBIDutyIconHit )


function sendMSGToBoxville ( msg )

	if getVehicleOccupant ( FederalBoxville, 0 ) then
		outputChatBox ( msg, getVehicleOccupant ( FederalBoxville, 0 ), 200, 200, 0 )
	elseif getVehicleOccupant ( FederalBoxville, 1 ) then
		outputChatBox ( msg, getVehicleOccupant ( FederalBoxville, 1 ), 200, 200, 0 )
	elseif getVehicleOccupant ( FederalBoxville, 2 ) then
		outputChatBox ( msg, getVehicleOccupant ( FederalBoxville, 2 ), 200, 200, 0 )
	elseif getVehicleOccupant ( FederalBoxville, 3 ) then
		outputChatBox ( msg, getVehicleOccupant ( FederalBoxville, 3 ), 200, 200, 0 )
	end
end

function ram_func ( player )

	if isOnDuty(player) and vnxGetElementData ( player, "rang" ) >= 3 then
		local house = vnxGetElementData ( player, "house" )
		local px, py, pz = getElementPosition ( player )
		local hx, hy, hz = getElementPosition ( house )
		if getDistanceBetweenPoints3D ( px, py, pz, hx, hy, hz ) <= 5 then
			if ( getElementModel ( house ) == 1273 or getElementModel ( house ) == 1272 ) and vnxGetElementData ( house, "curint" ) > 0 then
				local i = vnxGetElementData ( house, "curint" )
				vnxSetElementData ( player, "curIntIn", i )
				local int, intx, inty, intz = getInteriorData ( i )
				local dim = vnxGetElementData ( house, "id" )
				if i == 0 then
					dim = 0
				end
				setElementDimension ( player, dim )
				fadeElementInterior ( player, int, intx, inty, intz )
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Tippe /out, um\ndas Haus zu\nverlassen und\ndruecke F2, um\ndas Hausmenue zu\noeffnen.", 7500, 125, 0, 0 )
				bindKey ( player, "F2", "down", house_func )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist bei\nkeinem Haus!", 7500, 125, 0, 0 )
		end
	else
		outputChatBox ( "Diese Funktion steht dir erst ab Rang 3 zur Verfuegung.", player, 125, 0, 0 )
	end
end
addCommandHandler ( "ram", ram_func )

function killawanze_func ( player, _, wich )

	if isFBI(player) and vnxGetElementData ( player, "rang" ) >= 2 then
		
		wich = tonumber(wich)
		local bool = false
	
		if wich == 1 and isElement( _G["Wanze"..wich] ) then
		
			killWanze ( wich )
			bool = true
		
		end
		
		if wich == 2 and isElement( _G["Wanze"..wich] ) then
		
			killWanze ( wich )
			bool = true
		
		end
		
		if wich == 3 and isElement( _G["Wanze"..wich] ) then
		
			killWanze ( wich )
			bool = true
		
		end
		
		if bool == false then
		
			outputChatBox ( "Keine Wanze mit dieser Nummer.", player, 125, 0, 0 )
		
		end
	
	end
	
end

addCommandHandler ( "killwanze", killawanze_func )

function refreshBlipsForBoxville ( veh )

	if veh == FederalBoxville then
		for i = 1, 3 do
			if _G["Wanze"..i.."Blip"] then
				setElementVisibleTo ( _G["Wanze"..i.."Blip"], getRootElement(), false )
			end
		end
		if getVehicleOccupant ( FederalBoxville, 0 ) then
			for i = 1, 3 do
				if _G["Wanze"..i.."Blip"] then
					setElementVisibleTo ( _G["Wanze"..i.."Blip"], getVehicleOccupant ( FederalBoxville, 0 ), true )
				end
			end
		elseif getVehicleOccupant ( FederalBoxville, 1 ) then
			for i = 1, 3 do
				if _G["Wanze"..i.."Blip"] then
					setElementVisibleTo ( _G["Wanze"..i.."Blip"], getVehicleOccupant ( FederalBoxville, 1 ), true )
				end
			end
		elseif getVehicleOccupant ( FederalBoxville, 2 ) then
			for i = 1, 3 do
				if _G["Wanze"..i.."Blip"] then
					setElementVisibleTo ( _G["Wanze"..i.."Blip"], getVehicleOccupant ( FederalBoxville, 2 ), true )
				end
			end
		elseif getVehicleOccupant ( FederalBoxville, 3 ) then
			for i = 1, 3 do
				if _G["Wanze"..i.."Blip"] then
					setElementVisibleTo ( _G["Wanze"..i.."Blip"], getVehicleOccupant ( FederalBoxville, 3 ), true )
				end
			end
		end
	end
end



function refreshBlipsForBoxvilleExit ( veh )

	if veh == FederalBoxville then
		for i = 1, 3 do
			if _G["Wanze"..i.."Blip"] then
				setElementVisibleTo ( _G["Wanze"..i.."Blip"], source, false )
			end
		end
	end
end

addEventHandler ( "onResourceStart", resourceRoot, function()
	addEventHandler ( "onPlayerVehicleEnter", FederalBoxville, refreshBlipsForBoxville )
	addEventHandler ( "onPlayerVehicleExit", FederalBoxville, refreshBlipsForBoxvilleExit )
end )

function wanze_func ( player )

	if isFBI ( player ) then
		outputChatBox ( "Wanze bereit - klicke auf eine Gegenstand oder ein Fahrzeug in deiner Naehe!", player, 0, 125, 0 )
		vnxSetElementData ( player, "wanzen", true )
	else
		outputChatBox ( "Du bist kein Agent des FBI!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "wanze", wanze_func )

function createWanze ( player, clickedElement, x, y, z )

	if not x then
		x, y, z = getElementPosition ( clickedElement )
	end
	local px, py, pz = getElementPosition ( player )
	if getDistanceBetweenPoints3D ( px, py, pz, x, y, z ) < 5 then
		if vnxGetElementData ( player, "rang" ) >= 2 then
			if wanzen <= 2 then
				local c
				for i = 1, 3 do
				
					if not _G["Wanze"..i] then
						c = i
						break
					end
					
				end
				
				if not clickedElement then
					outputChatBox ( "Wanze platziert!", player, 0, 125, 0 )
					vnxSetElementData ( player, "wanzen", false )
					showCursor ( player, false )
					setElementClicked ( player, false )
					_G["Wanze"..c] = createObject ( 1317, x, y, z )
					setTimer ( killWanze, 60*60*1000, 1, c )
					_G["Wanze"..c.."Blip"] = createBlip ( x, y, z, 0, 2, 255, 0, 0, 255, 0, wanzenrange, nil )
					wanzen = wanzen + 1
					setElementAlpha ( _G["Wanze"..c], 0 )
				elseif getElementType ( clickedElement ) == "vehicle" then
					outputChatBox ( "Wanze an Fahrzeug platziert!", player, 0, 125, 0 )
					vnxSetElementData ( player, "wanzen", false )
					showCursor ( player, false )
					setElementClicked ( player, false )
					_G["Wanze"..c] = createObject ( 1317, x, y, z )
					setTimer ( killWanze, 60*60*1000, 1, c )
					_G["Wanze"..c.."Blip"] = createBlip ( x, y, z, 0, 2, 255, 0, 0, 255, 0, wanzenrange, nil )
					attachElements ( _G["Wanze"..c], clickedElement )
					attachElements ( _G["Wanze"..c.."Blip"], _G["Wanze"..c] )
					wanzen = wanzen + 1
					setElementAlpha ( _G["Wanze"..c], 0 )
				end
				refreshBlipsForBoxville ( FederalBoxville )
			else
				outputChatBox ( "Es sind bereits zu viele Wanzen platziert worden!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du bist nicht befugt!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Du bist zu weit weg!", player, 125, 0, 0)
	end
	vnxSetElementData ( player, "wanzen", false )
end

function killWanze ( count )

	destroyElement ( _G["Wanze"..count] )
	destroyElement ( _G["Wanze"..count.."Blip"] )
	sendMSGForFaction ( "Wanze Nr. "..count.." hat sich verabschiedet!", 6, 125, 0, 0 )
	refreshBlipsForBoxville ( veh )
	wanzen = wanzen - 1
	_G["Wanze"..count] = false
end