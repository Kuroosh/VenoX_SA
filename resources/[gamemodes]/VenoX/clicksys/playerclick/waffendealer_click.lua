function GuncenterGui_func()

	guiSetVisible ( Bestellfenster, true )
	guiSetText ( gLabels["waffen"], "Nahkampf\n  Schlagring\n  Baseballschlaeger\n  Messer\n  Schaufel\n Schusswaffen\n  Pistolen\n   9mm Pistole\n   9mm Schallgedaempft\n   9mm Magazine\n   Desert Eagle\n   7er Magazin\n  Schrotflinten\n   Schrotflinte\n   Schrotkugeln\n  Maschinenpistolen\n   MP5\n   10mm 30er Magazin\n  Sturmgewehre\n   Ak-47\n   30er Magazin\n   M4\n   50er Magazin\n  Gewehre\n   Gewehr\n   Gewehrpatronen\n   Scharfs. Gewehr\n   Scharfs. Patrone\n Spezial\n  Raketenwerfer\n  Raketen\n  "..spezgun )
	showCursor ( true )
	setElementClicked ( true )
end
addEvent ( "ShowGuncenterGui", true)
addEventHandler ( "ShowGuncenterGui", getRootElement(), GuncenterGui_func)

function SubmitBeladenBtn (btn)

	if btn == "left" then
		local text = guiGetText(Bestellungen)
		local schlagringe = tonumber(gettok ( text, 1, string.byte('*') ) )
		local baseball = tonumber(gettok ( text, 2, string.byte('*') ) )
		local knife = tonumber(gettok ( text, 3, string.byte('*') ) )
		local shovels = tonumber(gettok ( text, 4, string.byte('*') ) )
		local pistol = tonumber(gettok ( text, 5, string.byte('*') ) )
		local sdpistol = tonumber(gettok ( text, 6, string.byte('*') ) )
		local pistolammo = tonumber(gettok ( text, 7, string.byte('*') ) )
		local eagle = tonumber(gettok ( text, 8, string.byte('*') ) )
		local eagleammo = tonumber(gettok ( text, 9, string.byte('*') ) )
		local shotgun  = tonumber( gettok ( text, 10, string.byte('*') ) )
		local shotgunammo  = tonumber( gettok ( text, 11, string.byte('*') ) )
		local mp  = tonumber( gettok ( text, 12, string.byte('*') ) )
		local mpammo  = tonumber( gettok ( text, 13, string.byte('*') ) )
		local ak  = tonumber( gettok ( text, 14, string.byte('*') ) )
		local akmunni  = tonumber( gettok ( text, 15, string.byte('*') ) )
		local m  = tonumber( gettok ( text, 16, string.byte('*') ) )
		local mammo  = tonumber( gettok ( text, 17, string.byte('*') ) )
		local gewehr  = tonumber( gettok ( text, 18, string.byte('*') ) )
		local gewehrammo  = tonumber( gettok ( text, 19,	string.byte('*') ) )
		local sgewehr  = tonumber( gettok ( text, 20,	string.byte('*') ) )
		local sgewehrammo  = tonumber( gettok ( text, 21,	string.byte('*') ) )
		local rakwerfer  = tonumber( gettok ( text, 22,	string.byte('*') ) )
		local rak  = tonumber( gettok ( text, 23,	string.byte('*') ) )
		local spezgun  = tonumber( gettok ( text, 24,	string.byte('*') ) )
		guiSetVisible ( Bestellfenster, false )
		showCursor ( false )
		triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
		triggerServerEvent ( "giveTruck", getLocalPlayer(), schlagringe, baseball, knife, shovels, pistol, sdpistol, pistolammo, eagle, eagleammo, shotgun, shotgunammo, mp, mpammo, ak, akmunni, m, mammo, gewehr, gewehrammo, sgewehr, sgewehrammo, rakwerfer, rak, spezgun )
	end
end

