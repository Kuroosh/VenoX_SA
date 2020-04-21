local lastsprint = 0								

function antiSprintbot ()				
	if lastsprint + 120 > getTickCount() then		
		toggleControl ( "sprint", false )			
	else
		toggleControl ( "sprint", true )				
		lastsprint = getTickCount()
	end				
end


function startstopAntiSprintbot ( bool )
    if bool then 
        bindKey ( "sprint", "down", antiSprintbot )
    else
		unbindKey ( "sprint", "down", antiSprintbot )
    end
end 
