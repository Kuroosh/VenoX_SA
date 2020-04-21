local tab
local screenX, screenY = guiGetScreenSize()
local sx, sy = screenX/1366, screenY/768
local getnameandIDXML = {}
local statefromcarhood = false

TuningAutos = { [400]=true,[401]=true,[402]=true,[404]=true,[405]=true,[409]=true,[410]=true,[411]=true,[412]=true,[413]=true,[414]=true,[415]=true,[416]=true,[418]=true,[419]=true,[420]=true,[421]=true,[422]=true,[424]=true,[426]=true,[429]=true,[434]=true,[436]=true,[438]=true,[439]=true,[440]=true,[442]=true,[445]=true,[451]=true,[458]=true,[459]=true,[466]=true,[467]=true,[470]=true,[474]=true,[475]=true,[477]=true,[478]=true,[479]=true,[480]=true,[482]=true,[483]=true,[489]=true,[490]=true,[491]=true,[492]=true,[494]=true,[495]=true,[496]=true,[498]=true,[499]=true,[500]=true,[502]=true,[503]=true,[504]=true,[505]=true,[506]=true,[507]=true,[508]=true,[516]=true,[517]=true,[518]=true,[526]=true,[527]=true,[528]=true,[529]=true,[533]=true,[534]=true,[535]=true,[536]=true,[540]=true,[541]=true,[542]=true,[543]=true,[545]=true,[546]=true,[547]=true,[549]=true,[550]=true,[551]=true,[552]=true,[554]=true,[555]=true,[558]=true,[559]=true,[560]=true,[561]=true,[562]=true,[565]=true,[566]=true,[567]=true,[568]=true,[575]=true,[576]=true,[579]=true,[580]=true,[582]=true,[585]=true,[587]=true,[589]=true,[596]=true,[597]=true,[598]=true,[599]=true,[600]=true,[602]=true,[603]=true,[604]=true,[605]=true,[609]=true }
TuningFly = { [592]=true,[577]=true,[511]=true,[512]=true,[593]=true,[520]=true,[553]=true,[476]=true,[519]=true,[460]=true,[513]=true,[548]=true,[425]=true,[417]=true,[487]=true,[488]=true,[497]=true,[563]=true,[447]=true,[469]=true }
TuningBoat = { [430]=true,[446]=true,[452]=true,[453]=true,[454]=true,[472]=true,[473]=true,[484]=true,[493]=true,[595]=true }
setGarageOpen ( 18, true )


tuningmarker = {}
tuningmarker[1] = createMarker ( -1935.6130371094,247.12425231934,33.4609375, "cylinder", 5, 255, 0, 0 )
tuningmarker[2] = createMarker ( -1244.6999511719, -96.099998474121, -3.5, "cylinder", 30, 255, 0, 0 )
tuningmarker[3] = createMarker ( -2318.6000976563, 2325.8000488281, 1, "corona", 10, 255, 0, 0 )
tuningmarker[4] = createMarker ( 1041.5942382813, -1010.1271362305, 31.085121154785, "cylinder", 5, 255, 0, 0 )

function TuningFarbScroll()
	local veh = getPedOccupiedVehicle(getLocalPlayer())
	local red1 = math.floor(vnxScrollbarGetPosition("Tuning_color","Autofarbe1_1"))
	local green1 = math.floor(vnxScrollbarGetPosition("Tuning_color","Autofarbe1_2"))
	local blue1 = math.floor(vnxScrollbarGetPosition("Tuning_color","Autofarbe1_3"))
	local red2 = math.floor(vnxScrollbarGetPosition("Tuning_color","Autofarbe2_1"))
	local green2 = math.floor(vnxScrollbarGetPosition("Tuning_color","Autofarbe2_2")) 
	local blue2 = math.floor(vnxScrollbarGetPosition("Tuning_color","Autofarbe2_3")) 
	setVehicleColor(veh,red1,green1,blue1,red2,green2,blue2)
	local red = math.floor(vnxScrollbarGetPosition("Tuning_color","Lichtfarbe_1"))
	local green = math.floor(vnxScrollbarGetPosition("Tuning_color","Lichtfarbe_2"))
	local blue = math.floor(vnxScrollbarGetPosition("Tuning_color","Lichtfarbe_3"))
	setVehicleHeadLightColor(veh,red,green,blue)
end

function TuningFarbScrollLights()
	local red = math.floor(vnxScrollbarGetPosition("Tuning_color","Lichtfarbe_1"))
	local green = math.floor(vnxScrollbarGetPosition("Tuning_color","Lichtfarbe_2"))
	local blue = math.floor(vnxScrollbarGetPosition("Tuning_color","Lichtfarbe_3"))
	setVehicleHeadLightColor(veh,red,green,blue)
end 


function show_player_money_tuning()
	local pmoney = tonumber(getElementData ( lp, "money" ))
	dxDrawText("Mein Geld : "..pmoney.." $", sx*0, sy*165, sx*400, sy*215, tocolor(255, 255, 255, 255), 1.30, "default-bold", "center", "center", false, false, false, false, false)
	dxDrawRectangle(0, sy*215, sx*400, sy*4, tocolor(0, 105, 145, 255), false)
	dxDrawRectangle(0, sy*165, sx*400, sy*4, tocolor(0, 105, 145, 255), false)

end 



function tuning_upgrades()
	tab = "upgrades"
	vnxDestroyWindow("Tuning_color")
	
	local veh = getPedOccupiedVehicle(getLocalPlayer())
	local tbl1 = {}
	local tbl2 = {}
	local tbl3 = {}
	local tbl4 = {}
	if getElementModel(veh) == 471 or getElementModel(veh) == 573 or getElementModel(veh) == 513 or getElementModel(veh) == 571 or getElementModel(veh) == 519 or getElementModel(veh) == 572 or getElementModel(veh) == 557 or getElementModel(veh) == 444 or getElementModel(veh) == 556 then
	tuning_color()
	else
	for slot = 0, 16 do
		local upgrades = getVehicleCompatibleUpgrades ( veh, slot )
		for k, v in ipairs(upgrades) do
			if k == 1 then
				if slot < 8 or slot == 13 or slot == 14 or slot == 15 then
					table.insert(tbl1,{"     "..getVehicleUpgradeSlotName(slot),""})
				elseif slot == 8 then
					table.insert(tbl2,{"     "..getVehicleUpgradeSlotName(slot),""})
				elseif slot == 12 then
					table.insert(tbl3,{"     "..getVehicleUpgradeSlotName(slot),""})
				else
					table.insert(tbl4,{"     "..getVehicleUpgradeSlotName(slot),""})
				end
			end
			local xmlUpgrades = xmlLoadFile ( "anzeigen/car/tuning/upgrades.xml" )
			local nodes = xmlNodeGetChildren(xmlUpgrades)
			for i, xmlUpgradesChild in pairs(nodes) do
				local id = tonumber(xmlNodeGetAttribute(xmlUpgradesChild, "id"))
				local name = xmlNodeGetAttribute(xmlUpgradesChild, "name")
				getnameandIDXML[name] = id
				if id == tonumber(v) then
					if slot == 0 then
						price = 1000
					elseif slot == 1 then
						price = 2000
					elseif slot == 2 then
						price = 2500
					elseif slot == 3 then
						price = 1500
					elseif slot == 4 then
						price = 1000
					elseif slot == 5 then
						price = 1000
					elseif slot == 6 then
						price = 2000
					elseif slot == 7 then
						price = 1500
					elseif slot == 8 then
						price = 2000
					elseif slot == 9 then
						price = 5000
					elseif slot == 10 then
						price = 1000
					elseif slot == 11 then
						price = 1000
					elseif slot == 12 then
						price = 2000
					elseif slot == 13 then
						price = 1000
					elseif slot == 14 then
						price = 1000
					elseif slot == 15 then
						price = 1000
					elseif slot == 16 then
						price = 1000
					end
				--	for upgradeKey, upgradeValue in ipairs(upgrades) do
						if slot < 8 or slot == 13 or slot == 14 or slot == 15 then
							table.insert(tbl1,{name,price})
						elseif slot == 8 then
							
							table.insert(tbl2,{name,price})
						elseif slot == 12 then
							table.insert(tbl3,{name,price})
						else
							table.insert(tbl4,{name,price})
						end
					--end
				end
			end
			xmlUnloadFile ( xmlUpgrades )
		end
	end
	vnxDestroyWindow("Tuning_button_ansicht_left")
	vnxDrawButtonColored("Tuning_button_ansicht_left", "Info Func", "◀ ◀ ◀", sx*400, sy*384, sx*200, sy*80, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "tuningAnsicht_change_left")
	vnxDrawRectangle("Tuning_upgrades","Upgrade_BG", sx*0,sy*165,sx*400,screenY,tocolor(0,0,0,160))
	vnxDrawText("Tuning_upgrades","Aussehen_txt","Aussehen",sx*20,sy*220,sx*200,sy*40,tocolor(0,150,200,255),1,"default","left","top")
	vnxDrawGridlist("Tuning_upgrades","Grid_Aussehen",sx*20,sy*240,sx*330,sy*120,{{"Upgrade",250},{"Preis",90}},tbl1,"tuning_aussehen_test")
	vnxDrawText("Tuning_upgrades","Nitro_txt","Nitro",sx*20,sy*405,sx*200,sy*40,tocolor(0,150,200,255),1,"default","left","top")
	vnxDrawGridlist("Tuning_upgrades","Grid_Nitro",sx*20,sy*425,sx*330,sy*100,{{"Upgrade",250},{"Preis",90}},tbl2,"tuning_nitro_test")
	vnxDrawText("Tuning_upgrades","Reifen_txt","Reifen",sy*10,sy*565,sx*170,sy*40,tocolor(0,150,200,255),1,"default","left","top")
	vnxDrawGridlist("Tuning_upgrades","Grid_Reifen",sx*10,sy*585,sx*185,sy*120,{{"Upgrade",120},{"Preis",90}},tbl3,"tuning_reifen_test")
	vnxDrawText("Tuning_upgrades","Sonstiges_txt","Sonstiges",sx*205,sy*565,sx*170,sy*40,tocolor(0,150,200,255),1,"default","left","top")
	vnxDrawGridlist("Tuning_upgrades","Grid_sontiges",sx*205,sy*585,sx*185,sy*120,{{"Upgrade",120},{"Preis",90}},tbl4,"tuning_other_test")
	vnxDrawButtonColored("Tuning_button_select", "Kauf Func", "Karosserie Kaufen", sx*20, sy*370, sx*330, sy*30, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "TuningSetzen")
	vnxDrawButtonColored("Tuning_button_select_1", "Kauf Func", "Nitro Kaufen", sx*20, sy*530, sx*330, sy*30, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "TuningSetzenNitro")
	--vnxDrawButtonColored("Tuning_button_select_2", "Kauf Func", "Nitro Kaufen", sx*20, sy*550, 330, 40, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "TuningSetzenNitro")
	vnxDrawButtonColored("Tuning_button_select_3", "Kauf Func", "Felgen Kaufen", sx*10, sy*705, sx*185, sy*30, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "TuningSetzenReifen")
	vnxDrawButtonColored("Tuning_button_select_4", "Kauf Func", "Sonstige Upgrades \n Kaufen", sx*205, sy*705, 185, 30, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "TuningSetzenSpez")
	--addEventHandler("onClientRender", getRootElement(), show_player_money_tuning)
	end
end



function TuningSetzen()
	local veh = getPedOccupiedVehicle ( lp )
	local rowindex = vnxGetGridlistSelectedItem("Tuning_upgrades","Grid_Aussehen")[1]
	local preis = vnxGetGridlistSelectedItem("Tuning_upgrades","Grid_Aussehen")[2]
	local part = getnameandIDXML[rowindex]

	local data1 = tonumber(gettok ( part, 1, string.byte('|') ) ) 			-- Upgrade
	local data2 = tonumber(gettok ( preis, 1, string.byte('|') ) )			-- Preis
	local data4 = tonumber(gettok ( part, 1, string.byte('|') ) )

		if preis <= mymoney then
			--triggerServerEvent ( "servsideAddTuning", lp, lp, veh, spoiler, motorhaube, dach, seiten, nitro, auspuff, hydraulik, reifen, heckk, frontk, lufte, price )
			triggerServerEvent ( "servsideAddTuning", lp, lp, veh, part, preis )
			triggerEvent ( "infobox_start", lp, "[Info] : Du hast ein Karosserie Upgrade gekauft!", 5000, 125, 0, 0 )
		else
			triggerEvent ( "infobox_start", lp, "[Fehler] : Du hast zu wenig Geld!", 5000, 125, 0, 0 )
		end
