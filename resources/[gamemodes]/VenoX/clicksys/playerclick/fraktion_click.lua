
 
 
function fraktion_gui ( )
	if getElementData ( lp, "fraktion" ) == 0 then return end
	setElementClicked ( true )
	showCursor ( true )

	if gWindow["fraktion"] then
		guiSetVisible ( gWindow["fraktion"], true )
		guiGridListClear ( gGrid["fraktion"] )
	else
        local screenW, screenH = guiGetScreenSize()
        gWindow["fraktion"] = guiCreateStaticImage((screenW - 548) / 2, (screenH - 404) / 2, 548, 364, "images/gui/fraktion.png", false)
		--gWindow["fraktion"] = guiCreateWindow ( screenwidth/2-445/2, screenheight/2-294/2, 536, 297,"Fraktionsuebersicht", false )
		guiSetAlpha ( gWindow["fraktion"],1 )

		-- Welcome
		gLabel[1] = guiCreateLabel ( 10, 56, 418, 70,"\n\nHier habt ihr eine Liste der Fraktionsmitglieder.", false, gWindow["fraktion"] )
		guiSetAlpha ( gLabel[1], 1 )
		guiLabelSetColor ( gLabel[1], 255, 255, 255)
		guiLabelSetVerticalAlign ( gLabel[1],"top" )
		guiLabelSetHorizontalAlign ( gLabel[1],"left", false )
		guiSetFont ( gLabel[1],"default-bold-small" )

		gGrid["fraktion"] = guiCreateGridList ( 10, 120, 299, 187, false, gWindow["fraktion"] )
		Name = guiGridListAddColumn ( gGrid["fraktion"], "Name", 0.3 )								
		Rang = guiGridListAddColumn ( gGrid["fraktion"], "Rang", 0.1 )				
		Zeit = guiGridListAddColumn ( gGrid["fraktion"], "Zeit", 0.30 )
		Status = guiGridListAddColumn ( gGrid["fraktion"], "Status", 0.2 )
		
		-- Close		
		gButton["closeFraktion"] = guiCreateButton ( 502, 43, 16, 17,"x", false, gWindow["fraktion"] )
		guiSetAlpha ( gButton["closeFraktion"],1 )
		addEventHandler ( "onClientGUIClick", gButton["closeFraktion"], 
		function ()
			if ( source == gButton["closeFraktion"] ) then
				fraktion_gui_hide ( )
			end
		end
		)
				
		-- Fraktionsmenue
		gLabel[2] = guiCreateLabel ( 326, 116, 199, 20,"", false, gWindow["fraktion"] )
		guiSetAlpha ( gLabel[2], 1 )
		guiLabelSetColor ( gLabel[2], 255, 255, 255)
		guiLabelSetVerticalAlign ( gLabel[2],"top" )
		guiLabelSetHorizontalAlign ( gLabel[2],"left", false )
		guiSetFont ( gLabel[2],"default-bold-small" )		

		-- Orten
		gButton["ortenFraktion"] = guiCreateButton ( 319, 139, 100, 25,"Orten", false, gWindow["fraktion"] )
		guiSetAlpha ( gButton["ortenFraktion"],1 )
		addEventHandler ( "onClientGUIClick", gButton["ortenFraktion"], 
		function ()
			if ( source == gButton["ortenFraktion"] ) then
				local pname = guiGridListGetItemText ( gGrid["fraktion"], guiGridListGetSelectedItem ( gGrid["fraktion"] ), Name )
				if getPlayerFromName ( pname ) then
					local target = getPlayerFromName ( pname )
					if getElementData ( target, "handystate" ) == "off" then
						outputChatBox ( "Das Handy des Buergers ist ausgeschaltet!", 125, 0, 0 )
					else
						if tonumber ( getElementInterior ( target ) ) ~= 0 or tonumber ( getElementDimension ( target ) ) ~= 0 then
							outputChatBox ( "Der Spieler befindet sich in einem Gebaeude - Ortung nicht moeglich!", 125, 0, 0 )
						else
							if isElement ( MemberBlip ) then
								destroyElement ( MemberBlip )
								if isTimer ( deletetMemberBlipTimer ) then
									killTimer ( deletetMemberBlipTimer )
								end
								MemberBlip = createBlipAttachedTo ( target, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
								deletetMemberBlipTimer = setTimer ( deletetMemberBlip, 5000, 1 )
							else
								MemberBlip = createBlipAttachedTo ( target, 0, 2, 255, 0, 0, 255, 0, 99999.0, player )
								deletetMemberBlipTimer = setTimer ( deletetMemberBlip, 5000, 1 )
							end
						end
					end
				else
					outputChatBox ( "Der Spieler ist gerade nicht online", 125, 0, 0 )
				end
			end
		end
		)
		
		if tonumber ( vnxClientGetElementData ( "rang" ) ) >= 5 then
			-- Leadermenue
			gLabel[3] = guiCreateLabel ( 326, 188, 199, 20,"Leadermenue", false, gWindow["fraktion"] )
			guiSetAlpha ( gLabel[3], 1 )
			guiLabelSetColor ( gLabel[3], 255, 255, 255)
			guiLabelSetVerticalAlign ( gLabel[3],"top" )
			guiLabelSetHorizontalAlign ( gLabel[3],"left", false )
			guiSetFont ( gLabel[3],"default-bold-small" )				
			
			-- Spielername
			gLabel[4] = guiCreateLabel ( 326, 206, 100, 20,"Spielername:", false, gWindow["fraktion"] )
			guiSetAlpha ( gLabel[4], 1 )
			guiLabelSetColor ( gLabel[4], 255, 255, 255)
			guiLabelSetVerticalAlign ( gLabel[4],"top" )
			guiLabelSetHorizontalAlign ( gLabel[4],"left", false )
			guiSetFont ( gLabel[4],"default-bold-small" )	

			-- Spielername - Edit
			gEdit["pnameFraktion"] = guiCreateEdit ( 319, 225, 100, 25, "", false, gWindow["fraktion"] )

			-- Einladen
			gButton["inviteFraktion"] = guiCreateButton ( 319, 256, 100, 25, "Einladen", false, gWindow["fraktion"] )
			addEventHandler ( "onClientGUIClick", gButton["inviteFraktion"], 
				function ()
					if ( source == gButton["inviteFraktion"] ) then
						local pname = guiGetText ( gEdit["pnameFraktion"] )
						triggerServerEvent ( "fraktion_invite", getLocalPlayer (), pname )
						fraktion_gui_hide ()
						openagain = true
					end
				end, false )
			
			-- Kicken
			gButton["kickFraktion"] = guiCreateButton ( 319, 284, 100, 25, "Kicken", false, gWindow["fraktion"] )
			addEventHandler ( "onClientGUIClick", gButton["kickFraktion"], function ()
				local pname = guiGridListGetItemText ( gGrid["fraktion"], guiGridListGetSelectedItem ( gGrid["fraktion"] ), Name )
				if pname then
					triggerServerEvent ( "fraktion_uninvite", getLocalPlayer (), pname )
					fraktion_gui_hide ()
					openagain = true
				end
			end, false )
			
			-- Neuer Rang
			gLabel[5] = guiCreateLabel( 426, 206, 100, 20,"Neuer Rang:",false,gWindow["fraktion"])
			guiSetAlpha ( gLabel[5], 1 )
			guiLabelSetColor ( gLabel[5], 255, 255, 255)
			guiLabelSetVerticalAlign ( gLabel[5],"top" )
			guiLabelSetHorizontalAlign ( gLabel[5],"left", false )
			guiSetFont ( gLabel[5],"default-bold-small" )	
			
			-- Neuer Rang - Edit
			gEdit["newrangFraktion"] = guiCreateEdit ( 423, 225, 100, 25, "", false, gWindow["fraktion"] )
		
			-- Befördern
			gButton["befoerdernFraktion"] = guiCreateButton ( 423, 256, 100, 25, "Befördern", false, gWindow["fraktion"] )
			addEventHandler ( "onClientGUIClick", gButton["befoerdernFraktion"], function ()
				local pname = guiGridListGetItemText ( gGrid["fraktion"], guiGridListGetSelectedItem ( gGrid["fraktion"] ), Name )		
				local nrang = tonumber ( guiGetText ( gEdit["newrangFraktion"] ) ) 
				if tonumber(nrang) ~= nil and nrang >= 0 and nrang <= 5 then
					triggerServerEvent ( "fraktion_befoerdern", getLocalPlayer(), pname, nrang )
					fraktion_gui_hide ()
					openagain = true
				end
			end, false )
			
			-- Degradieren
			gButton["dregadierenFraktion"] = guiCreateButton ( 423, 284, 100, 25, "Degradieren", false, gWindow["fraktion"] )
			guiSetAlpha(gButton["dregadierenFraktion"],1)
			addEventHandler ( "onClientGUIClick", gButton["dregadierenFraktion"], function ()
				local pname = guiGridListGetItemText ( gGrid["fraktion"], guiGridListGetSelectedItem ( gGrid["fraktion"] ), Name )		
				local nrang = tonumber ( guiGetText ( gEdit["newrangFraktion"] ) )		
				if tonumber(nrang) ~= nil and nrang >= 0 and nrang <= 5 then
					triggerServerEvent ( "fraktion_degradieren", getLocalPlayer(), pname, nrang )
					fraktion_gui_hide ()
					openagain = true
				end
			end, false )
		end
	end
	guiSetInputMode ( "no_binds_when_editing" )
	if gEdit["newrangFraktion"] then
		guiSetText ( gEdit["newrangFraktion"], "" )
	end
	if gEdit["pnameFraktion"] then
		guiSetText ( gEdit["pnameFraktion"], "" ) 
	end
	fill_memberlist_func ( )
end
function fraktion_gui_hide ( )
	guiSetVisible ( gWindow["fraktion"], false )
	showCursor ( false )
	setElementClicked ( false )
	guiGridListClear ( gGrid["fraktion"] )
	guiSetInputMode ( "allow_binds" )
end

function deletetMemberBlip ()

	destroyElement ( MemberBlip )
	MemberBlip = nil
end