local gx,gy = guiGetScreenSize()
local gpx,gpy = 1366,768

dxButton = {} 

function dxButton:createButton(x,y,w,h,r,g,b,a,hr,hg,hb,ha,text,tr,tg,tb,size,callfunc,relative)
	local self = setmetatable({},{__index = self})
	self.activ = true
	if relative == true then
		self.x = x
		self.y = y
		self.w = w
		self.h = h
		self.tx = x
		self.ty = y
		self.tw = w	
		self.th = h	
	else
		self.x = gx*(x/gpx) 
		self.y = gy*(y/gpy)
		self.w = gx*(w/gpx)
		self.h = gy*(h/gpy)
	end
	self.r = r 
	self.g = g 
	self.b = b 
	self.a = a
	self.hr = hr 
	self.hg = hg 
	self.hb = hb
	self.ha = ha
	self.text = text 
	self.tr = tr 
	self.tg = tg 
	self.tb = tb
	self.size = size
	self.callfunc = callfunc
	self.visible = true
	self.render = function() self:onButtonRender() end
	self.click = function(button,state) self:onButtonClick(button,state) end
	addEventHandler("onClientClick",getRootElement(),self.click)
	addEventHandler("onClientRender",getRootElement(),self.render)
	return self
end

function dxButton:onButtonRender()
	if self.activ then
		if self.visible then
			local mr,mg,mb,ma
			if getCursorArea(self.x,self.y,self.w,self.h) then
				mr,mg,mb,ma = self.hr,self.hg,self.hb,self.ha
			else
				mr,mg,mb,ma = self.r,self.g,self.b,self.a
			end
			if shadow then
				dxDrawRectangle(self.x+1,self.y+1,self.w+1,self.h+1,tocolor(0,0,0))
			end 
			dxDrawRectangle(self.x,self.y,self.w,self.h,tocolor(mr,mg,mb,ma))
			dxDrawText(self.text,self.x,self.y,self.w+self.x,self.h+self.y,tocolor(self.tr,self.tg,self.tb,255),self.size,"default-bold","center","center" )
		end
	end
end

function dxButton:onButtonClick(button,state)
	if self.activ then
		if button == "left" and state == "up" then
			if getCursorArea(self.x,self.y,self.w,self.h) then
				triggerEvent(self.callfunc,root)
			end
		end
	end
end

function dxButton:buttonSetVisible (boolean)
	if self.activ then
		self.visible = boolean
	end
end

function dxButton:destroy()
	self.activ = false
	removeEventHandler("onClientRender",getRootElement(),self.render)
	removeEventHandler("onClientRender",getRootElement(),self.click)
	self = nil 
end

dxKeyNot = { 
	'mouse1',
	'mouse2',
	'mouse3',
	'mouse4',
	'mouse5',
	'mouse_wheel_up',
	'mouse_wheel_down',
	'arrow_l',
	'arrow_u',
	'arrow_r',
	'arrow_d',
	'num_0',
	'num_1',
	'num_2',
	'num_3',
	'num_4',
	'num_5',
	'num_6',
	'num_7',
	'num_8',
	'num_9',
	'num_mul',
	'num_add',
	'num_sep',
	'num_sub',
	'num_div',
	'num_dec',
	'num_enter',
	'F1',
	'F2',
	'F3',
	'F4',
	'F5',
	'F6',
	'F7',
	'F8',
	'F9',
	'F10',
	'F11',
	'F12',
	'escape',
	'tab',
	'lalt',
	'ralt',
	'enter',
	'pgup',
	'pgdn',
	'end',
	'home',
	'insert',
	'delete',
	'lshift',
	'rshift',
	'lctrl',
	'rctrl',
	'pause',
	'capslock',
	'scroll',
	';',
	',',
	'-',
	'/',
	'#',
	'=',
	'#',
	'<',
	'^',
	'´'
	--''\''
}

function isAbleKey(key)
	local able = true
	for i,character in ipairs(dxKeyNot) do
		if key == character then
			able = false
		end
	end
	return able 
end

function isAbleToWrite ()
	if not isChatBoxInputActive() and not isConsoleActive() and not isMTAWindowActive() and not isMainMenuActive() then
		return true
	end
end

dxEditbox = {}

