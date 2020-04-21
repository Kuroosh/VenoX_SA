function VierNullVier_func ()

	local img = createBasicPage ( "white" )
	gLabel["404-1"] = guiCreateLabel(170,135,999,999,"Fehler 404:\nSeite nicht gefunden.",false,img)
	guiLabelSetColor(gLabel["404-1"],0,0,0)
	guiLabelSetVerticalAlign(gLabel["404-1"],"top")
	guiLabelSetHorizontalAlign(gLabel["404-1"],"left",false)
end
addEvent ( "VierNullVier", true )
addEventHandler ( "VierNullVier", getRootElement(), VierNullVier_func )