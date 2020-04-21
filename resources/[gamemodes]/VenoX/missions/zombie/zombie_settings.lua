maxzombies = 21
deleteNumber = 0
zombieDeleteRange = 60
maxzombiesPart = 7

zombieSkins = {
 [14]=true,
 [13]=true,
 [29]=true,
 [62]=true,
 [75]=true,
 [130]=true,
 [162]=true,
 [213]=true,
 [264]=true
 }

function getRandomZombieSkin ()

	local i = 0
	while i < 5 do
		i = i + 1
		for key, index in pairs ( zombieSkins ) do
			if math.random ( 1, 11 ) == 1 then
				return key
			end
		end
	end
	return 14
end