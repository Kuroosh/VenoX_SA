local curTotalChips = 0
local lastRoulettFieldMoney = 0

function showRoulettWindow ()

	curTotalChips = vnxClientGetElementData ( "casinoChips" )
	local curTotalEditChips = 0
	lastRoulettFieldMoney = 0
	showCursor ( true )
	if isElement ( gWindow["roulett"] ) then
		guiSetVisible ( gWindow["roulett"], true )
	else
		gWindow["roulett"] = guiCreateWindow(screenwidth/2-161/2,0,161,194,"Einsatz",false)
		guiWindowSetMovable ( gWindow["roulett"], false )
		guiWindowSetSizable ( gWindow["roulett"], false )
		guiSetAlpha(gWindow["roulett"],1)
		
		gScroll["roulett"] = guiCreateScrollBar ( 11, 26, 137, 30, true, false, gWindow["roulett"] )
		guiScrollBarSetScrollPosition ( gScroll["roulett"], 0 )
				
		gButton["placeBet"] = guiCreateButton(76,135,66,40,"Setzen",false,gWindow["roulett"])
		guiSetAlpha(gButton["placeBet"],1)
		
		gEdit["roulett"] = guiCreateEdit(12,85,86,35,"0",false,gWindow["roulett"])
		guiSetAlpha(gEdit["roulett"],1)
		
		gLabel[1] = guiCreateLabel(106,92,50,14,"$ / Chips",false,gWindow["roulett"])
		guiSetAlpha(gLabel[1],1)
		guiLabelSetColor(gLabel[1],0,200,0)
		guiLabelSetVerticalAlign(gLabel[1],"top")
		guiLabelSetHorizontalAlign(gLabel[1],"left",false)
		guiSetFont(gLabel[1],"default-bold-small")
		gImage[1] = guiCreateStaticImage(16,135,37,40,"images/inventory/chip.png",false,gWindow["roulett"])
		guiSetAlpha(gImage[1],1)
		
		addEventHandler ( "onClientGUIScroll", gScroll["roulett"], roulettScrollBarChanged )
		addEventHandler ( "onClientGUIChanged", gEdit["roulett"], roulettEditChanged )
		addEventHandler ( "onClientGUIClick", gButton["placeBet"], roulettPlaceBet )
	end
end

function roulettScrollBarChanged ()

	local money = math.floor ( curTotalChips / 100 * guiScrollBarGetScrollPosition ( gScroll["roulett"] ) + 0.5 )
	
	scrollBarChanged = true
	guiSetText ( gEdit["roulett"], money )
	
	--reanableRoulettEvents ()
end

function roulettEditChanged ()

	if scrollBarChanged then
		scrollBarChanged = false
	else
		if curTotalEditChips ~= guiGetText ( gEdit["roulett"] ) then
			local money = tonumber ( guiGetText ( gEdit["roulett"] ) )
			if money then
				if money <= curTotalChips then
					money = math.floor ( money + 0.5 )
					guiSetText ( gEdit["roulett"], money )
					curTotalEditChips = money
					money = money / curTotalChips * 100
					guiScrollBarSetScrollPosition ( gScroll["roulett"], money )
				else
					guiSetText ( gEdit["roulett"], curTotalChips )
				end
			else
				guiSetText ( gEdit["roulett"], curTotalEditChips )
			end
		end
	end
end

function roulettPlaceBet ()

	local money = tonumber ( guiGetText ( gEdit["roulett"] ) )
	curTotalChips = curTotalChips + ( getBetOnField () - money )
	placeRoulettChips ( money )
	roulettMarkerOver ()
end

function roulettMarkerOver ()

	curTotalChips = curTotalChips - lastRoulettFieldMoney + getBetOnField ()
	guiSetText ( gEdit["roulett"], getBetOnField () )
	lastRoulettFieldMoney = tonumber ( guiGetText ( gEdit["roulett"] ) )
end