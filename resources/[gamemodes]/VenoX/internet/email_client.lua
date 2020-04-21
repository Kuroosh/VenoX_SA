mailcount = 0
mails = {}

function showEmailRecieveCenter_func ()

	guiSetVisible ( gImage["desktopBG"], false )
	if gWindow["email"] then
		guiSetVisible ( gWindow["email"], true )
	else
		gWindow["email"] = guiCreateWindow(screenwidth/2-250/2,screenheight/2-349/2,250,349,"E-Mail Center",false)
		addEventHandler("onClientGUIClick", gWindow["email"], 
			function ( btn, state )
				if state == "up" then
					mousesound_func ()
				end
			end
		)
		guiSetAlpha(gWindow["email"],1)
		gImage["emailEmail"] = guiCreateStaticImage(9,23,61,43,"images/internet/email.png",false,gWindow["email"])
		guiSetAlpha(gImage["emailEmail"],1)
		gLabel["emailInfo1"] = guiCreateLabel(39,20,22,13,"  0",false,gImage["emailEmail"])
		guiSetAlpha(gLabel["emailInfo1"],1)
		guiLabelSetColor(gLabel["emailInfo1"],200,000,000)
		guiLabelSetVerticalAlign(gLabel["emailInfo1"],"top")
		guiLabelSetHorizontalAlign(gLabel["emailInfo1"],"left",false)
		guiSetFont(gLabel["emailInfo1"],"default-bold-small")
		gLabel["emailInfo2"] = guiCreateLabel(70,35,135,24,"Du hast 0 E-Mails.",false,gWindow["email"])
		guiSetAlpha(gLabel["emailInfo2"],1)
		guiLabelSetColor(gLabel["emailInfo2"],200,200,000)
		guiLabelSetVerticalAlign(gLabel["emailInfo2"],"top")
		guiLabelSetHorizontalAlign(gLabel["emailInfo2"],"left",false)
		guiSetFont(gLabel["emailInfo2"],"default-bold-small")
		
		gGrid["email"] = guiCreateGridList(9,66,232,220,false,gWindow["email"])
		guiGridListSetSelectionMode(gGrid["email"],0)
		gColumn["mailFrom"] = guiGridListAddColumn(gGrid["email"],"Von",0.4)
		gColumn["mailHeader"] = guiGridListAddColumn(gGrid["email"],"Betreff",0.4)
		guiSetAlpha(gGrid["email"],1)
		
		gButton["readEmail"] = guiCreateButton(9,297,67,40,"Lesen",false,gWindow["email"])
		guiSetAlpha(gButton["readEmail"],1)
		addEventHandler ( "onClientGUIClick", gButton["readEmail"],
			function ( btn, state )
				if state == "up" then
					guiSetVisible ( gWindow["email"], false )
					local row, column = guiGridListGetSelectedItem ( gGrid["email"] )
					local i = tonumber ( guiGridListGetItemData ( gGrid["email"], row, gColumn["mailHeader"] ) )
					local from = guiGridListGetItemText ( gGrid["email"], row, gColumn["mailFrom"] )
					local betreff = guiGridListGetItemText ( gGrid["email"], row, gColumn["mailHeader"] )
					local text = guiGridListGetItemData ( gGrid["email"], row, gColumn["mailFrom"] )
					showEmailSpecialWindow ( false, i, from, betreff, text )
				end
			end,
		false )
		gButton["writeEmail"] = guiCreateButton(9+(67+10)*1,297,67,40,"Schreiben",false,gWindow["email"])
		guiSetAlpha(gButton["writeEmail"],1)
		addEventHandler ( "onClientGUIClick", gButton["writeEmail"],
			function ( btn, state )
				if state == "up" then
					guiSetVisible ( gWindow["email"], false )
					showEmailSpecialWindow ( true )
				end
			end,
		false )
		gButton["delEmail"] = guiCreateButton(9+(67+10)*2,297,67,40,"Loeschen",false,gWindow["email"])
		guiSetAlpha(gButton["delEmail"],1)
		addEventHandler ( "onClientGUIClick", gButton["delEmail"],
			function ( btn, state )
				if state == "up" then
					local row, column = guiGridListGetSelectedItem ( gGrid["email"] )
					local i = tonumber ( guiGridListGetItemData ( gGrid["email"], row, gColumn["mailHeader"] ) )
					if i then
						deleteMail ( i )
					end
				end
			end,
		false )
		gButton["closeEmail"] = guiCreateButton(220,30,20,20,"x",false,gWindow["email"])
		guiSetAlpha(gButton["closeEmail"],1)
		addEventHandler ( "onClientGUIClick", gButton["closeEmail"],
			function ( btn, state )
				if state == "up" then
					guiSetVisible ( gWindow["email"], false )
					guiSetVisible ( gImage["desktopBG"], true )
				end
			end,
		false )
	end
	loadMails ()
