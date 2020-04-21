dxWindows = {}
dxWindows.__index = dxWindows

local screenx, screeny = guiGetScreenSize()
local dxfont0_harabara = dxCreateFont("handy/data/fonts/harabara.ttf", 22)


function dxWindows:draw()
	dxDrawImage(self.x, self.y, self.w, self.h, "images/dx/background.png", 0, 0, 0, tocolor(0, 0, 0, self.alp), false)
    dxDrawText(self.text, self.x, self.y, self.w+self.x, 0, tocolor(219, 116, 15, 255), 0.50, dxfont0_harabara, "center", "top", false, false, false, false, false)
end

function dxWindows:create(x,y,w,h)
	local data = {x = x, y = y, w = w, h = h, text = "", alp = 135}
	setmetatable(data, self)
	function data.draw1() data:draw() end
	addEventHandler("onClientRender", root, data.draw1)
	return data
end

function dxWindows:setAlpha(alp)
	self.alp = alp
end

function dxWindows:setText(text)
	self.text = text
end

function dxWindows:setText(text)
	self.text = text
end

function dxWindows:draw()
	dxDrawImage(self.x, self.y, self.w, self.h, "images/dx/background.png", 0, 0, 0, tocolor(0, 0, 0, self.alp), false)
    dxDrawText(self.text, self.x, self.y, self.w+self.x, 0, tocolor(219, 116, 15, 255), 0.50, dxfont0_harabara, "center", "top", false, false, false, false, false)
end

addEvent("onDxButtonClick", true)

local window = {}
addCommandHandler("dxtest", function()
	window[1] = dxButtons:create(339, 301, 149, 38)
	window[1]:setImage("images/dx/background.png")
	window[1]:setAlpha(125)
	addEventHandler("onDxButtonClick", window[1].button, function()
		window[1]:destroy()
	end)
end)

dxButtons = {}
dxButtons.__index = dxButtons

function dxButtons:render()
	local cx, cy = 0,0 if isCursorShowing() == true then cx,cy = getCursorPosition() cx,cy = cx*screenx, cy*screeny end
	if cx >= self.x and cy >= self.y and cx <= self.x+self.w and cy <= self.h+self.y then if self.size <= 10 then self.size = self.size+2 end else if self.size > 0 then self.size = self.size-2 end end
	if self.typ == "image" then
		dxDrawImage(self.x-self.size/2, self.y-self.size/2, self.w+self.size, self.h+self.size, self.image, 0, 0, 0, tocolor(255, 255, 255, self.alp), false)
	else
		dxDrawRectangle(self.x-self.size/2, self.y-self.size/2, self.w+self.size, self.h+self.size, tocolor(0,0,0,self.alp), false)
		dxDrawText(self.text-self.size/2, self.x-self.size/2, self.y+self.size, self.w+self.x+self.size, 0, tocolor(219, 116, 15, 255), 0.50, dxfont0_harabara, "center", "top", false, false, false, false, false)
	end
end

function dxButtons:click(cx,cy)
	if cx >= self.x and cy >= self.y and cx <= self.x+self.w and cy <= self.h+self.y then
		triggerEvent("onDxButtonClick", self.button)
		self.size = 0
	end
end
dxButtonTable = {}

function dxButtons:create(x,y,w,h)
	local data = {x = x, y = y, w = w, h = h, typ = typ, text = "", image = "", size = 0, alp = 200, button = guiCreateButton(0,0,0,0,"",true)}
	function data.render1() data:render() end
	onRender(data.render1, true)
	dxButtonTable[data.button] = data
	function data.click1(button, state, cx, cy) if button == "left" and state == "down" then data:click(cx,cy) end end
	onClick(data.click1, true)
	setmetatable(data, self)
	return data
end

function dxButtons:setImage(img)
	self.image = img
	self.typ = "image"
end

function dxButtons:setAlpha(alp)
	self.alp = alp
end

function dxButtons:setText(text)
	self.text = text
