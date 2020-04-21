--//
--||	 	dPol von MasterM
--||	 	Version 1.2
--||		Texturen und Sounds von deutschen Polizeiwagen
--\\


--//
--||	 	Sirenen für existierende Fahrzeuge
--\\

--[[for i,v in ipairs(getElementsByType("vehicle")) do
local model = getElementModel(v)
local veh = v
	if model == 596 or model == 597 or model == 598 then -- Polizeiwagen
		removeVehicleSirens(veh)
		addVehicleSirens(veh, 4, 2, true, true, false, true)
		setVehicleSirens(veh, 1, -0.6, -0.4, 1, 0, 0, 255, 255, 255)
		setVehicleSirens(veh, 2, 0.6, -0.4, 1, 0, 0, 255, 255, 255)
		setVehicleSirens(veh, 3, -0.3, -0.4, 1, 0, 0, 255, 255, 255)
		setVehicleSirens(veh, 4, 0.3, -0.4, 1, 0, 0, 255, 255, 255)
	elseif model == 599 then -- Ranger
		removeVehicleSirens(veh)
		addVehicleSirens(veh, 2, 2, true, true, false, true)
		setVehicleSirens(veh, 1, -0.6, 0, 1.2, 0, 0, 255, 255, 255)
		setVehicleSirens(veh, 2, 0.6, 0, 1.2, 0, 0, 255, 255, 255)
	end
end


--//
--||	 	https://www.youtube.com/watch?v=Jnj8yhwFVkI = Krankenwagen
--||	 	https://www.youtube.com/watch?v=g7yRrHPEjbg = Feuerwehr
--||	 	https://www.youtube.com/watch?v=dcgiTFHMMAw = Polizei
--\\

local polVeh = {
["Police LS"] = true,
["Police SF"] = true,
["Police LV"] = true,
["Police Ranger"] = true,
["HPV1000"] = true,
}

local fireVeh = {
["Fire Truck Ladder"] = true,
["Fire Truck"] = true,
}

local ambuVeh = {
	["Ambulance"] = true,
	["Enforcer"] = true,
	["FBI Rancher"] = true,
	["FBI Truck"] = true,
	["S.W.A.T."] = true,
}
local sirenType = "Sirene"
vehsWithSound = {}

local function forceStopSound()
	if vehsWithSound[source] then
			vehsWithSound[source] = false
			triggerClientEvent("cStopSiren",root,source)
			setVehicleSirensOn(source,false)
			removeEventHandler("onVehicleExplode",source,forceStopSound)
			removeEventHandler("onVehicleRespawn",source,forceStopSound)
			removeEventHandler("onElementDestroy",source,forceStopSound)
	end
end
addEventHandler("onVehicleExit",getRootElement(),forceStopSound)

local function triggerSoundForCars(_,_,_,veh)
	setTimer(function()
	if getVehicleName(veh) == "Mr. Whoopee" then return end -- Eiswagen exploit
		if getVehicleSirensOn(veh) then
			if not vehsWithSound[veh] then
			vehsWithSound[veh] = true

			if polVeh[getVehicleName(veh)] then
				sirenType = "Polizei"
			elseif fireVeh[getVehicleName(veh)] then
				sirenType = "Feuerwehr"
			elseif ambuVeh[getVehicleName(veh)] then
				sirenType = "Sirene"
			end
			triggerClientEvent("cStartSiren",root,veh,sirenType)
			addEventHandler("onVehicleExplode",veh,forceStopSound)
			addEventHandler("onVehicleRespawn",veh,forceStopSound)
			addEventHandler("onElementDestroy",veh,forceStopSound)
			end
		elseif vehsWithSound[veh] then
		vehsWithSound[veh] = false
			triggerClientEvent("cStopSiren",root,veh)
			removeEventHandler("onVehicleExplode",veh,forceStopSound)
			removeEventHandler("onVehicleRespawn",veh,forceStopSound)
			removeEventHandler("onElementDestroy",veh,forceStopSound)
		end

	end,200,1) 
end


addEventHandler("onVehicleStartEnter",getRootElement(),
function(player,seat) 
	if seat == 0 then
		bindKey(player,"horn","down",triggerSoundForCars,source) 
	end
end)
	
addEventHandler("onVehicleStartExit",getRootElement(),
function(player,seat) 
	if seat == 0 and isKeyBound(player,"horn","down",triggerSoundForCars) then
		unbindKey(player,"horn","down",triggerSoundForCars)
	end
end)

	
--//
--||	 	Funktionen, um Sirenen für Fahrzeuge hinzuzufügen
--\\

dPolVehicles = { -- Polizeiwagen mit neuer Sirene
	[596] = true,
	[597] = true,
	[598] = true,
	[599] = true,
}


_createVehicle = createVehicle

]]

function createVehicle(...)
	local args = {...}
	local veh = _createVehicle(...)
		if dPolVehicles[args[1]] then -- Sirenen
			if args[1] == 599 then -- Ranger
				--removeVehicleSirens(veh)
				--addVehicleSirens(veh, 2, 2, true, true, false, true)
				--setVehicleSirens(veh, 1, -0.6, 0, 1.2, 0, 0, 255, 255, 255)
				--setVehicleSirens(veh, 2, 0.6, 0, 1.2, 0, 0, 255, 255, 255)
			else
				--removeVehicleSirens(veh)
				--addVehicleSirens(veh, 4, 2, true, true, false, true)
				--setVehicleSirens(veh, 1, -0.7, -0.4, 0.95, 0, 0, 255, 255, 255)
				--setVehicleSirens(veh, 2, 0.7, -0.4, 0.95, 0, 0, 255, 255, 255)
				--setVehicleSirens(veh, 3, -0.4, -0.4, 0.95, 0, 0, 255, 255, 255)
				--setVehicleSirens(veh, 4, 0.4, -0.4, 0.95, 0, 0, 255, 255, 255)
			end
		end 
	return veh
end

--//
--||	 	Testabteil (Code aktivieren -> Fahrzeuge in der Mitte der Map)
--\\

--[[
veh = createVehicle(523,7,-13,3)--Bike
setVehicleColor(veh,0,59,128,255,255,255)
veh = createVehicle(596,10,-11,3)--LS
setVehicleColor(veh,0,59,128,255,255,255)
veh = createVehicle(597,13,-9,3)--SF
setVehicleColor(veh,0,59,128,255,255,255)
veh = createVehicle(598,16,-7,3)--LV
setVehicleColor(veh,0,59,128,255,255,255)
veh = createVehicle(599,19,-5,3)--Ranger
setVehicleColor(veh,0,59,128,255,255,255)
veh = createVehicle(601,22,-3,3)--SWAT
setVehicleColor(veh,0,59,128,255,255,255)
veh = createVehicle(528,25,-1,3)--FBI Truck
setVehicleColor(veh,0,59,128,255,255,255)
veh = createVehicle(497,28,1,3)--Maverick
setVehicleColor(veh,0,59,128,255,255,255)
veh = createVehicle(427,31,3,3)--Enforcer
setVehicleColor(veh,0,59,128,255,255,255)
]]