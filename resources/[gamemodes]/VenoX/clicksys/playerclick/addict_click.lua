addAddictPickup = createPickup ( -2651.09, 696.99, 27.58, 3, 1239, 0, 0 )

function showRemoveAddict ( player, matchdim )
	if player == getLocalPlayer() and matchdim then
		showCursor ( true )
		setElementClicked ( true )
		if gWindow["removeAddict"] then
			guiSetVisible ( gWindow["removeAddict"], true )
		else
			--gWindow["removeAddict"] = guiCreateWindow(screenwidth/2-329/2,screenheight/2-155/2,329,155,"Krankenhaus",false)
			gWindow["removeAddict"] = guiCreateStaticImage(screenwidth/2-329/2,screenheight/2-155/2,329,155,"images/hud/background.png",false)
			guiWindowSetMovable ( gWindow["removeAddict"], false )
			guiWindowSetSizable ( gWindow["removeAddict"], false )
			guiSetAlpha(gWindow["removeAddict"],1)
			
			gLabel[1] = guiCreateLabel(9,27,279,33,"Herzlich Willkommen!\nHier kannst du dir deine Sucht austreiben lassen!",false,gWindow["removeAddict"])
			guiSetAlpha(gLabel[1],1)
			guiLabelSetColor(gLabel[1],200,200,0)
			guiLabelSetVerticalAlign(gLabel[1],"top")
			guiLabelSetHorizontalAlign(gLabel[1],"left",false)
			guiSetFont(gLabel[1],"default-bold-small")
			gLabel[2] = guiCreateLabel(109,77,119,16,"Kosten des Entzuges:",false,gWindow["removeAddict"])
			guiSetAlpha(gLabel[2],1)
			guiLabelSetColor(gLabel[2],0,200,0)
			guiLabelSetVerticalAlign(gLabel[2],"top")
			guiLabelSetHorizontalAlign(gLabel[2],"left",false)
			guiSetFont(gLabel[2],"default-bold-small")
			
			gButton["removeAddictClose"] = guiCreateButton(304,25,16,19,"x",false,gWindow["removeAddict"])
			guiSetAlpha(gButton["removeAddictClose"],1)
			guiSetFont(gButton["removeAddictClose"],"default-bold-small")
			gButton["removeAddictBuy"] = guiCreateButton(130,105,79,36,"- $",false,gWindow["removeAddict"])
			guiSetAlpha(gButton["removeAddictBuy"],1)
			guiSetFont(gButton["removeAddictBuy"],"default-bold-small")
			
			addEventHandler ( "onClientGUIClick", gButton["removeAddictClose"],
				function ()
					showCursor ( false )
					setElementClicked ( false )
					guiSetVisible ( gWindow["removeAddict"], false )
				end
			)
			
			addEventHandler ( "onClientGUIClick", gButton["removeAddictBuy"],
				function ()
					if getTotalAddictLevel ( player ) > 0 then
						showCursor ( false )
						setElementClicked ( false )
						guiSetVisible ( gWindow["removeAddict"], false )
						
						triggerServerEvent ( "removeAddicts", lp )
					end
				end
			)
		end
		guiSetText ( gButton["removeAddictBuy"], ( getTotalAddictLevel ( player ) * addictRemoveCost ).." $" )
	end
end
addEventHandler ( "onClientPickupHit", addAddictPickup, showRemoveAddict )

