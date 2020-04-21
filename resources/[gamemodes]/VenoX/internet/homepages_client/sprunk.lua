local maindomane = "sprunk.de"
 Domanes["www.sprunk.net"]=maindomane
 Domanes["www.sprunk.com"]=maindomane
 Domanes["www.durst.de"]=maindomane
 Domanes["www.sprunk-online.com"]=maindomane
 Domanes["sprunk"]=maindomane
 Domanes["www.trinken.net"]=maindomane
 Domanes["www.trinken.com"]=maindomane
 Domanes["www.trinken.de"]=maindomane

function sprunk_func ()
	img = createBasicPage ( "green" )
	gImage["Sprunk2"] = guiCreateStaticImage(83,0,223,99,"images/internet/Sprunk.png",false,img)
	gLabel["Sprunk1"] = guiCreateLabel(25,104,348,14,"Sprunk ist das erfrischendeste Getraenk in ganz San Andreas",false,img)
	guiLabelSetColor(gLabel["Sprunk1"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["Sprunk1"],"top")
	guiLabelSetHorizontalAlign(gLabel["Sprunk1"],"left",false)
	guiSetFont(gLabel["Sprunk1"],"default-bold-small")
	gImage["Sprunk3"] = guiCreateStaticImage(-1,97,401,5,"images/colors/c_black.jpg",false,img)
	gLabel["Sprunk2"] = guiCreateLabel(53,117,278,14,"In ganz SanFierro sind Sprunkautomaten verteilt.",false,img)
	guiLabelSetColor(gLabel["Sprunk2"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["Sprunk2"],"top")
	guiLabelSetHorizontalAlign(gLabel["Sprunk2"],"left",false)
	guiSetFont(gLabel["Sprunk2"],"default-bold-small")
	gMemo["Sprunk1"] = guiCreateMemo(268,202,127,94,"Zutaten (100ml):\n- 60g Zucker\n- 10g Fett\n- 25ml Wasser\n- 5ml Kafee",false,img)
	guiMemoSetReadOnly(gMemo["Sprunk1"],true)
	gLabel["Sprunk3"] = guiCreateLabel(100,148,181,15,"Eine Dose Sprunk kostet nur 1$",false,img)
	guiLabelSetColor(gLabel["Sprunk3"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["Sprunk3"],"top")
	guiLabelSetHorizontalAlign(gLabel["Sprunk3"],"left",false)
	guiSetFont(gLabel["Sprunk3"],"default-bold-small")
	gLabel["Sprunk4"] = guiCreateLabel(55,152,289,47,"Sagenhaft Guenstig !",false,img)
	guiLabelSetColor(gLabel["Sprunk4"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["Sprunk4"],"top")
	guiLabelSetHorizontalAlign(gLabel["Sprunk4"],"left",false)
	guiSetFont(gLabel["Sprunk4"],"sa-header")
	gImage["Sprunk4"] = guiCreateStaticImage(-2,134,401,5,"images/colors/c_black.jpg",false,img)
	gImage["Sprunk5"] = guiCreateStaticImage(-1,193,401,6,"images/colors/c_black.jpg",false,img)
	gImage["Sprunk6"] = guiCreateStaticImage(-1,199,401,100,"images/colors/c_red.jpg",false,img)
	guiMoveToBack(gImage["Sprunk6"])
	gLabel["Sprunk5"] = guiCreateLabel(9,205,257,90,"Alle Zutaten werden stets Kontrolliert \nund sind nicht gesundheitsschdlich.\nDafue stehen wir mit unseren Namen!\n\nKommen sie zu unserer Fabrik am Hafen\nwenn sie sich selber ueberzeugen wollen",false,img)
	guiLabelSetColor(gLabel["Sprunk5"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["Sprunk5"],"top")
	guiLabelSetHorizontalAlign(gLabel["Sprunk5"],"left",false)
	guiSetFont(gLabel["Sprunk5"],"default-bold-small")
	gImage["Sprunk7"] = guiCreateStaticImage(0,0,400,97,"images/colors/c_red.jpg",false,img)
	guiMoveToBack(gImage["Sprunk7"])
end
addEvent ( "sprunk.de", true )
addEventHandler ( "sprunk.de", getRootElement(), sprunk_func )