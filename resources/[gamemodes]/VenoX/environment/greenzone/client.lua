local greenzones = { 
	[1] = { x = -2016.5999755859, y = 78.300003051758, width = 102.5, height = 160.1 },
	[2] = { x = -225.88, y = 1228.25, width = 80, height = -50 }
}
local colCuboids = {}

addEventHandler ("onClientResourceStart", resourceRoot, function()
	for i=1, #greenzones do
		createRadarArea ( greenzones[i].x, greenzones[i].y, greenzones[i].width, greenzones[i].height, 0, 218, 255, 127, localPlayer )
		colCuboids[i] = createColCuboid ( greenzones[i].x, greenzones[i].y, -50, greenzones[i].width, greenzones[i].height, 7500)
		setElementID (colCuboids[i], "greenzoneColshape")
		addEventHandler ( "onClientColShapeHit", colCuboids[i], startGreenZone )
		addEventHandler ( "onClientColShapeLeave", colCuboids[i], stopGreenZone )
	end
end )


local screenX, screenY = guiGetScreenSize()
local sx, sy = screenX/1366, screenY/768
local dxfont0_drugs = dxCreateFont(":VenoX/fonts/drugs.ttf", 10)
function DrawNodmImage ()
	-- OLD : dxDrawImage ( screenWidth*0.79, screenHeight*0.35, screenWidth*0.2, screenHeight*0.07, "images/nodm.png")

	dxDrawLine(sx*1058 - 1, sy*266 - 1, sx*1058 - 1, sy*326, tocolor(0, 150, 200, 145), 1, false)
	dxDrawLine(sx*1356, sy*266 - 1, sx*1058 - 1, sy*266 - 1, tocolor(0, 150, 200, 145), 1, false)
	dxDrawLine(sx*1058 - 1, sy*326, sx*1356, sy*326, tocolor(0, 150, 200, 145), 1, false)
	dxDrawLine(sx*1356, sy*326, sx*1356, sy*266 - 1, tocolor(0, 150, 200, 145), 1, false)
	dxDrawRectangle(sx*1058, sy*266, sx*298, sy*60, tocolor(0, 0, 0, 145), false)
	dxDrawImage(sx*1054, sy*270, sx*68, sy*60, "anzeigen/cpickup/images/vnxicon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawText("No - Deathmatch Zone ", sx*1130, sy*276, sx*1352, sy*315, tocolor(255, 255, 255, 255), 1.00, dxfont0_drugs, "center", "top", false, false, false, false, false)
	dxDrawText("No - Deathmatch Zone ", sx*1130, sy*276, sx*1352, sy*315, tocolor(255, 255, 255, 255), 1.00, dxfont0_drugs, "center", "top", false, false, false, false, false)
	dxDrawText("No - Deathmatch Zone ", sx*1130, sy*276, sx*1352, sy*315, tocolor(255, 255, 255, 255), 1.00, dxfont0_drugs, "center", "top", false, false, false, false, false)
	dxDrawText("Jegliches Deathmatch ist Verboten ! \n(Ausnahme : Staatsfraktionen )", sx*1130, sy*297, sx*1352, sy*336, tocolor(255, 255, 255, 255), 0.80, "default-bold", "center", "top", false, false, false, false, false)
	dxDrawImage(sx*1326, sy*276, sx*30, sy*32, "images/no.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(sx*1126, sy*276, sx*30, sy*32, "images/no.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawRectangle(sx*1115, sy*266, sx*3, sy*60, tocolor(0, 150, 200, 145), false)
end

function startGreenZone (hitElement, matchingDimension)
	if hitElement == localPlayer and matchingDimension then
		addEventHandler("onClientRender", root, DrawNodmImage)
		vnxClientSetElementData ( "nodmzone", 1 )
		--toggleControl ("fire", true)
		--toggleControl ("next_weapon", true)
		--toggleControl ("prevnxus_weapon", true)
		--toggleControl ("aim_weapon", true)
		--toggleControl ("vehicle_fire", true)
		setPedDoingGangDriveby ( hitElement, false )
		setPedWeaponSlot( hitElement, 0 )
	end
end

function stopGreenZone (leaveElement, matchingDimension)
	if leaveElement == localPlayer and matchingDimension then
		removeEventHandler("onClientRender", root, DrawNodmImage) 
		vnxClientSetElementData ( "nodmzone", 0 )
		--toggleControl ("fire", true)
		--toggleControl ("next_weapon", true)
		--toggleControl ("prevnxus_weapon", true)
		--toggleControl ("aim_weapon", true)
		--toggleControl ("vehicle_fire", true)
	end
end

addEventHandler ( "onClientPlayerSpawn", localPlayer, function ( )
	for i=1, #colCuboids do
		if isElementWithinColShape ( source, colCuboids[i] ) then
			startGreenZone ( source, true )
		end
	end
end )


addEventHandler ( "onClientPlayerVehicleExit", localPlayer, function ( )
	setPedWeaponSlot ( localPlayer, 0 )
end )