fraktionNames = {}
fraktionNames = { [0] = "Bürger", [1] = "S.F.P.D.", [2] = "Aryan Brotherhood", [3] = "Triaden", [4] = "Terroristen", [5] = "Reporter", [6] = "F.B.I.", [7] = "Los Aztecas", [8] = "U.S Army", [9] = "Angels Of Death", [10] = "Medic", [11] = "Mechaniker", [12] = "Ballas", [13] = "Grove Street", [14] = "Italian Mafia", [15] = "S.A.F.D." }

local allowToChangeSkin = false
local allowToChangeSkinTimer = nil

fraktionMembers = {}
fraktionMemberList = {}
fraktionMemberListInvite = {}

for i = 0, #fraktionNames + 1 do
    fraktionMembers[i] = {}
    fraktionMemberList[i] = {}
    fraktionMemberListInvite[i] = {}
end

local frespawnTimer = {}
local zaehlerFrespawnTimer = {}

factionVehicles = {}
factionVehicles[1] = {}
factionVehicles[2] = {}
factionVehicles[3] = {}
factionVehicles[4] = {}
factionVehicles[5] = {}
factionVehicles[6] = {}
factionVehicles[7] = {}
factionVehicles[8] = {}
factionVehicles[9] = {}
factionVehicles[10] = {}
factionVehicles[11] = {}
factionVehicles[12] = {}
factionVehicles[13] = {}
factionVehicles[14] = {}
factionVehicles[15] = {}

factionSkins = {}
factionSkins[1] = { 280, 281, 282, 283, 284, 285, 288, 265, 266, 267, 286 }
factionSkins[2] = {  33,80,122,140,169 }
factionSkins[3] = { 49, 117, 118, 120, 122, 123, 141, 169, 186, 294 }
factionSkins[4] = { 221, 222, 220, 143, 142, 307 }
factionSkins[5] = { 59, 141, 187, 188, 189, 296 }
factionSkins[6] = { 285, 286, 165, 164, 163, 295 }
factionSkins[7] = { 173, 174, 175, 115, 114, 116, 293, 292, 108, 109, 110 }
factionSkins[8] = { 287, 312, 191 }
factionSkins[9] = { 100, 247, 248, 298, 181, 299, 291 }
factionSkins[10] = { 274, 275, 276, 70 }
factionSkins[11] = { 305, 268, 201, 128, 50, 42 }
factionSkins[12] = { 102, 103, 104, 195, 13 }
factionSkins[13] = { 269, 270, 271, 301, 311, 105, 106, 107 }
factionSkins[14] = { 111, 112, 113, 124, 125, 126, 127, 237, 272 }
factionSkins[15] = { 279, 278, 277 }

aktionlaeuft = false

local playerblip = {}
local playerbliptimer = {}


addCommandHandler ( "sos", function ( player )
        if isEvil ( player ) then
			if isElement ( playerblip[player] ) then
				destroyElement ( playerblip[player] )
                killTimer ( playerbliptimer[player] )
			end
			playerblip[player] = createBlipAttachedTo ( player, 0, 2, 255, 0, 0, 255, 0, 65535, player )
			playerbliptimer[player] = setTimer ( destroyElement, 4*60000, 1, playerblip[player] )
            local playername = getPlayerName ( player )
            if vnxGetElementData(player, "fraktion") == 2 then 
                if getElementData(player, "needhelp_status") == false then
                    for thePlayer, _ in pairs ( fraktionMembers[2] ) do
                        setElementVisibleTo ( playerblip[player], thePlayer, true )
                        setElementData(player, "needhelp_status", true)
                        outputChatBox ( playername.." braucht Hilfe!. Der Standort wird für 4 Minuten markiert.", thePlayer, 0, 150, 200 )
                    end
                else 
                    for thePlayer, _ in pairs ( fraktionMembers[2] ) do
                        setElementData(player, "needhelp_status", false)
                        outputChatBox ( playername.." braucht keine Hilfe mehr.", thePlayer, 0, 125, 0 )
                        destroyElement ( playerblip[player] )
                        killTimer ( playerbliptimer[player] )
                    end
                end 
            elseif vnxGetElementData(player, "fraktion") == 3 then 
                if getElementData(player, "needhelp_status") == false then 
                    for thePlayer, _ in pairs ( fraktionMembers[3] ) do
                        setElementVisibleTo ( playerblip[player], thePlayer, true )
                        setElementData(player, "needhelp_status", true)
                        outputChatBox ( playername.." braucht Hilfe!!. Der Standort wird für 4 Minuten markiert.", thePlayer, 0, 150, 200 )
                    end
                else 
                    for thePlayer, _ in pairs ( fraktionMembers[3] ) do
                        setElementData(player, "needhelp_status", false)
                        outputChatBox ( playername.." braucht keine Hilfe mehr.", thePlayer, 0, 125, 0 )
                        destroyElement ( playerblip[player] )
                        killTimer ( playerbliptimer[player] )
                    end
                end 
            elseif vnxGetElementData(player, "fraktion") == 7 then 
                if getElementData(player, "needhelp_status") == false then 
                    for thePlayer, _ in pairs ( fraktionMembers[7] ) do
                        setElementVisibleTo ( playerblip[player], thePlayer, true )
                        setElementData(player, "needhelp_status", true)
                        outputChatBox ( playername.." braucht Hilfe!!. Der Standort wird für 4 Minuten markiert.", thePlayer, 0, 150, 200 )
                    end
                else 
                    for thePlayer, _ in pairs ( fraktionMembers[7] ) do
                        setElementData(player, "needhelp_status", false)
                        outputChatBox ( playername.." braucht keine Hilfe mehr.", thePlayer, 0,125, 0 )
                        destroyElement ( playerblip[player] )
                        killTimer ( playerbliptimer[player] )
                    end
                end 
            elseif vnxGetElementData(player, "fraktion") == 9 then 
                if getElementData(player, "needhelp_status") == false then 
                    for thePlayer, _ in pairs ( fraktionMembers[9] ) do
                        setElementVisibleTo ( playerblip[player], thePlayer, true )
                        setElementData(player, "needhelp_status", true)
                        outputChatBox ( playername.." braucht Hilfe!. Der Standort wird für 4 Minuten markiert.", thePlayer, 0, 200, 200 )
                    end
                else 
                    for thePlayer, _ in pairs ( fraktionMembers[9] ) do
                        setElementData(player, "needhelp_status", false)
                        outputChatBox ( playername.." braucht keine Hilfe mehr.", thePlayer, 0, 125, 0 )
                        destroyElement ( playerblip[player] )
                        killTimer ( playerbliptimer[player] )
                    end
                end 
            elseif vnxGetElementData(player, "fraktion") == 12 then 
                if getElementData(player, "needhelp_status") == false then 
                    for thePlayer, _ in pairs ( fraktionMembers[12] ) do
                        setElementVisibleTo ( playerblip[player], thePlayer, true )
                        setElementData(player, "needhelp_status", true)
                        outputChatBox ( playername.." braucht Hilfe!. Der Standort wird für 4 Minuten markiert.", thePlayer, 0, 200, 200)
                    end
                else 
                    for thePlayer, _ in pairs ( fraktionMembers[12] ) do
                        setElementData(player, "needhelp_status", false)
                        outputChatBox ( playername.." braucht keine Hilfe mehr.", thePlayer, 0, 125, 0 )
                        destroyElement ( playerblip[player] )
                        killTimer ( playerbliptimer[player] )
                    end
                end 
            elseif vnxGetElementData(player, "fraktion") == 13 then 
                if getElementData(player, "needhelp_status") == false then 
                    for thePlayer, _ in pairs ( fraktionMembers[13] ) do
                        setElementVisibleTo ( playerblip[player], thePlayer, true )
                        setElementData(player, "needhelp_status", true)
                        outputChatBox ( playername.." braucht Hilfe!. Der Standort wird für 4 Minuten markiert.", thePlayer, 0, 200, 200 )
                    end
                else 
                    for thePlayer, _ in pairs ( fraktionMembers[13] ) do
                        setElementData(player, "needhelp_status", false)
                        outputChatBox ( playername.." braucht keine Hilfe mehr.", thePlayer, 0, 125, 200 )
                        destroyElement ( playerblip[player] )
                        killTimer ( playerbliptimer[player] )
                    end
                end 
            end
		end
end )
---------------------------------------------------------------------------------------------------------------
function isPDCar(car)
    if factionVehicles[1][car] then return true else return false end
