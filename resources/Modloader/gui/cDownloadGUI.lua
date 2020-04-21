local x,y			   = guiGetScreenSize() 
local screenW, screenH = guiGetScreenSize()
local sx, sy = screenW/1680, screenH/1050


function isCursorOnElement(x,y,w,h)
	if isCursorShowing() then
	local mx,my = getCursorPosition ()
	local fullx,fully = guiGetScreenSize()
		cursorx,cursory = mx*fullx,my*fully
		if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
			return true
		else
			return false
		end
	end
end

local Scrollposition	= 1;
local MaxScrollposition = 10;

local clickedX 		 = 0
local clickedY 		 = 0
local clickedW 		 = 0
local clickedH 		 = 0
local clickedElement = false

function Scrollup()
	if Scrollposition <= 1 then
		Scrollposition = 1
	else
		Scrollposition = Scrollposition - 1
	end
end

function Scrolldown()
	if table.getn(Playermodlist[localPlayer]) - Scrollposition <= 1 then
		Scrollposition = table.getn(Playermodlist[localPlayer])
	else
		Scrollposition = Scrollposition + 1
	end
end

function RenderDownloadStatus()
	
	dxDrawRectangle(screenW * 0.549, screenH * 0.618, screenW * ((Playerdownload[localPlayer]["Percent"]/10) * 0.0071), screenH * 0.013, tocolor(0, 166, 243, 255), true)
	dxDrawText(Playerdownload[localPlayer]["Percent"].."%", screenW * 0.623, screenH * 0.616, screenW * 0.645, screenH * 0.633, tocolor(127, 127, 127, 255), 1.00, "default-bold", "center", "center", false, false, true, false, false)
end

function DestroyDownloadStatus()
	removeEventHandler("onClientRender", root, RenderDownloadStatus);
end

function CreateDownloadStatus()
	if not Playerdownload[localPlayer]  then
		Playerdownload[localPlayer] 		   		= {};
		Playerdownload[localPlayer]["Percent"] 		= 1;
		Playerdownload[localPlayer]["PercentSize"]	= "...";
		Playerdownload[localPlayer]["Modname"]	    = "...";
	end	
	addEventHandler("onClientRender", root, RenderDownloadStatus);
end


function CreateModlist()
	showCursor(true);
	bindKey("mouse_wheel_up",   "down", Scrollup);
	bindKey("mouse_wheel_down", "down", Scrolldown);
	addEventHandler("onClientClick", root, ClickModlist);
	addEventHandler("onClientRender", root, RenderModlist);
end

function DestroyModlist()
	showCursor(false);
	unbindKey("mouse_wheel_up",   "down", Scrollup);
	unbindKey("mouse_wheel_down", "down", Scrolldown);
	removeEventHandler("onClientClick", root, ClickModlist);
	removeEventHandler("onClientRender", root, RenderModlist);
end

function ClickModlist(_, stn)
	
	if(stn == "down")then
		
		if isCursorOnElement( clickedX, clickedY, clickedW, clickedH ) then
			if clickedElement == clickedID then
				clickedElement = false
				clickedElementTitle = '-'
			else
				clickedElement 		= clickedID;
				clickedElementTitle = clickedTitle
				clickedElementTXD   = clickedTXD;
				clickedElementDFF	= clickedDFF;
				clickedElementCOL 	= clickedCOL;
				clickedElementX, clickedElementY, clickedElementW, clickedElementH = clickedX, clickedY, clickedW, clickedH
			end
		end
		if(clickedElement)then
			if(isCursorOnElement(screenW * 0.532, screenH * 0.317, screenW * 0.115, screenH * 0.063))then
			local modExsitsTXD = true;
			local modExsitsDFF = true;
			local modExsitsCOL = true;
			
				if(isActivate(clickedElementTXD))then
					if not fileExists(clickedElementTXD) then
						modExsitsTXD    = false;
					end
				end
				if(isActivate(clickedElementDFF))then
					if not fileExists(clickedElementDFF) then
						modExsitsDFF	= false;
					end
				end
				if(isActivate(clickedElementCOL))then
					if not fileExists(clickedElementCOL) then
						modExsitsCOL	= false;
					end
				end
				if modExsitsTXD and modExsitsDFF and modExsitsCOL then
					outputChatBox("Mod wurde gefunden und muss nicht Runtergeladen werden.", 0, 200, 0);
					return;
				end
				triggerServerEvent("onServerDownloadMod", localPlayer, clickedElement);
			end
			if(isCursorOnElement(screenW * 0.532, screenH * 0.389, screenW * 0.115, screenH * 0.063))then
				triggerServerEvent("onServerActivateMod", localPlayer, clickedElement);
			end
			if(isCursorOnElement(screenW * 0.531, screenH * 0.459, screenW * 0.115, screenH * 0.063))then
				triggerServerEvent("onServerDisableMod", localPlayer, clickedElement);
			end
			if(isCursorOnElement(screenW * 0.531, screenH * 0.531, screenW * 0.115, screenH * 0.063))then
				triggerServerEvent("onServerDeleteMod", localPlayer, clickedElement)
			end
		end
	end