end

function dxButtons:destroy()
	onRender(self.render1, false)
	destroyElement(self.button)
	onClick(self.click1, false)
	self = nil
end


















--Copyright by Harrikan

einGUIOffen = false

function createServerCallInterface()
	return setmetatable(
		{},
		{
			__index = function(t, k)
				t[k] = function(...) triggerServerEvent('onServerCall', g_Me, k, ...) end
				return t[k]
			end
		}
	)
end

addEvent('onClientCall', true)
addEventHandler('onClientCall', getResourceRootElement(getThisResource()),
	function(fnName, ...)
		local fn = _G
		local path = fnName:split('.')
		for i,pathpart in ipairs(path) do
			fn = fn[pathpart]
		end
		fn(...)
	end,
	false
)



bindKey("ralt", "down", function()
	showCursor(not isCursorShowing())
end)


addEventHandler("onClientPedDamage", getRootElement(), function()
	if getElementData(source, "unbesiegbar") == true then
		cancelEvent()
	end
end)


function dxDrawCircle( posX, posY, radius, width, angleAmount, startAngle, stopAngle, color, postGUI )
    if ( type( posX ) ~= "number" ) or ( type( posY ) ~= "number" ) then
        return false
    end
 
    local function clamp( val, lower, upper )
        if ( lower > upper ) then lower, upper = upper, lower end
        return math.max( lower, math.min( upper, val ) )
    end
 
    radius = type( radius ) == "number" and radius or 50
    width = type( width ) == "number" and width or 5
    angleAmount = type( angleAmount ) == "number" and angleAmount or 1
    startAngle = clamp( type( startAngle ) == "number" and startAngle or 0, 0, 360 )
    stopAngle = clamp( type( stopAngle ) == "number" and stopAngle or 360, 0, 360 )
    color = color or tocolor( 255, 255, 255, 200 )
    postGUI = type( postGUI ) == "boolean" and postGUI or false
 
    if ( stopAngle < startAngle ) then
        local tempAngle = stopAngle
        stopAngle = startAngle
        startAngle = tempAngle
    end
 
    for i = startAngle, stopAngle, angleAmount do
        local startX = math.cos( math.rad( i ) ) * ( radius - width )
        local startY = math.sin( math.rad( i ) ) * ( radius - width )
        local endX = math.cos( math.rad( i ) ) * ( radius + width )
        local endY = math.sin( math.rad( i ) ) * ( radius + width )
 
        dxDrawLine( startX + posX, startY + posY, endX + posX, endY + posY, color, width, postGUI )
    end
 
    return true
end

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end
editBoxGeoeffnet = false

local dx, dy = guiGetScreenSize()

local alphas = {}


addEvent("lassDasAutoDrehen", true)

