addEvent ( "museumalarm", true )
addEvent ( "museumsound", true )
addEvent ( "stopmuseumsounds", true )
addEvent ( "setmuseumpedanimation", true )
addEvent ( "gettheartifact", true )
addEvent ( "stopgettingtheartifact", true )
addEvent ( "startMuseumRobPlane", true )

local museumpeds = { }
local alarmsound = nil
local museumsound = nil
local museumsoundtype = 1
local lasttargetedped = 0
local museumrobgoing = false
local animtyp = 0
local artifactstatus = 0


function createMuseumPeds ( )
	if isElement ( museumpeds[1] ) then
		for _, ped in pairs ( museumpeds ) do
			destroyElement ( ped )
		end
	end
	museumpeds = {
		createPed ( 9, 1714.9000244141, -1673.5, 20.200000762939, 0 ),
		createPed ( 235, 1714.1999511719, -1663.4000244141, 20.200000762939, 90 ),
		createPed ( 192, 1714.1999511719, -1663, 20.200000762939, 90 ), 
		createPed ( 229, 1721, -1652.5, 20.10000038147, 205 ),
		createPed ( 216, 1721.9000244141, -1652.1999511719, 20.10000038147, 180 ),
		createPed ( 55, 1723.1999511719, -1652.5999755859, 20.10000038147, 160 )
	}
	for _, ped in pairs ( museumpeds ) do
		setElementInterior ( ped, 18 )
		setElementFrozen ( ped, true )
		addEventHandler ( "onClientPedDamage", ped, hitAHostage )
	end
	setMuseumPedAnimation ( animtyp )
end


function hitAHostage ( attacker )
	triggerServerEvent ( "hitahostage", attacker )
end


function destroyMuseumPads ( )
	for _, ped in pairs ( museumpeds ) do
		destroyElement ( ped )
	end
	museumpeds = {}
end


function museumAlarmSound ( typ )
	museumrobgoing = true
	animtyp = typ
	if isElement ( museumpeds[1] ) then
		destroyMuseumPads()
	end
	createMuseumPeds()
	if isElement ( museumsound ) then
		removeEventHandler ( "onClientSoundStopped", getRootElement(), museumNormalSound )
		stopSound ( museumsound )
	end
	alarmsound = playSound ( "sounds/klingel.mp3", true )
	setSoundVolume ( alarmsound, 0.1 )
	removeEventHandler ( "onClientPlayerTarget", getRootElement(), startMuseumRob )
end
addEventHandler ( "museumalarm", getRootElement(), museumAlarmSound )


function museumNormalSound ( )
	museumrobgoing = false
	animtyp = 0
	if isElement ( alarmsound ) then
		stopSound ( alarmsound )
		alarmsound = nil
	end
	if isElement ( museumpeds[1] ) then
		destroyMuseumPads()
	end
	createMuseumPeds()
	local path = ( museumsoundtype == 1 and "sounds/pianochill.mp3" ) or ( museumsoundtype == 2 and "sounds/fahrstuhlmusik.mp3" ) 
	museumsound = playSound ( path )
	museumsoundtype = ( museumsoundtype == 1 and 2 ) or ( museumsoundtype == 2 and 1 )
	alarmsound = nil
	setSoundVolume ( museumsound, 0.3 )
	removeEventHandler ( "onClientSoundStopped", getRootElement(), museumNormalSound )
	addEventHandler ( "onClientSoundStopped", getRootElement(), museumNormalSound )
	addEventHandler ( "onClientPlayerTarget", getRootElement(), startMuseumRob )
end
addEventHandler ( "museumsound", getRootElement(), museumNormalSound )


function stopMuseumSounds ( )
	destroyMuseumPads()
	if isElement ( alarmsound ) then
		stopSound ( alarmsound )
	end
	if isElement ( museumsound ) then
		removeEventHandler ( "onClientSoundStopped", getRootElement(), museumNormalSound )
		stopSound ( museumsound )
	end 
	removeEventHandler ( "onClientPlayerTarget", getRootElement(), startMuseumRob )
end
addEventHandler ( "stopmuseumsounds", getRootElement(), stopMuseumSounds )


function startMuseumRob ( element )
	if getPedWeaponSlot ( source ) >= 2 then
		if getPedControlState ( source, "aim_weapon" ) then
			if element == museumpeds[1] then
				if not museumrobgoing and lasttargetedped + 2000 <= getTickCount() then
					lasttargetedped = getTickCount()
					triggerServerEvent ( "startmuseumrob", getLocalPlayer() )
				end
			end
		end
	end
end


function setMuseumPedAnimation ( typ )
	if typ == 1 then
		for index, ped in pairs ( museumpeds ) do
			if index == 1 then
				setPedAnimation ( ped, "shop", "SHP_HandsUp_Scr" )
			else
				setPedAnimation ( ped, "ped", "cower", -1, true, false, false )
			end
		end
		setTimer ( setPedAnimation, 500, 1, museumpeds[1], "shop", "SHP_Rob_HandsUp", -1, false, true, false )
	elseif typ == 2 then
		setPedAnimation ( museumpeds[4], "CRACK", "crckdeth1", -1, false, false, false )
	end
end
addEventHandler ( "setmuseumpedanimation", getRootElement(), setMuseumPedAnimation )


function tryToGetTheArtifact ( )
	addEventHandler ( "onClientRender", getRootElement(), drawTheArtifactStatus )
	addEventHandler ( "onClientPlayerWasted", getLocalPlayer(), stopTryingToGetTheArtifact )
end
addEventHandler ( "gettheartifact", getRootElement(), tryToGetTheArtifact )


function stopTryingToGetTheArtifact ( )
	removeEventHandler ( "onClientRender", getRootElement(), drawTheArtifactStatus )
	removeEventHandler ( "onClientPlayerWasted", getLocalPlayer(), stopTryingToGetTheArtifact )
	artifactstatus = 0
end
addEventHandler ( "stopgettingtheartifact", getRootElement(), stopTryingToGetTheArtifact )


function drawTheArtifactStatus ( )
	local x, y, z = getPedBonePosition ( getLocalPlayer(), 6 )
	local screenX, screenY = getScreenFromWorldPosition ( x, y, z+0.2 )
	local width, length = guiGetScreenSize()
	local fontsize = (2/1920*width + 2/1080*length) / 2
	dxDrawRectangle ( screenX - ( width * 0.15 ), screenY - ( length * 0.08 ), width*0.3, length*0.06, tocolor ( 255, 0, 0, 255 ) )
	dxDrawRectangle ( screenX - ( width * 0.15 ), screenY - ( length * 0.08 ), width*0.3*(artifactstatus/1000), length*0.06, tocolor ( 0, 155, 0, 255 ) )
	dxDrawText ( "Wird erbeutet ...", screenX - ( width * 0.2 ), screenY - ( length * 0.1 ), screenX + ( width * 0.2 ), screenY, tocolor ( 0, 0, 0, 255 ), fontsize, "default", "center", "center", true, false )
	if artifactstatus == 1000 then
		stopTryingToGetTheArtifact()
		triggerServerEvent ( "gottheartifact", getLocalPlayer() )
	else
		artifactstatus = artifactstatus + 1
	end
end


addEventHandler ( "startMuseumRobPlane", root, function ( ped )
	setPedControlState ( ped, "accelerate", true )
end )
