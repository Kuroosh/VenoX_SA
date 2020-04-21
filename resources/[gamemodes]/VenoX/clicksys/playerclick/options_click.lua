function showSettingsMenue ()

	hideall ()
	if not isElement ( gWindow["settings"] ) then
		--gWindow["settings"] = guiCreateWindow(screenwidth/2-285/2,120,285,456+56*1,"Optionen",false)
		gWindow["settings"] = guiCreateStaticImage(screenwidth/2-285/2,120,285,456+56*1,"images/hud/background.png",false)
		guiSetAlpha(gWindow["settings"],1)
		
		gButton["bonusMenue"] = guiCreateButton(9,24,101,42,"Bonuspunkte",false,gWindow["settings"])
		guiSetAlpha(gButton["bonusMenue"],1)
		guiSetFont(gButton["bonusMenue"],"default-bold-small")
		gButton["loginvideo"] = guiCreateButton(9,80,101,42,"Login-Video",false,gWindow["settings"])
		guiSetAlpha(gButton["loginvideo"],1)
		guiSetFont(gButton["loginvideo"],"default-bold-small")
		gButton["firstPerson"] = guiCreateButton(9,136,101,42,"First Person",false,gWindow["settings"])
		guiSetAlpha(gButton["firstPerson"],1)
		guiSetFont(gButton["firstPerson"],"default-bold-small")
		gButton["socialState"] = guiCreateButton(9,192,101,42,"Sozialer Status",false,gWindow["settings"])
		guiSetAlpha(gButton["socialState"],1)
		guiSetFont(gButton["socialState"],"default-bold-small")
		gButton["spawnPoint"] = guiCreateButton(9,248,101,42,"Spawnpunkt",false,gWindow["settings"])
		guiSetAlpha(gButton["spawnPoint"],1)
		guiSetFont(gButton["spawnPoint"],"default-bold-small")
		gButton["radioSettings"] = guiCreateButton(9,304,101,42,"Radio",false,gWindow["settings"])
		guiSetAlpha(gButton["radioSettings"],1)
		-- NEW --
		gButton["stuntCam"] = guiCreateButton(9,304+56*1,101,42,"Stuntcam",false,gWindow["settings"])
		guiSetAlpha(gButton["stuntCam"],1)
		-- NEW --
		guiSetFont(gButton["radioSettings"],"default-bold-small")
		gButton["changePW"] = guiCreateButton(9,360+56*1,66,42,"Passwort\nändern",false,gWindow["settings"])
		guiSetAlpha(gButton["changePW"],1)
		guiSetFont(gButton["changePW"],"default-bold-small")
		gButton["closeSettings"] = guiCreateButton(210,360+56*1,66,42,"Schließen",false,gWindow["settings"])
		guiSetAlpha(gButton["closeSettings"],1)
		guiSetFont(gButton["closeSettings"],"default-bold-small")
		
		addEventHandler ( "onClientGUIClick", gButton["loginvideo"],
			function ()
				if youtubevideoon then
					youtubevideoon = false
					if fileExists ( "einloggvideo.txt" ) then
						fileDelete ( "einloggvideo.txt" )
					end
					local file = fileCreate ( "einloggvideo.txt" )
					fileWrite ( file, "off" )
					fileClose ( file )
					infobox ( "Youtube-Einloggvideo\ndeaktiviert", 4000, 250, 0, 0 )
				else
					youtubevideoon = true
					if fileExists ( "einloggvideo.txt" ) then
						fileDelete ( "einloggvideo.txt" )
					end
					local file = fileCreate ( "einloggvideo.txt" )
					fileWrite ( file, "on" )
					fileClose ( file )
					infobox ( "Youtube-Einloggvideo\naktiviert", 4000, 0, 210, 0 )
				end
			end,
		false )
		addEventHandler ( "onClientGUIClick", gButton["bonusMenue"],
			function ()
				guiSetVisible( gWindow["settings"], false )
				_createBonusmenue_func()
			end,
		false )
		addEventHandler ( "onClientGUIClick", gButton["spawnPoint"],
			function ()
				guiSetVisible( gWindow["settings"], false )
				showSpawnSelection ()
			end,
		false )
		addEventHandler ( "onClientGUIClick", gButton["socialState"],
			function ()
				guiSetVisible( gWindow["settings"], false )
				showSocialRankWindow ()
			end,
		false )
		addEventHandler ( "onClientGUIClick", gButton["firstPerson"],
			function ()
				executeCommandHandler ( "ego" )
			end,
		false )
		addEventHandler ( "onClientGUIClick", gButton["radioSettings"],
			function ()
				destroyElement ( gWindow["settings"] )
				showCustomRadioGUI ()
			end,
		false )
		addEventHandler ( "onClientGUIClick", gButton["closeSettings"],
			function ()
				guiSetVisible( gWindow["settings"], false )
			end,
		false )
		addEventHandler ( "onClientGUIClick", gButton["stuntCam"],
			function ()
				stuntCameraActive = not stuntCameraActive
				if stuntCameraActive then
					outputChatBox ( "Stuntkamera aktiviert!", 0, 200, 0 )
					setClientData ( "stuntcam", "active" )
				else
					outputChatBox ( "Stuntkamera deaktiviert!", 200, 0, 0 )
					setClientData ( "stuntcam", "inactive" )
				end
			end,
		false )
		
		gLabel[1] = guiCreateLabel(117,22,161,51,"Hier kannst du Bonuspunkte\nfür Verbesserungen aus-\ngeben",false,gWindow["settings"])
		guiSetAlpha(gLabel[1],1)
		guiLabelSetColor(gLabel[1],200,200,0)
		guiLabelSetVerticalAlign(gLabel[1],"top")
		guiLabelSetHorizontalAlign(gLabel[1],"left",false)
		guiSetFont(gLabel[1],"default-bold-small")
		gLabel[2] = guiCreateLabel(117,87,162,53,"Hier kannst du das Einlogg\n-Video (de-)aktivieren.",false,gWindow["settings"])
		guiSetAlpha(gLabel[2],1)
		guiLabelSetColor(gLabel[2],200,200,0)
		guiLabelSetVerticalAlign(gLabel[2],"top")
		guiLabelSetHorizontalAlign(gLabel[2],"left",false)
		guiSetFont(gLabel[2],"default-bold-small")
		gLabel[3] = guiCreateLabel(117,134,162,53,"Hier kannst du die Ego-Sicht\nein- und aus schalten\n( Schnellbefehl: /ego )",false,gWindow["settings"])
		guiSetAlpha(gLabel[3],1)
		guiLabelSetColor(gLabel[3],200,200,0)
		guiLabelSetVerticalAlign(gLabel[3],"top")
		guiLabelSetHorizontalAlign(gLabel[3],"left",false)
		guiSetFont(gLabel[3],"default-bold-small")
		gLabel[4] = guiCreateLabel(117,201,162,53,"Hier kannst du deinen\nsozialen Status verwalten.",false,gWindow["settings"])
		guiSetAlpha(gLabel[4],1)
		guiLabelSetColor(gLabel[4],200,200,0)
		guiLabelSetVerticalAlign(gLabel[4],"top")
		guiLabelSetHorizontalAlign(gLabel[4],"left",false)
		guiSetFont(gLabel[4],"default-bold-small")
		gLabel[5] = guiCreateLabel(117,256,162,53,"Hier kannst du deinen Start-\npunkt auswählen.",false,gWindow["settings"])
		guiSetAlpha(gLabel[5],1)
		guiLabelSetColor(gLabel[5],200,200,0)
		guiLabelSetVerticalAlign(gLabel[5],"top")
		guiLabelSetHorizontalAlign(gLabel[5],"left",false)
		guiSetFont(gLabel[5],"default-bold-small")
		gLabel[6] = guiCreateLabel(117,302,162,44,"Hier kannst du deine Radio-\nsender verwalten und neue\nhinzufügen.",false,gWindow["settings"])
		guiSetAlpha(gLabel[6],1)
		guiLabelSetColor(gLabel[6],200,200,0)
		guiLabelSetVerticalAlign(gLabel[6],"top")
		guiLabelSetHorizontalAlign(gLabel[6],"left",false)
		guiSetFont(gLabel[6],"default-bold-small")
		gLabel[10] = guiCreateLabel(117,302+56,162,44,"Hier kannst du die Stunt-\nkamera ein- bzw. aus\nschalten.",false,gWindow["settings"])
		guiSetAlpha(gLabel[10],1)
		guiLabelSetColor(gLabel[10],200,200,0)
		guiLabelSetVerticalAlign(gLabel[10],"top")
		guiLabelSetHorizontalAlign(gLabel[10],"left",false)
		guiSetFont(gLabel[10],"default-bold-small")
		gLabel[7] = guiCreateLabel(101,358+56,90,17,"Altes Passwort:",false,gWindow["settings"])
		guiSetAlpha(gLabel[7],1)
		guiLabelSetColor(gLabel[7],255,255,255)
		guiLabelSetVerticalAlign(gLabel[7],"top")
		guiLabelSetHorizontalAlign(gLabel[7],"left",false)
		guiSetFont(gLabel[7],"default-bold-small")
		gLabel[8] = guiCreateLabel(28,404+56,96,15,"Neues Passwort:",false,gWindow["settings"])
		guiSetAlpha(gLabel[8],1)
		guiLabelSetColor(gLabel[8],255,255,255)
		guiLabelSetVerticalAlign(gLabel[8],"top")
		guiLabelSetHorizontalAlign(gLabel[8],"left",false)
		guiSetFont(gLabel[8],"default-bold-small")
		gLabel[9] = guiCreateLabel(163,404+56,90,15,"Neues Passwort:",false,gWindow["settings"])
		guiSetAlpha(gLabel[9],1)
		guiLabelSetColor(gLabel[9],255,255,255)
		guiLabelSetVerticalAlign(gLabel[9],"top")
		guiLabelSetHorizontalAlign(gLabel[9],"left",false)
		guiSetFont(gLabel[9],"default-bold-small")
		
		gEdit[1] = guiCreateEdit(89,375+56,110,27,"",false,gWindow["settings"])
		guiSetAlpha(gEdit[1],1)
		gEdit[2] = guiCreateEdit(19,420+56,110,27,"",false,gWindow["settings"])
		guiSetAlpha(gEdit[2],1)
		gEdit[3] = guiCreateEdit(154,420+56,110,27,"",false,gWindow["settings"])
		guiSetAlpha(gEdit[3],1)
	else
		guiSetVisible ( gWindow["settings"], true )
	end