function lasseAutoDrehen(veh)
	function drawCarBuyMenue()
		local x,y = guiGetScreenSize()
		einGuiGeoeffnet = true
		local vehname = getVehicleName(veh)
		local vehid = getElementModel(veh)
		local preis = getElementData(veh, "preis")
		local informationen = getElementData(veh, "informationen")
			local _, _, rot = getElementRotation(veh)
			rot = rot+1
			if rot >= 360 then
				rot = 0
			end
		setElementRotation(veh, 0, 0, rot)
		dxDrawRectangle(987*x/1366, 65*y/768, 317*x/1366, 517*y/768, tocolor(0, 0, 0, 184), true)
        dxDrawRectangle(987*x/1366, 65*y/768, 317*x/1366, 68*y/768, tocolor(106, 61, 24, 254), true)
        dxDrawRectangle(987*x/1366, 544*y/768, 317*x/1366, 30*y/768, tocolor(198, 99, 11, 254), true)
        dxDrawText("Autohaus", 990*x/1366, 72*y/768, 1294*x/1366, 133*y/768, tocolor(198, 99, 11, 254), 3.00*x/1366, "default", "center", "top", false, false, true, false, false)
        dxDrawText("Name des Fahrzeugs:", 997*x/1366, 148*y/768, 1122*x/1366, 188*y/768, tocolor(185, 185, 185, 254), 1.40*x/1366, "default", "left", "top", false, false, true, false, false)
        dxDrawText(vehname, 1177*x/1366, 147*y/768, 1294*x/1366, 189*y/768, tocolor(83, 252, 58, 254), 1.50*x/1366, "default", "left", "top", false, false, true, false, false)
        dxDrawText("Id des Fahrzeugs:", 997*x/1366, 188*y/768, 1122*x/1366, 228*y/768, tocolor(185, 185, 185, 254), 1.40*x/1366, "default", "left", "top", false, false, true, false, false)
        --dxDrawText("Geschwindigkeit:", 997*x/1366, 228*y/768, 1122*x/1366, 268*y/768, tocolor(185, 185, 185, 254), 1.40*x/1366, "default", "left", "top", false, false, true, false, false)
        dxDrawText("Informationen über das Fahrzeug", 997*x/1366, 333*y/768, 1284*x/1366, 379*y/768, tocolor(185, 185, 185, 254), 1.50*x/1366, "default", "center", "top", false, false, true, false, false)
        dxDrawText("Das Fahrzeug hat eine gute Beschleunigung\nund ist unter Fahrern auch als Sportwagen\nbekannt. Es ist einer der schnellsten und vor\nallem teuersten Wägen MTA's", 997*x/1366, 375*y/768, 1290*x/1366, 502*y/768, tocolor(34, 243, 3, 254), 1.25*x/1366, "default", "center", "top", false, false, true, false, false)
        dxDrawText(vehid, 1177*x/1366, 189*y/768, 1294*x/1366, 231*y/768, tocolor(83, 252, 58, 254), 1.50*x/1366, "default", "left", "top", false, false, true, false, false)
        --dxDrawText("etwa 250 km/h", 1156*x/1366, 226*y/768, 1273*x/1366, 268*y/768, tocolor(83, 252, 58, 254), 1.50*x/1366, "default", "left", "top", false, false, true, false, false)
        dxDrawText("Preis", 997*x/1366, 268*y/768, 1122*x/1366, 308*y/768, tocolor(185, 185, 185, 254), 1.40*x/1366, "default", "left", "top", false, false, true, false, false)
        dxDrawText(preis.." $", 1156*x/1366, 268*y/768, 1273*x/1366, 310*y/768, tocolor(83, 252, 58, 254), 1.50*x/1366, "default", "left", "top", false, false, true, false, false)
	end
	addEventHandler("onClientRender", getRootElement(), drawCarBuyMenue)
	createLegende(90)
	legendeAddRow(90, "Verlassen", "Leertaste")
	legendeAddRow(90, "Kaufen", "Enter")
	legendeAddRow(90, "Weiter", "Pfeil rechts")
	legendeAddRow(90, "Zurück", "Pfeil links")
end
addEventHandler("lassDasAutoDrehen", getRootElement(), lasseAutoDrehen)
local drawlocalFunction = {}
local renderid = {}

function dxDrawText3D(x,y,z, text, size, dis, id)
	if not id then id = 1 end
	local size, dis = size, dis
	if not size then size = 1.8 end
	if not dis then dis = 20 end
	drawlocalFunction[id] = function ()
		local gsx, gsy = getScreenFromWorldPosition(x,y,z)
		local gpx,gpy,gpz = getCameraMatrix()
		if (gsx) and (gsy) then 
			if isLineOfSightClear(x,y,z,gpx,gpy,gpz,true,false,false) then
				if getDistanceBetweenPoints3D(x,y,z,gpx,gpy,gpz) < dis then
					dxDrawText(text, gsx , gsy, gsx, gsy, tocolor(255, 255, 255, 255), size, "default", "center", "center", false, false, true, false, false)
				end
			end
		end
	end
	addEventHandler("onClientRender", getRootElement(), drawlocalFunction[id])
