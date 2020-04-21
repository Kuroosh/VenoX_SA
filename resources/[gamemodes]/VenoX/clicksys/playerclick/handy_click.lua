function handyanrufen ()

	if gWindow["anrufen"] then
		guiSetVisible ( gWindow["anrufen"], true )
		guiSetVisible ( gWindow["handybg"], false )
		guiSetVisible ( gWindow["sms"], false )
	else
		guiSetVisible ( gWindow["sms"], false )
		guiSetVisible ( gWindow["handybg"], false )

		--gWindow["anrufen"] = guiCreateWindow(screenwidth/2-156/2,120,156,66,"Anrufen",false)
		gWindow["anrufen"] = guiCreateStaticImage(screenwidth/2-156/2,120,156,66,"images/hud/background.png",false)
		guiSetAlpha(gWindow["anrufen"],1)
		guiWindowSetMovable(gWindow["anrufen"],false)
		guiWindowSetSizable(gWindow["anrufen"],false)
		gButton["callbtn"] = guiCreateButton(0.5833,0.4091,0.359,0.4545,"Anrufen",true,gWindow["anrufen"])
		guiSetAlpha(gButton["callbtn"],1)
		gEdit["callnr"] = guiCreateEdit(0.0577,0.3788,0.4744,0.4545,"",true,gWindow["anrufen"])
		guiSetAlpha(gEdit["callnr"],1)
		addEventHandler("onClientGUIClick", gButton["callbtn"],
			function ()
				if guiGetText ( gEdit["callnr"] ) ~= "" and tonumber ( guiGetText ( gEdit["callnr"] ) ) then
					triggerServerEvent ( "callSomeone", getLocalPlayer(), getLocalPlayer(), guiGetText ( gEdit["callnr"] ) )
					SelfCancelBtn ()
				end
			end
		)
	end
end

function handysmsschreiben ( number )

	if gWindow["sms"] then
		guiSetVisible ( gWindow["anrufen"], false )
		guiSetVisible ( gWindow["handybg"], false )
		guiSetVisible ( gWindow["sms"], true )
	else
		guiSetVisible ( gWindow["anrufen"], false )
		guiSetVisible ( gWindow["handybg"], false )
		
		gWindow["sms"] = guiCreateWindow(screenwidth/2-191/2,120,191,128,"SMS schreiben",false)
		guiSetAlpha(gWindow["sms"],1)
		guiWindowSetMovable(gWindow["sms"],false)
		guiWindowSetSizable(gWindow["sms"],false)
		
		gEdit["smsnr"] = guiCreateEdit(0.0419,0.3516,0.4136,0.2422,"",true,gWindow["sms"])
		guiSetAlpha(gEdit["smsnr"],1)
		
		gLabel["nrtext"] = guiCreateLabel(0.0419,0.1953,0.2932,0.1328,"Nummer:",true,gWindow["sms"])
		guiSetAlpha(gLabel["nrtext"],1)
		guiLabelSetColor(gLabel["nrtext"],200,200,0)
		guiLabelSetVerticalAlign(gLabel["nrtext"],"top")
		guiLabelSetHorizontalAlign(gLabel["nrtext"],"left",false)
		guiSetFont(gLabel["nrtext"],"default-bold-small")
		gLabel["smstext"] = guiCreateLabel(0.4817,0.2031,0.1885,0.1328,"Text:",true,gWindow["sms"])
		guiSetAlpha(gLabel["smstext"],1)
		guiLabelSetColor(gLabel["smstext"],200,200,0)
		guiLabelSetVerticalAlign(gLabel["smstext"],"top")
		guiLabelSetHorizontalAlign(gLabel["smstext"],"left",false)
		guiSetFont(gLabel["smstext"],"default-bold-small")
		
		gMemo["smstext"] = guiCreateMemo(0.4817,0.3359,0.4555,0.5625,"",true,gWindow["sms"])
		guiSetAlpha(gMemo["smstext"],1)
		
		gButton["sendsms"] = guiCreateButton(0.0471,0.625,0.4084,0.2734,"Senden",true,gWindow["sms"])
		guiSetAlpha(gButton["sendsms"],1)
		
		addEventHandler("onClientGUIClick", gButton["sendsms"],
			function ()
				if guiGetText ( gEdit["smsnr"] ) ~= "" and tonumber ( guiGetText ( gEdit["smsnr"] ) ) then
					if guiGetText ( gMemo["smstext"] ) ~= "" then
						local sendnr = tonumber ( guiGetText ( gEdit["smsnr"] ) )
						local sendtext = guiGetText ( gMemo["smstext"] )
						triggerServerEvent ( "SMS", getLocalPlayer(), getLocalPlayer(), sendnr, sendtext )
					end
				end
			end
		)
	end
	guiSetText ( gEdit["smsnr"], number )