function calcWeaponPriceTillNow ()

	local text = guiGetText(Bestellungen)
	local schlagringe = tonumber(gettok ( text, 1, string.byte('*') ) )
	local baseball = tonumber(gettok ( text, 2, string.byte('*') ) )
	local knife = tonumber(gettok ( text, 3, string.byte('*') ) )
	local shovels = tonumber(gettok ( text, 4, string.byte('*') ) )
	local pistol = tonumber(gettok ( text, 5, string.byte('*') ) )
	local sdpistol = tonumber(gettok ( text, 6, string.byte('*') ) )
	local pistolammo = tonumber(gettok ( text, 7, string.byte('*') ) )
	local eagle = tonumber(gettok ( text, 8, string.byte('*') ) )
	local eagleammo = tonumber(gettok ( text, 9, string.byte('*') ) )
	local shotgun  = tonumber( gettok ( text, 10, string.byte('*') ) )
	local shotgunammo  = tonumber( gettok ( text, 11, string.byte('*') ) )
	local mp  = tonumber( gettok ( text, 12, string.byte('*') ) )
	local mpammo  = tonumber( gettok ( text, 13, string.byte('*') ) )
	local ak  = tonumber( gettok ( text, 14, string.byte('*') ) )
	local akmunni  = tonumber( gettok ( text, 15, string.byte('*') ) )
	local m  = tonumber( gettok ( text, 16, string.byte('*') ) )
	local mammo  = tonumber( gettok ( text, 17, string.byte('*') ) )
	local gewehr  = tonumber( gettok ( text, 18, string.byte('*') ) )
	local gewehrammo  = tonumber( gettok ( text, 19,	string.byte('*') ) )
	local sgewehr  = tonumber( gettok ( text, 20,	string.byte('*') ) )
	local sgewehrammo  = tonumber( gettok ( text, 21,	string.byte('*') ) )
	local rakwerfer  = tonumber( gettok ( text, 22,	string.byte('*') ) )
	local rak  = tonumber( gettok ( text, 23,	string.byte('*') ) )
	local spezgun  = tonumber( gettok ( text, 24,	string.byte('*') ) )
	schlagringe, baseball, knife, shovels, pistol, sdpistol, pistolammo, eagle, eagleammo, shotgun, shotgunammo, mp, mpammo, ak, akammo, m, mammo, gewehr, gewehrammo, sgewehr, sgewehrammo, rakwerfer, rak, spezgun = math.abs(schlagringe), math.abs(baseball), math.abs(knife), math.abs(shovels), math.abs(pistol), math.abs(sdpistol), math.abs(pistolammo), math.abs(eagle), math.abs(eagleammo), math.abs(shotgun), math.abs(shotgunammo), math.abs(mp), math.abs(mpammo), math.abs(ak), math.abs(akammo), math.abs(m), math.abs(mammo), math.abs(gewehr), math.abs(gewehrammo), math.abs(sgewehr), math.abs(sgewehrammo), math.abs(rakwerfer), math.abs(rak), math.abs(spezgun)
	local preis = math.abs(schlagringe)*schlagringe_price + math.abs(baseball)*baseball_price + math.abs(knife)*knife_price + math.abs(shovels)*shovels_price + math.abs(pistol)*pistol_price + math.abs(sdpistol)*sdpistol_price + math.abs(pistolammo)*pistolammo_price + math.abs(eagle)*eagle_price + math.abs(eagleammo)*eagleammo_price + math.abs(shotgun)*shotgun_price + math.abs(shotgunammo)*shotgunammo_price + mp*mp_price + mpammo*mpammo_price + ak*ak_price + akammo*akammo_price + m*m_price + mammo*mammo_price + gewehr*gewehr_price + gewehrammo*gewehrammo_price + sgewehr*sgewehr_price + sgewehrammo*sgewehrammo_price + math.abs(rakwerfer)*rakwerfer_price + math.abs(rak)*rak_price + math.abs(spezgun)*spezgun_price
	
	guiSetText ( gLabels["gunDelivery"], "Preis der Waren bisher: ".. formNumberToMoneyString ( preis ) )
end

function SubmitBeladenAbbrechenBtn (btn)

	if btn == "left" then
		guiSetVisible ( Bestellfenster, false )
		showCursor ( false )
		triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
	end
end
addEvent ( "SubmitBeladenAbbrechen", true)
addEventHandler ( "SubmitBeladenAbbrechen", getRootElement(), SubmitBeladenAbbrechenBtn)