end

function removeDxDrawText3D(id)
	removeEventHandler("onClientRender", getRootElement(), drawlocalFunction[id])
end

addEvent("removeCarhouseDown", true)
addEventHandler("removeCarhouseDown", getRootElement(), function()
	removeEventHandler("onClientRender", getRootElement(), drawCarBuyMenue)
	 einGuiGeoeffnet = false 
	legendeDestroy(90)
end)

function dxDrawEditBox(text, id, groesse, anzahl, x,y,w,h,r,g,b,alp, zensiert, r2, g2, b2)
	if not r2 or not g2 or not b2 then r2, g2, b2 = 100, 70, 5 end
	local text = text
	local ids = id
	alphas[ids] = alp
	--editBoxGeoeffnet = true
	local yes = false
	local counter = 0
	--local rec_Table = {...}
	local editbox = guiCreateEdit(x,y,w,h, text, false)
	if zensiert == true then
		guiEditSetMasked(editbox, true) 
	end
	guiSetAlpha(editbox, 0)
	local function clickFunc(button, state, sx, sy)
		if button == "left" and state == "down" then
			if sx >= x and sx <= x+w and sy >= y and sy <= y+h then
				if yes == false then
					text = ""
					guiSetText(editbox, text)
					yes = true
				end
			end
		end
	end
	addEventHandler("onClientClick", getRootElement(), clickFunc)
	local function showEditBox()
		if not isElement(editbox) then
			removeEventHandler("onClientRender", getRootElement(), showEditBox)
			removeEventHandler("onClientClick", getRootElement(), clickFunc)
		else
			local x1,y1 = guiGetPosition(editbox, false)
			local w1,h1 = guiGetSize(editbox, false)
			
			local text31 = ""
			if zensiert == true then
				for i = 1, string.len(guiGetText(editbox)) do
					text31 = text31.."*"
				end
				--outputChatBox(guiGetText(editbox))
			else
				text31 = guiGetText(editbox)
			end
			
			dxDrawRectangle(x1,y1,w1,h1, tocolor(r,g,b, alphas[ids]), true)
			dxDrawText(text31, x1, y1, x1+w1, y1+h1, tocolor(r2, g2, b2, alphas[ids]), groesse, "default", "left", "center", false, false, true, false, true)
			local widht = dxGetTextWidth(text31, groesse, "default")
			dxDrawLine(x1+widht+2, y1+1, x1+widht+2, y1+h1-2, tocolor(255,255,255,255), 2)
			if string.len(guiGetText(editbox)) > anzahl then
				text = string.sub(guiGetText(editbox), 0, -2)
				guiSetText(editbox, text)
			end
		end
	end
	addEventHandler("onClientRender", getRootElement(), showEditBox)
	return editbox
end

function dxCreateWindow(text, id, x,y,w,h, r,g,b,alpha)
	alphas[id] = alpha
	showCursor(true)
	local window = guiCreateWindow(x, y, x, y, "", false)
	guiSetAlpha(window, 0)
	setDxAnimation(1, 0, 210, 0, "InOutQuad", 2000) 
	addEventHandler("onClientRender", getRootElement(), function()
		local ex, ey = getAnimationValue()
		dxSetAlpha(70, ex)
	end)
	local function onWindowRender()
		dxDrawRectangle(x, y+(20*dy/768), w, h-(20*dy/768), tocolor(0, 0, 0, alphas[id]), false)
        dxDrawRectangle(x, y, w, (20*dy/768), tocolor(r,g,b, alphas[id]), false)
        dxDrawText(text,  x, y, x+w, y+(20*dy/768), tocolor(255, 255, 255, alphas[id]), 1.40, "default", "center", "top", false, false, true, false, false)
		if not isElement(window) then
			removeEventHandler("onClientRender", getRootElement(), onWindowRender)
		end
	end
	local closeButt = dxCreateButton( "X", 2.0, 255, 255, 255, x+w-50*dx/1366, y+30*dy/768, 35*dx/1366, 35*dy/768, r,g,b, 1, true, 500)
	addEventHandler("onClientRender", getRootElement(), onWindowRender)
	local function onButtonClick()
		removeEventHandler("onClientGUIClick", closeButt, onButtonClick)
		setDxAnimation(210, 0, 0, 0, "InOutQuad", 2000) 
		local function destroyWindow()
			local ex, ey = getAnimationValue()
			dxSetAlpha(70, ex)
			if ex <= 2 then 
				removeEventHandler("onClientRender", getRootElement(), destroyWindow)
				destroyElement(window)
				destroyElement(closeButt)
				showCursor(false)
			end
		end
		addEventHandler("onClientRender", getRootElement(), destroyWindow)
	end
	addEventHandler("onClientGUIClick", closeButt, onButtonClick)
	return window
