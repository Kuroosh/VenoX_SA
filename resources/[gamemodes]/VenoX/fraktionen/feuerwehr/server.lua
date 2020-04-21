FirefighersPickup = createPickup(-1981.1999511719, 1348.6999511719, 7.1999998092651, 3, 1239, 0);



FirefighterVehicles = {

	[1] = { x = -2022.3271484375, y = 75.1982421875, z = 28.348129272461, rotx = 358.07739257813, roty = 356.58874511719, rotz = 273.35632324219},
	[2] = { x = -2021.9541015625, y = 84.3095703125, z = 28.267513275146, rotx = 356.59423828125, roty = 0.28564453125, rotz = 272.26318359375},
	[3] = { x = -2022.1572265625, y = 91.8837890625, z = 28.30421257019, rotx = 356.11633300781, roty = 0.6536865234375, rotz = 269.18151855469},
}

KoordsFire = {

	[1] = { x = -1993.73865, y = 85.62280, z = 27.68750, size = 10 },
	[2] = { x = -1993.73865, y = 85.62280, z = 27.68750, size = 10 },
	
}


addEvent("onServerStartFire", true)
addEventHandler("onServerStartFire", root, function()
	
	local rnd = math.random(1, #KoordsFire);
	
	if(KoordsFire[rnd])then
		local pos = KoordsFire[rnd];
		createFireElement(pos.x, pos.y, pos.z, 3, true)
		local feuerblip = createBlip( pos.x, pos.y, pos.z )
		setTimer(function()
			destroyElement (feuerblip)
			destroyElement (feuerelem)			
		end, 30000, 0)
	end
end)

function createfeuer(player)	


	if getFactionMembersOnline ( 15 ) >= 1 then
		local rnd = math.random ( 6 )
		if rnd == 1 then
			local feuerelem = createFireElement(-2038.0999755859, 179, 27.799999237061, 3, false)	
		    sendMSGForFaction("[Kleinbrand]", 15, 255, 0, 0);
			sendMSGForFaction("[Zentrale]Zentrale an Wache 42", 15,255,255, 0);	
			sendMSGForFaction("[Wache 42]Wache 42 hört", 15, 0, 0, 255);	
			sendMSGForFaction("[Zentrale]Es wurde ein feuer hinter denn Garagen am Bahnhof gemeldet", 15,255, 255, 0);
			sendMSGForFaction("[Zentrale]Wir benötigen umgehend ein Feuerwehrfahrzeug", 15, 255, 255, 0);
			sendMSGForFaction("[Wache 42]Unterwegs!", 15, 0,0, 255);
			
			feuerblip = createBlip( -2038.0999755859, 179, 27.799999237061,0,3,255,0,0,255,0)		
			setElementVisibleTo ( feuerblip, getRootElement(), false )
			for player, key in pairs (fraktionMembers[15]) do
				setElementVisibleTo ( feuerblip, player, true )
			end
			addEventHandler("fireElements:onFireExtinguish", feuerelem, function(uPlayer)
				givePlayerSaveMoney ( uPlayer, 500 )
				if uPlayer then
					uPlayer = getPlayerName(uPlayer)
				else
					uPlayer = "niemandem"
				end
				sendMSGForFaction("Ein Feuer wurde von "..uPlayer.." gelöscht.", 15, 255, 0, 0)
				destroyElement (feuerblip)
			end)		
			setTimer(function()
				destroyElement (feuerblip)
				destroyFireElement (feuerelem)			
			end, 600000, 0)			
		elseif rnd == 2 then
			local feuerelem = createFireElement(-2100.2001953125, -57.400390625, 34.599998474121, 3, false)
			sendMSGForFaction("[Kleinbrand]", 15, 255, 0, 0);
			sendMSGForFaction("[Zentrale]Zentrale an Wache 42", 15, 255, 255, 0);	
			sendMSGForFaction("[Wache 42]Wache 42 hört", 15, 0, 0, 255);	
			sendMSGForFaction("[Zentrale]Es wurde ein feuer an der Tankstelle nähe Bahnhof gemeldet!", 15, 255, 255, 0);	
			sendMSGForFaction("[Zentrale]Wir benötigen umgehend ein Feuerwehrfahrzeug", 15, 255, 255, 0);
			sendMSGForFaction("[Wache 42]Unterwegs!", 15, 0,0, 255);
			
			feuerblip = createBlip( -2100.2001953125, -57.400390625, 34.599998474121,0,3,255,0,0,255,0 )	
			setElementVisibleTo ( feuerblip, getRootElement(), false )
			for player, key in pairs (fraktionMembers[15]) do
				setElementVisibleTo ( feuerblip, player, true )
			end	
			addEventHandler("fireElements:onFireExtinguish", feuerelem, function(uPlayer)
				givePlayerSaveMoney ( uPlayer, 500 )
				if uPlayer then
					uPlayer = getPlayerName(uPlayer)
				else
					uPlayer = "niemandem"
				end
				sendMSGForFaction("Ein Feuer wurde von "..uPlayer.." gelöscht.", 15, 255, 0, 0)
				destroyElement (feuerblip)	
			end)		
			setTimer(function()
				destroyElement (feuerblip)
				destroyFireElement (feuerelem)			
			end, 600000, 0)				
		elseif rnd == 3 then
			local feuerelem = createFireElement(-1546.5, 1112.6999511719, 6.8000001907349, 3, false)
			sendMSGForFaction("[Kleinbrand]", 15, 255, 0, 0);
			sendMSGForFaction("[Zentrale]Zentrale an Wache 42", 15, 255, 255, 0);	
			sendMSGForFaction("[Wache 42]Wache 42 hört", 15, 0, 0, 255);	
			sendMSGForFaction("[Zentrale]Es wurde ein feuer nähe SFPD gemeldet!", 15, 255, 255, 0);	
			sendMSGForFaction("[Zentrale]Wir benötigen umgehend ein Feuerwehrfahrzeug", 15, 255, 255, 0);
			sendMSGForFaction("[Wache 42]Unterwegs!", 15, 0,0, 255);
			
			feuerblip = createBlip( -1546.5, 1112.6999511719, 6.8000001907349,0,3,255,0,0,255,0)	
			setElementVisibleTo ( feuerblip, getRootElement(), false )
			for player, key in pairs (fraktionMembers[15]) do
				setElementVisibleTo ( feuerblip, player, true )
			end	
			addEventHandler("fireElements:onFireExtinguish", feuerelem, function(uPlayer)
				givePlayerSaveMoney ( uPlayer, 500 )
				if uPlayer then
					uPlayer = getPlayerName(uPlayer)
				else
					uPlayer = "niemandem"
				end
				sendMSGForFaction("Ein Feuer wurde von "..uPlayer.." gelöscht.", 15, 255, 0, 0)
				destroyElement (feuerblip)	
			end)		
			setTimer(function()
				destroyElement (feuerblip)
				destroyFireElement (feuerelem)			
			end, 600000, 0)				
		elseif rnd == 4 then
			local feuerelem = createFireElement(-1833.5, 332.099609375, 16.200000762939, 3, false)
			sendMSGForFaction("[Kleinbrand]", 15, 255, 0, 0);
			sendMSGForFaction("[Zentrale]Zentrale an Wache 42", 15, 255, 255, 0);	
			sendMSGForFaction("[Wache 42]Wache 42 hört", 15, 0, 0, 255);	
			sendMSGForFaction("[Zentrale]Es wurde ein feuer unter der PD brücke gemeldet!", 15, 255, 255, 0);	
			sendMSGForFaction("[Zentrale]Wir benötigen umgehend ein Feuerwehrfahrzeug", 15, 255, 255, 0);
			sendMSGForFaction("[Wache 42]Unterwegs!", 15, 0,0, 255);
			
			feuerblip = createBlip( -1833.5, 332.099609375, 16.200000762939,0,3,255,0,0,255,0)
			setElementVisibleTo ( feuerblip, getRootElement(), false )
			for player, key in pairs (fraktionMembers[15]) do
				setElementVisibleTo ( feuerblip, player, true )
			end
			addEventHandler("fireElements:onFireExtinguish", feuerelem, function(uPlayer)
				givePlayerSaveMoney ( uPlayer, 500 )	
				if uPlayer then
					uPlayer = getPlayerName(uPlayer)
				else
					uPlayer = "niemandem"
				end
				sendMSGForFaction("Ein Feuer wurde von "..uPlayer.." gelöscht.", 15, 255, 0, 0)
				destroyElement (feuerblip)
							
			end)		
			setTimer(function()
				destroyElement (feuerblip)
				destroyFireElement (feuerelem)			
			end, 600000, 0)				
		elseif rnd == 5 then
			local feuerelem = createFireElement(-1686.5, 409.39999389648, 6.6999998092651, 3, false)
            sendMSGForFaction("[Kleinbrand]", 15, 255, 0, 0);				
			sendMSGForFaction("[Zentrale]Zentrale an Wache 42", 15, 255, 255, 0);	
			sendMSGForFaction("[Wache 42]Wache 42 hört", 15, 0, 0, 255);	
		    sendMSGForFaction("[Zentrale]Es wurde ein Feuer an der Tankstelle Süd in San Fierro gemeldet", 15, 255, 255, 0);	
			sendMSGForFaction("[Zentrale]Wir benötigen umgehend ein Feuerwehrfahrzeug", 15, 255, 255, 0);	
			sendMSGForFaction("[Wache 42]Unterwegs!", 15, 0,0, 255);
			
			feuerblip = createBlip( -1686.5, 409.39999389648, 6.6999998092651,0,3,255,0,0,255,0)
			setElementVisibleTo ( feuerblip, getRootElement(), false )
			for player, key in pairs (fraktionMembers[15]) do
				setElementVisibleTo ( feuerblip, player, true )
			end
			addEventHandler("fireElements:onFireExtinguish", feuerelem, function(uPlayer)
				givePlayerSaveMoney ( uPlayer, 500 )
				if uPlayer then
					uPlayer = getPlayerName(uPlayer)
				else
					uPlayer = "niemandem"
				end
				sendMSGForFaction("Ein Feuer wurde von "..uPlayer.." gelöscht.", 15, 255, 0, 0)
				destroyElement (feuerblip)	
				
			end)		
			setTimer(function()
				destroyElement (feuerblip)
				destroyFireElement (feuerelem)	
				
			end, 500000, 0)				
		elseif rnd == 6 then
			local feuerelem = createFireElement(-995.40002441406, -721.59997558594, 35.40, 3, false)	
			local feuerelem1 = createFireElement(-1055.1999511719, -690.59997558594, 31.799999237061, 3, false)	
			local feuerelem2 = createFireElement(-1068.4000244141, -682.09997558594, 31.799999237061, 3, false)		
			local feuerelem3 = createFireElement(-1043.0999755859, -632.59997558594, 31.5, 3, false)		
			local feuerelem4 = createFireElement(-1069.5999755859, -595.09997558594, 31.5, 3, false)
			local feuerelem5 = createFireElement(-1058.1999511719, -628.59997558594, 31.5, 3, false)						
			sendMSGForFaction("[Großbrand]", 15, 255, 0, 0);	
			sendMSGForFaction("[Zentrale]Zentrale an Wache 42", 15, 255, 255, 0);	
			sendMSGForFaction("[Wache 42]Wache 42 hört", 15, 0, 0, 255);	
			sendMSGForFaction( "[Zentrale]Es wurde ein Großbrand an der Textilfabrik in der nähe des San Fierro Airports gemeldet!", 15, 255, 255, 0 )
			sendMSGForFaction("[Zentrale]Wir benötigen umgehend ein Feuerwehrfahrzeug", 15, 255, 255, 0);
			sendMSGForFaction("[Wache 42]Unterwegs!", 15, 0,0, 255);

			feuerblip = createBlip( -995.40002441406, -721.59997558594, 35.40 ,0,3,255,0,0,255,0)
			feuerblip1 = createBlip( -1055.1999511719, -690.59997558594, 31.799999237061,0,3,255,0,0,255,0)
			feuerblip2 = createBlip( -1068.4000244141, -682.09997558594, 31.799999237061,0,3,255,0,0,255,0)
			feuerblip3 = createBlip( -1043.0999755859, -632.59997558594, 31.5,0,3,255,0,0,255,0)
			feuerblip4 = createBlip( -1069.5999755859, -595.09997558594, 31.5,0,3,255,0,0,255,0)
			feuerblip5 = createBlip( -1058.1999511719, -628.59997558594, 31.5,0,3,255,0,0,255,0)	
			setElementVisibleTo ( feuerblip, getRootElement(), false )
			for player, key in pairs (fraktionMembers[15]) do
				setElementVisibleTo ( feuerblip, player, true )
			end
			
			setElementVisibleTo ( feuerblip1, getRootElement(), false )
			for player, key in pairs (fraktionMembers[15]) do
				setElementVisibleTo ( feuerblip1, player, true )
			end
			setElementVisibleTo ( feuerblip2, getRootElement(), false )
			for player, key in pairs (fraktionMembers[15]) do
				setElementVisibleTo ( feuerblip2, player, true )
			end
			setElementVisibleTo ( feuerblip2, getRootElement(), false )
			for player, key in pairs (fraktionMembers[15]) do
				setElementVisibleTo ( feuerblip2, player, true )
			end
			setElementVisibleTo ( feuerblip3, getRootElement(), false )
			for player, key in pairs (fraktionMembers[15]) do
				setElementVisibleTo ( feuerblip3, player, true )
			end
			setElementVisibleTo ( feuerblip4, getRootElement(), false )
			for player, key in pairs (fraktionMembers[15]) do
				setElementVisibleTo ( feuerblip4, player, true )
			end
			setElementVisibleTo ( feuerblip5, getRootElement(), false )
			for player, key in pairs (fraktionMembers[15]) do
				setElementVisibleTo ( feuerblip5, player, true )
			end
			
			addEventHandler("fireElements:onFireExtinguish", feuerelem, function(uPlayer)
				givePlayerSaveMoney ( uPlayer, 500 )
				if uPlayer then
					uPlayer = getPlayerName(uPlayer)
				else
					uPlayer = "niemandem"
				end
				sendMSGForFaction("Ein Feuer wurde von "..uPlayer.." gelöscht.", 15, 255, 0, 0)
				destroyElement (feuerblip)	
							
			end)

			addEventHandler("fireElements:onFireExtinguish", feuerelem1, function(uPlayer)
				givePlayerSaveMoney ( uPlayer, 500 )
				if uPlayer then
					uPlayer = getPlayerName(uPlayer)
				else
					uPlayer = "niemandem"
				end
				sendMSGForFaction("Ein Feuer wurde von "..uPlayer.." gelöscht.", 15, 255, 0, 0)
				destroyElement (feuerblip1)	
			end)

			addEventHandler("fireElements:onFireExtinguish", feuerelem2, function(uPlayer)
				givePlayerSaveMoney ( uPlayer, 500 )
				if uPlayer then
					uPlayer = getPlayerName(uPlayer)
				else
					uPlayer = "niemandem"
				end
				sendMSGForFaction("Ein Feuer wurde von "..uPlayer.." gelöscht.", 15, 255, 0, 0)
				destroyElement (feuerblip2)	
			end)		

			addEventHandler("fireElements:onFireExtinguish", feuerelem3, function(uPlayer)
					givePlayerSaveMoney ( uPlayer, 500 )
				if uPlayer then
					uPlayer = getPlayerName(uPlayer)
				else
					uPlayer = "niemandem"
				end
				sendMSGForFaction("Ein Feuer wurde von "..uPlayer.." gelöscht.", 15, 255, 0, 0)
				destroyElement (feuerblip3)	
			end)		

			addEventHandler("fireElements:onFireExtinguish", feuerelem4, function(uPlayer)
				givePlayerSaveMoney ( uPlayer, 500 )
				if uPlayer then
					uPlayer = getPlayerName(uPlayer)
				else
					uPlayer = "niemandem"
				end
				sendMSGForFaction("Ein Feuer wurde von "..uPlayer.." gelöscht.", 15, 255, 0, 0)
				destroyElement (feuerblip4)	
			end)		

			addEventHandler("fireElements:onFireExtinguish", feuerelem5, function(uPlayer)
				givePlayerSaveMoney ( uPlayer, 500 )
				if uPlayer then
					uPlayer = getPlayerName(uPlayer)
				else
					uPlayer = "niemandem"
				end
				sendMSGForFaction("Ein Feuer wurde von "..uPlayer.." gelöscht.", 15, 255, 0, 0)
				destroyElement (feuerblip5)
			end)				


			setTimer(function()
				destroyElement (feuerblip)
				destroyElement (feuerblip1)
				destroyElement (feuerblip2)
				destroyElement (feuerblip3)
				destroyElement (feuerblip4)
				destroyElement (feuerblip5)			
				destroyFireElement (feuerelem)	
				destroyFireElement (feuerelem1)
				destroyFireElement (feuerelem2)
				destroyFireElement (feuerelem3)
				destroyFireElement (feuerelem4)
				destroyFireElement (feuerelem5)				
			end, 500000, 0)				
		end		
	end
end
setTimer(createfeuer, 600000 , 0)
--addCommandHandler("createfeuer",createfeuer)




addEventHandler("onPickupHit", FirefighersPickup, function(player)
	if vnxGetElementData(player, "fduty") == true then
		outputChatBox("Gebe /offduty ein um den Dienst zu Verlassen!", player, 255, 0, 0);
	else
		outputChatBox("Gebe /fduty ein um den Dienst zu Betretten!", player, 255, 0, 0);
	end
end) 

addCommandHandler("fduty", function(player)
	
	local x, y, z    = getElementPosition(player);
	local px, py, pz = getElementPosition(FirefighersPickup);
	local distance   = getDistanceBetweenPoints3D(x, y, z, px, py, pz);
	
	if vnxGetElementData(player, "fraktion") == 15	then
		if vnxGetElementData(player, "fduty") == false then		
			if(distance < 3)then			
				outputChatBox("Du hast den Dienst angetreten!", player, 0, 125, 0);
				vnxSetElementData(player, "fduty",true)
				giveWeapon ( player, 42, 10000 )				
			else
				outputChatBox("Du musst dafür am Pickup stehen!", player, 255, 0, 0);
			end
		else
			outputChatBox("Du bist bereits im Dienst!", player, 255, 0, 0);	
		end
	else	
		outputChatBox("Du bist kein Feuerwehrmann!", player, 255, 0, 0);
	end
end)

addCommandHandler("offduty", function(player)
	if vnxGetElementData(player, "fduty") == true then
		local x, y, z    = getElementPosition(player);
		local px, py, pz = getElementPosition(FirefighersPickup);
		local distance   = getDistanceBetweenPoints3D(x, y, z, px, py, pz);
		
		if(distance < 3)then
			outputChatBox("Du hast den Dienst Verlassen!", player, 255, 0, 0);
			vnxSetElementData(player, "fduty",false)
			setPedSkin ( player, vnxGetElementData ( player, "skinid" ) )
			takeAllWeapons ( player )			
		else
			outputChatBox("Du musst am Pickup dafür stehen!", player, 255, 0, 0);
		end
	else
		outputChatBox("Du bist nicht im Dienst!", player, 255, 0, 0);
	end
end)



