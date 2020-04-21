local maindomane = "buyit.com/sell"
 Domanes[maindomane]=maindomane

addEvent ( maindomane, true )
addEventHandler ( maindomane, getRootElement(), 
	function  ()
		img = createBasicPage ( "red" )
		gImage[2] = guiCreateStaticImage(0,0,400,56,"images/colors/c_black.jpg",false,img)
		gLabel[7] = guiCreateLabel(124,14,169,26,"BuyIt - "..auktionOffer.." verkaufen",false,gImage[2])
		gImage[3] = guiCreateStaticImage(60,6,41,40,"images/internet/star.png",false,gImage[2])
		gImage[4] = guiCreateStaticImage(0,51,400,5,"images/colors/c_grey.jpg",false,gImage[2])
		
		descText = {
		 ["Fahrzeug"]="Slot",
		 ["Nicht moeglich"]="",
		 ["Drogen"]="Gramm",
		 ["Materialien"]="Materialien"
		}
		
		gLabel[1] = guiCreateLabel(12,69,89,14,"Auktionsdauer:",false,img)
		guiLabelSetColor(gLabel[1],255,255,255)
		guiLabelSetVerticalAlign(gLabel[1],"top")
		guiLabelSetHorizontalAlign(gLabel[1],"left",false)
		guiSetFont(gLabel[1],"default-bold-small")
		gLabel[3] = guiCreateLabel(237,68,84,17,"Startgebot:",false,img)
		guiLabelSetColor(gLabel[3],255,255,255)
		guiLabelSetVerticalAlign(gLabel[3],"top")
		guiLabelSetHorizontalAlign(gLabel[3],"left",false)
		guiSetFont(gLabel[3],"default-bold-small")
		
		gRadio[1] = guiCreateRadioButton(11,85,82,14,"12 Stunden",false,img)
		guiSetFont(gRadio[1],"default-bold-small")
		gRadio[2] = guiCreateRadioButton(11,103,82,14,"24 Stunden",false,img)
		guiSetFont(gRadio[2],"default-bold-small")
		gRadio[3] = guiCreateRadioButton(11,120,82,14,"72 Stunden",false,img)
		guiSetFont(gRadio[3],"default-bold-small")

		guiRadioButtonSetSelected(gRadio[1],true)
		
		local text = descText[auktionOffer]
		if text then
			gLabel[2] = guiCreateLabel(127,69,84,17,text..":",false,img)
			guiLabelSetColor(gLabel[2],255,255,255)
			guiLabelSetVerticalAlign(gLabel[2],"top")
			guiLabelSetHorizontalAlign(gLabel[2],"left",false)
			guiSetFont(gLabel[2],"default-bold-small")
			gEdit[1] = guiCreateEdit(126,92,76,31,"",false,img)
		end
		gEdit["buyitStartOffer"] = guiCreateEdit(237,92,76,31,"100",false,img)
		
		gMemo[1] = guiCreateMemo(11,168,110,114,"",false,img)
		gLabel[6] = guiCreateLabel(27,150,79,18,"Beschreibung:",false,img)
		guiLabelSetColor(gLabel[6],255,255,255)
		guiLabelSetVerticalAlign(gLabel[6],"top")
		guiLabelSetHorizontalAlign(gLabel[6],"left",false)
		guiSetFont(gLabel[6],"default-bold-small")
		gLabel[8] = guiCreateLabel(22,282,107,14,"0/200 Zeichen",false,img)
		guiLabelSetColor(gLabel[8],255,255,255)
		guiLabelSetVerticalAlign(gLabel[8],"top")
		guiLabelSetHorizontalAlign(gLabel[8],"left",false)
		guiSetFont(gLabel[8],"default-bold-small")
		
		gButton[1] = guiCreateButton(142,229,82,47,"Gebot einstellen",false,img)
		addEventHandler("onClientGUIClick", gButton[1], 
			function ( btn, state )
				if state == "up" then
					local valid = true
					
					local typ = offerTypes[auktionOffer]
					local startGebot = tonumber ( guiGetText ( gEdit["buyitStartOffer"] ) )
					local description = guiGetText ( gMemo[1] )
					
					if guiRadioButtonGetSelected( gRadio[1] ) then
						timeToRun = 12*60
					elseif guiRadioButtonGetSelected( gRadio[2] ) then
						timeToRun = 24*60
					else
						timeToRun = 72*60
					end
					
					if gEdit[1] then
						count = tonumber ( guiGetText ( gEdit[1] ) )
						if not count then
							valid = false
							outputChatBox ( "Deine Angaben scheinen nicht zu stimmen.", 125, 0, 0 )
						end
					end
					if valid then
						triggerServerEvent ( "makeOffer", lp, typ, startGebot, description, timeToRun, count )
					end
				end
			end,
		false)
		
		checkCharsInDescription()
	end
)

function checkCharsInDescription ()

	if guiGetText ( gLabel[7] ) == "BuyIt - "..auktionOffer.." verkaufen" then
		guiSetText ( gLabel[8], ( #guiGetText ( gMemo[1] ) - 1 ).."/200 Zeichen" )
		setTimer ( checkCharsInDescription, 100, 1 )
	end
end