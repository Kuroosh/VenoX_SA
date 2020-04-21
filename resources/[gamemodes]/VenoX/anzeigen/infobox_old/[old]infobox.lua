--[[
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




gLabels = {}

local infoBoxes = {}

local _dxDrawImage = dxDrawImage
local function dxDrawImage ( ... )
    local array = { ... }
    array[1] = array[1]*px
    array[2] = array[2]*py
    array[3] = array[3]*px
    array[4] = array[4]*py
    return _dxDrawImage ( unpack ( array ) )
end
function infobox ( text, tts, r, g, b, title )
	if not title then title = "VenoX Reallife Information" end
	infobox_start_func ( text, tts, r, g, b, title )
end

function showInfoText_func ()
	if not gLabels["InfoTextForum"] then
		--gLabels["InfoTextForumShadow"] = guiCreateLabel(10, screenheight-20+1, screenwidth+1, screenheight," Servermenue: F1, Karte: F11, Bei Fragen /report [TEXT] ",false,getRootElement())
		gLabels["InfoTextForum"] = guiCreateLabel(10, screenheight-20, screenwidth, screenheight,"Servermenue: F1, Karte: F11, Bei Fragen /support",false,getRootElement())
		
		if isElement ( gLabels["InfoTextForum"] ) then
			guiLabelSetColor(gLabels["InfoTextForum"],125,20,20)
			--guiLabelSetColor(gLabels["InfoTextForumShadow"],0,0,0)
			guiSetFont(gLabels["InfoTextForum"],"default-bold-small")
			--guiSetFont(gLabels["InfoTextForumShadow"],"default-bold-small")
		end
	end
end
addEvent ( "showInfoText", true )
addEventHandler ( "showInfoText", getRootElement(), showInfoText_func )

function countInfoboxes()
	local count = 0
	for index, key in pairs (infoBoxes) do 
		count = count + 1
	end
	
	return count
end

function getInfoid() 
	local id = 0
	
	for index, key in pairs (infoBoxes) do 
		if index >= id then
			id = index + 1
		end
	end
	
	return id
end

local currentBox = -1
local newBox = -1

function infobox_start_func ( text, timetoshow, r, g, b, title )
	if not title then title = "VenoX Reallife Information" end
	local item = getInfoid() 
	
	if CDN:getReady() then
    	local sound = playSound("sounds/notify.mp3") --Spielt wasted.mp3 vom sounds Ordner ab
	end
	
	--text = string.gsub(text, "\n", " ")
	
	if r == 0 and r ==0 and g == 0 then
		r = 51
		g = 123
		b = 222
	end
	
	if not r then
		r = 51
		g = 123
		b = 222
	end
	
	if r < 0 then r = 0 end
	if g < 0 then g = 0 end
	if b < 0 then b = 0 end
	
	table.insert(infoBoxes, {
		id = item,
		title = title,
		msg = text,
		tick = getTickCount(),
		display = timetoshow,
		color = {r = r, g = g, b = b, a = 170},
		slide = 0,
		slideTo = 0,
		opacity = 0
	})
	
	newBox = item
end
addEvent ( "infobox_start", true )
addEventHandler ( "infobox_start", getRootElement(), infobox_start_func )

local sx, sy = guiGetScreenSize()
local bh = 289 -- BOX HEIGHT
local bw = 332 -- BOX WIDTH
local bx = sx / 2 - bw / 2 -- BOX COORDS
local by = 10 -- BOX COORDS

local tw = bw 
local th = 20

function renderInfobox()
	local boxc = countInfoboxes()
	if boxc <= 0 then return end
	
	dxBoxes = {}
	
	local iterator = 0
	for key, val in pairs(infoBoxes) do 
		if val.color.a <= 0 then
			infoBoxes[key] = nil
		else
			dxBoxes[iterator] = val
			iterator = iterator + 1
		end
	end

	-- DRAW BOXES
	for index, box in pairs(dxBoxes) do 
		local counter = index
		index = countInfoboxes() - 1 - index
		box = dxBoxes[index]
		local opacity = 0
		
		if box.slide <= box.slideTo then
			box.slide = box.slide + 4
		end

		if getTickCount() - box.tick < box.display then
			-- ACTIVE BOXES
		else
			-- ENDING BOXES
			if box.color.a > 0 then
				box.opacity = box.opacity + 2
			end
			opacity = box.opacity 
		end
		
		if box.slideTo ~= (10 + counter * bh) then
			if counter < 3 then
				box.slideTo = 10 + counter * bh
			end
		end
		
		box.color.a = box.color.a - opacity
		if box.color.a < 0 then
			box.color.a = 0
		end
		
		-- LETZTE 3 INFOS
		if counter < 3 then
			local height =  ((counter + 1) * by + box.slide)
			local heightB =  ((counter + 1) * by + box.slide) + 5
			
			-- borders
			--dxDrawLine(bx - 1, height - 1, bx - 1, height + bh + 1, tocolor(0, 0, 0, 255), 1, true)
			dxDrawLine(bx + bw, height - 1, bx + bw, height + bh + 1, tocolor(0, 0, 0, 255), 1, true)
			dxDrawLine(bx, height - 1, bx + bw + 1, height - 1, tocolor(0, 0, 0, 255), 1, true)
			dxDrawLine(bx, height + bh, bx + bw + 1, height + bh, tocolor(0, 0, 0, 255), 1, true)
			
			-- title border
			dxDrawLine(bx, height + th + 10, bx + bw + 1, height + th + 10, tocolor(0, 0, 0, 255), 1, true)

			-- background
			dxDrawRectangle(bx, (counter + 1) * by + box.slide, bw, bh, tocolor(0, 0, 0, box.color.a), true)
			
			-- title bar 
			dxDrawRectangle(bx, (counter + 1) * by + box.slide, bw, th + 10, tocolor(box.color.r, box.color.g, box.color.b, box.color.a), true)
			
			-- title
			dxDrawText(box.title, bx + 10 + 1, heightB + 1, bx + tw - 10 + 1, heightB + th + 1, tocolor(14, 47, 92, 176), 1.00, "default-bold", "center", "center", false, false, true, false, false)
			dxDrawText(box.title, bx + 10, heightB, bx + tw - 10, heightB + th, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, true, false, false)
		
			-- message
			dxDrawText(tostring(box.msg), bx + 10, height + 35, bx + bw - 10, height + bh - 20, tocolor(0, 255, 255, 255), 1.00, "default", "center", "center", false, true, true, false, false)
			dxDrawLine(1024 - 1, 289 - 1, 1024 - 1, 414, tocolor(0, 0, 0, 255), 1, false)
        	dxDrawLine(1356, 289 - 1, 1024 - 1, 289 - 1, tocolor(0, 0, 0, 255), 1, false)
        	dxDrawLine(1024 - 1, 414, 1356, 414, tocolor(0, 0, 0, 255), 1, false)
       		dxDrawLine(1356, 414, 1356, 289 - 1, tocolor(0, 0, 0, 255), 1, false)
       		--background
        	dxDrawRectangle(1024, 289, 332, 125, tocolor(0, 94, 111, 255), false)

        	dxDrawLine(1024 - 1, 289 - 1, 1024 - 1, 309, tocolor(0, 0, 0, 255), 1, false)
        	dxDrawLine(1357, 289 - 1, 1024 - 1, 289 - 1, tocolor(0, 0, 0, 255), 1, false)
        	dxDrawLine(1024 - 1, 309, 1357, 309, tocolor(0, 0, 0, 255), 1, false)
        	dxDrawLine(1357, 309, 1357, 289 - 1, tocolor(0, 0, 0, 255), 1, false)
        	--BackgroundTOP
        	dxDrawRectangle(1024, 289, 333, 20, tocolor(0, 38, 45, 217), false)

        	dxDrawText("Information", 1023, 288, 1356, 309, tocolor(255, 255, 255, 255), 0.70, "bankgothic", "center", "center", false, false, false, false, false)
        	dxDrawLine(1024 - 1, 394 - 1, 1024 - 1, 414, tocolor(0, 0, 0, 255), 1, false)
        	dxDrawLine(1357, 394 - 1, 1024 - 1, 394 - 1, tocolor(0, 0, 0, 255), 1, false)

        	dxDrawLine(1024 - 1, 414, 1357, 414, tocolor(0, 0, 0, 255), 1, false)
       		dxDrawLine(1357, 414, 1357, 394 - 1, tocolor(0, 0, 0, 255), 1, false)
       		--BackgroundBottom
        	dxDrawRectangle(1024, 394, 333, 20, tocolor(0, 38, 45, 217), false)

        	dxDrawText("VenoX - Reallife", 1024, 393, 1357, 414, tocolor(255, 255, 255, 255), 0.70, "bankgothic", "center", "center", false, false, false, false, false)
        	dxDrawImage(1311, 309, 45, 35, ":VenoX/images/self/friend.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        	dxDrawText(tostring(box.msg), 1023, 295, 1356, 394, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)


		end
	end
end
addEventHandler("onClientRender",getRootElement(), renderInfobox)

function showDrawnText_func ( text, timeToShow, r, g, b )
	curDrawedText = text
	curDrawedTextR = tonumber ( r )
	curDrawedTextG = tonumber ( g )
	curDrawedTextB = tonumber ( b )
	addEventHandler ( "onClientRender", getRootElement(), showDrawnText_render )
	setTimer ( function () removeEventHandler ( "onClientRender", getRootElement(), showDrawnText_render ) end, timeToShow, 1 )
end
addEvent ( "showDrawnText", true )
addEventHandler ( "showDrawnText", getRootElement(), showDrawnText_func )

function showDrawnText_render ()
	dxDrawText ( curDrawedText, screenwidth/2-103, screenheight/2-3, screenwidth, screenheight, tocolor ( 0, 0, 0, 255 ), 2.5, "pricedown" )
	dxDrawText ( curDrawedText, screenwidth/2-100, screenheight/2, screenwidth, screenheight, tocolor ( curDrawedTextR, curDrawedTextG, curDrawedTextB, 255 ), 2.5, "pricedown" )
end
]]