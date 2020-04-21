--[[function cancelPedDamageBank ( attacker )
	
	if not fac then return end
	
	if not attacker then
		cancelEvent ()
	end
	
	local fac = getElementData ( attacker, "fraktion" )
	
	if fac == 2 or fac == 3 or fac == 7 or fac == 9 or fac == 12 or fac == 13 then
	else
		cancelEvent ()
	end	

end

function makeTheBankPedCool ( ped )

	addEventHandler ( "onClientPedDamage", ped, cancelPedDamageBank )

end

addEvent( "onBankPedGetsCool", true )
addEventHandler( "onBankPedGetsCool", getRootElement(), makeTheBankPedCool )--]]