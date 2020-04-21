local myItems = {}
local sW, sH = guiGetScreenSize()
local width, height = 360, 400 

function loadItems(items)
    -- Apply items
    for key, value in pairs(items) do
        myItems[key] = value
    end

    -- Create input
    addCommandHandler("inv", createInv)
end

function getItems()
    local items = {}
    for name, value in pairs(myItems) do
        if tonumber(value) then
            if value > 0 then
                table.insert(items, {name, value})
            end
        elseif tostring(value) then
             --table.insert(items, {name, value})
        end
    end
    return items
end

function createInv()
    if getElementData(localPlayer, "loggedin") ~= 1 then
        return
    end

    -- Create draw calls
    vnxDrawWindow("Inventar", "inv", "Inventar", sW/2-width/2, sH/2-height/2, width, height, "destroyInv")
    vnxDrawGridlist("Inventar", "inv_items", sW/2-width/2, sH/2-height/2 + 30, 225, 370, {{"Item", 150}, {"Anzahl", 75}}, getItems())
    vnxDrawButton("Inventar", "inv_use", "Benutzen", sW/2-width/2 + 220 + 25, sH/2-height/2 + 30 + 320, 105, 40, "useItem")
    vnxDrawButton("Inventar", "inv_throw", "Wegwerfen", sW/2-width/2 + 220 + 25, sH/2-height/2 + 30 + 270, 105, 40, "throwItem")

    showCursor(true)
end

function destroyInv()
     vnxDestroyWindow("Inventar")
     toggleAllControls(true)
     showCursor(false)
     guiSetInputMode("allow_binds")
end

function useItem()

end

function throwItem()

end

-- Add events and handlers
addEvent("inv:loadItems", true)
addEventHandler("inv:loadItems", root, loadItems)