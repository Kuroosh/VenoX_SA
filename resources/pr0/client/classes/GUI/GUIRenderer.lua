GUIRenderer = inherit(Singleton)
GUIRenderer.ms_Cache = {}

function GUIRenderer:constructor()
    self.m_doUpdate = bind(self.updateAll, self)
    self.m_doRender = bind(self.drawAll, self)

    -- Add event handlers
    addEventHandler("onClientPreRender", root, self.m_doUpdate)
    addEventHandler("onClientRender", root, self.m_doRender)
end

function GUIRenderer:destructor()
    -- Remove event handlers
    removeEventHandler("onClientPreRender", root, self.m_doUpdate)
    removeEventHandler("onClientRender", root, self.m_doRender)
end

function GUIRenderer:addRef(gui)
    GUIRenderer.ms_Cache[#GUIRenderer.ms_Cache+1] = gui
end

function GUIRenderer:removeRef(gui)
    local idx = table.find(GUIRenderer.ms_Cache, gui)
    if idx then
        table.remove(GUIRenderer.ms_Cache, idx)
    end
end

function GUIRenderer:updateAll()
    -- Obtain cursor position
    local curX, curY = getCursorPosition()
    if not curX then
        return
    end

    -- Convert to absolute numbers
    curX, curY = curX * screenWidth, curY * screenHeight

    -- Z-Ordering
    for idx = #GUIRenderer.ms_Cache, 1, -1 do
        if GUIRenderer.ms_Cache[idx] then
            local v = GUIRenderer.ms_Cache[idx]
            if v.m_Visible then
                if v.update then
                    v:update()
                end
                if v.performChecks then
                    v:performChecks(getKeyState("mouse1"), getKeyState("mouse2"), curX, curY)
                end
            end
        end
    end
end

function GUIRenderer:drawAll()
    for idx = #GUIRenderer.ms_Cache, 1, -1 do
        local v = GUIRenderer.ms_Cache[idx]
        if v.m_Visible then
            v:draw()
        end
    end
end

function GUIRenderer:bring2front(gui)
    local front = GUIRenderer.ms_Cache[#GUIRenderer.ms_Cache]
    local idx   = table.find(GUIRenderer.ms_Cache, gui)
    if idx then
        -- Is it already in front?
        if gui == front then
            return
        end

        -- Swap
        GUIRenderer.ms_Cache[#GUIRenderer.ms_Cache] = gui
        GUIRenderer.ms_Cache[idx] = front
    end
end

function GUIRenderer:push2back(gui)
    local back = GUIRenderer.ms_Cache[1]
    local idx  = table.find(GUIRenderer.ms_Cache, gui)
    if idx then
        -- Is it already in the background?
        if back == gui then
            return
        end

        -- Swap
        GUIRenderer.ms_Cache[1]   = gui
        GUIRenderer.ms_Cache[idx] = back
    end
end
