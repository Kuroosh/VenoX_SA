SelfManager = {}
local sx, sy = guiGetScreenSize()

function SelfManager.new(...)
    local o = setmetatable({}, {__index = SelfManager})
    if o.constructor then
        o:constructor(...)
    end
    return o
end

function SelfManager:constructor()
    self:print("Loading..")

    -- Dimensions
    self.m_Width = 350
    self.m_Height = 50

    -- Drawing
    self.m_IsDrawing = false
    self.m_fDraw = function(...) self:draw(...) end

    self.m_FirstColor = tocolor(0, 70, 100, 255)
    self.m_SecondColor = tocolor(0, 85, 125, 255)

    -- Menus
    self.m_Menus = {}

    -- Add inputs
    local doShow = function(...) self:show(...) end
    addCommandHandler("self", doShow)
    bindKey("l", "down", doShow)
end

function SelfManager:print(msg)
    outputChatBox("[SELF] #FFFFFF"..msg, 0, 70, 100, true)
end

function SelfManager:addMenu(menu)
    table.insert(self.m_Menus, menu)
end

function SelfManager:show()
    if not self.m_IsDrawing then
        addEventHandler("onClientRender", root, self.m_fDraw)
        self.m_IsDrawing = true
    end
end

function SelfManager:hide()
    if self.m_IsDrawing then
        removeEventHandler("onClientRender", root, self.m_fDraw)
        self.m_IsDrawing = false
    end
end

function SelfManager:draw()
        -- Body
        dxDrawRectangle(sx/2-self.m_Width/2, 25, self.m_Width, self.m_Height, self.m_SecondColor)
        dxDrawRectangle(sx/2-self.m_Width/2, 25+6, self.m_Width, 38, self.m_FirstColor)

        -- Outer outline
        dxDrawLine(sx/2-self.m_Width/2, 25 - 1, sx/2+self.m_Width/2, 25 - 1, tocolor(0, 0, 0, 255))
        dxDrawLine(sx/2-self.m_Width/2, 75, sx/2+self.m_Width/2, 75, tocolor(0, 0, 0, 255))
        dxDrawLine(sx/2-self.m_Width/2 - 1, 24, sx/2-self.m_Width/2 - 1, 76, tocolor(0, 0, 0, 255))
        dxDrawLine(sx/2+self.m_Width/2 - 1, 24, sx/2+self.m_Width/2 - 1, 76, tocolor(0, 0, 0, 255))

        -- Inner outline
        dxDrawLine(sx/2-self.m_Width/2, 25 + 5, sx/2+self.m_Width/2, 25 + 5, tocolor(0, 0, 0, 255))
        dxDrawLine(sx/2-self.m_Width/2, 25 + 38 + 5 + 1, sx/2+self.m_Width/2, 25 + 38 + 5 + 1, tocolor(0, 0, 0, 255))

        -- Images
        dxDrawImage(sx/2+self.m_Width/2 - 50, 25, 50, 50, "self/assets/quit.png", 0, 0, 0, tocolor(255, 255, 255, 255))

        --[[
            dxDrawLine(565 - 1, 23 - 1, 565 - 1, 73, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(915, 23 - 1, 565 - 1, 23 - 1, tocolor(0, 0, 0, 255), 1, false)

        dxDrawLine(565 - 1, 73, 915, 73, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(915, 73, 915, 23 - 1, tocolor(0, 0, 0, 255), 1, false)

        dxDrawRectangle(565, 23, 350, 50, tocolor(0, 86, 123, 255), false)
        dxDrawImage(625, 23, 50, 50, ":guieditor/images/MTA/self1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(685, 23, 50, 50, ":guieditor/images/MTA/einstellungen.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(565, 23, 50, 50, ":guieditor/images/MTA/info.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(745, 23, 50, 50, ":guieditor/images/MTA/animations.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(805, 23, 50, 50, ":guieditor/images/MTA/handy.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(865, 23, 50, 50, ":guieditor/images/MTA/quit.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)


        dxDrawLine(565 - 1, 16 - 1, 565 - 1, 23, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(915, 16 - 1, 565 - 1, 16 - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(565 - 1, 23, 915, 23, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(915, 23, 915, 16 - 1, tocolor(0, 0, 0, 255), 1, false)

        dxDrawRectangle(565, 16, 350, 7, tocolor(0, 71, 101, 255), false)
        dxDrawLine(565 - 1, 73 - 1, 565 - 1, 80, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(915, 73 - 1, 565 - 1, 73 - 1, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(565 - 1, 80, 915, 80, tocolor(0, 0, 0, 255), 1, false)
        dxDrawLine(915, 80, 915, 73 - 1, tocolor(0, 0, 0, 255), 1, false)

        dxDrawRectangle(565, 73, 350, 7, tocolor(0, 71, 101, 255), false)
        ]]
end

addEvent("cdn:onClientReady", true)
addEventHandler("cdn:onClientReady", resourceRoot, 
    function()
        --g_SELF = SelfManager.new()
    end
)