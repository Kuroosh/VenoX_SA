-------------------------
------- (c) 2010 --------
------- by Zipper -------
-- and Vio MTA:RL Crew --
-------------------------

gWindow = {}
gButton = {}
gLabel = {}

weaponNames = { [0]="Faust", 
"Schlagring", "Golfschläger", "Schlagstock", "Messer", "Baseballschläger", "Schaufel", "Pool Cue", "Katana", "Kettensäge", 
"Dildo", "Dildo", "Vibrator", "Existiert nicht", "Blumen", "Spazierstock", "Granaten", "Tränengas", "Molotov Cocktails", "Existiert nicht",
"Existiert nicht", "Existiert nicht",  "Pistole", "SD-Pistole", "Desert Eagle", "Schrotflinte", "Lupara", "SPAZ-12", "Uzi", "MP5",                				 
"AK-47", "M4", "TEC-9", "Gewehr", "Sniper", "Raketenwerfer", "Jeveline", "Flammenwerfer", "Minigun", "Rucksackbombem", 
"Satchel", "Spruehdose", "Feuerloescher", "Kamera", "Nachtsichtgeraet", "Infrarotgeraet", "Fallschirm" }

function _createGunboxMenue ()

	if gWindow["gunbox"] then
		guiSetVisible ( gWindow["gunbox"], true )
	else
		local screenwidth, screenheight = guiGetScreenSize ()
		
		gWindow["gunbox"] = guiCreateWindow(screenwidth/2-355/2, screenheight/2-163/2,355,163,"Waffenbox",false)
		guiSetAlpha(gWindow["gunbox"],1)

		gLabel["gunOneText"] = guiCreateLabel(0.0225,0.1472,0.3352,0.1534,"Waffe in Kammer 1:",true,gWindow["gunbox"])
		guiSetAlpha(gLabel["gunOneText"],1)
		guiLabelSetColor(gLabel["gunOneText"],200,200,000)
		guiLabelSetVerticalAlign(gLabel["gunOneText"],"top")
		guiLabelSetHorizontalAlign(gLabel["gunOneText"],"left",false)
		gLabel["gunTwoText"] = guiCreateLabel(0.3465,0.1472,0.342,0.1185,"Waffe in Kammer 2:",true,gWindow["gunbox"])
		guiSetAlpha(gLabel["gunTwoText"],1)
		guiLabelSetColor(gLabel["gunTwoText"],200,200,000)
		guiLabelSetVerticalAlign(gLabel["gunTwoText"],"top")
		guiLabelSetHorizontalAlign(gLabel["gunTwoText"],"left",false)
		gLabel["gunThreeText"] = guiCreateLabel(0.6648,0.1472,0.342,0.1185,"Waffe in Kammer 3:",true,gWindow["gunbox"])
		guiSetAlpha(gLabel["gunThreeText"],1)
		guiLabelSetColor(gLabel["gunThreeText"],200,200,000)
		guiLabelSetVerticalAlign(gLabel["gunThreeText"],"top")
		guiLabelSetHorizontalAlign(gLabel["gunThreeText"],"left",false)
		gLabel["Slot1Gun"] = guiCreateLabel(0.0451,0.2577,0.2704,0.135,"-Keine-",true,gWindow["gunbox"])
		guiSetAlpha(gLabel["Slot1Gun"],1)
		guiLabelSetColor(gLabel["Slot1Gun"],050,050,175)
		guiLabelSetVerticalAlign(gLabel["Slot1Gun"],"top")
		guiLabelSetHorizontalAlign(gLabel["Slot1Gun"],"left",false)
		gLabel["Slot2Gun"] = guiCreateLabel(0.3521,0.2577,0.254,0.1043,"-Keine-",true,gWindow["gunbox"])
		guiSetAlpha(gLabel["Slot2Gun"],1)
		guiLabelSetColor(gLabel["Slot2Gun"],050,050,175)
		guiLabelSetVerticalAlign(gLabel["Slot2Gun"],"top")
		guiLabelSetHorizontalAlign(gLabel["Slot2Gun"],"left",false)
		gLabel["Slot3Gun"] = guiCreateLabel(0.6732,0.2577,0.254,0.1043,"-Keine-",true,gWindow["gunbox"])
		guiSetAlpha(gLabel["Slot3Gun"],1)
		guiLabelSetColor(gLabel["Slot3Gun"],050,050,175)
		guiLabelSetVerticalAlign(gLabel["Slot3Gun"],"top")
		guiLabelSetHorizontalAlign(gLabel["Slot3Gun"],"left",false)
		gButton["action1"] = guiCreateButton(0.0451,0.5153,0.3042,0.1656,"Einlagern",true,gWindow["gunbox"])
		guiSetAlpha(gButton["action1"],1)
		gButton["action2"] = guiCreateButton(0.3521,0.5153,0.3042,0.1656,"Einlagern",true,gWindow["gunbox"])
		guiSetAlpha(gButton["action2"],1)
		gButton["action3"] = guiCreateButton(0.6732,0.5153,0.3042,0.1656,"Einlagern",true,gWindow["gunbox"])
		guiSetAlpha(gButton["action3"],1)
		gLabel["ammoSlot1"] = guiCreateLabel(0.093,0.3558,0.2225,0.0982,"9 Schuss",true,gWindow["gunbox"])
		guiSetAlpha(gLabel["ammoSlot1"],1)
		guiLabelSetColor(gLabel["ammoSlot1"],125,200,120)
		guiLabelSetVerticalAlign(gLabel["ammoSlot1"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammoSlot1"],"left",false)
		gLabel["ammoSlot2"] = guiCreateLabel(0.4028,0.3558,0.209,0.0988,"9 Schuss",true,gWindow["gunbox"])
		guiSetAlpha(gLabel["ammoSlot2"],1)
		guiLabelSetColor(gLabel["ammoSlot2"],125,200,120)
		guiLabelSetVerticalAlign(gLabel["ammoSlot2"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammoSlot2"],"left",false)
		gLabel["ammoSlot3"] = guiCreateLabel(0.7099,0.3558,0.209,0.0988,"9 Schuss",true,gWindow["gunbox"])
		guiSetAlpha(gLabel["ammoSlot3"],1)
		guiLabelSetColor(gLabel["ammoSlot3"],125,200,120)
		guiLabelSetVerticalAlign(gLabel["ammoSlot3"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammoSlot3"],"left",false)
		gButton["close"] = guiCreateButton(0.907,0.7607,0.0704,0.1595,"X",true,gWindow["gunbox"])
		guiSetAlpha(gButton["close"],1)
		gLabel["infotext"] = guiCreateLabel(0.0225,0.6994,0.8648,0.2515,"Hier kannst du deine Waffen lagern und zu einem\nspaeteren Zeitpunkt wieder mitnehmen.",true,gWindow["gunbox"])
		guiSetAlpha(gLabel["infotext"],1)
		guiLabelSetColor(gLabel["infotext"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["infotext"],"top")
		guiLabelSetHorizontalAlign(gLabel["infotext"],"left",false)
		
		addEventHandler("onClientGUIClick", gButton["action1"], 
			function ()
				if source == gButton["action1"] then
					if guiGetText ( gButton["action1"] ) == "Einlagern" then
						triggerServerEvent ( "exchangeWeaponsWithBox", getLocalPlayer(), getLocalPlayer(), 1, "in", getPedWeapon ( getLocalPlayer() ), getPedTotalAmmo ( getLocalPlayer() ) )
					elseif guiGetText ( gButton["action1"] ) == "Herausnehmen" then
						triggerServerEvent ( "exchangeWeaponsWithBox", getLocalPlayer(), getLocalPlayer(), 1, "ex" )
					else
						outputChatBox ( "Du hast keine Waffe in der Hand!", 125, 0, 0 )
					end
				end
			end
		)
		addEventHandler("onClientGUIClick", gButton["action2"], 
			function ()
				if source == gButton["action2"] then
					if guiGetText ( gButton["action2"] ) == "Einlagern" then
						triggerServerEvent ( "exchangeWeaponsWithBox", getLocalPlayer(), getLocalPlayer(), 2, "in", getPedWeapon ( getLocalPlayer() ), getPedTotalAmmo ( getLocalPlayer() ) )
					elseif guiGetText ( gButton["action2"] ) == "Herausnehmen" then
						triggerServerEvent ( "exchangeWeaponsWithBox", getLocalPlayer(), getLocalPlayer(), 2, "ex" )
					else
						outputChatBox ( "Du hast keine Waffe in der Hand!", 125, 0, 0 )
					end
				end
			end
		)
		addEventHandler("onClientGUIClick", gButton["action3"], 
			function ()
				if source == gButton["action3"] then
					if guiGetText ( gButton["action3"] ) == "Einlagern" then
						triggerServerEvent ( "exchangeWeaponsWithBox", getLocalPlayer(), getLocalPlayer(), 3, "in", getPedWeapon ( getLocalPlayer() ), getPedTotalAmmo ( getLocalPlayer() ) )
					elseif guiGetText ( gButton["action3"] ) == "Herausnehmen" then
						triggerServerEvent ( "exchangeWeaponsWithBox", getLocalPlayer(), getLocalPlayer(), 3, "ex" )
					else
						outputChatBox ( "Du hast keine Waffe in der Hand!", 125, 0, 0 )
					end
				end
			end
		)
		
		addEventHandler("onClientGUIClick", gButton["close"], 
			function ()
				guiSetVisible ( gWindow["gunbox"], false )
				showCursor(false)
				triggerServerEvent ( "crateUnfreezePed", getLocalPlayer(), getLocalPlayer() )
				triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
			end
		)
	end
	refreshData()
end
addEvent ( "gunCrateMenue", true )
addEventHandler ( "gunCrateMenue", getRootElement(), _createGunboxMenue )

function refreshData ()

	if getPedWeapon ( getLocalPlayer() ) == 0 then
		guiSetText ( gButton["action1"], "" )
		guiSetText ( gButton["action2"], "" )
		guiSetText ( gButton["action3"], "" )
	else
		guiSetText ( gButton["action1"], "Einlagern" )
		guiSetText ( gButton["action2"], "Einlagern" )
		guiSetText ( gButton["action3"], "Einlagern" )
	end
	local player = getLocalPlayer()
	local slot1, slot2, slot3 = vnxClientGetElementData ( "gunboxa" ), vnxClientGetElementData ( "gunboxb" ),vnxClientGetElementData ( "gunboxc" )
	local gun1, ammo1 = gettok ( slot1, 1, string.byte('|') ), gettok ( slot1, 2, string.byte('|') )
	local gun2, ammo2 = gettok ( slot2, 1, string.byte('|') ), gettok ( slot2, 2, string.byte('|') )
	local gun3, ammo3 = gettok ( slot3, 1, string.byte('|') ), gettok ( slot3, 2, string.byte('|') )
	if tonumber(gun1) ~= 0 then
		guiSetText ( gLabel["Slot1Gun"], weaponNames[tonumber(gun1)] )
		guiSetText ( gButton["action1"], "Herausnehmen" )
	else
		guiSetText ( gLabel["Slot1Gun"], "-Keine-" )
	end
	if tonumber(gun2) ~= 0 then
		guiSetText ( gLabel["Slot2Gun"], weaponNames[tonumber(gun2)] )
		guiSetText ( gButton["action2"], "Herausnehmen" )
	else
		guiSetText ( gLabel["Slot2Gun"], "-Keine-" )
	end
	if tonumber(gun3) ~= 0 then
		guiSetText ( gLabel["Slot3Gun"], weaponNames[tonumber(gun3)] )
		guiSetText ( gButton["action3"], "Herausnehmen" )
	else
		guiSetText ( gLabel["Slot3Gun"], "-Keine-" )
	end
	if tonumber(ammo1) <= 1 then
		guiSetText ( gLabel["ammoSlot1"], "" )
	else
		guiSetText ( gLabel["ammoSlot1"], ammo1.." Schuss" )
	end
	if tonumber(ammo2) <= 1 then
		guiSetText ( gLabel["ammoSlot2"], "" )
	else
		guiSetText ( gLabel["ammoSlot2"], ammo2.." Schuss" )
	end
	if tonumber(ammo3) <= 1 then
		guiSetText ( gLabel["ammoSlot3"], "" )
	else
		guiSetText ( gLabel["ammoSlot3"], ammo3.." Schuss" )
	end
end
addEvent ( "refreshGunCrateBox", true )
addEventHandler ( "refreshGunCrateBox", getRootElement(), refreshData )