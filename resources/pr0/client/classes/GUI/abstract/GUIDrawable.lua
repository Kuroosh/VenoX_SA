GUIDrawable = inherit(Object)

function GUIDrawable:constructor(posX, posY, width, height, parent)
    -- Assign new parent
    self.m_Parent = parent
    if self.m_Parent then
        self.m_Parent.m_Children[#self.m_Parent.m_Children+1] = self
    end

    -- Properties
    self.m_PosX    = math.floor(posX)
    self.m_PosY    = math.floor(posY)
    self.m_Width   = math.floor(width)
    self.m_Height  = math.floor(height)
    self.m_Alpha   = 255
    self.m_Visible = true
    self.m_Children = {}

    -- Calculate absolute position
    self.m_AbsX, self.m_AbsY = self.m_PosX, self.m_PosY
    local lastElement = self.m_Parent
    while lastElement do
        self.m_AbsX = self.m_AbsX + lastElement.m_PosX
        self.m_AbsY = self.m_AbsY + lastElement.m_PosY
        lastElement = lastElement.m_Parent
    end
end

function GUIDrawable:destructor()
    -- Unlink from parent element
    if self.m_Parent then
        for i, v in pairs(self.m_Parent.m_Children) do
            if v == self then
                table.remove(self.m_Parent.m_Children, i)
            end
        end
    end

    -- Remove renderer reference
    GUIRenderer:getSingleton():removeRef(self)

    -- Clear children
    for i, v in ipairs(self.m_Children) do
        delete(v)
    end
end

function GUIDrawable:draw()
    if self.m_Visible then
        if self.drawThis then
            self:drawThis()
        end

        -- Draw children
        for i = 1, #self.m_Children, 1 do
            local v = self.m_Children[i]
            if v.draw then
                v:draw()
            end
        end
    end
end

function GUIDrawable:setAbsolutePosition(posX, posY)
    assert(type(posX) == "number", "Bad argument @ GUIDrawable:setAbsolutePosition #1")
    assert(type(posY) == "number", "Bad argument @ GUIDrawable:setAbsolutePosition #2")

    local parent = self.m_Parent
    self.m_AbsX = posX
	self.m_AbsY = posY

	local diffX, diffY = posX-self.m_AbsX, posY-self.m_AbsY
	local children = self.m_Children
	while children and #children > 0 do
		for k, v in pairs(children) do
			v:setAbsolutePosition(self.m_AbsX + v.m_PosX, self.m_AbsY + v.m_PosY)
		end
		children = children.m_Children
	end
	if parent then 
		self.m_PosX = self.m_AbsX - parent.m_AbsX
		self.m_PosY = self.m_AbsY - parent.m_AbsY
	end
end

function GUIDrawable:getPosition(isAbs)
    if not isAbs then
        return self.m_PosX, self.m_PosY
    end

    return self.m_AbsX, self.m_AbsY
end

function GUIDrawable:setPosition(posX, posY)
    assert(type(posX) == "number", "Bad argument @ GUIDrawable:setPosition #1")
    assert(type(posY) == "number", "Bad argument @ GUIDrawable:setPosition #2")

    -- Change position
    local diffX, diffY = posX-self.m_PosX, posY-self.m_PosY
    self.m_PosX, self.m_PosY = posX, posY
    self.m_AbsX, self.m_AbsY = self.m_AbsX + diffX, self.m_AbsY + diffY

    -- Adapt children's position as well
    local children = self.m_Children
    while children and #children > 0 do
        for i, v in ipairs(children) do
            v.m_AbsX = v.m_AbsX + diffX
            v.m_AbsY = v.m_AbsY + diffY
        end
        children = children.m_Children
    end
end

function GUIDrawable:getSize()
    return self.m_Width, self.m_Height
end

function GUIDrawable:setSize(width, height)
    assert(type(width) == "number", "Bad argument @ GUIDrawable:setSize #1")
    assert(type(height) == "number", "Bad argument @ GUIDrawable:setSize #2")

    -- Change size 
    self.m_Width  = width
    self.m_Height = height 
end

function GUIDrawable:getParent()
    return self.m_Parent
end

function GUIDrawable:getChildren()
    return self.m_Children
end