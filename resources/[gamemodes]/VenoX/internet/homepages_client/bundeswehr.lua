local maindomane = "Bundeswehr.rise"
 Domanes["www.Bundeswehr.de"]=maindomane
 Domanes["www.Bundeswehr.com"]=maindomane
 Domanes["www.Bundeswehr.net"]=maindomane
 Domanes["www.Bundeswehr.org"]=maindomane
 Domanes["Bundeswehr"]=maindomane
 
 function showbundeswehr_mail()
	showEmailSpecialWindow ( true, "admin@bundeswehr.de" )
 end 
 
function Bundeswehr_func ()
img = createBasicPage ( "green" )
gImage["Bundeswehr2"] = guiCreateStaticImage(56,83,279,215,"images/colors/c_grey.jpg",false,img)
gImage["Bundeswehr3"] = guiCreateStaticImage(0,295,400,5,"images/colors/c_grey.jpg",false,img)
gImage["Bundeswehr4"] = guiCreateStaticImage(395,0,5,297,"images/colors/c_grey.jpg",false,img)
gImage["Bundeswehr5"] = guiCreateStaticImage(0,0,5,297,"images/colors/c_grey.jpg",false,img)
gImage["Bundeswehr6"] = guiCreateStaticImage(-1,0,399,7,"images/colors/c_grey.jpg",false,img)
gImage["Bundeswehr7"] = guiCreateStaticImage(56,14,279,49,"images/colors/c_grey.jpg",false,img)
gImage["Bundeswehr8"] = guiCreateStaticImage(2,71,397,5,"images/colors/c_grey.jpg",false,img)
gImage["Bundeswehr9"] = guiCreateStaticImage(44,3,5,294,"images/colors/c_grey.jpg",false,img)
gImage["Bundeswehr10"] = guiCreateStaticImage(342,2,5,297,"images/colors/c_grey.jpg",false,img)
gButton["Bundeswehr1"] = guiCreateButton(137,269,167,23,"Kontaktiere diese Fraktion",false,img)
gImage["Bundeswehr11"] = guiCreateStaticImage(97,268,40,26,"images/internet/email.png",false,img)
gMemo["Bundeswehr1"] = guiCreateMemo(6,88,389,178,"Herzlich Willkommen auf der Homepage der Bundeswehr,\n\nWir sind fuer besonders schwere Verbrecher zustaendig.\nEs gibt bei uns viele verschiedene Raenge und Klassen.\nWir bilden ausserdem die GWD-Bewerber aus.\nSie brauchen den GWD um in manchen Fraktionen wie z.b. dem SFPD oder den FBI beizutreten. Wenn sie eine gute GWD Note (80%+) erreichen, sind sie sogar qualifiziert der Bundeswehr als Soldat beizutreten.\n\nBewerben sie sich fuer den GWD im Forum !",false,img)
gLabel["Bundeswehr1"] = guiCreateLabel(78,13,241,52,"Bundeswehr",false,img)
guiLabelSetColor(gLabel["Bundeswehr1"],0,0,0)
guiLabelSetVerticalAlign(gLabel["Bundeswehr1"],"top")
guiLabelSetHorizontalAlign(gLabel["Bundeswehr1"],"left",false)
guiSetFont(gLabel["Bundeswehr1"],"sa-header")
--addEventHandler("onClientGUIClick", gButton["Bundeswehr1"], showbundeswehr_mail, false)
end
addEvent ( "Bundeswehr.vio", true )
addEventHandler ( "Bundeswehr.vio", getRootElement(), Bundeswehr_func )