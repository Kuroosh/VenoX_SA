local screenx, screeny = guiGetScreenSize()

function vnxElementInsert(tbl,w,id,e)
	local exists
	for k,v in ipairs (tbl) do 
		if v.w == w and v.id == id then
			exists = k
			break
		end
	end
	if exists then
		tbl[exists] = e
	else
		table.insert(tbl,e)
	end
	
	local cx,cy = getCursorPosition()
	cx = cx and cx*screenx or 0
	cy = cy and cy*screeny or 0
	vnxButtonHover(_,_,cx,cy)
end

local rects = {}
function vnxDrawRectangle(w,id,x,y,sx,sy,c)
	local tbl = {w=w,id=id,x=x,y=y,sx=sx,sy=sy,c=c}
	vnxElementInsert(rects,w,id,tbl)
end

function test()
	outputChatBox("123")
end

local buttons = {}
function vnxDrawButton(w,id,t,x,y,sx,sy,func)
	local tbl = {w=w,id=id,t=t,x=x,y=y,sx=sx,sy=sy,func=func}
	vnxElementInsert(buttons,w,id,tbl)
end

local buttonsColored = {}
function vnxDrawButtonColored(w,id,t,x,y,sx,sy,c,hc,tc,thc,sc,sch,func)
	local tbl = {w=w,id=id,t=t,x=x,y=y,sx=sx,sy=sy,c=c,hc=hc,tc=tc,thc=thc,sc=sc,sch=sch,func=func}
	vnxElementInsert(buttonsColored,w,id,tbl)
end

local schliessen = {}
function vnxDrawSchliessen(w,id,t,x,y,sx,sy,func)
	local tbl = {w=w,id=id,t=t,x=x,y=y,sx=sx,sy=sy,func=func}
	vnxElementInsert(schliessen,w,id,tbl)
end


local windows = {}
function vnxDrawWindow(w,id,t,x,y,sx,sy,func)
	local tbl = {w=w,id=id,t=t,x=x,y=y,sx=sx,sy=sy}
	vnxElementInsert(windows,w,id,tbl)
	local tbl = {w=w,id="close",t="X",x=x+sx-25,y=y+5,sx=20,sy=20, bc = tocolor(255, 255, 255, 0),func=func}
	vnxElementInsert(schliessen,w,"close",tbl)
	if #windows == 1 then
		if isPedInVehicle(getLocalPlayer()) then
			toggleControl("fire",false)
			toggleControl("next_weapon",false)
			toggleControl("previous_weapon",false)
			toggleControl("forwards",false)
			toggleControl("backwards",false)
			toggleControl("left",false)
			toggleControl("right",false)
			toggleControl("zoom_in",false)
			toggleControl("zoom_out",false)
			toggleControl("change_camera",false)
			toggleControl("jump",false)
			toggleControl("sprint",false)
			toggleControl("look_behind",false)
			toggleControl("crouch",false)
			toggleControl("action",false)
			toggleControl("walk",false)
			toggleControl("aim_weapon",false)
			toggleControl("conversation_yes",false)
			toggleControl("conversation_no",false)
			toggleControl("group_control_forwards",false)
			toggleControl("group_control_back",false)
			toggleControl("enter_exit",false)
			
			toggleControl("vehicle_left",false)
			toggleControl("vehicle_right",false)
			toggleControl("steer_forward",false)
			toggleControl("steer_back",false)
			toggleControl("accelerate",false)
			toggleControl("brake_reverse",false)
			toggleControl("radio_next",false)
			toggleControl("radio_previous",false)
			toggleControl("radio_user_track_skip",false)
			toggleControl("horn",false)
			toggleControl("sub_mission",false)
			toggleControl("handbrake",false)
			toggleControl("vehicle_look_left",false)
			toggleControl("vehicle_look_right",false)
			toggleControl("vehicle_look_behind",false)
			toggleControl("vehicle_mouse_look",false)
			toggleControl("special_control_left",false)
			toggleControl("special_control_right",false)
			toggleControl("special_control_down",false)
			toggleControl("special_control_up",false)
		else
		toggleAllControls(false)
		toggleControl("radar",true)
		end
	end
end



function vnxGetWindows()
	return windows
end

local images = {}
function vnxDrawImage(w,id,x,y,sx,sy,f,func)
 	local tbl = {w=w,id=id,x=x,y=y,sx=sx,sy=sy,f=f,func=func}
	vnxElementInsert(images,w,id,tbl)
end

local imagesections = {}
function vnxDrawImageSection(w,id,x,y,sx,sy,sex,sey,sesx,sesy,f,func)
	local tbl = {w=w,id=id,x=x,y=y,sx=sx,sy=sy,f=f,sex=sex,sey=sey,sesx=sesx,sesy=sesy,func=func}
	vnxElementInsert(imagesections,w,id,tbl)
end


local gridlists = {}
local gridlists_rowHeight = dxGetFontHeight(1,"default")
function vnxDrawGridlist(w,id,x,y,sx,sy,col,row,func)
	local tbl = {w=w,id=id,x=x,y=y,sx=sx,sy=sy,maxr=math.floor(sy/gridlists_rowHeight)-1,col=col,row=row,sel=0,scrol=1,ts=0,te=0,func=func}
	vnxElementInsert(gridlists,w,id,tbl)
end


function vnxGetGridlistItems(w,id)
	local items = {}
	for k,v in ipairs (gridlists) do
		if v.w == w and v.id == id then
			items = v.row
			break
		end
	end
	return items
end

function vnxGetGridlistSelectedItem(w,id)
	local item = {}
	for k,v in ipairs (gridlists) do
		if v.w == w and v.id == id then
			item = v.row[v.sel] or {}
			break
		end
	end
	return item
