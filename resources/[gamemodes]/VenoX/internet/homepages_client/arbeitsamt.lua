local maindomane = "Arbeitsamt.de"
 Domanes["www.Arbeitsamt.de"]=maindomane
 Domanes["Arbeitsamt"]=maindomane
 Domanes["Arbeitsamt.com"]=maindomane
 Domanes["Job"]=maindomane
 Domanes["www.Job.de"]=maindomane
 Domanes["www.Arbeit.de"]=maindomane
 Domanes["Geld"]=maindomane
 Domanes["www.Amt.de"]=maindomane

function Arbeitsamt_func ()
img = createBasicPage ( "black" )
gImage["Arge2"] = guiCreateStaticImage(0,34,5,265,"images/colors/c_white.jpg",false,img)
gImage["Arge3"] = guiCreateStaticImage(394,35,6,264,"images/colors/c_white.jpg",false,img)
gImage["Arge4"] = guiCreateStaticImage(0,0,400,57,"images/colors/c_red.jpg",false,img)
gLabel["Arge1"] = guiCreateLabel(48,0,303,58,"Arbeitsagentur",false,img)
guiLabelSetColor(gLabel["Arge1"],255,255,255)
guiLabelSetVerticalAlign(gLabel["Arge1"],"top")
guiLabelSetHorizontalAlign(gLabel["Arge1"],"left",false)
guiSetFont(gLabel["Arge1"],"sa-gothic")
gImage["Arge5"] = guiCreateStaticImage(0,293,395,6,"images/colors/c_white.jpg",false,img)
gImage["Arge6"] = guiCreateStaticImage(3,57,393,5,"images/colors/c_white.jpg",false,img)
gLabel["Arge2"] = guiCreateLabel(111,73,160,15,"Sie wollen einen neuen Job?",false,img)
guiLabelSetColor(gLabel["Arge2"],255,255,255)
guiLabelSetVerticalAlign(gLabel["Arge2"],"top")
guiLabelSetHorizontalAlign(gLabel["Arge2"],"left",false)
guiSetFont(gLabel["Arge2"],"default-bold-small")
gLabel["Arge3"] = guiCreateLabel(89,92,209,17,"Sie finden aber keinen Arbeitgeber?",false,img)
guiLabelSetColor(gLabel["Arge3"],255,255,255)
guiLabelSetVerticalAlign(gLabel["Arge3"],"top")
guiLabelSetHorizontalAlign(gLabel["Arge3"],"left",false)
guiSetFont(gLabel["Arge3"],"default-bold-small")
gImage["Arge7"] = guiCreateStaticImage(19,70,46,35,"images/dollar.png",false,img)
gImage["Arge8"] = guiCreateStaticImage(311,73,45,35,"images/dollar.png",false,img)
gLabel["Arge4"] = guiCreateLabel(69,122,258,41,"Wir helfen Ihnen !",false,img)
guiLabelSetColor(gLabel["Arge4"],255,255,255)
guiLabelSetVerticalAlign(gLabel["Arge4"],"top")
guiLabelSetHorizontalAlign(gLabel["Arge4"],"left",false)
guiSetFont(gLabel["Arge4"],"sa-header")
gMemo["Arge1"] = guiCreateMemo(11,163,378,125,"Wir haben in unserer Beratungsstelle immer Zeit fuer sie.\nTreten sie einfach naeher und suchen sie sich einen Job aus,\nder zu Ihnen passt. Wir haben immer viele freie Stellen zur Verfuegung. Kommen sie einfach zur Stadtverwaltung und lassen sie sich beraten. Moegliche Jobs sind z.b. Fischer, Taxifahrer, Mechaniker, Trucker, Flughafenmitarbeiter oder HotDog Verkaeufer. Kommen sie einfach vorbei!",false,img)
gImage["Arge9"] = guiCreateStaticImage(0,0,400,5,"images/colors/c_black.jpg",false,img)
gImage["Arge10"] = guiCreateStaticImage(-1,3,7,54,"images/colors/c_black.jpg",false,img)
gImage["Arge11"] = guiCreateStaticImage(394,1,6,56,"images/colors/c_black.jpg",false,img)

end
addEvent ( "Arbeitsamt.de", true )
addEventHandler ( "Arbeitsamt.de", getRootElement(), Arbeitsamt_func )