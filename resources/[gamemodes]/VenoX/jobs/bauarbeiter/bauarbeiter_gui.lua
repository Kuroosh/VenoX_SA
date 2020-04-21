--[[function showBauingWindow ()
	showCursor ( true )
	setElementClicked ( true )
	local txt
	
	gWindow["BauSelection"] = guiCreateWindow(screenwidth/2-294/2,screenheight/2-313/2,294,313,"Bauarbeiter",false)
	guiWindowSetMovable(gWindow["BauSelection"],false)
	guiWindowSetSizable(gWindow["BauSelection"],false)
	guiSetAlpha ( gWindow["BauSelection"], 1 )
	gButton["Bauing1"] = guiCreateButton(17,54,90,43,"Anlagen Warten",false,gWindow["BauSelection"])
	guiSetFont(gButton["Bauing1"],"default-bold-small")
	addEventHandler ( "onClientGUIClick", gButton["Bauing1"],
		function ()
			triggerServerEvent ( "BauarbeiterJobRecieve", lp, "job1" )
			destroyElement ( gWindow["BauSelection"] )
			showCursor ( false )
			setElementClicked ( false )
		end,
	false )
	gLabel[1] = guiCreateLabel(127,53,150,45,"Du musst Anlagen warten\nund erhaelst pro\nReparatur 25 $.",false,gWindow["BauSelection"])
	guiLabelSetColor(gLabel[1],200,200,0)
	guiLabelSetVerticalAlign(gLabel[1],"top")
	guiLabelSetHorizontalAlign(gLabel[1],"left",false)
	guiSetFont(gLabel[1],"default-bold-small")
	gLabel[2] = guiCreateLabel(19,28,141,16,"Bauarbeiter-Level:",false,gWindow["BauSelection"])
	guiLabelSetColor(gLabel[2],255,255,255)
	guiLabelSetVerticalAlign(gLabel[2],"top")
	guiLabelSetHorizontalAlign(gLabel[2],"left",false)
	guiSetFont(gLabel[2],"default-bold-small")
	gLabel[3] = guiCreateLabel(174,28,40,17,tostring ( vnxClientGetElementData ( "bauarbeiterLVL" ) ), false,gWindow["BauSelection"])
	guiLabelSetColor(gLabel[3],0,200,0)
	guiLabelSetVerticalAlign(gLabel[3],"top")
	guiLabelSetHorizontalAlign(gLabel[3],"left",false)
	guiSetFont(gLabel[3],"default-bold-small")
	
	if vnxClientGetElementData ( "bauarbeiterLVL" ) >= 100 then
		txt = "Dozer Fahren"
		gLabel[4] = guiCreateLabel(127,106,137,55,"Du musst Erde mit\ndem Dozer transpotieren\n- dafuer erhaelst du\n55 $ pro Ladung.",false,gWindow["BauSelection"])
		guiLabelSetColor(gLabel[4],200,200,0)
		guiLabelSetVerticalAlign(gLabel[4],"top")
		guiLabelSetHorizontalAlign(gLabel[4],"left",false)
		guiSetFont(gLabel[4],"default-bold-small")
	else
		txt = "Du brauchst\nmind. LVL 100"
	end
	gButton["Bauing2"] = guiCreateButton(17,117,90,43,txt,false,gWindow["BauSelection"])
	guiSetFont(gButton["Bauing2"],"default-bold-small")
	addEventHandler ( "onClientGUIClick", gButton["Bauing2"],
		function ()
			triggerServerEvent ( "BauarbeiterJobRecieve", lp, "job2" )
			destroyElement ( gWindow["BauSelection"] )
			showCursor ( false )
			setElementClicked ( false )
		end,
	false )
	if vnxClientGetElementData ( "bauarbeiterLVL" ) >= 250 then
		txt = "Zementtruck Fahren"
		gLabel[5] = guiCreateLabel(124,177,137,58,"Du musst Baustellen mit\ndem Zementtruck\nbeliefern - dafuer erhaelst\ndu 850 $ pro Lieferung.",false,gWindow["BauSelection"])
		guiLabelSetColor(gLabel[5],200,200,0)
		guiLabelSetVerticalAlign(gLabel[5],"top")
		guiLabelSetHorizontalAlign(gLabel[5],"left",false)
		guiSetFont(gLabel[5],"default-bold-small")
	else
		txt = "Du brauchst\nmind. LVL 250"
	end
	gButton["Bauing3"] = guiCreateButton(15,183,90,43,txt,false,gWindow["BauSelection"])
	guiSetFont(gButton["Bauing3"],"default-bold-small")
	addEventHandler ( "onClientGUIClick", gButton["Bauing3"],
		function ()
			triggerServerEvent ( "BauarbeiterJobRecieve", lp, "job3" )
			destroyElement ( gWindow["BauSelection"] )
			showCursor ( false )
			setElementClicked ( false )
		end,
	false )
	if vnxClientGetElementData ( "bauarbeiterLVL" ) >= 500 then
		txt = "Comming soon!"
	else
		txt = "Comming soon!"
	end
	gButton["Bauing4"] = guiCreateButton(14,250,90,43,txt,false,gWindow["BauSelection"])
	guiSetFont(gButton["Bauing4"],"default-bold-small")
	addEventHandler ( "onClientGUIClick", gButton["Bauing4"],
		function ()
			--triggerServerEvent ( "BauarbeiterJobRecieve", lp, "skin" )
			destroyElement ( gWindow["BauSelection"] )
			showCursor ( false )
			setElementClicked ( false )
		end,
	false )
	gButton["Bauing5"] = guiCreateButton(142,249,90,43,"Fenster schliessen",false,gWindow["BauSelection"])
	guiSetFont(gButton["Bauing5"],"default-bold-small")
	addEventHandler ( "onClientGUIClick", gButton["Bauing5"],
		function ()
			destroyElement ( gWindow["BauSelection"] )
			showCursor ( false )
			setElementClicked ( false )
		end,
	false )
end
addEvent ( "showBauingWindow", true )
addEventHandler ( "showBauingWindow", getRootElement(), showBauingWindow )
]]