end

function vnxSortGridlist(w,id,i,desc)
	local tbl = {}
	local c
	for k,v in ipairs (gridlists) do
		if v.w == w and v.id == id then
			tbl = v.row
			c = k
			break
		end
	end
	table.sort(tbl,
		function (w1,w2)
			if w1 and w2 and w1[i] and w2[i] and (((w1[i] < w2[i]) and not desc) or w1[i] > w2[i]) then
				return true
			end
		end
	)
	gridlists[c].row = tbl
end


local selectbox = {}
local selectbox_rowHeight = dxGetFontHeight(1,"default")
function vnxDrawSelectbox(w,id,x,y,sx,sy,items,maxr,func)
	local tbl = {w=w,id=id,x=x,y=y,sx=sx,sy=20,items=items,maxr=maxr,sel=0,scrol=1,open=false,func=func}
	vnxElementInsert(selectbox,w,id,tbl)
end

function vnxSelectboxGetSelected(w,id)
	local item
	for _,v in pairs (selectbox) do 
		if v.w == w and v.id == id then
			item = v.items[v.sel]
			break
		end
	end
	return item
end

local scrollbar = {}
function vnxDrawScrollbar(w,id,x,y,sx,sy,c,maxc,func)
	local tbl = {w=w,id=id,x=x,y=y,sx=sx,sy=sy,c=c,maxc=maxc,func=func}
	vnxElementInsert(scrollbar,w,id,tbl)
end

function vnxScrollbarGetPosition(w,id)
	local pos
	for _,v in pairs (scrollbar) do 
		if v.w == w and v.id == id then
			pos = v.c
			break
		end
	end
	return pos
end

function vnxScrollbarSetPosition(w,id,p)
	for _,v in pairs (scrollbar) do 
		if v.w == w and v.id == id then
			if p > 0 and p < v.maxc then
				v.c = p 
			end
			break
		end
	end
end