end


function RenderModlist()
	
	
	local char				    = 0;
	local Modlist				= {};
	
	for _, index in pairs(Playermodlist[localPlayer]) do 
	
		char 				    = char + 1;
		
		Modlist[char]	        = {};
		Modlist[char].ID        = index.MODID;
		Modlist[char].MODName   = index.MODNAME;
		Modlist[char].MODSize   = sizeFormat(index.MODSIZE);
		Modlist[char].MODExists = true;
		Modlist[char].TXD		= index.MODTXDPATH;
		Modlist[char].DFF		= index.MODDFFPATH;
		Modlist[char].COL		= index.MODCOLPATH;
		Modlist[char].INFO 		= index.INFO;
		Modlist[char].PIC 		= index.PIC;
		
		
		if(isActivate(index.MODTXDPATH))then
			if not fileExists(index.MODTXDPATH) then
				Modlist[char].MODExists	= false;
			end
		end
		if(isActivate(index.MODDFFPATH))then
			if not fileExists(index.MODDFFPATH) then
				Modlist[char].MODExists	= false;
			end
		end
		if(isActivate(index.MODCOLPATH))then
			if not fileExists(index.MODCOLPATH) then
				Modlist[char].MODExists	= false;
			end
		end
		
		
	end
	
	dxDrawRectangle(screenW * 0.330, screenH * 0.301, screenW * 0.333, screenH * 0.369, tocolor(0, 45, 69, 255), false) --Rand--
	dxDrawRectangle(screenW * 0.339, screenH * 0.315, screenW * 0.176, screenH * 0.345, tocolor(0, 25, 39, 255), false) --innenflaeche--
	dxDrawText("To Close Press F5", screenW * 0.522, screenH * 0.641, screenW * 0.646, screenH * 0.660, tocolor(211, 211, 211, 91), 1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawRectangle(570*sx,  331*sy,  295*sx,  21*sy, tocolor(0, 63, 181, 255), false)

	
	dxDrawText("Modname", screenW * 0.342, screenH * 0.315, screenW * 0.386, screenH * 0.335, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)
	dxDrawText("Größe", screenW * 0.411, screenH * 0.315, screenW * 0.438, screenH * 0.335, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawText("Runtergeladen", screenW * 0.458, screenH * 0.315, screenW * 0.511, screenH * 0.335, tocolor(255, 255, 255, 255), 1.00, "default-bold", "right", "center", false, false, false, false, false)
	dxDrawRectangle(screenW*0.330,screenH*0.67,screenW*0.333, screenH*0.15, tocolor(0, 45, 69, 255), false)



  	--DIE MOD LOADER BILDER -- 

	if isCursorOnElement(screenW * 0.532, screenH * 0.317, screenW * 0.115, screenH * 0.063) then
		dxDrawImage(screenW * 0.532, screenH * 0.317, screenW * 0.115, screenH * 0.063, "gui/files/DownloadButtonHover.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) 
	else
		dxDrawImage(screenW * 0.532, screenH * 0.317, screenW * 0.115, screenH * 0.063, "gui/files/DownloadButton.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) 
	end
	if isCursorOnElement(screenW * 0.532, screenH * 0.389, screenW * 0.115, screenH * 0.063) then
		dxDrawImage(screenW * 0.532, screenH * 0.389, screenW * 0.115, screenH * 0.063, "gui/files/AktivierenButtonHover.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	else
		dxDrawImage(screenW * 0.532, screenH * 0.389, screenW * 0.115, screenH * 0.063, "gui/files/AktivierenButton.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	end
	if isCursorOnElement(screenW * 0.531, screenH * 0.459, screenW * 0.115, screenH * 0.063) then
		dxDrawImage(screenW * 0.531, screenH * 0.459, screenW * 0.115, screenH * 0.063, "gui/files/DeaktivierenButtonHover.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	else
		dxDrawImage(screenW * 0.531, screenH * 0.459, screenW * 0.115, screenH * 0.063, "gui/files/DeaktivierenButton.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	end
	if isCursorOnElement(screenW * 0.531, screenH * 0.531, screenW * 0.115, screenH * 0.063) then
		dxDrawImage(screenW * 0.531, screenH * 0.531, screenW * 0.115, screenH * 0.063, "gui/files/LoeschenButtonHover.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	else
		dxDrawImage(screenW * 0.531, screenH * 0.531, screenW * 0.115, screenH * 0.063, "gui/files/LoeschenButton.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	end
	
	dxDrawRectangle(screenW * 0.515, screenH * 0.315, screenW * 0.006, screenH * 0.345, tocolor(211, 211, 211, 91), false)
	dxDrawRectangle(screenW * 0.516, screenH * (0.305 + (Scrollposition/100)), screenW * 0.0039, screenH * (0.354-(#Playermodlist[localPlayer]/100)), tocolor(211, 211, 211, 91), false)
	--dxDrawRectangle(570*sx,  590*sy,  295*sx,  21*sy, tocolor(0, 63, 181, 255), false) --Neue Oberflaesche-- 

	local mx, my = getCursorPosition ( )
	mx = mx or 0 
	my = my or 0
	local scaleVar = 0;
	local mouseOnElem = false
	for i = 0 + Scrollposition, MaxScrollposition + Scrollposition do
	
		if Modlist[i] then
			
			if ( clickedElement == 	Modlist[i].ID ) then 
				dxDrawRectangle(screenW * 0.339, screenH * (0.339 + (scaleVar*0.21)), screenW * 0.176, screenH * 0.020, tocolor(38, 122, 252, 91), false) -- BACKGROUND VOM TEXT
			end
			if mx >= 0.339 and mx <= 0.339 + 0.176 and my >= 0.339 + scaleVar*0.21 and my <= 0.339 + scaleVar*0.21 + 0.020 then
				mouseOnElem = true
				dxDrawText(Modlist[i].INFO, screenW * 0.521, screenH * 0.670, screenW * 0.663, screenH * 0.8005, tocolor(255, 255, 255, 255), 1*sy, "sans", "center", "center", false, false, false, false, false)
				dxDrawImage(screenW * 0.339, screenH * 0.670, screenW * 0.176, screenH * 0.1375, Modlist[i].PIC, 0, 0, 0, tocolor(255, 255, 255, 255), false) 
			end
			
			if not isCursorOnElement(screenW * 0.339, screenH * (0.339 + (scaleVar*0.21)), screenW * 0.176, screenH * 0.020) then
			
				dxDrawRectangle(screenW * 0.339, screenH * (0.339 + (scaleVar*0.21)), screenW * 0.176, screenH * 0.020, tocolor(170, 203, 254, 91), false) -- BACKGROUND VOM TEXT
			else
			
				clickedX 	 = screenW * 0.339;
				clickedY 	 = screenH * (0.339 + (scaleVar*0.21));
				clickedW 	 = screenW * 0.176;
				clickedH  	 = screenH * 0.020;
				clickedTitle = Modlist[i].MODName;
				clickedID    = Modlist[i].ID;
				clickedTXD   = Modlist[i].TXD;
				clickedDFF   = Modlist[i].DFF;
				clickedCOL   = Modlist[i].COL;
				
				dxDrawRectangle(screenW * 0.339, screenH * (0.339 + (scaleVar*0.21)), screenW * 0.176, screenH * 0.020, tocolor(105, 163, 253, 91), false) -- BACKGROUND VOM TEXT
			end
			
			if(Modlist[i].MODExists)then
				Modlist[i].STATUS = "Downloaded";
			else
				Modlist[i].STATUS = "-";
			end
			
			dxDrawText(Modlist[i].STATUS, screenW * 0.461, screenH  * (0.340 + (scaleVar*0.21)), screenW * 0.511, screenH * 0.358, tocolor(0, 179, 255, 255), 1.00, "default-bold", "right", "top", false, false, false, false, false)
			dxDrawText(Modlist[i].MODName, screenW * 0.342, screenH * (0.340 + (scaleVar*0.21)), screenW * 0.392, screenH * 0.358, tocolor(0, 179, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
			dxDrawText(Modlist[i].MODSize, screenW * 0.400, screenH * (0.340 + (scaleVar*0.21)), screenW * 0.450, screenH * 0.358, tocolor(0, 179, 255, 255), 1.00, "default-bold", "center", "top", false, false, false, false, false) -- center, center

		end
		scaleVar = scaleVar + 0.1;
	end

	if not mouseOnElem then
		dxDrawImage(screenW * 0.339, screenH * 0.670, screenW * 0.176, screenH * 0.1375, "gui/Bilder/ladescreen.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) 
		dxDrawText("Bitte MOD auswählen \num die Preview zu Starten.", screenW * 0.521, screenH * 0.670, screenW * 0.663, screenH * 0.8005, tocolor(255, 255, 255, 255), 1*sy, "beckett", "center", "center", false, false, false, false, false)
	end
end



function isActivate(string)
	local str = tostring(string);
	if(str == 'disable')then
		return false;
	else
		return true;
	end
end

-- Von DKong 
function sizeFormat(size)
	local size = tostring(size)
	if size:len() >= 4 then		
		if size:len() >= 7 then
			if size:len() >= 9 then
				local returning = size:sub(1, size:len()-9)
				if returning:len() <= 1 then
					returning = returning.."."..size:sub(2, size:len()-7)
				end
				return returning.." GB";
			else				
				local returning = size:sub(1, size:len()-6)
				if returning:len() <= 1 then
					returning = returning.."."..size:sub(2, size:len()-4)
				end
				return returning.." MB";
			end
		else		
			local returning = size:sub(1, size:len()-3)
			if returning:len() <= 1 then
				returning = returning.."."..size:sub(2, size:len()-1)
			end
			return returning.." KB";
		end
	else
		return size.." B";
	end
end
