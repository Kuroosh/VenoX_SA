local i

jailCells = {}
 jailCells["sf"] = {}
 jailCells["lv"] = {}
  jailCells["sf"]["int"] = {}
  jailCells["sf"]["x"] = {}
  jailCells["sf"]["y"] = {}
  jailCells["sf"]["z"] = {}
  i = 1
  jailCells["sf"]["int"][i] = 10
  jailCells["sf"]["x"][i], jailCells["sf"]["y"][i], jailCells["sf"]["z"][i] = 215.61360168457, 110.61786651611, 998.66485595703
  i = 2
  jailCells["sf"]["int"][i] = 10
  jailCells["sf"]["x"][i], jailCells["sf"]["y"][i], jailCells["sf"]["z"][i] = 219.60717773438, 110.39416503906, 998.66485595703
  i = 3
  jailCells["sf"]["int"][i] = 10
  jailCells["sf"]["x"][i], jailCells["sf"]["y"][i], jailCells["sf"]["z"][i] = 223.60034179688, 110.17053222656, 998.66485595703
  i = 4
  jailCells["sf"]["int"][i] = 10
  jailCells["sf"]["x"][i], jailCells["sf"]["y"][i], jailCells["sf"]["z"][i] = 227.34938049316, 110.19967651367, 998.66485595703
 jailCells["lv"] = {}
  jailCells["lv"]["int"] = {}
  jailCells["lv"]["x"] = {}
  jailCells["lv"]["y"] = {}
  jailCells["lv"]["z"] = {}
  jailCells["lv"]["r"] = {}

  i = 1
  jailCells["lv"]["int"][i] = 3
  jailCells["lv"]["x"][i], jailCells["lv"]["y"][i], jailCells["lv"]["z"][i], jailCells["lv"]["r"][i] = 198.08735656738, 174.32916259766, 1002.672668457, 0
  i = 2
  jailCells["lv"]["int"][i] = 3
  jailCells["lv"]["x"][i], jailCells["lv"]["y"][i], jailCells["lv"]["z"][i], jailCells["lv"]["r"][i] = 192.9651184082, 174.32916259766, 1002.672668457, 0
  i = 3
  jailCells["lv"]["int"][i] = 3
  jailCells["lv"]["x"][i], jailCells["lv"]["y"][i], jailCells["lv"]["z"][i], jailCells["lv"]["r"][i] = 188.71510314941, 174.32916259766, 1002.672668457, 0
  i = 4
  jailCells["lv"]["int"][i] = 3
  jailCells["lv"]["x"][i], jailCells["lv"]["y"][i], jailCells["lv"]["z"][i], jailCells["lv"]["r"][i] = 198.08735656738, 162.25230407715, 1002.6791992188, 180


function isInLVJailArea ( player )

	local x1, y1, z1 = getElementPosition ( player )
	if z1 > 1000 and z1 < 1010 then
		if x1 <= 200.14804077148 and x1 >= 187.82965087891 then
			if y1 <= 181.1328125 and y1 >= 156.23985290527 then
				return true
			end
		end
	end
	return false
end

function getRandomCellKoordinates ( sf )

	local int, x, y, z, rnd
	if sf then
		rnd = math.random ( 1, 4 )
		tok = "sf"
	else
		rnd = math.random ( 1, 4 )
		tok = "lv"
	end
	return jailCells[tok]["x"][rnd], jailCells[tok]["y"][rnd], jailCells[tok]["z"][rnd], jailCells[tok]["r"][rnd], jailCells["lv"]["int"][i]
end	
		
		
		
		
		