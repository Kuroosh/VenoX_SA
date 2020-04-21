
--[[
	Eine Gewinnmoeglichkeit wird als Funktion angegeben, damit wir mehrere Operationen ausfuehren koennen. Der 'player' ist der Spieler, der den Command ausfuehrt.
	Index:
		1) Der Spieler kriegt 50k money
		2) Der Spieler kriegt eine M4 mit 200 Munition
		3) Man kann ja nicht jedesmal gewinnen :^)
		[...] Kann beliebig erweitert werden
]]

--createMarker ( -1991.6329345703, 214.95687866211, 26.8, "cylinder", 1, getColorFromString ( "#FF000099" ) )
--[[
local ped = {
	
}




local actions = {
    function(player)
		setPedArmor(player,100)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 5000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es eine Schutzweste + 5.000 $ ", player, 0, 255, 0)
	end,
	function(player)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 3000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es 3.000$", player, 0, 255, 0)
    end,
    function(player)
		setPedArmor(player,100)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 5000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es eine Schutzweste + 5.000 $ ", player, 0, 255, 0)
	end,
	function(player)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 3000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es 3.000$", player, 0, 255, 0)
    end,
    function(player)
		setPedArmor(player,100)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 5000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es eine Schutzweste + 5.000 $ ", player, 0, 255, 0)
	end,
	function(player)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 3000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es 3.000$", player, 0, 255, 0)
    end,
	function(player)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 5000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es 5.000$", player, 0, 255, 0)
	end,
	function(player)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 3000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es 3.000$", player, 0, 255, 0)
    end,
    function(player)
		setPedArmor(player,100)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 5000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es eine Schutzweste + 5.000 $ ", player, 0, 255, 0)
	end,
	function(player)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 3000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es 3.000$", player, 0, 255, 0)
    end,
    function(player)
		setPedArmor(player,100)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 5000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es eine Schutzweste + 5.000 $ ", player, 0, 255, 0)
	end,
	function(player)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 3000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es 3.000$", player, 0, 255, 0)
    end,
    
	function(player)
		givePlayerXP(player, 50)
		outputChatBox("[Weihnachtsmann] : Du hast Premium für 3 Tage gewonnen ! Meld dich bei Solid_Snake mit Gültigen Screenshot´s von dieser Nachricht.", player, 0, 255, 0)
	end,
	function(player)
		givePlayerXP(player, 50)
		outputChatBox("[Weihnachtsmann] : [Weihnachtsmann] : Du hast Premium für 7 Tage gewonnen ! Meld dich bei Solid_Snake mit Gültigen Screenshot´s von dieser Nachricht.", player, 0, 255, 0)
	end,
	function(player)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 5000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es 5.000$", player, 0, 255, 0)
	end,
	function(player)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 3000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es 3.000$", player, 0, 255, 0)
	end,
	function(player)
		givePlayerXP(player, 50)
		outputChatBox("[Weihnachtsmann] : Du hast Premium für 1 Tag gewonnen ! Meld dich bei Solid_Snake mit Gültigen Screenshot´s von dieser Nachricht.", player, 0, 255, 0)
	end,
	function(player)
		givePlayerXP(player, 50)
		vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 20000 )
		outputChatBox("[Weihnachtsmann] : 20.000$!!! nimm das Geld :^)", player, 0, 255, 0)
	end,
	function(player)
		givePlayerXP(player, 50)
		vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 12000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es bisschen Taschengeld :3 ( 12.000 $ )", player, 0, 255, 0)
	end,
	function(player)
		givePlayerXP(player, 50)
		vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 8500 )
		outputChatBox("[Weihnachtsmann] : Ich bin heute gut gelaunt ! Hier hast du Geschenk! ( 8.500 $ ) ", player, 0, 255, 0)
	end,
	function(player)
		givePlayerXP(player, 50)
		vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 5000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es bisschen Taschengeld :3 ( 5.000 $ )", player, 0, 255, 0)
	end,
	function(player)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 10000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es bisschen Taschengeld :3 ( 10.000 $ )", player, 0, 255, 0)
	end,
	function(player)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 50000 )
		outputChatBox("[Weihnachtsmann] : Du hast ein Hausmarker nach Wahl gewonnen! + Premium für 2 Wochen + 50.000 $ + Einen Wunsch nach Wahl ! Meld dich bei Solid_Snake mit Gültigen Screenshot´s von dieser Nachricht.", player, 0, 255, 0)
    end,
	function(player)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 5000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es 5.000$", player, 0, 255, 0)
	end,
	function(player)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 3000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es 3.000$", player, 0, 255, 0)
    end,
    function(player)
		setPedArmor(player,100)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 5000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es eine Schutzweste + 5.000 $ ", player, 0, 255, 0)
	end,
	function(player)
		givePlayerXP(player, 50)
		outputChatBox("[Weihnachtsmann][SUPER-GEWINN] : Du hast ein Hausmarker nach Wahl gewonnen! Meld dich bei Solid_Snake mit Gültigen Screenshot´s von dieser Nachricht.", player, 0, 255, 0)
    end,
	function(player)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 3000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es 3.000$", player, 0, 255, 0)
    end,
    function(player)
		setPedArmor(player,100)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 5000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es eine Schutzweste + 5.000 $ ", player, 0, 255, 0)
	end,
	function(player)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 3000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es 3.000$", player, 0, 255, 0)
    end,
	function(player)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 5000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es 5.000$", player, 0, 255, 0)
	end,
	function(player)
		givePlayerXP(player, 50)

        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 3000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es 3.000$", player, 0, 255, 0)
    end,
    function(player)
		setPedArmor(player,100)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 5000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es eine Schutzweste + 5.000 $ ", player, 0, 255, 0)
	end,
	function(player)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 3000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es 3.000$", player, 0, 255, 0)
    end,
	function(player)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 5000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es 5.000$", player, 0, 255, 0)
	end,
	function(player)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 3000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es 3.000$", player, 0, 255, 0)
    end,
	function(player)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 5000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es 5.000$", player, 0, 255, 0)
	end,
	function(player)
		givePlayerXP(player, 50)
        vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + 3000 )
		outputChatBox("[Weihnachtsmann] : Heute gibt es 3.000$", player, 0, 255, 0)
    end,
}]]
--[[
	Hier werden alle Spieler protokolliert, die ein Geschenk bekommen haben.
	Der Timestamp wird in Sekunden angegeben!!!
]]