end


function TuningSetzenNitro()
	local veh = getPedOccupiedVehicle ( lp )
	local rowindex = vnxGetGridlistSelectedItem("Tuning_upgrades","Grid_Nitro")[1]
	local preis = vnxGetGridlistSelectedItem("Tuning_upgrades","Grid_Nitro")[2]
	local part = getnameandIDXML[rowindex]

	local data1 = tonumber(gettok ( part, 1, string.byte('|') ) ) 			-- Upgrade
	local data2 = tonumber(gettok ( preis, 1, string.byte('|') ) )			-- Preis
	local data4 = tonumber(gettok ( part, 1, string.byte('|') ) )

		if preis <= mymoney then
			--triggerServerEvent ( "servsideAddTuning", lp, lp, veh, spoiler, motorhaube, dach, seiten, nitro, auspuff, hydraulik, reifen, heckk, frontk, lufte, price )
			triggerServerEvent ( "servsideAddTuning", lp, lp, veh, part, preis )
			triggerEvent ( "infobox_start", lp, "[Info] : Du hast eine Lachgaseinspritzung gekauft!", 5000, 125, 0, 0 )
		else
			triggerEvent ( "infobox_start", lp, "[Fehler] : Du hast zu wenig Geld!", 5000, 125, 0, 0 )
		end
end

function TuningSetzenReifen()
	local veh = getPedOccupiedVehicle ( lp )
	local rowindex = vnxGetGridlistSelectedItem("Tuning_upgrades","Grid_Reifen")[1]
	local preis = vnxGetGridlistSelectedItem("Tuning_upgrades","Grid_Reifen")[2]
	local part = getnameandIDXML[rowindex]

	local data1 = tonumber(gettok ( part, 1, string.byte('|') ) ) 			-- Upgrade
	local data2 = tonumber(gettok ( preis, 1, string.byte('|') ) )			-- Preis
	local data4 = tonumber(gettok ( part, 1, string.byte('|') ) )

		if preis <= mymoney then
			--triggerServerEvent ( "servsideAddTuning", lp, lp, veh, spoiler, motorhaube, dach, seiten, nitro, auspuff, hydraulik, reifen, heckk, frontk, lufte, price )
			triggerServerEvent ( "servsideAddTuning", lp, lp, veh, part, preis )
			triggerEvent ( "infobox_start", lp, "[Info] : Du hast neue Felgen gekauft!", 5000, 125, 0, 0 )
		else
			triggerEvent ( "infobox_start", lp, "[Fehler] : Du hast zu wenig Geld!", 5000, 125, 0, 0 )
		end
end

function TuningSetzenSpez()
	local veh = getPedOccupiedVehicle ( lp )
	local rowindex = vnxGetGridlistSelectedItem("Tuning_upgrades","Grid_sontiges")[1]
	local preis = vnxGetGridlistSelectedItem("Tuning_upgrades","Grid_sontiges")[2]
	local part = getnameandIDXML[rowindex]

	local data1 = tonumber(gettok ( part, 1, string.byte('|') ) ) 			-- Upgrade
	local data2 = tonumber(gettok ( preis, 1, string.byte('|') ) )			-- Preis
	local data4 = tonumber(gettok ( part, 1, string.byte('|') ) )

		if preis <= mymoney then
			--triggerServerEvent ( "servsideAddTuning", lp, lp, veh, spoiler, motorhaube, dach, seiten, nitro, auspuff, hydraulik, reifen, heckk, frontk, lufte, price )
			triggerServerEvent ( "servsideAddTuning", lp, lp, veh, part, preis )
			triggerEvent ( "infobox_start", lp, "[Info] : Du hast ein Spezial Tuning gekauft!", 5000, 125, 0, 0 )
		else
			triggerEvent ( "infobox_start", lp, "[Fehler] : Du hast zu wenig Geld!", 5000, 125, 0, 0 )
		end
end
function tuning_aussehen_test()
	local s = vnxGetGridlistSelectedItem("Tuning_upgrades","Grid_Aussehen")[1]
	tuningAddUpgradeTemp(s)
	outputDebugString(s)
end

function tuning_reifen_test()
	local s = vnxGetGridlistSelectedItem("Tuning_upgrades","Grid_Reifen")[1]
	tuningAddUpgradeTemp(s)
end

function tuning_nitro_test()
	local s = vnxGetGridlistSelectedItem("Tuning_upgrades","Grid_Nitro")[1]
	tuningAddUpgradeTemp(s)
end

function tuning_other_test()
	local s = vnxGetGridlistSelectedItem("Tuning_upgrades","Grid_sontiges")[1]
	tuningAddUpgradeTemp(s)
end

function close_upgrade_window()
	vnxDestroyWindow("Tuning_upgrades")
	vnxDestroyWindow("Tuning_button_karosserie")
	vnxDestroyWindow("Tuning_button_ansicht_left")
	vnxDestroyWindow("Tuning_button_select")
	vnxDestroyWindow("Tuning_button_select_1")
	vnxDestroyWindow("Tuning_button_select_2")
	vnxDestroyWindow("Tuning_button_select_3")
	vnxDestroyWindow("Tuning_button_select_4")
	removeEventHandler("onClientRender", getRootElement(), show_player_money_tuning)
	vnxDrawButtonColored("Tuning_button_ansicht_left", "Info Func", "◀ ◀ ◀", sx*0, sy*384, sx*200, sy*80, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "tuningAnsicht_change_left")
	vnxDrawButtonColored("Tuning_button_karosserie", "Info Func", "Karosserie", sx*165, sy*70, sx*200, sy*50, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "show_upgrade_window")
end
function show_upgrade_window()
	------------------------------
		--------------------------------------------------

		vnxDestroyWindow("Tuning_button_ansicht_left")
		vnxDestroyWindow("Motor_upgrades_main")
		vnxDestroyWindow("Tuning_button_select")
		vnxDestroyWindow("Tuning_button_select_1")
		vnxDestroyWindow("Tuning_button_select_2")
		vnxDestroyWindow("Tuning_button_select_3")
		vnxDestroyWindow("Tuning_button_select_4")
		vnxDestroyWindow("Tuning_color")
		vnxDestroyWindow("Tuning_button_motorupgrade_allrad")
		vnxDestroyWindow("Tuning_button_motorupgrade_front")
		vnxDestroyWindow("Tuning_button_motorupgrade_heck")
		vnxDestroyWindow("Motor_upgrades_main_line")
		vnxDestroyWindow("Motor_upgrades_main_line_2")
		vnxDestroyWindow("Tuning_button_motorupgrade_sportmotor1")
		vnxDestroyWindow("Tuning_button_motorupgrade_sportmotor2")
		vnxDestroyWindow("Tuning_button_motorupgrade_sportmotor3")
		vnxDestroyWindow("Tuning_button_motorupgrade_sportmotor4")
		vnxDestroyWindow("Tuning_button_motorupgrade_bremse1")
		vnxDestroyWindow("Tuning_button_motorupgrade_bremse2")
		vnxDestroyWindow("Tuning_button_motorupgrade_bremse3")
		vnxDestroyWindow("Tuning_button_motorupgrade_bremse4")
		vnxDestroyWindow("antrieb_text")
		vnxDrawButtonColored("Tuning_button_ansicht_left", "Info Func", "◀ ◀ ◀", sx*0, sy*384, sx*200, sy*80, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "tuningAnsicht_change_left")
		removeEventHandler("onClientRender", getRootElement(), show_player_money_tuning)
		vnxDrawButtonColored("Tuning_button_motor_upgrade", "Info Func", "Motor Upgrade", sx*390, sy*70, sx*200, sy*50, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "show_motorupgrade_window")
		--------------------------------------------------
	close_lackierung_window()
	close_neon_window()
	close_cpaintjob_window()
	------------------------------
	vnxDestroyWindow("Tuning_button_ansicht_left")
	addEventHandler("onClientRender", getRootElement(), show_player_money_tuning)
	tuning_upgrades()
	vnxDestroyWindow("Tuning_button_karosserie")
	--vnxDrawButtonColored("Tuning_button_select", "Kauf Func", "Kaufen", sx*20, sy*370, sx*330, sy*40, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "TuningSetzen")
	vnxDrawButtonColored("Tuning_button_karosserie", "Info Func", "Schliessen", sx*165, sy*70, sx*200, sy*50, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(125,0,0,255), tocolor(180,0,0,255), "close_upgrade_window")
	vnxDrawButtonColored("Tuning_button_select", "Kauf Func", "Karosserie Kaufen", sx*20, sy*370, sx*330, sy*30, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "TuningSetzen")
	vnxDrawButtonColored("Tuning_button_select_1", "Kauf Func", "Nitro Kaufen", sx*20, sy*530, sx*330, sy*30, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "TuningSetzenNitro")
	--vnxDrawButtonColored("Tuning_button_select_2", "Kauf Func", "Nitro Kaufen", sx*20, sy*550, 330, 40, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "TuningSetzenNitro")
	vnxDrawButtonColored("Tuning_button_select_3", "Kauf Func", "Felgen Kaufen", sx*10, sy*705, sx*185, sy*30, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "TuningSetzenReifen")
	vnxDrawButtonColored("Tuning_button_select_4", "Kauf Func", "Sonstige Upgrades \n Kaufen", sx*205, sy*705, sx*185, sy*30, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "TuningSetzenSpez")
end 




function motorupgrade_window()
	vnxDestroyWindow("Tuning_button_ansicht_left")

	vnxDrawRectangle("Motor_upgrades_main","Motor Performance BG", sx*0,sy*165,sx*400,screenY,tocolor(0,0,0,160))
	vnxDrawRectangle("Motor_upgrades_main_line","Motor Performance BG", sx*0,sy*249,sx*400,sy*4,tocolor(0,150,200,160))
	vnxDrawRectangle("Motor_upgrades_main_line_2","Motor Performance BG", sx*0,sy*305,sx*400,sy*4,tocolor(0,150,200,160))
	vnxDrawButtonColored("Tuning_button_ansicht_left", "Info Func", "◀ ◀ ◀", sx*400, sy*384, sx*200, sy*80, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "tuningAnsicht_change_left")

end 


function close_motorupgrade_window()
	local vehicle = getPedOccupiedVehicle(lp)
	--setVehicleDoorOpenRatio ( vehicle, 0, 1 - getVehicleDoorOpenRatio ( vehicle, 0 ), 1500 )
	if  statefromcarhood == true then 
		setVehicleDoorOpenRatio ( vehicle, 0, 1 - getVehicleDoorOpenRatio ( vehicle, 0 ), 2500 )
		statefromcarhood = true
	end
	vnxDestroyWindow("Tuning_button_ansicht_left")
	vnxDestroyWindow("Motor_upgrades_main")
	vnxDestroyWindow("Tuning_button_select")
	vnxDestroyWindow("Tuning_button_select_1")
	vnxDestroyWindow("Tuning_button_select_2")
	vnxDestroyWindow("Tuning_button_select_3")
	vnxDestroyWindow("Tuning_button_select_4")
	vnxDestroyWindow("Tuning_color")
	vnxDestroyWindow("Tuning_button_motorupgrade_allrad")
	vnxDestroyWindow("Tuning_button_motorupgrade_front")
	vnxDestroyWindow("Tuning_button_motorupgrade_heck")
	vnxDestroyWindow("Motor_upgrades_main_line")
	vnxDestroyWindow("Motor_upgrades_main_line_2")
	vnxDestroyWindow("Tuning_button_motorupgrade_sportmotor1")
	vnxDestroyWindow("Tuning_button_motorupgrade_sportmotor2")
	vnxDestroyWindow("Tuning_button_motorupgrade_sportmotor3")
	vnxDestroyWindow("Tuning_button_motorupgrade_sportmotor4")
	vnxDestroyWindow("Tuning_button_motorupgrade_bremse1")
	vnxDestroyWindow("Tuning_button_motorupgrade_bremse2")
	vnxDestroyWindow("Tuning_button_motorupgrade_bremse3")
	vnxDestroyWindow("Tuning_button_motorupgrade_bremse4")
	vnxDestroyWindow("antrieb_text")

	vnxDrawButtonColored("Tuning_button_ansicht_left", "Info Func", "◀ ◀ ◀", sx*0, sy*384, sx*200, sy*80, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "tuningAnsicht_change_left")
	removeEventHandler("onClientRender", getRootElement(), show_player_money_tuning)
	vnxDrawButtonColored("Tuning_button_motor_upgrade", "Info Func", "Motor Upgrade", sx*390, sy*70, sx*200, sy*50, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "show_motorupgrade_window")
	