end
--[[
function showHandy ()

	guiSetInputEnabled ( false )
	if gWindow["handybg"] then
		guiSetVisible ( gWindow["handybg"], true )
	else
		--gWindow["handybg"] = guiCreateWindow(screenwidth/2-125/2,120,125,184,"Handy",false)
		gWindow["handybg"] = guiCreateStaticImage(screenwidth/2-125/2,120,125,184,"images/hud/background.png",false)
		
		guiSetAlpha(gWindow["handybg"],1)
		gLabel["eignummer"] = guiCreateLabel(0.096,0.1413,0.752,0.1739,"Eigene Nummer:\n"..getElementData(getLocalPlayer(),"telenr"),true,gWindow["handybg"])
		guiSetAlpha(gLabel["eignummer"],1)
		guiLabelSetColor(gLabel["eignummer"],200,200,0)
		guiLabelSetVerticalAlign(gLabel["eignummer"],"top")
		guiLabelSetHorizontalAlign(gLabel["eignummer"],"left",false)
		guiSetFont(gLabel["eignummer"],"default-bold-small")
		
		gButton["callfunc"] = guiCreateButton(0.544,0.3207,0.384,0.1467,"Anrufen",true,gWindow["handybg"])
		guiSetAlpha(gButton["callfunc"],1)
		gButton["smsfunc"] = guiCreateButton(0.096,0.3207,0.384,0.1467,"SMS",true,gWindow["handybg"])
		guiSetAlpha(gButton["smsfunc"],1)
		gButton["servicefunc"] = guiCreateButton(0.544,0.5326,0.36,0.1467,"Service",true,gWindow["handybg"])
		guiSetAlpha(gButton["servicefunc"],1)
		gButton["handyonoff"] = guiCreateButton(0.096,0.7337,0.448,0.1739,"Ein/Aus-\nschalten",true,gWindow["handybg"])
		guiSetAlpha(gButton["handyonoff"],1)
		gButton["telefonbuch"] = guiCreateButton(0.096,0.5109,0.424,0.1848,"Telefon-\nbuch",true,gWindow["handybg"])
		guiSetAlpha(gButton["telefonbuch"],1)
		
		guiWindowSetMovable(gWindow["handybg"],false)
		guiWindowSetSizable(gWindow["handybg"],false)
		
		addEventHandler("onClientGUIClick", gButton["telefonbuch"],
			function ()
				outputChatBox ( "Bitte /number [Name] benutzen!", 200, 200, 0 )
			end
		)
		addEventHandler("onClientGUIClick", gButton["handyonoff"],
			function ()
				triggerServerEvent ( "handychange", getLocalPlayer(), getLocalPlayer() )
			end
		)
		addEventHandler("onClientGUIClick", gButton["smsfunc"],
			function ()
				handysmsschreiben ("")
			end
		)
		addEventHandler("onClientGUIClick", gButton["callfunc"],
			function ()
				handyanrufen ()
			end
		)
		addEventHandler("onClientGUIClick", gButton["servicefunc"],
			function ()
				outputChatBox ( "Notfall: 110, Sanitäter: 112, Taxi: 400, Mechaniker: 300, Guthaben: *100#", 200, 200, 0 )
			end
		)
		
		guiWindowSetMovable ( gWindow["handybg"], false )
		guiWindowSetSizable ( gWindow["handybg"], false )
	end
end
addCommandHandler ( "handy", showHandy )]]