Scoreboard = inherit(Singleton)

function Scoreboard:constructor()
    -- Server
    self.m_ServerName = "German Venox Reallife"
    self.m_FactionNames = { [0] = "Zivilisten", [1]="S.F.P.D", [2]="Mafia", [3]="Triaden", [4]="Terroristen", [5]="Reporter", [6]="F.B.I", [7]="Mara Salvatrucha", [8]="U.S Army", [9]="Angels Of Death", [10]="Medic", [11]="Ordnungsamt", [12]="Rollin' Heights", [13]="Compton", [14]="Italian Mafia", [15]="Feuerwehr" }

    -- Properties
    self.m_Width = 740
    self.m_Height = 450
    self.m_HeaderFont = dxCreateFont("files/fonts/arial.ttf", 10)
    self.m_BodyFont = dxCreateFont("files/fonts/arial.ttf", 8)
    self.m_Index = 1

    -- Animation
    self.m_StartTime = 0
    self.m_EndTime = 0

    -- Register functions
    self.m_doShow = function(...) self:show(...) end
    self.m_doRender = function(...) self:render(...) end
    self.m_doScrollDown = function(...) self:scrollDown(...) end
    self.m_doScrollUp = function(...) self:scrollUp(...) end

    self:calculate()

    -- Add input possibilities
    --bindKey("tab", "both", self.m_doShow)
end

function Scoreboard:destructor()

end

function Scoreboard:show(key, state)
    -- Reject all other keys
    if key ~= "tab" then return end

    -- Show main view
    if state == "down" then
        showChat(false)
        addEventHandler("onClientRender", root, self.m_doRender)
        addEventHandler("onClientGUIMouseDown", root, self.m_doScrollDown)
        addEventHandler("onClientGUIMouseUp", root, self.m_doScrollUp)
    else
        showChat(true)
        removeEventHandler("onClientRender", root, self.m_doRender)
        removeEventHandler("onClientGUIMouseDown", root, self.m_doScrollDown)
        removeEventHandler("onClientGUIMouseUp", root, self.m_doScrollUp)
    end
end

function Scoreboard:scrollDown()
    self.m_Index = self.m_Index + 1
end

function Scoreboard:scrollUp()
    self.m_Index = self.m_Index - 1
    if self.m_Index == 0 then
        self.m_Index = 1
    end
end

function Scoreboard:getPlayTime(player)
    local ptime = tonumber(getElementData(player, "playingtime"))
    if not ptime then
        return "-"
    end
    local hour = math.floor(ptime/60)
    local minute = ptime - hour*60
    return hour .. ":" .. minute
end

function Scoreboard:getFactionName(id)
    return self.m_FactionNames[id]
end

