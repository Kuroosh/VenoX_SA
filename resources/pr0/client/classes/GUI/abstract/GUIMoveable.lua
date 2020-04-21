GUIMoveable = {}
GUIMoveable.ms_CurrentlyMoving = false
GUIMoveable.ms_LastMoved = getTickCount()

function GUIMoveable:virtual_constructor()
    self.m_CursorMoveHandler = bind(self.doCursorMove, self)
    self.m_IsMoveable = true
end

function GUIMoveable:startMoving()
    local curX, curY = getCursorPosition()
    if curX then
        curX, curY = curX * screenWidth, curY * screenHeight

        self.m_CursorOffsetX, self.m_CursorOffsetY = curX - self.m_AbsX, curY - self.m_AbsY
        removeEventHandler("onClientCursorMove", root, self.m_CursorMoveHandler)
        addEventHandler("onClientCursorMove", root, self.m_CursorMoveHandler)
        GUIMoveable.ms_CurrentlyMoving = true
    end
end

function GUIMoveable:stopMoving()
    removeEventHandler("onClientCursorMove", root, self.m_CursorMoveHandler)
    GUIMoveable.ms_LastMoved = getTickCount()
    GUIMoveable.ms_CurrentlyMoving = false
end

function GUIMoveable:doCursorMove(curX, curY, absX, absY)
    if isCursorShowing() then
        GUIMoveable.ms_CurrentlyMoving = self
        self:setAbsolutePosition(absX - self.m_CursorOffsetX, absY - self.m_CursorOffsetY)
    end
end

function GUIMoveable:setMoveable(state)
    self.m_IsMoveable = state
end

function GUIMoveable:getMoveable()
    return self.m_IsMoveable
end