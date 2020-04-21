addEvent ( "makePedInvulnerable", true )

function createInvulnerablePed ( skin, x, y, z, r, int, dim )

	local ped = createPed ( skin, x, y, z )
	if not dim then
		dim = 0
	end
	setElementInterior ( ped, int )
	setElementDimension ( ped, dim )
	setPedRotation ( ped, r )
	addEventHandler ( "onClientPedDamage", ped,
		function ()
			cancelEvent()
		end
	)
	return ped
end

function makePedInvulnerable_func ( peds )
	for ped, _ in pairs ( peds ) do
		addEventHandler ( "onClientPedDamage", ped, _cancelEvent )
	end
end
addEventHandler ( "makePedInvulnerable", root, makePedInvulnerable_func )


function _cancelEvent ( )
	cancelEvent()
end

local kalenderMarker = createMarker(-2068, 1383.2, 6, "cylinder", 1, 200, 0, 0)

Advent = {
    button = {},
    window = {},
    staticimage = {},
    label = {}
}

function openAdventsKalender(hit, dim)
	if not hit == lp then return end
	if not isElementWithinMarker(lp, kalenderMarker) then return end
	Advent.window[1] = guiCreateWindow(312, 136, 447, 490, "Adventskalender", false)
	guiWindowSetMovable(Advent.window[1], false)
	guiWindowSetSizable(Advent.window[1], false)
	guiSetVisible(Advent.window[1], true)
	centerWindow(Advent.window[1])
	showCursor(true)
	setElementData(getLocalPlayer(), "ElementClicked", true)

	Advent.label[1] = guiCreateLabel(415, 5, 31, 18, "Close", false, Advent.window[1])
	guiSetFont(Advent.label[1], "default-bold-small")
	guiSetProperty(Advent.label[1], "ClippedByParent", "False")

	Advent.staticimage[1] = guiCreateStaticImage(10, 28, 426, 452, "anzeigen/adventskalender/kalender.png", false, Advent.window[1])

	Advent.button[1] = guiCreateButton(325, 162, 73, 59, "1", false, Advent.staticimage[1])
	guiSetProperty(Advent.button[1], "NormalTextColour", "FFAAAAAA")
	guiSetAlpha(Advent.button[1], 0)
	Advent.button[2] = guiCreateButton(125, 236, 73, 59, "2", false, Advent.staticimage[1])
	guiSetProperty(Advent.button[2], "NormalTextColour", "FFAAAAAA")
	guiSetAlpha(Advent.button[2], 0)
	Advent.button[3] = guiCreateButton(225, 383, 73, 59, "3", false, Advent.staticimage[1])
	guiSetProperty(Advent.button[3], "NormalTextColour", "FFAAAAAA")
	guiSetAlpha(Advent.button[3], 0)
	Advent.button[4] = guiCreateButton(225, 15, 73, 59, "4", false, Advent.staticimage[1])
	guiSetProperty(Advent.button[4], "NormalTextColour", "FFAAAAAA")
	guiSetAlpha(Advent.button[4], 0)
	Advent.button[5] = guiCreateButton(225, 88, 73, 59, "5", false, Advent.staticimage[1])
	guiSetProperty(Advent.button[5], "NormalTextColour", "FFAAAAAA")
	guiSetAlpha(Advent.button[5], 0)
	Advent.button[6] = guiCreateButton(125, 309, 73, 59, "6", false, Advent.staticimage[1])
	guiSetProperty(Advent.button[6], "NormalTextColour", "FFAAAAAA")
	guiSetAlpha(Advent.button[6], 0)
	Advent.button[7] = guiCreateButton(325, 88, 73, 59, "7", false, Advent.staticimage[1])
	guiSetProperty(Advent.button[7], "NormalTextColour", "FFAAAAAA")
	guiSetAlpha(Advent.button[7], 0)
	Advent.button[8] = guiCreateButton(325, 236, 73, 59, "8", false, Advent.staticimage[1])
	guiSetProperty(Advent.button[8], "NormalTextColour", "FFAAAAAA")
	guiSetAlpha(Advent.button[8], 0)
	Advent.button[9] = guiCreateButton(25, 162, 73, 59, "9", false, Advent.staticimage[1])
	guiSetProperty(Advent.button[9], "NormalTextColour", "FFAAAAAA")
	guiSetAlpha(Advent.button[9], 0)
	Advent.button[10] = guiCreateButton(25, 309, 73, 59, "10", false, Advent.staticimage[1])
	guiSetProperty(Advent.button[10], "NormalTextColour", "FFAAAAAA")
	guiSetAlpha(Advent.button[10], 0)
	Advent.button[11] = guiCreateButton(225, 309, 73, 59, "11", false, Advent.staticimage[1])
	guiSetProperty(Advent.button[11], "NormalTextColour", "FFAAAAAA")
	guiSetAlpha(Advent.button[11], 0)
	Advent.button[12] = guiCreateButton(325, 15, 73, 59, "12", false, Advent.staticimage[1])
	guiSetProperty(Advent.button[12], "NormalTextColour", "FFAAAAAA")
	guiSetAlpha(Advent.button[12], 0)
	Advent.button[13] = guiCreateButton(125, 88, 73, 59, "13", false, Advent.staticimage[1])
	guiSetProperty(Advent.button[13], "NormalTextColour", "FFAAAAAA")
	guiSetAlpha(Advent.button[13], 0)
	Advent.button[14] = guiCreateButton(125, 162, 73, 59, "14", false, Advent.staticimage[1])
	guiSetProperty(Advent.button[14], "NormalTextColour", "FFAAAAAA")
	guiSetAlpha(Advent.button[14], 0)
	Advent.button[15] = guiCreateButton(225, 236, 73, 59, "15", false, Advent.staticimage[1])
	guiSetProperty(Advent.button[15], "NormalTextColour", "FFAAAAAA")
	guiSetAlpha(Advent.button[15], 0)
	Advent.button[16] = guiCreateButton(325, 309, 73, 59, "16", false, Advent.staticimage[1])
	guiSetProperty(Advent.button[16], "NormalTextColour", "FFAAAAAA")
	guiSetAlpha(Advent.button[16], 0)
	Advent.button[17] = guiCreateButton(25, 236, 73, 59, "17", false, Advent.staticimage[1])
	guiSetProperty(Advent.button[17], "NormalTextColour", "FFAAAAAA")
	guiSetAlpha(Advent.button[17], 0)
	Advent.button[18] = guiCreateButton(25, 88, 73, 59, "18", false, Advent.staticimage[1])
	guiSetProperty(Advent.button[18], "NormalTextColour", "FFAAAAAA")
	guiSetAlpha(Advent.button[18], 0)
	Advent.button[19] = guiCreateButton(325, 383, 73, 59, "19", false, Advent.staticimage[1])
	guiSetProperty(Advent.button[19], "NormalTextColour", "FFAAAAAA")
	guiSetAlpha(Advent.button[19], 0)
	Advent.button[20] = guiCreateButton(25, 383, 73, 59, "20", false, Advent.staticimage[1])
	guiSetProperty(Advent.button[20], "NormalTextColour", "FFAAAAAA")
	guiSetAlpha(Advent.button[20], 0)
	Advent.button[21] = guiCreateButton(225, 162, 73, 59, "21", false, Advent.staticimage[1])
	guiSetProperty(Advent.button[21], "NormalTextColour", "FFAAAAAA")
	guiSetAlpha(Advent.button[21], 0)
	Advent.button[22] = guiCreateButton(125, 15, 73, 59, "22", false, Advent.staticimage[1])
	guiSetProperty(Advent.button[22], "NormalTextColour", "FFAAAAAA")
	guiSetAlpha(Advent.button[22], 0)
	Advent.button[23] = guiCreateButton(125, 383, 73, 59, "23", false, Advent.staticimage[1])
	guiSetProperty(Advent.button[23], "NormalTextColour", "FFAAAAAA")
	guiSetAlpha(Advent.button[23], 0)
	Advent.button[24] = guiCreateButton(25, 15, 73, 59, "24", false, Advent.staticimage[1])
	guiSetProperty(Advent.button[24], "NormalTextColour", "FFAAAAAA")
	guiSetAlpha(Advent.button[24], 0)

	addEventHandler("onClientGUIClick", Advent.label[1], function()
		guiSetVisible(Advent.window[1], false)
		destroyElement(Advent.window[1])
		showCursor(false)
		setElementData(getLocalPlayer(), "ElementClicked", false)
	end, false)

	-- --
	local time = getRealTime()
	local day = time.monthday
	for i = 1, 24 do
		--[[if (day == i) then
			addEventHandler("onClientGUIClick", Advent.button[i], function()
				triggerServerEvent("openAdventDoor", getLocalPlayer(), getLocalPlayer(), i)
			end, false)
		else
			if (day > i) then
				addToolTip(Advent.button[i], "Da musst du\noch ein bisschen\nwarten.")
			elseif (day < i) then
				addToolTip(Advent.button[i], "Da kommst du\zu spät.")
			end
		end]]
		addEventHandler("onClientGUIClick", Advent.button[i], function()
			triggerServerEvent("openAdventDoor", getLocalPlayer(), getLocalPlayer(), i)
		end, false)
	end
