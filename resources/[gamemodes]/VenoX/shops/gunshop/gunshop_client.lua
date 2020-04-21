-------------------------
------- (c) 2009 --------
------- by Zipper -------
-- and Vio MTA:RL Crew --
-------------------------

gButton = {}
gLabel = {}

function SubmitAmmunationGunshopAbbrechenBtn (btn)

	if btn == "left" then
		guiSetVisible ( WaffenauswahlGunshopFenster, false )
		showCursor ( false )
		triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
		showPlayerHudComponent ( "ammo", false )
		showPlayerHudComponent ( "weapon", false )
		showPlayerHudComponent ( "armour", false )
		showPlayerHudComponent ( "money", false )
		triggerServerEvent ( "ammunationCancel", getLocalPlayer(), getLocalPlayer() )
	end
end
addEvent ( "SubmitAmmunationGunshopAbbrechen", true)
addEventHandler ( "SubmitAmmunationGunshopAbbrechen", getRootElement(), SubmitAmmunationGunshopAbbrechenBtn)

function SubmitAmmunationGunshopBaseballBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "baseballbat", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopSchaufelBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "schaufel", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopMesserBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "messer", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopSchlagringBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "schlagring", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshop9mmBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "9mm", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshop9mmSDBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "9mmsd", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopDeagleBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "eagle", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopMp5Btn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "mp5", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopShotgunBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "shotty", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopAk47Btn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "ak47", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopM4Btn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "m4", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopGewehrBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "gewehr", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopSGewehrBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "sniper", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopRaketenwerferBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "raketenwerfer", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopLuparaBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "gun", "lupara", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopArmorBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "armor", "armor" )
	end
end

function SubmitAmmunationGunshop9mmAmmoBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "ammo", "9mmammo", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopEagleAmmoBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "ammo", "eagleammo", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopMp5AmmoBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "ammo", "mp5ammo", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopSchrotBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "ammo", "schrot", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopAk47AmmoBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "ammo", "ak47ammo", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopM4AmmoBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "ammo", "m4ammo", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopGewehrAmmoBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "ammo", "gewehrammo", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopSGewehrAmmoBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "ammo", "sgewehrammo", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

function SubmitAmmunationGunshopRaketeBtn ( btn )

	if btn == "left" then
		local w0 = getPedWeapon ( getLocalPlayer(), 0 )
		local w1 = getPedWeapon ( getLocalPlayer(), 1 )
		local w2 = getPedWeapon ( getLocalPlayer(), 2 )
		local w3 = getPedWeapon ( getLocalPlayer(), 3 )
		local w4 = getPedWeapon ( getLocalPlayer(), 4 )
		local w5 = getPedWeapon ( getLocalPlayer(), 5 )
		local w6 = getPedWeapon ( getLocalPlayer(), 6 )
		local w7 = getPedWeapon ( getLocalPlayer(), 7 )
		triggerServerEvent ( "gunbuyGunshop", getLocalPlayer(), getLocalPlayer(), "ammo", "rocket", w0, w1, w2, w3, w4, w5, w6, w7 )
	end
end

		schlagringe_price = 50
		baseball_price = 30
		knife_price = 75
		shovels_price = 20
		pistol_price = 150
		sdpistol_price = 320
		pistolammo_price = 15
		eagle_price = 750
		eagleammo_price = 150
		shotgun_price = 250
		shotgunammo_price = 3
		mp_price = 270
		mpammo_price = 50
		ak_price = 550
		akammo_price = 75
		m_price = 750
		mammo_price = 100
		gewehr_price = 225
		gewehrammo_price = 2
		sgewehr_price = 750
		sgewehrammo_price = 7
		rakwerfer_price = 3000
		rak_price = 500
		spezgun_price = 150
		armor_price = 75

		schlagringcap = 20
		baseballcap = 20
		knifecap = 15
		shovelscap = 10
		pistolcap = 35
		sdpistolcap = 10
		pistolammocap = 125
		eaglecap = 5
		eagleammocap = 50
		shotguncap = 15
		shotgunammocap = 1200
		mpcap = 20
		mpammocap = 50
		akcap = 7
		akammocap = 20
		mcap = 5
		mammocap = 15
		gewehrcap = 10
		gewehrammocap = 150
		sgewehrcap = 3
		sgewehrammocap = 50
		raketenwerfercap = 3
		raketencap = 15
		spezguncap = 10