local edits = {}
function vnxDrawEdit(w,id,t,x,y,sx,click,del,func)
	local tbl = {w=w,id=id,t=t,x=x,y=y,sx=sx,click=click,del=del,onEditFunc = func,sel=false,car=#t,carshow=0}
	vnxElementInsert(edits,w,id,tbl)
end


function vnxSetEditMasked(w,id,state)
	local text = ""
	for k,v in ipairs (edits) do
		if v.w == w and v.id == id then
			v.masked = state
			return true
		end
	end
end

function vnxSetEditSelected(w,id,state)
	local text = ""
	for k,v in ipairs (edits) do
		if v.w == w and v.id == id then
			v.sel = state
			return true
		end
	end
end

function vnxGetEditText(w,id)
	local text = ""
	for k,v in ipairs (edits) do
		if v.w == w and v.id == id then
			text = v.t
			break
		end
	end
	return text
end

function vnxSetEditText(w,id, text)
	for k,v in ipairs (edits) do
		if v.w == w and v.id == id then
			v.t = text
			if v.onEditFunc then
				loadstring("return "..v.onEditFunc)()(v.t)
			end
			break
		end
	end
	return text
end

function vnxEditInput(char)
	for _,v in pairs (edits) do 
		if v.sel then
			if v.sell then
				v.t = ""
				v.sell = false
			end				
			local txt = string.sub(v.t,0,v.car)..char..string.sub(v.t,v.car+1,#v.t)
			v.t = txt
			v.car = v.car+#char
			if v.onEditFunc then
				loadstring("return "..v.onEditFunc)()(v.t)
			end
		end
	end
end
addEventHandler("onClientCharacter", getRootElement(), vnxEditInput)

addEventHandler("onClientKey", getRootElement(), 
	function(key,press)
		if press then
			if key == "x" or key == "c" or key == "a" or key == "v" or key == "backspace" or key == "delete" then
				vnxEditInputSpecial(key)
			elseif getElementData(getLocalPlayer(),"loggedin") then
				local sel
				for _,v in pairs (edits) do 
					if v.sel then
						sel = true
						break
					end
				end
				if sel then
					cancelEvent(true)
				end
			end
		end
	end
)

function vnxEditInputSpecial(char)
	if char ~= "enter" then
		for _,v in pairs (edits) do  
			local w = v.w
			local id = v.id
			if v.sel then
				if (getKeyState("lctrl") or getKeyState("rctrl")) and getKeyState("v") then
					if v.sell then
						v.t = ""
						v.sell = false
					end	
					local ed = guiCreateEdit(0,0,0,0,"",false)
					guiBringToFront(ed)
					setTimer(
						function()
							char = guiGetText(ed)
							local txt = string.sub(v.t,0,v.car)..char..string.sub(v.t,v.car+1,#v.t)
							v.t = txt
							v.car = v.car+#char
							destroyElement(ed)
						end
					,50,1)
				elseif (getKeyState("lctrl") or getKeyState("rctrl")) and getKeyState("x") then
					v.sell = false
					setClipboard(v.t)
					v.t = ""
				elseif (getKeyState("lctrl") or getKeyState("rctrl")) and getKeyState("c") then
					v.sell = false
					setClipboard(v.t)
				elseif (getKeyState("lctrl") or getKeyState("rctrl")) and getKeyState("a") then
					v.sell = true
				elseif char == "backspace" then
					if v.sell then
						v.t = ""
						v.sell = false
					end
					if v.car > 0 then
						v.t = string.sub(v.t,0,v.car-1)..string.sub(v.t,v.car+1,#v.t)					
						v.carshow = 0
						v.car = v.car-1
						if isTimer(_G["editTimerBspc"..w..id]) then
							killTimer(_G["editTimerBspc"..w..id])
						end
						_G["editTimerBspc"..w..id] = setTimer(
							function()
								_G["editTimerBspc"..w..id] = setTimer(
									function()
										if v.car > 0 and getKeyState("backspace") then
											v.t = string.sub(v.t,0,v.car-1)..string.sub(v.t,v.car+1,#v.t)
											v.carshow = 0
											v.car = v.car-1
											if v.onEditFunc then
												loadstring("return "..v.onEditFunc)()(v.t)
											end											
										else
											killTimer(_G["editTimerBspc"..w..id])
										end
									end
								,100,0)
							end
						,1000,1)
					end
					if v.onEditFunc then
						loadstring("return "..v.onEditFunc)()(v.t)
					end		
				elseif char == "delete" then
					if v.sell then
						v.t = ""
						v.sell = false
					end	
					if v.car < #v.t then
						v.t = string.sub(v.t,0,v.car)..string.sub(v.t,v.car+2,#v.t)				
						v.carshow = 0
						if isTimer(_G["editTimerDel"..w..id]) then
							killTimer(_G["editTimerDel"..w..id])
						end
						_G["editTimerDel"..w..id] = setTimer(
							function()
								_G["editTimerDel"..w..id] = setTimer(
									function()
										if v.car < #v.t and getKeyState("delete") then
											v.t = string.sub(v.t,0,v.car-1)..string.sub(v.t,v.car+1,#v.t)
											v.carshow = 0
										if v.onEditFunc then
											loadstring("return "..v.onEditFunc)()(v.t)
										end
										else
											killTimer(_G["editTimerDel"..w..id])
										end
									end
								,100,0)
							end
						,1000,1)
					end
					if v.onEditFunc then
						loadstring("return "..v.onEditFunc)()(v.t)
					end		
				end
			end
		end
	end
end

local texts = {}
function vnxDrawText(w,id,t,x,y,sx,sy,c,s,f,ax,ay)
	local txt = {}
	local r = 1	
	local s = not s and 1 or s
	local ax = not ax and "left" or ax
	local ay = not ay and "top" or ay
	local c = not c and tocolor(255,255,255,255) or c
	local f = not f and "default" or f
	txt[r] = ""
	for _,v in ipairs (split(t,"\n")) do 
		for _,w in ipairs (split(v," ")) do 
			if dxGetTextWidth(txt[r]..w,s,f) <= sx-10 then
				txt[r] = txt[r].." "..w
			elseif dxGetTextWidth(w,s,f) <= sx-10 then
				r = r + 1
				txt[r] = " "..w
			else
				txt[r] = txt[r].." "
				for i = 1, #w do 
					if dxGetTextWidth(txt[r]..string.sub(w,i,i),s,f) <= sx-10 then
						txt[r] = txt[r]..string.sub(w,i,i)
					else
						r = r + 1
						txt[r] = " "..string.sub(w,i,i)
					end
				end
			end
		end
		r = r + 1
		txt[r] = ""
	end
	local t = {}
	for i = 1, #txt-1 do 
		t[i] = string.sub(txt[i],2)
	end
	local tbl = {w=w,id=id,t=t,x=x,y=y,sx=sx,sy=sy,c=c,s=s,ax=ax,ay=ay,maxr=math.floor(sy/dxGetFontHeight(s,f)),s=s,f=f,scrol=1}
	vnxElementInsert(texts,w,id,tbl)
end


function vnxRemoveElementFromTable(tbl,w,id)
	local i = 1
	while tbl[i] do 
		if tbl[i].w == w and (not id or tbl[i].id == id) then
			table.remove(tbl,i)
		else
			i = i + 1
		end
	end
end
addEvent( "vnxRemoveElementFromTable", true )
addEventHandler("vnxRemoveElementFromTable",getRootElement(),vnxRemoveElementFromTable)

function vnxDestroyWindow(w)
	if not w then
		rects = {}
		buttons = {}
		buttonsColored = {}
		schliessen = {}
		texts = {}
		edits = {}
		images = {}
		imagesections = {}
		gridlists = {}
		selectbox = {}
		scrollbar = {}
		windows = {}
	else
		vnxRemoveElementFromTable(rects,w)
		vnxRemoveElementFromTable(buttons,w)
		vnxRemoveElementFromTable(buttonsColored,w)
		vnxRemoveElementFromTable(schliessen,w)
		vnxRemoveElementFromTable(texts,w)
		vnxRemoveElementFromTable(edits,w)
		vnxRemoveElementFromTable(images,w)
		vnxRemoveElementFromTable(imagesections,w)
		vnxRemoveElementFromTable(gridlists,w)
		vnxRemoveElementFromTable(selectbox,w)
		vnxRemoveElementFromTable(scrollbar,w)
		vnxRemoveElementFromTable(windows,w)
	end
	if #windows == 0 then
		toggleControl("chatbox",true)
		if not getElementData(getLocalPlayer(),"getazert") and not getElementData(getLocalPlayer(),"grabbed") and not getElementData(getLocalPlayer(),"leashed") then
			if isPedInVehicle(getLocalPlayer()) then
			toggleControl("fire",true)
			toggleControl("next_weapon",true)
			toggleControl("previous_weapon",true)
			toggleControl("forwards",true)
			toggleControl("backwards",true)
			toggleControl("left",true)
			toggleControl("right",true)
			toggleControl("zoom_in",true)
			toggleControl("zoom_out",true)
			toggleControl("change_camera",true)
			toggleControl("jump",true)
			toggleControl("sprint",true)
			toggleControl("look_behind",true)
			toggleControl("crouch",true)
			toggleControl("action",true)
			toggleControl("walk",true)
			toggleControl("aim_weapon",true)
			toggleControl("conversation_yes",true)
			toggleControl("conversation_no",true)
			toggleControl("group_control_forwards",true)
			toggleControl("group_control_back",true)
			toggleControl("enter_exit",true)
			
			toggleControl("vehicle_left",true)
			toggleControl("vehicle_right",true)
			toggleControl("steer_forward",true)
			toggleControl("steer_back",true)
			toggleControl("accelerate",true)
			toggleControl("brake_reverse",true)
			toggleControl("radio_next",true)
			toggleControl("radio_previous",true)
			toggleControl("radio_user_track_skip",true)
			toggleControl("horn",true)
			toggleControl("sub_mission",true)
			toggleControl("handbrake",true)
			toggleControl("vehicle_look_left",true)
			toggleControl("vehicle_look_right",true)
			toggleControl("vehicle_look_behind",true)
			toggleControl("vehicle_mouse_look",true)
			toggleControl("special_control_left",true)
			toggleControl("special_control_right",true)
			toggleControl("special_control_down",true)
			toggleControl("special_control_up",true)

			else
			toggleAllControls(true)
			end
			toggleControl("enter_exit",true)
		end
		if (getElementData(getLocalPlayer(),"Knastzeit") or 0) >= 1 then
			toggleControl("fire",false)
			toggleControl("next_weapon",false)
			toggleControl("previous_weapon",false)
			toggleControl("jump",false)
			toggleControl("action",false)
			toggleControl("enter_exit",false)
			toggleControl("enter_passenger",false)
		end
	end
end
addEvent( "vnxDestroyWindow", true )
addEventHandler("vnxDestroyWindow",getRootElement(),vnxDestroyWindow)

local dxfont0_drugs = dxCreateFont("fonts/drugs.ttf", 15)
local dxfont1_roboto = dxCreateFont("fonts/Roboto-Thin.ttf", 10)
--local xfont = dxCreateFont(":venox/fonts/x_font.ttf", 20)

function vnxDrawElements()
	for _,v in ipairs (windows) do 	
		dxDrawRectangle(v.x,v.y,v.sx,v.sy,tocolor(0,0,0,160)) --Body
		dxDrawRectangle(v.x,v.y,v.sx,30,tocolor(0,0,0,120)) --Header 
		dxDrawRectangle(v.x,v.y,v.sx,-5,tocolor(0, 105, 145, 255)) --Header 
		dxDrawText(v.t,v.x,v.y,v.x+v.sx,v.y+30,tocolor(255,255,255,255), 1, dxfont0_drugs,"center","center")
	end
	for _,v in ipairs (rects) do 
		dxDrawRectangle(v.x,v.y,v.sx,v.sy,v.c)
	end
	for _,v in ipairs (images) do 
		dxDrawImage(v.x,v.y,v.sx,v.sy,v.f..".png")
	end
	for _,v in ipairs (imagesections) do 
		if drawImage(v.f) then
			dxDrawImageSection(v.x,v.y,v.sx,v.sy,v.sex,v.sey,v.sesx,v.sesy,v.f..".png")
		else
			dxDrawRectangle(v.x,v.y,v.sx,v.sy,tocolor(0,0,0,255))
			dxDrawText("Bild wird\nheruntergeladen",v.x,v.y,v.x+v.sx,v.y+v.sy,tocolor(255,255,255,255),1, dxfont0_drugs,"center","center",true)
		end
	end
	for _,v in ipairs (gridlists) do 
		dxDrawRectangle(v.x,v.y,v.sx,v.sy,tocolor(0,0,0,120))
		dxDrawRectangle(v.x,v.y,v.sx,gridlists_rowHeight,tocolor(0,0,0,150))
		local cpos = {[1]=v.x+10}
		for i,c in ipairs (v.col) do 
			dxDrawText(c[1],cpos[i],v.y,cpos[i]+c[2],v.y+gridlists_rowHeight,tocolor(255,255,255,255),1, dxfont1_roboto,"left","center",true)
			cpos[i+1] = cpos[i]+c[2]
		end
		local rpos = v.y+gridlists_rowHeight
		for i = v.scrol, v.scrol+v.maxr-1 do
			if v.row[i] then
				if v.sel == i then
					dxDrawRectangle(v.x,v.y+gridlists_rowHeight*(1+i-v.scrol),v.sx,gridlists_rowHeight,tocolor(0,105,145,50))
				elseif i%2 == 0 then
					dxDrawRectangle(v.x,v.y+gridlists_rowHeight*(1+i-v.scrol),v.sx,gridlists_rowHeight,tocolor(0,0,0,50))
				end
				for c,t in ipairs (v.row[i]) do 
					local txt = t
					local color = tocolor(255,255,255,255)
					local co = v.row[i].color
					if co then
						local r = tonumber("0x"..co:sub(1,2))
						local g = tonumber("0x"..co:sub(3,4))
						local b = tonumber("0x"..co:sub(5,6))
						color = tocolor(r,g,b,255)
					end
					dxDrawText(txt,cpos[c],v.y+gridlists_rowHeight*(1+i-v.scrol),cpos[c+1],v.y+gridlists_rowHeight*(2+i-v.scrol),color,1,"default","left","center",true)
				end
			else
				break
			end
		end
		if #v.row > v.maxr then
			local y = v.y+gridlists_rowHeight
			local sy = v.maxr*gridlists_rowHeight
			dxDrawRectangle(v.x+v.sx-10,y,10,sy,tocolor(0,0,0,255))
			local y = y+1
			local sy = sy-2
			local y = y+(sy)/#v.row*(v.scrol-1)
			local sy = (sy)/#v.row*v.maxr
			dxDrawRectangle(v.x+v.sx-10+1,y,8,sy,tocolor(0,150,210,255))
			
			local cx,cy = getCursorPosition()
			if cx and cy then
				local cx = screenx*cx
				local cy = screeny*cy
				if cx >= v.x+v.sx-10+1 and cx <= v.x+v.sx and cy >= v.y+gridlists_rowHeight and cy <= v.y+v.sy then
					if getKeyState("mouse1") then
						--local nc = y+1 --(cx-v.x-v.sy-v.sy/2)*v.maxr/l
						--v.scroll = v.scroll < 0 and 0 or v.scroll > v.maxr and v.maxr or nc
						if y > cy then
							dxScrollbarScroll("mouse_wheel_up")
						elseif y+sy < cy then
							dxScrollbarScroll("mouse_wheel_down")
						end
					end
				end
			end
		end
	end
	for k,v in ipairs (selectbox) do 
		dxDrawRectangle(v.x,v.y,v.sx,v.sy,tocolor(0,0,0,175))
		local si = v.sel and v.items[v.sel] or ""
		dxDrawText(si,v.x+2,v.y+2,v.x+v.sx-2-v.sy,v.y+v.sy-2,tocolor(255,255,255,255),1,"default","center","center",true)
		dxDrawRectangle(v.x+v.sx-v.sy+2,v.y+2,v.sy-4,v.sy-4,tocolor(0,0,0,100))
		dxDrawText("▼",v.x+v.sx-v.sy+2,v.y+2,v.x+v.sx-2,v.y+v.sy-2,tocolor(0,150,200,255),1,"default","center","center",true)
		if v.open then
			local h = dxHet
			dxDrawRectangle(v.x,v.y+v.sy,v.sx,selectbox_rowHeight*v.maxr,tocolor(0,0,0,150))
			for i = v.scrol, v.scrol+v.maxr-1 do
				if v.items[i] then
					local color
					if v.sel == i then
						color = tocolor(0,150,210,100)
					elseif i%2 == 0 then
						color = tocolor(0,0,0,50)
					end
					if color then
						dxDrawRectangle(v.x,v.y+v.sy+selectbox_rowHeight*(i-v.scrol),v.sx,selectbox_rowHeight,color)
					end
					dxDrawText(v.items[i],v.x,v.y+v.sy+selectbox_rowHeight*(i-v.scrol),v.x+v.sx,v.y+v.sy+selectbox_rowHeight*(1+i-v.scrol),tocolor(255,255,255,255),1,"default","center","center",true)
				end
			end
			if #v.items > v.maxr then
				local y = v.y+v.sy
				local sy = v.maxr*selectbox_rowHeight
				dxDrawRectangle(v.x+v.sx-10,y,10,sy,tocolor(0,0,0,255))
				local y = y+1
				local sy = sy-2
				local y = y+(sy)/#v.items*(v.scrol-1)
				dxDrawRectangle(v.x+v.sx-10+1,y,8,(sy)/#v.items*v.maxr,tocolor(0,150,210,255))
			end
		end
	end
	for _,v in ipairs (edits) do 
		local t = v.t
		local x = v.x
		local y = v.y
		local sx = v.sx
		local sy = v.sy
		local del = v.del
		v.carshow = (v.carshow+0.02)%1
		if not v.sel then
			dxDrawRectangle(x,y,sx,20,tocolor(150,150,150,255)) --editBox?
		else
			dxDrawRectangle(x,y,sx,20,tocolor(200,200,200,255))
			dxDrawRectangle(x, y, sx, -2, tocolor(0, 105, 145, 200), false)
			dxDrawRectangle(x, y-2, sx, 1, tocolor(56, 56, 56, 100), false)

			dxDrawRectangle(x, y+20, sx, 2, tocolor(0, 105, 145, 200), false)
			dxDrawRectangle(x, y+21, sx, 1, tocolor(56, 56, 56, 100), false)

			dxDrawRectangle(x-1, y-1, 2, 21, tocolor(0, 105, 145, 200), false)
			dxDrawRectangle(x-1, y-1, 1, 21, tocolor(56, 56, 56, 100), false)

			dxDrawRectangle(x+sx, y-1, 2, 21, tocolor(0, 105, 145, 200), false)
			dxDrawRectangle(x+sx, y-1, 1, 21, tocolor(56, 56, 56, 100), false)
		end
		--dxDrawLine(x-1,y,x+sx,y,tocolor(0,105,145,150),1)

		--dxDrawLine(66 - 1, 656, 346, 656, tocolor(255, 254, 254, 255), 1, false)
        --dxDrawLine(346, 656, 346, 655 - 1, tocolor(255, 254, 254, 255), 1, false)


		local txt = ""
		local ts = 0
		local te = v.car
		for c = 0,v.car-1 do 
			local i = v.car-c
			if dxGetTextWidth(txt..string.sub(t,i,i),1,"default") <= sx-4 then
				txt = string.sub(t,i,i)..txt
				ts = i
			else
				break
			end
		end
		if dxGetTextWidth(txt,1,"default") < sx-4 and #txt < #v.t then
			for i = v.car+1,#v.t do
				if dxGetTextWidth(txt..string.sub(t,i,i),1,"default") <= sx-4 then
					txt = txt..string.sub(t,i,i)
					te=i
				else
					break
				end
			end
		end
		v.ts = ts
		v.te = te
		if v.sell and v.click == true then
			dxDrawRectangle(x+2,y+2,dxGetTextWidth(txt,1,"default"),20-4,tocolor(0,105,145,255)) --EDIT Box , Markierung 
		end
		if v.masked then
			txt = string.rep("*",#txt)
		end
		if v.sel then
			dxDrawText(txt,x+2,y,x+sx-4,y+20,tocolor(50,50,50,255),1, "default","left","center",true)
		else 
			dxDrawText(txt,x+2,y,x+sx-4,y+20,tocolor(0,0,0,255),1, "default","left","center",true)
		end
		if v.carshow < 0.5 and v.sel then
			local x = x+2+dxGetTextWidth(string.sub(txt,1,v.car),1,"default")
			dxDrawLine(x,y+2,x,y+20-3,tocolor(0,150,200,255),1)
		end
	end
	for _,v in ipairs (texts) do
		local t = v.t
		local x = v.x
		local y = v.y
		local sx = v.sx
		local sy = v.sy
		local f = v.f
		local txt = ""
		for i = v.scrol, v.scrol+v.maxr-1 do
			if t[i] then
				txt = txt..t[i].."\n"
			else
				break
			end
		end
		dxDrawText(txt,x,y,x+sx,y+sy,v.c,v.s, v.f,v.ax,v.ay,true)
		if #v.t > v.maxr then
			dxDrawRectangle(x+sx-10,y,10,sy,tocolor(0,0,0,255))
			local y = y+1
			local sy = sy-2
			local y = y+(sy)/#v.t*(v.scrol-1)
			dxDrawRectangle(v.x+v.sx-10+1,y,8,(sy)/#v.t*v.maxr,tocolor(0,150,200,255))
		end
	end

	for _,v in ipairs (schliessen) do
		local t = v.t
		local x = v.x
		local y = v.y
		local sx = v.sx
		local sy = v.sy
		local bc = v.bc
		--dxDrawRectangle(x,y,sx,sy,bc or tocolor(0,105,145,255))
		--dxDrawText(t,x,y,x+sx,y+sy,c,1.6, "default","center","center",true)
		local bc = v.bc
		local c = tocolor(255,255,255,200)
		local c_2 = tocolor(255,0,0,220)
		if bc then
			--dxDrawText(t,x,y,x+sx,y+sy,c_2,1.6, "default","center","center",true)
			dxDrawImage(x-5,y-5,sx+10,sy+10,":VenoX/images/dx/close.png", 0, 0, 0, tocolor(255, 0, 0, 255), false)
			--dxDrawRectangle(x+sx/2-sx/2*bc,y+sy/2-sy/2*bc,sx*bc,sy*bc, tocolor(255,255,255,255))
			--dxDrawText(t,x,y,x+sx,y+sy,c,1,"default","center","center",true)
			v.bc = bc+0.1 <= 1 and bc+0.1 or 1
			c = tocolor(255-0*bc,0-0*bc,0-0*bc,255)
		else 
			dxDrawImage(x-5,y-5,sx+10,sy+10, ":VenoX/images/dx/close.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		end
		--[[if bc then
			dxDrawRectangle(x+sx/2-sx/2*bc,y+sy/2-sy/2*bc,sx*bc,sy*bc, tocolor(255,255,255,255))
			v.bc = bc+0.1 <= 1 and bc+0.1 or 1
			c = tocolor(255-255*bc,255-255*bc,255-255*bc,255)
		end]]
		--[[dxDrawLine(x,y,x+sx-1,y,tocolor(255,255,255,255),1)
		dxDrawLine(x,y+sy-1,x+sx-1,y+sy-1,tocolor(255,255,255,255),1)
		dxDrawLine(x,y,x,y+sy-1,tocolor(255,255,255,255),1)
		dxDrawLine(x+sx-1,y,x+sx-1,y+sy-1,tocolor(255,255,255,255),1)]]
		--dxDrawText(t,x,y,x+sx,y+sy,c,1,"default","center","center",true)
	end

	for _,v in ipairs (buttonsColored) do
		local t = v.t
		local x = v.x
		local y = v.y
		local sx = v.sx
		local sy = v.sy
		local bc = v.bc
		dxDrawRectangle(x,y,sx,sy,v.c)
		--dxDrawRectangle(x,y,sx,sy,bc or tocolor(0,105,145,255))
		local hover = v.hover
		local c = tocolor(255,255,255,255)
		if hover and not bc then
			dxDrawRectangle(x+sx/2-sx/2*hover,y+sy/2-sy/2*hover,sx*hover,sy*hover, v.hc)
			v.hover = hover+0.1 <= 1 and hover+0.1 or 1
			local r, g, b, a = v.thc
			dxDrawText(t,x,y,x+sx,y+sy,v.thc,1, dxfont1_roboto,"center","center",true)
			dxDrawRectangle(x,y,sx,-3,v.sch)
			--tc = dxDrawText(t,x,y,x+sx,y+sy,v.thc,1, dxfont1_roboto,"center","center",true)
			--dxDrawText(t,x,y,x+sx,y+sy,v.thc,1, dxfont1_roboto,"center","center",true)
		else
			--[[if bc then
				dxDrawRectangle(x+sx/2-sx/2*bc,y+sy/2-sy/2*bc,sx*bc,sy*bc, tocolor(255,255,255,255))
				v.bc = bc+0.1 <= 1 and bc+0.1 or 1
				c = tocolor(255-255*bc,255-255*bc,255-255*bc,255)
			end]]
			--[[dxDrawLine(x,y,x+sx-1,y,tocolor(255,255,255,255),1)
			dxDrawLine(x,y+sy-1,x+sx-1,y+sy-1,tocolor(255,255,255,255),1)
			dxDrawLine(x,y,x,y+sy-1,tocolor(255,255,255,255),1)
			dxDrawLine(x+sx-1,y,x+sx-1,y+sy-1,tocolor(255,255,255,255),1)]]
			dxDrawText(t,x,y,x+sx,y+sy,v.tc,1, dxfont1_roboto,"center","center",true)
			dxDrawRectangle(x,y,sx,-3,v.sc)
		end
	end


	for _,v in ipairs (buttons) do
		local t = v.t
		local x = v.x
		local y = v.y
		local sx = v.sx
		local sy = v.sy
		local bc = v.bc
		dxDrawRectangle(x,y,sx,sy,bc or tocolor(0,105,145,255))
		local hover = v.hover
		local c = tocolor(255,255,255,255)
		if hover and not bc then
			dxDrawRectangle(x+sx/2-sx/2*hover,y+sy/2-sy/2*hover,sx*hover,sy*hover, tocolor(255,255,255,255))
			v.hover = hover+0.1 <= 1 and hover+0.1 or 1
			c = tocolor(255-255*hover,255-255*hover,255-255*hover,255)
		end
		--[[if bc then
			dxDrawRectangle(x+sx/2-sx/2*bc,y+sy/2-sy/2*bc,sx*bc,sy*bc, tocolor(255,255,255,255))
			v.bc = bc+0.1 <= 1 and bc+0.1 or 1
			c = tocolor(255-255*bc,255-255*bc,255-255*bc,255)
		end]]
		--[[dxDrawLine(x,y,x+sx-1,y,tocolor(255,255,255,255),1)
		dxDrawLine(x,y+sy-1,x+sx-1,y+sy-1,tocolor(255,255,255,255),1)
		dxDrawLine(x,y,x,y+sy-1,tocolor(255,255,255,255),1)
		dxDrawLine(x+sx-1,y,x+sx-1,y+sy-1,tocolor(255,255,255,255),1)]]
		dxDrawText(t,x,y,x+sx,y+sy,c,1, dxfont1_roboto,"center","center",true)
	end
	for k,v in ipairs (scrollbar) do 
		dxDrawRectangle(v.x,v.y,v.sx,v.sy,tocolor(0,0,0,175))
		dxDrawRectangle(v.x,v.y,v.sy,v.sy,tocolor(0,0,0,175))
		dxDrawRectangle(v.x+v.sx-v.sy,v.y,v.sy,v.sy,tocolor(0,0,0,175))
		dxDrawText("◄",v.x,v.y,v.x+v.sy,v.y+v.sy,tocolor(0,150,210,255),1,"default","center","center",true)
		dxDrawText("►",v.x+v.sx-v.sy,v.y,v.x+v.sx,v.y+v.sy,tocolor(0,150,210,255),1,"default","center","center",true)
		local l = v.sx-3*v.sy
		local x = l/v.maxc*v.c
		dxDrawRectangle(v.x+v.sy+x+2,v.y+2,v.sy-4,v.sy-4,tocolor(0,150,210,175))
		local cx,cy = getCursorPosition()
		if cx and cy then
			local cx = screenx*cx
			local cy = screeny*cy
			if cx >= v.x and cx <= v.x+v.sx and cy >= v.y and cy <= v.y+v.sy then
				if getKeyState("mouse1") then
					local nc = (cx-v.x-v.sy-v.sy/2)*v.maxc/l
					v.c = nc < 0 and 0 or nc > v.maxc and v.maxc or nc
					if v.func then
						loadstring("return "..v.func)()()
					end
				end
			end
		end
	end
end
addEventHandler("onClientRender",getRootElement(),vnxDrawElements)

addEventHandler ( "onClientClick", getRootElement(), 
	function(b,s,cx,cy)
		if b == "left" and s == "down" then
			for _,v in pairs (buttons) do 
				local x = v.x
				local y = v.y
				local sx = v.sx
				local sy = v.sy
				if cx >= x and cx <= x+sx and cy >= y and cy <= y+sy then
					loadstring("return "..v.func)()()
					break
				end
			end 
			for _,v in pairs (buttonsColored) do 
				local x = v.x
				local y = v.y
				local sx = v.sx
				local sy = v.sy
				if cx >= x and cx <= x+sx and cy >= y and cy <= y+sy then
					loadstring("return "..v.func)()()
					break
				end
			end 
			for _,v in pairs (schliessen) do 
				local x = v.x
				local y = v.y
				local sx = v.sx
				local sy = v.sy
				if cx >= x and cx <= x+sx and cy >= y and cy <= y+sy then
					loadstring("return "..v.func)()()
					break
				end
			end 
			for _,v in pairs (images) do 
				local x = v.x
				local y = v.y
				local sx = v.sx
				local sy = v.sy
				if v.func and cx >= x and cx <= x+sx and cy >= y and cy <= y+sy then
					loadstring("return "..v.func)()()
					break
				end
			end 
			for _,v in pairs (imagesections) do 
				local x = v.x
				local y = v.y
				local sx = v.sx
				local sy = v.sy
				if v.func and cx >= x and cx <= x+sx and cy >= y and cy <= y+sy then
					loadstring("return "..v.func)()()
					break
				end
			end 
			for _,v in pairs (edits) do 
				local x = v.x
				local y = v.y
				local sx = v.sx
				local del = v.del
				if cx >= x and cx <= x+sx and cy >= y and cy <= y+20 and v.click == true then
					local car = v.car
					for i = v.ts >= 1 and v.ts-1 or 0, v.te do
						if v.del == true then 
							v.t = ""
						end
						if x+dxGetTextWidth(string.sub(v.t,v.ts,i)) < cx then
							car = i
						else
							break
						end
					end
					v.car = car
					v.carshow = 0
					v.sel = true
					v.sell = false
				else
					v.sel = false
				end
			end
			for _,v in pairs (gridlists) do 
				local x = v.x
				local y = v.y
				local sx = v.sx
				local sy = v.sy
				if cx >= x and cx <= x+sx and cy >= y and cy <= y+sy then
					for i = v.scrol, v.scrol+v.maxr-1 do
						local x = v.x
						local y = v.y+gridlists_rowHeight*(1+i-v.scrol)
						local sx = v.sx
						local sy = gridlists_rowHeight
						if cx >= x and cx <= x+sx and cy >= y and cy <= y+sy then
							v.sel = i 
							if v.func then
								loadstring("return "..v.func)()()
							end
							break
						else
							v.sel = 0
						end
					end
				end
			end
			for _,v in pairs (selectbox) do 
				local x = v.x
				local y = v.y
				local sx = v.sx
				local sy = v.sy
				if cx >= x+sx-sy and cx <= x+sx and cy >= y and cy <= y+sy then
					v.open = not v.open
				elseif v.open then
					for i = v.scrol, v.scrol+v.maxr-1 do
						local x = v.x
						local y = v.y+selectbox_rowHeight*(1+i-v.scrol)
						local sx = v.sx
						local sy = selectbox_rowHeight
						if cx >= x and cx <= x+sx and cy >= y and cy <= y+sy then
							v.sel = i 
							if v.func then
								loadstring("return "..v.func)()()
							end
							break
						else
							v.sel = 0
						end
					end
					v.open = false
				end
			end
		end
	end
)
function vnxSchliessenHover(_,_,cx,cy)
	for _,v in pairs (schliessen) do 
		local x = v.x
		local y = v.y
		local sx = v.sx
		local sy = v.sy
		if cx >= x and cx <= x+sx and cy >= y and cy <= y+sy then
			if not v.bc then
				playSound("")
				v.bc = 0
			end
		else
			v.bc = false
		end
	end
end


function vnxButtonHover(_,_,cx,cy)
	for _,v in pairs (buttons) do 
		local x = v.x
		local y = v.y
		local sx = v.sx
		local sy = v.sy
		if cx >= x and cx <= x+sx and cy >= y and cy <= y+sy then
			if not v.hover then
				playSound("http://134.255.234.247/test/hover.wav")
				v.hover = 0
			end
		else
			v.hover = false
		end
	end
end

function vnxButtonHoverColored(_,_,cx,cy)
	for _,v in pairs (buttonsColored) do 
		local x = v.x
		local y = v.y
		local sx = v.sx
		local sy = v.sy
		if cx >= x and cx <= x+sx and cy >= y and cy <= y+sy then
			if not v.hover then
				playSound("http://134.255.234.247/test/hover.wav")
				v.hover = 0
			end
		else
			v.hover = false
		end
	end
end
addEventHandler( "onClientCursorMove", getRootElement(),vnxSchliessenHover)
addEventHandler( "onClientCursorMove", getRootElement(),vnxButtonHover)
addEventHandler( "onClientCursorMove", getRootElement(),vnxButtonHoverColored)

function dxScrollbarScroll(k)
	local cx,cy = getCursorPosition()
	cx = cx and cx*screenx or 0
	cy = cy and cy*screeny or 0
	for _,v in pairs (gridlists) do 
		local x = v.x
		local y = v.y
		local sx = v.sx
		local sy = v.sy
		if cx >= x and cx <= x+sx and cy >= y and cy <= y+sy then
			local s = k == "mouse_wheel_up" and -1 or 1
			scr = v.scrol + s
			if s == -1 and scr >= 1 then
				v.scrol = scr
			elseif s == 1 and v.scrol+v.maxr <= #v.row then
				v.scrol = scr
			end
		end
	end
	for _,v in pairs (selectbox) do 
		local x = v.x
		local y = v.y
		local sx = v.sx
		local sy = v.sy
		if v.open and cx >= x and cx <= x+sx and cy >= y+sy and cy <= y+sy+selectbox_rowHeight*v.maxr then
			local s = k == "mouse_wheel_up" and -1 or 1
			scr = v.scrol + s
			if s == -1 and scr >= 1 then
				v.scrol = scr
			elseif s == 1 and v.scrol+v.maxr <= #v.items then
				v.scrol = scr
			end
		end
	end
	for _,v in pairs (texts) do  
		local x = v.x
		local y = v.y
		local sx = v.sx
		local sy = v.sy
		if cx >= x and cx <= x+sx and cy >= y and cy <= y+sy then
			local s = k == "mouse_wheel_up" and -1 or 1
			scr = v.scrol + s
			if s == -1 and scr >= 1 then
				v.scrol = scr
				v.sell = false
			elseif s == 1 and v.scrol+v.maxr <= #v.t then
				v.scrol = scr
				v.sell = false
			end
		end
	end
end
bindKey("mouse_wheel_up","down",dxScrollbarScroll)
bindKey("mouse_wheel_down","down",dxScrollbarScroll)

function dxSetCaret (k,s)
	for _,v in pairs (edits) do 
		local w = v.w
		local id = v.id
		if s == "down" and not isTimer(_G["editTimer"..w..id]) then
			if v.sel then
				local s = k == "arrow_l" and -1 or 1
				if v.car+s >= 0 and v.car+s <= #v.t then
					v.carshow = 0
					v.car = v.car+s
					_G["editTimer"..w..id] = setTimer(
						function()
							_G["editTimer"..w..id] = setTimer(
								function()
									if v.car+s >= 0 and v.car+s <= #v.t then
										v.carshow = 0
										v.car = v.car+s
									end
								end
							,100,0)
						end
					,1000,1)
				end
			end
		elseif isTimer(_G["editTimer"..w..id]) then
			killTimer(_G["editTimer"..w..id])
		end
	end
end
bindKey("arrow_l","both",dxSetCaret)
bindKey("arrow_r","both",dxSetCaret)

addEventHandler("onClientDoubleClick", getRootElement(),
	function(b,cx,cy)
		if b == "left" then
			for _,v in pairs (edits) do
				local x = v.x
				local y = v.y
				local sx = v.sx
				if cx >= x and cx <= x+sx and cy >= y and cy <= y+20 and v.click == true then
					v.sell = true
				end
			end
		end
	end
)