local schleusen_keypads = {}
schleusen_keypads[1] = createObject ( 2886, 2419.4987792969, -1275.7690429688, 988.75537109375, 0, 0, 90 ) -- Schleuse 1
schleusen_keypads[2] = createObject ( 2886, 2419.2492675781, -1276.7260742188, 988.75537109375 ) -- Schleuse 1
schleusen_keypads[3] = createObject ( 2886, 2424.0146484375, -1272.998046875, 988.75537109375, 0, 0, 90 ) -- Schleuse 2
schleusen_keypads[4] = createObject ( 2886, 2423.513671875, -1272.8927001953, 988.75537109375, 0, 0, 270 ) -- Schleuse 2
schleusen_keypads[5] = createObject ( 2886, 2460.0166015625, -1284.5439453125, 988.75537109375, 0, 0, 270 ) -- Schleuse 3
schleusen_keypads[6] = createObject ( 2886, 2460.8017578125, -1284.248046875, 988.75537109375, 0, 0, 180 ) -- Schleuse 3
schleusen_keypads[7] = createObject ( 2886, 2467.333984375, -1281.1015625, 988.75537109375, 0, 0, 270 ) -- Schleuse 4
schleusen_keypads[8] = createObject ( 2886, 2467.333984375, -1279.6826171875, 988.75537109375, 0, 0, 270 ) -- Schleuse 4

local schleusen_tore = {}
schleusen_tore[1] = createObject ( 2930, 2421.2268066406, -1276.3779296875, 989.74951171875, 0, 0, 270 )
schleusen_tore[2] = createObject ( 2930, 2423.9516601563, -1273.3907470703, 989.74951171875, 0, 0, 0 )
schleusen_tore[3] = createObject ( 2930, 2460.1354980469, -1282.5170898438, 989.82739257813 )
schleusen_tore[4] = createObject ( 2930, 2466.958984375, -1280.4493408203, 989.82739257813, 0, 0, 270 )

local schleusen_status = {}
schleusen_status[1] = "zu"
schleusen_status[2] = "zu"
schleusen_status[3] = "zu"
schleusen_status[4] = "zu"

local schleusen_positionen = {}

for i = 1, 4, 1 do

	schleusen_positionen[i] = {}

end

schleusen_positionen[1]["x"], schleusen_positionen[1]["y"], schleusen_positionen[1]["z"] = 2421.2268066406, -1276.3779296875, 989.74951171875
schleusen_positionen[2]["x"], schleusen_positionen[2]["y"], schleusen_positionen[2]["z"] = 2423.9516601563, -1273.3907470703, 989.74951171875
schleusen_positionen[3]["x"], schleusen_positionen[3]["y"], schleusen_positionen[3]["z"] = 2460.1354980469, -1282.5170898438, 989.82739257813
schleusen_positionen[4]["x"], schleusen_positionen[4]["y"], schleusen_positionen[4]["z"] = 2466.958984375, -1280.4493408203, 989.82739257813

function getSchleuseFromKeypad ( count )

	if count == 1 or count == 2 then
		return 1
	elseif count == 3 or count == 4 then
		return 2
	elseif count == 5 or count == 6 then
		return 3
	elseif count == 7 or count == 8 then
		return 4
	end

end

for i, obj in pairs ( schleusen_tore ) do

	setElementInterior ( obj, 2 )

end

for i, obj in pairs ( schleusen_keypads ) do

	setElementInterior ( obj, 2 )
	local count = getSchleuseFromKeypad ( i )
	
	vnxSetElementData ( obj, "SchleusenNummer", count )

end

local schleusen_move = {}

for i = 1, 4, 1 do

	schleusen_move[i] = {}

end

schleusen_move[1]["x"] = 2419.673828125
schleusen_move[2]["x"] = 2423.9516601563
schleusen_move[4]["x"] = 2468.5837402344
schleusen_move[3]["x"] = 2460.1354980469

schleusen_move[1]["y"] = -1276.3779296875
schleusen_move[1]["z"] = 989.74951171875

schleusen_move[2]["y"] = -1271.8449707031
schleusen_move[2]["z"] = 989.74951171875

schleusen_move[3]["y"] = -1284.1608886719
schleusen_move[3]["z"] = 989.82739257813

schleusen_move[4]["y"] = -1280.4493408203
schleusen_move[4]["z"] = 989.82739257813

function vioToggleSchleuse ( count )

		if schleusen_status[count] == "zu" then
						
			moveObject ( schleusen_tore[count], 1000, schleusen_move[count]["x"], schleusen_move[count]["y"], schleusen_move[count]["z"] ) 
			schleusen_status[count] = "auf"
			
		elseif schleusen_status[count] == "auf" then
			
			moveObject ( schleusen_tore[count], 1000, schleusen_positionen[count]["x"], schleusen_positionen[count]["y"], schleusen_positionen[count]["z"] ) 
			schleusen_status[count] = "zu"
			
		end

end

function outputClick ( mouseButton, buttonState, ele )

	if buttonState == "up" then
	else
		
			if not ele then
				return
			end
						
			if getElementModel ( ele ) ~= 2886 then
				return
			end
			
			local x, y, z = getElementPosition ( source )
			local x1, y1, z1 = getElementPosition ( ele )
			
			if getDistanceBetweenPoints3D ( x, y, z, x1, y1, z1 ) > 5 then
				return
			end
			
			if not vnxGetElementData( ele, "SchleusenNummer" ) or vnxGetElementData( ele, "SchleusenNummer" ) == nil then
				return
			end
			
			if not isOnDuty(source) then
				outputChatBox ( "Du kannst die Tueren nicht bedienen!", source, 125, 0, 0 )
				return
			end
			
			local schleuse = tonumber(vnxGetElementData( ele, "SchleusenNummer" ))
			
			if schleuse == 1 and schleusen_status[2] == "auf" then
				
				vioToggleSchleuse ( 2 )
				
			end
			
			if schleuse == 2 and schleusen_status[1] == "auf" then
				
				vioToggleSchleuse ( 1 )
				
			end
			
			if schleuse == 3 and schleusen_status[4] == "auf" then
				
				vioToggleSchleuse ( 4 )
				
			end
			
			if schleuse == 4 and schleusen_status[3] == "auf" then
				
				vioToggleSchleuse ( 3 )
				
			end
			
			vioToggleSchleuse ( schleuse )
	
	end
	
end

addEventHandler( "onPlayerClick", getRootElement(), outputClick )