uncosts = 2		
schlagringe_gunshop_price = math.floor ( schlagringe_price*uncosts )
baseball_gunshop_price = math.floor ( baseball_price*uncosts )
knife_gunshop_price = math.floor ( knife_price*uncosts )
shovels_gunshop_price = math.floor ( shovels_price*uncosts )
pistol_gunshop_price = math.floor ( pistol_price*uncosts )
sdpistol_gunshop_price = math.floor ( sdpistol_price*uncosts )
pistolammo_gunshop_price = math.floor ( pistolammo_price*uncosts )
eagle_gunshop_price = math.floor ( eagle_price*uncosts )
eagleammo_gunshop_price = math.floor ( eagleammo_price*uncosts )
shotgun_gunshop_price = shotgun_price*uncosts
shotgunammo_gunshop_price = math.floor ( shotgunammo_price*uncosts )
mp_gunshop_price = math.floor ( mp_price*uncosts )
mpammo_gunshop_price = math.floor ( mpammo_price*uncosts )
ak_gunshop_price = math.floor ( ak_price*uncosts )
akammo_gunshop_price = math.floor ( akammo_price*uncosts )
m_gunshop_price = math.floor ( m_price*uncosts )
mammo_gunshop_price = math.floor ( mammo_price*uncosts )
gewehr_gunshop_price = math.floor ( gewehr_price*uncosts )
gewehrammo_gunshop_price = math.floor ( gewehrammo_price*uncosts )
sgewehr_gunshop_price = math.floor ( sgewehr_price*uncosts )
sgewehrammo_gunshop_price = math.floor ( sgewehrammo_price*uncosts )
rakwerfer_gunshop_price = math.floor ( rakwerfer_price*uncosts )
rak_gunshop_price = math.floor ( rak_price*uncosts )
spezgun_gunshop_price = math.floor ( spezgun_price*uncosts )
armor_gunshop_price = math.floor ( armor_price*uncosts )

