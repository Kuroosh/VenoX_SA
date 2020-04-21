StreamWindow = guiCreateStaticImage(0.40, 0.41, 0.20, 0.18, "images/hud/background.png", true)
guiSetVisible(StreamWindow, false);

StreamLabel1 = guiCreateLabel(0.07, 0.15, 0.84, 0.26, "Stream-Link unten eingeben.\nUm den Stream zu stoppen \nFeld leer lassen und Start drücken!", true, StreamWindow)
guiLabelSetHorizontalAlign(StreamLabel1, "center", true)
StreamEdit = guiCreateEdit(0.07, 0.46, 0.86, 0.17, "", true, StreamWindow)
StreamPlayButton = guiCreateButton(0.07, 0.71, 0.28, 0.20, "Start", true, StreamWindow)
StreamCloseButton = guiCreateButton(0.37, 0.71, 0.28, 0.20, "Schließen", true, StreamWindow)



local StreamData = {};

addEvent("PlayStreamVehicleExplode", true)
addEventHandler("PlayStreamVehicleExplode", root, function(vehicle)
	if StreamData[vehicle] then
		if StreamData[vehicle]["sound"] and isElement(StreamData[vehicle]["sound"])then
			stopSound(StreamData[vehicle]["sound"]);
			if isElement(StreamData[vehicle]["sound"]) then
				detachElements(vehicle, StreamData[splayer]["sound"]);
			end
		end
	end
end)

addEvent("openStreamGui", true)
addEventHandler("openStreamGui", localPlayer, function()
	showCursor(true)
	guiSetVisible(StreamWindow, true);
	
	setElementData(localPlayer, "ElementClicked", true);
	
end);

addEvent("PlayStreamSound", true);
addEventHandler("PlayStreamSound", root, function(splayer, slink)
	local vehicle = getPedOccupiedVehicle(splayer);
	if not StreamData[vehicle] then
		StreamData[vehicle] = {}
	end
	if StreamData[vehicle]["sound"] and isElement(StreamData[vehicle]["sound"] or #slink == 0)then
		stopSound(StreamData[vehicle]["sound"]);
		if isElement(StreamData[vehicle]["sound"]) then
			detachElements(vehicle, StreamData[splayer]["sound"]);
		end
	end
	if(#slink > 0)then
		local x, y, z = getElementPosition(splayer);
		StreamData[vehicle]["sound"] = playSound3D(slink, x, y, z);
		attachElements(StreamData[vehicle]["sound"], vehicle);
	end
end)

addEventHandler("onClientGUIClick", StreamCloseButton, function()
	showCursor(false)
	guiSetVisible(StreamWindow, false);
	
	setElementData(localPlayer, "ElementClicked", false);
end, false);

addEventHandler("onClientGUIClick", StreamPlayButton, function()
	local slink = tostring(guiGetText(StreamEdit));
	triggerServerEvent("PlayStreamSound", localPlayer, slink);
end, false);