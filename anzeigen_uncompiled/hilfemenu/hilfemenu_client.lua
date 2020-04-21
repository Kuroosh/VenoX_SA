open = false 
startseiteshow = false
regelwerkshow = false
berufeshow = false
businessshow = false
hueasershow = false
Fahrzeugeshow = false
serverdatenshow = false
Fraktionenshow = false
local screenX, screenY = guiGetScreenSize()
local sx, sy = screenX/1920, screenY/1080
function loadhelp()
	if open == false then
		open = true
		nativeHelpMenuStuff()
		addEventHandler("onClientRender", root, mainbackhelp)
		addEventHandler("onClientRender", root, startseite)
		startseiteshow = true
		regelwerkshow = false
		berufeshow = false
		businessshow = false
		hueasershow = false
		Fahrzeugeshow = false
		serverdatenshow = false
		Fraktionenshow = false
		showCursor(true)
	end
end
bindKey("f1", "down", loadhelp)
function nativeHelpMenuStuff()

        helpclosebtn = guiCreateStaticImage(sx*1346, sy*224, sx*51, sy*58, ":VenoX/images/white.bmp", false)
		addEventHandler("onClientMouseEnter", helpclosebtn, function() guiSetAlpha(helpclosebtn, 0.40) end)      
		addEventHandler("onClientMouseLeave", helpclosebtn, function() guiSetAlpha(helpclosebtn, 0.00) end)     
		addEventHandler("onClientGUIClick", helpclosebtn, 
		function()
				removeEventHandler( "onClientRender", root, business)
				removeEventHandler( "onClientRender", root, regelwerk)
				removeEventHandler( "onClientRender", root, berufe)
				removeEventHandler( "onClientRender", root, business)
				removeEventHandler( "onClientRender", root, fraktionen)
				removeEventHandler( "onClientRender", root, hueaser)
				removeEventHandler( "onClientRender", root, fahrzeuge)
				removeEventHandler( "onClientRender", root, serverdaten)
				removeEventHandler( "onClientRender", root, mainbackhelp)
				removeEventHandler( "onClientRender", root, startseite)
				destroyElement(helpclosebtn)
				destroyElement(helpstartbtn)
				destroyElement(helpbusinessbtn)
				destroyElement(helpcarsbtn)
				destroyElement(helphousebtn)
				destroyElement(helprgwbtn)
				destroyElement(helpfrakbtn)
				destroyElement(helpjobbtn)
				destroyElement(helpserverdatabtn)
				startseiteshow = false
				regelwerkshow = false
				berufeshow = false
				businessshow = false
				hueasershow = false
				Fahrzeugeshow = false
				serverdatenshow = false
				Fraktionenshow = false
				open = false
				showCursor(false)
		end)       

        helpstartbtn = guiCreateStaticImage(sx*550, sy*342, sx*179, sy*38, ":VenoX/images/white.bmp", false)
		addEventHandler("onClientMouseEnter", helpstartbtn, function() guiSetAlpha(helpstartbtn, 0.40) end)      
		addEventHandler("onClientMouseLeave", helpstartbtn, function() guiSetAlpha(helpstartbtn, 0.00) end) 
 		addEventHandler("onClientGUIClick", helpstartbtn, 
		function()
			if businessshow == true then
				removeEventHandler( "onClientRender", root, business)
				addEventHandler("onClientRender", root, startseite)
				businessshow = false
				startseiteshow = true
			end
			if regelwerkshow == true then
				removeEventHandler( "onClientRender", root, regelwerk)
				addEventHandler("onClientRender", root, startseite)
				regelwerkshow = false
				startseiteshow = true
			end
			if berufeshow == true then
				removeEventHandler( "onClientRender", root, berufe)
				addEventHandler("onClientRender", root, startseite)
				berufeshow = false
				startseiteshow = true
			end
			if hueasershow == true then
				removeEventHandler( "onClientRender", root, hueaser)
				addEventHandler("onClientRender", root, startseite)
				hueasershow = false
				startseiteshow = true
			end
			if Fahrzeugeshow == true then
				removeEventHandler( "onClientRender", root, fahrzeuge)
				addEventHandler("onClientRender", root, startseite)
				Fahrzeugeshow = false
				startseiteshow = true
			end
			if serverdatenshow == true then
				removeEventHandler( "onClientRender", root, serverdaten)
				addEventHandler("onClientRender", root, startseite)
				serverdatenshow = false
				startseiteshow = true
			end
			if Fraktionenshow == true then
				removeEventHandler( "onClientRender", root, fraktionen)
				addEventHandler("onClientRender", root, startseite)
				Fraktionenshow = false
				startseiteshow = true
			end
		end)		       


        helpbusinessbtn = guiCreateStaticImage(sx*550, sy*567, sx*179, sy*38, ":VenoX/images/white.bmp", false)
        addEventHandler("onClientMouseEnter", helpbusinessbtn, function() guiSetAlpha(helpbusinessbtn, 0.40) end)      
		addEventHandler("onClientMouseLeave", helpbusinessbtn, function() guiSetAlpha(helpbusinessbtn, 0.00) end) 
  		addEventHandler("onClientGUIClick", helpbusinessbtn, 
		function()
			if startseiteshow == true then
				removeEventHandler( "onClientRender", root, startseite)
				addEventHandler("onClientRender", root, business)
				businessshow = true
				startseiteshow = false
			end
			if regelwerkshow == true then
				removeEventHandler( "onClientRender", root, regelwerk)
				addEventHandler("onClientRender", root, business)
				regelwerkshow = false
				businessshow = true
			end
			if berufeshow == true then
				removeEventHandler( "onClientRender", root, berufe)
				addEventHandler("onClientRender", root, business)
				berufeshow = false
				businessshow = true
			end
			if hueasershow == true then
				removeEventHandler( "onClientRender", root, hueaser)
				addEventHandler("onClientRender", root, business)
				hueasershow = false
				businessshow = true
			end
			if Fahrzeugeshow == true then
				removeEventHandler( "onClientRender", root, fahrzeuge)
				addEventHandler("onClientRender", root, business)
				Fahrzeugeshow = false
				businessshow = true
			end
			if serverdatenshow == true then
				removeEventHandler( "onClientRender", root, serverdaten)
				addEventHandler("onClientRender", root, business)
				serverdatenshow = false
				businessshow = true
			end
			if Fraktionenshow == true then
				removeEventHandler( "onClientRender", root, fraktionen)
				addEventHandler("onClientRender", root, business)
				Fraktionenshow = false
				businessshow = true
			end
		end)	       


        helpcarsbtn = guiCreateStaticImage(sx*550, sy*456, sx*179, sy*38, ":VenoX/images/white.bmp", false)
        addEventHandler("onClientMouseEnter", helpcarsbtn, function() guiSetAlpha(helpcarsbtn, 0.40) end)      
		addEventHandler("onClientMouseLeave", helpcarsbtn, function() guiSetAlpha(helpcarsbtn, 0.00) end) 
  		addEventHandler("onClientGUIClick", helpcarsbtn, 
		function()
			if startseiteshow == true then
				removeEventHandler( "onClientRender", root, startseite)
				addEventHandler("onClientRender", root, fahrzeuge)
				startseiteshow = false
				Fahrzeugeshow = true
			end
			if regelwerkshow == true then
				--if Fahrzeugeshow == false then
					removeEventHandler( "onClientRender", root, regelwerk)
					addEventHandler("onClientRender", root, fahrzeuge)
					regelwerkshow = false
					Fahrzeugeshow = true
				--end
			end
			if berufeshow == true then
				removeEventHandler( "onClientRender", root, berufe)
				addEventHandler("onClientRender", root, fahrzeuge)
				berufeshow = false
				Fahrzeugeshow = true
			end
			if hueasershow == true then
				removeEventHandler( "onClientRender", root, hueaser)
				addEventHandler("onClientRender", root, fahrzeuge)
				hueasershow = false
				Fahrzeugeshow = true
			end
			if businessshow == true then
				removeEventHandler( "onClientRender", root, business)
				addEventHandler("onClientRender", root, fahrzeuge)
				businessshow = false
				Fahrzeugeshow = true
			end
			if serverdatenshow == true then
				--if Fahrzeugeshow == false then
					removeEventHandler( "onClientRender", root, serverdaten)
					addEventHandler("onClientRender", root, fahrzeuge)
					serverdatenshow = false
					Fahrzeugeshow = true
				--end
			end
			if Fraktionenshow == true then
				removeEventHandler( "onClientRender", root, fraktionen)
				addEventHandler("onClientRender", root, fahrzeuge)
				Fraktionenshow = false
				Fahrzeugeshow = true
			end
		end)        


        helphousebtn = guiCreateStaticImage(sx*550, sy*511, sx*179, sy*38, ":VenoX/images/white.bmp", false)
        addEventHandler("onClientMouseEnter", helphousebtn, function() guiSetAlpha(helphousebtn, 0.40) end)      
		addEventHandler("onClientMouseLeave", helphousebtn, function() guiSetAlpha(helphousebtn, 0.00) end) 
   		addEventHandler("onClientGUIClick", helphousebtn, 
		function()
			if startseiteshow == true then
				removeEventHandler( "onClientRender", root, startseite)
				addEventHandler("onClientRender", root, hueaser)
				startseiteshow = false
				hueasershow = true
			end
			if regelwerkshow == true then
				--if hueasershow == false then
					removeEventHandler( "onClientRender", root, regelwerk)
					addEventHandler("onClientRender", root, hueaser)
					regelwerkshow = false
					hueasershow = true
				--end
			end
			if berufeshow == true then
				removeEventHandler( "onClientRender", root, berufe)
				addEventHandler("onClientRender", root, hueaser)
				berufeshow = false
				hueasershow = true
			end
			if Fahrzeugeshow == true then
				removeEventHandler( "onClientRender", root, fahrzeuge)
				addEventHandler("onClientRender", root, hueaser)
				Fahrzeugeshow = false
				hueasershow = true
			end
			if businessshow == true then
				removeEventHandler( "onClientRender", root, business)
				addEventHandler("onClientRender", root, hueaser)
				businessshow = false
				hueasershow = true
			end
			if serverdatenshow == true then
				removeEventHandler( "onClientRender", root, serverdaten)
				addEventHandler("onClientRender", root, hueaser)
				serverdatenshow = false
				hueasershow = true
			end
			if Fraktionenshow == true then
				removeEventHandler( "onClientRender", root, fraktionen)
				addEventHandler("onClientRender", root, hueaser)
				Fraktionenshow = false
				hueasershow = true
			end
		end)       


        helprgwbtn = guiCreateStaticImage(sx*550, sy*399, sx*179, sy*38, ":VenoX/images/white.bmp", false)
        addEventHandler("onClientMouseEnter", helprgwbtn, function() guiSetAlpha(helprgwbtn, 0.40) end)      
		addEventHandler("onClientMouseLeave", helprgwbtn, function() guiSetAlpha(helprgwbtn, 0.00) end) 
   		addEventHandler("onClientGUIClick", helprgwbtn, 
		function()
			if startseiteshow == true then
				removeEventHandler( "onClientRender", root, startseite)
				addEventHandler("onClientRender", root, regelwerk)
				startseiteshow = false
				regelwerkshow = true
			end
			if hueasershow == true then
				removeEventHandler( "onClientRender", root, hueaser)
				addEventHandler("onClientRender", root, regelwerk)
				hueasershow = false
				regelwerkshow = true
			end
			if berufeshow == true then
				removeEventHandler( "onClientRender", root, berufe)
				addEventHandler("onClientRender", root, regelwerk)
				berufeshow = false
				regelwerkshow = true
			end
			if Fahrzeugeshow == true then
				removeEventHandler( "onClientRender", root, fahrzeuge)
				addEventHandler("onClientRender", root, regelwerk)
				Fahrzeugeshow = false
				regelwerkshow = true
			end
			if businessshow == true then
				removeEventHandler( "onClientRender", root, business)
				addEventHandler("onClientRender", root, regelwerk)
				businessshow = false
				regelwerkshow = true
			end
			if serverdatenshow == true then
				removeEventHandler( "onClientRender", root, serverdaten)
				addEventHandler("onClientRender", root, regelwerk)
				serverdatenshow = false
				regelwerkshow = true
			end
			if Fraktionenshow == true then
				removeEventHandler( "onClientRender", root, fraktionen)
				addEventHandler("onClientRender", root, regelwerk)
				Fraktionenshow = false
				regelwerkshow = true
			end
		end)   

        helpfrakbtn = guiCreateStaticImage(sx*550, sy*624, sx*179, sy*38, ":VenoX/images/white.bmp", false)
        addEventHandler("onClientMouseEnter", helpfrakbtn, function() guiSetAlpha(helpfrakbtn, 0.40) end)      
		addEventHandler("onClientMouseLeave", helpfrakbtn, function() guiSetAlpha(helpfrakbtn, 0.00) end) 
   		addEventHandler("onClientGUIClick", helpfrakbtn, 
		function()
			if startseiteshow == true then
				removeEventHandler( "onClientRender", root, startseite)
				addEventHandler("onClientRender", root, fraktionen)
				startseiteshow = false
				Fraktionenshow = true
			end
			if hueasershow == true then
				removeEventHandler( "onClientRender", root, hueaser)
				addEventHandler("onClientRender", root, fraktionen)
				hueasershow = false
				Fraktionenshow = true
			end
			if berufeshow == true then
				removeEventHandler( "onClientRender", root, berufe)
				addEventHandler("onClientRender", root, fraktionen)
				berufeshow = false
				Fraktionenshow = true
			end
			if Fahrzeugeshow == true then
				removeEventHandler( "onClientRender", root, fahrzeuge)
				addEventHandler("onClientRender", root, fraktionen)
				Fahrzeugeshow = false
				Fraktionenshow = true
			end
			if businessshow == true then
				removeEventHandler( "onClientRender", root, business)
				addEventHandler("onClientRender", root, fraktionen)
				businessshow = false
				Fraktionenshow = true
			end
			if serverdatenshow == true then
				removeEventHandler( "onClientRender", root, serverdaten)
				addEventHandler("onClientRender", root, fraktionen)
				serverdatenshow = false
				Fraktionenshow = true
			end
			if regelwerkshow == true then
				removeEventHandler( "onClientRender", root, regelwerk)
				addEventHandler("onClientRender", root, fraktionen)
				regelwerkshow = false
				Fraktionenshow = true
			end
		end)  

        helpjobbtn = guiCreateStaticImage(sx*550, sy*682, sx*179, sy*38, ":VenoX/images/white.bmp", false)
        addEventHandler("onClientMouseEnter", helpjobbtn, function() guiSetAlpha(helpjobbtn, 0.40) end)      
		addEventHandler("onClientMouseLeave", helpjobbtn, function() guiSetAlpha(helpjobbtn, 0.00) end) 
   		addEventHandler("onClientGUIClick", helpjobbtn, 
		function()
			if startseiteshow == true then
				removeEventHandler( "onClientRender", root, startseite)
				addEventHandler("onClientRender", root, berufe)
				berufeshow = true
				startseiteshow = false
			end
			if hueasershow == true then
				removeEventHandler( "onClientRender", root, hueaser)
				addEventHandler("onClientRender", root, berufe)
				hueasershow = false
				berufeshow = true
			end
			if Fraktionenshow == true then
				removeEventHandler( "onClientRender", root, fraktionen)
				addEventHandler("onClientRender", root, berufe)
				Fraktionenshow = false
				berufeshow = true
			end
			if Fahrzeugeshow == true then
				removeEventHandler( "onClientRender", root, fahrzeuge)
				addEventHandler("onClientRender", root, berufe)
				Fahrzeugeshow = false
				berufeshow = true
			end
			if businessshow == true then
				removeEventHandler( "onClientRender", root, business)
				addEventHandler("onClientRender", root, berufe)
				businessshow = false
				berufeshow = true
			end
			if serverdatenshow == true then
				removeEventHandler( "onClientRender", root, serverdaten)
				addEventHandler("onClientRender", root, berufe)
				serverdatenshow = false
				berufeshow = true
			end
			if regelwerkshow == true then
				removeEventHandler( "onClientRender", root, regelwerk)
				addEventHandler("onClientRender", root, berufe)
				regelwerkshow = false
				berufeshow = true
			end
		end)        


        helpserverdatabtn = guiCreateStaticImage(sx*550, sy*738, sx*179, sy*38, ":VenoX/images/white.bmp", false)
        addEventHandler("onClientMouseEnter", helpserverdatabtn, function() guiSetAlpha(helpserverdatabtn, 0.40) end)      
		addEventHandler("onClientMouseLeave", helpserverdatabtn, function() guiSetAlpha(helpserverdatabtn, 0.00) end) 
   		addEventHandler("onClientGUIClick", helpserverdatabtn, 
		function()
			if startseiteshow == true then
				removeEventHandler( "onClientRender", root, startseite)
				addEventHandler("onClientRender", root, serverdaten)
				startseiteshow = false
				serverdatenshow = true
			end
			if hueasershow == true then
				removeEventHandler( "onClientRender", root, hueaser)
				addEventHandler("onClientRender", root, serverdaten)
				hueasershow = false
				serverdatenshow = true
			end
			if Fraktionenshow == true then
				removeEventHandler( "onClientRender", root, fraktionen)
				addEventHandler("onClientRender", root, serverdaten)
				Fraktionenshow = false
				serverdatenshow = true
			end
			if Fahrzeugeshow == true then
				--if serverdatenshow == false then
					removeEventHandler( "onClientRender", root, fahrzeuge)
					addEventHandler("onClientRender", root, serverdaten)
					Fahrzeugeshow = false
					serverdatenshow = true
				--end
			end
			if businessshow == true then
				removeEventHandler( "onClientRender", root, business)
				addEventHandler("onClientRender", root, serverdaten)
				businessshow = false
				serverdatenshow = true
			end
			if berufeshow == true then
				removeEventHandler( "onClientRender", root, berufe)
				addEventHandler("onClientRender", root, serverdaten)
				berufeshow = false
				serverdatenshow = true
			end
			if regelwerkshow == true then
				removeEventHandler( "onClientRender", root, regelwerk)
				addEventHandler("onClientRender", root, serverdaten)
				regelwerkshow = false
				serverdatenshow = true
			end
		end) 


        guiSetAlpha(helpserverdatabtn, 0.00)  
        guiSetAlpha(helpclosebtn, 0.00) 
        guiSetAlpha(helpjobbtn, 0.00)
        guiSetAlpha(helpfrakbtn, 0.00)
        guiSetAlpha(helprgwbtn, 0.00)
        guiSetAlpha(helphousebtn, 0.00)
        guiSetAlpha(helpcarsbtn, 0.00)
        guiSetAlpha(helpbusinessbtn, 0.00)
        guiSetAlpha(helpstartbtn, 0.00)
