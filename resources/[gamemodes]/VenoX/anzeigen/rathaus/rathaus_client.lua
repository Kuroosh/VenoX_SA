
function rathaus_close()
	vnxDestroyWindow("Rathaus_Window")
	vnxDestroyWindow("Rathaus_Window_Grid")
	vnxDestroyWindow("Rathaus_Button")
	vnxDestroyWindow("License_buy_text_sure")
	vnxDestroyWindow("perso_titel_rathaus")
	vnxDestroyWindow("Rathaus_Button_yes")
	vnxDestroyWindow("Rathaus_Button_no")
	vnxDestroyWindow("countdown_3_vnx")
	vnxDestroyWindow("countdown_2_vnx")
	vnxDestroyWindow("countdown_1_vnx")
	vnxDestroyWindow("Rathaus_Button")
	showCursor(false)
	deleteVnXEvents_rathaus()
end
addEvent ( "deleteWindowsRathaus", true)
addEventHandler ( "deleteWindowsRathaus", getLocalPlayer(),  rathaus_close)

function RathausMenue_New_VnX()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	local Lizensen = {}



	if vnxClientGetElementData ( "perso" ) == 1 then persoExist = "      [ ✔ ]" else persoExist = "      [ ✘ ]" end

	if vnxClientGetElementData ( "carlicense" ) == 1 then carlicenseExist = "      [ ✔ ]" else carlicenseExist = "      [ ✘ ]" end

	if vnxClientGetElementData ( "bikelicense" ) == 1 then bikelicenseExist = "      [ ✔ ]" else bikelicenseExist = "      [ ✘ ]" end

	if vnxClientGetElementData ( "lkwlicense" ) == 1 then lkwlicenseExist = "      [ ✔ ]" else lkwlicenseExist = "      [ ✘ ]" end

	if vnxClientGetElementData ( "planelicensea" ) == 1 then planelicenseaExist = "      [ ✔ ]" else planelicenseaExist = "      [ ✘ ]" end

	if vnxClientGetElementData ( "planelicenseb" ) == 1 then planelicensebExist = "      [ ✔ ]" else planelicensebExist = "      [ ✘ ]" end

	if vnxClientGetElementData ( "helilicense" ) == 1 then helilicenseExist = "      [ ✔ ]" else helilicenseExist = "      [ ✘ ]" end

	if vnxClientGetElementData ( "gunlicense" ) == 1 then gunlicenseExist = "      [ ✔ ]" else gunlicenseExist = "      [ ✘ ]" end

	if vnxClientGetElementData ( "motorbootlicense" ) == 1 then motorbootlicenseExist = "      [ ✔ ]" else motorbootlicenseExist = "      [ ✘ ]" end

	if vnxClientGetElementData ( "segellicense" ) == 1 then segellicenseExist = "      [ ✔ ]" else segellicenseExist = "      [ ✘ ]" end

	if vnxClientGetElementData ( "fishinglicense" ) == 1 then fishinglicenseExist = "      [ ✔ ]" else fishinglicenseExist = "      [ ✘ ]" end


	table.insert(Lizensen, { "", "" })

	table.insert(Lizensen, { "Personalausweis : ", "" ..persoExist })

	table.insert(Lizensen, { "", "" })

    table.insert(Lizensen, { "Fuehrerschein : ", "" ..carlicenseExist })

    table.insert(Lizensen, { "", "" })

    table.insert(Lizensen, { "Motorradschein : ", "" ..bikelicenseExist })

    table.insert(Lizensen, { "", "" })

    table.insert(Lizensen, { "LKW-Fuehrerschein : ", "" ..lkwlicenseExist })

    table.insert(Lizensen, { "", "" })

    table.insert(Lizensen, { "Flugschein A : ", "" ..planelicenseaExist })

    table.insert(Lizensen, { "", "" })

    table.insert(Lizensen, { "Flugschein B : ", "" ..planelicensebExist })

    table.insert(Lizensen, { "", "" })

    table.insert(Lizensen, { "Helikopterschein : ", "" ..helilicenseExist })

    table.insert(Lizensen, { "", "" })

    table.insert(Lizensen, { "Waffenschein : ", "" ..gunlicenseExist })

    table.insert(Lizensen, { "", "" })

    table.insert(Lizensen, { "Motorbootschein : ", "" ..motorbootlicenseExist })

    table.insert(Lizensen, { "", "" })

    table.insert(Lizensen, { "Segelschein : ", "" ..segellicenseExist })

    table.insert(Lizensen, { "", "" })

    table.insert(Lizensen, { "Angelschein : ", "" ..fishinglicenseExist })

    table.insert(Lizensen, { "", "" })


	-----------------------------------------------------------------------------------------------------------------------------------------
	vnxDrawWindow("Rathaus_Window", "Rathaus_Window", "Rathaus San Fierro", sx*385, sy*195, sx*591, sy*350, "rathaus_close") 
	-----------------------------------------------------------------------------------------------------------------------------------------
	vnxDrawGridlist("Rathaus_Window_Grid", "list", sx*385, sy*225, sx*300, sy*300, { { "Lizensen", sx*200 }, { "Vorhanden", sx*120 } } , Lizensen)
	-----------------------------------------------------------------------------------------------------------------------------------------
	vnxDrawButton("Rathaus_Button", "Rathaus_Button", "Kaufen", sx*730, sy*475, sx*205, sy*30, "buy_license_rathaus_vnx")

	-----------------------------------------------------------------------------------------------------------------------------------------
	--vnxDrawText("License_buy_text_sure","Sicher :D ?","Moechtest du diesen Schein kaufen ?", sx*729, sy*284, sx*934, sy*313, tocolor(0, 131, 191, 255), 1, "default", "center", "center")


	--dxDrawText("Moechtest du diesen Schein kaufen ?", 729, 284, 934, 313, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, false, false, false)
    --dxDrawText("Preis : 200.000 $", 729, 335, 934, 364, tocolor(255, 255, 255, 255), 1.00, "default", "center", "top", false, false, false, false, false)
	-----------------------------------------------------------------------------------------------------------------------------------------

end

addEvent ( "Rathaus_Window", true)
addEventHandler ( "Rathaus_Window", getLocalPlayer(),  RathausMenue_New_VnX)

