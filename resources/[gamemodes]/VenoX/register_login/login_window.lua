-------------------------
------- (c) 2010 --------
------- by Zipper -------
-- and Vio MTA:RL Crew --
-------------------------

addEvent('ShowLoginWindow', true )
addEvent ( "aktualisiereMemberTabelle", true )

-- preliminary
local resX, resY = guiGetScreenSize()
local sx, sy = resX/1920, resY/1080
local segoeui = dxCreateFont('fonts/segoeui.ttf', 20)
local selected = 'password'
local username = ''
local password = ''
local showPassword = false
local inService = false
local hatPasswortDrin = true
youtubevideoon = false
local theurl = ""
local limits = {
	username = 241,
	password = 195
}

addEvent("cdn:onClientReady", true)

local videoURLs = { "" }



--[[{ "b60-sEXUPBY", "TTB6eEHCAko", "Vd85aPZ-QAE", "AjUNNXHdGwo", "7nUdHAVSLr4", "DKoY1fw7yCo", "CL1GEyK9Y0o", "DMg9idvVY8M", "j0uQBwFMfBk", "7ZkejDqTuSM", "PNjG22Gbo6U", "Fc50eXfe13U", "8C4-UEjadbU", 
"Slei8n08Cqk", "ID63iNLqrFU", "WG-KtnIMJY8", "CCJyJ_8gqqg", "Lrr7thWou8I", "C03n4AAiL9w", "RTlzQEA-4oc", "WPFLAjmWCtk", "PNjG22Gbo6U", "zG3z0tX-f6Q", "S0J07N7smd8", "lQlIhraqL7o", "iK18_Hz7NLc", "Lh8Mp76mqP8", 
"ywouLExEXqk", "UFXOd179kOA", "OYYJUt-V9oA", "1RNftSQj4cM", "Zt5W35sCCXw", "LU34CP8jUWU", "otCsqeMqqlM", "7Roa3aKnFoE", "AvKCib3O03g", "EO33DZpS82s", "m4FVcZMhunw", "Jm5DjptGtJo", "ntLop32pYd0", "qo6ygYSxwEY", 
"pVLmZMjxfjw", "Jq2T5n24kEo", "PeZ3dl8DgZg", "zv_d6k8DSIk", "cITCvGXaFDU", "4KpljzoEZsU", "zCfm-vWuQRk" }
]]

-- animation
local state = 'starting'
local phase = 0
local alpha = 0
local lastTick = getTickCount()

-- recognizable
showPlayerHudComponent('all', false)
showPlayerHudComponent('crosshair', true)



function LoginYTVideo ()
local file = fileCreate ( "einloggvideo.txt" )
	         fileWrite ( file, "off" )
	    	 fileClose ( file )
end


