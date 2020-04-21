function createNewStatementEntry_func ( name, value, text )

	if value > 0 then
		value = "+ "..value.." $"
	elseif value < 0 then
		value = "- "..math.abs ( value ).." $"
	else
		value = "0 $"
	end
	value = value.."\n"
	
	local kind, amount, reason
	local file = getStatementFile ()
	local ckind, camount, creason
	local childrens = xmlNodeGetChildren ( file )
	local childrensI = {}
	local nodesI = {}
	for i, node in ipairs ( childrens ) do
		childrensI[i] = xmlNodeGetValue ( node )
		nodesI[i] = node
	end
	kind, amount, reason = childrensI[1], childrensI[2], childrensI[3]
	ckind = name.."\n\n"..kind
	camount = value.."\n\n"..amount
	creason = text.."\n\n"..reason
	xmlNodeSetValue ( nodesI[1], ckind )
	xmlNodeSetValue ( nodesI[2], camount )
	xmlNodeSetValue ( nodesI[3], creason )
	xmlSaveFile ( file )
end
addEvent ( "createNewStatementEntry", true )
addEventHandler ( "createNewStatementEntry", getRootElement(), createNewStatementEntry_func )

-- 1 = Newest
function getStatementEntry ( number )

	local file = getStatementFile ()
	local childrens = xmlNodeGetChildren ( file )
	local childrensI = {}
	local nodesI = {}
	for i, node in ipairs ( childrens ) do
		childrensI[i] = xmlNodeGetValue ( node )
		nodesI[i] = node
	end
	return childrensI[1], childrensI[2], childrensI[3]
end

function getStatementFile ()

	local file = xmlLoadFile ( "money/money.xml" )
	if not file then
		file = xmlCreateFile ( "money/money.xml", "Account" )
		xmlSaveFile ( file )
		file = xmlLoadFile ( "money/money.xml" )
		
		kind = xmlCreateChild ( file, "kind" )
		xmlNodeSetValue ( kind, "" )
		amount = xmlCreateChild ( file, "amount" )
		xmlNodeSetValue ( amount, "" )
		reason = xmlCreateChild ( file, "reason" )
		xmlNodeSetValue ( reason, "" )
		
		xmlSaveFile ( file )
		file = xmlLoadFile ( "money/money.xml" )
	end
	return file
end