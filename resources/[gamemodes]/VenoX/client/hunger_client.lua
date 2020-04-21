foodBarX = screenwidth / 1.1707 - 1
foodBarY = math.floor ( screenheight / 6.6666 ) - 1
foodBarWidth = screenwidth / 10.37
foodBarHeight = screenheight / 51.42
foodBarY = foodBarY - ( ( 32 / 1080 ) * screenheight ) / 2 - foodBarHeight / 2

local showingFoodBar = false

function showHungerBar()

	if tonumber ( getElementData ( lp, "loggedin" ) ) == 1 and not isCursorShowing () then
		if not showingFoodBar then
			addEventHandler ( "onClientRender", root, drawFoodBar )
			showingFoodBar = true
		end
	end
end

function drawFoodBar ()

	local x, y, width, height = foodBarX, foodBarY, foodBarWidth, foodBarHeight
	
	local hunger = getElementHunger() / 100
	
	local spaceBarSize = screenwidth / ( 1920 / 5 )
	local hungerWidth = ( width - spaceBarSize * 2 ) * hunger
	hungerWidth = spaceBarSize + hungerWidth
	
	--dxDrawImage ( x, y, width, height, "images/gui/hunger_empty.png", 0, 0, 0, nil, true )
	--dxDrawImageSection ( x, y, hungerWidth, height, 1, 1, hungerWidth, height, "images/gui/hunger_full.png", 0, 0, 0, nil, true )
end

function hungerDeathFix ()
	setElementHunger ( 60 )
end
addEventHandler ( "onClientPlayerWasted", localPlayer, hungerDeathFix )

function hideHungerBar()

	if showingFoodBar then
		removeEventHandler ( "onClientRender", getRootElement(), drawFoodBar )
		showingFoodBar = false
	end
end

function moreHunger()
	if getElementData ( lp, "jailtime" ) then
		if getElementData ( lp, "jailtime" ) <= 0 and getElementData ( lp, "prison" ) <= 0 and not vnxClientGetElementData ( "isafk" ) and not pokering and not invulnerable then
			local curhunger = getElementHunger() - 1
			if curhunger < 0 then 
				curhunger = 0 
			end
			setElementHunger ( curhunger ) 
			if curhunger == 33 then
				--outputChatBox ( "Besorg dir bald etwas zu essen, oder du faengst an, zu verhungern!", 125, 0, 0 )
			elseif curhunger < 25 then
				local loss = math.floor((25-curhunger)/2*20)/10
				--setElementHealth ( lp, getElementHealth ( lp ) - loss )
			end
		end
	end
end
setTimer ( moreHunger, 50000, 0 )