function showAchievmentWindow ()

	if gWindow["achievmentList"] then
		destroyElement ( gWindow["achievmentList"] )
	end
	
	--gWindow["achievmentList"] = guiCreateWindow(screenwidth/2-300/2,120,300,422,"Achievments",false)
	gWindow["achievmentList"] = guiCreateStaticImage(screenwidth/2-300/2,120,300,422,"images/hud/background.png",false)
	guiSetAlpha ( gWindow["achievmentList"], 1 )
	guiWindowSetMovable ( gWindow["achievmentList"], false )
	guiWindowSetSizable ( gWindow["achievmentList"], false )
	
	gImage[2] = guiCreateStaticImage(10,29,50,50,"images/pokal.bmp",false,gWindow["achievmentList"])
	gLabel[4] = guiCreateLabel(78,33,186,47,"Hier kannst du sehen,\nwelche Achievments du bereits\nerreicht hast.",false,gWindow["achievmentList"])
	guiLabelSetColor(gLabel[4],255,255,255)
	guiLabelSetVerticalAlign(gLabel[4],"top")
	guiLabelSetHorizontalAlign(gLabel[4],"left",false)
	guiSetFont(gLabel[4],"default-bold-small")
	
	currentAchievments = 0

	addAchievment ( "Schlaflos in SA", vnxClientGetElementData ( "schlaflosinsa" ) == "done" )
	addAchievment ( "Waffenschieber", vnxClientGetElementData ( "gunloads" ) == "done" )
	addAchievment ( "Angler", vnxClientGetElementData ( "angler_achiev" ) == "done" )
	addAchievment ( "Mr. License", vnxClientGetElementData ( "licenses_achiev" ) == "done" )
	addAchievment ( "Der Sammler", vnxClientGetElementData ( "collectr_achiev" ) == "done" )
	addAchievment ( "The Truth is out there", vnxClientGetElementData ( "thetruthisoutthere_achiev" ) == "done" )
	addAchievment ( "Silent Assassin", vnxClientGetElementData ( "silentassasin_achiev" ) == "done" )
	addAchievment ( "Reallife WTF?", vnxClientGetElementData ( "rl_achiev" ) == "done" )
	addAchievment ( "Eigene Fuesse", vnxClientGetElementData ( "own_foots" ) == "done" )
	addAchievment ( "King of the Hill", vnxClientGetElementData ( "kingofthehill_achiev" ) == "done" )
	addAchievment ( "Highway to Hell", vnxClientGetElementData ( "highwaytohell_achiev" ) == "done" )
	addAchievment ( "Schmied", vnxClientGetElementData ( "totalHorseShoes" ) == 25 )	
	addAchievment ( "Revolverheld", vnxClientGetElementData ( "revolverheld_achiev" ) == 1 )
	addAchievment ( "Chicken Dinner", vnxClientGetElementData ( "chickendinner_achiev" ) == 1 )
	addAchievment ( "Nichts geht mehr", vnxClientGetElementData ( "nichtsgehtmehr_achiev" ) == 1 )
	addAchievment ( "Highscore", vnxClientGetElementData ( "highscore_achiev" ) )
end

function addAchievment ( text, done )

	currentAchievments = currentAchievments + 1
	local x = 11
	if currentAchievments / 2 == math.floor ( currentAchievments / 2 ) then
		x = 151
	end
	
	local y = 90 + math.floor ( currentAchievments / 2 ) * 32
	
	gLabel["achievment"..currentAchievments] = guiCreateLabel(x,y,130,14,text,false,gWindow["achievmentList"])
	guiLabelSetVerticalAlign(gLabel["achievment"..currentAchievments],"top")
	guiLabelSetHorizontalAlign(gLabel["achievment"..currentAchievments],"left",false)
	guiSetFont(gLabel["achievment"..currentAchievments],"default-bold-small")
	
	if done then
		guiLabelSetColor(gLabel["achievment"..currentAchievments],0,200,0)
		gImage["achievment"..currentAchievments] = guiCreateStaticImage( x + 68, y + 7, 43, 21,"images/gui/done.png",false,gWindow["achievmentList"])
	else
		guiLabelSetColor(gLabel["achievment"..currentAchievments],200,200,0)
	end
end