end

function isBrotherhoodCar(car)
    if factionVehicles[2][car] then return true else return false end
end

function isTriadenCar(car)
    if factionVehicles[3][car] then return true else return false end
end

function isTerrorCar(car)
    if factionVehicles[4][car] then return true else return false end
end

function isNewsCar(car)
    if factionVehicles[5][car] then return true else return false end
end

function isFBICar(car)
    if factionVehicles[6][car] then return true else return false end
end

function isAztecasCar(car)
    if factionVehicles[7][car] then return true else return false end
end

function isArmyCar(car)
    if factionVehicles[8][car] then return true else return false end
end

function isBikerCar(car)
    if factionVehicles[9][car] then return true else return false end
end

function isMedicCar(car)
    if factionVehicles[10][car] then return true else return false end
end

function isMechanikerCar(car)
    if factionVehicles[11][car] then return true else return false end
end

function isBallasCar(car)
    if factionVehicles[12][car] then return true else return false end
end

function isComptonCar(car)
    if Comptonvehicles[13][car] then return true else return false end
end

function isIMafiaCar(car)
    if YakuCar[14][car] then return true else return false end
end

function isFeuerCar(car)
    if factionVehicles[15][car] then return true else return false end
end

function isFederalCar(car)
    if isFBICar(car) or isPDCar(car) then
        return true
    else
        return false
    end
end

function isEvilCar(car)
    if isBrotherhoodCar(car) or isTriadenCar(car) or isTerrorCar(car) or isAztecasCar(car) or isBikerCar(car) or isBallasCar(car) or isComptonCar(car) or isIMafiaCar(car) then
        return true
    else
        return false
    end
end

function getPlayerFaction(player)

    local fac = vnxGetElementData(player, "fraktion")

    if fac then

        return tonumber(fac)

    else

        return false
    end
end

function getPlayerRank(player)

    local ran = vnxGetElementData(player, "rang")

    if ran then

        return tonumber(ran)

    else

        return false
    end
end

function getPlayerRankName(player)

    local ran = getPlayerRank(player)
    local fac = getPlayerFaction(player)

    if ran then

        return factionRankNames[fac][ran]

    else

        return false
    end
end

-----------------------------------------------------------------------------------------------------
function isReporter(player)
    if tonumber(vnxGetElementData(player, "fraktion")) == 5 then return true else return false end
end

function isTerror(player)
    if tonumber(vnxGetElementData(player, "fraktion")) == 4 then return true else return false end
end

function isTriad(player)
    if tonumber(vnxGetElementData(player, "fraktion")) == 3 then return true else return false end
end

function isBrotherhood(player)
    if tonumber(vnxGetElementData(player, "fraktion")) == 2 then return true else return false end
end

function isCop(player)
    if tonumber(vnxGetElementData(player, "fraktion")) == 1 then return true else return false end
end

function isFBI(player)
    if tonumber(vnxGetElementData(player, "fraktion")) == 6 then return true else return false end
end

function isAztecas(player)
    if tonumber(vnxGetElementData(player, "fraktion")) == 7 then return true else return false end
end

function isArmy(player)
    if tonumber(vnxGetElementData(player, "fraktion")) == 8 then return true else return false end
end

function isBiker(player)
    if tonumber(vnxGetElementData(player, "fraktion")) == 9 then return true else return false end
end

function isMedic(player)
    if tonumber(vnxGetElementData(player, "fraktion")) == 10 then return true else return false end
end

function isMechaniker(player)
    if tonumber(vnxGetElementData(player, "fraktion")) == 11 then return true else return false end
end

function isBallas(player)
    if tonumber(vnxGetElementData(player, "fraktion")) == 12 then return true else return false end
end

function isGrove(player)
    if tonumber(vnxGetElementData(player, "fraktion")) == 13 then return true else return false end
end

function isIMafia(player)
    if tonumber(vnxGetElementData(player, "fraktion")) == 14 then return true else return false end
end

function isFeuer(player)
    if tonumber(vnxGetElementData(player, "fraktion")) == 15 then return true else return false end
end

------------------------------------------------------------------------------------------------------
function isStateFaction(player)
    if isArmy(player) or isCop(player) or isFBI(player) then return true else return false end
end

function isOnStateDuty(player)
    return isOnDuty(player)    
end

function isOnDuty(player)

    local model = getElementModel(player)

    if isCop(player) then
        for i = 1, #factionSkins[1] do
            if factionSkins[1][i] == model then
                return true
            end
        end


    elseif isFBI(player) then
        for i = 1, #factionSkins[6] do
            if factionSkins[6][i] == model then
                return true
            end
        end


    elseif isArmy(player) then
        for i = 1, #factionSkins[8] do
            if factionSkins[8][i] == model then
                return true
            end
        end
    end

    return false
end

function isEmergencyOnDuty(player)

    local model = getElementModel(player)

    if isMedic(player) then
        for i = 1, #factionSkins[10] do
            if factionSkins[10][i] == model then
                return true
            end
        end

    elseif isMechaniker(player) then
        for i = 1, #factionSkins[11] do
            if factionSkins[11][i] == model then
                return true
            end
        end
    end

    return false
end


function isAbleOffduty(player)

    local model = getElementModel(player)

    for i = 1, #factionSkins[1] do
        if factionSkins[1][i] == model then
            return true
        end
    end

    for i = 1, #factionSkins[6] do
        if factionSkins[6][i] == model then
            return true
        end
    end

    for i = 1, #factionSkins[8] do
        if factionSkins[8][i] == model then
            return true
        end
    end
    return false
end

function isEvil(player)
    if isBrotherhood(player) or isTriad(player) or isAztecas(player) or isBiker(player) or isBallas(player) or isGrove(player) or isIMafia(player) then return true else return false end
end

function isEmergency(player)
    if isMedic(player) or isMechaniker(player) or isFeuer(player) then return true else return false end
end

function isInDepotFaction(player)
    return true
end

---------------------------------------------------------------------------------------------------
function sendMSGForFaction(msg, faction, r, g, b)
    if not r then
        local r, g, b = 200, 200, 100
    end
    for playeritem, key in pairs(fraktionMembers[faction]) do
        outputChatBox(msg, playeritem, r, g, b)
    end
end


function sendMSGForAdmins(msg, r, g, b)
    if not r then
        local r, g, b = 200, 200, 100
    end
    for playeritem, key in pairs(adminsIngame) do
        outputChatBox(msg, playeritem, r, g, b)
    end
end

function getFactionMembersOnline(faction)

    if faction then
        counter = 0
        for playeritem, index in pairs(fraktionMembers[faction]) do
            counter = counter + 1
        end
        return counter
    else
        return false
    end
end

function policeComputer(presser, key, state)

    if state == "down" and isOnDuty(presser) and isFederalCar(getPedOccupiedVehicle(presser)) and getElementModel(getPedOccupiedVehicle(presser)) ~= 520 then
        triggerClientEvent(presser, "showPDComputer", getRootElement())
    end
end

function createTeleportMarker(x1, y1, z1, int1, dim1, x2, y2, z2, int2, dim2, rot, needetFaction)

    if not needetFaction then
        needetFaction = 0
    end

    local marker1 = createMarker(x1, y1, z1 + 0.5, "corona", 1, 0, 0, 0, 0)
    local marker2 = createMarker(x1, y1, z1, "cylinder", 1, 255, 0, 0, 150)
    setElementDimension(marker1, dim1)
    setElementDimension(marker2, dim1)
    setElementInterior(marker1, int1)
    setElementInterior(marker2, int1)

    addEventHandler("onMarkerHit", marker1,
        function(hit, dim)
            if dim then
                if getElementType(hit) == "player" then
                    if not getPedOccupiedVehicle(hit) then
                        if needetFaction == 0 or vnxGetElementData(hit, "fraktion") == needetFaction then
                            fadeElementInterior(hit, int2, x2, y2, z2, rot, dim2)
                        else
                            infobox(hit, "Du bist nicht\nbefugt!", 5000, 125, 0, 0)
                        end
                    end
                end
            end
        end)
end

