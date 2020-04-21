local cell_type_c = {}
cell_type_c[1] = 2450.9555664063
cell_type_c[2] = 2446.9436035156
cell_type_c[3] = 2442.9516601563
cell_type_c[4] = 2438.9516601563
cell_type_c[5] = 2434.9487304688
cell_type_c[6] = 2431.2517089844
cell_type_c[7] = 2427.1948242188

local cell_type_c_move = {}
cell_type_c_move[1] = 2449.5141601563
cell_type_c_move[2] = 2445.4846191406
cell_type_c_move[3] = 2441.4943847656
cell_type_c_move[4] = 2437.52734375
cell_type_c_move[5] = 2433.4777832031
cell_type_c_move[6] = 2429.7858886719
cell_type_c_move[7] = 2425.7170410156

local cell_type_c_open = {}
cell_type_c_open[1] = "zu"
cell_type_c_open[2] = "zu"
cell_type_c_open[3] = "zu"
cell_type_c_open[4] = "zu"
cell_type_c_open[5] = "zu"
cell_type_c_open[6] = "zu"
cell_type_c_open[7] = "zu"

local key_type_c = {}
key_type_c[1] = createObject ( 2886, 2452.1203613281, -1265.3775634766, 988.83392333984, 0, 0, 0 )
key_type_c[2] = createObject ( 2886, 2447.9011230469, -1265.3775634766, 988.83392333984, 0, 0, 0 )
key_type_c[3] = createObject ( 2886, 2444.1083984375, -1265.3775634766, 988.83392333984, 0, 0, 0 )
key_type_c[4] = createObject ( 2886, 2440.1494140625, -1265.3775634766, 988.83392333984, 0, 0, 0 )
key_type_c[5] = createObject ( 2886, 2436.0686035156, -1265.3775634766, 988.83392333984, 0, 0, 0 )
key_type_c[6] = createObject ( 2886, 2432.1147460938, -1265.3775634766, 988.83392333984, 0, 0, 0 )
key_type_c[7] = createObject ( 2886, 2428.3198242188, -1265.3775634766, 988.83392333984, 0, 0, 0 )

for i, ob in pairs ( key_type_c ) do

	setElementInterior ( ob, 2 )
	setElementData ( ob, "objectCellInfoC", i )

end

local cell_types_c = {}

for i, xWErt in pairs ( cell_type_c ) do

	cell_types_c[i] = createObject ( 2930, xWErt, -1265.2086181641, 989.73797607422, 0, 0, 270 )
	setElementInterior ( cell_types_c[i], 2 )

end

function Zell_Function_C ( mouseButton, buttonState, ele )

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
		
		if not vnxGetElementData( ele, "objectCellInfoC" ) or vnxGetElementData( ele, "objectCellInfoC" ) == nil then
			return
		end
		
		local number = tonumber(vnxGetElementData( ele, "objectCellInfoC" ))
			
		if not isOnDuty(source) then
			outputChatBox ( "Du kannst die Tueren nicht bedienen!", source, 125, 0, 0 )
			return
		end
		
		if cell_type_c_open[number] == "zu" then
		
			moveObject ( cell_types_c[number], 1000, cell_type_c_move[number], -1265.2086181641, 989.73797607422 ) 
			cell_type_c_open[number] = "auf"
		
		elseif cell_type_c_open[number] == "auf" then
		
			moveObject ( cell_types_c[number], 1000, cell_type_c[number], -1265.2086181641, 989.73797607422 ) 
			cell_type_c_open[number] = "zu"
		
		end
			
	end
	
end

addEventHandler( "onPlayerClick", getRootElement(), Zell_Function_C )

function vioCloseCCells ( )

	for i=1, 7, 1 do
			
		if cell_type_c_open[i] == "auf" then
		
			moveObject ( cell_types_c[i], 1000, cell_type_c[i], -1265.2086181641, 989.73797607422 ) 
			cell_type_c_open[i] = "zu"
		
		end
	
	end

end

function vioOpenCCells ( )

	for i=1, 7, 1 do
			
		if cell_type_c_open[i] == "zu" then
		
			moveObject ( cell_types_c[i], 1000, cell_type_c_move[i], -1265.2086181641, 989.73797607422 ) 
			cell_type_c_open[i] = "auf"
		
		end
	
	end

end