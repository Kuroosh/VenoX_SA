streamedBlips = {}
local DEFAULT_STREAM_DISTANCE = 500
local g_root = getRootElement()

function guiConvertToCustomBlip ( guiElem, x, y, fRadius )
	if streamedBlips[guiElem] then
		outputDebugString("guiConvertToCustomBlip - Already a custom blip",0)
		return
	end
	--Check for valid arguments first
	if ( not isElement(guiElem) ) or 
		string.find(getElementType(guiElem),"gui-") ~= 1 or 
		not tonumber(x) or
		not tonumber(y) then
			outputDebugString("guiConvertToCustomBlip - Bad argument",0)
			return false	
	end
	fRadius = tonumber(fRadius) or DEFAULT_STREAM_DISTANCE

	--If the stream status has been turned off and was previously turned on
	streamedBlips[guiElem] = streamedBlips[guiElem] or {}
	streamedBlips[guiElem].radius = fRadius
	streamedBlips[guiElem].x = x
	streamedBlips[guiElem].y = y
	
	local width,height = guiGetSize(guiElem,false)
	streamedBlips[guiElem].width = width
	streamedBlips[guiElem].height = height
	
	addEventHandler ( "onClientElementDestroy", guiElem,
		function()
			streamedBlips[source] = nil
			destroyWidget ( source )
		end,
	false )
	
	return guiElem
end

function createCustomBlip ( x, y, width, height, path, fRadius )
	if 	not tonumber(x) or
		not tonumber(y) or
		not type(path) == "string" then
			outputDebugString("createCustomBlip - Bad argument",0)
			return false	
	end
	sourceResource = sourceResource or getThisResource()
	local resourceName = getResourceName(sourceResource)
	
	fRadius = fRadius or DEFAULT_STREAM_DISTANCE
	if not tonumber(fRadius) then
		outputDebugString("createCustomBlip - Bad argument",0)
		return false
	end
	local image = dxImage:create( ":"..resourceName.."/"..path, 0, 0, width, height, false )

	streamedBlips[image] = streamedBlips[image] or {}
	streamedBlips[image].radius = fRadius
	streamedBlips[image].x = x
	streamedBlips[image].y = y
	streamedBlips[image].width = width
	streamedBlips[image].height = height
	
	addEventHandler ( "onClientResourceStop", getResourceRootElement(sourceResource),
		function()
			streamedBlips[image] = nil
			destroyWidget ( image )
		end
	)
	
	return image.id
end

function getCustomBlipStreamRadius(blip)
	blip = convertToWidget ( blip )
	--Check for valid arguments first
	if not isWidget(blip) or not streamedBlips[blip] then
		outputDebugString("getCustomBlipStreamRadius - Bad 'custom blip' argument",0)
		return false	
	end
	return streamedBlips[blip].radius or false
end

function setCustomBlipStreamRadius(blip, fRadius)
	blip = convertToWidget ( blip )
	fRadius = tonumber(fRadius)
	--Check for valid arguments first
	if not isWidget(blip) or not streamedBlips[blip] or not fRadius then
		outputDebugString("setCustomBlipStreamRadius - Bad 'custom blip' argument",0)
		return false	
	end
	streamedBlips[blip].radius = fRadius
	return true
end

function getCustomBlipPosition(blip)
	blip = convertToWidget ( blip )
	--Check for valid arguments first
	if not isWidget(blip) or not streamedBlips[blip] then
		outputDebugString("getCustomBlipPosition - Bad 'custom blip' argument",0)
		return false	
	end
	return streamedBlips[blip].x,streamedBlips[blip].y
end

function setCustomBlipPosition(blip, x,y)
	blip = convertToWidget ( blip )
	x = tonumber(x)
	y = tonumber(y)
	--Check for valid arguments first
	if not isWidget(blip) or not streamedBlips[blip] or not x or not y then
		outputDebugString("setCustomBlipPosition - Bad argument",0)
		return false	
	end
	streamedBlips[blip].x,streamedBlips[blip].y = x,y 
	return true
end

function setCustomBlipRadarScale(blip, scale)
	blip = convertToWidget ( blip )
	scale = tonumber(scale)
	--Check for valid arguments first
	if not isWidget(blip) or not streamedBlips[blip] then
		outputDebugString("setCustomBlipRadarScale - Bad argument",0)
		return false	
	end
	streamedBlips[blip].radarScale = scale or nil
	return true
end

function setCustomBlipAlpha(blip, alpha)
	blip = convertToWidget ( blip )
	alpha = tonumber(alpha)
	--Check for valid arguments first
	if not isWidget(blip) or not streamedBlips[blip] or not alpha then
		outputDebugString("setCustomBlipAlpha - Bad argument",0)
		return false	
	end
	setWidgetAlpha(blip,alpha)
	return true
end

function destroyCustomBlip(blip)
	blip = convertToWidget ( blip )
	if not isWidget(blip) or not streamedBlips[blip] then
		outputDebugString("destroyCustomBlip - Bad 'custom blip' argument",0)
		return false	
	end	
	streamedBlips[blip] = nil
	return destroyWidget ( blip )
end

--[[addEventHandler("onClientRender",g_root,
	function()
		local cameraTarget = getCameraTarget()
		local x,y
		--Are we in fixed camera mode?
		if not cameraTarget then
			x,y = getCameraMatrix()
		else
			x,y = getElementPosition(cameraTarget)
		end
		for blip,infoTable in pairs(streamedBlips) do
			if isWidget(blip) then
				local bx,by = infoTable.x,infoTable.y
				--outputChatBox ( tostring(getDistanceBetweenPoints2D ( x,y,bx,by )-getRadarRadius()).." "..tostring(infoTable.radius))
				if 	( isPlayerMapVisible() ) then
					if not isMTAWindowActive() then
						setWidgetVisible(blip,true)
						renderBlip(blip)
					else
						setWidgetVisible(blip,false)
					end
				elseif	(	not infoTable.radius	) or
						(( 	getDistanceBetweenPoints2D ( x,y,bx,by )-getRadarRadius() ) < infoTable.radius ) then
					setWidgetVisible(blip,true)
					renderBlip(blip)
				else
					setWidgetVisible(blip,false)
				end
			else
				streamedBlips[blip] = nil
			end
		end
	end

]]