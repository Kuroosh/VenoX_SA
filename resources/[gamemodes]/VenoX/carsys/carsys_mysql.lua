local usedCarStrings = {}
debug.sethook()
carsSpawned = false
objectYacht = {}


function pimpVeh ( veh, tuning )
	for i = 1, 17 do
		local tunepart = ( tonumber(gettok ( tuning, i, string.byte('|') )) )
		if tunepart > 0 then
			addVehicleUpgrade ( veh, tunepart )
		end
	end
	specPimpVeh ( veh )
end


function setPrivVehCorrectColor ( veh )
	local spezcolor = vnxGetElementData ( veh, "spezcolor" )
	if spezcolor and spezcolor ~= "" then
		local c1 = tonumber ( gettok ( spezcolor, 1, string.byte( '|' ) ))
		local c2 = tonumber ( gettok ( spezcolor, 2, string.byte( '|' ) ))
		local c3 = tonumber ( gettok ( spezcolor, 3, string.byte( '|' ) ))
		local c4 = tonumber ( gettok ( spezcolor, 4, string.byte( '|' ) ))
		local c5 = tonumber ( gettok ( spezcolor, 5, string.byte( '|' ) ))
		local c6 = tonumber ( gettok ( spezcolor, 6, string.byte( '|' ) ))
		setVehicleColor ( veh, c1, c2, c3, c4, c5, c6 )
		setTimer ( setVehicleColor, 100, 1, veh, c1, c2, c3, c4, c5, c6 )
	else
		local colors = vnxGetElementData ( veh, "color" )
		local c1 = tonumber ( gettok ( colors, 1, string.byte( '|' ) ))
		local c2 = tonumber ( gettok ( colors, 2, string.byte( '|' ) ))
		local c3 = tonumber ( gettok ( colors, 3, string.byte( '|' ) ))
		local c4 = tonumber ( gettok ( colors, 4, string.byte( '|' ) ))
		setVehicleColor ( veh, c1, c2, c3, c4 )
		setTimer ( setVehicleColor, 100, 1, veh, c1, c2, c3, c4 )
	end
end
	
	
function setPrivVehCorrectLightColor ( veh )
	if veh then
		local colors = vnxGetElementData ( veh, "lcolor" )
		if colors then
			local c1 = tonumber ( gettok ( colors, 1, string.byte( '|' ) ))
			local c2 = tonumber ( gettok ( colors, 2, string.byte( '|' ) ))
			local c3 = tonumber ( gettok ( colors, 3, string.byte( '|' ) ))
			setVehicleHeadLightColor ( veh, c1, c2, c3 )
		end
	end
end


function isOwnerActive ( pname )
	return true
end