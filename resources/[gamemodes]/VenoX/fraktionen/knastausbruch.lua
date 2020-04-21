local knastausbruchan = true

function knastausbruch_func(player, cmd)
	if (vnxGetElementData(player, "jailtime") >= 1) then
		if not knastausbruchan then
			outputChatBox("Hat leider nicht geklappt, versuche es später erneut!", player, 200, 0, 0)
		return
		end
		
		knastausbruchan = false
		
		setTimer(function ()
			knastausbruchan = true
		end, 20*60*1000, 1)
		setElementPosition ( player, -1605.675, 717.516, 12.006 )
		setElementInterior(player, 0)
		outputChatBox("Jemand ist aus dem Gefängniss ausgebrochen!", getRootElement(), 200, 0, 0)
		outputChatBox("Du bist vom Gefängniss ausgebrochen, schau das die Polizei dich nicht erwischt!", player, 200, 0, 0)
		vnxSetElementData(player, "jailtime", 0)
		vnxSetElementData(player, "wanteds", 6)
		setPlayerWantedLevel(player, 6)
	else
		triggerClientEvent(player, "infobox_start", getRootElement(), "Du bist nicht\nim Gefaengniss!", 7500, 255, 0, 0)
	end
end
addCommandHandler("ausbrechen", knastausbruch_func)