jobTexts = {}
 jobTexts[1] = "\"Las Venturas Bau Co.\" braucht fleißige Arbeiter,\ndie ihr Geld auf ehrliche\nArt und Weise verdienen wollen!\nGebraucht wird für den Anfang nichts."
 jobTexts[2] = "\"San Andreas Fishing Co.\" sucht fähige See-\nleute, die auch bei Sturm und Regen\nnicht aufgeben. Bezahlt wird nach\nFangmenge, jeder mit Angel -\nund Motorbootschein ist willkommen!"
 jobTexts[3] = "\"Ammunation San Fierro\" sucht Mitarbeiter\nfuer die Strasse, jedoch ist ein Waffenschein\nPflicht."
 jobTexts[4] = "Du willst dir mit (mehr oder weniger) legaler\nArbeit etwas Geld verdienen?\nDann melde dich!"
 jobTexts[5] = "\"San Andreas Taxis\" sucht freie Mitarbeiter,\nbezahlt wird nnach Leistung pro Zeit.\nDu hast einen Führerschein, kennst dich\nin der Stadt aus und hast gern mit Leuten\nzu tun? Du schließt schnell mit\nFremden Freundschaften und suchst eine\nentspannte Moeglichkeit, Geld zu verdienen?\nDann komm jetzt vorbei und fang\nnoch heute an - Wir warten!"
 jobTexts[6] = "Du bist ein guter Fahrer, der\nsich viel Geld bei kleinem\nRisiko verdienen will?\nDann melde dich an\nden Docks!"
 jobTexts[7] = "Wenn dir der Geruch von altem Frittenfett\nund ein paar verdorbene Maegen\nnichts anhaben koennen, dann bist\ndu hier richtig! Freie Mitarbeiter\nwerden immer gesucht.\nBenötigt: Führerschein"
-- jobTexts[7] = "Schnelles Geld bei geringem\nZeitaufwand und genug Respekt.\nBenoetigt: Waffenschein, Fuehrerschein,\nSilent-Assasin Achievment ( Mission \"The Truth\nis out there!\""
 jobTexts[8] = "Vom Kofferpacker bis zum Frachtpilot\n- Fang bei 0 an und arbeite dich hoch!\nBenötigt: Führerschein"
 jobTexts[9] = "Ein schmutziges Geschaeft: Vom Pfand-\nflaschensammler bis zum Muellwagenfahrer\nist alles moeglich!"
 jobTexts[10] = "Einfache Arbeit, die gutes Geld\neinbringt - spaeter auch mit dem Traktor\noder Mähdrescher."
 jobTexts[11] = "\"San Fierro Verkehr\" sucht fähige Busfahrer,\ndie Verantwortung übernehmen können.\nBenötigt: Führerschein und LKW Lizenz."
 jobTexts[12] = "\"San Andreas Bahn\" benötigt dringend Zugführer.\nDer Verdienst ist durchschnittlich, Einschulung übernehmen wird.\nWir freuen uns über ein Bewerbungsgespräch!\nBenötigt: Führerschein"
 jobTexts[13] = "\"San Fierro Verkehr\" sucht Tramführer.\nWenn du die Stadt San Fierro liebst\nund sie immer wieder sehen willst,\nsowie dich nicht vor dem Kontakt anderer scheust und Verantwort\nübernehmen kannst, bist du hier richtig.\nBenötigt: Führerschein"
 jobTexts[14] = "Du willst Baulieferant sein ? Dann fahr zu uns fuer den Naechsten Job"

jobNames = {}
 jobNames[1] = "Bauarbeiter"
 jobNames[2] = "Fischer"
 jobNames[3] = "Waffendealer"
 jobNames[4] = "Dealer"
 jobNames[5] = "Taxifahrer"
 jobNames[6] = "Transporteur"
 jobNames[7] = "Hotdogverkaeufer"
 jobNames[8] = "Flughafen"
 jobNames[9] = "Strassenreinigung"
 jobNames[10] = "Farmer"
 jobNames[12] = "Zugführer"
 jobNames[14] = "Baulieferant"
 
