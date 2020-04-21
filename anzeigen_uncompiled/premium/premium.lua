vipPackageName= {
    [1] = "#cd7f32Bronze",
    [2] = "#C0C0C0Silber",
    [3] = "#DAA520Gold",
    [4] = "#e5e4e2Platin",
    [5] = "#0096FFTOP DONATOR"
}

vipPackageSocialTime= {
    [1] = (604800*4),
    [2] = (604800*2),
    [3] = (604800*1),
    [4] = 86400,
    [5] = 60
}

vipPackageTeleTime= {
    [1] = (604800*4),
    [2] = (604800*2),
    [3] = (604800*1),
    [4] = 86400,
    [5] = 60
}

vipPackagePremCarGive= {
    [1] = false,
    [2] = false,
    [3] = false,
    [4] = true,
    [5] = true
}

vipPackagePremCarGiveTime= {
    [1] = 0,
    [2] = 0,
    [3] = 0,
    [4] = 604800,
    [5] = 604800/2
}

ziviTimeReduction= {
    [0] = 0,
    [1] = 0,
    [2] = 2,
    [3] = 5,
    [4] = 7,
    [5] = 10
}

vipPayDayExtra= {
    [0] = 0,
    [1] = 50,
    [2] = 100,
    [3] = 150,
    [4] = 200,
    [5] = 300
}





changeCarLockedIDs= {[432] = true,[476] = true,[447] = true,[464] = true, [425] = true}


local rt = getRealTime ()
local timesamp = rt.timestamp


function checkPremium ( player )
    local PremiumData = vnxGetElementData ( player, "PremiumData" )
    local paket = vnxGetElementData ( player, "Paket" )
    local pname = getPlayerName(player)
    if PremiumData ~= 0 then
        if PremiumData > timesamp then
            if paket > 0  then
                outputChatBox ( "Premium: Aktiv. Bis zum "..getData (PremiumData), player, 0, 125, 0,true )
                giveAchievement( player, 9 )
                outputChatBox ( "Paket: "..vipPackageName[paket], player, 0, 125, 0,true )
                vnxSetElementData ( player, "premium", true )
                vnxSetElementData ( player, "maxcars", 15 )
            else
                outputChatBox("Premium-Status: Paket nicht gefunden, bitte Projektleiter kontaktieren.", player, 125, 0, 0)
                vnxSetElementData ( player, "premium", false )
            end
        else
            outputChatBox("Premium-Status: Abgelaufen.", player, 125, 0, 0)
            dbExec ( handler, "UPDATE ?? SET ??=?, ??=? WHERE ??=?", "userdata", "PremiumPaket", 0, "PremiumData", 0,  "UID", playerUID[pname] )
            vnxSetElementData ( player, "PremiumData", 0 )
            vnxSetElementData ( player, "Paket", 0 )
            vnxSetElementData ( player, "premium", false )
            vnxSetElementData ( player, "maxcars", 5 )
        end
    else
        outputChatBox("Premium-Status: Nicht Aktiv.", player, 125, 0, 0)
        dbExec ( handler, "UPDATE ?? SET ??=?, ??=? WHERE ??=?", "userdata", "PremiumPaket", 0, "PremiumData", 0,  "UID", playerUID[pname] )
        vnxSetElementData ( player, "PremiumData", 0 )
        vnxSetElementData ( player, "Paket", 0 )
        vnxSetElementData ( player, "premium", false )
        vnxSetElementData ( player, "maxcars", 5 )
    end
end

