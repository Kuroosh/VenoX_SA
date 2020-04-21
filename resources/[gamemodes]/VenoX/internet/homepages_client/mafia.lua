local maindomane = "mafia.rise"
 Domanes["www.mafia.de"]=maindomane
 Domanes["www.mafia.com"]=maindomane
 Domanes["www.mafia.net"]=maindomane
 Domanes["www.mafia.org"]=maindomane
 Domanes["mafia"]=maindomane
 
 function showmafia_mail()
 showEmailSpecialWindow ( true, "admin@mafia.de" )
 end
 
function mafia_func ()
img = createBasicPage ("black")
gImage["Mafia2"] = guiCreateStaticImage(0,0,5,299,"images/colors/c_grey.jpg",false,img)
gImage["Mafia3"] = guiCreateStaticImage(395,0,5,299,"images/colors/c_grey.jpg",false,img)
gImage["Mafia4"] = guiCreateStaticImage(0,295,399,5,"images/colors/c_grey.jpg",false,img)
gImage["Mafia5"] = guiCreateStaticImage(0,0,396,5,"images/colors/c_grey.jpg",false,img)
gLabel["Mafia1"] = guiCreateLabel(129,14,130,54,"Mafia",false,img)
guiLabelSetColor(gLabel["Mafia1"],255,255,255)
guiLabelSetVerticalAlign(gLabel["Mafia1"],"top")
guiLabelSetHorizontalAlign(gLabel["Mafia1"],"left",false)
guiSetFont(gLabel["Mafia1"],"sa-header")
gImage["Mafia6"] = guiCreateStaticImage(263,17,41,49,"images/dollar.png",false,img)
gImage["Mafia7"] = guiCreateStaticImage(76,17,43,51,"images/dollar.png",false,img)
gImage["Mafia8"] = guiCreateStaticImage(2,66,398,5,"images/colors/c_grey.jpg",false,img)
gLabel["Mafia2"] = guiCreateLabel(305,48,79,14,".com",false,img)
guiLabelSetColor(gLabel["Mafia2"],255,255,255)
guiLabelSetVerticalAlign(gLabel["Mafia2"],"top")
guiLabelSetHorizontalAlign(gLabel["Mafia2"],"left",false)
gImage["Mafia9"] = guiCreateStaticImage(80,68,256,231,"images/colors/c_grey.jpg",false,img)
gImage["Mafia10"] = guiCreateStaticImage(2,81,395,5,"images/colors/c_grey.jpg",false,img)
gImage["Mafia11"] = guiCreateStaticImage(34,71,338,10,"images/colors/c_black.jpg",false,img)
gLabel["Mafia3"] = guiCreateLabel(95,68,209,14,"Niemand hat gegen uns eine Chance!",false,img)
guiLabelSetColor(gLabel["Mafia3"],255,255,255)
guiLabelSetVerticalAlign(gLabel["Mafia3"],"top")
guiLabelSetHorizontalAlign(gLabel["Mafia3"],"left",false)
guiSetFont(gLabel["Mafia3"],"default-bold-small")
gImage["Mafia12"] = guiCreateStaticImage(77,86,259,6,"images/colors/c_black.jpg",false,img)
gImage["Mafia13"] = guiCreateStaticImage(79,289,258,6,"images/colors/c_black.jpg",false,img)
gMemo["Mafia1"] = guiCreateMemo(19,98,361,164,"Herzlich Wilkommen auf der Homepage der Mafia.\nDie Aufgaben eines Mafiosis, sind hauptsaechlich organisierte Verbrechen, wie z.B. Schutzgelderpressungen oder Geiselnahmen. Die Mafia ist aber auch im Drogen- und Waffenhandel aktiv.  Unsere Don-Villa und somit unser Hauptsitz befindet sich Nordoestlich von San-Fierro.\n\nFuer weitere Informationen, schreiben sie uns eine Mail oder\nbesuchen sie uns im Forum. Dort koenne sie sich auch\nbewerben. Wir brauchen immer neue Mafiosi !",false,img)
guiMemoSetReadOnly(gMemo["Mafia1"],true)
gImage["Mafia14"] = guiCreateStaticImage(95,262,35,25,"images/internet/email.png",false,img)
gButton["Mafia1"] = guiCreateButton(136,263,183,22,"Kontaktiere diese Fraktion !",false,img)
--addEventHandler("onClientGUIClick", gButton["Mafia1"], showmafia_mail, false)
end
addEvent ( "mafia.vio", true )
addEventHandler ( "mafia.vio", getRootElement(), mafia_func )