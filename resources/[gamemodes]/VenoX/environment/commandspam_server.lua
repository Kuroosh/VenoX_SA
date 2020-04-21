local antiSpam = {}
local notAntiSpam = {
	["Next"] = true, ["Previous"] = true, ["admin"] = true, ["grabheli"] = true, ["snow"] = true, ["High Sensivity Mode"] = true, ["High Sensivity Mode up"] = true, ["mv"] = true, ["Toggle"] = true, ["smoke"] = true, 
	["dropheli"] = true, ["fskin"] = true, ["tazer"] = true, ["reload"] = true
}

addEventHandler ( "onPlayerCommand", root, function ( cmd )
	if not notAntiSpam[cmd] then
		if antiSpam[source] and antiSpam[source] + 325 >= getTickCount() then
			cancelEvent()
			outputChatBox("[Venox Spam Shield] : Bitte kein Spam!", source, 255, 0, 0)
		else
			antiSpam[source] = getTickCount()
		end
	end
end )