------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------
---- Script by Noneatme ------

local preise = {
	["Geld"] = 100,
	["Objekte"] = 10,
	["Gehstock"] = 5,
	["Feuerwerk"] = 10,
	["Turismo"] = 1000,
	["Mr.Whoopee"] = 500,
	["Hausmarker"] = 2500,
	["Adminposten"] = 9999999,
}
addEvent("doPaekchenBuy", true)


addEventHandler("doPaekchenBuy", getRootElement(), function(was)
	local preis = preise[was]
	local paeckchen = tonumber(getPlayerPaeckchen(source))
	if(paeckchen < preis) then
		outputChatBox("Das kannst du dir nicht leisten! Dir fehlen "..preis-paeckchen.." Päckchen!", source, 255, 0, 0)
		return;
	end
	if(was == "Geld") then
		outputChatBox("Du hast dir erfolgreich 10.000$ gekauft!", source, 0, 255, 0)
		-- SICHERHEITSHINWEIS --
		local newmoney = 10000
		local oldmoney = laGetElementData (source, "money")
		laSetElementData (source, "money", oldmoney+newmoney)
		outputLog ( "[WEIHNACHTSEVENT]: "..getPlayerName(source).." | Kauf: 10k", "misc" )
	elseif(was == "Objekte") then
		outputChatBox("Du hast dir ein paar Objekte gekauft! Benutze /objekte", source, 0, 255, 0)
		givePlayerWeinachtsData(source, "wn:tannenbaeume", "TANNENBAEUME", 5, nil)
		givePlayerWeinachtsData(source, "wn:tische", "TISCHE", 5, nil)
		givePlayerWeinachtsData(source, "wn:palmen", "PALMEN", 5, nil)
		givePlayerWeinachtsData(source, "wn:kakteen", "KAKTEEN", 5, nil)
		givePlayerWeinachtsData(source, "wn:lichter", "LICHTER", 7, nil)
	elseif(was == "Gehstock") then
		outputChatBox("Du hast dir erfolgreich einen Gehstock gekauft!", source, 0, 255, 0)
		giveWeapon(source, 15, 1, true)
	elseif(was == "Feuerwerk") then
		outputChatBox("Du hast dir erfolgreich Feuerwerk gekauft! Benutze /feuerwerk", source, 0, 255, 0)
		givePlayerWeinachtsData(source, "wn:boeller", "BOELLER", 3, nil)
		givePlayerWeinachtsData(source, "wn:raketen", "RAKETEN", 5, nil)
		givePlayerWeinachtsData(source, "wn:batterien", "BATTERIEN", 1, nil)
		givePlayerWeinachtsData(source, "wn:heuler", "HEULER", 5, nil)
		givePlayerWeinachtsData(source, "wn:flimmervulkane", "FLIMMERVULKANE", 1, nil)
	elseif(was == "Turismo") then
		-- SICHERHEITSHINWEIS --
		local x, y, z = getElementPosition (source)
		carbuy ( source, 0, 451, x, y, z, 0, 0, 0 )
		outputLog ( "[WEIHNACHTSEVENT]: "..getPlayerName(source).." | Kauf: Turismo", "misc" )
	elseif(was == "Mr.Whoopee") then
		-- SICHERHEITSHINWEIS --
		local x, y, z = getElementPosition (source)
		carbuy ( source, 0, 423, x, y, z, 0, 0, 0 )
		outputLog ( "[WEIHNACHTSEVENT]: "..getPlayerName(source).." | Kauf: Mr. Whoopee", "misc" )
	elseif(was == "Hausmarker") then
		outputChatBox("Begib dich zu einem Administrator. Er wird dir einen Hausmarker setzen.", source, 0, 255, 0)
		outputChatBox("[WEIHNACHTSEVENT]: "..getPlayerName(source).." hat sich einen Hausmarker gekauft!", getRootElement(), 0, 200, 0)
		outputChatBox("Mache von dieser Nachricht UNBEDINGT einen Screenshot, sonst kann es sein, dass du deinen Hausmarker nicht erhältst!", source, 0, 255, 0)
		outputLog ( "[WEIHNACHTSEVENT]: "..getPlayerName(source).." | Kauf: Hausmarker", "misc" )
		paeckchen = paeckchen+preis
	elseif(was == "Adminposten") then
		outputChatBox("So viele Päckchen kannst du gar nicht haben, haha!", source, 255, 0, 0)
		outputLog ( "[WEIHNACHTSEVENT]: "..getPlayerName(source).." | Bann (Adminposten)", "ban" )
		outputChatBox ( getPlayerName(source).." wurde vom Anticheat-Bot gebannt! (Grund: Paeckchen-Hack)", getRootElement(), 255, 0, 0 )
		banPlayer(source, true, true, true, "Anti-Paeckchen-Hack")
	end
	
	setPlayerPaeckchen(source, paeckchen-preis)
end)
