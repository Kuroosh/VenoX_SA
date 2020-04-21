Hospital = {}
local x, y = guiGetScreenSize()

function Hospital.new(...)
	local o = setmetatable({}, { __index = Hospital })
	if o.constructor then
		o:constructor(...)
	end
	return o
end

function Hospital:constructor()
	-- Constants
	self.m_fRender = function(...) self:render(...) end
	self:setProgress(1)

	-- Some fun facts
	self.m_Index = false
	self.m_Facts = {




		[1] = "Es gibt Mods mit F5 zum Aktivieren?",
		[2] = "Das es Kokain gibt?",
		[5] = "Das Forum findest du unter www.venox-reallife.com?",
		[6] = "Das LargePeach pfirsische LIEBT ?! ",
		[7] = "Das auf Venox Reallife fast alle 24H ein Update kommmt?",
		[9] = "Das wir einen Tactic Server haben? Venox Tactics iz Back !!",
		[10] = "Das du dein Auto mit vielen Tuning Möglichkeiten individuell gestalten kannst?",
		[11] = "Den Teamspeak3 Server findest du unter : ts3.venox-reallife.com",
		[12] = "Das es einen Asservatentruck gibt ?",
		[13] = "Das du dein HUD im Einstellungs Fenster mit /self ändern kannst?",
		[14] = "Das du dein Crosshair im Einstellungs Fenster mit /self ändern kannst?",
		[15] = "Das Layesd_TV unser Streaming-Partner ist? www.twitch.tv/layesd_tv",
		[16] = "Das Venox - V in Bearbeitung ist?",
		[17] = "Das Venox - Craft in Bearbeitung ist?",
		[18] = "Das Venox - Metin2 in Bearbeitung ist?",
		[19] = "Das Venox eine Whatsapp Gruppe hat?",
		[20] = "Das Venox ein Controlpanel hat? cp.venox-reallife.com.",
		[21] = "Das Layesd_TV unser Streaming-Partner ist? www.twitch.tv/layesd_tv"
	}

	-- add events
	addEvent("showProgressBar", true)
	addEvent("updateDeathBar", true)
	addEvent("hideDeathBar", true)

	-- callbacks
	local function doShow(...) self:show(...) end
	local function doUpdate(...) self:update(...) end
	local function doHide(...) self:hide(...) end
	local function doNotify(...) self:notify(...) end

	-- add event handlers
	addEventHandler("showProgressBar", root, doShow)
	addEventHandler("updateDeathBar", root, doUpdate)
	addEventHandler("hideDeathBar", root, doHide)
	addEventHandler("onClientPlayerWasted", localPlayer, doNotify)

end

function Hospital:setProgress(val)
	self.m_Progress = tonumber(val)
end

function Hospital:notify(killer, weapon, bodypart)
	triggerServerEvent("onPlayerWastedTriggered", localPlayer, killer, weapon, bodypart)
end

function Hospital:show()
	-- Prepare
	self.m_Index = math.random(1, #self.m_Facts)
	self:setProgress(1)

	-- Render it
	addEventHandler("onClientRender", root, self.m_fRender)
end
local screenX, screenY = guiGetScreenSize()
local sx, sy = screenX/1366, screenY/768
local dxfont0_arial = dxCreateFont(":venox/fonts/arial.ttf", 10)
local dxfont1_arial = dxCreateFont(":venox/fonts/arial.ttf", 14)
function Hospital:render(delta)
	-- Is our actually dead?
	--if getElementHealth(localPlayer) > 0 then
	--	return
--	end

	-- Display
	--dxDrawImage(704*(x/1920), 800*(y/1080), 512*(x/1920), 200*(y/1080), "client/hospital/background.png")
	--dxDrawImage(726*(x/1920), 933*(y/1080), (self.m_Progress*469/100)*(x/1920), 35*(y/1080), "client/hospital/bar.png")
	--dxDrawText("Wusstest du schon?", 900*(x/1920), 860*(y/1080), 469*(x/1920), 1000*(y/1080), tocolor(255, 255, 255, 255), 1*(y/1080), "default-bold")
	--dxDrawLine(895*(x/1920), 876*(y/1080), 1020*(x/1920), 876*(y/1080), tocolor(255, 255, 255, 255), 1.5*(y/1080))
	--dxDrawText(self.m_Facts[self.m_Index], 830*(x/1920), 890*(y/1080), 469*(x/1920), 1000*(y/1080), tocolor(255, 255, 255, 255), 1*(y/1080), "default-bold")
	--dxDrawText("Respawn in ".. 60-math.ceil(self.m_Progress*60/100) .." Sekunden", 860*(x/1920), 940*(y/1080), 469*(x/1920), 1000*(y/1080), tocolor(255, 255, 255, 255), 1.3*(y/1080), "default-bold")

	dxDrawRectangle(sx*411, sy*623, sx*545, sy*48, tocolor(0, 0, 0, 182), false)
	dxDrawRectangle(sx*411, sy*719, sx*545, sy*48, tocolor(0, 0, 0, 182), false)
	dxDrawRectangle(sx*411, sy*671, sx*14, sy*48, tocolor(0, 0, 0, 182), false)
	dxDrawRectangle(sx*942, sy*671, sx*14, sy*48, tocolor(0, 0, 0, 182), false)
	dxDrawLine(sx*427 - 1, sy*673 - 1, sx*427 - 1, sy*717, tocolor(0, 150, 200, 100), 1, false)
	dxDrawLine(sx*940, sy*673 - 1, sx*427 - 1, sy*673 - 1, tocolor(0, 150, 200, 100), 1, false)
	dxDrawLine(sx*427 - 1, sy*717, sx*940, sy*717, tocolor(0, 150, 200, 100), 1, false)
	dxDrawLine(sx*940, sy*717, sx*940, sy*673 - 1, tocolor(0, 150, 200, 100), 1, false)
	dxDrawRectangle(sx*427, sy*673, sx*513, sy*44, tocolor(0, 0, 0, 182), false)
	dxDrawRectangle(sx*428, sy*674, (self.m_Progress*511/100), sy*42, tocolor(0, 150, 200, 100), false)
	dxDrawText("Wusstest du schon? \n "..self.m_Facts[self.m_Index], sx*411, sy*623, sx*956, sy*671, tocolor(255, 255, 255, 255), 1.00, dxfont0_arial, "center", "center", false, true, false, false, false)
	dxDrawRectangle(sx*436, sy*575, sx*495, sy*48, tocolor(0, 0, 0, 182), false)
	dxDrawText("Venox Reallife Krankenhaus", sx*437, sy*575, sx*931, sy*623, tocolor(255, 255, 255, 255), 1.00, dxfont1_arial, "center", "center", false, true, false, false, false)
	dxDrawText( 60-math.ceil(self.m_Progress*60/100).." Sekunden", sx*427, sy*673, sx*939, sy*716, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
	dxDrawRectangle(sx*436, sy*621, sx*494, sy*2, tocolor(0, 150, 255, 255), false)
end

function Hospital:update(new)
	-- Check for unexpected values
	if new >= 100 then
		self:hide()
	end

	-- Apply
	self:setProgress(new)
end

function Hospital:hide()
	removeEventHandler("onClientRender", root, self.m_fRender)
end

-- Create global instance
g_Hospital = Hospital.new()