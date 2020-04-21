GUIImage = inherit(GUIElement)

function GUIImage:constructor(path, posX, posY, width, height, parent)
    GUIElement.constructor(self, posX, posY, width, height, parent)
    
    self.m_Path = path
    self.m_Color = tocolor(255, 255, 255, 255)
end

function GUIImage:drawThis()
    dxDrawImage(self.m_AbsX, self.m_AbsY, self.m_Width, self.m_Height, self.m_Path, 0, 0, 0, self.m_Color)
end

function GUIImage:setColor(color)
    self.m_Color = color
end

function GUIImage:setPath(path)
    assert(type(path) == "Bad argument @ GUIImage:setPath #1")
    self.m_Path = path
end