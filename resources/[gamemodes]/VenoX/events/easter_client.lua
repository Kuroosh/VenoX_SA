gEasterButton = {}

function showEasterMenue ()

	if not getElementClicked () then
		showCursor ( true )
		setElementClicked ( true )
		
		gWindow["easterMenue"] = guiCreateWindow(screenwidth/2-318/2,screenheight/2-321/2,318,321,"Ostermenue",false)
		guiSetAlpha(gWindow["easterMenue"],1)
		gImage["easterImg"] = guiCreateStaticImage(15,30,50,50,"images/inventory/easteregg.bmp",false,gWindow["easterMenue"])
		guiSetAlpha(gImage["easterImg"],1)
		gLabel["easterEggAmount"] = guiCreateLabel(0,33,49,16,vnxClientGetElementData ( "easterEggs" ).." Stk.",false,gImage["easterImg"])
		guiSetAlpha(gLabel["easterEggAmount"],1)
		guiLabelSetColor(gLabel["easterEggAmount"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["easterEggAmount"],"top")
		guiLabelSetHorizontalAlign(gLabel["easterEggAmount"],"left",false)
		guiSetFont(gLabel["easterEggAmount"],"default-bold-small")

		gLabel[2] = guiCreateLabel(71,32,239,44,"In diesem Menue kannst du deine gesam-\nmelten Ostereier einloesen, um Boni zu\nerwerben.",false,gWindow["easterMenue"])
		guiSetAlpha(gLabel[2],1)
		guiLabelSetColor(gLabel[2],0,200,0)
		guiLabelSetVerticalAlign(gLabel[2],"top")
		guiLabelSetHorizontalAlign(gLabel[2],"left",false)
		guiSetFont(gLabel[2],"default-bold-small")
		
		gLabel[3] = guiCreateLabel(10,89,80,17,"Fahrzeuge:",false,gWindow["easterMenue"])
		guiSetAlpha(gLabel[3],1)
		guiLabelSetColor(gLabel[3],200,200,0)
		guiLabelSetVerticalAlign(gLabel[3],"top")
		guiLabelSetHorizontalAlign(gLabel[3],"left",false)
		guiSetFont(gLabel[3],"default-bold-small")
		gLabel[5] = guiCreateLabel(10,186,73,16,"Sonstiges:",false,gWindow["easterMenue"])
		guiSetAlpha(gLabel[5],1)
		guiLabelSetColor(gLabel[5],200,200,0)
		guiLabelSetVerticalAlign(gLabel[5],"top")
		guiLabelSetHorizontalAlign(gLabel[5],"left",false)
		guiSetFont(gLabel[5],"default-bold-small")
		gLabel[6] = guiCreateLabel(10,241,292,31,"Ausserdem kannst du fuer 10.000 Eier ein Haus be-\nantragen.",false,gWindow["easterMenue"])
		guiSetAlpha(gLabel[6],1)
		guiLabelSetColor(gLabel[6],255,255,255)
		guiLabelSetVerticalAlign(gLabel[6],"top")
		guiLabelSetHorizontalAlign(gLabel[6],"left",false)
		guiSetFont(gLabel[6],"default-bold-small")
		
		gEasterButton[1] = guiCreateButton(10,106,77,36,"Tourismo",false,gWindow["easterMenue"])
		guiSetAlpha(gEasterButton[1],1)
		guiSetFont(gEasterButton[1],"default-bold-small")
		drawEggCostOnButton ( gEasterButton[1], 1250 )
		addEventHandler ( "onClientGUIClick", gEasterButton[1],
			function ()
				closeEasterMenue ()
				triggerServerEvent ( "buyEasterBonus", lp, "tourismo" )
			end,
		false )
		gEasterButton[2] = guiCreateButton(90,106,77,36,"ZR-350",false,gWindow["easterMenue"])
		guiSetAlpha(gEasterButton[2],1)
		guiSetFont(gEasterButton[2],"default-bold-small")
		drawEggCostOnButton ( gEasterButton[2], 1000 )
		addEventHandler ( "onClientGUIClick", gEasterButton[2],
			function ()
				closeEasterMenue ()
				triggerServerEvent ( "buyEasterBonus", lp, "zr-350" )
			end,
		false )
		gEasterButton[3] = guiCreateButton(90,146,77,36,"Rustler",false,gWindow["easterMenue"])
		guiSetAlpha(gEasterButton[3],1)
		guiSetFont(gEasterButton[3],"default-bold-small")
		drawEggCostOnButton ( gEasterButton[3], 1500 )
		addEventHandler ( "onClientGUIClick", gEasterButton[3],
			function ()
				closeEasterMenue ()
				triggerServerEvent ( "buyEasterBonus", lp, "rustler" )
			end,
		false )
		gEasterButton[4] = guiCreateButton(10,146,77,36,"Sandking",false,gWindow["easterMenue"])
		guiSetAlpha(gEasterButton[4],1)
		guiSetFont(gEasterButton[4],"default-bold-small")
		drawEggCostOnButton ( gEasterButton[4], 2000 )
		addEventHandler ( "onClientGUIClick", gEasterButton[4],
			function ()
				closeEasterMenue ()
				triggerServerEvent ( "buyEasterBonus", lp, "sandking" )
			end,
		false )
		gEasterButton[5] = guiCreateButton(172,126,77,36,"Hotring",false,gWindow["easterMenue"])
		guiSetAlpha(gEasterButton[5],1)
		guiSetFont(gEasterButton[5],"default-bold-small")
		drawEggCostOnButton ( gEasterButton[5], 2500 )
		addEventHandler ( "onClientGUIClick", gEasterButton[5],
			function ()
				closeEasterMenue ()
				triggerServerEvent ( "buyEasterBonus", lp, "hotring" )
			end,
		false )
		gEasterButton[6] = guiCreateButton(10,203,77,36,"10.000 $",false,gWindow["easterMenue"])
		guiSetAlpha(gEasterButton[6],1)
		guiSetFont(gEasterButton[6],"default-bold-small")
		drawEggCostOnButton ( gEasterButton[6], 100 )
		addEventHandler ( "onClientGUIClick", gEasterButton[6],
			function ()
				closeEasterMenue ()
				triggerServerEvent ( "buyEasterBonus", lp, "$" )
			end,
		false )
		gEasterButton[7] = guiCreateButton(90,203,77,36,"\"Osterhase\"",false,gWindow["easterMenue"])
		guiSetAlpha(gEasterButton[7],1)
		guiSetFont(gEasterButton[7],"default-bold-small")
		drawEggCostOnButton ( gEasterButton[7], 50 )
		addEventHandler ( "onClientGUIClick", gEasterButton[7],
			function ()
				closeEasterMenue ()
				triggerServerEvent ( "buyEasterBonus", lp, "social" )
			end,
		false )
		gEasterButton[8] = guiCreateButton(172,203,77,36,"Schoko-Ei",false,gWindow["easterMenue"])
		guiSetAlpha(gEasterButton[8],1)
		guiSetFont(gEasterButton[8],"default-bold-small")
		drawEggCostOnButton ( gEasterButton[8], 3 )
		addEventHandler ( "onClientGUIClick", gEasterButton[8],
			function ()
				closeEasterMenue ()
				triggerServerEvent ( "buyEasterBonus", lp, "egg" )
			end,
		false )
		
		gEasterButton[9] = guiCreateButton(110,276,77,36,"Schliessen",false,gWindow["easterMenue"])
		guiSetAlpha(gEasterButton[9],1)
		guiSetFont(gEasterButton[9],"default-bold-small")
		addEventHandler ( "onClientGUIClick", gEasterButton[9],
			function ()
				closeEasterMenue ()
			end,
		false )
	end
end
--addCommandHandler ( "easter", showEasterMenue )

function closeEasterMenue ()

	showCursor ( false )
	setElementClicked ( false )
	destroyElement ( gWindow["easterMenue"] )
end

function drawEggCostOnButton ( button, amount )

	local label = guiCreateLabel(2,22,74,14,amount.." Stk.",false,button)
	guiSetAlpha(button,1)
	guiLabelSetColor(button,255,0,255)
	guiLabelSetVerticalAlign(button,center)
	guiLabelSetHorizontalAlign(button,center,false)
	guiSetFont(button,"default-bold-small")
end

--------------- Streamer -----------------

streamedInEasterEggs = {}
function easterEggStreamIn ()
	if getElementModel ( source ) == 2999 then
		streamedInEasterEggs[source] = true
		setElementAlpha ( source, 0 )
	end
end
addEventHandler( "onClientElementStreamIn", getRootElement(), easterEggStreamIn )
function easterEggStreamOut ()

	if getElementModel ( source ) == 2999 then
		streamedInEasterEggs[source] = source
	end
end
addEventHandler ( "onClientElementStreamOut", getRootElement(), easterEggStreamOut )

addEventHandler ( "onClientRender", getRootElement(),
	function ()
		local pX, pY, pZ = getElementPosition ( lp )
		for key, index in pairs ( streamedInEasterEggs ) do
			if not isElement ( key ) then
				streamedInEasterEggs[key] = false
			else
				local x, y, z = getElementPosition ( key )
				--if isLineOfSightClear ( pX, pY, pZ, x, y, z, true, true, true, true, true, false, true, lp, key ) then
					local sx, sy = getScreenFromWorldPosition ( x, y, z, 1000, true )
					if sx and sy then
						local d = getDistanceBetweenPoints3D ( x, y, z, pX, pY, pZ )
						if d <= 15 then
							local width, height = 15 / d / 15 * 55, 15 / d / 15 * 89
							dxDrawImage ( sx-(width/2), sy-(height/2), width*6, height*6, "images/kuerbiss.png", 0, 0, 0 )
						end
					end
				--end
			end
		end
	end
)