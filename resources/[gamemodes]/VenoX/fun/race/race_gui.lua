-------------------------
------- (c) 2010 --------
------- by Zipper -------
-------------------------

function showRaceGui_func ()

	if gWindow["raceTrackSelection"] then
		guiSetVisible ( gWindow["raceTrackSelection"], true )
	else
		gWindow["raceTrackSelection"] = guiCreateWindow(screenwidth/2-207/2,screenheight/2-145/2,207,145,"Strecken Auswahl",false)
		guiSetAlpha(gWindow["raceTrackSelection"],1)
		guiWindowSetMovable(gWindow["raceTrackSelection"],false)
		guiWindowSetSizable(gWindow["raceTrackSelection"],false)
		
		gGrid["raceTracks"] = guiCreateGridList(0.0435,0.1862,0.6087,0.731,true,gWindow["raceTrackSelection"])
		guiGridListSetSelectionMode(gGrid["raceTracks"],2)
		
		gColumn["raceTrackName"] = guiGridListAddColumn(gGrid["raceTracks"],"Streckenname",0.8)

		gButton["startRace"] = guiCreateButton(0.6667,0.2,0.29,0.2138,"Strecke\nfahren",true,gWindow["raceTrackSelection"])
		guiSetAlpha(gButton["startRace"],1)
		addEventHandler ( "onClientGUIClick", gButton["startRace"],
			function ()
				if source == gButton["startRace"] then
					local text = guiGridListGetItemText ( gGrid["raceTracks"], guiGridListGetSelectedItem ( gGrid["raceTracks"] ), 1 )
					if text == "Canyon (Zeit)" then
						hideRaceSelection()
						triggerServerEvent ( "startFirstRace", lp, lp )
					elseif text == "Forrest (PvP)" then
						hideRaceSelection()
						triggerServerEvent ( "startSecondRace", lp, lp )
					end
				end
			end
		)
		gButton["raceClose"] = guiCreateButton(0.6667,0.7,0.29,0.2138,"Schliessen",true,gWindow["raceTrackSelection"])
		guiSetAlpha(gButton["raceClose"],1)
		addEventHandler ( "onClientGUIClick", gButton["raceClose"], hideRaceSelection )
				
		gButton["raceShowHighscore"] = guiCreateButton(0.6667,0.45,0.29,0.2138,"Highscore\nzeigen",true,gWindow["raceTrackSelection"])
		guiSetAlpha(gButton["raceShowHighscore"],1)
		addEventHandler ( "onClientGUIClick", gButton["raceShowHighscore"],
			function ()
				if source == gButton["raceShowHighscore"] then
					executeCommandHandler ( "highscore" )
				end
			end
		)
		
		fillRaceGrid()
	end
end
addEvent ( "showRaceGui", true )
addEventHandler ( "showRaceGui", getRootElement(), showRaceGui_func )

function fillRaceGrid()

	--local row = guiGridListAddRow ( gGrid["raceTracks"] )
	--guiGridListSetItemText ( row, gColumn["raceTrackName"], "Canyon (Zeit)", false, false )
	--local row = guiGridListAddRow ( gGrid["raceTracks"] )
	--guiGridListSetItemText ( row, gColumn["raceTrackName"], "Forrest (PvP)", false, false )
	local row = guiGridListAddRow ( gGrid["raceTracks"] )
	guiGridListSetItemText ( gGrid["raceTracks"], row, gColumn["raceTrackName"], "Canyon (Zeit)", false, false )
	local row = guiGridListAddRow ( gGrid["raceTracks"] )
	guiGridListSetItemText ( gGrid["raceTracks"], row, gColumn["raceTrackName"], "Forrest (PvP)", false, false )
end

function hideRaceSelection()

	setElementClicked ( false )
	showCursor ( false )
	guiSetVisible ( gWindow["raceTrackSelection"], false )
end