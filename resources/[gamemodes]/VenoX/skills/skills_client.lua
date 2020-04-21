local skillBars = 0

-- fullState [0-1]
function createSkillBar ( fullState, parent, x, y, width, height )

	skillBars = skillBars + 1
	if not width then
		width = 77
		height = 21
	end
	side = ( width * 6 / 77 )
	barMaxWidth = width - side * 2 -- Middle Bar
	barSize = barMaxWidth * fullState
	
	gImage["skillBar"..skillBars] = guiCreateStaticImage ( x, y, width, height, "images/skills/bg.png", false, parent )
	
	guiCreateStaticImage ( side, 0, barSize, height, "images/skills/px.png", false, gImage["skillBar"..skillBars] )
	guiCreateStaticImage ( barSize + side, 0, 77 / width * 6, height, "images/skills/cur.png", false, gImage["skillBar"..skillBars] )
	guiCreateStaticImage ( 0, 0, width, height, "images/skills/bar.png", false, gImage["skillBar"..skillBars] )
	
	return gImage["skillBar"..skillBars]
end
addEvent ( "createSkillBar", true )
addEventHandler ( "createSkillBar", getRootElement(), createSkillBar )

function showSkillInfo_func ( text, fullState, left, cur )

	gImage["skillBG"] = guiCreateStaticImage( 3 * 2 + 235,3,102,79,"images/colors/c_red.jpg",false)
	
	local bar = createSkillBar ( fullState, gImage["skillBG"], 12, 24, 77, 21 )
	
	if text == "Spielskills:" then
		gLabel[1] = guiCreateLabel(5,4,81,14,"Spielskills:",false,gImage["skillBG"])
		guiLabelSetColor(gLabel[1],0,0,0)
		guiLabelSetVerticalAlign(gLabel[1],"top")
		guiLabelSetHorizontalAlign(gLabel[1],"left",false)
		guiSetFont(gLabel[1],"default-bold-small")
		gLabel[2] = guiCreateLabel(8,49,90,28,"Noch "..left.." $\nbis zu LVL "..(cur+1),false,gImage["skillBG"])
		guiLabelSetColor(gLabel[2],0,0,0)
		guiLabelSetVerticalAlign(gLabel[2],"top")
		guiLabelSetHorizontalAlign(gLabel[2],"left",false)
		guiSetFont(gLabel[2],"default-bold-small")
	else
		gLabel[1] = guiCreateLabel(5,4,81,14,"Angelskill:",false,gImage["skillBG"])
		guiLabelSetColor(gLabel[1],0,0,0)
		guiLabelSetVerticalAlign(gLabel[1],"top")
		guiLabelSetHorizontalAlign(gLabel[1],"left",false)
		guiSetFont(gLabel[1],"default-bold-small")
		gLabel[2] = guiCreateLabel(8,49,90,28,"Noch "..left.." Fische\nbis zu LVL "..(cur+1),false,gImage["skillBG"])
		guiLabelSetColor(gLabel[2],0,0,0)
		guiLabelSetVerticalAlign(gLabel[2],"top")
		guiLabelSetHorizontalAlign(gLabel[2],"left",false)
		guiSetFont(gLabel[2],"default-bold-small")
	end
	setTimer ( destroyElement, 5000, 1, gImage["skillBG"] )
end
addEvent ( "showSkillInfo", true )
addEventHandler ( "showSkillInfo", getRootElement(), showSkillInfo_func )