function showCustomRadioGUI ()

	--gWindow["radioOptions"] = guiCreateWindow(screenwidth/2-317/2,120,317,234,"Radiosender",false)
	gWindow["radioOptions"] = guiCreateStaticImage(screenwidth/2-317/2,120,317,234,"images/hud/background.png",false)
	guiSetAlpha(gWindow["radioOptions"],1)
	gGrid["radioSenders"] = guiCreateGridList(9,24,159,200,false,gWindow["radioOptions"])
	guiGridListSetSelectionMode(gGrid["radioSenders"],0)
	gColumn["radioNames"] = guiGridListAddColumn(gGrid["radioSenders"],"Name",0.8)
	guiSetAlpha(gGrid["radioSenders"],1)
	
	gButton["deleteRadio"] = guiCreateButton(172,95,65,33,"Loeschen",false,gWindow["radioOptions"])
	guiSetAlpha(gButton["deleteRadio"],1)
	guiSetFont(gButton["deleteRadio"],"default-bold-small")
	gButton["addRadio"] = guiCreateButton(241,95,65,33,"Adden",false,gWindow["radioOptions"])
	guiSetAlpha(gButton["addRadio"],1)
	guiSetFont(gButton["addRadio"],"default-bold-small")
	
	addEventHandler ( "onClientGUIClick", gButton["deleteRadio"],
		function ()
			local toDelete = guiGridListGetItemText ( gGrid["radioSenders"], guiGridListGetSelectedItem ( gGrid["radioSenders"] ), 1 )
			if checkIfCustomRadioChannelExists ( toDelete ) then
				deleteCustomRadioChannel ( toDelete )
				refreshChannelList ()
				outputChatBox ( "Kanal gelöscht!", 0, 200, 0 )
			end
		end,
	false )
	addEventHandler ( "onClientGUIClick", gButton["addRadio"],
		function ()
			local name = guiGetText ( gEdit["radioName"] )
			local url  = guiGetText ( gEdit["radioURL"] )
			if not checkIfCustomRadioChannelExists ( name ) then
				
				local result = playSound ( url )
				if not result then
					outputChatBox ( "Ungültige Adresse!", 200, 0, 0 )
					return true
				else
					stopSound ( result )
				end
				
				result = saveNewCustomRadioChannel ( name, url )
				refreshChannelList ()
				if result then
					outputChatBox ( "Kanal hinzugefügt!", 0, 200, 0 )
				else
					outputChatBox ( "Ungültiger Name!", 200, 0, 0 )
				end
			else
				outputChatBox ( "Der Sender ist bereits auf der Liste!", 0, 200, 0 )
			end
		end,
	false )
	
	gEdit["radioName"] = guiCreateEdit(172,147,136,29,"",false,gWindow["radioOptions"])
	guiSetAlpha(gEdit["radioName"],1)
	gEdit["radioURL"] = guiCreateEdit(172,191,131,29,"",false,gWindow["radioOptions"])
	guiSetAlpha(gEdit["radioURL"],1)
	
	gLabel[1] = guiCreateLabel(170,23,144,71,"Hier kannst du Adressen\nvon Webradios wie z.B.\nTechnobase hinzufuegen,\nso dass sie im Auto\nverfügbar sind.",false,gWindow["radioOptions"])
	guiSetAlpha(gLabel[1],1)
	guiLabelSetColor(gLabel[1],200,200,0)
	guiLabelSetVerticalAlign(gLabel[1],"top")
	guiLabelSetHorizontalAlign(gLabel[1],"left",false)
	guiSetFont(gLabel[1],"default-bold-small")
	gLabel[2] = guiCreateLabel(173,130,31,16,"Name:",false,gWindow["radioOptions"])
	guiSetAlpha(gLabel[2],1)
	guiLabelSetColor(gLabel[2],255,255,255)
	guiLabelSetVerticalAlign(gLabel[2],"top")
	guiLabelSetHorizontalAlign(gLabel[2],"left",false)
	guiSetFont(gLabel[2],"default-bold-small")
	gLabel[3] = guiCreateLabel(173,176,31,16,"URL:",false,gWindow["radioOptions"])
	guiSetAlpha(gLabel[3],1)
	guiLabelSetColor(gLabel[3],255,255,255)
	guiLabelSetVerticalAlign(gLabel[3],"top")
	guiLabelSetHorizontalAlign(gLabel[3],"left",false)
	guiSetFont(gLabel[3],"default-bold-small")
	
	refreshChannelList ()
end

function refreshChannelList ()

	guiGridListClear ( gGrid["radioSenders"] )
	local channels = getCustomRadioChannels ()
	local row
	for key, index in pairs ( channels ) do
		row = guiGridListAddRow ( gGrid["radioSenders"] )
		guiGridListSetItemText ( gGrid["radioSenders"], row, gColumn["radioNames"], key, false, false )
	end
end