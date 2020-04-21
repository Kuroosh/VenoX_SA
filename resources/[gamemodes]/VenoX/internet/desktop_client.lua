-------------------------
------- (c) 2010 --------
------- by Zipper -------
-- and Vio MTA:RL Crew --
-------------------------

internetImages = {}


function showFruitDesktop_func ()

	
	lastWebpages = nil
	lastWebpages = {}

	showCursor ( true )
	setElementClicked ( true )
	toggleControl ( "chatbox", false )
	setElementClicked ( true )
	setElementData ( lp, "ElementClicked", true, true )
	if gImage["desktopBG"] then
		guiSetVisible ( gImage["desktopBG"], true )
		guiSetAlpha ( gImage["desktopBG"], 0 )
		setTimer ( fadeFruitImage, 50, 20, gImage["desktopBG"] )
	else
		gImage["desktopBG"] = guiCreateStaticImage(screenwidth/2-650/2, screenheight/2-502/2, 650, 502, "images/tablet/tablet.png", false)
		guiSetAlpha ( gImage["desktopBG"], 0 )
		setTimer ( fadeFruitImage, 50, 20, gImage["desktopBG"] )
		gImage["desktopEmail"] = guiCreateStaticImage(111, 115, 42, 33, "images/tablet/email.png", false,gImage["desktopBG"])
		gLabel["desktopEmail"] = guiCreateLabel(111, 115+33, 42, 33,"E-Mail",false,gImage["desktopBG"])
		guiLabelSetColor(gLabel["desktopEmail"],0,97,230)
		guiLabelSetVerticalAlign(gLabel["desktopEmail"],"top")
		guiLabelSetHorizontalAlign(gLabel["desktopEmail"],"center",false)
		guiSetFont(gLabel["desktopEmail"],"default-bold-small")
		gImage["desktopLogout"] = guiCreateStaticImage(103, 327, 60, 60, "images/tablet/logout.png", false,gImage["desktopBG"])
		gLabel["desktopAbmelden"] = guiCreateLabel(103, 327+60, 60, 60,"Abmelden",false,gImage["desktopBG"])
		guiLabelSetColor(gLabel["desktopAbmelden"],0,97,230)
		guiLabelSetVerticalAlign(gLabel["desktopAbmelden"],"top")
		guiLabelSetHorizontalAlign(gLabel["desktopAbmelden"],"center",false)
		guiSetFont(gLabel["desktopAbmelden"],"default-bold-small")
		gImage["desktopBank"] = guiCreateStaticImage(439, 125, 126, 30, "images/tablet/bank.png", false,gImage["desktopBG"])
		gLabel["desktopTime"] = guiCreateLabel(68, 50, 502, 15,"15:50",false,gImage["desktopBG"])
		guiLabelSetColor(gLabel["desktopTime"],0,97,230)
		guiLabelSetVerticalAlign(gLabel["desktopTime"],"top")
		guiLabelSetHorizontalAlign(gLabel["desktopTime"],"center",false)
		guiSetFont(gLabel["desktopTime"],"default-bold-small")
		gLabel["desktopOnlineBanking"] = guiCreateLabel(439, 125+30, 126, 30,"Online Banking",false,gImage["desktopBG"])
		guiLabelSetColor(gLabel["desktopOnlineBanking"],0,93,230)
		guiLabelSetVerticalAlign(gLabel["desktopOnlineBanking"],"top")
		guiLabelSetHorizontalAlign(gLabel["desktopOnlineBanking"],"center",false)
		guiSetFont(gLabel["desktopOnlineBanking"],"default-bold-small")
		gLabel["desktopWebbrowser"] = guiCreateLabel(0, 330, 650, 30,"Webbrowser",false,gImage["desktopBG"])
		guiLabelSetColor(gLabel["desktopWebbrowser"],0,97,230)
		guiLabelSetVerticalAlign(gLabel["desktopWebbrowser"],"top")
		guiLabelSetHorizontalAlign(gLabel["desktopWebbrowser"],"center",false)
		guiSetFont(gLabel["desktopWebbrowser"],"default-bold-small")
		gButton["desktopWebbrowser"] = guiCreateButton(251, 175, 151, 150,"",false,gImage["desktopBG"])
		guiSetAlpha(gButton["desktopWebbrowser"],0)
		local pname = getPlayerName ( lp )
		gLabel["desktopInfo"] = guiCreateLabel(68, 427, 502, 15,"Angemeldet als: "..pname.." ( "..pname.."@VenoX-Reallife )",false,gImage["desktopBG"])
		guiLabelSetColor(gLabel["desktopInfo"],0,120,255)
		guiLabelSetVerticalAlign(gLabel["desktopInfo"],"top")
		guiLabelSetHorizontalAlign(gLabel["desktopInfo"],"left",false)
		guiSetFont(gLabel["desktopInfo"],"default-bold-small")
		gImage["desktopAmmunation"] = guiCreateStaticImage(445, 354, 120, 33, "images/tablet/ammunation.png", false,gImage["desktopBG"])
		gLabel["desktopAmmunation"] = guiCreateLabel(445, 354+33, 120, 33,"Ammunation Versand",false,gImage["desktopBG"])
		guiLabelSetColor(gLabel["desktopAmmunation"],0,97,230)
		guiLabelSetVerticalAlign(gLabel["desktopAmmunation"],"top")
		guiLabelSetHorizontalAlign(gLabel["desktopAmmunation"],"center",false)
		guiSetFont(gLabel["desktopAmmunation"],"default-bold-small")
		
		table.insert ( internetImages, gImage["desktopBG"] )
		table.insert ( internetImages, gImage["desktopEmail"] )
		table.insert ( internetImages, gImage["desktopLogout"] )
		table.insert ( internetImages, gImage["desktopBank"] )
		table.insert ( internetImages, gImage["desktopAmmunation"] )
		
		addEventHandler("onClientGUIClick", gImage["desktopBG"], 
			function ( btn, state )
				if state == "up" then
					mousesound_func ()
					if gWindow["basicMainPage"] then
						guiBringToFront ( gWindow["basicMainPage"] )
					end
				end
			end
		)
		
		addEventHandler("onClientGUIClick", gImage["desktopEmail"], 
			function ( btn, state )
				if state == "up" then
					showEmailRecieveCenter_func ()
				end
			end,
		false)
		
		addEventHandler("onClientGUIClick", gImage["desktopAmmunation"], 
			function ( btn, state )
				if state == "up" then
					showWebbrowser ( "www.ammunation.com" )
				end
			end,
		false)
		
		addEventHandler("onClientGUIClick", gImage["desktopBank"], 
			function ( btn, state )
				if state == "up" then
					showWebbrowser ( "bank.de" )
				end
			end,
		false)

		addEventHandler("onClientGUIClick", gButton["desktopWebbrowser"], 
			function ( btn, state )
				if state == "up" then
					showWebbrowser ( "www.eyefind.com" )
				end
			end,
		false)

		addEventHandler("onClientGUIClick", gImage["desktopLogout"], 
			function ()
				gImage["blackScreen"] = guiCreateStaticImage(screenwidth/2-480/2,screenheight/2-272/2,480,272,"images/colors/c_black.jpg",false)
				guiSetAlpha ( gImage["blackScreen"], 0 )
				setTimer ( fadeFruitImage, 50, 20, gImage["blackScreen"] )
				showCursor ( false )
				setElementClicked ( false )
				setTimer ( hideFruitPC, 1000, 1 )
				setElementClicked ( false )
				setElementData ( lp, "ElementClicked", false, true )
			end,
		false)
	end
	refreshFruitTime ()
end
addEvent ( "showFruitDesktop", true )
addEventHandler ( "showFruitDesktop", getRootElement(), showFruitDesktop_func )

function fadeFruitImage ( img )

	if isElement ( img ) then
		guiSetAlpha ( img, guiGetAlpha ( img ) + 0.05 )
	end
end

function fadeFruitBackImage ( img )

	if isElement ( img ) then
		guiSetAlpha ( img, guiGetAlpha ( img ) - 0.1 )
	end
end

function refreshFruitTime ()

	if guiGetVisible ( gImage["desktopBG"] ) then
		local time = getRealTime()
		local hour = time.hour
		local minute = tostring ( time.minute )
		local weekday = daynames[time.weekday]
		if #minute <= 1 then
			minute = "0"..minute
		end
		guiSetText ( gLabel["desktopTime"], hour..":"..minute )
		setTimer ( refreshFruitTime, 1000, 1 )
	end
end

function hideFruitPC ()

	guiSetVisible ( gImage["desktopBG"], false )
	toggleControl ( "chatbox", true )
	setTimer ( fadeFruitBackImage, 50, 10, gImage["blackScreen"] )
	setTimer ( destroyElement, 600, 1, gImage["blackScreen"] )
end