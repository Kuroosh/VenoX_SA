SFPDDepot = createObject ( 3577, -1647.6, 701.9, -5.1, 0, 0, 0 ) --fertig

AztecasLager = createObject ( 3577, -1324.4953, 2545.166, 86.82, 0, 0, 180 )
AztecaszweitLager = createObject ( 3577, 715.9721, 1966.29, 5.53 )

TriadenLager = createObject ( 3577, -2173.6677, 632.83, 49.4375 )

BikerLager = createObject ( 3577, -2184.1638, -2306.4919, 30.325, 0, 0, 231 )

MafiaLager = createObject ( 3577, -1823.2861328125 , -195.6904296875 , 13.488063812256, 0, 0, 0 ) --Fertig

GroveLagerSF = createObject ( 3577, -2237.5, 16.9, 35.1, 0, 0, 90 )--Fertig

TerrorLager = createObject ( 3577, -2540.1, -623.2, 132.4 )

ReporterLager = createObject ( 3577, -2059.2, 472.2, 34.9 )

BallasLager = createObject ( 3577, -2449.6000976563, -82.900001525879, 33.700000762939, 0, 0, 0 )--Fertig

ArmyLager = createObject ( 3577, -1322.5026976563, 498.260001525879, 10.900000762939, 0, 0, 0 ) --fertig

IMafiaLager =  createObject ( 3577, -2504.576171875 , 2352.8364257812 , 1501.0078125, 0, 0, 0 ) -- fertig

depots = { [AztecasLager]=true, [AztecaszweitLager]=true, [SFPDDepot]=true, [TriadenLager]=true, [BikerLager]=true, [MafiaLager]=true, [TerrorLager]=true, [BallasLager]=true, [ArmyLager]=true, [GroveLagerSF]=true, [ReporterLager]=true, [IMafiaLager]=true }

depotFactions = { [1]=true, [2]=true, [3]=true, [4]=true, [5]=true, [6]=true, [7]=true, [8]=true, [9]=true, [10]=true, [12]=true, [13]=true, [14]=true }
factionDepotData = {}
	factionDepotData["money"] = {}
	factionDepotData["drugs"] = {}
	factionDepotData["mats"] = {}
	factionDepotData["koks"] = {}

function depotLoad ()
	local dsatz = dbPoll ( dbQuery ( handler, "SELECT * FROM fraktionen" ), -1 )
	for i=1, #dsatz do
		local id = tonumber ( dsatz[i]["ID"] )
		factionDepotData["money"][id] = tonumber ( dsatz[i]["DepotGeld"] )
		factionDepotData["drugs"][id] = tonumber ( dsatz[i]["DepotDrogen"] )
		factionDepotData["mats"][id] = tonumber ( dsatz[i]["DepotMaterials"] )
		factionDepotData["koks"][id] = tonumber ( dsatz[i]["DepotKoks"] )
	end
end
addEventHandler("onResourceStart", resourceRoot, depotLoad )


function saveDepotInDB ()
	for index, _ in pairs ( depotFactions ) do
		dbExec ( handler, "UPDATE fraktionen SET DepotGeld=?, DepotDrogen=?, DepotMaterials=?, DepotKoks=? WHERE ID = ?", factionDepotData["money"][index], factionDepotData["drugs"][index], factionDepotData["mats"][index], factionDepotData["koks"][index], index )
	end
end
setTimer ( saveDepotInDB, 25*60*1000, 0 )