end
addEventHandler("onClientMarkerHit", kalenderMarker, openAdventsKalender)

function dynamicPedKlickAdvent(itm, price, text)
	Advent.window["dynamic"] = guiCreateWindow(354, 226, 320, 163, itm, false)
	guiWindowSetSizable(Advent.window["dynamic"], false)
	guiWindowSetMovable(Advent.window["dynamic"], false)
	guiSetVisible(Advent.window["dynamic"], true)
	centerWindow(Advent.window["dynamic"])
	showCursor(true)
	setElementData(lp, "ElementClicked", true)
	
	Advent.label["dynamic"] = guiCreateLabel(10, 29, 299, 83, "Hey "..getPlayerName(lp)..",\n\n"..text.."\n\nKosten: "..price.." $", false, Advent.window["dynamic"])
	guiSetFont(Advent.label["dynamic"], "default-bold-small")
	Advent.button["dynamic1"] = guiCreateButton(11, 122, 122, 30, "Kaufen", false, Advent.window["dynamic"])
	guiSetFont(Advent.button["dynamic1"], "clear-normal")
	Advent.button["dynamic2"] = guiCreateButton(187, 122, 122, 30, "Nein, Danke.", false, Advent.window["dynamic"])
	guiSetFont(Advent.button["dynamic2"], "clear-normal")
	
	local function close()
		guiSetVisible(Advent.window["dynamic"], false)
		destroyElement(Advent.window["dynamic"])
		showCursor(false)
		setElementData(lp, "ElementClicked", false)
	end
	addEventHandler("onClientGUIClick", Advent.button["dynamic1"], function()
		triggerServerEvent("buyAdventItm", lp, lp, itm, price)
		close()
	end, false)
	addEventHandler("onClientGUIClick", Advent.button["dynamic2"], close, false)