end
--------------------------------------------------------------------------------------
function frontantrieb_buy()
	local vehicle = getPedOccupiedVehicle(lp)
	local tuning = "Frontantrieb"
	local preis = 200000
	if preis <= mymoney then 
		triggerServerEvent("motorupgrades_tuning", getLocalPlayer(), vehicle, tuning,preis)
	else
		triggerEvent ( "infobox_start", lp, "[Fehler] : Du hast zu wenig Geld!", 5000, 125, 0, 0 )
	end
end 
function allradantrieb_buy()
	local vehicle = getPedOccupiedVehicle(lp)
	local tuning = "Allradantrieb"
	local preis = 200000
	if preis <= mymoney then 
		triggerServerEvent("motorupgrades_tuning", getLocalPlayer(), vehicle, tuning,preis)
	else
		triggerEvent ( "infobox_start", lp, "[Fehler] : Du hast zu wenig Geld!", 5000, 125, 0, 0 )
	end
end 
function heckantrieb_buy()
	local vehicle = getPedOccupiedVehicle(lp)
	local tuning = "Heckantrieb"
	local preis = 200000
	if preis <= mymoney then 
		triggerServerEvent("motorupgrades_tuning", getLocalPlayer(), vehicle, tuning,preis)
	else
		triggerEvent ( "infobox_start", lp, "[Fehler] : Du hast zu wenig Geld!", 5000, 125, 0, 0 )
	end
end
--------------------------------------------------------------------------------------
function sportmotor1_buy()
	local vehicle = getPedOccupiedVehicle(lp)
	local tuning = "Sportmotor 1"
	local preis = 250000
	if preis <= mymoney then 
		triggerServerEvent("motorupgrades_tuning", getLocalPlayer(), vehicle, tuning, preis)
	else
		triggerEvent ( "infobox_start", lp, "[Fehler] : Du hast zu wenig Geld!", 5000, 125, 0, 0 )
	end
end
function sportmotor2_buy()
	local vehicle = getPedOccupiedVehicle(lp)
	local tuning = "Sportmotor 2"
	local preis = 500000
	if preis <= mymoney then
		triggerServerEvent("motorupgrades_tuning", getLocalPlayer(), vehicle, tuning, preis)
	else
		triggerEvent ( "infobox_start", lp, "[Fehler] : Du hast zu wenig Geld!", 5000, 125, 0, 0 )
	end
end
function sportmotor3_buy()
	local vehicle = getPedOccupiedVehicle(lp)
	local tuning = "Sportmotor 3"
	local preis = 750000
	if preis <= mymoney then
		triggerServerEvent("motorupgrades_tuning", getLocalPlayer(), vehicle, tuning, preis)
	else
		triggerEvent ( "infobox_start", lp, "[Fehler] : Du hast zu wenig Geld!", 5000, 125, 0, 0 )
	end
end
function sportmotor4_buy()
	local vehicle = getPedOccupiedVehicle(lp)
	local tuning = "Sportmotor 4"
	local preis = 1500000
	if preis <= mymoney then 
		triggerServerEvent("motorupgrades_tuning", getLocalPlayer(), vehicle, tuning, preis)
	else
		triggerEvent ( "infobox_start", lp, "[Fehler] : Du hast zu wenig Geld!", 5000, 125, 0, 0 )
	end
end
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
function bremse1_buy()
	local vehicle = getPedOccupiedVehicle(lp)
	local tuning = "Bremse 1"
	local preis = 50000
	if preis <= mymoney then 
		triggerServerEvent("motorupgrades_tuning", getLocalPlayer(), vehicle, tuning, preis)
	else
		triggerEvent ( "infobox_start", lp, "[Fehler] : Du hast zu wenig Geld!", 5000, 125, 0, 0 )
	end
end
function bremse2_buy()
	local vehicle = getPedOccupiedVehicle(lp)
	local tuning = "Bremse 2"
	local preis = 100000
	if preis <= mymoney then 
		triggerServerEvent("motorupgrades_tuning", getLocalPlayer(), vehicle, tuning, preis)
	else
		triggerEvent ( "infobox_start", lp, "[Fehler] : Du hast zu wenig Geld!", 5000, 125, 0, 0 )
	end
end
function bremse3_buy()
	local vehicle = getPedOccupiedVehicle(lp)
	local tuning = "Bremse 3"
	local preis = 150000
	if preis <= mymoney then
		triggerServerEvent("motorupgrades_tuning", getLocalPlayer(), vehicle, tuning, preis)
	else
		triggerEvent ( "infobox_start", lp, "[Fehler] : Du hast zu wenig Geld!", 5000, 125, 0, 0 )
	end
end
function bremse4_buy()
	local vehicle = getPedOccupiedVehicle(lp)
	local tuning = "Bremse 4"
	local preis = 200000
	if preis <= mymoney then 
		triggerServerEvent("motorupgrades_tuning", getLocalPlayer(), vehicle, tuning, preis)
	else
		triggerEvent ( "infobox_start", lp, "[Fehler] : Du hast zu wenig Geld!", 5000, 125, 0, 0 )
	end
end
--------------------------------------------------------------------------------------

function show_motorupgrade_window()
	------------------------------
	close_upgrade_window()
	close_lackierung_window()
	close_neon_window()
	close_cpaintjob_window()
	--------------------------------------------------
	local vehicle = getPedOccupiedVehicle(lp)
	if  statefromcarhood == false then 
		setVehicleDoorOpenRatio ( vehicle, 0, 1 - getVehicleDoorOpenRatio ( vehicle, 0 ), 2500 )
		statefromcarhood = true
	end
	addEventHandler("onClientRender", getRootElement(), show_player_money_tuning)

	--vnxDrawText("antrieb_text", "normaler text", "Antrieb ändern", 0, sy*219, sx*399, sy*249, tocolor(255,255,255,255), 1)
	vnxDrawText("antrieb_text", "normaler text", "Antrieb ändern", sx*15, sy*110, sx*400, sy*249, tocolor(255, 255, 255, 255), 1.3, "default", "center", "center")
	vnxDrawButtonColored("Tuning_button_motorupgrade_allrad", "Info Func", "Allrad\n[200.000 $]", sx*135, sy*260, sx*124, sy*45, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "allradantrieb_buy")

	vnxDrawButtonColored("Tuning_button_motorupgrade_front", "Info Func", "Front-Antrieb\n[200.000 $]", sx*0, sy*260, sx*124, sy*45, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "frontantrieb_buy")

	vnxDrawButtonColored("Tuning_button_motorupgrade_heck", "Info Func", "Heck-Antrieb\n[200.000 $]", sx*269, sy*260, sx*124, sy*45, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "heckantrieb_buy")

	vnxDestroyWindow("Tuning_button_motorupgrade")

	vnxDrawButtonColored("Tuning_button_motorupgrade_sportmotor1", "Info Func", "Sportmotor 1\n[250.000 $]", sx*5, sy*329, sx*385, sy*81, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "sportmotor1_buy")
	vnxDrawButtonColored("Tuning_button_motorupgrade_sportmotor2", "Info Func", "Sportmotor 2\n[500.000 $]", sx*5, sy*420, sx*385, sy*81, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "sportmotor2_buy")
	vnxDrawButtonColored("Tuning_button_motorupgrade_sportmotor3", "Info Func", "Sportmotor 3\n[750.000 $]", sx*5, sy*511, sx*385, sy*81, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "sportmotor3_buy")
	vnxDrawButtonColored("Tuning_button_motorupgrade_sportmotor4", "Info Func", "Sportmotor 4\n[1.500.000 $]", sx*5, sy*602, sx*385, sy*81, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "sportmotor4_buy")
	vnxDrawButtonColored("Tuning_button_motor_upgrade", "Info Func", "Schliessen", sx*390, sy*70, sx*200, sy*50, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(125,0,0,255), tocolor(175,0,0,255), "close_motorupgrade_window")
	

	vnxDrawButtonColored("Tuning_button_motorupgrade_bremse1", "Info Func", "Bremse 1\n[50.000 $]", sx*0, sy*709, sx*92, sy*50, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "bremse1_buy")
	vnxDrawButtonColored("Tuning_button_motorupgrade_bremse2", "Info Func", "Bremse 2\n[100.000 $]", sx*102, sy*709, sx*92, sy*50, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "bremse2_buy")
	vnxDrawButtonColored("Tuning_button_motorupgrade_bremse3", "Info Func", "Bremse 3\n[150.000 $]", sx*204, sy*709, sx*92, sy*50, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "bremse3_buy")
	vnxDrawButtonColored("Tuning_button_motorupgrade_bremse4", "Info Func", "Bremse 4\n[200.000 $]", sx*306, sy*709, sx*92, sy*50, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "bremse4_buy")

	motorupgrade_window()
end 



--------------------------------------------------------------------------------------



function tuning_color()
	local veh = getPedOccupiedVehicle(getLocalPlayer())
	local colors = getElementData(veh,"color")
	local c1 = tonumber ( gettok ( colors, 1, string.byte( '|' ) ))
	local c2 = tonumber ( gettok ( colors, 1, string.byte( '|' ) ))
	local c3 = tonumber ( gettok ( colors, 1, string.byte( '|' ) ))
	local c4 = tonumber ( gettok ( colors, 2, string.byte( '|' ) ))
	local c5 = tonumber ( gettok ( colors, 2, string.byte( '|' ) ))
	local c6 = tonumber ( gettok ( colors, 2, string.byte( '|' ) ))
	local c7 = tonumber ( gettok ( colors, 3, string.byte( '|' ) ))
	local c8 = tonumber ( gettok ( colors, 3, string.byte( '|' ) ))
	local c9 = tonumber ( gettok ( colors, 3, string.byte( '|' ) ))
	local c10 = tonumber ( gettok ( colors, 4, string.byte( '|' ) ))
	local c11 = tonumber ( gettok ( colors, 4, string.byte( '|' ) ))
	local c12 = tonumber ( gettok ( colors, 4, string.byte( '|' ) ))
	vnxDrawRectangle("Tuning_color","AutoFarbeBG", sx*10,sy*250,sx*180,sy*120,tocolor(0,150,200,100))
	vnxDrawText("Tuning_color","Autofarbe1_txt","Farbe 1",sx*20,sy*250,sx*170,sy*40,tocolor(255,255,255,255),1,"default","left","top")
	vnxDrawScrollbar("Tuning_color","Autofarbe1_1",sx*10,sy*280,sx*170,sy*25,c1,255,"TuningFarbScroll")
	vnxDrawScrollbar("Tuning_color","Autofarbe1_2",sx*10,sy*310,sx*170,sy*25,c2,255,"TuningFarbScroll")
	vnxDrawScrollbar("Tuning_color","Autofarbe1_3",sx*10,sy*340,sx*170,sy*25,c3,255,"TuningFarbScroll")

	vnxDrawRectangle("Tuning_color","bg_farbe2",sx*220,sy*250,sx*180,sy*120,tocolor(0,150,200,100))
	vnxDrawText("Tuning_color","Autofarbe2_txt","Farbe 2",sx*230,sy*250,sx*170,sy*40,tocolor(255,255,255,255),1,"default","left","top")
	vnxDrawScrollbar("Tuning_color","Autofarbe2_1",sx*225,sy*280,sx*170,sy*25,c4,255,"TuningFarbScroll")
	vnxDrawScrollbar("Tuning_color","Autofarbe2_2",sx*225,sy*310,sx*170,sy*25,c5,255,"TuningFarbScroll")
	vnxDrawScrollbar("Tuning_color","Autofarbe2_3",sx*225,sy*340,sx*170,sy*25,c6,255,"TuningFarbScroll")
	
	local c1, c2, c3 = getVehicleHeadLightColor ( getPedOccupiedVehicle ( lp ) )
	vnxDrawRectangle("Tuning_color","Lichtfarbe",sx*10,sy*440,sx*180,sy*120,tocolor(0,150,200,100))
	vnxDrawText("Tuning_color","Lichtfarbe_txt","Lichtfarbe",sx*20,sy*440,sx*170,sy*40,tocolor(255,255,255,255),1,"default","left","top")
	vnxDrawScrollbar("Tuning_color","Lichtfarbe_1",sx*15,sy*470,sx*170,sy*25,c1,255,"TuningFarbScrollLights")
	vnxDrawScrollbar("Tuning_color","Lichtfarbe_2",sx*15,sy*500,sx*170,sy*25,c2,255,"TuningFarbScrollLights")
	vnxDrawScrollbar("Tuning_color","Lichtfarbe_3",sx*15,sy*530,sx*170,sy*25,c3,255,"TuningFarbScrollLights")
	
	vnxDrawRectangle("Tuning_color","paintjob",sx*220,sy*440,sx*180,sy*120,tocolor(0,150,200,100))
	vnxDrawText("Tuning_color","Paintjob","Paintjob",sx*230,sy*440,sx*170,sy*40,tocolor(255,255,255,255),1,"default","left","top")
	vnxDrawGridlist("Tuning_color","Paintjob_Grid",sx*225,sy*470,sx*170,sy*90,{{"Paintjob ID",120}},{{0},{1},{2},{3}})
