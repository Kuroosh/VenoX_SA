function spawnchange_func(player, place, sType)
    if not sType == nil then 
        outputDebugString("".. getPlayerName(player) .. " | ".. place .. " | " ..sType )
    end
    local pname = getPlayerName(player)
    if place == "house" then
        if vnxGetElementData(player, "housekey") ~= 0 then
            local dim = math.abs(tonumber(vnxGetElementData(player, "housekey")))
            local hint = vnxGetElementData(houses["pickup"][dim], "curint")
            local int, intx, inty, intz = getInteriorData(hint)

            if hint == 0 then
                int = 0
                dim = 0
                intx, inty, intz = getElementPosition(houses["pickup"][dim])
            end

            vnxSetElementData(player, "spawndim", dim)
            vnxSetElementData(player, "spawnint", int)
            vnxSetElementData(player, "spawnpos_x", intx)
            vnxSetElementData(player, "spawnpos_y", inty)
            vnxSetElementData(player, "spawnpos_z", intz)

            triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
        else
            triggerClientEvent(player, "infobox_start", getRootElement(), "\n\nDu bist Obdachlos!", 5000, 0, 125, 0)
        end
    elseif place == "faction" then
        local faction = vnxGetElementData(player, "fraktion")
        outputDebugString("".. getPlayerName(player) .. " | ".. place .. " | " ..sType.. " | " .. faction)
        if faction > 0 then
            if vnxGetElementData(player, "rang") >= 5 or faction == 9 then
                if faction == 1 then
                    if sType == "sf" then
                        vnxSetElementData(player, "spawnpos_x", 228.71)
                        vnxSetElementData(player, "spawnpos_y", 126.83)
                        vnxSetElementData(player, "spawnpos_z", 1009.85)
                        vnxSetElementData(player, "spawnrot_x", 180)
                        vnxSetElementData(player, "spawnint", 10)
                        vnxSetElementData(player, "spawndim", 0)
                        triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                    else
                        setPlayerNewSpawnpoint(player, 210.94281005859, 150.44526672363, 1002.672668457, -90, 3, 0)
                    end
                elseif faction == 2 then
                    if sType == "sf" then
                        setPlayerNewSpawnpoint(player, -1811.81640625 , -150.6875 , 9.3984375, 95, 0, 0)
                        triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                    end
                elseif faction == 3 then
                    if sType == "sf" then
                        vnxSetElementData(player, "spawnpos_x", -2160.2456054688)
                        vnxSetElementData(player, "spawnpos_y", 642.27325439453)
                        vnxSetElementData(player, "spawnpos_z", 1057.2429199219)
                        vnxSetElementData(player, "spawnrot_x", 90)
                        vnxSetElementData(player, "spawnint", 1)
                        vnxSetElementData(player, "spawndim", 0)
                        triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                    elseif sType == "lv" then
                        vnxSetElementData(player, "spawnpos_x", 2324.421875)
                        vnxSetElementData(player, "spawnpos_y", -1142.76171875)
                        vnxSetElementData(player, "spawnpos_z", 1050.4921875)
                        vnxSetElementData(player, "spawnrot_x", 180)
                        vnxSetElementData(player, "spawnint", 12)
                        vnxSetElementData(player, "spawndim", 14)
                        triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                    end
                elseif faction == 4 then
                    vnxSetElementData(player, "spawnpos_x", -1998.9085693359)
                    vnxSetElementData(player, "spawnpos_y", -1563.2896728516)
                    vnxSetElementData(player, "spawnpos_z", 85.435836791992)
                    vnxSetElementData(player, "spawnrot_x", 0)
                    vnxSetElementData(player, "spawnint", 0)
                    vnxSetElementData(player, "spawndim", 0)
                    triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                elseif faction == 5 then
                    setPlayerNewSpawnpoint(player, -2539.6376953125, -615.052734375, 132.7109375, 0, 0, 0)
                    triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                elseif faction == 6 then
                    if sType == "sf" then
                        vnxSetElementData(player, "spawnpos_x", -2453.8784179688)
                        vnxSetElementData(player, "spawnpos_y", 503.82363891602)
                        vnxSetElementData(player, "spawnpos_z", 29.728803634644)
                        vnxSetElementData(player, "spawnrot_x", 0)
                        vnxSetElementData(player, "spawnint", 0)
                        vnxSetElementData(player, "spawndim", 0)
                        triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                    else
                        setPlayerNewSpawnpoint(player, 221.1217956543, 150.03002929688, 1002.672668457, -90, 3, 0)
                    end
                elseif faction == 7 then
                    if sType == "strip" then
                        setPlayerNewSpawnpoint(player, 1200.94, 11.89, 1000.57, 0, 2, 0)
                    else
                        setPlayerNewSpawnpoint(player, -1321.766, 2475.6, 87.96, 2, 0, 0)
                    end
                    triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                elseif faction == 8 then
                    if sType == "sf" then
                        vnxSetElementData(player, "spawnpos_x", -1346.1706542969)
                        vnxSetElementData(player, "spawnpos_y", 492.36785888672)
                        vnxSetElementData(player, "spawnpos_z", 10.851915359497)
                        vnxSetElementData(player, "spawnrot_x", 90)
                        vnxSetElementData(player, "spawnint", 0)
                        vnxSetElementData(player, "spawndim", 0)
                        triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                    elseif sType == "lv" then
                        vnxSetElementData(player, "spawnpos_x", 247.46310424805)
                        vnxSetElementData(player, "spawnpos_y", 1859.85546875)
                        vnxSetElementData(player, "spawnpos_z", 13.733238220215)
                        vnxSetElementData(player, "spawnrot_x", 90)
                        vnxSetElementData(player, "spawnint", 0)
                        vnxSetElementData(player, "spawndim", 0)
                        triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                    end
                elseif faction == 9 then
                    if sType == "sf" then
                        setPlayerNewSpawnpoint(player, 508.78125, -84.763671875, 998.9609375, 0, 11, 0)
                        triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                    elseif sType == "lv" then
                        setPlayerNewSpawnpoint(player, 508.78125, -84.763671875, 998.9609375, 0, 11, 0)
                        triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                    end
                elseif faction == 10 then
                    setPlayerNewSpawnpoint(player, -2581.158203125, 654.61328125, 13.76875038147, 180, 0, 0)
                    triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                elseif faction == 11 then
                    setPlayerNewSpawnpoint(player, -2402.362305, -174.939453, 36, 0, 0, 0)
                    triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 255, 120, 0)
                elseif faction == 12 then
                    vnxSetElementData(player, "spawnpos_x", -2449.64)
                    vnxSetElementData(player, "spawnpos_y", -90.418)
                    vnxSetElementData(player, "spawnpos_z", 33.5)
                    vnxSetElementData(player, "spawnrot_x", 0)
                    vnxSetElementData(player, "spawnint", 0)
                    vnxSetElementData(player, "spawndim", 0)
                    triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                elseif faction == 13 then
                    vnxSetElementData(player, "spawnpos_x", 413.897)
                    vnxSetElementData(player, "spawnpos_y", 2536.9)
                    vnxSetElementData(player, "spawnpos_z", 10)
                    vnxSetElementData(player, "spawnrot_x", 90)
                    vnxSetElementData(player, "spawnint", 10)
                    vnxSetElementData(player, "spawndim", 0)
                    triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                elseif faction == 14 then
                    setPlayerNewSpawnpoint(player, -2492.21, 2366.66, 1501.04, 180, 0, 0)
                    triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                elseif faction == 15 then
                    vnxSetElementData(player, "spawnpos_x", -2025.7470703125)
                    vnxSetElementData(player, "spawnpos_y", 67.2841796875)
                    vnxSetElementData(player, "spawnpos_z", 28.467109680176)
                    vnxSetElementData(player, "spawnrot_x", 45)
                    vnxSetElementData(player, "spawnint", 0)
                    vnxSetElementData(player, "spawndim", 0)
                    triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                end
            else
                if faction == 1 then
                    if sType == "sf" then
                        vnxSetElementData(player, "spawnpos_x", 246.3)
                        vnxSetElementData(player, "spawnpos_y", 125.05)
                        vnxSetElementData(player, "spawnpos_z", 1003)
                        vnxSetElementData(player, "spawnrot_x", 90)
                        vnxSetElementData(player, "spawnint", 10)
                        vnxSetElementData(player, "spawndim", 0)
                        triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                    else
                        setPlayerNewSpawnpoint(player, 216.72428894043, 168.78742980957, 1002.672668457, 90, 3, 0)
                    end
                elseif faction == 2 then
                    if sType == "sf" then
                        setPlayerNewSpawnpoint(player,-1811.81640625 , -150.6875 , 9.3984375, 95, 0, 0)
                        triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                    end
                elseif faction == 3 then
                    if sType == "sf" then
                        vnxSetElementData(player, "spawnpos_x", -2160.2456054688)
                        vnxSetElementData(player, "spawnpos_y", 642.27325439453)
                        vnxSetElementData(player, "spawnpos_z", 1057.2429199219)
                        vnxSetElementData(player, "spawnrot_x", 90)
                        vnxSetElementData(player, "spawnint", 1)
                        vnxSetElementData(player, "spawndim", 0)
                        triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                    elseif sType == "lv" then
                        vnxSetElementData(player, "spawnpos_x", 2324.421875)
                        vnxSetElementData(player, "spawnpos_y", -1142.76171875)
                        vnxSetElementData(player, "spawnpos_z", 1050.4921875)
                        vnxSetElementData(player, "spawnrot_x", 180)
                        vnxSetElementData(player, "spawnint", 12)
                        vnxSetElementData(player, "spawndim", 14)
                        triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                    end
                elseif faction == 4 then
                    vnxSetElementData(player, "spawnpos_x", -1998.9085693359)
                    vnxSetElementData(player, "spawnpos_y", -1563.2896728516)
                    vnxSetElementData(player, "spawnpos_z", 85.435836791992)
                    vnxSetElementData(player, "spawnrot_x", 0)
                    vnxSetElementData(player, "spawnint", 0)
                    vnxSetElementData(player, "spawndim", 0)
                    triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                elseif faction == 5 then
                    setPlayerNewSpawnpoint(player, -2539.6376953125, -615.052734375, 132.7109375, 0, 0, 0)
                    triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                elseif faction == 6 then
                    if sType == "sf" then
                        vnxSetElementData(player, "spawnpos_x", -2453.8784179688)
                        vnxSetElementData(player, "spawnpos_y", 503.82363891602)
                        vnxSetElementData(player, "spawnpos_z", 29.728803634644)
                        vnxSetElementData(player, "spawnrot_x", 0)
                        vnxSetElementData(player, "spawnint", 0)
                        vnxSetElementData(player, "spawndim", 0)
                        triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                    else
                        setPlayerNewSpawnpoint(player, 216.72428894043, 168.78742980957, 1002.672668457, 90, 3, 0)
                    end
                elseif faction == 7 then
                    if sType == "strip" then
                        setPlayerNewSpawnpoint(player, 1200.94, 11.89, 1000.57, 0, 2, 0)
                    else
                        setPlayerNewSpawnpoint(player, -1321.766, 2475.6, 87.96, 2, 0, 0)
                    end
                    triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                elseif faction == 8 then
                    if sType == "sf" then
                        vnxSetElementData(player, "spawnpos_x", -1346.1706542969)
                        vnxSetElementData(player, "spawnpos_y", 492.36785888672)
                        vnxSetElementData(player, "spawnpos_z", 10.851915359497)
                        vnxSetElementData(player, "spawnrot_x", 90)
                        vnxSetElementData(player, "spawnint", 0)
                        vnxSetElementData(player, "spawndim", 0)
                        triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                    elseif sType == "lv" then
                        vnxSetElementData(player, "spawnpos_x", 247.46310424805)
                        vnxSetElementData(player, "spawnpos_y", 1859.85546875)
                        vnxSetElementData(player, "spawnpos_z", 13.733238220215)
                        vnxSetElementData(player, "spawnrot_x", 90)
                        vnxSetElementData(player, "spawnint", 0)
                        vnxSetElementData(player, "spawndim", 0)
                        triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                    end
                elseif faction == 10 then
                    setPlayerNewSpawnpoint(player, -2581.158203125, 654.61328125, 13.76875038147, 180, 0, 0)
                    triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                elseif faction == 11 then
                    setPlayerNewSpawnpoint(player, -2402.362305, -174.939453, 36, 0, 0, 0)
                    triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 255, 120, 0)
                elseif faction == 12 then
                    vnxSetElementData(player, "spawnpos_x", -2449.64)
                    vnxSetElementData(player, "spawnpos_y", -90.418)
                    vnxSetElementData(player, "spawnpos_z", 33.2)
                    vnxSetElementData(player, "spawnrot_x", 180)
                    vnxSetElementData(player, "spawnint", 0)
                    vnxSetElementData(player, "spawndim", 0)
                    triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                elseif faction == 13 then
                    vnxSetElementData(player, "spawnpos_x", 413.897)
                    vnxSetElementData(player, "spawnpos_y", 2536.9)
                    vnxSetElementData(player, "spawnpos_z", 10)
                    vnxSetElementData(player, "spawnrot_x", 90)
                    vnxSetElementData(player, "spawnint", 10)
                    vnxSetElementData(player, "spawndim", 0)
                    triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
                elseif faction == 14 then
                    setPlayerNewSpawnpoint(player, -2492.21, 2366.66, 1501.04, 180, 0, 0)
                end
            end
        else
            triggerClientEvent(player, "infobox_start", getRootElement(), "\nDu bist in\nkeiner Fraktion!", 5000, 125, 0, 0)
        end
    elseif place == "noobspawn" then
        outputDebugString(place)
        local thex = -1969.18
        local they = 137.90
        local thexminus = math.random(0, 0)
        local theyminus = math.random(0, 0)
        local thexkommata = math.random(4)
        local theykommata = math.random(4)
        vnxSetElementData(player, "spawnpos_x", thex + thexminus + (thexkommata / 10))
        vnxSetElementData(player, "spawnpos_y", they)
        vnxSetElementData(player, "spawnpos_z", 27.1)
        vnxSetElementData(player, "spawnrot_x", -120)
        vnxSetElementData(player, "spawnint", 0)
        vnxSetElementData(player, "spawndim", 0)
        triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
    elseif place == "hotel" then
        if vnxGetElementData(player, "money") >= 100 then
            takePlayerSaveMoney(player, 100)
            if sType == "sf" then
                vnxSetElementData(player, "spawnpos_x", 2230.5236816407)
                vnxSetElementData(player, "spawnpos_y", -1107.6160888672)
                vnxSetElementData(player, "spawnpos_z", 1050.5319824219)
                vnxSetElementData(player, "spawnrot_x", 0)
                vnxSetElementData(player, "spawnint", 5)
                vnxSetElementData(player, "spawndim", 0)
            else
                vnxSetElementData(player, "spawnpos_x", 2230.5236816407)
                vnxSetElementData(player, "spawnpos_y", -1107.6160888672)
                vnxSetElementData(player, "spawnpos_z", 1050.5319824219)
                vnxSetElementData(player, "spawnrot_x", 0)
                vnxSetElementData(player, "spawnint", 5)
                vnxSetElementData(player, "spawndim", 0)
            end
            triggerClientEvent(player, "infobox_start", getRootElement(), "\nSpawnpunkt\ngeändert!", 5000, 0, 125, 0)
        else
            triggerClientEvent(player, "infobox_start", getRootElement(), "\n\n\nDu musst mind.\n100 $ besitzen!", 5000, 0, 125, 0)
        end
    elseif place == "Stadthalle" then
                vnxSetElementData(player, "spawnpos_x", -1501.3154296875)
                vnxSetElementData(player, "spawnpos_y", 905.09375)
                vnxSetElementData(player, "spawnpos_z", 7.1875)
                vnxSetElementData(player, "spawnrot_x", 0)
                vnxSetElementData(player, "spawnint", 0)
                vnxSetElementData(player, "spawndim", 0)
                triggerClientEvent(player, "infobox_start", getRootElement(), "\nSpawnpunkt\ngeändert!", 5000, 0, 125, 0)  
    elseif place == "hier" then
        if vnxGetElementData(player, "adminlvl") >= 1 then
            local x, y, z = getElementPosition(player)
            vnxSetElementData(player, "spawnpos_x", x)
            vnxSetElementData(player, "spawnpos_y", y)
            vnxSetElementData(player, "spawnpos_z", z)
            vnxSetElementData(player, "spawnrot_x", getPedRotation(player))
            vnxSetElementData(player, "spawnint", getElementInterior(player))
            vnxSetElementData(player, "spawndim", getElementDimension(player))
            triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
        end
    elseif place == "bar" then
        if vnxGetElementData(player, "club") == "biker" then
            vnxSetElementData(player, "spawnpos_x", -2244.6462402344)
            vnxSetElementData(player, "spawnpos_y", -88.103973388672)
            vnxSetElementData(player, "spawnpos_z", 34.96)
            vnxSetElementData(player, "spawnrot_x", 180)
            vnxSetElementData(player, "spawnint", 0)
            vnxSetElementData(player, "spawndim", 0)
            triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
        else
            outputChatBox("Du bist kein Biker!", player, 125, 0, 0)
        end
    elseif place == "boat" then
        local pname = getPlayerName(player)
        local model = false
        local veh
        for i = 1, vnxGetElementData(player, "maxcars") do
            veh = allPrivateCars[pname][i]
            if isElement(veh) then
                veh = getElementModel(veh)
                if veh == 454 or veh == 484 then
                    if veh == 484 then
                        model = "marquis"
                    elseif veh == 454 then
                        model = "tropic"
                    end
                    nexti = i
                    break
                end
            end
        end
        if not model then
            triggerClientEvent(player, "infobox_start", getRootElement(), "\n\nDu hast keine\nYacht!", 5000, 125, 0, 0)
        else
            vnxSetElementData(player, "spawnpos_x", model)
            vnxSetElementData(player, "spawnpos_y", getPrivVehString(pname, nexti))
            vnxSetElementData(player, "spawnpos_z", 0)
            vnxSetElementData(player, "spawnrot_x", 0)
            vnxSetElementData(player, "spawnint", 0)
            vnxSetElementData(player, "spawndim", 0)
            triggerClientEvent(player, "infobox_start", getRootElement(), "Spawnpunkt geändert!", 5000, 0, 125, 0)
        end
    elseif place == "wohnmobil" then
        local wohnmobil = false

        for i = 1, vnxGetElementData(player, "maxcars") do
            veh = allPrivateCars[pname][i]
            if isElement(veh) then
                if camper[getElementModel(veh)] then
                    wohnmobil = true
                end
            end
        end

        if wohnmobil then
            vnxSetElementData(player, "spawnpos_x", "wohnmobil")
            vnxSetElementData(player, "spawnpos_y", 0)
            vnxSetElementData(player, "spawnpos_z", 0)
            vnxSetElementData(player, "spawnrot_x", 0)
            vnxSetElementData(player, "spawnint", 0)
            vnxSetElementData(player, "spawndim", 0)

            triggerClientEvent(player, "infobox_start", getRootElement(), "\n\n\nSpawnpunkt\ngeändert!", 5000, 0, 125, 0)
        else
            triggerClientEvent(player, "infobox_start", getRootElement(), "\n\n\nDu hast kein\nWohnmobil!", 5000, 0, 125, 0)
        end
    else
        --outputChatBox("Ungueltige Eingabe! Bitte entweder \"house\", \"faction\", \"boat\", \"wohnmobil\" oder \"street\" eingeben!", player, 125, 0, 0)
    end
    dbExec(handler, "UPDATE ?? SET ??=?, ??=?, ??=?, ??=?, ??=?, ??=? WHERE ??=?", "userdata", "Spawnpos_X", vnxGetElementData(player, "spawnpos_x"), "Spawnpos_Y", vnxGetElementData(player, "spawnpos_y"), "Spawnpos_Z", vnxGetElementData(player, "spawnpos_z"), "Spawnrot_X", vnxGetElementData(player, "spawnrot_x"), "SpawnInterior", vnxGetElementData(player, "spawnint"), "SpawnDimension", vnxGetElementData(player, "spawndim"), "UID", playerUID[pname])
end

addEvent("setPlayerSpawn", true)
addEventHandler("setPlayerSpawn", getRootElement(), spawnchange_func)

function setPlayerNewSpawnpoint(player, x, y, z, rot, int, dim)

    vnxSetElementData(player, "spawnpos_x", x)
    vnxSetElementData(player, "spawnpos_y", y)
    vnxSetElementData(player, "spawnpos_z", z)
    vnxSetElementData(player, "spawnrot_x", rot)
    vnxSetElementData(player, "spawnint", int)
    vnxSetElementData(player, "spawndim", dim)
end
