function wDealerWindow()

	if gWindow["waffendealer"] then
		guiSetVisible ( gWindow["waffendealer"], true )
	else
		local screenwidth, screenheight = guiGetScreenSize ()
		
		gWindow["waffendealer"] = guiCreateWindow(screenwidth/2-365/2,145,365,399,"Waffen Menue",false)
		guiSetAlpha(gWindow["waffendealer"],1)
		gLabel["waffenname"] = guiCreateLabel(50,30,76,14,"Waffenname",false,gWindow["waffendealer"])
		guiSetAlpha(gLabel["waffenname"],1)
		guiLabelSetColor(gLabel["waffenname"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["waffenname"],"top")
		guiLabelSetHorizontalAlign(gLabel["waffenname"],"left",false)
		guiSetFont(gLabel["waffenname"],"default-bold-small")
		gLabel["materialkosten"] = guiCreateLabel(165,29,88,15,"Materialkosten",false,gWindow["waffendealer"])
		guiSetAlpha(gLabel["materialkosten"],1)
		guiLabelSetColor(gLabel["materialkosten"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["materialkosten"],"top")
		guiLabelSetHorizontalAlign(gLabel["materialkosten"],"left",false)
		guiSetFont(gLabel["materialkosten"],"default-bold-small")
		gLabel["kosten9mmsd"] = guiCreateLabel(191,61,77,13,"10",false,gWindow["waffendealer"])
		guiSetAlpha(gLabel["kosten9mmsd"],1)
		guiLabelSetColor(gLabel["kosten9mmsd"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["kosten9mmsd"],"top")
		guiLabelSetHorizontalAlign(gLabel["kosten9mmsd"],"left",false)
		
		gButton["verkaufen"] = guiCreateButton(73,354,102,20,"Verkaufen",false,gWindow["waffendealer"])
		guiSetAlpha(gButton["verkaufen"],1)
		gButton["WDealerAbbrechen"] = guiCreateButton(200,354,102,20,"Abbrechen",false,gWindow["waffendealer"])
		guiSetAlpha(gButton["WDealerAbbrechen"],1)		
		
		addEventHandler("onClientGUIClick", gButton["WDealerAbbrechen"], SubmitWDealerAbbrechenBtn, false)
		addEventHandler("onClientGUIClick", gButton["verkaufen"], SubmitSellgun, false)
		
		gLabel["kosten9mm"] = guiCreateLabel(193,87,77,13,"7",false,gWindow["waffendealer"])
		guiSetAlpha(gLabel["kosten9mm"],1)
		guiLabelSetColor(gLabel["kosten9mm"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["kosten9mm"],"top")
		guiLabelSetHorizontalAlign(gLabel["kosten9mm"],"left",false)
		gLabel["munition"] = guiCreateLabel(287,29,55,13,"Munition",false,gWindow["waffendealer"])
		guiSetAlpha(gLabel["munition"],1)
		guiLabelSetColor(gLabel["munition"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["munition"],"top")
		guiLabelSetHorizontalAlign(gLabel["munition"],"left",false)
		guiSetFont(gLabel["munition"],"default-bold-small")
		
		gLabel["munition9mmsd"] = guiCreateLabel(301,61,48,13,"0",false,gWindow["waffendealer"])
		guiSetAlpha(gLabel["munition9mmsd"],1)
		guiLabelSetColor(gLabel["munition9mmsd"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["munition9mmsd"],"top")
		guiLabelSetHorizontalAlign(gLabel["munition9mmsd"],"left",false)
		gLabel["munition9mm"] = guiCreateLabel(301,87,55,14,"0",false,gWindow["waffendealer"])
		guiSetAlpha(gLabel["munition9mm"],1)
		guiLabelSetColor(gLabel["munition9mm"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["munition9mm"],"top")
		guiLabelSetHorizontalAlign(gLabel["munition9mm"],"left",false)
		gLabel["kostendeserteagle"] = guiCreateLabel(193,112,77,13,"12",false,gWindow["waffendealer"])
		guiSetAlpha(gLabel["kostendeserteagle"],1)
		guiLabelSetColor(gLabel["kostendeserteagle"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["kostendeserteagle"],"top")
		guiLabelSetHorizontalAlign(gLabel["kostendeserteagle"],"left",false)
		gLabel["munitiondeserteagle"] = guiCreateLabel(301,110,50,15,"0",false,gWindow["waffendealer"])
		guiSetAlpha(gLabel["munitiondeserteagle"],1)
		guiLabelSetColor(gLabel["munitiondeserteagle"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["munitiondeserteagle"],"top")
		guiLabelSetHorizontalAlign(gLabel["munitiondeserteagle"],"left",false)
		gLabel["kostenshotgun"] = guiCreateLabel(193,136,77,13,"10",false,gWindow["waffendealer"])
		guiSetAlpha(gLabel["kostenshotgun"],1)
		guiLabelSetColor(gLabel["kostenshotgun"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["kostenshotgun"],"top")
		guiLabelSetHorizontalAlign(gLabel["kostenshotgun"],"left",false)
		gLabel["munitionshotgun"] = guiCreateLabel(301,135,46,13,"0",false,gWindow["waffendealer"])
		guiSetAlpha(gLabel["munitionshotgun"],1)
		guiLabelSetColor(gLabel["munitionshotgun"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["munitionshotgun"],"top")
		guiLabelSetHorizontalAlign(gLabel["munitionshotgun"],"left",false)
		gLabel["kostenmp5"] = guiCreateLabel(193,160,77,13,"14",false,gWindow["waffendealer"])
		guiSetAlpha(gLabel["kostenmp5"],1)
		guiLabelSetColor(gLabel["kostenmp5"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["kostenmp5"],"top")
		guiLabelSetHorizontalAlign(gLabel["kostenmp5"],"left",false)
		gLabel["munitionmp5"] = guiCreateLabel(301,160,44,13,"0",false,gWindow["waffendealer"])
		guiSetAlpha(gLabel["munitionmp5"],1)
		guiLabelSetColor(gLabel["munitionmp5"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["munitionmp5"],"top")
		guiLabelSetHorizontalAlign(gLabel["munitionmp5"],"left",false)
		gLabel["kostenmesser"] = guiCreateLabel(193,184,77,13,"3",false,gWindow["waffendealer"])
		guiSetAlpha(gLabel["kostenmesser"],1)
		guiLabelSetColor(gLabel["kostenmesser"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["kostenmesser"],"top")
		guiLabelSetHorizontalAlign(gLabel["kostenmesser"],"left",false)
		gLabel["testeR"] = guiCreateLabel(301,185,43,13,"0",false,gWindow["waffendealer"])
		guiSetAlpha(gLabel["testeR"],1)
		guiLabelSetColor(gLabel["testeR"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["testeR"],"top")
		guiLabelSetHorizontalAlign(gLabel["testeR"],"left",false)
		gLabel["kostengewehr"] = guiCreateLabel(193,206,77,13,"10",false,gWindow["waffendealer"])
		guiSetAlpha(gLabel["kostengewehr"],1)
		guiLabelSetColor(gLabel["kostengewehr"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["kostengewehr"],"top")
		guiLabelSetHorizontalAlign(gLabel["kostengewehr"],"left",false)
		gLabel["munitiongewehr"] = guiCreateLabel(301,207,46,13,"0",false,gWindow["waffendealer"])
		guiSetAlpha(gLabel["munitiongewehr"],1)
		guiLabelSetColor(gLabel["munitiongewehr"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["munitiongewehr"],"top")
		guiLabelSetHorizontalAlign(gLabel["munitiongewehr"],"left",false)
		gLabel["kostenak47"] = guiCreateLabel(193,229,77,13,"20",false,gWindow["waffendealer"])
		guiSetAlpha(gLabel["kostenak47"],1)
		guiLabelSetColor(gLabel["kostenak47"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["kostenak47"],"top")
		guiLabelSetHorizontalAlign(gLabel["kostenak47"],"left",false)
		gLabel["munitionak47"] = guiCreateLabel(301,228,54,13,"0",false,gWindow["waffendealer"])
		guiSetAlpha(gLabel["munitionak47"],1)
		guiLabelSetColor(gLabel["munitionak47"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["munitionak47"],"top")
		guiLabelSetHorizontalAlign(gLabel["munitionak47"],"left",false)
		gEdit["munitionmaterialien"] = guiCreateEdit(282,266,59,21,"",false,gWindow["waffendealer"])
		guiSetAlpha(gEdit["munitionmaterialien"],1)
		gLabel["kostenmaterialen"] = guiCreateLabel(196,270,77,13,"-",false,gWindow["waffendealer"])
		guiSetAlpha(gLabel["kostenmaterialen"],1)
		guiLabelSetColor(gLabel["kostenmaterialen"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["kostenmaterialen"],"top")
		guiLabelSetHorizontalAlign(gLabel["kostenmaterialen"],"left",false)
		
		gRadio["9mmsd"] = guiCreateRadioButton(26,63,100,15,"9mm Schallgedaempft",false,gWindow["waffendealer"])
		guiSetAlpha(gRadio["9mmsd"],1)
		guiRadioButtonSetSelected(gRadio["9mmsd"],true)
		gRadio["9mm"] = guiCreateRadioButton(26,88,100,15,"9mm",false,gWindow["waffendealer"])
		guiSetAlpha(gRadio["9mm"],1)
		gRadio["deserteagle"] = guiCreateRadioButton(26,113,100,15,"Desert Eagle",false,gWindow["waffendealer"])
		guiSetAlpha(gRadio["deserteagle"],1)
		gRadio["shotgun"] = guiCreateRadioButton(26,137,100,15,"Shotgun",false,gWindow["waffendealer"])
		guiSetAlpha(gRadio["shotgun"],1)
		gRadio["gewehr"] = guiCreateRadioButton(26,207,100,15,"Gewehr",false,gWindow["waffendealer"])
		guiSetAlpha(gRadio["gewehr"],1)
		gRadio["messer"] = guiCreateRadioButton(26,184,100,15,"Messer",false,gWindow["waffendealer"])
		guiSetAlpha(gRadio["messer"],1)
		gRadio["ak47"] = guiCreateRadioButton(26,230,70,15,"AK-47",false,gWindow["waffendealer"])
		guiSetAlpha(gRadio["ak47"],1)
		gRadio["materialien"] = guiCreateRadioButton(26,269,100,15,"Materialien",false,gWindow["waffendealer"])
		guiSetAlpha(gRadio["materialien"],1)
		gRadio["mp5"] = guiCreateRadioButton(26,161,70,15,"MP5",false,gWindow["waffendealer"])
		guiSetAlpha(gRadio["mp5"],1)
	end
end

function SubmitSellgun ()

	local ammo = 0
	if guiRadioButtonGetSelected(gRadio["9mmsd"] ) then
		gun = "9mmsd"
	elseif guiRadioButtonGetSelected(gRadio["9mm"] ) then
		gun = "9mm"
	elseif guiRadioButtonGetSelected(gRadio["deserteagle"] ) then
		gun = "eagle"
	elseif guiRadioButtonGetSelected(gRadio["shotgun"] ) then
		gun = "shotgun"
	elseif guiRadioButtonGetSelected(gRadio["mp5"] ) then
		gun = "mp5"
	elseif guiRadioButtonGetSelected(gRadio["messer"] ) then
		gun = "messer"
	elseif guiRadioButtonGetSelected(gRadio["gewehr"] ) then
		gun = "gewehr"
	elseif guiRadioButtonGetSelected(gRadio["ak47"] ) then
		gun = "ak47"
	elseif guiRadioButtonGetSelected(gRadio["materialien"] ) then
		gun = "mats"
		ammo = tonumber ( guiGetText ( gEdit["munitionmaterialien"] ) )
	end
	local target = vnxClientGetElementData ( "curclicked" )
	triggerServerEvent ( "sellgun", localPlayer, localPlayer, "haha", target, gun, ammo )
end

function SubmitWDealerAbbrechenBtn ()

	guiSetVisible(gWindow["waffendealer"],false)
end