end


function lackierung_window()
	vnxDestroyWindow("Tuning_button_ansicht_left")
	vnxDrawRectangle("lackierung_upgrades_main","Lackierung BG", sx*0,sy*165,sx*400,screenY,tocolor(0,0,0,160))
	vnxDrawButtonColored("Tuning_button_ansicht_left", "Info Func", "◀ ◀ ◀", sx*400, sy*384, sx*200, sy*80, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "tuningAnsicht_change_left")
end 

function close_lackierung_window()
	vnxDestroyWindow("lackierung_upgrades_main")
	vnxDrawButtonColored("Tuning_button_ansicht_left", "Info Func", "◀ ◀ ◀", sx*0, sy*384, sx*200, sy*80, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "tuningAnsicht_change_left")
	vnxDestroyWindow("Tuning_button_lackierung")
	vnxDestroyWindow("Tuning_button_lackierung_buy")
	vnxDestroyWindow("Tuning_button_lackierung_buy_lights")
	vnxDestroyWindow("Tuning_button_lackierung_buy_paintjob")
	vnxDrawButtonColored("Tuning_button_lackierung", "Info Func", "Lackierung", sx*615, sy*70, sx*200, sy*50, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "show_lackierung_window")
	removeEventHandler("onClientRender", getRootElement(), show_player_money_tuning)
	vnxDestroyWindow("Tuning_button_lackierung_buy")
	vnxDestroyWindow("Tuning_color")
end 
function setLightAndColorValue()
	local preis = 5730
	local red1 = math.floor(vnxScrollbarGetPosition("Tuning_color","Autofarbe1_1"))
	local green1 = math.floor(vnxScrollbarGetPosition("Tuning_color","Autofarbe1_2"))
	local blue1 = math.floor(vnxScrollbarGetPosition("Tuning_color","Autofarbe1_3"))
	local red2 = math.floor(vnxScrollbarGetPosition("Tuning_color","Autofarbe2_1"))
	local green2 = math.floor(vnxScrollbarGetPosition("Tuning_color","Autofarbe2_2")) 
	local blue2 = math.floor(vnxScrollbarGetPosition("Tuning_color","Autofarbe2_3")) 
	if preis <= mymoney then
		triggerServerEvent("applyColorValue_func", getLocalPlayer(), red1, green1, blue1, red2, green2, blue2 )
		triggerEvent ( "infobox_start", lp, "[Info] : Du hast dein Fahrzeug Lackiert!", 5000, 125, 0, 0 )
	else 
		triggerEvent ( "infobox_start", lp, "[Fehler] : Du hast zu wenig Geld!", 5000, 125, 0, 0 )
	end
end

function setLightColorValue()
	local preis = 1325
	local red = math.floor(vnxScrollbarGetPosition("Tuning_color","Lichtfarbe_1"))
	local green = math.floor(vnxScrollbarGetPosition("Tuning_color","Lichtfarbe_2"))
	local blue = math.floor(vnxScrollbarGetPosition("Tuning_color","Lichtfarbe_3"))
	if preis <= mymoney then
		triggerServerEvent("applyLightValues", getLocalPlayer(), red, green, blue )
		triggerEvent ( "infobox_start", lp, "[Info] : Du hast neue Lampen gekauft!", 5000, 125, 0, 0 )
	else 
		triggerEvent ( "infobox_start", lp, "[Fehler] : Du hast zu wenig Geld!", 5000, 125, 0, 0 )
	end
end 
function setPaintjobValue()
	local preis = 2000
	local s = vnxGetGridlistSelectedItem("Tuning_color","Paintjob_Grid")[1]
	if preis <= mymoney then
		setVehiclePaintjob ( veh, s )
		triggerServerEvent("saveTuning_Paintjob", getLocalPlayer(), s )
		triggerEvent ( "infobox_start", lp, "[Info] : Du hast einen neuen Paintjob gekauft!", 5000, 125, 0, 0 )
	else 
		triggerEvent ( "infobox_start", lp, "[Fehler] : Du hast zu wenig Geld!", 5000, 125, 0, 0 )
	end
end 


function show_lackierung_window()
	------------------------------
	close_upgrade_window()
	close_neon_window()
	close_cpaintjob_window()
	--------------------------------------------------

	vnxDestroyWindow("Tuning_button_ansicht_left")
	vnxDestroyWindow("Motor_upgrades_main")
	vnxDestroyWindow("Tuning_button_select")
	vnxDestroyWindow("Tuning_button_select_1")
	vnxDestroyWindow("Tuning_button_select_2")
	vnxDestroyWindow("Tuning_button_select_3")
	vnxDestroyWindow("Tuning_button_select_4")
	vnxDestroyWindow("Tuning_color")
	vnxDestroyWindow("Tuning_button_motorupgrade_allrad")
	vnxDestroyWindow("Tuning_button_motorupgrade_front")
	vnxDestroyWindow("Tuning_button_motorupgrade_heck")
	vnxDestroyWindow("Motor_upgrades_main_line")
	vnxDestroyWindow("Motor_upgrades_main_line_2")
	vnxDestroyWindow("Tuning_button_motorupgrade_sportmotor1")
	vnxDestroyWindow("Tuning_button_motorupgrade_sportmotor2")
	vnxDestroyWindow("Tuning_button_motorupgrade_sportmotor3")
	vnxDestroyWindow("Tuning_button_motorupgrade_sportmotor4")
	vnxDestroyWindow("Tuning_button_motorupgrade_bremse1")
	vnxDestroyWindow("Tuning_button_motorupgrade_bremse2")
	vnxDestroyWindow("Tuning_button_motorupgrade_bremse3")
	vnxDestroyWindow("Tuning_button_motorupgrade_bremse4")


	vnxDestroyWindow("antrieb_text")
	vnxDrawButtonColored("Tuning_button_ansicht_left", "Info Func", "◀ ◀ ◀", sx*0, sy*384, sx*200, sy*80, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "tuningAnsicht_change_left")
	removeEventHandler("onClientRender", getRootElement(), show_player_money_tuning)
	vnxDrawButtonColored("Tuning_button_motor_upgrade", "Info Func", "Motor Upgrade", sx*390, sy*70, sx*200, sy*50, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "show_motorupgrade_window")
	--------------------------------------------------
	vnxDestroyWindow("Tuning_button_lackierung")
	addEventHandler("onClientRender", getRootElement(), show_player_money_tuning)
	vnxDrawButtonColored("Tuning_button_lackierung", "Info Func", "Schliessen", sx*615, sy*70, sx*200, sy*50, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(125,0,0,255), tocolor(175,0,0,255), "close_lackierung_window")
	vnxDrawButtonColored("Tuning_button_lackierung_buy", "Kauf Func", "Fahrzeug Lackierung Kaufen \n[5.430$]", sx*30, sy*375, sx*330, sy*30, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "setLightAndColorValue")
	vnxDrawButtonColored("Tuning_button_lackierung_buy_lights", "Kauf Func", "Lampen Farbe Kaufen \n[1.325$]", sx*20, sy*570, sx*170, sy*30, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "setLightColorValue")
	vnxDrawButtonColored("Tuning_button_lackierung_buy_paintjob", "Kauf Func", "Paintjob Lackierung Kaufen \n[2.000$]", sx*220, sy*570, sx*180, sy*30, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "setPaintjobValue")
	lackierung_window()
	tuning_color()
end 
------------------------------------------------------------------------------------------------------------------------------------------------------
function close_neon_window()
	vnxDestroyWindow("Tuning_button_neon")
	vnxDestroyWindow("neon_button_blue")
	vnxDestroyWindow("neon_button_red")
	vnxDestroyWindow("neon_button_green")
	vnxDestroyWindow("neon_button_yellow")
	vnxDestroyWindow("neon_button_white")

	removeEventHandler("onClientRender", getRootElement(), show_player_money_tuning)
	vnxDestroyWindow("lackierung_upgrades_main")
	vnxDrawButtonColored("Tuning_button_neon", "Info Func", "Unterboden Beleuchtung", sx*840, sy*70, sx*200, sy*50, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "show_neon_window")
end 


function neon_window()
	vnxDestroyWindow("Tuning_button_ansicht_left")
	addEventHandler("onClientRender", getRootElement(), show_player_money_tuning)
	vnxDrawRectangle("lackierung_upgrades_main","Lackierung BG", sx*0,sy*165,sx*400,screenY,tocolor(0,0,0,160))
	vnxDrawButtonColored("Tuning_button_ansicht_left", "Info Func", "◀ ◀ ◀", sx*400, sy*384, sx*200, sy*80, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "tuningAnsicht_change_left")

end 

function neon_button_blue()
	local preis = 20000
	if preis <= mymoney then
		triggerServerEvent("buyNeon", getLocalPlayer(), "blue")
		triggerEvent ( "infobox_start", lp, "[Info] : Du hast Blaue Neon Lichter gekauft!\n mit K kannst sie Aktivieren", 5000, 125, 0, 0 )
	else 
		triggerEvent ( "infobox_start", lp, "[Fehler] : Du hast zu wenig Geld!", 5000, 125, 0, 0 )
	end
end 
function neon_button_red()
	local preis = 20000
	if preis <= mymoney then
		triggerServerEvent("buyNeon", getLocalPlayer(), "red")
		triggerEvent ( "infobox_start", lp, "[Info] : Du hast Rote Neon Lichter gekauft!\n mit K kannst sie Aktivieren", 5000, 125, 0, 0 )
	else 
		triggerEvent ( "infobox_start", lp, "[Fehler] : Du hast zu wenig Geld!", 5000, 125, 0, 0 )
	end 
end 
function neon_button_green()
	local preis = 20000
	if preis <= mymoney then 
		triggerServerEvent("buyNeon", getLocalPlayer(), "green")
		triggerEvent ( "infobox_start", lp, "[Info] : Du hast Grüne Neon Lichter gekauft!\n mit K kannst sie Aktivieren", 5000, 125, 0, 0 )
	else 
		triggerEvent ( "infobox_start", lp, "[Fehler] : Du hast zu wenig Geld!", 5000, 125, 0, 0 )
	end 
end 
function neon_button_yellow()
	local preis = 20000
	if preis <= mymoney then 
		triggerServerEvent("buyNeon", getLocalPlayer(), "yellow")
		triggerEvent ( "infobox_start", lp, "[Info] : Du hast Gelbe Neon Lichter gekauft!\n mit K kannst sie Aktivieren", 5000, 125, 0, 0 )
	else 
		triggerEvent ( "infobox_start", lp, "[Fehler] : Du hast zu wenig Geld!", 5000, 125, 0, 0 )
	end 