jobInfo = {}
 jobInfo[1] = "Nein"
 jobInfo[2] = "Nein"
 jobInfo[3] = "Ja"
 jobInfo[4] = "Ja"
 jobInfo[5] = "Ja"
 jobInfo[6] = "Nein"
 jobInfo[7] = "Ja"
 jobInfo[8] = "Nein"
 jobInfo[9] = "Nein"
 jobInfo[10] = "Nein"
 jobInfo[12] = "Nein"
 jobInfo[14] = "Nein"

function killcityhallmarker_func ()

	if jobBlipCityhall then destroyElement ( jobBlipCityhall ) end
end
addEvent ( "killcityhallmarker", true )
addEventHandler ( "killcityhallmarker", getRootElement(), killcityhallmarker_func )

function showJobGui_func ()
	
	showJobGUI ()
end
addEvent ( "showJobGui", true )
addEventHandler ( "showJobGui", getRootElement(), showJobGui_func )

function hideJobGui ( btn, state )

	if btn == "left" and gWindow["jobs"] then
		guiSetVisible(gWindow["jobs"], false)
		showCursor(false)
		triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
	end
end

--[[function refreshJobInfo ()

	
end
]]

function anzeigenJobGui ( btn, state )

	if state == "up" then
		guiSetVisible(gWindow["jobs"], false)
		showCursor(false)
		triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
		outputChatBox ( "Die Position des Arbeitgebers wird dir nun auf der Karte angezeigt. Tippe /job um den Marker zu löschen.",  0, 125, 0 )
		if jobnr == 1 then
			jobBlipCityhall = createBlip ( 816.79998779297, 856.79998779297, 12.5, 41, 1 )					-- Bauarbeiter
		elseif jobnr == 2 then
			jobBlipCityhall = createBlip ( -1724.9904785156, 1461.3231201172, 7, 41, 1 )					-- Fischer
		elseif jobnr == 3 then
			jobBlipCityhall = createBlip ( -2627.5083007813, 209.36631774902, 4.1959328651428, 41, 1 )		-- Waffendealer
		elseif jobnr == 4 then
			jobBlipCityhall = createBlip ( -1868.9344482422, -144.03060913086, 11.665347099304, 41, 1 ) 	-- Dealer
		elseif jobnr == 5 then
			jobBlipCityhall = createBlip ( -2543.2326660156, 1228.1779785156, 37.116344451904, 41, 1 )		-- Taxifahrer
		elseif jobnr == 6 then
			jobBlipCityhall = createBlip ( -1828.4, 99.5, 14.76, 41, 1 )									-- Transporteur
		elseif jobnr == 7 then
			--jobBlipCityhall = createBlip ( -1830.7301025391, 572.65557861328, 34.81, 41, 1 )				-- Hitman
			jobBlipCityhall = createBlip ( -1706.1116943359, 13.159648895264, 3.2039132118225, 41, 1 )		-- Hotdogverkaeufer
		elseif jobnr == 8 then
			jobBlipCityhall = createBlip ( -1414.8072509766, -299.4963684082, 5.8523507118225, 41, 1 )		-- Flughafenarbeiter
		elseif jobnr == 9 then
			jobBlipCityhall = createBlip ( -1897.1510009766, -1671.5749511719, 22.664850234985, 41, 1 )		-- Strassenreinigung
		elseif jobnr == 10 then
			jobBlipCityhall = createBlip ( -1058.36, -1195.6, 128.83, 41, 1 )								-- Farmer
		elseif jobnr == 12 then
			jobBlipCityhall = createBlip ( -1058.36, -1195.6, 128.83, 41, 1 )								-- Zugführer
		elseif jobnr == 14 then
			jobBlipCityhall = createBlip ( -1058.36, -1195.6, 128.83, 41, 1 )								-- Baulieferant
		end
	end
end

