bizArray = {}

function setBizData ()
	pnsDohertyIcon = createPickup ( -1908.7257080078, 276.80416870117, 40.696102142334, 3, 1239, 1, 0 )
	addEventHandler ( "onPickupHit", pnsDohertyIcon, onBizPickupHit )
	pnsJuniperIcon = createPickup ( -2431.1665039063, 1028.9090576172, 50.039852142334, 3, 1239, 1, 0 )
	addEventHandler ( "onPickupHit", pnsJuniperIcon, onBizPickupHit )
	pnsLVIcon = createPickup ( 1967.053, 2166.98, 10.82, 3, 1239, 1, 0 )
	addEventHandler ( "onPickupHit", pnsLVIcon, onBizPickupHit )
	pnsLSIcon = createPickup ( 2072.669, -1834.77, 13.555, 3, 1239, 1, 0 )
	addEventHandler ( "onPickupHit", pnsLSIcon, onBizPickupHit )
	pizzaStackIcon = createPickup ( -1720.0610351563, 1356.5998535156, 6.8367257118225, 3, 1239, 1, 0 )
	addEventHandler ( "onPickupHit", pizzaStackIcon, onBizPickupHit )
	mystiesBarIcon = createPickup ( -2242.4169921875, -89.888648986816, 34.969539642334, 3, 1239, 1, 0 )
	addEventHandler ( "onPickupHit", mystiesBarIcon, onBizPickupHit )
	sprunkIcon = createPickup ( -1752.3122558594, -144.58361816406, 3.2039132118225, 3, 1239, 1, 0 )
	addEventHandler ( "onPickupHit", sprunkIcon, onBizPickupHit )
	
	visageHotelIcon = createPickup ( 2110.69, 1870.49, 10.47, 3, 1239, 1, 0 )
	addEventHandler ( "onPickupHit", visageHotelIcon, onBizPickupHit )
	vankHoffIcon = createPickup ( -2405.16, 325.73, 34.82, 3, 1239, 1, 0 )
	addEventHandler ( "onPickupHit", vankHoffIcon, onBizPickupHit )
	
	------------------------------------------------------
	
	tankstelleNordIcon = createPickup ( -2420.09765625, 969.890625, 45.296875, 3, 1239, 1, 0 )
	addEventHandler ( "onPickupHit", tankstelleNordIcon, onBizPickupHit )
	
	tankstelleSuedIcon = createPickup ( -1675.880859375, 431.7705078125, 7.1796875, 3, 1239, 1, 0 )
	addEventHandler ( "onPickupHit", tankstelleSuedIcon, onBizPickupHit )
	
	tankstellePineIcon = createPickup ( -2231.6591796875, -2558.095703125, 31.921875, 3, 1239, 1, 0 )
	addEventHandler ( "onPickupHit", tankstellePineIcon, onBizPickupHit )
	
	-- VEHICLE STORES
	OttosAutosIcon = createPickup ( -1639.7821044922, 1202.6267089844, 6.879873752594, 3, 1239, 1, 0 )
	addEventHandler ( "onPickupHit", OttosAutosIcon, onBizPickupHit )
	
	---------------------------------------------

	bizIcons = { 
		[pnsDohertyIcon]="PaynSprayWangcars", 
		[pnsJuniperIcon]="PaynSprayJuniper", 
		[pnsLVIcon]="PaynSprayLV", 
		[pnsLSIcon]="PaynSprayLS", 
		[pizzaStackIcon]="WellStackedPizza", 
		[mystiesBarIcon]="MistysBar", 
		[sprunkIcon]="Sprunk", 
		[visageHotelIcon]="Visage", 
		[vankHoffIcon]="VankHoff", 
		[tankstelleNordIcon]="TankstelleNord",
		[tankstelleSuedIcon]="TankstelleSued", 
		[tankstellePineIcon]="TankstellePine", 
		[OttosAutosIcon]="OttoscarsSF"
	}
	
	TraeumeUndHoffnungen = createPickup ( -127.10718536377, 2258.1259765625, 28.063650131226, 3, 1239, 1, 0 )
	addEventHandler ( "onPickupHit", TraeumeUndHoffnungen, onBizPickupHit )
	
	setBizDataSQL ( )
	
	bizkeys = { [1]="PaynSprayWangcars", [2]="PaynSprayJuniper", [3]="Sprunk", [4]="WellStackedPizza", [5]="MistysBar", [6]="Visage", [7]="VankHoff", [8]="TankstelleNord", [9]="TankstelleSued", [10]="TankstellePine", [11]="PaynSprayLV", [12]="PaynSprayLS", [13]="OttoscarsSF" }
