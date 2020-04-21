local cell_type_a = {}
cell_type_a[1] = 2450.892578125
cell_type_a[2] = 2446.9011230469
cell_type_a[3] = 2442.9020996094
cell_type_a[4] = 2438.8991699219
cell_type_a[5] = 2434.9001464844
cell_type_a[6] = 2431.1989746094
cell_type_a[7] = 2427.1350097656

local cell_type_a_move = {}
cell_type_a_move[1] = 2452.3076171875
cell_type_a_move[2] = 2448.2995605469
cell_type_a_move[3] = 2444.3193359375
cell_type_a_move[4] = 2440.2978515625
cell_type_a_move[5] = 2436.3115234375
cell_type_a_move[6] = 2432.5961914063
cell_type_a_move[7] = 2428.5561523438

local cell_type_a_open = {}
cell_type_a_open[1] = "zu"
cell_type_a_open[2] = "zu"
cell_type_a_open[3] = "zu"
cell_type_a_open[4] = "zu"
cell_type_a_open[5] = "zu"
cell_type_a_open[6] = "zu"
cell_type_a_open[7] = "zu"

local key_type_a = {}
key_type_a[1] = createObject ( 2886, 2447.900390625, -1284.2548828125, 988.75537109375, 0, 0, 180 )
key_type_a[2] = createObject ( 2886, 2444.05859375, -1284.2587890625, 988.75537109375, 0, 0, 180 )
key_type_a[3] = createObject ( 2886, 2440.09765625, -1284.2568359375, 988.75537109375, 0, 0, 180 )
key_type_a[4] = createObject ( 2886, 2436.0439453125, -1284.259765625, 988.75537109375, 0, 0, 180 )
key_type_a[5] = createObject ( 2886, 2432.0439453125, -1284.28125, 988.75537109375, 0, 0, 180 )
key_type_a[6] = createObject ( 2886, 2428.337890625, -1284.2333984375, 988.75537109375, 0, 0, 180 )
key_type_a[7] = createObject ( 2886, 2424.263671875, -1284.255859375, 988.75537109375, 0, 0, 180 )

for i, ob in pairs ( key_type_a ) do

	setElementInterior ( ob, 2 )
	setElementData ( ob, "objectCellInfoA", i )

end

local cell_types_a = {}

for i, xWErt in pairs ( cell_type_a ) do

	cell_types_a[i] = createObject ( 2930, xWErt, -1284.4921875, 989.68756103516, 0, 0, 270 )
	setElementInterior ( cell_types_a[i], 2 )

end

function Zell_Function_A ( mouseButton, buttonState, ele )

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
		
		if not vnxGetElementData( ele, "objectCellInfoA" ) or vnxGetElementData( ele, "objectCellInfoA" ) == nil then
			return
		end
		
		local number = tonumber(vnxGetElementData( ele, "objectCellInfoA" ))
			
		if not isOnDuty(source) then
			outputChatBox ( "Du kannst die Tueren nicht bedienen!", source, 125, 0, 0 )
			return
		end
		
		if cell_type_a_open[number] == "zu" then
		
			moveObject ( cell_types_a[number], 1000, cell_type_a_move[number], -1284.4921875, 989.68756103516 ) 
			cell_type_a_open[number] = "auf"
		
		elseif cell_type_a_open[number] == "auf" then
		
			moveObject ( cell_types_a[number], 1000, cell_type_a[number], -1284.4921875, 989.68756103516 ) 
			cell_type_a_open[number] = "zu"
		
		end
			
	end
	
end

addEventHandler( "onPlayerClick", getRootElement(), Zell_Function_A )

function vioCloseACells ( )

	for i=1, 7, 1 do
			
		if cell_type_a_open[i] == "auf" then
		
			moveObject ( cell_types_a[i], 1000, cell_type_a[i], -1284.4921875, 989.68756103516 ) 
			cell_type_a_open[i] = "zu"
		
		end
	
	end

end

function vioOpenACells ( )

	for i=1, 7, 1 do
			
		if cell_type_a_open[i] == "zu" then
		
			moveObject ( cell_types_a[i], 1000, cell_type_a_move[i], -1284.4921875, 989.68756103516 ) 
			cell_type_a_open[i] = "auf"
		
		end
	
	end

end