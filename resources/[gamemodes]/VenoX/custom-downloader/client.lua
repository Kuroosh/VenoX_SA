local cdn = {}

function cdn.new()
    local self = setmetatable({}, {__index = cdn})

    -- Content which the server requires to play
    self.m_Counter = 0
    self.m_Max = 0
    self.m_Content = {}
    self.m_Ready = false

    -- Add event handlers
    addEvent("cdn:receiveContent", true)
    addEvent("cdn:receiveFile", true)
    addEvent("cdn:onClientReady", true)
    
    addEventHandler("cdn:receiveContent", root, function(...) self:receiveContent(...) end)
    addEventHandler("cdn:receiveFile", root, function(...) self:receiveFile(...) end)

    -- Rendering stuff
    self.m_fRender = function(...) self:renderMain(...) end
    self.m_ScreenX, self.m_ScreenY = guiGetScreenSize()
    self.m_Width, self.m_Heigth = 700, 10

    -- Request server content
    triggerServerEvent("cdn:requireContent", localPlayer)

    -- Set view
    setCameraMatrix(-2045, 85, 55,  -1985, 137, 27, 0, 70)

    return self
end

function cdn:receiveContent(list)
    local demanded = {}

    -- Loop through the whole list
    for idx, content in pairs(list) do
        if fileExists(content[1]) then
            local file = fileOpen(content[1], true)
            if file then
                if md5(fileRead(file, fileGetSize(file))) ~= content[2] then
                    self.m_Max = self.m_Max + 1
                    demanded[self.m_Max] = content[1]
                end

                -- Unreference
                fileClose(file)
            end
        else
            self.m_Max = self.m_Max + 1
            demanded[self.m_Max] = content[1]
        end
    end

    if self.m_Max > 0 then
        -- Launch download progress
        self.m_Content = demanded
        addEventHandler("onClientRender", root, self.m_fRender)

        -- Send required list
        triggerServerEvent("cdn:requireFiles", localPlayer, self.m_Content)
    else
        self:setReady()
    end
end

function cdn:receiveFile(data, path, counter)
    local file = fileCreate(path)
    if file then
        fileWrite(file, data)

        -- Unreference
        fileClose(file)

        -- Update download progress
        self.m_Counter = counter

        -- Does the player download all files?
        if self.m_Counter == self.m_Max then
            self:setReady()
        else
            -- Request next file
            --outputChatBox("REQUEST NEXT")
            triggerServerEvent("cdn:requestNextFile", localPlayer, localPlayer)
        end
    end
end

function cdn:setReady()
    triggerEvent("cdn:onClientReady", root, resourceRoot)
    removeEventHandler("onClientRender", root, self.m_fRender)
    self.m_Ready = true
end

function cdn:getReady()
    return self.m_Ready
end


local sx, sy=guiGetScreenSize()
local spx, spy= 1366, 768
local px, py= (sx/spx) , (sy/spy)


local _dxDrawText = dxDrawText
local function dxDrawText ( ... )
    local array = { ... }
    array[2] = array[2]*px
    array[3] = array[3]*py
    array[4] = array[4]*px
    array[5] = array[5]*py
    array[7] = array[7]*py
    return _dxDrawText ( unpack ( array ) )
end

local _dxDrawImage = dxDrawImage
local function dxDrawImage ( ... )
    local array = { ... }
    array[1] = array[1]*px
    array[2] = array[2]*py
    array[3] = array[3]*px
    array[4] = array[4]*py
    return _dxDrawImage ( unpack ( array ) )
end


function cdn:renderMain(delta)
    -- What about our download progress bar?
    if self.m_Counter > 0 then
        dxDrawRectangle(self.m_ScreenX/2-self.m_Width/2, self.m_ScreenY-(self.m_Heigth*3)-100, self.m_Width, self.m_Heigth, tocolor(0, 70, 100, 255), true)


        --dxDrawRectangle(0, 0, 1366, 768, tocolor(0, 0, 0, 255), false)
        dxDrawImage(400, 89, 581, 367, ":imagess/profil.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
        dxDrawText("DEINE VENOX WELT WIRD GELADEN", 400, 430, 984, 496, tocolor(255, 255, 255, 255), 0.70, "bankgothic", "center", "center", true, true, true, true, true)
        --dxDrawImage(0, 0, 1366, 768, ":venox/images/colors/black.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(0, 0, 1366, 768, ":VenoX/images/colors/black.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        showChat( false )
        local width = (self.m_Counter*(self.m_Width-10))/self.m_Max
        dxDrawRectangle(self.m_ScreenX/2-self.m_Width/2, self.m_ScreenY-(self.m_Heigth*3)-100, width, self.m_Heigth, tocolor(0, 105, 145, 255), true)

        --local procent = self.m_Content[self.m_Counter]
        --dxDrawText(procent, self.m_ScreenX/2-self.m_Width/2+5, self.m_ScreenY-(self.m_Heigth*3)+5, self.m_ScreenX/2-self.m_Width/2+5+self.m_Width-10, self.m_ScreenY-(self.m_Heigth*3)+5+self.m_Heigth-10, tocolor(255, 255, 255, 255), 1, "default", "center", "center", false, false, true)
    end
end

addEventHandler("onClientResourceStart", resourceRoot, function()
    _G["CDN"] = cdn.new()
end)