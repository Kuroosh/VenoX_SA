GUIWindow = inherit(GUIElement)
inherit(GUIMoveable, GUIWindow)

local CLOSE_BTN_PADDING = 2
local CLOSE_BTN_SIZE = { 32, 32 }

-- ToDo: Create Font class
FONT_ARIAL = dxCreateFont("files/fonts/arial.ttf", 10)

function GUIWindow:constructor(posX, posY, width, height, title, parent, hasCloseBtn, isMoveable)
    assert(type(posX) == "number" and type(posY) == "number" and type(width) == "number" and type(height) == "number" and type(title) == "string", "Bad arguments @ GUIWindow:constructor")
    GUIElement.constructor(self, posX, posY, width, height, parent)
    GUIRenderer:getSingleton():addRef(self)

    -- Properties
    self.m_Title = title
    self.m_HeaderColor = tocolor(0, 0, 0, 190)
    self.m_BodyColor = tocolor(0, 0, 0, 160)

    -- BODY
    self.m_ClanBar   = GUIRectangle:new(0, 0, self.m_Width, 5, Color.Clan, self)
    self.m_TitleBar  = GUIRectangle:new(0, 5, self.m_Width, 30, self.m_HeaderColor, self)
    self.m_Body      = GUIRectangle:new(0, 35, self.m_Width, self.m_Height - 35, self.m_BodyColor, self)
    self.m_LabelText = GUILabel:new(10, 5, self.m_Width, 30, self.m_Title, self)

    -- CLOSE BUTTON
    self.m_HasCloseBtn = hasCloseBtn
    if hasCloseBtn then
        -- Create close button
        self.m_CloseBtn = GUIImage:new("files/images/GUI/close_btn.png", self.m_Width - CLOSE_BTN_PADDING - CLOSE_BTN_SIZE[1], 4, CLOSE_BTN_SIZE[1], CLOSE_BTN_SIZE[2], self)
        
        -- Define hover function
        function self.m_CloseBtn.onHover()
            self.m_CloseBtn:setColor(Color.Red)
        end

        function self.m_CloseBtn.onUnhover()
            self.m_CloseBtn:setColor(Color.White)
        end

        function self.m_CloseBtn.onLeftClickDown()
            self:close()
        end
    end


    -- MOVING STUFF
    self:setMoveable(isMoveable or true)
    self.m_TitleBar.onLeftClickDown = function(me, curX, curY)
        local offsetX, offsetY = self.m_AbsX + self.m_Width - CLOSE_BTN_PADDING - CLOSE_BTN_SIZE[1], self.m_AbsY + 4
        local insideOfClose = ( curX >= offsetX and curX < offsetX + CLOSE_BTN_SIZE[1] and curY >= offsetY and curY < offsetY + CLOSE_BTN_SIZE[2] )
        if insideOfClose then
            return
        end

        -- Normal checks
        if ( GUIWindowFocusManager:getSingleton():getCurrentWindow() == self or GUIWindowFocusManager:getSingleton():getCurrentWindow() == nil ) and not GUIMoveable.ms_CurrentlyMoving then
            if self:getMoveable() then
                GUIWindowFocusManager:getSingleton():setCurrentFocus(self)
                self:startMoving()
            end
        end
    end

    self.m_TitleBar.onLeftClick = function()
        if GUIMoveable.ms_CurrentlyMoving and GUIWindowFocusManager:getSingleton():getCurrentWindow() == self then
            if self:getMoveable() then
                GUIWindowFocusManager:getSingleton():setCurrentFocus(nil)
                self:stopMoving()
            end
        end
    end
end

function GUIWindow:destructor()
    GUIElement.destructor(self)
end

function GUIWindow:close()
    delete(self)
end

function GUIWindow:drawThis()
   
end