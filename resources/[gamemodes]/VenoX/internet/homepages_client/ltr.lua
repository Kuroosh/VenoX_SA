local maindomane = "ltr.de"
 Domanes["www.liberty-tree-redaktion.de"]=maindomane
 Domanes["ltr"]=maindomane
 Domanes["ltr.com"]=maindomane
 Domanes["liberty-tree-redaktion"]=maindomane
 Domanes["www.news.de"]=maindomane
 Domanes["www.zeitung.de"]=maindomane
 Domanes["news"]=maindomane
 Domanes["www.news.com"]=maindomane

function ltr_func ()
	img = createBasicPage ( "black" )
	gImage["LTR2"] = guiCreateStaticImage(31,0,330,91,"images/liberty_tree.png",false,img)
	gImage["LTR3"] = guiCreateStaticImage(12,87,376,18,"images/colors/c_green.jpg",false,img)
	gButton["LTR1"] = guiCreateButton(41,250,135,38,"E-Mail an die Fraktion",false,img)
	gButton["LTR2"] = guiCreateButton(232,250,123,39,"Zeitung lesen!",false,img)
	gMemo["LTR1"] = guiCreateMemo(12,115,376,124,"Liberty Tree - \"The Truth is, what you make of it!\"\n- Getreu diesem Motto berrichten wir ueber alles und jeden,\nder noch keine Unterlassungsklage gegen uns eingereicht hat.\n\nUnd jetzt neu: Unsere Zeitung als E-Book erwerben!\nIhre Liberty-Tree-Redaktion",false,img)
	guiMemoSetReadOnly(gMemo["LTR1"],true)
	gLabel["LTR1"] = guiCreateLabel(135,88,117,15,"Wir informieren sie !",false,img)
	guiLabelSetColor(gLabel["LTR1"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["LTR1"],"top")
	guiLabelSetHorizontalAlign(gLabel["LTR1"],"left",false)
	guiSetFont(gLabel["LTR1"],"default-bold-small")
end
addEvent ( "ltr.de", true )
addEventHandler ( "ltr.de", getRootElement(), ltr_func )