function cancelRathausMenue ( button )

	guiSetVisible(gWindow["rathausbg"], false)
	showCursor(false)
	triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
end

function beantragen ( button, state )

	if button == "left" then
		cancelRathausMenue ( button )
		triggerServerEvent ( "LizenzKaufen", getLocalPlayer(), getLocalPlayer(), license )
	end
end

function ShowRathausMenue_func()

	_createCityhallGui()
end
addEvent ( "ShowRathausMenue", true)
addEventHandler ( "ShowRathausMenue", getLocalPlayer(),  ShowRathausMenue_func)

function _createCityhallGui()

	if gWindow["rathausbg"] then
		guiSetVisible ( gWindow["rathausbg"], true )
	else
		--gWindow["rathausbg"] = guiCreateWindow(screenwidth/2-500/2,screenheight/2-251/2,500,251,"Stadthalle",false)
		gWindow["rathausbg"] = guiCreateStaticImage(screenwidth/2-500/2,screenheight/2-251/2,500,251,"images/hud/background.png",false)
		guiSetAlpha(gWindow["rathausbg"],1)
		gGrid["Licenses"] = guiCreateGridList(0.0201,0.2709,0.4509,0.6773,true,gWindow["rathausbg"])
		guiGridListSetSelectionMode(gGrid["Licenses"],0)
		gColumn["cityhallLicense"] = guiGridListAddColumn(gGrid["Licenses"],"Schein",0.51)
		gColumn["cityhallPreis"] = guiGridListAddColumn(gGrid["Licenses"],"Preis",0.25)
		gColumn["cityhallVorhanden"] = guiGridListAddColumn(gGrid["Licenses"],"",0.04)
		guiSetAlpha(gGrid["Licenses"],1)
		gLabel["cityhalInfotext1"] = guiCreateLabel(0.0179,0.0797,0.9688,0.1753,"Herzlich wilkommen bei der Stadthalle!\nHier kannst du neue Scheine erwerben sowie dir einen neuen Job besorgen -\ndafuer schliesse dieses Fenster und begib dich zum Aktenkoffer neben an.",true,gWindow["rathausbg"])
		guiSetAlpha(gLabel["cityhalInfotext1"],1)
		guiLabelSetColor(gLabel["cityhalInfotext1"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["cityhalInfotext1"],"top")
		guiLabelSetHorizontalAlign(gLabel["cityhalInfotext1"],"left",false)
		guiSetFont(gLabel["cityhalInfotext1"],"default-bold-small")
		gLabel["cityhalInfotext2"] = guiCreateLabel(0.6228,0.3347,0.1964,0.0677,"Fuehrerschein",true,gWindow["rathausbg"])
		guiSetAlpha(gLabel["cityhalInfotext2"],1)
		guiLabelSetColor(gLabel["cityhalInfotext2"],200,200,000)
		guiLabelSetVerticalAlign(gLabel["cityhalInfotext2"],"top")
		guiLabelSetHorizontalAlign(gLabel["cityhalInfotext2"],"left",false)
		guiSetFont(gLabel["cityhalInfotext2"],"default-bold-small")
		gLabel["cityhalInfotext3"] = guiCreateLabel(0.4888,0.4024,0.4866,0.2231,"Mit einem Fuehrerschein kannst du\nalle Autos fahren, jedoch ist eine\ntheoretische und praktische Pruefung\nPflicht.",true,gWindow["rathausbg"])
		guiSetAlpha(gLabel["cityhalInfotext3"],1)
		guiLabelSetColor(gLabel["cityhalInfotext3"],125,125,200)
		guiLabelSetVerticalAlign(gLabel["cityhalInfotext3"],"top")
		guiLabelSetHorizontalAlign(gLabel["cityhalInfotext3"],"left",false)
		guiSetFont(gLabel["cityhalInfotext3"],"default-bold-small")
		gButton["beantragen"] = guiCreateButton(0.5022,0.7729,0.2143,0.1633,"Beantragen",true,gWindow["rathausbg"])
		guiSetAlpha(gButton["beantragen"],1)
		gButton["schliessen"] = guiCreateButton(0.75,0.7729,0.2143,0.1633,"Schliessen",true,gWindow["rathausbg"])
		guiSetAlpha(gButton["schliessen"],1)
		
		addEventHandler("onClientGUIClick", gButton["schliessen"], cancelRathausMenue, true)
		addEventHandler("onClientGUIClick", gButton["beantragen"], beantragen, true)
		
		refreshCityhallTexts()
	end
	refreshLicenses()
end

function rathausClick ()
	if gWindow["rathausbg"] then
		local rowindex, columnindex = guiGridListGetSelectedItem ( gGrid["Licenses"] )
		local selectedText = guiGridListGetItemText ( gGrid["Licenses"], rowindex, gColumn["cityhallLicense"] )
		if selectedText == "Fuehrerschein" then
			license = "car"
			refreshCityhallTexts()
		elseif selectedText == "Flugschein B" then
			license = "planeb"
			refreshCityhallTexts()
		elseif selectedText == "Flugschein A" then
			license = "planea"
			refreshCityhallTexts()
		elseif selectedText == "Helikopterschein" then
			license = "heli"
			refreshCityhallTexts()
		elseif selectedText == "Motorbootschein" then
			license = "motorboot"
			refreshCityhallTexts()
		elseif selectedText == "Segelschein" then
			license = "raft"
			refreshCityhallTexts()
		elseif selectedText == "LKW-Fuehrerschein" then
			license = "lkw"
			refreshCityhallTexts()
		elseif selectedText == "Personalausweis" then
			license = "perso"
			refreshCityhallTexts()
		elseif selectedText == "Angelschein" then
			license = "fishing"
			refreshCityhallTexts()
		elseif selectedText == "Motorradschein" then
			license = "bike"
			refreshCityhallTexts()
		elseif selectedText == "Waffenschein" then
			license = "wschein"
			refreshCityhallTexts()
		elseif selectedText == "Max. Fahrzeuge" then
			license = "maxveh"
			refreshCityhallTexts()
		end
	end
end
addEventHandler ( "onClientGUIClick", getRootElement(), rathausClick )

function refreshLicenses()

	guiGridListClear ( gGrid["Licenses"] )
	
	local row = guiGridListAddRow ( gGrid["Licenses"] )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallLicense"], "Fuehrerschein", false, false )
	if getElementData ( getLocalPlayer(), "playingtime" ) >= 60 * 50 then
		guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallPreis"], "4.750 $", false, false )
	elseif getElementData ( getLocalPlayer(), "playingtime" ) >= 60 * 25 then
		guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallPreis"], "1.750 $", false, false )
	else
		guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallPreis"], "750 $", false, false )
	end
	if vnxClientGetElementData ( "carlicense" ) == 1 then fix = "[x]" else fix = "[_]" end
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallVorhanden"], fix, false, false )
	
	local row = guiGridListAddRow ( gGrid["Licenses"] )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallLicense"], "Motorradschein", false, false )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallPreis"], "450 $", false, false )
	if vnxClientGetElementData ( "bikelicense" ) == 1 then fix = "[x]" else fix = "[_]" end
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallVorhanden"], fix, false, false )
	
	local row = guiGridListAddRow ( gGrid["Licenses"] )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallLicense"], "LKW-Fuehrerschein", false, false )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallPreis"], "450 $", false, false )
	if vnxClientGetElementData ( "lkwlicense" ) == 1 then fix = "[x]" else fix = "[_]" end
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallVorhanden"], fix, false, false )
	
	local row = guiGridListAddRow ( gGrid["Licenses"] )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallLicense"], "Flugschein A", false, false )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallPreis"], "15.000 $", false, false )
	if vnxClientGetElementData ( "planelicensea" ) == 1 then fix = "[x]" else fix = "[_]" end
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallVorhanden"], fix, false, false )
	
	local row = guiGridListAddRow ( gGrid["Licenses"] )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallLicense"], "Flugschein B", false, false )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallPreis"], "34.950 $", false, false )
	if vnxClientGetElementData ( "planelicenseb" ) == 1 then fix = "[x]" else fix = "[_]" end
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallVorhanden"], fix, false, false )
	
	local row = guiGridListAddRow ( gGrid["Licenses"] )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallLicense"], "Helikopterschein", false, false )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallPreis"], "20.000 $", false, false )
	if vnxClientGetElementData ( "helilicense" ) == 1 then fix = "[x]" else fix = "[_]" end
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallVorhanden"], fix, false, false )
	
	local row = guiGridListAddRow ( gGrid["Licenses"] )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallLicense"], "Motorbootschein", false, false )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallPreis"], "400 $", false, false )
	if vnxClientGetElementData ( "motorbootlicense" ) == 1 then fix = "[x]" else fix = "[_]" end
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallVorhanden"], fix, false, false )
	
	local row = guiGridListAddRow ( gGrid["Licenses"] )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallLicense"], "Segelschein", false, false )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallPreis"], "350 $", false, false )
	if vnxClientGetElementData ( "segellicense" ) == 1 then fix = "[x]" else fix = "[_]" end
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallVorhanden"], fix, false, false )
	
	local row = guiGridListAddRow ( gGrid["Licenses"] )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallLicense"], "Waffenschein", false, false )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallPreis"], "10.000 $", false, false )
	if vnxClientGetElementData ( "gunlicense" ) == 1 then fix = "[x]" else fix = "[_]" end
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallVorhanden"], fix, false, false )
	
	local row = guiGridListAddRow ( gGrid["Licenses"] )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallLicense"], "Angelschein", false, false )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallPreis"], "79 $", false, false )
	if vnxClientGetElementData ( "fishinglicense" ) == 1 then fix = "[x]" else fix = "[_]" end
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallVorhanden"], fix, false, false )
	
	local row = guiGridListAddRow ( gGrid["Licenses"] )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallLicense"], "Personalausweis", false, false )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallPreis"], "40 $", false, false )
	if vnxClientGetElementData ( "perso" ) == 1 then fix = "[x]" else fix = "[_]" end
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallVorhanden"], fix, false, false )
	
	local row = guiGridListAddRow ( gGrid["Licenses"] )
	local thepreis = convertNumber(fahrzeugslotprice[vnxClientGetElementData( "maxcars")])
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallLicense"], "Max. Fahrzeuge", false, false )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallPreis"], thepreis.." $", false, false )
	if vnxClientGetElementData ( "maxcars" ) >= 15 then fix = "[x]" else fix = "[_]" end
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["cityhallVorhanden"], fix, false, false )

	license = "car"
	refreshCityhallTexts()
