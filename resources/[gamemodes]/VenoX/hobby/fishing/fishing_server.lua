createBlip ( -1353.8792724609, 2057.6037597656, 52.042182922363, 9, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
fishSellPickup = createPickup ( -1575.5504150391, 1277.0458984375, 6.8284401893616, 3, 1239, 50 )

function fishSellPickup_hit ( player )

	infobox ( player, "Hier kannst du\ndeine Fische mit\n/sellfish [1-3] ver-\nkaufen!", 5000, 200, 200, 0 )
end
addEventHandler ( "onPickupHit", fishSellPickup, fishSellPickup_hit )

fishNames = {
 [1]="Schildkroete",
 [2]="Stiefel",
 [3]="Lachs",
 [4]="Forelle",
 [5]="Schnapper",
 [6]="Hai",
 [7]="Geldbeutel",
 [8]="Barsch",
 [9]="Schwertfisch",
 [10]="Rochen",
 [11]="Aal",
 [12]="Thunfisch"
}

fishWeights = {
 ["min"]={
  [1]=700,
  [2]=1000,
  [3]=500,
  [4]=500,
  [5]=300,
  [6]=11000,
  [7]=10,
  [8]=200,
  [9]=3000,
  [10]=400,
  [11]=750,
  [12]=9500
 },
 ["max"]={
  [1]=150000,
  [2]=1000,
  [3]=5000,
  [4]=5000,
  [5]=4500,
  [6]=300000,
  [7]=1000,
  [8]=1500,
  [9]=75000,
  [10]=5000,
  [11]=3500,
  [12]=50000
 }
}

fishPrices = {
 [1]=2,
 [2]=35,
 [3]=4,
 [4]=6,
 [5]=5,
 [6]=4,
 [7]=1000,
 [8]=20,
 [9]=7,
 [10]=20,
 [11]=10,
 [12]=7
}

setWaveHeight ( 0 )

function setFishingValues ( player )

	local string = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=?", "fishing", "inventar", "UID", playerUID[getPlayerName(player)] ), -1 )[1]["fishing"]
	
	local pole = tonumber ( gettok ( string, 1, string.byte ( '|' ) ) )
	local hooks = tonumber ( gettok ( string, 2, string.byte ( '|' ) ) )
	local worms = tonumber ( gettok ( string, 3, string.byte ( '|' ) ) )
	local fishA = gettok ( string, 4, string.byte ( '|' ) )
	local fishB = gettok ( string, 5, string.byte ( '|' ) )
	local fishC = gettok ( string, 6, string.byte ( '|' ) )
	
	local fishATyp = tonumber ( gettok ( fishA, 1, string.byte ( ';' ) ) )
	local fishBTyp = tonumber ( gettok ( fishB, 1, string.byte ( ';' ) ) )
	local fishCTyp = tonumber ( gettok ( fishC, 1, string.byte ( ';' ) ) )
	
	local fishAWeight = tonumber ( gettok ( fishA, 2, string.byte ( ';' ) ) )
	local fishBWeight = tonumber ( gettok ( fishB, 2, string.byte ( ';' ) ) )
	local fishCWeight = tonumber ( gettok ( fishC, 2, string.byte ( ';' ) ) )
	
	vnxSetElementData ( player, "fishingPole", ( pole == 1 ) )
	vnxSetElementData ( player, "fishingHooks", hooks )
	vnxSetElementData ( player, "fishingWorms", worms )
	
	vnxSetElementData ( player, "fishingFishATyp", fishATyp	)
	vnxSetElementData ( player, "fishingFishBTyp", fishBTyp )
	vnxSetElementData ( player, "fishingFishCTyp", fishCTyp )
	
	vnxSetElementData ( player, "fishingFishAWeight", fishAWeight )
	vnxSetElementData ( player, "fishingFishBWeight", fishBWeight )
	vnxSetElementData ( player, "fishingFishCWeight", fishCWeight )
end
function saveFishingValues ( player )

	-- Default: 0|0|0|0;0|0;0|0;0
	local pname = getPlayerName ( player )
	local string
	if vnxGetElementData ( player, "fishingPole" ) then
		string = "1|"
	else
		string = "0|"
	end
	string = string..vnxGetElementData ( player, "fishingHooks" ).."|"..vnxGetElementData ( player, "fishingWorms" ).."|"
	string = string..vnxGetElementData ( player, "fishingFishATyp" )..";"..vnxGetElementData ( player, "fishingFishAWeight" ).."|"
	string = string..vnxGetElementData ( player, "fishingFishBTyp" )..";"..vnxGetElementData ( player, "fishingFishBWeight" ).."|"
	string = string..vnxGetElementData ( player, "fishingFishCTyp" )..";"..vnxGetElementData ( player, "fishingFishCWeight" )
	
	dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "inventar", "fishing", string, "UID", playerUID[pname] )
