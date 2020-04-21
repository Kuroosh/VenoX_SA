local state = false
local Inventory = {
    ["Boxen"] = {
        [1] = { 473 * (screenWidth / 1440), 335 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [2] = { 535 * (screenWidth / 1440), 335 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [3] = { 597 * (screenWidth / 1440), 335 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [4] = { 659 * (screenWidth / 1440), 335 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [5] = { 721 * (screenWidth / 1440), 335 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [6] = { 783 * (screenWidth / 1440), 335 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [7] = { 845 * (screenWidth / 1440), 335 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [8] = { 907 * (screenWidth / 1440), 335 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [9] = { 473 * (screenWidth / 1440), 385 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [10] = { 535 * (screenWidth / 1440), 385 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [11] = { 597 * (screenWidth / 1440), 385 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [12] = { 659 * (screenWidth / 1440), 385 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [13] = { 721 * (screenWidth / 1440), 385 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [14] = { 783 * (screenWidth / 1440), 385 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [15] = { 845 * (screenWidth / 1440), 385 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [16] = { 907 * (screenWidth / 1440), 385 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [17] = { 473 * (screenWidth / 1440), 435 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [18] = { 535 * (screenWidth / 1440), 435 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [19] = { 597 * (screenWidth / 1440), 435 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [20] = { 659 * (screenWidth / 1440), 435 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [21] = { 721 * (screenWidth / 1440), 435 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [22] = { 783 * (screenWidth / 1440), 435 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [23] = { 845 * (screenWidth / 1440), 435 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [24] = { 907 * (screenWidth / 1440), 435 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [25] = { 473 * (screenWidth / 1440), 485 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [26] = { 535 * (screenWidth / 1440), 485 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [27] = { 597 * (screenWidth / 1440), 485 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [28] = { 659 * (screenWidth / 1440), 485 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [29] = { 721 * (screenWidth / 1440), 485 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [30] = { 783 * (screenWidth / 1440), 485 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [31] = { 845 * (screenWidth / 1440), 485 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [32] = { 907 * (screenWidth / 1440), 485 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [33] = { 473 * (screenWidth / 1440), 540 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [34] = { 535 * (screenWidth / 1440), 540 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [35] = { 597 * (screenWidth / 1440), 540 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [36] = { 659 * (screenWidth / 1440), 540 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [37] = { 721 * (screenWidth / 1440), 540 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [38] = { 783 * (screenWidth / 1440), 540 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [39] = { 845 * (screenWidth / 1440), 540 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
        [40] = { 907 * (screenWidth / 1440), 540 * (screenHeight / 900), 52 * (screenWidth / 1440), 44 * (screenHeight / 900) },
    },
    ----------------------------------------------------------------------------------------------------------------
    ["Items"] = { "drugs", "burger", "koks", "mats", "benzinkannister", "flowerseeds", "casinoChips", "fruitNotebook",
                 "zigaretten"},
    ----------------------------------------------------------------------------------------------------------------
    ["Namen"] = { ["drugs"] = "Weed", ["burger"] = "Burger", ["koks"] = "Kokain", ["mats"] = "Materialien",
    ----------------------------------------------------------------------------------------------------------------
                  ["benzinkannister"] = "Benzinkanister", ["flowerseeds"] = "Hanfsamen", ["casinoChips"] = "Casino Chips",
                  ["fruitNotebook"] = "Der_Laptop", ["zigaretten"] = "Zigaretten" }
     ----------------------------------------------------------------------------------------------------------------
}

bindKey("i", "down", function()
    if getElementData(getLocalPlayer(), "loggedin") == 1 then
        if state ~= true then
            Inventory.refresh()
            addEventHandler("onClientRender", root, Inventory.render)
            showCursor(true)
            state = true
        else
            showCursor(false)
            removeEventHandler("onClientRender", root, Inventory.render)
            state = false
            id = 0
        end
    end
end)

function Inventory.render()
    if state then
        dxDrawRectangle(463 * (screenWidth / 1440), 296 * (screenHeight / 900), 506 * (screenWidth / 1440), 330 * (screenHeight / 900), tocolor(0, 0, 0, 150), false)
        dxDrawRectangle(463 * (screenWidth / 1440), 296 * (screenHeight / 900), 506 * (screenWidth / 1440), 31 * (screenHeight / 900), tocolor(0, 0, 0, 200), false)
        dxDrawRectangle(463 * (screenWidth / 1440), 324 * (screenHeight / 900), 506 * (screenWidth / 1440), 3 * (screenHeight / 900), tocolor(0, 105, 145, 255), false)
        dxDrawText("Venox Inventar", 468 * (screenWidth / 1440), 296 * (screenHeight / 900), 969 * (screenWidth / 1440), 325 * (screenHeight / 900), tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)

        for i = 1, #Inventory["Boxen"] do
            dxDrawRectangle(Inventory["Boxen"][i][1], Inventory["Boxen"][i][2], Inventory["Boxen"][i][3], Inventory["Boxen"][i][4], tocolor(255, 255, 255, 120), false)

            if isCursorOnElement(Inventory["Boxen"][i][1], Inventory["Boxen"][i][2], Inventory["Boxen"][i][3], Inventory["Boxen"][i][4]) then
                dxDrawRectangle(Inventory["Boxen"][i][1], Inventory["Boxen"][i][2], Inventory["Boxen"][i][3], Inventory["Boxen"][i][4], tocolor(0, 105, 145, 150), false)

                for _, v in ipairs(Inventory.ITEMS) do
                    if isCursorOnElement(v[4], v[5], v[6], v[7]) then
                        dxDrawText("Du besitzt " .. Inventory["Namen"][v[1]] .. " " .. v[2] .. " mal. Doppelklick (Links) zum Benutzen.\nDoppelklick (Rechts) zum wegwerfen.", 406 * (screenWidth / 1440), 575 * (screenHeight / 900), 1034 * (screenWidth / 1440), 629 * (screenHeight / 900), tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
                    end
                end
            end
        end

        for _, v in ipairs(Inventory.ITEMS) do
            dxDrawImage(Inventory["Boxen"][v[3]][1], Inventory["Boxen"][v[3]][2], Inventory["Boxen"][v[3]][3], Inventory["Boxen"][v[3]][4], ":venox/images/inventory/"..v[1] .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        end
    end
end

addEventHandler("onClientDoubleClick", root, function(btn)
    if btn == "left" then
        for _, v in ipairs(Inventory.ITEMS) do
            if isCursorOnElement(v[4], v[5], v[6], v[7]) then
                triggerServerEvent("Inventory:UseItem", root, v[1])
                removeEventHandler("onClientRender", root, Inventory.render)
                showCursor(false)
                state = false
            end
        end
    elseif btn == "right" then
        for _, v in ipairs(Inventory.ITEMS) do
            if isCursorOnElement(v[4], v[5], v[6], v[7]) then
                triggerServerEvent("Inventory:deleteItem", root, v[1])
                removeEventHandler("onClientRender", root, Inventory.render)
                showCursor(false)
                state = false
            end
        end
    end
end)

function Inventory.refresh()
    id = 0
    Inventory.ITEMS = {}
    for i = 1, #Inventory["Items"] do
        if tonumber(getElementData(getLocalPlayer(), Inventory["Items"][i])) >= 1 then
            id = id + 1
            table.insert(Inventory.ITEMS, { Inventory["Items"][i], tonumber(getElementData(getLocalPlayer(), Inventory["Items"][i])), id, Inventory["Boxen"][id][1], Inventory["Boxen"][id][2], Inventory["Boxen"][id][3], Inventory["Boxen"][id][4] })
        end
    end
end

addEvent("Inventory.refresh", true)
addEventHandler("Inventory.refresh", root, Inventory.refresh)