end

function refreshCityhallTexts()

	--[[
		license = "wschein"
		
		license = "bike"
		license = "fishing"
		license = "perso"
		license = "lkw"
		license = "raft"
		license = "motorboot"
		license = "planeb"
		license = "car"
		license = "heli"
		license = "planea"
		license = "maxveh"
	]]
	if license == "car" then
		guiSetText ( gLabel["cityhalInfotext2"], "Fuehrerschein" )
		guiSetText ( gLabel["cityhalInfotext3"], "Mit einem Fuehrerschein kannst du\nalle Autos fahren, jedoch ist eine\ntheoretische und praktische Pruefung\nPflicht." )
	elseif license == "planeb" then
		guiSetText ( gLabel["cityhalInfotext2"], "Flugschein B" )
		guiSetText ( gLabel["cityhalInfotext3"], "Mit einem Flugschein B kannst du\nalle Flugzeuge fliegen, egal wie goss.\nWichtig: Flugschein Klasse A wird benoetigt!" )
	elseif license == "planea" then
		guiSetText ( gLabel["cityhalInfotext2"], "Flugschein A" )
		guiSetText ( gLabel["cityhalInfotext3"], "Mit einem Flugschein A kannst du\nalle kleineren Flugzeuge fliegen." )
	elseif license == "heli" then
		guiSetText ( gLabel["cityhalInfotext2"], "Helikopterschein" )
		guiSetText ( gLabel["cityhalInfotext3"], "Mit einem Flugschein fuer Helikopter\nkannst du alle arten von\nHelikoptern fliegen." )
	elseif license == "motorboot" then
		guiSetText ( gLabel["cityhalInfotext2"], "Motorbootschein" )
		guiSetText ( gLabel["cityhalInfotext3"], "Mit einem Motorbootschein kannst du\nalle arten von Booten mit\nMotor fahren." )
	elseif license == "raft" then
		guiSetText ( gLabel["cityhalInfotext2"], "Segelschein" )
		guiSetText ( gLabel["cityhalInfotext3"], "Mit einem Segelschein kannst du\nauch Schiffe mit Segel fahren.\nWichtig: Motorbootschein wird benoetigt!" )
	elseif license == "lkw" then
		guiSetText ( gLabel["cityhalInfotext2"], "LKW-Fuehrerschein" )
		guiSetText ( gLabel["cityhalInfotext3"], "	Mit einem LKW-Fuehrerschein\nkannst du alle groesseren und\nkleineren Trucks fahren.\nWichtig: Fuehrerschein wird benoetigt!" )
	elseif license == "perso" then
		guiSetText ( gLabel["cityhalInfotext2"], "Personalausweis" )
		guiSetText ( gLabel["cityhalInfotext3"], "Ohne einen Personalausweiss kannst du\nbestimmte Locations nicht betreten." )
	elseif license == "fishing" then
		guiSetText ( gLabel["cityhalInfotext2"], "Angelschein" )
		guiSetText ( gLabel["cityhalInfotext3"], "Ohne Angelschein darfst du nicht fischen,\naussderm brauchst du ihn, wenn du\nals Fischer arbeiten willst." )
	elseif license == "bike" then
		guiSetText ( gLabel["cityhalInfotext2"], "Motorradschein" )
		guiSetText ( gLabel["cityhalInfotext3"], "Damit du mit einem Motorrad fahren darfst\nbenoetigst du diesen Schein." )
	elseif license == "wschein" then
		guiSetText ( gLabel["cityhalInfotext2"], "Waffenschein" )
		guiSetText ( gLabel["cityhalInfotext3"], "Ohne Waffenschein darfst du keine\nWaffen legal erwerben." )
	elseif license == "maxveh" then
		guiSetText ( gLabel["cityhalInfotext2"], "Max. Fahrzeuge" )
		guiSetText ( gLabel["cityhalInfotext3"], "Die Stadt erlaubt dir nur eine\ngewissen Anzahl von Fahrzeugen.\nDu kannst die Anzahl jedoch\nhier erhöhen." )
	end
end


function convertNumber ( number )  
	local formatted = number  
	while true do      
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1.%2')    
		if ( k==0 ) then      
			break   
		end  
	end  
	return formatted
end