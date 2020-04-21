local totalTaxiCost = 0

function startTaxameter_func ()

	totalTaxiCost = 0
	if gWindow["taxameter"] then
		guiSetVisible ( gWindow["taxameter"], true )
	else
		gWindow["taxameter"] = guiCreateWindow(screenwidth/2-150,0,150,109,"Taxameter",false)
		guiSetAlpha(gWindow["taxameter"],1)
		gLabel[1] = guiCreateLabel(9,31,81,18,"Preis pro 15s:",false,gWindow["taxameter"])
		guiSetAlpha(gLabel[1],1)
		guiLabelSetColor(gLabel[1],255,255,255)
		guiLabelSetVerticalAlign(gLabel[1],"top")
		guiLabelSetHorizontalAlign(gLabel[1],"left",false)
		guiSetFont(gLabel[1],"default-bold-small")
		gImage[1] = guiCreateStaticImage(96,28,45,26,"images/taxi.jpg",false,gWindow["taxameter"])
		guiSetAlpha(gImage[1],1)
		gLabel[2] = guiCreateLabel(0,4,999,15,taxiPricePerInterval.." $",false,gImage[1])
		guiSetAlpha(gLabel[2],1)
		guiLabelSetColor(gLabel[2],255,255,0)
		guiLabelSetVerticalAlign(gLabel[2],"top")
		guiLabelSetHorizontalAlign(gLabel[2],"left",false)
		guiSetFont(gLabel[2],"default-bold-small")
		gLabel[3] = guiCreateLabel(8,63,82,18,"Gesamtpreis:",false,gWindow["taxameter"])
		guiSetAlpha(gLabel[3],1)
		guiLabelSetColor(gLabel[3],255,255,255)
		guiLabelSetVerticalAlign(gLabel[3],"top")
		guiLabelSetHorizontalAlign(gLabel[3],"left",false)
		guiSetFont(gLabel[3],"default-bold-small")
		
		gLabel["taxameter"] = guiCreateLabel(94,62,54,16,totalTaxiCost.." $",false,gWindow["taxameter"])
		guiSetAlpha(gLabel["taxameter"],1)
		guiLabelSetColor(gLabel["taxameter"],0,125,0)
		guiLabelSetVerticalAlign(gLabel["taxameter"],"top")
		guiLabelSetHorizontalAlign(gLabel["taxameter"],"left",false)
		guiSetFont(gLabel["taxameter"],"default-bold-small")
		
		gProgress["taxameter"] = guiCreateProgressBar(32,83,83,17,false,gWindow["taxameter"])
		guiSetAlpha(gProgress["taxameter"],1)
		guiProgressBarSetProgress(gProgress["taxameter"],0)
		
		gLabel[5] = guiCreateLabel(19,2,43,13,"Zeiteinheit",false,gProgress["taxameter"])
		guiSetAlpha(gLabel[5],1)
		guiLabelSetColor(gLabel[5],255,0,0)
		guiLabelSetVerticalAlign(gLabel[5],"top")
		guiLabelSetHorizontalAlign(gLabel[5],"left",false)
		guiSetFont(gLabel[5],"default-small")
	end
	taxiPayCheck ()
end
addEvent ( "startTaxameter", true )
addEventHandler ( "startTaxameter", getRootElement(), startTaxameter_func )

function setTaxameterProgress ()

	guiProgressBarSetProgress ( gProgress["taxameter"], guiProgressBarGetProgress ( gProgress["taxameter"] ) + ( 100 / 60 ) )
end

function taxiPayCheck ()

	local veh = getPedOccupiedVehicle ( lp )
	if isElement ( veh ) then
		if getVehicleOccupant ( veh, 0 ) then
			totalTaxiCost = totalTaxiCost + taxiPricePerInterval
			guiSetText ( gLabel["taxameter"], totalTaxiCost )
			triggerServerEvent ( "taxiPayCheck", lp )
			setTimer ( taxiPayCheck, 15000, 1 )
			guiProgressBarSetProgress ( gProgress["taxameter"], 0 )
			setTimer ( setTaxameterProgress, 250, 60 )
			
			return
		end
	end
	guiSetVisible ( gWindow["taxameter"], false )
end

taxiMarkers = {}

function showTaxiCustomerBlip_func ( player )

	local blip = createBlipAttachedTo ( player )
	local col = createColSphere ( 0, 0, 0, 10 )
	setElementParent ( blip, col )
	attachElements ( col, player )
	taxiMarkers[col] = true
	addEventHandler ( "onClientColShapeHit", col,
		function ( hit )
			if hit == lp then
				taxiMarkers[source] = nil
				destroyElement ( source )
			end
		end
	)
end
addEvent ( "showTaxiCustomerBlip", true )
addEventHandler ( "showTaxiCustomerBlip", getRootElement(), showTaxiCustomerBlip_func )

function cancel_taxi ( cmd, arg )

	if arg == "taxi" then
		for key, index in pairs ( taxiMarkers ) do
			triggerServerEvent ( "cancelTaxi", lp, getElementAttachedTo ( key ) )
			taxiMarkers[key] = nil
			destroyElement ( key )
		end
	end
end
addEvent ( "cancelTaxi", true )
addEventHandler ( "cancelTaxi", getRootElement(), cancel_taxi )
addCommandHandler ( "cancel", cancel_taxi )