end
setTimer ( setBizData, 1000, 1 )


function updateBizKasse ()
	for i=1, #bizkeys do
		if bizkeys[i] ~= "WellStackedPizza" then
			dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "biz", "Kasse", bizArray[bizkeys[i]]["kasse"], "ID", i )
		end
	end
	outputDebugString ( "Bizkassen wurden gespeichert!" )
end
setTimer ( updateBizKasse, 20*60*1000, 0 )


function onBizPickupHit ( hit )
	if source == TraeumeUndHoffnungen then
		outputChatBox ( "Es gibt wichtigeres als Geld ...", hit, 125, 125, 200 )
	elseif bizIcons[source] then
		local biz = bizIcons[source] 
		local besitzer = bizArray[biz]["inhaber"]
		if besitzer == "none" then
			besitzer = "Niemandem"
		end
		local bizname = bizArray[biz]["name"]
		local bizprice = bizArray[biz]["preis"]
		outputChatBox ( bizname..", gehört: "..besitzer.." - Preis: "..bizprice.." $ und 60 Stunden Mindestspielzeit!", hit, 125, 0, 0 )
		if besitzer == "Niemandem" then
			triggerClientEvent ( hit, "infobox_start", getRootElement(), "Tippe /buybiz\n[bar/bank], um\ndas Geschäft zu\nkaufen! Bei\nbank fallen 2 %\nmehr Kosten an!", 7500, 0, 125, 0 )
		end
	end
end


function buybiz_func ( player, cmd, typ )
	local hatgeld = false
	local cash = 0
	if typ == "bar" then
		cash = vnxGetElementData ( player, "money" )
		hatgeld = true
	elseif typ == "bank" then
		cash = vnxGetElementData ( player, "bankmoney" )		
		hatgeld = true	
		if not cash then
			hatgeld = false
		end
	end
	if hatgeld then
		local biz, bizkey = getNearestBiz ( player )
		if biz then
			local bizprice = false
			if typ == "bar" then
				bizprice = bizArray[biz]["preis"]
			else
				bizprice = bizArray[biz]["preis"] * 1.02
			end
			if not bizprice then
				return
			end
			if bizprice > cash then
				return
			end
			if bizprice <= cash then
				if bizArray[biz]["inhaber"] == "none" then
					if vnxGetElementData ( player, "playingtime" ) >= 3600 then
						if vnxGetElementData ( player, "bizkey" ) == 0 then
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\nGeschäft gekauft!\nTippe /bizhelp\nfür mehr\nInformationen!", 7500, 0, 125, 0 )
							vnxSetElementData ( player, "bizkey", bizkey )
							local pname = getPlayerName ( player )
							dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "Bizschluessel", bizkey, "UID", playerUID[pname] )
							dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "biz", "UID", playerUID[pname], "ID", bizkey )
							bizArray[biz]["inhaber"] = pname
							if typ == "bar" then
								vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - bizprice )
							else
								vnxSetElementData ( player, "bankmoney", vnxGetElementData ( player, "bankmoney" ) - bizprice )
							end
							local x, y, z = getElementPosition ( player )
							setCameraMatrix ( player, x+10, y+10, z+10, x, y, z )
							setTimer ( fixBizBuyCam, 5000, 1, player ) 
							triggerClientEvent ( player, "achievsound", getRootElement() )
						else	
							outputChatBox ( "Du hast bereits ein Geschäft - tippe zuerst /sellbiz ein, um dein altes Geschäft zu verkaufen.", player, 125, 0, 0 )
						end
					else
						outputChatBox ( "Du hast noch keine 60 Spielstunden.", player, 125, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDas Geschäft\ngehört bereits\njemandem!!", 7500, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht\ngenug Geld!", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist bei\nkeinem Geschaeft!", 7500, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nTippe /buybiz\n[bar/bank], um\ndas Geschäft zu\nkaufen!", 7500, 0, 125, 0 )
	end
