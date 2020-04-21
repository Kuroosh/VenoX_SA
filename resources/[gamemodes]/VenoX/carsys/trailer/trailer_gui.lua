trailerMarker = createMarker ( -911.3271484375, -486.00863647461, 24.89, "cylinder", 3, 150, 0, 0, 150 )
createBlip ( -911.3271484375, -486.00863647461, 24.89, 55, 1, 0, 0, 0, 255, 0, 200 )

function showWohnwagenMenue ( hit, dim )

	if hit == lp and dim then
		if not getPedOccupiedVehicle ( lp ) then
			showCursor ( true )
			setElementClicked ( true )
			if gWindow["wohnwagen"] then
				guiSetVisible ( gWindow["wohnwagen"], true )
			else
				gWindow["wohnwagen"] = guiCreateWindow(screenwidth/2-307/2,screenheight/2-205/2,307,205,"Wohnwagen",false)
				guiWindowSetMovable ( gWindow["wohnwagen"], false )
				guiWindowSetSizable ( gWindow["wohnwagen"], false )
				
				guiSetAlpha(gWindow["wohnwagen"],1)
				gLabel["wohnmobilInfo1"] = guiCreateLabel(12,27,289,78,"Hier kannst du einen Wohnwagen erwerben,\nan dem du Spawnen und essen kannst.\n\nAusserdem kannst du ihm - wie jedem Fahrzeug -\neinen Kofferraum einbauen.",false,gWindow["wohnwagen"])
				guiSetAlpha(gLabel["wohnmobilInfo1"],1)
				guiLabelSetColor(gLabel["wohnmobilInfo1"],200,200,0)
				guiLabelSetVerticalAlign(gLabel["wohnmobilInfo1"],"top")
				guiLabelSetHorizontalAlign(gLabel["wohnmobilInfo1"],"left",false)
				guiSetFont(gLabel["wohnmobilInfo1"],"default-bold-small")
				gButton["trailerBuy"] = guiCreateButton(92,125,87,44,"Kaufen",false,gWindow["wohnwagen"])
				guiSetAlpha(gButton["trailerBuy"],1)
				guiSetFont(gButton["trailerBuy"],"default-bold-small")
				gLabel[2] = guiCreateLabel(20,100,44,18,"Kosten:",false,gWindow["wohnwagen"])
				guiSetAlpha(gLabel[2],1)
				guiLabelSetColor(gLabel[2],125,0,0)
				guiLabelSetVerticalAlign(gLabel[2],"top")
				guiLabelSetHorizontalAlign(gLabel[2],"left",false)
				guiSetFont(gLabel[2],"default-bold-small")
				gLabel[3] = guiCreateLabel(13,114,63,15,"50.500 $",false,gWindow["wohnwagen"])
				guiSetAlpha(gLabel[3],1)
				guiLabelSetColor(gLabel[3],0,125,0)
				guiLabelSetVerticalAlign(gLabel[3],"top")
				guiLabelSetHorizontalAlign(gLabel[3],"left",false)
				guiSetFont(gLabel[3],"default-bold-small")
				gLabel[4] = guiCreateLabel(10,136,71,21,"Zahlen per...",false,gWindow["wohnwagen"])
				guiSetAlpha(gLabel[4],1)
				guiLabelSetColor(gLabel[4],255,255,255)
				guiLabelSetVerticalAlign(gLabel[4],"top")
				guiLabelSetHorizontalAlign(gLabel[4],"left",false)
				guiSetFont(gLabel[4],"default-bold-small")
				gRadio["trailerPayEC"] = guiCreateRadioButton(9,157,68,14,"EC Karte",false,gWindow["wohnwagen"])
				guiSetAlpha(gRadio["trailerPayEC"],1)
				guiSetFont(gRadio["trailerPayEC"],"default-bold-small")
				gRadio["trailerPayBar"] = guiCreateRadioButton(9,176,68,14,"Bargeld",false,gWindow["wohnwagen"])
				guiSetAlpha(gRadio["trailerPayBar"],1)
				guiRadioButtonSetSelected(gRadio["trailerPayEC"],true)
				guiSetFont(gRadio["trailerPayBar"],"default-bold-small")
				gImage[1] = guiCreateStaticImage(193,113,95,74,"images/gui/trailer.png",false,gWindow["wohnwagen"])
				guiSetAlpha(gImage[1],1)
				gButton["trailerClose"] = guiCreateButton(280,24,18,19,"x",false,gWindow["wohnwagen"])
				guiSetAlpha(gButton["trailerClose"],1)
				guiSetFont(gButton["trailerClose"],"default-bold-small")
				
				addEventHandler ( "onClientGUIClick", gButton["trailerClose"],
					function ()
						guiSetVisible ( gWindow["wohnwagen"], false )
						showCursor ( false )
						setElementClicked ( false )
					end,
				false )
				addEventHandler ( "onClientGUIClick", gButton["trailerBuy"],
					function ()
						guiSetVisible ( gWindow["wohnwagen"], false )
						showCursor ( false )
						setElementClicked ( false )
						if guiRadioButtonGetSelected ( gRadio["trailerPayEC"] ) then
							ec = true
						else
							ec = false
						end
						triggerServerEvent ( "buyTrailer", lp, ec )
					end,
				false )
			end
		end
	end
end
addEventHandler ( "onClientMarkerHit", trailerMarker, showWohnwagenMenue )
--<marker id="marker (cylinder) (1)" type="cylinder" color="#0000ff99" size="3" interior="0" dimension="0" posX="-911.3271484375" posY="-486.00863647461" posZ="24.896272659302" rotX="0" rotY="0" rotZ="0" />