function fDepotServer_func ( player, take, money, drugs, mats, koks )

	if player == client then

		local fraktion = vnxGetElementData ( player, "fraktion" )
		if fraktion == 11 then
			fraktion = 10
		elseif fraktion == 6 or fraktion == 8 then
			fraktion = 1 
		end
		if depotFactions[fraktion] then
			if tonumber ( money ) and tonumber ( drugs ) and tonumber ( mats ) and tonumber ( koks ) and tonumber ( money ) + tonumber ( drugs ) + tonumber ( mats ) + tonumber ( koks ) > 0 then
				local pmoney = tonumber ( vnxGetElementData ( player, "money" ) )
				local pdrugs = tonumber ( vnxGetElementData ( player, "drugs" ) )
				local pmats = tonumber ( vnxGetElementData ( player, "mats" ) )
				local pkoks = tonumber ( vnxGetElementData ( player, "koks" ) )
				local money = math.floor ( math.abs ( tonumber ( money ) ) )
				local drugs = math.floor ( math.abs ( tonumber ( drugs ) ) )
				local mats = math.floor ( math.abs ( tonumber ( mats ) ) )
				local koks = math.floor ( math.abs ( tonumber ( koks ) ) )
				if take then
					if money > 0 and tonumber ( vnxGetElementData ( player, "rang" ) ) < 4 then
						outputChatBox ( "Du darfst kein Geld entnehmen!", player, 125, 0, 0 )
						return nil
					end
					if drugs > 0 and tonumber ( vnxGetElementData ( player, "rang" ) ) < 4 then
						outputChatBox ( "Du darfst keine Drogen entnehmen!", player, 125, 0, 0 )
						return nil
					end
					if koks > 0 and tonumber ( vnxGetElementData ( player, "rang" ) ) < 4 then
						outputChatBox ( "Du darfst kein Kokain entnehmen!", player, 125, 0, 0 )
						return nil
					end
					if mats > 0 and tonumber ( vnxGetElementData ( player, "rang" ) ) < 4 then
						outputChatBox ( "Du darfst keine Materialien entnehmen!", player, 125, 0, 0 )
						return nil
					end
					if factionDepotData["money"][fraktion] < money then
						outputChatBox ( "In der Fraktionskasse ist nicht genug Geld!", player, 125, 0, 0 )
					elseif factionDepotData["drugs"][fraktion] < drugs then
						outputChatBox ( "In der Fraktionskasse sind nicht genug Drogen!", player, 125, 0, 0 )
					elseif factionDepotData["koks"][fraktion] < koks then
						outputChatBox ( "In der Fraktionskasse sind nicht genug Kokain!", player, 125, 0, 0 )
					elseif factionDepotData["mats"][fraktion] < mats then
						outputChatBox ( "In der Fraktionskasse sind nicht genug Materialien!", player, 125, 0, 0 )
					else
						local msg = getPlayerName(player).." hat "..money.." $, "..drugs.." Gramm Drogen und "..mats.." Materialien aus dem Depot genommen."
						outputLog ( msg, "fkasse" )
						outputDebugString ( msg )
						vnxSetElementData ( player, "money", pmoney + money )
						vnxSetElementData ( player, "drugs", pdrugs + drugs )
						vnxSetElementData ( player, "mats", pmats + mats )
						vnxSetElementData ( player, "koks", pkoks + koks )
						factionDepotData["money"][fraktion] = factionDepotData["money"][fraktion] - money
						factionDepotData["drugs"][fraktion] = factionDepotData["drugs"][fraktion] - drugs
						factionDepotData["mats"][fraktion] = factionDepotData["mats"][fraktion] - mats
						factionDepotData["koks"][fraktion] = factionDepotData["koks"][fraktion] - koks
						outputDebugString ( "2 " ..type (  factionDepotData["koks"][fraktion] ).." - "..fraktion )
						triggerClientEvent ( player, "showFDepot", getRootElement(), factionDepotData["money"][fraktion], factionDepotData["mats"][fraktion], factionDepotData["drugs"][fraktion], factionDepotData["koks"][fraktion] )
					end
				else
					if money > pmoney then
						outputChatBox ( "Du hast nicht genug Geld dafür!", player, 125, 0, 0 )
					elseif drugs > pdrugs then
						outputChatBox ( "Du hast nicht genug Drogen dafür!", player, 125, 0, 0 )
					elseif mats > pmats then
						outputChatBox ( "Du hast nicht genug Materialen dafür!", player, 125, 0, 0 )
					elseif koks > pkoks then
						outputChatBox ( "Du hast nicht genug Kokain dafür!", player, 125, 0, 0 )
						outputChatBox(koks.." | "..pkoks)
						outputChatBox(mats.." | "..pmats)
						outputChatBox(drugs.." | "..pdrugs)
					else
						vnxSetElementData ( player, "money", pmoney - money )
						vnxSetElementData ( player, "drugs", pdrugs - drugs )
						vnxSetElementData ( player, "mats", pmats - mats )
						vnxSetElementData ( player, "koks", pkoks - koks )
						factionDepotData["money"][fraktion] = factionDepotData["money"][fraktion] + money
						factionDepotData["drugs"][fraktion] = factionDepotData["drugs"][fraktion] + drugs
						factionDepotData["mats"][fraktion] = factionDepotData["mats"][fraktion] + mats
						factionDepotData["koks"][fraktion] = factionDepotData["koks"][fraktion] + koks
						local msg = getPlayerName(player).." hat "..money.." $, "..drugs.." Gramm Drogen, "..mats.." Materialien und "..koks.." Kokain in das Depot gelegt."
						outputLog ( msg, "fkasse" )
						outputDebugString ( msg )
						outputDebugString ( "1 " ..type (  factionDepotData["koks"][fraktion] ) .. " - "..fraktion)
						triggerClientEvent ( player, "showFDepot", getRootElement(), factionDepotData["money"][fraktion],  factionDepotData["mats"][fraktion], factionDepotData["drugs"][fraktion], factionDepotData["koks"][fraktion] )
					end
				end
			else
				outputChatBox ( "Ungültige Eingabe!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du bist in einer ungültigen Fraktion!", player, 125, 0, 0 )
		end
	end
