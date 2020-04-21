--//
--||  PROJECT:  fireElements
--||  AUTHOR:   MasterM
--||  DATE:     October 2015
--\\


--//
--||  settings
--\\

local setting_decayTime = 10000 -- duration in ms to decrease the fire size (only when decaying is set to true)


--//
--||  script
--\\

local tblFires = {}
local tblLastFireOfPlayer = {} -- spam protection
addEvent("fireElements:requestFireDeletion", true)
addEvent("fireElements:onFireExtinguish")


--//
--||  destroyFireElement
--||  	parameters:
--||  		uElement	= the fire element
--||  		uDestroyer	= the player who should destroy (extinguish) the fire, otherwise false
--||  	returns: success of the function
--\\

function destroyFireElement(uElement, uDestroyer)
	if tblFires[uElement] then
		triggerClientEvent("fireElements:onFireDestroy", resourceRoot, uElement) -- uElement cannot be the triggered source element because it's destroyed lol
		if isElement(uElement) then
			triggerEvent("fireElements:onFireExtinguish", uElement, uDestroyer, tblFires[uElement].iSize)
			destroyElement(uElement)
		end
		if isTimer(tblFires[uElement].uDecayTimer) then
			killTimer(tblFires[uElement].uDecayTimer)
		end
		tblFires[uElement] = nil
		return true
	end
	return false
end


--//
--||  decreaseFireSize (local)
--||  	parameters:
--||  		uFire		= the fire element
--\\

local function decreaseFireSize(uFire)
	if tblFires[uFire].iSize > 1 then
		tblFires[uFire].iSize = tblFires[uFire].iSize - 1
		setElementHealth(uFire, 100) -- renew fire
		triggerClientEvent("fireElements:onFireDecreaseSize", uFire, tblFires[uFire].iSize)
		return true
	end
	return false
end


--//
--||  setFireDecaying
--||  	parameters:
--||  		uFire		= the fire element
--||  		bDecaying	= should the fire extinguish itself?
--\\


function setFireDecaying(uFire, bDecaying)
	if isTimer(tblFires[uFire].uDecayTimer) then
		killTimer(tblFires[uFire].uDecayTimer)
	end

	if bDecaying then
		tblFires[uFire].uDecayTimer = setTimer(function()
			if tblFires[uFire].iSize > 1 then
				decreaseFireSize(uFire)
			else
				destroyFireElement(uFire)
			end
		end, setting_decayTime+math.random(-500,500), tblFires[uFire].iSize)
	end
	return true
end


--//
--||  createFireElement
--||  	parameters:
--||  		iX, iY, iZ	= coordinates of the new fire
--||  		iSize		= the size between 1-3, where 1 equals small
--||  		bDecaying	= should the fire extinguish itself?
--||  	returns: the fire element (a ped)
--\\

function createFireElement(iX, iY, iZ, iSize, bDecaying)
	if tonumber(iX) and tonumber(iY) and tonumber(iZ) and tonumber(iSize) and iSize >= 1 and iSize <= 3 then
		local uPed = createPed(0, iX, iY, iZ, 0, false)
			setElementFrozen(uPed, true)
			setElementAlpha(uPed, 0)
		tblFires[uPed] = {}
		tblFires[uPed].iSize = iSize
		setFireDecaying(uPed, bDecaying)
		triggerClientEvent("fireElements:onFireCreate", uPed, iSize)

		addEventHandler("fireElements:requestFireDeletion", uPed, destroyFireElement)
		return uPed
	end
	return false
end


--//
--||  events
--\\

addEventHandler("fireElements:requestFireDeletion", resourceRoot, function()
	local iCx, iCy, iCz = getElementPosition(client)
	local iCx, iCy, iCz = getElementPosition(source)
	local iDist = 5
	if isPedInVehicle(client) then iDist = 10 end
	if getDistanceBetweenPoints3D(iCx, iCy, iCz, iCx, iCy, iCz) <= iDist then
		if not tblLastFireOfPlayer[client] or getTickCount()-tblLastFireOfPlayer[client] > 50 then
			if tblFires[source].iSize > 1 then
				decreaseFireSize(source)
			else
				destroyFireElement(source, client)
			end
			tblLastFireOfPlayer[client] = getTickCount()
		end
	end
end)


--//
--||  sync
--\\

addEvent("fireElements:onClientRequestsFires", true)
addEventHandler("fireElements:onClientRequestsFires", resourceRoot, function()
	triggerClientEvent(client, "fireElements:onClientRecieveFires", resourceRoot, tblFires)
end)