function Scoreboard:render(delta)
   --[[ self:calculate()

    -- HEADER
    dxDrawRectangle(screenWidth/2-self.m_Width/2, screenHeight/2-self.m_Height/2, self.m_Width, 30, tocolor(0, 0, 0, 180))
    dxDrawRectangle(screenWidth/2-self.m_Width/2, screenHeight/2-self.m_Height/2+30, 30, self.m_Height-30, tocolor(0, 0, 0, 180))
    dxDrawRectangle(screenWidth/2-self.m_Width/2, screenHeight/2-self.m_Height/2-3, self.m_Width, 3, tocolor(0, 105, 145, 255))
    dxDrawImage(screenWidth/2-self.m_Width/2, screenHeight/2-self.m_Height/2+1, 32, 32, "files/images/logo.png")
    dxDrawText(self.m_ServerName, screenWidth/2-self.m_Width/2+35, screenHeight/2-self.m_Height/2, screenWidth/2+self.m_Width/2-70, screenHeight/2-self.m_Height/2+30, tocolor(255, 255, 255, 255), 1, self.m_HeaderFont, "left", "center")
    dxDrawText(#getElementsByType("player").."/256", screenWidth/2-self.m_Width/2+35, screenHeight/2-self.m_Height/2, screenWidth/2+self.m_Width/2-10, screenHeight/2-self.m_Height/2+30, tocolor(255, 255, 255, 255), 1, self.m_HeaderFont, "right", "center")

    -- COLUMNS
    dxDrawRectangle(screenWidth/2-self.m_Width/2+30, screenHeight/2-self.m_Height/2+30, self.m_Width-30, 20, tocolor(0, 0, 0, 170))
    dxDrawText("Name", screenWidth/2-self.m_Width/2+35, screenHeight/2-self.m_Height/2+30, screenWidth/2-self.m_Width/2+130, screenHeight/2-self.m_Height/2+50, tocolor(255, 255, 255, 255), 1, self.m_BodyFont, "center", "center")
    dxDrawText("Spielstunden", screenWidth/2-self.m_Width/2+130, screenHeight/2-self.m_Height/2+30, screenWidth/2-self.m_Width/2+230, screenHeight/2-self.m_Height/2+50, tocolor(255, 255, 255, 255), 1, self.m_BodyFont, "center", "center")
    dxDrawText("Status", screenWidth/2-self.m_Width/2+230, screenHeight/2-self.m_Height/2+30, screenWidth/2-self.m_Width/2+330, screenHeight/2-self.m_Height/2+50, tocolor(255, 255, 255, 255), 1, self.m_BodyFont, "center", "center")
    dxDrawText("Telefon", screenWidth/2-self.m_Width/2+330, screenHeight/2-self.m_Height/2+30, screenWidth/2-self.m_Width/2+430, screenHeight/2-self.m_Height/2+50, tocolor(255, 255, 255, 255), 1, self.m_BodyFont, "center", "center")
    dxDrawText("Fraktion", screenWidth/2-self.m_Width/2+430, screenHeight/2-self.m_Height/2+30, screenWidth/2-self.m_Width/2+530, screenHeight/2-self.m_Height/2+50, tocolor(255, 255, 255, 255), 1, self.m_BodyFont, "center", "center")
    dxDrawText("Level", screenWidth/2-self.m_Width/2+530, screenHeight/2-self.m_Height/2+30, screenWidth/2-self.m_Width/2+630, screenHeight/2-self.m_Height/2+50, tocolor(255, 255, 255, 255), 1, self.m_BodyFont, "center", "center")
    dxDrawText("Ping", screenWidth/2-self.m_Width/2+630, screenHeight/2-self.m_Height/2+30, screenWidth/2-self.m_Width/2+730, screenHeight/2-self.m_Height/2+50, tocolor(255, 255, 255, 255), 1, self.m_BodyFont, "center", "center")

    -- BODY
    local players = getElementsByType("player")
    local faded = true
    for i=self.m_Index, 20 do
        if not players[i] then break end
        local v = players[i]
        
        -- Perform checks
        if not faded then
            dxDrawRectangle(screenWidth/2-self.m_Width/2+30, screenHeight/2-self.m_Height/2+50 + (i-1)*20, self.m_Width-30, 20, tocolor(0, 0, 0, 160))
        else
            dxDrawRectangle(screenWidth/2-self.m_Width/2+30, screenHeight/2-self.m_Height/2+50 + (i-1)*20, self.m_Width-30, 20, tocolor(0, 0, 0, 120))
        end
        faded = not faded

        -- Draw user data
        dxDrawText(getPlayerName(v), screenWidth/2-self.m_Width/2+35, screenHeight/2-self.m_Height/2+50 + (i-1)*20, screenWidth/2-self.m_Width/2+130, screenHeight/2-self.m_Height/2+70 + (i-1)*20, tocolor(255, 255, 255, 255), 1, self.m_BodyFont, "center", "center")
        dxDrawText(self:getPlayTime(v) or "-", screenWidth/2-self.m_Width/2+130, screenHeight/2-self.m_Height/2+50 + (i-1)*20, screenWidth/2-self.m_Width/2+230, screenHeight/2-self.m_Height/2+70 + (i-1)*20, tocolor(255, 255, 255, 255), 1, self.m_BodyFont, "center", "center")
        dxDrawText(getElementData(v, "socialState") or "-", screenWidth/2-self.m_Width/2+230, screenHeight/2-self.m_Height/2+50 + (i-1)*20, screenWidth/2-self.m_Width/2+330, screenHeight/2-self.m_Height/2+70 + (i-1)*20, tocolor(255, 255, 255, 255), 1, self.m_BodyFont, "center", "center")
        dxDrawText(getElementData(v, "telenr") or "-", screenWidth/2-self.m_Width/2+330, screenHeight/2-self.m_Height/2+50 + (i-1)*20, screenWidth/2-self.m_Width/2+430, screenHeight/2-self.m_Height/2+70 + (i-1)*20, tocolor(255, 255, 255, 255), 1, self.m_BodyFont, "center", "center")
        dxDrawText(self:getFactionName(getElementData(v, "fraktion")) or "-", screenWidth/2-self.m_Width/2+430, screenHeight/2-self.m_Height/2+50 + (i-1)*20, screenWidth/2-self.m_Width/2+530, screenHeight/2-self.m_Height/2+70 + (i-1)*20, tocolor(255, 255, 255, 255), 1, self.m_BodyFont, "center", "center")
        dxDrawText(getElementData(v, "exp:lvl") or "-", screenWidth/2-self.m_Width/2+530, screenHeight/2-self.m_Height/2+50 + (i-1)*20, screenWidth/2-self.m_Width/2+630, screenHeight/2-self.m_Height/2+70 + (i-1)*20, tocolor(255, 255, 255, 255), 1, self.m_BodyFont, "center", "center")
        dxDrawText(getPlayerPing(v) or "-", screenWidth/2-self.m_Width/2+630, screenHeight/2-self.m_Height/2+50 + (i-1)*20, screenWidth/2-self.m_Width/2+730, screenHeight/2-self.m_Height/2+70 + (i-1)*20, tocolor(255, 255, 255, 255), 1, self.m_BodyFont, "center", "center")
    end]]
end

function Scoreboard:calculate()
    self.m_Height = 50 + ( #getElementsByType("player") * 20 )
end