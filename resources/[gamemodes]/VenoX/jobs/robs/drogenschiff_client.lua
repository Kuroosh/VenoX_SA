------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------
--[[

local sX, sY = guiGetScreenSize()

addEventHandler('onClientRender', root,
	function()
		local px, py, pz = getElementPosition(getLocalPlayer())
		if getDistanceBetweenPoints2D(2940.677, -2051.9, px, py) <= 17 then
			local x, y = getScreenFromWorldPosition(2940.677, -2051.9, 4.55)
			if x and y then
				dxDrawFramedText("Zum Schiff", x, y, x ,y,tocolor(255,255,255,255),2.0,"default","center","center",false,false,false)
			end
		end
		if getDistanceBetweenPoints2D(2968, -2075, px, py) <= 17 then
			local x, y = getScreenFromWorldPosition(2968, -2075, 9.9)
			if x and y then
				dxDrawFramedText("Zu den Docks", x, y, x,y,tocolor(255,255,255,255),2.0,"default","center","center",false,false,false)
			end
		end
	end
)

addEventHandler('onClientResourceStart', resourceRoot,
	function()
		createBuyMerchandiseWnd()
	end
)

function createBuyMerchandiseWnd()
	BuyMerchandiseLabel = {}
	local x, y = sX/2 - 395/2, sY/2 - 268/2
	BuyMerchandiseWnd = guiCreateWindow(x, y, 395, 268, 'Drogen kaufen', false)
	guiSetAlpha(BuyMerchandiseWnd,1)
	guiWindowSetSizable(BuyMerchandiseWnd,false)
	BuyMerchandiseLabel[1] = guiCreateLabel(0, 27,394,60,'Hey du! Möchtest du Geld verdienen?\nDu musst für mich nur ein Paket abliefern!\nJedoch musst du es mir vorschiessen.\nWieviel gibst du mir?',false,BuyMerchandiseWnd)
	guiLabelSetColor(BuyMerchandiseLabel[1],255,255,0)
	guiLabelSetHorizontalAlign(BuyMerchandiseLabel[1],"center",false)
	guiSetFont(BuyMerchandiseLabel[1],"default-bold-small")
	BuyMerchandiseLabel[2] = guiCreateLabel(18, 122,376,46,'   Betrag:',false,BuyMerchandiseWnd)
	guiLabelSetColor(BuyMerchandiseLabel[2],255,0,0)
	guiSetFont(BuyMerchandiseLabel[2],"default-bold-small")
	BuyMerchandiseAmmountEdit = guiCreateEdit(128, 109,246,49,'',false,BuyMerchandiseWnd)
	guiEditSetMaxLength(BuyMerchandiseAmmountEdit,7)
	guiSetProperty(BuyMerchandiseAmmountEdit,"AlwaysOnTop","true")
	BuyMerchandiseB = guiCreateButton(31, 198,138,48,'Drogen kaufen',false,BuyMerchandiseWnd)
	guiSetFont(BuyMerchandiseB,"default-bold-small")
	guiSetProperty(BuyMerchandiseB,"HoverTextColour","FFFFFF00")
	BuyMerchandiseCancelB = guiCreateButton(226, 198,138,48,'Abbrechen',false,BuyMerchandiseWnd)
	guiSetFont(BuyMerchandiseCancelB,"default-bold-small")
	guiSetProperty(BuyMerchandiseCancelB,"HoverTextColour","FFFF0000")
	guiSetVisible(BuyMerchandiseWnd, false)
	addEventHandler('onClientGUIClick', BuyMerchandiseB, buyMerchandise_C, false)
	addEventHandler('onClientGUIClick', BuyMerchandiseCancelB, buyMerchandiseCancel, false)
end

addEvent('showBuyMerchandiseWnd', true)
addEventHandler('showBuyMerchandiseWnd', root,
	function()
		guiSetVisible(BuyMerchandiseWnd, not guiGetVisible(BuyMerchandiseWnd))
		showCursor(guiGetVisible(BuyMerchandiseWnd))
		guiSetInputMode ( "no_binds_when_editing" )
	end
)

function buyMerchandiseCancel()
	guiSetVisible(BuyMerchandiseWnd, false)
	showCursor(false)
	guiSetInputMode("allow_binds")
end

function buyMerchandise_C()
	local ammount = guiGetText(BuyMerchandiseAmmountEdit)
	if ammount ~= '' and tonumber(ammount) ~= nil and tonumber(ammount) > 0 then
		if tonumber(ammount) <= getPlayerMoney(localPlayer) then
			triggerServerEvent('BuyMerchandise', root, ammount)
			guiSetVisible(BuyMerchandiseWnd, false)
			showCursor(false)
			guiSetInputMode ( "allow_binds" )
		else
			outputChatBox("Du bist zu arm.")
		end
	else
		outputChatBox('Tippe zuerst den korrekten Betrag ein.')
	end
end
]]