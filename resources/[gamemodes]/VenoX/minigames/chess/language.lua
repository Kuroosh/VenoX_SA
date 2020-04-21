--[[
Available languages:
1 = English
2 = German
]]

local defaultLanguage = 2

function getText ( id )

	if not texts[defaultLanguage][id] then
		return "ERROR @ ID : "..tostring ( id )
	end
	return texts[defaultLanguage][id]
end

texts = {}
	texts[1] = {}
	texts[2] = {}
		local i
		i = 1
			texts[1][i] = "White"
			texts[2][i] = "Weiss"
		i = 2
			texts[1][i] = "Black"
			texts[2][i] = "Schwarz"
		i = 3
			texts[1][i] = "Game started!"
			texts[2][i] = "Spiel gestartet!"
		i = 4
			texts[1][i] = "White player: "
			texts[2][i] = "Weisser Spieler: "
		i = 5
			texts[1][i] = ", black player: "
			texts[2][i] = ", schwarzer Spieler: "
		i = 6
			texts[1][i] = "White's turn!"
			texts[2][i] = "Spiel gestartet!"
		i = 7
			texts[1][i] = "Game started!"
			texts[2][i] = "Spiel gestartet!"
		i = 8
			texts[1][i] = "Game started!"
			texts[2][i] = "Spiel gestartet!"
		i = 9
			texts[1][i] = "You are in check!"
			texts[2][i] = "Du stehst im Schach!"
		i = 10
			texts[1][i] = "Moves"
			texts[2][i] = "Zuege"
		i = 11
			texts[1][i] = " has resigned!"
			texts[2][i] = " hat aufgegeben!"
		i = 12
			texts[1][i] = "You loose!"
			texts[2][i] = "Du verlierst!"
		i = 13
			texts[1][i] = "You win!"
			texts[2][i] = "Du gewinnst!"
		i = 14
			texts[1][i] = " wants to play a game of chess with you! Type /accept chess to agree."
			texts[2][i] = " moechte mit dir eine Runde Schach spielen! Tippe /accept chess zum annehmen."
		i = 15
			texts[1][i] = "You offered a round of chess to "
			texts[2][i] = "Anfrage zum Schach gesendet an: "
		i = 16
			texts[1][i] = "Player not found."
			texts[2][i] = "Spieler nicht gefunden."
		i = 17
			texts[1][i] = "The person you've asked is already playing!"
			texts[2][i] = "Der Spieler ist bereits in einem Spiel."
		i = 18
			texts[1][i] = "Noone offered a game of chess to you or the player is offline."
			texts[2][i] = "Niemand hat dir eine Runde Schach angeboten oder der Spieler ist offline."
		i = 19
			texts[1][i] = "Your opponent has left the game."
			texts[2][i] = "Dein Gegner hat das Spiel verlassen."