end
addEvent ( "showEmailRecieveCenter", true )
addEventHandler ( "showEmailRecieveCenter", getRootElement(), showEmailRecieveCenter_func )

function deleteMail ( i )

	local mailList = xmlLoadFile ( "internet/mails.xml" )
	local mailes = xmlNodeGetChildren ( mailList, 0 )
	local mailChild = xmlNodeGetChildren ( mailes, i-1 )
	xmlNodeSetValue ( mailChild, "" )
	xmlSaveFile ( mailList )
	loadMails ()
end

function reciveMail_func ( newMail )

	loadMails ()
	local mailList = xmlLoadFile ( "internet/mails.xml" )
	local mailes = xmlNodeGetChildren ( mailList, 0 )
	for i = 1, 100 do
		local mailChild = xmlNodeGetChildren ( mailes, i-1 )
		local mail = xmlNodeGetValue ( mailChild )
		if # mail < 1 then
			xmlNodeSetValue ( mailChild, newMail )
			xmlSaveFile ( mailList )
			outputChatBox ( "Du hast eine neue E-Mail von "..gettok ( newMail, 1, string.byte ( '|' ) ).." erhalten, Betreff: "..gettok ( newMail, 2, string.byte ( '|' ) ), 200, 200, 0 )
			loadMails ()
			return
		end
	end
	outputChatBox ( "Dein Posteingang ist voll, deine E-Mail wurde geloescht.", 125, 0, 0 )
end
addEvent ( "reciveMail", true )
addEventHandler ( "reciveMail", getRootElement(), reciveMail_func )

