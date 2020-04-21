------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------
---- Script by Noneatme ------

-- SERVER ALLROUND FOR CHRISTMAS --

local sSetting = {}
local sFunc = {}


------- FUNKTIONEN --


sFunc["showCommandInfo"] = function(thePlayer)
	outputChatBox("Befehle für das Weihnachtsevent 2012:", thePlayer, 0, 255, 0)
	outputChatBox("#00FF00/paeckchen #FFFFFF-> Öffnet das Päckchen-Menü", thePlayer, 0, 200, 0, true)
	outputChatBox("#00FF00/weihnachtsevent #FFFFFF-> Öffnet den Adventskalender(Nur beim Weihnachtsmarkt)", thePlayer, 0, 200, 0, true)
	outputChatBox("#00FF00/feuerwerk #FFFFFF-> Öffnet das Feuerwerks-Menü", thePlayer, 0, 200, 0, true)
	outputChatBox("#00FF00/objekte #FFFFFF-> Öffnet das Menü der platzierbaren Objekten", thePlayer, 0, 200, 0, true)
	outputChatBox("#00FF00/applyweihnacht #FFFFFF-> Aktiviert bestimmte, freigeschaltene Ereignisse", thePlayer, 0, 200, 0, true)
	outputChatBox("#00FF00/giveitem #FFFFFF-> Einem Spieler ein Weihnachtsitem geben", thePlayer, 0, 200, 0, true)
	outputChatBox("#00FF00/snow #FFFFFF-> Schnee ein- oder ausschalten", thePlayer, 0, 200, 0, true)
	outputChatBox("#00FF00/groundsnow #FFFFFF-> Schnee auf dem Boden ein- oder ausschalten", thePlayer, 0, 200, 0, true)
	outputChatBox("#FFFFFFBei #00FFFFFragen #FFFFFFwende dich bitte an einem Supporter per /kontakt!", thePlayer, 0, 0, 0, true)
end



addCommandHandler("whelp", sFunc["showCommandInfo"])
addCommandHandler("weihnachtshelp", sFunc["showCommandInfo"])
addCommandHandler("winfo", sFunc["showCommandInfo"])
addCommandHandler("weihnachtsinfo", sFunc["showCommandInfo"])


-- COMMAND ZUM GEBEN VON ITEMS --

local function item_pay_func(thePlayer, cmd, target, typ2, anzahl)
	if(target) and (getPlayerFromName(target)) then
		if(anzahl) and (tonumber(anzahl)) and (typ2) then
			anzahl = math.floor(tonumber(anzahl))
			typ = string.lower(typ2)
			target = getPlayerFromName(target)
			local x, y, z = getElementPosition(thePlayer)
			local x2, y2, z2 = getElementPosition(target)
			if(getDistanceBetweenPoints3D(x, y, z, x2, y2, z2) > 10) then
				outputChatBox("Du bist zu weit vom Spieler entfernt!", thePlayer, 255, 0, 0)
				return
			end
			local data, mysqlitem
			-- ITEMS --
			if(typ == "paeckchen") then
				data = "wn:paeckchen"
				mysqlitem = "PAECKCHEN"
			elseif(typ == "tische") then
				data = "wn:tische"
				mysqlitem = "TISCHE"
			elseif(typ == "palmen") then
				data = "wn:palmen"
				mysqlitem = "PALMEN"
			elseif(typ == "lichter") then
				data = "wn:lichter"
				mysqlitem = "LICHTER"
			elseif(typ == "tannenbaeume") then
				data = "wn:tannenbaeume"
				mysqlitem = "TANNENBAEUME"
			elseif(typ == "kakteen") then
				data = "wn:kakteen"
				mysqlitem = "KAKTEEN"
			elseif(typ == "boeller") then
				data = "wn:boeller"
				mysqlitem = "BOELLER"
			elseif(typ == "raketen") then
				data = "wn:raketen"
				mysqlitem = "RAKETEN"
			elseif(typ == "batterien") then
				data = "wn:batterien"
				mysqlitem = "batterien"
			elseif(typ == "vulkane") then
				data = "wn:flimmervulkane"
				mysqlitem = "FLIMMERVULKANE"
			elseif(typ == "heuler") then
				data = "wn:heuler"
				mysqlitem = "HEULER"
			end
			if(type(data) ~= "string") then
				outputChatBox("Dieses Item existiert nicht!", thePlayer, 200, 0, 0)
				outputChatBox("Verfügbare Items: Tische, Palmen, Lichter, Tannenbaeume, Kakteen, Paeckchen, Boeller, Raketen, Batterien, Vulkane, Heuler", thePlayer, 0, 200, 0)
				return;
			end
			local vorhanden1 = tonumber(getPlayerWeihnachtsData(thePlayer, data))
			local vorhanden2 = tonumber(getPlayerWeihnachtsData(target, data))
			if(vorhanden1 < anzahl) or (anzahl < 1) or (anzahl > 100) then
				outputChatBox("Diese Anzahl des Items besitzt du nicht oder der Wert ist zu gross/zu klein!", thePlayer, 200, 0, 0)
				return;
			end
			givePlayerWeinachtsData(thePlayer, data, mysqlitem, -anzahl, nil)
			givePlayerWeinachtsData(target, data, mysqlitem, anzahl, nil)
			
			outputChatBox("Du hast von "..getPlayerName(thePlayer).." "..anzahl.." "..typ2.." erhalten!", target, 0, 200, 0)
			outputChatBox("Du hast "..getPlayerName(target).." "..anzahl.." "..typ2.." gegeben!", thePlayer, 0, 200, 0)
		else
			outputChatBox("Verwende: /giveitem [Spielername] [Itemname] [Anzahl], um jemanden ein Weihnachtsitem zu geben.", thePlayer, 0, 255, 0)
			outputChatBox("Verfügbare Items: Tische, Palmen, Lichter, Tannenbaeume, Kakteen, Paeckchen, Boeller, Raketen, Batterien, Vulkane, Heuler", thePlayer, 0, 200, 0)
		end
	else
		outputChatBox("Verwende: /giveitem [Spielername] [Itemname] [Anzahl], um jemanden ein Weihnachtsitem zu geben.", thePlayer, 0, 255, 0)
		outputChatBox("Verfügbare Items: Tische, Palmen, Lichter, Tannenbaeume, Kakteen, Paeckchen, Boeller, Raketen, Batterien, Vulkane, Heuler", thePlayer, 0, 200, 0)
	end
end

addCommandHandler("giveitem", item_pay_func)

--[[

			local paeckchen = getPlayerPaeckchen(thePlayer)
			if(paeckchen < anzahl) then
				outputChatBox("Soviele Paeckchen hast du nicht!", thePlayer, 0, 255, 0)
				return;
			end
			target = getPlayerFromName(target)
			local pos = {getElementPosition(thePlayer), getElementPosition(target)}
			if(getDistanceBetweenPoints3D(pos[1], pos[2], pos[3], pos[4], pos[5], pos[6]) > 10) then
				outputChatBox("Du bist zu Weit vom Spieler entfernt!", thePlayer, 255, 0, 0)
				return
			end
			
			setPlayerPaeckchen(thePlayer, paeckchen-anzahl)
			setPlayerPaeckchen(target, getPlayerPaeckchen(target)+anzahl)
			
			outputChatBox("Du hast von "..getPlayerName(thePlayer).." "..anzahl.." Paeckchen erhalten!", target, 0, 200, 0)
			outputChatBox("Du hast "..getPlayerName(target).." "..anzahl.." Paeckchen gegeben!", thePlayer, 0, 200, 0)

]]