end

--dxDrawRectangle(415, 219, 214, 31, tocolor(255, 255, 255, 255), true)
--dxDrawRectangle(647, 219, 140, 31, tocolor(255, 255, 255, 255), true) text, id, groesse, anzahl, x,y,w,h,r,g,b,alp
addCommandHandler("draw", function()
	local state = false
	local wind = dxCreateWindow("112", 70, 395, 173, 521, 374, 199, 141, 17, 1)
	local edit1 = dxDrawEditBox( "test", 9875, 2.0, 14, 415, 219, 214, 31, 199, 141, 17, 1, 255, 255, 255)
	local edit2 = dxCreateButton( "Close", 2.0, 255, 255, 255, 647, 219, 140, 31, 199, 141, 17, 1, true, 866)
	showCursor(true)
	setDxAnimation( 1, 0, 200, 0,"InOutQuad", 2000)
	local function onClientRender()
		local ex, ey = getAnimationValue()
		state = false
		dxSetAlpha( 9875, ex)
		dxSetAlpha( 866, ex)
		if ex <= 0 then
			if isElement(wind) then
				destroyElement(wind)
			end
			showCursor(false)
			destroyElement(edit1)
			destroyElement(edit2)
			removeEventHandler("onClientRender", getRootElement(), onClientRender)
		end
	end
	addEventHandler("onClientRender", getRootElement(), onClientRender)
end)



function dxCreateButton(text, groesse, r, g, b, x, y, w, h, r2, g2, b2, alp, gui, id)
	local ids = id
	if not alp then alp = 255 end
	if not gui then gui = false end
	local state = false
	local button = guiCreateButton(x,y,w,h, "", false)
	alphas[ids] = tonumber(alp)
	local onCursor = false
	guiSetAlpha(button, 0)
	local onRender1 
	local onRender2 
	addEventHandler("onClientMouseEnter", button, function()
		state = true
		onCursor = true
	end)
	addEventHandler("onClientMouseLeave", button, function()
		onCursor = false
		state = false
	end)
	local function onRender1()
		if state == true then
			if alphas[ids] >= 90 then
				alphas[ids] = alphas[ids]-10
			end
		else
			if alphas[ids] <= alp then
				alphas[ids] = alphas[ids]+10
			end
		end	
	end
	addEventHandler("onClientRender", getRootElement(), onRender1)
	setElementData(button, "textSize", groesse)
	local function createDxButton()
		if not isElement(button) then
			removeEventHandler("onClientRender", getRootElement(), createDxButton)
			removeEventHandler("onClientRender", getRootElement(), onRender1)
			--alphas[ids] = nil
		else
			local x1, y1 = guiGetPosition(button, false)
			local w1,h1 = guiGetSize(button, false)
			dxDrawRectangle(x1, y1, w1, h1, tocolor(r2, g2, b2, alphas[ids]), true)
			dxDrawText(text, x1, y1, x1+w1, y1+h1, tocolor(r, g, b, alphas[ids]), getElementData(button, "textSize"), "default", "center", "center", false, false, true, false, false)
			if onCursor == true then
				dxDrawLine(x1, y1, x1+w1, y1, tocolor(255, 255, 255, alphas[ids]), 1, true)
				dxDrawLine(x1, y1+h1, x1+w1, y1+h1, tocolor(255, 255, 255, alphas[ids]), 1, true)
				dxDrawLine(x1+w1, y1, x1+w1, y1+h1, tocolor(255, 255, 255, alphas[ids]), 1, true)
				dxDrawLine(x1, y1, x1, y1+h1, tocolor(255, 255, 255, alphas[ids]), 1, true)
			end
		end
	end
	addEventHandler("onClientRender", getRootElement(), createDxButton)
	return button