end
--[[
function BonusMenueBtn ()

	triggerEvent ( "_createBonusmenue", getLocalPlayer() )
	guiSetVisible ( gWindow["options"], false )
end

function prevOptionsMenueBtn ()

	if channel ~= 1 then
		channel = channel - 1
		if channel == -1 or channel == 0 or channel == 1 then
			guiSetText ( gLabel["channel"], "Playback FM" )
		elseif channel == 2 then
			guiSetText ( gLabel["channel"], "K-Rose" )
		elseif channel == 3 then
			guiSetText ( gLabel["channel"], "K-DST" )
		elseif channel == 4 then
			guiSetText ( gLabel["channel"], "Bounce FM" )
		elseif channel == 5 then
			guiSetText ( gLabel["channel"], "SF-UR" )
		elseif channel == 6 then
			guiSetText ( gLabel["channel"], "Radio Los Santos" )
		elseif channel == 7 then
			guiSetText ( gLabel["channel"], "Radio X" )
		elseif channel == 8 then
			guiSetText ( gLabel["channel"], "CSR 103.9" )
		elseif channel == 9 then
			guiSetText ( gLabel["channel"], "K-Jah West" )
		elseif channel == 10 then
			guiSetText ( gLabel["channel"], "Master Sounds FM" )
		elseif channel == 11 then
			guiSetText ( gLabel["channel"], "WCTR" )
		elseif channel == 12 then
			guiSetText ( gLabel["channel"], "User Track Player" )
		elseif channel == 13 then
			guiSetText ( gLabel["channel"], "Radio aus" )
		end
	else
		channel = 13
		guiSetText ( gLabel["channel"], "Radio aus" )
	end
	triggerEvent ( "radiochange", getLocalPlayer(), getLocalPlayer(), channel )
end

function nextOptionsMenueBtn ()

	if channel ~= 13 then
		channel = channel + 1
		if channel == 0 or channel == 1 then
			guiSetText ( gLabel["channel"], "Playback FM" )
		elseif channel == 2 then
			guiSetText ( gLabel["channel"], "K-Rose" )
		elseif channel == 3 then
			guiSetText ( gLabel["channel"], "K-DST" )
		elseif channel == 4 then
			guiSetText ( gLabel["channel"], "Bounce FM" )
		elseif channel == 5 then
			guiSetText ( gLabel["channel"], "SF-UR" )
		elseif channel == 6 then
			guiSetText ( gLabel["channel"], "Radio Los Santos" )
		elseif channel == 7 then
			guiSetText ( gLabel["channel"], "Radio X" )
		elseif channel == 8 then
			guiSetText ( gLabel["channel"], "CSR 103.9" )
		elseif channel == 9 then
			guiSetText ( gLabel["channel"], "K-Jah West" )
		elseif channel == 10 then
			guiSetText ( gLabel["channel"], "Master Sounds FM" )
		elseif channel == 11 then
			guiSetText ( gLabel["channel"], "WCTR" )
		elseif channel == 12 then
			guiSetText ( gLabel["channel"], "User Track Player" )
		elseif channel == 13 then
			guiSetText ( gLabel["channel"], "Radio aus" )
		end
	else
		channel = 1
		guiSetText ( gLabel["channel"], "Playback FM" )
	end
	triggerEvent ( "radiochange", getLocalPlayer(), getLocalPlayer(), channel )
end

function HelpMenueBtn ()

	guiSetVisible( gWindows["selfclick"], false )
	guiSetVisible( bonusmenue, false )
	guiSetVisible ( gWindow["options"], false )
	triggerEvent ( "ShowHelpmenueGui", getLocalPlayer() )
end

function _createOptionmenue_func()

	if gWindow["options"] then
		guiSetVisible ( gWindow["options"], true )
	else
		if vnxClientGetElementData ( "favchannel" ) == nil then channel = 6 else channel = tonumber ( vnxClientGetElementData ( "favchannel" ) ) end
		
		gWindow["options"] = guiCreateWindow(screenwidth/2-335/2,120,335,420+60,"Optionen",false)
		guiSetAlpha(gWindow["options"],1)
		guiWindowSetMovable ( gWindow["options"], false )
		guiWindowSetSizable ( gWindow["options"], false )
			
		gButton["bonusmenue"] = guiCreateButton(275*0.0327,150*0.2095,275*0.3455,150*0.2365,"Bonusmenue",false,gWindow["options"])
		guiSetAlpha(gButton["bonusmenue"],1)
		gButton["<"] = guiCreateButton(209,77,18,19,"<",false,gWindow["options"])
		guiSetAlpha(gButton["<"],1)
		gButton[">"] = guiCreateButton(231,77,18,19,">",false,gWindow["options"])
		guiSetAlpha(gButton[">"],1)
		gButton["helpmenue"] = guiCreateButton(9,104,95,34,"Hilfemenue",false,gWindow["options"])
		guiSetAlpha(gButton["helpmenue"],1)
		gButton["egoSight"] = guiCreateButton(9,164,95,34,"First-Person-\nSicht",false,gWindow["options"])
		guiSetAlpha(gButton["egoSight"],1)
		gButton["reddot"] = guiCreateButton(9,224,95,34,"Rotpunktvisir",false,gWindow["options"])
		guiSetAlpha(gButton["reddot"],1)
		gButton["socialState"] = guiCreateButton(9,284,95,34,"Sozialer\nStatus",false,gWindow["options"])
		guiSetAlpha(gButton["socialState"],1)
		gButton["spawnSelection"] = guiCreateButton(9,344,95,34,"Startpunkt",false,gWindow["options"])
		guiSetAlpha(gButton["spawnSelection"],1)
		gButton["changePW"] = guiCreateButton(9,344+60,95,34,"Passwort\naendern",false,gWindow["options"])
		guiSetAlpha(gButton["changePW"],1)
		
		addEventHandler("onClientGUIClick", gButton["bonusmenue"], BonusMenueBtn, false)
		addEventHandler("onClientGUIClick", gButton["<"], prevOptionsMenueBtn, false)
		addEventHandler("onClientGUIClick", gButton[">"], nextOptionsMenueBtn, false)
		addEventHandler("onClientGUIClick", gButton["helpmenue"], HelpMenueBtn, false)
		addEventHandler("onClientGUIClick", gButton["egoSight"], 
		function ( btn, state )
			if state == "up" then
				executeCommandHandler ( "ego" )
			end
		end, false)
		addEventHandler("onClientGUIClick", gButton["reddot"], 
		function ( btn, state )
			if state == "up" then
				executeCommandHandler ( "reddot" )
			end
		end, false)
		addEventHandler("onClientGUIClick", gButton["socialState"], 
		function ( btn, state )
			if state == "up" then
				guiSetVisible ( gWindow["options"], false )
				showSocialRankWindow ()
			end
		end, false)
		addEventHandler("onClientGUIClick", gButton["spawnSelection"], 
		function ( btn, state )
			if state == "up" then
				guiSetVisible ( gWindow["options"], false )
				showSpawnSelection ()
			end
		end, false)
		addEventHandler("onClientGUIClick", gButton["changePW"], 
		function ( btn, state )
			if state == "up" then
				triggerServerEvent ( "newPW", lp, guiGetText ( gEdit["newPW1"] ), guiGetText ( gEdit["newPW2"] ) )
			end
		end, false)
		
		gLabel["favsender"] = guiCreateLabel(275*0.0364,150*0.5135,275*0.3491,150*0.1419,"Lieblingssender:",false,gWindow["options"])
		guiSetFont(gLabel["favsender"],"default-bold-small")
		guiSetAlpha(gLabel["favsender"],1)
		guiLabelSetColor(gLabel["favsender"],000,000,200)
		guiLabelSetVerticalAlign(gLabel["favsender"],"top")
		guiLabelSetHorizontalAlign(gLabel["favsender"],"left",false)
		gLabel["channel"] = guiCreateLabel(275*0.4,150*0.5135,275*0.3491,150*0.1284,"",false,gWindow["options"])
		guiSetFont(gLabel["channel"],"default-bold-small")
		if channel == 0 or channel == 1 then
			guiSetText ( gLabel["channel"], "Playback FM" )
		elseif channel == 2 then
			guiSetText ( gLabel["channel"], "K-Rose" )
		elseif channel == 3 then
			guiSetText ( gLabel["channel"], "K-DST" )
		elseif channel == 4 then
			guiSetText ( gLabel["channel"], "Bounce FM" )
		elseif channel == 5 then
			guiSetText ( gLabel["channel"], "SF-UR" )
		elseif channel == 6 then
			guiSetText ( gLabel["channel"], "Radio Los Santos" )
		elseif channel == 7 then
			guiSetText ( gLabel["channel"], "Radio X" )
		elseif channel == 8 then
			guiSetText ( gLabel["channel"], "CSR 103.9" )
		elseif channel == 9 then
			guiSetText ( gLabel["channel"], "K-Jah West" )
		elseif channel == 10 then
			guiSetText ( gLabel["channel"], "Master Sounds" )
		elseif channel == 11 then
			guiSetText ( gLabel["channel"], "WCTR" )
		elseif channel == 12 then
			guiSetText ( gLabel["channel"], "User Track Player" )
		elseif channel == 13 then
			guiSetText ( gLabel["channel"], "Radio aus" )
		end
		guiSetAlpha(gLabel["channel"],1)
		guiLabelSetColor(gLabel["channel"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["channel"],"top")
		guiLabelSetHorizontalAlign(gLabel["channel"],"left",false)
		
		gLabel["bonuspoints"] = guiCreateLabel(275*0.4036,150*0.1959,275*0.5709,150*0.2365,"Hier kannst du Bonuspunkte\nfuer besonderes ausgeben",false,gWindow["options"])
		guiSetFont(gLabel["bonuspoints"],"default-bold-small")
		guiSetAlpha(gLabel["bonuspoints"],1)
		guiLabelSetColor(gLabel["bonuspoints"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["bonuspoints"],"top")
		guiLabelSetHorizontalAlign(gLabel["bonuspoints"],"left",false)
		
		gLabel["helpmenue"] = guiCreateLabel(275*0.3964,150*0.69,275*0.5709,150*0.2297,"Hier kannst du Hilfe erhalten,\nwenn du Probleme hast.",false,gWindow["options"])
		guiSetFont(gLabel["helpmenue"],"default-bold-small")
		guiSetAlpha(gLabel["helpmenue"],1)
		guiLabelSetColor(gLabel["helpmenue"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["helpmenue"],"top")
		guiLabelSetHorizontalAlign(gLabel["helpmenue"],"left",false)
		
		gLabel["egoInfo"] = guiCreateLabel(275*0.3964,164,275*0.5709,150*0.2297,"Eine komplett neue Sicht -\nbesonders beim Fahren!",false,gWindow["options"])
		guiSetFont(gLabel["egoInfo"],"default-bold-small")
		guiSetAlpha(gLabel["egoInfo"],1)
		guiLabelSetColor(gLabel["egoInfo"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["egoInfo"],"top")
		guiLabelSetHorizontalAlign(gLabel["egoInfo"],"left",false)
		
		gLabel["reddotInfo"] = guiCreateLabel(275*0.3964,224,275*0.5709,150*0.2297+20,"Alle deine Waffen werden\nmit einem Rotpunkt-Visir\naugestattet!",false,gWindow["options"])
		guiSetFont(gLabel["reddotInfo"],"default-bold-small")
		guiSetAlpha(gLabel["reddotInfo"],1)
		guiLabelSetColor(gLabel["reddotInfo"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["reddotInfo"],"top")
		guiLabelSetHorizontalAlign(gLabel["reddotInfo"],"left",false)
		
		gLabel["socialInfo"] = guiCreateLabel(275*0.3964,284,275*0.5709,150*0.2297+20,"Hier kannst du deinen\nsozialen Status auswaehlen!",false,gWindow["options"])
		guiSetFont(gLabel["socialInfo"],"default-bold-small")
		guiSetAlpha(gLabel["socialInfo"],1)
		guiLabelSetColor(gLabel["socialInfo"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["socialInfo"],"top")
		guiLabelSetHorizontalAlign(gLabel["socialInfo"],"left",false)
		
		gLabel["spawnInfo"] = guiCreateLabel(275*0.3964,344,275*0.5709,150*0.2297+20,"Hier kannst du den Punkt veraendern,\nan dem du startest.",false,gWindow["options"])
		guiSetFont(gLabel["spawnInfo"],"default-bold-small")
		guiSetAlpha(gLabel["spawnInfo"],1)
		guiLabelSetColor(gLabel["spawnInfo"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["spawnInfo"],"top")
		guiLabelSetHorizontalAlign(gLabel["spawnInfo"],"left",false)
		
		gLabel["passwordInfo"] = guiCreateLabel(275*0.3964,344 + 60,275*0.5709,150*0.2297+20,"Hier kannst du\ndein Passwort aendern!",false,gWindow["options"])
		guiSetFont(gLabel["passwordInfo"],"default-bold-small")
		guiSetAlpha(gLabel["passwordInfo"],1)
		guiLabelSetColor(gLabel["passwordInfo"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["passwordInfo"],"top")
		guiLabelSetHorizontalAlign(gLabel["passwordInfo"],"left",false)
		
		gEdit["newPW1"] = guiCreateEdit ( 109, 404+37, 80, 30, "", false, gWindow["options"] )
		gEdit["newPW2"] = guiCreateEdit ( 109+100, 404+37, 80, 30, "", false, gWindow["options"] )
	end
end
addEvent ( "_createOptionmenue", true )
addEventHandler ( "_createOptionmenue", getRootElement(), _createOptionmenue_func )]]