function dxEditbox:createEditbox(x,y,w,h,r,g,b,a,password,relative)
	local self = setmetatable({},{__index = self})
	self.activ = true
	self.textactiv = false
	self.shiftactiv = false
	self.altactiv = false
	if relative == true then
		self.x = x 
		self.y = y 
		self.w = w
		self.h = h 		
	else
		self.x = gx*(x/gpx) 
		self.y = gy*(y/gpy)
		self.w = gx*(w/gpx)
		self.h = gy*(h/gpy)
	end
	self.r = r 
	self.g = g 
	self.b = b 
	self.a = a
	self.password = password
	self.text = ""
	self.ptext = ""
	self.click = function(button,state) self:onEditClick(button,state) end
	self.render = function() self:onEditRender() end
	self.key = function(key,state) self:onEditKey(key,state) end
	self.shift = function(key,state) self:onEditShift(key,state) end
	self.rshift = function(key,state) self:onEditShift(key,state) end
	self.alt = function(key,state) self:onEditAlt(key,state) end
	--bindKey("ralt","both",self.alt)
	--bindKey("lshift","both",self.shift)
	--bindKey("rshift","both",self.rshift)
	addEventHandler("onClientKey",getRootElement(),self.key)
	addEventHandler("onClientRender",getRootElement(),self.render)
	addEventHandler("onClientClick",getRootElement(),self.click)
	return self
end

function dxEditbox:onEditShift(key,state)
	if self.activ then
		if state == "down" then
			self.shiftactiv = true
		else
			self.shiftactiv = false
		end
	end
end

function dxEditbox:onEditAlt(key,state)
	if self.activ then
		if state == "down" then
			self.altactiv = true
		else
			self.altactiv = false
		end
	end
end

function dxEditbox:onEditClick(button,state)
	if self.activ then
		if getCursorArea(self.x,self.y,self.w,self.h) then
			self.textactiv = true
			toggleAllControls(false,false,false)
		else
			self.textactiv = false
			toggleAllControls(true,true,true)
		end
	end
end

local alpha = 0
function dxEditbox:onEditRender()
	if self.activ then
		dxDrawRectangle(self.x,self.y,self.w,self.h,tocolor(self.r,self.g,self.b,0))
		dxDrawImage(self.x,self.y,self.w,self.h,":roleplay/images/editbox.png",0)
		alpha = alpha + 10
		if self.textactiv then
			if dxGetTextWidth(self.text,1) <= self.w then
				dxDrawRectangle(self.x+1+self.w/2+dxGetTextWidth(self.text, 1, "default-bold")/2, self.y+4, 1, self.h-8, tocolor(0, 0, 0, alpha), true)
			end
		end
		if #self.text > 0 then
			dxDrawText(self.text,self.x+(self.w/2)-(dxGetTextWidth(self.text, 1, "default-bold")/2),self.y+(self.h/2)-(dxGetFontHeight(1, "default-bold")/2),self.w,self.h,tocolor(0,0,0,255),1,"default-bold")
		end
	end
end

