-- Weil Bonus den Kack immer gemacht hat.
local function resourceStart_f11()
	--Unbind radar key
	setTimer(function()

		end, 5000, 1 )
	--unbindKey("F11", "both", "radar")
	toggleControl("radar", false)

	-- display
	--guiCreateWindow( 500, 150, 450, 250, "ChangeThaRadarNigga", false )
	--outputChatBox("[F11] #FFFFFFBrian ist ein krasser Coder.", 255, 144, 0, true) 
end

-- Add event handler
--addEventHandler("onClientResourceStart", resourceRoot, resourceStart_f11)
--addEventHandler('cdn:onClientReady', root, resourceStart_f11)
addEventHandler('onClientRender', resourceRoot, resourceStart_f11)





------------------------------------------------------------------------------------------------------------------------------------------------------







--guiCreateWindow( 500, 150, 200, 100, "ChangeThaRadarNigga", false )



	












------------------------------------------------------------------------------------------------------------------------------------------------------