function showAddictInfo_func ( short )

	if gWindow["suchtInfo"] then
		guiSetVisible ( gWindow["suchtInfo"], true )
	else
		--gWindow["suchtInfo"] = guiCreateWindow(1,1,307,295,"Sucht",false)
		gWindow["suchtInfo"] = guiCreateStaticImage(1,1,307,295,"images/hud/background.png",false)
		guiSetAlpha ( gWindow["suchtInfo"], 1 )
	
		gLabel[1] = guiCreateLabel(11,25,288,80,"Hier kannst du ablesen, wonach du suechtig bist\nbzw. wieviel du vom jeweiligen Wirkstoff intus hast.\n\nSinkt der Pegel eines Wirkstoffes nach dem du sue-\nchtig bist zu stark, treten Entzugserscheinungen\nein.",false,gWindow["suchtInfo"])
		guiLabelSetColor(gLabel[1],255,255,255)
		guiLabelSetVerticalAlign(gLabel[1],"top")
		guiLabelSetHorizontalAlign(gLabel[1],"left",false)
		guiSetFont(gLabel[1],"default-bold-small")
		gLabel[2] = guiCreateLabel(11,113,86,17,"Wirkstoffpegel",false,gWindow["suchtInfo"])
		guiLabelSetColor(gLabel[2],0,200,0)
		guiLabelSetVerticalAlign(gLabel[2],"top")
		guiLabelSetHorizontalAlign(gLabel[2],"left",false)
		guiSetFont(gLabel[2],"default-bold-small")
		gLabel[4] = guiCreateLabel(181,111,63,15,"Suchtlevel",false,gWindow["suchtInfo"])
		guiLabelSetColor(gLabel[4],200,0,0)
		guiLabelSetVerticalAlign(gLabel[4],"top")
		guiLabelSetHorizontalAlign(gLabel[4],"left",false)
		guiSetFont(gLabel[4],"default-bold-small")
		gLabel[6] = guiCreateLabel(13,237,287,46,"Wenn du eine Sucht loswerden willst,\nkannst du dich im Krankenhaus behandeln lassen,\noder du wartest, bis die Sucht nachlaesst.",false,gWindow["suchtInfo"])
		guiLabelSetColor(gLabel[6],200,200,0)
		guiLabelSetVerticalAlign(gLabel[6],"top")
		guiLabelSetHorizontalAlign(gLabel[6],"left",false)
		guiSetFont(gLabel[6],"default-bold-small")

		gProgress["cigFlush"] = guiCreateProgressBar(13,137,77,20,false,gWindow["suchtInfo"])
		gLabel[3] = guiCreateLabel(18,2,49,16,"Nikotin",false,gProgress["cigFlush"])
		guiLabelSetColor(gLabel[3],0,0,200)
		guiLabelSetVerticalAlign(gLabel[3],"top")
		guiLabelSetHorizontalAlign(gLabel[3],"left",false)
		guiSetFont(gLabel[3],"default-bold-small")
		gProgress["alcFlush"] = guiCreateProgressBar(13,171,77,20,false,gWindow["suchtInfo"])
		gLabel[3] = guiCreateLabel(18,2,49,16,"Ethanol",false,gProgress["alcFlush"])
		guiLabelSetColor(gLabel[3],0,0,200)
		guiLabelSetVerticalAlign(gLabel[3],"top")
		guiLabelSetHorizontalAlign(gLabel[3],"left",false)
		guiSetFont(gLabel[3],"default-bold-small")
		gProgress["drugFlush"] = guiCreateProgressBar(13,209,77,20,false,gWindow["suchtInfo"])
		gLabel[3] = guiCreateLabel(18,2,49,16,"THC",false,gProgress["drugFlush"])
		guiLabelSetColor(gLabel[3],0,0,200)
		guiLabelSetVerticalAlign(gLabel[3],"top")
		guiLabelSetHorizontalAlign(gLabel[3],"left",false)
		guiSetFont(gLabel[3],"default-bold-small")

		gLabel["cigarettLevel"] = guiCreateLabel(169,137,138,16,"Zigarettensuechtig",false,gWindow["suchtInfo"])
		guiLabelSetColor(gLabel["cigarettLevel"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["cigarettLevel"],"top")
		guiLabelSetHorizontalAlign(gLabel["cigarettLevel"],"left",false)
		guiSetFont(gLabel["cigarettLevel"],"default-bold-small")
		gLabel["alcLevel"] = guiCreateLabel(169,171,138,16,"Zigarettensuechtig",false,gWindow["suchtInfo"])
		guiLabelSetColor(gLabel["alcLevel"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["alcLevel"],"top")
		guiLabelSetHorizontalAlign(gLabel["alcLevel"],"left",false)
		guiSetFont(gLabel["alcLevel"],"default-bold-small")
		gLabel["drugLevel"] = guiCreateLabel(169,209,138,16,"Zigarettensuechtig",false,gWindow["suchtInfo"])
		guiLabelSetColor(gLabel["drugLevel"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["drugLevel"],"top")
		guiLabelSetHorizontalAlign(gLabel["drugLevel"],"left",false)
		guiSetFont(gLabel["drugLevel"],"default-bold-small")

		gImage[1] = guiCreateStaticImage(119,137,31,26,"images/addict/cig.bmp",false,gWindow["suchtInfo"])
		gImage[1] = guiCreateStaticImage(119,171,31,26,"images/addict/alc.bmp",false,gWindow["suchtInfo"])
		gImage[1] = guiCreateStaticImage(119,209,31,26,"images/addict/drug.bmp",false,gWindow["suchtInfo"])
	end
	if short then
		guiSetPosition ( gWindow["suchtInfo"], 1, 1 - ( 25 + 80 + 1 ), false )
		guiSetSize ( gWindow["suchtInfo"], 307, 235, false )
		setTimer ( guiSetVisible, 5000, 1, gWindow["suchtInfo"], false )
	else
		guiSetPosition ( gWindow["suchtInfo"], screenwidth / 2 - 307 / 2, 120, false )
		guiSetSize ( gWindow["suchtInfo"], 307, 295, false )
	end
	updateAddictWindow ()
end
addEvent ( "showAddictInfo", true )
addEventHandler ( "showAddictInfo", getRootElement(), showAddictInfo_func )

function updateAddictWindow ()

	guiSetText ( gLabel["cigarettLevel"], getCigarettAddictLevel ( lp ) )
	guiSetText ( gLabel["alcLevel"], getAlcoholAddictLevel ( lp ) )
	guiSetText ( gLabel["drugLevel"], getDrugAddictLevel ( lp ) )
	
	guiProgressBarSetProgress ( gProgress["cigFlush"], getCigarettProgress () )
	guiProgressBarSetProgress ( gProgress["alcFlush"], getAlcoholProgress () )
	guiProgressBarSetProgress ( gProgress["drugFlush"], getDrugProgress () )
end

function getAlcoholProgress ()

	--local curAddict = vnxGetElementData ( player, "alcoholFlushPoints" ) / addictLevelDivisors[2]
	local curFlush = vnxClientGetElementData ( "alcoholAddictPoints" )
	--[[local lvl = ( curFlush / ( curAddict * 0.75 ) ) * 100
	if lvl > 100 then
		lvl = 100
	end]]
	local max = addictLevelDivisors[2] * 5 * 5
	local lvl = 100 - max / ( curFlush )
	if lvl > 100 then
		lvl = 100
	end
	return lvl
end

function getCigarettProgress ()

	local lvl = ( vnxClientGetElementData ( "cigarettFlushPoints" ) ) * 10
	if lvl > 100 then
		lvl = 100
	end
	return lvl
end

function getDrugProgress ()

	local lvl = vnxClientGetElementData ( "drugFlushPoints" ) * 5
	if lvl > 100 then
		lvl = 100
	end
	return lvl
end