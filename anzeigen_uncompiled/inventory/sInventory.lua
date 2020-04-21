addEvent("Inventory:UseItem", true)
addEventHandler("Inventory:UseItem", root, function(item)
    if tonumber(getElementData(client, item)) >= 1 then
        if item == "pizza" or item == "burger" then
            setElementHealth(client, 100)
            vnxSetElementData(client, item, getElementData(client, item) - 1)
        end
        if item == "drugs" then
            executeCommandHandler( "takeweed", client )
            vnxSetElementData(client, item, getElementData(client, item) - 3)
        end
        if item == "koks" then
            executeCommandHandler( "takekokain", client )
        end 
        if item == "benzinkannister" then
            executeCommandHandler( "fill", client )
        end
        if item == "flowerseeds" then
            executeCommandHandler( "grow", client, "weed" )
        end
        if item == "zigaretten" then
            executeCommandHandler( "smoke", client)
        end
        if item == "fruitNotebook" then
            executeCommandHandler( "internet", client)
        end
        if item == "Bier" then
            drinkAlcohol ( Player, "Bier" )
        end
    else
        outputChatBox("Du besitzt dieses Item nicht!", client, 125, 0, 0)
        --triggerClientEvent(client, "infobox_start", root, "Du besitzt diese Item nicht!", 3000, 255, 0, 0)
    end
    triggerClientEvent(client, "Inventory.refresh", root)
end)

addEvent("Inventory:deleteItem", true)
addEventHandler("Inventory:deleteItem", root, function(item)
    if tonumber(getElementData(client, item)) >= 1 then
        if item == "pizza" or item == "burger" then
            local itemminus = tonumber(getElementData(client, item))
            vnxSetElementData ( client, item, vnxGetElementData ( client, item ) - itemminus )
            outputChatBox("Item weggeworfen!", client, 0, 125, 0)
        end
        if item == "drugs" then 
            local itemminus = tonumber(getElementData(client, item))
            vnxSetElementData ( client, item, vnxGetElementData ( client, item ) - itemminus )
            outputChatBox("Item weggeworfen!", client, 0, 125, 0)
            executeCommandHandler ( "meCMD", client, " wirft ein grünes Paeckchen weg..." )
        end
        if item == "koks" then
            local itemminus = tonumber(getElementData(client, item))
            vnxSetElementData ( client, item, vnxGetElementData ( client, item ) - itemminus )
            outputChatBox("Item weggeworfen!", client, 0, 125, 0)
            executeCommandHandler ( "meCMD", client, " wirft ein weisses Paeckchen weg..." )
        end
        if item == "benzinkannister" then
            local itemminus = tonumber(getElementData(client, item))
            vnxSetElementData ( client, item, vnxGetElementData ( client, item ) - itemminus )
            outputChatBox("Item weggeworfen!", client, 0, 125, 0)
        end
        if item == "flowerseeds" then
            local itemminus = tonumber(getElementData(client, item))
            vnxSetElementData ( client, item, vnxGetElementData ( client, item ) - itemminus )
            outputChatBox("Item weggeworfen!", client, 0, 125, 0)
            executeCommandHandler ( "meCMD", client, " wirft ein paar Samen weg..." )
        end
        if item == "casinoChips" then
            local itemminus = tonumber(getElementData(client, item))
            vnxSetElementData ( client, item, vnxGetElementData ( client, item ) - itemminus )
            outputChatBox("Item weggeworfen!", client, 0, 125, 0)
        end
        if item == "fruitNotebook" then
            outputChatBox("Dieses Item kannst du nicht weg werfen", client, 125, 0, 0)
        end
        if item == "zigaretten" then
            local itemminus = tonumber(getElementData(client, item))
            vnxSetElementData ( client, item, vnxGetElementData ( client, item ) - itemminus )
            outputChatBox("Item weggeworfen!", client, 0, 125, 0)
        end
        if item == "medikits" then
            local itemminus = tonumber(getElementData(client, item))
            vnxSetElementData ( client, item, vnxGetElementData ( client, item ) - itemminus )
            outputChatBox("Item weggeworfen!", client, 0, 125, 0)
        end
        if item == "mats" then 
            local itemminus = tonumber(getElementData(client, item))
            vnxSetElementData ( client, item, vnxGetElementData ( client, item ) - itemminus )
            outputChatBox("Item weggeworfen!", client, 0, 125, 0)
            executeCommandHandler ( "meCMD", client, " wirft Werkzeuge weg..." )
        end
    else
        outputChatBox("Du besitzt dieses Item nicht!", client, 125, 0, 0)
        --triggerClientEvent(client, "infobox_start", root, "Du besitzt diese Item nicht!", 3000, 255, 0, 0)
    end
    triggerClientEvent(client, "Inventory.refresh", root)
end)
--[[
addCommandHandler("gitem", function(player, cmd, item)
    setElementData(player, "burger", 1)
    setElementData(player, "koks", 1)
    setElementData(player, "casinoChips", 1)
    setElementData(player, "zigaretten", 1)
    --outputChatBox(item.." 5")
end)]]