end
addEvent ( "fDepotServer", true )
addEventHandler ( "fDepotServer", getRootElement(), fDepotServer_func )

local triadFgunsMarker = createMarker( -2186.9372558594, 698.5894165039, 53.9163284301761, "corona", 1, 255, 255, 0, 255 )
local rifasFgunsMarker = createMarker( -1319.382, 2545.64, 87.784, "corona", 1, 255, 255, 0, 255 ) --Fertig
local rifas2FgunsMarker = createMarker( 1210.8363, 4.4482, 999.921, "corona", 1, 255, 255, 0, 255 ) -- Fertig
local mafiaFgunsMarker = createMarker( -1812.974609375 , -188.154296875 , 13.34916305542, "corona", 2, 100, 100, 100, 255 )--Fertig
local bikerFgunsMarker = createMarker( -2197.4792, -2329.2456, 30.625, "corona", 1, 255, 255, 0, 255 )
local ballasFgunsMarker = createMarker( -2444.5, -82.76, 34.5, "corona", 1, 120, 80, 255 )--Fertig
local groveFgunsMarker = createMarker( -2205.5, -2.8, 34, "cylinder", 2, 0, 97, 0)--Fertig
local imafiaFgunsMarker = createMarker(-2504.9892578125 , 2357.0903320312 , 1501.0078125, "corona", 1, 0, 205, 205, 255 )--Fertig

function showFgunsInfo ( hitElement, dim )
	if getElementType ( hitElement ) == "player" and dim then
		local frac = vnxGetElementData ( hitElement, "fraktion" )
		if source == triadFgunsMarker and frac == 3 then
			infobox ( hitElement, "Mit /fguns\nkannst du dich\nhier ausrüsten!", 4000, 0, 200, 0 )
		elseif source == triad2FgunsMarker and frac == 3 then 
			executeCommandHandler("fguns", source)
		elseif ( source == rifasFgunsMarker or source == rifas2FgunsMarker ) and frac == 7 then
			infobox ( hitElement, "Mit /fguns\nkannst du dich\nhier ausrüsten!", 4000, 0, 200, 0 )
		elseif source == mafiaFgunsMarker and frac == 2 then
			infobox ( hitElement, "Mit /fguns\nkannst du dich\nhier ausrüsten!", 4000, 0, 200, 0 )
		elseif source == bikerFgunsMarker and frac == 9 then
			infobox ( hitElement, "Mit /fguns\nkannst du dich\nhier ausrüsten!", 4000, 0, 200, 0 )
		elseif source == ballasFgunsMarker and frac == 12 then
			infobox ( hitElement, "Mit /fguns\nkannst du dich\nhier ausrüsten!", 4000, 0, 200, 0 )
		elseif source == groveFgunsMarker and frac == 13 then
			infobox ( hitElement, "Mit /fguns\nkannst du dich\nhier ausrüsten!", 4000, 0, 200, 0 )
		elseif source == imafiaFgunsMarker and frac == 14 then
			infobox ( hitElement, "Mit /fguns\nkannst du dich\nhier ausrüsten!", 4000, 0, 200, 0 )
		end
	end
end
addEventHandler ( "onMarkerHit", imafiaFgunsMarker, showFgunsInfo )
addEventHandler ( "onMarkerHit", triadFgunsMarker, showFgunsInfo )
addEventHandler ( "onMarkerHit", rifasFgunsMarker, showFgunsInfo )
addEventHandler ( "onMarkerHit", mafiaFgunsMarker, showFgunsInfo )
addEventHandler ( "onMarkerHit", bikerFgunsMarker, showFgunsInfo )
addEventHandler ( "onMarkerHit", ballasFgunsMarker, showFgunsInfo )
addEventHandler ( "onMarkerHit", groveFgunsMarker, showFgunsInfo )
local triad2FgunsMarker = createCustomPickup(984.7939453125 , 1782.482421875 , 9.0915288925171, 0, 0, "anzeigen/cpickup/images/gun.png", showFgunsInfo) -- Neu und Modern

