local cell_type_d = {}
cell_type_d[1] = 2450.9440917969
cell_type_d[2] = 2446.9389648438
cell_type_d[3] = 2442.9389648438
cell_type_d[4] = 2438.9338378906
cell_type_d[5] = 2434.9423828125
cell_type_d[6] = 2431.2470703125
cell_type_d[7] = 2427.1804199219

local cell_type_d_move = {}
cell_type_d_move[1] = 2449.5197753906
cell_type_d_move[2] = 2445.5368652344
cell_type_d_move[3] = 2441.4833984375
cell_type_d_move[4] = 2437.4868164063
cell_type_d_move[5] = 2433.4868164063
cell_type_d_move[6] = 2429.7863769531
cell_type_d_move[7] = 2425.7197265625

local cell_type_d_open = {}
cell_type_d_open[1] = "zu"
cell_type_d_open[2] = "zu"
cell_type_d_open[3] = "zu"
cell_type_d_open[4] = "zu"
cell_type_d_open[5] = "zu"
cell_type_d_open[6] = "zu"
cell_type_d_open[7] = "zu"

local key_type_d = {}
key_type_d[1] = createObject ( 2886, 2452.1115722656, -1265.3848876953, 995.11755371094, 0, 0, 0 )
key_type_d[2] = createObject ( 2886, 2447.9128417969, -1265.3848876953, 995.11755371094, 0, 0, 0 )
key_type_d[3] = createObject ( 2886, 2444.1030273438, -1265.3848876953, 995.11755371094, 0, 0, 0 )
key_type_d[4] = createObject ( 2886, 2440.1354980469, -1265.3793945313, 995.11755371094, 0, 0, 0 )
key_type_d[5] = createObject ( 2886, 2436.0649414063, -1265.3793945313, 995.11755371094, 0, 0, 0 )
key_type_d[6] = createObject ( 2886, 2432.1042480469, -1265.3793945313, 995.11755371094, 0, 0, 0 )
key_type_d[7] = createObject ( 2886, 2428.3564453125, -1265.3793945313, 995.11755371094, 0, 0, 0 )

for i, ob in pairs ( key_type_d ) do

	setElementInterior ( ob, 2 )
	setElementData ( ob, "objectCellInfoD", i )

end

local cell_types_d = {}

for i, xWErt in pairs ( cell_type_d ) do

	cell_types_d[i] = createObject ( 2930, xWErt, -1265.2269287109, 996.09594726563, 0, 0, 270 )
	setElementInterior ( cell_types_d[i], 2 )

end

function Zell_Function_D ( mouseButton, buttonState, ele )

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
		
		if not vnxGetElementData( ele, "objectCellInfoD" ) or vnxGetElementData( ele, "objectCellInfoD" ) == nil then
			return
		end
		
		local number = tonumber(vnxGetElementData( ele, "objectCellInfoD" ))
			
		if not isOnDuty(source) then
			outputChatBox ( "Du kannst die Tueren nicht bedienen!", source, 125, 0, 0 )
			return
		end
		
		if cell_type_d_open[number] == "zu" then
		
			moveObject ( cell_types_d[number], 1000, cell_type_d_move[number], -1265.2269287109, 996.09594726563 ) 
			cell_type_d_open[number] = "auf"
		
		elseif cell_type_d_open[number] == "auf" then
		
			moveObject ( cell_types_d[number], 1000, cell_type_d[number], -1265.2269287109, 996.09594726563 ) 
			cell_type_d_open[number] = "zu"
		
		end
			
	end
	
end

addEventHandler( "onPlayerClick", getRootElement(), Zell_Function_D )

function vioCloseDCells ( )

	for i=1, 7, 1 do
			
		if cell_type_d_open[i] == "auf" then
		
			moveObject ( cell_types_d[i], 1000, cell_type_d[i], -1265.2269287109, 996.09594726563 ) 
			cell_type_d_open[i] = "zu"
		
		end
	
	end

end

function vioOpenDCells ( )

	for i=1, 7, 1 do
			
		if cell_type_d_open[i] == "zu" then
		
			moveObject ( cell_types_d[i], 1000, cell_type_d_move[i], -1265.2269287109, 996.09594726563 ) 
			cell_type_d_open[i] = "auf"
		
		end
	
	end

end