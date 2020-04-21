--[[
Vorteile/Funktionen wenn verheiratet:

- Man kann im Haus des Partners Spawnen
- Ring unter dem Namen
- Name des Partners wird in der Friendlist angezeigt
- Sozialer Status "Verheiratet"
- Steuern niedriger

]]

marryinprogress = false

local kircheraus = createMarker( 1277.099, 1301.599, 452.2, "cylinder", 1.2, 255, 0, 0, 255 )
setElementInterior(kircheraus, 66)
local markerin = createMarker( -1989.04, 1117.92, 53.5, "cylinder", 1.2, 255, 0, 0, 255 )
local info = createPickup ( -1987.975, 1120.550, 54.12, 3, 1239, 1, 0 )

local xa, ya, za = 1271.948, 1297.240, 453 -- Altar

function inDieKirche(player)
	if marryinprogress == true then
		outputChatBox("Man kommt nicht zu Spät zu einer Hochzeit!", player, 255, 0, 0)
	else
		setElementPosition(player, 1275.361, 1301.411, 453.084)
		setElementInterior(player, 66)
	end
end
addEventHandler("onMarkerHit", markerin, inDieKirche)

function ausDieKirche(player)
	setElementInterior(player, 0)
	setElementPosition(player, -1986.466, 1117.362, 53.857)
	if marryinprogress == true then
		outputChatBox("Pff.. Die Hochzeit ist ja noch garnicht zu ende, eine Frechheit!", player, 255, 0, 0)
	end
end
addEventHandler("onMarkerHit", kircheraus, ausDieKirche)

function KirchePickup(player)
	outputChatBox("Um in der Kirche einen anderen Spieler zu Heiraten wende dich per /support an einen Admin.", player, 255, 155, 0)
	outputChatBox("Kosten einer Heirat: 100.000$", player, 255, 155, 0)
	outputChatBox("Vorteile: Spawn Haus des Partners, Sozialer Status, Steuern niedriger, Ring unter Name", player, 255, 155, 0)
end
addEventHandler("onPickupHit", info, KirchePickup)

function marry_func ( player, cmd, pl1, pl2, nachname )

	if primeGetElementData(player, "adminlvl") >= 3 then
		
		local pl1 = getPlayerFromName ( pl1 )
		local pl2 = getPlayerFromName ( pl2 )
		if pl1 and pl2 and nachname then
		
			local x, y, z = getElementPosition ( player )
			local x1, y1, z1 = getElementPosition ( pl1 )
			local x2, y2, z2 = getElementPosition ( pl2 )
			
			if getDistanceBetweenPoints3D ( xa, ya, za, x, y, z ) <= 10 and getDistanceBetweenPoints3D ( xa, ya, za, x1, y1, z1 ) <= 10 and getDistanceBetweenPoints3D ( xa, ya, za, x2, y2, z2 ) <= 10 then
			
				if primeGetElementData ( pl1, "playingtime" ) >= 240 and primeGetElementData ( pl2, "playingtime" ) >= 240 then
					
					if primeGetElementData ( pl1, "married" ) == 0 and primeGetElementData ( pl2, "married" ) == 0 then
						
						if pl1 == pl2 or pl1 == player or pl2 == player then
							outputChatBox("Der Braeutigam / die Braut und du muessen 3 verschiedene Spieler sein!.", player, 255, 150, 0)
						else
							mysql_vio_query ( "INSERT INTO marry (pl1, pl2, nachname) VALUES ('"..getPlayerName(pl1).."', '"..getPlayerName(pl2).."', '"..nachname.."')" )
							outputChatBox(""..getPlayerName(pl1).." und "..getPlayerName(pl2).." wurden erfolgreich Verheiratet!", player, 255, 150, 0)
							primeSetElementData(pl1, "married", 1)
							primeSetElementData(pl1, "marwith", getPlayerName(pl2))
							primeSetElementData(pl2, "married", 1)
							primeSetElementData(pl2, "marwith", getPlayerName(pl1))
						end
						
					else
						outputChatBox("Der Braeutigam / die Braut sind bereits verheiratet! Tzz... Solche Heiratsschwindler...", player, 255, 150, 0)
					end
					
				else
					outputChatBox("Der Braeutigam / die Braut muessen min. 4 Spielstunden haben.", player, 255, 150, 0)
				end
			
			else
				outputChatBox("Ihr seit nicht bei der Kirche.", player, 255, 150, 0)
			end
			
		else
			outputChatBox("Verwende /marry Spieler1 Spieler2 Nachname | Der Nachname darf keine Leerzeichen enthalten!", player, 255, 150, 0)
		end
	
	else
		outputChatBox("Du bist nicht befugt.", player, 200, 0, 0)
	end

end
addCommandHandler ( "marry", marry_func )

function lockkirche(player)
	if primeGetElementData(player, "adminlvl") >= 3 then
		if marryinprogress == true then
			marryinprogress = false
			outputChatBox("Kirche unlocked", player)
		else
			marryinprogress = true
			outputChatBox("Kirche locked", player)
		end
	end
end
addCommandHandler("lockkirche", lockkirche)

