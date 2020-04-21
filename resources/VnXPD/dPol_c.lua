--//
--||	 	dPol von MasterM
--||	 	Version 1.2
--||		Texturen und Sounds von deutschen Polizeiwagen
--\\


local lp = localPlayer


--//
--||	 	Funktion, die neue Shader-Elemente erstellt
--\\

local function createSwapShader(imgpath)
	local myTexture = dxCreateTexture(imgpath)
	if not myTexture then outputDebugString("Konnte die Textur "..imgpath.." nicht erstellen!") end
	local shader = dxCreateShader("res/swap.fx")
		if shader then
			dxSetShaderValue(shader, "swap", myTexture)
			return shader
		else
			outputDebugString("Konnte den Shader 'res/swap.fx' nicht finden!")
		end
	return false
end


addEventHandler("onClientResourceStart",root,function()
		--Swap-Shader erstellen (tauscht Texturen)
		local carShader = createSwapShader("res/img/copcar.png")
		local ranchShader = createSwapShader("res/img/copranch.png")
		local decalShader = createSwapShader("res/img/copdec.png")
		local policeShader = createSwapShader("res/img/Pol.png")
		local ambuShader = createSwapShader("res/img/ambulance.png")
		local fireClearShader = createSwapShader("res/img/fireclear.png")
		local fireShader = createSwapShader("res/img/firedecal.png")
		
		-- Texturen mit Shader ersetzen
		engineApplyShaderToWorldTexture(carShader, "copcarla92interior128")
		--engineApplyShaderToWorldTexture(carShader, "copcarsf92interior128")
		--engineApplyShaderToWorldTexture(carShader, "copcarvg92interior128")
		--engineApplyShaderToWorldTexture(ranchShader, "copcarru92interior128")
		engineApplyShaderToWorldTexture(decalShader, "vehiclepoldecals128") --Die Shader wo VnX PD steht 
		--engineApplyShaderToWorldTexture(policeShader, "copbike92decalSA64")
		--engineApplyShaderToWorldTexture(policeShader, "polmav92sadecal64")
		--engineApplyShaderToWorldTexture(policeShader, "fbitruck92decalsa64")
		engineApplyShaderToWorldTexture(ambuShader, "ambulan92decal128")
		--engineApplyShaderToWorldTexture(fireClearShader, "firetruk92sign64")
		--engineApplyShaderToWorldTexture(fireShader, "firetruk92decal")
end)


--//
--||	 	neuen Sound abspielen
--\\
--[[
vehsWithSound = {}
setWorldSoundEnabled( 17, 10, false) -- keine Sirene mehr
setWorldSoundEnabled( 17, 11, false) -- die Sirene beim längeren Drücken von H
local function startSiren(veh,sirenType)
		vehsWithSound[veh] = playSound3D("res/sound/"..sirenType..".wav",0,0,0,true)
		setSoundMaxDistance(vehsWithSound[veh],100)
		attachElements(vehsWithSound[veh],veh)
end

local function stopSiren(veh)
	stopSound(vehsWithSound[veh])
end

addEvent("cStartSiren",true)
addEventHandler("cStartSiren",lp,startSiren,veh,temp_speed)
addEvent("cStopSiren",true)
addEventHandler("cStopSiren",lp,stopSiren,veh)

]]




