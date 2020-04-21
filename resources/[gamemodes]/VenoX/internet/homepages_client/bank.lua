local maindomane = "bank.de"
 Domanes["www.bank.net"]=maindomane
 Domanes["www.bank.com"]=maindomane
 Domanes["www.geld.com"]=maindomane
 Domanes["www.onlinebanking.com"]=maindomane
 Domanes["bank"]=maindomane
 Domanes["bank.de"]=maindomane
 Domanes["www.faypal.net"]=maindomane
 Domanes["www.faypal.com"]=maindomane
 Domanes["www.geld.net"]=maindomane


function bank_func ()
	local bankmoney = vnxClientGetElementData("bankmoney")
	img = createBasicPage ( "black" )
	gImage["Bankbild1"] = guiCreateStaticImage(78,16,235,59,"images/internet/bank.png",false,img)
	gLabel["Bank1"] = guiCreateLabel(129,74,127,15,"Onlinebanking Service",false,img)
	guiLabelSetColor(gLabel["Bank1"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["Bank1"],"top")
	guiLabelSetHorizontalAlign(gLabel["Bank1"],"left",false)
	guiSetFont(gLabel["Bank1"],"default-bold-small")
	gEdit["Bank1"] = guiCreateEdit(119,129,143,31,"",false,img)
	gLabel["Bank2"] = guiCreateLabel(69,134,52,20,"Betrag :",false,img)
	guiLabelSetColor(gLabel["Bank2"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["Bank2"],"top")
	guiLabelSetHorizontalAlign(gLabel["Bank2"],"left",false)
	guiSetFont(gLabel["Bank2"],"default-bold-small")
	gImage["Bank3"] = guiCreateStaticImage(266,127,43,36,"images/dollar.png",false,img)
	gLabel["Bank3"] = guiCreateLabel(89,177,25,16,"An :",false,img)
	guiLabelSetColor(gLabel["Bank3"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["Bank3"],"top")
	guiLabelSetHorizontalAlign(gLabel["Bank3"],"left",false)
	guiSetFont(gLabel["Bank3"],"default-bold-small")
	gEdit["Bank2"] = guiCreateEdit(119,171,143,31,"",false,img)
	gButton["Bank1"] = guiCreateButton(80,253,244,37,"Ueberweisen",false,img)
	addEventHandler("onClientGUIClick", gButton["Bank1"], onlineueberweisen, false)
	gLabel["Bank4"] = guiCreateLabel(85,102,300,20,"Sie haben "..tostring(bankmoney).." $ auf der Bank.",false,img)
	guiLabelSetColor(gLabel["Bank4"],0,255,0)
	guiLabelSetVerticalAlign(gLabel["Bank4"],"top")
	guiLabelSetHorizontalAlign(gLabel["Bank4"],"left",false)
	guiSetFont(gLabel["Bank4"],"default-bold-small")
	gLabel["Bank5"] = guiCreateLabel(162,205,57,17,"Achtung:",false,img)
	guiLabelSetColor(gLabel["Bank5"],255,0,0)
	guiLabelSetVerticalAlign(gLabel["Bank5"],"top")
	guiLabelSetHorizontalAlign(gLabel["Bank5"],"left",false)
	guiSetFont(gLabel["Bank5"],"default-bold-small")
	gLabel["Bank6"] = guiCreateLabel(25,219,362,14,"Bei einer Onlineberweisung entsteht eine Bearbeitungsgebuehr",false,img)
	guiLabelSetColor(gLabel["Bank6"],255,0,0)
	guiLabelSetVerticalAlign(gLabel["Bank6"],"top")
	guiLabelSetHorizontalAlign(gLabel["Bank6"],"left",false)
	guiSetFont(gLabel["Bank6"],"default-bold-small")
	gLabel["Bank7"] = guiCreateLabel(92,233,227,16,"von 10$ pro Ueberweisung.",false,img)
	guiLabelSetColor(gLabel["Bank7"],255,0,0)
	guiLabelSetVerticalAlign(gLabel["Bank7"],"top")
	guiLabelSetHorizontalAlign(gLabel["Bank7"],"left",false)
	guiSetFont(gLabel["Bank7"],"default-bold-small")
end
addEvent ( "bank.de", true )
addEventHandler ( "bank.de", getRootElement(), bank_func )

function onlineueberweisen()
 local Summe = guiGetText(gEdit["Bank1"])
 local Target = guiGetText(gEdit["Bank2"])
 triggerServerEvent("Ueberweisen", lp, Summe, Target, true)
end