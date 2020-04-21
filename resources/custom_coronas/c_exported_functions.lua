function createCorona(posX,posY,posZ,size,colorR,colorG,colorB,colorA,...)
	local reqParam = {posX,posY,posZ,size,colorR,colorG,colorB,colorA}
	local isThisValid = true
	local countParam = 0
	for m, param in ipairs(reqParam) do
		countParam = countParam + 1
		isThisValid = isThisValid and param~=nil and (type(param) == "number")
	end
	local optParam = {...}
	if not isThisValid or (#optParam > 1 or #reqParam ~= 8 ) or (countParam ~= 8) then 
		return false 
	end
	if (type(optParam[1]) ~= "boolean") then
		optParam[1] = false
	end
	local isDepthEffect =  optParam[1]
	local SHPelementID = funcTable.create(isDepthEffect,posX,posY,posZ,size,colorR,colorG,colorB,colorA)
	return createElement("SHCustomCorona",tostring(SHPelementID))
end

function destroyCorona(w)
	if not isElement(w) then 
		return false
	end
	local SHPelementID = tonumber(getElementID(w))
	if type(SHPelementID) == "number" then
		return destroyElement(w) and funcTable.destroy(SHPelementID)
	else
		return false
	end
end

function setCoronaPosition(w,posX,posY,posZ)
	if not isElement(w) then 
		return false
	end
	local SHPelementID = tonumber(getElementID(w))
	local reqParam = {SHPelementID,posX,posY,posZ}
	local isThisValid = true
	local countParam = 0
	for m, param in ipairs(reqParam) do
		countParam = countParam + 1
		isThisValid = isThisValid and param and (type(param) == "number")
	end
	if coronaTable.inputCoronas[SHPelementID] and isThisValid  and (countParam == 4) then
		coronaTable.inputCoronas[SHPelementID].pos = {posX,posY,posZ}
		coronaTable.isInValChanged = true
		return true
	else
		return false
	end
end

function setCoronaColor(w,colorR,colorG,colorB,colorA)
	if not isElement(w) then 
		return false
	end
	local SHPelementID = tonumber(getElementID(w))
	local reqParam = {SHPelementID,colorR,colorG,colorB,colorA}
	local isThisValid = true
	local countParam = 0
	for m, param in ipairs(reqParam) do
		countParam = countParam + 1
		isThisValid = isThisValid and param and (type(param) == "number")
	end
	if coronaTable.inputCoronas[SHPelementID] and isThisValid  and (countParam == 5)  then
		coronaTable.inputCoronas[SHPelementID].color = {colorR,colorG,colorB,colorA}
		coronaTable.isInValChanged = true
		return true
	else
		return false
	end
end

function setCoronaSize(w,size)
	if not isElement(w) then 
		return false
	end
	local SHPelementID = tonumber(getElementID(w))
	if lightTable.inputLights[SHPelementID] and (type(size) == "number") then 
		lightTable.inputLights[SHPelementID].size = size
		coronaTable.isInValChanged = true
		return true
	else
		return false
	end
end

function setCoronasDistFade(dist1,dist2)
	if (type(dist1) == "number") and (type(dist2) == "number") then
		return funcTable.setDistFade(dist1,dist2)
	else
		return false
	end
end