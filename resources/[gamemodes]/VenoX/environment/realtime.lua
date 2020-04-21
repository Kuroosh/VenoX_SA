function realtime()

	local time = getRealTime()
	setMinuteDuration ( 60000 )
	local sekzeit = 0
	if time.second > 0 then
		setTimer ( passeZeitPerfektAn, (60*1000) - (time.second * 1000), 1 )
	else
		if time.hour+winterzeit == 24 then
			hour = 0
		else
			hour = time.hour+winterzeit
		end
		setTime ( hour, time.minute )
	end
end
addEventHandler("onResourceStart", resourceRoot, realtime )

function passeZeitPerfektAn ()
	local time = getRealTime()
	if time.hour+winterzeit == 24 then
		hour = 0
	else
		hour = time.hour+winterzeit
	end
	setTime ( hour, time.minute )
end
	