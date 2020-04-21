--[[EXP = {}
local sx, sy = guiGetScreenSize()

function EXP.new(...)
    -- Create class instance
    local o = setmetatable({}, {__index = EXP})

    -- Call instance constructor
    if o.constructor then
        o:constructor(...)
    end

    -- Return initialized instance
    return o
end

function EXP:constructor()
    -- User specific informations
    self.m_Current  = 0
    self.m_BaseEXP  = 0
    self.m_Level    = 0
    self.m_TotalEXP = 1000

    -- Colors
    self.m_FirstColor = tocolor(0, 120, 170, 255)
    self.m_SecondColor = tocolor(0, 105, 145, 255)
    self.m_LevelColor = tocolor(255, 255, 255, 255)

    -- Stored packet
    self.m_Packet   = false

    -- displayed informations
    self.m_Width    = 0
    self.m_Spacer   = 0

    -- Create font
    self.m_Font = dxCreateFont("exp/assets/fyodor.ttf", 12, true)

    -- Initialize animation
    self.m_State = "idle"
    self.m_IsDrawing = false

    -- Initialize animation times
    self.m_startTime = getTickCount()
    self.m_animTime = self.m_startTime + 1500
    self.m_fadeTime = self.m_startTime + 5000

    -- Add event
    addEvent("exp:update", true)
    addEventHandler("exp:update", root, function(...) self:update(...) end)

    -- Temporary draw function
    self.m_fDraw = function(...) self:draw(...) end

    -- Bind key
    bindKey("o", "down", 
        function()
            if not self.m_IsDrawing then
                addEventHandler("onClientRender", root, self.m_fDraw)
                self.m_IsDrawing = true
                self.m_fadeTime = getTickCount() + 5000
            else
                -- Recalculate fade time
                self.m_fadeTime = getTickCount() + 5000
            end
        end
    )
end

function EXP:getProgress()
	return (getTickCount() - self.m_startTime)/(self.m_animTime - self.m_startTime)
end

function EXP:print(msg)
    outputDebugString("[EXP] " .. msg, 3, 0, 128, 77)
end

function EXP:onLevelUp()
    -- This member variable is only set if the user has already archived the next level
    if self.m_Packet then
        -- Archivement sound
	    setSoundVolume(playSound("sounds/reached.mp3", false), 0.15)

        -- Apply next level packet
        self:applyPacket(self.m_Packet)
        self.m_Packet = false

        -- Change displayed informations
        self.m_Width = 0
        self:calculate()

        -- Prepare animation
        self.m_startTime = getTickCount()
        self.m_animTime = self.m_startTime + 750

        -- Set animation state again
        self.m_State = "grow"
    end
end

function EXP:storePacket(packet)
    -- Store the next level packet
    self.m_Packet = packet
end

function EXP:applyPacket(packet)
    -- Update user specific informations
    self.m_Current  = packet[1]
    self.m_BaseEXP  = packet[2]
    self.m_Level    = packet[3]
    self.m_TotalEXP = packet[4]

    -- VIO ADAPTION
    setElementData(localPlayer, "exp:lvl", self.m_Level)
end

function EXP:calculate()
    self.m_Spacer = self.m_Width
    self.m_Width = (self.m_Current-self.m_BaseEXP)*350/(self.m_TotalEXP-self.m_BaseEXP)
end

function EXP:update(packet, animated)
    self:print(tostring(packet[1]))

    -- Is the next level archived?
    if self.m_Level < packet[3] then
        self:print("You reached the level " .. packet[3])

        -- Store the user packet
        self:storePacket(packet)

        -- Set user specific informations
        self.m_Current = self.m_TotalEXP

        -- Prepare animation
        self.m_startTime = getTickCount()
        self.m_animTime  = self.m_startTime + 750
        self.m_fadeTime  = self.m_startTime + 5000
    else
        -- Apply minor changes
        self:applyPacket(packet)
        
        -- Prepare animation
        self.m_startTime = getTickCount()
        self.m_animTime  = self.m_startTime + 1500
        self.m_fadeTime  = self.m_startTime + 5000
    end

    -- Recalculate progressbar
    self:calculate()

    -- Set animation animation
   self.m_State = "grow"

   -- Enable drawing
   if not self.m_IsDrawing then
        addEventHandler("onClientRender", root, self.m_fDraw)
        self.m_IsDrawing = true
    else
        -- Recalculate fade time
        self.m_fadeTime = getTickCount() + 5000
    end
end

function EXP:draw(delta)
    -- Draw static progress
    dxDrawRectangle(sx/2-350/2, 50, 350, 22, tocolor(20, 20, 20, 225))
    dxDrawLine(sx/2-350/2 - 1, 50 - 1, sx/2+350/2 + 1, 50 - 1, tocolor(0, 0, 0, 255))
    dxDrawLine(sx/2-350/2 - 1, 72, sx/2+350/2 + 1, 72, tocolor(0, 0, 0, 255))
    dxDrawLine(sx/2-350/2 - 1, 50 - 1, sx/2-350/2 - 1, 72, tocolor(0, 0, 0, 255))
    dxDrawLine(sx/2+350/2, 50 - 1, sx/2+350/2, 72, tocolor(0, 0, 0, 255))

    -- Draw current and next level
    dxDrawText(tostring(self.m_Level), sx/2-350/2 - dxGetTextWidth(tostring(self.m_Level), 1, self.m_Font)*1.5 - 5, 49, sx/2-350/2, 72, self.m_LevelColor, 1, self.m_Font, "center", "center")
    dxDrawText(tostring(self.m_Level + 1), sx/2+350/2 + 5, 49, sx/2+350/2 + dxGetTextWidth(tostring(self.m_Level + 1), 1, self.m_Font)*1.5 + 5, 72, self.m_LevelColor, 1, self.m_Font, "center", "center")

    -- It's time for some magic tricks
    if self.m_State == "grow" then
        -- Draw spacer
        dxDrawRectangle(sx/2-350/2, 50, self.m_Spacer, 11, self.m_FirstColor)
        dxDrawRectangle(sx/2-350/2, 61, self.m_Spacer, 11, self.m_SecondColor)

        local width = (self.m_Width - self.m_Spacer)*getEasingValue(self:getProgress(), "Linear")
        if width + self.m_Spacer >= 350 then
            self:onLevelUp()
        end

        dxDrawRectangle(sx/2-350/2 + self.m_Spacer, 50, width, 11, self.m_FirstColor)
        dxDrawRectangle(sx/2-350/2 + self.m_Spacer, 61, width, 11, self.m_SecondColor)

    elseif self.m_State == "idle" then
        dxDrawRectangle(sx/2-350/2, 50, self.m_Width, 11, self.m_FirstColor)
        dxDrawRectangle(sx/2-350/2, 61, self.m_Width, 11, self.m_SecondColor)

    end

    -- Cancel animation
    if getTickCount() >= self.m_animTime then
        self.m_State = "idle"
    end

    -- Disable drawing
    if getTickCount() >= self.m_fadeTime then
        removeEventHandler("onClientRender", root, self.m_fDraw)

        -- Reset animation state
        self.m_State = "idle"
        self.m_IsDrawing = false
    end
end

addEvent("cdn:onClientReady", true)
addEventHandler("cdn:onClientReady", resourceRoot,
    function()
        g_EXP = EXP.new()
    end
)]]