
local sx, sy=guiGetScreenSize()
local spx, spy= 1366, 768
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


local pl = {}
local scroll = 0
local updateTimer 
local player = getLocalPlayer()
local alpha = 0
local maxplayers = 40
local factionCounter = {}
factionCounter[0] = 0
factionCounter[1] = 0
factionCounter[2] = 0
factionCounter[3] = 0
factionCounter[4] = 0
factionCounter[5] = 0
factionCounter[6] = 0
factionCounter[7] = 0
factionCounter[8] = 0
factionCounter[9] = 0
factionCounter[10] = 0
factionCounter[11] = 0
factionCounter[12] = 0
factionCounter[13] = 0
factionCounter[14] = 0
factionCounter[15] = 0


local fraktionNames = {[-1]="-", [0]="Bürger", [1]="S.F.P.D.", [2]="Brotherhood", [3]="Triaden", [4]="Terroristen", [5]="San News", [6]="F.B.I.", [7]="Los Aztecas", [8]="U.S. ARMY", [9]= "Angels of Death", [10]="Medic", [11]="Mechaniker", [12]="Rollin Height´s", [13]="Compton Family´s", [14]="Italian Mafia" , [15]="S.A.F.D." }
	
function getFraktionMembersOnline(fraktionid)
	local online = 0
	for _, p in pairs(getElementsByType("player")) do 
		if getElementData(p, "fraktion") == fraktionid then
			online = online + 1
		end
	end
	return online
end

bindKey("tab","down",function()
    if(getElementData(localPlayer, "loggedin") == 1 and getElementData(localPlayer, "isInTut") == false ) then
        if getElementData(localPlayer, "selfopen")  == 0 then
            addEventHandler("onClientRender", root, drawScoreboard)
            updateScoreboard()
            if isTimer(updateTimer) then killTimer(updateTimer) end
            updateTimer = setTimer(updateScoreboard,10000, 0)
            bindKey("mouse_wheel_down","down",scrollDown)
            bindKey("mouse_wheel_up","down",scrollUp)
            toggleControl("next_weapon",false)
            toggleControl("previous_weapon",false)
            toggleControl("fire",false)
            triggerEvent( "hidehudclient", getLocalPlayer())

            alpha = 0
        end
	end
end)

bindKey("tab","up",function()
    if getElementData(localPlayer, "selfopen")  == 0 then
        unbindKey("mouse2", "down", cursorTab);
        unbindKey("mouse_wheel_down","down",scrollDown)
        unbindKey("mouse_wheel_up","down",scrollUp)
        removeEventHandler("onClientRender", root, drawScoreboard)
        toggleControl("next_weapon",true)
        toggleControl("previous_weapon",true)
        toggleControl("fire",true)
        alpha = 0
        if getElementData ( player, "loggedin" ) == 1 then
            if window_already_open == false then
                local vnxhud = tonumber(getElementData( getLocalPlayer(), "hud"))
                triggerEvent( "showhudclient", getLocalPlayer(), vnxhud)
                --outputDebugString( vnxhud.. " ist die nummer von "..getPlayerName( getLocalPlayer()) )
                setPlayerHudComponentVisible( "radar", true )
            end
            factionCounter[0] = 0
            factionCounter[1] = 0
            factionCounter[2] = 0
            factionCounter[3] = 0
            factionCounter[4] = 0
            factionCounter[5] = 0
            factionCounter[6] = 0
            factionCounter[7] = 0
            factionCounter[8] = 0
            factionCounter[9] = 0
            factionCounter[10] = 0
            factionCounter[11] = 0
            factionCounter[12] = 0
            factionCounter[13] = 0
            factionCounter[14] = 0
            factionCounter[15] = 0
        end
    end
end)

function scrollDown()
	if #getElementsByType("player") - scroll <= 2 then
		scroll = #getElementsByType("player")
	else
		scroll = scroll + 2
	end
end

function scrollUp()
	if scroll <= 2 then
		scroll = 0
	else
		scroll = scroll - 2
	end
end

	
function formString(text)
	if string.len(text) == 1 then
		text = "0"..text
	end
	return text
