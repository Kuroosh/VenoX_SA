Infobox = {}
local sx, sy = guiGetScreenSize()
local screenX, screenY = guiGetScreenSize()
function Infobox.new(...)
    -- Create class instance
    local o = setmetatable({}, {__index = Infobox})

    -- Call constructor
    if o.constructor then
        o:constructor(...)
    end

    -- Return valid instance
    return o
end

function Infobox:constructor()
    -- Drawing
    self.m_fDraw = function(...) self:draw(...) end
    self.m_IsDrawing = false


    -- All infoboxes
    self.m_Boxs = {}

    -- Propertions
    self.m_Width = 325
    self.m_Height = 100
    self.m_Height2 = 25
    self.m_PosX = sx - 5 - self.m_Width
    self.m_PosY = 300
    self.m_Alpha = 255
    --------------------------
    self.m_WidthNew = 325
    self.m_HeightNew = 100
    self.m_PosYNew = 325
    -- add events
    addEvent("infobox_start", true)
    addEventHandler("infobox_start", root, function(...) self:create(...) end)
end

function Infobox:getProgress(idx)
	return (getTickCount() - self.m_Boxs[idx].startTime)/(self.m_Boxs[idx].endTime - self.m_Boxs[idx].startTime)
end

function Infobox:create(msg, time, r, g, b, title)
    -- Insert informations
    local now = getTickCount()
    table.insert(self.m_Boxs, {
        -- Content
        title = title or "German VenoX Reallife",
        msg   = msg or "",

        -- Position
        posX = sx + 5,
        posY = self.m_PosY + (self.m_Height * #self.m_Boxs) + (10 * #self.m_Boxs),
        posYNew = self.m_PosY + (self.m_Height * #self.m_Boxs) + (20 * #self.m_Boxs),
        alpha = 0,
        
        -- Animation
        startTime = now,
        endTime   = now + 750,
        stage = 1
    })

    -- Enable drawing
    if not self.m_IsDrawing then
        self.m_IsDrawing = true
        addEventHandler("onClientRender", root, self.m_fDraw)
    end
end

function Infobox:draw(delta)
    -- Performance checks
    if #self.m_Boxs == 0 then
        self.m_IsDrawing = false
        removeEventHandler("onClientRender", root, self.m_fDraw)
    end

    -- Draw info boxes
    for idx, box in ipairs(self.m_Boxs) do
        -- Fade In
        if box.stage == 1 then
            -- Animation
            local alpha, posX, _ = interpolateBetween(box.alpha, box.posX, 0, self.m_Alpha, self.m_PosX, 0, self:getProgress(idx), "Linear")

            -- Body
            --dxDrawRectangle(posX, box.posY, self.m_Width, self.m_Height2, tocolor(0, 65, 90, alpha))
            --dxDrawRectangle(posX, box.posYNew, self.m_Width, self.m_Height2, tocolor(255, 255, 255, alpha))
            dxDrawRectangle(posX, box.posY, self.m_Width, self.m_Height2, tocolor(0, 0, 0, 200))
            dxDrawRectangle(posX, box.posY+25, self.m_Width, 75, tocolor(0, 0, 0, 160))
            ------------------------------------------------------------------------------------------
            --dxDrawRectangle(posX, box.posY, self.m_Width, 25, tocolor(0, 0, 0, 10))

            -- Outline
            dxDrawLine(posX, box.posY, posX + self.m_Width, box.posY, tocolor(0, 105, 145, alpha))    
            dxDrawLine(posX, box.posY + 25, posX + self.m_Width, box.posY + 25, tocolor(0, 0, 0, alpha))    
            dxDrawLine(posX, box.posY + self.m_Height, posX + self.m_Width, box.posY + self.m_Height, tocolor(0, 0, 0, alpha))
            dxDrawLine(posX, box.posY, posX, box.posY + self.m_Height, tocolor(0, 0, 0, alpha))
            dxDrawLine(posX + self.m_Width, box.posY, posX + self.m_Width, box.posY + self.m_Height, tocolor(0, 0, 0, alpha))

            -- Content
            dxDrawText(box.title, posX, box.posY, posX + self.m_Width, box.posY + 25, tocolor(255, 255, 255, alpha), 1, "default-bold", "center", "center")
            dxDrawText(box.msg, posX, box.posY + 25, posX + self.m_Width, box.posY + 25 + 75, tocolor(255, 255, 255, alpha), 1, "default-bold", "center", "center")

            -- Next state?
            if getTickCount() >= box.endTime then
                -- Update position
                box.posX = self.m_PosX
                box.alpha = self.m_Alpha

                -- Update times
                box.startTime = getTickCount()
                box.endTime = box.startTime + 3000 

                -- Update stage
                box.stage = 2
            end
        end
        
        -- Idle
        if box.stage == 2 then
            -- Body
            dxDrawRectangle(box.posX, box.posY, self.m_Width, self.m_Height2, tocolor(0, 0, 0, 200))
            dxDrawRectangle(box.posX, box.posY+25, self.m_Width, 75, tocolor(0, 0, 0, 160))
            --dxDrawImage(box.posX, box.posY+25, self.m_Width, 75, ":VenoX/anzeigen/infobox/images/infobox.png", 0, 0, 0, tocolor(255,255,255,150), false)
            ------------------------------------------------------------------------------------------

            -- Outline
            dxDrawLine(box.posX, box.posY, box.posX + self.m_Width, box.posY, tocolor(0, 105, 145, box.alpha))    
            dxDrawLine(box.posX, box.posY + 25, box.posX + self.m_Width, box.posY + 25, tocolor(0, 0, 0, box.alpha))    
            dxDrawLine(box.posX, box.posY + self.m_Height, box.posX + self.m_Width, box.posY + self.m_Height, tocolor(0, 0, 0, box.alpha))
            dxDrawLine(box.posX, box.posY, box.posX, box.posY + self.m_Height, tocolor(0, 0, 0, box.alpha))
            dxDrawLine(box.posX + self.m_Width, box.posY, box.posX + self.m_Width, box.posY + self.m_Height, tocolor(0, 0, 0, box.alpha))

            -- Content
            dxDrawText(box.title, box.posX, box.posY, box.posX + self.m_Width, box.posY + 25, tocolor(255, 255, 255, box.alpha), 1, "default-bold", "center", "center")
            dxDrawText(box.msg, box.posX, box.posY + 25, box.posX + self.m_Width, box.posY + 25 + 75, tocolor(255, 255, 255, box.alpha), 1, "default-bold", "center", "center")

            -- Next level?
            if getTickCount() >= box.endTime then
                -- Update times
                box.startTime = getTickCount()
                box.endTime = box.startTime + 750 

                -- Update stage
                box.stage = 3
            end
        end

        -- Fade Outline
        if box.stage == 3 then
             -- Animation
            local alpha, posY, _ = interpolateBetween(box.alpha, box.posY, 0, 0, -self.m_Height - 5, 0, self:getProgress(idx), "Linear")

            -- Body
            --dxDrawRectangle(box.posX, posY, self.m_Width, self.m_Height2, tocolor(0, 65, 90, alpha))
            --dxDrawRectangle(box.posX, posY + 30, self.m_Width, 25, tocolor(114, 6, 6, alpha))
            dxDrawRectangle(box.posX, posY, self.m_Width, self.m_Height2, tocolor(0, 0, 0, 200))
            dxDrawRectangle(box.posX, posY+25, self.m_Width, 75, tocolor(0, 0, 0, 160))

            -- Outline
            dxDrawLine(box.posX, posY, box.posX + self.m_Width, posY, tocolor(0, 105, 145, alpha))    
            dxDrawLine(box.posX, posY + 25, box.posX + self.m_Width, posY + 25, tocolor(0, 0, 0, alpha))    
            dxDrawLine(box.posX, posY + self.m_Height, box.posX + self.m_Width, posY + self.m_Height, tocolor(0, 0, 0, alpha))
            dxDrawLine(box.posX, posY, box.posX, posY + self.m_Height, tocolor(0, 0, 0, alpha))
            dxDrawLine(box.posX + self.m_Width, posY, box.posX + self.m_Width, posY + self.m_Height, tocolor(0, 0, 0, alpha))

            -- Content
            dxDrawText(box.title, box.posX, posY, box.posX + self.m_Width, posY + 25, tocolor(255, 255, 255, alpha), 1, "default-bold", "center", "center")
            dxDrawText(box.msg, box.posX, posY + 25, box.posX + self.m_Width, posY + 25 + 75, tocolor(255, 255, 255, alpha), 1, "default-bold", "center", "center")

            if getTickCount() >= box.endTime then
                table.remove(self.m_Boxs, idx)
            end
        end
    end
end

addEvent("cdn:onClientReady", true)
addEventHandler("cdn:onClientReady", resourceRoot, 
    function()
        g_InfoBox = Infobox.new()

        -- Vio FIX
        function infobox_start_func(...)
            g_InfoBox:create(...)
        end
    end
)




------------------------------------------------------------------------------------------------------------------------------------




local fonts = {
	header = dxCreateFont("fonts/harabara.ttf", 25),
	normal = dxCreateFont("fonts/harabara.ttf", 16),
	normal2 = dxCreateFont("fonts/harabara.ttf", 13)
}

local notification = {
	display = false,
	sound = nil
}

function notificationShow(typ, text, lng)
	local time = string.len(text)*50
	if (time < 5000) then
		time = 5000
	end
	if (tonumber(lng) ~= nil) then time = lng*1000 end
	
	killTimer(notification.timer)
	
	if (notification.sound) then
		destroyElement(notification.sound)
		notification.sound = nil
	end
	
	notification = {}
	notification = {
		display = true,
		image = "anzeigen/infobox/images/"..typ..".png",
		text = text,
		startTick = getTickCount(),
		curYpos = 0,
		time = time,
		timer = nil,
		state = "starting",
		sound = nil
	}
	
	setTimer(function()
		notification.sound = playSound("files/sounds/notification.mp3")
	end, 250, 1)
	
	setWindowFlashing(true, 9999)
	
	outputConsole("[Notification]: "..text)
	
	if (isTrayNotificationEnabled()) then
		local ityp = "default"
		if (typ == "info" or typ == "warning" or typ == "error") then
			ityp = typ
		end
		createTrayNotification(text, ityp, true)
	end
end
addEvent("notificationShow", true)
addEventHandler("notificationShow", root, notificationShow)

addEventHandler("onClientRender", root, function ()
	if (notification.display == true) then
		
		if (notification.state == "starting") then
			
			local progress = (getTickCount() - notification.startTick) / 800
			local intY = interpolateBetween(-130, 0, 0, 22, 0, 0, progress, "InOutQuad")
			if intY then
				notification.curYpos = intY
			else
				notification.curYpos = 100
			end
			if (progress > 1) then
				notification.state = "showing"
				notification.timer = setTimer(function()
					notification.startTick = getTickCount()
					notification.state = "hiding"
				end, notification.time, 1)
			end
		elseif (notification.state == "showing") then
			notification.curYpos = 22
		elseif (notification.state == "hiding") then
			local progress = (getTickCount() - notification.startTick) / 500
			local intY = interpolateBetween(22, 0, 0, -190, 0, 0, progress, "Linear")
			if (intY) then
				notification.curYpos = intY
			else
				notification.curYpos = 100
			end
			if progress > 1 then
				notification.display = false
				notification.state = nil
				return
			end
		else
			return
		end
		
		local x, y = (screenX/2 - 364/2), notification.curYpos
		local textX, textY = x+40, notification.curYpos+35
		local textWidth, textHeight = 345, 50

		dxDrawRectangle(x, y-5, 364, 127, tocolor(0, 0, 0, 162), false)
        dxDrawImage(x, y-5, 71, 68, notification.image, 0, 0, 0, tocolor(255, 255, 255), false)
        dxDrawText(notification.text, textX+50, textY, textX+textWidth-50, textY+textHeight, tocolor(255, 255, 255, 255), 0.70, fonts.normal, "center", "center", false, true, false, false, false)
        dxDrawText("Information", textX, textY-95, textX+textWidth, textY+textHeight, tocolor(182, 134, 5, 255), 0.70, fonts.header, "center", "center", false, false, false, false, false)
	end
end)

--InfoBox #2

local textdiff = screenX/2200
local infoTable = {}

local timePerLetter = 50
local baseTime = 5000
local alpha = 255
local infoHeight = 0.02
local infoFade = 0.002


local BoxTypes = {
	["minus"] = {
		lineColor = tocolor(153,0,0,alpha),
		textColor = tocolor(255,255,255,255),
		customSound = "anzeigen/infobox/sounds/moneychange.wav"
	},
	["plus"] = {
		lineColor = tocolor(0,153,33,alpha),
		textColor = tocolor(255,255,255,255),
		customSound = "anzeigen/infobox/sounds/moneychange.wav"
	},
	["info"] = {
		lineColor = tocolor(0,146,255,alpha),
		textColor = tocolor(255,255,255,255),
		customSound = "anzeigen/infobox/sounds/notification.mp3"
	},
	["info2"] = {
		lineColor = tocolor(0,146,255,alpha),
		textColor = tocolor(255,255,255,255)
	},
	["success"] = {
		lineColor = tocolor(0,200,0,alpha),
		textColor = tocolor(255,255,255,255),
		sound = 42
	},
	["radio"] = {
		lineColor = tocolor(0,146,255,alpha),
		textColor = tocolor(255,255,255,255),
		sound = 42,
		icon = "files/images/notification/radio2.png"
	}	
}

function infoSetText(s)
	infoTable.text = s
end

local lastMsg = nil
function infoShow(typ, msg, args)
	if (lastMsg == msg and (typ ~= "minus" and typ ~= "plus")) then return end
	lastMsg = msg
	
	local data = {
		msg = msg,
		startTime = getTickCount(),
		endTime = utfLen(msg)*timePerLetter+baseTime,
		height = 0,
		lineCount = 1,
		state = "open"
	}
	local maxTextWidthPerLine = 200
	local newText = ""
	for word in string.gmatch(data.msg, "%S+") do
		if (dxGetTextWidth(newText.." "..word, 1, fonts.normal2) >= ((0.1855*screenX)+40)) then
			newText = newText.."\n"..word
		else
			newText = newText.." "..word
		end
	end
	data.msg = string.sub(newText, 2)
	local _, lng = string.gsub(data.msg, "(.-)\r?\n", "")
	data.lineCount = data.lineCount + lng
	
	if (typ == "own" and type(args) == "table") then
		if args.sound then
			playSoundFrontEnd(args.sound)
		end
		data.lineColor = (args.lineColor or BoxTypes["info"].lineColor)
		data.textColor = args.textColor or BoxTypes["info"].textColor
		data.icon = args.icon or BoxTypes["info"].icon
	else
		if BoxTypes[typ].sound then
			playSoundFrontEnd(BoxTypes[typ].sound)
		end
		if BoxTypes[typ].customSound then
			playSound(BoxTypes[typ].customSound)
		end
		data.lineColor = (BoxTypes[typ].lineColor or BoxTypes["info"].lineColor)
		data.textColor = BoxTypes[typ].textColor or BoxTypes["info"].textColor
		data.icon = BoxTypes[typ].icon or BoxTypes["info"].icon
	end
	table.insert(infoTable, data)
	setWindowFlashing(true, 9999)
	
	outputConsole("[Info]: "..msg)
end
addEvent("infoShow", true)
addEventHandler("infoShow", root, infoShow)

local function updateNoti(index)
	info = infoTable[index]
	if (type(info) == "table") then
		local endTime = (info.startTime+info.endTime)*#infoTable
		if index == 1 then
			endTime = (info.startTime+info.endTime)
		end
		if getTickCount() > endTime then
			info.state = "close"
			lastMsg = nil
		end
		
		if info.state == "open" then
			if info.height < infoHeight then
				info.height = info.height+infoFade
			else
				info.height = infoHeight
				info.state = "ready"
			end
		elseif info.state == "close" then
			if info.height > infoFade then
				info.height = info.height-infoFade
			else
				info.height = 0
				table.remove(infoTable, index)
			end
		end
	end
end

addEventHandler("onClientRender", root, function()
	local absHeight  = 0.74
	local _infoTable = table.reverse(infoTable)
	for index, info in ipairs(_infoTable) do
		
		local fix = 0
		if (info.lineCount < 3) then
			fix = 12
		elseif (info.lineCount < 4) then
			fix = 8
		elseif (info.lineCount < 5) then
			fix = 6
		end
		local boxWidth, boxHeight	= 0.1855*screenX, (info.height*info.lineCount)*screenY+fix
		local boxStartX, boxStartY	= screenX/2-0.488*screenX, (absHeight*screenY)-boxHeight
		local boxEndX, boxEndY		= boxStartX+boxWidth, boxStartY+boxHeight
				
		dxDrawRectangle(boxStartX, boxStartY, boxWidth, boxHeight, tocolor(0, 0, 0, 161))
		if not info.icon then
			dxDrawText(utf8.escape(info.msg),boxStartX+7, boxStartY+3, boxEndX, boxEndY, info.textColor, (1/infoHeight*info.height)*textdiff, fonts.normal2, "left", "center", false, false, false, false, false)
		else
			dxDrawText(utf8.escape(info.msg),boxStartX+45, boxStartY+3, boxEndX, boxEndY, info.textColor, (1/infoHeight*info.height)*textdiff, fonts.normal2, "left", "center", false, false, false, false, false)
		end
		dxDrawLine(boxStartX-1, boxStartY-1, boxEndX-1, boxStartY-1, info.lineColor, 3)
		if info.icon then
		local newBoxHeight = boxHeight
		if info.lineCount == 1 then newBoxHeight = newBoxHeight-8 end
		if info.lineCount == 2 then newBoxHeight = (newBoxHeight-8)-21.6 end
			dxDrawImage(boxStartX+5, boxStartY+4, boxWidth-328, newBoxHeight, info.icon, 0, 0, 0, tocolor(255, 255, 255), false)
		end

		updateNoti(index)
		absHeight = absHeight - (boxHeight/screenY) - 0.01
	end
end)