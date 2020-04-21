-------------------------
------- (c) 2010 --------
------- by Zipper -------
-- and Vio MTA:RL Crew --
-------------------------

localPlayer = getLocalPlayer()
local friendlistArray = {}

function showFriendlistCurState ( player, state )

	if gWindow["friendlistIsOnline"] then
		guiSetVisible ( gWindow["friendlistIsOnline"], true )
		guiSetText ( gWindow["friendlistIsOnline"], getPlayerName ( player ) )
		guiSetText ( gLabel["FriendState"], "...ist "..state.."!" )
	else
		local screenwidth, screenheight = guiGetScreenSize ()
		
		gWindow["friendlistIsOnline"] = guiCreateWindow(screenwidth-103,screenheight-49,103,49,getPlayerName ( player ),false)
		guiSetAlpha(gWindow["friendlistIsOnline"],1)
		gLabel["FriendState"] = guiCreateLabel(0.0971,0.4694,1.068,0.4694,"...ist "..state.."!",true,gWindow["friendlistIsOnline"])
		guiSetAlpha(gLabel["FriendState"],1)
		guiLabelSetColor(gLabel["FriendState"],200,200,20)
		guiLabelSetVerticalAlign(gLabel["FriendState"],"top")
		guiLabelSetHorizontalAlign(gLabel["FriendState"],"left",false)
	end
	if isTimer ( hideFriendlistStatechangeTimer ) then
		killTimer ( hideFriendlistStatechangeTimer )
	end
	local hideFriendlistStatechangeTimer = setTimer ( hideFriendlistStatechange, 3000, 1 )
	playSoundFrontEnd ( 45 )
end

function hideFriendlistStatechange ()

	guiSetVisible ( gWindow["friendlistIsOnline"], false )
end

function playerFriendlistJoin ()
	if _G["friend"..getPlayerName(source)] then
		friendlistArray[source] = true
		showFriendlistCurState ( source, "online" )
	else
		friendlistArray[source] = false
	end
end
addEventHandler( "onClientPlayerJoin", root, playerFriendlistJoin )

function playerFriendlistQuit ()

	if friendlistArray[source] then
		showFriendlistCurState ( source, "offline" )
		friendlistArray[source] = nil
	end
end
addEventHandler( "onClientPlayerQuit", root, playerFriendlistQuit )

function loadFriendlist_func ()

	local friendlist = xmlLoadFile ( "friendlist/friendlist.xml" )
	if friendlist then
		local friends = getFriends()
		local lastfriend = "console"
		local newfriend = ""
		for i = 1, 100 do
			local newfriend = gettok ( friends, i, string.byte('|') )
			if tostring ( newfriend ) == tostring ( lastfriend ) then
				break
			elseif newfriend then
				_G["friend"..newfriend] = true
			end
			local lastfriend = gettok ( friends, i, string.byte('|') )
		end
	end
end
addEvent ( "loadFriendlist", true )
addEventHandler ( "loadFriendlist", getRootElement(), loadFriendlist_func )

