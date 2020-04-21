local horseShoePickupModel = 954
local horseShoes = {}
local horseShoesID = {}
local gotHorseShoes = {}
local horseShoesChanged = {}

function createHorseShoePickup ( id, x, y, z )

	local pickup = createPickup ( x, y, z, 3, horseShoePickupModel, 1, 99999 )
	horseShoes[id] = pickup
	horseShoesID[pickup] = id
	addEventHandler ( "onPickupHit", pickup,
		function ( player )
			local pickup = source
			if getElementInterior ( player ) == getElementInterior ( pickup ) and getElementDimension ( player ) == getElementDimension ( pickup ) then
				local i = horseShoesID[pickup]
				if gotHorseShoes[player]["horseShoe"..i] == 0 then
					gotHorseShoes[player]["horseShoe"..i] = 1
					horseShoesChanged[player] = true
					triggerClientEvent ( player, "hideHorseshoe", player, pickup )
					vnxSetElementData ( player, "bonuspoints", vnxGetElementData ( player, "bonuspoints" ) + 10 )
					
					local shoes = vnxGetElementData ( player, "totalHorseShoes" ) + 1
					vnxSetElementData ( player, "totalHorseShoes", shoes )
					if shoes == 25 then
						vnxSetElementData ( player, "bonuspoints", vnxGetElementData ( player, "bonuspoints" ) + 50 )
						triggerClientEvent ( player, "showAchievmentBox", player, " Schmied", 50, 10000 )
					else
						triggerClientEvent ( player, "showAchievmentBox", player, " Hufeisen\n gefunden!", 10, 10000 )
					end
				end
			end
		end
	)
end

function loadHorseShoesFound ( player, pname )

	local string = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "Hufeisen", "achievments", "UID", playerUID[pname] ), -1 )
	if string and string[1] then
		string = string[1]["Hufeisen"] 
		local hasToBeHidden = {}
		local shoes = 0
		gotHorseShoes[player] = {}
		for j = 1, 25 do
			local val = tonumber ( gettok ( string, j, string.byte ( '|' ) ) )
			gotHorseShoes[player]["horseShoe"..j] = val
			if val == 1 then
				shoes = shoes + 1
				hasToBeHidden[shoes] = horseShoes[j]
			end
		end
		if shoes > 0 then
			triggerClientEvent ( player, "hideHorseshoeArray", player, hasToBeHidden )
		end
		vnxSetElementData ( player, "totalHorseShoes", shoes )
		horseShoesChanged[player] = horseShoesChanged
	end
end

function saveHorseShoesFound ( player, pname )

	if horseShoesChanged[player] then
		local var = ""
		for i = 1, 25 do
			var = var..gotHorseShoes[player]["horseShoe"..i].."|"
		end
		dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "achievments", "Hufeisen", var, "UID", playerUID[pname] )
	end
end
--[[
createHorseShoePickup ( 1, 2489.9963378906, 918.52191162109, 11.0234375 )
createHorseShoePickup ( 2, 2228.7763671875, 1106.7995605469, 54.549186706543 )
createHorseShoePickup ( 3, 2176.7121582031, 1285.7557373047, 41.257621765137 )
createHorseShoePickup ( 4, 2000.3215332031, 1554.8223876953, 33.912216186523 )
createHorseShoePickup ( 5, 2075.2622070313, 1924.1694335938, 14.359411239624 )
createHorseShoePickup ( 6, 2578.7932128906, 2382.4528808594, 17.985275268555 )
createHorseShoePickup ( 7, 2783.2744140625, 2457.1979980469, 21.6484375 )
createHorseShoePickup ( 8, 2632.6811523438, 2832.3659667969, 127.578125 )
createHorseShoePickup ( 9, 1489.0382080078, 2773.8471679688, 10.8203125 )
createHorseShoePickup ( 10, 1043.8140869141, 1012.9277954102, 55.3046875 )
createHorseShoePickup ( 11, 1240.2058105469, 1085.7120361328, 24.71875 )
createHorseShoePickup ( 12, 1544.7298583984, 676.22003173828, 11.328125 )
createHorseShoePickup ( 13, 491.3512878418, 810.69909667969, -0.4527587890625 )
createHorseShoePickup ( 14, 303.47723388672, 2612.3898925781, 17.667230606079 )
createHorseShoePickup ( 15, 2093.7292480469, 1553.267578125, 26.642505645752 )
createHorseShoePickup ( 16, 2096.3259277344, 1283.9541015625, 10.8203125 )
createHorseShoePickup ( 17, 2006.2679443359, 1230.5826416016, 23.110418319702 )
createHorseShoePickup ( 18, 2014.4575195313, 1081.0484619141, 15.155453681946 )
createHorseShoePickup ( 19, 1908.8985595703, 1513.3790283203, 7.203125 )
createHorseShoePickup ( 20, 2826.9313964844, 1644.4379882813, 10.8203125 )
createHorseShoePickup ( 21, 2573.2646484375, 1561.8363037109, 16.530117034912 )
createHorseShoePickup ( 22, 2636.2094726563, 2333.603515625, 30.927211761475 )
createHorseShoePickup ( 23, 1819.6361083984, 2475.3669433594, 7.4945707321167 )
createHorseShoePickup ( 24, 937.86309814453, 1733.2662353516, 8.8515625 )
createHorseShoePickup ( 25, 1319.2528076172, 1253.5339355469, 14.385739326477 )]]