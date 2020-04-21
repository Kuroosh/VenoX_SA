gunBoxDown1 = createObject ( 2977, -2633.6958007813, 211.23025512695, 3.4143309593201, 0, 0, 318.31506347656 )
gunBoxUp1 = createObject ( 2359, -2633.736328125, 211.24984741211, 4.7879390716553, 0, 0, 180 )

gunBoxDown2 = createObject ( 2977, -2172.8569335938, 710.32220458984, 52.890625, 0, 0, 318.31237792969 )
gunBoxUp2 = createObject ( 2359, -2172.8715820313, 710.27856445313, 54.293071746826, 0, 0, 293.85443115234 )

gunBoxDown3 = createObject ( 2977, -700.05700683594, 943.8525390625, 11.336810112, 0, 0, 318.31237792969 )
gunBoxUp3 = createObject ( 2359, -700.06158447266, 943.89526367188, 12.710417747498, 0, 0, 192.2099609375 )

gunBoxDown4 = createObject ( 2977, -1970.5015869141, -1585.2413330078, 86.798141479492, 0, 0, 0 )
gunBoxUp4 = createObject ( 2359, -1970.4888916016, -1585.2490234375, 88.171752929688, 0, 0, 33.75 )

gunBoxDown5 = createObject ( 2977, -794.83, 2438.55, 156.08, 0, 0, 0 )
gunBoxUp5 = createObject ( 2359, -794.78, 2438.62, 157.37, 0, 0, 0 )

gunBoxDown6 = createObject ( 2977, 2156.49609375, 940.0576171875, 9.8203125, 0, 0, 20 )
gunBoxUp6 = createObject ( 2359, 2156.4306640625, 940.05462646484, 11.109935760498, 0, 0, 0 )

gunBoxDown7 = createObject ( 2977, -314.72009277344, 826.48211669922, 13.2421875, 0, 0, 20 )
gunBoxUp7 = createObject ( 2359, -314.68603515625, 826.47521972656, 14.5318, 0, 0, 0 )

gunBoxDown8 = createObject ( 2977, 2177.5671386719, 1626.9636230469, 998.96862792969, 0, 0, 30 )
gunBoxUp8 = createObject ( 2359, 2177.5415039063, 1626.8814697266, 1000.2484741211, 0, 0, 0 )
setElementInterior ( gunBoxDown8, 1 )
setElementInterior ( gunBoxUp8, 1 )

gunBoxDown9 = createObject ( 2977, 1895.8278808594, 969.35815429688, 9.8126964569092, 0, 0, 20 )
gunBoxUp9 = createObject ( 2359, 1895.9353027344, 969.41552734375, 11.092554092407, 0, 0, 0 )

gunBoxDown10 = createObject ( 2977, -2203.4372558594, -2336.9741210938, 29.625, 0, 0, 0 )
gunBoxUp10 = createObject ( 2359, -2203.4360351563, -2337.0090332031, 30.929857254028, 0, 0, 315 )

gunBoxDown11 = createObject ( 2977, 2470.8642578125, 1541.1700439453, 9.6921529769897, 0, 0, 0 )
gunBoxUp11 = createObject ( 2359, 2470.9409179688, 1541.2729492188, 11.091815948486, 0, 0, 60 )

gunBoxes = {
[gunBoxDown1]=true, [gunBoxDown2]=true, [gunBoxDown3]=true, [gunBoxDown4]=true, [gunBoxDown5]=true,
[gunBoxUp1]=true, [gunBoxUp2]=true, [gunBoxUp3]=true, [gunBoxUp4]=true, [gunBoxUp5]=true,
[gunBoxUp6]=true, [gunBoxUp7]=true, [gunBoxDown6]=true, [gunBoxDown7]=true,
[gunBoxDown8]=true, [gunBoxUp8]=true, [gunBoxDown9]=true, [gunBoxUp9]=true, 
[gunBoxDown10]=true, [gunBoxUp11]=true
 }

function exchangeWeaponsWithBox_func ( player, slot, action )
	
	player = client
	slot = tonumber ( slot )
	
	local curgun = getPedWeapon ( player )
	local curammo = getPedTotalAmmo ( player )
	
	if player == client then
		local curskin = getElementModel ( player )
		if isOnDuty(player) then
			outputChatBox ( "Du bist noch im Dienst!", player, 125, 0, 0 )
		else
			if action == "ex" then
				local slot1 = vnxGetElementData ( player, "gunboxa" )
				local slot2 = vnxGetElementData ( player, "gunboxb" )
				local slot3 = vnxGetElementData ( player, "gunboxc" )
				local gun1, ammo1 = gettok ( slot1, 1, string.byte('|') ), gettok ( slot1, 2, string.byte('|') )
				local gun2, ammo2 = gettok ( slot2, 1, string.byte('|') ), gettok ( slot2, 2, string.byte('|') )
				local gun3, ammo3 = gettok ( slot3, 1, string.byte('|') ), gettok ( slot3, 2, string.byte('|') )
				if slot == 1 then
					vnxSetElementData ( player, "gunboxa", "0|0" )
					giveWeapon ( player, gun1, ammo1, true )
				elseif slot == 2 then
					vnxSetElementData ( player, "gunboxb", "0|0" )
					giveWeapon ( player, gun2, ammo2, true )
				else
					vnxSetElementData ( player, "gunboxc", "0|0" )
					giveWeapon ( player, gun3, ammo3, true )
				end
			elseif action == "in" then
				if slot == 1 then
					vnxSetElementData ( player, "gunboxa", curgun.."|"..curammo )
				elseif slot == 2 then
					vnxSetElementData ( player, "gunboxb", curgun.."|"..curammo )
				else
					vnxSetElementData ( player, "gunboxc", curgun.."|"..curammo )
				end
				takeWeapon ( player, curgun )
			end
			triggerClientEvent ( player, "refreshGunCrateBox", getRootElement() )
		end
	end
end
addEvent ( "exchangeWeaponsWithBox", true )
addEventHandler ( "exchangeWeaponsWithBox", getRootElement(), exchangeWeaponsWithBox_func )

function crateUnfreezePed ( player )

	if client == player then

		setElementFrozen ( player, false )
	
	end
	
end

addEvent( "crateUnfreezePed", true )
addEventHandler( "crateUnfreezePed", getRootElement(), crateUnfreezePed )