function unmarry_func ( player, cmd, pl )

	if primeGetElementData(player, "adminlvl") >= 3 then
	
		local pl = getPlayerFromName ( pl )
		
		if pl then
			
			if primeGetElementData(pl, "married") == 1 then
				local partner = primeGetElementData(pl, "marwith")
				outputChatBox("Moechtest du dich von "..partner.." Scheiden? Wenn ja Tippe /acceptunmarry", pl, 255, 150, 0)
				setElementData(pl, "unmarry", 1)
				outputChatBox("Der Spieler muss die Scheidung nun bestaetigen.", player, 255, 150, 0)
			else
				outputChatBox("Der Spieler ist nicht verheiratet!", player, 255, 150, 0)
			end
			
		else
			outputChatBox("Verwende /unmarry Spieler", player, 255, 150, 0)
		end
		
	else
		outputChatBox("Du bist nicht befugt.", player, 200, 0, 0)
	end
	
end
addCommandHandler ( "unmarry", unmarry_func )

function acceptunmarry_func ( player )
	if getElementData(player, "unmarry") == 1 then
		local pname = getPlayerName(player)
		local partner = primeGetElementData(player, "marwith")
		
		local query1 = MySQL_GetString("marry", "pl1", "pl1 LIKE '"..pname.."'")
		local query2 = MySQL_GetString("marry", "pl2", "pl2 LIKE '"..pname.."'")
		
			if query1 == pname then
				outputChatBox("Du hast dich erfolgreich von "..partner.." getrennt!", player, 255, 150, 0)
				mysql_vio_query ( "DELETE FROM marry WHERE pl1='"..pname.."'" )
				setElementData(player, "unmarry", 0)
				primeSetElementData(player, "married", 0)
				primeSetElementData(player, "marwith", "none")
				
				if getPlayerFromName(partner) then
					outputChatBox(""..getPlayerName(player).." hat sich von dir Scheiden Lassen.", getPlayerFromName(partner), 255, 150, 0)
					primeSetElementData(getPlayerFromName(partner), "married", 0)
					primeSetElementData(getPlayerFromName(partner), "marwith", "none")
				else
					offlinemsg ( ""..getPlayerName(player).." hat sich von dir Scheiden Lassen.", "Standesamt", partner )
				end
				
			elseif query2 == pname then
				outputChatBox("Du hast dich erfolgreich von "..partner.." getrennt!", player, 255, 150, 0)
				mysql_vio_query ( "DELETE FROM marry WHERE pl2='"..pname.."'" )
				setElementData(player, "unmarry", 0)
				primeSetElementData(player, "married", 0)
				primeSetElementData(player, "marwith", "none")
				
				if getPlayerFromName(partner) then
					outputChatBox(""..getPlayerName(player).." hat sich von dir Scheiden Lassen.", getPlayerFromName(partner), 255, 150, 0)
					primeSetElementData(getPlayerFromName(partner), "married", 0)
					primeSetElementData(getPlayerFromName(partner), "marwith", "none")
				else
					offlinemsg ( ""..getPlayerName(player).." hat sich von dir Scheiden Lassen.", "Standesamt", partner )
				end
				
			end
			
	else
		outputChatBox("Du hast keinen Scheidungsantrag.", player, 255, 155, 0)
	end
end
addCommandHandler ( "acceptunmarry", acceptunmarry_func )

function getMarryCar(partner)
	local player = source
	if primeGetElementData(player, "married") == 1 then
		
		if partner then
		
		local partnerquery1 = MySQL_GetString("marry", "car1", "pl1 LIKE '"..partner.."'")
		local partnerquery2 = MySQL_GetString("marry", "car2", "pl2 LIKE '"..partner.."'")
		
			if partnerquery1 == 1 or partnerquery1 == 0 then
				
				return MySQL_GetString("marry", "car1", "pl1 LIKE '"..partner.."'")
				
			elseif partnerquery2 == 1 or partnerquery2 == 0 then
		
				return MySQL_GetString("marry", "car2", "pl2 LIKE '"..partner.."'")
		
			else
				
				return false
				
			end
		
		else
			return false
		end
		
	else
		return false
	end
end


-------------------------------------------------------------------------

function live_func ( player, cmd, target )
	
	if primeGetElementData(player, "adminlvl") >= 1 then
		local target = findPlayerByName( target )
		if target then
			primeSetElementData ( target, "isLive", true )
			primeSetElementData ( player, "isLive", true )
			primeSetElementData ( target, "isLiveWith", getPlayerName(player) )
			primeSetElementData ( player, "isLiveWith", getPlayerName(target) )
			outputChatBox ( "Du bist nun in einem Interview mit "..getPlayerName(player)..", tippe /endlive zum beenden.", target, 200, 200, 0 )
			outputChatBox ( "Du bist nun in einem Interview mit "..getPlayerName(target)..", tippe /endlive zum beenden.", player, 200, 200, 0 )
		end
	end
end
addCommandHandler ( "live", live_func )

function endlive_func ( player )
	
	if primeGetElementData ( player, "isLive" ) then
		primeSetElementData ( player, "isLive", false )
		outputChatBox ( "Das Interview wurde beendet!", player, 0, 200, 0 )
		local target = primeGetElementData ( player, "isLiveWith" )
		local target = getPlayerFromName ( target )
		if target then
			outputChatBox ( "Das Interview wurde beendet!", target, 0, 200, 0 )
			primeSetElementData ( target, "isLive", false )
		end
	else
		outputChatBox ( "Du bist in keiner Live-Unterhaltung!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "endlive", endlive_func )