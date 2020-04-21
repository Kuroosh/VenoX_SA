local maindomane = "Domane1" -- Steht oben in der Browserleiste
 Domanes[maindomane]=maindomane
 -- Weitere Domanes, die zur Hauptdomane verlinken
 Domanes["[Domane2]"]=maindomane
 Domanes["[Domane3]"]=maindomane

addEvent ( maindomane, true )
addEventHandler ( maindomane, getRootElement(), 
	function ()
		-- Hintergrundbild - Weitere Farben: black, blue, green, grey, lblue, red, white, yellow
		local img = createBasicPage ( "white" )
		-- Weitere GUI-Elemente auf img attachen
	end
)