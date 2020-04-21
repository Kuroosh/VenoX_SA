local maxnail = 2
local nailavai = false
local nail_cars = {}

for i = 1, 700 do
	nail_cars[i] = false
end

nail_cars[433] = true
nail_cars[427] = true 
nail_cars[490] = true 
nail_cars[528] = true 
nail_cars[523] = true 
nail_cars[470] = true 
nail_cars[598] = true 
nail_cars[597] = true 
nail_cars[596] = true 
nail_cars[599] = true 
nail_cars[601] = true 

local nail_factions = {}

for i = 1, 10, 1 do

	nail_factions[i] = false

end

nail_factions[1] = true
nail_factions[6] = true
nail_factions[8] = true

local nail_tut = {}
local nailArray = {}
local nailNumber = {}
local nailName = {}

local nail_pickups = {} -- Aufladepickups
nail_pickups[1] = createPickup ( -1622.7950439453, 659.85522460938, -5.619252204895, 3, 1239, 1, 0 )
nail_pickups[2] = createPickup ( 279.11050415039, 1821.1342773438, 17.263559341431, 3, 1239, 1, 0 )
nail_pickups[3] = createPickup ( -2440.9819335938, 523.67584228516, 29.529811859131, 3, 1239, 1, 0 )
nail_pickups[4] = createPickup ( -1610.2618408203, 337.90087890625, 6.810435295105, 3, 1239, 1, 0 )

local nail_cols = {} -- Aufladecolspheres
nail_cols[1] = createColSphere ( -1622.7950439453, 659.85522460938, -5.619252204895, 3 )
nail_cols[2] = createColSphere ( 279.11050415039, 1821.1342773438, 17.263559341431, 3 )
nail_cols[3] = createColSphere ( -2440.9819335938, 523.67584228516, 29.529811859131, 3 )
nail_cols[4] = createColSphere ( -1610.2618408203, 337.90087890625, 6.810435295105, 3 )

nail_tut[nail_cols[1]] = true
nail_tut[nail_cols[2]] = true
nail_tut[nail_cols[3]] = true
nail_tut[nail_cols[4]] = true

-- kann Spieler ein Band legen?

local nail_ifBand = {}

-- Nagelbaender an sich

local n_Baender = {}
local n_ColBaender = {}

-- EventHandler

function nails_avai ()

	nailavai = true

end

function nail_resstart ( )

	setTimer ( nails_avai, 60000, 1 )
	
end

addEventHandler ( "onResourceStart", getResourceRootElement( getThisResource() ), nail_resstart )

for i, col in pairs ( nail_cols ) do

	addEventHandler ( "onColShapeHit", col,
		function ( element, dim )
			
			if dim and nail_tut[source] then
			
				if getElementType( element ) == "vehicle" then
				
					local trigger = getVehicleOccupant ( element )
							
					if ( nailavai == true ) and isElement(trigger) then outputChatBox ( "Benutze /nailload, um die Nagelbänder aufzuladen. Du musst aber in einem Polizeiwagen sitzen.", trigger, 0, 100, 0 ) end
													
				elseif getElementType( element ) == "player" and getPedOccupiedVehicleSeat( element ) ~= 0 then
				
					if nailavai == true and isElement(element) then outputChatBox ( "Benutze /nailload, um die Nagelbänder aufzuladen. Du musst aber in einem Polizeiwagen sitzen.", element, 0, 100, 0 ) end

				end
			
			end
		
		end )

end
	
-- Commands
	
addCommandHandler ( "nailload", 
	function ( player, command )
	
		local fraktion = vnxGetElementData( player, "fraktion" )
		local rang = vnxGetElementData( player, "rang" )
		local seat = getPedOccupiedVehicleSeat ( player )
		
		n_inCol = false
		
		for i, col in pairs ( nail_cols ) do
		
			if isElementWithinColShape( player, col ) then
			
				n_inCol = true
			
			end
		
		end
		
		if nail_factions[fraktion] and seat == 0 and n_inCol and rang >= 3 then
		
			local veh = getPedOccupiedVehicle ( player )
		
			if not veh then
			
				if isElement( player ) then outputChatBox ( "Du bist in keinem Fahrzeug!", player, 255, 0, 0 ) end
			
			else
			
				if nail_cars[getElementModel(veh)] or isFederalCar(veh) then
					
					nailArray[veh] = maxnail
					if isElement( player ) then outputChatBox ( "Du hast jetzt "..tostring(maxnail).." Nagelbänder im Wagen.", player, 0, 100, 0 ) end
					if isElement( player ) then outputChatBox ( "Benutze /takenail <Anzahl>, um dir Nagelbänder zu nehmen.", player, 0, 100, 0 ) end
										
				end

			end
		
		end
	
	end, false, false )
	
