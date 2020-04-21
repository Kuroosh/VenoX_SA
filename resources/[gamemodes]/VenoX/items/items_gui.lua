-------------------------
------- (c) 2010 --------
------- by Zipper -------
-- and Vio MTA:RL Crew --
-------------------------

local objectPlaceBlipID = 11

local dekoObjectsToBuy = {
 [1]=true,
 [2]=true,
 [3]=true,
 [4]=true,
 [5]=true,
 [6]=true,
 [7]=true
 }
 
local placeAbleObjectIMGs = {
 ["Fackel"]="placeable/torch.bmp",
 ["Basketball"]="placeable/ball_a.bmp",
 ["Strandball"]="placeable/ball_b.bmp",
 ["Lagerfeuer"]="placeable/campfire.bmp",
 ["Grill"]="placeable/grill.bmp",
 ["Liege"]="placeable/liege.bmp",
 ["Handtuch"]="placeable/towel.bmp"
 }
 
local placeAbleObjectNames = {
 [3461]="Fackel",
 [2114]="Basketball",
 [1598]="Strandball",
 [841]="Lagerfeuer",
 [842]="Lagerfeuer",
 [1481]="Grill",
 [1255]="Liege",
 [1640]="Handtuch",
 [1641]="Handtuch",
 [1642]="Handtuch",
 [1643]="Handtuch"
 }

function showDekoWindow_func ()

	if gWindow["dekorationShop"] then
		guiSetVisible ( gWindow["dekorationShop"], true )
	else
		gWindow["dekorationShop"] = guiCreateWindow(screenwidth/2-333/2,screenheight/2-505/2,333,505,"Dekorationshandel",false)
		guiSetAlpha(gWindow["dekorationShop"],1)
		GUIEditor_Label[1] = guiCreateLabel(11,30,316,48,"Herzlich wilkommen!\nHier kannst du Objekte erwerben, die du frei platzieren\nkannst!",false,gWindow["dekorationShop"])
		guiSetAlpha(GUIEditor_Label[1],1)
		guiLabelSetColor(GUIEditor_Label[1],255,255,255)
		guiLabelSetVerticalAlign(GUIEditor_Label[1],"top")
		guiLabelSetHorizontalAlign(GUIEditor_Label[1],"left",false)
		guiSetFont(GUIEditor_Label[1],"default-bold-small")
		
		GUIEditor_Image[1] = guiCreateStaticImage(15,86,50,50,"images/colors/c_blue.jpg",false,gWindow["dekorationShop"])
		guiSetAlpha(GUIEditor_Image[1],1)
		GUIEditor_Button[1] = guiCreateButton(71,92,76,36,"Lagerfeuer,\n100 $",false,gWindow["dekorationShop"])
		guiSetAlpha(GUIEditor_Button[1],1)
		guiSetFont(GUIEditor_Button[1],"default-bold-small")
		GUIEditor_Button[2] = guiCreateButton(73,153,76,36,"Lagerfeuer,\n100 $",false,gWindow["dekorationShop"])
		guiSetAlpha(GUIEditor_Button[2],1)
		guiSetFont(GUIEditor_Button[2],"default-bold-small")
		GUIEditor_Button[3] = guiCreateButton(303,24,18,18,"x",false,gWindow["dekorationShop"])
		guiSetAlpha(GUIEditor_Button[3],1)
	end
end