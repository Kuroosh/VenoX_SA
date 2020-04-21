
function sTuningsToString ( veh )
	if veh and getElementType (veh) == "vehicle" then
		local carstring = ""
		if getElementData ( veh, "stuning1" ) and getElementData ( veh, "stuning1" ) >= 1 then
			carstring = "Kofferraum"
		end
		if getElementData ( veh, "stuning2" ) and getElementData ( veh, "stuning2" ) >= 1 then
			if carstring == "" then
				carstring = "Panzerung"
			else
				carstring = carstring..", Panzerung"
			end
		end
		if getElementData ( veh, "stuning3" ) and getElementData ( veh, "stuning3" ) >= 1 then
			if carstring == "" then
				carstring = "Benzinersparnis"
			else
				carstring = carstring..", Benzinersparnis"
			end
		end
		if getElementData ( veh, "stuning4" ) and getElementData ( veh, "stuning4" ) >= 1 then
			if carstring == "" then
				carstring = "GPS"
			else
				carstring = carstring..", GPS"
			end
		end
		if getElementData ( veh, "stuning5" ) and getElementData ( veh, "stuning5" ) >= 1 then
			if carstring == "" then
				carstring = "Doppelreifen"
			else
				carstring = carstring..", Doppelreifen"
			end
		end
		if getElementData ( veh, "stuning6" ) and getElementData ( veh, "stuning6" ) >= 1 then
			if carstring == "" then
				carstring = "Nebelwerfer"
			else
				carstring = carstring..", Nebelwerfer"
			end
		end
		if getVehicleType ( veh ) ~= "Plane" and getVehicleType ( veh ) ~= "Helicopter" then
			local sportmotor = getElementData ( veh,"sportmotor" )
			if sportmotor and sportmotor > 0 then
				if carstring == "" then
					carstring = "Sportmotor "..sportmotor
				else
					carstring = carstring..", Sportmotor "..sportmotor
				end
			end
			local bremse = getElementData ( veh,"bremse" )
			if bremse and bremse > 0 then
				if carstring == "" then
					carstring = "Bremse "..bremse
				else
					carstring = carstring..", Bremse "..bremse
				end
			end
			local radtyp = getVehicleHandling ( veh )["driveType"]
			if radtyp == "rwd" then
				radtyp = "Heckantrieb"
			elseif radtyp == "awd" then
				radtyp = "Allradantrieb"
			else
				radtyp = "Frontantrieb"
			end
			if carstring == "" then
				carstring = radtyp
			else
				carstring = carstring..", "..radtyp
			end
		end
		if carstring == "" then
			return "Keine"
		else
			return carstring
		end
	end
end

function close_car_menue()
    vnxDestroyWindow("show_car_menue")
    vnxDestroyWindow("abschliessen_car_menue")
    vnxDestroyWindow("handbremse_car_menue")
    vnxDestroyWindow("parken_car_menue")
    vnxDestroyWindow("respawn_car_menue")
	vnxDestroyWindow("information_car_menue")
	vnxDestroyWindow("show_admin_menue")
	vnxDestroyWindow("show_reason_admin_menue")
	vnxDestroyWindow("respawn_admin_button")
	vnxDestroyWindow("delete_admin_button")
    showCursor(false)
end

function respawnvehicle_car_menue()
    local veh = vnxClientGetElementData ( "clickedVehicle" )
    if veh then
        if getElementData ( veh, "owner" ) == getPlayerName ( lp ) then
            triggerServerEvent ( "respawnPrivVehClick", lp, lp, "lock", tonumber ( getElementData ( veh, "carslotnr_owner" ) ) )
        else
            outputChatBox ( "Das Fahrzeug gehoert dir nicht!", 125, 0, 0 )
        end
    end
end
mechanikerskinsclient = {}
mechanikerskinsclient[11] = { 305, 268, 201, 128, 50, 42 }
function handbremse_car_menue()
    local veh = vnxClientGetElementData ( "clickedVehicle" )
    if veh then
        if getElementData ( veh, "owner" ) == getPlayerName ( lp )  or getElementData(veh, "schluessel") == getPlayerName(lp) then
            if isElementFrozen ( veh ) then
                setElementFrozen ( veh, false )
                outputChatBox ( "Handbremse gelöst!", 100, 0, 0 )
            else
                setElementFrozen ( veh, true )
                outputChatBox ( "Handbremse angezogen!", 0, 125, 0 )
            end
		elseif getElementData(lp, "fraktion") == 11 then 
			local model = getElementModel(lp)
			for i = 1, #mechanikerskinsclient[11] do
				if mechanikerskinsclient[11][i] == model then
					mechanikerisonduty = true 
				end 
			end
				if mechanikerisonduty == true then 
					if isElementFrozen ( veh ) then
						setElementFrozen ( veh, false )
						outputChatBox ( "Handbremse gelöst!", 100, 0, 0 )
					else
						setElementFrozen ( veh, true )
						outputChatBox ( "Handbremse angezogen!", 0, 125, 0 )
					end
					mechanikerisonduty = false 
				else 
					outputChatBox ( "Geh bitte zuerst Onduty.", 125, 0, 0 )
				end 
		else
            outputChatBox ( "Das Fahrzeug gehoert dir nicht!", 125, 0, 0 )
        end
    end
end

function abschliessen_car_menue()
    local veh = vnxClientGetElementData ( "clickedVehicle" )
    if veh then
        if getElementData ( veh, "owner" ) == getPlayerName ( lp ) then
            triggerServerEvent ( "lockPrivVehClick", lp, lp, "lock", tonumber ( getElementData ( veh, "carslotnr_owner" ) ) )
		elseif getElementData(veh, "schluessel") == getPlayerName(lp) then 
			triggerServerEvent ( "lockSchluesselVehClick", lp, lp, veh )
			--outputDebugString(lp.." hat auf das Fahrzeug versucht zu klicken ; "..veh)
		else
            outputChatBox ( "Das Fahrzeug gehoert dir nicht oder du hast keinen Schlüssel dafür!", 125, 0, 0 )
		end
    end
