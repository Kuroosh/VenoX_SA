function showSocialRankWindow ()

	if gWindow["socialRankSelection"] then
		guiSetVisible ( gWindow["socialRankSelection"], true )
	else
		gWindow["socialRankSelection"] = guiCreateStaticImage(screenwidth/2-402/2,120,402,220,"images/hud/background.png",false)
		guiSetAlpha(gWindow["socialRankSelection"],1)
		guiWindowSetMovable(gWindow["socialRankSelection"],false)
		guiWindowSetSizable(gWindow["socialRankSelection"],false)
		
		gGrid["socialRank"] = guiCreateGridList(10,30,159,181,false,gWindow["socialRankSelection"])
		guiGridListSetSelectionMode(gGrid["socialRank"],0)
		guiSetAlpha(gGrid["socialRank"],1)
		
		gColumn["socialRank"] = guiGridListAddColumn(gGrid["socialRank"],"Sozialer Status",0.55)
		gColumn["socialAvailable"] = guiGridListAddColumn(gGrid["socialRank"],"",0.25)
				
		gLabel["socialRankInfo"] = guiCreateLabel(175,30,227,112,"In diesem Menü kannst du deine frei-\ngeschalteten sozialen Staten akti-\nvieren, damit dieser in der Spielerliste\nsichtbar wird.\nAußerdem wird dir angezeigt, welchen\nStatus du als nächstes erreichen\nkannst bzw. was dafür nötig ist,\nden jeweiligen Status zu erreichen.",false,gWindow["socialRankSelection"])
		guiSetAlpha(gLabel["socialRankInfo"],1)
		guiLabelSetColor(gLabel["socialRankInfo"],200,200,000)
		guiLabelSetVerticalAlign(gLabel["socialRankInfo"],"top")
		guiLabelSetHorizontalAlign(gLabel["socialRankInfo"],"left",false)
		guiSetFont(gLabel["socialRankInfo"],"default-bold-small")
		gLabel["socialRankReqs"] = guiCreateLabel(193,148,59,15,"Benötigt:",false,gWindow["socialRankSelection"])
		guiSetAlpha(gLabel["socialRankReqs"],1)
		guiLabelSetColor(gLabel["socialRankReqs"],200,000,000)
		guiLabelSetVerticalAlign(gLabel["socialRankReqs"],"top")
		guiLabelSetHorizontalAlign(gLabel["socialRankReqs"],"left",false)
		guiSetFont(gLabel["socialRankReqs"],"default-bold-small")
		gLabel["socialRankRequirements"] = guiCreateLabel(265,144,116,72,"",false,gWindow["socialRankSelection"])
		guiSetAlpha(gLabel["socialRankRequirements"],1)
		guiLabelSetColor(gLabel["socialRankRequirements"],000,120,000)
		guiLabelSetVerticalAlign(gLabel["socialRankRequirements"],"top")
		guiLabelSetHorizontalAlign(gLabel["socialRankRequirements"],"left",false)
		guiSetFont(gLabel["socialRankRequirements"],"default-bold-small")
		
		gButton["socialRankSelect"] = guiCreateButton(176,172,78,40,"Verwenden",false,gWindow["socialRankSelection"])
		guiSetAlpha(gButton["socialRankSelect"],1)
		
		addEventHandler("onClientGUIClick", gButton["socialRankSelect"], 
		function ( btn, state )
			if state == "up" then
				local rowindex, columnindex = guiGridListGetSelectedItem ( gGrid["socialRank"] )
				local selectedText = guiGridListGetItemText ( gGrid["socialRank"], rowindex, gColumn["socialRank"] )
				local selectedTextAvailable = guiGridListGetItemText ( gGrid["socialRank"], rowindex, gColumn["socialAvailable"] )
				if selectedText then
					if selectedTextAvailable == "[x]" then
						triggerServerEvent ( "socialStateNewChange", lp, selectedText )
						outputChatBox ( "Dein neuen sozialer Status ist nun: "..selectedText.."!", 0, 125, 0 )
					else
						outputChatBox ( "Du hast diesen Status noch nicht frei geschaltet!", 125, 0, 0 )
					end
				end
			end
		end, false)
		
		addEventHandler ( "onClientGUIClick", gGrid["socialRank"],
			function ()
				local rowindex, columnindex = guiGridListGetSelectedItem ( gGrid["socialRank"] )
				local selectedText = guiGridListGetItemText ( gGrid["socialRank"], rowindex, gColumn["socialRank"] )
				if selectedText then
					guiSetText ( gLabel["socialRankRequirements"], socialNeeds[selectedText] )
				end
			end,
		false)
	end
	fillSocialList ( gGrid["socialRank"], gColumn["socialRank"], gColumn["socialAvailable"] )
end

function fillSocialList ( grid, rank, available )

	guiGridListClear ( grid )
	for i = 1, socialStateCount do
		if availableSocialStates[i] then
			local row = guiGridListAddRow ( grid )
			guiGridListSetItemText ( grid, row, rank, socialStates[i], false, false )
			guiGridListSetItemText ( grid, row, available, "[x]", false, false )
		elseif reachableSocialStates[i] then
			local row = guiGridListAddRow ( grid )
			guiGridListSetItemText ( grid, row, rank, socialStates[i], false, false )
			guiGridListSetItemText ( grid, row, available, "[_]", false, false )
		end
	end
end