end 
function neon_button_white()
	local preis = 20000
	if preis <= mymoney then 
		triggerServerEvent("buyNeon", getLocalPlayer(), "white")
		triggerEvent ( "infobox_start", lp, "[Info] : Du hast Weiße Neon Lichter gekauft!\n mit K kannst sie Aktivieren", 5000, 125, 0, 0 )
	else 
		triggerEvent ( "infobox_start", lp, "[Fehler] : Du hast zu wenig Geld!", 5000, 125, 0, 0 )
	end 
end 

------------------------------------------------------------------------------------------------------------------------------------------------------
function show_neon_window()
	close_upgrade_window()
	close_lackierung_window()
	close_cpaintjob_window()
	--------------------------------------------------
	vnxDestroyWindow("Tuning_button_ansicht_left")
	vnxDestroyWindow("Motor_upgrades_main")
	vnxDestroyWindow("Tuning_button_select")
	vnxDestroyWindow("Tuning_button_select_1")
	vnxDestroyWindow("Tuning_button_select_2")
	vnxDestroyWindow("Tuning_button_select_3")
	vnxDestroyWindow("Tuning_button_select_4")
	vnxDestroyWindow("Tuning_color")
	vnxDestroyWindow("Tuning_button_motorupgrade_allrad")
	vnxDestroyWindow("Tuning_button_motorupgrade_front")
	vnxDestroyWindow("Tuning_button_motorupgrade_heck")
	vnxDestroyWindow("Motor_upgrades_main_line")
	vnxDestroyWindow("Motor_upgrades_main_line_2")
	vnxDestroyWindow("Tuning_button_motorupgrade_sportmotor1")
	vnxDestroyWindow("Tuning_button_motorupgrade_sportmotor2")
	vnxDestroyWindow("Tuning_button_motorupgrade_sportmotor3")
	vnxDestroyWindow("Tuning_button_motorupgrade_sportmotor4")
	vnxDestroyWindow("Tuning_button_motorupgrade_bremse1")
	vnxDestroyWindow("Tuning_button_motorupgrade_bremse2")
	vnxDestroyWindow("Tuning_button_motorupgrade_bremse3")
	vnxDestroyWindow("Tuning_button_motorupgrade_bremse4")
	vnxDestroyWindow("antrieb_text")
	vnxDrawButtonColored("Tuning_button_ansicht_left", "Info Func", "◀ ◀ ◀", sx*0, sy*384, sx*200, sy*80, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "tuningAnsicht_change_left")
	removeEventHandler("onClientRender", getRootElement(), show_player_money_tuning)
	vnxDrawButtonColored("Tuning_button_neon", "Info Func", "Schliessen", sx*840, sy*70, sx*200, sy*50, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(125,0,0,255), tocolor(175,0,0,255), "close_neon_window")
	--------------------------------------------------
	neon_window()
	vnxDrawButtonColored("neon_button_blue", "Blue Func", "Blaue Unterboden beleuchtung[20.000$]", sx*20, sy*230, sx*335, sy*80, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "neon_button_blue")
	vnxDrawButtonColored("neon_button_red", "Red Func", "Rote Unterboden beleuchtung[20.000$]", sx*20, sy*345, sx*335, sy*80, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(150,0,0,255), tocolor(200,0,0,255), "neon_button_red")
	vnxDrawButtonColored("neon_button_green", "Green Func", "Grüne Unterboden beleuchtung[20.000$]", sx*20, sy*460, sx*335, sy*80, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,150,0,255), tocolor(0,200,0,255), "neon_button_green")
	vnxDrawButtonColored("neon_button_yellow", "Yellow Func", "Gelbe Unterboden beleuchtung[20.000$]", sx*20, sy*575, sx*335, sy*80, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(255,255,102,255), tocolor(255,255,0,255), "neon_button_yellow")
	vnxDrawButtonColored("neon_button_white", "White Func", "Weiße Unterboden beleuchtung[20.000$]", sx*20, sy*680, sx*335, sy*80, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(150,150,150,255), tocolor(200,200,200,255), "neon_button_white")
end
------------------------------------------------------------------------------------------------------------------------------------------------------

local dxfont0_drugs = dxCreateFont(":VenoX/fonts/drugs.ttf", 17)
local dxfont1_drugs = dxCreateFont(":VenoX/fonts/drugs.ttf", 10)

function cpaintjob_preis_gui()
	if cpname == nil then cpname = "" end
	if cppreis == nil then cppreis = "" end
	dxDrawLine(sx*1105 - sx*1, sy*167 - sy*1, sx*1105 - sx*1, sy*347, tocolor(0, 150, 200, 200), 1, false)
	dxDrawLine(sx*1365, sy*167 - sy*1, sx*1105 - sx*1, sy*167 - sy*1, tocolor(0, 150, 200, 200), 1, false)
	dxDrawLine(sx*1105 - sx*1, sy*347, sx*1365, sy*347, tocolor(0, 150, 200, 200), 1, false)
	dxDrawLine(sx*1365, sy*347, sx*1365, sy*167 - sy*1, tocolor(0, 150, 200, 200), 1, false)
	dxDrawText("Kasse", sx*1104, sy*166, sx*1365, sy*198, tocolor(255, 255, 255, 255), 1.00, dxfont0_drugs, "center", "center", false, false, false, false, false)
	dxDrawText(" Paintjob Name : "..cpname, sx*1104, sy*202, sx*1365, sy*234, tocolor(255, 255, 255, 255), 1.00, dxfont1_drugs, "left", "center", false, false, false, false, false)
	dxDrawText(" Paintjob Preis: "..cppreis, sx*1104, sy*244, sx*1365, sy*276, tocolor(255, 255, 255, 255), 1.00, dxfont1_drugs, "left", "center", false, false, false, false, false)
	--dxDrawRectangle(sx*1114, sy*296, sx*242, sy*36, tocolor(255, 255, 255, 255), false)
end 




function paintjob_apply_1()
    cpfilepath = "paintjob1.png"
	cpname = "Camouflage"
	cppreis = 50000
    myTexture = dxCreateTexture( "anzeigen/car/tuning/cpaintjob/images/paintjob1.png" )
	shader_cars, tec = dxCreateShader ( "anzeigen/car/tuning/cpaintjob/images/shader.fx" )
	engineRemoveShaderFromWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture(shader_cars, "?emap*", getPedOccupiedVehicle ( lp ))
    dxSetShaderValue ( shader_cars, "TX0", myTexture ) 
end 

function paintjob_apply_2()
    cpfilepath = "paintjob2.png"
	cpname = "Eichhörnchen"
	cppreis = 10000
    myTexture = dxCreateTexture( "anzeigen/car/tuning/cpaintjob/images/paintjob2.png" )
	shader_cars, tec = dxCreateShader ( "anzeigen/car/tuning/cpaintjob/images/shader.fx" )
	engineRemoveShaderFromWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture(shader_cars, "?emap*", getPedOccupiedVehicle ( lp ))
    dxSetShaderValue ( shader_cars, "TX0", myTexture ) 
end 

function paintjob_apply_3()
    cpfilepath = "paintjob3.png"
	cpname = "Venox Background Zerkratzt"
	cppreis = 65000
    myTexture = dxCreateTexture( "anzeigen/car/tuning/cpaintjob/images/paintjob3.png" )
	shader_cars, tec = dxCreateShader ( "anzeigen/car/tuning/cpaintjob/images/shader.fx" )
	engineRemoveShaderFromWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture(shader_cars, "?emap*", getPedOccupiedVehicle ( lp ))
    dxSetShaderValue ( shader_cars, "TX0", myTexture ) 
end 

function paintjob_apply_4()
    cpfilepath = "paintjob4.png"
	cpname = "Zitronen"
	cppreis = 50000
    myTexture = dxCreateTexture( "anzeigen/car/tuning/cpaintjob/images/paintjob4.png" )
	shader_cars, tec = dxCreateShader ( "anzeigen/car/tuning/cpaintjob/images/shader.fx" )
	engineRemoveShaderFromWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture(shader_cars, "?emap*", getPedOccupiedVehicle ( lp ))
    dxSetShaderValue ( shader_cars, "TX0", myTexture ) 
end 

function paintjob_apply_5()
    cpfilepath = "paintjob5.png"
	cpname = "Livin´ in America!!"
	cppreis = 200000
    myTexture = dxCreateTexture( "anzeigen/car/tuning/cpaintjob/images/paintjob5.png" )
	shader_cars, tec = dxCreateShader ( "anzeigen/car/tuning/cpaintjob/images/shader.fx" )
	engineRemoveShaderFromWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture(shader_cars, "?emap*", getPedOccupiedVehicle ( lp ))
    dxSetShaderValue ( shader_cars, "TX0", myTexture ) 
end
------------------------------------------------------------------------------------------------------------------------------------------------------
function paintjob_apply_6()
    cpfilepath = "paintjob6.png"
	cpname = "Weed"
	cppreis = 75000
    myTexture = dxCreateTexture( "anzeigen/car/tuning/cpaintjob/images/paintjob6.png" )
	shader_cars, tec = dxCreateShader ( "anzeigen/car/tuning/cpaintjob/images/shader.fx" )
	engineRemoveShaderFromWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture(shader_cars, "?emap*", getPedOccupiedVehicle ( lp ))
    dxSetShaderValue ( shader_cars, "TX0", myTexture ) 
end 

function paintjob_apply_7()
    cpfilepath = "paintjob7.png"
	cpname = "Stein"
	cppreis = 15000
    myTexture = dxCreateTexture( "anzeigen/car/tuning/cpaintjob/images/paintjob7.png" )
	shader_cars, tec = dxCreateShader ( "anzeigen/car/tuning/cpaintjob/images/shader.fx" )
	engineRemoveShaderFromWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture(shader_cars, "?emap*", getPedOccupiedVehicle ( lp ))
    dxSetShaderValue ( shader_cars, "TX0", myTexture ) 
end 

function paintjob_apply_8()
    cpfilepath = "paintjob8.png"
	cpname = "Gold"
	cppreis = 150000
    myTexture = dxCreateTexture( "anzeigen/car/tuning/cpaintjob/images/paintjob8.png" )
	shader_cars, tec = dxCreateShader ( "anzeigen/car/tuning/cpaintjob/images/shader.fx" )
	engineRemoveShaderFromWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture(shader_cars, "?emap*", getPedOccupiedVehicle ( lp ))
    dxSetShaderValue ( shader_cars, "TX0", myTexture ) 
end 

function paintjob_apply_9()
    cpfilepath = "paintjob9.png"
	cpname = "LargePeach"
	cppreis = 100000
    myTexture = dxCreateTexture( "anzeigen/car/tuning/cpaintjob/images/paintjob9.png" )
	shader_cars, tec = dxCreateShader ( "anzeigen/car/tuning/cpaintjob/images/shader.fx" )
	engineRemoveShaderFromWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture(shader_cars, "?emap*", getPedOccupiedVehicle ( lp ))
    dxSetShaderValue ( shader_cars, "TX0", myTexture ) 
end 

function paintjob_apply_10()
    cpfilepath = "paintjob10.png"
	cpname = "Kaddi.Butterfly \n                         & Explore.´s Favorite"
	cppreis = 1000
    myTexture = dxCreateTexture( "anzeigen/car/tuning/cpaintjob/images/paintjob10.png" )
	shader_cars, tec = dxCreateShader ( "anzeigen/car/tuning/cpaintjob/images/shader.fx" )
	engineRemoveShaderFromWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture(shader_cars, "?emap*", getPedOccupiedVehicle ( lp ))
    dxSetShaderValue ( shader_cars, "TX0", myTexture ) 
end
------------------------------------------------------------------------------------------------------------------------------------------------------
function paintjob_apply_11()
    cpfilepath = "paintjob11.png"
	cpname = "Smoking Color´s"
	cppreis = 50000
    myTexture = dxCreateTexture( "anzeigen/car/tuning/cpaintjob/images/paintjob11.png" )
	shader_cars, tec = dxCreateShader ( "anzeigen/car/tuning/cpaintjob/images/shader.fx" )
	engineRemoveShaderFromWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture(shader_cars, "?emap*", getPedOccupiedVehicle ( lp ))
    dxSetShaderValue ( shader_cars, "TX0", myTexture ) 
end 