function showFriendlistSelf()

	if gWindow["friendlistMenue"] then
		guiSetVisible ( gWindow["friendlistMenue"], true )
	else
		local screenwidth, screenheight = guiGetScreenSize ()
		
		--gWindow["friendlistMenue"] = guiCreateWindow(screenwidth/2-364/2,120,364,282,"Friendlist",false)
		gWindow["friendlistMenue"] = guiCreateStaticImage(screenwidth/2-364/2,120,364,282,"images/hud/background.png",false)
		guiSetAlpha(gWindow["friendlistMenue"],1)
		guiWindowSetMovable(gWindow["friendlistMenue"],false)
		guiWindowSetSizable(gWindow["friendlistMenue"],false)
		gGrid["friendlistNames"] = guiCreateGridList(0.0302,0.0957,0.4038,0.8617,true,gWindow["friendlistMenue"])
		guiGridListSetSelectionMode(gGrid["friendlistNames"],2)
		gColumn["friendNames"] = guiGridListAddColumn(gGrid["friendlistNames"],"Name",0.8)
		guiSetAlpha(gGrid["friendlistNames"],1)
		gLabel["addFriend"] = guiCreateLabel(0.4478,0.078,0.3269,0.0638,"Freund hinzufuegen:",true,gWindow["friendlistMenue"])
		guiSetAlpha(gLabel["addFriend"],1)
		guiLabelSetColor(gLabel["addFriend"],200,200,000)
		guiLabelSetVerticalAlign(gLabel["addFriend"],"top")
		guiLabelSetHorizontalAlign(gLabel["addFriend"],"left",false)
		guiSetFont(gLabel["addFriend"],"default-bold-small")
		gEdit["friendName"] = guiCreateEdit(0.4451,0.1348,0.2582,0.0957,"",true,gWindow["friendlistMenue"])
		guiSetAlpha(gEdit["friendName"],1)
		gLabel["curFriendSelected"] = guiCreateLabel(0.4451,0.2695,0.3819,0.0674,"Momentan ausgewaehlt:",true,gWindow["friendlistMenue"])
		guiSetAlpha(gLabel["curFriendSelected"],1)
		guiLabelSetColor(gLabel["curFriendSelected"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["curFriendSelected"],"top")
		guiLabelSetHorizontalAlign(gLabel["curFriendSelected"],"left",false)
		guiSetFont(gLabel["curFriendSelected"],"default-bold-small")
		gLabel["FriendName"] = guiCreateLabel(0.467,0.3404,0.3489,0.0887,"",true,gWindow["friendlistMenue"])
		guiSetAlpha(gLabel["FriendName"],1)
		guiLabelSetColor(gLabel["FriendName"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["FriendName"],"top")
		guiLabelSetHorizontalAlign(gLabel["FriendName"],"left",false)
		gLabel["friendHandNR"] = guiCreateLabel(0.4396,0.422,0.1758,0.0674,"Handy-NR:",true,gWindow["friendlistMenue"])
		guiSetAlpha(gLabel["friendHandNR"],1)
		guiLabelSetColor(gLabel["friendHandNR"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["friendHandNR"],"top")
		guiLabelSetHorizontalAlign(gLabel["friendHandNR"],"left",false)
		guiSetFont(gLabel["friendHandNR"],"default-bold-small")
		gLabel["friendState"] = guiCreateLabel(0.6923,0.422,0.2335,0.0674,"Status:",true,gWindow["friendlistMenue"])
		guiSetAlpha(gLabel["friendState"],1)
		guiLabelSetColor(gLabel["friendState"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["friendState"],"top")
		guiLabelSetHorizontalAlign(gLabel["friendState"],"left",false)
		guiSetFont(gLabel["friendState"],"default-bold-small")
		gLabel["friendHandyNRValue"] = guiCreateLabel(0.4396,0.4858,0.1484,0.0567,"",true,gWindow["friendlistMenue"])
		guiSetAlpha(gLabel["friendHandyNRValue"],1)
		guiLabelSetColor(gLabel["friendHandyNRValue"],125,125,50)
		guiLabelSetVerticalAlign(gLabel["friendHandyNRValue"],"top")
		guiLabelSetHorizontalAlign(gLabel["friendHandyNRValue"],"left",false)
		gLabel["friendStateValue"] = guiCreateLabel(0.6923,0.4858,0.1484,0.0603,"",true,gWindow["friendlistMenue"])
		guiSetAlpha(gLabel["friendStateValue"],1)
		guiLabelSetColor(gLabel["friendStateValue"],000,255,000)
		guiLabelSetVerticalAlign(gLabel["friendStateValue"],"top")
		guiLabelSetHorizontalAlign(gLabel["friendStateValue"],"left",false)
		gLabel["friendFaction"] = guiCreateLabel(0.4451,0.5816,0.1648,0.0638,"Fraktion:",true,gWindow["friendlistMenue"])
		guiSetAlpha(gLabel["friendFaction"],1)
		guiLabelSetColor(gLabel["friendFaction"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["friendFaction"],"top")
		guiLabelSetHorizontalAlign(gLabel["friendFaction"],"left",false)
		guiSetFont(gLabel["friendFaction"],"default-bold-small")
		gLabel["friendFactionValue"] = guiCreateLabel(0.4451,0.6383,0.1511,0.0638,"",true,gWindow["friendlistMenue"])
		guiSetAlpha(gLabel["friendFactionValue"],1)
		guiLabelSetColor(gLabel["friendFactionValue"],125,125,50)
		guiLabelSetVerticalAlign(gLabel["friendFactionValue"],"top")
		guiLabelSetHorizontalAlign(gLabel["friendFactionValue"],"left",false)
		
		gButton["friendAdd"] = guiCreateButton(0.728,0.1348,0.2308,0.0957,"Hinzufuegen",true,gWindow["friendlistMenue"])
		guiSetAlpha(gButton["friendAdd"],1)
		
		gButton["delFriend"] = guiCreateButton(0.4423,0.7128,0.2225,0.1099,"Freund entfernen",true,gWindow["friendlistMenue"])
		guiSetAlpha(gButton["delFriend"],1)
		--gButton["smsFriend"] = guiCreateButton(0.7088,0.7128,0.2225,0.1099,"SMS\nschreiben",true,gWindow["friendlistMenue"])
		--guiSetAlpha(gButton["smsFriend"],1)
		--gButton["pmFriend"] = guiCreateButton(0.4423,0.8511,0.2225,0.1099,"PM\nschreiben",true,gWindow["friendlistMenue"])
		--guiSetAlpha(gButton["pmFriend"],1)
		--gButton["callFriend"] = guiCreateButton(0.7088,0.8511,0.2225,0.1099,"Anrufen",true,gWindow["friendlistMenue"])
		--guiSetAlpha(gButton["callFriend"],1)
		
		addEventHandler("onClientGUIClick", gButton["friendAdd"],
			function()
				triggerServerEvent ( "addFriend", getRootElement(), getLocalPlayer(), guiGetText ( gEdit["friendName"] ) )
			end
		)
		addEventHandler("onClientGUIClick", gGrid["friendlistNames"],
			function()
				local row = guiGridListGetItemText ( gGrid["friendlistNames"], guiGridListGetSelectedItem ( gGrid["friendlistNames"] ), 1 )
				guiSetText ( gLabel["FriendName"], tostring ( row ) )
				local player = getPlayerFromName ( row )
				deleteFriendLabels()
				if row then
					if player then
						local fraktion = fraktionsNamen[tonumber ( getElementData ( player, "fraktion" ) )]
						guiSetText ( gLabel["friendFactionValue"], fraktion )
						guiSetText ( gLabel["friendStateValue"], "online" )
						guiLabelSetColor ( gLabel["friendStateValue"], 0, 255, 0 )
						guiSetText ( gLabel["friendHandyNRValue"], getElementData ( player, "telenr" ) )
						guiSetText ( gLabel["FriendName"], tostring ( row ) )
					else
						guiSetText ( gLabel["friendFactionValue"], "-" )
						guiSetText ( gLabel["friendStateValue"], "offline" )
						guiLabelSetColor ( gLabel["friendStateValue"], 125, 0, 0 )
						guiSetText ( gLabel["friendHandyNRValue"], "-" )
						guiSetText ( gLabel["FriendName"], tostring ( row ) )
					end
				else
					guiSetText ( gLabel["friendFactionValue"], "-" )
					guiSetText ( gLabel["friendStateValue"], "-" )
					guiLabelSetColor ( gLabel["friendStateValue"], 255, 255, 255 )
					guiSetText ( gLabel["friendHandyNRValue"], "-" )
					guiSetText ( gLabel["FriendName"], "Bitte waehlen!" )
				end
			end
		)
		addEventHandler("onClientGUIClick", gButton["delFriend"],
			function()
				local row = guiGridListGetItemText ( gGrid["friendlistNames"], guiGridListGetSelectedItem ( gGrid["friendlistNames"] ), 1 )
				deleteFriend( row )
			end
		)
		--[[addEventHandler("onClientGUIClick", gButton["callFriend"],
			function()
				outputChatBox ( "NR: "..tonumber ( gLabel["friendHandyNRValue"] ) ) -- DEBUG
				triggerServerEvent ( "callSomeone", getLocalPlayer(), getLocalPlayer(), tonumber ( gLabel["friendHandyNRValue"] ) )
				SelfCancelBtn ()
			end
		)
		addEventHandler("onClientGUIClick", gButton["smsFriend"],
			function()
				guiSetVisible ( gWindow["friendlistMenue"], false )
				local smsnr = tonumber ( gLabel["friendHandyNRValue"] )
				outputChatBox ( "NR: "..smsnr ) -- DEBUG
				handysmsschreiben ( smsnr )
			end
		)]]
	end
	deleteFriendLabels()
	fillFriendlist()
end

function deleteFriendLabels()

	if isElement ( gEdit["FriendName"] ) then
		guiSetText ( gEdit["FriendName"], "" )
		guiSetText ( gLabel["friendFactionValue"], "-" )
		guiSetText ( gLabel["friendStateValue"], "-" )
		guiLabelSetColor ( gLabel["friendStateValue"], 255, 255, 255 )
		guiSetText ( gLabel["friendHandyNRValue"], "-" )
		guiSetText ( gLabel["FriendName"], "Bitte waehlen!" )
	end
end

function deleteFriend ( friendname )

	local newfriends = ""
	for i = 0, guiGridListGetRowCount ( gGrid["friendlistNames"] ) do
		local text = guiGridListGetItemText ( gGrid["friendlistNames"], i, gColumn["friendNames"] )
		if text ~= friendname then
			newfriends = newfriends..text.."|"
		else
			outputChatBox ( "Freund geloescht!", 125, 0, 0 )
			_G["friend"..friendname] = false
		end
	end
	local friendlist = xmlLoadFile ( "friendlist/friendlist.xml" )
	local friends = xmlNodeGetChildren ( friendlist, 0 )
	xmlNodeSetValue ( friends, newfriends )
	xmlSaveFile ( friendlist )
	deleteFriendLabels()
	fillFriendlist()
end

function getFriends ()

	local friendlist = xmlLoadFile ( "friendlist/friendlist.xml" )
	local friends = xmlNodeGetChildren ( friendlist, 0 )
	xmlSaveFile ( friendlist )
	local friends = xmlNodeGetValue ( friends )
	if friends then
		return friends
	else
		return false
	end
end

function addFriend_func ( friendname )

	local friendlist = xmlLoadFile ( "friendlist/friendlist.xml" )
	local friends = xmlNodeGetChildren ( friendlist, 0 )
	local curfriends = xmlNodeGetValue ( friends )
	local lastfriend = "console"
	for i = 1, 100 do
		local newfriend = gettok ( curfriends, i, string.byte('|') )
		if not newfriend then
			outputChatBox ( "Freund wurde zur Liste hinzugefuegt!", 0, 125, 0 )
			_G["friend"..friendname] = true
			xmlNodeSetValue ( friends, curfriends..friendname.."|" )
			xmlSaveFile ( friendlist )
			deleteFriendLabels()
			fillFriendlist()
			break
		end
		if tostring ( newfriend ) == tostring ( friendname ) then
			outputChatBox ( "Der Spieler ist bereits in der Liste!", 125, 0, 0 )
			break
		end	
		local lastfriend = newfriend
	end
end
addEvent ( "addFriend", true )
addEventHandler ( "addFriend", getRootElement(), addFriend_func )

function fillFriendlist()

	if gGrid["friendlistNames"] then
		guiGridListClear ( gGrid["friendlistNames"] )
		local friendlist = xmlLoadFile ( "friendlist/friendlist.xml" )
		if not friendlist then
			local friendlist = xmlCreateFile ( "friendlist/friendlist.xml", "friendlist" )
			local friends = xmlCreateChild ( friendlist, "friends" )
			xmlNodeSetValue ( friends, "" )
			xmlSaveFile ( friendlist )
		end
		local friendlist = xmlLoadFile ( "friendlist/friendlist.xml" )
		local friends = getFriends()
		local lastfriend = "console"
		local newfriend = ""
		for i = 1, 100 do
			local newfriend = gettok ( friends, i, string.byte('|') )
			if tostring ( newfriend ) == tostring ( lastfriend ) then
				break
			elseif newfriend then
				local row = guiGridListAddRow ( gGrid["friendlistNames"] )
				guiGridListSetItemText ( gGrid["friendlistNames"], row, gColumn["friendNames"], newfriend, false, false )
				_G["friend"..newfriend] = true
			end
			local lastfriend = gettok ( friends, i, string.byte('|') )
		end
	end
end