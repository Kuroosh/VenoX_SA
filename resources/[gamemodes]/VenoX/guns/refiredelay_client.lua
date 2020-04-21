local delayTimer
weaponFireDelayEnabled = false

refireDelayWeapons = {}
	refireDelayWeapons[33] = true	-- Rifle
	refireDelayWeapons[34] = true	-- Sniper
	refireDelayWeapons[35] = true	-- RPG
	refireDelayWeapons[36] = true	-- Jevelin

refireDelays = {}
	refireDelays[33] = 1000
	refireDelays[34] = 1000
	refireDelays[35] = 3000
	refireDelays[36] = 4000

function rocketLauncherRefireDelay ( weapon, ammo )

	if refireDelayWeapons[weapon] then
		local delay = refireDelays[weapon]
		toggleControl ( "fire", false )
		toggleControl ( "action", false )
		setPedControlState ( "fire", false )
		setPedControlState ( "action", false )
		weaponFireDelayEnabled = true
		setTimer (
			function ()
				toggleControl ( "fire", true )
				toggleControl ( "action", true )
				weaponFireDelayEnabled = false
			end,
		delay, 1 )
	end
end
addEventHandler ( "onClientPlayerWeaponFire", lp, rocketLauncherRefireDelay )