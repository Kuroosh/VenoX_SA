-- Handy.lua --
-- by TheOne --
--[[
rotboot = 0
bootText = "Booting.."
phone = 0
phoneshow = false
booted = false
local sx, sy=guiGetScreenSize()
local spx, spy= 1920, 1080
local px, py= (sx/spx) , (sy/spy)

local _dxDrawLine = dxDrawLine
local function dxDrawLine ( ... )
    local array = { ... }
    array[1] = array[1]*px
    array[2] = array[2]*py
    array[3] = array[3]*px
    array[4] = array[4]*py
    array[6] = array[6]*py
    return _dxDrawLine ( unpack ( array ) )
end

local _dxDrawRectangle = dxDrawRectangle
local function dxDrawRectangle ( ... )
    local array = { ... }
    array[1] = array[1]*px
    array[2] = array[2]*py
    array[3] = array[3]*px
    array[4] = array[4]*py
    return _dxDrawRectangle ( unpack ( array ) )
end

local _dxDrawText = dxDrawText
local function dxDrawText ( ... )
    local array = { ... }
    array[2] = array[2]*px
    array[3] = array[3]*py
    array[4] = array[4]*px
    array[5] = array[5]*py
    array[7] = array[7]*py
    return _dxDrawText ( unpack ( array ) )
end

local _dxDrawImage = dxDrawImage
local function dxDrawImage ( ... )
    local array = { ... }
    array[1] = array[1]*px
    array[2] = array[2]*py
    array[3] = array[3]*px
    array[4] = array[4]*py
    return _dxDrawImage ( unpack ( array ) )
end

addEvent("VnxSetPhoneState", true)
addEventHandler("VnxSetPhoneState", getLocalPlayer(), function(phonevalue)
	if phone then
		phone = phonevalue
	end
end)
function playerPressedKey ( button, press ) 
    if ( button == "lalt" ) then 
        setElementData ( localPlayer, "lalt", press and true or false ); 
    end 
    if ( button == "o" and press ) then 
        local pressed = getElementData ( localPlayer, "lalt" ); 
        if ( pressed ) then 
        		if phoneshow == false then
        			if booted == false then
            			addEventHandler("onClientRender", root, phonemain)
            			addEventHandler("onClientRender", root, bootsequence)
            			phoneshow = true
            			showCursor(true)
            				rottimer = setTimer(function()
            					if  rotboot < 360 then
            						rotboot = rotboot+15
            					else 
            						rotboot = 0
            					end 
            				end, 100,0)
            				bootingtimer = setTimer(function()
            					if phoneshow == true then
            						booted = true
            						killTimer(bootingtimer)
            						removeEventHandler("onClientRender", root, bootsequence)
            						addEventHandler("onClientRender", root, mainlay)
            						killTimer(rottimer)
            						rotboot = 0
            					end
            				end, 10000, 1)
            		else
            			addEventHandler("onClientRender",root,phonemain)
            			addEventHandler("onClientRender",root,mainlay)	
            			phoneshow = true
            		end
            	else
            		if booted == false then
            			removeEventHandler("onClientRender",root,bootsequence)
            			removeEventHandler("onClientRender",root,phonemain)
            			phoneshow = false
            			killTimer(bootingtimer)
            			showCursor(false)
            			killTimer(rottimer)
            			rotboot = 0
            		else
            			removeEventHandler("onClientRender",root,phonemain)
            			removeEventHandler("onClientRender",root,mainlay)
            			phoneshow = false
            			showCursor(false)
            		end
            	end
        end 
    end 
end 
addEventHandler ( "onClientKey", root, playerPressedKey ); 
function phonemain()
        dxDrawImage(1586, 389, 302, 532, ":VenoX/handy/files/handy.png", 0, 0, 0, tocolor(0, 0, 0, 255), false)
end

function bootsequence()
        dxDrawImage(1654, 562, 172, 163, ":VenoX/handy/files/load.png", rotboot, 0, 0, tocolor(0, 143, 219, 255), false)
        dxDrawImage(1687, 611, 98, 93, ":VenoX/anzeigen/register/trailerstuff/2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
end

function mainlay()

end]]