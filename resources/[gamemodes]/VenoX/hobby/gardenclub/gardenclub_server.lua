debug.sethook()

firstgrow = 600
firstchange = 3600
secondchange = 7200
thirdchange = 3600
playerToGroundLevel = 4.3829 - 3.0744

weedPlants =  {}



local time = getMinTime () - 60 * 24 * 4
dbExec ( handler, "DELETE FROM ?? WHERE ?? <= ?", "weed", "time", time )

createBlip ( -2579.8989257813, 310.11599731445, 4.87415599823, 62, 2, 255, 0, 0, 255, 0, 200, getRootElement() )

function drugsSellHobby_func ( amount )

	player = client
	
	if vnxGetElementData ( player, "club" ) == "gartenverein" then
		local amount = math.abs ( math.floor ( tonumber ( amount ) ) )
		local drugs = vnxGetElementData ( player, "drugs" )
		if drugs >= amount then
			vnxSetElementData ( player, "drugs", drugs - amount )
			vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + amount * 12 )
			outputChatBox ( "Du hast für "..amount.." Gramm Drogen "..(amount*12).." bekommen!", player, 0, 125, 0 )
		else
			outputChatBox ( "Du hast nicht soviele Drogen!", player, 125, 0, 0 )
		end
	else
		infobox ( player, "Du bist kein\nMitglied des Garten-\nclubs!", 5000, 125, 0, 0 )
	end
end
addEvent ( "drugsSellHobby", true )
addEventHandler ( "drugsSellHobby", getRootElement(), drugsSellHobby_func )


function addWeed ( id, x, y, z, time, name )

	weedPlants[id] = createObject ( 3409, x, y, z )
	
	local boxA = createObject ( 2991, -2589.3125, 330.35571289063, 4.1824889183044, 0, 0, 270 )
	local boxB = createObject ( 2991, -2587.8278808594, 330.31005859375, 4.1824889183044, 0, 0, 270 )
	
	vnxSetElementData ( weedPlants[id], "id", id )
	vnxSetElementData ( boxA, "id", id )
	vnxSetElementData ( boxB, "id", id )
	
	vnxSetElementData ( weedPlants[id], "time", time )
	vnxSetElementData ( boxA, "time", time )
	vnxSetElementData ( boxB, "time", time )
	
	vnxSetElementData ( weedPlants[id], "weed", true )
	vnxSetElementData ( boxA, "weed", true )
	vnxSetElementData ( boxB, "weed", true )
	
	local ox1, oy1, oz1 = -2588.5119628906-(-2589.3125), 330.2961730957-(330.35571289063), -3.1796875+(4.1824889183044)
	local ox2, oy2, oz2 = -2588.5119628906-(-2587.8278808594), 330.2961730957-(330.31005859375), -3.1796875+(4.1824889183044)
	
	attachElements ( boxA, weedPlants[id], ox1, oy1, oz1, 0, 0, 270 )
	attachElements ( boxB, weedPlants[id], ox2, oy2, oz2, 0, 0, 270 )
	
	setElementParent ( boxA, weedPlants[id] )
	setElementParent ( boxB, weedPlants[id] )
	
	setElementAlpha ( boxA, 0 )
	setElementAlpha ( boxB, 0 )
	
	if not serverRestartedAMinuteAgo then
		setElementPosition ( weedPlants[id], x, y, z )
		moveObject ( weedPlants[id], 30000, x, y, z + playerToGroundLevel )
	end
end
createWeedPlants ()

