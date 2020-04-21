validGunCheatProofs = { [1]=true, [2]=true, [3]=true, [4]=true, [5]=true, [6]=true, [7]=true, [8]=true, [9]=true, [10]=true }

player = lp

function start_anticheat ()

	aCheatRun = 0
	
	setTimer ( anticheat, 10000, 0 )
end
addEventHandler ( "onClientResourceStart", resourceRoot, start_anticheat )

function anticheat ()
	if isPedDead ( lp ) then
		showChat ( false )
		if isElement ( gLabels["InfoTextForum"] ) then
			guiSetVisible ( gLabels["InfoTextForum"], false )
			guiSetVisible ( gLabels["InfoTextForumShadow"], false )
		end
		showPlayerHudComponent ( "radar", false )
	else
		if gLabels["InfoTextForum"] and not guiGetVisible ( gLabels["InfoTextForum"] ) then
			if isElement ( gLabels["InfoTextForum"] ) then
				guiSetVisible ( gLabels["InfoTextForumShadow"], true )
				guiSetVisible ( gLabels["InfoTextForum"], true )
			end
		end
	end
end


function hasPlayerLicense ( _, id )
	if cars[id] then
		if tonumber ( vnxClientGetElementData ( "carlicense" ) ) == 1 then
			return true
		else
			return false
		end
	elseif lkws[id] then
		if tonumber ( vnxClientGetElementData ( "lkwlicense" ) ) == 1 then
			return true
		else
			return false
		end
	elseif bikes[id] then
		if tonumber ( vnxClientGetElementData ( "bikelicense" ) ) == 1 then
			return true
		else
			return false
		end
	elseif helicopters[id] then
		if tonumber ( vnxClientGetElementData ( "helilicense" ) ) == 1 then
			return true
		else
			return false
		end
	elseif planea[id] then
		if tonumber ( vnxClientGetElementData ( "planelicensea" ) ) == 1 then
			return true
		else
			return false
		end
	elseif planeb[id] then
		if tonumber ( vnxClientGetElementData ( "planelicenseb" ) ) == 1 then
			return true
		else
			return false
		end
	elseif motorboats[id] then
		if tonumber ( vnxClientGetElementData ( "motorbootlicense" ) ) == 1 then
			return true
		else
			return false
		end
	elseif raftboats[id] then
		if tonumber ( vnxClientGetElementData ( "segellicense" ) ) == 1 then
			return true
		else
			return false
		end
	elseif nolicense[id] then
		return true
	else
		return true
	end
end