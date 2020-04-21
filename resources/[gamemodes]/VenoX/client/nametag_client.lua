UI = {
	style  = 1,
	font ='clear',
	font_STATUS = 'default-bold',
	status_active = true,
	}
nameTagVisible = {}
local target = nil
			

function UI.toggle(state) 
	UI.standart_nametag(false) 
	UI.tick = getTickCount() 
	UI.status_enabled = true
	UI.endTick = UI.tick + 2000
	addEventHandler('onClientRender',root,UI.render)		
end
addEventHandler('onClientResourceStart',resourceRoot,UI.toggle)

addEventHandler('onClientPlayerJoin',root,function()
	setPlayerNametagShowing ( source, false )
end )
		
		
function UI.render() 
	local px, py, pz = getCameraMatrix()
	local players = getElementsByType ( "player", root, true )
	local frak = getElementData ( localPlayer, "fraktion" )
	for i=1, #players do
		local player = players[i]
		if player ~= localPlayer then
			local x, y, z = getPedBonePosition ( player, 8 )
			local dist = math.sqrt ( ( px - x ) ^ 2 + ( py - y ) ^ 2 + ( pz - z ) ^ 2 )
			local targeted = false
			if dist > 30 and target == player then
				dist = 30
				targeted = true
			end
			if dist <= 30 then
				if isLineOfSightClear ( px, py, pz, x, y, z, true, false, false, true, false, false, false, localPlayer ) then 
					local sx, sy = getScreenFromWorldPosition ( x, y, z + 0.3 + dist * 0.013333 )
					if sx and sy then
						local r, g, b = returnRGBFromHealth ( player )
						local name = getPlayerName ( player )
						local adminlvl = getElementData(player, "adminlvl")
						if adminlvl >= 3 then
							name = "[VnX]"..name
						else
							name = name
						end
						local status = getElementData ( player, "writingState" ) or getElementData(player, "socialState") or "VenoX"
						local namesize = 2+ ( 15 - dist ) * 0.01
						local pfrak = getElementData ( player, "fraktion")
						local tHeight = dxGetFontHeight(1.5+ ( 15 - dist ) * 0.02,"default-bold")
						local wanted = getElementData ( player, "wanteds" )
						if wanted and wanted > 0 then
							if pfrak == 1 then 
								dxDrawImage ( sx+22, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/police.png" )
							elseif pfrak == 2 then
								dxDrawImage ( sx+22, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/brotherhood.png" )
							elseif pfrak == 3 then 
								dxDrawImage ( sx+22, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/triaden.png" )
							elseif pfrak == 7 then 
								dxDrawImage ( sx+22, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/aztecas.png" )
							elseif pfrak == 8 then 
								dxDrawImage ( sx+22, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/army.png" )
							elseif pfrak == 9 then 
								dxDrawImage ( sx+22, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/biker.png" )
							elseif pfrak == 10 then 
								dxDrawImage ( sx+22, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/medic.png" )
							elseif pfrak == 11 then 
								dxDrawImage ( sx+22, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/oamt.png" )
							elseif pfrak == 12 then 
								dxDrawImage ( sx+22, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/ballas.png" )
							elseif pfrak == 13 then 
								dxDrawImage ( sx+22, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/grove.png" )
							elseif pfrak == 14 then 
								dxDrawImage ( sx+22, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/mafia.png" )
							else 
								if getElementData(player, "playingtime") <= 60 then 
									dxDrawImage ( sx+22, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/arbeitslos.png" )
								end
							end
						else 
							if pfrak == 1 then 
								dxDrawImage ( sx-22, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/police.png" )
							elseif pfrak == 2 then
								dxDrawImage ( sx-22, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/brotherhood.png" )
							elseif pfrak == 3 then 
								dxDrawImage ( sx-22, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/triaden.png" )
							elseif pfrak == 7 then 
								dxDrawImage ( sx-22, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/aztecas.png" )
							elseif pfrak == 8 then 
								dxDrawImage ( sx-22, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/army.png" )
							elseif pfrak == 9 then 
								dxDrawImage ( sx-22, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/biker.png" )
							elseif pfrak == 10 then 
								dxDrawImage ( sx-22, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/medic.png" )
							elseif pfrak == 11 then 
								dxDrawImage ( sx-22, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/oamt.png" )
							elseif pfrak == 12 then 
								dxDrawImage ( sx-22, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/ballas.png" )
							elseif pfrak == 13 then 
								dxDrawImage ( sx-22, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/grove.png" )
							elseif pfrak == 14 then 
								dxDrawImage ( sx-22, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/mafia.png" )
							else 
								if getElementData(player, "playingtime") <= 60 then 
									dxDrawImage ( sx-22, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/arbeitslos.png" )
								end
							end
						end
						dxDrawText ( name, sx-1, sy, sx-1, sy, tocolor ( 0, 0, 0, 255 ), namesize, "default-bold", "center", "center" )
						dxDrawText ( name, sx, sy, sx, sy, tocolor ( r, g, b, 255 ), namesize, "default-bold", "center", "center" )
						if not targeted then 
							local tHeight = dxGetFontHeight(1.5+ ( 15 - dist ) * 0.02,"default-bold")
							local statussize = getBestFontSize ( 0.9+ ( 15 - dist ) * 0.02 )
							dxDrawText ( status, sx, sy +tHeight*0.6, sx, sy+tHeight, tocolor ( 0, 0, 0, 255 ), statussize, "default-bold", "center", "center" )
							if evilFraction[frak] and ( evilFraction[pfrak] and frak ~= pfrak or goodFraction[pfrak] ) or goodFraction[frak] and evilFraction[pfrak] then
								dxDrawText ( status, sx - 1, (sy +tHeight*0.6), sx-1, sy+tHeight, tocolor ( 200, 0, 0, 255 ), statussize, "default-bold", "center", "center" )
							else
								dxDrawText ( status, sx - 1, (sy +tHeight*0.6), sx-1, sy+tHeight, tocolor ( 0, 200, 0, 255 ), statussize, "default-bold", "center", "center" )
							end
						end
						if pfrak == 0 then
							if blacklistArray[name] then
								if evilFraction[frak] then
									dxDrawImage ( sx-22, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/target.png" )
								end
							end
						end
						if frak == 1 or frak == 2 or frak == 3 or frak == 4 or frak == 5 or frak == 6 or frak == 7 or frak == 8 or frak == 9 or frak == 10 or frak == 11 or frak == 12 or frak == 13 or frak == 14 or frak == 15 then
							local wanted = getElementData ( player, "wanteds" )
							if wanted and wanted > 0 then
								dxDrawImage ( sx-44, sy-tHeight*1.9, 44, tHeight*1.45, "images/nametag/wanted1.png" )
								dxDrawText ( wanted, sx-44, sy-tHeight*1.9, sx, sy-tHeight*0.55, tocolor ( 0, 0, 0, 255 ), 1.3, "default-bold", "center", "center", false, false )
							end
						end
					end
				end					
			end
		end
	end
end


function getBestFontSize ( size )
	local s = {guiGetScreenSize()}
	return math.abs ( ( s[1]/1920-1 + s[2]/1080-1 ) * 0.3*size + size )
end

		
	function UI.standart_nametag(state) 
		local all = getElementsByType('player')
		for i=1, #all do 
			setPlayerNametagShowing(all[i],state)
		end
	end
		
			
	function UI.getHealthNode(plObj) 
		local health = getElementHealth(plObj) 
		local armor = getPedArmor(plObj)
		local result = false
		local armor_percnt = armor / 100
			if armor > 0 then 
				local ret_col = 170 * (armor_percnt )
				result =  tocolor(ret_col+50,ret_col+50,ret_col+50,255)
			elseif health == 0 then 
				result =  tocolor(0,0,0,255)
			else
				local r,g = getRGColorFromPercentage(health)
				result =  tocolor(r,g,0,255)
			end
			return result;
		end
		
		function getRGColorFromPercentage(percentage)
			if not percentage or percentage and type(percentage) ~= "number" or percentage > 100 or percentage < 0 then outputDebugString( "Invalid argument @ 'getRGColorFromPercentage'", 2 ) return false end
			if percentage > 50 then
				local temp = 100 - percentage
				return temp*5.1, 255
			elseif percentage == 50 then
				return 255, 255
			else
				return 255, percentage*5.1
			end
		end
		


function returnRGBFromHealth ( player )

	local hp = getElementHealth ( player )
	local armor = getPedArmor ( player )
	if hp <= 0 then
		return 0, 0, 0
	else
		if armor > 0 then
			armor = math.abs ( armor - 0.01 )
			return 0 + (2.55*armor), (255), 0 + (2.55*armor)
		else
		hp = math.abs ( hp - 0.01 )
		return ( 100 - hp ) * 2.55 / 2, ( hp * 2.55 ), 0
		end
	end
end


function removeEventsOnTargetStop (button, press)
	if button == "mouse2" and press == false then
		target = nil
		removeEventHandler("onClientKey", getLocalPlayer(), removeEventsOnTargetStop)
	end
end

addEventHandler("onClientPlayerTarget", getRootElement(), function(element) 
	if element and getElementType (element) == "player" then
		if getPedWeaponSlot (element) == 5 or getPedWeaponSlot (element) == 6 then
			if getPedControlState ("aim_weapon") == true then
				target = getPlayerName(element)  
				removeEventHandler("onClientKey", getLocalPlayer(), removeEventsOnTargetStop)
				addEventHandler("onClientKey", getLocalPlayer(), removeEventsOnTargetStop)
			else
				target = nil
			end
		else
			target = nil
		end
	else
		target = nil
	end
end)



local chatison = false
 
addEventHandler ( "onClientKey", root, function ( )
     local chatboxactive = isChatBoxInputActive()
     if not chatison and chatboxactive then
          chatison = true
          setElementData ( localPlayer, "writingState", "Schreibt ..." ) 
     elseif chatison and not chatboxactive then
          chatison = false
          setElementData ( localPlayer, "writingState", false ) 
     end
end )