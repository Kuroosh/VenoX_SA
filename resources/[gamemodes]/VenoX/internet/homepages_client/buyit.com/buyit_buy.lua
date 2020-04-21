offerTypes = { ["Fahrzeug"]="Veh",
 ["Drogen"]="Drug",
 ["Materialien"]="Mats",
 ["Haus"]="Houses",
 ["Prestige Objekt"]="Prestige",
 ["Garage"]="Garages",
 ["Nicht moeglich"]="Special"
}

local maindomane = "buyit.com/buy"
 Domanes[maindomane]=maindomane

addEvent ( maindomane, true )
addEventHandler ( maindomane, getRootElement(), 
	function  ()
		img = createBasicPage ( "red" )
		gImage["BuyitBuyBG"] = guiCreateStaticImage(0,0,400,56,"images/colors/c_black.jpg",false,img)
		gLabel[7] = guiCreateLabel(124,14,169,26,"BuyIt - "..auktionOffer.." kaufen",false,gImage["BuyitBuyBG"])
		gImage[3] = guiCreateStaticImage(60,6,41,40,"images/internet/star.png",false,gImage["BuyitBuyBG"])
		gImage[4] = guiCreateStaticImage(0,51,400,5,"images/colors/c_grey.jpg",false,gImage["BuyitBuyBG"])
	
		local secTextBuy = {
		 ["Fahrzeug"]="Model",
		 ["Drogen"]="Gramm",
		 ["Materialien"]="Stk."
		}

		secColumn = secTextBuy[auktionOffer]
		
		secTextBuy = nil
		
		gGrid[1] = guiCreateGridList(16,125,179,159,false,img)
		guiGridListSetSelectionMode(gGrid[1],1)
		gColumn["offerFrom"] = guiGridListAddColumn(gGrid[1],"Von",0.4)
		if secColumn then
			gColumn["secText"] = guiGridListAddColumn(gGrid[1],secColumn,0.3)
		end
		gColumn["offerGebot"] = guiGridListAddColumn(gGrid[1],"Gebot",0.4)
		gMemo[1] = guiCreateMemo(201,169,110,114,"Bitte waehle eine Auktion aus!",false,img)
		guiMemoSetReadOnly ( gMemo[1], true )
		gLabel[2] = guiCreateLabel(16,89,216,31,"Auktion laeuft noch:\n-",false,img)
		guiLabelSetColor(gLabel[2],255,255,255)
		guiLabelSetVerticalAlign(gLabel[2],"top")
		guiLabelSetHorizontalAlign(gLabel[2],"left",false)
		guiSetFont(gLabel[2],"default-bold-small")
		gLabel[3] = guiCreateLabel(216,153,82,16,"Beschreibung:",false,img)
		guiLabelSetColor(gLabel[3],255,255,255)
		guiLabelSetVerticalAlign(gLabel[3],"top")
		guiLabelSetHorizontalAlign(gLabel[3],"left",false)
		guiSetFont(gLabel[3],"default-bold-small")
		gMemo[2] = guiCreateMemo(315,215,71,31,"0",false,img)
		gLabel[4] = guiCreateLabel(387,222,13,23,"$",false,img)
		guiLabelSetColor(gLabel[4],0,200,0)
		guiLabelSetVerticalAlign(gLabel[4],"top")
		guiLabelSetHorizontalAlign(gLabel[4],"left",false)
		guiSetFont(gLabel[4],"default-bold-small")
		gLabel[5] = guiCreateLabel(236,82,142,17,"Aktuelles Hoechstgebot:",false,img)
		guiLabelSetColor(gLabel[5],0,0,0)
		guiLabelSetVerticalAlign(gLabel[5],"top")
		guiLabelSetHorizontalAlign(gLabel[5],"left",false)
		guiSetFont(gLabel[5],"default-bold-small")
		gLabel[6] = guiCreateLabel(272,98,67,18,"0 $",false,img)
		guiLabelSetColor(gLabel[6],0,200,0)
		guiLabelSetVerticalAlign(gLabel[6],"top")
		guiLabelSetHorizontalAlign(gLabel[6],"left",false)
		guiSetFont(gLabel[6],"default-bold-small")
		gLabel[7] = guiCreateLabel(248,116,133,15,"Von: -",false,img)
		guiLabelSetColor(gLabel[7],255,255,255)
		guiLabelSetVerticalAlign(gLabel[7],"top")
		guiLabelSetHorizontalAlign(gLabel[7],"left",false)
		guiSetFont(gLabel[7],"default-bold-small")
		
		gButton[3] = guiCreateButton(316,251,71,32,"Bieten",false,img)
		
		triggerServerEvent ( "getDataForObjectList", lp, offerTypes[auktionOffer] )
		
		addEventHandler("onClientGUIClick", gButton[3], 
			function ( btn, state )
				if state == "up" then
					local row, column = guiGridListGetSelectedItem ( gGrid[1] )
					if row then
						local gebot = tonumber ( guiGetText ( gMemo[2] ) )
						if gebot then
							if vnxClientGetElementData ( "bankmoney" ) >= gebot then
								local count = _G[row.."DataCount"]
								local status = true
								if status then
									triggerServerEvent ( "betForObject", lp, offerTypes[auktionOffer], offerID, gebot )
									showWebbrowser ( "www.buyit.com" )
								end
							else
								outputChatBox ( "Du hast nicht so viel Geld auf der Bank!", 125, 0, 0 )
							end
						else
							outputChatBox ( "Du hast ein ungueltiges Gebot eintragen!", 125, 0, 0 )
						end
					end
				end
			end,
		false)
		
		addEventHandler("onClientGUIClick", gGrid[1], 
			function ( btn, state )
				local row, column = guiGridListGetSelectedItem ( gGrid[1] )
				if row and offerID ~= _G[row.."DataID"] then
					local ends = _G[row.."DataEnds"]
					local anbieter = _G[row.."DataFrom"]
					local gebot = _G[row.."DataBet"]
					local hoechstbietender = _G[row.."DataTopOfferer"]
					
					offerID = _G[row.."DataID"]
					
					guiSetText ( gLabel[2], "Auktion laeuft noch:\n"..ends )
					
					guiSetText ( gLabel[6], gebot.." $" )
					guiSetText ( gLabel[7], "Von: "..hoechstbietender )
					
					triggerServerEvent ( "getDescriptionForObject", lp, offerTypes[auktionOffer], offerID )
				end
			end
		)
	end
)