-----------------------------------------------------------------------------------------------------------------------------------------
local function DrawBigPersoVnX()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	dxDrawText("Personalausweis",  sx*684, sy*226, sx*975, sy*284, tocolor(255, 255, 255, 255), 1.40, "pricedown", "center", "top", false, false, false, false, false)
	dxDrawText("Preis : 450 $", sx*683, sy*405, sx*976, sy*455, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "center", "center", false, false, false, false, false)
	dxDrawRectangle(sx*683, sy*402, sx*293, sy*3, tocolor(0, 105, 145, 255), false)
	dxDrawRectangle(sx*683, sy*455, sx*293, sy*3, tocolor(0, 105, 145, 255), false)
end
-----------------------------------------------------------------------------------------------------------------------------------------
local function DrawBigFuehrerscheinVnX()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	dxDrawText("   Fuehrerschein", sx*684, sy*226, sx*975, sy*284, tocolor(255, 255, 255, 255), 1.40, "pricedown", "center", "top", false, false, false, false, false)
	dxDrawText("Preis : 10.500 $", sx*683, sy*405, sx*976, sy*455, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "center", "center", false, false, false, false, false)
	dxDrawRectangle(sx*683, sy*402, sx*293, sy*3, tocolor(0, 105, 145, 255), false)
	dxDrawRectangle(sx*683, sy*455, sx*293, sy*3, tocolor(0, 105, 145, 255), false)
end
-----------------------------------------------------------------------------------------------------------------------------------------
local function DrawBigMotorradscheinVnX()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	dxDrawText("Motorradschein", sx*684, sy*226, sx*975, sy*284, tocolor(255, 255, 255, 255), 1.40, "pricedown", "center", "top", false, false, false, false, false)
	dxDrawText("Preis : 6.750 $", sx*683, sy*405, sx*976, sy*455, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "center", "center", false, false, false, false, false)
	dxDrawRectangle(sx*683, sy*402, sx*293, sy*3, tocolor(0, 105, 145, 255), false)
	dxDrawRectangle(sx*683, sy*455, sx*293, sy*3, tocolor(0, 105, 145, 255), false)
end
-----------------------------------------------------------------------------------------------------------------------------------------
local function DrawBigLKWFuehrerscheinVnX()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	dxDrawText("LKW-Fuehrerschein", sx*684, sy*226, sx*975, sy*284, tocolor(255, 255, 255, 255), 1.40, "pricedown", "center", "top", false, false, false, false, false)
	dxDrawText("Preis : 8.450 $", sx*683, sy*405, sx*976, sy*455, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "center", "center", false, false, false, false, false)
	dxDrawRectangle(sx*683, sy*402, sx*293, sy*3, tocolor(0, 105, 145, 255), false)
	dxDrawRectangle(sx*683, sy*455, sx*293, sy*3, tocolor(0, 105, 145, 255), false)
end
-----------------------------------------------------------------------------------------------------------------------------------------
local function DrawBigFlugscheinAVnX()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	dxDrawText("Flugschein A", sx*684, sy*226, sx*975, sy*284, tocolor(255, 255, 255, 255), 1.40, "pricedown", "center", "top", false, false, false, false, false)
	dxDrawText("Preis : 31.850 $", sx*683, sy*405, sx*976, sy*455, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "center", "center", false, false, false, false, false)
	dxDrawRectangle(sx*683, sy*402, sx*293, sy*3, tocolor(0, 105, 145, 255), false)
	dxDrawRectangle(sx*683, sy*455, sx*293, sy*3, tocolor(0, 105, 145, 255), false)
end
-----------------------------------------------------------------------------------------------------------------------------------------
local function DrawBigFlugscheinBVnX()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	dxDrawText("Flugschein B", sx*684, sy*226, sx*975, sy*284, tocolor(255, 255, 255, 255), 1.40, "pricedown", "center", "top", false, false, false, false, false)
	dxDrawText("Preis : 53.250 $", sx*683, sy*405, sx*976, sy*455, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "center", "center", false, false, false, false, false)
	dxDrawRectangle(sx*683, sy*402, sx*293, sy*3, tocolor(0, 105, 145, 255), false)
	dxDrawRectangle(sx*683, sy*455, sx*293, sy*3, tocolor(0, 105, 145, 255), false)
end
-----------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------
local function DrawBigHelikopterscheinBVnX()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	dxDrawText("Helikopterschein ", sx*684, sy*226, sx*975, sy*284, tocolor(255, 255, 255, 255), 1.40, "pricedown", "center", "top", false, false, false, false, false)
	dxDrawText("Preis : 23.920 $", sx*683, sy*405, sx*976, sy*455, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "center", "center", false, false, false, false, false)
	dxDrawRectangle(sx*683, sy*402, sx*293, sy*3, tocolor(0, 105, 145, 255), false)
	dxDrawRectangle(sx*683, sy*455, sx*293, sy*3, tocolor(0, 105, 145, 255), false)
end
-----------------------------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------------------------------------
local function DrawBigWaffenscheinVnX()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	dxDrawText("Waffenschein", sx*684, sy*226, sx*975, sy*284, tocolor(255, 255, 255, 255), 1.40, "pricedown", "center", "top", false, false, false, false, false)
	dxDrawText("Preis : 27.450 $", sx*683, sy*405, sx*976, sy*455, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "center", "center", false, false, false, false, false)
	dxDrawRectangle(sx*683, sy*402, sx*293, sy*3, tocolor(0, 105, 145, 255), false)
	dxDrawRectangle(sx*683, sy*455, sx*293, sy*3, tocolor(0, 105, 145, 255), false)
end
-----------------------------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------------------------------------
local function DrawBigMotorbootscheinBVnX()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	dxDrawText("Motorbootschein", sx*684, sy*226, sx*975, sy*284, tocolor(255, 255, 255, 255), 1.40, "pricedown", "center", "top", false, false, false, false, false)
	dxDrawText("Preis : 4.250 $", sx*683, sy*405, sx*976, sy*455, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "center", "center", false, false, false, false, false)
	dxDrawRectangle(sx*683, sy*402, sx*293, sy*3, tocolor(0, 105, 145, 255), false)
	dxDrawRectangle(sx*683, sy*455, sx*293, sy*3, tocolor(0, 105, 145, 255), false)
end
-----------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------
local function DrawBigSegelscheinVnX()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	dxDrawText("Segelschein", sx*684, sy*226, sx*975, sy*284, tocolor(255, 255, 255, 255), 1.40, "pricedown", "center", "top", false, false, false, false, false)
	dxDrawText("Preis : 3.520 $", sx*683, sy*405, sx*976, sy*455, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "center", "center", false, false, false, false, false)
	dxDrawRectangle(sx*683, sy*402, sx*293, sy*3, tocolor(0, 105, 145, 255), false)
	dxDrawRectangle(sx*683, sy*455, sx*293, sy*3, tocolor(0, 105, 145, 255), false)
