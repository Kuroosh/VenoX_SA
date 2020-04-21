------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------
---- Script by Noneatme ------

local Guivar = 0
local Fenster = {}
local Knopf = {}
local Label = {}

addEvent("doLAGetWeihnachtsDateBack", true)
addEvent("doLAClientShowWeinachtsTuerchen", true)

function createAdventsKalender()
	if(Guivar == 1) then return end
	Guivar = 1
	showCursor(true)
	setElementData ( getLocalPlayer(), "ElementClicked", true )
	local X, Y, Width, Height = getMiddleGuiPosition(421,245)
	Fenster[1] = guiCreateWindow(X, Y, Width, Height, "Adventskalender",false)
	Knopf[19] = guiCreateButton(244,132,52,50,"19",false,Fenster[1])
	guiSetFont(Knopf[19],"default-bold-small")
	Knopf[20] = guiCreateButton(302,132,52,50,"20",false,Fenster[1])
	guiSetFont(Knopf[20],"default-bold-small")
	Knopf[15] = guiCreateButton(10,132,52,50,"15",false,Fenster[1])
	guiSetFont(Knopf[15],"default-bold-small")
	Knopf[16] = guiCreateButton(68,132,52,50,"16",false,Fenster[1])
	guiSetFont(Knopf[16],"sa-header")
	Knopf[17] = guiCreateButton(128,132,52,50,"17",false,Fenster[1])
	guiSetFont(Knopf[17],"default-bold-small")
	Knopf[18] = guiCreateButton(186,132,52,50,"18",false,Fenster[1])
	guiSetFont(Knopf[18],"default-bold-small")
	Knopf[21] = guiCreateButton(359,132,51,50,"21",false,Fenster[1])
	guiSetFont(Knopf[21],"default-bold-small")
	Knopf[5] = guiCreateButton(244,22,52,50,"5",false,Fenster[1])
	guiSetFont(Knopf[5],"default-bold-small")
	Knopf[6] = guiCreateButton(302,22,52,50,"6",false,Fenster[1])
	guiSetFont(Knopf[6],"default-bold-small")
	Knopf[1] = guiCreateButton(10,22,52,50,"1",false,Fenster[1])
	guiSetFont(Knopf[1],"default-bold-small")
	Knopf[2] = guiCreateButton(68,22,52,50,"2",false,Fenster[1])
	guiSetFont(Knopf[2],"sa-header")
	Knopf[3] = guiCreateButton(128,22,52,50,"3",false,Fenster[1])
	guiSetFont(Knopf[3],"default-bold-small")
	Knopf[4] = guiCreateButton(186,22,52,50,"4",false,Fenster[1])
	guiSetFont(Knopf[4],"default-bold-small")
	Knopf[7] = guiCreateButton(359,22,52,50,"7",false,Fenster[1])
	guiSetFont(Knopf[7],"default-bold-small")
	Knopf[12] = guiCreateButton(244,77,52,50,"12",false,Fenster[1])
	guiSetFont(Knopf[12],"default-bold-small")
	Knopf[13] = guiCreateButton(302,77,52,50,"13",false,Fenster[1])
	guiSetFont(Knopf[13],"default-bold-small")
	Knopf[8] = guiCreateButton(10,77,52,50,"8",false,Fenster[1])
	guiSetFont(Knopf[8],"default-bold-small")
	Knopf[9] = guiCreateButton(68,77,52,50,"9",false,Fenster[1])
	guiSetFont(Knopf[9],"sa-header")
	Knopf[10] = guiCreateButton(128,77,52,50,"10",false,Fenster[1])
	guiSetFont(Knopf[10],"default-bold-small")
	Knopf[11] = guiCreateButton(186,77,52,50,"11",false,Fenster[1])
	guiSetFont(Knopf[11],"default-bold-small")
	Knopf[14] = guiCreateButton(359,77,52,50,"14",false,Fenster[1])
	guiSetFont(Knopf[14],"default-bold-small")
	Knopf[22] = guiCreateButton(127,184,51,50,"22",false,Fenster[1])
	guiSetFont(Knopf[22],"default-bold-small")
	Knopf[23] = guiCreateButton(186,184,51,50,"23",false,Fenster[1])
	guiSetFont(Knopf[23],"sa-header")
	Knopf[24] = guiCreateButton(245,184,51,50,"24",false,Fenster[1])
	guiSetFont(Knopf[24],"sa-header")
	Knopf[25] = guiCreateButton(360,185,51,50,"31",false,Fenster[1])
	guiSetFont(Knopf[25],"default-bold-small")
	Knopf[26] = guiCreateButton(10,188,110,41,"Schliessen",false,Fenster[1])
	local X, Y, Width, Height = getMiddleGuiPosition(421,115)
	local sx, sy = guiGetScreenSize()
	Fenster[2] = guiCreateWindow(X, Y-(180/900*sy), Width, Height, "",false)
	Label[1] = guiCreateLabel(10,20,362,19,"Dein Gewinn/Auftrag: ",false,Fenster[2])
	guiSetFont(Label[1],"default-bold-small")
	Label[2] = guiCreateLabel(8,44,404,62,"-",false,Fenster[2])
	guiSetFont(Label[2],"default-bold-small")
	guiSetVisible(Fenster[2], false)
	guiLabelSetColor(Label[2], 0, 255, 0)
	
	for i = 1, #Knopf-1, 1 do
		if(isElement(Knopf[i])) then
			guiSetEnabled(Knopf[i], false)
		end
	end
	-- CANCEL --
	addEventHandler("onClientGUIClick", Knopf[26], function()
		destroyElement(Fenster[1])
		showCursor(false)
		Guivar = 0
		destroyElement(Fenster[2])
		setElementData ( getLocalPlayer(), "ElementClicked", false )
	end, false)
	
	for i = 1, #Knopf-1, 1 do
		addEventHandler("onClientGUIClick", Knopf[i], function()
			triggerServerEvent("doLATuerchenOeffne", localPlayer, guiGetText(source))
			guiSetText(Fenster[2], "Adventskalender, Türchen "..guiGetText(source))
		end, false)
	end
	
	triggerServerEvent("doLAGetWeihnachtsDate", localPlayer)
end

addEventHandler("doLAGetWeihnachtsDateBack", getLocalPlayer(), function(month, day)
	for i = 1, day, 1 do
		if(isElement(Knopf[i])) then
			guiSetEnabled(Knopf[i], true)
		end
	end
end)


addEventHandler("doLAClientShowWeinachtsTuerchen", getLocalPlayer(), function(text1, text2)
	guiSetVisible(Fenster[2], true)
	guiSetText(Label[1], "Dein Gewinn/Auftrag: "..text1)
	guiSetText(Label[2], text2)
end)
