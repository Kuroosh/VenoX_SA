local Invantars = {}

function createInv(player)
    assert(isElement(player) and getElementType(player) == "player", "Bad argument @ createInv #1")
end

function loadInv(player)
    assert(isElement(player) and getElementType(player) == "player", "Bad argument @ loadInv #1")

    -- Obtain user id
    local playerID = playerUID[getPlayerName(player)]
    if not playerID then
        outputChatBox("[INVENTAR] Couldn't be loaded properly!", player, 125, 0, 0)
        return
    end

    -- Perform database action
    dbQuery(assignItems, {player}, handler, "SELECT * from `inventar` WHERE `UID` = ? LIMIT 1", playerID)
end

function assignItems(qh, player)
    local result, rows, lastId = dbPoll(qh, -1)
    if #result > 0 then
        -- Create inventory entry
        if not Invantars[player] then
            Invantars[player] = {}
        end

        -- Assign items to the player's inventar
        for itemName, itemValue in pairs(result[1]) do
            Invantars[player][itemName] = itemValue
        end

        -- Remove unnessary data
        Invantars[player]["UID"] = nil
        Invantars[player]["Objekt"] = nil


        -- Sync with client
        triggerClientEvent(player, "inv:loadItems", player, Invantars[player])
    else
        -- Create default inventory
        createInv(player)
    end
end


-- BETA
addCommandHandler("loadInv", loadInv)