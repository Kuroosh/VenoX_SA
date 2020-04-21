local timers = {} -- timers for existing pickups

local weaponSlots = {1,2,3,4,5,7,8,9,10,11,12,13}

local function onDeathPickupHit ( player, matchingDimension )
	if matchingDimension then
		killTimer ( timers[source] )
		timers[source] = nil
		removeEventHandler ( "onPickupHit", source, onDeathPickupHit )
		local weapid = getPickupWeapon ( source )
		local weapammo = getPickupAmmo ( source )
		destroyElement ( source )
		giveWeapon ( player, weapid, weapammo, false )
	end
end

local function destroyDeathPickup ( pickup )
	timers[pickup] = nil
	removeEventHandler ( "onPickupHit", pickup, onDeathPickupHit )
	destroyElement ( pickup )
end

addEventHandler ( "onPlayerWasted", getRootElement (),
	function ( source_ammo, killer, killer_weapon, bodypart )
		local pX, pY, pZ = getElementPosition ( source )
		local timeout = get("timeout")
		
		if get("only_current") then
			local source_weapon = getPedWeapon ( source )
			if ( source_weapon and source_weapon ~= 0 and source_ammo ) then
				local pickup = createPickup ( pX, pY, pZ, 2, source_weapon, timeout, source_ammo )
				addEventHandler ( "onPickupHit", pickup, onDeathPickupHit )
				timers[pickup] = setTimer ( destroyDeathPickup, timeout, 1, pickup )
			end
		else
			local radius = get("radius")
			local droppedWeapons = {}
			for i, slot in ipairs(weaponSlots) do
				local ammo = getPedTotalAmmo ( source, slot )
				if ammo <= 0 then
					break
				end
				
				local weapon = getPedWeapon ( source, slot )
				table.insert(droppedWeapons, {weapon, ammo})
			end
			
			local numberDropped = #droppedWeapons
			for i, t in ipairs(droppedWeapons) do
				local x = pX + radius * math.cos((i-1) * 2 * math.pi / numberDropped)
				local y = pY + radius * math.sin((i-1) * 2 * math.pi / numberDropped)
				local pickup = createPickup(x, y, pZ, 2, t[1], timeout, t[2])
				addEventHandler ( "onPickupHit", pickup, onDeathPickupHit )
				timers[pickup] = setTimer ( destroyDeathPickup, timeout, 1, pickup )
			end
		end
	end
)