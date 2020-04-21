local cell_type_e = {}
cell_type_e[1] = 2463.0178222656
cell_type_e[2] = 2467.0122070313
cell_type_e[3] = 2470.9780273438

local cell_type_e_move = {}
cell_type_e_move[1] = 2461.7746582031
cell_type_e_move[2] = 2465.5515136719
cell_type_e_move[3] = 2469.5241699219

local cell_type_e_open = {}
cell_type_e_open[1] = "zu"
cell_type_e_open[2] = "zu"
cell_type_e_open[3] = "zu"

local key_type_e = {}
key_type_e[1] = createObject ( 2886, 2464.099609375, -1264.3234863281, 988.84484863281, 0, 0, 0 )
key_type_e[2] = createObject ( 2886, 2468.2329101563, -1264.3234863281, 988.84484863281, 0, 0, 0 )
key_type_e[3] = createObject ( 2886, 2471.9521484375, -1264.3234863281, 988.84484863281, 0, 0, 0 )

for i, ob in pairs ( key_type_e ) do

	setElementInterior ( ob, 2 )
	setElementData ( ob, "objectCellInfoE", i )

end

local cell_types_e = {}

for i, xWErt in pairs ( cell_type_e ) do

	cell_types_e[i] = createObject ( 2930, xWErt, -1264.1553955078, 989.72735595703, 0, 0, 270 )
	setElementInterior ( cell_types_e[i], 2 )

end

function vioCloseECells ( )

	for i=1, 3, 1 do
			
		if cell_type_e_open[i] == "auf" then
		
			moveObject ( cell_types_e[i], 1000, cell_type_e[i], -1264.1553955078, 989.72735595703 ) 
			cell_type_e_open[i] = "zu"
		
		end
	
	end

end

function vioOpenECells ( )

	for i=1, 3, 1 do
			
		if cell_type_e_open[i] == "zu" then
		
			moveObject ( cell_types_e[i], 1000, cell_type_e_move[i], -1264.1553955078, 989.72735595703 ) 
			cell_type_e_open[i] = "auf"
		
		end
	
	end

end

function Zell_Function_E ( mouseButton, buttonState, ele )

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
		
		if not vnxGetElementData( ele, "objectCellInfoE" ) or vnxGetElementData( ele, "objectCellInfoE" ) == nil then
			return
		end
		
		local number = tonumber(vnxGetElementData( ele, "objectCellInfoE" ))
			
		if not isOnDuty(source) then
			outputChatBox ( "Du kannst die Tueren nicht bedienen!", source, 125, 0, 0 )
			return
		end
		
		if cell_type_e_open[number] == "zu" then
		
			moveObject ( cell_types_e[number], 1000, cell_type_e_move[number], -1264.1553955078, 989.72735595703 ) 
			cell_type_e_open[number] = "auf"
		
		elseif cell_type_e_open[number] == "auf" then
		
			moveObject ( cell_types_e[number], 1000, cell_type_e[number], -1264.1553955078, 989.72735595703 ) 
			cell_type_e_open[number] = "zu"
		
		end
			
	end
	
end

addEventHandler( "onPlayerClick", getRootElement(), Zell_Function_E )

addCommandHandler ( "cell", 
	function ( player, cmd, arg )
	
		local rank = getPlayerRank ( player )
		
		if isOnDuty( player ) then
		
			if rank >= 5 then
			
				if arg == "open" then
				
					vioOpenACells ( )
					vioOpenBCells ( )
					vioOpenCCells ( )
					vioOpenDCells ( )
					vioOpenECells ( )
					outputChatBox ( "Du hast alle Zellentueren geoeffnet!", player, 0, 125, 0 )
				
				elseif arg == "close" then
				
					vioCloseACells ( )
					vioCloseBCells ( )
					vioCloseCCells ( )
					vioCloseDCells ( )
					vioCloseECells ( )
					outputChatBox ( "Du hast alle Zellentueren geschlossen!", player, 0, 125, 0 )
				
				end
			else
				infobox ( player, "\nAb Rang 5!", 4000, 155, 0, 0 )
			
			end
		else
			infobox ( player, "Du musst dafür\nOnduty Staatsfraktionist\nsein!", 4000, 155, 0, 0 )
		end
	
	end, false, false )