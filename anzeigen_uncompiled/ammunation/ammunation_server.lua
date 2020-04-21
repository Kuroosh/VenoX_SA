ammunationShops = {}
 ammunationShops["x"] = {}
 ammunationShops["y"] = {}
 ammunationShops["z"] = {}
 ammunationShops["sx"] = {}
 ammunationShops["sy"] = {}
 ammunationShops["sz"] = {}
 ammunationShops["sr"] = {}
 local i = 0
 i = i + 1
 ammunationShops["x"][i], ammunationShops["y"][i], ammunationShops["z"][i] = -2625.8752441406, 209.44961547852, 3.5589985847473
 ammunationShops["sx"][i], ammunationShops["sy"][i], ammunationShops["sz"][i], ammunationShops["sr"][i] = -2625.7507324219, 212.39736938477, 4.2707958221436, 0
 i = i + 1
 ammunationShops["x"][i], ammunationShops["y"][i], ammunationShops["z"][i] = 2159.2697753906, 943.19427490234, 9.7992029190063
 ammunationShops["sx"][i], ammunationShops["sy"][i], ammunationShops["sz"][i], ammunationShops["sr"][i] = 2156.908203125, 943.21978759766, 10.469537734985, 90
 i = i + 1
 ammunationShops["x"][i], ammunationShops["y"][i], ammunationShops["z"][i] = -315.99951171875, 829.81396484375, 13.224180221558
 ammunationShops["sx"][i], ammunationShops["sy"][i], ammunationShops["sz"][i], ammunationShops["sr"][i] = -313.68911743164, 829.89306640625, 13.891412734985, -90
 i = i + 1
 ammunationShops["x"][i], ammunationShops["y"][i], ammunationShops["z"][i] = 2539.2819824219, 2083.9797363281, 9.79
 ammunationShops["sx"][i], ammunationShops["sy"][i], ammunationShops["sz"][i], ammunationShops["sr"][i] = 2537.10546875, 2084.0485839844, 10.469537734985, 270
 
local markerCoordinates = {}
local playerCoordinates = {}

function ammunationMarkerHit ( player, dim )

	if dim then
		if vnxGetElementData ( player, "gunlicense" ) == 1 then
			if not getPedOccupiedVehicle ( player ) then
				playerCoordinates[player] = { ["x"] = markerCoordinates[source]["x"], ["y"] = markerCoordinates[source]["y"], ["z"] = markerCoordinates[source]["z"] , ["r"] = markerCoordinates[source]["r"] }
				
				setElementDimension ( player, 1 )
				setElementInterior ( player, 4 )
				setCameraMatrix ( player, 288.1, -78.75, 1002.4, 288.099, -56.3, 1004.7 )
				triggerClientEvent ( player, "createAmmunationGunshop", getRootElement() )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast keinen\nWaffenschein!", 7500, 125, 0, 0 )
		end
	end
end

for key, index in pairs ( ammunationShops["x"] ) do
	local x1, y1, z1 = ammunationShops["x"][key], ammunationShops["y"][key], ammunationShops["z"][key]
	local x2, y2, z2, r = ammunationShops["sx"][key], ammunationShops["sy"][key], ammunationShops["sz"][key], ammunationShops["sr"][key]
	--createBlip = exports.customblips:createCustomBlip ( x1, y1, z1, 6, 2, 16, 16, "images/18.png", 500 )
	createBlip ( x1, y1, z1, 6, 2, 255, 0, 0, 255, 0, 200 )
	createMarker ( x1, y1, z1, "cylinder", 1, 200, 0, 0, 200, getRootElement() )
	local marker = createMarker ( x1, y1, z1 + 1, "corona", 1, 200, 0, 0, 0, getRootElement() )
	markerCoordinates[marker] = { ["x"] = x2, ["y"] = y2, ["z"] = z2, ["r"] = r }
	addEventHandler ( "onMarkerHit", marker, ammunationMarkerHit )
 end

function ammunationCancel_func ( player )

	if player == client then
		local x, y, z, r = playerCoordinates[player]["x"], playerCoordinates[player]["y"], playerCoordinates[player]["z"], playerCoordinates[player]["r"], 
		setElementDimension ( player, 0 )
		setElementInterior ( player, 0 )
		setElementPosition ( player, x, y, z )
		setPedRotation ( player, r )
		setCameraTarget ( player, player )
	end
end
addEvent ( "ammunationCancel", true )
addEventHandler ( "ammunationCancel", getRootElement(), ammunationCancel_func )

