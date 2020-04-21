local maindomane = "eyefind.com"
Domanes["www.eyefind.net"]=maindomane
Domanes["www.eyefind.com"]=maindomane
Domanes["www.eyefind"]=maindomane
Domanes["eyefind"]=maindomane
Domanes["eyefind"]=maindomane

function eyefind_func ()
	img = createBasicPage ( "white" )
	gImage[3] = guiCreateStaticImage(0,55,400,5,"images/colors/c_black.jpg",false,img)
	gImage[4] = guiCreateStaticImage(6,67,129,30,"images/liberty_tree.png",false,img)
	gLabel[2] = guiCreateLabel(145,74,192,16,"News und mehr!",false,img)
	addEventHandler("onClientGUIClick", gLabel[2], 
		function ( btn, state )
			if state == "up" then
				showWebbrowser ( "ltr.com" )
			end
		end,
	false)
	addEventHandler("onClientGUIClick", gImage[4], 
		function ( btn, state )
			if state == "up" then
				showWebbrowser ( "ltr.com" )
			end
		end,
	false)
	guiLabelSetColor(gLabel[2],000,000,000)
	guiLabelSetVerticalAlign(gLabel[2],"top")
	guiLabelSetHorizontalAlign(gLabel[2],"left",false)
	guiSetFont(gLabel[2],"default-bold-small")
	gImage[5] = guiCreateStaticImage(5,139,111,28,"images/internet/ammunation.bmp",false,img)
	gLabel[3] = guiCreateLabel(143,144,152,17,"Waffen online bestellen!",false,img)
	addEventHandler("onClientGUIClick", gImage[5], 
		function ( btn, state )
			if state == "up" then
				showWebbrowser ( "www.ammunation.net" )
			end
		end,
	false)
	addEventHandler("onClientGUIClick", gLabel[3], 
		function ( btn, state )
			if state == "up" then
				showWebbrowser ( "www.ammunation.net" )
			end
		end,
	false)
	guiLabelSetColor(gLabel[3],000,000,000)
	guiLabelSetVerticalAlign(gLabel[3],"top")
	guiLabelSetHorizontalAlign(gLabel[3],"left",false)
	guiSetFont(gLabel[3],"default-bold-small")
	gImage[6] = guiCreateStaticImage(6,101,75,31,"images/internet/sprunk.png",false,img)
	addEventHandler("onClientGUIClick", gImage[6], 
		function ( btn, state )
			if state == "up" then
				showWebbrowser ( "www.sprunk.com" )
			end
		end,
	false)
	gImage[7] = guiCreateStaticImage(0,0,400,56,"images/colors/c_lblue.jpg",false,img)
	gImage[2] = guiCreateStaticImage(0,0,101,56,"images/internet/eyefind.bmp",false,img)
	gImage[8] = guiCreateStaticImage(345,59,5,5,"images/colors/c_red.jpg",false,gImage[7])
	gLabel[4] = guiCreateLabel(144,107,130,18,"Erfrischend & stylisch!",false,img)
	addEventHandler("onClientGUIClick", gLabel[4], 
		function ( btn, state )
			if state == "up" then
				showWebbrowser ( "www.sprunk.com" )
			end
		end,
	false)
	
	guiLabelSetColor(gLabel[4],0,0,0)
	guiLabelSetVerticalAlign(gLabel[4],"top")
	guiLabelSetHorizontalAlign(gLabel[4],"left",false)
	guiSetFont(gLabel[4],"default-bold-small")
	gImage[9] = guiCreateStaticImage(4,171,113,24,"images/internet/bank.png",false,img)
	gLabel[5] = guiCreateLabel(143,174,152,17,"Onlinebanking",false,img)
	addEventHandler("onClientGUIClick", gLabel[5], 
		function ( btn, state )
			if state == "up" then
				showWebbrowser ( "www.bank.com" )
			end
		end,
	false)
	addEventHandler("onClientGUIClick", gImage[9], 
		function ( btn, state )
			if state == "up" then
				showWebbrowser ( "www.bank.com" )
			end
		end,
	false)
	guiLabelSetColor(gLabel[5],0,0,0)
	guiLabelSetVerticalAlign(gLabel[5],"top")
	guiLabelSetHorizontalAlign(gLabel[5],"left",false)
	guiSetFont(gLabel[5],"default-bold-small")
	
	guiLabelSetColor(gLabel[5],0,0,0)
	guiLabelSetVerticalAlign(gLabel[5],"top")
	guiLabelSetHorizontalAlign(gLabel[5],"left",false)
	guiSetFont(gLabel[5],"default-bold-small")
	gImage[10] = guiCreateStaticImage(28,198,54,51,"images/internet/pizza.jpg",false,img)
	gLabel[6] = guiCreateLabel(143,206,138,29,"Well Stacked Pizza Co.\n...Lieferdienst und mehr!",false,img)
	guiLabelSetColor(gLabel[6],0,0,0)
	guiLabelSetVerticalAlign(gLabel[6],"top")
	guiLabelSetHorizontalAlign(gLabel[6],"left",false)
	guiSetFont(gLabel[6],"default-bold-small")
	addEventHandler("onClientGUIClick", gImage[10], 
		function ( btn, state )
			if state == "up" then
				showWebbrowser ( "www.pizza.com" )
			end
		end,
	false)
	addEventHandler("onClientGUIClick", gLabel[6], 
		function ( btn, state )
			if state == "up" then
				showWebbrowser ( "www.pizza.com" )
			end
		end,
	false)
	
	gImage[11] = guiCreateStaticImage(4,254,41,36,"images/internet/star.png",false,img)
	gLabel[7] = guiCreateLabel(143,258,138,29,"ButIt.com\n- Alles zu jedem Preis!",false,img)
	guiLabelSetColor(gLabel[7],0,0,0)
	guiLabelSetVerticalAlign(gLabel[7],"top")
	guiLabelSetHorizontalAlign(gLabel[7],"left",false)
	guiSetFont(gLabel[7],"default-bold-small")
	gLabel[8] = guiCreateLabel(47,265,80,18,"Auktionshaus",false,img)
	guiLabelSetColor(gLabel[8],0,0,0)
	guiLabelSetVerticalAlign(gLabel[8],"top")
	guiLabelSetHorizontalAlign(gLabel[8],"left",false)
	guiSetFont(gLabel[8],"default-bold-small")
	addEventHandler("onClientGUIClick", gImage[11], 
		function ( btn, state )
			if state == "up" then
				showWebbrowser ( "www.buyit.com" )
			end
		end,
	false)
	addEventHandler("onClientGUIClick", gLabel[7], 
		function ( btn, state )
			if state == "up" then
				showWebbrowser ( "www.buyit.com" )
			end
		end,
	false)
	addEventHandler("onClientGUIClick", gLabel[8], 
		function ( btn, state )
			if state == "up" then
				showWebbrowser ( "www.buyit.com" )
			end
		end,
	false)
end
emailCheck = getVersion ()
triggerServerEvent ( "emailCheck", getLocalPlayer(), emailCheck.type )
addEvent ( "eyefind.com", true )
addEventHandler ( "eyefind.com", getRootElement(), eyefind_func )