addCommandHandler ( "takenail", 
	function ( player, command, arg )
	
		if not arg then
		
			outputChatBox ( "Du musst eine Zahl angeben! /takenail <Anzahl>", player, 255, 0, 0 )
		
		else
	
			local fraktion = vnxGetElementData( player, "fraktion" )
			local rang = vnxGetElementData( player, "rang" )
			local seat = getPedOccupiedVehicleSeat ( player )
			
			if nail_factions[fraktion] and seat == 0 and tonumber(arg) and rang >= 3 then
			
				local veh = getPedOccupiedVehicle ( player )
			
				if not veh then
				
					if isElement( player ) then outputChatBox ( "Du bist in keinem Fahrzeug!", player, 255, 0, 0 ) end
				
				else
				
					if nail_cars[getElementModel(veh)] or isFederalCar ( veh ) then
						
						if not nailArray[veh] or nailArray[veh] == 0 then
						
							if isElement( player ) then outputChatBox ( "Dein Fahrzeug hat keine Nagelbänder!", player, 255, 0, 0 ) end
						
						else
						
							if tonumber(arg) <= tonumber(nailArray[veh]) then
							
								nailArray[veh] = tonumber(nailArray[veh])-tonumber(arg)
								nailArray[player] = tonumber(arg)
								
								if isElement( player ) then outputChatBox ( "Du hast " .. arg .. " Nagelbänder genommen!", player, 0, 100, 0 ) end
								if isElement( player ) then outputChatBox ( "Benutze /nail, um ein Nagelband zu legen!", player, 0, 100, 0 ) end
								
							else
							
								if isElement( player ) then outputChatBox ( "Dein Fahrzeug hat nicht genug Nagelbänder!", player, 255, 0, 0 ) end
							
							end
						
						end
						
					end

				end
			
			end
			
		end
	
	end, false, false )
	
function freeNailPlayer ( player )

	nail_ifBand[player] = true

end
	
function plattReifen ( hit, dim )

	if dim and getElementType(hit) == "vehicle" then

		setVehicleWheelStates ( hit, 1, 1, 1, 1 )
		
	end

end
	
addCommandHandler ( "nail", 
	function ( player, command )
	
		local veh = getPedOccupiedVehicle( player )
		local fraktion = vnxGetElementData( player, "fraktion" )
		local rang = vnxGetElementData( player, "rang" )
		local bands = nailArray[player]
		
		if ( not veh ) and nail_factions[fraktion] and ( bands ~= false ) and ( rang >= 3 ) then
		
			if nail_ifBand[player] ~= false and tonumber(bands) and tonumber(bands) >= 1 then
			
			----------------------------------------------------------
			
				nail_ifBand[player] = false
				local bands = tonumber(bands)
				local nums = #n_Baender+1
				local x, y, z = getElementPosition ( player )
				local rx, ry, rz = getElementRotation ( player )
				
				n_Baender[nums] = createObject ( 2892, x, y, z-1, rx, ry, rz+90 ) -- Model noch
				n_ColBaender[nums] = createColSphere ( x, y, z, 4 )
				
				nailArray[player] = tonumber(bands)-1 
				nailNumber[n_ColBaender[nums]] = nums
				nailName[n_ColBaender[nums]] = getPlayerName(player)
				setTimer ( freeNailPlayer, 10000, 1, player )
				
				addEventHandler ( "onColShapeHit", n_ColBaender[nums], plattReifen )
				
			----------------------------------------------------------
			
			else
			
				if isElement( player ) then outputChatBox ( "Du kannst nur alle 10 Sekunden ein Nagelband legen oder du hast keine mehr!", player, 255, 0, 0 ) end
			
			end
		
		end
	
	end, false, false )
	
addCommandHandler ( "rnails", 
	function ( player, command )
	
		local fraktion = vnxGetElementData( player, "fraktion" )
		local rang = vnxGetElementData( player, "rang" )
		local admin = vnxGetElementData( player, "adminlvl" )

		if ( nail_factions[fraktion] and ( rang >= 5 ) ) or ( admin >= 3 ) then
			
			----------------------------------------------------------
			
				for i, band in pairs ( n_Baender ) do
				
					if isElement(band) then
					
						destroyElement(band)
					
					end
				
				end
				
				for i, band in pairs ( n_ColBaender ) do
				
					if isElement(band) then
					
						destroyElement(band)
					
					end
				
				end
				

				n_Baender = {}
				n_ColBaender = {}
				
				sendMSGForFaction ( getPlayerName(player) .. " hat alle Nagelbänder entfernt.", 1, 0, 100, 0 )
				sendMSGForFaction ( getPlayerName(player) .. " hat alle Nagelbänder entfernt.", 6, 0, 100, 0 )
				sendMSGForFaction ( getPlayerName(player) .. " hat alle Nagelbänder entfernt.", 8, 0, 100, 0 )
			----------------------------------------------------------
		
		end
	
	end, false, false )
	
addCommandHandler ( "rnail", 
	function ( player, command )
	
		local fraktion = vnxGetElementData( player, "fraktion" )
		local rang = vnxGetElementData( player, "rang" )
		
		avalue = false

		if nail_factions[fraktion] and ( rang >= 3 ) then
		
			for i, col in pairs ( n_ColBaender ) do
			
				if isElement(col) then
				
					if isElementWithinColShape ( player, col ) and not avalue then
					
						avalue = true
						local pbesitzer = nailName[col]
						
						if ( rang >= 4 ) or pbesitzer == getPlayerName( player ) then
						
							local nummer = nailNumber[col]
							
							destroyElement(n_ColBaender[nummer])
							destroyElement(n_Baender[nummer])
							
							n_Baender[nummer] = 0
							n_ColBaender[nummer] = 0
						
						else
						
							if isElement( player ) then outputChatBox ( "Du hast das Nagelband nicht gelegt oder bist nicht Rang 4 oder hoeher!", player, 255, 0, 0 ) end
						
						end
					
					end
				
				end
			
			end
		
		end
	
	end, false, false )
	
addCommandHandler ( "setnailmax", 
	function ( player, command, arg )

		local admin = vnxGetElementData( player, "adminlvl" )
		
		if admin >= 3 and arg then
		
			maxnail = tonumber(arg)
			if isElement( player ) then outputChatBox ( "Du hast die maximalen Nagelbänder pro Wagen auf "..arg.." gesetzt!", player, 0, 100, 0 ) end
		
		end
	
	end, false, false )
