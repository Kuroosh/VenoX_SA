--[[local Help = createPickup(2545.54175, -1512.86365, -12.32031, 3, 1239, 1);

function hilfe_pickup(player)
   infobox(player,"Tippe /hilfe, um ein Teammitglied zu kontaktieren!",4000,0,120,200)
end
addEventHandler("onPickupHit",Help,hilfe_pickup)

-- Teleport
addCommandHandler("report", function(player)
	if getElementData(player, "loggedin") then
		if getElementInterior(player) == 0 then
			if not isPedInVehicle(player) then
				if vnxGetElementData(player,"inReportHalle") == false then
					local x, y, z = getElementPosition(player);
					setElementData(player, "old_position_x", x);
					setElementData(player, "old_position_y", y);
					setElementData(player, "old_position_z", z);
					if tonumber(vnxGetElementData(player, "adminlvl")) > 0 then
						setElementPosition(player, 2547.79175, -1520.68982, -12.32031);
						outputChatBox("[INFO]: Tippe /leavereport, um die Reporthalle wieder zu verlassen!",player,0,100,150)
						vnxSetElementData ( player, "inReportHalle", true)
						toggleControl( player, "fire", false )
						
						outputLog("[REPORT]: "..getPlayerName(player).." hat die Reporthalle betreten!","Reportsystem")
					else
						setElementPosition(player, 2570.48926, -1523.93347, -12.32031);
						outputChatBox("[INFO]: Tippe /leavereport, um die Reporthalle wieder zu verlassen!",player,0,100,150)
						vnxSetElementData ( player, "inReportHalle", true)
						toggleControl( player, "fire", false )
						
						outputLog("[REPORT]: "..getPlayerName(player).." hat die Reporthalle betreten!","Reportsystem")
					end
				else
					infobox(player,"Du bist bereits in der Reporthalle!",4000,255,0,0)
				end
			else	
				infobox(player,"Steige vorher aus deinem Fahrzeug aus!",4000,255,0,0)
			end
		else
			infobox(player,"Verlasse zu erst dein Interior!",4000,255,0,0)
		end
	end
end)

-- Hilfe
addCommandHandler("hilfe", function(player)
	local x, y, z = getElementPosition(player)
	if getDistanceBetweenPoints3D(2545.54175, -1512.86365, -12.32031,getElementPosition(player)) < 5 then
		for _, p in pairs(getElementsByType("player")) do 
			if getElementData(p, "loggedin") then
				if tonumber(vnxGetElementData(p, "adminlvl")) > 0 then
				    infobox(player,"Alle Teammitglieder, welche online sind, wurde benachrichtig!",4000,0,255,0)
					outputChatBox("[ADMIN]: "..getPlayerName(player).." benötigt Hilfe! Tippe /report, um zu ihm zu gelangen!", p, 0,100,150);
					
					outputLog("[REPORT]: "..getPlayerName(player).." hat Hilfe angefordert!","Reportsystem")
				end
			end
		end
	end
end)

-- Verlassen
addCommandHandler("leavereport", function(player)
    if vnxGetElementData ( player, "inReportHalle" ) == true then
	    local x, y, z =  getElementData(player, "old_position_x"), getElementData(player, "old_position_y"), getElementData(player, "old_position_z");
	    if x and y and z then
		    setElementPosition(player, x, y, z);
		    vnxSetElementData ( player, "inReportHalle", false)
			toggleControl( player, "fire", true )
			
			outputLog("[REPORT]: "..getPlayerName(player).." hat die Reporthalle verlassen!","Reportsystem")
		end
	end
end)
--]]