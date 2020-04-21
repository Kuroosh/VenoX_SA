local screenx, screeny = guiGetScreenSize()
function vnxBankauszug(pl,am,zweck)
	if not fileExists ( "anzeigen/atm/bankauszug.vnx") then
		fileCreate ( "anzeigen/atm/bankauszug.vnx" )
	end
	kontoauzugview = fileOpen ( "anzeigen/atm/bankauszug.vnx")
	local filesize = fileGetSize ( kontoauzugview )
	fileSetPos ( kontoauzugview, filesize )
	local time = getRealTime()
	--datum zweck betrag
	local datum = time.year+1900 .."-"..time.month+1 .."-"..time.monthday.." "..time.hour..":"..time.minute
	fileWrite ( kontoauzugview, datum.."|"..zweck.."|"..am.."\n" )
	fileClose ( kontoauzugview )
end

addEvent("vnxBankauszug",true)
addEventHandler("vnxBankauszug",getRootElement(),vnxBankauszug)

function venoxcitybankschliessen()
    fileClose ( kontoauzugview1 )
    vnxDestroyWindow("bank_window")
	vnxDestroyWindow("bank_window_start")
    vnxDestroyWindow("bank_window_einzahlen")
	vnxDestroyWindow("bank_window_kontozuege")
	vnxDestroyWindow("bank_window_ueberweisen")
	vnxDestroyWindow("bank_window_informationen")
	window_already_open = false
	
	showCursor(false)
end	
function zurueck()
    local x,y= screenx/2-500/2,screeny/2-500/2
    fileClose ( kontoauzugview1 )
    vnxDestroyWindow("bank_window_einzahlen")
	vnxDestroyWindow("bank_window_kontozuege")
	vnxDestroyWindow("bank_window_ueberweisen")
    vnxDestroyWindow("bank_window_informationen")
		setTimer ( function()
        showCashPoint_func()
	end, 100, 1 )

end	

function showCashPoint_func ()
	if window_already_open == false then
		local x,y= screenx/2-500/2,screeny/2-500/2
		window_already_open = true
		--	local x, y, z = getElementPosition ( getLocalPlayer() )
		--	if getZoneName ( x, y, z, false ) == "Unknown" then
			vnxDrawWindow("bank_window","window","Venox City Bank",x,y,500,500,"venoxcitybankschliessen")
		--	else
		--	vnxDrawWindow("bank_window","window","XTREAM GELDAUTOMAT",x,y,500,500,"AmmunationSchliessen")
		--	end
			vnxDrawRectangle("bank_window","rahmen",x,y+55,500,465,tocolor(50,50,50,230))
			vnxDrawRectangle("bank_window","rahmen2",x+10,y+55,480,455,tocolor(30,30,30,255))
			vnxDrawRectangle("bank_window","BG",x+10,y+55,480,90,tocolor(0,90,160,50))
			vnxDrawImage("bank_window","bank_image",x+15,y+65,500,60,":imagess/logo")
			vnxDrawRectangle("bank_window","Swichen Strich",x+10,y+255,480,25,tocolor(0,90,160,100))
			vnxDrawImage("bank_window","bankheader_image",x+15,y+150,150,80,"anzeigen/atm/images/vnxbank")



			vnxDrawRectangle("bank_window_start","bg1",x+80,y+300,150,50,tocolor(0,0,0,120))
			vnxDrawRectangle("bank_window_start","bginnen1",x+82,y+302,146,40,tocolor(0,0,0,160))
			vnxDrawRectangle("bank_window_start","bg2",x+270,y+300,150,50,tocolor(0,0,0,120))
			vnxDrawRectangle("bank_window_start","bginnen2",x+272,y+302,146,40,tocolor(0,0,0,160))
			vnxDrawRectangle("bank_window_start","bg3",x+80,y+400,150,50,tocolor(0,0,0,120))
			vnxDrawRectangle("bank_window_start","bginnen3",x+82,y+402,146,40,tocolor(0,0,0,160))
			vnxDrawRectangle("bank_window_start","bg4",x+270,y+400,150,50,tocolor(0,0,0,120))
			vnxDrawRectangle("bank_window_start","bginnen4",x+272,y+402,146,40,tocolor(0,0,0,160))
			vnxDrawText("bank_window_start","text_menü","Bitte wählen Sie einen der folgenden Optionen aus:",x+110,y+260,300,100,tocolor(255,255,255,255),1,"default","left","top")
			vnxDrawImage("bank_window_start","info_image",x+140,y+305,30,30,"anzeigen/atm/images/kontostand")
			vnxDrawButton("bank_window_start","Kontostand","Kontoinformationen",x+80,y+340,150,40,"ShowbankInfo")
			vnxDrawImage("bank_window_start","auszug_image",x+329,y+305,30,30,"anzeigen/atm/images/icon_kontoauszug")
			vnxDrawButton("bank_window_start","auszug","Kontoauszüge",x+270,y+340,150,40,"ShowbankKontoauszuege")
			vnxDrawImage("bank_window_start","send_image",x+140,y+405,30,30,"anzeigen/atm/images/ueberweisen")
			vnxDrawButton("bank_window_start","ueberweisen","Überweisen",x+80,y+440,150,40,"ShowbankUeberweisen")
			vnxDrawImage("bank_window_start","einzahlen_image",x+309,y+405,70,30,"anzeigen/atm/images/einzahlen")
			vnxDrawButton("bank_window_start","einzahlen","Geld einzahlen\n/auszahlen",x+270,y+440,150,40,"ShowbankEinzahlen")
	end

