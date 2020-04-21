local cell_type_b = {}
cell_type_b[1] = 2450.9011230469
cell_type_b[2] = 2446.9050292969
cell_type_b[3] = 2442.8989257813
cell_type_b[4] = 2438.8967285156
cell_type_b[5] = 2434.9001464844
cell_type_b[6] = 2431.2014160156
cell_type_b[7] = 2427.134765625

local cell_type_b_move = {}
cell_type_b_move[1] = 2452.3310546875
cell_type_b_move[2] = 2448.3037109375
cell_type_b_move[3] = 2444.3095703125
cell_type_b_move[4] = 2440.3369140625
cell_type_b_move[5] = 2436.3249511719
cell_type_b_move[6] = 2432.6330566406
cell_type_b_move[7] = 2428.5385742188

local cell_type_b_open = {}
cell_type_b_open[1] = "zu"
cell_type_b_open[2] = "zu"
cell_type_b_open[3] = "zu"
cell_type_b_open[4] = "zu"
cell_type_b_open[5] = "zu"
cell_type_b_open[6] = "zu"
cell_type_b_open[7] = "zu"

local key_type_b = {}
key_type_b[1] = createObject ( 2886, 2447.8762207031, -1284.283203125, 995.17950439453, 0, 0, 180 )
key_type_b[2] = createObject ( 2886, 2444.1120605469, -1284.283203125, 995.17950439453, 0, 0, 180 )
key_type_b[3] = createObject ( 2886, 2440.1274414063, -1284.283203125, 995.17950439453, 0, 0, 180 )
key_type_b[4] = createObject ( 2886, 2436.0637207031, -1284.283203125, 995.17950439453, 0, 0, 180 )
key_type_b[5] = createObject ( 2886, 2432.0427246094, -1284.283203125, 995.17950439453, 0, 0, 180 )
key_type_b[6] = createObject ( 2886, 2428.2922363281, -1284.283203125, 995.17950439453, 0, 0, 180 )
key_type_b[7] = createObject ( 2886, 2424.2614746094, -1284.283203125, 995.17950439453, 0, 0, 180 )

for i, ob in pairs ( key_type_b ) do

	setElementInterior ( ob, 2 )
	setElementData ( ob, "objectCellInfoB", i )

end

local cell_types_b = {}

for i, xWErt in pairs ( cell_type_b ) do

	cell_types_b[i] = createObject ( 2930, xWErt, -1284.509765625, 996.09197998047, 0, 0, 270 )
	setElementInterior ( cell_types_b[i], 2 )

end

function Zell_Function_B ( mouseButton, buttonState, ele )

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
		
		if not vnxGetElementData( ele, "objectCellInfoB" ) or vnxGetElementData( ele, "objectCellInfoB" ) == nil then
			return
		end
		
		local number = tonumber(vnxGetElementData( ele, "objectCellInfoB" ))
			
		if not isOnDuty(source) then
			outputChatBox ( "Du kannst die Tueren nicht bedienen!", source, 125, 0, 0 )
			return
		end
		
		if cell_type_b_open[number] == "zu" then
		
			moveObject ( cell_types_b[number], 1000, cell_type_b_move[number], -1284.509765625, 996.09197998047 ) 
			cell_type_b_open[number] = "auf"
		
		elseif cell_type_b_open[number] == "auf" then
		
			moveObject ( cell_types_b[number], 1000, cell_type_b[number], -1284.509765625, 996.09197998047 ) 
			cell_type_b_open[number] = "zu"
		
		end
			
	end
	
end

addEventHandler( "onPlayerClick", getRootElement(), Zell_Function_B )

function vioCloseBCells ( )

	for i=1, 7, 1 do
			
		if cell_type_b_open[i] == "auf" then
		
			moveObject ( cell_types_b[i], 1000, cell_type_b[i], -1284.509765625, 996.09197998047 ) 
			cell_type_b_open[i] = "zu"
		
		end
	
	end

end

function vioOpenBCells ( )

	for i=1, 7, 1 do
			
		if cell_type_b_open[i] == "zu" then
		
			moveObject ( cell_types_b[i], 1000, cell_type_b_move[i], -1284.509765625, 996.09197998047 ) 
			cell_type_b_open[i] = "auf"
		
		end
	
	end

end