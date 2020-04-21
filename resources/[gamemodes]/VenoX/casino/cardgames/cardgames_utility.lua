cardColors = {}
cardColorsShort = {}
cardColorNames = {}
cardColorOutNames = {}

CardNames = {}

cardIDTypeName = {}

handValueNames = {}

cardColors = {
 [1]="red",
 [2]="red",
 [3]="black",
 [4]="black"
}
cardColorsShort = {
 [1]="r",
 [2]="r",
 [3]="b",
 [4]="b"
}

cardColorNames = {
 [1]="karo",
 [2]="herz",
 [3]="pik",
 [4]="kreuz"
}

cardColorOutNames = {
 [1]="Karo",
 [2]="Herz",
 [3]="Pik",
 [4]="Kreuz"
}

cardIDTypeOutName = {
 [1]="2",
 [2]="3",
 [3]="4",
 [4]="5",
 [5]="6",
 [6]="7",
 [7]="8",
 [8]="9",
 [9]="10",
 [10]="Bube",
 [11]="Dame",
 [12]="Koenig",
 [13]="Ass"
}

cardIDTypeName = {
 [1]="2",
 [2]="3",
 [3]="4",
 [4]="5",
 [5]="6",
 [6]="7",
 [7]="8",
 [8]="9",
 [9]="10",
 [10]="j",
 [11]="q",
 [12]="k",
 [13]="a"
}

handValueNames = {
 [1]="Royal Flush",
 [2]="Straigt Flush",
 [3]="Vierling",
 [4]="Full House",
 [5]="Flush",
 [6]="Straight",
 [7]="Drilling",
 [8]="Doppel Paar",
 [9]="Paar",
 [10]="Highcard",
 [11]="Ausgeschieden"
}

function createCardTables ()

	for i = 1, 52 do
		local cardColor = cardColorOutNames [ getCardColor ( i ) ]
		local cardName = getCardName ( i )
		table.insert ( CardNames, i )
		CardNames[i] = cardColor.." "..cardName
	end
end

function getCardColor ( cardID )

	if cardID <= 13 then
		return 1
	elseif cardID <= 26 then 
		return 2
	elseif cardID <= 39 then
		return 3
	else
		return 4
	end
end

function getCardName ( id )

	if id then
		if id > 13 and id <= 26 then 
			id = id - 13 * 1
		elseif id > 26 and id <= 39 then
			id = id - 13 * 2
		elseif id > 39 then
			id = id - 13 * 3
		end
		return cardIDTypeOutName[id]
	end
end

function getCardType ( id )

	if id then
		if id > 13 and id <= 26 then 
			id = id - 13 * 1
		elseif id > 26 and id <= 39 then
			id = id - 13 * 2
		elseif id > 39 then
			id = id - 13 * 3
		end
		return id
	end
end

function getCardSpezType ( id )

	if id then
		if id > 13 and id <= 26 then 
			id = id - 13 * 1
		elseif id > 26 and id <= 39 then
			id = id - 13 * 2
		elseif id > 39 then
			id = id - 13 * 3
		end
		if id == 10 or id == 11 or id == 12 then
			return 2
		else
			return 1
		end
	end
end

function getFittingPicture ( id )

	if getCardType ( id ) == 10 then
		return "j"
	elseif getCardType ( id ) == 11 then
		return "q"
	elseif getCardType ( id ) == 12 then
		return "k"
	end
end

function getFittingSymbol ( card )

	return cardColorNames[getCardColor ( card )]
end

createCardTables ()