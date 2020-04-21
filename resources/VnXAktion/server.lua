

local pizzaArray = {}
local pizzaMarkerPositions = {
	{ ["x"] = -2010.5478515625, ["y"] = 897.3701171875, ["z"] = 44.896362304688 },
    { ["x"] = -2010.9794921875, ["y"] = 832.134765625, ["z"] = 44.894355773926 },
    { ["x"] = -2010.818359375, ["y"] = 748.0732421875, ["z"] = 44.887725830078 },
    { ["x"] = -2094.0205078125, ["y"] = 735.4794921875, ["z"] = 69.013107299805 },
    { ["x"] = -2135.2724609375, ["y"] = 773.7724609375, ["z"] = 69.012153625488 },
    ----------------------- nächsten 5 
	{ ["x"] = -2135.1943359375, ["y"] = 832.9619140625, ["z"] = 69.003326416016 },
    { ["x"] = -2135.5908203125, ["y"] = 895.1376953125, ["z"] = 79.444038391113 },
    { ["x"] = -2174.6103515625, ["y"] = 922.705078125, ["z"] = 79.450119018555 },
    { ["x"] = -2248.962890625, ["y"] = 943.90625, ["z"] = 66.09741973877 },
    { ["x"] = -2294.6845703125, ["y"] = 962.1767578125, ["z"] = 64.612503051758 },
    ----------------------- nächsten 5 
	{ ["x"] = -2393.2978515625, ["y"] = 930.7548828125, ["z"] = 44.89444732666 },
    { ["x"] = -2502.8720703125, ["y"] = 912.3583984375, ["z"] = 64.342437744141 },
    { ["x"] = -2581.0927734375, ["y"] = 912.2509765625, ["z"] = 64.425201416016 },
    { ["x"] = -2610.8330078125, ["y"] = 831.0615234375, ["z"] = 49.427513122559 },
    { ["x"] = -2671.380859375, ["y"] = 830.1591796875, ["z"] = 49.581844329834 },
    ----------------------- nächsten 5 
    { ["x"] = -2712.837890625, ["y"] = 829.8974609375, ["z"] = 49.583473205566 },
    { ["x"] = -2737.0791015625, ["y"] = 816.0810546875, ["z"] = 52.662265777588 },
    { ["x"] = -2661.7734375, ["y"] = 896.1201171875, ["z"] = 79.15544128418 },
    { ["x"] = -2573.177734375, ["y"] = 904.0185546875, ["z"] = 64.427909851074 },
    { ["x"] = -2502.8125, ["y"] = 904.125, ["z"] = 64.345169067383 },
    ----------------------- nächsten 5 
	{ ["x"] = -2413.138671875, ["y"] = 904.3193359375, ["z"] = 45.040370941162 },
    { ["x"] = -2380.30078125, ["y"] = 942.8359375, ["z"] = 44.896511077881 },
    { ["x"] = -2272.5107421875, ["y"] = 916.49609375, ["z"] = 66.091445922852 },
    { ["x"] = -2272.521484375, ["y"] = 787.9404296875, ["z"] = 48.894493103027 },
    { ["x"] = -2272.7109375, ["y"] = 645.669921875, ["z"] = 48.89510345459 }, 
    ----------------------- nächsten 5 
	{ ["x"] = -2356.9384765625, ["y"] = 572.30078125, ["z"] = 24.36025428772 },
    { ["x"] = -2504.5224609375, ["y"] = 451.486328125, ["z"] = 27.326368331909 },
    { ["x"] = -2543.7255859375, ["y"] = 351.3828125, ["z"] = 19.399044036865 },
    { ["x"] = -2572.3955078125, ["y"] = 237.8984375, ["z"] = 9.0802841186523 },
    { ["x"] = -2710.1396484375, ["y"] = 127.451171875, ["z"] = 3.7772891521454 },
    ----------------------- nächsten 5 
	{ ["x"] = -2710.3369140625, ["y"] = 14.13671875, ["z"] = 3.7866203784943 },---------------
    { ["x"] = -2710.2177734375, ["y"] = -44.544921875, ["z"] = 3.7765033245087 },
    { ["x"] = -2709.9609375, ["y"] = -92.7880859375, ["z"] = 3.7868378162384 },
    { ["x"] = -2710.201171875, ["y"] = -127.8349609375, ["z"] = 3.7774219512939 },
    { ["x"] = -2710.1123046875, ["y"] = -191.23046875, ["z"] = 3.7793416976929 },
    ----------------------- nächsten 5 
	{ ["x"] = -2288.4267578125, ["y"] = -74.5322265625, ["z"] =34.761501312256 },
    { ["x"] = -2184.0322265625, ["y"] = -74.5185546875, ["z"] = 34.768619537354 },
    { ["x"] = -2083.20703125, ["y"] = -2.0595703125, ["z"] =  34.769119262695 },
    { ["x"] = -2103.3642578125, ["y"] = 84.1728515625, ["z"] = 34.762283325195 },
    { ["x"] = -2095.12890625, ["y"] = 240.71875, ["z"] = 34.79891204834 },
    ----------------------- nächsten 5 
	{ ["x"] = -2039.5693359375, ["y"] = 290.0732421875, ["z"] = 34.798290252686 },
    { ["x"] = -2135.4306640625, ["y"] = 627.0771484375, ["z"] = 51.864707946777 },
    { ["x"] = -2135.470703125, ["y"] = 715.396484375, ["z"] = 69.011695861816 },
    { ["x"] = -1951.9033203125, ["y"] = 725.1103515625, ["z"] = 44.893474578857 },
    { ["x"] = -1605.1455078125, ["y"] = 725.216796875, ["z"] = 11.355248451233 },
    ----------------------- nächsten 2 
    { ["x"] = -1522.4609375, ["y"] = 920.451171875, ["z"] = 6.7969584465027 },
    { ["x"] = -1669.5302734375, ["y"] = 937.392578125, ["z"] = 24.3414478302 }
}
local pizzaMarkerArray = {}
local pizzaBlipArray = {}
local pizzaMarkerNumberArray = {}
local pizzajoblefttimer = nil
local ladezone = createMarker ( -1718.7333984375 , 1017.9892578125 , 17.185079574585, "corona", 3, 0, 150, 200, 100, player )
local ladezoneblip = createBlip ( -1769.18359375 , 982.900390625 , 22.990139007568, 51, 2, 255, 0, 0, 255, 0, 99999, player )
setElementVisibleTo(ladezone, getRootElement(), false)
setElementVisibleTo(ladezoneblip, getRootElement(), false)
function givefahrzeugpizzen_vnx(hitElement, dim)
    if getElementType ( hitElement ) == "vehicle" and dim then
        local player = getVehicleOccupant ( hitElement )
        if getElementModel ( hitElement ) == 448 then
            if getElementData(hitElement, "pizzaimfahrzeug") == 50 then 
                outputChatBox("Dein Fahrzeug wurde erst beladen...", player,  0, 125, 0)
            else 
                setElementData(hitElement, "pizzaimfahrzeug", 50)
                outputChatBox("Du hast dein Fahrzeug nun neu beladen mit 25 Weitere Pizzen.\nFahr nun zur nächsten Lieferung [ Rote Flagge auf der Karte ].", player, 0,255,0)
                if getElementData(player,"pizzajobaktiv") == false then 
                    pizzaMarkerNumberArray[player] = 0
                    createpizzamarker( player )
                    outputDebugString(getElementData(player,"pizzajobaktiv"))
                    setElementData(player, "pizzajobaktiv", true)
                end
            end 
        else 
            outputChatBox("Du bist nicht in einem Lieferwagen!", player, 0,125,0)
        end
    end
