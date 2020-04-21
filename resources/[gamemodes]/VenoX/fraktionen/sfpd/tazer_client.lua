-------------------------------
--- The "Taser" Script is a ---
----- Script by schotobi ------
-------- © - 2012/2013 --------
-------------------------------

function isOnStateDuty(player)
	local model = getElementModel(player) 
	if armySkins[model] or fbiSkins[model] or copskins[model] then return true else return false end
end

function isNotInUserHouse ( player )

	if getElementDimension ( player ) >= 5 then
		return false
	else
		return true
	end
end

function onResourceStart()
    txd = engineLoadTXD ("models/silenced.txd")
    engineImportTXD (txd, 347)
	ddf = engineLoadDFF("models/silenced.dff",347)
	engineReplaceModel(ddf, 347)
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), onResourceStart)

local nowtazered = false
local isInCar = false
function stopDamage ( attacker, weapon, bodypart )
	if (weapon == 23) then
	cancelEvent()
		if (isPedInVehicle(getLocalPlayer())) then
			if (getVehicleType(getPedOccupiedVehicle(getLocalPlayer())) == "Bike" ) then
				triggerServerEvent ( "ejectPlayer", getLocalPlayer(), getLocalPlayer() )
				isInCar= false
			else
				isInCar = true
			end
		else
		isInCar = false
		end
		if (doesPedHaveJetPack (getLocalPlayer()) == true) then
			triggerServerEvent ( "removeJetPack", getLocalPlayer(), getLocalPlayer() ) 
		end
		if not (isTimer(tazeredTimer)) and (isInCar == false) then
			triggerServerEvent ( "ontaserAnim", getLocalPlayer(), getLocalPlayer() ) 
			tazeredTimer = setTimer(tazered, 20000, 1, source)
			nowtazered = true
			vnxClientSetElementData("tazered", true)
			local tname = getPlayerName(attacker)
			outputChatBox ( tname.." hat dich ausser Gefecht gesetzt!", 200, 0, 0 )
			--triggerServerEvent ( "OutPutTazerChat", attacker, source) 
		end
	end
	if isTimer(tazeredTimer) then
		cancelEvent()
	end
end
addEventHandler ( "onClientPlayerDamage", getLocalPlayer(), stopDamage )

local haveTaser = true
local preweapon = 0
function changeWeapon()
if isOnStateDuty(lp) then
	if isNotInUserHouse(lp) then
		if not isTimer(dontChangeTimer) then
			if (getElementData(getLocalPlayer(), "Wpn2Norm") == 22) then
				if (getElementData(getLocalPlayer(), "Wpn2Ammo") >= 1) then
					triggerServerEvent ( "changeToTaser", getLocalPlayer(), getLocalPlayer()) 
					dontChangeTimer = setTimer(dontChange, 5000, 1)
					haveTaser = false
					preWeapon = 22
					outputChatBox("Deine Pistole (Schuss: "..getElementData(getLocalPlayer(), "Wpn2Ammo")..") wurde zu einem Taser (Schuss: "..getElementData(getLocalPlayer(), "Wpn2Ammo")..") geändert.",0,150,200)
				end
			end
			if (getElementData(getLocalPlayer(), "Wpn2Norm") == 24) then
				if (getElementData(getLocalPlayer(), "Wpn2Ammo") >= 1) then
					triggerServerEvent ( "changeToTaser", getLocalPlayer(), getLocalPlayer()) 
					dontChangeTimer = setTimer(dontChange, 5000, 1)
					haveTaser = false
					preWeapon = 24
					outputChatBox("Deine Deagle (Schuss: "..getElementData(getLocalPlayer(), "Wpn2Ammo")..") wurde zu einem Taser (Schuss: "..getElementData(getLocalPlayer(), "Wpn2Ammo")..") geändert.", 0,150,200)
					
				end
			end	
			if (getElementData(getLocalPlayer(), "Wpn2Norm") == 23) then
				if (preWeapon == 22) then
					if (getElementData(getLocalPlayer(), "Wpn2Ammo") >= 1) then
						triggerServerEvent ( "changeToPistol", getLocalPlayer(), getLocalPlayer()) 
						dontChangeTimer = setTimer(dontChange, 5000, 1)
						haveTaser = false
						outputChatBox("Dein Taser (Schuss: "..getElementData(getLocalPlayer(), "Wpn2Ammo")..") wurde zu einer Pistole (Schuss: "..getElementData(getLocalPlayer(), "Wpn2Ammo")..") geändert." , 0,150,200)
					end
				end
				if (preWeapon == 24) then
					if (getElementData(getLocalPlayer(), "Wpn2Ammo") >= 1) then
						triggerServerEvent ( "changeToDeagle", getLocalPlayer(), getLocalPlayer()) 
						dontChangeTimer = setTimer(dontChange, 5000, 1)
						haveTaser = false
						outputChatBox("Dein Taser (Schuss: "..getElementData(getLocalPlayer(), "Wpn2Ammo")..") wurde zu einer Deagle (Schuss: "..getElementData(getLocalPlayer(), "Wpn2Ammo")..") geändert.",0,150,200)
					end
				end
			end
		else
			outputChatBox("Du musst 5 Sekunden warten, bevor du die Waffe wieder wechseln kannst.", 255,0,0)
		end
	end
