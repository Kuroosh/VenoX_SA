function admin_telenr_andern ( player, cmd, target, amount )
	local target = findPlayerByName ( target )
	if vnxGetElementData ( player, "adminlvl" ) >= 6 then
	    if target then
		    if amount then
			    vnxSetElementData ( target, "telenr", amount )
			    outputChatBox( "Du hast die Handynummer von "..getPlayerName(target).." zu "..amount.." geaendert.", player, 0, 155, 155 )
			    outputChatBox( "Ein Admin hat deine Handynummer zu "..amount.." geaendert", target, 0, 155, 155 )
		    end
		else
		    outputChatBox( "Der Spieler ist nicht Online", player, 255, 0, 0 )
		end
	end
end

function admin_socialState_andern ( player, cmd, target, ... )
	local target = findPlayerByName ( target )
	local socialState = {...}
    socialState = table.concat( socialState, " " )
	if vnxGetElementData ( player, "adminlvl" ) >= 6 then
	    if target then
		    if socialState then
			    vnxSetElementData ( target, "socialState", socialState )
				outputChatBox( "Du hast den Status von "..getPlayerName(target).." zu "..socialState.." geaendert.", player, 0, 155, 155 )
				outputChatBox( "Ein Admin hat dir deinen Status zu "..socialState.." geaendert.", target, 0, 155, 155 )
			end
		else
		    outputChatBox( "Der Spieler ist nicht Online!", player, 255, 0, 0 )
		end
	end
end
addCommandHandler( "telenr", admin_telenr_andern )
addCommandHandler( "sstate", admin_socialState_andern )