end
-----------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------
local function DrawBigAngelscheinVnX()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	dxDrawText("Angelschein", sx*684, sy*226, sx*975, sy*284, tocolor(255, 255, 255, 255), 1.40, "pricedown", "center", "top", false, false, false, false, false)
	dxDrawText("Preis : 850 $", sx*683, sy*405, sx*976, sy*455, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "center", "center", false, false, false, false, false)
	dxDrawRectangle(sx*683, sy*402, sx*293, sy*3, tocolor(0, 105, 145, 255), false)
	dxDrawRectangle(sx*683, sy*455, sx*293, sy*3, tocolor(0, 105, 145, 255), false)
end
-----------------------------------------------------------------------------------------------------------------------------------------





function buy_license_rathaus_vnx()
	local screenX, screenY = guiGetScreenSize()
	local sx, sy = screenX/1366, screenY/768
	local LicenseSelected_rathaus_vnx = vnxGetGridlistSelectedItem( "Rathaus_Window_Grid", "list")[1]
	if LicenseSelected_rathaus_vnx then
		outputDebugString( ""..LicenseSelected_rathaus_vnx)
		if LicenseSelected_rathaus_vnx == "Personalausweis : " then
			license = "perso"


			setTimer ( function()
				vnxDestroyWindow("countdown_1_vnx")
				vnxDestroyWindow("countdown_2_vnx")
				vnxDestroyWindow("Rathaus_Button")
				vnxDrawText("countdown_3_vnx","justASimpleTimer"," 3 ...",  sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				showCountDown2SekRathaus()
			end, 400, 1 )
			function showCountDown2SekRathaus()
				setTimer ( function()
				outputDebugString( "2" )
				vnxDestroyWindow("countdown_3_vnx")
				vnxDrawText("countdown_2_vnx","justASimpleTimer"," 2 ...", sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				showCountDown1SekRathaus()

				end, 1600, 1 )
			end
			function showCountDown1SekRathaus()
				setTimer ( function()
				vnxDrawText("countdown_1_vnx","justASimpleTimer"," 1 ...", sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				outputDebugString( "1" )
				vnxDestroyWindow("countdown_3_vnx")
				vnxDestroyWindow("countdown_2_vnx")
				vnxDestroyWindow("Rathaus_Button")
				ShowCountDownLastRathaus()
				end, 2000, 1 )
			end
-------------------------------------------------------------------------------------------------------------------------------------------------------
			function ShowCountDownLastRathaus()
				setTimer ( function()
				vnxDestroyWindow("countdown_1_vnx")
				vnxDestroyWindow("Rathaus_Button")
				vnxDrawButton("Rathaus_Button_yes", "Rathaus_Button", "Ja", sx*730, sy*475, sx*100, sy*30, "Fuehrerschein_Buy_Rathaus")
				vnxDrawButton("Rathaus_Button_no", "Rathaus_Button", "Nein", sx*840, sy*475, sx*100, sy*30, "License_Cancel")
				end, 1000, 1)
			end

			function License_Cancel()
				vnxDestroyWindow("Rathaus_Button_no")
				vnxDestroyWindow("Rathaus_Button_yes")
				vnxDrawButton("Rathaus_Button", "Rathaus_Button", "Kaufen", sx*730, sy*475, sx*205, sy*30, "buy_license_rathaus_vnx")
			end
-------------------------------------------------------------------------------------------------------------------------------------------------------
			--vnxDrawText("countdown_3_vnx","justASimpleTimer"," 3 ...", sx*729, sy*335, sx*934, sy*364, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)

			vnxDrawText("License_buy_text_sure","Sicher :D ?","      Möchtest du diesen Schein \n          Kaufen ?", sx*695, sy*284, sx*290, sy*49, tocolor(255, 255, 255, 255), 1, "default", "center", "center")
			addEventHandler("onClientRender", root, DrawBigPersoVnX)

		

			removeEventHandler("onClientRender", root, DrawBigMotorbootscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigSegelscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigAngelscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigHelikopterscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigWaffenscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigFlugscheinAVnX)
			removeEventHandler("onClientRender", root, DrawBigFlugscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigLKWFuehrerscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigFuehrerscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigMotorradscheinVnX)
		elseif LicenseSelected_rathaus_vnx == "Fuehrerschein : " then
			vnxDrawText("License_buy_text_sure","Sicher :D ?","      Möchtest du diesen Schein \n          Kaufen ?", sx*695, sy*284, sx*290, sy*49, tocolor(255, 255, 255, 255), 1, "default", "center", "center")
			addEventHandler("onClientRender", root, DrawBigFuehrerscheinVnX)

			removeEventHandler("onClientRender", root, DrawBigMotorbootscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigSegelscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigAngelscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigHelikopterscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigWaffenscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigFlugscheinAVnX)
			removeEventHandler("onClientRender", root, DrawBigFlugscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigLKWFuehrerscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigPersoVnX)
			removeEventHandler("onClientRender", root, DrawBigMotorradscheinVnX)

			license = "car"


			setTimer ( function()
				vnxDestroyWindow("countdown_1_vnx")
				vnxDestroyWindow("countdown_2_vnx")
				vnxDestroyWindow("Rathaus_Button")
				vnxDrawText("countdown_3_vnx","justASimpleTimer"," 3 ...",  sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				showCountDown2SekRathaus()
			end, 400, 1 )
			function showCountDown2SekRathaus()
				setTimer ( function()
				outputDebugString( "2" )
				vnxDestroyWindow("countdown_3_vnx")
				vnxDrawText("countdown_2_vnx","justASimpleTimer"," 2 ...", sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				showCountDown1SekRathaus()

				end, 1600, 1 )
			end
			function showCountDown1SekRathaus()
				setTimer ( function()
				vnxDrawText("countdown_1_vnx","justASimpleTimer"," 1 ...", sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				outputDebugString( "1" )
				vnxDestroyWindow("countdown_3_vnx")
				vnxDestroyWindow("countdown_2_vnx")
				vnxDestroyWindow("Rathaus_Button")
				ShowCountDownLastRathaus()
				end, 2000, 1 )
			end
-------------------------------------------------------------------------------------------------------------------------------------------------------
			function ShowCountDownLastRathaus()
				setTimer ( function()
				vnxDestroyWindow("countdown_1_vnx")
				vnxDestroyWindow("Rathaus_Button")
				vnxDrawButton("Rathaus_Button_yes", "Rathaus_Button", "Ja", sx*730, sy*475, sx*100, sy*30, "Fuehrerschein_Buy_Rathaus")
				vnxDrawButton("Rathaus_Button_no", "Rathaus_Button", "Nein", sx*840, sy*475, sx*100, sy*30, "License_Cancel")
				end, 1000, 1)
			end

			function License_Cancel()
				vnxDestroyWindow("Rathaus_Button_no")
				vnxDestroyWindow("Rathaus_Button_yes")
				vnxDrawButton("Rathaus_Button", "Rathaus_Button", "Kaufen", sx*730, sy*475, sx*205, sy*30, "buy_license_rathaus_vnx")
			end
-------------------------------------------------------------------------------------------------------------------------------------------------------
		elseif LicenseSelected_rathaus_vnx == "Motorradschein : " then
			vnxDrawText("License_buy_text_sure","Sicher :D ?","      Möchtest du diesen Schein \n          Kaufen ?", sx*695, sy*284, sx*290, sy*49, tocolor(255, 255, 255, 255), 1, "default", "center", "center")
			addEventHandler("onClientRender", root, DrawBigMotorradscheinVnX)

			removeEventHandler("onClientRender", root, DrawBigMotorbootscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigSegelscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigAngelscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigHelikopterscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigWaffenscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigFlugscheinAVnX)
			removeEventHandler("onClientRender", root, DrawBigFlugscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigLKWFuehrerscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigFuehrerscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigPersoVnX)
			license = "bike"


			setTimer ( function()
				vnxDestroyWindow("countdown_1_vnx")
				vnxDestroyWindow("countdown_2_vnx")
				vnxDestroyWindow("Rathaus_Button")
				vnxDrawText("countdown_3_vnx","justASimpleTimer"," 3 ...",  sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				showCountDown2SekRathaus()
			end, 400, 1 )
			function showCountDown2SekRathaus()
				setTimer ( function()
				outputDebugString( "2" )
				vnxDestroyWindow("countdown_3_vnx")
				vnxDrawText("countdown_2_vnx","justASimpleTimer"," 2 ...", sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				showCountDown1SekRathaus()

				end, 1600, 1 )
			end
			function showCountDown1SekRathaus()
				setTimer ( function()
				vnxDrawText("countdown_1_vnx","justASimpleTimer"," 1 ...", sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				outputDebugString( "1" )
				vnxDestroyWindow("countdown_3_vnx")
				vnxDestroyWindow("countdown_2_vnx")
				vnxDestroyWindow("Rathaus_Button")
				ShowCountDownLastRathaus()
				end, 2000, 1 )
			end
-------------------------------------------------------------------------------------------------------------------------------------------------------
			function ShowCountDownLastRathaus()
				setTimer ( function()
				vnxDestroyWindow("countdown_1_vnx")
				vnxDestroyWindow("Rathaus_Button")
				vnxDrawButton("Rathaus_Button_yes", "Rathaus_Button", "Ja", sx*730, sy*475, sx*100, sy*30, "Fuehrerschein_Buy_Rathaus")
				vnxDrawButton("Rathaus_Button_no", "Rathaus_Button", "Nein", sx*840, sy*475, sx*100, sy*30, "License_Cancel")
				end, 1000, 1)
			end

			function License_Cancel()
				vnxDestroyWindow("Rathaus_Button_no")
				vnxDestroyWindow("Rathaus_Button_yes")
				vnxDrawButton("Rathaus_Button", "Rathaus_Button", "Kaufen", sx*730, sy*475, sx*205, sy*30, "buy_license_rathaus_vnx")
			end
-------------------------------------------------------------------------------------------------------------------------------------------------------

		elseif LicenseSelected_rathaus_vnx == "LKW-Fuehrerschein : " then

			vnxDrawText("License_buy_text_sure","Sicher :D ?","      Möchtest du diesen Schein \n          Kaufen ?", sx*695, sy*284, sx*290, sy*49, tocolor(255, 255, 255, 255), 1, "default", "center", "center")
			addEventHandler("onClientRender", root, DrawBigLKWFuehrerscheinVnX)


			removeEventHandler("onClientRender", root, DrawBigMotorbootscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigSegelscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigAngelscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigHelikopterscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigWaffenscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigFlugscheinAVnX)
			removeEventHandler("onClientRender", root, DrawBigFlugscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigFuehrerscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigPersoVnX)
			removeEventHandler("onClientRender", root, DrawBigMotorradscheinVnX)
			license = "lkw"


			setTimer ( function()
				vnxDestroyWindow("countdown_1_vnx")
				vnxDestroyWindow("countdown_2_vnx")
				vnxDestroyWindow("Rathaus_Button")
				vnxDrawText("countdown_3_vnx","justASimpleTimer"," 3 ...",  sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				showCountDown2SekRathaus()
			end, 400, 1 )
			function showCountDown2SekRathaus()
				setTimer ( function()
				outputDebugString( "2" )
				vnxDestroyWindow("countdown_3_vnx")
				vnxDrawText("countdown_2_vnx","justASimpleTimer"," 2 ...", sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				showCountDown1SekRathaus()

				end, 1600, 1 )
			end
			function showCountDown1SekRathaus()
				setTimer ( function()
				vnxDrawText("countdown_1_vnx","justASimpleTimer"," 1 ...", sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				outputDebugString( "1" )
				vnxDestroyWindow("countdown_3_vnx")
				vnxDestroyWindow("countdown_2_vnx")
				vnxDestroyWindow("Rathaus_Button")
				ShowCountDownLastRathaus()
				end, 2000, 1 )
			end
-------------------------------------------------------------------------------------------------------------------------------------------------------
			function ShowCountDownLastRathaus()
				setTimer ( function()
				vnxDestroyWindow("countdown_1_vnx")
				vnxDestroyWindow("Rathaus_Button")
				vnxDrawButton("Rathaus_Button_yes", "Rathaus_Button", "Ja", sx*730, sy*475, sx*100, sy*30, "Fuehrerschein_Buy_Rathaus")
				vnxDrawButton("Rathaus_Button_no", "Rathaus_Button", "Nein", sx*840, sy*475, sx*100, sy*30, "License_Cancel")
				end, 1000, 1)
			end

			function License_Cancel()
				vnxDestroyWindow("Rathaus_Button_no")
				vnxDestroyWindow("Rathaus_Button_yes")
				vnxDrawButton("Rathaus_Button", "Rathaus_Button", "Kaufen", sx*730, sy*475, sx*205, sy*30, "buy_license_rathaus_vnx")
			end
-------------------------------------------------------------------------------------------------------------------------------------------------------


		elseif LicenseSelected_rathaus_vnx == "Flugschein A : " then
			vnxDrawText("License_buy_text_sure","Sicher :D ?","      Möchtest du diesen Schein \n          Kaufen ?", sx*695, sy*284, sx*290, sy*49, tocolor(255, 255, 255, 255), 1, "default", "center", "center")
			addEventHandler("onClientRender", root, DrawBigFlugscheinAVnX)

			removeEventHandler("onClientRender", root, DrawBigMotorbootscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigSegelscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigAngelscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigHelikopterscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigWaffenscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigFlugscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigLKWFuehrerscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigFuehrerscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigPersoVnX)
			removeEventHandler("onClientRender", root, DrawBigMotorradscheinVnX)

			license = "planea"


			setTimer ( function()
				vnxDestroyWindow("countdown_1_vnx")
				vnxDestroyWindow("countdown_2_vnx")
				vnxDestroyWindow("Rathaus_Button")
				vnxDrawText("countdown_3_vnx","justASimpleTimer"," 3 ...",  sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				showCountDown2SekRathaus()
			end, 400, 1 )
			function showCountDown2SekRathaus()
				setTimer ( function()
				outputDebugString( "2" )
				vnxDestroyWindow("countdown_3_vnx")
				vnxDrawText("countdown_2_vnx","justASimpleTimer"," 2 ...", sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				showCountDown1SekRathaus()

				end, 1600, 1 )
			end
			function showCountDown1SekRathaus()
				setTimer ( function()
				vnxDrawText("countdown_1_vnx","justASimpleTimer"," 1 ...", sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				outputDebugString( "1" )
				vnxDestroyWindow("countdown_3_vnx")
				vnxDestroyWindow("countdown_2_vnx")
				vnxDestroyWindow("Rathaus_Button")
				ShowCountDownLastRathaus()
				end, 2000, 1 )
			end
-------------------------------------------------------------------------------------------------------------------------------------------------------
			function ShowCountDownLastRathaus()
				setTimer ( function()
				vnxDestroyWindow("countdown_1_vnx")
				vnxDestroyWindow("Rathaus_Button")
				vnxDrawButton("Rathaus_Button_yes", "Rathaus_Button", "Ja", sx*730, sy*475, sx*100, sy*30, "Fuehrerschein_Buy_Rathaus")
				vnxDrawButton("Rathaus_Button_no", "Rathaus_Button", "Nein", sx*840, sy*475, sx*100, sy*30, "License_Cancel")
				end, 1000, 1)
			end

			function License_Cancel()
				vnxDestroyWindow("Rathaus_Button_no")
				vnxDestroyWindow("Rathaus_Button_yes")
				vnxDrawButton("Rathaus_Button", "Rathaus_Button", "Kaufen", sx*730, sy*475, sx*205, sy*30, "buy_license_rathaus_vnx")
			end
-------------------------------------------------------------------------------------------------------------------------------------------------------


		elseif LicenseSelected_rathaus_vnx == "Flugschein B : " then
			vnxDrawText("License_buy_text_sure","Sicher :D ?","      Möchtest du diesen Schein \n          Kaufen ?", sx*695, sy*284, sx*290, sy*49, tocolor(255, 255, 255, 255), 1, "default", "center", "center")
			addEventHandler("onClientRender", root, DrawBigFlugscheinBVnX)

			removeEventHandler("onClientRender", root, DrawBigMotorbootscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigSegelscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigAngelscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigHelikopterscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigWaffenscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigFlugscheinAVnX)
			removeEventHandler("onClientRender", root, DrawBigLKWFuehrerscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigFuehrerscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigPersoVnX)
			removeEventHandler("onClientRender", root, DrawBigMotorradscheinVnX)

			license = "planeb"


			setTimer ( function()
				vnxDestroyWindow("countdown_1_vnx")
				vnxDestroyWindow("countdown_2_vnx")
				vnxDestroyWindow("Rathaus_Button")
				vnxDrawText("countdown_3_vnx","justASimpleTimer"," 3 ...",  sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				showCountDown2SekRathaus()
			end, 400, 1 )
			function showCountDown2SekRathaus()
				setTimer ( function()
				outputDebugString( "2" )
				vnxDestroyWindow("countdown_3_vnx")
				vnxDrawText("countdown_2_vnx","justASimpleTimer"," 2 ...", sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				showCountDown1SekRathaus()

				end, 1600, 1 )
			end
			function showCountDown1SekRathaus()
				setTimer ( function()
				vnxDrawText("countdown_1_vnx","justASimpleTimer"," 1 ...", sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				outputDebugString( "1" )
				vnxDestroyWindow("countdown_3_vnx")
				vnxDestroyWindow("countdown_2_vnx")
				vnxDestroyWindow("Rathaus_Button")
				ShowCountDownLastRathaus()
				end, 2000, 1 )
			end
-------------------------------------------------------------------------------------------------------------------------------------------------------
			function ShowCountDownLastRathaus()
				setTimer ( function()
				vnxDestroyWindow("countdown_1_vnx")
				vnxDestroyWindow("Rathaus_Button")
				vnxDrawButton("Rathaus_Button_yes", "Rathaus_Button", "Ja", sx*730, sy*475, sx*100, sy*30, "Fuehrerschein_Buy_Rathaus")
				vnxDrawButton("Rathaus_Button_no", "Rathaus_Button", "Nein", sx*840, sy*475, sx*100, sy*30, "License_Cancel")
				end, 1000, 1)
			end

			function License_Cancel()
				vnxDestroyWindow("Rathaus_Button_no")
				vnxDestroyWindow("Rathaus_Button_yes")
				vnxDrawButton("Rathaus_Button", "Rathaus_Button", "Kaufen", sx*730, sy*475, sx*205, sy*30, "buy_license_rathaus_vnx")
			end
-------------------------------------------------------------------------------------------------------------------------------------------------------


		elseif LicenseSelected_rathaus_vnx == "Waffenschein : " then 

			vnxDrawText("License_buy_text_sure","Sicher :D ?","      Möchtest du diesen Schein \n          Kaufen ?", sx*695, sy*284, sx*290, sy*49, tocolor(255, 255, 255, 255), 1, "default", "center", "center")

			license = "wschein"
			setTimer ( function()
				vnxDestroyWindow("countdown_1_vnx")
				vnxDestroyWindow("countdown_2_vnx")
				vnxDestroyWindow("Rathaus_Button")
				vnxDrawText("countdown_3_vnx","justASimpleTimer"," 3 ...",  sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				showCountDown2SekRathaus()
			end, 400, 1 )
			function showCountDown2SekRathaus()
				setTimer ( function()
				outputDebugString( "2" )
				vnxDestroyWindow("countdown_3_vnx")
				vnxDrawText("countdown_2_vnx","justASimpleTimer"," 2 ...", sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				showCountDown1SekRathaus()

				end, 1600, 1 )
			end
			function showCountDown1SekRathaus()
				setTimer ( function()
				vnxDrawText("countdown_1_vnx","justASimpleTimer"," 1 ...", sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				outputDebugString( "1" )
				vnxDestroyWindow("countdown_3_vnx")
				vnxDestroyWindow("countdown_2_vnx")
				ShowCountDownLastRathaus()
				end, 2000, 1 )
			end
-------------------------------------------------------------------------------------------------------------------------------------------------------
			function ShowCountDownLastRathaus()
				setTimer ( function()
				vnxDestroyWindow("countdown_1_vnx")
				vnxDestroyWindow("Rathaus_Button")
				vnxDestroyWindow("Rathaus_Button")
				vnxDrawButton("Rathaus_Button_yes", "Rathaus_Button", "Ja", sx*730, sy*475, sx*100, sy*30, "Fuehrerschein_Buy_Rathaus")
				vnxDrawButton("Rathaus_Button_no", "Rathaus_Button", "Nein", sx*840, sy*475, sx*100, sy*30, "License_Cancel")
				end, 1000, 1)
			end

			function License_Cancel()
				vnxDestroyWindow("Rathaus_Button_no")
				vnxDestroyWindow("Rathaus_Button_yes")
				vnxDrawButton("Rathaus_Button", "Rathaus_Button", "Kaufen", sx*730, sy*475, sx*205, sy*30, "buy_license_rathaus_vnx")
			end
-------------------------------------------------------------------------------------------------------------------------------------------------------
			addEventHandler("onClientRender", root, DrawBigWaffenscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigMotorbootscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigSegelscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigAngelscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigHelikopterscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigFlugscheinAVnX)
			removeEventHandler("onClientRender", root, DrawBigFlugscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigLKWFuehrerscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigFuehrerscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigPersoVnX)
			removeEventHandler("onClientRender", root, DrawBigMotorradscheinVnX)
		elseif LicenseSelected_rathaus_vnx == "Helikopterschein : " then 

			vnxDrawText("License_buy_text_sure","Sicher :D ?","      Möchtest du diesen Schein \n          Kaufen ?", sx*695, sy*284, sx*290, sy*49, tocolor(255, 255, 255, 255), 1, "default", "center", "center")

			license = "heli"
			setTimer ( function()
				vnxDestroyWindow("countdown_1_vnx")
				vnxDestroyWindow("countdown_2_vnx")
				vnxDestroyWindow("Rathaus_Button")
				vnxDrawText("countdown_3_vnx","justASimpleTimer"," 3 ...",  sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				showCountDown2SekRathaus()
			end, 400, 1 )
			function showCountDown2SekRathaus()
				setTimer ( function()
				outputDebugString( "2" )
				vnxDestroyWindow("countdown_3_vnx")
				vnxDrawText("countdown_2_vnx","justASimpleTimer"," 2 ...", sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				showCountDown1SekRathaus()

				end, 1600, 1 )
			end
			function showCountDown1SekRathaus()
				setTimer ( function()
				vnxDrawText("countdown_1_vnx","justASimpleTimer"," 1 ...", sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				outputDebugString( "1" )
				vnxDestroyWindow("countdown_3_vnx")
				vnxDestroyWindow("countdown_2_vnx")
				ShowCountDownLastRathaus()
				end, 2000, 1 )
			end
-------------------------------------------------------------------------------------------------------------------------------------------------------
			function ShowCountDownLastRathaus()
				setTimer ( function()
				vnxDestroyWindow("countdown_1_vnx")
				vnxDestroyWindow("Rathaus_Button")
				vnxDestroyWindow("Rathaus_Button")
				vnxDrawButton("Rathaus_Button_yes", "Rathaus_Button", "Ja", sx*730, sy*475, sx*100, sy*30, "Fuehrerschein_Buy_Rathaus")
				vnxDrawButton("Rathaus_Button_no", "Rathaus_Button", "Nein", sx*840, sy*475, sx*100, sy*30, "License_Cancel")
				end, 1000, 1)
			end

			function License_Cancel()
				vnxDestroyWindow("Rathaus_Button_no")
				vnxDestroyWindow("Rathaus_Button_yes")
				vnxDrawButton("Rathaus_Button", "Rathaus_Button", "Kaufen", sx*730, sy*475, sx*205, sy*30, "buy_license_rathaus_vnx")
			end
-------------------------------------------------------------------------------------------------------------------------------------------------------


			addEventHandler("onClientRender", root, DrawBigHelikopterscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigMotorbootscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigSegelscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigAngelscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigWaffenscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigFlugscheinAVnX)
			removeEventHandler("onClientRender", root, DrawBigFlugscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigLKWFuehrerscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigFuehrerscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigPersoVnX)
			removeEventHandler("onClientRender", root, DrawBigMotorradscheinVnX)

		elseif LicenseSelected_rathaus_vnx == "Motorbootschein : " then

			vnxDrawText("License_buy_text_sure","Sicher :D ?","      Möchtest du diesen Schein \n          Kaufen ?", sx*695, sy*284, sx*290, sy*49, tocolor(255, 255, 255, 255), 1, "default", "center", "center")

			license = "motorboot"
			setTimer ( function()
				vnxDestroyWindow("countdown_1_vnx")
				vnxDestroyWindow("countdown_2_vnx")
				vnxDestroyWindow("Rathaus_Button")
				vnxDrawText("countdown_3_vnx","justASimpleTimer"," 3 ...",  sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				showCountDown2SekRathaus()
			end, 400, 1 )
			function showCountDown2SekRathaus()
				setTimer ( function()
				outputDebugString( "2" )
				vnxDestroyWindow("countdown_3_vnx")
				vnxDrawText("countdown_2_vnx","justASimpleTimer"," 2 ...", sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				showCountDown1SekRathaus()

				end, 1600, 1 )
			end
			function showCountDown1SekRathaus()
				setTimer ( function()
				vnxDrawText("countdown_1_vnx","justASimpleTimer"," 1 ...", sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				outputDebugString( "1" )
				vnxDestroyWindow("countdown_3_vnx")
				vnxDestroyWindow("countdown_2_vnx")
				ShowCountDownLastRathaus()
				end, 2000, 1 )
			end
-------------------------------------------------------------------------------------------------------------------------------------------------------
			function ShowCountDownLastRathaus()
				setTimer ( function()
				vnxDestroyWindow("countdown_1_vnx")
				vnxDestroyWindow("Rathaus_Button")
				vnxDestroyWindow("Rathaus_Button")
				vnxDrawButton("Rathaus_Button_yes", "Rathaus_Button", "Ja", sx*730, sy*475, sx*100, sy*30, "Fuehrerschein_Buy_Rathaus")
				vnxDrawButton("Rathaus_Button_no", "Rathaus_Button", "Nein", sx*840, sy*475, sx*100, sy*30, "License_Cancel")
				end, 1000, 1)
			end

			function License_Cancel()
				vnxDestroyWindow("Rathaus_Button_no")
				vnxDestroyWindow("Rathaus_Button_yes")
				vnxDrawButton("Rathaus_Button", "Rathaus_Button", "Kaufen", sx*730, sy*475, sx*205, sy*30, "buy_license_rathaus_vnx")
			end
-------------------------------------------------------------------------------------------------------------------------------------------------------


			addEventHandler("onClientRender", root, DrawBigMotorbootscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigSegelscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigAngelscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigHelikopterscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigWaffenscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigFlugscheinAVnX)
			removeEventHandler("onClientRender", root, DrawBigFlugscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigLKWFuehrerscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigFuehrerscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigPersoVnX)
			removeEventHandler("onClientRender", root, DrawBigMotorradscheinVnX)
		elseif LicenseSelected_rathaus_vnx == "Segelschein : " then
			vnxDrawText("License_buy_text_sure","Sicher :D ?","      Möchtest du diesen Schein \n          Kaufen ?", sx*695, sy*284, sx*290, sy*49, tocolor(255, 255, 255, 255), 1, "default", "center", "center")

			license = "raft"
			setTimer ( function()
				vnxDestroyWindow("countdown_1_vnx")
				vnxDestroyWindow("countdown_2_vnx")
				vnxDestroyWindow("Rathaus_Button")
				vnxDrawText("countdown_3_vnx","justASimpleTimer"," 3 ...",  sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				showCountDown2SekRathaus()
			end, 400, 1 )
			function showCountDown2SekRathaus()
				setTimer ( function()
				outputDebugString( "2" )
				vnxDestroyWindow("countdown_3_vnx")
				vnxDrawText("countdown_2_vnx","justASimpleTimer"," 2 ...", sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				showCountDown1SekRathaus()

				end, 1600, 1 )
			end
			function showCountDown1SekRathaus()
				setTimer ( function()
				vnxDrawText("countdown_1_vnx","justASimpleTimer"," 1 ...", sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				outputDebugString( "1" )
				vnxDestroyWindow("countdown_3_vnx")
				vnxDestroyWindow("countdown_2_vnx")
				ShowCountDownLastRathaus()
				end, 2000, 1 )
			end
-------------------------------------------------------------------------------------------------------------------------------------------------------
			function ShowCountDownLastRathaus()
				setTimer ( function()
				vnxDestroyWindow("countdown_1_vnx")
				vnxDestroyWindow("Rathaus_Button")
				vnxDestroyWindow("Rathaus_Button")
				vnxDrawButton("Rathaus_Button_yes", "Rathaus_Button", "Ja", sx*730, sy*475, sx*100, sy*30, "Fuehrerschein_Buy_Rathaus")
				vnxDrawButton("Rathaus_Button_no", "Rathaus_Button", "Nein", sx*840, sy*475, sx*100, sy*30, "License_Cancel")
				end, 1000, 1)
			end

			function License_Cancel()
				vnxDestroyWindow("Rathaus_Button_no")
				vnxDestroyWindow("Rathaus_Button_yes")
				vnxDrawButton("Rathaus_Button", "Rathaus_Button", "Kaufen", sx*730, sy*475, sx*205, sy*30, "buy_license_rathaus_vnx")
			
			end
			addEventHandler("onClientRender", root, DrawBigSegelscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigMotorbootscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigAngelscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigHelikopterscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigWaffenscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigFlugscheinAVnX)
			removeEventHandler("onClientRender", root, DrawBigFlugscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigLKWFuehrerscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigFuehrerscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigPersoVnX)
			removeEventHandler("onClientRender", root, DrawBigMotorradscheinVnX)
-------------------------------------------------------------------------------------------------------------------------------------------------------

		elseif LicenseSelected_rathaus_vnx == "Angelschein : " then
			vnxDrawText("License_buy_text_sure","Sicher :D ?","      Möchtest du diesen Schein \n          Kaufen ?", sx*695, sy*284, sx*290, sy*49, tocolor(255, 255, 255, 255), 1, "default", "center", "center")

			license = "fishing"
			setTimer ( function()
				vnxDestroyWindow("countdown_1_vnx")
				vnxDestroyWindow("countdown_2_vnx")
				vnxDestroyWindow("Rathaus_Button")
				vnxDrawText("countdown_3_vnx","justASimpleTimer"," 3 ...",  sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				showCountDown2SekRathaus()
			end, 400, 1 )
			function showCountDown2SekRathaus()
				setTimer ( function()
				outputDebugString( "2" )
				vnxDestroyWindow("countdown_3_vnx")
				vnxDrawText("countdown_2_vnx","justASimpleTimer"," 2 ...", sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				showCountDown1SekRathaus()

				end, 1600, 1 )
			end
			function showCountDown1SekRathaus()
				setTimer ( function()
				vnxDrawText("countdown_1_vnx","justASimpleTimer"," 1 ...", sx*740, sy*368, sx*205, sy*29, tocolor(255, 255, 255, 255), 1.3, "default-bold", "center", "top", false, false, false, false, false)
				outputDebugString( "1" )
				vnxDestroyWindow("countdown_3_vnx")
				vnxDestroyWindow("countdown_2_vnx")
				ShowCountDownLastRathaus()
				end, 2000, 1 )
			end
		-------------------------------------------------------------------------------------------------------------------------------------------------------
			function ShowCountDownLastRathaus()
				setTimer ( function()
				vnxDestroyWindow("countdown_1_vnx")
				vnxDestroyWindow("Rathaus_Button")
				vnxDestroyWindow("Rathaus_Button")
				vnxDrawButton("Rathaus_Button_yes", "Rathaus_Button", "Ja", sx*730, sy*475, sx*100, sy*30, "Fuehrerschein_Buy_Rathaus")
				vnxDrawButton("Rathaus_Button_no", "Rathaus_Button", "Nein", sx*840, sy*475, sx*100, sy*30, "License_Cancel")
				end, 1000, 1)
			end

			function License_Cancel()
				vnxDestroyWindow("Rathaus_Button_no")
				vnxDestroyWindow("Rathaus_Button_yes")
				vnxDrawButton("Rathaus_Button", "Rathaus_Button", "Kaufen", sx*730, sy*475, sx*205, sy*30, "buy_license_rathaus_vnx")
			
			end
			addEventHandler("onClientRender", root, DrawBigAngelscheinVnX)

			removeEventHandler("onClientRender", root, DrawBigMotorbootscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigSegelscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigHelikopterscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigWaffenscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigFlugscheinAVnX)
			removeEventHandler("onClientRender", root, DrawBigFlugscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigLKWFuehrerscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigFuehrerscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigPersoVnX)
			removeEventHandler("onClientRender", root, DrawBigMotorradscheinVnX)
-------------------------------------------------------------------------------------------------------------------------------------------------------

		elseif LicenseSelected_rathaus_vnx == "" then
			removeEventHandler("onClientRender", root, DrawBigMotorbootscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigSegelscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigAngelscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigHelikopterscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigWaffenscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigFlugscheinAVnX)
			removeEventHandler("onClientRender", root, DrawBigFlugscheinBVnX)
			removeEventHandler("onClientRender", root, DrawBigLKWFuehrerscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigFuehrerscheinVnX)
			removeEventHandler("onClientRender", root, DrawBigPersoVnX)
			removeEventHandler("onClientRender", root, DrawBigMotorradscheinVnX)
		end
			function Fuehrerschein_Buy_Rathaus()
				vnxDestroyWindow("Rathaus_Button_yes")
				vnxDestroyWindow("Rathaus_Button_no")
				triggerServerEvent ( "LizenzKaufen", getLocalPlayer(), getLocalPlayer(), license )
				if license == "perso" then
					rathaus_close()
					RathausMenue_New_VnX()
					showCursor(true)
					vnxDrawButton("Rathaus_Button", "Rathaus_Button", "Kaufen", sx*730, sy*475, sx*205, sy*30, "buy_license_rathaus_vnx")
				elseif license == "car" then
					rathaus_close()
					RathausMenue_New_VnX()
					showCursor(true)
					vnxDrawButton("Rathaus_Button", "Rathaus_Button", "Kaufen", sx*730, sy*475, sx*205, sy*30, "buy_license_rathaus_vnx")
				elseif license == "bike" then
					rathaus_close()
					RathausMenue_New_VnX()
					showCursor(true)
					vnxDrawButton("Rathaus_Button", "Rathaus_Button", "Kaufen", sx*730, sy*475, sx*205, sy*30, "buy_license_rathaus_vnx")
				elseif license == "lkw" then
					rathaus_close()
					RathausMenue_New_VnX()
					showCursor(true)
					vnxDrawButton("Rathaus_Button", "Rathaus_Button", "Kaufen", sx*730, sy*475, sx*205, sy*30, "buy_license_rathaus_vnx")
				elseif license == "planea" then
					rathaus_close()
					RathausMenue_New_VnX()
					showCursor(true)
					vnxDrawButton("Rathaus_Button", "Rathaus_Button", "Kaufen", sx*730, sy*475, sx*205, sy*30, "buy_license_rathaus_vnx")
				elseif license == "planeb" then
					rathaus_close()
					RathausMenue_New_VnX()
					showCursor(true)
					vnxDrawButton("Rathaus_Button", "Rathaus_Button", "Kaufen", sx*730, sy*475, sx*205, sy*30, "buy_license_rathaus_vnx")
				elseif license == "wschein" then
					rathaus_close()
					RathausMenue_New_VnX()
					showCursor(true)
					vnxDrawButton("Rathaus_Button", "Rathaus_Button", "Kaufen", sx*730, sy*475, sx*205, sy*30, "buy_license_rathaus_vnx")
				elseif license == "heli" then 
					rathaus_close()
					RathausMenue_New_VnX()
					showCursor(true)
					vnxDrawButton("Rathaus_Button", "Rathaus_Button", "Kaufen", sx*730, sy*475, sx*205, sy*30, "buy_license_rathaus_vnx")
				elseif license == "motorboot" then
					rathaus_close()
					RathausMenue_New_VnX()
					showCursor(true)
					vnxDrawButton("Rathaus_Button", "Rathaus_Button", "Kaufen", sx*730, sy*475, sx*205, sy*30, "buy_license_rathaus_vnx")
				elseif license == "raft" then
					rathaus_close()
					RathausMenue_New_VnX()
					showCursor(true)
					vnxDrawButton("Rathaus_Button", "Rathaus_Button", "Kaufen", sx*730, sy*475, sx*205, sy*30, "buy_license_rathaus_vnx")
				elseif license == "fishing" then
					rathaus_close()
					RathausMenue_New_VnX()
					showCursor(true)
					vnxDrawButton("Rathaus_Button", "Rathaus_Button", "Kaufen", sx*730, sy*475, sx*205, sy*30, "buy_license_rathaus_vnx")
				end
		end	
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
function deleteVnXEvents_rathaus()
	removeEventHandler("onClientRender", root, DrawBigMotorbootscheinBVnX)
	removeEventHandler("onClientRender", root, DrawBigSegelscheinVnX)
	removeEventHandler("onClientRender", root, DrawBigAngelscheinVnX)
	removeEventHandler("onClientRender", root, DrawBigHelikopterscheinBVnX)
	removeEventHandler("onClientRender", root, DrawBigWaffenscheinVnX)
	removeEventHandler("onClientRender", root, DrawBigFlugscheinAVnX)
	removeEventHandler("onClientRender", root, DrawBigFlugscheinBVnX)
	removeEventHandler("onClientRender", root, DrawBigLKWFuehrerscheinVnX)
	removeEventHandler("onClientRender", root, DrawBigFuehrerscheinVnX)
	removeEventHandler("onClientRender", root, DrawBigPersoVnX)
	removeEventHandler("onClientRender", root, DrawBigMotorradscheinVnX)
end