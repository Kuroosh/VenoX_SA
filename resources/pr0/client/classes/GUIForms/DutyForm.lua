DutyForm = inherit(Object)

function DutyForm:constructor()
    self.m_Width, self.m_Height = 150, 180

    -- Form
    self.m_Window  = GUIWindow:new(screenWidth/2-self.m_Width/2, screenHeight/2-self.m_Height/2, self.m_Width, self.m_Height, "Willkommen Officer", false, false)
    self.m_DutyBtn = GUIButton:new(25, 35 + 10, 100, 35, "Duty", self.m_Window)
    self.m_SwatBtn = GUIButton:new(25, 35 + 10 + 35 + 10, 100, 35, "Swat", self.m_Window)
    self.m_OffDutyBtn = GUIButton:new(25, 35 + 10 + 35 + 10 + 35 + 10, 100, 35, "Off Duty", self.m_Window)

    -- Event handler
    self.m_DutyBtn.onLeftClickDown = function()
        triggerServerEvent("dutybutton", localPlayer, localPlayer)
        self:close()
    end

    self.m_SwatBtn.onLeftClickDown = function()
        triggerServerEvent("swatbutton", localPlayer, localPlayer)
        self:close()
    end

    self.m_OffDutyBtn.onLeftClickDown = function()
        triggerServerEvent("offdutybutton", localPlayer, localPlayer)
        self:close()
    end
end

function DutyForm:destructor()
    delete(self.m_Window)
end

function DutyForm:close()
    showCursor(false)
    delete(self)
end

-- HANDLER
addEvent("dutywiendowanclient", true)
addEventHandler("dutywiendowanclient", root, function()
    showCursor(true)
    local duty = DutyForm:new()
end)