end 
function mainbackhelp()
        dxDrawRectangle(sx*540, sy*223, sx*861, sy*584, tocolor(0, 0, 0, 219), false)
        dxDrawRectangle(sx*550, sy*511, sx*179, sy*38, tocolor(0, 72, 99, 254), false)
        dxDrawLine(sx*536, sy*282, sx*1397, sy*282, tocolor(254, 254, 254, 254), sy*1, false)
        dxDrawText("X", sx*1360, sy*238, sx*1379, sy*267, tocolor(254, 254, 254, 254), sy*2.00, "clear", "left", "top", false, false, false, false, false)
        dxDrawLine(sx*1346, sy*224, sx*1346, sy*281, tocolor(254, 254, 254, 254), sy*1, false)
        dxDrawLine(sx*754, sy*282, sx*754, sy*776, tocolor(254, 254, 254, 254), sy*1, false)
        dxDrawLine(sx*754, sy*327, sx*882, sy*327, tocolor(255, 255, 255, 255), sy*1, false)
        dxDrawRectangle(sx*550, sy*399, sx*179, sy*38, tocolor(0, 72, 99, 254), false)
        dxDrawText("Regelwerk", sx*596, sy*408, sx*683, sy*427, tocolor(255, 255, 255, 255), sy*1.40, "arial", "left", "top", false, false, true, false, false)
        dxDrawRectangle(sx*550, sy*456, sx*179, sy*38, tocolor(0, 72, 99, 254), false)
        dxDrawText("Fahrzeuge", sx*596, sy*465, sx*683, sy*484, tocolor(255, 255, 255, 255), sy*1.40, "arial", "left", "top", false, false, true, false, false)
        dxDrawRectangle(sx*550, sy*567, sx*179, sy*38, tocolor(0, 72, 99, 254), false)
        dxDrawText("Business", sx*602, sy*577, sx*677, sy*599, tocolor(255, 255, 255, 255), sy*1.40, "arial", "left", "top", false, false, false, false, false)
        dxDrawRectangle(sx*550, sy*624, sx*179, sy*38, tocolor(0, 72, 99, 254), false)
        dxDrawText("Fraktionen", sx*596, sy*634, sx*681, sy*652, tocolor(255, 255, 255, 255), sy*1.40, "arial", "left", "top", false, false, false, false, false)
        dxDrawRectangle(sx*550, sy*682, sx*179, sy*38, tocolor(0, 72, 99, 254), false)
        dxDrawText("Berufe", sx*612, sy*692, sx*667, sy*710, tocolor(255, 255, 255, 255), sy*1.40, "arial", "left", "top", false, false, false, false, false)
        dxDrawRectangle(sx*550, sy*739, sx*179, sy*38, tocolor(0, 72, 99, 254), false)
        dxDrawText("Serverdaten", sx*593, sy*749, sx*691, sy*771, tocolor(255, 255, 255, 255), sy*1.40, "arial", "left", "top", false, false, false, false, false)
        dxDrawRectangle(sx*550, sy*342, sx*179, sy*38, tocolor(0, 72, 99, 254), false)
        dxDrawText("Start", sx*617, sy*352, sx*662, sy*375, tocolor(255, 255, 255, 255), sy*1.40, "arial", "left", "top", false, false, false, false, false)
        dxDrawText("Häuser", sx*606, sy*520, sx*667, sy*539, tocolor(255, 255, 255, 255), sy*1.40, "arial", "left", "top", false, false, true, false, false)
        dxDrawText("Hilfe", sx*936, sy*242, sx*996, sy*272, tocolor(254, 254, 254, 254), sy*2.00, "clear", "left", "top", false, false, false, false, false)
