-------------------------
------- (c) 2010 --------
------- by Zipper -------
-- and Vio MTA:RL Crew --
-------------------------

function showWebbrowser ( url, prev )

	local i = 0
	while not prev do
		if not lastWebpages[i] then
			lastWebpages[i] = url
			break
		end
		i = i + 1
	end
	
	guiSetVisible ( gImage["desktopBG"], false )
	if gWindow["basicMainPage"] then
		guiSetVisible ( gWindow["basicMainPage"], true )
		guiBringToFront ( gWindow["basicMainPage"] )
	else
		--gWindow["basicMainPage"] = guiCreateWindow(screenwidth/2-419/2,screenheight/2-373/2,419,373,"VenoX Reallife.NET Explorer",false)
		gWindow["basicMainPage"] = guiCreateStaticImage(screenwidth/2-419/2,screenheight/2-373/2,419,373,"images/hud/background.png",false)
		guiSetAlpha(gWindow["basicMainPage"],1)
		
		guiWindowSetMovable ( gWindow["basicMainPage"], false )
		guiWindowSetSizable ( gWindow["basicMainPage"], false )
		
		gEdit["webBrowserUrl"] = guiCreateEdit(53,24,265,31,"",false,gWindow["basicMainPage"])
		guiSetAlpha(gEdit["webBrowserUrl"],1)
		
		gLabel["webbrowserInfo1"] = guiCreateLabel(20,30,37,20,"URL:",false,gWindow["basicMainPage"])
		guiSetAlpha(gLabel["webbrowserInfo1"],1)
		guiLabelSetColor(gLabel["webbrowserInfo1"],255,120,0)
		guiLabelSetVerticalAlign(gLabel["webbrowserInfo1"],"top")
		guiLabelSetHorizontalAlign(gLabel["webbrowserInfo1"],"left",false)
		guiSetFont(gLabel["webbrowserInfo1"],"default-bold-small")
		
		gButton["prevPage"] = guiCreateButton(327,27,25,26,"<",false,gWindow["basicMainPage"])
		guiSetAlpha(gButton["prevPage"],1)
		gButton["nextPage"] = guiCreateButton(356,27,25,26,">",false,gWindow["basicMainPage"])
		guiSetAlpha(gButton["nextPage"],1)
		gButton["closeWebbrowser"] = guiCreateButton(386,27,24,26,"X",false,gWindow["basicMainPage"])
		guiSetAlpha(gButton["closeWebbrowser"],1)
		
		addEventHandler("onClientGUIClick", gButton["closeWebbrowser"], 
			function ( btn, state )
				if state == "up" then
					guiSetVisible ( gWindow["basicMainPage"], false )
					guiSetVisible ( gImage["desktopBG"], true )
				end
			end,
		false)
		
		addEventHandler("onClientGUIClick", gButton["nextPage"], 
			function ( btn, state )
				if state == "up" then
					if isInIRC then
						isInIRC = false
						triggerServerEvent ( "leaveIRC", lp )
					end
					searsForURL ( guiGetText ( gEdit["webBrowserUrl"] ) )
				end
			end,
		false)
		
		addEventHandler("onClientGUIClick", gButton["prevPage"], 
			function ( btn, state )
				if state == "up" then
					local last = 0
					for i, index in pairs ( lastWebpages ) do
						if i > last then
							last = i
						end
					end
					
					local page = lastWebpages[last-1]
					showWebbrowser ( page, true )
					lastWebpages[last] = nil
				end
			end,
		false)
		
		addEventHandler("onClientGUIClick", gWindow["basicMainPage"], 
			function ( btn, state )
				if state == "up" then
					mousesound_func ()
				end
			end
		)
	end
	guiSetText ( gEdit["webBrowserUrl"], url )
	searsForURL ( url )
end

function createBasicPage ( color )

	if gImage["MainPage"] then
		destroyElement ( gImage["MainPage"] )
	end
	gImage["MainPage"] = guiCreateStaticImage(10,65,400,299,"images/colors/c_"..color..".jpg",false,gWindow["basicMainPage"])
	guiSetAlpha(gImage["MainPage"],1)
	return gImage["MainPage"]
end

function link ( object, linkTo )

	addEventHandler("onClientGUIClick", object, 
		function ( btn, state )
			if state == "up" then
				showWebbrowser ( linkTo )
			end
		end,
	false)
end