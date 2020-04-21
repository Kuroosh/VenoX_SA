--[[local resourceName = getResourceName(getThisResource())

function hideall ()

	if isElement ( gWindows["selfclick"] ) then
		--guiSetVisible ( gWindows["selfclick"], false )
	end
	if isElement ( gWindow["handybg"] ) then
		guiSetVisible ( gWindow["handybg"], false )
	end
	if isElement ( gWindow["plistadmin"] ) then
		guiSetVisible ( gWindow["plistadmin"], false )
	end
	if isElement ( gWindow["rtext"] ) then
		guiSetVisible ( gWindow["rtext"], false )
	end
	if isElement ( gWindow["bonusmenue"] ) then
		guiSetVisible ( gWindow["bonusmenue"], false )
	end
	if isElement ( gWindow["anrufen"] ) then
		guiSetVisible ( gWindow["anrufen"], false )
	end
	if isElement ( gWindow["sms"] ) then
		guiSetVisible ( gWindow["sms"], false )
	end
	if isElement ( gWindow["handybg"] ) then
		guiSetVisible ( gWindow["handybg"], false )
	end
	if isElement ( gWindow["friendlistMenue"] ) then
		guiSetVisible ( gWindow["friendlistMenue"], false )
	end
	if isElement ( gWindow["stats"] ) then
		guiSetVisible ( gWindow["stats"], false )
	end
	if isElement ( gWindow["settings"] ) then
		guiSetVisible ( gWindow["settings"], false )
	end
	if isElement ( gWindow["selfAnimations"] ) then
		guiSetVisible ( gWindow["selfAnimations"], false )
	end
	if isElement ( gWindow["selfNotes"] ) then
		guiSetVisible ( gWindow["selfNotes"], false )
	end
	if isElement ( gWindow["suchtInfo"] ) then
		guiSetVisible ( gWindow["suchtInfo"], false )
	end
	if isElement ( gWindow["socialRankSelection"] ) then
		guiSetVisible ( gWindow["socialRankSelection"], false )
	end
	if isElement ( gWindow["spawnPointSelection"] ) then
		guiSetVisible ( gWindow["spawnPointSelection"], false )
	end
	if isElement ( gWindow["achievmentList"] ) then
		guiSetVisible ( gWindow["achievmentList"], false )
	end
	if isElement ( gWindow["radioOptions"] ) then
		guiSetVisible ( gWindow["radioOptions"], false )
	end
	if isElement ( gWindow["radioOptions"] ) then
		destroyElement ( gWindow["radioOptions"] )
	end
	--guiSetVisible ( optionsWindow, false )
	
	guiSetInputEnabled ( true )
	guiSetInputEnabled ( true )
	setElementClicked ( false )
	saveNotes ()
end

function SelfAdminBtn ()
	if getElementData ( lp, "adminlvl" ) >= 3 then
		hideall ()
		guiSetInputEnabled ( false )
		showAdminMenue ()
	end
end

function SelfOptionBtn ()
	hideall ()
	--triggerEvent ( "_createOptionmenue", getLocalPlayer() )
	showSettingsMenue ()
end

function SelfCancelBtn ()
	hideall ()
	guiSetVisible ( gWindows["selfclick"], false )
	showCursor(false)
	triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
end

function SelfStateBtn ()
	hideall ()
	showStats()
end

function showNotes ()
	hideall ()
	if not gWindow["selfNotes"] then
		--gWindow["selfNotes"] = guiCreateWindow(screenwidth/2-214/2,120,214,214,"Notizen",false)
		--gWindow["selfNotes"] = guiCreateStaticImage(screenwidth/2-214/2,120,214,214,"images/hud/background.png",false)
		gWindow["selfNotes"] = guiCreateStaticImage(screenwidth/2-250, 205, 510, 370, ":Self/self_bg.png", false)
		guiSetAlpha(gWindow["selfNotes"],1)
		guiWindowSetMovable(gWindow["selfNotes"],false)
		guiWindowSetSizable(gWindow["selfNotes"],false)
		gMemo["selfNotes"] = guiCreateMemo(10,35,300,200,"",false,gWindow["selfNotes"])
		guiSetAlpha(gMemo["selfNotes"],1)
		loadNotes ()
	else
		guiSetVisible ( gWindow["selfNotes"], true )
	end
end

function showEmoteList ()
	hideall ()
	if not gWindow["selfEmotes"] then
		--gWindow["selfAnimations"] = guiCreateWindow(screenwidth/2-256/2,120,256,201,"Animationen",false)
		gWindow["selfAnimations"] = guiCreateStaticImage(screenwidth/2-256/2,120,256,201,"images/hud/background.png",false)
		guiWindowSetMovable(gWindow["selfAnimations"],false)
		guiWindowSetSizable(gWindow["selfAnimations"],false)
		guiSetAlpha(gWindow["selfAnimations"],1)
		
		gGrid["selfAnimations"] = guiCreateGridList(10,29,135,160,false,gWindow["selfAnimations"])
		guiGridListSetSelectionMode(gGrid["selfAnimations"],2)
		gColumn["selfAnimation"] = guiGridListAddColumn(gGrid["selfAnimations"],"Animation",0.8)
		guiSetAlpha(gGrid["selfAnimations"],1)
		
		gButton["selfStartEmote"] = guiCreateButton(150,29,95,44,"Animation ausfuehren",false,gWindow["selfAnimations"])
		guiSetAlpha(gButton["selfStartEmote"],1)
		addEventHandler("onClientGUIClick", gButton["selfStartEmote"],
			function()
				local cmd = guiGridListGetItemText ( gGrid["selfAnimations"], guiGridListGetSelectedItem ( gGrid["selfAnimations"] ), gColumn["selfAnimation"] )
				triggerServerEvent ( "executeCommandHandlerServer", lp, lp, cmd, guiGetText ( gMemo["selfEmoteDanceStyle"] ) )
			end, false
		)
		gButton["selfStopEmote"] = guiCreateButton(151,80,94,44,"Animation stoppen",false,gWindow["selfAnimations"])
		guiSetAlpha(gButton["selfStopEmote"],1)
		addEventHandler("onClientGUIClick", gButton["selfStopEmote"],
			function()
				triggerServerEvent ( "executeCommandHandlerServer", lp, lp, "stopanim", guiGetText ( gMemo["selfEmoteDanceStyle"] ) )
			end, false
		)
		
		gLabel["selfEmoteInfo"] = guiCreateLabel(169,139,70,24,"Tanzstil:",false,gWindow["selfAnimations"])
		guiSetAlpha(gLabel["selfEmoteInfo"],1)
		guiLabelSetColor(gLabel["selfEmoteInfo"],125,125,255)
		guiLabelSetVerticalAlign(gLabel["selfEmoteInfo"],"top")
		guiLabelSetHorizontalAlign(gLabel["selfEmoteInfo"],"left",false)
		guiSetFont(gLabel["selfEmoteInfo"],"default-bold-small")
		
		gMemo["selfEmoteDanceStyle"] = guiCreateMemo(151,156,85,31,"",false,gWindow["selfAnimations"])
		guiSetAlpha(gMemo["selfEmoteDanceStyle"],1)
		
		addEmotesToList ( gGrid["selfAnimations"], gColumn["selfAnimation"] )
	else
		guiSetVisible ( gWindow["selfEmotes"], true )
	end
end

function addEmotesToList ( grid, column )
	for key, animation in ipairs ( animationCMDs ) do
		local row = guiGridListAddRow ( grid )
		guiGridListSetItemText ( grid, row, column, animation, false, false )
	end
end

function loadNotes ()
	local noteList = xmlLoadFile ( ":"..resourceName.."/notes/notes.xml" )
	if not noteList then
		local noteList = xmlCreateFile ( ":"..resourceName.."/notes/notes.xml", "notes" )
		local notes = xmlCreateChild ( noteList, "noteText" )
		xmlNodeSetValue ( notes, "" )
		xmlSaveFile ( noteList )
		guiSetText ( gMemo["selfNotes"], "" )
	else
		local notes = xmlNodeGetChildren ( noteList, 0 )
		local notes = xmlNodeGetValue ( notes )
		guiSetText ( gMemo["selfNotes"], notes )
	end
end

function saveNotes ()
	if gMemo["selfNotes"] then
		local noteText = guiGetText ( gMemo["selfNotes"] )
		local file = xmlLoadFile ( ":"..resourceName.."/notes/notes.xml" )
		local node = xmlNodeGetChildren ( file, 0 )
		xmlNodeSetValue ( node, noteText )
		xmlSaveFile ( file )
	end
end

function ShowSelfClickMenue_func()
	if getElementData ( getLocalPlayer(), "loggedin" ) == 0 then
		return
	end
	guiSetInputEnabled ( false )
	if gWindows["selfclick"] then
		guiSetVisible ( gWindows["selfclick"], true )
	else
		
		
		
		
		gWindows["selfclick"] = guiCreateStaticImage(screenwidth/2-250, 205, 500, 360, ":Self/self_bg.png", false)
		
		--gWindows["selfclick"] = guiCreateStaticImage(screenwidth/2-291, 10, 582, 75, "images/self/Background.png", false)
		
		

		

		--img_stats = guiCreateStaticImage(461, 252, 80, 60, "images/self/status.png", false, gWindows["selfclick"])



		img_stats = guiCreateStaticImage(20, 50, 70, 70, ":Self/info.png", false, gWindows["selfclick"])
		gButtons["selfstatus"] = guiCreateButton(20, 50, 70, 70, " ", false, gWindows["selfclick"])
		guiSetAlpha(gButtons["selfstatus"], 0)






		
		img_settings = guiCreateStaticImage(120, 50, 70, 70, "images/self/optionen.png", false, gWindows["selfclick"])
		gButtons.selfoptions = guiCreateButton(120, 50, 70, 70, " ", false, gWindows["selfclick"])





		guiSetAlpha(gButtons["selfoptions"], 0)







		
		--[[img_admin = guiCreateStaticImage(230, 50, 50, 50, "images/self/admin.png", false, gWindows["selfclick"])
		gButtons["selfadmin"] = guiCreateButton(230, 50, 50, 50, " ", false, gWindows["selfclick"])
		guiSetAlpha(gButtons["selfadmin"], 0)






		
		img_close = guiCreateStaticImage(455, 7, 40, 40, "images/self/close.png", false, gWindows["selfclick"])
		gButtons["selfcancel"] = guiCreateButton(455, 7, 40, 40, " ", false, gWindows["selfclick"])
		guiSetAlpha(gButtons["selfcancel"], 0)





		
		img_handy = guiCreateStaticImage(310, 50, 70, 70, "images/self/handy.png", false, gWindows["selfclick"])
		gButtons["selfhandy"] = guiCreateButton(310, 50, 70, 70, " ", false, gWindows["selfclick"])




		guiSetAlpha(gButtons["selfhandy"], 0)
		
		--[[img_friend = guiCreateStaticImage(370, 50, 50, 50, "images/self/friend.png", false, gWindows["selfclick"])
		gButtons["selffriendlist"] = guiCreateButton(370, 50, 50, 50, " ", false, gWindows["selfclick"])
		guiSetAlpha(gButtons["selffriendlist"], 0)





		
		img_notes = guiCreateStaticImage(415, 50, 70, 70, "images/self/notizen.png", false, gWindows["selfclick"])
		gButtons["selfnotes"] = guiCreateButton(415, 50, 70, 70, " ", false, gWindows["selfclick"])
		guiSetAlpha(gButtons["selfnotes"], 0)

		addEventHandler("onClientGUIClick", gButtons["selfnotes"],
		function()
			guiSetVisible ( gWindows["selfclick"], false )
			triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
		end
		)




		
		img_anim = guiCreateStaticImage(210, 50, 70, 70, "images/self/emotes.png", false, gWindows["selfclick"])
		gButtons["selfemotes"] = guiCreateButton(210, 50, 70, 70, " ", false, gWindows["selfclick"])
		guiSetAlpha(gButtons["selfemotes"], 0)
		
		
		
		--[[gWindows["selfclick"] = guiCreateWindow(screenwidth/2-165,0,329,114,"Eigenmenue",false)
		
		gButtons["selfstatus"] = guiCreateButton(13,29,71,32,"Status",false,gWindows["selfclick"])
		gButtons["selfoptions"] = guiCreateButton(13,71,71,32,"Optionen",false,gWindows["selfclick"])
		
		gButtons["selfadmin"] = guiCreateButton(89,29,71,32,"Admin",false,gWindows["selfclick"])
		gButtons["selfcancel"] = guiCreateButton(89,71,71,32,"Abbrechen",false,gWindows["selfclick"])
		
		gButtons["selfhandy"] = guiCreateButton(167,29,71,32,"Handy",false,gWindows["selfclick"])
		gButtons["selffriendlist"] = guiCreateButton(167,71,71,32,"Friendlist",false,gWindows["selfclick"])
		
		gButtons["selfnotes"] = guiCreateButton(245,29,71,32,"Notizen",false,gWindows["selfclick"])
		gButtons["selfemotes"] = guiCreateButton(245,71,71,32,"Emotes",false,gWindows["selfclick"])
		
		--addEventHandler("onClientGUIClick", gButtons["selfadmin"], SelfAdminBtn, false)
		addEventHandler("onClientGUIClick", gButtons["selfcancel"], SelfCancelBtn, false)
		addEventHandler("onClientGUIClick", gButtons["selfoptions"], SelfOptionBtn, false)
		addEventHandler("onClientGUIClick", gButtons["selfstatus"], SelfStateBtn, false)
		addEventHandler("onClientGUIClick", gButtons["selfhandy"],
			function()
				hideall ()
				showHandy()
			end,
		false )
		addEventHandler("onClientGUIClick", gButtons["selffriendlist"],
			function()
					hideall ()
					showFriendlistSelf()
			end,
		false )
		addEventHandler("onClientGUIClick", gButtons["selfnotes"],
			function()
				showNotes ()
			end, false
		)
		addEventHandler("onClientGUIClick", gButtons["selfemotes"],
			function()
				showEmoteList ()
			end, false
		)
		
		--guiWindowSetSizable(gWindows["selfclick"],false)
		--guiWindowSetMovable(gWindows["selfclick"],false)
		--guiSetAlpha(gWindows["selfclick"],1)
	end
	guiSetText ( gButtons["selfstatus"], "Status" )
	guiStaticImageLoadImage ( img_stats, "images/self/status.png" )
end
addEvent ( "ShowSelfClickMenue", true)
addEventHandler ( "ShowSelfClickMenue", getLocalPlayer(),  ShowSelfClickMenue_func)

--[[addCommandHandler( "mtest", function ()
	for i = 50, 75, 1 do
		guiSetSize ( img_admin, i, i, false )
    end
	
	setTimer(function()
		for i = 75, 50, 1 do
			guiSetSize ( img_admin, i, i, false )
		end
	end, 750, 1)
end)]]

--[[

        GUIEditor.staticimage[2] = guiCreateStaticImage(461, 252, 80, 60, ":Self/info.png", false)


        GUIEditor.staticimage[3] = guiCreateStaticImage(541, 252, 80, 60, ":Self/einstellungen.png", false)


        GUIEditor.staticimage[4] = guiCreateStaticImage(621, 252, 80, 65, ":Self/self1.png", false)


        GUIEditor.staticimage[5] = guiCreateStaticImage(701, 252, 80, 65, ":Self/handy.png", false)


        GUIEditor.staticimage[6] = guiCreateStaticImage(781, 257, 80, 50, ":Self/animations.png", false)


        GUIEditor.staticimage[7] = guiCreateStaticImage(867, 217, 54, 25, ":Self/quit.png", false)    
        ]]