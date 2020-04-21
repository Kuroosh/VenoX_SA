GUIRectangle = inherit(GUIElement)

function GUIRectangle:constructor(posX, posY, width, height, color, parent)
    GUIElement.constructor(self, posX, posY, width, height, parent)

    self.m_Color = color
end

function GUIRectangle:drawThis()
    dxDrawRectangle(self.m_AbsX, self.m_AbsY, self.m_Width, self.m_Height, self.m_Color)
end