function paintjob_apply_12()
    cpfilepath = "paintjob12.png"
	cpname = "Blut"
	cppreis = 75000
    myTexture = dxCreateTexture( "anzeigen/car/tuning/cpaintjob/images/paintjob12.png" )
	shader_cars, tec = dxCreateShader ( "anzeigen/car/tuning/cpaintjob/images/shader.fx" )
	engineRemoveShaderFromWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture(shader_cars, "?emap*", getPedOccupiedVehicle ( lp ))
    dxSetShaderValue ( shader_cars, "TX0", myTexture ) 
end 

function paintjob_apply_13()
    cpfilepath = "paintjob13.png"
	cpname = "Gucci Gang"
	cppreis = 300000
    myTexture = dxCreateTexture( "anzeigen/car/tuning/cpaintjob/images/paintjob13.png" )
	shader_cars, tec = dxCreateShader ( "anzeigen/car/tuning/cpaintjob/images/shader.fx" )
	engineRemoveShaderFromWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture(shader_cars, "?emap*", getPedOccupiedVehicle ( lp ))
    dxSetShaderValue ( shader_cars, "TX0", myTexture ) 
end 

function paintjob_apply_14()
    cpfilepath = "paintjob14.png"
	cpname = "Deutsches Vaterland"
	cppreis = 60000
    myTexture = dxCreateTexture( "anzeigen/car/tuning/cpaintjob/images/paintjob14.png" )
	shader_cars, tec = dxCreateShader ( "anzeigen/car/tuning/cpaintjob/images/shader.fx" )
	engineRemoveShaderFromWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture(shader_cars, "?emap*", getPedOccupiedVehicle ( lp ))
    dxSetShaderValue ( shader_cars, "TX0", myTexture ) 
end 

function paintjob_apply_15()
    cpfilepath = "paintjob15.png"
	cpname = "A.C.A.B. - Fuck Cops"
	cppreis = 200000
    myTexture = dxCreateTexture( "anzeigen/car/tuning/cpaintjob/images/paintjob15.png" )
	shader_cars, tec = dxCreateShader ( "anzeigen/car/tuning/cpaintjob/images/shader.fx" )
	engineRemoveShaderFromWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle ( lp ) )
	engineApplyShaderToWorldTexture(shader_cars, "?emap*", getPedOccupiedVehicle ( lp ))
    dxSetShaderValue ( shader_cars, "TX0", myTexture ) 
end
------------------------------------------------------------------------------------------------------------------------------------------------------
function buy_cpaintjob_btn()
    local vehicle = getPedOccupiedVehicle(lp)
    if cppreis == nil then 
        triggerEvent ( "infobox_start", lp, "[Fehler] : Du hast nichts ausgewaehlt!", 5000, 125, 0, 0 )
    else
        if cppreis <= mymoney then 
            triggerServerEvent("buy_cpaintjob", getLocalPlayer(), vehicle, cpfilepath, cppreis)
            infobox_start_func("Du hast "..cpname.." Folie gekauft!", 7500 )
        else
            triggerEvent ( "infobox_start", lp, "[Fehler] : Du hast zu wenig Geld!", 5000, 125, 0, 0 )
        end
    end