end

function fishCought_func ()

	local player = client
	if vnxGetElementData ( player, "fishingPole" ) and vnxGetElementData ( player, "fishingHooks" ) > 0 and vnxGetElementData ( player, "fishingWorms" ) > 0 then
		if getFreeFishSlot ( player ) then
			local skill = calcFishingSkillLevel ( player )
			if math.random ( 1, math.floor ( skill ^ ( 0.5 ) * 10 ) ) >= 5 then
				increasePlayerFishingSkillLevel ( player, 1 )
				local slot = getFreeFishSlot ( player )
				
				local rnd, fishTyp
				
				local maxWeight = 6000 * skill * skill / 2
				while true do
					rnd = math.random ( 1, 12 )
					if fishWeights["min"][rnd] <= maxWeight then
						fishTyp = rnd
						if fishTyp == 7 then
							if math.random ( 1, 5 ) == 1 then
								break
							end
						else
							break
						end
					end
				end
				local weight
				if maxWeight <= fishWeights["max"][fishTyp] then
					weight = math.random ( fishWeights["min"][fishTyp], maxWeight )
					weight = math.floor ( weight ^ ( math.random ( 98, 100 ) / 100 ) )
				else
					weight = math.random ( fishWeights["min"][fishTyp], fishWeights["max"][fishTyp] )
					weight = math.floor ( weight ^ ( math.random ( 80, 100 ) / 100 ) )
				end
				if fishTyp == 7 then
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + weight )
					infobox ( player, "Du hast einen\nGeldbeutel gefangen!\nEs sind "..weight.." $ drin!", 5000, 0, 125, 0 )
				else
					vnxSetElementData ( player, "fishingFish"..slot.."Typ", fishTyp )
					vnxSetElementData ( player, "fishingFish"..slot.."Weight", weight )
					infobox ( player, "Du hast etwas\ngefangen:\n"..fishNames[fishTyp], 5000, 0, 200, 0 )
				end
			else
				infobox ( player, "Die Schnur ist\ngerissen!", 5000, 125, 0, 0 )
			end
			vnxSetElementData ( player, "fishingHooks", vnxGetElementData ( player, "fishingHooks" ) - 1 )
			vnxSetElementData ( player, "fishingWorms", vnxGetElementData ( player, "fishingWorms" ) - 1 )
		else
			infobox ( player, "Du hast keinen\nfreien Fischslot\nmehr!", 5000, 125, 0, 0 )
		end
	end
end
addEvent ( "fishCought", true )
addEventHandler ( "fishCought", getRootElement(), fishCought_func )

function getFreeFishSlot ( player )

	if vnxGetElementData ( player, "fishingFishATyp" ) == 0 then
		return "A"
	elseif vnxGetElementData ( player, "fishingFishBTyp" ) == 0 then
		return "B"
	elseif vnxGetElementData ( player, "fishingFishCTyp" ) == 0 then
		return "C"
	end
	return false
end

