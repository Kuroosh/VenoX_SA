local playerblip = {}
local playerbliptimer = {}
local antispam = {}

addCommandHandler ( "needhelp", function ( player )
	if ( antispam[player] or 0 ) + 2000 <= getTickCount() then
		if isOnDuty ( player ) then
			if isElement ( playerblip[player] ) then
				destroyElement ( playerblip[player] )
                killTimer ( playerbliptimer[player] )
			end
			playerblip[player] = createBlipAttachedTo ( player, 0, 2, 255, 0, 0, 255, 0, 65535, player )
			playerbliptimer[player] = setTimer ( destroyElement, 4*60000, 1, playerblip[player] )
            local playername = getPlayerName ( player )
            if getElementData(player, "needhelp_status") == false then
                for thePlayer, _ in pairs ( fraktionMembers[1] ) do
                    setElementVisibleTo ( playerblip[player], thePlayer, true )
                    outputChatBox ( playername.." fordert Unterstützung. Der Standort wird für 4 Minuten markiert.", thePlayer, 0, 150, 200 )
                    setElementData(player, "needhelp_status", true)
                end
                for thePlayer, _ in pairs ( fraktionMembers[6] ) do
                    setElementVisibleTo ( playerblip[player], thePlayer, true )
                    outputChatBox ( playername.." fordert Unterstützung. Der Standort wird für 4 Minuten markiert.", thePlayer, 0, 150, 200 )
                    setElementData(player, "needhelp_status", true)
                end
                for thePlayer, _ in pairs ( fraktionMembers[8] ) do
                    setElementVisibleTo ( playerblip[player], thePlayer, true )
                    outputChatBox ( playername.." fordert Unterstützung. Der Standort wird für 4 Minuten markiert.", thePlayer, 0, 150, 200 )
                    setElementData(player, "needhelp_status", true)
                end
            else
                destroyElement ( playerblip[player] )
				killTimer ( playerbliptimer[player] )
                for thePlayer, _ in pairs ( fraktionMembers[1] ) do
                    setElementData(player, "needhelp_status", false)
                    outputChatBox ( playername.." braucht keine Hilfe mehr.", thePlayer, 0, 125, 0 )
                end
                for thePlayer, _ in pairs ( fraktionMembers[6] ) do
                    setElementData(player, "needhelp_status", false)
                    outputChatBox ( playername.." braucht keine Hilfe mehr.", thePlayer, 0, 125, 0 )
                end
                for thePlayer, _ in pairs ( fraktionMembers[8] ) do
                    setElementData(player, "needhelp_status", false)
                    outputChatBox ( playername.." braucht keine Hilfe mehr.", thePlayer, 0, 125, 0 )
                end
            end
		end
	end
end )