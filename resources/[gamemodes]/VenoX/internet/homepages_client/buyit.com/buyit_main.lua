local maindomane = "buyit.com"
 Domanes[maindomane]=maindomane
 
 Domanes["www.buyit.com"]=maindomane
 
 Domanes["buyit"]=maindomane
 
 Domanes["buyit.de"]=maindomane
 Domanes["www.buyit.de"]=maindomane

addEvent ( maindomane, true )
addEventHandler ( maindomane, getRootElement(), 
	function  ()
		local curDrugOffers = "  ?"
		local curMatsOffers = "  ?"
		local curVehOffers = "  ?"
		local curHousesOffers = "  ?"
		local curPrestigeOffers = "  ?"
		local curGaragesOffers = "  ?"
		local curSpecialOffers = "  ?"
		
		img = createBasicPage ( "red" )
		gImage[2] = guiCreateStaticImage(0,0,400,56,"images/colors/c_black.jpg",false,img)
		gImage[3] = guiCreateStaticImage(60,6,41,40,"images/internet/star.png",false,gImage[2])
		gImage[4] = guiCreateStaticImage(0,51,400,5,"images/colors/c_grey.jpg",false,gImage[2])
		
		gLabel[1] = guiCreateLabel(2,57,125,15,"*Ausgenommen Tiernahrung",false,img)
		guiLabelSetColor(gLabel[1],255,255,255)
		guiLabelSetVerticalAlign(gLabel[1],"top")
		guiLabelSetHorizontalAlign(gLabel[1],"left",false)
		guiSetFont(gLabel[1],"default-small")
		gLabel[2] = guiCreateLabel(32,86,151,16,"Bitte waehle eine Sektion:",false,img)
		guiLabelSetColor(gLabel[2],200,200,200)
		guiLabelSetVerticalAlign(gLabel[2],"top")
		guiLabelSetHorizontalAlign(gLabel[2],"left",false)
		guiSetFont(gLabel[2],"default-bold-small")
		gLabel[3] = guiCreateLabel(300,248,98,16,"(Von der Serverleitung)",false,img)
		guiLabelSetColor(gLabel[3],255,255,255)
		guiLabelSetVerticalAlign(gLabel[3],"top")
		guiLabelSetHorizontalAlign(gLabel[3],"left",false)
		guiSetFont(gLabel[3],"default-small")
		gLabel[5] = guiCreateLabel(13,175,81,18,"Items:",false,img)
		guiLabelSetColor(gLabel[5],000,125,00)
		guiLabelSetVerticalAlign(gLabel[5],"top")
		guiLabelSetHorizontalAlign(gLabel[5],"left",false)
		guiSetFont(gLabel[5],"default-bold-small")
		gLabel[6] = guiCreateLabel(210,143,81,18,"Immobilien:",false,img)
		guiLabelSetColor(gLabel[6],0,125,0)
		guiLabelSetVerticalAlign(gLabel[6],"top")
		guiLabelSetHorizontalAlign(gLabel[6],"left",false)
		guiSetFont(gLabel[6],"default-bold-small")
		gLabel[7] = guiCreateLabel(124,14,169,26,"BuyIt - Alles zu jedem Preis!*",false,gImage[2])
		guiLabelSetColor(gLabel[7],255,255,255)
		guiLabelSetVerticalAlign(gLabel[7],"top")
		guiLabelSetHorizontalAlign(gLabel[7],"left",false)
		guiSetFont(gLabel[7],"default-bold-small")
		gLabel[8] = guiCreateLabel(112,176,81,18,"Fahrzeuge:",false,img)
		guiLabelSetColor(gLabel[8],0,125,0)
		guiLabelSetVerticalAlign(gLabel[8],"top")
		guiLabelSetHorizontalAlign(gLabel[8],"left",false)
		guiSetFont(gLabel[8],"default-bold-small")
		
		gRadio[1] = guiCreateRadioButton(30,100,64,22,"Kaufen",false,img)
		guiSetFont(gRadio[1],"default-bold-small")
		gRadio[2] = guiCreateRadioButton(30,120,79,22,"Verkaufen",false,img)
		guiSetFont(gRadio[2],"default-bold-small")
		
		guiRadioButtonSetSelected(gRadio[1],true)
		
		gButton[1] = guiCreateButton(112,220,89,41,"Fahrzeuge",false,img)
		gLabel[9] = guiCreateLabel(73,24,15,16,curVehOffers,false,gButton[1])
		guiLabelSetColor(gLabel[9],200,00,0)
		guiLabelSetVerticalAlign(gLabel[9],"top")
		guiLabelSetHorizontalAlign(gLabel[9],"left",false)
		guiSetFont(gLabel[9],"default-bold-small")
		
		gButton[2] = guiCreateButton(303,207,89,41,"SPEZIAL",false,img)
		gLabel[10] = guiCreateLabel(73,24,15,16,curSpecialOffers,false,gButton[2])
		guiLabelSetColor(gLabel[10],200,00,0)
		guiLabelSetVerticalAlign(gLabel[10],"top")
		guiLabelSetHorizontalAlign(gLabel[10],"left",false)
		guiSetFont(gLabel[10],"default-bold-small")
		
		gButton[3] = guiCreateButton(13,196,89,41,"Drogen",false,img)
		gLabel[11] = guiCreateLabel(73,24,15,16,curDrugOffers,false,gButton[3])
		guiLabelSetColor(gLabel[11],200,00,0)
		guiLabelSetVerticalAlign(gLabel[11],"top")
		guiLabelSetHorizontalAlign(gLabel[11],"left",false)
		guiSetFont(gLabel[11],"default-bold-small")
		gButton[4] = guiCreateButton(13,244,89,41,"Materialien",false,img)
		gLabel[12] = guiCreateLabel(73,24,15,16,curMatsOffers,false,gButton[4])
		guiLabelSetColor(gLabel[12],200,00,0)
		guiLabelSetVerticalAlign(gLabel[12],"top")
		guiLabelSetHorizontalAlign(gLabel[12],"left",false)
		guiSetFont(gLabel[12],"default-bold-small")
		
		gButton[5] = guiCreateButton(208,162,89,41,"Haeuser",false,img)
		gLabel[13] = guiCreateLabel(73,24,15,16,curHousesOffers,false,gButton[5])
		guiLabelSetColor(gLabel[13],200,00,0)
		guiLabelSetVerticalAlign(gLabel[13],"top")
		guiLabelSetHorizontalAlign(gLabel[13],"left",false)
		guiSetFont(gLabel[13],"default-bold-small")
		gButton[6] = guiCreateButton(208,207,89,41,"Prestige",false,img)
		gLabel[14] = guiCreateLabel(73,24,15,16,curPrestigeOffers,false,gButton[6])
		guiLabelSetColor(gLabel[14],200,00,0)
		guiLabelSetVerticalAlign(gLabel[14],"top")
		guiLabelSetHorizontalAlign(gLabel[14],"left",false)
		guiSetFont(gLabel[14],"default-bold-small")
		gButton[7] = guiCreateButton(208,252,89,41,"Garagen",false,img)
		gLabel[15] = guiCreateLabel(73,24,15,16,curGaragesOffers,false,gButton[7])
		guiLabelSetColor(gLabel[15],200,00,0)
		guiLabelSetVerticalAlign(gLabel[15],"top")
		guiLabelSetHorizontalAlign(gLabel[15],"left",false)
		guiSetFont(gLabel[15],"default-bold-small")
		
		triggerServerEvent ( "getMarketValues", lp )
	end
)