end
function startseite()
        dxDrawText("Willkommen auf VenoX-Reallife\n\nVenoX-Reallife bietet dir ein einmaliges Spielerlebnis. \nZusammen mit der Community wirst du sicher viel Spaß haben. \n\nSolltest du Fragen oder Probleme haben, kannst du dich \ngerne an das Admin-Team wenden. Nutze dazu einfach \nden Befehl /report und stelle deine Anfrage. \n\nWir freuen uns auf dich!\n\nDein VenoX-Team ❤", sx*783, sy*352, sx*1273, sy*588, tocolor(255, 255, 255, 255), sy*1.20, "clear", "left", "top", false, false, false, false, false)
        dxDrawText("Willkommen", sx*762, sy*299, sx*872, sy*323, tocolor(255, 255, 255, 255), sy*1.40, "clear", "left", "top", false, false, false, false, false)
        dxDrawLine(sx*739, sy*342, sx*739, sy*379, tocolor(255, 255, 255, 255), sy*2, false)
end

function regelwerk()
 		dxDrawText("Geltende Regeln auf VenoX-Reallife \n\nAuf VenoX-Reallife gelten einige Regeln, die das \nSpielerlebnis verbessern sollen. \n\nDiese findest du unter : \nhttps://www.venox-reallife.com/index.php?board/4-server-regeln/", sx*783, sy*352, sx*1273, sy*588, tocolor(255, 255, 255, 255), sy*1.20, "clear", "left", "top", false, false, false, false, false)
        dxDrawText("Regelwerk", sx*762, sy*299, sx*872, sy*323, tocolor(255, 255, 255, 255), sy*1.40, "clear", "left", "top", false, false, false, false, false)
        dxDrawLine(sx*739, sy*399, sx*739, sy*436, tocolor(255, 255, 255, 255), sy*2, false)
end

function fahrzeuge()
        dxDrawText("Informationen zu Privatfahrzeugen \n\nUm dich innerhalb der Stadt schnell fortzubewegen, \nempfehlen wir, dass du dir ein Fahrzeug zulegst. \nZu Beginn ist es dir möglich fünf Fahrzeuge zu besitzen. \nDeine Fahrzeugslotanzahl kannst du jedoch weiter aufwerten. \n\nFolgende Befehle und Tasten sind wichtig: \nTaste X - Startet den Motor (Gedrückt halten) \nTaste L - schaltet das Licht ein / aus \n/limit [km/h] - Setzt ein Tempolimit \n/stoplimit - Stoppt den Limiter\n/vehhelp - Auflistung weiterer wichtiger Befehle", sx*783, sy*352, sx*1273, sy*588, tocolor(255, 255, 255, 255), sy*1.20, "clear", "left", "top", false, false, false, false, false)
        dxDrawText("Fahrzeuge", sx*762, sy*299, sx*872, sy*323, tocolor(255, 255, 255, 255), sy*1.40, "clear", "left", "top", false, false, false, false, false)
        dxDrawLine(sx*739, sy*456, sx*739, sy*493, tocolor(255, 255, 255, 255), sy*2, false)
end

function hueaser()
	    dxDrawText("Informationen zu Häuser \n\nHäuser gelten als Statussymbole \nJe teurer und größer, desto höher angesehen bist du. \nHäuser kaufst du indem du in einen grünen Hausmarker gehst \nund den Befehl /buyhouse [bar|bank] benutzt. \n\nFolgende Befehle sind im Umgang mit Häusern wichtig: \n/hlock - Schließt das Haus auf / zu \n/setrent [Betrag] - Setzt angegebenen Mietpreis \n/sellhouse - Verkauft dein Haus an das System \n/rent - Mietet dich in ein Haus ein \n/unrent - Mietet dich aus einem Haus aus", sx*783, sy*352, sx*1273, sy*588, tocolor(255, 255, 255, 255), sy*1.20, "clear", "left", "top", false, false, false, false, false)	
	    dxDrawText("Häuser", sx*762, sy*299, sx*872, sy*323, tocolor(255, 255, 255, 255), sy*1.40, "clear", "left", "top", false, false, false, false, false)
        dxDrawLine(sx*739, sy*511, sx*739, sy*548, tocolor(255, 255, 255, 255), sy*2, false)
end
function business()
        dxDrawText("Information zu Business' \n\nAls Besitzer eines Business, erhälst du Einnahmen durch \ndie Nutzung deiner Dienste. Bist du z.B. der Besitzer \ndes Pay N' Spray, so erhälst du für jedes reparierte \nFahrzeug einen Anteil der Kosten. Es lohnt sich also! \nUm dir ein Business zu kaufen musst du den Befehl /buybiz [bar|bank] \n\nFolgende Befehle sind im Umgang mit einem Business wichtig: \n/bizdraw [Betrag] - Entnimmt angegebenen Betrag aus der Biz-Kasse \n/bizstore [Betrag] - Zahlt angegebenen Betrag in die Biz-Kasse \n/sellbiz - Verkauft das Business \n/bizhelp - Zeigt nützliche Befehle, sowie die Businesskasse an.", sx*783, sy*352, sx*1336, sy*589, tocolor(255, 255, 255, 255), sy*1.20, "clear", "left", "top", false, false, false, false, false)
        dxDrawText("Business", sx*762, sy*299, sx*872, sy*323, tocolor(255, 255, 255, 255), 1.40, "clear", "left", "top", false, false, false, false, false)
        dxDrawLine(sx*739, sy*567, sx*739, sy*604, tocolor(255, 255, 255, 255), 2, false)       
end

function fraktionen()
        dxDrawText("Fraktionen", sx*762, sy*299, sx*872, sy*323, tocolor(255, 255, 255, 255), sy*1.40, "clear", "left", "top", false, false, false, false, false)
        dxDrawLine(sx*739, sy*624, sx*739, sy*661, tocolor(255, 255, 255, 255), sy*2, false)
        dxDrawText("Fraktionen im Überblick \n\nStaatsfraktionen: \n San Andreas Police Department (Kurz : S.F.P.D) \n Federal Bureau of Investigation (Kurz : F.B.I ) \n U.S Army (Kurz : Army ) \n\nNeutrale Fraktionen. \n Emergency (Kurz : Medic ) \n SAN News (Kurz : Reporter) \n Feuerwehr \n Mechaniker (Auch bekannt um autos abzuschleppen) \n\nGangs und Mafien: \n Ballas \n Los Aztecas ( Auch bekannt als Mara Salvatrucha ) \n Triaden \n Compton ( Auch bekannt als Grove ) \n Italian Mafia \n Angels Of Death ( Auch bekannt als AOD )\n Mafia ( Eine zweite Mafia ) \n\n\nWenn du an einer Fraktion interessiert bist dann, \n bewirb dich doch schonmal im Forum :) .", sx*783, sy*352, sx*1351, sy*662, tocolor(255, 255, 255, 255), sy*1.20, "clear", "left", "top", false, false, false, false, false)   
end

function berufe()
		dxDrawText("Berufe im Überblick \n\nBusfahrer \nHotdogverkäufer \nLandwirt \nPilot \nSeemann \nStraßenreiniger \nTaxifahrer \nTramfahrer \nTransporteur \nZugführer", sx*783, sy*352, sx*1122, sy*595, tocolor(255, 255, 255, 255), sy*1.20, "clear", "left", "top", false, false, false, false, false)
        dxDrawText("Berufe", sx*762, sy*299, sx*872, sy*323, tocolor(255, 255, 255, 255), sy*1.40, "clear", "left", "top", false, false, false, false, false)
        dxDrawLine(sx*739, sy*682, sx*739, sy*719, tocolor(255, 255, 255, 255), sy*2, false)
end

function serverdaten()
 		dxDrawText("Unsere Serverdaten auf einem Blick \n\nUnser Teamspeak³: \nts3.venox-reallife.com \n\nUnser Forum:\nwww.venox-reallife.com\n\nUnsere Serveradresse: \nmtasa://217.182.71.48:22003", sx*783, sy*352, sx*1155, sy*544, tocolor(255, 255, 255, 255), sy*1.20, "clear", "left", "top", false, false, false, false, false)
        dxDrawText("Serverdaten", sx*762, sy*299, sx*872, sy*323, tocolor(255, 255, 255, 255), sy*1.40, "clear", "left", "top", false, false, false, false, false)
        dxDrawLine(sx*739, sy*738, sx*739, sy*775, tocolor(255, 255, 255, 255), sy*2, false)
end


