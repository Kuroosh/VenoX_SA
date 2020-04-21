Balance = {}

function Balance.new(...)
    -- Create class instance
    local o = setmetatable({}, {__index = Balance})

    -- Call class constructor
    if o.constructor then
        o:constructor(...)
    end

    -- Return instance
    return o
end

function Balance:constructor()
    -- Create whitelist
    self.m_ValidFactions = {
        -- STATE
        [0] = true,  -- Zivi 
        [1] = true,  -- SFPD
        [6] = false, -- FBI
        [8] = false, -- Army

        -- FIRMA
        [5] = true,  -- Reporter
        [10] = true, -- Medic
        [11] = true, -- Ordnungsamt

        -- CRIMINALS
        [2] = false, -- Mafia
        [3] = true,  -- Triaden
        [4] = false, -- Terror
        [7] = true,  -- Aztecas
        [9] = false,  -- AoD
        [12] = true, -- Ballas
        [13] = false,-- Compton
        [14] = false -- IMafia
    }

    -- Input
    self.m_InUse = true
    if self.m_InUse then
        self:createCMD()
    end
end

function Balance:createCMD()
    -- MAGIC
    local str = ""
    local c = 0
    setTimer(function()
        math.randomseed(getTickCount())
        str = str .. string.char(math.random(65, 126))
        c = c + 1
        if c == 8 then
            self:print(root, str)

            -- Command
            local function doBalanceFactions(...) self:balanceFactions(...) end
            local function doApplyBalancing(...) self:applyBalancing(...) end
            addCommandHandler("balance_f", doBalanceFactions)
            addCommandHandler(str, doApplyBalancing)
        end
    end, 1000, 8)
end

function Balance:balanceFactions(player)
    -- Admin security
    if vnxGetElementData(player, "adminlvl") < 5 then
        return
    end

    -- Callbacks
    local function doObtainUserdata(...) self:manageUserdata(...)  end
    self.m_FactionCounter = {}
    self.m_LeftOver = {}

    -- Obtain all userdata
    dbQuery(doObtainUserdata, {player}, handler, "SELECT * FROM userdata")
end

function Balance:manageUserdata(query)
    local result, rows, last_id = dbPoll(query, 0)
    if #result > 0 then
        local start = getTickCount()

        -- Sort out all players
        for idx, user in pairs(result) do 
            if not self.m_ValidFactions[user.Fraktion] then
                table.insert(self.m_LeftOver, {
                    uid = tonumber(user.UID),
                    name = tostring(user.Name),
                    oldf = tonumber(user.Fraktion),
                    newf = 0,
                    rank = tonumber(user.FraktionsRang)
                })
            else
                -- Create counter
                if not self.m_FactionCounter[user.Fraktion] then
                    self.m_FactionCounter[user.Fraktion] = 0
                end

                -- INC
                self.m_FactionCounter[user.Fraktion] = self.m_FactionCounter[user.Fraktion] + 1
            end
        end

        -- Perfomace
        local time = getTickCount() - start
        self:print(root, "It took " .. time .. "ms to manage all nessary userdata!")

        -- Print
        self:print(root, "==========================")
        for i, v in pairs(self.m_FactionCounter) do 
            self:print(root, i.." = "..v)
        end

        -- Magic
        self:assignUser()
    end
end

function Balance:assignUser()
    local index = 1
    setTimer(function()
        -- Obtain user
        local user = self.m_LeftOver[index]

        -- Assign
        if self:isState(user) then
            user.newf = 1
        elseif self:isCriminal(user) then
            -- RANDOM
            math.randomseed(getTickCount() )
            local chance = math.random(1, 1000)
            if chance <= 1000*0.3 then
                user.newf = 3
            elseif chance <= 1000*0.6 then
                user.newf = 7
            else
                user.newf = 12
            end
            user.rank = 3
        end

        -- DEBUG
        if self.m_ValidFactions[user.newf] then
            self.m_FactionCounter[user.newf] = self.m_FactionCounter[user.newf] + 1
        end

        index = index + 1
        
        -- FINAL
        if index == #self.m_LeftOver then
            self:print(root, "==========================")
            for i, v in pairs(self.m_FactionCounter) do 
                self:print(root, i.." = "..v)
            end
        end
    end, 250, #self.m_LeftOver)
end

function Balance:applyBalancing(player)
    -- Admin security
    if getPlayerSerial(player) ~= "F0BAC1AB17B41765749F8AE8C2AE2BB2" then
        return
    end

    -- Apply to DB
    for idx, user in pairs(self.m_LeftOver) do
        -- Safe this stats
        local player = getPlayerFromName(user.name)
        if player then
            kickPlayer(player, nil, "[BALANCE] Reconnect.")
        end

        -- Execute
        dbExec(handler, "UPDATE userdata SET Fraktion=?, FraktionsRang=? WHERE UID=?", user.newf, user.rank, user.uid)
    end
end

function Balance:isState(user)
    return user.oldf == 1 or user.oldf == 6 or user.oldf == 8
end

function Balance:isCriminal(user)
    return user.oldf == 2 or user.oldf == 3 or user.oldf == 4 or user.oldf == 7 or user.oldf == 9 or user.oldf == 12 or user.oldf == 13 or user.oldf == 14    
end

function Balance:isFirma(user)
    return user.oldf == 5 or user.oldf == 10 or user.oldf == 11 
end

function Balance:print(player, strMsg)
      outputConsole("[BALANCE] "..tostring(strMsg), player)
end

-- Create global instance
g_Balance = Balance.new()