roulettRed = {
 [3]=true, [1]=true, [5]=true, [7]=true, [9]=true, [12]=true, [14]=true, [18]=true, [16]=true, [21]=true, [19]=true, [23]=true, [27]=true, [25]=true, [30]=true, [32]=true, [36]=true, [34]=true
 }
roulettBlack = {
 [2]=true, [4]=true, [6]=true, [8]=true, [11]=true, [10]=true, [15]=true, [13]=true, [17]=true, [20]=true, [24]=true, [22]=true, [26]=true, [29]=true, [28]=true, [33]=true, [31]=true, [35]=true
 }

roulettRandomFieldSizeX = 84
roulettRandomFieldSizeY = 60

function roulettRender ()

	dxDrawText(curRoulettDrawNumber,screenwidth/2-25,6,885,53,tocolor(200,200,200,255),3.0,"sans","left","top",false,false,true)
	dxDrawText(curRoulettDrawNumber,screenwidth/2-25,8,886,55,tocolor(255,255,255,255),3.0,"sans","left","top",false,false,true)
end

function getNewRoulettDrawNumber ( number )

	destroyElement ( gImage["roulettBasicBG"] )
	local rnd
	if not number then
		rnd = math.random ( 0, 36 )
	else
		rnd = number
	end
	if rnd == 0 then
		color = "green"
	elseif roulettRed[rnd] then
		color = "red"
	elseif roulettBlack[rnd] then
		color = "black"
	end
	curRoulettDrawNumber = tostring ( rnd )
	if # curRoulettDrawNumber <= 1 then
		curRoulettDrawNumber = " "..curRoulettDrawNumber
	end
	playSoundFrontEnd ( 45 )
	gImage["roulettBasicBG"] = guiCreateStaticImage ( screenwidth/2-roulettRandomFieldSizeX/2, 0, roulettRandomFieldSizeX, roulettRandomFieldSizeY, "images/colors/c_"..color..".jpg", false )
end

function showRoulettWinningNumber_func ( finalNumber, total )

	if finalNumber then
		gImage["roulettBasicBorder1"] = guiCreateStaticImage ( screenwidth/2-roulettRandomFieldSizeX/2 - 5, 0, 5, roulettRandomFieldSizeY, "images/colors/c_grey.jpg", false )
		gImage["roulettBasicBorder2"] = guiCreateStaticImage ( screenwidth/2+roulettRandomFieldSizeX/2, 0, 5, roulettRandomFieldSizeY, "images/colors/c_grey.jpg", false )
		gImage["roulettBasicBorder3"] = guiCreateStaticImage ( screenwidth/2+roulettRandomFieldSizeX/2 - roulettRandomFieldSizeX - 5, roulettRandomFieldSizeY, roulettRandomFieldSizeX + 10, 5, "images/colors/c_grey.jpg", false )
		
		curRoulettDrawNumber = tostring ( finalNumber )
		
		if finalNumber == 0 then
			color = "green"
		elseif roulettRed[finalNumber] then
			color = "red"
		elseif roulettBlack[finalNumber] then
			color = "black"
		end
		gImage["roulettBasicBG"] = guiCreateStaticImage ( screenwidth/2-roulettRandomFieldSizeX/2, 0, roulettRandomFieldSizeX, roulettRandomFieldSizeY, "images/colors/c_"..color..".jpg", false )
		
		k = 100
		for i = 1, 10 do
			setTimer ( getNewRoulettDrawNumber, k, 1 )
			k = k * 1.3 + 50
		end
		setTimer ( getNewRoulettDrawNumber, k, 1, finalNumber )
		setTimer ( showRoulettInfo, k+500, 1, total )
		setTimer ( clearRoulettTable, k+5000, 1 )

		addEventHandler ( "onClientRender", getRootElement(), roulettRender )
	else
		setTimer ( clearRoulettTable, 2500, 1 )
	end
end
addEvent ( "showRoulettWinningNumber", true )
addEventHandler ( "showRoulettWinningNumber", getRootElement(), showRoulettWinningNumber_func )

function showRoulettInfo ( total )

	local r, g, b = 0, 0, 0
	if total < 0 then
		roulettBetInfoText = "Du verlierst "..math.abs(total).." $"
		r = 150
	elseif total == 0 then
		roulettBetInfoText = "Du gehst leer aus."
		r, g, b = 150, 150, 150
	elseif total > 0 then
		roulettBetInfoText = "Du gewinnst "..total.." $"
		g = 150
	end
	roulettBetInfoR = r
	roulettBetInfoG = g
	roulettBetInfoB = b
	addEventHandler ( "onClientRender", getRootElement(), roulettBetInfo_render )
	setTimer ( 
		function ()
			removeEventHandler ( "onClientRender", getRootElement(), roulettBetInfo_render )
			bindRoulettKeys ()
		end,
	4500, 1 )
end

function roulettBetInfo_render ()

	dxDrawText(roulettBetInfoText,2,2,screenwidth+2,screenheight+2,tocolor(0,0,0,255),3,"pricedown","center","center",false,false,true)
	dxDrawText(roulettBetInfoText,0,0,screenwidth,screenheight,tocolor(roulettBetInfoR,roulettBetInfoG,roulettBetInfoB,255),3,"pricedown","center","center",false,false,true)
end

function clearRoulettTable ()

	for i = 1, 3 do
		if isElement(gImage["roulettBasicBorder"..i]) then
			destroyElement ( gImage["roulettBasicBorder"..i] )
		end
	end
	if isElement(gImage["roulettBasicBG"]) then
		destroyElement ( gImage["roulettBasicBG"] )
	end
	removeEventHandler ( "onClientRender", getRootElement(), roulettRender )
	hideAllChips ()
	
	local x, y, z = roulettXMain, roulettYMain, roulettZMain
	local int = getElementInterior ( lp )
	
	startRoulett_func ( roulettXMain, roulettYMain, z, int )
end