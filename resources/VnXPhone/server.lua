
local GARAGE_ID = 22

function opengarage()
    if (not isGarageOpen(GARAGE_ID)) then
        -- open the door
        setGarageOpen(GARAGE_ID, true)
    else setGarageOpen(GARAGE_ID, false) end
end 
addCommandHandler("garage", opengarage)


addEvent ( "vnx_musik_triggern_lautstaerke", true ) 
addEventHandler ( "vnx_musik_triggern_lautstaerke", root, function ( to )
	triggerClientEvent ( root, "vnx_change_stream_lautstärke", client, to )
end )