end 
------------------------------------------------------------------------------------------------------------------------------------------------------
function backzuseite1()
	vnxDestroyWindow("Paintjob_Image_1")
	vnxDestroyWindow("Paintjob_Image_2")
	vnxDestroyWindow("Paintjob_Image_3")
	vnxDestroyWindow("Paintjob_Image_4")
    vnxDestroyWindow("Paintjob_Image_5")
    vnxDestroyWindow("Tuning_button_seite1")
    vnxDestroyWindow("Tuning_button_seite2")
    --SEITE 1 ---------
	vnxDrawImage("Paintjob_Image_1", "PaintJob 1", sx*25, sy*279, sx*350, sy*75, "anzeigen/car/tuning/cpaintjob/images/paintjob1", "paintjob_apply_1")
	vnxDrawImage("Paintjob_Image_1", "PaintJob 2", sx*25, sy*357, sx*350, sy*75, "anzeigen/car/tuning/cpaintjob/images/paintjob2", "paintjob_apply_2")
	vnxDrawImage("Paintjob_Image_2", "PaintJob 3", sx*25, sy*435, sx*350, sy*75, "anzeigen/car/tuning/cpaintjob/images/paintjob3", "paintjob_apply_3")
	vnxDrawImage("Paintjob_Image_3", "PaintJob 4", sx*25, sy*513, sx*350, sy*75, "anzeigen/car/tuning/cpaintjob/images/paintjob4", "paintjob_apply_4")
	vnxDrawImage("Paintjob_Image_4", "PaintJob 5", sx*25, sy*591, sx*350, sy*75, "anzeigen/car/tuning/cpaintjob/images/paintjob5", "paintjob_apply_5")
    --SEITE 1 ---------
    vnxDrawButtonColored("Tuning_button_seite1", "Info Func", "Seite 1",sx*10, sy*687, sx*142, sy*50,tocolor(30,30,30,255), tocolor(30,30,30,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(30,30,30,255), tocolor(30,30,30,255), "nothing")
    vnxDrawButtonColored("Tuning_button_seite2", "Info Func", "Seite 2",sx*248, sy*687, sx*142, sy*50,tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "weiter_zu_seite2")
end 


function weiter_zu_seite2()
    vnxDestroyWindow("Tuning_button_seite1")
    vnxDestroyWindow("Tuning_button_seite2")
    vnxDrawButtonColored("Tuning_button_seite1", "Info Func", "Seite 1",sx*10, sy*687, sx*142, sy*50,tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "backzuseite1")
    vnxDrawButtonColored("Tuning_button_seite2", "Info Func", "Seite 3",sx*248, sy*687, sx*142, sy*50,tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "weiter_zu_seite3")
	vnxDestroyWindow("Paintjob_Image_1")
	vnxDestroyWindow("Paintjob_Image_2")
	vnxDestroyWindow("Paintjob_Image_3")
	vnxDestroyWindow("Paintjob_Image_4")
	vnxDestroyWindow("Paintjob_Image_5")
    --SEITE 2 ---------
	vnxDrawImage("Paintjob_Image_1", "PaintJob 1", sx*25, sy*279, sx*350, sy*75, "anzeigen/car/tuning/cpaintjob/images/paintjob6", "paintjob_apply_6")
	vnxDrawImage("Paintjob_Image_1", "PaintJob 2", sx*25, sy*357, sx*350, sy*75, "anzeigen/car/tuning/cpaintjob/images/paintjob7", "paintjob_apply_7")
	vnxDrawImage("Paintjob_Image_2", "PaintJob 3", sx*25, sy*435, sx*350, sy*75, "anzeigen/car/tuning/cpaintjob/images/paintjob8", "paintjob_apply_8")
	vnxDrawImage("Paintjob_Image_3", "PaintJob 4", sx*25, sy*513, sx*350, sy*75, "anzeigen/car/tuning/cpaintjob/images/paintjob9", "paintjob_apply_9")
	vnxDrawImage("Paintjob_Image_4", "PaintJob 5", sx*25, sy*591, sx*350, sy*75, "anzeigen/car/tuning/cpaintjob/images/paintjob10", "paintjob_apply_10")
    --SEITE 2 ---------
end 

function weiter_zu_seite3()
    vnxDestroyWindow("Tuning_button_seite1")
    vnxDestroyWindow("Tuning_button_seite2")
    vnxDrawButtonColored("Tuning_button_seite1", "Info Func", "Seite 2",sx*10, sy*687, sx*142, sy*50,tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "weiter_zu_seite2")
    vnxDrawButtonColored("Tuning_button_seite2", "Info Func", "Seite 4",sx*248, sy*687, sx*142, sy*50,tocolor(30,30,30,150), tocolor(30,30,30,150), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(30,30,30,255), tocolor(30,30,30,255), "nothing")
	vnxDestroyWindow("Paintjob_Image_1")
	vnxDestroyWindow("Paintjob_Image_2")
	vnxDestroyWindow("Paintjob_Image_3")
	vnxDestroyWindow("Paintjob_Image_4")
	vnxDestroyWindow("Paintjob_Image_5")
    --SEITE 2 ---------
	vnxDrawImage("Paintjob_Image_1", "PaintJob 1", sx*25, sy*279, sx*350, sy*75, "anzeigen/car/tuning/cpaintjob/images/paintjob11", "paintjob_apply_11")
	vnxDrawImage("Paintjob_Image_1", "PaintJob 2", sx*25, sy*357, sx*350, sy*75, "anzeigen/car/tuning/cpaintjob/images/paintjob12", "paintjob_apply_12")
	vnxDrawImage("Paintjob_Image_2", "PaintJob 3", sx*25, sy*435, sx*350, sy*75, "anzeigen/car/tuning/cpaintjob/images/paintjob13", "paintjob_apply_13")
	vnxDrawImage("Paintjob_Image_3", "PaintJob 4", sx*25, sy*513, sx*350, sy*75, "anzeigen/car/tuning/cpaintjob/images/paintjob14", "paintjob_apply_14")
	vnxDrawImage("Paintjob_Image_4", "PaintJob 5", sx*25, sy*591, sx*350, sy*75, "anzeigen/car/tuning/cpaintjob/images/paintjob15", "paintjob_apply_15")
    --SEITE 2 ---------
end 
------------------------------------------------------------------------------------------------------------------------------------------------------
function show_cpaintjob_window()
	close_upgrade_window()
	close_lackierung_window()
	close_neon_window()
	--------------------------------------------------
	vnxDestroyWindow("Tuning_button_ansicht_left")
	vnxDestroyWindow("Motor_upgrades_main")
	vnxDestroyWindow("Tuning_button_select")
	vnxDestroyWindow("Tuning_button_select_1")
	vnxDestroyWindow("Tuning_button_select_2")
	vnxDestroyWindow("Tuning_button_select_3")
	vnxDestroyWindow("Tuning_button_select_4")
	vnxDestroyWindow("Tuning_color")
	vnxDestroyWindow("Tuning_button_motorupgrade_allrad")
	vnxDestroyWindow("Tuning_button_motorupgrade_front")
	vnxDestroyWindow("Tuning_button_motorupgrade_heck")
	vnxDestroyWindow("Motor_upgrades_main_line")
	vnxDestroyWindow("Motor_upgrades_main_line_2")
	vnxDestroyWindow("Tuning_button_motorupgrade_sportmotor1")
	vnxDestroyWindow("Tuning_button_motorupgrade_sportmotor2")
	vnxDestroyWindow("Tuning_button_motorupgrade_sportmotor3")
	vnxDestroyWindow("Tuning_button_motorupgrade_sportmotor4")
	vnxDestroyWindow("Tuning_button_motorupgrade_bremse1")
	vnxDestroyWindow("Tuning_button_motorupgrade_bremse2")
	vnxDestroyWindow("Tuning_button_motorupgrade_bremse3")
	vnxDestroyWindow("Tuning_button_motorupgrade_bremse4")
	vnxDestroyWindow("antrieb_text")
	vnxDrawButtonColored("Tuning_button_ansicht_left", "Info Func", "◀ ◀ ◀", sx*0, sy*384, sx*200, sy*80, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "tuningAnsicht_change_left")
	removeEventHandler("onClientRender", getRootElement(), show_player_money_tuning)
	vnxDestroyWindow("Tuning_button_vinyl")
	--------------------------------------------------
	vnxDestroyWindow("Tuning_button_ansicht_left")
	addEventHandler("onClientRender", getRootElement(), show_player_money_tuning)
	addEventHandler("onClientRender", getRootElement(), cpaintjob_preis_gui)
	vnxDrawRectangle("lackierung_upgrades_main","Lackierung BG", sx*0,sy*165,sx*400,screenY,tocolor(0,0,0,160))
	vnxDrawButtonColored("Tuning_button_ansicht_left", "Info Func", "◀ ◀ ◀", sx*400, sy*384, sx*200, sy*80, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "tuningAnsicht_change_left")
	vnxDrawButtonColored("Tuning_button_vinyl", "Info Func", "Schliessen", sx*1065, sy*70, sx*200, sy*50, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(125,0,0,255), tocolor(175,0,0,255), "close_cpaintjob_window")
	------------------------------------------------------------------------------------------------------------------------------------------------------
	--dxDrawRectangle(0, 252, 400, 4, tocolor(0, 150, 200, 255), false)
	vnxDrawText("Cpaintjob_Image_Header","Aussehen_txt","Auto Sticker und Folien", sx*0,sy*220,sx*400,sy*45,tocolor(255,255,200,255),1.6,"default","center","top")
	vnxDrawRectangle("CPaintjob_Image_rec","Cpaintjob BG", sx*0,sy*252,sx*400,sy*4,tocolor(0,150,200,255))
	--vnxDrawButtonColored("Tuning_button_buy_vinyl", "Info Func", "Custom Paintjob Kaufen", sx*1114, sy*296, sx*242, sy*36, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(125,0,0,255), tocolor(175,0,0,255), "buy_cpaintjob_btn")
------------------------------------------------------------------------------------------------------------------------------------------------------
	vnxDrawRectangle("Cpaintjob_Rec_1","Lackierung BG", sx*20, sy*274, sx*359, sy*5, tocolor(0, 150, 200, 255))
	vnxDrawRectangle("Cpaintjob_Rec_2","Lackierung BG", sx*374, sy*279, sx*5, sy*387, tocolor(0, 150, 200, 255))
	vnxDrawRectangle("Cpaintjob_Rec_3","Lackierung BG", sx*20, sy*279, sx*5, sy*387, tocolor(0, 150, 200, 255))
	vnxDrawRectangle("Cpaintjob_Rec_4","Lackierung BG", sx*25, sy*354, sx*349, sy*3, tocolor(0, 150, 200, 255))
	vnxDrawRectangle("Cpaintjob_Rec_5","Lackierung BG", sx*25, sy*432, sx*349, sy*3, tocolor(0, 150, 200, 255))
	vnxDrawRectangle("Cpaintjob_Rec_6","Lackierung BG", sx*25, sy*510, sx*349, sy*3, tocolor(0, 150, 200, 255))
	vnxDrawRectangle("Cpaintjob_Rec_7","Lackierung BG", sx*25, sy*588, sx*349, sy*3, tocolor(0, 150, 200, 255))
	vnxDrawRectangle("Cpaintjob_Rec_8","Lackierung BG", sx*20, sy*666, sx*359, sy*5, tocolor(0, 150, 200, 255))
    vnxDrawRectangle("Cpaintjob_Rec_9","Lackierung BG",sx*1105, sy*167, sx*260, sy*180, tocolor(0, 0, 0, 160))
    vnxDrawRectangle("Cpaintjob_Rec_10","Lackierung BG",sx*1105, sy*198, sx*260, sy*4, tocolor(0, 150, 200, 200))
    vnxDrawRectangle("Cpaintjob_Rec_11","Lackierung BG",sx*1105, sy*282, sx*260, sy*4, tocolor(0, 150, 200, 200))


	--SEITE 1 ---------
	vnxDrawImage("Paintjob_Image_1", "PaintJob 1", sx*25, sy*279, sx*350, sy*75, "anzeigen/car/tuning/cpaintjob/images/paintjob1", "paintjob_apply_1")
	vnxDrawImage("Paintjob_Image_1", "PaintJob 2", sx*25, sy*357, sx*350, sy*75, "anzeigen/car/tuning/cpaintjob/images/paintjob2", "paintjob_apply_2")
	vnxDrawImage("Paintjob_Image_2", "PaintJob 3", sx*25, sy*435, sx*350, sy*75, "anzeigen/car/tuning/cpaintjob/images/paintjob3", "paintjob_apply_3")
	vnxDrawImage("Paintjob_Image_3", "PaintJob 4", sx*25, sy*513, sx*350, sy*75, "anzeigen/car/tuning/cpaintjob/images/paintjob4", "paintjob_apply_4")
	vnxDrawImage("Paintjob_Image_4", "PaintJob 5", sx*25, sy*591, sx*350, sy*75, "anzeigen/car/tuning/cpaintjob/images/paintjob5", "paintjob_apply_5")
    --SEITE 1 ---------
    vnxDrawButtonColored("Tuning_button_buy_vinyl", "Info Func", "Custom Paintjob Kaufen", sx*1114, sy*296, sx*242, sy*36, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "buy_cpaintjob_btn")
   
   
    vnxDrawButtonColored("Tuning_button_seite1", "Info Func", "Seite 1",sx*10, sy*687, sx*142, sy*50,tocolor(30,30,30,150), tocolor(30,30,30,150), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(30,30,30,255), tocolor(30,30,30,255), "nothing")
    --vnxDrawButtonColored("Tuning_button_buy_vinyl", "Info Func", "Custom Paintjob Kaufen",162, 687, 76, 50, tocolor(196, 0, 0, 150), false)
    vnxDrawButtonColored("Tuning_button_seite2", "Info Func", "Seite 2",sx*248, sy*687, sx*142, sy*50,tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "weiter_zu_seite2")
end  
------------------------------------------------------------------------------------------------------------------------------------------------------
function close_cpaintjob_window()
	vnxDestroyWindow("Cpaintjob_Rec_1")
	vnxDestroyWindow("Cpaintjob_Rec_2")
	vnxDestroyWindow("Cpaintjob_Rec_3")
	vnxDestroyWindow("Cpaintjob_Rec_4") 
	vnxDestroyWindow("Cpaintjob_Rec_5")
	vnxDestroyWindow("Cpaintjob_Rec_6")
	vnxDestroyWindow("Cpaintjob_Rec_7")
    vnxDestroyWindow("Cpaintjob_Rec_8")
    vnxDestroyWindow("Cpaintjob_Rec_9")
    vnxDestroyWindow("Cpaintjob_Rec_10")
    vnxDestroyWindow("Cpaintjob_Rec_11")

	vnxDestroyWindow("Tuning_button_buy_vinyl")
	vnxDestroyWindow("Paintjob_Image_1")
	vnxDestroyWindow("Paintjob_Image_2")
	vnxDestroyWindow("Paintjob_Image_3")
	vnxDestroyWindow("Paintjob_Image_4")
	vnxDestroyWindow("Paintjob_Image_5")
    vnxDestroyWindow("Tuning_button_seite1")
    vnxDestroyWindow("Tuning_button_seite2")
	vnxDestroyWindow("Tuning_button_vinyl")
	vnxDestroyWindow("CPaintjob_Image_rec")
	vnxDestroyWindow("Cpaintjob_Image_Header")
	removeEventHandler("onClientRender", getRootElement(), show_player_money_tuning)
	removeEventHandler("onClientRender", getRootElement(), cpaintjob_preis_gui)
	vnxDestroyWindow("lackierung_upgrades_main")
	vnxDrawButtonColored("Tuning_button_vinyl", "Info Func", "Vinyl", sx*1065, sy*70, sx*200, sy*50, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "show_cpaintjob_window")
end 
------------------------------------------------------------------------------------------------------------------------------------------------------
local ansicht = 0
function tuningAnsicht ()
	local posX,posY,posZ = getElementPosition(getLocalPlayer())
	local a = math.rad(90 - (360-ansicht))
	local dist = 5
	local dx = math.cos(a) * dist
	local dy = math.sin(a) * dist
	local posXN,posYN = posX+dx, posY+dy
	setCameraMatrix(posXN,posYN,posZ+1,posX,posY,posZ)
end
function tuningAnsicht_change ()
	ansicht = (ansicht + 90)%360
end


function tuningAnsicht_change_left ()
	ansicht = (ansicht - 90)%360
end
function showTuning(player)
    if player == getLocalPlayer() then 
		if player and isElement(player) and getElementType(player) == "player" and getPedOccupiedVehicle(player) then
			local vehicle = getPedOccupiedVehicle(player)
			local markerX, markerY, markerZ = getElementPosition ( source )
			local plX, plY, plZ = getElementPosition(player)
			local pass = 0
			if getVehicleMaxPassengers( vehicle ) >= 1 then
				for i=1,(getVehicleMaxPassengers( vehicle )) do
					if getVehicleOccupant( vehicle,i ) then
						pass = pass + 1
					end
				end
			end
			if not vehicle or pass > 0 then return end
			if source == tuningmarker[2] and not TuningFly[getElementModel(vehicle)] then
				return
			end
			if source == tuningmarker[3] and not TuningBoat[getElementModel(vehicle)] then
				return
			end
				if (source == tuningmarker[1] or source == tuningmarker[4]) and (plZ < markerZ-2 or plZ > markerZ+2 ) then
					return
				end
				if source == tuningmarker[2] and tonumber(plZ-2) > 20 then
					return
				end
				if getElementData ( vehicle, "owner" ) == getPlayerName ( player ) then
					window_already_open = true
					vnxDrawWindow("Tuning","Tuning_window","VenoX-Tuning",sx*0,sy*5, screenX, sy*160,"TuningSchliessen")
					--vnxDrawRectangle("Tuning","bg_navi",x,y+50,410,30,tocolor(230,100,0,150))
					--vnxDrawButton("Tuning","Upgrade","Upgrades",x+10,y+52,100,25,"tuning_upgrades") 
					--vnxDrawButton("Tuning","Licht_Change","Farbe / Licht",x+110,y+52,120,25,"tuning_color") 
					--vnxDrawButton("Tuning","Ansicht","Ansicht ändern",x+300,y+52,100,25,"tuningAnsicht_change") 
					--tuning_upgrades()
					
					vnxDrawButtonColored("Tuning_button_karosserie", "Info Func", "Karosserie", sx*165, sy*70, sx*200, sy*50, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "show_upgrade_window")

					vnxDrawButtonColored("Tuning_button_motor_upgrade", "Info Func", "Motor Upgrade", sx*390, sy*70, sx*200, sy*50, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "show_motorupgrade_window")
					
					vnxDrawButtonColored("Tuning_button_lackierung", "Info Func", "Lackierung", sx*615, sy*70, sx*200, sy*50, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "show_lackierung_window")

					vnxDrawButtonColored("Tuning_button_neon", "Info Func", "Unterboden Beleuchtung", sx*840, sy*70, sx*200, sy*50, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "show_neon_window")

					vnxDrawButtonColored("Tuning_button_vinyl", "Info Func", "Vinyl", sx*1065, sy*70, sx*200, sy*50, tocolor(50,50,50,150), tocolor(80,80,80,255), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,255), tocolor(0,150,200,255), "show_cpaintjob_window")

					vnxDrawButtonColored("Tuning_button_ansicht_left", "Info Func", "◀ ◀ ◀", sx*0, sy*384, sx*200, sy*80, tocolor(50,50,50,0), tocolor(0,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "tuningAnsicht_change_left")

					vnxDrawButtonColored("Tuning_button_ansicht_right", "Info Func", "▶ ▶ ▶", sx*1166, sy*384, sx*200, sy*80, tocolor(50,50,50,0), tocolor(80,150,200,20), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,105,145,0), tocolor(0,150,200,0), "tuningAnsicht_change")
					triggerEvent( "hidehudclient", getLocalPlayer())
					triggerEvent( "hideSpeedometer", getLocalPlayer())
					--vnxDrawButton("Tuning","kaufen","Kaufen / Einbauen",x+10,y+467,180,30,"tuning_buy") 
					--vnxDrawButton("Tuning","zuruecksetzen","Zurücksetzen",x+220,y+467,180,30,"tuning_reset") 
                    showChat(false)
                    setPlayerHudComponentVisible ( "radar", false )
					setElementFrozen(vehicle,true)
					toggleControl ( "enter_exit", false )
					local dim = math.random(1,10000)
					triggerServerEvent("setTuningDimension",getRootElement(),vehicle,dim)
					triggerServerEvent("setTuningDimension",getRootElement(),getLocalPlayer(),dim)
					if source == tuningmarker[4] then
						setCameraMatrix(1038.4226074219, -1022.0919189453, 34.728101730347,1041.4226074219, -1017.0919189453, 31.728101730347)
					else
						setCameraMatrix(-1960.2639160156, 247.94494628906, 36.4609375, -1935.1928710938, 237.62286376953, 34.4609375)
					end
					showCursor(true)
					addEventHandler("onClientRender",getRootElement(),tuningAnsicht)
					for i = 0, 16 do
						_G["upgradeSlot"..i.."MountedID"] = false
					end
				else
					showInfo("Es können nur Privatfahrzeuge getunt werden!",120,0,0)
				end
		end
	end
