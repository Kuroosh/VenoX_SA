local Guivar = 0
local GuivarMech = 0

addEvent("onVioOrdnungsamtTuningGuiStart1", true)
addEvent("onVioOrdnungsamtTuningGuiStart2", true)
local aramp1, aramp2
local aramp3

local Fenster = {}

local Knopf = {}
local Label = {}
local Grid = {}
	

local oamt_tunings = {
	{ "Kleine Reparatur", 50, "fix" },
	{ "Nitro auffüllen", 250, "fix" },
	{ "Sportmotor 1", 80000, "sportmotor" },
	{ "Sportmotor 2", 120000, "sportmotor" },
	{ "Sportmotor 3", 350000, "sportmotor" },
	{ "Sportmotor 4", 650000, "sportmotor" },
	{ "Bremse 1", 25000, "bremse" },
	{ "Bremse 2", 50000, "bremse" },
	{ "Bremse 3", 75000, "bremse" },
	{ "Bremse 4", 100000, "bremse" },
	{ "Frontantrieb", 40000, "antrieb" },
	{ "Heckantrieb", 40000, "antrieb" },
	{ "Allradantrieb", 40000, "antrieb" }
}

local function refreshOAMTGrid2(car)
	guiGridListClear(Grid[1])
	if isElement ( aramp2 ) and getElementData ( aramp2, "owner" ) and getElementData ( aramp2, "owner" ) ~= getPlayerName ( localPlayer ) then
		for i = 1, #oamt_tunings, 1 do
			local name, preis, data = oamt_tunings[i][1], oamt_tunings[i][2], oamt_tunings[i][3]
			local eingebaut = "-"
			if data == "sportmotor" then
				if getElementData ( aramp2, "sportmotor" ) >= i - 2 then
					eingebaut = "Ja"
				else
					eingebaut = "Nein"
				end
			elseif data == "bremse" then
				if getElementData ( aramp2, "bremse" ) >= i - 6 then
					eingebaut = "Ja"
				else
					eingebaut = "Nein"
				end
			elseif data == "antrieb" then
				local antrieb = getElementData ( aramp2, "antrieb" ) 
				if antrieb == "fwd" and name == "Frontantrieb" then 
					eingebaut = "Ja"
				elseif antrieb == "rwd" and name == "Heckantrieb" then
					eingebaut = "Ja"
				elseif antrieb == "awd" and name == "Allradantrieb" then
					eingebaut = "Ja"
				else
					eingebaut = "Nein"
				end
			end
			local Besitzer = getElementData (car[1], "owner")
			local model = getElementModel(car[1])
			local row = guiGridListAddRow(Grid[1])
			guiGridListSetItemText(Grid[1], row, 1, name, false, false)
			guiGridListSetItemText(Grid[1], row, 2, eingebaut, false, false)
			guiGridListSetItemText(Grid[1], row, 3, preis.."$", false, false)
		end	
	end
end


local function createOAMTGui2(car)
	if(GuivarMech == 1) then return end
	GuivarMech = 1
	showCursor(true)
	setElementClicked ( true )

	local sWidth, sHeight = guiGetScreenSize()
 
    local Width,Height = 404,330
    local X = (sWidth/2) - (Width/2)
    local Y = (sHeight/2) - (Height/2)
	
	Fenster[1] = guiCreateWindow(X, Y, Width, Height, "Mechaniker Tuningfenster",false)
	Label[1] = guiCreateLabel(11,21,384,52,"Willkommen an der Werkbank!\nHier kannst du aussuchen, was mit dem Auto in der Werkstatt\npassieren soll.",false,Fenster[1])
	guiSetFont(Label[1],"default-bold-small")
	Label[2] = guiCreateLabel(11,51,383,19,"______________________________________________________________",false,Fenster[1])
	guiLabelSetColor(Label[2],0, 120, 200)
	local t1 = "N/A"
	aramp2 = nil
	if(type(car) == "table") then
		if(isElement(car[1])) then
			t1 = getVehicleNameFromModel(getElementModel(car[1]))
			aramp2 = car[1]
		end
	end
	
	Label[3] = guiCreateLabel(12,79,380,34,"Werkstatt: "..t1,false,Fenster[1])
	guiSetFont(Label[3],"default-bold-small")
	Grid[1] = guiCreateGridList(15,163,226,158,false,Fenster[1])
	guiGridListSetSelectionMode(Grid[1],1)

	guiGridListAddColumn(Grid[1],"Aktion",0.5)

	guiGridListAddColumn(Grid[1],"Eingebaut",0.2)

	guiGridListAddColumn(Grid[1],"Preis",0.2)
	Knopf[1] = guiCreateButton(250,172,138,32,"Aktion durchführen",false,Fenster[1])
	Knopf[2] = guiCreateButton(252,279,138,32,"Abbrechen",false,Fenster[1])
	Knopf[3] = guiCreateButton(250,207,138,32,"Aktion entfernen",false,Fenster[1])
	guiSetEnabled(Knopf[3], false)
	refreshOAMTGrid2(car)
	-- EVENT HANDLERS --
	
	addEventHandler("onClientGUIClick", Knopf[1], function()
		local aktion, eingebaut, preis = guiGridListGetItemText(Grid[1], guiGridListGetSelectedItem(Grid[1]), 1), guiGridListGetItemText(Grid[1], guiGridListGetSelectedItem(Grid[1]), 2),  guiGridListGetItemText(Grid[1], guiGridListGetSelectedItem(Grid[1]), 3)
		if(aktion == "") then return end
		car = aramp2
		if(eingebaut == "Ja") then
			outputChatBox("Diese Aktion wurde bereits durchgeführt!", 200, 0, 0)
			return
		end
		triggerServerEvent("onVioOAmtCarTuning", getLocalPlayer(), car, aktion, tonumber(gettok(preis, 1, "$")))
	end, false)

	-- CANCEL BUTTON --
	addEventHandler("onClientGUIClick", Knopf[2], function()
		GuivarMech = 0
		destroyElement(Fenster[1])
		showCursor(false)
		setElementClicked ( false )
	end, false)
end
addEventHandler("onVioOrdnungsamtTuningGuiStart2", getLocalPlayer(), createOAMTGui2)