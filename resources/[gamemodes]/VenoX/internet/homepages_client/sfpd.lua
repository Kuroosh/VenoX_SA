local maindomane = "sfpd.rise"
 Domanes["www.sfpd.de"]=maindomane
 Domanes["www.sfpd.com"]=maindomane
 Domanes["www.sfpd.net"]=maindomane
 Domanes["www.sfpd.org"]=maindomane
 Domanes["sfpd"]=maindomane
 Domanes["www.polizei.de"]=maindomane
 Domanes["www.polizei.com"]=maindomane
 Domanes["www.polizei.net"]=maindomane
 Domanes["www.polizei.org"]=maindomane
 Domanes["polizei"]=maindomane
 
 function showcop_mail()
	showEmailSpecialWindow ( true, "admin@sfpd.de" )
 end

 
function sfpd_func ()
img = createBasicPage ( "blue" )
gImage["SFPD2"] = guiCreateStaticImage(0,0,11,270,"images/colors/c_black.jpg",false,img)
gImage["SFPD3"] = guiCreateStaticImage(0,258,360,12,"images/colors/c_black.jpg",false,img)
gImage["SFPD4"] = guiCreateStaticImage(349,0,11,268,"images/colors/c_black.jpg",false,img)
gImage["SFPD5"] = guiCreateStaticImage(76,6,209,62,"images/colors/c_black.jpg",false,img)
gLabel["SFPD1"] = guiCreateLabel(96,8,168,52,"SFPD",false,img)
guiLabelSetColor(gLabel["SFPD1"],255,255,0)
guiLabelSetVerticalAlign(gLabel["SFPD1"],"top")
guiLabelSetHorizontalAlign(gLabel["SFPD1"],"left",false)
guiSetFont(gLabel["SFPD1"],"sa-header")
gImage["SFPD6"] = guiCreateStaticImage(9,0,343,6,"images/colors/c_black.jpg",false,img)
gMemo["SFPD1"] = guiCreateMemo(15,79,330,140,"Wir, das SFPD kuemmern uns um kleinere Verbrechen und fuehren allgemeine Strassenkontrollen durch.\nWir eilen ausserdem dem FBI und der sfpd zur Hilfe, wenn sie Hilfe benoetigen. Auerdem gehort das Abschleppen von falsch geparkten Autos zu dem Aufgabenfeld des SFPDs.\n\nInteresse bekommen? Jetzt im Forum bewerben !",false,img)
gButton["SFPD1"] = guiCreateButton(132,223,145,30,"Nachricht an diese Fraktion schicken",false,img)
gImage["SFPD7"] = guiCreateStaticImage(82,224,43,31,"images/internet/email.png",false,img)
gImage["SFPD8"] = guiCreateStaticImage(349,258,10,10,"images/pokal.jpg",false,img)
gImage["SFPD9"] = guiCreateStaticImage(-1,258,13,11,"images/pokal.jpg",false,img)
--addEventHandler("onClientGUIClick", gButton["SFPD1"], showtriaden_mail, false)
end
addEvent ( "sfpd.vio", true )
addEventHandler ( "sfpd.vio", getRootElement(), sfpd_func )