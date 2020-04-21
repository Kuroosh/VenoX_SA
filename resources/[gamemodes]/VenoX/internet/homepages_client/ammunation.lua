local maindomane = "ammunation.net"
Domanes["www.ammunation.net"] = maindomane
Domanes["www.ammunation.com"] = maindomane

Domanes["www.ammu-nation.net"] = maindomane
Domanes["www.ammu-nation.com"] = maindomane

Domanes["www.ammunation"] = maindomane
Domanes["ammunation"] = maindomane
Domanes["ammunation.com"] = maindomane
Domanes["ammunation.net"] = maindomane

Domanes["www.guns.net"] = maindomane
Domanes["www.guns.com"] = maindomane

function ammunation_func ()

	-- Zum aufrufen einer neuen Seite die Alte löschen & neu erstellen --
	local img = createBasicPage ( "white" )
	-- Die Seite erstellen, jeweils img als Root!!! --
	gImage["ammunationOptic"] = guiCreateStaticImage(271,0,5,55,"images/colors/c_red.jpg",false,img)
	guiSetAlpha(gImage["ammunationOptic"],1)
	gImage["ammunationOptic"] = guiCreateStaticImage(0,58,114,241,"images/colors/c_grey.jpg",false,img)
	guiSetAlpha(gImage["ammunationOptic"],1)
	gImage["ammunationOptic"] = guiCreateStaticImage(114,53,5,246,"images/colors/c_red.jpg",false,img)
	guiSetAlpha(gImage["ammunationOptic"],1)
	gImage["ammunationOptic"] = guiCreateStaticImage(237,56,5,243,"images/colors/c_red.jpg",false,img)
	guiSetAlpha(gImage["ammunationOptic"],1)
	gImage["ammunationOpticMid"] = guiCreateStaticImage(119,58,118,241,"images/colors/c_grey.jpg",false,img)
	guiSetAlpha(gImage["ammunationOpticMid"],1)
	gImage["ammunationOptic"] = guiCreateStaticImage(0,53,400,5,"images/colors/c_red.jpg",false,img)
	guiSetAlpha(gImage["ammunationOptic"],1)
	gImage["ammunationOptic"] = guiCreateStaticImage(242,58,158,241,"images/colors/c_grey.jpg",false,img)
	guiSetAlpha(gImage["ammunationOptic"],1)
	
	gImage["ammunationLogo"] = guiCreateStaticImage(1,2,160,32,"images/internet/ammunation.bmp",false,img)
	guiSetAlpha(gImage["ammunationLogo"],1)
	
	gLabel["ammunationText1"] = guiCreateLabel(18,34,130,21,"Protecting your rights!",false,img)
	guiSetAlpha(gLabel["ammunationText1"],1)
	guiLabelSetColor(gLabel["ammunationText1"],000,000,000)
	guiLabelSetVerticalAlign(gLabel["ammunationText1"],"top")
	guiLabelSetHorizontalAlign(gLabel["ammunationText1"],"left",false)
	guiSetFont(gLabel["ammunationText1"],"default-bold-small")
	gLabel["ammunationText2"] = guiCreateLabel(203,4,67,15,"Warenkorb:",false,img)
	guiSetAlpha(gLabel["ammunationText2"],1)
	guiLabelSetColor(gLabel["ammunationText2"],100,000,000)
	guiLabelSetVerticalAlign(gLabel["ammunationText2"],"top")
	guiLabelSetHorizontalAlign(gLabel["ammunationText2"],"left",false)
	guiSetFont(gLabel["ammunationText2"],"default-bold-small")
	gLabel["ammunationText3"] = guiCreateLabel(285,5,76,18,"0 Objekte",false,img)
	guiSetAlpha(gLabel["ammunationText3"],1)
	guiLabelSetColor(gLabel["ammunationText3"],000,000,000)
	guiLabelSetVerticalAlign(gLabel["ammunationText3"],"top")
	guiLabelSetHorizontalAlign(gLabel["ammunationText3"],"left",false)
	guiSetFont(gLabel["ammunationText3"],"default-bold-small")
	gLabel["ammunationTotalCost"] = guiCreateLabel(351,5,100,19,"0 $",false,img)
	guiSetAlpha(gLabel["ammunationTotalCost"],1)
	guiLabelSetColor(gLabel["ammunationTotalCost"],000,125,000)
	guiLabelSetVerticalAlign(gLabel["ammunationTotalCost"],"top")
	guiLabelSetHorizontalAlign(gLabel["ammunationTotalCost"],"left",false)
	guiSetFont(gLabel["ammunationTotalCost"],"default-bold-small")
	
	gLabel["ammunationText4"] = guiCreateLabel(280,27,116,15,"zzg. 500 $ Lieferungskosten",false,img)
	guiSetAlpha(gLabel["ammunationText4"],1)
	guiLabelSetColor(gLabel["ammunationText4"],000,000,000)
	guiLabelSetVerticalAlign(gLabel["ammunationText4"],"top")
	guiLabelSetHorizontalAlign(gLabel["ammunationText4"],"left",false)
	guiSetFont(gLabel["ammunationText4"],"default-small")
	
	gLabel["ammunationText4"] = guiCreateLabel(40,59,76,22,"Waffen:",false,img)
	guiSetAlpha(gLabel["ammunationText4"],1)
	guiLabelSetColor(gLabel["ammunationText4"],000,000,000)
	guiLabelSetVerticalAlign(gLabel["ammunationText4"],"top")
	guiLabelSetHorizontalAlign(gLabel["ammunationText4"],"left",false)
	guiSetFont(gLabel["ammunationText4"],"default-bold-small")
	
	
	-- WAFFEN --
	gCheck["ammunationPistol"] = guiCreateCheckBox(4,83,100,17,"9mm: "..pistol_gunshop_price.."$",false,false,img)
	guiSetAlpha(gCheck["ammunationPistol"],1)
	guiCheckBoxSetSelected(gCheck["ammunationPistol"],false)
	guiSetFont(gCheck["ammunationPistol"],"default-bold-small")
	
	gCheck["ammunationDeagle"] = guiCreateCheckBox(4,112,100,17,"Deagle: "..eagle_gunshop_price.."$",false,false,img)
	guiSetAlpha(gCheck["ammunationDeagle"],1)
	guiCheckBoxSetSelected(gCheck["ammunationDeagle"],false)
	guiSetFont(gCheck["ammunationDeagle"],"default-bold-small")
	
	gCheck["ammunationShotgun"] = guiCreateCheckBox(4,141,100,17,"Shotgun: "..shotgun_gunshop_price.."$",false,false,img)
	guiSetAlpha(gCheck["ammunationShotgun"],1)
	guiCheckBoxSetSelected(gCheck["ammunationShotgun"],false)
	guiSetFont(gCheck["ammunationShotgun"],"default-bold-small")
	
	gCheck["ammunationMP5"] = guiCreateCheckBox(4,170,100,17,"MP5: "..mp_gunshop_price.."$",false,false,img)
	guiSetAlpha(gCheck["ammunationMP5"],1)
	guiCheckBoxSetSelected(gCheck["ammunationMP5"],false)
	guiSetFont(gCheck["ammunationMP5"],"default-bold-small")
	
	gCheck["ammunationAK-47"] = guiCreateCheckBox(4,199,100,17,"AK-47: "..ak_gunshop_price.."$",false,false,img)
	guiSetAlpha(gCheck["ammunationAK-47"],1)
	guiCheckBoxSetSelected(gCheck["ammunationAK-47"],false)
	guiSetFont(gCheck["ammunationAK-47"],"default-bold-small")
	
	gCheck["ammunationM4"] = guiCreateCheckBox(4,228,100,17,"M4: "..m_gunshop_price.."$",false,false,img)
	guiSetAlpha(gCheck["ammunationM4"],1)
	guiCheckBoxSetSelected(gCheck["ammunationM4"],false)
	guiSetFont(gCheck["ammunationM4"],"default-bold-small")
	
	gCheck["ammunationGewehr"] = guiCreateCheckBox(4,257,100,17,"Gewehr: "..gewehr_gunshop_price.."$",false,false,img)
	guiSetAlpha(gCheck["ammunationGewehr"],1)
	guiCheckBoxSetSelected(gCheck["ammunationGewehr"],false)
	guiSetFont(gCheck["ammunationGewehr"],"default-bold-small")
	-- WAFFEN --
	addEventHandler("onClientGUIChanged", img, 
		function ( element ) 
			if getElementType ( element ) == "gui-edit" then
				guiBringToFront ( gLabel["ammunationText5"] )
				if not tonumber ( guiGetText ( element ) ) then
					guiSetText ( element, "0" )
				else
					recalcObjects ()
				end
			end
		end
	)
	
	-- MUNITION --
	gLabel["ammunationText5"] = guiCreateLabel(139,59,76,22,"Munition:",false,img)
	guiSetAlpha(gLabel["ammunationText5"],1)
	guiLabelSetColor(gLabel["ammunationText5"],0,0,0)
	guiLabelSetVerticalAlign(gLabel["ammunationText5"],"top")
	guiLabelSetHorizontalAlign(gLabel["ammunationText5"],"left",false)
	guiSetFont(gLabel["ammunationText5"],"default-bold-small")
	
	local part = "9mm"
	gEdit["ammunation"..part.."Ammo"] = guiCreateEdit(4,24,34,20,"0",false,gImage["ammunationOpticMid"])
	gLabel["ammunation"..part.."Ammo"] = guiCreateLabel(40,25,77,19,"9mm: "..pistolammo_gunshop_price.."$",false,gImage["ammunationOpticMid"])
	guiLabelSetColor(gLabel["ammunation"..part.."Ammo"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["ammunation"..part.."Ammo"],"top")
	guiLabelSetHorizontalAlign(gLabel["ammunation"..part.."Ammo"],"left",false)
	guiSetFont(gLabel["ammunation"..part.."Ammo"],"default-bold-small")
	local part = "Eagle"
	gEdit["ammunation"..part.."Ammo"] = guiCreateEdit(4,24+29*1,34,20,"0",false,gImage["ammunationOpticMid"])
	gLabel["ammunation"..part.."Ammo"] = guiCreateLabel(40,25+29*1,77,19,"Cal.50: "..eagleammo_gunshop_price.."$",false,gImage["ammunationOpticMid"])
	guiLabelSetColor(gLabel["ammunation"..part.."Ammo"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["ammunation"..part.."Ammo"],"top")
	guiLabelSetHorizontalAlign(gLabel["ammunation"..part.."Ammo"],"left",false)
	guiSetFont(gLabel["ammunation"..part.."Ammo"],"default-bold-small")
	local part = "Schrot"
	gEdit["ammunation"..part.."Ammo"] = guiCreateEdit(4,24+29*2,34,20,"0",false,gImage["ammunationOpticMid"])
	gLabel["ammunation"..part.."Ammo"] = guiCreateLabel(40,25+29*2,77,19,"Schrot: "..shotgunammo_gunshop_price.."$",false,gImage["ammunationOpticMid"])
	guiLabelSetColor(gLabel["ammunation"..part.."Ammo"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["ammunation"..part.."Ammo"],"top")
	guiLabelSetHorizontalAlign(gLabel["ammunation"..part.."Ammo"],"left",false)
	guiSetFont(gLabel["ammunation"..part.."Ammo"],"default-bold-small")
	local part = "MP5"
	gEdit["ammunation"..part.."Ammo"] = guiCreateEdit(4,24+29*3,34,20,"0",false,gImage["ammunationOpticMid"])
	gLabel["ammunation"..part.."Ammo"] = guiCreateLabel(40,25+29*3,77,19,"MP5: "..mpammo_gunshop_price.."$",false,gImage["ammunationOpticMid"])
	guiLabelSetColor(gLabel["ammunation"..part.."Ammo"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["ammunation"..part.."Ammo"],"top")
	guiLabelSetHorizontalAlign(gLabel["ammunation"..part.."Ammo"],"left",false)
	guiSetFont(gLabel["ammunation"..part.."Ammo"],"default-bold-small")
	local part = "AK"
	gEdit["ammunation"..part.."Ammo"] = guiCreateEdit(4,24+29*4,34,20,"0",false,gImage["ammunationOpticMid"])
	gLabel["ammunation"..part.."Ammo"] = guiCreateLabel(40,25+29*4,77,19,"AK-47: "..akammo_gunshop_price.."$",false,gImage["ammunationOpticMid"])
	guiLabelSetColor(gLabel["ammunation"..part.."Ammo"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["ammunation"..part.."Ammo"],"top")
	guiLabelSetHorizontalAlign(gLabel["ammunation"..part.."Ammo"],"left",false)
	guiSetFont(gLabel["ammunation"..part.."Ammo"],"default-bold-small")
	local part = "M4"
	gEdit["ammunation"..part.."Ammo"] = guiCreateEdit(4,24+29*5,34,20,"0",false,gImage["ammunationOpticMid"])
	gLabel["ammunation"..part.."Ammo"] = guiCreateLabel(40,25+29*5,77,19,"M4: "..mammo_gunshop_price.."$",false,gImage["ammunationOpticMid"])
	guiLabelSetColor(gLabel["ammunation"..part.."Ammo"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["ammunation"..part.."Ammo"],"top")
	guiLabelSetHorizontalAlign(gLabel["ammunation"..part.."Ammo"],"left",false)
	guiSetFont(gLabel["ammunation"..part.."Ammo"],"default-bold-small")
	local part = "Gewehr"
	gEdit["ammunation"..part.."Ammo"] = guiCreateEdit(4,24+29*6,34,20,"0",false,gImage["ammunationOpticMid"])
	gLabel["ammunation"..part.."Ammo"] = guiCreateLabel(40,25+29*6,77,19,"Patronen: "..gewehrammo_gunshop_price.."$",false,gImage["ammunationOpticMid"])
	guiLabelSetColor(gLabel["ammunation"..part.."Ammo"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["ammunation"..part.."Ammo"],"top")
	guiLabelSetHorizontalAlign(gLabel["ammunation"..part.."Ammo"],"left",false)
	guiSetFont(gLabel["ammunation"..part.."Ammo"],"default-bold-small")
	-- MUNITION --
	
	
	-- AUSRÜSTUNG --
	gLabel["ammunationText6"] = guiCreateLabel(288,59,76,22,"Equipment:",false,img)
	guiSetAlpha(gLabel["ammunationText6"],1)
	guiLabelSetColor(gLabel["ammunationText6"],0,0,0)
	guiLabelSetVerticalAlign(gLabel["ammunationText6"],"top")
	guiLabelSetHorizontalAlign(gLabel["ammunationText6"],"left",false)
	guiSetFont(gLabel["ammunationText6"],"default-bold-small")
	
	gCheck["ammunationArmor"] = guiCreateCheckBox(243,83,150,17,"Schutzweste: "..armor_gunshop_price.."$",false,false,img)
	guiSetFont(gCheck["ammunationArmor"],"default-bold-small")
	gCheck["ammunationNVG"] = guiCreateCheckBox(243,112,150,17,"Nachtsicht "..nvgoogles_price.."$",false,false,img)
	guiSetFont(gCheck["ammunationNVG"],"default-bold-small")
	gCheck["ammunationWVG"] = guiCreateCheckBox(243,141,150,17,"Waermesicht: "..tgoogles_price.."$",false,false,img)
	guiSetFont(gCheck["ammunationWVG"],"default-bold-small")
	-- AUSRÜSTUNG --
	
	addEventHandler("onClientGUIClick", img, 
		function ( btn, state )
			if state == "up" then
				recalcObjects ()
			end
		end
	)
	
	gButton["ammunationPay"] = guiCreateButton(213,25,48,24,"Zur Kasse",false,img)
	guiSetAlpha(gButton["ammunationPay"],1)
	guiSetFont(gButton["ammunationPay"],"default-small")
	addEventHandler("onClientGUIClick", gButton["ammunationPay"],
		function ( btn, state )
			if state == "up" then
				recalcObjects ()
				if ( ammunationOrderPistol == 1 and ammunationOrderPistolAmmo > 0 ) or ( getPedWeapon ( lp, 2 ) == 22 and ammunationOrderPistolAmmo > 0 ) or ammunationOrderPistolAmmo == 0 then
					if ( ammunationOrderDeagle == 1 and ammunationOrderDeagleAmmo > 0 ) or ( getPedWeapon ( lp, 2 ) == 24 and ammunationOrderDeagleAmmo > 0 ) or ammunationOrderDeagleAmmo == 0 then
						if ( ammunationOrderShotty == 1 and ammunationOrderShottyAmmo > 0 ) or ( getPedWeapon ( lp, 3 ) == 25 and ammunationOrderShottyAmmo > 0 ) or ammunationOrderShottyAmmo == 0 then
							if ( ammunationOrderMP == 1 and ammunationOrderMPAmmo > 0 ) or ( getPedWeapon ( lp, 4 ) == 29 and ammunationOrderMPAmmo > 0 ) or ammunationOrderMPAmmo == 0 then
								if ( ammunationOrderAK == 1 and ammunationOrderAKAmmo > 0 ) or ( getPedWeapon ( lp, 5 ) == 30 and ammunationOrderAKAmmo > 0 ) or ammunationOrderAKAmmo == 0 then
									if ( ammunationOrderM == 1 and ammunationOrderMAmmo > 0 ) or ( getPedWeapon ( lp, 5 ) == 31 and ammunationOrderMAmmo > 0 ) or ammunationOrderMAmmo == 0 then
										if ( ammunationOrderG == 1 and ammunationOrderGAmmo > 0 ) or ( getPedWeapon ( lp, 6 ) == 33 and ammunationOrderGAmmo > 0 ) or ammunationOrderGAmmo == 0 then
											triggerServerEvent ( "ammunationOnlineDeliver", lp, totalCosts, 
											ammunationOrderPistol, ammunationOrderDeagle, ammunationOrderShotty,ammunationOrderMP, ammunationOrderAK, ammunationOrderM, ammunationOrderG, ammunationOrderMP, ammunationOrderAK, ammunationOrderM, ammunationOrderG, ammunationOrderNVG, ammunationOrderWVG, ammunationOrderArmor, ammunationOrderPistolAmmo, ammunationOrderDeagleAmmo, ammunationOrderShottyAmmo, ammunationOrderMPAmmo, ammunationOrderAKAmmo, ammunationOrderMAmmo, ammunationOrderGAmmo )
											return nil
										end
									end
								end
							end
						end
					end
				end
				outputChatBox ( "Du kannst nur Munnition fuer Waffen bestellen, die du auch besitzt bzw. bestellst!", 125, 0, 0 )
			end
		end,
	false)
end
addEvent ( maindomane, true )
addEventHandler ( maindomane, getRootElement(), ammunation_func )

function recalcObjects ()

	totalCosts = 0
	local totalObjects = 0
	
	
	ammunationOrderPistol = 0
	ammunationOrderDeagle = 0
	ammunationOrderShotty = 0
	ammunationOrderMP = 0
	ammunationOrderAK = 0
	ammunationOrderM = 0
	ammunationOrderG = 0
	ammunationOrderMP = 0
	ammunationOrderAK = 0
	ammunationOrderM = 0
	ammunationOrderG = 0
	ammunationOrderNVG = 0
	ammunationOrderArmor = 0
	ammunationOrderPistolAmmo = 0
	ammunationOrderDeagleAmmo = 0
	ammunationOrderShottyAmmo = 0
	ammunationOrderMPAmmo = 0
	ammunationOrderAKAmmo = 0
	ammunationOrderMAmmo = 0
	ammunationOrderGAmmo = 0
	ammunationOrderWVG = 0
	
	if guiCheckBoxGetSelected ( gCheck["ammunationPistol"] ) then
		ammunationOrderPistol = 1
		totalCosts = totalCosts + pistol_gunshop_price
		totalObjects = totalObjects + 1
		guiCheckBoxSetSelected ( gCheck["ammunationDeagle"], false )
	end
	if guiCheckBoxGetSelected ( gCheck["ammunationDeagle"] ) then
		ammunationOrderDeagle = 1
		totalCosts = totalCosts + eagle_gunshop_price
		totalObjects = totalObjects + 1
	end
	if guiCheckBoxGetSelected ( gCheck["ammunationShotgun"] ) then
		ammunationOrderShotty = 1
		totalCosts = totalCosts + shotgun_gunshop_price
		totalObjects = totalObjects + 1
	end
	if guiCheckBoxGetSelected ( gCheck["ammunationMP5"] ) then
		ammunationOrderMP = 1
		totalCosts = totalCosts + mp_gunshop_price
		totalObjects = totalObjects + 1
	end
	if guiCheckBoxGetSelected ( gCheck["ammunationAK-47"] ) then
		ammunationOrderAK = 1
		totalCosts = totalCosts + ak_gunshop_price
		totalObjects = totalObjects + 1
		guiCheckBoxSetSelected ( gCheck["ammunationM4"], false )
	end
	if guiCheckBoxGetSelected ( gCheck["ammunationM4"] ) then
		ammunationOrderM = 1
		totalCosts = totalCosts + m_gunshop_price
		totalObjects = totalObjects + 1
	end
	if guiCheckBoxGetSelected ( gCheck["ammunationGewehr"] ) then
		ammunationOrderG = 1
		totalCosts = totalCosts + gewehr_gunshop_price
		totalObjects = totalObjects + 1
	end
	if guiCheckBoxGetSelected ( gCheck["ammunationNVG"] ) then
		ammunationOrderNVG = 1
		totalCosts = totalCosts + nvgoogles_price
		totalObjects = totalObjects + 1
		guiCheckBoxSetSelected ( gCheck["ammunationWVG"], false )
		guiCheckBoxSetSelected ( gCheck["ammunationWVG"], false )
	end
	if guiCheckBoxGetSelected ( gCheck["ammunationWVG"] ) then
		ammunationOrderWVG = 1
		totalCosts = totalCosts + tgoogles_price
		totalObjects = totalObjects + 1
		guiCheckBoxSetSelected ( gCheck["ammunationNVG"], false )
	end
	if guiCheckBoxGetSelected ( gCheck["ammunationArmor"] ) then
		ammunationOrderArmor = 1
		totalCosts = totalCosts + armor_gunshop_price
		totalObjects = totalObjects + 1
	end
	
	
	local amount = tonumber ( guiGetText ( gEdit["ammunation9mmAmmo"] ) )
	if amount >= 1 then
		ammunationOrderPistolAmmo = amount
		totalObjects = totalObjects + amount
		totalCosts = totalCosts + pistolammo_gunshop_price * amount
	end
	local amount = tonumber ( guiGetText ( gEdit["ammunationEagleAmmo"] ) )
	if amount >= 1 then
		ammunationOrderDeagleAmmo = amount
		totalObjects = totalObjects + amount
		totalCosts = totalCosts + eagleammo_gunshop_price * amount
	end
	local amount = tonumber ( guiGetText ( gEdit["ammunationSchrotAmmo"] ) )
	if amount >= 1 then
		ammunationOrderShottyAmmo = amount
		totalObjects = totalObjects + amount
		totalCosts = totalCosts + shotgunammo_gunshop_price * amount
	end
	local amount = tonumber ( guiGetText ( gEdit["ammunationMP5Ammo"] ) )
	if amount >= 1 then
		ammunationOrderMPAmmo = amount
		totalObjects = totalObjects + amount
		totalCosts = totalCosts + mpammo_gunshop_price * amount
	end
	local amount = tonumber ( guiGetText ( gEdit["ammunationAKAmmo"] ) )
	if amount >= 1 then
		ammunationOrderAKAmmo = amount
		totalObjects = totalObjects + amount
		totalCosts = totalCosts + akammo_gunshop_price * amount
	end
	local amount = tonumber ( guiGetText ( gEdit["ammunationM4Ammo"] ) )
	if amount >= 1 then
		ammunationOrderMAmmo = amount
		totalObjects = totalObjects + amount
		totalCosts = totalCosts + mammo_gunshop_price * amount
	end
	local amount = tonumber ( guiGetText ( gEdit["ammunationGewehrAmmo"] ) )
	if amount >= 1 then
		ammunationOrderGAmmo = amount
		totalObjects = totalObjects + amount
		totalCosts = totalCosts + gewehrammo_gunshop_price * amount
	end
	
	guiSetText ( gLabel["ammunationText3"], totalObjects.." Objekte" )
	guiSetText ( gLabel["ammunationTotalCost"], totalCosts.." $" )
end