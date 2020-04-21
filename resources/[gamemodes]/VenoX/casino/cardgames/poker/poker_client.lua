pokerMarker = {}

local pokerMarkerData = {}
local pokerCards = {}
pokerChips = {}
pokerDekorationObjects = {}

function pokerEnterMarkerHit ( hit, dim )

	if hit == lp and dim and not getElementClicked ( ) then
		showPokerGameSelectionWindow ()
		showCursor ( true )
		setElementClicked ( true )
	end
end

for key, index in pairs ( pokerEnterPlaces["x"] ) do
	local x, y, z = pokerEnterPlaces["x"][key], pokerEnterPlaces["y"][key], pokerEnterPlaces["z"][key]
	local sx, sy, sz, sr = pokerEnterPlaces["sx"][key], pokerEnterPlaces["sy"][key], pokerEnterPlaces["sz"][key], pokerEnterPlaces["sr"][key]
	local int, dim, size = pokerEnterPlaces["int"][key], pokerEnterPlaces["sint"][key], pokerEnterPlaces["size"][key]
	local sint, sdim = pokerEnterPlaces["sint"][key], pokerEnterPlaces["sdim"][key]
	pokerMarker[key] = createMarker ( x, y, z, "cylinder", size, 125, 0, 0, 125, getRootElement() )
	addEventHandler ( "onClientMarkerHit", marker, pokerEnterMarkerHit )
	pokerMarkerData[marker] = {}
		pokerMarkerData[marker]["x"], pokerMarkerData[marker]["y"], pokerMarkerData[marker]["z"] = sx, sy, sz
		pokerMarkerData[marker]["r"], pokerMarkerData[marker]["int"], pokerMarkerData[marker]["dim"] = sr, sint, sdim
end

function joinPokerTable_func ( dim )

	setPokerCamera ()
	createPokerDecoration ( dim )
end
addEvent ( "joinPokerTable", true )
addEventHandler ( "joinPokerTable", getRootElement(), joinPokerTable_func )

function leavePokerTable_func ()

	for key, index in pairs ( pokerDekorationObjects ) do
		destroyElement ( key )
	end
	destroyAllPokerChips ()
end

function createPokerDecoration ( dim )

	for key, index in pairs ( pokerDekoration["id"] ) do
		local int = pokerDekoration["int"][key]
		local model = pokerDekoration["id"][key]
		local x, y, z, r = pokerDekoration["x"][key], pokerDekoration["y"][key], pokerDekoration["z"][key], pokerDekoration["r"][key]
		local object = createObject ( model, x, y, z, 0, 0, r )
		setElementInterior ( object, int )
		setElementDimension ( object, dim )
		pokerDekorationObjects[object] = true
	end
end

function setPokerCamera ()

	local x, y, z = pokerChipPositions["x"][0], pokerChipPositions["y"][0], pokerChipZPosition
	local tx, ty = pokerChipPositions["x"][0], pokerChipPositions["y"][0]
	setCameraMatrix ( x, y, pokerCamAddHight + z, tx, ty, z )
end

function recievePokerChipData_func ( pos, amount, blind, inState )

	destroyAllPokerChips ()
	pokerChips = {}
	
	local x, y, z, stack
	
	x, y, z = pokerChipPositions["x"][pos], pokerChipPositions["y"][pos], pokerChipZPosition
	drawChipsStacks ( x, y, z, amount, true, ( blind == "bb" ), ( blind == "sb" ), inState )
end
addEvent ( "recievePokerChipData", true )
addEventHandler ( "recievePokerChipData", getRootElement(), recievePokerChipData_func )

function setHandCards_func ( card1, card2 )

	pokerCards = {}
	pokerCards[1] = card1
	pokerCards[2] = card2
	showHandCardWindow ( 0, 0 )
	setTimer ( showHandCardWindow, 1000, 1, card1, 0 )
	setTimer ( showHandCardWindow, 2000, 1, card1, card2 )
end
addEvent ( "setHandCards", true )
addEventHandler ( "setHandCards", getRootElement(), setHandCards_func )

function destroyAllPokerChips ()

	hideAllChips ()
end

function showPlayerActionWindow_func ( curBet, minBet, ownMoney )

	showPokerActionMenue_func ( curBet, minBet, ( minBet - curBet ) < ownMoney )
end
addEvent ( "showPlayerActionWindow", true )
addEventHandler ( "showPlayerActionWindow", getRootElement(), showPlayerActionWindow_func )

-- DEBUG --
function ptest ()

	setElementInterior ( lp, pokerDekoration["int"][1] )
	setElementDimension ( lp, 1 )
	createPokerDecoration ( 1 )
	joinPokerTable_func ( 1 )
	
	for i = 1, 7 do
		local x, y, z, int = pokerPlayerPositions["x"][i], pokerPlayerPositions["y"][i], pokerPlayerPositions["z"][i], pokerPlayerPositions["int"][i]
		local rot = findRotation ( x, y, pokerChipPositions["x"][0], pokerChipPositions["y"][0] )
		ped = createPed ( math.random ( 10, 250 ), x, y, z, rot )
		setElementInterior ( ped, int )
		setElementDimension ( ped, 1 )
		
		setTimer ( setPedRotation, 1000, 1, ped, rot )
		if math.random ( 1, 2 ) == 1 then
			setTimer ( setPedAnimation, 1000, 1, ped, "FOOD", "FF_Sit_Loop", 0, false, false, true )
		else
			setTimer ( setPedAnimation, 1000, 1, ped, "ped", "SEAT_idle", 0, false, false, true )
		end
	end
end
--addCommandHandler ( "ptest", ptest )
-- DEBUG --