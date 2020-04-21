local maindomane = "fbi.rise"
 Domanes["www.fbi.de"]=maindomane
 Domanes["www.fbi.com"]=maindomane
 Domanes["www.fbi.net"]=maindomane
 Domanes["www.fbi.org"]=maindomane
 Domanes["fbi"]=maindomane
 
function showfbi_mail()
	showEmailSpecialWindow ( true, "admin@fbi.de" )
 end 
 
function fbi_func ()
img = createBasicPage ( "black" )
gImage["FBI2"] = guiCreateStaticImage(0,0,400,5,"images/colors/c_blue.jpg",false,img)
gImage["FBI3"] = guiCreateStaticImage(393,0,7,299,"images/colors/c_blue.jpg",false,img)
gImage["FBI4"] = guiCreateStaticImage(0,291,396,8,"images/colors/c_blue.jpg",false,img)
gImage["FBI5"] = guiCreateStaticImage(0,0,7,299,"images/colors/c_blue.jpg",false,img)
gImage["FBI6"] = guiCreateStaticImage(6,50,390,13,"images/colors/c_blue.jpg",false,img)
gImage["FBI7"] = guiCreateStaticImage(15,10,370,34,"images/colors/c_blue.jpg",false,img)
gLabel["FBI1"] = guiCreateLabel(112,49,187,17,"Federal Bureau of Investigation",false,img)
guiLabelSetColor(gLabel["FBI1"],255,255,255)
guiLabelSetVerticalAlign(gLabel["FBI1"],"top")
guiLabelSetHorizontalAlign(gLabel["FBI1"],"left",false)
guiSetFont(gLabel["FBI1"],"default-bold-small")
gLabel["FBI2"] = guiCreateLabel(163,3,74,45,"FBI",false,img)
guiLabelSetColor(gLabel["FBI2"],255,255,255)
guiLabelSetVerticalAlign(gLabel["FBI2"],"top")
guiLabelSetHorizontalAlign(gLabel["FBI2"],"left",false)
guiSetFont(gLabel["FBI2"],"sa-header")
gImage["FBI8"] = guiCreateStaticImage(40,74,316,218,"images/colors/c_blue.jpg",false,img)
gMemo["FBI1"] = guiCreateMemo(49,79,297,176,"Herzlich Willokmmen auf der Seite der \nFederal Bureau of Investigation.\nUnsere Hauptaufgaben bestehen darin, Waffentrucks abzufangen und Geiselnahmen zu verhindern. Natuerlich jagen wir auch mittel-gefaehrliche Kriminelle.\nDurch unsere Spezialausruestung koennen wir viele Sachen machen, wie z.b. Kriminelle abhoren.\n\nSie wollen den FBI beitreten? \nBewerben sie sich jetzt im Forum!",false,img)
guiMemoSetReadOnly(gMemo["FBI1"],true)
gImage["FBI9"] = guiCreateStaticImage(85,256,55,30,"images/internet/email.png",false,img)
gButton["FBI1"] = guiCreateButton(151,259,178,21,"Kontaktiere diese Fraktion",false,img)
gImage["FBI10"] = guiCreateStaticImage(37,284,326,7,"images/colors/c_black.jpg",false,img)
--addEventHandler("onClientGUIClick", gButton["FBI1"], showfbi_mail, false)
end
addEvent ( "fbi.vio", true )
addEventHandler ( "fbi.vio", getRootElement(), fbi_func )