end

function buttonSetTextSize(button, size)
	setElementData(button, "textSize", size)
end

function dxSetAlpha(id, alpha)
	alphas[tonumber(id)] = alpha
	alphas[500] = alpha
end




clientDatas = {}


if xmlLoadFile("settings/selfdatas.xml") then

	settingsFile = xmlLoadFile("settings/selfdatas.xml")
else
	settingsFile = xmlCreateFile("settings/selfdatas.xml", "root")
	xmlSaveFile(settingsFile)
end

function setClientData( data, value)
	clientDatas[data] = value
end

function getClientData(data)
	if clientDatas[data] then
	return clientDatas[data]
	else return false end
end

addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), function()
	for i = 1,999 do
		local child = xmlFindChild ( settingsFile, "data"..i, 0 )
		if child then
			clientDatas[xmlNodeGetAttribute(child,"key")] = xmlNodeGetAttribute(child,"value")
		end
	end
end)

function saveClientDatas()
	local child = xmlFindChild ( settingsFile, "data"..self.id, 0 )
	if not child then
		child = xmlCreateChild(settingsFile, "data"..self.id)
	end
	xmlNodeSetAttribute(child, "x", self.x) xmlNodeSetAttribute(child, "y", self.y) 
	
end

addEventHandler("onClientResourceStop", getResourceRootElement(getThisResource()), function()
	--hud_S = nil
	local id = 0
	settingsFile = xmlLoadFile("settings/selfdatas.xml")
	for i, val in pairs(clientDatas) do
		id = id+1
		local child = xmlFindChild ( settingsFile, "data"..id, 0 )
		if not child then
			child = xmlCreateChild(settingsFile, "data"..id)
		end
		xmlNodeSetAttribute(child, "key", i) xmlNodeSetAttribute(child, "value", val) 
	end
	xmlSaveFile(settingsFile)
	xmlUnloadFile ( settingsFile )
end)

local moov = 0
local object1, object2
local starttime = 0
local endpos = 0
local endtime
local ob1, ob2
local startpos2x, startpos2x, startpos2x = 0, 0, 0
local tutorial = {}
local startposx,startposy,startposz = 0,0,0
local easing1
function smoothCamera(x,y,z,x1,y1,z1,x2,y2,z2,x3,y3,z3,time, easing)
	ob1 = createObject( 1337, x,y,z)
	ob2 = createObject( 1337, x2,y2,z2)
	setElementAlpha(ob1, 0)
	setElementAlpha(ob2, 0)
	starttime = getTickCount()
	endtime = starttime + time
	startposx,startposy,startposz = x,y,z
	startpos2x, startpos2y, startpos2z = x1,y1,z1
	endposx,endposy,endposz = x2,y2,z2
	endpos2x,endpos2y,endpos2z = x3,y3,z3
	easing1 = easing
	addEventHandler("onClientRender", getRootElement(), refreshCamRender)
end
addEvent("smoothCamera", true)
addEventHandler("smoothCamera", getRootElement(), smoothCamera)


addEvent("textToSpeech", true)
function speech(text)
	playSound ("http://translate.google.com/translate_tts?ie=utf-8&tl=de&q="..text)
end
addEventHandler("textToSpeech", getRootElement(), speech)