end

function isCursorOnElement(x,y,w,h)
	local mx,my = getCursorPosition ()
	local fullx,fully = guiGetScreenSize()
	cursorx,cursory = mx*fullx,my*fully
	if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
		return true
	else
		return false
	end
end

function updateScoreboard()
    factionCounter[0] = 0
    factionCounter[1] = 0
    factionCounter[2] = 0
    factionCounter[3] = 0
    factionCounter[4] = 0
    factionCounter[5] = 0
    factionCounter[6] = 0
    factionCounter[7] = 0
    factionCounter[8] = 0
    factionCounter[9] = 0
    factionCounter[10] = 0
    factionCounter[11] = 0
    factionCounter[12] = 0
    factionCounter[13] = 0
    factionCounter[14] = 0
    factionCounter[15] = 0
	pl = {}
	local i = 1
	for id, p in pairs(getElementsByType("player")) do
		local name = getPlayerName(p)
		local name1 = getPlayerName(p)
		name = string.gsub(name,"#%x%x%x%x%x%x","")
		local spielzeit = "-"
		local nr = "-"
		local ping = getPlayerPing(p)
		local color = {255,255,255}
		local fname = "-"
		local level = getElementData( p, "exp:lvl" )
		local frak = -1
		local status = "-"
		local r, g, b = 255, 255, 255
		local donator = "-"
		local telenr = "-"
        local level = "-"
        local vnxexp = "-"
	    local DonatorStatus = 0
        local paketvip = 0
        

		if getElementData(p,"loggedin") == 1 then
			nr = tostring(getElementData ( p, "telenr" ))
			local ptime = tonumber(getElementData(p,"playingtime")) 
			local hour = math.floor(ptime/60)
			local minute = ptime - hour*60
			spielzeit = formString(hour)..":"..formString(minute)
			local fac = tonumber(getElementData(p,"fraktion"))
			frak = fac
			local adminlvl = tonumber(getElementData(p, "adminlvl"));
			rang = tonumber(getElementData(p, "rang"));
			
			r, g, b = factionColors[fac][1], factionColors[fac][2], factionColors[fac][3]
			vip1, vip2, vip3 = 0, 121, 169
            status = getElementData(p, "socialState");
            vnxexp = tonumber(getElementData(p,"MainLevel"))
            factionCounter[frak] = factionCounter[frak] + 1
            DonatorStatus = getElementData ( p, "PremiumData" )
            paketvip = getElementData(p, "Paket")
        end
		
		--[[local image = dxDrawImage(pl[i].image, 409, 259+(15*di+1), 25, 25+(15*di+1), ":pr0/files/images/logo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		
        if getElementData(p, "adminlvl" ) then
        	if getElementData(p, "adminlvl") >= 3 then
            	name = image.."[VnX]"..name;
			end
		]]

		--[[if getElementData(p, "adminlvl" ) then
        	if getElementData(p, "adminlvl") >= 3 then
            	image = ":pr0/files/images/logo.png"
            else
            	image = "-"
			end
		end]]
        if vnxexp == nil then 
            vnxexp = "ERROR"
        end
        if factionCounter == nil then 
            factionCounter = "-"
        end

		if getElementData(p, "adminlvl" ) then
			if getElementData(p, "adminlvl") >= 1 then
				donator = "Aktiv"; 
			else
				donator = "-";
			end
        end
        --[[
        if PremiumData ~= 0 then
            if PremiumData > timesamp then
                hoehe = 32 
                breite = 32
                image = ":pr0/files/images/logo.png"
            else 
                hoehe = 0 
                breite = 0
                image = ":pr0/files/images/logo.png"
            end 
        end ]]
		
		pl[i] = {}
		pl[i].telnr = nr
		pl[i].name = name
		pl[i].image = image
		pl[i].lvl = level		
		pl[i].spielzeit = spielzeit
		pl[i].ping = ping
		pl[i].color = color
		pl[i].frak = frak
		pl[i].donator = donator;
		pl[i].ping = ping;
        pl[i].status = status
        pl[i].VnXEXP = vnxexp
        pl[i].paket = paketvip
        pl[i].donatorimage = DonatorStatus
		pl[i].r 	= r
		pl[i].g     = g 
		pl[i].b     = b
		i = i + 1
	end
	table.sort(pl, function(a,b)
       return a.frak < b.frak
    end)	
end

function getPingColor(ping)
	if (ping > 100) then
		return 150,150,150
	elseif (ping < 100) then
		return 20,200,20
	else
		return 200,20,20
	end
end

local rt = getRealTime ()
local timesamp = rt.timestamp
local vipPackageName= {
    [1] = "#cd7f32Bronze",
    [2] = "#C0C0C0Silber",
    [3] = "#DAA520Gold",
    [4] = "#e5e4e2Platin",
    [5] = "#0096FFTOP DONATOR"
}

local dxfont0_drugs = dxCreateFont(":VenoX/fonts/drugs.ttf", 10)
local dxfont0_arial = dxCreateFont(":pr0/files/fonts/arial.ttf", 10)
function drawScoreboard()
        dxDrawRectangle(1011, 528, 133, 3, tocolor(0, 150, 200, 255), false)
        dxDrawRectangle(1011, 364, 133, 3, tocolor(0, 150, 200, 255), false)
        dxDrawRectangle(1011, 292, 133, 3, tocolor(0, 150, 200, 255), false)
        dxDrawRectangle(1011, 216, 133, 338, tocolor(0, 0, 0, 173), false)
        dxDrawRectangle(363, 194, 638, 364, tocolor(0, 0, 0, 173), false)
        dxDrawRectangle(363, 194, 638, 22, tocolor(0, 0, 0, 173), false)

        dxDrawImage(363, 216, 638, 342, ":VnXPhone/images/sms_wp.png", 0, 0, 0, tocolor(255, 255, 255, 175), false)


        dxDrawText(" Spielzeit", 491, 194, 555, 216, tocolor(255, 255, 255, 255), 1.00, dxfont0_arial, "left", "top", false, false, false, false, false)
        dxDrawText("Name", 370, 194, 434, 216, tocolor(255, 255, 255, 255), 1.00, dxfont0_arial, "left", "top", false, false, false, false, false)
        dxDrawText(" Status", 592, 194, 656, 216, tocolor(255, 255, 255, 255), 1.00, dxfont0_arial, "left", "top", false, false, false, false, false)
        dxDrawText(" Premium", 688, 194, 752, 216, tocolor(255, 255, 255, 255), 1.00, dxfont0_arial, "left", "top", false, false, false, false, false)
        dxDrawText(" Fraktion", 792, 194, 856, 216, tocolor(255, 255, 255, 255), 1.00, dxfont0_arial, "left", "top", false, false, false, false, false)
        dxDrawText(" Telefon", 892, 194, 956, 216, tocolor(255, 255, 255, 255), 1.00, dxfont0_arial, "left", "top", false, false, false, false, false)
        dxDrawText(" Ping", 966, 194, 1030, 216, tocolor(255, 255, 255, 255), 1.00, dxfont0_arial, "left", "top", false, false, false, false, false)
        dxDrawLine(470, 194, 470, 558, tocolor(255, 255, 255, 255), 1, false)
        dxDrawLine(570, 194, 570, 558, tocolor(255, 255, 255, 255), 1, false)
        dxDrawLine(670, 194, 670, 558, tocolor(255, 255, 255, 255), 1, false)
        dxDrawLine(770, 194, 770, 558, tocolor(255, 255, 255, 255), 1, false)
        dxDrawLine(870, 194, 870, 558, tocolor(255, 255, 255, 255), 1, false)
        dxDrawLine(966, 194, 966, 558, tocolor(255, 255, 255, 255), 1, false)
        dxDrawLine(364, 215, 1001, 215, tocolor(255, 255, 255, 255), 1, false)

        dxDrawText("S.F.P.D : "..factionCounter[1], 1014, 223, 1114, 246, tocolor(0, 140, 183, 255), 1.00, "default-bold", "center", "top", false, false, false, false, false)
        dxDrawText("U.S Army : "..factionCounter[8], 1014, 269, 1114, 292, tocolor(0, 100, 0, 255), 1.00, "default-bold", "center", "top", false, false, false, false, false)
        dxDrawText("F.B.I : "..factionCounter[6], 1014, 246, 1114, 269, tocolor(0, 86, 184, 255), 1.00, "default-bold", "center", "top", false, false, false, false, false)
        
        
        dxDrawRectangle(1011, 213, 133, 3, tocolor(0, 150, 200, 255), false)

        dxDrawText("Medic : "..factionCounter[10], 1014, 295, 1114, 318, tocolor(255, 51, 51, 255), 1.00, "default-bold", "center", "top", false, false, false, false, false)
        dxDrawText("San News : "..factionCounter[5], 1014, 318, 1114, 341, tocolor(180, 130, 0, 255), 1.00, "default-bold", "center", "top", false, false, false, false, false)
        dxDrawText("Mechaniker : "..factionCounter[11], 1014, 341, 1114, 364, tocolor(255, 100, 0, 255), 1.00, "default-bold", "center", "top", false, false, false, false, false)
        dxDrawText("Brotherhood : "..factionCounter[2], 1021, 367, 1121, 390, tocolor(160, 40, 40, 255), 1.00, "default-bold", "center", "top", false, false, false, false, false)
        dxDrawText("Triaden : "..factionCounter[3], 1021, 390, 1121, 413, tocolor(255, 4, 4, 255), 1.00, "default-bold", "center", "top", false, false, false, false, false)
        dxDrawText("Los Aztecas : "..factionCounter[7], 1021, 413, 1121, 436, tocolor(200, 200, 0, 255), 1.00, "default-bold", "center", "top", false, false, false, false, false)
        dxDrawText("Angels Of Death : "..factionCounter[9], 1021, 436, 1121, 459, tocolor(100, 50, 50, 255), 1.00, "default-bold", "center", "top", false, false, false, false, false)
        dxDrawText("Compton Family´s : "..factionCounter[13], 1021, 459, 1121, 482, tocolor(0, 152, 0, 255), 1.00, "default-bold", "center", "top", false, false, false, false, false)
        dxDrawText("Rollin Height´s :"..factionCounter[12], 1021, 482, 1121, 505, tocolor(138, 43, 226, 255), 1.00, "default-bold", "center", "top", false, false, false, false, false)
        dxDrawText("Italian Mafia : "..factionCounter[14], 1021, 505, 1121, 528, tocolor(120, 120, 120, 255), 1.00, "default-bold", "center", "top", false, false, false, false, false)

        
        dxDrawText("Spieler Online : "..#getElementsByType("player"), 1021, 531, 1121, 554, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "top", false, false, false, false, false)
        
        di = 0

	for i = 1+scroll, 15+scroll do
		
		if pl[i] then

            dxDrawText(pl[i].name, 363, 216+(45*di), 470, 237, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
            dxDrawText(pl[i].spielzeit, 470, 216+(45*di), 569, 237, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
            dxDrawText(pl[i].status, 571, 216+(45*di), 670, 237, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
            if getElementData(getPlayerFromName(pl[i].name), "loggedin") == 1 then 
                if pl[i].paket == 0 then
                    dxDrawText("Nicht Aktiv", 671, 216+(45*di), 770, 237, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, true)
                else 
                    dxDrawText(vipPackageName[pl[i].paket], 671, 216+(45*di), 770, 237, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", true, true, true, true, true)
                end
            else 
                dxDrawText("-", 671, 216+(45*di), 770, 237, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, true)
            end

            dxDrawText(fraktionNames[pl[i].frak], 771, 216+(45*di), 870, 237, tocolor(pl[i].r, pl[i].g, pl[i].b,255), 1.00, "default", "center", "center", false, false, false, false, true)
            
            dxDrawText(pl[i].telnr, 870, 216+(45*di), 966, 237, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
            dxDrawText(pl[i].ping, 966, 216+(45*di), 1001, 237, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)

        di = di + 1
		end
	end
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------
