local chessPlayers = {}
local chessTimers = {}

function chess_func ( playerA, cmd, playerB )

	playerB = getPlayerFromName ( playerB )
	if vnxGetElementData ( playerA, "chess" ) then
		if isElement ( playerB ) then
			if not chessPlayers[playerB] then
				outputChatBox ( "Anfrage zum Schach gesendet an: "..getPlayerName ( playerB ), playerA, 200, 200, 0 )
				outputChatBox ( getPlayerName ( playerA ).." moechte mit dir eine Runde Schach spielen! Tippe /accept chess zum annehmen.", playerB, 200, 200, 0 )
				vnxSetElementData ( playerB, "chessOfferedBy", playerA )
			else
				outputChatBox ( "Der Spieler ist bereits in einem Spiel.", playerA, 125, 0, 0 )
			end
		else
			outputChatBox ( "Spieler nicht gefunden.", playerA, 125, 0, 0 )
		end
	else
		outputChatBox ( "Du musst dir erst ein Schachspiel im Bonusmenue kaufen!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "chess", chess_func )

function accept_chess_func ( player, cmd, string )

	if string == "chess" then
		local playerA, playerB = player, vnxGetElementData ( player, "chessOfferedBy" )
		if isElement ( playerB ) then
			startChessMatchBetweenTwoPlayers ( playerA, playerB )
		else
			outputChatBox ( "Niemand hat dir eine Runde Schach angeboten oder der Spieler ist offline.", playerA, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "accept", accept_chess_func )

function startChessMatchBetweenTwoPlayers ( playerA, playerB )

	if isElement ( playerA ) and isElement ( playerB ) then
		if not chessPlayers[playerA] and not chessPlayers[playerB] then
			setElementClicked ( playerA, true )
			setElementClicked ( playerB, true )
			chessPlayers[playerA] = playerB
			chessPlayers[playerB] = playerA
			addEventHandler ( "onPlayerQuit" ,playerA, chessPlayerLeafe )
			addEventHandler ( "onPlayerWasted", playerA, chessPlayerLeafe )
			addEventHandler ( "onPlayerQuit", playerB, chessPlayerLeafe )
			addEventHandler ( "onPlayerWasted", playerB, chessPlayerLeafe )
			
			triggerClientEvent ( playerA, "startNewChessParty", playerA, 1 )
			triggerClientEvent ( playerB, "startNewChessParty", playerB, 2 )
			
			setPlayerStartDraw ( playerA )
			
			outputChatBox ( "Spiel gestartet!", playerA, 0, 125, 0 )
			outputChatBox ( "Spiel gestartet!", playerB, 0, 125, 0 )
			
			outputChatBox ( "Weisser Spieler: ".." "..getPlayerName ( playerA )..", schwarzer Spieler: "..getPlayerName ( playerB ), playerA, 0, 200, 200 )
			outputChatBox ( "Weisser Spieler: ".." "..getPlayerName ( playerA )..", schwarzer Spieler: "..getPlayerName ( playerB ), playerB, 0, 200, 200 )
		end
	end
end

function chessPlayerLeafe ()

	local player = source
	if isElement ( chessPlayers[player] ) then
		setElementClicked ( player, false )
		outputChatBox ( "Dein Gegner hat das Spiel verlassen / ist gestorben.", chessPlayers[player], 200, 200, 0 )
		resign_func ( true, chessPlayers[player] )
	end
end


function setPlayerStartDraw ( player )

	vnxSetElementData ( player, "chessPlayer", true )
	triggerClientEvent ( player, "startChessDraw", player )
end

function endDraw_func ( x1, y1, x2, y2, special )

	if special == "won" then
		setTimer ( resign_func, 3000, 1, true, client )
		outputChatBox ( "Du gewinnst!", client, 0, 125, 0 )
		outputChatBox ( "Du hast verloren.", chessPlayers[client], 0, 125, 0 )
	else
		if vnxGetElementData ( client, "chessPlayer" ) then
			local player = chessPlayers[client]
			vnxSetElementData ( client, "chessPlayer", false )
			triggerClientEvent ( player, "changeFigurePosition", player, x1, y1, x2, y2, special )
			setPlayerStartDraw ( player )
		end
	end
end
addEvent ( "endDraw", true )
addEventHandler ( "endDraw", getRootElement(), endDraw_func )

function resign_func ( dontShowText, player )
	local pname
	if dontShowText then
		pname = getPlayerName ( player )
		playerA = player
		playerB = chessPlayers[player]
	else
		pname = getPlayerName ( client )
		playerA = client
		playerB = chessPlayers[client]
	end
	if not dontShowText then
		outputChatBox ( pname.." hat aufgegeben!", playerA, 0, 125, 0 )
		outputChatBox ( "Du verlierst!", playerA, 125, 0, 0 )
		if isElement ( playerB ) then
			outputChatBox ( pname.." hat aufgegeben!", playerB, 0, 125, 0 )
			outputChatBox ( "Du gewinnst!", playerB, 0, 125, 0 )
		end
	end
	
	triggerClientEvent ( playerA, "endGame", getRootElement() )
	setElementClicked ( playerA, false )
	if isElement ( playerB ) then
		setElementClicked ( playerB, false )
		triggerClientEvent ( playerB, "endGame", getRootElement() )
	end
	
	chessPlayers[playerA] = nil
	chessPlayers[playerB] = nil
	removeEventHandler ( "onPlayerQuit" ,playerA, chessPlayerLeafe )
	removeEventHandler ( "onPlayerWasted", playerA, chessPlayerLeafe )
	removeEventHandler ( "onPlayerQuit", playerB, chessPlayerLeafe )
	removeEventHandler ( "onPlayerWasted", playerB, chessPlayerLeafe )
end
addEvent ( "resign", true )
addEventHandler ( "resign", getRootElement(), resign_func )