function createFactionVehicle(model, x, y, z, rx, ry, rz, faction, c1, c2, c3, c4, numberplate)

    if not c3 then
        c3 = 0
    end

    if not c4 then
        c4 = 0
    end

    if not numberplate then
        numberplate = fraktionNames[faction]
    end

    local veh = createVehicle(model, x, y, z, rx, ry, rz, numberplate)

    setVehicleColor(veh, c1, c2, c3, c4)
    setElementHealth(veh, 1700)
    setVehiclePaintjob(veh, 3)
    toggleVehicleRespawn(veh, true)
    setVehicleRespawnDelay(veh, FCarDestroyRespawn * 1000 * 60)
    setVehicleIdleRespawnDelay(veh, FCarIdleRespawn * 1000 * 60)
    factionVehicles[faction][veh] = true

    vnxSetElementData(veh, "owner", fraktionNames[faction])
    vnxSetElementData(veh, "ownerfraktion", faction)
    vnxSetElementData(veh, "sportmotor", (faction == 10 and 3 or 2))
    vnxSetElementData(veh, "bremse", (faction == 10 and 3 or 2))
    vnxSetElementData(veh, "antrieb", "awd")
    setElementFrozen(veh, true)

    if faction ~= 1 and faction ~= 6 and faction ~= 8 then
        addEventHandler("onVehicleStartEnter", veh, function(player, seat, jacked)
            if seat == 0 and vnxGetElementData(player, "fraktion") ~= faction then
                if not jacked then
                    cancelEvent()
                end
            else
                setElementFrozen(source, false)
            end
        end)

        addEventHandler("onVehicleEnter", veh, function(player, seat, jacked)
            if seat == 0 and vnxGetElementData(player, "fraktion") ~= faction and jacked then
                setElementVelocity(source, 0, 0, 0)
                setControlState(player, "enter_exit", false)
                setTimer(removePedFromVehicle, 750, 1, player)
                setTimer(setControlState, 150, 1, player, "enter_exit", false)
                setTimer(setControlState, 200, 1, player, "enter_exit", true)
                setTimer(setControlState, 700, 1, player, "enter_exit", false)
                infobox(player, "Du bist keiner\nvon " .. fraktionNames[faction] .. "!", 4000, 255, 0, 0)
            end
        end)
    else
        addEventHandler("onVehicleStartEnter", veh, function(player, seat, jacked)
            if seat == 0 and not isOnDuty(player) then
                if not jacked then
                    cancelEvent()
                end
            else
                setElementFrozen(source, false)
            end
        end)

        addEventHandler("onVehicleEnter", veh, function(player, seat, jacked)
            if seat == 0 and not isOnDuty(player) and jacked then
                setControlState(player, "enter_exit", false)
                setTimer(removePedFromVehicle, 750, 1, player)
                setTimer(setControlState, 150, 1, player, "enter_exit", false)
                setTimer(setControlState, 200, 1, player, "enter_exit", true)
                setTimer(setControlState, 700, 1, player, "enter_exit", false)
                infobox(player, "Du bist keiner\nvon " .. fraktionNames[faction] .. "!", 4000, 255, 0, 0)
            end
        end)
    end


    if faction == 1 then
        addEventHandler("onVehicleEnter", veh,
            function(player, seat)
                local veh = source
                if not isKeyBound(player, "sub_mission", "down", policeComputer) then
                    bindKey(player, "sub_mission", "down", policeComputer)
                end
            end)

    elseif faction == 6 then
        addEventHandler("onVehicleEnter", veh,
            function(player, seat)
                local veh = source
                if not isKeyBound(player, "sub_mission", "down", policeComputer) then
                    bindKey(player, "sub_mission", "down", policeComputer)
                end
            end)

    elseif faction == 8 then
        addEventHandler("onVehicleEnter", veh,
            function(player, seat)
                local veh = source
                if getPedOccupiedVehicleSeat(player) == 0 then
                    if not isKeyBound(player, "sub_mission", "down", policeComputer) and getElementModel(veh) ~= 520 then
                        bindKey(player, "sub_mission", "down", policeComputer)
                    end

                    if getElementModel(veh) == 433 then

                        setElementHealth(player, 100)
                        setPedArmor(player, 100)
                        setElementHunger(player, 100)

                    elseif getElementModel(veh) == 432 or getElementModel(veh) == 433 then

                        if vnxGetElementData(player, "job") ~= "tankcommander" then
                            opticExitVehicle(player)
                            outputChatBox("Du hast nicht die erforderliche Klasse!", player, 125, 0, 0)
                        end

                    elseif getElementModel(veh) == 425 or getElementModel(veh) == 520 or getElementModel(veh) == 476 then

                        if vnxGetElementData(player, "job") ~= "air" then
                            opticExitVehicle(player)
                            outputChatBox("Du hast nicht die erforderliche Klasse!", player, 125, 0, 0)
                        end

                    elseif getElementModel(veh) == 487 or getElementModel(veh) == 595 then

                        if vnxGetElementData(player, "job") ~= "marine" and seat == 0 then
                            opticExitVehicle(player)
                            outputChatBox("Du hast nicht die erforderliche Klasse!", player, 125, 0, 0)
                        else
                            giveWeapon(player, 46, 3, true)
                        end
                    end

                else

                    if not isKeyBound(player, "sub_mission", "down", policeComputer) and isOnDuty(player) then
                        bindKey(player, "sub_mission", "down", policeComputer)
                    end

                    if getElementModel(veh) == 433 then

                        setElementHealth(player, 100)
                        setPedArmor(player, 100)
                        setElementHunger(player, 100)
                    end
                end
            end)
    end
    giveSportmotorUpgrade(veh)

    return veh
end
local allowed_cmds = {	["self"] = true, ["say"] = true, ["teamsay"] = true }


function block_tie_cmds(cmd)
    if allowed_cmds[cmd] then
    else 
        cancelEvent()
    end
end

function tie_func(player, cmd, target)
    if target then
        local target = findPlayerByName(target)
        if target and target ~= player and getPedOccupiedVehicle(target) then
            if isEvil(player) or isOnDuty(player) then
                if getVehicleOccupant(getPedOccupiedVehicle(player)) ~= target and getPedOccupiedVehicleSeat(target) > 0 then
                    local x1, y1, z1 = getElementPosition(player)
                    local x2, y2, z2 = getElementPosition(target)

                    if getDistanceBetweenPoints3D(x1, y1, z1, x2, y2, z2) <= 5 then

                        local boolean = not vnxGetElementData(target, "tied")
                        vnxSetElementData(target, "tied", boolean)
                        toggleAllControls(target, boolean)
                        if boolean then fix = "ent" else fix = "ge" end

                        if fix == "ge" then

                            addEventHandler("onPlayerCommand", target, block_tie_cmds)

                        elseif fix == "ent" then

                            removeEventHandler("onPlayerCommand", target, block_tie_cmds)
                        end

                        if fix == "ent" then

                            fadeCamera(target, true, 0.5, 0, 0, 0)

                        elseif isEvil(player) then

                            fadeCamera(target, false, 0.5, 0, 0, 0)
                        end

                        outputChatBox("Du hast " .. getPlayerName(target) .. " " .. fix .. "fesselt!", player, 0, 125, 0)
                        outputChatBox("Du wurdest von " .. getPlayerName(player) .. " " .. fix .. "fesselt!", target, 200, 200, 0)

                    else

                        outputChatBox("Du bist zu weit weg!", player, 125, 0, 0)
                    end

                else

                    outputChatBox("Ungueltiges Ziel!", player, 125, 0, 0)
                end

            else

                outputChatBox("Du bist in einer ungueltigen Fraktion!", player, 125, 0, 0)
            end

        else

            outputChatBox("Ungueltiges Ziel!", player, 125, 0, 0)
        end
    else
        infobox(player, "Gebrauch:\n/tie [Name]", 200, 0, 0)
    end
end

addCommandHandler("tie", tie_func)

function fstate_func(player)
    local frac = vnxGetElementData(player, "fraktion")

    if frac > 0 then
        if frac == 1 or frac == 6 or frac == 8 then
            outputChatBox(factionDepotData["money"][1] .. "$ | " .. factionDepotData["drugs"][1] .. "g Drogen | " .. factionDepotData["koks"][1] .. "g Kokain | " .. factionDepotData["mats"][1] .. " Materialien", player, 0, 49, 212)
        elseif frac == 5 then
            outputChatBox(factionDepotData["money"][frac] .. "$", player, 200, 200, 0)
        elseif frac == 10 or frac == 11 then
            outputChatBox(factionDepotData["money"][10] .. "$ | " .. factionDepotData["drugs"][10] .. "g Drogen | " .. factionDepotData["koks"][10] .. "g Kokain | " .. factionDepotData["mats"][10] .. " Materialien", player, 0, 49, 212)
        else
            outputChatBox(factionDepotData["money"][frac] .. "$ | " .. factionDepotData["drugs"][frac] .. "g Drogen | " .. factionDepotData["koks"][frac] .. "g Kokain | " .. factionDepotData["mats"][frac] .. " Materialien", player, 0, 49, 212)
        end
    end