end
addEvent("dynamicPedKlickAdvent", true)
addEventHandler("dynamicPedKlickAdvent", getRootElement(), dynamicPedKlickAdvent)

local wheelSound
function playWmarktSound3D(url, radius, x, y, z, looped, ansage)
	if (ansage and ansage == true) then
		--outputChatBox("SPEEEEEAAAAKKKK")
		setTimer(function()
			setSoundVolume(wheelSound, 0.75)
			setTimer(function()
				setSoundVolume(wheelSound, 0.5)
				setTimer(function()
					setSoundVolume(wheelSound, 0.25)
					setTimer(function()
						
						setSoundVolume(wheelSound, 0)
						local sound = playSound3D(url, x, y, z, looped)
						setSoundMaxDistance(sound, tonumber(radius))
						setSoundVolume(sound, 1)
						setTimer(function()
							--wheelSound = playWmarktSound3D("http://176.28.48.100:9000/listen.pls", 150, -2078.3, 1422.6, 6.7, false)
							wheelSound = playWmarktSound3D("http://85.25.152.127:8100/listen.pls", 150, -2078.3, 1422.6, 6.7, false)
							setSoundVolume(wheelSound, 1)
						end, 5250, 1)
						
					end, 300, 1)
				end, 300, 1)
			end, 300, 1)
		end, 300, 1)
		
	else
		local sound = playSound3D(url, x, y, z, looped)
		setSoundMaxDistance(sound, tonumber(radius))
		return sound
	end
