-------------------------------
--- The "Taser" Script is a ---
----- Script by schotobi ------
-------- © - 2012/2013 --------
-------------------------------

setWeaponProperty(23, "pro", "damage", 2)
setWeaponProperty(23, "std", "damage", 2)
setWeaponProperty(23, "poor", "damage", 2)
setWeaponProperty(23, "pro", "maximum_clip_ammo", 1)
setWeaponProperty(23, "std", "maximum_clip_ammo", 1)
setWeaponProperty(23, "poor", "maximum_clip_ammo", 1)
setWeaponProperty(23, "pro", "weapon_range", 35/3)
setWeaponProperty(23, "std", "weapon_range", 35/3)
setWeaponProperty(23, "poor", "weapon_range", 35/3)
setWeaponProperty(23, "pro", "move_speed", 2)
setWeaponProperty(23, "std", "move_speed", 2)
setWeaponProperty(23, "poor", "move_speed", 2)

function ejectPlayerFunc (player)
	removePedFromVehicle(player)
end
addEvent( "ejectPlayer", true )
addEventHandler( "ejectPlayer", getRootElement(), ejectPlayerFunc )

function removeJetPackFunc (player)
	removePedJetPack(player)
end
addEvent( "removeJetPack", true )
addEventHandler( "removeJetPack", getRootElement(), ejectPlayerFunc )

function changeToDeagleFunc (player)
	if (getElementData(player, "Wpn2Ammo") >= 1) then
		giveWeapon ( player, 24, getElementData(player, "Wpn2Ammo"), true )
	end
end
addEvent( "changeToDeagle", true )
addEventHandler( "changeToDeagle", getRootElement(), changeToDeagleFunc )

function changeToPistolFunc (player)
	if (getElementData(player, "Wpn2Ammo") >= 1) then
		giveWeapon ( player, 22, getElementData(player, "Wpn2Ammo"), true )
	end
end
addEvent( "changeToPistol", true )
addEventHandler( "changeToPistol", getRootElement(), changeToPistolFunc )

function changeToTaserFunc (player)
	if (getElementData(player, "Wpn2Ammo") >= 1) then
		giveWeapon ( player, 23, getElementData(player, "Wpn2Ammo"), true )
	end
end
addEvent( "changeToTaser", true )
addEventHandler( "changeToTaser", getRootElement(), changeToTaserFunc )

--[[function OutPutTazerChatFunc (attacker, tazered)
local pname = getPlayerName(tazered)
outputChatBox ( "Du hast "..pname.." ausser Gefecht gesetzt!", attacker, 0, 200, 0 )
end
addEvent( "OutPutTazerChat", true )
addEventHandler( "OutPutTazerChat", getRootElement(), OutPutTazerChatFunc )]]

function takeTazerFunc (player)
	takeWeapon(player, 23)
end
addEvent( "takeTazer", true )
addEventHandler( "takeTazer", getRootElement(), takeTazerFunc )

function taserAnim(player)
	setPedAnimation(player, "CRACK", "crckidle4", -1, true, true, false)
end
addEvent( "ontaserAnim", true )
addEventHandler( "ontaserAnim", getRootElement(), taserAnim )

function notaserAnim(player)
	setPedAnimation(player)
end
addEvent( "onNotaserAnim", true )
addEventHandler( "onNotaserAnim", getRootElement(), notaserAnim )