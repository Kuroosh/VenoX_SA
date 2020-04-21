GUIElement = inherit(GUIDrawable)
GUIElement.ms_HoveredElement = false

function GUIElement:constructor(posX, posY, width, height, parent)
    assert(type(posX) == "number" and type(posY) == "number" and type(width) == "number" and type(height) == "number", "Bad arguments @ GUIElement:constructor")
    GUIDrawable.constructor(self, posX, posY, width, height, parent)

    -- Input states    
    self.m_LeftActive  = false
    self.m_RightActive = false
    self.m_Hover       = false
end

function GUIElement:destructor()
    GUIDrawable.destructor(self)
end

function GUIDrawable:performChecks(mouse1, mouse2, curX, curY)
    -- Skip not visible elements
    if not self.m_Visible then
        return
    end

    -- Loop through the children
    for i, v in ipairs(self.m_Children) do
        v:performChecks(mouse1, mouse2, curX, curY)
    end

    -- Calculation
    local inside = (self.m_AbsX <= curX and self.m_AbsY <= curY and self.m_AbsX + self.m_Width > curX and self.m_AbsY + self.m_Height > curY )
    if self.m_LeftActive and not mouse1 then
        if self.onLeftClick then self:onLeftClick(curX, curY) end
        if self.onInternalLeftClick then self:onInternalLeftClick(curX, curY) end
        self.m_LeftActive = false
    end
    if self.m_RightActive and not mouse2 then
        if self.onRightClick then self:onRightClick(curX, curY) end
        if self.onInternalRightClick then self:onInternalRightClick(curX, curY) end
        self.m_RightActive = false
    end
    if not inside then
        if self.m_Hover then
            if self.onUnhover then self:onUnhover() end
            if self.onInternalUnhover then self:onInternalUnhover() end
            self.m_Hover = false
            self.m_RightActive = false
            self.m_LeftActive = false
        end
        return
    end

    -- It's inside bois
    GUIElement.ms_HoveredElement = self
    if not self.m_Hover then
        if self.onHover then self:onHover() end
        if self.onInternalHover then self:onInternalHover() end
        self.m_Hover = true
    end
    if mouse1 and not self.m_LeftActive then
        if self.onLeftClickDown then self:onLeftClickDown(curX, curY) end
        if self.onInternalLeftClickDown then self:onInternalLeftClickDown(curX, curY) end
        self.m_LeftActive = true
    end
    if mouse2 and not self.m_RightActive then
        if self.onRightClickDown then self:onRightClickDown(curX, curY) end
        if self.onInternalRightClickDown then self:onInternalRightClickDown(curX, curY) end
        self.m_RightActive = true
    end

    -- Reset
    if self.m_LeftActive and not mouse1 then
        self.m_LeftActive = false
    end
    if self.m_RightActive and not mouse2 then
        self.m_RightActive = false
    end
end