end

addCommandHandler("fstate", fstate_func)

function fskin_func(player)

    local curskin = getElementModel(player)
    local faction = getPlayerFaction(player)
    local onduty = isOnDuty(player)
    local val = false

    if getPedOccupiedVehicle(player) then

        outputChatBox("Bitte nutze diesen Befehl nur ausserhalb von Fahrzeugen!", player, 125, 0, 0)

    elseif faction == 6 and onduty and curskin ~= 285 then
        for i = 1, #factionSkins[6] do
            if factionSkins[6][i] == curskin then
                val = i
                break
            end
        end

        if val == false or val == #factionSkins[6] then
            setElementModel(player, factionSkins[6][1])
            return
        else
            setElementModel(player, factionSkins[6][val + 1])
            return
        end
    elseif faction == 8 then
        for i = 1, #factionSkins[8] do
            if factionSkins[8][i] == curskin then
                val = i
                break
            end
        end

        if val == false or val == #factionSkins[8] then
            setElementModel(player, factionSkins[8][1])
            return
        else
            setElementModel(player, factionSkins[8][val + 1])
            return
        end

    elseif faction == 1 and onduty and allowToChangeSkin and curskin ~= 285 then
        for i = 1, #factionSkins[1] do
            if factionSkins[1][i] == curskin then
                val = i
                break
            end
        end

        if val == false or val == #factionSkins[1] then
            setElementModel(player, factionSkins[1][1])
            return
        else
            setElementModel(player, factionSkins[1][val + 1])
            return
        end

    elseif faction and faction > 1 and faction ~= 10 and faction ~= 11 and faction ~= 6 and faction ~= 8 then
        for i, skin in pairs(factionSkins[faction]) do
            if skin == getElementModel(player) then
                val = i
                break
            end
        end

        if val == false or val == #factionSkins[faction] then

            setElementModel(player, factionSkins[faction][1])
            vnxSetElementData(player, "skinid", factionSkins[faction][1])
            return

        else

            setElementModel(player, factionSkins[faction][val + 1])
            vnxSetElementData(player, "skinid", factionSkins[faction][val + 1])
            return
        end
    end
end

addCommandHandler("fskin", fskin_func)


function invite_func(player, cmd, target)
    local faction = getPlayerFaction(player)
    local rank = getPlayerRank(player)
    if faction ~= 0 and rank >= 4 then
        local target = findPlayerByName(target)
        if target ~= false then
            --if vnxGetElementData ( player, "playingtime" ) >= 180 then
            if getPlayerFaction(target) == 0 then
                if not isInGang(getPlayerName(target)) then
                    vnxSetElementData(target, "fraktion", faction)
                    vnxSetElementData(target, "rang", 0)
                    vnxSetElementData(target, "FraktionenBetreten", vnxGetElementData(target, "FraktionenBetreten") + 1)
                    fraktionMembers[faction][target] = faction
                    if faction == 10 or faction == 11 then
                        fraktionMemberList[10][getPlayerName(target)] = 0
                        fraktionMemberListInvite[10][getPlayerName(target)] = timestampOptical()
                        for playeritem, _ in pairs(fraktionMembers[10]) do
                            triggerClientEvent(playeritem, "syncPlayerList", player, fraktionMemberList[10], fraktionMemberListInvite[10])
                        end
                        for playeritem, _ in pairs(fraktionMembers[11]) do
                            triggerClientEvent(playeritem, "syncPlayerList", player, fraktionMemberList[10], fraktionMemberListInvite[10])
                        end
                    else
                        fraktionMemberList[faction][getPlayerName(target)] = 0
                        fraktionMemberListInvite[faction][getPlayerName(target)] = timestampOptical()
                        for playeritem, _ in pairs(fraktionMembers[faction]) do
                            triggerClientEvent(playeritem, "syncPlayerList", player, fraktionMemberList[faction], fraktionMemberListInvite[faction])
                        end
                    end
                    triggerClientEvent(target, "triggeredBlacklist", target, blacklistPlayers[faction])
                    dbExec(handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "LastFactionChange", timestampOptical(), "UID", playerUID[getPlayerName(target)])
                    outputChatBox("Du wurdest soeben in eine Fraktion aufgenommen! Tippe /t [Text] für den Chat und F1, um mehr zu erfahren!", target, 0, 125, 0)
                    outputChatBox("Du hast den Spieler " .. getPlayerName(target) .. " in deine Fraktion aufgenommen!", player, 0, 125, 0)
                    if faction == 1 or faction == 6 or faction == 8 then
                        bindKey(target, "y", "down", "chatbox", "t")
                    end
                else
                    infobox(player, "\n\n\nDer Spieler ist\nin einer Gang!", 5000, 125, 0, 0)
                end
            else
                triggerClientEvent(player, "infobox_start", getRootElement(), "Der Spieler ist\nbereits in\neiner Fraktion!", 5000, 125, 0, 0)
            end
            --else
            --outputChatBox ( "Der Spieler hat noch keine 3Stunden", player, 125, 0, 0 )
            --end
        else
            triggerClientEvent(player, "infobox_start", getRootElement(), "\nUngueltiger\nSpieler!", 5000, 125, 0, 0)
        end
    else
        triggerClientEvent(player, "infobox_start", getRootElement(), "\nDu bist nicht\nbefugt!", 5000, 125, 0, 0)
    end
end

addCommandHandler("invite", invite_func)


function uninvite_func(player, cmd, target)

    local faction = getPlayerFaction(player)
    local rank = getPlayerRank(player)

    if faction > 0 and rank >= 4 then

        local target = findPlayerByName(target)

        if target ~= false then

            if (faction == getPlayerFaction(target) or (getPlayerFaction(target) == 10 and faction == 11) or (getPlayerFaction(target) == 11 and faction == 10)) and getPlayerRank(target) <= 4 then

                local model = malehomeless[math.random(1, 5)]
                setElementModel(target, model)
                vnxSetElementData(target, "skinid", model)
                if faction == 1 or faction == 6 or faction == 8 then
                    unbindKey(target, "y", "down", "chatbox")
                end
                vnxSetElementData(target, "rang", 0)
                vnxSetElementData(target, "FraktionenVerlassen", vnxGetElementData(target, "FraktionenVerlassen") + 1)
                fraktionMembers[faction][target] = nil
                vnxSetElementData(target, "fraktion", 0)
                if faction == 10 or faction == 11 then
                    fraktionMemberList[10][getPlayerName(target)] = nil
                    fraktionMemberListInvite[10][getPlayerName(target)] = nil
                    for playeritem, _ in pairs(fraktionMembers[10]) do
                        triggerClientEvent(playeritem, "syncPlayerList", player, fraktionMemberList[10], fraktionMemberListInvite[10])
                    end
                    for playeritem, _ in pairs(fraktionMembers[11]) do
                        triggerClientEvent(playeritem, "syncPlayerList", player, fraktionMemberList[10], fraktionMemberListInvite[10])
                    end
                else
                    fraktionMemberList[faction][getPlayerName(target)] = nil
                    fraktionMemberListInvite[faction][getPlayerName(target)] = nil
                    for playeritem, _ in pairs(fraktionMembers[faction]) do
                        triggerClientEvent(playeritem, "syncPlayerList", player, fraktionMemberList[faction], fraktionMemberListInvite[faction])
                    end
                end
                outputChatBox("Du wurdest soeben aus deiner Fraktion geworfen!", target, 0, 125, 0)
                dbExec(handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "LastFactionChange", timestampOptical(), "UID", playerUID[getPlayerName(target)])
                outputChatBox("Du hast den Spieler " .. getPlayerName(target) .. " aus deiner Fraktion entfernt!", player, 0, 125, 0)

            else
                triggerClientEvent(player, "infobox_start", getRootElement(), "Du kannst den\nSpieler nicht aus\nder Fraktion\nentfernen!", 5000, 125, 0, 0)
            end

        else

            triggerClientEvent(player, "infobox_start", getRootElement(), "\nUngueltiger\nSpieler!", 5000, 125, 0, 0)
        end

    else

        triggerClientEvent(player, "infobox_start", getRootElement(), "\nDu bist nicht\nbefugt!", 5000, 125, 0, 0)
    end