function createWaffenlieferungsMenue()

	local screenwidth, screenheight = guiGetScreenSize ()
	
	Bestellfenster = guiCreateWindow(screenwidth/2-346/2,screenheight/2-638/2,346,638,"Bestellliste",false)
	guiSetAlpha(Bestellfenster,1)
	guiWindowSetMovable(Bestellfenster,false)
	guiWindowSetSizable(Bestellfenster,false)
	
	gLabels["startinfotext"] = guiCreateLabel(0.026,0.0361,0.9653,0.0517,"Bitte fuelle die Tabelle aus, damit der Truck mit den Waffen\nbeladen werden kann.Das Geld musst du selber vorstrecken.",true,Bestellfenster)
	guiSetAlpha(gLabels["startinfotext"],1)
	guiLabelSetColor(gLabels["startinfotext"],255,255,255)
	guiLabelSetVerticalAlign(gLabels["startinfotext"],"top")
	guiLabelSetHorizontalAlign(gLabels["startinfotext"],"left",false)
	
	Bestellgrid = guiCreateGridList(0.026,0.0925,0.948,0.7915,true,Bestellfenster)
	guiGridListSetSelectionMode(Bestellgrid,2)
	guiGridListAddColumn(Bestellgrid,"Waffe",0.2)
	guiGridListAddColumn(Bestellgrid,"Preis",0.2)
	guiSetAlpha(Bestellgrid,1)
	gLabels["waffen"] = guiCreateLabel(0.0213,0.0554,0.4299,0.9307,"Nahkampf\n  Schlagring\n  Baseballschlaeger\n  Messer\n  Schaufel\n Schusswaffen\n  Pistolen\n   9mm Pistole\n   9mm Schallgedaempft\n   9mm Magazine\n   Desert Eagle\n   7er Magazin\n  Schrotflinten\n   Schrotflinte\n   Schrotkugeln\n  Maschinenpistolen\n   MP5\n   10mm 30er Magazin\n  Sturmgewehre\n   Ak-47\n   30er Magazin\n   M4\n   50er Magazin\n  Gewehre\n   Gewehr\n   Gewehrpatronen\n   Scharfs. Gewehr\n   Scharfs. Patrone\n Spezial\n  Raketenwerfer\n  Raketen\n  ",true,Bestellgrid)
	guiSetAlpha(gLabels["waffen"],1)
	guiLabelSetColor(gLabels["waffen"],255,255,255)
	guiLabelSetVerticalAlign(gLabels["waffen"],"top")
	guiLabelSetHorizontalAlign(gLabels["waffen"],"left",false)
	gLabels["preise"] = guiCreateLabel(0.5732,0.0535,0.1646,0.9327,"\n "..schlagringe_price.."\n "..baseball_price.."\n "..knife_price.."\n "..shovels_price.."\n \n \n "..pistol_price.."\n "..sdpistol_price.."\n "..pistolammo_price.."\n "..eagle_price.."\n "..eagleammo_price.."\n \n "..shotgun_price.."\n "..shotgunammo_price.."\n \n "..mp_price.."\n "..mpammo_price.."\n \n "..ak_price.."\n "..akammo_price.."\n "..m_price.."\n "..mammo_price.."\n \n "..gewehr_price.."\n "..gewehrammo_price.."\n "..sgewehr_price.."\n "..sgewehrammo_price.."\n \n "..rakwerfer_price.."\n "..rak_price.."\n "..spezgun_price,true,Bestellgrid)
	guiSetAlpha(gLabels["preise"],1)
	guiLabelSetColor(gLabels["preise"],255,255,255)
	guiLabelSetVerticalAlign(gLabels["preise"],"top")
	guiLabelSetHorizontalAlign(gLabels["preise"],"left",false)
	Bestellungen = guiCreateMemo(0.7866,0.0693,0.186,0.9228,"0*\n0*\n0*\n0*\n\n\n0*\n0*\n0*\n0*\n0*\n\n0*\n0*\n\n0*\n0*\n\n0*\n0*\n0*\n0*\n\n0*\n0*\n0*\n0*\n\n0*\n0*\n0*",true,Bestellgrid)
	guiSetAlpha(Bestellungen,1)
	
	gButtons["beladen"] = guiCreateButton(0.10,0.9028,0.35,0.077,"Truck beladen",true,Bestellfenster)
	guiSetAlpha(gButtons["beladen"],1)
	gButtons["beladenabbrechen"] = guiCreateButton(0.55,0.9028,0.35,0.077,"Abbrechen",true,Bestellfenster)
	guiSetAlpha(gButtons["beladenabbrechen"],1)
	
	guiSetVisible ( Bestellfenster, false )
	
	addEventHandler("onClientGUIClick", gButtons["beladen"], SubmitBeladenBtn, false)
	addEventHandler("onClientGUIClick", gButtons["beladenabbrechen"], SubmitBeladenAbbrechenBtn, false)
	
	gLabels["gunDelivery"] = guiCreateLabel(0.0213,0.0554,0.8,0.9307,"Preis der Waren bisher: 0 $",true,Bestellgrid)
	guiSetAlpha(gLabels["gunDelivery"],1)
	guiLabelSetColor(gLabels["gunDelivery"],255,255,255)
	guiLabelSetVerticalAlign(gLabels["gunDelivery"],"top")
	guiLabelSetHorizontalAlign(gLabels["gunDelivery"],"left",false)
	
	addEventHandler ( "onClientGUIChanged", Bestellungen, calcWeaponPriceTillNow )
end

addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), 
	function ()
		createWaffenlieferungsMenue()
	end
)