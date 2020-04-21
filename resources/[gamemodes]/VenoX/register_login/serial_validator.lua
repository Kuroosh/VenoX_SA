function isSerialValid ( serial )

	for i = 1, #serial do
		local sub = string.sub ( serial, i, i )
		if not ( isNumber ( sub ) or isLetter ( sub ) ) then
			return false
		end
	end
	return true
end

function isNumber ( char )

	if tonumber ( char ) then
		return true
	else
		return false
	end
end

function isLetter ( char )

	if not isNumber ( char ) then
		if not ( string.upper ( char ) == string.lower ( char ) ) then
			return true
		end
	end
	return false
end