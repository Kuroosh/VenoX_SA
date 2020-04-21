local maindomane = "Wetter.com" -- Steht oben in der Browserleiste
 Domanes[maindomane]=maindomane
 -- Weitere Domanes, die zur Hauptdomane verlinken
 Domanes["wetter"]=maindomane
 Domanes["wetter.de"]=maindomane
 Domanes["wetter.com"]=maindomane
 Domanes["www.wetter.com"]=maindomane
 Domanes["www.wetter.de"]=maindomane

addEvent ( maindomane, true )
addEventHandler ( maindomane, getRootElement(), 
	function ()
		-- Hintergrundbild - Weitere Farben: black, blue, green, grey, lblue, red, white, yellow
		local img = createBasicPage ( "white" )
		-- Weitere GUI-Elemente auf img attachen
		
		GUIEditor_Window[1] = guiCreateWindow(523,132,298,187,"RC-Club",false)
		guiSetAlpha(GUIEditor_Window[1],1)
		GUIEditor_Button[1] = guiCreateButton(9,19,66,43,"Mitglied\nwerden",false,GUIEditor_Window[1])
		guiSetAlpha(GUIEditor_Button[1],1)
		guiSetFont(GUIEditor_Button[1],"default-bold-small")
		GUIEditor_Button[2] = guiCreateButton(85,44,67,43,"RC-Van\nkaufen",false,GUIEditor_Window[1])
		guiSetAlpha(GUIEditor_Button[2],1)
		guiSetFont(GUIEditor_Button[2],"default-bold-small")
		GUIEditor_Button[3] = guiCreateButton(9,72,66,43,"Schliessen",false,GUIEditor_Window[1])
		guiSetAlpha(GUIEditor_Button[3],1)
		guiSetFont(GUIEditor_Button[3],"default-bold-small")
		GUIEditor_Radio[1] = guiCreateRadioButton(162,27,119,20,"",false,GUIEditor_Window[1])
		guiSetAlpha(GUIEditor_Radio[1],1)
		GUIEditor_Radio[2] = guiCreateRadioButton(161,84,119,20,"",false,GUIEditor_Window[1])
		guiSetAlpha(GUIEditor_Radio[2],1)
		GUIEditor_Radio[3] = guiCreateRadioButton(161,56,120,20,"",false,GUIEditor_Window[1])
		guiSetAlpha(GUIEditor_Radio[3],1)
		GUIEditor_Label[1] = guiCreateLabel(11,123,278,64,"Im RC-Club kannst du Vans erwerben, von denen\naus du RC Fahrzeuge kontrollieren kannst.\nKosten:\n200 $ pro Beitritt sowie 50 $ / Abrechnung",false,GUIEditor_Window[1])
		guiSetAlpha(GUIEditor_Label[1],1)
		guiLabelSetColor(GUIEditor_Label[1],200,200,0)
		guiLabelSetVerticalAlign(GUIEditor_Label[1],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[1],"left",false)
		guiSetFont(GUIEditor_Label[1],"default-bold-small")
	end
)

--[[

"images/internet/bolt.png"
"images/internet/cloud.png"
"images/internet/rain.png"
"images/internet/sun.png"

]]