function refreshCamRender()
	local now = getTickCount()
	local elapsedTime = now - starttime
	local duration = endtime - starttime
	local progress = elapsedTime / duration
	if not easing1 then easing1 = "InOutQuad" end
	local x1, y1, z1 = startposx,startposy,startposz
	local x2, y2, z2 = endposx,endposy,endposz
	local x3, y3, z3 = startpos2x, startpos2y, startpos2z
	local x4, y4, z4 = endpos2x,endpos2y,endpos2z
	local x, y, z = interpolateBetween ( 
		x1, y1, z1,
		x2, y2, z2, 
		progress, easing1)
	local xs, ys, zs = interpolateBetween ( 
		x3, y3, z3,
		x4, y4, z4, 
		progress, easing1)

	setCameraMatrix(x, y, z, xs, ys, zs)
	if now >= endtime then
		removeEventHandler("onClientRender", getRootElement(), refreshCamRender)
	end
end


function removeSmoothCamera()
	removeEventHandler("onClientRender", getRootElement(), refreshCamRender)
end
--[[
starttime44 = {}
endtime44 = {}
local x,y, endx, endy, easing, time = {},{},{},{}, {},{}
function setDxAnimation( x1, y1, endx1, endy1, easing1, time1, id)
	if not id then id = 1 end
	starttime44[id] = getTickCount()
	x[id], y[id], endx[id], endy[id], easing[id], time[id] = x1, y1, endx1, endy1, easing1, time1
	endtime44[id] = starttime44[id]+time[id]
end

function getAnimationValue(id)
		if not id then id = 1 end
		local now = getTickCount()
		local elapsedTime = now - starttime44[id]
		local duration = endtime44[id] - starttime44[id]
		local progress = elapsedTime / duration
		local Sx,Sy = guiGetScreenSize()
		local ex, ey = interpolateBetween(
			x[id], y[id], 0,
			endx[id], endy[id], 0,
			progress, easing[id])
		return ex, ey
end
]]
local screenx, screeny = guiGetScreenSize()
local xs, ys = screenx/1366, screeny/768

function _fadeCamera(rein, zeit, r,g,b)
	local r,g,b = r,g,b
	if not r or not g or not b then
		r,g,b = 0, 0, 0
	end
	if rein == true then
		setDxAnimation(0, 1, 0, screeny/2, "OutBounce",zeit, 55)
		setDxAnimation(0, screeny, 0, screeny/2, "OutBounce", zeit, 56)
		fade_render_func = function()
			local ex,ey = getAnimationValue(55)
			local ex1,ey1 = getAnimationValue(56)
			dxDrawRectangle(0,0,screenx, ey, tocolor(r,g,b,255), true)
			dxDrawRectangle(0,ey1,screenx, screeny, tocolor(r,g,b,255), true)	
		end
		onRender(fade_render_func, true)
	else
		setDxAnimation(0, screeny/2, 0, 1, "OutBounce",zeit, 55)
		setDxAnimation(0, screeny/2, 0, screeny, "OutBounce", zeit, 56)
		setTimer(function() onRender( fade_render_func, false) end, zeit, 1)
	end
end

addEvent("camFade", true)
addEventHandler("camFade", root, _fadeCamera)

function loadingScreenWait()
	_fadeCamera(true, 1000, 0, 0, 0)
	--setTimer(function()
			onRender(drawWaitingWindow, true)
	--end, 500, 1)
	setTimer(function()
		_fadeCamera(false, 1000, 0, 0, 0)
		setTimer(function()
			onRender(drawWaitingWindow, false)
		end, 1000, 1)
	end, 4000, 1)
end
addCommandHandler("scre", loadingScreenWait)

addEvent("loadingScreenWait", true)
addEventHandler("loadingScreenWait", getRootElement(), loadingScreenWait)
local rot = 0

