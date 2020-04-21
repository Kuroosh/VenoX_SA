local maindomane = "www.well-stacked-pizza.com"
Domanes[maindomane] = maindomane

Domanes["pizza"] = maindomane
Domanes["pizza.com"] = maindomane
Domanes["pizza.de"] = maindomane
Domanes["www.pizza.com"] = maindomane
Domanes["www.pizza.de"] = maindomane

local pizza_values = 0


addEvent ( maindomane, true )
addEventHandler ( maindomane, getRootElement(), 
	function ()

		local img = createBasicPage ( "white" )

		gImage["pizza"] = guiCreateStaticImage(5,0,189,225,"images/internet/pizza.jpg",false,img)
		gLabel["pizza1"] = guiCreateLabel(200,14,193,69,"Der wahre Geist von Amerika,\nueberbacken mit der dreifachen\nMenge an Kaese und uebergossen\nund getraenkt mit bestes\nOlivenoel.*\n",false,img)
		guiLabelSetColor(gLabel["pizza1"],0,0,0)
		guiLabelSetVerticalAlign(gLabel["pizza1"],"top")
		guiLabelSetHorizontalAlign(gLabel["pizza1"],"left",false)
		guiSetFont(gLabel["pizza1"],"default-bold-small")
		gLabel["pizza2"] = guiCreateLabel(200,88,161,28,"*Kann Spuren von Nuessen, Glutamat\nund Strontium 90 enthalten",false,img)
		guiLabelSetColor(gLabel["pizza2"],125,125,125)
		guiLabelSetVerticalAlign(gLabel["pizza2"],"top")
		guiLabelSetHorizontalAlign(gLabel["pizza2"],"left",false)
		guiSetFont(gLabel["pizza2"],"default-small")
		gLabel["pizza3"] = guiCreateLabel(200,148,191,108,"Ab sofort verfuegbar:\n\nDer Well Stacked Pizza Co.\nLieferservice!\n24/7 die Woche, ob morgens zum\nFruehstueck oder als Snack in\nder Mittagspause!",false,img)
		guiLabelSetColor(gLabel["pizza3"],0,0,0)
		guiLabelSetVerticalAlign(gLabel["pizza3"],"top")
		guiLabelSetHorizontalAlign(gLabel["pizza3"],"left",false)
		guiSetFont(gLabel["pizza3"],"default-bold-small")
		gLabel["pizza4"] = guiCreateLabel(92,214,28,15,"[Neu]",false,img)
		guiLabelSetColor(gLabel["pizza4"],255,0,0)
		guiLabelSetVerticalAlign(gLabel["pizza4"],"top")
		guiLabelSetHorizontalAlign(gLabel["pizza4"],"left",false)
		guiSetFont(gLabel["pizza4"],"default-small")
		
		gButton["pizzaDeliver"] = guiCreateButton(50,230,106,55,"Pizza liefern\n( Kosten: 50 $ )",false,img)
		addEventHandler("onClientGUIClick", gButton["pizzaDeliver"], 
			function ( btn, state )
				if state == "up" then
				
					if pizza_values == 1 then
						outputChatBox ( "Du kannst nur jede Minute eine Pizza bestellen!", 125, 0, 0 )
						return
					end
				
					if mymoney >= 50 then
						pizza_values = 1
						
					setTimer ( 
						function ()
							pizza_values = 0
						end, 60000, 1 )
						
						triggerServerEvent ( "deliverPizza", lp )
					else
						outputChatBox ( "Eine Pizza kostet 50 $!", 125, 0, 0 )
					end
				end
			end,
		false)
	end
)