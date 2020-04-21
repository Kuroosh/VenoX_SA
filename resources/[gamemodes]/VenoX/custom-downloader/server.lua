local cdn = {}

function cdn.new()
    local self = setmetatable({}, {__index = cdn})

    -- Demanded content to download
    self.m_Content = {}

    -- Connections which downloads the download
    self.m_Connections = {}

    -- Obtain content 
    self:refreshContent()

    -- Add event handlers
    addEvent("cdn:requireContent", true)
    addEvent("cdn:requireFiles", true)
    addEvent("cdn:requestNextFile", true)
    addEventHandler("cdn:requireContent", root, function() self:sendContentList() end)
    addEventHandler("cdn:requireFiles", root, function(...) self:sendDemandedFiles(...) end)
    addEventHandler("cdn:requestNextFile", root, function(...) self:sendNextFile(...) end)

    return self
end

function cdn:refreshContent()
    -- Open resource meta
    local meta = xmlLoadFile("meta.xml")
    if meta then
        -- Loop through all nodes
        for idx, node in ipairs(xmlNodeGetChildren(meta)) do 
            if xmlNodeGetName(node) == "cdn" then
                local path = xmlNodeGetAttribute(node, "src")

                -- Open the file to get the file hash
                local file = fileOpen(path, true)
                if file then
                    -- Insert into demanded content list
                    table.insert(self.m_Content, {path, md5(fileRead(file, fileGetSize(file)))})
                    
                    -- Unreference
                    fileClose(file)
                end
            end
        end

        -- Unreference
        xmlUnloadFile(meta)
    end
end

function cdn:sendContentList()
    triggerClientEvent(client, "cdn:receiveContent", client, self.m_Content)
end

function cdn:sendDemandedFiles(paths)
    -- Register new session
    self.m_Connections[client] = {
        _counter = 0,
        _paths = paths,
    }

    -- Send next file
    self:sendNextFile(client)
end

function cdn:sendNextFile(client)
    local session = self.m_Connections[client]
    if session then
        -- Increment file count
        session._counter = session._counter + 1

        -- Open next file
        local file = fileOpen(session._paths[session._counter], true)
        if file then       
            -- Send file data    
            triggerLatentClientEvent(client, "cdn:receiveFile", 1000000, false, client, 
                fileRead(file, fileGetSize(file)), 
                session._paths[session._counter], 
                session._counter
            )

            -- Unreference
            fileClose(file)

            if session._counter == #session._paths then
                self.m_Connections[client] = nil
            end
        end
    end
end



addEventHandler("onResourceStart", resourceRoot, function()
    _G["CDN"] = cdn.new()
end)