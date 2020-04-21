--Controls--
function bot_func ( player, cmd, model, gun )

	local pname = getPlayerName ( player )
	if not _G["Bot"..pname] and tonumber ( getElementData ( player, "adminlvl" ) ) >= 3 then
		setElementData ( player, "protectorbot", true )
		addEventHandler ( "onVehicleExit", player, botMasterVehExit )
		addEventHandler ( "onPlayerDamage", player, botMasterAttacket )
		local x, y, z = getElementPosition ( player )
		_G["Bot"..pname] = createPed ( tonumber(model), x+3, y, z )
		if not _G["Bot"..pname] then 
			_G["Bot"..pname] = createPed ( tonumber(75), x+3, y, z )
		end
		setBotFollowing ( _G["Bot"..pname], player )
		setElementData ( _G["Bot"..pname], "attacks", "none" )
		setElementData ( _G["Bot"..pname], "master", pname )
		setElementData ( _G["Bot"..pname], "isInVeh", false )
		local gun = tonumber(gun)
		if not gun then gun = 31 end
		setElementData ( _G["Bot"..pname], "gun", tonumber(gun) )
		outputChatBox ( "Du hast einen Bot erstellt! Verwende /follow [Name] bzw. /follow, damit er jemandem folgt", player, 0, 200, 0 )
		outputChatBox ( "oder stehen bleibt. Verwende /attack [Name] bzw. /attack, damit er jemandem attackiert. /newweapon [Waffe]", player, 0, 200, 0 )
		outputChatBox ( "zum Waffe aendern. Um deinen Bot in ein Fahrzeug bzw. hinaus zu transportieren, tippe /botin oder /botout!", player, 0, 200, 0 )
		giveWeapon ( _G["Bot"..pname], getElementData ( _G["Bot"..pname], "gun" ), 9999, true )
	else
		if _G["Bot"..pname] then
			removeElementData ( _G["Bot"..pname], "follows" )
			removeElementData ( _G["Bot"..pname], "attacks" )
			removeElementData ( _G["Bot"..pname], "master" )
			removeElementData ( _G["Bot"..pname], "isAiming" )
			removeElementData ( _G["Bot"..pname], "gun" )
			removeElementData ( _G["Bot"..pname], "isInVeh" )
			destroyElement ( _G["Bot"..pname] )
			_G["Bot"..pname] = nil
			setElementData ( player, "protectorbot", false )
		end
	end
end
addCommandHandler ( "bot", bot_func )
function follow_func ( player, cmd, target )

	local pname = getPlayerName ( player )
	if _G["Bot"..pname] then
		local target = getPlayerFromName ( target )
		setBotFollowing ( _G["Bot"..pname], target )
	end
end
addCommandHandler ( "follow", follow_func )
function attack_func ( player, cmd, target )

	local pname = getPlayerName ( player )
	if _G["Bot"..pname] then
		local target = getPlayerFromName ( target )
		setBotAttack ( _G["Bot"..pname], target )
	end
end
addCommandHandler ( "attack", attack_func )
function botin_func ( player )

	local veh = getPedOccupiedVehicle ( player )
	if veh then
		for i = 1, 3 do
			if getVehicleOccupant ( veh, i ) == false then
				local pname = getPlayerName ( player )
				warpPedIntoVehicle ( _G["Bot"..pname], veh, i )
				break
			end
		end
	end
end
addCommandHandler ( "botin", botin_func )
function botout_func ( player )

	local pname = getPlayerName ( player )
	removePedFromVehicle ( _G["Bot"..pname] )
end
addCommandHandler ( "botout", botout_func )
function newweapon_func ( player, newgun )

	local pname = getPlayerName ( player )
	setElementData ( bot, "gun", tonumber ( newgun ) )
end
addCommandHandler ( "newweapon", newweapon_func )

function botMasterAttacket ( attacker )

	if attacker then
		if getPlayerName(attacker) then
			local pname = getPlayerName(source)
			if pname ~= getPlayerName(attacker) then
				if getElementData ( source, "protectorbot" ) then
					setBotAttack ( _G["Bot"..pname], attacker )
					setElementData ( _G["Bot"..pname], "follows", "none" )
					setElementData ( _G["Bot"..pname], "attacks", getPlayerName(attacker) )
				end
			end
		end
	end
end
function botMasterVehExit ( player )

	if getElementData ( player, "protectorbot" ) then
		local pname = getPlayerName(player)
		removePedFromVehicle ( _G["Bot"..pname] )
		setElementData ( _G["Bot"..pname], "isInVeh", false )
		setBotFollowing ( _G["Bot"..pname], player )
	end
