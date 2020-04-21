GUILabel = inherit(GUIElement)

function GUILabel:constructor(posX, posY, width, height, text, parent)
    GUIElement.constructor(self, posX, posY, width, height, parent)
    self.m_Text = text
    self.m_AlignX = "left"
    self.m_AlignY = "center"
    self.m_Rotatiton = 0
    self.m_Color = Color.White
end

function GUILabel:drawThis()
    dxDrawText(self.m_Text, self.m_AbsX, self.m_AbsY, self.m_AbsX + self.m_Width, self.m_AbsY + self.m_Height, self.m_Color, 1, FONT_ARIAL, self.m_AlignX, self.m_AlignY)
end