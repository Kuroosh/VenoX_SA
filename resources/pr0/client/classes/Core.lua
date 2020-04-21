Core = inherit(Singleton)

function Core:constructor()
    -- push the core variable into the global namespace 
    core = self

    -- Initialize debug system
    Version:new()
    Debugging:new()

    -- Initialize GUI system
    GUIRenderer:new()
    GUIWindowFocusManager:new()
    GUICursor:new()

    -- Display
    Scoreboard:new()

    local counter = 0
    --[[addCommandHandler("pr0", function()
        counter = counter + 1
        local window = GUIWindow:new(350, 100, 500, 350, "German VenoX Reallife - New GUI #"..counter , false, true)
        local image = GUIImage:new(":VenoX/images/profil.png", 10, 45, 32, 32, window)
        local button = GUIButton:new(10, 350 - 10 - 35, 100, 35, "Kill Me", window)
        button.onLeftClickDown = function()
            setElementHealth(localPlayer, 0)
        end
    end)]]
end

function Core:destructor()
    -- Release GUI system
    delete(GUIRenderer:getSingleton())
    delete(GUIWindowFocusManager:getSingleton())
    delete(GUICursor:getSingleton())
end