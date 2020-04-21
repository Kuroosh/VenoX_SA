feuer_enter = createMarker ( -1981.1999511719, 1348.6999511719, 7.1999998092651, "cylinder", 14, 255, 255, 0, 0 )------1
feuer_enter2 = createMarker ( -1981.1999511719, 1348.6999511719, 7.1999998092651, "cylinder", 14, 255, 255, 0, 0 )-------2

schrankefire1 = createObject(968, -2563.439453125, 579.3203125, 14.300000190735, 0, 0, 180)-------2
schrankefire2 = createObject(968, -2599.1000976563, 595.79998779297, 14.300000190735, 0, 0, 270)-----1

schranke_eins_auf = true
schranke_zwei_auf = true

function open_schranke_fire_eins ()	
	if vnxGetElementData (player, "fraktion") == 15 then
		if schranke_eins_auf == false then
			moveObject(schrankefire1, 2000, -2563.439453125, 579.3203125, 14.300000190735, 0, -90, 0, "OutBounce")
			--setTimer (function()			
			schranke_eins_auf = true
			--end, 2000, 0)
		end
	end
end
addEventHandler("onMarkerHit", feuer_enter2, open_schranke_fire_eins)
addCommandHandler("openfire", open_schranke_fire_eins)

function close_schranke_fire_eins ()	
	if vnxGetElementData (player, "fraktion") == 15 then
		if schranke_eins_auf == true then
			moveObject(schrankefire1, 2000, -2563.439453125, 579.3203125, 14.300000190735, 0, 90, 0, "OutBounce")	
			--setTimer (function()
			schranke_eins_auf = false
			--end, 2000, 0)	
		end
	end
end
addEventHandler("onMarkerLeave", feuer_enter2, close_schranke_fire_eins)
addCommandHandler("openfire", close_schranke_fire_eins)

function open_schranke_fire_zwei ()	
	if vnxGetElementData (player, "fraktion") == 15 then
		if schranke_zwei_auf == false then
			moveObject(schrankefire2, 2000, -2599.1000976563, 595.79998779297, 14.300000190735, 0, -90, 0, "OutBounce")	
			--setTimer (function()				
			schranke_zwei_auf = true
			--end, 2000, 0)					
		end
	end
end
addEventHandler("onMarkerHit", feuer_enter, open_schranke_fire_zwei)
addCommandHandler("openfire", open_schranke_fire_zwei)

function close_schranke_fire_zwei ()	
	if vnxGetElementData (player, "fraktion") == 15 then
		if schranke_zwei_auf == true then
			moveObject(schrankefire2, 2000, -2599.1000976563, 595.79998779297, 14.300000190735, 0, 90, 0, "OutBounce")
			--setTimer (function()				
			schranke_zwei_auf = false
			--end, 2000, 0)				
		end
	end
end
addEventHandler("onMarkerLeave", feuer_enter, close_schranke_fire_zwei)	
addCommandHandler("openfire", close_schranke_fire_zwei)	

function schranke_richten ()
	if vnxGetElementData (player, "adminlvl") >= 2 then
		setElementPosition ( schrankefire1, -2563.439453125, 579.3203125, 14.300000190735 )	
			setElementRotation( schrankefire1, 0, 0, 180 )
		schranke_eins_auf = true		
		setElementPosition ( schrankefire2, -2599.1000976563, 595.79998779297, 14.300000190735 )
			setElementRotation( schrankefire2, 0, 0, 270 )
		schranke_zwei_auf = true
	end
end
addCommandHandler("schrankerichten", schranke_richten)