function showPremiumFunctions (player)
    if vnxGetElementData ( player, "premium" ) == true then
        local paket = vnxGetElementData ( player, "Paket" )
        --outputChatBox("/status - Ändert deinen Status - Alle "..math.floor(vipPackageSocialTime[paket]/86400).." Tag(e) möglich.", player, 0, 125, 0)
        --outputChatBox("/tele - Ändert deine Nummer - Alle "..math.floor(vipPackageTeleTime[paket]/86400).." Tag(e) möglich.", player, 0, 125, 0)
        --outputChatBox("/pcar - Setzt dir ein Premium Fahrzeug. (Verfügbar:  "..vnxGetElementData ( player, "PremiumCars")..")", player, 0, 125, 0)
        outputChatBox("Sonstige Features:", player, 0, 125, 0)
        --if vipPackagePremCarGive[paket] == true then
            --outputChatBox("Alle "..math.floor(vipPackagePremCarGiveTime[paket]/86400).."  Tag(e) ein gratis Premium Fahrzeug.", player, 0, 125, 0)
        --end
        if vipPayDayExtra[paket] > 0 then
            outputChatBox(vipPayDayExtra[paket].."% mehr unversteurte Einnahmen beim Payday.", player, 0, 125, 0)
        end
        if ziviTimeReduction[paket] > 0 then
            outputChatBox(ziviTimeReduction[paket].."% weniger Zivilzeit.", player, 0, 125, 0)
        end
    else
        triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist\nnicht befugt!", 7500, 125, 0, 0 )
    end
end
addCommandHandler("phelp", showPremiumFunctions )


function setPremiumData (player, tage,package)
    local pname = getPlayerName(player)
    local PremiumData = tonumber(vnxGetElementData ( player, "PremiumData" ))
    local rt = getRealTime ()
    local timesamp = rt.timestamp
    vnxSetElementData ( player, "Paket", tonumber(package) )
    vnxSetElementData ( player, "PremiumData", timesamp+86400*tage )
    dbExec ( handler, "UPDATE ?? SET ??=?, ??=? WHERE ??=?", "userdata", "PremiumPaket", package, "PremiumData", timesamp+86400*tage,  "UID", playerUID[pname] )
    checkPremium ( player )
end





function changeSocial ( player, cmd , ... )
    local paket = tonumber(vnxGetElementData ( player, "Paket" ))
    local parametersTable = {...}
    local rt = table.concat( parametersTable, " " )
    local words = string.len(rt)
    if vnxGetElementData ( player, "premium" ) == true then
        if vnxGetElementData ( player, "lastSocialChange") < timesamp then
            if words >= 1 then
                if words <= 16 then
                    vnxSetElementData ( player, "socialState", rt )
                    outputChatBox ( "Status zu "..rt.." geändert.", player, 0, 125, 0 )
                    vnxSetElementData ( player, "lastSocialChange", timesamp + (vipPackageSocialTime[paket]) )
                    outputChatBox ( "Du kannst deinen Status am "..getData(timesamp + (vipPackageSocialTime[paket])).." wieder ändern.", player, 0, 125, 0 )
                else
                    outputChatBox("Zuviele Zeichen, es sind maximal 16 erlaubt. (Leerzeichen zählen mit)", player, 255, 155, 0 )
                end
            else
                outputChatBox("Zuwenig Zeichen, es ist minimal eins erlaubt. (Leerzeichen zählen mit)", player, 255, 155, 0 )

            end
        else
            outputChatBox ( "Du kannst deinen Status am "..getData(timesamp + (vipPackageSocialTime[paket])).." wieder ändern.", player, 0, 125, 0 )
        end
    else
        outputChatBox("Du bist kein Premium User." , player, 0, 200, 0 )
    end
end
addCommandHandler("status", changeSocial )



function changeNumber ( player, cmd, number )

    local paket = tonumber(vnxGetElementData ( player, "Paket" ))
    if vnxGetElementData ( player, "premium" ) == true then
        if vnxGetElementData ( player, "lastNumberChange") < timesamp then
            if tonumber(number) then
                if tonumber(number) >= 100 then
                    if tonumber(number) <= 9999999 then
                        if tonumber ( number ) ~= 911 and tonumber ( number ) ~= 333 and tonumber ( number ) ~= 400 and tonumber (number ) ~= 666666 then
                            if not dbExist ( "userdata", "Telefonnr LIKE '"..number.."'") then
                                dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "Telefonnr", number, "UID", playerUID[getPlayerName(player)] )
                                vnxSetElementData ( player, "telenr", number )
                                outputChatBox ( "Nummer zu "..number.." geändert.", player, 0, 125, 0 )
                                vnxSetElementData ( player, "lastNumberChange", timesamp + (vipPackageTeleTime[paket]) )
                                outputChatBox ( "Du kannst deine Nummer am "..getData(timesamp + (vipPackageTeleTime[paket])).." wieder ändern.", player, 0, 125, 0 )
                            else
                                outputChatBox("Ungültige Nummer." , player, 255, 155, 0 )
                            end
                        else
                            outputChatBox("Diese Nummer gibt es bereits." , player, 255, 155, 0 )
                        end
                    else
                        outputChatBox("Deine Nummer ist zu groß." , player, 255, 155, 0 )
                    end
                else
                    outputChatBox("Deine Nummer muss über 99 sein." , player, 255, 155, 0 )
                end

            else
                outputChatBox("/tele [deine gewünschte Nummer]" , player, 255, 155, 0 )
            end
        else
            outputChatBox ( "Du kannst deine Nummer am "..getData(timesamp + (vipPackageTeleTime[paket])).." wieder ändern.", player, 255, 155, 0 )
        end
    else
        outputChatBox("Du bist kein Premium User." , player, 255, 155, 0 )
    end
