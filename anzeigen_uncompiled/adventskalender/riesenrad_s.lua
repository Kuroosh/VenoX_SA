ferPos = {
  { -2078.3999023438, 1428.5999755859, 8 }, -- ok
  { -2085.2, 1428.1, 10.2 }, -- ok
  { -2089.5, 1428.1999511719, 16 }, -- ok
  { -2089.6000976563, 1428, 23.200000762939 }, -- ok
  { -2085.3999023438, 1428, 29.200000762939 }, -- ok
  { -2078.3000488281, 1428.0999755859, 31.299999237061 }, --ok
  { -2071.6999511719, 1428.1999511719, 29.2 }, --ok
  { -2067.3000488281, 1428.1999511719, 23.5 }, --ok
  { -2067.3000488281, 1428.0999755859, 16.299999237061 }, --ok
  { -2071.6000976563, 1428.3000488281, 10.3 } --ok
}

mov_ferPos = {
  { -2078.3999023438, 1428.5999755859, 8 }, -- ok
  { -2082, 1428, 8.69 },
  { -2085.2, 1428.1, 10.2 }, -- ok
  { -2087.8, 1428.199, 12.899 },
  { -2089.5, 1428.1999511719, 16 }, -- ok
  { -2090.1000976563, 1428.0999755859, 19.6 },
  { -2089.6000976563, 1428, 23.200000762939 }, -- ok
  { -2087.8999023438, 1428.0999755859, 26.5 },
  { -2085.3999023438, 1428, 29.200000762939 }, -- ok
  { -2081.8999023438, 1428.0999755859, 31 },
  { -2078.3000488281, 1428.0999755859, 31.299999237061 }, --ok
  { -2074.6999511719, 1428.0999755859, 30.8 },
  { -2071.6999511719, 1428.1999511719, 29.2 }, --ok
  { -2068.8000488281, 1428.0999755859, 26.5 },
  { -2067.3000488281, 1428.1999511719, 23.5 }, --ok
  { -2066.8999023438, 1428.0999755859, 19.60000038147 },
  { -2067.3000488281, 1428.0999755859, 16.299999237061 }, --ok
  { -2069, 1428.0999755859, 12.9 },
  { -2071.6000976563, 1428.3000488281, 10.3 }, --ok
  { -2074.8999023438, 1428.3000488281, 8.6999998092651 }
}

local fcabin = {
	obj = {},
	step = {},
	col = {}
}
local interval = 7000

function spawnGondeln()
	--outputChatBox("0")
	for i, t in ipairs( ferPos ) do
		fcabin.obj[i] = createObject(3752, t[1], t[2], t[3], 0, 0, 90, false)
		attachElements( createMarker( 0, 0, 0, 'corona', 3.0, rnd(), rnd(), rnd(), 80 ), fcabin.obj[ i ], 0, 0, 1.65 )
		fcabin.col[ i ] = createColSphere( 0, 0, 0, 2.35 )
		attachElements( fcabin.col[ i ], fcabin.obj[ i ] )
	end
  
	local iter = 1
	for i, t in ipairs( mov_ferPos ) do
		if i % 2 ~= 0 then
			fcabin.step[ iter ] = i
			iter = iter + 1
		end
	end
  
	moveCabins()
end
setTimer(spawnGondeln, 1000, 1)

addEvent( 'client_getCabinsCollision', true )
addEventHandler( 'client_getCabinsCollision', root, function()
	triggerClientEvent( client, 'server_sendCabinsCollision', root, fcabin.col )
end )

-- 2x move = ein Gondel am einstieg vorbei 
local moved = 0
function moveCabins()
	if (moved == 10) then
		moved = 0
		setTimer(moveCabins, 10000, 1)
		if isTimer(_G["moveTimer"]) then
			killTimer(_G["moveTimer"])
		end
		triggerClientEvent(getRootElement(), "gondelnHolding", getRootElement())
		--outputChatBox("moved10")
	else
		for i = 1, #fcabin.obj do
			fcabin.step[ i ] = fcabin.step[ i ] + 1
			if (fcabin.step[ i ] > #mov_ferPos) then
				fcabin.step[ i ] = 1
			end
			moveObject( fcabin.obj[ i ], interval, mov_ferPos[ fcabin.step[ i ] ][ 1 ], mov_ferPos[ fcabin.step[ i ] ][ 2 ], mov_ferPos[ fcabin.step[ i ] ][ 3 ] );
		end
		_G["moveTimer"] = setTimer(moveCabins, interval, 1)
		moved = moved + 1
	end
end

function rnd()
	return tonumber(math.random( 0, 255 ))
end;