function createAmmunationGunshop_func ()

	showCursor ( true )
	showPlayerHudComponent ( "ammo", true )
	showPlayerHudComponent ( "weapon", true )
	showPlayerHudComponent ( "armour", true )
	showPlayerHudComponent ( "money", true )
	if guiGetVisible ( WaffenauswahlGunshopFenster ) then
		guiSetVisible ( WaffenauswahlGunshopFenster, true )
	else
		local screenwidth, screenheight = guiGetScreenSize ()
		
		WaffenauswahlGunshopFenster = guiCreateWindow(screenwidth/2-319/2,screenheight/2-613/2,319,613,"Waffenauswahl",false)
		guiSetAlpha(WaffenauswahlGunshopFenster,1)
		AmmunationText = guiCreateLabel(0.0376,0.0375,0.953,0.0816,"Willkommen bei Ammunation!\nHier findest du alles fuer dein\nUeberleben!",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(AmmunationText,1)
		guiLabelSetColor(AmmunationText,255,255,255)
		guiLabelSetVerticalAlign(AmmunationText,"top")
		guiLabelSetHorizontalAlign(AmmunationText,"left",false)
		
		gLabel["ammunation_pistolen"] = guiCreateLabel(0.0345,0.2414,0.1818,0.0245,"Pistolen",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_pistolen"],1)
		guiLabelSetColor(gLabel["ammunation_pistolen"],125,000,20)
		guiLabelSetVerticalAlign(gLabel["ammunation_pistolen"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_pistolen"],"left",false)
		gLabel["ammunation_meele"] = guiCreateLabel(0.0345,0.1256,0.1881,0.0277,"Nahkampf",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_meele"],1)
		guiLabelSetColor(gLabel["ammunation_meele"],125,000,20)
		guiLabelSetVerticalAlign(gLabel["ammunation_meele"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_meele"],"left",false)
		gLabel["ammunation_mps"] = guiCreateLabel(0.0345,0.3573,0.3197,0.0245,"Maschinenpistolen",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_mps"],1)
		guiLabelSetColor(gLabel["ammunation_mps"],125,0,20)
		guiLabelSetVerticalAlign(gLabel["ammunation_mps"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_mps"],"left",false)
		gLabel["ammunation_shotguns"] = guiCreateLabel(0.4044,0.3573,0.3197,0.0245,"Schrotflinten",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_shotguns"],1)
		guiLabelSetColor(gLabel["ammunation_shotguns"],125,0,20)
		guiLabelSetVerticalAlign(gLabel["ammunation_shotguns"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_shotguns"],"left",false)
		gLabel["ammunation_sturmgewehre"] = guiCreateLabel(0.0345,0.4878,0.3135,0.0245,"Sturmgewehre",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_sturmgewehre"],1)
		guiLabelSetColor(gLabel["ammunation_sturmgewehre"],125,000,25)
		guiLabelSetVerticalAlign(gLabel["ammunation_sturmgewehre"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_sturmgewehre"],"left",false)
		gLabel["ammunation_gewehre"] = guiCreateLabel(0.4013,0.4878,0.1787,0.0245,"Gewehre",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_gewehre"],1)
		guiLabelSetColor(gLabel["ammunation_gewehre"],125,0,25)
		guiLabelSetVerticalAlign(gLabel["ammunation_gewehre"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_gewehre"],"left",false)
		gLabel["ammunation_sonstiges"] = guiCreateLabel(0.0345,0.6003,0.3135,0.0245,"Sonstiges",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_sonstiges"],1)
		guiLabelSetColor(gLabel["ammunation_sonstiges"],125,0,25)
		guiLabelSetVerticalAlign(gLabel["ammunation_sonstiges"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_sonstiges"],"left",false)
		gLabel["ammunation_ammo"] = guiCreateLabel(0.0345,0.7129,0.3135,0.0245,"Munition",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_ammo"],1)
		guiLabelSetColor(gLabel["ammunation_ammo"],125,0,25)
		guiLabelSetVerticalAlign(gLabel["ammunation_ammo"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_ammo"],"left",false)
		
		gLabel["ammunation_baseball"] = guiCreateLabel(0.0282,0.207,0.2,0.0245,"  "..baseball_gunshop_price.." $",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_baseball"],1)
		guiLabelSetColor(gLabel["ammunation_baseball"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["ammunation_baseball"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_baseball"],"left",false)
		gLabel["ammunation_shovel"] = guiCreateLabel(0.3668,0.207,0.2,0.033,"  "..shovels_gunshop_price.." $",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_shovel"],1)
		guiLabelSetColor(gLabel["ammunation_shovel"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["ammunation_shovel"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_shovel"],"left",false)
		gLabel["ammunation_knife"] = guiCreateLabel(0.5768,0.207,0.2,0.0277,"  "..knife_gunshop_price.." $",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_knife"],1)
		guiLabelSetColor(gLabel["ammunation_knife"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["ammunation_knife"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_knife"],"left",false)
		gLabel["ammunation_ring"] = guiCreateLabel(0.7649,0.207,0.2,0.0261,"  "..schlagringe_gunshop_price.." $",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_ring"],1)
		guiLabelSetColor(gLabel["ammunation_ring"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["ammunation_ring"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_ring"],"left",false)
		gLabel["ammunation_9mm"] = guiCreateLabel(0.0282,0.3263,0.2,0.0245,"  "..pistol_gunshop_price.." $",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_9mm"],1)
		guiLabelSetColor(gLabel["ammunation_9mm"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["ammunation_9mm"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_9mm"],"left",false)
		gLabel["ammunation_9mmsd"] = guiCreateLabel(0.2038,0.3263,0.2,0.033,"  "..sdpistol_gunshop_price.." $",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_9mmsd"],1)
		guiLabelSetColor(gLabel["ammunation_9mmsd"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["ammunation_9mmsd"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_9mmsd"],"left",false)
		gLabel["ammunation_deagle"] = guiCreateLabel(0.5611,0.3263,0.2,0.033,"  "..eagle_gunshop_price.." $",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_deagle"],1)
		guiLabelSetColor(gLabel["ammunation_deagle"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["ammunation_deagle"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_deagle"],"left",false)
		gLabel["ammunation_mp5"] = guiCreateLabel(0.0313,0.4454,0.2,0.0245,"  "..mp_gunshop_price.." $",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_mp5"],1)
		guiLabelSetColor(gLabel["ammunation_mp5"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["ammunation_mp5"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_mp5"],"left",false)
		gLabel["ammunation_shotgun"] = guiCreateLabel(0.4044,0.4454,0.2,0.0245,"  "..shotgun_gunshop_price.." $",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_shotgun"],1)
		guiLabelSetColor(gLabel["ammunation_shotgun"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["ammunation_shotgun"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_shotgun"],"left",false)
		gLabel["ammunation_ak47"] = guiCreateLabel(0.0282,0.5726,0.2,0.1,"  "..ak_gunshop_price.." $",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_ak47"],1)
		guiLabelSetColor(gLabel["ammunation_ak47"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["ammunation_ak47"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_ak47"],"left",false)
		gLabel["ammunation_m4"] = guiCreateLabel(0.2069,0.5726,0.2,0.05,"  "..m_gunshop_price.." $",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_m4"],1)
		guiLabelSetColor(gLabel["ammunation_m4"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["ammunation_m4"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_m4"],"left",false)
		gLabel["ammunation_gewehr"] = guiCreateLabel(0.4013,0.5726,0.2,0.05,"  "..gewehr_gunshop_price.." $",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_gewehr"],1)
		guiLabelSetColor(gLabel["ammunation_gewehr"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["ammunation_gewehr"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_gewehr"],"left",false)
		gLabel["ammunation_armor"] = guiCreateLabel(0.56,0.6781,0.2,0.0245,"  "..armor_gunshop_price.." $",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_armor"],1)
		guiLabelSetColor(gLabel["ammunation_armor"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["ammunation_armor"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_armor"],"left",false)
		gLabel["ammunation_9mmammo"] = guiCreateLabel(0.0282,0.7945,0.2,0.0245,"  "..pistolammo_gunshop_price.." $",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_9mmammo"],1)
		guiLabelSetColor(gLabel["ammunation_9mmammo"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["ammunation_9mmammo"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_9mmammo"],"left",false)
		gLabel["ammunation_deagleammo"] = guiCreateLabel(0.2257,0.7945,0.2,0.0245,"  "..eagleammo_gunshop_price.." $",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_deagleammo"],1)
		guiLabelSetColor(gLabel["ammunation_deagleammo"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["ammunation_deagleammo"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_deagleammo"],"left",false)
		gLabel["ammunation_mp5ammo"] = guiCreateLabel(0.4922,0.7945,0.2,0.0245,"  "..mpammo_gunshop_price.." $",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_mp5ammo"],1)
		guiLabelSetColor(gLabel["ammunation_mp5ammo"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["ammunation_mp5ammo"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_mp5ammo"],"left",false)
		gLabel["ammunation_schrot"] = guiCreateLabel(0.0345,0.8728,0.2,0.0245,"  "..shotgunammo_gunshop_price.." $",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_schrot"],1)
		guiLabelSetColor(gLabel["ammunation_schrot"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["ammunation_schrot"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_schrot"],"left",false)
		gLabel["ammunation_akammo"] = guiCreateLabel(0.3041,0.8728,0.2,0.0245,"  "..akammo_gunshop_price.." $",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_akammo"],1)
		guiLabelSetColor(gLabel["ammunation_akammo"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["ammunation_akammo"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_akammo"],"left",false)
		gLabel["ammunation_m4ammo"] = guiCreateLabel(0.5862,0.8728,0.2,0.0245,"  "..mammo_gunshop_price.." $",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_m4ammo"],1)
		guiLabelSetColor(gLabel["ammunation_m4ammo"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["ammunation_m4ammo"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_m4ammo"],"left",false)
		gLabel["ammunation_gewehrammo"] = guiCreateLabel(0.0313,0.9543,2,0.0245,"  "..gewehrammo_gunshop_price.." $",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gLabel["ammunation_gewehrammo"],1)
		guiLabelSetColor(gLabel["ammunation_gewehrammo"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["ammunation_gewehrammo"],"top")
		guiLabelSetHorizontalAlign(gLabel["ammunation_gewehrammo"],"left",false)
		
		gButton["ammunation_mgunshopcancel"] = guiCreateButton(0.7649,0.1,0.2038,0.0457,"Abbrechen",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_mgunshopcancel"],1)
		gButton["ammunation_baseball"] = guiCreateButton(0.0282,0.1582,0.3229,0.0457,"Baseballschlaeger",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_baseball"],1)
		gButton["ammunation_shovel"] = guiCreateButton(0.3668,0.1582,0.1944,0.0457,"Schaufel",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_shovel"],1)
		gButton["ammunation_knife"] = guiCreateButton(0.5768,0.1582,0.1724,0.0457,"Messer",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_knife"],1)
		gButton["ammunation_schlagring"] = guiCreateButton(0.7649,0.1582,0.2038,0.0457,"Schlagring",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_schlagring"],1)
		gButton["ammunation_9mm"] = guiCreateButton(0.0282,0.2724,0.1567,0.0457,"9mm",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_9mm"],1)
		gButton["ammunation_9mmSD"] = guiCreateButton(0.2038,0.2724,0.3417,0.0457,"9mm Schallgedaempft",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_9mmSD"],1)
		gButton["ammunation_deagle"] = guiCreateButton(0.5611,0.2724,0.2602,0.0457,"Desert Eagle",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_deagle"],1)
		gButton["ammunation_mp5"] = guiCreateButton(0.0313,0.3915,0.1567,0.0457,"MP5",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_mp5"],1)
		gButton["ammunation_shotgun"] = guiCreateButton(0.4044,0.3899,0.2445,0.0457,"Schrotflinte",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_shotgun"],1)
		gButton["ammunation_ak-47"] = guiCreateButton(0.0282,0.5204,0.1567,0.0457,"AK-47",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_ak-47"],1)
		gButton["ammunation_m4"] = guiCreateButton(0.2069,0.5204,0.1003,0.0457,"M4",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_m4"],1)
		gButton["ammunation_gewehr"] = guiCreateButton(0.4013,0.5188,0.1693,0.0457,"Gewehr",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_gewehr"],1)
		gButton["ammunation_armor"] = guiCreateButton(0.5266,0.6281,0.2445,0.0457,"Schusssichere\nWeste",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_armor"],1)
		gButton["ammunation_9mmammo"] = guiCreateButton(0.0282,0.7439,0.1787,0.0457,"9mm Magazin",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_9mmammo"],1)
		gButton["ammunation_eagleammo"] = guiCreateButton(0.2257,0.7439,0.2508,0.0457,"Desert Eagle Magazin",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_eagleammo"],1)
		gButton["ammunation_mp5ammo"] = guiCreateButton(0.4922,0.7439,0.2508,0.0457,"MP5 Magazin",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_mp5ammo"],1)
		gButton["ammunation_schrot"] = guiCreateButton(0.0282,0.8254,0.2602,0.0457,"Schrotkugeln",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_schrot"],1)
		gButton["ammunation_ak-47ammo"] = guiCreateButton(0.3041,0.8254,0.2602,0.0457,"AK-47 Magazin",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_ak-47ammo"],1)
		gButton["ammunation_m4ammo"] = guiCreateButton(0.5862,0.8238,0.2226,0.0457,"M4 Magazin",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_m4ammo"],1)
		gButton["ammunation_gewehrammo"] = guiCreateButton(0.0313,0.9021,0.2821,0.0457,"Gewehrpatrone",true,WaffenauswahlGunshopFenster)
		guiSetAlpha(gButton["ammunation_gewehrammo"],1)
		--gButton["ammunation_sgewehrammo"] = guiCreateButton(0.3354,0.9021,0.3135,0.0457,"Scharfschuetzen\nPatrone",true,WaffenauswahlGunshopFenster)
		--guiSetAlpha(gButton["ammunation_sgewehrammo"],1)
		
		guiWindowSetMovable ( WaffenauswahlGunshopFenster, false )
		guiWindowSetSizable  ( WaffenauswahlGunshopFenster, false )
		
		addEventHandler("onClientGUIClick", gButton["ammunation_mgunshopcancel"], SubmitAmmunationGunshopAbbrechenBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_baseball"], SubmitAmmunationGunshopBaseballBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_shovel"], SubmitAmmunationGunshopSchaufelBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_knife"], SubmitAmmunationGunshopMesserBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_schlagring"], SubmitAmmunationGunshopSchlagringBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_9mm"], SubmitAmmunationGunshop9mmBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_9mmSD"], SubmitAmmunationGunshop9mmSDBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_deagle"], SubmitAmmunationGunshopDeagleBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_mp5"], SubmitAmmunationGunshopMp5Btn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_shotgun"], SubmitAmmunationGunshopShotgunBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_ak-47"], SubmitAmmunationGunshopAk47Btn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_m4"], SubmitAmmunationGunshopM4Btn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_gewehr"], SubmitAmmunationGunshopGewehrBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_sgewehr"], SubmitAmmunationGunshopSGewehrBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_armor"], SubmitAmmunationGunshopArmorBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_9mmammo"], SubmitAmmunationGunshop9mmAmmoBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_eagleammo"], SubmitAmmunationGunshopEagleAmmoBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_mp5ammo"], SubmitAmmunationGunshopMp5AmmoBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_schrot"], SubmitAmmunationGunshopSchrotBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_ak-47ammo"], SubmitAmmunationGunshopAk47AmmoBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_m4ammo"], SubmitAmmunationGunshopM4AmmoBtn, false)
		addEventHandler("onClientGUIClick", gButton["ammunation_gewehrammo"], SubmitAmmunationGunshopGewehrAmmoBtn, false)
		--addEventHandler("onClientGUIClick", gButton["ammunation_sgewehrammo"], SubmitAmmunationGunshopSGewehrAmmoBtn, false)
	end
end
addEvent ( "createAmmunationGunshop", true )
addEventHandler ( "createAmmunationGunshop", getRootElement(), createAmmunationGunshop_func )
--[[createblip = exports.customblips:createCustomBlip ( -2639.5006542969, 195.29042919922, 16, 16, "images/18.png", 500 )
createblip = exports.customblips:createCustomBlip (  2625.8752441406, 209.44961547852, 16, 16, "images/18.png", 500 )
createblip = exports.customblips:createCustomBlip ( -315.99951171875, 829.81396484375, 16, 16, "images/18.png", 500 )
createblip = exports.customblips:createCustomBlip (  2159.2697753906, 943.19427490234, 16, 16, "images/18.png", 500 )
]]