function dxEditbox:onEditKey(key,state)
	if self.activ then
		if self.textactiv then
			if state then
				if isAbleKey(key) then
					if self.password then
						if key == "space" and dxGetTextWidth(self.text, 1, "default-bold" ) <= 7 then
							if dxGetTextWidth(self.text,1,"default-bold") >= self.w - 100 then return end
							if #self.text > 0 then
								return 
							end
						elseif key == "backspace" then
							if #self.text > 0 then
								ssub = string.sub(self.text,1,#self.text - 1)
								self.text = ssub
								self.ptext = ssub
							end
						else
							if key == "space" then return end
							if dxGetTextWidth(self.text,1,"default-bold") >= self.w  - 100 then return end
							if self.shiftactiv then
								key = string.upper(key)
							end
							self.ptext = self.ptext..key
							self.text = self.text.."*"
						end
					else
						if key == "space" and dxGetTextWidth(self.text, 1, "default-bold" ) <= 7 then
							if dxGetTextWidth(self.text,1,"default-bold") >= self.w - 100 then return end
							if #self.text > 0 then
								--self.text = self.text.." "
								--self.ptext = self.ptext.." "
								return
							end
						elseif key == "backspace" then
							if #self.text > 0 then
								ssub = string.sub(self.text,1,#self.text - 1)
								self.text = ssub
								self.ptext = ssub
							end
						else
							if key == "space" then return end
							if dxGetTextWidth(self.text,1,"default-bold") >= self.w - 100 then return end
							if self.altactiv and key == "q" then
								self.ptext = self.ptext.."@"
								self.text = self.text.."@"
								return 
							end
							if self.shiftactiv then
								key = string.upper(key)
							end
							self.text = self.text..key
							self.ptext = self.ptext..key
						end
					end
				end
			end
		end
	end
end

function dxEditbox:getEditText()
	return self.ptext
end

function dxEditbox:setEditboxVisible(state)
	self.activ = state 
end

function dxEditbox:destroy()
	self.activ = false
	self.shiftactiv = false
	self.textactiv = false
	unbindKey("lshift","both",self.shift)
	removeEventHandler("onClientKey",getRootElement(),self.key)
	removeEventHandler("onClientClick",getRootElement(),self.click)
	removeEventHandler("onClientRender",getRootElement(),self.render)
	self = nil
end

infoboxactive = false 

dxInfobox = {}

function dxInfobox:createNew(text,time) 
	if infoboxactive == false then
		local self = setmetatable({},{__index = self})
		infoboxactive = true
		self.text = text
		self.w = w
		self.h = h
		self.r = r 
		self.g = g
		self.b = b
		self.a = a
		self.time = time
		if chat == true then
			self.chat = true
		elseif chat == nil then
			self.chat = false
		end
		if color == nil then
			self.color = tocolor(150,150,150,255)
		end
		self.render = function() self:onInfoboxRender() end
		self.delay = function() self:onTimerDelay() end
		setDxAnimation( gx*(425/gpx), gy*(-100/gpy),gx*(425/gpx),gy*(-5/gpy), "OutBounce", 1500, 6)
		addEventHandler("onClientRender",getRootElement(),self.render)
		setTimer(self.delay,self.time+3000,1)
		setTimer(function()
			self.astate = true 
		end,1500,1)
		setTimer(function()
			self.astate = false
			setDxAnimation( gx*(425/gpx),gy*(-5/gpy),gx*(425/gpx), gy*(-200/gpy), "OutBounce", 1500, 6)
		end,self.time,1)
		return self
	end
end

function dxInfobox:onInfoboxRender()
	local ex,ey = getAnimationValue(6)
	dxDrawImage(ex, ey, gx*( 504/gpx), gy*(151/gpy), ":roleplay/images/infobox.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	if self.astate == true then
		dxDrawText(self.text, gx*(454/gpx), gy*(71/gpy), gx*(901/gpx), gy*(134/gpy), tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "top", false, true, false, false, false)
	end
end

function dxInfobox:onTimerDelay()
	removeEventHandler("onClientRender",getRootElement(),self.render)
	infoboxactive = false
	--if self.chat == false then self = nil return else showChat(true) self = nil end
end

function dxInfoboxTrigger (text,time)
	dxInfobox:createNew(text,time)
end
addEvent("infobox",true)
addEventHandler("infobox",getRootElement(),dxInfoboxTrigger)

dxSlowText = {}

function dxSlowText:createSlowText (text,x,y,w,h,r,g,b,a,position,font,size,shadow,tempo,delay)
	local self = setmetatable({},{__index = self})
	self.text = text
	self.curtext = ""
	self.x = gx*(x/gpx) 
	self.y = gy*(y/gpy)
	self.w = gx*(w/gpx)
	self.h = gy*(h/gpy)
	self.r = r 
	self.g = g
	self.b = b 
	self.a = a 
	self.position = position
	self.font = font 
	self.fontsize = size
	self.shadow = shadow
	self.tempo = tempo
	self.delay = delay
	self.render = function() self:onSlowTextRender() end
	self.nextletter = function(index) self:nextLetter(index) end
	self.destroyletter = function() self:destroyLetter() end
	addEventHandler("onClientRender",getRootElement(),self.render)
	for index = 1, #self.text do 
		setTimer(self.nextletter,index*tempo,1,index)
	end
	setTimer(self.destroyletter,self.delay,1)
	return self
end

function dxSlowText:nextLetter (index)
	self.curtext = string.sub(self.text,1,index)
end

function dxSlowText:onSlowTextRender() 
	dxDrawText(self.curtext,self.x,self.y,self.w,self.h, tocolor(self.r,self.g,self.b,self.a),self.fontsize,self.font,self.position,"center")
end

function dxSlowText:destroyLetter() 
	removeEventHandler("onClientRender",getRootElement(),self.render)
	self = nil 
end

function createSlowText (text,x,y,w,h,r,g,b,a,position,font,size,shadow,tempo,delay)
	dxSlowText:createSlowText (text,x,y,w,h,r,g,b,a,position,font,size,shadow,tempo,delay)
end
addEvent("dxslowtext",true)
addEventHandler("dxslowtext",getRootElement(),createSlowText)

dxWindow = {}

function dxWindow:createWindow (x,y,w,h,r,g,b,a,title,enable)
	local self = setmetatable({},{__index = self})
	self.activ = true 
	self.x = gx*(x/gpx) 
	self.y = gy*(y/gpy)
	self.w = gx*(w/gpx)
	self.h = gy*(h/gpy)
	self.r = r 
	self.g = g 
	self.b = b 
	self.a = a 
	self.enable = enable
	self.title = title
	self.visible = true 
	self.render = function() self:onDxWindowRender() end
	self.click = function(key,state) self:onDxWindowExit(key,state) end
	addEventHandler("onClientRender",root,self.render)
	addEventHandler("onClientClick",root,self.click)
	return self
end

function dxWindow:onDxWindowExit(key,state)

end

function dxWindow:onDxWindowRender() 
	if self.activ then
		if self.visible then 
			dxDrawRectangle(self.x,self.y,self.w,self.h,tocolor(self.r,self.g,self.b,self.a))
			dxDrawText(self.title,self.x+(self.w/2)-(dxGetTextWidth(self.title, 1, "default-bold")/2)+1,self.y,self.w,self.h,tocolor(255,255,255,255),1,"default-bold")
			dxDrawLine(self.x,self.y,self.x+self.w,self.y,tocolor(255,255,255,255))
			dxDrawLine(self.x,self.y+15,self.x+self.w,self.y+15,tocolor(255,255,255,255))
			dxDrawLine(self.x,self.y,self.x,self.y+15,tocolor(255,255,255,255))
			dxDrawLine(self.x+self.w-1,self.y,self.x+self.w-1,self.y+15,tocolor(255,255,255,255))
		end
	end
end


function dxWindow:setWindowVisible(boolean)
	self.visible = boolean
end

function dxWindow:destroy()
	removeEventHandler("onClientRender",root,self.render)
	removeEventHandler("onClientClick",root,self.click)
	self = nil 
end

dxCheckbox = {}

function dxCheckbox:createInstanz ()
	local self = setmetatable({},{__index = self})	
	self.sel = false
	self.activ = true 
	self.visible = true
	self.selectedCheckbox = 0
	self.click = function(key,state) self:onCheckboxClick(key,state) end
	self.render = function() self:onCheckboxRender() end
	addEventHandler("onClientClick",getRootElement(),self.click)
	addEventHandler("onClientRender",root,self.render)
	return self
end

function dxCheckbox:createNewCheckbox(id,x,y,text,r,g,b,a,textpos)
	if self.sel == false then
		self.sel = {}
	end
	local i = id
	self.sel[i] = {}
	if not textpos then
		self.sel[i]["textpos"] = "right"
	else
		self.sel[i]["textpos"] = textpos
	end
	self.sel[i]["text"] = text 
	self.sel[i]["x"] = gx*(x/gpx)
	self.sel[i]["y"] = gy*(y/gpy)
	self.sel[i]["w"] = 20
	self.sel[i]["h"] = 20
	self.sel[i]["r"] = r 
	self.sel[i]["g"] = g 
	self.sel[i]["b"] = b 
	self.sel[i]["a"] = a
end

function dxCheckbox:onCheckboxClick(key,state)
	if self.activ then
		if state == "down" then
			for i,pi in ipairs(self.sel) do 
				if getCursorArea(self.sel[i]["x"],self.sel[i]["y"],self.sel[i]["w"],self.sel[i]["h"]) then
					if self.selectedCheckbox == i then
						self.selectedCheckbox = 0
					else
						self.selectedCheckbox = i 
					end
				end
			end
		end
	end
end

function dxCheckbox:onCheckboxRender()
	if self.activ then
		if self[id] == false then return end
		for i,s in pairs(self.sel) do 
			dxDrawRectangle(self.sel[i]["x"],self.sel[i]["y"],self.sel[i]["w"],self.sel[i]["h"],tocolor(self.sel[i]["r"],self.sel[i]["g"],self.sel[i]["b"],self.sel[i]["a"]))
			if self.sel[i]["textpos"] == "right" then
				dxDrawText(self.sel[i]["text"],self.sel[i]["x"]+self.sel[i]["w"]+2,self.sel[i]["y"]+2,self.sel[i]["w"],self.sel[i]["h"],tocolor(255,255,255,255),1,"default-bold")
			else
				dxDrawText(self.sel[i]["text"],self.sel[i]["x"]-dxGetTextWidth(self.sel[i]["text"],1,"default-bold")-1,self.sel[i]["y"]+2,self.sel[i]["w"],self.sel[i]["h"],tocolor(255,255,255,255),1,"default-bold")
			end
			dxDrawLine(self.sel[i]["x"],self.sel[i]["y"],self.sel[i]["x"]+self.sel[i]["w"],self.sel[i]["y"],tocolor(255,255,255,255))
			dxDrawLine(self.sel[i]["x"],self.sel[i]["y"],self.sel[i]["x"],self.sel[i]["y"]+self.sel[i]["h"],tocolor(255,255,255,255))
			dxDrawLine(self.sel[i]["x"],self.sel[i]["y"]+self.sel[i]["h"],self.sel[i]["x"]+self.sel[i]["w"],self.sel[i]["y"]+self.sel[i]["h"],tocolor(255,255,255,255))
			dxDrawLine(self.sel[i]["x"]+self.sel[i]["w"],self.sel[i]["y"],self.sel[i]["x"]+self.sel[i]["w"],self.sel[i]["y"]+self.sel[i]["h"]+1,tocolor(255,255,255,255))
			if i == self.selectedCheckbox then
				dxDrawLine(self.sel[i]["x"],self.sel[i]["y"],self.sel[i]["x"]+self.sel[i]["w"],self.sel[i]["y"]+self.sel[i]["h"],tocolor(255,255,255,255))
				dxDrawLine(self.sel[i]["x"],self.sel[i]["y"]+self.sel[i]["h"],self.sel[i]["x"]+self.sel[i]["w"],self.sel[i]["y"],tocolor(255,255,255,255))
			end
		end
	end
end

function dxCheckbox:getSelectedCheckbox()
	return self.selectedCheckbox
end

function dxCheckbox:destroy ()
	removeEventHandler("onClientClick",getRootElement(),self.click)
	removeEventHandler("onClientRender",root,self.render)
	self = nil
end

dxGridList = {}

function dxGridList:createInstanz( x, y, w, h )
	self = setmetatable({},{__index = self})
	self.activ = true
	self.item = false
	self.row = false
	self.row = {}
	self.items = 0 
	self.rows = 0
	self.x = gx*(x/gpx) 
	self.y = gy*(y/gpy)
	self.w = gx*(w/gpx)
	self.h = gy*(h/gpy)
	self.render = function() self:onRender() end
	addEventHandler("onClientRender",getRootElement(),self.render)
	return self
end

function dxGridList:addRow ( id, rowname )
	self.rows = self.rows + 1 
	if self.row == false then
		self.row = {}
	end
	self.row[id] = {}
	self.row[id]["rowname"] = rowname
end

function dxGridList:addItem( id, itemname, row )
	self.items = self.items + 1 
	if not self.item then
		self.item = {}
	end
	self.item[id] = {}
	self.item[id]["itemname"] = itemname
end

function dxGridList:onRender()
	if self.activ then
		dxDrawRectangle(self.x,self.y,self.w,self.h,tocolor(0,0,0,150))
		local x1 = math.floor(self.w/10)
		local x2 = self.w-x1
		local x3 = self.x+x2
		dxDrawRectangle(x3,math.floor(self.y+self.h/10),x1,self.h-(self.h/10),tocolor(0,0,0,175))
		dxDrawLine(self.x,math.floor(self.y+self.h/10),self.x+self.w,math.floor(self.y+self.h/10),tocolor(255,255,255,255),2)
		for i,rowindex in pairs(self.row) do 
			local x11 = self.x+( self.w*1.15)
			local y11 = math.floor(self.y+self.h/20)
			local tempi = i
			if i == 1 then
				wert = 0
				tempi = 1 
			else
				tempi = (tempi - 1)*2
				wert = 65
			end
			local x12 = (x11+tempi*wert)
			local x13 = self.x+i*wert
			if x13 < x3 then
				dxDrawText(self.row[i]["rowname"],x12,y11,dxGetTextWidth(self.row[i]["rowname"],1,"default-bold"),dxGetFontHeight(1,"default-bold"),tocolor(255,255,255,255),1,"default-bold","center")
			else
			
			end
		end
	end
end

dxTablist = {}

function dxTablist:createInstanz (x,y,w,h,r,g,b,a,hr,hg,hb,ha,windowed,relative)
	local self = setmetatable({},{__index = self})
	self.activ = true 
	self.r = r 
	self.g = g 
	self.b = b
	self.a = a
	self.hr = hr 
	self.hg = hg
	self.hb = hb
	self.ha = ha 
	self.windowed = windowed
	self.relative = relative
	if relative then
		self.x = x
		self.y = y 
		self.w = w 
		self.h = h
	else
		self.x = gx*(x/gpx) 
		self.y = gy*(y/gpy)
		self.w = gx*(w/gpx)
		self.h = gy*(h/gpy)
	end
	self.curtablist = 0 
	self.render = function() self:onRender() end
	self.click = function(button,state) self:onClick(button,state) end
	addEventHandler("onClientRender",root,self.render)
	addEventHandler("onClientClick",getRootElement(),self.click)
	return self
end

function dxTablist:addTablist(id,title)
	if not self.tablists then
		self.tablists = {}
	end
	self.tablists[id] = {}
	self.tablists[id]["id"] = id
	self.tablists[id]["title"] = title
end

function dxTablist:onRender ()
	if self.activ then
		if self.windowed then
			dxDrawRectangle(self.x,self.y,self.w,self.h,tocolor(self.r,self.g,self.b,self.a))
			dxDrawLine(self.x,self.y,self.x+self.w,self.y,tocolor(255,255,255,255))
			dxDrawLine(self.x,self.y,self.x,self.y+self.h,tocolor(255,255,255,255))
			dxDrawLine(self.x+self.w,self.y,self.x+self.w,self.y+self.h,tocolor(255,255,255,255))
			dxDrawLine(self.x,self.y+self.h,self.x+self.w,self.y+self.h,tocolor(255,255,255,255))
		end
		if self.tablists then
			for i,_ in pairs (self.tablists) do 
				local abzug = 20
				local wert = 100
				if self.relative then
					abzug = abzug / gy 
					wert = wert / gx
				end
				if self.curtablist == self.tablists[i]["id"] then
					dxDrawRectangle(self.x+((i-1)*wert),self.y-abzug,100,20,tocolor(self.r,self.g,self.b,self.a))
				else
					if getCursorArea(self.x+((i-1)*wert),self.y-abzug,100,20) then
						dxDrawRectangle(self.x+((i-1)*wert),self.y-abzug,100,20,tocolor(self.r,self.g,self.b,self.a))
					else
						dxDrawRectangle(self.x+((i-1)*wert),self.y-abzug,100,20,tocolor(self.hr,self.hg,self.hb,self.ha))
					end
				end
				dxDrawText(self.tablists[i]["title"],self.x+((i-1)*wert)+(wert/2)-(dxGetTextWidth(self.tablists[i]["title"], 1, "default-bold")/2)+1,self.y-abzug,100,20,tocolor(255,255,255,255),1,"default-bold","left")
			end
		end
	end
end

function dxTablist:onClick(button,state)
	if self.activ then
		if button == "left" and state == "down" then
			for i,_ in pairs(self.tablists) do
				local abzug = 20
				local wert = 100
				if self.relative then
					abzug = abzug / gy 
					wert = wert / gx
				end
				if getCursorArea(self.x+((i-1)*wert),self.y-abzug,100,20) then
					if self.curtablist ~= i then
						self.curtablist = i 
					end
					break
				end
			end
		end
	end
end

function dxTablist:getCurrentTab ()
	return self.curtablist
end

function dxTablist:setSelectedTablist(tablist)
	if self.tablists[tablist] then
		self.curtablist = tablist
		return true
	else
		return false 
	end
end

function dxTablist:destroy()
	removeEventHandler("onClientRender",root,self.render)
	self = nil 
end

--[[addCommandHandler("tablist",function()
	local tablist = dxTablist:createInstanz(400,400,400,200,0,0,255,175,0,0,255,140,false)
	tablist:addTablist(1,"Titel")
	tablist:addTablist(2,"Titel2")
	tablist:setSelectedTablist(1)
end)]]



fileDelete("class/dx/class.lua")

