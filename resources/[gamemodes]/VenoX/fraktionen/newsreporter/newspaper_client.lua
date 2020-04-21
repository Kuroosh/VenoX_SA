-------------------------
------- (c) 2010 --------
------- by Zipper -------
-- and vnx MTA:RL Crew --
-------------------------

createObject ( 1285, -2017.1163330078, 454.44692993164, 34.750946044922 )

function showNewspaper_func ( text )

	hideInventory()
	setElementClicked ( true )
	showCursor ( true )
	if gWindow["newspaper"] then
		guiSetVisible ( gWindow["newspaper"], true )
	else
		gWindow["newspaper"] = guiCreateWindow(screenwidth/2-313/2,screenheight/2-380/2,313,380,"Zeitung",false)
		guiWindowSetMovable(gWindow["newspaper"],false)
		guiWindowSetSizable(gWindow["newspaper"],false)
		
		gImage["newspaper"] = guiCreateStaticImage(18,23,281,73,"images/liberty_tree.png",false,gWindow["newspaper"])
		
		gMemo["newspaper"] = guiCreateMemo(15,95,286,272,text,false,gWindow["newspaper"])
		guiMemoSetReadOnly(gMemo["newspaper"],true)
		
		gButton["newspaperClose"] = guiCreateButton(280,22,24,24,"X",false,gWindow["newspaper"])
		
		addEventHandler("onClientGUIClick", gButton["newspaperClose"],
			function ()
				setElementClicked ( false )
				showCursor ( false )
				guiSetVisible ( gWindow["newspaper"], false )
			end,
		false )
	end
	guiSetText ( gMemo["newspaper"], text )
end
addEvent ( "showNewspaper", true )
addEventHandler ( "showNewspaper", getRootElement(), showNewspaper_func )

function showNewspaperReporter_func ( text )

	setElementClicked ( true )
	showCursor ( true )
	toggleControl ( "chatbox", false )
	if gWindow["newspaperEdit"] then
		guiSetVisible ( gWindow["newspaperEdit"], true )
	else
		gWindow["newspaperEdit"] = guiCreateWindow(screenwidth/2-313/2,screenheight/2-380/2,313,380,"Zeitung",false)
		guiWindowSetMovable(gWindow["newspaperEdit"],false)
		guiWindowSetSizable(gWindow["newspaperEdit"],false)
		
		gImage["newspaperEdit"] = guiCreateStaticImage(18,23,281,73,"images/liberty_tree.png",false,gWindow["newspaperEdit"])
		
		gMemo["newspaperEdit"] = guiCreateMemo(15,95,286,272,text,false,gWindow["newspaperEdit"])
		
		gButton["newspaperCloseEdit"] = guiCreateButton(200,22,100,24,"Speichern",false,gWindow["newspaperEdit"])
		
		addEventHandler("onClientGUIClick", gButton["newspaperCloseEdit"],
			function ()
				setElementClicked ( false )
				showCursor ( false )
				guiSetVisible ( gWindow["newspaperEdit"], false )
				triggerServerEvent ( "redoNewspaperServer", lp, guiGetText ( gMemo["newspaperEdit"] ) )
				toggleControl ( "chatbox", true )
			end,
		false )
	end
	guiSetText ( gMemo["newspaperEdit"], text )
end
addEvent ( "showNewspaperReporter", true )
addEventHandler ( "showNewspaperReporter", getRootElement(), showNewspaperReporter_func )