end

addCommandHandler("uninvite", uninvite_func)


function getchangestate_func(player, cmd, target)
    if playerUID[target] then
        if vnxGetElementData(player, "adminlvl") >= 3 or vnxGetElementData(player, "rang") >= 4 then
            local result = dbPoll(dbQuery(handler, "SELECT ?? FROM ?? WHERE ??=?", "LastFactionChange", "userdata", "UID", playerUID[target]), -1)
            outputChatBox("Letzter Fraktions-Uninvite: " .. result[1]["LastFactionChange"], player, 200, 200, 0)
        else
            outputChatBox("Du bist kein Admin/Leader/Coleader!", player, 125, 0, 0)
        end
    else
        outputChatBox("Der Spieler ist nicht online!", player, 125, 0, 0)
    end
end

addCommandHandler("getchangestate", getchangestate_func)


function giverank_func(player, target)


    local newrank = math.abs(getPlayerRank(target) + 1)

    local faction = getPlayerFaction(player)
    local rank = getPlayerRank(player)

    if target then

        local targetfaction = getPlayerFaction(target)
        local targetrank = getPlayerRank(target)

        if faction >= 1 and rank >= 4 and (faction == targetfaction or (faction == 10 and targetfaction == 11) or (faction == 11 and targetfaction == 10)) and rank > newrank and targetrank ~= newrank then
            if targetrank < rank then
                if newrank < 5 and newrank >= 0 then

                    if newrank > targetrank then

                        outputChatBox("Glückwunsch, du wurdest soeben von " .. getPlayerName(player) .. " zum " .. factionRankNames[faction][newrank] .. " befördert!", target, 0, 125, 0)

                    else

                        outputChatBox("Du wurdest soeben von " .. getPlayerName(player) .. " zum " .. factionRankNames[faction][newrank] .. " degradiert!", target, 125, 0, 0)
                    end

                    vnxSetElementData(target, "rang", newrank)
                    if faction == 10 or faction == 11 then
                        fraktionMemberList[10][getPlayerName(target)] = newrank
                        for playeritem, _ in pairs(fraktionMembers[10]) do
                            triggerClientEvent(playeritem, "syncPlayerList", player, fraktionMemberList[10], fraktionMemberListInvite[10])
                        end
                        for playeritem, _ in pairs(fraktionMembers[11]) do
                            triggerClientEvent(playeritem, "syncPlayerList", player, fraktionMemberList[10], fraktionMemberListInvite[10])
                        end
                    else
                        fraktionMemberList[faction][getPlayerName(target)] = newrank
                        for playeritem, _ in pairs(fraktionMembers[faction]) do
                            triggerClientEvent(playeritem, "syncPlayerList", player, fraktionMemberList[faction], fraktionMemberListInvite[faction])
                        end
                    end
                    triggerClientEvent(player, "infobox_start", getRootElement(), "Du hast " .. getPlayerName(target) .. " soeben Rang " .. factionRankNames[faction][newrank] .. " ( " .. newrank .. " ) gegeben!", 5000, 125, 0, 0)
                    outputChatBox("Du hast " .. getPlayerName(target) .. " soeben Rang " .. factionRankNames[faction][newrank] .. " ( " .. newrank .. " ) gegeben!", player, 0, 125, 0)
                end
            else
                triggerClientEvent(player, "infobox_start", getRootElement(), "\nDu bist nicht\nbefugt!", 5000, 125, 0, 0)
            end

        else

            triggerClientEvent(player, "infobox_start", getRootElement(), "\nDu bist nicht\nbefugt!", 5000, 125, 0, 0)
        end

    else

        triggerClientEvent(player, "infobox_start", getRootElement(), "\nUngueltiger\nSpieler!", 5000, 125, 0, 0)
    end
end

--addCommandHandler ( "giverank", giverank_func )
addEvent("giverank_func", true)
addEventHandler("giverank_func", getRootElement(), giverank_func)

addEvent("fraktion_invite", true)
addEventHandler("fraktion_invite", root, function(target)
    local faction = getPlayerFaction(client)
    local rank = getPlayerRank(client)
    if faction ~= 0 and rank >= 5 then
        local targetpl = findPlayerByName(target)
        if isElement(targetpl) then
            if getPlayerFaction(targetpl) == 0 then
                if not isInGang(getPlayerName(targetpl)) then
                    vnxSetElementData(targetpl, "fraktion", faction)
                    vnxSetElementData(targetpl, "rang", 0)
                    vnxSetElementData(targetpl, "FraktionenBetreten", vnxGetElementData(targetpl, "FraktionenBetreten") + 1)
                    fraktionMembers[faction][targetpl] = faction
                    fraktionMemberList[faction][getPlayerName(targetpl)] = 0
                    fraktionMemberListInvite[faction][getPlayerName(targetpl)] = timestampOptical()
                    for playeritem, _ in pairs(fraktionMembers[faction]) do
                        triggerClientEvent(playeritem, "syncPlayerList", client, fraktionMemberList[faction], fraktionMemberListInvite[faction])
                    end
                    triggerClientEvent(targetpl, "triggeredBlacklist", targetpl, blacklistPlayers[faction])
                    dbExec(handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "LastFactionChange", timestampOptical(), "UID", playerUID[getPlayerName(targetpl)])
                    outputChatBox("Du wurdest soeben in eine Fraktion aufgenommen! Tippe /t [Text] fuer den Chat und F1, um mehr zu erfahren!", targetpl, 0, 125, 0)
                    outputChatBox("Du hast den Spieler " .. getPlayerName(targetpl) .. " in deine Fraktion aufgenommen!", client, 0, 125, 0)
                else
                    infobox(client, "\n\n\nDer Spieler ist\nin einer Gang!", 5000, 125, 0, 0)
                end
            else
                triggerClientEvent(client, "infobox_start", getRootElement(), "Der Spieler ist\nbereits in\neiner Fraktion!", 5000, 125, 0, 0)
            end
        elseif playerUID[target] then
            if tonumber(dbPoll(dbQuery(handler, "SELECT ?? FROM ?? WHERE ??=?", "Fraktion", "UID", playerUID[target]), -1)[1]["Fraktion"]) == 0 then
                if not isInGang(target) then
                    outputChatBox("Du hast den Spieler " .. target .. " in deine Fraktion aufgenommen!", client, 0, 125, 0)
                    offlinemsg("Du wurdest von " .. getPlayerName(client) .. " in die Fraktion " .. fraktionNames[faction] .. " aufgenommen!", "Fraktionssystem", target)
                    fraktionMemberList[faction][target] = 0
                    fraktionMemberListInvite[faction][target] = timestampOptical()
                    for playeritem, _ in pairs(fraktionMembers[faction]) do
                        triggerClientEvent(playeritem, "syncPlayerList", client, fraktionMemberList[faction], fraktionMemberListInvite[faction])
                    end
                    dbExec(handler, "UPDATE ?? SET ??=?, ??=? WHERE ??=?", "userdata", "Fraktion", faction, "LastFactionChange", timestampOptical(), "UID", playerUID[target])
                else
                    infobox(client, "\n\n\nDer Spieler ist\nin einer Gang!", 5000, 125, 0, 0)
                end
            else
                triggerClientEvent(client, "infobox_start", getRootElement(), "Der Spieler ist\nbereits in\neiner Fraktion!", 5000, 125, 0, 0)
            end
        else
            triggerClientEvent(client, "infobox_start", getRootElement(), "\nUngueltiger\nSpieler!", 5000, 125, 0, 0)
        end
    else
        triggerClientEvent(client, "infobox_start", getRootElement(), "\nDu bist nicht\nbefugt!", 5000, 125, 0, 0)
    end
end)