function checkBrowserActivated ( )
	if fileExists ( "einloggvideo.txt" ) then
		local file = fileOpen ( "einloggvideo.txt" )
		local status = fileRead ( file, fileGetSize ( file ) )
		fileClose ( file )
		if status == "off" then
			loginBrowser = createBrowser(resX, resY, false, false)
			addEventHandler("onClientBrowserCreated", loginBrowser, function()
				local zahl = math.random ( #videoURLs )
				loadBrowserURL(loginBrowser, "https://www.youtube.com/embed/"..videoURLs[zahl].."?vq=large&playlist=gn2DVQompvs&autoplay=1&controls=0&disablekb=1&modestbranding=1&showinfo=0&loop=1&cc_load_policy=1&iv_load_policy=3&ap=%2526fmt%3D18&html5=1&rel=0")
				theurl = zahl..": "..videoURLs[zahl]
				hatgeladenbro = true
				addCommandHandler ( "testlogin", setNewLink )
			end )
			return
		end
	end
end



-- utilities
local function convertingUserdata()
	local pass = password
	if not showPassword then
		pass = pass:gsub(".","*")
	end
	if #pass == 0 then
		pass = 'Passwort'
	end
	local user = username
	if #user == 0 then
		user = 'Name'
	end
	return user, pass 
end

local function setSettings( s, p ) 
	state = s or 'starting'
	phase = p or 0
	lastTick = getTickCount()
end 

local function getProgress( addtick )
	local now = getTickCount()
	local elapsedTime = now - lastTick
	local duration = lastTick+addtick - lastTick
	local progress = elapsedTime / duration
	return progress
end

local function sendUserdata()
	if #username > 0 and #password > 0 then
		triggerServerEvent ( "einloggen", lp, lp, hash ( "sha512", password ), hatPasswortDrin )

		-- pr0
		triggerServerEvent("pm:requestAuthentication", localPlayer, {username, hash("sha512", password)})

		inService = true
	end
end


local function removeLetter(button, press)
	if ( state ~= 'ready' or isChatBoxInputActive() or isConsoleActive() or isMainMenuActive() ) then 
		return
	end
	if press then
		if button == 'backspace' then
			local text = ( selected == 'username' and username or password )
			if #text > 0 then 
				text = string.sub(text, 1, #text - 1)
			end
			if selected ~= 'username' then
				password = text
			end
		elseif button == "enter" then
			sendUserdata()
		end
	end
end

local function mainClick(button, _state, x, y)
	if state ~= 'ready' then 
		return 
	end

	if ( button == 'left' and _state == 'down' ) then
		-- username
		local checkX = ( x > resX*0.3 and x < resX*0.438 ) 
		local checkY = ( y > resY*0.42 and y < resY*0.458 )
		if ( checkX and checkY ) then
			selected = 'username'
			if ( not inService ) then
				lastTick = getTickCount()
			end
		end
		-- password
		local checkX = ( x > resX*0.3 and x < resX*0.438 ) 
		local checkY = ( y > resY*0.515 and y < resY*0.5537 )
		if ( checkX and checkY ) then
			selected = 'password'
			if ( not inService ) then
				lastTick = getTickCount()
			end
		end
		-- login
		local checkX = ( x > resX*0.59 and x < resX*0.73 ) 
		local checkY = ( y > resY*0.665 and y < resY*0.725 )
		if ( checkX and checkY ) then
			sendUserdata()
		end
	end
end

local function addLetter(button)
	if ( state ~= 'ready' or isChatBoxInputActive() or isConsoleActive() or isMainMenuActive() ) then 
		return
	end
	local text = ( selected == 'username' and username or password )
	if dxGetTextWidth(text,0.5, segoeui ) >= limits[selected]-1 then
		return 
	end
	text = text..button
	if ( button == 'space' ) then
		text = text .. ' '
	end
	if ( selected ~= 'username' ) then
		password = text
	end
end


local function mainRender()
	local user, pass = convertingUserdata()
	dxDrawImage ( 0, 0, resX, resY, "images/loginhintergrund.png" )

	showCursor ( true )

	dxDrawText ( user, resX*0.330, resY*0.42, resX*0.434, resY*0.458, tocolor ( 0, 0, 0 ), 1.2*sy, "default", "left", "center", true, false )
	dxDrawText ( pass, resX*0.330, resY*0.515, resX*0.434, resY*0.5537, tocolor ( 0, 0, 0 ), 1.2*sy, "default", "left", "center", true, false )
	if ( selected == 'username' ) then
		--dxDrawRectangle( resX*0.306+dxGetTextWidth((#username == 0 and username) or user, 1.2*sy, "default"), resY*0.42+5*sy, 1*sx, resY*0.038-10*sy, tocolor(0, 0, 0, 255))
	elseif ( selected == 'password' ) then
		dxDrawRectangle( resX*0.306+dxGetTextWidth((#password == 0 and password) or pass, 1.2*sy, "default"), resY*0.515+5*sy, 1*sx, resY*0.038-10*sy, tocolor(0, 0, 0, 255))
	end
end

local function respondServer( )
	setSettings( 'finished', 0)

	removeEventHandler('onClientRender', root, mainRender)
	removeEventHandler('ShowLoginWindow', root, startRender )
	removeEventHandler('onClientKey', root, removeLetter)
	removeEventHandler('onClientClick', root, mainClick)
	removeEventHandler('onClientCharacter', root, addLetter)
	guiSetInputMode("allow_binds")
	showCursor ( false )
	if isElement ( loginBrowser ) then
		destroyElement ( loginBrowser )
	end
	setCameraTarget ( lp )
	showChat ( true )
	--bindKey ("b", "down", showOtherHud)
	--showOtherHud()
	setElementClicked ( false )
	setElementHunger ( 60 )
	
	setTimer ( checkForSocialStateChanges, 60000, 0 )
	setTimer ( getPlayerSocialAvailableStates, 1000, 1 )
	removeCommandHandler ( "testlogin", setNewLink )
	if not fileExists("files/login.txt") then
		outputChatBox ("Gebe \"/auto 1\" zum Speichern deines Passwortes ein.")
	end
	-------------
	triggerEvent('onRequestLobby', localPlayer )
end
addEvent ( "DisableLoginWindow", true )
addEventHandler ( "DisableLoginWindow", getRootElement(), respondServer)


function ShowInfoWindow ()
	infobox_start_func("\nHerzlich Willkommen\nauf VenoX Reallife!!", 7500 )
end

function startRender ( name, boolean )
	if boolean then
		if fileExists("files/login.txt") then
			local autofile = fileOpen("files/login.txt")
			password = tostring(fileRead(autofile, 500))
			fileClose(autofile)
		end
		hatPasswortDrin = true
	else
		hatPasswortDrin = false
		setTimer ( infobox_start_func, 1000, 1, "Du hast\nkein Passwort!\nGib bitte dein\nzukünftiges Passwort ein!\n(wird gespeichert)", 6000, 255, 0, 0  )
	end
	username = name
	showCursor(true)
	addEventHandler('onClientRender', root, mainRender)
	setSettings( 'ready', 0 )
end


function startedTheResource ()
	for i = 1, 100 do
		outputChatBox (" ")
	end
	setTimer ( ShowInfoWindow, 1000, 1 )
	triggerServerEvent ( "regcheck", getLocalPlayer(), getLocalPlayer() )
	addEventHandler('ShowLoginWindow', root, startRender )
	addEventHandler('onClientKey', root, removeLetter)
	addEventHandler('onClientClick', root, mainClick)
	guiSetInputMode("no_binds")
	addEventHandler('onClientCharacter', root, addLetter)

	checkBrowserActivated()
	LoginYTVideo ()

end

addEventHandler('cdn:onClientReady', root, startedTheResource)

saveLogin = function(ERROR_nil, ERROR_nil)
	if ERROR_nil == "1" then
		if fileExists("files/login.txt") then
			fileDelete("files/login.txt")
		end
		local loginfile = fileCreate("files/login.txt")
		fileWrite(loginfile, password)
		fileClose(loginfile)
		outputChatBox("#C8C800[INFO]: #FFFFFFAuto-Login aktiviert!", 0, 0, 0,true)
	else
		fileDelete("files/login.txt")
		outputChatBox("#C8C800[INFO]: #FFFFFFAuto-Login deaktiviert!", 0, 0, 0,true)
	end
end
addCommandHandler("auto", saveLogin)


function setNewLink ( _, i )
	local i = tonumber ( i )
	if videoURLs[i] then
		local zahl = i
		loadBrowserURL(loginBrowser, "https://www.youtube.com/embed/"..videoURLs[zahl].."?vq=large&playlist=gn2DVQompvs&autoplay=1&controls=0&disablekb=1&modestbranding=1&showinfo=0&loop=1&cc_load_policy=1&iv_load_policy=3&ap=%2526fmt%3D18&html5=1&rel=0")
		theurl = videoURLs[zahl]
		setTimer ( setNewLink, 4000, 1, i + 1 )
	end
end