function createLoadingScreen()
	local bildstate = 0
	local renderFunc
	local beendeFunc = function()
		removeEventHandler("onClientRender", getRootElement(), renderFunc)
		_fadeCamera(false, 1500, 0, 0, 0)
	end
	 renderFunc = function()
		bildstate = bildstate+2
		dxDrawImage(405, 479, 558, 152, "files/images/ladeleiste.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
        dxDrawText("Laden...", 465, 531, 905, 591, tocolor(255, 255, 255, 255), 1.40, "diploma", "center", "top", false, false, true, false, false)
		dxDrawImage(455+bildstate, 521, 56, 63, "files/images/inventar/bike.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
		if bildstate >= 400 then
			beendeFunc()
		end
	end
	_fadeCamera(true, 1500, 0, 0, 0)
	setTimer(function()
		addEventHandler("onClientRender", getRootElement(), renderFunc)
	end, 1000, 1)
	--addEventHandler("onClientRender", getRootElement(), renderFunc)
	
end
addCommandHandler("loading", createLoadingScreen)


function drawWaitingWindow()
		rot = rot+5
		local ex1, ey1 = getAnimationValue(55)
		local ex2, ey2 = getAnimationValue(56)
		dxDrawText("Wird geladen", 494*xs, (287*ys-screeny/2+ey1), 892*xs, 373*ys-screeny/2+ey1, tocolor(255, 255, 255, 255), 2.00*xs, "pricedown", "center", "top", false, false, true, false, false)
        dxDrawText("Bitte warten...", 530*xs, 481*ys-screeny/2+ey2, 821*xs, 528*ys-screeny/2+ey2, tocolor(255, 255, 255, 255), 1.80*ys, "default", "center", "top", false, false, true, false, false)
        dxDrawImage(472*xs, 180*ys-screeny/2+ey1, 555*xs, 97*ys, "files/images/logo.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
        dxDrawImage(screenx/2-30, screeny/2-30-screeny/2+ey2, 60, 60, "files/images/sinedings.png", rot, 0, 0, tocolor(255, 255, 255, 255), true)

		--[[dxDrawText("Wird geladen", 494, 287, 892, 373, tocolor(255, 255, 255, 255), 1.50, "pricedown", "center", "top", false, false, true, false, false)
        dxDrawText("Bitte warten...", 530, 481, 821, 528, tocolor(255, 255, 255, 255), 1.80, "default", "center", "top", false, false, true, false, false)
        dxDrawImage(472, 180, 555, 97, ":reallife/files/images/logo.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
        dxDrawImage(600, 318, 136, 123, ":reallife/files/images/sinedings.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)]]
end

function onRender(functio, bool)
	if bool == true then
		addEventHandler("onClientRender", getRootElement(), functio)
	else
		removeEventHandler("onClientRender", getRootElement(), functio)
	end
end

function onClick(functio, bool)
	if bool == true then
		addEventHandler("onClientClick", getRootElement(), functio)
	else
		removeEventHandler("onClientClick", getRootElement(), functio)
	end
end

function onGUIClick(elem, functio, bool)
	if bool == true then
		addEventHandler("onClientGUIClick", elem, functio)
	else
		removeEventHandler("onClientGUIClick", elem, functio)
	end
end

function galpha( gelem, zahl)
	guiSetAlpha(gelem, zahl)
end
pressedKeys = {}

addEventHandler("onClientKey", getRootElement(), function(button, state)
	if state == true then
		pressedKeys[button] = true
	else
		pressedKeys[button] = false
	end
end)


function isKeyPressed(key)
	if not pressedKeys[key] then pressedKeys[key] = false end
	return pressedKeys[key]
end

if getClientData("fps") then
	setFPSLimit(tonumber(getClientData("fps")))
else
	setFPSLimit(40)
end

addCommandHandler("fps", function(cmd, count)
	if tonumber(count) then
		setClientData("fps", count)
		setFPSLimit(count)
		outputChatBox("Dein FPS-Limit wurde auf "..count.." gesetzt.", 0,125,0)
	else infobox("Du musst eine Anzahl angeben!") end
end)


fileDelete("client/client.lua")