function showJobGUI()

	if gWindow["jobs"] then
		guiSetVisible ( gWindow["jobs"], true )
	else
		gWindow["jobs"] = guiCreateWindow(screenwidth/2-451/2,screenheight/2-383/2,451,383,"Jobcenter",false)
		guiSetAlpha(gWindow["jobs"],1)
		gImage["jobStar"] = guiCreateStaticImage(9,38,38,31,"images/internet/star.png",false,gWindow["jobs"])
		guiSetAlpha(gImage["jobStar"],1)
		gLabel["jobText1"] = guiCreateLabel(49,19,394,69,"Herzlich wilkommen im Jobcenter!\nHier kannst du dich über die einzelnen Jobs informieren,\nmit denen du Geld verdienen kannst.\nFür den Anfang werden Jobs empfohlen, die nicht Spielerbasiert sind\n- also auch ohne andere Spieler funktionieren.",false,gWindow["jobs"])
		guiSetAlpha(gLabel["jobText1"],1)
		guiLabelSetColor(gLabel["jobText1"],200,000,0)
		guiLabelSetVerticalAlign(gLabel["jobText1"],"top")
		guiLabelSetHorizontalAlign(gLabel["jobText1"],"left",false)
		guiSetFont(gLabel["jobText1"],"default-bold-small")
		gGrid["joblist"] = guiCreateGridList(9,100,177,272,false,gWindow["jobs"])
		guiGridListSetSelectionMode(gGrid["joblist"],0)
		gColumn["job"] = guiGridListAddColumn(gGrid["joblist"],"Job",0.8)
		guiSetAlpha(gGrid["joblist"],1)
		gLabel["jobText2"] = guiCreateLabel(190,101,258,225,"Bitte waehle einen Job aus der Liste aus!",false,gWindow["jobs"])
		guiSetAlpha(gLabel["jobText2"],1)
		guiLabelSetColor(gLabel["jobText2"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["jobText2"],"top")
		guiLabelSetHorizontalAlign(gLabel["jobText2"],"left",false)
		guiSetFont(gLabel["jobText2"],"default-bold-small")
		gButtons["jobanzeigen"] = guiCreateButton(264,328,95,45,"Position anzeigen",false,gWindow["jobs"])
		guiSetAlpha(gButtons["jobanzeigen"],1)
		guiSetFont(gButtons["jobanzeigen"],"default-bold-small")
		gButtons["jobcancel"] = guiCreateButton(424,26,15,17,"x",false,gWindow["jobs"])
		guiSetAlpha(gButtons["jobcancel"],1)
		
		addEventHandler("onClientGUIClick", gButtons["jobcancel"], hideJobGui, false)
		addEventHandler("onClientGUIClick", gButtons["jobanzeigen"], anzeigenJobGui, false)
		
		guiWindowSetSizable ( gWindow["jobs"], false )
		guiWindowSetMovable ( gWindow["jobs"], false )
		
		local row = guiGridListAddRow ( gGrid["joblist"] )
		guiGridListSetItemText ( gGrid["joblist"], row, gColumn["job"], "Empfohlen", true, false )
		guiGridListSetItemColor ( gGrid["joblist"], row, gColumn["job"], 0, 200, 0, 255 )
		for key, index in pairs ( jobInfo ) do
			if index == "Nein" then
				local row = guiGridListAddRow ( gGrid["joblist"] )
				guiGridListSetItemText ( gGrid["joblist"], row, gColumn["job"], jobNames[key], false, false )
				addEventHandler("onClientGUIClick", gGrid["joblist"], 
					function ()
						local row, column = guiGridListGetSelectedItem ( gGrid["joblist"] )
						local rowtext = guiGridListGetItemText ( gGrid["joblist"], row, column )
						for key, index in pairs ( jobNames ) do
							if rowtext == index then
								jobnr = key
								guiSetText ( gLabel["jobText2"], jobTexts[key] )
								break
							end
						end
					end
				)
			end
		end
		local row = guiGridListAddRow ( gGrid["joblist"] )
		guiGridListSetItemText ( gGrid["joblist"], row, gColumn["job"], "Spielerbasiert", true, false )
		guiGridListSetItemColor ( gGrid["joblist"], row, gColumn["job"], 200, 0, 0, 255 )
		for key, index in pairs ( jobInfo ) do
			if index == "Ja" then
				local row = guiGridListAddRow ( gGrid["joblist"] )
				guiGridListSetItemText ( gGrid["joblist"], row, gColumn["job"], jobNames[key], false, false )
				addEventHandler("onClientGUIClick", gGrid["joblist"], 
					function ()
						local row, column = guiGridListGetSelectedItem ( gGrid["joblist"] )
						local rowtext = guiGridListGetItemText ( gGrid["joblist"], row, column )
						for key, index in pairs ( jobNames ) do
							if rowtext == index then
								jobnr = key
								guiSetText ( gLabel["jobText2"], jobTexts[key] )
								break
							end
						end
					end
				)
			end
		end
	end
end