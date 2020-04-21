addDist = {}
 addDist[3461] = 1
 addDist[1946] = 0.22
 addDist[1598] = 0.3
 addDist[1481] = 0.5
 addDist[1255] = 0.3
 addDist[13593] = 0.35
 addDist[2984] = 1.1
 addDist[2103] = 0

radioURL = ""

function placeRadio ()

	showCursor ( true )
	setElementClicked ( true )
	
	gWindow["radioChannelSelection"] = guiCreateWindow(screenwidth/2-265/2,screenheight/2-178/2,265,178,"Radiosender",false)
	guiSetAlpha(gWindow["radioChannelSelection"],1)
	
	gGrid["radioChannelSelection"] = guiCreateGridList(9,25,122,144,false,gWindow["radioChannelSelection"])
	guiGridListSetSelectionMode(gGrid["radioChannelSelection"],2)
	gColumn["radioSender"] = guiGridListAddColumn(gGrid["radioChannelSelection"],"Sender",0.8)
	guiSetAlpha(gGrid["radioChannelSelection"],1)
	
	gLabel[1] = guiCreateLabel(142,23,119,61,"Hier kannst du einen\nRadiosender aus-\nwählen, den das\nRadio spielen soll.",false,gWindow["radioChannelSelection"])
	guiSetAlpha(gLabel[1],1)
	guiLabelSetColor(gLabel[1],200,200,0)
	guiLabelSetVerticalAlign(gLabel[1],"top")
	guiLabelSetHorizontalAlign(gLabel[1],"left",false)
	guiSetFont(gLabel[1],"default-bold-small")
	
	gButton["selectRadio"] = guiCreateButton(159,85,67,36,"Auswählen",false,gWindow["radioChannelSelection"])
	guiSetAlpha(gButton["selectRadio"],1)
	guiSetFont(gButton["selectRadio"],"default-bold-small")
	gButton["cancelRadio"] = guiCreateButton(159,131,67,36,"Keine\nMusik",false,gWindow["radioChannelSelection"])
	guiSetAlpha(gButton["cancelRadio"],1)
	guiSetFont(gButton["cancelRadio"],"default-bold-small")
	
	guiGridListClear ( gGrid["radioChannelSelection"] )
	local channels = getCustomRadioChannels ()
	local row
	for key, index in pairs ( channels ) do
		row = guiGridListAddRow ( gGrid["radioChannelSelection"] )
		guiGridListSetItemText ( gGrid["radioChannelSelection"], row, gColumn["radioSender"], key, false, false )
	end
	
	addEventHandler ( "onClientGUIClick", gButton["selectRadio"],
		function ()
			local name = guiGridListGetItemText ( gGrid["radioChannelSelection"], guiGridListGetSelectedItem ( gGrid["radioChannelSelection"] ), 1 )
			if checkIfCustomRadioChannelExists ( name ) then
				radioURL = getCustomRadioChannelURL ( name )
				destroyElement ( gWindow["radioChannelSelection"] )
				startObjectDrop ()
			end
		end
	)
	addEventHandler ( "onClientGUIClick", gButton["cancelRadio"],
		function ()
			radioURL = ""
			destroyElement ( gWindow["radioChannelSelection"] )
			startObjectDrop ()
		end
	)
end

function startObjectDrop ()

	showCursor ( true )
	
	-- Camera --
	local px, py, pz = getPedBonePosition ( lp, 6 )
	bool, placeCamX, placeCamY, placeCamZ, hit = processLineOfSight ( px, py, pz, px, py, pz + 5, true, true, false )
	if bool == false then
		placeCamX, placeCamY, placeCamZ = px, py, pz + 5
	else
		placeCamZ = placeCamZ - 0.1
	end
	setCameraMatrix ( placeCamX, placeCamY, placeCamZ, px, py, pz )
	-- Camera --
	
	local model = vnxClientGetElementData ( "object" )
	if model == 2060 then
		dropObjekt = createSandbagStack ()
	else
		dropObjekt = createObject ( model, 0, 0, 0 )
	end
	if model == 841 or model == 842 then
		local fire = createObject ( 3461, 0, 0, -1.8 )
		attachElementsInCorrectWay ( fire, dropObjekt )
		setElementParent ( fire, dropObjekt )
	end
	massDistance = getElementDistanceFromCentreOfMassToBaseOfModel ( dropObjekt )
	setElementCollisionsEnabled ( dropObjekt, false )
	addEventHandler ( "onClientRender", getRootElement(), refreshObjectPosition )
	addEventHandler ( "onClientClick", getRootElement(), finishObjectPos )
end

function finishObjectPos ( btn, state )
	if state == "down" then
		if isElement ( dropObjekt ) then
			removeEventHandler ( "onClientRender", getRootElement(), refreshObjectPosition )
			removeEventHandler ( "onClientClick", getRootElement(), finishObjectPos )
			
			addEventHandler ( "onClientRender", getRootElement(), refreshObjectRotation )
			setTimer ( finalObjectPlacement, 1000, 1 )
		end
	end
end

function finalObjectPlacement ()

	addEventHandler ( "onClientClick", getRootElement (), finishObject )
end

function finishObject ( btn, state )
	if state == "down" then
		if isElement ( dropObjekt ) then
			setCameraTarget ( lp )
			
			local x, y, z = getElementPosition ( dropObjekt )
			local rx, ry, rz = getElementRotation ( dropObjekt )
			
			local model = getElementModel ( dropObjekt )
			
			destroyElement ( dropObjekt )
			
			if model == 2060 or model == 1422 then
				placingBarricade = false
				if model == 1422 then
					triggerServerEvent ( "placeObject", lp, "barricade", x, y, z, rz )
				elseif model == 2060 then
					triggerServerEvent ( "placeObject", lp, "sandbag", x, y, z, rz )
				end
			else
				triggerServerEvent ( "finishObjectPlace", lp, x, y, z, rx, ry, rz, radioURL )
			end
			
			showCursor ( false )
			
			removeEventHandler ( "onClientRender", getRootElement(), refreshObjectRotation )
			removeEventHandler ( "onClientClick", getRootElement (), finishObject )
		end
	end
end

function refreshObjectPosition ()
	sx, sy, x, y, z = getCursorPosition ()
	local px, py, pz = placeCamX, placeCamY, placeCamZ
	bool, nx, ny, nz, hit = processLineOfSight ( px, py, pz, x, y, z, true, true, false )
	nz = nz + 3
	bool, nx, ny, nz, hit = processLineOfSight ( nx, ny, nz, x, y, z, true, true, false )
	nz = nz + 3
	bool, nx, ny, nz, hit = processLineOfSight ( nx, ny, nz, x, y, z, true, true, false )
	if not bool then
		nx, ny, nz = x, y, z
	end
	if addDist[getElementModel ( dropObjekt )] then
		nz = nz + addDist[getElementModel ( dropObjekt )]
	end
	setElementPosition ( dropObjekt, nx, ny, nz + massDistance )
end

function refreshObjectRotation ()

	local sx, sy, cx, cy, cz = getCursorPosition ()
	local x, y, z = getElementPosition ( dropObjekt )
	local rx, ry, rz = getElementRotation ( dropObjekt )
	rz = findRotation ( cx, cy, x, y )
	setElementRotation ( dropObjekt, rx, ry, rz )
end