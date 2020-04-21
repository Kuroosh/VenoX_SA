GUIWindowFocusManager = inherit(Singleton)

function GUIWindowFocusManager:constructor()
    self.m_CurrentWindow = nil
end

function GUIWindowFocusManager:setCurrentFocus(window)
    if window then
        if not window.m_Visible then
            return
        end

        -- Set the new focused window
        self.m_CurrentWindow = window
        return
    end
    self.m_CurrentWindow = nil
    return
end

function GUIWindowFocusManager:getCurrentWindow()
    return self.m_CurrentWindow
end