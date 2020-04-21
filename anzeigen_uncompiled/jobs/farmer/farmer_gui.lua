function showFarmingWindow ()

	showCursor ( true )
	setElementClicked ( true )
	local txt
	
	gWindow["farmSelection"] = guiCreateWindow(screenwidth/2-294/2,screenheight/2-313/2,294,313,"Farmer",false)
	guiWindowSetMovable(gWindow["farmSelection"],false)
	guiWindowSetSizable(gWindow["farmSelection"],false)
	guiSetAlpha ( gWindow["farmSelection"], 1 )
	gButton["farming1"] = guiCreateButton(17,54,90,43,"Auf dem Feld arbeiten",false,gWindow["farmSelection"])
	guiSetFont(gButton["farming1"],"default-bold-small")
	addEventHandler ( "onClientGUIClick", gButton["farming1"],
		function ()
			triggerServerEvent ( "farmerJobRecieve", lp, "job1" )
			destroyElement ( gWindow["farmSelection"] )
			showCursor ( false )
			setElementClicked ( false )
		end,
	false )
	gLabel[1] = guiCreateLabel(127,53,150,45,"Du musst Getreide saehen\nund erhaelst dafuer pro\ngesaehter Pflanze 15 €.",false,gWindow["farmSelection"])
	guiLabelSetColor(gLabel[1],200,200,0)
	guiLabelSetVerticalAlign(gLabel[1],"top")
	guiLabelSetHorizontalAlign(gLabel[1],"left",false)
	guiSetFont(gLabel[1],"default-bold-small")
	gLabel[2] = guiCreateLabel(19,28,141,16,"Aktueller Farmer-Level:",false,gWindow["farmSelection"])
	guiLabelSetColor(gLabel[2],255,255,255)
	guiLabelSetVerticalAlign(gLabel[2],"top")
	guiLabelSetHorizontalAlign(gLabel[2],"left",false)
	guiSetFont(gLabel[2],"default-bold-small")
	gLabel[3] = guiCreateLabel(174,28,20,17,tostring ( vnxClientGetElementData ( "farmerLVL" ) ), false,gWindow["farmSelection"])
	guiLabelSetColor(gLabel[3],0,200,0)
	guiLabelSetVerticalAlign(gLabel[3],"top")
	guiLabelSetHorizontalAlign(gLabel[3],"left",false)
	guiSetFont(gLabel[3],"default-bold-small")
	
	if vnxClientGetElementData ( "farmerLVL" ) >= 100 then
		txt = "Traktor fahren"
		gLabel[4] = guiCreateLabel(127,106,137,55,"Du musst Pflanzen mit\ndem Traktor ernten\n- dafuer erhaelst du\n20 € pro Pflanze.",false,gWindow["farmSelection"])
		guiLabelSetColor(gLabel[4],200,200,0)
		guiLabelSetVerticalAlign(gLabel[4],"top")
		guiLabelSetHorizontalAlign(gLabel[4],"left",false)
		guiSetFont(gLabel[4],"default-bold-small")
	else
		txt = "Du brauchst\nmind. LVL 100"
	end
	gButton["farming2"] = guiCreateButton(17,117,90,43,txt,false,gWindow["farmSelection"])
	guiSetFont(gButton["farming2"],"default-bold-small")
	addEventHandler ( "onClientGUIClick", gButton["farming2"],
		function ()
			triggerServerEvent ( "farmerJobRecieve", lp, "job2" )
			destroyElement ( gWindow["farmSelection"] )
			showCursor ( false )
			setElementClicked ( false )
		end,
	false )
	if vnxClientGetElementData ( "farmerLVL" ) >= 250 then
		txt = "Maehdrescher fahren"
		gLabel[5] = guiCreateLabel(124,177,137,58,"Du musst Getreide mit\ndem Maehdrescher\nernten - dafuer erhaelst\ndu 25 € pro Pflanze.",false,gWindow["farmSelection"])
		guiLabelSetColor(gLabel[5],200,200,0)
		guiLabelSetVerticalAlign(gLabel[5],"top")
		guiLabelSetHorizontalAlign(gLabel[5],"left",false)
		guiSetFont(gLabel[5],"default-bold-small")
	else
		txt = "Du brauchst\nmind. LVL 250"
	end
	gButton["farming3"] = guiCreateButton(15,183,90,43,txt,false,gWindow["farmSelection"])
	guiSetFont(gButton["farming3"],"default-bold-small")
	addEventHandler ( "onClientGUIClick", gButton["farming3"],
		function ()
			triggerServerEvent ( "farmerJobRecieve", lp, "job3" )
			destroyElement ( gWindow["farmSelection"] )
			showCursor ( false )
			setElementClicked ( false )
		end,
	false )
	if vnxClientGetElementData ( "farmerLVL" ) >= 500 then
		txt = "Farmeroutfit verwenden"
	else
		txt = "Du brauchst\nmind. LVL 500"
	end
	gButton["farming4"] = guiCreateButton(14,250,90,43,txt,false,gWindow["farmSelection"])
	guiSetFont(gButton["farming4"],"default-bold-small")
	addEventHandler ( "onClientGUIClick", gButton["farming4"],
		function ()
			triggerServerEvent ( "farmerJobRecieve", lp, "skin" )
			destroyElement ( gWindow["farmSelection"] )
			showCursor ( false )
			setElementClicked ( false )
		end,
	false )
	gButton["farming5"] = guiCreateButton(142,249,90,43,"Fenster schliessen",false,gWindow["farmSelection"])
	guiSetFont(gButton["farming5"],"default-bold-small")
	addEventHandler ( "onClientGUIClick", gButton["farming5"],
		function ()
			destroyElement ( gWindow["farmSelection"] )
			showCursor ( false )
			setElementClicked ( false )
		end,
	false )
end
addEvent ( "showFarmingWindow", true )
addEventHandler ( "showFarmingWindow", getRootElement(), showFarmingWindow )