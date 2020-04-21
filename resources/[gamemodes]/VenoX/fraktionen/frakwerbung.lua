function frakwerbi(player, cmd)
	if vnxGetElementData(player, "rang") == 5 then
		if isCop(player) then
			outputChatBox("Das SAPD sucht Mitglieder - Bewerbung im Ts3!", getRootElement(), 255, 85, 0)-- 1
		elseif isMafia(player) then
			outputChatBox("Die Cosa Nostra sucht Mitglieder - Bewerbung im Ts3!", getRootElement(), 255, 85, 0)-- 2
		elseif isTriad(player) then
			outputChatBox("Die Yakuza sucht Mitglieder - Bewerbung im Ts3!", getRootElement(), 255, 85, 0)-- 3
		elseif isFeuer (player) then
			outputChatBox("Die Feuerwehr sucht Mitglieder - Bewerbung im Ts3!", getRootElement(), 255, 85, 0)-- 4
		elseif isReporter(player) then
			outputChatBox("Die Reporter sucht Mitglieder - Bewerbung im Ts3!", getRootElement(), 255, 85, 0)-- 5
		elseif isFBI(player) then
			outputChatBox("Das FBI sucht Mitglieder - Bewerbung im Ts3!", getRootElement(), 255, 85, 0)-- 6
		elseif isAztecas(player) then
			outputChatBox("Die Varrios Aztecas sucht Mitglieder - Bewerbung im Ts3!", getRootElement(), 255, 85, 0)-- 7
		elseif isArmy(player) then
			outputChatBox("Die Bundeswehr sucht Mitglieder - Bewerbung im Ts3!", getRootElement(), 255, 85, 0)-- 8
		elseif isBiker(player) then
			outputChatBox("Die Nordic Angels sucht Mitglieder - Bewerbung im Ts3!", getRootElement(), 255, 85, 0)-- 9
		elseif isMedic(player) then
			outputChatBox("Das Rescue Team sucht Mitglieder - Bewerbung im Ts3!", getRootElement(), 255, 85, 0)-- 10
		elseif isMechaniker(player) then
			outputChatBox("Das Ordnungsamt sucht Mitglieder - Bewerbung im Ts3!", getRootElement(), 255, 85, 0)-- 11
		elseif isBallas(player) then
			outputChatBox("Die Rollin' Heights sucht Mitglieder - Bewerbung im Ts3!", getRootElement(), 255, 85, 0)-- 12
		elseif isFeuer(player) then
			outputChatBox("Die Feuerwehr sucht Mitglieder - Bewerbung im Ts3!", getRootElement(), 255, 85, 0)-- 15
		else
			triggerClientEvent(player, "infobox_start", getRootElement(), "Du bist in\nkeiner Gültigen\nFraktion!", 7500, 255, 0, 0)
		end
	else
		triggerClientEvent(player, "infobox_start", getRootElement(), "\nDu bist kein\nLeader einer Fraktion!", 7500, 255, 0, 0)
	end
end
addCommandHandler("fad", frakwerbi)