addCommandHandler("fguns",
function ( player, cmd )
	local fac = vnxGetElementData ( player, "fraktion" )
	local rank = vnxGetElementData ( player, "rang" )
	
	if not gotLastHit[player] or gotLastHit[player] + healafterdmgtime <= getTickCount() then
	
		if fac == 14 then
			local px, py, pz = getElementPosition(player)
			local tx, ty, tz = getElementPosition(imafiaFgunsMarker)
			
			if getDistanceBetweenPoints3D( px, py, pz, tx, ty, tz) < 10 then	
				triggerClientEvent (player, "startFgunsGui", player, rank, fac)	
				triggerClientEvent (player, "startFgunsGui_Depot", player, factionDepotData["money"][fac], factionDepotData["mats"][fac], factionDepotData["drugs"][fac],factionDepotData["koks"][fac])	
			else
				infobox( player, "Du bist nicht\nam Waffenlager!", 3500, 255, 0, 0 )
			end

		elseif fac == 13 then
			local px, py, pz = getElementPosition(player)
			local tx, ty, tz = getElementPosition(groveFgunsMarker)
			--local tx2, ty2, tz2 = getElementPosition(grove2FgunsMarker)
			
			if getDistanceBetweenPoints3D( px, py, pz, tx, ty, tz) < 10 then	
				triggerClientEvent (player, "startFgunsGui", player, rank, fac)	
				triggerClientEvent (player, "startFgunsGui_Depot", player, factionDepotData["money"][fac], factionDepotData["mats"][fac], factionDepotData["drugs"][fac],factionDepotData["koks"][fac])	
			else
				infobox( player, "Du bist nicht\nam Waffenlager!", 3500, 255, 0, 0 )
			end
			
		elseif fac == 12 then
			local px, py, pz = getElementPosition(player)
			local tx, ty, tz = getElementPosition(ballasFgunsMarker)
			local tx2, ty2, tz2 = getElementPosition(ballasFgunsMarker)
			
			if getDistanceBetweenPoints3D( px, py, pz, tx, ty, tz) < 10 or getDistanceBetweenPoints3D( px, py, pz, tx2, ty2, tz2) < 10 then	
				triggerClientEvent (player, "startFgunsGui", player, rank, fac)	
				triggerClientEvent (player, "startFgunsGui_Depot", player, factionDepotData["money"][fac], factionDepotData["mats"][fac], factionDepotData["drugs"][fac],factionDepotData["koks"][fac])	
			else
				infobox( player, "Du bist nicht\nam Waffenlager!", 3500, 255, 0, 0 )
			end
		
		elseif fac == 7 then
			local px, py, pz = getElementPosition(player)
			local tx, ty, tz = getElementPosition(rifasFgunsMarker)
			local tx2, ty2, tz2 = getElementPosition(rifas2FgunsMarker)
			
			if getDistanceBetweenPoints3D( px, py, pz, tx, ty, tz) < 10 or getDistanceBetweenPoints3D( px, py, pz, tx2, ty2, tz2) < 10 then	
				triggerClientEvent (player, "startFgunsGui", player, rank, fac)	
				triggerClientEvent (player, "startFgunsGui_Depot", player, factionDepotData["money"][fac], factionDepotData["mats"][fac], factionDepotData["drugs"][fac],factionDepotData["koks"][fac])	
			else
				infobox( player, "Du bist nicht\nam Waffenlager!", 3500, 255, 0, 0 )
			end
		
		elseif fac == 3 then
		
			local px, py, pz = getElementPosition(player)
			local rx, ry, rz = getElementPosition(triadFgunsMarker)
			local rx2, ry2, rz2 = 985.59998, 1782.5, 8.4
			
			if getDistanceBetweenPoints3D( px, py, pz, rx, ry, rz) < 10 or getDistanceBetweenPoints3D( px, py, pz, rx2, ry2, rz2) < 10 then
				triggerClientEvent (player, "startFgunsGui", player, rank, fac)	
				triggerClientEvent (player, "startFgunsGui_Depot", player, factionDepotData["money"][fac], factionDepotData["mats"][fac], factionDepotData["drugs"][fac],factionDepotData["koks"][fac])	
			else
				infobox( player, "Du bist nicht\nam Waffenlager!", 3500, 255, 0, 0 )
			end
			
		elseif fac == 2 then
		
			local px, py, pz = getElementPosition(player)
			local rx, ry, rz = getElementPosition(mafiaFgunsMarker)
			local rx2, ry2, rz2 = getElementPosition(mafia2FgunsMarker)
			
			if getDistanceBetweenPoints3D( px, py, pz, rx, ry, rz ) < 10 or getDistanceBetweenPoints3D( px, py, pz, rx2, ry2, rz2 ) < 10 then
				triggerClientEvent (player, "startFgunsGui", player, rank, fac)	
				triggerClientEvent (player, "startFgunsGui_Depot", player, factionDepotData["money"][fac], factionDepotData["mats"][fac], factionDepotData["drugs"][fac],factionDepotData["koks"][fac])	
			else
				infobox( player, "Du bist nicht\nam Waffenlager!", 3500, 255, 0, 0 )
			end
		
		elseif fac == 9 then
		
			local px, py, pz = getElementPosition(player)
			local rx, ry, rz = getElementPosition(bikerFgunsMarker)
			local rx2, ry2, rz2 = getElementPosition(bikerFgunsMarker)
			
			if getDistanceBetweenPoints3D( px, py, pz, rx, ry, rz) < 10 or getDistanceBetweenPoints3D( px, py, pz, rx2, ry2, rz2) < 10 then
				triggerClientEvent (player, "startFgunsGui", player, rank, fac)
				triggerClientEvent (player, "startFgunsGui_Depot", player, factionDepotData["money"][fac], factionDepotData["mats"][fac], factionDepotData["drugs"][fac],factionDepotData["koks"][fac])	
			else
				infobox( player, "Du bist nicht\nam Waffenlager!", 3500, 255, 0, 0 )
			end
		else
			infobox( player, "\nKeine Befugnis!", 3500, 255, 0, 0 )
		end
	else
		outputChatBox ( "Es muss dafür "..( healafterdmgtime/1000 ) .." Sekunden nach dem letzten Schuss vergangen sein!", player, 200, 0, 0 )
	end
end)

