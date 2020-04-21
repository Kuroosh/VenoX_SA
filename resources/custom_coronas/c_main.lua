-------------------------------------
--Resource: Shader Custom Corona   --
--Author: Ren712                   --
--Contact: knoblauch700@o2.pl      --
-------------------------------------

coronaTable = { shaders = {}, inputCoronas = {} , outputCoronas = {} , thisCorona = 0 , isInNrChanged = false,
				isInValChanged = false, isStarted = false, maxCoronas = 400 }
funcTable = {}

---------------------------------------------------------------------------------------------------
-- editable variables
---------------------------------------------------------------------------------------------------

local img = dxCreateTexture( "textures/coronastar.png" )
local forceDepthOff = false 						
local edgeTolerance = 0.35 -- cull the effects that are off the screen
local shaderSettings = {
				gDistFade = {420, 380}, -- [0]MaxEffectFade,[1]MinEffectFade
				fViewMult = 0.40,
				fDepthSpread = 0.3, 
				fDistMult = 0.97,
				fdistOffset = 4
				}


---------------------------------------------------------------------------------------------------
-- main light functions
---------------------------------------------------------------------------------------------------
function funcTable.create(cType,posX,posY,posZ,size,colorR,colorG,colorB,colorA)
	local w = #coronaTable.inputCoronas + 1
	if not coronaTable.inputCoronas[w] then 
		coronaTable.inputCoronas[w] = {}
	end
	coronaTable.inputCoronas[w].enabled = true
	coronaTable.inputCoronas[w].cType = cType
	coronaTable.inputCoronas[w].shader = funcTable.createShader(cType)
	coronaTable.inputCoronas[w].size = size
	coronaTable.inputCoronas[w].pos = {posX,posY,posZ}
	coronaTable.inputCoronas[w].color = {colorR,colorG,colorB,colorA}	
	coronaTable.isInNrChanged = true
	if not funcTable.applySettings(coronaTable.inputCoronas[w].shader) then
		--outputDebugString('Have Not Created Corona ID:'..w)
		return false
	else
		--outputDebugString('Created Corona ID:'..w..' soft: '..tostring(cType))
		return w
	end
end

function funcTable.destroy(w)
	if coronaTable.inputCoronas[w] then
		coronaTable.inputCoronas[w].enabled = false
		coronaTable.inputCoronas[w].shader = not funcTable.destroyShader(coronaTable.inputCoronas[w].shader)
		coronaTable.isInNrChanged = true
		--outputDebugString('Destroyed Corona ID:'..w)
		return not coronaTable.inputCoronas[w].shader
	else
		--outputDebugString('Have Not Destroyed Corona ID:'..w)
		return false 
	end
end

function funcTable.setDistFade(w,v)
	if  (w >= v) then
		shaderSettings.gDistFade = {w,v}
		if coronaTable.inputCoronas[w].enabled then
			return funcTable.applySettings(coronaTable.inputCoronas[w].shader)
		else
			return true
		end
	else
		return false
	end
end

---------------------------------------------------------------------------------------------------
-- creating and sorting a table of active lights
---------------------------------------------------------------------------------------------------
local tempTable = nil
local tickCount = getTickCount()
addEventHandler("onClientPreRender",root, function()
	if (#coronaTable.inputCoronas == 0) then
		return 
	end
	if coronaTable.isInNrChanged then 
		tempTable = removeEmptyEntry(coronaTable.inputCoronas)
		coronaTable.outputCoronas = sortedCoronaOutput(tempTable,true,shaderSettings.gDistFade[1])		
		coronaTable.isInNrChanged = false
		return
	end
		if coronaTable.isInValChanged or ( tickCount + 200 < getTickCount() ) then
			coronaTable.outputCoronas = sortedCoronaOutput(tempTable,true,shaderSettings.gDistFade[1])
			coronaTable.isInValChanged = false
			tickCount = getTickCount()
		end
end
,true ,"low-1")
		
---------------------------------------------------------------------------------------------------
-- set shader values of active lights
---------------------------------------------------------------------------------------------------
addEventHandler("onClientPreRender", root, function()
	if (#coronaTable.outputCoronas == 0) then
		return 
	end 
	if not coronaTable.isStarted then 
		return 
	end
	coronaTable.thisCorona = 0
	for index,this in ipairs(coronaTable.outputCoronas) do
		if this.dist <= shaderSettings.gDistFade[1] and this.enabled and coronaTable.thisCorona < coronaTable.maxCoronas then
			local isOnScrX, isOnScrY, isOnScrZ = getScreenFromWorldPosition ( this.pos[1], this.pos[2], this.pos[3], edgeTolerance, true )
			if (((isOnScrX and isOnScrY and isOnScrZ) or (this.dist <= shaderSettings.gDistFade[1]*0.1))) then
			if this.shader then
				dxSetShaderValue( this.shader, "fCoronaPosition",this.pos[1], this.pos[2], this.pos[3])	
				dxDrawMaterialLine3D( 0 + this.pos[1], 0 + this.pos[2], this.pos[3] - this.size * 2, 0 + this.pos[1], 0 + this.pos[2], 
					this.pos[3] + this.size * 2, this.shader, this.size * 4, tocolor(this.color[1],this.color[2],this.color[3],this.color[4]),
					0 + this.pos[1],1 +  this.pos[2],0 + this.pos[3] )	
				coronaTable.thisCorona = coronaTable.thisCorona + 1
			end
			end
		end
	end
end
,true ,"low-2")
---------------------------------------------------------------------------------------------------
-- add or remove shader settings 
---------------------------------------------------------------------------------------------------
function funcTable.createShader(coronaType)
	if coronaType then coronaType = 1 else coronaType = 0 end
	if forceDepthOff then coronaType = 0 end
	local pathString = "shaders/custom_corona"..coronaType..".fx"
	local theShader, technique = dxCreateShader( pathString ,0,0,false,"all")
	if theShader then
		--outputDebugString('Started shader tec:'..technique)
		return theShader
	else
		return false
	end
end

function funcTable.destroyShader(theShader)
	local theShader = destroyElement ( theShader )
	theShader = nil
	return not theShader
end

function funcTable.applySettings(theShader)
	if theShader then
		dxSetShaderValue ( theShader, "gCoronaTexture", img )
		dxSetShaderValue ( theShader, "gDistFade", shaderSettings.gDistFade )
		return true
	else
		return false
	end
end

---------------------------------------------------------------------------------------------------
-- onClientResourceStart 
---------------------------------------------------------------------------------------------------		
addEventHandler("onClientResourceStart", getResourceRootElement( getThisResource()), function()
	local ver = getVersion ().sortable
	local build = string.sub( ver, 9, 13 )
	if not isMTAUpToDate() then 
		outputChatBox('Custom Coronas: The resource is not compatible with this client version!',255,0,0)
		return
	end
	if not isDepthBufferAccessible() then
		forceDepthOff = true
	end
	coronaTable.isStarted = true
end
)