addEvent("fraktion_uninvite", true)
addEventHandler("fraktion_uninvite", root, function(target)
    local faction = getPlayerFaction(client)
    local rank = getPlayerRank(client)
    if faction > 0 and rank >= 5 then
        local targetpl = findPlayerByName(target)
        if isElement(targetpl) then
            if faction == vnxGetElementData(targetpl, "fraktion") and vnxGetElementData(targetpl, "rang") <= 4 then
                local model = malehomeless[math.random(1, 5)]
                setElementModel(targetpl, model)
                vnxSetElementData(targetpl, "skinid", model)
                vnxSetElementData(targetpl, "rang", 0)
                vnxSetElementData(targetpl, "rang", 0)
                vnxSetElementData(targetpl, "FraktionenVerlassen", vnxGetElementData(targetpl, "FraktionenVerlassen") + 1)
                fraktionMembers[faction][targetpl] = nil
                fraktionMemberList[faction][getPlayerName(targetpl)] = nil
                fraktionMemberListInvite[faction][getPlayerName(targetpl)] = nil
                for playeritem, _ in pairs(fraktionMembers[faction]) do
                    triggerClientEvent(playeritem, "syncPlayerList", client, fraktionMemberList[faction], fraktionMemberListInvite[faction])
                end
                vnxSetElementData(targetpl, "fraktion", 0)
                outputChatBox("Du wurdest soeben aus deiner Fraktion geworfen!", targetpl, 0, 125, 0)
                dbExec(handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "LastFactionChange", timestampOptical(), "UID", playerUID[getPlayerName(targetpl)])
                --outputChatBox ( "Du hast den Spieler "..getPlayerName(targetpl).." aus deiner Fraktion entfernt!", client, 0, 125, 0 )
                triggerClientEvent(client, "infobox_start", getRootElement(), "du hast den Spieler\n" .. getPlayerName(targetpl) .. "entfernt!", 5000, 125, 0, 0)
            else
                triggerClientEvent(client, "infobox_start", getRootElement(), "Du kannst den\nSpieler nicht aus\nder Fraktion\nentfernen!", 5000, 125, 0, 0)
            end
        elseif playerUID[target] then
            local result = dbPoll(dbQuery(handler, "SELECT ??, ?? FROM ?? WHERE ??=?", "Fraktion", "FraktionsRang", "userdata", "UID", playerUID[target]), -1)
            if result and result[1] and tonumber(result[1]["Fraktion"]) == faction then
                if tonumber(result[1]["FraktionsRang"]) <= 4 then
                    dbExec(handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "Fraktion", 0, "UID", playerUID[target])
                    outputChatBox("Du hast den Spieler " .. target .. " aus deine Fraktion uninvitet!", client, 0, 125, 0)
                    offlinemsg("Du wurdest von " .. getPlayerName(client) .. " aus der Fraktion " .. fraktionNames[faction] .. " uninvitet!", "Fraktionssystem", target)
                    fraktionMemberList[faction][target] = nil
                    fraktionMemberListInvite[faction][target] = nil
                    for playeritem, _ in pairs(fraktionMembers[faction]) do
                        triggerClientEvent(playeritem, "syncPlayerList", client, fraktionMemberList[faction], fraktionMemberListInvite[faction])
                    end
                    dbExec(handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "LastFactionChange", timestampOptical(), "UID", playerUID[target])
                else
                    triggerClientEvent(client, "infobox_start", getRootElement(), "\nDu kannst einen\nLeader nicht uninviten!", 5000, 125, 0, 0)
                end
            else
                triggerClientEvent(client, "infobox_start", getRootElement(), "\nDer Spieler ist\nnicht in deiner Fraktion!", 5000, 125, 0, 0)
            end
        else
            triggerClientEvent(client, "infobox_start", getRootElement(), "\nUngueltiger\nSpieler!", 5000, 125, 0, 0)
        end
    else
        triggerClientEvent(client, "infobox_start", getRootElement(), "\nDu bist nicht\nbefugt!", 5000, 125, 0, 0)
    end
end)


addEvent("fraktion_befoerdern", true)
addEventHandler("fraktion_befoerdern", root, function(target, newrank)
    local newrank = math.abs(math.floor(tonumber(newrank)))
    local faction = getPlayerFaction(client)
    local targetpl = findPlayerByName(target)
    local rank = getPlayerRank(client)
    if isElement(targetpl) then
        local targetrank = getPlayerRank(targetpl)
        if targetrank < newrank then
            local targetfaction = getPlayerFaction(targetpl)
            if faction >= 1 and rank >= 4 and faction == targetfaction and rank > newrank then
                if newrank < 5 and newrank >= 0 then
                    outputChatBox("Glückwunsch, du wurdest soeben von " .. getPlayerName(client) .. " zum " .. factionRankNames[faction][newrank] .. " befördert!", targetpl, 0, 125, 0)
                    vnxSetElementData(targetpl, "rang", newrank)
                    fraktionMemberList[faction][getPlayerName(targetpl)] = newrank
                    for playeritem, _ in pairs(fraktionMembers[faction]) do
                        triggerClientEvent(playeritem, "syncPlayerList", client, fraktionMemberList[faction], fraktionMemberListInvite[faction])
                    end
                    triggerClientEvent(player, "infobox_start", getRootElement(),"Du hast " .. getPlayerName(targetpl) .. " soeben Rang " .. factionRankNames[faction][newrank] .. " ( " .. newrank .. " ) gegeben!", 5000, 125, 0, 0)
                    outputChatBox("Du hast " .. getPlayerName(targetpl) .. " soeben Rang " .. factionRankNames[faction][newrank] .. " ( " .. newrank .. " ) gegeben!", client, 0, 125, 0)
                end
            else
                triggerClientEvent(client, "infobox_start", getRootElement(), "\nDu bist nicht\nbefugt!", 5000, 125, 0, 0)
            end
        else
            triggerClientEvent(client, "infobox_start", getRootElement(), "\nDer Rang des\nSpieler ist höher!", 5000, 125, 0, 0)
        end
    elseif playerUID[target] then
        if rank >= 4 and rank > newrank then
            local result = dbPoll(dbQuery(handler, "SELECT ??, ?? FROM ?? WHERE ??=?", "Fraktion", "FraktionsRang", "userdata", "UID", playerUID[target]), -1)
            if result and result[1] and tonumber(result[1]["Fraktion"]) == faction then
                if tonumber(result[1]["FraktionsRang"]) < newrank then
                    dbExec(handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "FraktionsRang", newrank, "UID", playerUID[target])
                    outputChatBox("Du hast " .. target .. " soeben Rang " .. factionRankNames[faction][newrank] .. " ( " .. newrank .. " ) gegeben!", client, 0, 125, 0)
                    triggerClientEvent(client, "infobox_start", getRootElement(), "Du hast " .. target .. " soeben Rang " .. factionRankNames[faction][newrank] .. " ( " .. newrank .. " ) gegeben!", 5000, 125, 0, 0)
                    offlinemsg("Glückwunsch, du wurdest soeben von " .. getPlayerName(client) .. " zum " .. factionRankNames[faction][newrank] .. " befördert!", "Fraktionssystem", target)
                    fraktionMemberList[faction][target] = newrank
                    for playeritem, _ in pairs(fraktionMembers[faction]) do
                        triggerClientEvent(playeritem, "syncPlayerList", client, fraktionMemberList[faction], fraktionMemberListInvite[faction])
                    end
                else
                    triggerClientEvent(client, "infobox_start", getRootElement(), "\nDer Rang des\nSpieler ist höher!", 5000, 125, 0, 0)
                end
            else
                triggerClientEvent(client, "infobox_start", getRootElement(), "\nDer Spieler ist\nnicht in deiner Fraktion!", 5000, 125, 0, 0)
            end
        else
            triggerClientEvent(client, "infobox_start", getRootElement(), "\nDu bist nicht\nbefugt!", 5000, 125, 0, 0)
        end
    else
        triggerClientEvent(client, "infobox_start", getRootElement(), "\nUngueltiger\nSpieler!", 5000, 125, 0, 0)
    end
end)


