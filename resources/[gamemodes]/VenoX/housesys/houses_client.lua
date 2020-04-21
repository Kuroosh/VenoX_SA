houseInfoTextRange = 10
houseTextRenders = 0
houseTextRenderAdded = false
streamedInPickups = {}
houseTextsToDraw = {}
houseIconModels = {
 [1272]=true,
 [1273]=true
 }
local shape

function houseIconStreamIn ()

	if houseIconModels[getElementModel ( source )] then
		if getElementData ( source, "owner" ) then
			local x, y, z = getElementPosition ( source )
			
			shape = createColSphere ( x, y, z, houseInfoTextRange )
			setElementData ( shape, "mother", source )
			streamedInPickups[source] = shape
			
			local lx, ly, lz = getElementPosition ( lp )
			if getDistanceBetweenPoints3D ( x, y, z, lx, ly, lz ) <= houseInfoTextRange then
				addTextToHousePickup ( source )
			end
			addEventHandler ( "onClientColShapeHit", shape, houseShapeHit )
		end
	end
end
addEventHandler ( "onClientElementStreamIn", getRootElement(), houseIconStreamIn )

function addTextToHousePickup ( pickup )
	if isElement ( pickup ) then
		local x1, y1, z1 = getElementPosition ( lp )
		local x2, y2, z2 = getElementPosition ( pickup )
		if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= houseInfoTextRange then
			local string = ""
			if not getElementData ( pickup, "gangHQOf" ) then
				local besitzer = getElementData ( pickup, "owner" )
				local shape = streamedInPickups[pickup]
				if besitzer == "none" then
					local preis = getElementData ( pickup, "preis" )
					string = "Steht zum Verkauf\nHausnummer: "..getElementData ( pickup, "id" ).."\nPreis: "..preis
				else
					local miete = getElementData ( pickup, "miete" )
					local locked = getElementData ( pickup, "locked" )
					local state = "Verschlossen"
					if not locked then
						state = "Offen"
					end
					string = "Gehoert: "..besitzer.."\nHausnummer: "..getElementData ( pickup, "id" ).."\n"..state.."\n"
					if miete == 0 then
						string = string.."Nicht zu vermieten"
					else
						string = string.."Miete: "..miete
					end
				end
			else
				string = "Hauptquartier der Gang\n\""..getElementData ( pickup, "gangHQOf" ).."\""
			end
			houseTextsToDraw[pickup] = string
			
			if not houseTextRenderAdded then
				addEventHandler ( "onClientRender", getRootElement(), houseRenderText )
				houseTextRenderAdded = true
			end
			if shape and isElement(shape) then
				removeEventHandler ( "onClientColShapeLeave", shape, houseShapeLeft )
				addEventHandler ( "onClientColShapeLeave", shape, houseShapeLeft )
			end
		end
	end
end

function houseShapeLeft ( hit, dim )

	local pickup = getElementData ( source, "mother" )
	if dim and hit then
		houseTextsToDraw[pickup] = nil
	end
end

function houseShapeHit ()

	local pickup = getElementData ( source, "mother" )
	addTextToHousePickup ( pickup )
end

function houseRenderText ()

	local i = 0
	
	houseTextRenders = houseTextRenders + 1
	
	if houseTextRenders == 35 then
		houseTextRenders = 0
		for key, index in pairs ( houseTextsToDraw ) do
			houseTextsToDraw[key] = nil
			if isElement ( key ) then
				addTextToHousePickup ( key )
			end
		end
	end
	
	for key, index in pairs ( houseTextsToDraw ) do
		if isElement ( key ) then
			i = i + 1
			local x, y, z = getElementPosition ( key )
			z = z + 1.2
			local sx, sy = getScreenFromWorldPosition ( x, y, z, 1000, true )
			local r, g, b
			if sx and sy then
				sx = sx - 100
				if string.sub ( index, 1, 5 ) == "Haupt" then
					r, g, b = 200, 0, 0
				else
					r, g, b = 200, 200, 200
				end
				dxDrawText ( tostring ( index ), sx, sy, sx, sy, tocolor ( 0, 0, 0, 255 ), 2, "sans" )
				dxDrawText ( tostring ( index ), sx+1, sy+1, sx, sy, tocolor ( r, g, b, 255 ), 2, "sans" )
			end
		else
			houseTextsToDraw[key] = nil
		end
	end
	
	if i == 0 then
		removeEventHandler ( "onClientRender", getRootElement(), houseRenderText )
		houseTextRenderAdded = false
	end
end

function houseIconStreamOut ()

	if houseIconModels[getElementModel ( source )] then
		if getElementData ( source, "owner" ) then
			local shape = streamedInPickups[source]
			if houseTextsToDraw[source] then
				houseTextsToDraw[source] = nil
			end
			if shape and isElement (shape) then
				destroyElement ( shape )
			end
		end
	end
end
addEventHandler ( "onClientElementStreamOut", getRootElement(), houseIconStreamOut )