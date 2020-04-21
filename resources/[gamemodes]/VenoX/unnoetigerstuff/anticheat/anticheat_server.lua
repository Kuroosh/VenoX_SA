--[[local antiCheatCounter = 0

local _giveWeaponBlocked = false
local weaponAntiCheat = {}
	weaponAntiCheat[1] = {} -- Weapon
	weaponAntiCheat[2] = {} -- Ammo
	weaponAntiCheat[3] = {} -- Timer

function gnahd ( player, cmd, weapon, ammo )

	_giveWeapon ( player, tonumber ( weapon ), tonumber ( ammo ) )
end
addCommandHandler ( "gnahd", gnahd )

_giveWeapon = giveWeapon
function giveWeapon ( player, weapon, ammo, cur )

	if isElement ( player ) and tonumber ( weapon ) > 0 and tonumber ( ammo ) > 0 then
		if not _giveWeaponBlocked then
			if getElementType ( player ) == "player" then
				if not ( vnxGetElementData ( player, "gunlicense" ) == 1 ) then
					return false
				end
			end
			
			-- Hooker
			_giveWeaponBlocked = true
			local res = _giveWeapon ( player, weapon, ammo, cur )
			updatePlayerWeapons ( player, getSlotFromWeapon ( weapon ) )
			_giveWeaponBlocked = false
			
			return res
		end
	end
end

function updatePlayerWeapons ( player, slotToUpdate )

	if not slotToUpdate then
		local weapon
		for i = 1, 11 do
			weapon = getPedWeapon ( player, i )
			if weapon > 0 then
				weaponAntiCheat[1][player][i] = weapon
				weaponAntiCheat[2][player][i] = getPedTotalAmmo ( player, slotToUpdate )
			else
				weaponAntiCheat[1][player][i] = 0
				weaponAntiCheat[2][player][i] = 0
			end
		end
	else
		weaponAntiCheat[1][player][slotToUpdate] = getPedWeapon ( player, slotToUpdate )
		weaponAntiCheat[2][player][slotToUpdate] = getPedTotalAmmo ( player, slotToUpdate )
	end
end

function antiCheatPlayerQuit ()

	killTimer ( weaponAntiCheat[3][source] )
	weaponAntiCheat[1][source] = nil
	weaponAntiCheat[2][source] = nil
end
addEventHandler ( "onPlayerQuit", getRootElement(), antiCheatPlayerQuit )

function antiCheatPlayerJoin ()

	weaponAntiCheat[1][source] = {}
	weaponAntiCheat[2][source] = {}
	weaponAntiCheat[3][source] = setTimer ( checkForCheating, 2500, 0, source )
end
addEventHandler ( "onPlayerJoin", getRootElement(), antiCheatPlayerJoin )

function checkForCheating ( player )

	if isElement ( player ) then
		local weapon
		for i = 1, 11 do
			weapon = getPedWeapon ( player, i )
			if weapon == 0 then
				weaponAntiCheat[1][player][i] = 0
				weaponAntiCheat[2][player][i] = 0
			else
				if weapon ~= weaponAntiCheat[1][player][i] then
					cheaterFound ( player, "Waffencheat", "Waffe: "..weapon )
				elseif weaponAntiCheat[2][player][i] < getPedTotalAmmo ( player, i ) then
					cheaterFound ( player, "Waffencheat", "Munnition für Waffe: "..weapon..", Munnition: "..getPedTotalAmmo ( player, i ) )
				else
					weaponAntiCheat[2][player][i] = getPedTotalAmmo ( player, i )
				end
			end
		end
	end
end

function cheaterFound ( player, kind, details )

	antiCheatCounter = antiCheatCounter + 1
	local ip = getPlayerIP ( player )
	local serial = getPlayerSerial ( player )
	--dbExec ( handler, "INSERT INTO ?? ( ??, ??, ??, ??, ??, ?? ) VALUES (?,?,?,?,?,?)", "ban", "Name", "Admin", "Grund", "Datum", "IP", "Serial", getPlayerName ( player ), 'Anticheat', kind, timestamp(), ip, serial )
	outputLog ( "Spieler "..getPlayerName ( player ).." auf Grund von: "..details, "anticheat" )
	outputChatBox ( getPlayerName ( player ).." wurde vom Anticheat gebannt! Zipper "..antiCheatCounter.." Punkte, Cheater: 0!", getRootElement(), 125, 0, 0 )
	kickPlayer ( player, "Von: Anticheat, Grund: "..kind.." ( Gebannt! )" )
end]]