end
end
bindKey("F2", "down", changeWeapon)
	
function dontChange()
	-- leere Func um Timer zu initialisieren
end

function tazered(player)
	triggerServerEvent ( "onNotaserAnim", getLocalPlayer(), getLocalPlayer() )
	nowtazered = false
	vnxClientSetElementData("tazered", false)
end


function clientPreRenderFunc()
    local block, animation = getPedAnimation(localPlayer)
	if (animation == "crckidle4") then
	else
		if (nowtazered) then
			triggerServerEvent ( "ontaserAnim", getLocalPlayer(), getLocalPlayer() ) 
		end
	end
	setElementData(getLocalPlayer(), "Wpn2Ammo", getPedTotalAmmo ( getLocalPlayer(), 2 ))
	setElementData(getLocalPlayer(), "Wpn2Norm", getPedWeapon(getLocalPlayer(), 2))
	if (preweapon == 0) then
		if (getElementData(getLocalPlayer(), "Wpn2Norm") == 23) then
			if getElementData(getLocalPlayer(), "fraktion") ~= 8 then
				triggerServerEvent("takeTazer", getLocalPlayer(), getLocalPlayer())
				setElementData(getLocalPlayer(), "Wpn2Norm", getPedWeapon(getLocalPlayer(), false))
			end
		end
		if (getPedWeapon(getLocalPlayer(), 2) == 22) then
			preweapon = 22
		elseif (getPedWeapon(getLocalPlayer(), 2) == 24) then
			preweapon = 24
		end
	end
--[[if not isOnStateDuty(getLocalPlayer()) then
	triggerServerEvent("takeTazer", getLocalPlayer(), getLocalPlayer())
	preweapon = 0
end]]
end
addEventHandler("onClientPreRender", getRootElement(), clientPreRenderFunc)

function resetTazerPreWpnOnWasted()
	triggerServerEvent("takeTazer", getLocalPlayer(), getLocalPlayer())
	preweapon = 0
end
addEventHandler("onClientPlayerWasted", getLocalPlayer(), resetTazerPreWpnOnWasted)

function resetTazerPreWpnOnSpawn()
	preweapon = 0
end
addEventHandler("onClientPlayerSpawn", getLocalPlayer(), resetTazerPreWpnOnSpawn)

function onClientPlayerWeaponFireFunc(weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement)
	if (weapon == 23) then
		local x,y,z = hitX, hitY, hitZ
		--outputChatBox("X: "..x.." Y: "..y.." Z: "..z)
		local sound = playSound3D ("sounds/taser.wav",hitX,hitY,hitZ, false)
		setSoundVolume (sound, 100)
		setSoundMaxDistance(sound, 16)
		
	end

end

addEvent ("onSound", true)
addEventHandler ("onSound", getRootElement(), onClientPlayerWeaponFireFunc)
addEventHandler("onClientPlayerWeaponFire", getRootElement(), onClientPlayerWeaponFireFunc)