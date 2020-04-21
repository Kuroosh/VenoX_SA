spawnPointListCMD1 = {
 ["Noobspawn"]="noobspawn",
 ["Haus"]="house",
 ["Basis"]="faction",
 
 ["SFPD"]="faction",
 ["LVPD"]="faction",
 
 ["Basis"]="faction",
 ["Caligulas Casino"]="faction",
 
 ["Chinatown"]="faction",
 ["Four Dragons"]="faction",
 
 ["SF Basis"]="faction",
 
 ["Striplokal"]="faction",
 
 ["Flugzeugträger"]="faction",
 ["Area 51"]="faction",

 ["Angel Pine"]="faction",
 ["Clubgelände"]="faction",
 
 ["Hier"]="hier",
 ["Mistys Bar"]="bar",
 ["Yacht"]="boat",
 ["Wohnwagen"]="wohnmobil",
 
 ["Hotel ( SF )"]="hotel",
 ["Hotel ( LV )"]="hotel"
 }

spawnPointListCMD2 = {
 ["Noobspawn"]="",
 ["Haus"]="",
 ["Basis"]="",
 
 ["SFPD"]="sf",
 ["LVPD"]="lv",
 
 ["Basis"]="sf",
 ["Caligulas Casino"]="lv",
 
 ["Chinatown"]="sf",
 ["Four Dragons"]="lv",
 
 ["SF Basis"]="sf",
 
 ["Striplokal"]="strip",
 
 ["Flugzeugträger"]="sf",
 ["Area 51"]="lv",
 
 ["Angel Pine"]="sf",
 ["Clubgelände"]="lv",

 ["Hier"]="",
 ["Mistys Bar"]="",
 ["Yacht"]="",
 ["Wohnwagen"]="",
 
 ["Hotel ( SF )"]="sf",
 ["Hotel ( LV )"]="lv"
 }

factionsInBothCitys = {
 [1]=true, -- SFPD
 [2]=true, -- Mafia
 [3]=true, -- Triaden
 [6]=true, -- FBI
 [7]=true, -- Aztecas
 [8]=true, -- Army
 [9]=true  -- AoD
 }

function showSpawnSelection ()

	if isElement ( gWindow["spawnPointSelection"] ) then
		guiSetVisible ( gWindow["spawnPointSelection"], true )
	else
		--gWindow["spawnPointSelection"] = guiCreateWindow(screenwidth/2-281/2,120,281,287,"Startpunkt",false)
		gWindow["spawnPointSelection"] = guiCreateStaticImage(screenwidth/2-281/2,120,281,287,"images/hud/background.png",false)
		guiSetAlpha(gWindow["spawnPointSelection"],1)
		gGrid["availableSpawnPoints"] = guiCreateGridList(9,25,128,253,false,gWindow["spawnPointSelection"])
		guiGridListSetSelectionMode(gGrid["availableSpawnPoints"],2)
		gColumn["spawnPoint"] = guiGridListAddColumn(gGrid["availableSpawnPoints"],"Startpunkt",0.8)
		guiSetAlpha(gGrid["availableSpawnPoints"],1)
		gButton["changeSpawnPoint"] = guiCreateButton(145,100,126,69,"Als Start- und\nWieder-\neinstiegspunkt festlegen",false,gWindow["spawnPointSelection"])
		guiSetAlpha(gButton["changeSpawnPoint"],1)
		guiSetFont(gButton["changeSpawnPoint"],"default-bold-small")
		
		addEventHandler ( "onClientGUIClick", gButton["changeSpawnPoint"],
			function ()
				local row, column = guiGridListGetSelectedItem ( gGrid["availableSpawnPoints"] )
				local text = guiGridListGetItemText ( gGrid["availableSpawnPoints"], row, column )
				
				local cmd1 = spawnPointListCMD1[text]
				local cmd2 = spawnPointListCMD2[text]
				
				if cmd1 then
					triggerServerEvent ( "changeSpawnPosition", lp, cmd1, cmd2 )
				end
			end,
		false )
	end
	fillSpawnPointList ()
end

function fillSpawnPointList ()

	guiGridListClear ( gGrid["availableSpawnPoints"] )
	
	local row
	-- Noobspawn --
	row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
	guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Noobspawn", false, false )
	-- Haus --
	if vnxClientGetElementData ( "housekey" ) ~= 0 then
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Haus", false, false )
	end
	-- Fraktion --
	local fraktion = getElementData ( lp, "fraktion" )
	if fraktion == 1 then
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "SFPD", false, false )
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "LVPD", false, false )
	elseif fraktion == 2 then
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Basis", false, false )
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Caligulas Casino", false, false )
	elseif fraktion == 3 then
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Chinatown", false, false )
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Four Dragons", false, false )
	elseif fraktion == 6 then
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "SF Basis", false, false )
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "LVPD", false, false )
	elseif fraktion == 7 then
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Basis", false, false )
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Striplokal", false, false )
	elseif fraktion == 8 then
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Flugzeugträger", false, false )
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Area 51", false, false )
	elseif fraktion == 9 then
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Angel Pine", false, false )
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Clubgelände", false, false )
	elseif fraktion > 0 then
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Basis", false, false )
	end
	-- Admin --
	if getElementData ( lp, "adminlvl" ) >= 3 then
		row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
		guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Hier", false, false )
	end
	-- Yacht --
	row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
	guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Yacht", false, false )
	-- Wohnwagen --
	row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
	guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Wohnwagen", false, false )

	-- Hotels --
	row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
	guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Hotel ( SF )", false, false )
	row = guiGridListAddRow ( gGrid["availableSpawnPoints"] )
	guiGridListSetItemText ( gGrid["availableSpawnPoints"], row, gColumn["spawnPoint"], "Hotel ( LV )", false, false )
end