function fishShopBuy_func ( item, amount )

	amount = math.floor ( math.abs ( tonumber ( amount ) ) )
	local player = client
	local money = vnxGetElementData ( player, "money" )
	if item == "pole" then
		if money >= fishingPolePrice then
			if not vnxGetElementData ( player, "fishingPole" ) then
				vnxSetElementData ( player, "money", money - fishingPolePrice )
				infobox ( player, "Du hast eine\nAngel gekauft!\nDie Angel ist\njetzt in deinem\nInventar.", 5000, 0, 125, 0 )
				vnxSetElementData ( player, "fishingPole", true )
			else
				infobox ( player, "Du hast bereits\neine Angel!", 5000, 125, 0, 0 )
			end
		else
			infobox ( player, "Du hast nicht\ngenug Geld fuer\neine Angel!", 5000, 125, 0, 0 )
		end
	else
		if vnxGetElementData ( player, "fishingPole" ) then
			local max = 5 + math.floor ( calcFishingSkillLevel ( player ) ^ ( 1.1 ) * 5 )
			if item == "hooks" then
				local cur = vnxGetElementData ( player, "fishingHooks" )
				if money >= fishingHookPrice * amount then
					if cur + amount <= max then
						vnxSetElementData ( player, "money", money - fishingHookPrice * amount )
						infobox ( player, "Du hast "..amount.."\nAngelhaken gekauft!", 5000, 0, 125, 0 )
						vnxSetElementData ( player, "fishingHooks", amount + cur )
					else
						infobox ( player, "Du kannst maximal\n"..max.." Haken mitnehmen!", 5000, 125, 0, 0 )
					end
				else
					infobox ( player, "Du hast nicht\ngenug Geld fuer\n"..amount.." Haken!", 5000, 125, 0, 0 )
				end
			else
				local cur = vnxGetElementData ( player, "fishingWorms" )
				if money >= fishingWormPrice * amount then
					if cur + amount <= max then
						vnxSetElementData ( player, "money", money - fishingWormPrice * amount )
						infobox ( player, "Du hast "..amount.."\nWuermer gekauft!", 5000, 0, 125, 0 )
						vnxSetElementData ( player, "fishingWorms", amount + cur )
					else
						infobox ( player, "Du kannst maximal\n"..max.." Wuermer mitnehmen!", 5000, 125, 0, 0 )
					end
				else
					infobox ( player, "Du hast nicht\ngenug Geld fuer\n"..amount.." Haken!", 5000, 125, 0, 0 )
				end
			end
		else
			infobox ( player, "Du musst dir\nzuerst eine Angel\nkaufen!", 5000, 125, 0, 0 )
		end
	end
	triggerClientEvent ( player, "reOpenFishingShopGUI", player )
end
addEvent ( "fishShopBuy", true )
addEventHandler ( "fishShopBuy", getRootElement(), fishShopBuy_func )

function sellfish_func ( player, cmd, slot )

	local x, y, z = getElementPosition ( fishSellPickup )
	if getDistanceBetweenPoints3D ( x, y, z, getElementPosition ( player ) ) <= 7.5 then
		if tonumber ( slot ) then
			slot = tonumber ( slot )
			if slot == 1 or slot == 2 or slot == 3 then
				slot = string.char ( 64 + slot )
				local fish = vnxGetElementData ( player, "fishingFish"..slot.."Typ" )
				if fish then
					local weight = vnxGetElementData ( player, "fishingFish"..slot.."Weight" )
					local money = math.floor ( fishPrices[fish] * weight / 1000 )
					
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + money )
					vnxSetElementData ( player, "fishingFish"..slot.."Typ", 0 )
					vnxSetElementData ( player, "fishingFish"..slot.."Weight", 0 )
					
					infobox ( player, "Du hast "..money.." $\nbekommen!", 5000, 200, 200, 0 )
				else
					infobox ( player, "In dem Slot\nhast du keinen\nFisch!", 5000, 125, 0, 0 )
				end
			else
				infobox ( player, "Bitte gib einen\nSlot an!", 5000, 125, 0, 0 )
			end
		else
			infobox ( player, "Bitte gib einen\nSlot an!", 5000, 125, 0, 0 )
		end
	else
		infobox ( player, "Du musst bei der\nLagerhalle sein!\nSie wird dir nun\nangezeigt!", 5000, 125, 0, 0 )
		local blip = createBlip ( x, y, z, 0, 2, 255, 0, 0, 255, 0, 99999, player )
		setTimer ( destroyElement, 10000, 1, blip )
	end
end
addCommandHandler ( "sellfish", sellfish_func )