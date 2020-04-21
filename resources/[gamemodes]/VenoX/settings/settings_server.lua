testmode = false
winterzeit = 0
maxplayers = 100
wctime = 20
speznr = { [110]=true, [112]=true, [300]=true, [400]=true }
tramSpeed = 0.35
aktionpuffer = 3*60*1000
healafterdmgtime = 1*60*1000




-- Cars
destcardim = 1
noobbikerespawn = 5
FCarIdleRespawn = 10
FCarDestroyRespawn = 0.1
noobrollerrespawntime = 5
noobrolleridlerespawntime = 600

-- Preise
nitroprice = 5000
tuningpartprice = 2000

paynsprayprice = 250
wantedprice = 400
wantedkillmoney = 200
wantedarrestmoney = 600
jailtimeperwanted = 2
hospitalcosts = 150
autosteuerprice = 75
autosteuererh = 1.5
drugprice = 30
smsprice = 1
callprice = 2
adcosts = 10
adbasiscosts = 10
pm_price = 250
waffenscheinprice = 10000
weaponsTruckCost = 5000


zinssatz = 0.15

-- Essen
salatprice = 150
smallpizzaprice = 150
normalpizzaprice = 400
bigpizzaprice = 500
salatheal = 250
smallpizzaheal = 150
normalpizzaheal = 350
bigpizzaheal = 500

-- SFPD

copcars = { [598]=true, [596]=true, [597]=true }
copbikes = { [523]=true }
copjeeps = { [599]=true }
cophelis = { [497]=true }
copvehs = { [598]=true, [596]=true, [597]=true, [523]=true, [599]=true, [497]=true }

validResources = { ["realdriveby"]=true, ["parachute"]=true, ["vio"]=true }
stopBadScripts = false

timeTillWeaponTruckDisappears = 20 * 60 * 1000
timeTillDrogentruckDisappears = 20 * 60 * 1000

--[[function resourceStart ( resource )

	if not validResources [ getResourceName ( resource ) ] then
		if stopBadScripts then
			cancelEvent()
		end
	end
end
addEventHandler ( "onResourcePreStart", getRootElement(), resourceStart )]]