function loadMails ()

	local mailList = xmlLoadFile ( "internet/mails.xml" )
	if not mailList then
		local mailList = xmlCreateFile ( "internet/mails.xml", "mails" )
		local content = xmlCreateChild ( mailList, "mails" )
		xmlNodeSetValue ( content, "" )
		for i = 1, 100 do
			local subContent = xmlCreateChild ( content, "mailNo"..i-1 )
			xmlNodeSetValue ( subContent, "" )
		end
		xmlSaveFile ( mailList )
		loadMails ()
	else
		if gGrid["email"] then
			guiGridListClear ( gGrid["email"] )
			local mailes = xmlNodeGetChildren ( mailList, 0 )
			local mailesCount = 0
			for i = 1, 100 do
				local mail = xmlNodeGetChildren ( mailes, i-1 )
				local mail = xmlNodeGetValue ( mail )
				if # mail > 0 then
					mailesCount = mailesCount + 1
					local row = guiGridListAddRow ( gGrid["email"] )
					local from = gettok ( mail, 1, string.byte ( '|' ) )
					local betreff = gettok ( mail, 2, string.byte ( '|' ) )
					local mail = string.sub ( mail, #betreff+#from+3, #mail )
					guiGridListSetItemText ( gGrid["email"], row, gColumn["mailFrom"], from, false, false )
					guiGridListSetItemText ( gGrid["email"], row, gColumn["mailHeader"], betreff, false, false )
					guiGridListSetItemData ( gGrid["email"], row, gColumn["mailFrom"], tostring ( mail ) )
					guiGridListSetItemData ( gGrid["email"], row, gColumn["mailHeader"], tostring ( i ) )
				end
			end
			if # tostring ( mailesCount ) < 2 then 
				guiSetText ( gLabel["emailInfo1"], mailesCount )
			else
				guiSetText ( gLabel["emailInfo1"], mailesCount )
			end
			guiSetText ( gLabel["emailInfo2"], "Du hast "..mailesCount.." E-Mails." )
		end
	end
end

function showEmailSpecialWindow ( write, i, from, betreff, text )

	curSelectedMail = i
	if gWindow["emailWindow"] then
		guiSetVisible ( gWindow["emailWindow"], true )
	else
		gWindow["emailWindow"] = guiCreateWindow(screenwidth/2-369/2,screenheight/2-284,369,284,"E-Mail lesen",false)
		guiSetAlpha(gWindow["emailWindow"],1)
		gEdit[1] = guiCreateEdit(43,23,138,34,"",false,gWindow["emailWindow"])
		guiSetAlpha(gEdit[1],1)
		guiEditSetReadOnly(gEdit[1],true)
		gLabel[1] = guiCreateLabel(11,30,27,18,"Von:",false,gWindow["emailWindow"])
		guiSetAlpha(gLabel[1],1)
		guiLabelSetColor(gLabel[1],200,200,000)
		guiLabelSetVerticalAlign(gLabel[1],"top")
		guiLabelSetHorizontalAlign(gLabel[1],"left",false)
		guiSetFont(gLabel[1],"default-bold-small")
		gLabel[2] = guiCreateLabel(184,31,47,18,"Betreff:",false,gWindow["emailWindow"])
		guiSetAlpha(gLabel[2],1)
		guiLabelSetColor(gLabel[2],000,125,125)
		guiLabelSetVerticalAlign(gLabel[2],"top")
		guiLabelSetHorizontalAlign(gLabel[2],"left",false)
		guiSetFont(gLabel[2],"default-bold-small")
		gEdit[2] = guiCreateEdit(235,23,127,34,"",false,gWindow["emailWindow"])
		guiSetAlpha(gEdit[2],1)
		gMemo[1] = guiCreateMemo(9,66,272,206,"",false,gWindow["emailWindow"])
		guiSetAlpha(gMemo[1],1)
		gLabel[3] = guiCreateLabel(27,116,141,24,"",false,gWindow["emailWindow"])
		guiSetAlpha(gLabel[3],1)
		guiLabelSetColor(gLabel[3],255,255,255)
		guiLabelSetVerticalAlign(gLabel[3],"top")
		guiLabelSetHorizontalAlign(gLabel[3],"left",false)
		gButton[1] = guiCreateButton(285,66,75,41,"Schliessen",false,gWindow["emailWindow"])
		guiSetAlpha(gButton[1],1)
		addEventHandler ( "onClientGUIClick", gButton[1], 
			function ( btn, state )
				if state == "up" then
					guiSetVisible ( gWindow["emailWindow"], false )
					showEmailRecieveCenter_func ()
				end
			end,
		false )
		gButton[2] = guiCreateButton(285,148,75,41,"Antworten\nSenden",false,gWindow["emailWindow"])
		guiSetAlpha(gButton[2],1)
		addEventHandler ( "onClientGUIClick", gButton[2], 
			function ( btn, state )
				if state == "up" then
					if guiGetText ( source ) == "Antworten" then
						reply = true
						replyTo = guiGetText ( gEdit[1] )
						replyHeading = "RE: "..guiGetText ( gEdit[1] )
						showEmailSpecialWindow ( true )
					else
						guiSetVisible ( gWindow["emailWindow"], false )
						showEmailRecieveCenter_func ()
						triggerServerEvent ( "sendMail", lp, guiGetText ( gMemo[1] ), guiGetText ( gEdit[2] ), guiGetText ( gEdit[1] ) )
					end
				end
			end,
		false )
		gButton[3] = guiCreateButton(285,231,75,41,"Loeschen",false,gWindow["emailWindow"])
		guiSetAlpha(gButton[3],1)
		addEventHandler ( "onClientGUIClick", gButton[3], 
			function ( btn, state )
				if state == "up" and guiGetVisible ( source ) then
					deleteMail ( curSelectedMail )
					guiSetVisible ( gWindow["emailWindow"], false )
					showEmailRecieveCenter_func ()
				end
			end,
		false )
	end
	if write then
		guiSetText ( gButton[2], "Senden" )
		guiSetText ( gWindow["emailWindow"], "E-Mail schreiben" )
		guiSetText ( gLabel[1], "An:" )
		guiSetVisible ( gButton[3], false )
		
		guiSetText ( gEdit[1], "" )
		guiSetText ( gEdit[2], "" )
		guiSetText ( gMemo[1], "" )
		guiEditSetReadOnly ( gEdit[1], false )
		guiEditSetReadOnly ( gEdit[2], false )
		guiMemoSetReadOnly ( gMemo[1], false )
		if reply then
			guiSetText ( gEdit[1], replyTo )
			guiSetText ( gEdit[2], replyHeading )
			guiSetText ( gMemo[1], "" )
			reply = false
		elseif isString ( i ) then
			guiSetText ( gEdit[1], i )
			guiSetText ( gEdit[2], "" )
			guiSetText ( gMemo[1], "" )
		end
	else
		guiSetText ( gButton[2], "Antworten" )
		guiSetText ( gWindow["emailWindow"], "E-Mail lesen" )
		guiSetText ( gLabel[1], "Von:" )
		guiSetVisible ( gButton[3], true )
		
		guiSetText ( gEdit[1], from )
		guiSetText ( gEdit[2], betreff )
		guiSetText ( gMemo[1], text )
		guiEditSetReadOnly ( gEdit[1], true )
		guiEditSetReadOnly ( gEdit[2], true )
		guiMemoSetReadOnly ( gMemo[1], true )
	end
end