GUICursor = inherit(Singleton)

function GUICursor:constructor()
    -- Define the image path
    self.m_Path = "files/images/cursor.png"
    setCursorAlpha(0)

    addEventHandler("onClientRender", root, bind(GUICursor.draw, self))

    -- Add input
    --bindKey("b", "down", function() showCursor(not isCursorShowing()) end)
end

function GUICursor:destructor()
    setCursorAlpha(255)
end

function GUICursor:setPath(path)
    if not fileExists(path) then return end
    self.m_Path = path
end

function GUICursor:getPath()
    return self.m_Path
end

function GUICursor:setType(type)
    if type == "normal" then
        self.m_Path = "files/images/cursor.png"
    elseif type == "move" then
        self.m_Path = "files/images/move.png"
    end
end

function GUICursor:draw()
    local cx, cy = getCursorPosition()
    if cx then
        cx, cy = cx * screenWidth, cy * screenHeight
        dxDrawImage(cx, cy, 16, 22, self:getPath(), 0, 0, 0, tocolor(255, 255, 255, 255), true)
    end
end