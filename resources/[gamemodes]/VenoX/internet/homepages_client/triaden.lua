local maindomane = "triaden.rise"
 Domanes["www.triaden.de"]=maindomane
 Domanes["www.triaden.com"]=maindomane
 Domanes["www.triaden.net"]=maindomane
 Domanes["www.triaden.org"]=maindomane
 Domanes["triaden"]=maindomane
 
function showtriaden_mail()
	showEmailSpecialWindow ( true, "admin@triaden.de" )
end
 
function triaden_func ()
img = createBasicPage ( "red" )
gLabel["Triaden1"] = guiCreateLabel(125,3,157,50,"Triaden",false,img)
guiLabelSetColor(gLabel["Triaden1"],255,255,255)
guiLabelSetVerticalAlign(gLabel["Triaden1"],"top")
guiLabelSetHorizontalAlign(gLabel["Triaden1"],"left",false)
guiSetFont(gLabel["Triaden1"],"sa-gothic")
gImage["Triaden2"] = guiCreateStaticImage(0,57,400,7,"images/colors/c_black.jpg",false,img)
gImage["Triaden3"] = guiCreateStaticImage(0,76,400,8,"images/colors/c_black.jpg",false,img)
gLabel["Triaden2"] = guiCreateLabel(114,62,183,13,"Wir sind die Macht in San Fierro !",false,img)
guiLabelSetColor(gLabel["Triaden2"],255,255,255)
guiLabelSetVerticalAlign(gLabel["Triaden2"],"top")
guiLabelSetHorizontalAlign(gLabel["Triaden2"],"left",false)
guiSetFont(gLabel["Triaden2"],"default-bold-small")
gImage["Triaden4"] = guiCreateStaticImage(0,57,111,21,"images/colors/c_black.jpg",false,img)
gImage["Triaden5"] = guiCreateStaticImage(297,57,34,27,"images/pokal.jpg",false,img)
gImage["Triaden6"] = guiCreateStaticImage(327,60,73,20,"images/colors/c_black.jpg",false,img)
gImage["Triaden7"] = guiCreateStaticImage(70,57,38,27,"images/pokal.jpg",false,img)
gImage["Triaden8"] = guiCreateStaticImage(0,0,110,57,"images/colors/c_black.jpg",false,img)
gImage["Triaden9"] = guiCreateStaticImage(295,0,105,58,"images/colors/c_black.jpg",false,img)
gImage["Triaden10"] = guiCreateStaticImage(0,84,110,215,"images/colors/c_black.jpg",false,img)
gImage["Triaden11"] = guiCreateStaticImage(294,83,106,216,"images/colors/c_black.jpg",false,img)
gImage["Triaden12"] = guiCreateStaticImage(293,51,107,6,"images/colors/c_red.jpg",false,img)
gImage["Triaden13"] = guiCreateStaticImage(0,51,115,6,"images/colors/c_red.jpg",false,img)
gImage["Triaden14"] = guiCreateStaticImage(0,84,400,5,"images/colors/c_red.jpg",false,img)
gImage["Triaden15"] = guiCreateStaticImage(116,271,41,27,"images/internet/email.png",false,img)
gButton["Triaden1"] = guiCreateButton(157,271,133,25,"E-Mail an die Fraktion",false,img)
gMemo["Triaden1"] = guiCreateMemo(5,102,390,167,"Herzlich Wilkommen auf der Homepage der Triaden, die stärkste Fraktion auf Rise! Wir haben unseren Hauptsitz in Chinatown, SF.\nUnsere Hauptaufgabe besteht aus Geiselnahmen und organisierte\nVerbrechen wie z.b. Raubueberfaelle.\nNebensaechlich kuemmern wir uns natuerlich auch im kleinere Ver-\nbrechen wie z.B. Drogenhandel.\nAls Spezialwaffen besitzen wir Kartanas.\n\nInteresse bekommen?\nWir suchen staendig neue Mitglieder ! Einfach im Forum bewerben!",false,img)
guiMemoSetReadOnly(gMemo["Triaden1"],true)
--addEventHandler("onClientGUIClick", gButton["Triaden1"], showtriaden_mail, false)
end
addEvent ( "triaden.vio", true )
addEventHandler ( "triaden.vio", getRootElement(), triaden_func )