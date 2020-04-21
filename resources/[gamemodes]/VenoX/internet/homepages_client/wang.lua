local maindomane = "wang-cars.de"
 Domanes["www.wang-cars.de"]=maindomane
 Domanes["wang"]=maindomane
 Domanes["cars"]=maindomane
 Domanes["wang-cars"]=maindomane
 Domanes["www.wang-cars.com"]=maindomane
 Domanes["www.wangcars.de"]=maindomane
 Domanes["auto"]=maindomane
 Domanes["www.wang.com"]=maindomane

function wang_func ()

	img = createBasicPage ( "black" )
	gLabel["wang1"] = guiCreateLabel(16,27,372,255,"       Willkommen auf der offiziellen Web Site von WangCars",false,img)
	guiLabelSetColor(gLabel["wang1"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["wang1"],"top")
	guiLabelSetHorizontalAlign(gLabel["wang1"],"left",false)
	guiSetFont(gLabel["wang1"],"default-bold-small")
	gLabel["wang2"] = guiCreateLabel(11,46,380,239,"Erleben Sie die Vielfalt von WangCars bei uns in San Fierro. Unser \nAngebot umfasst eine grosse Anzahl an Fahrzeugen in allen \nKategorien. Bei uns erwartet Sie ein direkter und hoeflicher Umgang \nmit Kunden und ein erstklassiger Service direkt vor Ort.\nSie werden schnell merken, dass Ihr Auto bei uns in besten \nHaenden liegt. Fuer genauere Daten\nbesuchen Sie das Forum unter www.FORUMADRESSE",false,img)
	guiLabelSetColor(gLabel["wang2"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["wang2"],"top")
	guiLabelSetHorizontalAlign(gLabel["wang2"],"left",false)
	guiSetFont(gLabel["wang1"],"default-bold-small")
	gMemo["wang1"] = guiCreateMemo(7,166,375,34,"http://FORUMADRESSE/index.php?page=thread&threadid=4591",false,img)
	guiMemoSetReadOnly(gMemo["wang1"],true)
	gImage["wang2"] = guiCreateStaticImage(156,209,81,62,"images/internet/wang.png",false,img)
	gLabel["wang3"] = guiCreateLabel(95,252,26,8,"",false,img)
	guiLabelSetColor(gLabel["wang3"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["wang3"],"top")
	guiLabelSetHorizontalAlign(gLabel["wang3"],"left",false)
	gLabel["wang4"] = guiCreateLabel(10,3,385,23,"                                          WangCars - Wir l(i)eben Autos",false,img)
	guiLabelSetColor(gLabel["wang4"],255,255,255)
	guiLabelSetVerticalAlign(gLabel["wang4"],"top")
	guiLabelSetHorizontalAlign(gLabel["wang4"],"left",false)
	guiSetFont(gLabel["wang4"],"default-small")
	gLabel["wang5"] = guiCreateLabel(4,271,394,28,"                         ..und am achten Tage schufen wir das Auto",false,img)
	guiLabelSetColor(gLabel["wang5"],230,230,230)
	guiLabelSetVerticalAlign(gLabel["wang5"],"top")
	guiLabelSetHorizontalAlign(gLabel["wang5"],"left",false)
	guiSetFont(gLabel["wang5"],"default-bold-small")
end
addEvent ( "wang-cars.de", true )
addEventHandler ( "wang-cars.de", getRootElement(), wang_func )