end 


function pizzaJobVehicleEnter(vehicle)
    if getElementModel(vehicle) == 448 then 
        if getElementData(vehicle, "pizzajobfahrzeugbesitzer") == getPlayerName(source) then 
            killTimer(pizzajoblefttimer)
            removeEventHandler("onPlayerVehicleEnter", getRootElement(), pizzaJobVehicleEnter )
            addEventHandler ( "onPlayerVehicleExit", getRootElement(), pizzaJobVehicleExit )
            triggerClientEvent(source, "PizzajobInsFahrzeug", source)
        else
            outputChatBox("Das ist nicht dein Job - Fahrzeug!", source, 0, 125, 0)
        end
    else 
        outputChatBox("Das ist nicht das Job - Fahrzeug!", source, 0, 125, 0)
    end
end
function pizzaJobVehicleExit(player)
    pizzajoblefttimer = setTimer (
        function ( player )
            removePedFromVehicle ( player )
            destroyElement(pizzajobfahrzeug_vnx)
            if isElement(ladezone) then
                removeEventHandler ( "onMarkerHit", ladezone, givefahrzeugpizzen_vnx ) 
            end
            if isElement(marker) then 
                removeEventHandler ( "onMarkerHit", marker, givepizzajobmoney ) 
            end
            removeEventHandler ( "onPlayerVehicleExit", getRootElement(), pizzaJobVehicleExit )
            removeEventHandler ( "onPlayerVehicleEnter", getRootElement(), pizzaJobVehicleEnter )
        end,
    10000, 1, player )
    setElementVisibleTo(ladezoneblip, source, false)
    setElementVisibleTo(ladezone, source, false) 
    destroyElement ( pizzaBlipArray[source] )
    triggerClientEvent(source, "PizzajobAusFahrzeug", source)
    addEventHandler ( "onPlayerVehicleEnter", getRootElement(), pizzaJobVehicleEnter )
    removeEventHandler ( "onPlayerVehicleExit", getRootElement(), pizzaJobVehicleExit )