function grow_func ( player, cmd, planttype )

	if planttype == "weed" then
		if isPedOnGround ( player ) and not getPedOccupiedVehicle ( player ) and getElementInterior ( player ) == 0 and getElementDimension ( player ) == 0 then
			if not vnxGetElementData ( player, "growing" ) then
				if vnxGetElementData ( player, "flowerseeds" ) >= 1 then
					local x, y, z = getElementPosition ( player )
					if z > -5 then
						vnxSetElementData ( player, "growing", true )
						
						setTimer ( growFinished, 28500, 1, player )
						toggleAllControls ( player, false, true, true )
						
						setPedAnimation ( player, "BOMBER", "BOM_Plant_Crouch_In", 1500, false, false, false, true )
						setTimer ( setPedAnimation, 1500, 1, player, "BOMBER", "BOM_Plant_Loop", -1, true, false, false, true )
						
						vnxSetElementData ( player, "flowerseeds", vnxGetElementData ( player, "flowerseeds" ) - 1 )
						
						local time = getMinTime ()
						local name = getPlayerName ( player )
						
						local z = z - playerToGroundLevel * 2
						
						x = math.floor ( x * 10000 ) / 10000
						y = math.floor ( y * 10000 ) / 10000
						z = math.floor ( z * 10000 ) / 10000
						
						dbExec ( handler, "INSERT INTO ?? ( ??, ??, ??, ??, ?? ) VALUES (?,?,?,?,?)", "weed", "x", "y", "z", "time", "UID", x, y, ( z + playerToGroundLevel - 0.5 ), time, playerUID[name] )
						
						local id = dbPoll ( dbQuery ( handler, "SELECT ?? FROM ?? WHERE ??=? AND ??=?", "id", "weed", "UID", playerUID[name], "time", time ), -1 )[1]["id"]
						
						addWeed ( id, x, y, z, time, name )
						
						outputLog ( getPlayerName ( player ).." hat an "..x.."|"..y.."|"..z.." Drogen angebaut.", "weed" )
						outputChatBox ( "Hanf wird angepflanzt! Du kannst es per Klick ernten, wann du willst, jedoch steigt der Ertrag auf max. 50 Gramm in 16.6h!", player, 0, 150, 0 )
					else
						infobox ( player, "Hier kannst du nicht\nanbauen!", 5000, 125, 0, 0 )
					end
				else
					outputChatBox ( "Du hast keine Hanfsamen dabei!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Bitte pflanze erst zuende an!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du bist an keiner gueltigen Stelle!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Bitte /grow [weed] verwenden!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "grow", grow_func )

function growFinished ( player )

	setPedAnimation ( player, "BOMBER", "BOM_Plant_Crouch_Out", 1500, false, false, false, true )
	setTimer ( defreezeAfterWeedPlant, 1500, 1, player )
end

function defreezeAfterWeedPlant ( player )

	toggleAllControls ( player, true, true, true )
	setPedAnimation ( player )
	vnxSetElementData ( player, "growing", false )
end

function joinGartenverein_func ()

	player = client
	local money = tonumber ( vnxGetElementData ( player, "money" ) )
	if money >= 200 then
		vnxSetElementData ( player, "money", money - 200 )
		vnxSetElementData ( player, "club", "gartenverein" )
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nun\nMitglied des Garten-\nClubs und kannst\nGartenartikel erwerben!", 7500, 0, 200, 0 )
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld - Dem\nGartenverein beizutreten\nkostetn 200 $!", 7500, 125, 0, 0 )
	end
end
addEvent ( "joinGartenverein", true )
addEventHandler ( "joinGartenverein", getRootElement(), joinGartenverein_func )

function BuyMowerServer_func ()

	local player = client
	if vnxGetElementData ( player, "club" ) == "gartenverein" then
		local money = tonumber ( vnxGetElementData ( player, "money" ) )
		if money >= 600 then
			carbuy ( player, 600, 572, -2593.993, 334.072, 4.148, 0, 0, 0 )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld - Ein\nRasenmaeher\nkostetn 200 $!", 7500, 125, 0, 0 )
		end
	else
		infobox ( player, "Du bist kein\nMitglied des Garten-\nclubs!", 5000, 125, 0, 0 )
	end
end
addEvent ( "BuyMowerServer", true )
addEventHandler ( "BuyMowerServer", getRootElement(), BuyMowerServer_func )

function BuyShovelServer_func ()

	local player = client
	if vnxGetElementData ( player, "club" ) == "gartenverein" then
		local money = tonumber ( vnxGetElementData ( player, "money" ) )
		if money >= 15 then
			vnxSetElementData ( player, "money", money - 15 )
			local weapon = 6
			local ammo = 1
			giveWeapon ( player, weapon, ammo, true )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld - eine\nSchaufel kostet 15 $!", 7500, 125, 0, 0 )
		end
	else
		infobox ( player, "Du bist kein\nMitglied des Garten-\nclubs!", 5000, 125, 0, 0 )
	end
end
addEvent ( "BuyShovelServer", true )
addEventHandler ( "BuyShovelServer", getRootElement(), BuyShovelServer_func )

function BuyFlowersServer_func ()

	local player = client
	if vnxGetElementData ( player, "club" ) == "gartenverein" then
		local money = tonumber ( vnxGetElementData ( player, "money" ) )
		local seeds = tonumber ( vnxGetElementData ( player, "flowerseeds" ) )
		if money >= 500 then
			vnxSetElementData ( player, "money", money - 500 )
			
			vnxSetElementData ( player, "flowerseeds", seeds + 10 )
			
			triggerClientEvent ( player, "infobox_start", getRootElement(), "10 Samen gekauft-\nTippe /grow weed,\num sie einzu-\npflanzen!", 7500, 0, 200, 0 )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld - Weed-\nsamen kosten 500$!", 7500, 125, 0, 0 )
		end
	else
		infobox ( player, "Du bist kein\nMitglied des Garten-\nclubs!", 5000, 125, 0, 0 )
	end
end
addEvent ( "BuyFlowersServer", true )
addEventHandler ( "BuyFlowersServer", getRootElement(), BuyFlowersServer_func )

function quitclub_func ( player )

	vnxSetElementData ( player, "club", "none" )
	triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast deinen\nClub verlassen!", 7500, 125, 0, 0 )
end
addCommandHandler ( "quitclub", quitclub_func )

addEvent ( "leaveGardenclub", true )
addEventHandler ( "leaveGardenclub", getRootElement(),
	function ()
		vnxSetElementData ( client, "club", "none" )
		infobox ( client, "\nDu hast deinen\nClub verlassen!", 5000, 125, 0, 0 )
	end
)

function buyGardenClubObject ( id )

	local player = client
	if vnxGetElementData ( player, "club" ) == "gartenverein" then
		id = math.floor ( math.abs ( tonumber ( id ) ) )
		
		if placeAblesToBeSaved[id] then
			local price = placeAblesPrices[id]
			if price <= vnxGetElementData ( player, "money" ) then
				if vnxGetElementData ( player, "object" ) == 0 then
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - price )
					vnxSetElementData ( player, "object", id )
					infobox ( player, "Du hast das Objekt\nerworben - es ist\nnun in deinem\nInventar.", 5000, 0, 200, 0 )
				else
					infobox ( player, "Du hast bereits\nein Objekt -\nbenutze zuerst dein\naltes oder wirf es\nweg!!", 5000, 125, 0, 0 )
				end
			else
				infobox ( player, "Du hast nicht\ngenug Geld!", 5000, 125, 0, 0 )
			end
		end
	else
		infobox ( player, "Du bist kein\nMitglied des Garten-\nclubs!", 5000, 125, 0, 0 )
	end
end
addEvent ( "buyGardenClubObject", true )
addEventHandler ( "buyGardenClubObject", getRootElement(), buyGardenClubObject )