--[[ 
	In der MySQL Datenbank bei userdata neues feld namens geschenk
	Bei register system serverside vnxSetElementData(player, "geschenk", false)

]]
--[[
--local day = 60 * 60 * 24
-- Aender noch die Position
local ped = createPed(260,-1991.5,217.60001,27.7,180,true)
local ped1 = createPed(286,-1993.5,217.3,27.7,179.72,true)
local ped2 = createPed(287,-1989.6,217.60001,27.7,180,true)
local ped3 = createPed(240,-1986.9004,216.90039,27.7,180,true)
setElementFrozen(ped,true)
setElementFrozen(ped1,true)
setElementFrozen(ped2,true)
setElementFrozen(ped3,true)
setTimer(setElementHealth,51,0,ped,100)
setTimer(setElementHealth,51,0,ped1,100)
setTimer(setElementHealth,51,0,ped2,100)
setTimer(setElementHealth,51,0,ped3,100)
local marker = createColSphere( -1991.6329345703, 214.95687866211, 26.8, 4)


function Info2000 (btn,sta,player)
	if btn == "left" and sta == "down" then
		local px,py,pz = getElementPosition(player) 
		local mx,my,mz = getElementPosition(ped)
		if getDistanceBetweenPoints3D( px,py,pz, mx,my,mz ) > 5 then return end
		triggerClientEvent ( player, "infobox_start", root, "Benutze /geschenk \num dein Taegliches Geschenk zu kriegen :) !", 5000, 0, 255, 0 )
	end
end
addEventHandler("onElementClicked",root,Info2000) 

function saySomething(player,mDim)
	if not (source == marker and mDim) then return end
	triggerClientEvent ( player, "infobox_start", root, "Drücke B \num auf den Weihnachtsmann zu klicken :) !", 5000, 0, 255, 0 )
end
addEventHandler("onColShapeHit",root,saySomething)  

function getTimestamp(year, month, day, hour, minute, second)
    -- initiate variables
    local monthseconds = { 2678400, 2419200, 2678400, 2592000, 2678400, 2592000, 2678400, 2678400, 2592000, 2678400, 2592000, 2678400 }
    local timestamp = 0
    local datetime = getRealTime()
    year, month, day = year or datetime.year + 1900, month or datetime.month + 1, day or datetime.monthday
    hour, minute, second = hour or datetime.hour, minute or datetime.minute, second or datetime.second    
    -- calculate timestamp
    for i=1970, year-1 do timestamp = timestamp + (isLeapYear(i) and 31622400 or 31536000) end
    for i=1, month-1 do timestamp = timestamp + ((isLeapYear(year) and i == 2) and 2505600 or monthseconds[i]) end
    timestamp = timestamp + 86400 * (day - 1) + 3600 * hour + 60 * minute + second    
    timestamp = timestamp - 3600 --GMT+1 compensation
    if datetime.isdst then timestamp = timestamp - 3600 end    
    return timestamp
end

function isLeapYear(year)
    if year then year = math.floor(year)
    else year = getRealTime().year + 1900 end
    return ((year % 4 == 0 and year % 100 ~= 0) or year % 400 == 0)
end

addCommandHandler("geschenk", 
	function(player, cmd)
		-- Ist der Spieler im Marker
		--local px,py,pz = getElementPosition(player) 
		--local mx,my,mz = getElementPosition(ped)
		--if getDistanceBetweenPoints3D( px,py,pz, mx,my,mz ) > 5 then return end
		if not isElementWithinColShape( player, marker ) then return end
		if not vnxGetElementData(player,"geschenk") then return end
		local time 		= vnxGetElementData(player,"geschenk");
		local actStmp 	= getTimestamp()
		-- Wir geben ihm sein Geschenk
		if time <= actStmp then
			-- Protokollieren, 
			local year 	= getRealTime().year+1900
			local month = getRealTime().month+1
			local day	= getRealTime().monthday+1
			local hour 	= getRealTime().hour
			local minute = getRealTime().minute
			local second = getRealTime().second
			local newStmp = getTimestamp(year,month,day,hour,minute,second)
			vnxSetElementData(player,"geschenk",newStmp)
			-- Ausloesung
			actions[math.random(1, #actions)](player)
			return
		end
		local stunden = vnxGetElementData(player,"geschenk") - actStmp;
		if stunden <= 0 then stunden = 0 end
		outputChatBox("[Weihnachtsmann] : Du hast bereits ein Geschenk erhalten! Warte bis ein Tag rum ist :) ", player, 0, 218, 255)
		--outputChatBox("Komm in " ..math.floor(stunden/1000/60*100)/100 .. " Stunden wieder :p (24 H ) ", player, 0, 218, 255)
		--outputChatBox("Oder benutze /buygeschenk um dir wieder ein Geschenk zu kaufen :) ", player, 0, 218, 255)
	end
)

function Geschenkgeldabzug (player, cmd)
	if not isElementWithinColShape( player, marker ) then return end
	if vnxGetElementData(player,"geschenk") > getTimestamp() then outputChatBox("Du hast bereits ein Geschenk erhalten warte bis ein Tag rum ist !", player, 255, 0, 0) return end
	if not (vnxGetElementData ( player, "money" ) >= 70000) then outputChatBox ( "Du hast nicht genug Geld - ein Paket kostet 70.000$!", player, 125, 0, 0 ) return end
	vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - 70000 )
	outputChatBox("Du hast soeben ein neues Geschenk erhalten", player, 0, 255, 0)
end
--addCommandHandler("buygeschenk",Geschenkgeldabzug)]]