end
addEvent ( "showCashPoint", true )
addEventHandler ( "showCashPoint", getRootElement(), showCashPoint_func )


function ShowbankInfo()
        local x,y= screenx/2-500/2,screeny/2-500/2
        vnxDestroyWindow("bank_window_start")
		vnxDrawText("bank_window_informationen","text_menü","Kontoinformationen",x+185,y+260,300,100,tocolor(255,255,255,255),1,"default","left","top")
		vnxDrawRectangle("bank_window_informationen","Kontostandbgueberschrift",x+50,y+320,405,25,tocolor(255,255,255,90))
		vnxDrawText("bank_window_informationen","text_kontostand","Kontostand:",x+60,y+325,300,100,tocolor(255,255,255,255),1,"default","left","top")
		vnxDrawRectangle("bank_window_informationen","Kontostandbg",x+50,y+340,405,90,tocolor(0,105,145,255))
		vnxDrawText("bank_window_informationen","text_Geld",tonumber(vnxClientGetElementData("bankmoney")).."€",x+50,y+335,405,100,tocolor(255,255,255,255),2,"default","center","center")
		vnxDrawButton("bank_window_informationen","zurueck_btn","Zurück",x+195,y+450,100,30,"zurueck")
end	

function comma_value(amount)
 local formatted = amount
    --[[formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
    if (k==0) then
      break
    end]]
  return formatted
end