end

function information_car_menue()
    local veh = vnxClientGetElementData ( "clickedVehicle" )
    if veh then
        local owner = getElementData ( veh, "owner" )
        if not owner or owner == "console" then
            owner = "Niemand"
        end
		local stunings = sTuningsToString ( veh )
		local schluessel = getElementData(veh, "schluessel")
		if schluessel == false or schluessel == nil or schluessel == "" then 
			outputChatBox ( "Fahrzeug Modell: "..getVehicleName (veh)..", Besitzer: "..owner, 0, 150, 200 )
			outputChatBox ( "Tunings: "..stunings, 0, 150, 200 )
			outputChatBox ( "Schlüssel: - ", 0, 150, 200 )
			--outputDebugString(schluessel)
		else
			outputChatBox ( "Fahrzeug Modell: "..getVehicleName (veh)..", Besitzer: "..owner, 0, 150, 200 )
			outputChatBox ( "Tunings: "..stunings, 0, 150, 200 )
			outputChatBox ( "Schlüssel: "..schluessel, 0, 150, 200 )
		end
    end
end

function park_car_menue()
    local vehicle = vnxClientGetElementData ( "clickedVehicle" )
    if vehicle then
        if getElementData ( vehicle, "owner" ) == getPlayerName ( lp )  then
            triggerServerEvent ("park_button", getLocalPlayer() , getLocalPlayer())
        else
            outputChatBox ( "Das Fahrzeug gehoert dir nicht!", 125, 0, 0 )
        end
    end
end

function delete_admin_func_car_menue()
	local geteditinfo = vnxGetEditText("show_reason_admin_menue", "Reason Why it Should be Deleted")
	local veh = vnxClientGetElementData ( "clickedVehicle" )
	local towcar = getElementData ( veh, "carslotnr_owner" )
	local pname = getElementData ( veh, "owner" )
	if not pname then
		triggerServerEvent ( "moveVehicleAway", lp, veh )
		close_car_menue()
	else
		close_car_menue()
		triggerServerEvent ( "deleteVeh", lp, towcar, pname, veh, geteditinfo )
	end
end 

function respawn_admin_func_car_menue()
	local veh = vnxClientGetElementData ( "clickedVehicle" )
	local towcar = getElementData ( veh, "carslotnr_owner" )
	local pname = getElementData ( veh, "owner" )
	close_car_menue()
	triggerServerEvent ( "respawnVeh", lp, towcar, pname, veh )
end

function showCarMenue()
    local screenX, screenY = guiGetScreenSize()
    local sx, sy = screenX/1366, screenY/768
	if window_already_open == false and getElementData(getLocalPlayer(), "loggedin") == 1 then
		if getElementData(lp, "adminlvl") >= 5 then 
			vnxDrawWindow("show_admin_menue", "Der Admin Background", "Admin Optionen", sx*10, sy*284, sx*350, sy*160, "close_car_menue")
			vnxDrawButtonColored("respawn_admin_button", "Respawn button", "Admin - Respawn", sx*15, sy*330, sx*150, sy*50, tocolor(50,50,50,100), tocolor(100,100,100,100), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(0,125,0,255), tocolor(0,180,0,255), "respawn_admin_func_car_menue")
			vnxDrawButtonColored("delete_admin_button", "Delete button", "Admin - Delete", sx*205, sy*330, sx*150, sy*50, tocolor(50,50,50,100), tocolor(100,100,100,100), tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(125,0,0,255), tocolor(180,0,0,255), "delete_admin_func_car_menue")
			vnxDrawEdit("show_reason_admin_menue", "Reason Why it Should be Deleted", "Einen Grund eingeben.", sx*15, sy*400, sx*340, true,true)
			
		end 
        vnxDrawWindow("show_car_menue", "Der Background", "Mein Auto", sx*805, sy*284, sx*220, sy*199, "close_car_menue")
        vnxDrawButtonColored("abschliessen_car_menue", "Login_Button", "Abschliessen", sx*806, sy*313, sx*218, sy*34, tocolor(0,150,200,10), tocolor(0,150,200,100), tocolor(0,150,200,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0), "abschliessen_car_menue")
        vnxDrawButtonColored("handbremse_car_menue", "Login_Button", "Handbremse Ziehen", sx*806, sy*347, sx*218, sy*34, tocolor(0,150,200,10), tocolor(0,150,200,100), tocolor(0,150,200,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0), "handbremse_car_menue")
        vnxDrawButtonColored("parken_car_menue", "Login_Button", "Hier Parken", sx*806, sy*381, sx*218, sy*34, tocolor(0,150,200,10), tocolor(0,150,200,100), tocolor(0,150,200,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0), "park_car_menue")
        vnxDrawButtonColored("respawn_car_menue", "Respawnt das Auto", "Respawnen", sx*806, sy*415, sx*218, sy*34, tocolor(0,150,200,10), tocolor(0,150,200,100), tocolor(0,150,200,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0), "respawnvehicle_car_menue")
        vnxDrawButtonColored("information_car_menue", "Login_Button", "Information", sx*806, sy*449, sx*218, sy*34, tocolor(0,150,200,10), tocolor(0,150,200,100), tocolor(0,150,200,255), tocolor(255,255,255,255), tocolor(0,0,0,0), tocolor(0,0,0,0), "information_car_menue")
    end
end

addEvent ( "_createCarmenue", true )
addEventHandler ( "_createCarmenue", getRootElement(), showCarMenue )