--[[local screenx, screeny = guiGetScreenSize()
local helpTyp = ""
local helpText = {}

helpText["Allgemein"] = {}
helpText["Allgemein"]["Willkommen"] = "Wir als Server-Team heißen dich Herzlich Willkommen auf unserem Reallife Server und hoffen, dass du eine Menge Spaß haben wirst. Durch ständige Updates versuchen wir das Spiel für dich so angenehm und abwechslungsreich wie möglich zu gestalten. Auf unserem Server gibt es viel zu entdecken und zu erkunden. Sollten hierbei Fragen auftreten, ist unser Serverteam stets mit Hilfe des Report-Panels (F3) zu erreichen. Gekennzeichnet sind diese mit dem Tag \"[VnX]\". Bitte gedulde dich ein wenig, manachmal existieren viele Fragen, die nacheinander abgearbeitet werden müssen.\nWir wollen dich darauf hinweisen, dass wir auf Regeln und die Ordnung unseres Servers sehr viel Wert legen und dich daher bitten, uns dabei zu unterstützen. Bitte lese Aufmerksam unser Hilfemenü durch und halte dich an die Regeln. So wirst du und wir als Server-Team eine angenehme Spielatmosphäre haben können.\n\n\n\nWomit fange ich auf dem Server an?\nAls erstes fährst du zur Fahrschule und absolvierst deinen Auto Führerschein. Danach begibst du dich zu dem Straßenreinigerjob und führst diesen so lange aus, bis du ca. 2000 Euro verdient hast. Danach gehst du wieder in die Fahrschule und absolvierst den LKW Führerschein. Sobald du deinen LKW Führerschein bestanden hast begibst du dich zu dem Trucker oder dem Betonmischerjob. Dort verdienst du schon sehr gutes Geld. Es ist sehr wichtig, dass du dein verdientes Geld auf dein Konto überweißt, da es dort Zinsen pro Spielstunde gibt. Nach und nach solltest du dir alle Führerscheine aneignen, damit du bei sämtlichen Jobs ein wenig Abwechslung hast. Hast du erstmal ein paar Spielstunden und die ersten Ersparnisse kannst du dich im Forum bei einer Fraktion bewerben. Sobald du in einer Fraktion bist verdienst du mit dem PayDay mehr Geld und kannst dir so neue Dinge kaufen. Schon ist der Anfang geschafft und du kannst deinen Spielspaß fortführen.\n\n\nViel Spaß auf unsem Server\nDie Projektleitung"
helpText["Allgemein"]["F.A.Q."] = "Woher bekomme ich meinen Waffenschein?\nDen Waffenschein bekommst du im Gebäude des SFPD's, welches auf der Map (F11) durch ein Blaulicht markiert ist.\n\nWie beende ich den Zivischutz?\nZivilist Schutz beenden und starten: Gebt /stopZivischutz um euren Schutz zu beenden. Mit dem erneuten Einloggen aktiviert ihr euren Schutz wieder.\n\nWie lösche ich meine Zivizeit?\nZivizeit löschen: Mit /resetZivizeit beendet ihr eure Zivizeit. Dies zieht 500.000€ von eurem Bankkonto ab.\n\nWas bedeutet Payday?\nPayday ist englisch und bedeutet auf deutsch soviel wie: Zahltag. Er findet jede Stunde statt.\nArbeitslosengeld/ Fraktion: Ist das Grundgeld, was man pro Stunde bekommt. Dieser variiert sich nach Rang. Als Zivilist verdient man 450€, als einen Rang 0er in einer Fraktion 1000€. Pro Rang steigt dies um 450€, sodass man als Rang 5er 3250€ pro Stunde verdient.\nZuschüsse: Zuschüsse sind extra Löhne, die es in Staatsfraktionen pro eingeknasteten Wantler gibt. 1 Wanted entspricht 75€.\nBoni: Sind extra Löhne, die es in Gangs durch das Flaggenjagd Event gibt. Hat die jeweilige Gang beim Payday die Flagge im Besitz, so gibt es hierfür auch nach Rang Geld.\nFahrzeugsteuer: Wenn man ein Fahrzeug im Besitz hat, müssen diese auch versteuert werden. Pro Fahrzeug bedeutet das -250€ pro Payday, welches sich aber auch hier mit den Besitz von Premium variiert.\nZinsen: Der Zinssatz beträgt ca. 0,5%. Pro Payday gibt es hier auf das gesamte Bankgeld den genannten Zinssatz als Zuschuss. Deshalb gilt: Am besten das ganze Geld auf der Bank lagern.\n\nWas bedeutet Premium?\nPremium ist auf Xtream eine Möglichkeit, viele Vorteile zu erzielen. Welche das sind, das kannst du im Shop im Forum unter www.xtream-reallife.de herausfinden."
helpText["Allgemein"]["Handy"] = "Wie funktioniert das Handy?\nDas Handy kannst du ingame mit der p-Taste öffnen. Möchtest du nun jemanden anrufen, klickst du einfach auf das Telefonbuch im HomeScreen. In das Textfeld \"Name\" kannst du nun den Namen des Spielers eingeben, den du anrufen möchtest. Nachdem du auf das \"+\" geklickt hast, ist der Spieler im Telefonbuch gespeichert und kann per Druck auf den grünen Hörer angerufen werden, wenn der Spieler online ist und sein Handy angeschaltet hat.\n\nWie nehme ich Anrufe an ?\nWenn dich ein Spieler anrufst, wird dir das mit einem Fenster, das oben auf dem Bildschirm zu sehen ist, angezeigt. Nun öffnest du dein Handy mit der p-Taste und drückst im Homescreen und und im darauffolgenden Screen, dem Nummernblock, drückst du wieder den grünen Hörer. Nun bist du mit dem Gesprächspartner verbunden, kannst dann mit mit einem Klick auf den unterern linken Button das Handy schließen und dann mit der t-Taste normal kommunizieren."
helpText["Allgemein"]["Pflanzen"] = "Wie pflanze ich etwas an?\nWenn du etwas anpflanzen möchtest, musst du dir beim Birnensymbol auf der Map Samen kaufen. Manche Pflanzen können deinen Lebensbalken wieder auffüllen, mit anderen wiederum kannst du im Inventar andere Sachen erstellen. Nachdem du die Samen gekauft hast, kannst du sie im Inventar benutzen und anbauen. Dafür ziehst du deine gekauften Samen unten in deine Inventarleiste, machst einen Rechtsklick und schon baut dein Spieler die Pflanze an. Doch vorsichtig: andere Spieler können deine Pflanzen klauen und für sich selbst benutzen, pflanze daher versteckt an, zusätzlich musst ud darauf achten, dass die Pflanzen keinen Marker behindern und dass sie auf einer Grünfläche angepflanzt sind.\n\nWie verkaufe ich meine Pflanzen?\nWenn du fertige Pflanzen nicht selbst verwenden möchtest, kannst du sie auch an das System oder an andere Spieler verkaufen. Auf der Mitte der Map (Obstkorbicon) kannst du Salat,Orangen und Äpfel verkaufen. Durch Äpfelbäume erworbenes Holz kannst du am Holzicon links unten auf der Map verkaufen. Eisen, Hanf und Metall kannst du nur an andere Spieler verkaufen; dazu musst du diese anklicken, dann im Menü auf \"geben\" klicken und die gewünschte Zahl eintippen und nochmal auf \"geben\" klicken, damit der Gegenstand seinen Besitzer wechselt."
helpText["Allgemein"]["Business"] = "Was ist ein Business?\nAuf Xtream gibt es eine Vielzahl an Möglichkeiten sein Geld zu investieren. Dazu zählen der Kauf von Autos und Waffen, ein Besuch im Pay 'n' Spray oder auch das Tanken. Damit das Geld nicht einfach verschwindet, können Spieler die entsprechenden Einrichtungen (Business) kaufen und dann einen Teil der Einnahmen aus der Geschäftskasse entnehmen. So ein Business erkännst du an einem Pickup mit zwei roten Männchen. Wenn du dich zum Pickup begibst, kannst du weitere Informationen (z.B. den Besitzer) in Erfahrung bringen.\n\nWie finde ich ein Business?\nAuf Xtream gibt es derzeit knapp 20 Geschäfte, die von Spielern erworben werden können. Da diese sehr beliebt sind, sind sie schnell vergeben. Wenn du ein Business erwerben möchtest, gibt es mehrere Möglichkeiten. Hat es schon einen Besitzer, kannst du diesen einfach fragen, ob er es dir für einen gewissen Geldbetrag verkauft. Hier solltest du daran zu denken, dass zu Kaufpreis und Ablöse auch noch Steuern hinzukommen. Da von Zeit zu Zeit die Besitzer einiger Geschäfte zu inaktiv werden, kannst du auch im Forum darauf warten, diese Geschäfte in einer Auktion zu erwerben. Die letzte Möglichkeit an ein Business zu bekommen besteht darin, die Updates zu verfolgen und dann neue Geschäfte schnell ingame oder in einer Forum-Auktion zu erwerben.\n\nBefehle für Geschäfte:\nFür den Club of SF \n     Den Musik-Link ändern: /clubmusik [link]\n     Eintritt und Min.spielzeit setzen: /clubmanage [eintritt] [stunden]"
helpText["Allgemein"]["Befehle"] = "Übersicht aller (sonst nirgends aufgeführten) Befehle\n\n     Tanzen: /dance [1-5]\n     Telefonnummer abfragen: /nummer [Name]"
helpText["Jobs"] = {}
helpText["Jobs"]["F.A.Q."] = "Wo finde ich einen Job?\nDie Jobs kannst du am gelben Punkt auf der Map (F11) anzeigen lassen. Es sind die jeweiligen Rathäuser von San Fierro und Los Santos.\n\nIch habe keine Scheine, wie kann ich trotzdem Geld verdienen?\nAm Anfang lohnt sich der Pizzajob in Los Santos, der Zugjob in San Fierro oder der Straßenreiniger- Job in San Fierro. All diese Jobs benötigen keine Scheine.\n\nMit welchem Job verdiene ich viel Geld?\nAm Anfang ist der Pizzajob in Los Santos der beliebteste Job unter den Anfängern, wo man am meisten verdient."
helpText["Fahrzeuge"] = {}
helpText["Fahrzeuge"]["F.A.Q."] = "Wie schalte ich den Motor ein?\nDen Motor schaltest du mit der Taste X ein.\n\nWie schalte ich das Licht ein/aus?\nDas Licht schaltest du mit der Taste L aus.\n\nWas kann ich alles mit meinen Fahrzeugen anstellen?\nDrücke dazu die Teste \"M\" und klicke auf dein Fahrzeug. Danach öffnet sich ein Menü, in welchem die Funktionen stehen (Parken bedeutet, dass dein Fahrzeug nach einer Explosion oder einem Respawn wieder dort spawnt, wo du es als letztes geparkt hast).\n\nWo kann ich meinen Führerschein bekommen?\nDiesen kannst du dir an der Fahrschule kaufen. Sie ist auf der Map (F11) mit einem Symbol mit zwei kleinen Straßenschildern gekennzeichnet.\n\nIch habe 15 STVO Punkte, was kann ich tun?\nAn der Fahrschule befindet sich ein Maker. Dort läufst du hinein und kannst dann mit einem Befehl (der dann eingeblendet wird) deine STVO Punkte beseitigen. Kostenlos ist dies allerdings nicht. \n\nMein Fahrzeug wurde abgeschleppt. Wie bekomme ich es wieder?\nDu fährst zum SFPD (welches auf der Map F11 mit einem Blaulicht gekennzeichnet ist). Danach begibst du dich zur unteren Schranke. Dort sollte dir ein Maker auffallen. Dort kannst du deine abgeschleppten Autos freikaufen."
helpText["Fahrzeuge"]["Autohäuser"] = "In San Anderes existieren vier Autohäuser, welche auf der Karte mit einem Autosymbol markiert sind. Zwei hiervon befinden sich in San Fierro (Wangcars und Ottos Autos), eins in Red Country, Blueberry (Country Cars) und eins in Los Santos, Jefferson (Los Santos Cars). Luxuswagen können in dem Ottos Autos Autohaus erworben werden.\nFlugzeuge und Helikopter werden auf dem Flughafen in San Fierro, welcher durch ein Flugzeugsymbol auf der Karte makiert ist, erworben werden. Hierfür musst du jedoch über etwas mehr Geld verfügen.\nGleiche gilt für die Boote, welche in Bayside angeboten werden. Makiert ist dieser Hafen auf der Karte durch ein Ankersymbol.\nUm länger Spaß mit deinen Fahrzeugen zu haben, denke immer daran, diese an einen geeigneten Ort umzuparken, da sie sonst von einem Admin oder dem San Fierro Police Department kostenpflichtig abgeschleppt oder sogar gelöscht werden. Alternativ können Helikopter und Flugzeuge in einen Hanger geparkt werden und Autos in eine Tiefgarage."
helpText["Fahrzeuge"]["Befehle"] = "Hier erhälst du eine kleine Übersicht über die Befehle, welche für Fahrzeuge benötigt werden.\n\nFahrzeuge aufschließen und abschließen: Fahrzeuge könnt ihr mit den Befehl /lock auf- bzw. abschließen. Wenn ihr ein Auto aus der Ferne auf- bzw. abschließen wollt, könnt ihr den Befehl /lock [Fahrzeug ID] verwenden.\n\nFahrzeuge Respawnen: Gebt /respawn [Fahrzeug ID] ein. Dieser Befehl zieht 450€ Bargeld von eurer Hand ab.\n\nFahrzeuge verkaufen und weitergeben: Um ein Fahrzeug weiter zu geben oder zu verkaufen müsst ihr /givevehto [Zielspieler] [Fahrzeug ID] [Preis] eingeben. Annehmen kann man dieses dann mit /acceptveh"
helpText["Fraktionen"] = {}
helpText["Fraktionen"]["F.A.Q."] = "Wie kann ich einer Fraktion beitreten?\nDu kannst dich im Forum bei jeder Fraktion die es auf unserem Server gibt bewerben. Für jede Fraktion muss du dich im Forum bewerben. Schaue dir aber vorher in der jeweiligen Fraktion die Bewerbungsvoraussetzungen an.\n\nWelche Fraktion ist für den Anfang für mich geeignet?\nFür Anfänger sind die Fraktionen Mechaniker und Feuerwehr gut geeignet, da diese kaum etwas vorraussetzen.\n\nWas bedeutet GWD?\nGWD steht für Grundwehrdienst. In diesem von der Bundeswehr zur Verfügung gestellten Dienst lernst du die Grundlagen der Staatsfraktionen und des Regelwerks.\n\nWas bedeutet PAN?\nDie PAN bedeutet Police Akademy Note und ist das Endergebniss der Police Akademy, also der Polizei Grundausbildung."
helpText["Fraktionen"]["SFPD"] = "Das San Fierro Police Department (SFPD) ist die Staatsfraktion, welche den Verbrechen in San Andreas auf die Spur geht. Auf der Tagesordnung stehen Wantlerjagden, Bombenentschärfungen etc.\nUm dem SFPD beitreten zu können, musst du den Grundwehrdienst (GWD) absolviert haben und dann die Police Academie Note (PAN) machen. Erst nach all diesen Schritten kann man sich für das SFPD bewerben.\n\nRangordnung\n     Polizeidirektor (Leader)\n     Hauptkommissar (Co-Leader)\n     Kommissar (Ausbilder|Rang 3)\n     Hauptmeister (Rang 2)\n     Obermeister (Rang 1)\n     Kadett (Police Academie|Rang 0)\n\n\nFolgende Befehle benötigt ihr im SFPD:\n     Entwaffnen: /disarm\n     Fesseln: /leash\n     Entfesseln: /unleash\n     Scheine zeigen: /scheine\n     Zum öffnen eines Gates: /gate\n     Um Barrikaden zu setzen: /roadblock (Zum Entfernen auf diese klicken)\n     Um Munition nachzufüllen: /munition (Dazu in einen Barrack oder Enforcer als Beifahrer einsteigen)\n     Illegale Materialien abnehmen: /takeillegals [Spieler]\n     Einen Blitzer aufstellen (Nur als (Co-)Leader: /blitzer [Kmh] (Zum Entfernen /delblitzer)\n     Zum öffnen der Schleuse am Flugzeugträger: /schleuse"
helpText["Fraktionen"]["Bundeswehr"] = "Die Bundeswehr ist bekannt für große und mächtige Waffengewalt, welche vom Staat unterstützt wird. Ihre Haupttätigkeiten sind gegen den Terrorismus vorzugehen und San Andreas für Frieden zu sorgen.\n\nRangordnung\n     Oberbefehlshaber (Leader)\n     Snipereinheit (Rang 4)\n     Luftwaffe (Rang 3)\n     Panzerdivision (Rang 2)\n     Bodentrupp (Rang 1)\n     Rekruten (Rang 0)\n\nFolgende Befehle benötigt ihr in der Bundeswehr:\n     Alkatraz Gate reparieren: /repairgate\n     Zum öffnen eines Gates: /gate\n     Zum öffnen einer Garage: /garage\n     Entwaffnen: /disarm\n     Fesseln: /leash\n     Entfesseln: /unleash\n     Scheine zeigen: /scheine\n     Um Barrikaden zu setzen: /roadblock (Zum Entfernen auf diese klicken)\n     Um Munition nachzufüllen: /munition (Dazu in einen Barrack oder Enforcer als Beifahrer einsteigen)\n     Illegale Materialien wegnehmen: /takeillegals [Spieler]\n     Zum öffnen der Schleuse am Flugzeugträger: /schleuse\n     Das Deck im Flugzeugträger ausfahren: /deck\n     Die Rampe bewegen um auf den Parkplatz zu gelangen: /deck\n     Spezialmunition für die Waffen: /wspec\n     Spezialmunition Hydra: /hspec\n     Einen Sandsack bauen: /sandsack\n     Eine Mine legen: /mine\n     Einen Luftschlag anfordern: /luftschlag\n     Das Langstreckenraketenmenü öffnen: /target\n     Die Statistik der Schussübung des Rekruten einsehen: /training [Name des Rekruten]\n     Um einen Jumppoint zu aktivieren: /jump\n     Dienstgruppe (ausbilder,sniper,leader,hunter) aktivieren: /bw [gruppe]\n     Dienstgruppe setzen (für Leader): /setPerm [Spieler] [Gruppe] [r (zum entziehen)]"
helpText["Fraktionen"]["FBI"] = "Federal Bureau of Investigation (FBI) bezeichnet die Staatsfraktion, welche sich hauptsächlich um die Verbrecher ab 4 Wanteds kümmert. Mit stärkeren Waffen und schnelleren Fahrzeugen, entgehen den FBI Angestellten so gut wie keine Verbrecher.\n\nRangordnung\n     FBI-Director (Leader)\n     Assistant FBI-Director (Co-Leader)\n     Special Agent i.C (Rang 3)\n     Special Agent (Rang 2)\n     Special Agent i.E (Rang 1)\n     Agent (Rang 0)\n\n\nFolgende Befehle benötigt ihr im FBI:\n     Alkatraz Gate reparieren: /repairgate\n     Zum öffnen eines Gates: /gate\n     Zum öffnen einer Garage: /garage\n     Entwaffnen: /disarm\n     Fesseln: /leash\n     Entfesseln: /unleash\n     Scheine zeigen: /scheine\n     Um Barrikaden zu setzen: /roadblock (Zum Entfernen auf diese klicken)\n     Um Munition nachzufüllen: /munition (Dazu in einen Barrack oder Enforcer als Beifahrer einsteigen)\n     Illegale Materialien wegnehmen: /takeillegals [Spieler]\n     Zum öffnen der Schleuse am Flugzeugträger: /Schleuse"
helpText["Fraktionen"]["Feuerwehr"] = "Das San Fierro Fire Department (SFFD) ist eine Dienstleisterfraktion, die den Server von schweren Bränden, Verkehrsunfällen, Felsstürzen und anderen Naturkatasrophen befreien. Sie ist eine Anfängerfraktion, der man schon ab 15 Stunden beitreten kann, doch gibt es auch ein Limit. Ab 150 Stunden ist es ohne Ausnahme niemandem mehr erlaubt, der Feuewehr beizutreten. Alle Dienstleisterfraktionen, somit auch die Feuerwehr, besitzen einen Deathmatch Schutz.\n\nRangordnung\n     Chief (Leader)\n     Assistant Chief (Co-Leader)\n     Captain (Rang 3)\n     Leutnant (Rang 2)\n     Fire Fighter (Rang 1)\n     Anwärter (Rang 0)\n\n\nFolgende Befehle benötigt ihr im SFFD:\n     Um Barrikaden zu setzen: /roadblock (Zum Entfernen auf diese klicken)"
helpText["Fraktionen"]["Reporter"] = "Die Reporter sind eine dienstleistende Fraktion, somit nehmen die Reporter nicht an Gangwars, Geiselnahmen, illegalen Transporten etc. teil, somit ist diese eine eher friedliche Fraktion. Die Reporter sind dazu da den Spielern den Tag zu verschönern, sei es eine Beglückwünschung, ein Gewinnspiel oder ein tolles neues Event, die Reporter lassen sich immer wieder etwas neues einfallen. Als Reporter beginnt man seinen Tag auf dem Missionary Hill, das ist der Hügel südlich von San Fierro mit dem Sendemast, eigentlich ist sie kaum zu übersehen. Als Reporter hat man es ziemlich gut auf dem Server, vor allem als Neuling! Man wird schnell sehr bekannt auf dem Server und lernt selbst viele neue Leute kennen. Man hat den abwechslungsreichsten Alltag auf dem ganzen Server, da man immer wieder neue Events und Gewinnspiele ausprobiert und diese auch nicht immer gleich laufen. Egal ob sich die Teilnehmer perfekt benehmen oder auch nicht, es gibt immer viel zutun.\n\nRangordnung\n     Chefredakteur (Leader)\n     Redakteur (Co-Leader)\n     Journalist (Rang 3)\n     Narichtensprecher (Rang 2)\n     Zeitungsbursche (Rang 1)\n     Praktikant (Rang 0)\n\n\nFolgende Befehle benötigt ihr bei den Reportern: \n     Zum öffnen eines Gates: /gate\n     In den News-Chat schreiben: /news [Text]\n     Einen Spieler zu einem Interview einladen: /live [Player] (/endlive zum Beenden)\n     Einen Marker setzen: /eventMarker [R] [G] [B] marker\n     Der nähste Marker wird gelöscht: /eventMarkerD\n     Alle Marker werden gelöscht: /eventMarkerDA\n     Barrikade setzen: /roadblock\n     Alle Barrikaden entfernen: /deleteRoadblock\n     Eine bestimmte Barrikade entfernen: /deleteRoadblock [ID]"
helpText["Fraktionen"]["Fahrschule"] = "Die Aufgabe der Fahrschule ist es, Usern Fahrstunden zu geben (insgesamt 10), bis sie ihren Füherschein bestanden haben. Alle Führerscheine können dort gemacht werden. Pro Fahrstunde muss man genug Geld auf der Hand haben, um die Fahrstunde anzunehmen.\n\n\nFolgende Befehle benötigt ihr als Fahrlehrer:\n     Zum öffnen eines Gates: /gate\n     Absperrung zwischen den Parkhäuschen heben/senken: /bolls\n     Einem Spieler eine Fahrstunde anbieten: /flearner [Name] [Klasse] (Angenommen werden kann diese mit /faccept)\n     Dem Schüler eine Fahrstunde geben: /flesson\n     Die Fahrstunde beenden: fstop\n     Einem Spieler eine STVO-Abbau Fahrstunde anbieten: /flearner [Name] stvo"
helpText["Gangs"] = {}
helpText["Gangs"]["Tankstellenraub"] = "Der Tankstellenraub bietet eine Möglichkeit für Gangs, Geld zu erbeuten. Wie der Name es schon sagt, muss hierbei eine Tankstelle ausgeraubt werden, aber es gibt nur eine. Begib dich zu der ausraubbaren Tankstelle in San Fierro nahe der Golden Gate Bridge. Zerschieße nun die 2 äußeren Kameras am Eingang. Betrete nun die Tankstelle.Töte nun die Kassiererin und gebe den Befehl /sucheKarte ein. Sollte er diese Karte nicht beim ersten Male finden, sollte man den Befehl nochmals eingeben. Wenn die Karte gefunden ist, klickt man nun mit AltGR oder M auf die Kasse und man bekommt eine variable Summe an Geld. Verschwinde nun von der Tankstelle, bevor die Cops davon Wind bekommen."
helpText["Gangs"]["Bankraub"] = "Der Bankraub ist eine Art schwerer Raub, wobei man eine Bank überfallen muss. Begib dich zu der Bank in San Fierro mit einer Gang. Insgesamt müssen 10 Mann dabei sein, wobei mindestens einer davon ein Terrorist sein muss. Begibt euch zum Tresorraum. Ein Co- Leader hat nun die Aufgabe, auf das Tresorschloss zu klicken und den Zahlencode zu knacken. Das Prinzip muss man verstanden haben dabei. Ist dies geschafft, rennt ihr alle in den Tresorraum rein und kickt auf die Geldsäcke, die dort überall rumliegen. Nun rennt ihr mit ca. 8000€ pro Sack hinaus und probiert euch nicht von der Polizei erwischen zu lassen."
helpText["Gangs"]["Waffentransport"] = "Der Waffentransport bietet für die Gangs eine Möglichkeit, Waffen zu bekommen. Hierbei muss man sich zu den Waffentransportspawn begeben, der sich nahe dem Dorf Palomimo Creek an einem Strand, Steg befindet. Es werden 5 Gangmitglieder der gleichen Fraktion benötigt. Begebt euch nun in den blauen Marker und klickt auf Bestätigen. Ihr 5 werdet nun alle in einem Schlauchboot mit einer Kiste hinten drauf spawnen. Euer Ziel ist nun, dieses Boot zum roten Marker auf der Minimap bringen. Aber passt auf, dass euch die Cops unterwegs nicht mit euren Booten erwischen, deshalb drauf achten: Handy aus. Bei den Terroristen ist dies anders, bei den Terroristen müsst ihr mit einen Transporter zu der Terroristen Base fahren."
helpText["Gangs"]["Schwarzpulver"] = "Der Schwarzpulver Transport ist die einzigste Möglichkeit an Schwarzpulver zu kommen. Dieses wird für Bomben benötigt. Begebt euch nun zu der Terroristen Base in der Wüste von Las Venturas, in Arco Del Deste Unterhalb der Terroristen Base, in den Ruinen ist ein gelber Marker. Begebt euch in den Marker und bestätigt den Schwarzpulver Transport. Wartet nun in dem Transporter. Den Terroristen wird nun Bescheid gegeben und diese werden euch mithilfe von Gabelstaplern die Schwarzpulver Kisten auf den Truck laden. Verlasst den Truck dabei nicht. Wenn der ladevorgang abgeschlossen ist, fahrt ihr nun mit euren ST zurück in eure Base. Pro gefahrenen Schwarzpulver Transport gibt es +750 Schwarzpulver. Bedenkt jedoch dass dieses Pulver nicht euch, sondern der Fraktion gehört."
helpText["Gangs"]["Biketruck"] = "Der Biketruck oder auch Biketransport ist nur für die Nordic Angels durchführbar. Ziel besteht hierdrin, den Biketransport in den Bikeshop der Nordic Angels zu fahren, damit das gestohlene Bike von anderen Usern gekauft werden kann. Dadurch verdienen die Nordics ihr Geld. Besonders begehrt ist die Sanchez. Um einen Biketruck zu fahren, müsst ihr euch zu den Ocean Docs in Los Santos begeben. Nahe dem Schiff befindet sich ein blauer Marker. Bestätigt nun den Biketransport und fahrt diesen zu den roten Marker in San Fierro. Aber achtet auch hier drauf: Die Cops wissen Bescheid."
helpText["Gangs"]["Bombe"] = "Bei einer Bombe kämpft jeweils die bombenlegende Gang gegen die Staatsfraktionisten. Die Gang muss die Bombe verteidigen und die Staatsfraktionisten müssen die Bombe entschärfen. Schafft die Gang es die Bombe zu verteidigen, gibt es pro Gangler +250€ auf die Hand, für denjenigen der die Bombe gelegt hat sogar +500€ und 10000€ kommen in die Fraktionskasse. Dasselbe auf der Seite der Staatsfraktionisten, bloß dass es kein Geld in der Fraktionskasse geben wird. Um eine Bombe zu legen, sucht ihr euch erst einen passenden Ort für die Bombe gemäß den Serverregeln. Nun craftet ihr euch eine Bombe, mithilfe der Crafting- Kästchen und den Bomben Vorschlag. Folgendes müsst ihr in die Felder legen: Auf Platz 2 Hanf, 3 Holz, 4 Metall, 7 Metall, 8 Holz, 9 Metall, 12 Metall, 13 Metall, 14 Metall. Die Bombe ist nun gelegt und ihr könnt diese gemäß den Serverregeln verteidigen."
helpText["Gangs"]["Gangwar"] = "Bei einem Gangwar (Bandenkrieg) handelt es sich um ein Gefecht, das nach dem Prinzip \"Last man standing\" funktioniert. Wenn eine Gang eine andere attackt, siehst du auf der Map ein hellgrünes Gebiet, das beudetet, dass dort aktuell ein Gangwar läuft. Nachdem die angegriffene Gang eine Meldung bekommt, begeben sie sich zum Gebiet und versuchen solange ihre auf ihre Gegner einzuschießen, bis alle Rivalen tot sind. Nachdem ein Gangwar gewonnen wurde, bekommt das Gebiet die gangtypische Farbe (Bsp.: Rifa --> blaues Gebiet) Du solltest es vermeiden ein laufendes Gangwargebiet zu betreten, da du dort mit heftigem Beschuss rechnen musst."
helpText["Gangs"]["SF Rifa"] = "Die San Fierro Rifa ist eine der 4 Gangwar Gangs in Xtream- Reallife. Ihre Farbe ist üblicherweise blau und ihr Markenzeichen ist das Gras. Die Gang ist auch gut für Neulinge. Die Rifa (rifa = Streit, Zank) ist eine mexikanische Bande aus Grand Theft Auto: San Andreas in San Fierro, die während der Spielgeschehens mit den Ballas und den Los Santos Vagos im Betäubungsmittelgeschäft zusammenarbeitet. Die Rifa hatte anfangs eine Abneigung gegenüber mexikanischen Banden in Los Santos, bis sie sich im Betäubungsmittelgeschäft niederließ und mit den Los Santos Vagos ein Bündnis schloss. Mit den hiesigen Triaden und Da Nang Boys scheint sie nicht auf Kriegsfuß zu stehen.\n\nRangordnung\n     Jefe (Leader)\n     Baron (Co-Leader)\n     Capitan (Rang 3)\n     Trepador (Rang 2)\n     Miembro (Rang 1)\n     Novicio (Rang 0)\n\nEigenschaften und Fähigkeiten\n     Gangwars\n     Waffenhandel\n     Waffentransporte\n     Schwarzpulver Transport\n     Bomben legen\n     Bankraub\n     Tankstellenraub\n     Flaggenjagd"
helpText["Gangs"]["DNB"] = "Die Da Nang Boys sind eine der 4 Gangwar Fraktion auf Xtream- Reallife. Sie sind auch gut für Neulinge. Ihre Farbe ist Dunkelrot und ihr Markenzeichen ist das Ninja-Schwert. Die Da Nang Boys (benannt nach der vietnamesischen Region und Stadt Da Nang) sind eine vietnamesische Verbrecherorganisation in Grand Theft Auto: San Andreas, aus San Fierro, die vorhat, in die Vereinigten Staaten überzusiedeln. Sie sind extrem gewalttätig und kontrollieren das Hafen-/Ufergebiet um das Easter Basin herum und mindestens einen der beiden Frachter, die in der San Fierro Bay vor Anker liegen. Die Da Nang Boys sind tief im Schutzgeld-, Betäubungsmittel- und Menschenhandelsgeschäft verwickelt. Die Da Nang Boys stehen auf Kriegsfuß mit den hiesigen Triaden und sind verantwortlich für das Blood-Feather-Triaden-Blutbad.\n\nRangordnung\n     Xin Chan (Leader)\n     Xon Chi (Co-Leader)\n     Quan Trong (Rank 3)\n     Vu Chang (Rank 2)\n     Hai-Trong (Rank 1)\n     Huy Do (Rank 0)\n\nEigenschaften und Fähigkeiten\n     Gangwars\n     Waffenhandel\n     Waffentransporte\n     Schwarzpulver Transport\n     Bomben legen\n     Bankraub\n     Tankstellenraub\n     Flaggenjagd"
helpText["Gangs"]["Mafia"] = "Die Mafia ist eine der 4 Gangwar Fraktionen auf Xtream- Reallife. Sie sind ebenfals gut für Neulinge. Ihr Markenzeichen ist die Revolver und ihre Farbe ist Dunkelgrau bis schwarz. Die Russische Mafia (engl. Russian Mafia) ist eine Bande aus Grand Theft Auto: San Andreas. Sie erscheint nur für eine kurze Zeit in San Andreas, wo sie in Schwarz oder Grau gekleidet ist. Da sie keinen permanenten Sitz bzw. kein beständiges Bandengebiet in San Andreas haben, haben sie in einer Mission das Atrium für sich als provisorisches Hauptquartier in Anspruch genommen und scheinen mit den Ballas, Vagos und Rifa in Big Smokes Crackpalast verbündet zu sein. So liefern zum Beispiel die Ballas Fahrzeuge im Tausch von Waffen. Ihre Base ist in San Fierro und beansprucht eine Kirche. Der Waffenhändler der Russen macht in einer Mission ein Deal mit den Ballas aus, indem es über Waffenlieferungen geht.\n\nRangordnung\n     Capro Crimini (Leader)\n     Capro Bastone (Co-Leader)\n     Sgarrista (Rank 3)\n     Picciotte (Rank 2)\n     Cupola (Rank 1)\n     Giovanni D'Honore (Rank 0)\n\nEigenschaften und Fähigkeiten\n     Gangwars\n     Waffenhandel\n     Waffentransporte\n     Schwarzpulver Transport\n     Bomben legen\n     Bankraub\n     Tankstellenraub\n     Flaggenjagd"
helpText["Gangs"]["Nordic Angels"] = "Die Nordic Angels ist eine Bikergang und gehört zu einen der 4 Gangwar Gangs in Xtream- Reallife. Ihre Farbe ist braun und ihr Logo ist eine Kobra. Sie ist zudem geeignet für Neulinge und Erfahrene, ihre Base steht nahe der Area 51 und beeinhaltet die Gaststätte Lil Prob' in. Zudem besitzen die Nordics einen Motorrad Shop in San Fierro, wo sie mit gestohlenen Bikes ihre Geschäfte machen. Sie bevorzugen die Freeway und sind in ländlicheren Bereichen anzutreffen. Während der Storyline tauchen sie nicht auf. Sehr selten kann man einige Mitglieder als Drogendealer antreffen.\n\nRangordnung\n     Ghostrider (Leader)\n     Hellrider (Co-Leader)\n     Nightrider (Rank 3)\n     Rider (Rank 2)\n     Lowrider (Rank 1)\n     Newbie (Rank 0)\n\nEigenschaften\n     Gangwars\n     Waffenhandel\n     Waffentransporte\n     Schwarzpulver Transport\n     Bomben legen\n     Bankraub\n     Tankstellenraub\n     Flaggenjagd\n     Biketransport\n     Bikeshop (nahe SF Bahnhof)"
helpText["Gangs"]["Terroristen"] = "Die Terroristen sind die explosivste und Waffentechnisch stärkste Gang in San Fierro. Die Terroristen stehen üblicherweise für Terror und stehen im Dauerkrieg mit der Bundeswehr. Sie sind eher für erfahrene Leute. Ihre Base steht in Arco Del Deste auf einem Berg, wo sie geheim bleiben können.\n\nRangordnung\n     Bin Laden (Leader)\n     Taliban (Co-Leader)\n     Risto (Rank 3)\n     Achmed (Rank 2)\n     Bully (Rank 1)\n     Kanonenfutter (Rank 0)\n\nEigenschaften und Fähigkeiten\n     Bomben legen\n     Schwarzpulver Transport beladen\n     Gürtelbomben\n     Raketenwerfer und Satchels für die Leaderschaft\n     Waffentransport auf Land\n     Alkatrazausbruch\n     Bankraub\n     Tankstellenraub\n     Flaggenjagd"
helpText["Gangs"]["Ballas"] = "Die Ballas sind in Xtream- Reallife eher eine ruhige Gang, die keine Gangwars machen. Ihre Farbe ist Lila und ihr Markenzeichen die Drogen. Ihre Base steht nahe den Los Santos Docks und die Gang ist am besten für Neulinge geeignet, die erstmal nichts mit Gangwars zutun haben wollen. Ihre Hauptaufgabe besteht darin, Hanf anzupflanzen, ab zu ernten und weiter zu verkaufen. Die Bande betätigt sich stark in Drogenhandel, Prostitution und Waffenhandel, in erster Linie aber im Kokainhandel. Die Ballas sind die Erzrivalen der Families und den Varrios Los Aztecas und haben Drogenbeziehungen zu den Los Santos Vagos, San Fierro Rifa und dem Loco-Syndikat und beziehen ihre Waffen von der Russischen Mafia. Sie arbeiteten auch mit der korrupten Polizeitruppe C.R.A.S.H. zusammen, die – anstatt das Bandenverbrechen zu bekämpfen, weswegen sie gegründet wurde – mit den Banden zusammenarbeitete.\n\nRangordnung\n     Kane (Leader)\n     Little Weasel (Co-Leader)\n     Derrick Edmond (Rank 3)\n     Donnie Anderson (Rank 2)\n     Ricky (Rank 1)\n     Dealer (Rank 0)\n\nEigenschaften und Fähigkeiten\n     Schwarzpulver Transport\n     Bomben legen\n     Bankraub\n     Tankstellenraub\n     Flaggenjagd\n     Hanftransporte\n     Hanf anpflanzen\n     Drogenhandel"
helpText["Serverregeln"] = {}
helpText["Serverregeln"]["Cheats"] = "► Als Cheats gelten Programme oder Programmteile (Cheat-Software, Mods, Trainer etc.), die dem Spieler einen Vorteil gegenüber anderen Spielern verschaffen oder verschaffen können.\n► Das Benutzen von Cheats ist strengstens verboten.\n► Der Besitz und die Weitergabe von Cheats ist verboten.\n► Es besteht kein Unterschied zwischen absichtlichem und unabsichtlichem Nutzen von Cheats.\n► Erkannte Cheater sind unverzüglich den Administratoren/Supportern zu melden (/report). Wer Cheater durch Untätigkeit deckt oder ercheatete Vorteile nutzt, wird als Mittäter einem Cheater gleichgestellt behandelt."
helpText["Serverregeln"]["Bugs"] = "► Jeder Nutzer ist verpflichtet, gefundene Bugs umgehend den Administratoren zu melden.\n► Das Ausnutzen von Bugs, das sogenannte Bugusing, ist verboten.\n► Abhängig von der Heftigkeit des Bugs können Belohnungen bei ordnungsgemäßer Meldung gezahlt werden.\n► Ist der Buguser Mitglied einer Fraktion, zieht dieses einen sofortigen Uninvite mit sich."
helpText["Serverregeln"]["Beleidigungen"] = "► Jeder Spieler ist respektvoll zu behandeln.\n► Beleidigungen, Diskriminierungen und Provokationen jeglicher Form sind in allen Kommunikationssystemen, die von Xtream Reallife betrieben werden, verboten.\n► Als Beleidigungen zählen Ausdrücke, die einen Spieler persönlich angreifen."
helpText["Serverregeln"]["STVO"] = "► Die Verkehrsregeln auf dem Server sind der aktuellen Straßenverkehrsordnung (StVO) der Bundesrepublik Deutschland angelehnt.\n► Es gilt das Rechtsfahrgebot: Es muss auf der rechten Straßenseite so weit rechts wie möglich gefahren werden.\n► Beim Überholen muss besonders darauf geachtet werden, dass der entgegenkommende Verkehr nicht gefährdet wird.\n► Nach dem Überholvorgang muss zügig wieder auf die rechte Spur gewechselt werden.\n► Die Höchstgeschwindigkeit beträgt innerorts 80 km/h, außerorts und auf Autobahnen ist sie nicht begrenzt\n► An unübersichtlichen Kreuzungen muss die Geschwindigkeit verringert werden.\n► Sinnloses Rammen anderer Verkehrsteilnehmer oder unangemessenes Fahrverhalten kann mit einem Ausschluss bestraft werden.\n► Das An- und Überfahren von Spielern ist verboten.\n► Das non-reale Mitfahren auf Fahrzeugdächern, auch Carsurfing genannt, ist nicht erwünscht.\n► Sowohl das \"Totparken\" als auch das sogenannte \"Rotorn\" ist strengstens untersagt."
helpText["Serverregeln"]["Parken"] = "► Auf einem öffentlichen Parkplatz ist das Parken stets erlaubt. Autos, die in Schräglage parken, andere Fahrzeuge blockieren oder auf einem bereits genutzen Parkplatz parken, werden abgeschleppt! Weicht am besten auf weniger überlastete Parkplätze aus. Es gibt unzählige Plätze, die nicht belegt sind. Es wird davon abgeraten die Parkplätze am Bahnhof, sowie am Burgershop (Noobspawn SF) zu parken.\n► Parken ist nur an Häusern erlaubt, die euch gehören und dort, wo es mit dem Vermieter des Hauses abgesprochen wurde.\n► Auf öffentlichen Straßen, sowie auf dem Bürgersteig darf nicht geparkt werden.\n► Es ist nicht erlaubt in der Nähe des Noobspawns zu parken.\n► Das Parken auf Grünflächen, sowie in Parks, Wäldern und Wüsten ist untersagt.\n► Vergesst nicht gekaufte Fahrzeuge direkt nach dem Kauf korrekt zu parken. Dies darf nicht vor dem Autohaus geschehen, da das Parken dort nicht erlaubt ist.\n► Helikopter und Flugzeuge dürfen nur auf dem Flughafengelände oder im Hangar geparkt werden. Helikopter dürfen auch auf Helipads geparkt werden."
helpText["Serverregeln"]["Werbung"] = "► Die Ausnutzung der Werbung ist verboten.\n► Folgene Werbung ist erlaubt: Business-Werbung, Werbung für eine Fraktion, Handels-Werbung\n► Bei Waffen oder Drogenverkäufen ist der Vergabe von einem Wanted wegen \"Illegaler Anzeige\" zu rechnen\n► Strengstens verboten sind: Werbung für andere Server; Beleidigungen, Ständiges Großschreiben (Capslock); Rückfragen oder Grüße an Spieler\n► Events per /ad sind verboten, solange sie nicht mit der Projektleitung abgesprochen wurden.\n► Werben für's Freikaufen ist verboten.\n► Sinnlose AD's sind verboten."
helpText["Serverregeln"]["Andere Server"] = "► Es besteht die Möglichkeit auf anderen MTA-Servern zu spielen.\n► Es ist verboten, in Systemen des Xtream Reallife Teams Werbung für andere MTA-Server oder ähnliche Projekte zu machen.\n► Die User sind verpflichtet, bei Fremdserverwerbung sofort einen Teammitglied zu kontaktieren. Sollten wir herausfinden, dass ein User von Fremdserverwerbung auf Xtream-Reallife wusste, das Team aber nicht sofort kontaktierte, wird auch dem User eine Strafe auferlegt."
helpText["Serverregeln"]["Multiaccount"] = "► Multiaccounting bezeichnet das Nutzen von mehr Accounts durch eine Person, wenn nicht alle bis auf einen der Accounts gesperrt sind.\n► Sollten mehrere Accounts bestehen, ist dieses sofort zu melden und die zustätzlichen Accounts zu sperren.\n► Wenn Multiaccounting vorliegt, dürfen die betroffenen Accounts nicht untereinander interagieren.\n► Multiaccounting beinhaltet Aufwerten anderer Accounts durch einen nicht aktiv gespielten Account.\n► Die Folge hiervon ist ein permanenter Bann für alle beteiligten Accounts."
helpText["Serverregeln"]["O.M.S.-Flucht"] = "► Es ist verboten aus einer unangenehmen Situation an einen unerreichbaren Ort zu entfliehen. (z.B. Durch Marker-, Offline- oder Selbstmord-Flucht)\n► Jobflucht ist ebenfalls untersagt.\n► Das Töten von Spielern um ihnen einen Vorteil zu verschaffen ist untersagt.\n► Sich selbst zu töten um sich einen Vorteil zu verschaffen ist ebenfalls untersagt."
helpText["Serverregeln"]["SDM"] = "► SDM bezeichnet wiederholten grundlosen Schusswechsel/ Kampf/ Angriff.\n► Waffen dürfen nur zu Selbstverteidigungszwecken oder Racheakte benutzt werden. Dazu zählen auch: Verteidigung bei Verfolgung/Angriff mit (Waffen-)Gewalt; Verteidigen/Angreifen eines Ganggebietes (nur Gangs); Befreiung von Spielern aus den Fesseln der Polizei oder anderer Gangs; Racheakte sind bis 30 Minuten nach der Tat erlaubt, Krieg zwischen zwei befeindeten Gangs; Gang-Events\n► Racheakte (nach Überfällen, Fahrzeugdiebstählen, etc.) sind bis 30 Minuten nach der Tat erlaubt.\n► Kopfgeldjagd ist untersagt, da dies kein direkter Racheakt ist.\n► Auf den Schutz von Zivilisten und Unbeteiligten ist zu achten.\n► Es ist verboten Mitspieler direkt oder unmittelbar nach deren Spawn zu töten.\n► Dienstleister (Feuerwehr, Reporter und Mechaniker) haben absoluten DM Schutz, während sie sich im Dienst befinden!!\n► SDM auf Dienstleister ist verboten! Es wird mit einer hohen Strafe geahndet. Es liegt aber im Ermessen des Geschädigten, ob er Wanteds vergibt - vergeben möchte - oder eine Beschwerde eröffnet.\n► Staatsfraktionen dürfen nur angegriffen werden wenn ein \"Sie werden gesucht\" Bind gesetzt wurde.\n► Jobbende Spieler - egal welcher Fraktion - dürfen während des Jobbens und am Jobmarker nicht angegriffen werden.\n► Missbrauch sollte mittels Screens/Videos über das Beschwerdesystem eingereicht werden."
helpText["Serverregeln"]["Spawnschutz"] = "► Der Schusswechsel und jegliches DM ist an beiden Noobspawns verboten!\n► Hier dürfen nur der Tazer, sowie anderweitig gewaltverhindernde Maßnahmen zum Einsatz kommen."
helpText["Serverregeln"]["Pflanzen"] = "► Das Anbauen von Pflanzen auf der Straße, sowie das Erstellen von Barrikaden durch Pflanzen ist nicht gestattet.\n► Das Anbauen in Garagen/Interiors ist ebenfalls untersagt!\n► Pflanzen müssen stets realistisch, d.h. auf Grünflächen, platziert werden."
helpText["Serverregeln"]["Geldvergabe"] = "► Grundlos Geldbeträge (egal welche Höhe) verschenken ist verboten, vor allem dann wenn Spieler aufhören und den Server verlassen.\n► Missachtung dieser Regel, Geldwäsche und auch Betrug führt zu einem Kontostandsreset aller Beteiligten Personen."
helpText["Serverregeln"]["Betrug"] = "► Betrügen eines anderen Spielers ist verboten.\n► Sollte ein Spieler dennoch betrogen werden, gilt es, diesen vom Betrüger zu entschädigen.\n► Es wird keine Erstattung vom Team oder System für nachgewiesene Betrugsfälle geben.\n► Mutwillig oder Verschuldet fremde Fahrzeuge mittels Explosionen zu schädigen gilt ebenfalls als Betrug."
helpText["Serverregeln"]["PSC Handel"] = "► Das handeln von Paysafecard unter den Spielern ist nicht gestattet.\n► Missachtung dieser Regel: Kontostandsreset, Löschung (Zurücksetzung) des erworbenen Objekts, Account sperre."
helpText["Serverregeln"]["Verbannung"] = "► Wir behalten uns vor, einen Spieler zeitweilig oder permanent vom Server zu verweisen, auch wenn dieser nicht explizit gegen eine hier aufgeführte Regel verstößt.\n► Weiterhin verweisen hier mit aller Deutlichkeit auf unsere AGBs. cp.xtream-reallife.de/cpaktuell/portal.php?page=agb"

local state = false
function toggleHelpMenu(self)
	if getElementData(getLocalPlayer(), "loggedin") == 1 then
	--	if not isPedInVehicle(getLocalPlayer()) then 
			if state == true then
				vnxDestroyWindow("hilfemenue")
				vnxDestroyWindow("hilfemenue_suche")
				vnxDestroyWindow("hilfemenue_text")
				showCursor ( false )
				setElementData(getLocalPlayer(),"Clicked",false)
				state = false
				showChat (true)
			else
				showChat (false)
				showCursor ( true )
				setElementData(getLocalPlayer(),"Clicked",true)
				local x,y= screenx/2-600/2,screeny/2-600/2 
				vnxDrawWindow("hilfemenue","window","Hilfemenü",x,y,600,600,"toggleHelpMenu")
				vnxDrawRectangle("hilfemenue","bgmenu",x,y+60,600,40,tocolor(0,105,145,200))
				local tbl = {}
				for k,v in pairs (helpText) do 
					table.insert(tbl,k)
				end
				vnxDrawSelectbox("hilfemenue","auswahl1",x+20,y+70,170,25,tbl,7,"helpSelect1")
				vnxDrawSelectbox("hilfemenue","auswahl2",x+210,y+70,170,25,{},7,"helpSelect2")
				vnxDrawText("hilfemenue","search_text","Suche:",x+410,y+73,200,30,tocolor(255,255,255,255),1,"default","left","top")
				vnxDrawEdit("hilfemenue","edit","",x+450,y+70,100)
				vnxDrawImage("hilfemenue","search_image",x+560,y+68,25,25,"anzeigen/jobs/images/airport_header","help_search") 
				vnxDrawRectangle("hilfemenue","bgtext",x,y+110,600,490,tocolor(0,150,255,50))
				vnxDrawRectangle("hilfemenue","bgtext1",x+10,y+120,580,450,tocolor(0,0,0,150))
				vnxDrawRectangle("hilfemenue","bgtext2",x+10,y+120,580,450,tocolor(0,105,145,50))
				vnxDrawText("hilfemenue_text","text","Willkommen\n \n"..helpText["Allgemein"]["Willkommen"],x+10+10,y+120+10,580-20,450-20,tocolor(255,255,255,255),1,"default","left","top")
				state = true
			end
	--	else
	--	showInfo("Du darfst /self nicht in einem Fahrzeug benutzen!",120,0,0)
	--	end	
	end
end
bindKey ( "f1", "down", toggleHelpMenu)

function helpSelect1()
	vnxDestroyWindow("hilfemenue_text")
	vnxDestroyWindow("hilfemenue_suche")
	local sel = vnxSelectboxGetSelected("hilfemenue","auswahl1")
	local x,y= screenx/2-600/2,screeny/2-600/2 
	local tbl = {}
	for k,v in pairs(helpText[sel]) do 
		table.insert(tbl,k)
	end
	vnxDrawSelectbox("hilfemenue","auswahl2",x+210,y+70,170,25,tbl,7,"helpSelect2")
	if #tbl == 0 then
		vnxDrawText("hilfemenue","text",sel1.."\n \n"..helpText[sel],x+10+10,y+120+10,580-20,450-20,tocolor(255,255,255,255),1,"default","left","top")
	end
end

function helpSelect2()
	vnxDestroyWindow("hilfemenue_text")
	vnxDestroyWindow("hilfemenue_suche")
	local sel1 = vnxSelectboxGetSelected("hilfemenue","auswahl1")
	local sel2 = vnxSelectboxGetSelected("hilfemenue","auswahl2")
	local x,y= screenx/2-600/2,screeny/2-600/2 
	if sel1 and sel2 then
		vnxDrawText("hilfemenue","text",sel2.."\n \n"..helpText[sel1][sel2],x+10+10,y+120+10,580-20,450-20,tocolor(255,255,255,255),1,"default","left","top")
	end
end

local seite = 1
local found = {}
function help_search()
	local x,y= screenx/2-600/2,screeny/2-600/2 
	vnxDrawText("hilfemenue","text","",x+10+10,y+120+10,580-20,75,tocolor(255,255,255,255),1,"default","left","top")
	local tbl = {}
	local search = vnxGetEditText("hilfemenue","edit")
	for k,v in pairs (helpText) do 
		if type(v) == "table" then
			for s,t in pairs (v) do 
				if string.find(string.lower(t), string.lower(search), 1, true) then
					table.insert(tbl,s.."\n"..t)
				end
			end
		else
			if string.find(string.lower(v), string.lower(search), 1, true) then
				table.insert(tbl,k.."\n"..v)
			end
		end
	end
	found = tbl
	search_refresh()
end

function search_refresh()
	local x,y= screenx/2-600/2,screeny/2-600/2 
	local c = 4*(seite-1)+1
	for i = c, c+3 do 
		local txt = found[i]
		if txt then
			local c = i-c+1
			vnxDrawText("hilfemenue_suche","text"..c,txt,x+10+10,y+120+10+(30+75)*(c-1),580-20,75,tocolor(255,255,255,255),1,"default","left","top")
		else
			break
		end
	end
	vnxDrawButton("hilfemenue_suche","zurück","<--",x+20,y+545,50,15,"search_back")
	vnxDrawButton("hilfemenue_suche","weiter","-->",x+20+60,y+545,50,15,"search_next")
end

function search_back()
	if seite > 1 then
		seite = seite - 1
		search_refresh()
	end
end

function search_next()
	if 4*(seite-1)+1+3 < #found then
		seite = seite + 1
		search_refresh()
	end
end
]]