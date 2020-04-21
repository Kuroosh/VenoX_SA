-- Bankautomaten ( Four Dragons )
local object = createObject ( 2942, 1983.1873779297, 1032.4086914063, 994.11163330078 )
setElementInterior ( object, 10 )
local object = createObject ( 2942, 1983.9888916016, 1032.3887939453, 994.11163330078 )
setElementInterior ( object, 10 )

-- Chipsbuy
for i = 1, 7 do
	local object = createObject ( 2754, 1985.0505371094 + ( 1985.8994140625 - 1985.0505371094 ) * ( i - 1 ), 1032.6665039063, 994.29998779297, 0, 0, 90 )
	setElementInterior ( object, 10 )
end

--[[
<object id="FDChips1" doublesided="false" model="2754" interior="10" dimension="0" posX="1985.0505371094, 1032.6665039063, 994.29998779297, 0, 0, 90" />
<object id="FDChips2" doublesided="false" model="2754" interior="10" dimension="0" posX="1985.8994140625, 1032.6665039063, 994.29998779297, 0, 0, 90" />
<object id="FDBank1" doublesided="false" model="2942" interior="10" dimension="0" posX="1983.1873779297, 1032.4086914063, 994.11163330078, 0, 0, 0" />
<object id="FDBank2" doublesided="false" model="2942" interior="10" dimension="0" posX="1983.9888916016, 1032.3887939453, 994.11163330078, 0, 0, 0" />


roulett1" doublesided="false" model="2992" interior="1" dimension="0" posX="2242.7966308594, 1588.8745117188, 1006.0559692383
roulett2" doublesided="false" model="2992" interior="1" dimension="0" posX="2241.8732910156, 1614.2368164063, 1006.055847168
roulett3" doublesided="false" model="2992" interior="1" dimension="0" posX="2230.9973144531, 1614.2836914063, 1006.055847168
roulett4" doublesided="false" model="2992" interior="1" dimension="0" posX="2231.0014648438, 1588.8724365234, 1006.057800293
roulettFD" doublesided="false" model="2992" interior="10" dimension="0" posX="1952.3425292969, 1040.5407714844, 992.740234375


-- Marker
2242.3874511719, 1587.8371582031, 1005.1605834961
-- Dealer
2242.2998046875, 1590.8127441406, 1005.8317871094
]]

roulettBets = {}
roulettChances = {}
-- Felder --
	roulettChances["1st"] = 3
	roulettChances["2nd"] = 3
	roulettChances["3rd"] = 3
	roulettChances["top"] = 3
	roulettChances["middle"] = 3
	roulettChances["bottom"] = 3
	roulettChances["1-18"] = 2
	roulettChances["19-36"] = 2
	roulettChances["even"] = 2
	roulettChances["odd"] = 2
	roulettChances["black"] = 2
	roulettChances["red"] = 2
	roulettChances["zero"] = 36
	for i = 1, 23 do
		roulettChances[i] = {}
	end
	-- Einzeln --
	for i = 1, 23, 2 do
		roulettChances[i][2] = 36
		roulettChances[i][4] = 36
		roulettChances[i][6] = 36
	end
	-- Cheval von Links nach Rechts --
	for i = 2, 22, 2 do
		roulettChances[i][2] = 18
		roulettChances[i][4] = 18
		roulettChances[i][6] = 18
	end
	-- Cheval von Oben nach Unten --
	for i = 1, 23, 2 do
		roulettChances[i][3] = 18
		roulettChances[i][5] = 18
	end
	-- Vierer --
	for i = 2, 22, 2 do
		roulettChances[i][3] = 8
		roulettChances[i][5] = 8
	end
	-- 6er ( Obere Reihe; Bsp.: 1, 2, 3, 4, 5, 6 )
	for i = 2, 22, 2 do
		roulettChances[i][1] = 9
	end
	-- 3er
	for i = 1, 23, 2 do
		roulettChances[i][1] = 12
	end

roulettRed = {
 [3]=true, [1]=true, [5]=true, [7]=true, [9]=true, [12]=true, [14]=true, [18]=true, [16]=true, [21]=true, [19]=true, [23]=true, [27]=true, [25]=true, [30]=true, [32]=true, [36]=true, [34]=true
 }