addEvent ("giveFgunsWeapon", true)
addEventHandler ("giveFgunsWeapon", getRootElement(), function (waffe, moneycost, matscost)
	if waffe and moneycost and matscost then
		local fac = getPlayerFaction(client)
		if factionDepotData["mats"][fac] >= matscost then
			if vnxGetElementData ( client, "money" ) >= moneycost then
				setPedArmor( client, 100 )
				if waffe == "Baseball" then
					giveWeapon ( client, 5, 1, true )
				elseif waffe == "Messer" then
					giveWeapon ( client, 4, 1, true )
				elseif waffe == "Queue" then
					giveWeapon ( client, 7, 1, true )
				elseif waffe == "Deagle" then
					giveWeapon ( client, 24, 49, true )
				elseif waffe == "Mp5" then
					giveWeapon ( client, 29, 180, true )
				elseif waffe == "M4" then
					giveWeapon ( client, 31, 350, true )
				elseif waffe == "Katana" then
					giveWeapon ( client, 8, 1, true )
				elseif waffe == "Molotov" then
					giveWeapon ( client, 18, 4, true )
				elseif waffe == "Lupara" then
					giveWeapon ( client, 26, 22, true )
				elseif waffe == "Gewehr" then
					giveWeapon ( client, 33, 51, true )
				elseif waffe == "AK47" then
					giveWeapon ( client, 30, 180, true )
				elseif waffe == "Sniper" then
					giveWeapon ( client, 34, 21, true )
				elseif waffe == "Raketenwerfer" then
					giveWeapon ( client, 35, 3, true )
				end
				vnxSetElementData ( client, "money", vnxGetElementData ( client, "money" ) - moneycost )

				factionDepotData["money"][fac] = factionDepotData["money"][fac] + moneycost
				factionDepotData["mats"][fac] = factionDepotData["mats"][fac] - matscost
				outputLog ( getPlayerName(client) .. " hat ein(e) "..waffe.." gekauft.", "fguns" )
			else
				outputChatBox ( "Nicht genug Geld auf der Hand!", client, 155, 0, 0 )
			end
		else
			outputChatBox ( "Nicht genug Mats im Lager", client, 155, 0, 0 )
		end
	end
end)