function ShowbankKontoauszuege()  
        local x,y= screenx/2-500/2,screeny/2-500/2
		vnxDestroyWindow("bank_window_start")
		vnxDrawText("bank_window_kontozuege","text_Kontoauszuege","Kontoauszüge",x+205,y+260,300,100,tocolor(255,255,255,255),1,"default","left","top")
		--vnxDrawText("bank_window_kontozuege","text_coming","Comming soon...",x+205,y+320,300,100,tocolor(255,255,255,255),1,"default","left","top")
		local tbl = {}
		if fileExists ( "anzeigen/atm/bankauszug.vnx") then
			kontoauzugview1 = fileOpen ( "anzeigen/atm/bankauszug.vnx")
			local txt = fileRead(kontoauzugview1,fileGetSize(kontoauzugview1))
			local spl = split(txt,"\n")
			for i,v in ipairs (spl) do 
				local s = split(v,"|")
				tbl[#spl-i+1] = {s[1],s[2],comma_value(s[3])}
			end
			
			--{{"2014-12-03 00:03","Payday","500"}}
		end
		
		vnxDrawGridlist("bank_window_kontozuege","liste",x+15,y+285,470,150,{{"Datum",120},{"Verwendungszweck",270},{"Betrag",100}},tbl)
		vnxDrawButton("bank_window_kontozuege","zurueck_btn","Zurück",x+195,y+450,100,30,"zurueck")
end	

function ShowbankEinzahlen()
        local x,y= screenx/2-500/2,screeny/2-500/2
		vnxDestroyWindow("bank_window_start")
		vnxDrawText("bank_window_einzahlen","text_Überweisen","Einzahlen / Auszahlen",x+195,y+260,300,100,tocolor(255,255,255,255),1,"default","left","top")
		vnxDrawRectangle("bank_window_einzahlen","betragbg",x+50,y+340,220,20,tocolor(255,255,255,90))
		vnxDrawRectangle("bank_window_einzahlen","betragbg2",x+50,y+310,220,20,tocolor(255,255,255,90))
		vnxDrawText("bank_window_einzahlen","text_geld2","Aktueller Kontostand : "..tonumber(vnxClientGetElementData("bankmoney")).."€",x+55,y+312,200,100,tocolor(255,255,255,255),1,"default","left","top")
		vnxDrawText("bank_window_einzahlen","text_geld","Betrag",x+220,y+342,100,100,tocolor(255,255,255,255),1,"default","left","top")
		vnxDrawEdit("bank_window_einzahlen","betrag_edit","",x+290,y+340,135,true)
		vnxDrawText("bank_window_einzahlen","euro","€",x+430,y+342,100,100,tocolor(255,255,255,255),1,"default","left","top")
		vnxDrawButton("bank_window_einzahlen","Einzahlen_btn","Einzahlen",x+50,y+370,190,30,"bankEinzahlen")
		vnxDrawButton("bank_window_einzahlen","Auszahlen_btn","Auszahlen",x+250,y+370,190,30,"bankAuszahlen")
		vnxDrawButton("bank_window_einzahlen","zurueck_btn","Zurück",x+195,y+430,100,30,"zurueck")
end	

function ShowbankUeberweisen()
        local x,y= screenx/2-500/2,screeny/2-500/2
        vnxDestroyWindow("bank_window_start")
		--vnxDrawImage("bank_window_ueberweisen","ueberweisung_image",x+15,y+150,470,100,"bank/header_ueberweisung")
		vnxDrawText("bank_window_ueberweisen","text_Überweisen","Überweisen",x+215,y+260,300,100,tocolor(255,255,255,255),1,"default","left","top")
		vnxDrawRectangle("bank_window_ueberweisen","namebg",x+50,y+300,220,20,tocolor(255,255,255,90))
		vnxDrawText("bank_window_ueberweisen","text_empfaenger","Empfänger",x+200,y+302,100,100,tocolor(255,255,255,255),1,"default","left","top")
		vnxDrawEdit("bank_window_ueberweisen","empfaenger_edit","",x+290,y+300,150,true)
		vnxDrawRectangle("bank_window_ueberweisen","betragbg",x+50,y+330,220,20,tocolor(255,255,255,90))
		vnxDrawText("bank_window_ueberweisen","text_geld","Betrag",x+220,y+332,100,100,tocolor(255,255,255,255),1,"default","left","top")
		vnxDrawEdit("bank_window_ueberweisen","betrag_edit","",x+290,y+330,135,true)
		vnxDrawText("bank_window_ueberweisen","euro","€",x+430,y+332,100,100,tocolor(255,255,255,255),1,"default","left","top")
		vnxDrawRectangle("bank_window_ueberweisen","verwendungszweckbg",x+50,y+360,220,20,tocolor(255,255,255,90))
		vnxDrawText("bank_window_ueberweisen","text_verwendungszweck","Verwendungszweck",x+150,y+362,160,100,tocolor(255,255,255,255),1,"default","left","top")
		vnxDrawEdit("bank_window_ueberweisen","verwendungszweck_edit","",x+290,y+360,150,true)
		vnxDrawButton("bank_window_ueberweisen","uebwerweisen_btn","Überweisen",x+50,y+390,390,30,"bankUeberweisen")
		vnxDrawButton("bank_window_ueberweisen","zurueck_btn","Zurück",x+195,y+450,100,30,"zurueck")
end	

function bankEinzahlen()
    local amount = tonumber (vnxGetEditText("bank_window_einzahlen","betrag_edit"))
    triggerServerEvent ( "cashPointPayIn", lp, amount )
end	

function bankAuszahlen()
    local amount = tonumber (vnxGetEditText("bank_window_einzahlen","betrag_edit"))
    triggerServerEvent ( "cashPointPayOut", lp, amount )
end	


function bankUeberweisen()
    local amount = tonumber (vnxGetEditText("bank_window_ueberweisen","betrag_edit"))
    local target = vnxGetEditText("bank_window_ueberweisen","empfaenger_edit")
    local reason = vnxGetEditText("bank_window_ueberweisen","verwendungszweck_edit")
    triggerServerEvent ( "cashPointTransfer", lp, amount, target, false, reason )
end	