roulettBlack = {
 [2]=true, [4]=true, [6]=true, [8]=true, [11]=true, [10]=true, [15]=true, [13]=true, [17]=true, [20]=true, [24]=true, [22]=true, [26]=true, [29]=true, [28]=true, [33]=true, [31]=true, [35]=true
 }

function startRoulett_func ( string, count )

	local player = client
	local betMoney = 0
	local playerChips = vnxGetElementData ( player, "casinoChips" )
	
	roulettBets[player] = {}
	for i = 1, 23 do
		roulettBets[player][i] = {}
	end
	
	local field, tok, betOnField, x, y
	for i = 1, count do
		tok = gettok ( string, i, string.byte ( ';' ) )..","
		field = gettok ( tok, 1, string.byte ( ',' ) )
		betOnField = tonumber ( gettok ( tok, 2, string.byte ( ',' ) ) )
		betMoney = betMoney + betOnField
		
		x = tonumber ( gettok ( field, 1, string.byte ( '|' ) ) )
		if x then
			field = field.."|"
			y = tonumber ( gettok ( field, 2, string.byte ( '|' ) ) )
			roulettBets[player][x][y] = betOnField
		else
			roulettBets[player][field] = betOnField
		end
	end
	
	if betMoney <= playerChips then
		if betMoney <= calcPlayerMaxGambleBet ( player, 0 ) then
			vnxSetElementData ( player, "casinoChips", playerChips - betMoney )
			
			roulettWinningNumber = math.random ( 0, 36 )
			
			for key1, index1 in pairs ( roulettBets[player] ) do
				if tonumber ( key1 ) then
					for key2, index2 in pairs ( roulettBets[player][key1] ) do
						local x, y = tonumber ( key1 ), tonumber ( key2 )
						-- Einzelner Treffer
						if y / 2 == math.floor ( y / 2 ) and x / 2 ~= math.floor ( x / 2 ) then
							if getNumberOfField ( x, y ) == roulettWinningNumber then
								roulettWin ( 36, index2, player )
							end
						-- Cheval L-R
						elseif math.floor ( x / 2 ) == x / 2 and y / 2 == math.floor ( y / 2 ) then
							if getNumberOfField ( x - 1, y ) == roulettWinningNumber or getNumberOfField ( x + 1, y ) == roulettWinningNumber then
								roulettWin ( 18, index2, player )
							end
						-- Cheval O-U
						elseif math.floor ( x / 2 ) ~= x / 2 and ( y == 3 or y == 5 ) then
							if getNumberOfField ( x, y - 1 ) == roulettWinningNumber or getNumberOfField ( x, y + 1 ) == roulettWinningNumber then
								roulettWin ( 18, index2, player )
							end
						-- 3er
						elseif y == 1 and x / 2 ~= math.floor ( x / 2 ) then
							if getNumberOfField ( x, 2 ) == roulettWinningNumber or getNumberOfField ( x, 4 ) == roulettWinningNumber or getNumberOfField ( x, 6 ) == roulettWinningNumber then
								roulettWin ( 12, index2, player )
							end
						-- 4er Treffer
						elseif x / 2 == math.floor ( x / 2 ) and ( y == 3 or y == 5 ) then
							local c1 = getNumberOfField ( x - 1, y - 1 )
							local c2 = getNumberOfField ( x - 1, y + 1 )
							local c3 = getNumberOfField ( x + 1, y - 1 )
							local c4 = getNumberOfField ( x + 1, y + 1 )
							if c1 == roulettWinningNumber or c2 == roulettWinningNumber or c3 == roulettWinningNumber or c4 == roulettWinningNumber then
								roulettWin ( 8, index2, player )
							end
						-- 6er Treffer
						elseif y == 1 and x / 2 == math.abs ( x / 2 ) then
							local c1 = getNumberOfField ( x - 1, 2 )
							local c2 = getNumberOfField ( x - 1, 4 )
							local c3 = getNumberOfField ( x - 1, 6 )
							local c4 = getNumberOfField ( x + 1, 2 )
							local c5 = getNumberOfField ( x + 1, 4 )
							local c6 = getNumberOfField ( x + 1, 6 )
							local roulettFields = { [c1]=true, [c2]=true, [c3]=true, [c4]=true, [c5]=true, [c6]=true }
							if roulettFields[roulettWinningNumber] then
								roulettWin ( 6, index2, player )
							end
						end
					end
				else
					if key1 == "zero" then
						if roulettWinningNumber == 0 then
							roulettWin ( 36, index1, player )
						end
					elseif roulettWinningNumber ~= 0 then
						if key1 == "1st" and roulettWinningNumber <= 12 and roulettWinningNumber >= 1 then
							if roulettWinningNumber <= 12 then
								roulettWin ( 3, index1, player )
							end
						elseif key1 == "2nd" then
							if roulettWinningNumber <= 24 and roulettWinningNumber >= 13 then
								roulettWin ( 3, index1, player )
							end
						elseif key1 == "3rd" then
							if roulettWinningNumber <= 36 and roulettWinningNumber >= 25 then
								roulettWin ( 3, index1, player )
							end
						elseif key1 == "top" then
							if roulettWinningNumber / 3 == math.floor ( roulettWinningNumber / 3 ) then
								roulettWin ( 3, index1, player )
							end
						elseif key1 == "middle" then
							if ( roulettWinningNumber + 1 ) / 3 == math.floor ( ( roulettWinningNumber + 1 ) / 3 ) then
								roulettWin ( 3, index1, player )
							end
						elseif key1 == "bottom" then
							if ( roulettWinningNumber + 1 ) / 3 == math.floor ( ( roulettWinningNumber + 1 ) / 3 ) then
								roulettWin ( 3, index1, player )
							end
						elseif key1 == "1-18" then
							if roulettWinningNumber <= 18 then
								roulettWin ( 2, index1, player )
							end
						elseif key1 == "19-36" then
							if roulettWinningNumber <= 36 and roulettWinningNumber > 18 then
								roulettWin ( 2, index1, player )
							end
						elseif key1 == "even" then
							if roulettWinningNumber / 2 == math.floor ( roulettWinningNumber / 2 ) then
								roulettWin ( 2, index1, player )
							end
						elseif key1 == "odd" then
							if roulettWinningNumber / 2 ~= math.floor ( roulettWinningNumber / 2 ) then
								roulettWin ( 2, index1, player )
							end
						elseif key1 == "black" then
							if roulettBlack[roulettWinningNumber] then
								roulettWin ( 2, index1, player )
							end
						elseif key1 == "red" then
							if roulettRed[roulettWinningNumber] then
								roulettWin ( 2, index1, player )
							end
						end
					end
				end
			end
			local diff = vnxGetElementData ( player, "casinoChips" ) - playerChips
			if diff > 0 then
				outputLog ( "[Roulett] "..getPlayerName ( player ).." hat "..diff.." Chips gewonnen", "casino" )
			elseif diff < 0 then
				outputLog ( "[Roulett] "..getPlayerName ( player ).." hat "..math.abs ( diff ).." Chips verloren", "casino" )
			end
			triggerClientEvent ( player, "showRoulettWinningNumber", player, roulettWinningNumber, vnxGetElementData ( player, "casinoChips" ) - playerChips )
		else
			infobox ( player, "Dafuer ist dein\nSpielerskill nicht\nhoch genug!\nMaximaleinsatz:\n"..calcPlayerMaxGambleBet ( player, 0 ).." $", 5000, 125, 0, 0 )
			triggerClientEvent ( player, "showRoulettWinningNumber", player, nil )
		end
	else
		outputChatBox ( "ERROR: Invalid value detected!", player, 200, 0, 0 )
	end
end
addEvent ( "startRoulett", true )
addEventHandler ( "startRoulett", getRootElement(), startRoulett_func )

function roulettStart_func ()

	setElementDimension ( client, 1 )
end
addEvent ( "roulettStart", true )
addEventHandler ( "roulettStart", getRootElement(), roulettStart_func )

function roulettEnd_func ()

	setElementDimension ( client, 0 )
end
addEvent ( "roulettEnd", true )
addEventHandler ( "roulettEnd", getRootElement(), roulettEnd_func )

function getNumberOfField ( x, y )

	x = ( x + 1 ) / 2
	y = y / 2
	
	return math.abs ( y - 4 ) + ( x - 1 ) * 3
end

function roulettWin ( multiply, amount, player )

	setTimer ( increasePlayerGambleSkillLevel, 5000, 1, player, amount )
	vnxSetElementData ( player, "casinoChips", vnxGetElementData ( player, "casinoChips" ) + multiply * amount )
end