end
addEventHandler("onClientMarkerHit",tuningmarker[1],showTuning)
addEventHandler("onClientMarkerHit",tuningmarker[2],showTuning)
addEventHandler("onClientMarkerHit",tuningmarker[3],showTuning)
addEventHandler("onClientMarkerHit",tuningmarker[4],showTuning)

function tuningAddUpgradeTemp (s)
	if s then
		--local rowindex = vnxGetGridlistSelectedItem("Tuning_upgrades","Grid_Aussehen")[1]
		local veh = getPedOccupiedVehicle(getLocalPlayer())
		for i = 0,16 do 
			if s == "     "..getVehicleUpgradeSlotName(i) then
				removeVehicleUpgrade(veh,getVehicleUpgradeOnSlot(veh,i))
				return true
			end
		end
		local xmlUpgrades = xmlLoadFile ( "anzeigen/car/tuning/upgrades.xml" )
		for id = 1, 192 do
			local xmlUpgradesChild = xmlFindChild ( xmlUpgrades, "upgrade", id )
			if xmlNodeGetAttribute ( xmlUpgradesChild, "name" ) == s then
				for k, v in ipairs (getVehicleUpgrades(veh))do
					if s == v then
						removeVehicleUpgrade(veh,v)
					end
				end
				addVehicleUpgrade(veh, tonumber(xmlNodeGetAttribute ( xmlUpgradesChild, "id" )))
				--outputDebugString(getnameandIDXML[rowindex])
			end
		end
		xmlUnloadFile ( xmlUpgrades )
	end
end

function TuningSchliessen()
    local vnxhud = tonumber(getElementData( getLocalPlayer(), "hud"))
	triggerEvent( "showhudclient", getLocalPlayer(), vnxhud)
	window_already_open = false
	vnxDestroyWindow("Tuning")
	close_lackierung_window()
	close_neon_window()
	vnxDestroyWindow("Tuning_button_select")
	vnxDestroyWindow("Tuning_button_select_1")
	vnxDestroyWindow("Tuning_button_select_2")
	vnxDestroyWindow("Tuning_button_select_3")
	vnxDestroyWindow("Tuning_button_select_4")
	vnxDestroyWindow("Tuning_upgrades")
	vnxDestroyWindow("Tuning_color")
	vnxDestroyWindow("Tuning_button_lackierung")
	vnxDestroyWindow("Tuning_button_motor_upgrade")
	vnxDestroyWindow("Tuning_button_karosserie")
	vnxDestroyWindow("Tuning_button_ansicht_right")
	vnxDestroyWindow("Tuning_button_ansicht_left")
	vnxDestroyWindow("Tuning_button_vinyl")
	vnxDestroyWindow("Tuning_button_neon")


	vnxDestroyWindow("Tuning_button_ansicht_left")
	vnxDestroyWindow("Motor_upgrades_main")
	vnxDestroyWindow("Tuning_button_select")
	vnxDestroyWindow("Tuning_button_select_1")
	vnxDestroyWindow("Tuning_button_select_2")
	vnxDestroyWindow("Tuning_button_select_3")
	vnxDestroyWindow("Tuning_button_select_4")
	vnxDestroyWindow("Tuning_color")
	vnxDestroyWindow("Tuning_button_motorupgrade_allrad")
	vnxDestroyWindow("Tuning_button_motorupgrade_front")
	vnxDestroyWindow("Tuning_button_motorupgrade_heck")
	vnxDestroyWindow("Motor_upgrades_main_line")
	vnxDestroyWindow("Motor_upgrades_main_line_2")
	vnxDestroyWindow("Tuning_button_motorupgrade_sportmotor1")
	vnxDestroyWindow("Tuning_button_motorupgrade_sportmotor2")
	vnxDestroyWindow("Tuning_button_motorupgrade_sportmotor3")
	vnxDestroyWindow("Tuning_button_motorupgrade_sportmotor4")
	vnxDestroyWindow("Tuning_button_motorupgrade_bremse1")
	vnxDestroyWindow("Tuning_button_motorupgrade_bremse2")
	vnxDestroyWindow("Tuning_button_motorupgrade_bremse3")
	vnxDestroyWindow("Tuning_button_motorupgrade_bremse4")
    vnxDestroyWindow("antrieb_text")
    



	vnxDestroyWindow("Cpaintjob_Rec_1")
	vnxDestroyWindow("Cpaintjob_Rec_2")
	vnxDestroyWindow("Cpaintjob_Rec_3")
	vnxDestroyWindow("Cpaintjob_Rec_4") 
	vnxDestroyWindow("Cpaintjob_Rec_5")
	vnxDestroyWindow("Cpaintjob_Rec_6")
	vnxDestroyWindow("Cpaintjob_Rec_7")
    vnxDestroyWindow("Cpaintjob_Rec_8")
    vnxDestroyWindow("Cpaintjob_Rec_9")
    vnxDestroyWindow("Cpaintjob_Rec_10")
    vnxDestroyWindow("Cpaintjob_Rec_11")

	vnxDestroyWindow("Tuning_button_buy_vinyl")
	vnxDestroyWindow("Paintjob_Image_1")
	vnxDestroyWindow("Paintjob_Image_2")
	vnxDestroyWindow("Paintjob_Image_3")
	vnxDestroyWindow("Paintjob_Image_4")
	vnxDestroyWindow("Paintjob_Image_5")
    vnxDestroyWindow("Tuning_button_seite1")
    vnxDestroyWindow("Tuning_button_seite2")
	vnxDestroyWindow("Tuning_button_vinyl")
	vnxDestroyWindow("CPaintjob_Image_rec")
	vnxDestroyWindow("Cpaintjob_Image_Header")
	removeEventHandler("onClientRender", getRootElement(), show_player_money_tuning)
	removeEventHandler("onClientRender", getRootElement(), cpaintjob_preis_gui)
	vnxDestroyWindow("lackierung_upgrades_main")
	removeEventHandler("onClientRender",getRootElement(),tuningAnsicht)

	if 	engineApplyShaderToWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle(lp) ) then
		engineRemoveShaderFromWorldTexture ( shader_cars, "vehiclegrunge256", getPedOccupiedVehicle(lp) )
		engineRemoveShaderFromWorldTexture(shader_cars, "?emap*", getPedOccupiedVehicle(lp))
	end
	setElementFrozen(getPedOccupiedVehicle(getLocalPlayer()),false)
	toggleControl ( "enter_exit", true )
	showChat(true)
	setPlayerHudComponentVisible( "radar", true )
	triggerEvent( "showSpeedometer", getLocalPlayer())
	--setTimer(setElementData,200,1,getLocalPlayer(),"Clicked",false)
	local veh = getPedOccupiedVehicle(getLocalPlayer())
	--triggerServerEvent("resetVehicleColor",getRootElement(),veh,true)
	triggerServerEvent("setTuningDimension",getRootElement(),veh,0)
	triggerServerEvent("setTuningDimension",getRootElement(),getLocalPlayer(),0)
	setCameraTarget(getLocalPlayer())
    showCursor ( false )
    setPlayerHudComponentVisible ( "radar", true )
	local veh = getPedOccupiedVehicle ( lp )
	for i = 0, 16 do
		removeVehicleUpgrade ( veh, getVehicleUpgradeOnSlot ( veh, i ) )
	end
	setTimer ( function()
			local c1, c2, c3, c4 = getVehicleColor ( veh )
			local paintjob = getVehiclePaintjob ( veh )
			triggerServerEvent ( "CancelTuning", lp, lp, veh, c1, c2, c3, c4, paintjob)
			--triggerServerEvent("CancelTuning",getRootElement(),veh)
	end, 500, 1 )
end

function TuningFarbeZuruecksetzen()
	triggerServerEvent ( "resetcolorcar_func", lp )
	local veh = getPedOccupiedVehicle(getLocalPlayer())
	local colors = getElementData(veh, "spezcolor")
	local c1 = tonumber ( gettok ( colors, 1, string.byte( '|' ) ))
	local c2 = tonumber ( gettok ( colors, 1, string.byte( '|' ) ))
	local c3 = tonumber ( gettok ( colors, 1, string.byte( '|' ) ))
	local c4 = tonumber ( gettok ( colors, 2, string.byte( '|' ) ))
	local c5 = tonumber ( gettok ( colors, 2, string.byte( '|' ) ))
	local c6 = tonumber ( gettok ( colors, 2, string.byte( '|' ) ))
	local c7 = tonumber ( gettok ( colors, 3, string.byte( '|' ) ))
	local c8 = tonumber ( gettok ( colors, 3, string.byte( '|' ) ))
	local c9 = tonumber ( gettok ( colors, 3, string.byte( '|' ) ))
	local c10 = tonumber ( gettok ( colors, 4, string.byte( '|' ) ))
	local c11 = tonumber ( gettok ( colors, 4, string.byte( '|' ) ))
	local c12 = tonumber ( gettok ( colors, 4, string.byte( '|' ) ))
	
	vnxScrollbarSetPosition("Tuning_color","Autofarbe1_1",c1)
	vnxScrollbarSetPosition("Tuning_color","Autofarbe1_2",c2)
	vnxScrollbarSetPosition("Tuning_color","Autofarbe1_3",c3)
	vnxScrollbarSetPosition("Tuning_color","Autofarbe2_1",c4)
	vnxScrollbarSetPosition("Tuning_color","Autofarbe2_2",c5)
	vnxScrollbarSetPosition("Tuning_color","Autofarbe2_3",c6)
	vnxScrollbarSetPosition("Tuning_color","Autofarbe3_1",c7)
	vnxScrollbarSetPosition("Tuning_color","Autofarbe3_2",c8)
	vnxScrollbarSetPosition("Tuning_color","Autofarbe3_3",c9)
	vnxScrollbarSetPosition("Tuning_color","Autofarbe4_1",c10)
	vnxScrollbarSetPosition("Tuning_color","Autofarbe4_2",c11)
	vnxScrollbarSetPosition("Tuning_color","Autofarbe4_3",c12)
end

function TuningFarbeSetzen()
	triggerServerEvent("applyColorValue_func", getLocalPlayer(),math.floor(vnxScrollbarGetPosition("Tuning_color","Autofarbe1_1")), math.floor(vnxScrollbarGetPosition("Tuning_color","Autofarbe1_2")), math.floor(vnxScrollbarGetPosition("Tuning_color","Autofarbe1_3")), math.floor(vnxScrollbarGetPosition("Tuning_color","Autofarbe2_1")), math.floor(vnxScrollbarGetPosition("Tuning_color","Autofarbe2_2")), math.floor(vnxScrollbarGetPosition("Tuning_color","Autofarbe2_3")))
end

function TuningLichtZuruecksetzen()
	local veh = getPedOccupiedVehicle(getLocalPlayer())
	local c1, c2, c3 = getElementData ( veh, "lcolor", lcolor )
	vnxScrollbarSetPosition("Tuning_color","Lichtfarbe_1",c1)
	vnxScrollbarSetPosition("Tuning_color","Lichtfarbe_2",c2)
	vnxScrollbarSetPosition("Tuning_color","Lichtfarbe_3",c3)
	setVehicleHeadLightColor(veh,c1,c2,c3)
	showInfo("Upgrades wurden zurückgesetzt",0,120,0)
end


function TuningPaitjob()
	local curpainting = getVehiclePaintjob ( veh )
	local s = vnxGetGridlistSelectedItem("Tuning_color","Paintjob_Grid")[1]
	if s and (s == 0 or s == 1 or s == 2 or s == 3) then
		triggerServerEvent("saveTuning_Paintjob",lp, s)
		setVehiclePaintjob ( veh, s )
	end
end

function TuningLichtSetzen()
	local c1 = vnxScrollbarGetPosition("Tuning_color","Lichtfarbe_1")
	local c2 = vnxScrollbarGetPosition("Tuning_color","Lichtfarbe_2")
	local c3 = vnxScrollbarGetPosition("Tuning_color","Lichtfarbe_3")
	--triggerServerEvent("saveVehicleLight",getRootElement(),getPedOccupiedVehicle(getLocalPlayer()),c1,c2,c3)
	triggerServerEvent ( "applyLightValues", lp, c1, c2, c3 )
end

