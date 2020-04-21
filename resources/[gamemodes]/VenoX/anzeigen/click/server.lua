 
local animationlaeuftfortnite = false 
local FortniteDanceTimer = nil 
function stopfortnitedance(Player)
    if getElementData(Player, "amtanzen") == true then 
        if getElementData ( Player, "tazered") == false then
            setPedAnimation(Player)
            triggerClientEvent (Player, "Animhide", Player)
            setElementData(Player, "amtanzen", false)
            setElementData(Player, "tanzanfragebekommen", false)
            setElementData(Player, "tanzanfragegesendet", false)
        end 
    end 
end 

function setPedFortniteAnimation (ped,animation,tiempo,repetir,mover,interrumpible)
    if (type(animation) ~= "string" or type(tiempo) ~= "number" or type(repetir) ~= "boolean" or type(mover) ~= "boolean" or type(interrumpible) ~= "boolean") then return false end
    if isElement(ped) then
    if animation == "baile 1" or animation == "baile 2" or animation == "baile 3" or animation == "baile 4" or animation == "baile 5" or animation == "baile 6" or animation == "baile 7" or animation == "baile 8" or animation == "baile 9" or animation == "baile 10" or animation == "baile 11" or animation == "baile 12" or animation == "baile 13" then
    for i = 1,3 do
    triggerClientEvent ( root, "setPedFortniteAnimation", root, ped,animation,tiempo,repetir,mover,interrumpible )
    bindKey ( ped, "space", "down", stopfortnitedance )
    if tiempo > 1 then
    setTimer(setPedAnimation,tiempo,1,ped,false)
    setTimer(setPedAnimation,tiempo+100,1,ped,false)
    end
    end
    end
    end
     
    end
    function howtouse ( player, command, fortnitedanceid )
        if isElement(player) then
            if getElementData(player, "tanzanfragebekommen") == true or not getElementData(player, "tanzanfragegesendet") == false then 
                setPedFortniteAnimation(player,"baile "..fortnitedanceid.."",-1,true,false,false,false)
                triggerClientEvent ( "Animshow", player, "Fortnite Tanz "..fortnitedanceid)
                setElementData(player, "amtanzen", true)
                if isTimer ( FortniteDanceTimer ) then
                    killTimer ( FortniteDanceTimer )
                end
            else 
                if getElementData(player, "Paket") <= 3 then 
                    outputChatBox ( "#00C8FF[#FFFFFF Fortnite Dance #00C8FF] : #FFFFFF Du hast kein VIP Platin!", player,  255, 255, 255 ,true)
                    if isTimer ( FortniteDanceTimer ) then
                        killTimer ( FortniteDanceTimer )
                    end
                else
                    if isTimer ( FortniteDanceTimer ) then
                        killTimer ( FortniteDanceTimer )
                    end
                    setPedFortniteAnimation(player,"baile "..fortnitedanceid.."",-1,true,false,false,false)
                    triggerClientEvent ( "Animshow", player, "Fortnite Tanz "..fortnitedanceid)
                    setElementData(player, "amtanzen", true)
                end 
            end 
        end
    end
    addCommandHandler ( "fortnitedance", howtouse )



    function acceptdancefortnite(player, cmd, target)
        if target == "" or target == " " or target == nil then 
            outputChatBox("Ungueltiger Spieler", player, 125,0,0)
        else 
            if getElementData(player, "tanzanfragebekommen") == true then 
                if getElementData(getPlayerFromName(target), "tanzanfragegesendet") == getPlayerName(player) then 
                    local x1, y1, z1 = getElementPosition ( player )
                    local x2, y2, z2 = getElementPosition ( getPlayerFromName(target) )
                    if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 4 then
                        local tanzid = getElementData(player, "fortnitetanzID")
                        executeCommandHandler("fortnitedance", player, tanzid)
                        executeCommandHandler("fortnitedance", getPlayerFromName(target), tanzid)
                        setElementData(player, "amtanzen", true)
                        setElementData(getPlayerFromName(target), "amtanzen",true)
                        setElementData(player, "tanzanfragebekommen", false)
                        setElementData(player, "tanzanfragegesendet", false)
                        triggerClientEvent ( "Animshow", player, "Fortnite Tanz "..tanzid)
                        triggerClientEvent ( "Animshow", getPlayerFromName(target), "Fortnite Tanz "..tanzid)
                        bindKey ( player, "space", "down", stopfortnitedance )
                        bindKey ( getPlayerFromName(target), "space", "down", stopfortnitedance )
                    else 
                        outputChatBox("Du bist zu weit von "..target.." entfernt.", player, 125, 0,0)
                    end 
                else 
                    outputChatBox("Der Spieler hat dir keine Tanz-Anfrage gesendet.", player, 125,0,0)
                end 
            else 
                outputChatBox("Du hast keine Tanz-Anfrage bekommen.", player, 125, 0,0)
            end 
        end
    end 
    addCommandHandler("acceptdance", acceptdancefortnite)
    function senduseranfragedance(player , target, id)
        if getElementData(player, "tanzanfragegesendet") == false then 
            if getElementData(getPlayerFromName(target), "tanzanfragebekommen") == false then  
                local x1, y1, z1 = getElementPosition ( player )
				local x2, y2, z2 = getElementPosition ( getPlayerFromName(target) )
				if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 4 then
                    setElementData(getPlayerFromName(target), "tanzanfragebekommen", true)
                    setElementData(getPlayerFromName(target), "fortnitetanzID", id)
                    setElementData(player, "tanzanfragegesendet", target)
                    outputChatBox(getPlayerName(player).." möchte mit dir Fortnite Tanz"..id.." Tanzen.", getPlayerFromName(target), 0, 125, 0)
                    outputChatBox("tippe /acceptdance "..getPlayerName(player).." um mit "..getPlayerName(player).." zu Tanzen.", getPlayerFromName(target), 0, 125, 0)
                    outputChatBox("Du hast "..target.." zu einem Tanz aufgefordert.", player, 0, 125, 0)
                    FortniteDanceTimer = setTimer ( function() 
                        setElementData(getPlayerFromName(target), "tanzanfragebekommen", false)
                        setElementData(player, "tanzanfragegesendet", false)
                        outputChatBox("[Tanz-Anfrage] : Keine Antwort von "..target.. "...", player, 125, 0, 0)
                    end, 1*60*1000, 1 )
                else 
                    outputChatBox("Du bist zu weit von "..target.." entfernt.", player, 125,0,0)
                end 
            else 
                outputChatBox("Der Spieler hat bereits eine Anfrage bekommen.", player, 125, 0,0)
            end 
        else 
            outputChatBox("Du hast bereits "..getElementData(player, "tanzanfragegesendet").." eine Tanz-Anfrage geschickt", player, 125, 0,0)
            if isTimer ( FortniteDanceTimer ) then
                local timeleft = getTimerDetails ( FortniteDanceTimer )
                outputChatBox ( "Bitte habe etwas Geduld ... "..math.floor(timeleft/1000/60*100)/100 .." Sekunden!", player, 155, 0, 0 )
            end
        end 
    end 
    addEvent("offerdancefortnite", true)
    addEventHandler("offerdancefortnite", getRootElement(),senduseranfragedance)