end
--addCommandHandler("tele", changeNumber )



function changeCar ( player, cmd, slot, id)
    local pname = getPlayerName(player)
    if vnxGetElementData ( player, "PremiumCars" ) >= 1 then
        if not changeCarLockedIDs[id] then
            if getVehicleNameFromModel(id) then
                local result = dbPoll ( dbQuery ( handler, "SELECT  ?? FROM ?? WHERE ??=? AND ??=?? ", "Typ", "vehicles", "Slot", slot, "UID", playerUID[pname] ), -1 )
                if result and result[1] then
                    dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=? AND ??=??", "vehicles", "Typ", id, "Slot", slot, "UID", playerUID[pname] )
                    outputChatBox ( "Slot "..slot.." zum ID: "..id.." geändert.", player, 0, 125, 0 )
                    vnxSetElementData ( player, "PremiumCars", vnxGetElementData ( player, "PremiumCars" ) - 1 )
                    if id == 520 then
                        outputChatBox ( "Das schießen der Hydra sorgt für das entziehen der Premium Rechte!", player, 0, 125, 0 )
                    end
                else
                    outputChatBox("Du besitzt kein Fahrzeug in diesem Slot." , player, 255, 155, 0 )
                end
            else
                outputChatBox("Ungültiges Fahrzeug." , player, 255, 155, 0 )
            end
        else
            outputChatBox("Du darfst dir kein "..getVehicleNameFromModel(id).." geben." , player, 255, 155, 0 )
        end
    else
        outputChatBox("Du kannst momentan keine Premium Fahrzeuge setzen." , player, 255, 155, 0 )
    end
end
--addCommandHandler("pcar", changeCar )



function giveFreePremiumCar ( player )
    local paket = tonumber(vnxGetElementData ( player, "Paket" ))
    if vnxGetElementData ( player, "premium" ) == true then
        if vipPackagePremCarGive[paket] == true then
            if vnxGetElementData ( player, "lastPremCarGive" ) < timesamp then
                vnxSetElementData ( player, "PremiumCars", vnxGetElementData ( player, "PremiumCars" ) + 1 )
                vnxSetElementData ( player, "lastPremCarGive", timesamp + (vipPackagePremCarGiveTime[paket]) )
                outputChatBox ( "Aufgrund deines Premium Paketes hast du ein gratis Premium Fahrzeug erhalten.", player, 0, 125, 0 )
                outputChatBox ( "Das nächste Premium Fahrzeug bekommst du, wenn dein Premium aktiv ist, am ", player, 0, 125, 0 )
                outputChatBox ( getData(timesamp + (vipPackagePremCarGiveTime[paket])), player, 0, 125, 0 )
            else
            --    outputChatBox ( "Das nächste Premium Fahrzeug bekommst du, wenn dein Premium aktiv ist, am ", player, 0, 125, 0 )
            --	outputChatBox ( getData(timesamp + (vipPackagePremCarGiveTime[paket])), player, 0, 125, 0 )
            end
        end
    end
end