end
addEvent("playWmarktSound3D", true)
addEventHandler("playWmarktSound3D", getRootElement(), playWmarktSound3D)
--wheelSound = playWmarktSound3D("http://176.28.48.100:9000/listen.pls", 150, -2078.3, 1422.6, 6.7, false)
wheelSound = playWmarktSound3D("http://85.25.152.127:8100/listen.pls", 150, -2078.3, 1422.6, 6.7, false)
playWmarktSound3D("anzeigen/adventskalender/background.mp3", 300, -2081.1, 1386.6, 6.8, true)

local buyTicketCol = createColSphere( -2080.576, 1421.742, 7.1, 4.5 )
local inTicketCol = false
function drawBuyTicket()
	local scX, scY = guiGetScreenSize()
	local txt = "Tippe /rticket um dir ein Ticket zu kaufen.\nKosten: 10 $"
	dxDrawText( txt, scX*0.5 - dxGetTextWidth( txt, 0.7, 'bankgothic' )/2, scY*0.85 + 1, scX, scY, tocolor( 0, 0, 0, 255 ), 0.7, 'bankgothic')
	dxDrawText( txt, scX*0.5 - dxGetTextWidth( txt, 0.7, 'bankgothic' )/2, scY*0.85, scX, scY, tocolor( 255, 255, 255, 255 ), 0.7, 'bankgothic')
end
addEventHandler("onClientColShapeHit", buyTicketCol, function(hit, dim)
	if (hit == getLocalPlayer()) then
		inTicketCol = true
		addEventHandler("onClientRender", getRootElement(), drawBuyTicket)
	end
end)
addEventHandler("onClientColShapeLeave", buyTicketCol, function(hit, dim)
	if (hit == getLocalPlayer()) then
		inTicketCol = false
		removeEventHandler("onClientRender", getRootElement(), drawBuyTicket)
	end
end)
addCommandHandler("rticket", function()
	if (inTicketCol == true) then
		if (vnxGetElementData(getLocalPlayer(), "money") >= 10) then
			if (not getElementData(getLocalPlayer(), "rrad") or getElementData(getLocalPlayer(), "rrad") == false) then
				setElementData(getLocalPlayer(), "rrad", true)
				vnxSetElementData(getLocalPlayer(), "money", tonumber(getElementData(getLocalPlayer(), "money") - 10))
				infobox("\n\nTicket gekauft!", 5000, 0, 255, 0)
			else
				infobox("\nDu hast bereits\nein Ticket!", 5000, 255, 100, 0)
			end	
		else
			infobox("\nDu hast nicht\ngenug Geld!", 5000, 255, 100, 0)
		end
	else
		infobox("\nDu hast nicht\ngenug Geld!", 5000, 255, 100, 0)
	end
end)

setTimer(function()
	local txd = engineLoadTXD("anzeigen/adventskalender/kalender.txd", 2716)
	engineImportTXD(txd, 2716)
	outputChatBox("Mit /snow kannst du den Schnefall und mit /snowshader den Schneeshader De-/Aktivieren!", 0,120,0)
end, 5000, 1)