addEvent("fraktion_degradieren", true)
addEventHandler("fraktion_degradieren", root, function(player, target)


    local newrank = math.abs(getPlayerRank(target) - 1)

    local faction = getPlayerFaction(player)
    local rank = getPlayerRank(player)

    if target then

        local targetfaction = getPlayerFaction(target)
        local targetrank = getPlayerRank(target)

        if faction >= 1 and rank >= 4 and (faction == targetfaction or (faction == 10 and targetfaction == 11) or (faction == 11 and targetfaction == 10)) and rank > newrank and targetrank ~= newrank then
            if targetrank < rank then
                if newrank < 5 and newrank >= 0 then

                    if newrank > targetrank then

                        outputChatBox("Glückwunsch, du wurdest soeben von " .. getPlayerName(player) .. " zum " .. factionRankNames[faction][newrank] .. " befördert!", target, 0, 125, 0)

                    else

                        outputChatBox("Du wurdest soeben von " .. getPlayerName(player) .. " zum " .. factionRankNames[faction][newrank] .. " degradiert!", target, 125, 0, 0)
                    end

                    vnxSetElementData(target, "rang", newrank)
                    if faction == 10 or faction == 11 then
                        fraktionMemberList[10][getPlayerName(target)] = newrank
                        for playeritem, _ in pairs(fraktionMembers[10]) do
                            triggerClientEvent(playeritem, "syncPlayerList", player, fraktionMemberList[10], fraktionMemberListInvite[10])
                        end
                        for playeritem, _ in pairs(fraktionMembers[11]) do
                            triggerClientEvent(playeritem, "syncPlayerList", player, fraktionMemberList[10], fraktionMemberListInvite[10])
                        end
                    else
                        fraktionMemberList[faction][getPlayerName(target)] = newrank
                        for playeritem, _ in pairs(fraktionMembers[faction]) do
                            triggerClientEvent(playeritem, "syncPlayerList", player, fraktionMemberList[faction], fraktionMemberListInvite[faction])
                        end
                    end
                    triggerClientEvent(client, "infobox_start", getRootElement(), "Du hast " .. getPlayerName(target) .. " soeben Rang " .. factionRankNames[faction][newrank] .. " ( " .. newrank .. " ) gegeben!", 5000, 125, 0, 0)
                    outputChatBox("Du hast " .. getPlayerName(target) .. " soeben Rang " .. factionRankNames[faction][newrank] .. " ( " .. newrank .. " ) gegeben!", player, 0, 125, 0)
                end
            else
                triggerClientEvent(player, "infobox_start", getRootElement(), "\nDu bist nicht\nbefugt!", 5000, 125, 0, 0)
            end

        else

            triggerClientEvent(player, "infobox_start", getRootElement(), "\nDu bist nicht\nbefugt!", 5000, 125, 0, 0)
        end

    else

        triggerClientEvent(player, "infobox_start", getRootElement(), "\nUngueltiger\nSpieler!", 5000, 125, 0, 0)
    end
end)


function selbstUninvite(player)
    local faction = getPlayerFaction(player)
    local rank = getPlayerRank(player)
    if faction > 0 and rank < 5 then
        local model = malehomeless[math.random(1, 5)]
        setElementModel(player, model)
        vnxSetElementData(player, "skinid", model)
        vnxSetElementData(player, "rang", 0)
        fraktionMembers[faction][player] = nil
        fraktionMemberList[faction][getPlayerName(player)] = nil
        fraktionMemberListInvite[faction][getPlayerName(player)] = nil
        vnxSetElementData(player, "fraktion", 0)
        vnxSetElementData(player, "FraktionenVerlassen", vnxGetElementData(player, "FraktionenVerlassen") + 1)
        for playeritem, _ in pairs(fraktionMembers[faction]) do
            triggerClientEvent(playeritem, "syncPlayerList", player, fraktionMemberList[faction], fraktionMemberListInvite[faction])
        end
        outputChatBox("Du hast dich soeben aus der Fraktion uninvitet!", player, 0, 125, 0)
        dbExec(handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "LastFactionChange", timestampOptical(), "UID", playerUID[getPlayerName(player)])
        for member, rank in pairs(fraktionMemberList[faction]) do
            if rank >= 4 then
                if getPlayerFromName(member) then
                    outputChatBox("Der Spieler " .. getPlayerName(player) .. " hat sich selbst uninvitet!", getPlayerFromName(member), 200, 200, 200)
                else
                    offlinemsg("Der Spieler " .. getPlayerName(player) .. " hat sich selbst uninvitet!", "Fraktion", member)
                end
            end
        end
    else
        triggerClientEvent(player, "infobox_start", getRootElement(), "\nDu bist\nals Leader nicht\nbefugt!", 5000, 125, 0, 0)
    end
end

addCommandHandler("selfuninvite", selbstUninvite)


function frespawn(player)
    local frac = getPlayerFaction(player)
    local rank = getPlayerRank(player)
    if frac then
        if frac > 0 then
            if rank >= 3 then
                if not isTimer(frespawnTimer[frac]) then
                    zaehlerFrespawnTimer[frac] = 0
                    sendMSGForFaction("Countdown zum Fraktionsrespawn wurde von " .. getPlayerName(player) .. " gestartet. Benutze /stopfrespawn zum Stoppen!", frac, 0, 0, 155)
                    frespawnTimer[frac] = setTimer(frespawnCountdown, 1000, 10, player)
                    addCommandHandler("stopfrespawn", stopFrespawnCountdown)
                else
                    triggerClientEvent(player, "infobox_start", getRootElement(), "\nEs läuft schon\nein Frespawn\n-Countdown!", 5000, 125, 0, 0)
                end
            else
                triggerClientEvent(player, "infobox_start", getRootElement(), "\nErst ab\nRang 3!", 5000, 125, 0, 0)
            end
        else
            triggerClientEvent(player, "infobox_start", getRootElement(), "\nDu bist in\nkeiner Fraktion!", 5000, 125, 0, 0)
        end
    else
        triggerClientEvent(player, "infobox_start", getRootElement(), "\nDu bist in\nkeiner Fraktion!", 5000, 125, 0, 0)
    end
end

addCommandHandler("frespawn", frespawn)


function frespawnCountdown(player)
    local frac = getPlayerFaction(player)
    zaehlerFrespawnTimer[frac] = zaehlerFrespawnTimer[frac] + 1
    if zaehlerFrespawnTimer[frac] == 10 then
        sendMSGForFaction("Wird durchgeführt ..", frac, 0, 155, 0)
        startFrespawn(player)
    elseif zaehlerFrespawnTimer[frac] == 5 then
        sendMSGForFaction("Noch 5 Sekunden!", frac, 0, 155, 0)
    elseif zaehlerFrespawnTimer[frac] >= 7 then
        sendMSGForFaction(10 - zaehlerFrespawnTimer[frac] .. " ..", frac, 0, 155, 0)
    end
end

function startFrespawn(player)
    frespawnTimer[getPlayerFaction(player)] = nil
    local frak = vnxGetElementData(player, "fraktion")
    if frak == 1 then
        for veh, _ in pairs(factionVehicles[frak]) do
            if not getVehicleOccupant(veh) then
                respawnVehicle(veh)
                setElementFrozen(veh, true)
            end
        end
    elseif frak == 2 then
        for veh, _ in pairs(factionVehicles[frak]) do
            if not getVehicleOccupant(veh) and getElementDimension(veh) ~= diegangwardimension then
                respawnVehicle(veh)
                setElementFrozen(veh, true)
            end
        end
    elseif frak == 3 then
        for veh, _ in pairs(factionVehicles[frak]) do
            if not getVehicleOccupant(veh) and getElementDimension(veh) ~= diegangwardimension then
                respawnVehicle(veh)
                setElementFrozen(veh, true)
            end
        end
    elseif frak == 4 then
        for veh, _ in pairs(factionVehicles[frak]) do
            if not getVehicleOccupant(veh) then
                respawnVehicle(veh)
                setElementFrozen(veh, true)
            end
        end
    elseif frak == 5 then
        for veh, _ in pairs(factionVehicles[frak]) do
            if not getVehicleOccupant(veh) then
                respawnVehicle(veh)
                setElementFrozen(veh, true)
            end
        end
    elseif frak == 6 then
        for veh, _ in pairs(factionVehicles[frak]) do
            if not getVehicleOccupant(veh) then
                respawnVehicle(veh)
                setElementFrozen(veh, true)
            end
        end
    elseif frak == 7 then
        for veh, _ in pairs(factionVehicles[frak]) do
            if not getVehicleOccupant(veh) and getElementDimension(veh) ~= diegangwardimension then
                respawnVehicle(veh)
                setElementFrozen(veh, true)
            end
        end
    elseif frak == 8 then
        for veh, _ in pairs(factionVehicles[frak]) do
            if not getVehicleOccupant(veh) then
                respawnVehicle(veh)
                setElementFrozen(veh, true)
            end
        end
    elseif frak == 9 then
        for veh, _ in pairs(factionVehicles[frak]) do
            if not getVehicleOccupant(veh) and getElementDimension(veh) ~= diegangwardimension then
                respawnVehicle(veh)
                setElementFrozen(veh, true)
            end
        end
    elseif frak == 10 then
        for i = 1, #medicVehicles do
            if not getVehicleOccupant(medicVehicles[i]) then
                respawnVehicle(medicVehicles[i])
                setElementFrozen(medicVehicles[i], true)
            end
        end
    elseif frak == 11 then
        for i = 1, #mechanikerVehicles do
            if not getVehicleOccupant(mechanikerVehicles[i]) then
                respawnVehicle(mechanikerVehicles[i])
                respawnVehicle(mechanikerVehicless[i])
                setElementFrozen(mechanikerVehicles[i], true)
                setElementFrozen(mechanikerVehicless[i], true)
            end
        end
    elseif frak == 12 then
        for veh, _ in pairs(wattsvehicles) do
            if not getVehicleOccupant(veh) and getElementDimension(veh) ~= diegangwardimension then
                respawnVehicle(veh)
                setElementFrozen(veh, true)
            end
        end
    elseif frak == 13 then
        for veh, _ in pairs(Comptonvehicles) do
            if not getVehicleOccupant(veh) and getElementDimension(veh) ~= diegangwardimension then
                respawnVehicle(veh)
                setElementFrozen(veh, true)
            end
        end
    elseif frak == 14 then
        for veh, _ in pairs(factionVehicles[frak]) do
            if not getVehicleOccupant(veh) and getElementDimension(veh) ~= diegangwardimension then
                respawnVehicle(veh)
                setElementFrozen(veh, true)
            end
        end
    end