function recieveDataForObjectList_func ( count, dataString )

	for i = 1, count do
		dataStringPart = gettok ( dataString, i, string.byte ( '~' ) )
		
		local id = gettok ( dataStringPart, 1, string.byte ( '|' ) )
		local anbieter = gettok ( dataStringPart, 2, string.byte ( '|' ) )
		local hoechstgebot = gettok ( dataStringPart, 3, string.byte ( '|' ) )
		local ends = gettok ( dataStringPart, 4, string.byte ( '|' ) )
		local counts = gettok ( dataStringPart, 5, string.byte ( '|' ) )
		local hoechstbietender = gettok ( dataStringPart, 6, string.byte ( '|' ) )
		
		local row = guiGridListAddRow ( gGrid[1] )
		
		_G[row.."DataEnds"] = nil
		_G[row.."DataID"] = nil
		_G[row.."DataFrom"] = nil
		_G[row.."DataBet"] = nil
		_G[row.."DataCount"] = nil
		_G[row.."DataTopOfferer"] = nil
		
		_G[row.."DataEnds"] = ends
		_G[row.."DataID"] = id
		_G[row.."DataFrom"] = anbieter
		_G[row.."DataBet"] = hoechstgebot
		_G[row.."DataCount"] = tonumber ( counts )
		_G[row.."DataTopOfferer"] = hoechstbietender
		guiGridListSetItemText ( gGrid[1], row, gColumn["offerFrom"], anbieter, false, false )
		guiGridListSetItemText ( gGrid[1], row, gColumn["offerGebot"], hoechstgebot.." $", false, false )
		if gColumn["secText"] then
			if secColumn == "Model" then
				counts = getVehicleNameFromModel ( tonumber ( counts ) )
			end
			guiGridListSetItemText ( gGrid[1], row, gColumn["secText"], tostring ( counts ), false, false )
		end
	end
end
addEvent ( "recieveDataForObjectList", true )
addEventHandler ( "recieveDataForObjectList", getRootElement(), recieveDataForObjectList_func )

function recieveDescriptionForObject_func ( text, id )

	if offerID == id then
		guiSetText ( gMemo[1], text )
	end
end
addEvent ( "recieveDescriptionForObject", true )
addEventHandler ( "recieveDescriptionForObject", getRootElement(), recieveDescriptionForObject_func )