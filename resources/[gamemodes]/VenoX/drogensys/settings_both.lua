-- Zigaretten:	1
-- Alkohol:		2
-- Drogen:		3

 addictRemoveCost = 250

addictLevelNames = {}

 addictLevelNames[1] = {} -- Zigaretten
  addictLevelNames[1][0] = "Nicht abhaengig"
  addictLevelNames[1][1] = "Gelegenheits Raucher"
  addictLevelNames[1][2] = "Nikotin Suechtiger"
  addictLevelNames[1][3] = "Raucher"
  addictLevelNames[1][4] = "Kettenraucher"
  addictLevelNames[1][5] = "Suechtiger"
  
 addictLevelNames[2] = {} -- Alkohol
  addictLevelNames[2][0] = "Trocken"
  addictLevelNames[2][1] = "Gelegenheits Trinker"
  addictLevelNames[2][2] = "Wochenends Trinker"
  addictLevelNames[2][3] = "Regelmaessiger Trinker"
  addictLevelNames[2][4] = "Alkoholiker"
  addictLevelNames[2][5] = "Suechtiger"
  
 addictLevelNames[3] = {} -- Drogen
  addictLevelNames[3][0] = "Clean"
  addictLevelNames[3][1] = "Einsteiger"
  addictLevelNames[3][2] = "Leicht Suechtig"
  addictLevelNames[3][3] = "Pothead"
  addictLevelNames[3][4] = "Junkie"
  addictLevelNames[3][5] = "Suechtiger"

addictLevelDivisors = {
 [1]=3,
 [2]=4,
 [3]=2
 }

function getTotalAddictLevel ( player )

	local points1 = vnxGetElementData and vnxGetElementData ( player, "cigarettAddictPoints" ) or vnxClientGetElementData ( "cigarettAddictPoints" )
	local points2 = vnxGetElementData and vnxGetElementData ( player, "alcoholAddictPoints" ) or vnxClientGetElementData ( "alcoholAddictPoints" )
	local points3 = vnxGetElementData and vnxGetElementData ( player, "drugAddictPoints" ) or vnxClientGetElementData ( "drugAddictPoints" )
	
	local addict1 = math.floor ( points1 / addictLevelDivisors[1] )
	local addict2 = math.floor ( points2 / addictLevelDivisors[2] )
	local addict3 = math.floor ( points3 / addictLevelDivisors[3] )
	
	return addict1 + addict2 + addict3
end

function getCigarettAddictLevel ( player )

	if isElement ( player ) then
		local points = vnxGetElementData and vnxGetElementData ( player, "cigarettAddictPoints" ) or vnxClientGetElementData ( "cigarettAddictPoints" )
		local addict = math.floor ( points / addictLevelDivisors[1] )
		if addict > 5 then
			addict = 5
		end
		return addictLevelNames[1][addict].."\n( Stufe "..addict.." )"
	end
end

function getAlcoholAddictLevel ( player )

	if isElement ( player ) then
		local points = vnxGetElementData and vnxGetElementData ( player, "alcoholAddictPoints" ) or vnxClientGetElementData ( "alcoholAddictPoints" )
		local addict = math.floor ( points / addictLevelDivisors[2] )
		if addict > 5 then
			addict = 5
		end
		return addictLevelNames[2][addict].."\n( Stufe "..addict.." )"
	end
end

function getDrugAddictLevel ( player )

	if isElement ( player ) then
		local points = vnxGetElementData and vnxGetElementData ( player, "drugAddictPoints" ) or vnxClientGetElementData ( "drugAddictPoints" )
		local addict = math.floor ( points / addictLevelDivisors[3] )
		if addict > 5 then
			addict = 5
		end
		return addictLevelNames[3][addict].."\n( Stufe "..addict.." )"
	end
end