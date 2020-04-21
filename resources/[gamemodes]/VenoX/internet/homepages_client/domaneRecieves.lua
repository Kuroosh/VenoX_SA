-------------------------
------- (c) 2010 --------
------- by Zipper -------
-- and Vio MTA:RL Crew --
-------------------------

Domanes = {}

function searsForURL ( url )

	local url = string.lower ( url )
	if Domanes[url] then
		triggerEvent ( Domanes[url], getRootElement() )
	else
		triggerEvent ( "VierNullVier", getRootElement() )
	end
end