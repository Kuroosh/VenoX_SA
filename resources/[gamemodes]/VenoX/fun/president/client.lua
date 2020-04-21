addEvent ( "startPresiKonvoi", true )
addEvent ( "startPresiHostage", true )
addEvent ( "praesiWhatEverEnded", true )

local presiped = nil
local screenX, screenY = guiGetScreenSize()
local presilife = 0
local size = 0
local hostageend = 0
local presiveh = nil


local function drawPresiLife ( )
	if isElement ( presiped ) then
		local life = getElementHealth ( presiped ) + getPedArmor ( presiped )
		local lostlife = presilife - life
		dxDrawRectangle ( screenX*0.4-1, screenY*0.01, screenX*0.2+2, screenY*0.05+2, tocolor ( 0, 0, 0 ) ) 
		if life > 0 then
			dxDrawRectangle ( screenX*0.4, screenY*0.01+1, screenX*0.2*(life/presilife), screenY*0.05, tocolor ( 0, 200, 0 ) ) 
		else
			removeEventHandler ( "onClientRender", root, drawPresiLife )
		end
		if lostlife > 0 then
			dxDrawRectangle ( screenX*0.6, screenY*0.01+1, -screenX*0.2*(lostlife/presilife), screenY*0.05, tocolor ( 200, 0, 0 ) ) 
		end
		dxDrawText ( "Leben d. Präsidenten", screenX*0.4-1, screenY*0.01, screenX*0.6+1, screenY*0.06+2, tocolor ( 20, 20, 20 ), size, "default-bold", "center", "center", false, false )
	else
		removeEventHandler ( "onClientRender", root, drawPresiLife )
	end
end


local function drawPresiLifeAndTime ( )
	if isElement ( presiped ) then
		local life = getElementHealth ( presiped ) + getPedArmor ( presiped )
		local lostlife = presilife - life
		dxDrawRectangle ( screenX*0.3-1, screenY*0.01, screenX*0.2+2, screenY*0.05+2, tocolor ( 0, 0, 0 ) ) 
		if life > 0 then
			dxDrawRectangle ( screenX*0.3, screenY*0.01+1, screenX*0.2*(life/presilife), screenY*0.05, tocolor ( 0, 200, 0 ) ) 
		else
			removeEventHandler ( "onClientRender", root, drawPresiLife )
		end
		if lostlife > 0 then
			dxDrawRectangle ( screenX*0.5, screenY*0.01+1, -screenX*0.2*(lostlife/presilife), screenY*0.05, tocolor ( 200, 0, 0 ) ) 
		end
		dxDrawText ( "Leben d. Präsidenten", screenX*0.3-1, screenY*0.01, screenX*0.5+1, screenY*0.06+2, tocolor ( 20, 20, 20 ), size, "default-bold", "center", "center", false, false )
		
		dxDrawRectangle ( screenX*0.5, screenY*0.01, screenX*0.1, screenY*0.05+2, tocolor ( 0, 0, 0 ) )
		local timeleft = hostageend - getTickCount()
		local minute = math.floor ( timeleft / ( 60*1000 ) )
		local second = math.ceil ( ( timeleft - minute*60*1000 ) / 1000 )
		dxDrawText ( minute..":"..second, screenX*0.5, screenY*0.01, screenX*0.6, screenY*0.06+2, tocolor ( 220, 220, 220 ), size, "default-bold", "center", "center", false, false )
	else
		removeEventHandler ( "onClientRender", root, drawPresiLife )
	end
end


local function presidentVehicleDamage ( attacker )
	if isElement ( attacker ) and getElementType ( attacker ) == "player" then
		local frac = getElementData ( attacker, "fraktion" )
		if frac and ( frac == 1 or frac == 6 or frac == 8 ) then
			cancelEvent()
		end
	end
end


addEventHandler ( "startPresiKonvoi", root, function ( ped, veh )
	if size == 0 then
		size = getBestFontSize ( 1.5 )
	end
	presiped = ped
	presiveh = veh
	presilife = getPedArmor ( ped ) + getElementHealth ( ped )
	addEventHandler ( "onClientRender", root, drawPresiLife )
	addEventHandler ( "onClientVehicleDamage", veh, presidentVehicleDamage )
end )


addEventHandler ( "startPresiHostage", root, function ( ped, veh, timetoend )
	if size == 0 then
		size = getBestFontSize ( 1.5 )
	end
	presiped = ped
	presiveh = veh
	presilife = presilife or 299.9
	hostageend = getTickCount() + timetoend
	removeEventHandler ( "onClientRender", root, drawPresiLife )
	addEventHandler ( "onClientRender", root, drawPresiLifeAndTime )
	removeEventHandler ( "onClientVehicleDamage", veh, presidentVehicleDamage )
	addEventHandler ( "onClientVehicleDamage", veh, presidentVehicleDamage )
end )


addEventHandler ( "praesiWhatEverEnded", root, function ( )
	removeEventHandler ( "onClientRender", root, drawPresiLife )
	removeEventHandler ( "onClientRender", root, drawPresiLifeAndTime )
	presiped = nil
	hostageend = 0
end )


addCommandHandler ( "testit1", function ( )
	setDevelopmentMode ( true )
end )