end
addCommandHandler ( "buybiz", buybiz_func )


function sellbiz_func ( player )
	if vnxGetElementData ( player, "bizkey" ) == 0 then
		outputChatBox ( "Du hast kein Geschäft!", player, 125, 0, 0 )
	else
		local key = vnxGetElementData ( player, "bizkey" )
		local biz = bizkeys[key]
		bizArray[biz]["inhaber"] = "none"
		local bizprice = bizArray[biz]["preis"]
		local pname = getPlayerName ( player )
		outputDebugString ( "Spieler "..pname.." hat sein Geschäft verkauft." )
		outputChatBox ( "Du hast dein Geschäft verkauft und erhaelst "..bizprice.." $!", player, 0, 125, 0 )
		vnxSetElementData ( player, "bizkey", 0 )
		vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + bizprice )
		dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "userdata", "Bizschluessel", 0, "UID", playerUID[pname] )
		dbExec ( handler, "UPDATE ?? SET ??=? WHERE ??=?", "biz", "UID", 0, "ID", key )
		datasave_remote ( player )
	end
end
addCommandHandler ( "sellbiz", sellbiz_func )


function fixBizBuyCam ( player )
	setCameraTarget ( player, player )
end


function getNearestBiz ( player )
	local x1, y1, z1 = getElementPosition ( player )
	for icon, biz in pairs ( bizIcons ) do
		local x2, y2, z2 = getElementPosition ( icon )
		if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 3 then
			for i=1, #bizkeys do
				if bizkeys[i] == biz then
					return biz, i 
				end
			end
		end
	end
	return false, false
end


function bizhelp_func ( player )
	local bizkey = tonumber ( vnxGetElementData ( player, "bizkey" ) )
	if bizkey == 0 then
		outputChatBox ( "Du besitzt kein Geschaeft!", player, 125, 0, 0 )
	else
		local biz = bizkeys[bizkey]
		local bizname = bizArray[biz]["name"]
		outputChatBox ( "Dein Geschäft: "..bizname..", Kasse: "..bizArray[biz]["kasse"].." $.", player, 200, 200, 15 )
		outputChatBox ( "/sellbiz - Geschäft verkaufen, /bizhelp - Diese Hilfe, /bizdraw - Geld abheben, /bizstore - Geld einlagern.", player, 125, 125, 200 )
	end
end
addCommandHandler ( "bizhelp", bizhelp_func )


function bizdraw_func ( player, cmd, amount )
	if vnxGetElementData ( player, "bizkey" ) > 0 then
		if amount then
			local amount = tonumber ( amount ) and math.abs ( tonumber ( amount ) ) or false
			if amount then
				local key = vnxGetElementData ( player, "bizkey" )
				local biz = bizkeys[key]
				local curmoney = bizArray[biz]["kasse"]
				if curmoney >= amount then
					bizArray[biz]["kasse"] = curmoney - amount
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) + amount )
					infobox ( player, amount.."$\nrausgenommen", 4000, 0, 200, 0 )
				else
					outputChatBox ( "Du hast nicht so viel Geld in deinem Geschäft!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Bitte gib eine gültige Summe an!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Bitte gib eine gültige Summe an!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Du besitzt kein Geschäft!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "bizdraw", bizdraw_func )


function bizstore_func ( player, cmd, amount )
	local key = vnxGetElementData ( player, "bizkey" )
	if key and key > 0 then
		if amount and tonumber ( amount ) then
			local amount = math.abs ( tonumber ( amount ) )
			if amount then
				local biz = bizkeys[key]
				if vnxGetElementData ( player, "money" ) >= amount then
					bizArray[biz]["kasse"] = bizArray[biz]["kasse"] + amount
					vnxSetElementData ( player, "money", vnxGetElementData ( player, "money" ) - amount )
					infobox ( player, amount.."$\nreingetan", 4000, 0, 200, 0 )
				else
					outputChatBox ( "Du hast nicht genug Geld bei dir!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Bitte gib eine gültige Summe an!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Bitte gib eine gültige Summe an!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Du besitzt kein Geschäft!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "bizstore", bizstore_func )


function addMoneyToBiz ( id, amount )
	local biz = bizkeys[id]
	bizArray[biz]["kasse"] = bizArray[biz]["kasse"]  + amount
end