function buystatus (player,cmd,...)
    local money = tonumber(vnxGetElementData(player, "bankmoney"))
    local statusx = {...}
    local status = table.concat( statusx, " " )
    local words = string.len(status)
    local wordsmoney = words*10000
    local realmoney = wordsmoney+50000

    if words >= 1 then
        if words <= 21 then
            if tonumber(money) >= realmoney then
                if vnxGetElementData ( player, "premium" ) == true then
                    realmoney = realmoney/2
                    outputChatBox("Du hast aufgrund deine Premium Status deinen Status zum halben Preis bekommen.", player, 255, 155, 0 )
                end
                vnxSetElementData ( player, "socialState", status )
                vnxSetElementData ( player, "bankmoney", vnxGetElementData ( player, "bankmoney" ) - realmoney )
                outputChatBox ( "Der Satus "..status.." wurde erfolgreich für "..realmoney.."$ gekauft!", player, 0, 125, 0 )
            else
                outputChatBox("Du hast nicht genug Geld! Du brauchst "..realmoney.."$ auf der Bank!", player, 255, 155, 0 )
            end
        else
            outputChatBox("Zuviele Zeichen, es sind maximal 16 erlaubt. (Leerzeichen zählen mit)", player, 255, 155, 0 )
        end
    else
        outputChatBox("Zuwenig Zeichen, es ist minimal eins erlaubt. (Leerzeichen zählen mit)", player, 255, 155, 0 )
    end
end
addCommandHandler("buystatus" , buystatus )




function trigger_promocode(player, code)
    if getElementData(player, "promocode") == 0 then 
        local PremiumData = tonumber(vnxGetElementData ( player, "PremiumData" ))
        local PremiumMomentan = getData (PremiumData)
        local premiumadd = timesamp+86400*3
        outputDebugString(PremiumData)
        outputDebugString(PremiumMomentan)
        outputDebugString(premiumadd)
        if code == "VnX2017" then 
            setPremiumData (player, 14,3)
            --vnxSetElementData ( player, "socialState", "1" )
            setElementData(player, "promocode", "1")
            dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "promocode", "1", "UID", playerUID[name] )
            outputDebugString(PremiumMomentan)
        elseif code == "DennisPlayTennis" and getElementData(player, "promocode2") == 0 then
            setElementData(player, "promocode2", "1") 
            dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "promocode2", "1", "UID", playerUID[name] )
            giveAchievement( player, 18 )
            vnxSetElementData ( player, "socialState", "TennisLikeDennis" )  
        elseif code == "TimPetaaa" and getElementData(player, "promocode3") == 0 then 
            setElementData(player, "promocode3", "1") 
            dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "promocode3", "1", "UID", playerUID[name] )
            giveAchievement( player, 19 )
        elseif code == "LKWFahrer" and getElementData(player, "promocode4") == 0 then 
            setElementData(player, "promocode4", "1") 
            dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "promocode4", "1", "UID", playerUID[name] )
            outputChatBox("[Promotion Code] : Du hast 14.000 $ Bekommen :)", player, 0,255,0)
            vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 14000 ) 
        elseif code == "Layesd_tv" and getElementData(player, "promocode5") == 0 then  
            setElementData(player, "promocode5", "1") 
            dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "promocode5", "1", "UID", playerUID[name] )
            giveAchievement( player, 17 )
        elseif code == "Solid_Snake" and getElementData(player, "promocode6") == 0 then 
            setElementData(player, "promocode6", "1") 
            dbExec ( handler, "UPDATE ?? SET ?? = ? WHERE ??=?", "userdata", "promocode6", "1", "UID", playerUID[name] )
            outputChatBox("Du hast einen Free VIP Faggio eingelöst. Bitte melde dich per Forum Nachricht bei Solid_Snake.", player , 0,255,0)
            outputChatBox("Außerdem hast du nun einen neuen Sozialen Status : i ❤ Venox", player , 0,255,0)
            vnxSetElementData ( player, "socialState", "i ❤ Venox" )      
        else 
            outputChatBox("Der Eingegebene Code ist ungültig." , player, 125, 0, 0 )
            
        end 
    else 
        outputChatBox("Du hast schon einen Promotion Code eingelöst." , player, 0, 105, 145 )
        outputDebugString(getElementData(player, "promocode"))
    end
end 
addEvent("promotioncodevalid", true)
addEventHandler("promotioncodevalid", getRootElement(), trigger_promocode)