function refreshMarketValues_func ( curDrugOffers, curMatsOffers, curVehOffers, curHousesOffers, curPrestigeOffers, curGaragesOffers, curSpecialOffers )

	curDrugOffers = formatForAuktion ( curDrugOffers )
	curMatsOffers = formatForAuktion ( curMatsOffers )
	curVehOffers = formatForAuktion ( curVehOffers )
	curHousesOffers = formatForAuktion ( curHousesOffers )
	curPrestigeOffers = formatForAuktion ( curPrestigeOffers )
	curGaragesOffers = formatForAuktion ( curGaragesOffers )
	curSpecialOffers = formatForAuktion ( curSpecialOffers )
	
	for i = 1, 7 do
		destroyElement ( gButton[i] )
	end
	
	gButton[1] = guiCreateButton(112,220,89,41,"Fahrzeuge",false,img)
	gButton[2] = guiCreateButton(303,207,89,41,"SPEZIAL",false,img)
	gButton[3] = guiCreateButton(13,196,89,41,"Drogen",false,img)
	gButton[4] = guiCreateButton(13,244,89,41,"Materialien",false,img)
	gButton[5] = guiCreateButton(208,162,89,41,"Haeuser",false,img)
	gButton[6] = guiCreateButton(208,207,89,41,"Prestige",false,img)
	gButton[7] = guiCreateButton(208,252,89,41,"Garagen",false,img)
	buyItLink ( gButton[1], "Fahrzeug" )
	buyItLink ( gButton[2], "Nicht moeglich" )
	buyItLink ( gButton[3], "Drogen" )
	buyItLink ( gButton[4], "Materialien" )
	buyItLink ( gButton[5], "Haus" )
	buyItLink ( gButton[6], "Prestige Objekt" )
	buyItLink ( gButton[7], "Garage" )
	
	gLabel[9] = guiCreateLabel(73,24,15,16,curVehOffers,false,gButton[1])
	guiLabelSetColor(gLabel[9],200,00,0)
	guiLabelSetVerticalAlign(gLabel[9],"top")
	guiLabelSetHorizontalAlign(gLabel[9],"left",false)
	guiSetFont(gLabel[9],"default-bold-small")
	gLabel[10] = guiCreateLabel(73,24,15,16,curSpecialOffers,false,gButton[2])
	guiLabelSetColor(gLabel[10],200,00,0)
	guiLabelSetVerticalAlign(gLabel[10],"top")
	guiLabelSetHorizontalAlign(gLabel[10],"left",false)
	guiSetFont(gLabel[10],"default-bold-small")
	gLabel[11] = guiCreateLabel(73,24,15,16,curDrugOffers,false,gButton[3])
	guiLabelSetColor(gLabel[11],200,00,0)
	guiLabelSetVerticalAlign(gLabel[11],"top")
	guiLabelSetHorizontalAlign(gLabel[11],"left",false)
	guiSetFont(gLabel[11],"default-bold-small")
	gLabel[12] = guiCreateLabel(73,24,15,16,curMatsOffers,false,gButton[4])
	guiLabelSetColor(gLabel[12],200,00,0)
	guiLabelSetVerticalAlign(gLabel[12],"top")
	guiLabelSetHorizontalAlign(gLabel[12],"left",false)
	guiSetFont(gLabel[12],"default-bold-small")
	gLabel[13] = guiCreateLabel(73,24,15,16,curHousesOffers,false,gButton[5])
	guiLabelSetColor(gLabel[13],200,00,0)
	guiLabelSetVerticalAlign(gLabel[13],"top")
	guiLabelSetHorizontalAlign(gLabel[13],"left",false)
	guiSetFont(gLabel[13],"default-bold-small")
	gLabel[14] = guiCreateLabel(73,24,15,16,curPrestigeOffers,false,gButton[6])
	guiLabelSetColor(gLabel[14],200,00,0)
	guiLabelSetVerticalAlign(gLabel[14],"top")
	guiLabelSetHorizontalAlign(gLabel[14],"left",false)
	guiSetFont(gLabel[14],"default-bold-small")
	gLabel[15] = guiCreateLabel(73,24,15,16,curGaragesOffers,false,gButton[7])
	guiLabelSetColor(gLabel[15],200,00,0)
	guiLabelSetVerticalAlign(gLabel[15],"top")
	guiLabelSetHorizontalAlign(gLabel[15],"left",false)
	guiSetFont(gLabel[15],"default-bold-small")
end
addEvent ( "refreshMarketValues", true )
addEventHandler ( "refreshMarketValues", getRootElement(), refreshMarketValues_func )

function formatForAuktion ( string )

	local string = tostring ( string )
	if #string <= 1 then
		string = "  "..string
	end
	return string
end

function buyItLink ( object, string )

	addEventHandler("onClientGUIClick", object, 
		function ( btn, state )
			if state == "up" then
				auktionOffer = string
				local sell = guiRadioButtonGetSelected ( gRadio[2] )
				if sell then
					if string == "Nicht moeglich" then
						outputChatBox ( "Hier koennen nur Administratoren etwas verkaufen!", 125, 0, 0 )
					else
						showWebbrowser ( "buyit.com/sell" )
					end
				else
					showWebbrowser ( "buyit.com/buy" )
				end
			end
		end,
	false)
end