end


function stopFrespawnCountdown(player)
    local frac = getPlayerFaction(player)
    if frac then
        if frac > 0 then
            if frespawnTimer[frac] then
                if isTimer(frespawnTimer[frac]) then
                    killTimer(frespawnTimer[frac])
                    frespawnTimer[frac] = nil
                    sendMSGForFaction("Fraktions-Respawn abgebrochen durch " .. getPlayerName(player), frac, 155, 0, 0)
                end
            end
        end
    end
end


function allowFSkinFunction(player)
    if vnxGetElementData(player, "fraktion") == 1 and vnxGetElementData(player, "rang") >= 4 then
        if not allowToChangeSkin then
            allowToChangeSkin = true
            sendMSGForFaction("/fskin wurde für zwei Minuten aktiviert!", 1, 0, 200, 0)
            allowToChangeSkinTimer = setTimer(allowFSkinFunction, 2 * 60 * 1000, 1, player)
        else
            allowToChangeSkin = false
            sendMSGForFaction("/fskin wurde wieder deaktiviert!", 1, 200, 0, 0)
            if isTimer(allowToChangeSkinTimer) then
                killTimer(allowToChangeSkinTimer)
            end
        end
    end
end

--addCommandHandler("allowfskin", allowFSkinFunction)


addCommandHandler("frakpm", function(player, cmd, ...)
    local frac = vnxGetElementData(player, "fraktion")
    local rang = vnxGetElementData(player, "rang")
    local pname = getPlayerName(player)
    if frac > 0 and rang >= 4 then
        local msg = table.concat({ ... }, " ")
        if msg and msg ~= "" then
            if frac == 10 or frac == 11 then
                for playeritem, _ in pairs(fraktionMemberList[10]) do
                    if getPlayerFromName(playeritem) then
                        outputChatBox(pname .. ": " .. msg, getPlayerFromName(playeritem), 200, 200, 0)
                    else
                        offlinemsg(msg, pname, playeritem)
                    end
                end
            else
                for playeritem, _ in pairs(fraktionMemberList[11]) do
                    if getPlayerFromName(playeritem) then
                        outputChatBox(pname .. ": " .. msg, getPlayerFromName(playeritem), 200, 200, 0)
                    else
                        offlinemsg(msg, pname, playeritem)
                    end
                end
                for playeritem, _ in pairs(fraktionMemberList[frac]) do
                    if getPlayerFromName(playeritem) then
                        outputChatBox(pname .. ": " .. msg, getPlayerFromName(playeritem), 200, 200, 0)
                    else
                        offlinemsg(msg, pname, playeritem)
                    end
                end
            end
        end
    else
        infobox(player, "Du bist\nnicht befugt!", 4000, 200, 0, 0)
    end
end)


local SFPDVehicleRespawnCol = createColCuboid(-1626.9000244141, 647.5, -6.5, -1618.6999511719 + 1626.9000244141, 655.40002441406 - 647.5, 7)
local FBIVehicleRespawnCol = createColCuboid(-2429.6999511719, 530.70001220703, 28, -2422.6999511719 + 2429.6999511719, 540.20001220703 - 530.70001220703, 5)
local ARMYVehicleRespawnCol = createColCuboid(265.5, 1803.0999755859, 16, 272.39999389648 - 265.5, 1809.5999755859 - 1803.0999755859, 5)

function respawnFrakVehicleInColShape(hitElement, dim)
    if getElementType(hitElement) == "vehicle" and dim then
        if factionVehicles[1][hitElement] or factionVehicles[6][hitElement] or factionVehicles[8][hitElement] then
            for _, occupant in pairs(getVehicleOccupants(hitElement)) do
                removePedFromVehicle(occupant)
            end
            respawnVehicle(hitElement)
            setElementFrozen(hitElement, true)
        end
    end
end

addEventHandler("onColShapeHit", SFPDVehicleRespawnCol, respawnFrakVehicleInColShape)
addEventHandler("onColShapeHit", FBIVehicleRespawnCol, respawnFrakVehicleInColShape)
addEventHandler("onColShapeHit", ARMYVehicleRespawnCol, respawnFrakVehicleInColShape)



--[[
-- Die Tabelle, wo die Waffen für jeden einzelnen Rang stehen --
-- Eintrag [0] erstellen wir manuell mit dem Index, da Tabellen-Einträge immer bei 1 anfangen --
local weaponsOnSpawn = { [0] = 0, 32, 28, 24, 31, 30 }

-- Nutzen onPlayerSpawn als Event, damit die Funktion immer aufgerufen wird, wenn ein Spieler spawnt --
-- Laut MTA Wiki ist hier source der Spieler, der gespawnt ist --
addEventHandler ( "onPlayerSpawn", root, function ( )
	-- Abfragen, ob der Spieler ein Bösewicht ist --
	-- Die Funktion isEvil wurde in dieser Datei erstellt (oben irgendwo) --
	if isEvil ( source ) then
		-- Wenn der Spieler einer von den bösen Fraktionen ist, speichern wir erstmal seinen Rang auf die Variable rang --
		local rang = vnxGetElementData ( source, "rang" )
		-- Nun gehen wir alle Einträge von oben nach unten durch, angefangen vom Rang des Spielers --
		-- Bei Rang 3 gehen wir also durch 3, 2, 1 und 0 --
		for i=0, rang do
			-- Hier geben wir die Waffe für diesen Rang --
			giveWeapon ( source, weaponsOnSpawn[i], 150 )
		end
	end
end )
]]
function onPlayerSpawn_func()
    if isEvil(source) then
        if vnxGetElementData(source, "rang") == 0 then
            local weapon = 5
            local ammo = 1
            giveWeapon(source, weapon, ammo, true)
        elseif vnxGetElementData(source, "rang") == 1 then
            local weapon = 22
            local ammo = 170
            giveWeapon(source, weapon, ammo, true)
        elseif vnxGetElementData(source, "rang") == 2 then
            local weapon = 25
            local ammo = 50
            giveWeapon(source, weapon, ammo, true)
        elseif vnxGetElementData(source, "rang") == 3 then
            local weapon = 29
            local ammo = 90
            giveWeapon(source, weapon, ammo, true)
        elseif vnxGetElementData(source, "rang") == 4 then
            local weapon = 30
            local ammo = 100
            giveWeapon(source, weapon, ammo, true)
        elseif vnxGetElementData(source, "rang") == 5 then
            local weapon = 30
            local ammo = 150
            giveWeapon(source, weapon, ammo, true)
        end
    end
end

addEventHandler("onPlayerSpawn", getRootElement(), onPlayerSpawn_func)
