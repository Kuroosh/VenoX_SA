---------------------------------------------------------------------------------------------------
-- Version check
---------------------------------------------------------------------------------------------------
function isMTAUpToDate()
	local mtaVer = getVersion().sortable
	----outputDebugString("MTA Version: "..tostring(mtaVer))
	if getVersion ().sortable < "1.3.4-9.05899" then
		return false
	else
		return true
	end
end

---------------------------------------------------------------------------------------------------
-- DepthBuffer access
---------------------------------------------------------------------------------------------------
function isDepthBufferAccessible()
	local info = dxGetStatus()
	local depthStatus = false
		for k,v in pairs(info) do
			if string.find(k, "DepthBufferFormat") then
				--outputDebugString("DepthBufferFormat: "..tostring(v))
				depthStatus=true
				if tostring(v)=='unknown' then depthStatus = false end
			end
		end
	return depthStatus
end
---------------------------------------------------------------------------------------------------
-- dxGetStatus for diag
---------------------------------------------------------------------------------------------------
addCommandHandler( "dxGetStatus",
function()
	local info=dxGetStatus()
	local ver = getVersion ().sortable
	local outStr = 'MTAVersion:'..ver..'dxGetStatus: '
	for k,v in pairs(info) do
		outStr = outStr..' '..k..': '..tostring(v)..'  ,'
	end
	--outputDebugString(outStr)
	setClipboard(outStr)
	outputChatBox('---dxGetStatus copied to clipboard---' )
end
)

---------------------------------------------------------------------------------------------------
-- debug lights
---------------------------------------------------------------------------------------------------
local coronaDebugSwitch = false

addCommandHandler( "debugCustomCoronas",
function()
	coronaDebugSwitch = switchDebugCoronas(not coronaDebugSwitch)
end
)

function switchDebugCoronas(switch)
	if switch then
		addEventHandler("onClientRender",root,renderDebugCoronas)
	else
		--outputDebugString('Debug mode: OFF')
		removeEventHandler("onClientRender",root,renderDebugCoronas)
	end
	return switch
end

local scx,scy = guiGetScreenSize()
function renderDebugCoronas()
	dxDrawText(fpscheck()..' FPS',scx/2,25)
	if (#coronaTable.outputCoronas<1) then 
		return
	end
	dxDrawText(coronaTable.thisCorona..'/'..coronaTable.maxCoronas,scx/2,10)
	for index,this in ipairs(coronaTable.outputCoronas) do
		if this.enabled then
			local xVal,yVal,xStr,yStr,dist,sx,sy = getBoxScreenParams(scx,scy,this.pos[1],this.pos[2],this.pos[3],0.5,0.5)
			local col = tocolor(this.color[1],this.color[2],this.color[3],this.color[4])
			if xVal and yVal then
				dxDrawRectangle ( xVal,yVal,xStr,yStr,col)
			end
		end
	end
end

function getBoxScreenParams(szx,szy,hx,hy,hz,sizeX,sizeY)
	local sx,sy = getScreenFromWorldPosition(hx,hy,hz,0.25,true)
	if sx and sy then
		local cx,cy,cz,clx,cly,clz,crz,cfov = getCameraMatrix()
		local dist = getDistanceBetweenPoints3D(hx,hy,hz,cx,cy,cz)
		local xMult = szx/800/70*cfov*sizeX
		local yMult = szy/600/70*cfov*sizeY
		local xVal = sx-(100/dist)* xMult
		local yVal = sy-(100/dist)* yMult
		local xStr = (200/dist)* xMult
		local yStr = (200/dist)* yMult
		return xVal,yVal,xStr,yStr,dist,sx,sy
	else
		return false
	end
end

local frames,lastsec,fpsOut = 0,0,0
function fpscheck()
	local frameticks = getTickCount()
	frames = frames + 1
	if frameticks - 1000 > lastsec then
		local prog = (frameticks - lastsec)
		lastsec = frameticks
		fps = frames / (prog / 1000)
		frames = fps * ((prog - 1000) / 1000)
		fpsOut = tostring(math.floor(fps))
	end
	return fpsOut
end

---------------------------------------------------------------------------------------------------
-- light sorting
---------------------------------------------------------------------------------------------------
function sortedCoronaOutput(inTable,isSo,distFade)
	local coronaTable = {}
	for index,thisCorona in ipairs(inTable) do
		local dist = getElementFromCameraDistance(thisCorona.pos[1],thisCorona.pos[2],thisCorona.pos[3])
		if dist <= distFade then 
			local w = #coronaTable + 1
			if not coronaTable[w] then 
				coronaTable[w] = {} 
			end
			coronaTable[w].enabled = thisCorona.enabled
			coronaTable[w].shader = thisCorona.shader
			coronaTable[w].size =  thisCorona.size
			coronaTable[w].pos = thisCorona.pos
			coronaTable[w].dist = dist
			coronaTable[w].color = thisCorona.color	
		end
	end
	if isSo then 
		coronaTable = tableSort(coronaTable)
	end
	return coronaTable
end
	
function removeEmptyEntry(inTable)
	local outTable = {}
	for index,value in ipairs(inTable) do
		if inTable[index].enabled then
		local w = #outTable + 1
			outTable[w] = value
			----outputDebugString('inserted'..w..' of '..index)
		end
	end
	return outTable
end

function tableSort(inTable)
	if #inTable < 2 then return inTable end
		for i = 1, #inTable do 
			for j = 2, #inTable do
				if inTable[j].dist < inTable[j-1].dist then 
					local temp = inTable[j-1]
					inTable[j-1] = inTable[j]
					inTable[j] = temp
				end
			end
		end
	return inTable
end

function getElementFromCameraDistance(hx,hy,hz)
	local cx,cy,cz,clx,cly,clz,crz,cfov = getCameraMatrix()
	local dist = getDistanceBetweenPoints3D(hx,hy,hz,cx,cy,cz)
	return dist
end