end
--Funktionen--
function setBotFollowing ( bot, player )

	if getElementData ( bot, "follows" ) == getPlayerName ( player ) then
		setElementData ( bot, "follows", "none" )
	else
		setElementData ( bot, "follows", getPlayerName ( player ) )
		setTimer ( botFollowCheck, 250, 1, bot )
	end
end
function botFollowCheck ( bot )

	local player = getPlayerFromName ( getElementData ( bot, "follows" ) )
	if player then
		if getPedOccupiedVehicle ( player ) and not getElementData ( bot, "isInVeh" ) then
			local veh = getPedOccupiedVehicle ( player )
			if veh then
				for i = 1, 3 do
					if getVehicleOccupant ( veh, i ) == false then
						warpPedIntoVehicle ( bot, veh, i )
						setElementData ( bot, "isInVeh", true )
						break
					end
				end
			end
		elseif not getPedOccupiedVehicle ( player ) and not getElementData ( bot, "isInVeh" ) then
			local x1, y1, z1 = getElementPosition ( bot )
			local x2, y2, z2 = getElementPosition ( player )
			local distance = getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 )
			if distance >= 5 then
				setBotPerfectFastAnimation ( bot )
				setPedRotation ( bot, findRotation(x1,y1,x2,y2) )
			elseif distance < 5 and distance > 1 then
				setBotPerfectSlowAnimation ( bot )
				setPedRotation ( bot, findRotation(x1,y1,x2,y2) )
			else
				setPedAnimation ( bot )
			end
			setTimer ( botFollowCheck, 250, 1, bot )
		end
	else
		setPedAnimation ( bot )
	end
end

function setBotPerfectFastAnimation ( bot )

	if getPedWeaponSlot ( bot ) == 0 then
		setPedAnimation ( bot, "ped", "run_civi" )
	else
		setPedAnimation ( bot, "ped", "run_armed" )
	end
end
function setBotPerfectSlowAnimation ( bot )

	if getPedWeaponSlot ( bot ) == 0 then
		setPedAnimation ( bot, "ped", "WALK_civi" )
	else
		setPedAnimation ( bot, "ped", "WALK_armed" )
	end
end

function setBotAttack ( bot, target )

	if getElementData ( bot, "attacks" ) == getPlayerName ( target ) then
		setElementData ( bot, "attacks", "none" )
		setElementData ( bot, "isAiming", false )
	else
		setElementData ( bot, "attacks", getPlayerName ( target ) )
		setTimer ( botAttackCheck, 250, 1, bot )
	end
end
function botAttackCheck ( bot )

	giveWeapon ( bot, getElementData ( bot, "gun" ), 100, true )
	local player = getPlayerFromName ( getElementData ( bot, "attacks" ) )
	if player then
		if isPedDead ( player ) then
			sendBotBackToMaster ( bot )
		else
			local x1, y1, z1 = getElementPosition ( bot )
			local x2, y2, z2 = getElementPosition ( player )
			local distance = getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 )
			if distance <= gunrange[getPedWeaponSlot(bot)] then
				if not getElementData ( bot, "isAiming" ) then
					local players = getElementsByType ( "player" )
					for theKey,thePlayer in ipairs(players) do
						triggerClientEvent ( thePlayer, "letBotReAim", getRootElement(), getElementData ( bot, "attacks" ), bot )
					end
					setPedAnimation ( bot )
					setElementData ( bot, "isAiming", true )
				end
			elseif distance > gunrange[getPedWeaponSlot(bot)] and distance < 30 then
				setBotPerfectFastAnimation ( bot )
				setPedRotation ( bot, findRotation(x1,y1,x2,y2) )
				if getElementData ( bot, "isAiming" ) == true then
					setElementData ( bot, "isAiming", false )
				end
			else
				setBotPerfectFastAnimation ( bot )
				setPedRotation ( bot, findRotation(x1,y1,x2,y2) )
				if getElementData ( bot, "isAiming" ) == true then
					setElementData ( bot, "isAiming", false )
				end
				setElementData ( bot, "attacks", "none" )
				setBotFollowing ( bot, getPlayerFromName(getElementData(bot,"master")) )
			end
			setTimer ( botAttackCheck, 250, 1, bot )
		end
	else
		sendBotBackToMaster ( bot )
	end
end
function sendBotBackToMaster ( bot )
	setBotPerfectFastAnimation ( bot )
	setPedRotation ( bot, findRotation(x1,y1,x2,y2) )
	if getElementData ( bot, "isAiming" ) == true then
		setElementData ( bot, "isAiming", false )
	end
	setElementData ( bot, "attacks", "none" )
	setBotFollowing ( bot, getPlayerFromName(getElementData(bot,"master")) )
end
function findRotation(x1,y1,x2,y2)
 
	local t = -math.deg(math.atan2(x2-x1,y2-y1))
	if t < 0 then t = t + 360 end;
	return t;
end