chance = {
[1] = "Blaue Sieben",
[2] = "Kirsche",
[3] = "Glocke",
[4] = "Melone",
[5] = "BAR",
[6] = "Traube",
[7] = "Melone",
[8] = "BAR",
[9] = "Kirsche",
[10] = "Melone",
[11] = "Blaue Sieben",
[12] = "Melone",
[13] = "Melone",
[14] = "Traube",
[15] = "Traube",
[16] = "Kirsche",
[17] = "Kirsche",
[18] = "Glocke",
[19] = "Glocke",
[20] = "Rote Sieben",
[21] = "Kirsche",
[22] = "Melone",
[23] = "Melone",
[24] = "Melone",
[25] = "Kirsche",
[26] = "Kirsche",
[27] = "Glocke",
}

gewinn= {
["Traube"] = 750,
["Glocke"] = 270,
["BAR"] = 1750,
["Kirsche"] = 1000,
["Blaue Sieben"] = 13370,
["Rote Sieben"] = 57456,
["Melone"] = 120,
}

function Slotwaehle(thePlayer, SID)
	local zug1 = math.random(1,27)
	local zugsym1 = chance[zug1]
	local zug2 = math.random(1,27)
	local zugsym2 = chance[zug2]
	local zug3 = math.random(1,27)
	local zugsym3 = chance[zug3]
	if (zugsym1 == zugsym2) and (zugsym2 == zugsym3) then
		winamount = gewinn[zugsym1]
		triggerClientEvent(thePlayer,"onBanditWin",thePlayer,SID,winamount, zugsym1)
	else
		winamount = 0
		triggerClientEvent(thePlayer,"onBanditLose",thePlayer,SID, zugsym1, zugsym2, zugsym3)
	end
	takePlayerSaveMoney(thePlayer,10)
	setTimer(givePlayerSaveMoney,5500,1,thePlayer,winamount)
end
addEvent("Slot",true)
addEventHandler("Slot",getRootElement(),Slotwaehle)