function gunbuyGunshop_func ( player, itemtype, item,  w0, w1, w2, w3, w4, w5, w6, w7 )

	if player == client then
		local success = 0
		if itemtype == "armor" then
			armor_gunshop_price = 100
			if vnxGetElementData ( player, "money" ) >= 100 then
				vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 100 )
				setPedArmor ( player, 100 )
				local success = 1
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht\ngenug Geld!\nRuestung kostet\n"..armor_gunshop_price.." $!", 5000, 125, 0, 0 )
			end
		elseif itemtype == "ammo" then
			if item == "9mmammo" then
				if vnxGetElementData ( player, "money" ) >= pistolammo_gunshop_price then
					if w2 == 22 or w2 == 23 then
						vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - pistolammo_gunshop_price )
						triggerClientEvent ( player, "hudEinblendenDmg", player, player )
						giveWeapon ( player, w2, 17, true )
						success = 1
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast\nkeine Pistole!", 5000, 125, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht\ngenug Geld! Ein\nMagazin kostet\n"..pistolammo_gunshop_price.." $!", 5000, 125, 0, 0 )
				end
			end
			if item == "eagleammo" then
				eagleammo_gunshop_price = 150
				if vnxGetElementData ( player, "money" ) >= eagleammo_gunshop_price then
						if w2 == 24 or w2 == 22 or w2 == 23 then
							vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - eagleammo_gunshop_price )
							giveWeapon ( player, w2, 7, true )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast keine Pistole/Deagle!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht genug Geld! Ein\nMagazin kostet\n"..eagleammo_gunshop_price.." $!", 5000, 125, 0, 0 )
				end
			end
			if item == "mp5ammo" then
				mpammo_gunshop_price = 140
				if vnxGetElementData ( player, "money" ) >= mpammo_gunshop_price then
						if w4 == 29 then
							vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - mpammo_gunshop_price )
							giveWeapon ( player, w4, 30, true )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast keine\nMP5!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht\ngenug Geld! Ein\nMagazin kostet\n"..mpammo_gunshop_price.." $!", 5000, 125, 0, 0 )
				end
			end
			if item == "schrot" then
				shotgunammo_gunshop_price = 400
				if vnxGetElementData ( player, "money" ) >= shotgunammo_gunshop_price then
						if w3 == 25 then
							vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - shotgunammo_gunshop_price )
							giveWeapon ( player, w3, 1, true )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast keine\nSchrotflinte!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht\ngenug Geld! Eine\nPatrone kostet\n"..shotgunammo_gunshop_price.." $!", 5000, 125, 0, 0 )
				end
			end
			if item == "ak47ammo" then
				akammo_gunshop_price = 340
				if vnxGetElementData ( player, "money" ) >= akammo_gunshop_price then
						if w5 == 30 then
							vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - akammo_gunshop_price )
							giveWeapon ( player, w5, 30, true )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast keine\nAK-47", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht\ngenug Geld! Ein\nMagazin kostet\n"..akammo_gunshop_price.." $!", 5000, 125, 0, 0 )
				end
			end
			if item == "m4ammo" then
				mammo_gunshop_price = 340
				if vnxGetElementData ( player, "money" ) >= mammo_gunshop_price then
						if w5 == 31 or w5 == 30 then
							vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - mammo_gunshop_price )
							giveWeapon ( player, w5, 50, true )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast keine\nM4", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht\ngenug Geld! Ein\nMagazin kostet\n"..mammo_gunshop_price.." $!", 5000, 125, 0, 0 )
				end
			end
			if item == "gewehrammo" then
				gewehrammo_gunshop_price = 20
				if vnxGetElementData ( player, "money" ) >= gewehrammo_gunshop_price then
						if w6 == 33 then
							vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - gewehrammo_gunshop_price )
							giveWeapon ( player, w6, 1, true )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast kein\nGewehr!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht\ngenug Geld! Eine\nPatrone kostet\n"..gewehrammo_gunshop_price.." $!", 5000, 125, 0, 0 )
				end
			end
			if item == "sgewehrammo" then
				if vnxGetElementData ( player, "money" ) >= sgewehrammo_gunshop_price then
						if w6 == 34 then
							vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - sgewehrammo_gunshop_price )
							giveWeapon ( player, w6, 1, true )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast kein\nGewehr!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht\ngenug Geld! Eine\nPatrone kostet\n"..sgewehrammo_gunshop_price.." $!", 5000, 125, 0, 0 )
				end
			end
		elseif itemtype == "gun" then
			if item == "baseballbat" then
				if vnxGetElementData ( player, "money" ) >= baseball_gunshop_price then
						if w1 ~= 5 then
							vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - baseball_gunshop_price )
							giveWeapon ( player, 5, 1, true )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast\nbereits einen\nSchlaeger!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht\ngenug Geld! Ein\nSchlaeger kostet\n"..baseball_gunshop_price.." $!", 5000, 125, 0, 0 )
				end
			end
			if item == "schaufel" then
				if vnxGetElementData ( player, "money" ) >= shovels_gunshop_price then
						if w1 ~= 6 then
							vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - shovels_gunshop_price )
							giveWeapon ( player, 6, 1, true )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast\nbereits eine\nSchaufel!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht\ngenug Geld! Eine\nSchaufel kostet\n"..shovels_gunshop_price.." $!", 5000, 125, 0, 0 )
				end
			end
			if item == "messer" then
				if vnxGetElementData ( player, "money" ) >= knife_gunshop_price then
						if w1 ~= 4 then
							vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - knife_gunshop_price )
							giveWeapon ( player, 4, 1, true )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast\nbereits ein\nMesser!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht\ngenug Geld! Ein\nMesser kostet\n"..knife_gunshop_price.." $!", 5000, 125, 0, 0 )
				end
			end
			if item == "schlagring" then
				if vnxGetElementData ( player, "money" ) >= schlagringe_gunshop_price then
						if w1 == 0 then
							vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - schlagringe_gunshop_price )
							giveWeapon ( player, 1, 1, true )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast\nbereits einen\nSchlagring!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht\ngenug Geld! Ein\nSchlagring kostet\n"..schlagringe_gunshop_price.." $!", 5000, 125, 0, 0 )
				end
			end
			if item == "9mm" then
				pistol_gunshop_price = 340
				if vnxGetElementData ( player, "money" ) >= pistol_gunshop_price then
						if w2 ~= 22 then
							vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - pistol_gunshop_price )
							giveWeapon ( player, 22, 17, true )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast\nbereits eine\nPistole!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht\ngenug Geld! Eine\nPistole kostet\n"..pistol_gunshop_price.." $!", 5000, 125, 0, 0 )
				end
			end
			if item == "9mmsd" then
				if vnxGetElementData ( player, "money" ) >= sdpistol_gunshop_price then
						if w2 ~= 23 then
							vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - sdpistol_gunshop_price )
							giveWeapon ( player, 23, 17, true )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast\nbereits eine\nSD-Pistole!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht\ngenug Geld! Eine\nSD-Pistole kostet\n"..sdpistol_gunshop_price.." $!", 5000, 125, 0, 0 )
				end
			end
			if item == "eagle" then
				eagle_gunshop_price = 640
				if vnxGetElementData ( player, "money" ) >= eagle_gunshop_price then
						if w2 ~= 24 then
							vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - eagle_gunshop_price )
							giveWeapon ( player, 24, 7, true )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast\nbereits eine\nDesert Eagle!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht\ngenug Geld! Eine\nDesert Eagle kostet\n"..eagle_gunshop_price.." $!", 5000, 125, 0, 0 )
				end
			end
			if item == "mp5" then
				mp_gunshop_price = 540
				if vnxGetElementData ( player, "money" ) >= mp_gunshop_price then
						if w4 ~= 29 then
							vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - mp_gunshop_price )
							giveWeapon ( player, 29, 30, true )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast\nbereits eine\nMP5!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht\ngenug Geld! Eine\nMP5 kostet\n"..mp_gunshop_price.." $!", 5000, 125, 0, 0 )
				end
			end
			if item == "shotty" then
				shotgun_gunshop_price = 400
				if vnxGetElementData ( player, "money" ) >= shotgun_gunshop_price then
						if w3 ~= 25 then
							vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - shotgun_gunshop_price )
							giveWeapon ( player, 25, 5, true )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast\nbereits eine\nSchrotflinte!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht\ngenug Geld! Eine\nSchrotflinte kostet\n"..shotgun_gunshop_price.." $!", 5000, 125, 0, 0 )
				end
			end
			if item == "ak47" then
				ak_gunshop_price = 740
				if vnxGetElementData ( player, "money" ) >= ak_gunshop_price then
						if w5 ~= 30 then
							vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - ak_gunshop_price )
							giveWeapon ( player, 30, 30, true )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast\nbereits eine\nAK-47!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht\ngenug Geld! Eine\nAK-47 kostet\n"..ak_gunshop_price.." $!", 5000, 125, 0, 0 )
				end
			end
			if item == "m4" then
				m_gunshop_price = 840
				if vnxGetElementData ( player, "money" ) >= m_gunshop_price then
						if w5 ~= 30 then
							vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - m_gunshop_price )
							giveWeapon ( player, 31, 50, true )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast\nbereits eine\nM4!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht\ngenug Geld! Eine\nM4 kostet\n"..m_gunshop_price.." $!", 5000, 125, 0, 0 )
				end
			end
			if item == "gewehr" then
				gewehr_gunshop_price = 400
				if vnxGetElementData ( player, "money" ) >= gewehr_gunshop_price then
						if  w6 ~= 33 then
							vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - gewehr_gunshop_price )
							giveWeapon ( player, 33, 7, true )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast\nbereits ein\nGewehr!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht\ngenug Geld! Ein\nGewehr kostet\n"..gewehr_gunshop_price.." $!", 5000, 125, 0, 0 )
				end
			end
			if item == "sniper" then
				if vnxGetElementData ( player, "money" ) >= sgewehr_gunshop_price then
						if w6 ~= 34 then
							vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - sgewehr_gunshop_price )
							giveWeapon ( player, 34, 7, true )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast\nbereits ein\nScharfschuetzen-\ngewehr!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht\ngenug Geld! Ein\nScharfschuetzen-\ngewehr kostet\n"..sgewehr_gunshop_price.." $!", 5000, 125, 0, 0 )
				end
			end
		end
		if success == 1 then 
			playSoundFrontEnd ( player, 40 )
		end
	end
end
addEvent ( "gunbuyGunshop", true )
addEventHandler ( "gunbuyGunshop", getRootElement(), gunbuyGunshop_func )