end 



function pizzajob_start_func(player, jobinfo)
    if jobinfo == "pizzaboy" then 
        pizzajobfahrzeug_vnx = createVehicle(448, -1763.2705078125 , 952.3369140625 , 24.31861114502, 0, 0, 90, "PizzaJob")
        warpPedIntoVehicle(player, pizzajobfahrzeug_vnx)
        setElementData(pizzajobfahrzeug_vnx, "pizzaimfahrzeug", 0)
        setElementData(player, "pizzajobaktiv", false)
        setElementData(pizzajobfahrzeug_vnx, "pizzajobfahrzeugbesitzer", getPlayerName(player))
        setElementVisibleTo(ladezone, player, true)
        setElementVisibleTo(ladezoneblip, player, true)
        addEventHandler ( "onMarkerHit", ladezone, givefahrzeugpizzen_vnx )
        addEventHandler ( "onPlayerVehicleExit", getRootElement(), pizzaJobVehicleExit )
    else 
        --outputChatBox("ungueltiger Job !! Du huso")
    end 
end 
addEvent("job_start_pizzaboy_vnx", true)
addEventHandler("job_start_pizzaboy_vnx", getRootElement(), pizzajob_start_func)


function createpizzamarker( player )
    local number = pizzaMarkerNumberArray[player] + 1
    if number > #pizzaMarkerPositions then
        outputChatBox ( "Du hast eine Runde gedreht und bekommst dafür 750$", player, 0, 220, 0 )
        number = 1
    end
    pizzaMarkerNumberArray[player] = number
    local marker = createMarker ( pizzaMarkerPositions[number]["x"], pizzaMarkerPositions[number]["y"], pizzaMarkerPositions[number]["z"], "checkpoint", 3, 0, 150, 200, 100, player )
    addEventHandler ( "onMarkerHit", marker, givepizzajobmoney )
    pizzaMarkerArray[player] = marker
    pizzaBlipArray[player] = createBlip ( pizzaMarkerPositions[number]["x"], pizzaMarkerPositions[number]["y"], pizzaMarkerPositions[number]["z"], 19, 2, 255, 0, 0, 255, 0, 99999, player )
end 


function givepizzajobmoney( hitElement, dim)
    if getElementType ( hitElement ) == "vehicle" and dim then
        local player = getVehicleOccupant ( hitElement )
        if source == pizzaMarkerArray[player] then
            if getElementModel ( hitElement ) == 448 then
                if getElementData(hitElement, "pizzaimfahrzeug") == 0 then 
                    outputChatBox("Wo bleibt die Pizza ?! Du musst neue Pizzen in der Garage aufladen.", player, 125, 0, 0)
                else 
                    destroyElement ( source )
                    destroyElement ( pizzaBlipArray[player] )
                    setElementData(hitElement, "pizzaimfahrzeug", getElementData(hitElement, "pizzaimfahrzeug")  - 1)
                    setTimer ( function ( veh, player )
                        if isElement ( veh ) and isElement ( player ) then
                            createpizzamarker ( player )
                        end
                    end, 500, 1, hitElement, player )
                end
            else 
                --outputChatBox("LargePeach ist in dem Marker gefahren der PIC")
            end
        end
    end
end 
addEvent("givepizzamoney_faggio", true)
addEventHandler("givepizzamoney_faggio", getRootElement(), givepizzajobmoney)