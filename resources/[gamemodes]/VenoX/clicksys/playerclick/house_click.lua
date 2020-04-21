eatSwitch = false

function showHouseGui_func ( amount )

	if source == lp then
		if gWindow["houseMenue"] then
			eatSwitch = false
			guiSetVisible ( gWindow["houseMenue"], true )
			guiSetText ( gLabel["houseAmount"], amount )
		else
			--gWindow["houseMenue"] = guiCreateWindow(screenwidth/2-173/2,screenheight/2-215/2,173,215,"Hausmenue",false)
			gWindow["houseMenue"] = guiCreateStaticImage(screenwidth/2-173/2,screenheight/2-215/2,173,215,"images/hud/background.png",false)
			guiSetAlpha(gWindow["houseMenue"],1)
			gImage["house$"] = guiCreateStaticImage(0.3295,0.1349,0.1734,0.1349,"images/dollar.png",true,gWindow["houseMenue"])
			guiSetAlpha(gImage["house$"],1)
			gLabel["houseAmount"] = guiCreateLabel(0.0578,0.1628,0.2717,0.0837,"5000",true,gWindow["houseMenue"])
			guiSetAlpha(gLabel["houseAmount"],1)
			guiLabelSetColor(gLabel["houseAmount"],000,125,010)
			guiLabelSetVerticalAlign(gLabel["houseAmount"],"top")
			guiLabelSetHorizontalAlign(gLabel["houseAmount"],"left",false)
			guiSetFont(gLabel["houseAmount"],"default-bold-small")
			guiSetText ( gLabel["houseAmount"], amount )
			gLabel["houseInfo"] = guiCreateLabel(0.526,0.1209,0.4046,0.1721,"Befinden sich\nmomentan in\nder Hauskasse.",true,gWindow["houseMenue"])
			guiSetAlpha(gLabel["houseInfo"],1)
			guiLabelSetColor(gLabel["houseInfo"],255,255,255)
			guiLabelSetVerticalAlign(gLabel["houseInfo"],"top")
			guiLabelSetHorizontalAlign(gLabel["houseInfo"],"left",false)
			guiSetFont(gLabel["houseInfo"],"default-small")
			gMemo["houseAmount"] = guiCreateMemo(0.052,0.3674,0.4913,0.1488,"500",true,gWindow["houseMenue"])
			guiSetAlpha(gMemo["houseAmount"],1)
			gButton["houseGive"] = guiCreateButton(0.5838,0.3209,0.341,0.1116,"Einzahlen",true,gWindow["houseMenue"])
			guiSetAlpha(gButton["houseGive"],1)
			gButton["houseTake"] = guiCreateButton(0.5838,0.4651,0.341,0.1116,"Auszahlen",true,gWindow["houseMenue"])
			guiSetAlpha(gButton["houseTake"],1)
			gButton["houseHeal"] = guiCreateButton(0.0636,0.614,0.3988,0.1395,"Heilen",true,gWindow["houseMenue"])
			guiSetAlpha(gButton["houseHeal"],1)
			gButton["houseEat"] = guiCreateButton(0.5434,0.614,0.3988,0.1395,"Essen",true,gWindow["houseMenue"])
			guiSetAlpha(gButton["houseEat"],1)
			--gButton["houseGuns"] = guiCreateButton(0.8786/2+0.0636,0.8,0.3988,0.1395,"Waffenbox",true,gWindow["houseMenue"])
			--guiSetAlpha(gButton["houseGuns"],1)
			gButton["houseGuns"] = guiCreateButton(0.0636,0.8,0.3988,0.1395,"Waffenbox",true,gWindow["houseMenue"])
			guiSetAlpha(gButton["houseGuns"],1)
			gButton["houseClose"] = guiCreateButton(0.5434,0.8,0.3988,0.1395,"Schliessen",true,gWindow["houseMenue"])
			guiSetAlpha(gButton["houseClose"],1)
			
			houseButtson = {
			 [gButton["houseClose"]]=true,
			 [gButton["houseGive"]]=true,
			 [gButton["houseTake"]]=true,
			 [gButton["houseHeal"]]=true,
			 [gButton["houseEat"]]=true,
			 [gButton["houseGuns"]]=true
			}
			
			addEventHandler( "onClientGUIClick", gButton["houseClose"],
				function ()
					if houseButtson[source] then
						guiSetVisible ( gWindow["houseMenue"], false )
						setElementClicked ( false )
						showCursor ( false )
					end
				end
			)
			
			addEventHandler( "onClientGUIClick", gButton["houseGive"],
				function ()
					if houseButtson[source] then
						triggerServerEvent ( "houseClickServer", lp, lp, "give", tonumber ( guiGetText ( gMemo["houseAmount"] ) ) )
					end
				end
			)
			addEventHandler( "onClientGUIClick", gButton["houseTake"],
				function ()
					if houseButtson[source] then
						triggerServerEvent ( "houseClickServer", lp, lp, "take", tonumber ( guiGetText ( gMemo["houseAmount"] ) ) )
					end
				end
			)
			addEventHandler( "onClientGUIClick", gButton["houseHeal"],
				function ()
					if houseButtson[source] then
						triggerServerEvent ( "houseClickServer", lp, lp, "heal" )
					end
				end
			)
			addEventHandler( "onClientGUIClick", gButton["houseEat"],
				function ()
					if houseButtson[source] then
						if not eatSwitch then
							eatSwitch = true
							triggerServerEvent ( "houseClickServer", lp, lp, "eat" )
						end
					end
				end
			)
			addEventHandler( "onClientGUIClick", gButton["houseGuns"],
				function ()
					if houseButtson[source] then
						guiSetVisible ( gWindow["houseMenue"], false )
						_createGunboxMenue ()
					end
				end
			)
		end
	end
end
addEvent ( "showHouseGui", true )
addEventHandler ( "showHouseGui", getRootElement(), showHouseGui_func )